uint64_t dispatch thunk of SyncEngineRetryTimer.start(queue:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of SyncEngineRetryTimer.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SyncEngineRetryTimer.reset()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SyncEngineDataSource.syncEngine(_:dataFor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SyncEngineDataSource.syncEngine(_:didFetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SyncEngineDataSource.syncEngine(_:didDelete:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of SyncEngineDataSource.recordIDs(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SyncEngineDataSource.syncEngine(_:resolveConflictBetween:and:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of SyncEngineDataSource.purgeRecords(for:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.localDeviceIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.pairedDevice.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.addRecordIDs(toSave:toDelete:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.set(dataSource:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.set(syncEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.validate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.sync()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SyncEngineSynchronizing.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1ED78E8F8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1ED78E8F8);
  }
}

BOOL sub_1C127BD10(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_1C127BD24(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

unint64_t sub_1C127BD30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  unint64_t result;

  v1 = v0[2];
  v2 = v0[4];
  v3 = __OFSUB__(v1, v2);
  v4 = v1 - v2;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v5 = v0[3];
    v6 = v4 > 0x40;
    if (v4 >= 0x40)
      v7 = 0;
    else
      v7 = 1 << v4;
    if (v6)
      v7 = 0;
    if (is_mul_ok(v5, v7))
      return v5 * v7;
  }
  __break(1u);
  return result;
}

uint64_t ExponentialBackoffRetryTimer.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  v0 = swift_allocObject();
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C12B5E70;
  *(_OWORD *)(v0 + 32) = xmmword_1C12B5E80;
  return v0;
}

uint64_t ExponentialBackoffRetryTimer.init()()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  *(_QWORD *)(v0 + 40) = 0;
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C12B5E70;
  *(_QWORD *)(v0 + 32) = 3;
  return v0;
}

_QWORD *ExponentialBackoffRetryTimer.__allocating_init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;

  v4 = (_QWORD *)swift_allocObject();
  v4[5] = 0;
  type metadata accessor for UnfairLock();
  v5 = swift_allocObject();
  v6 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v6;
  *v6 = 0;
  v4[6] = v5;
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a1;
  return v4;
}

_QWORD *ExponentialBackoffRetryTimer.init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  _DWORD *v6;

  v2[5] = 0;
  type metadata accessor for UnfairLock();
  v5 = swift_allocObject();
  v6 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v6;
  *v6 = 0;
  v2[6] = v5;
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = a1;
  return v2;
}

uint64_t ExponentialBackoffRetryTimer.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t ExponentialBackoffRetryTimer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ExponentialBackoffRetryTimer()
{
  return objc_opt_self();
}

uint64_t dispatch thunk of MetadataStoring.unknownRecordIDs(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MetadataStoring.recordIDs(minus:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MetadataStoring.modifiedRecordIDs(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of MetadataStoring.deletedRecordIDs(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of MetadataStoring.set(lastModifiedDate:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of MetadataStoring.set(deletedDate:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of MetadataStoring.set(syncDate:for:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 56))();
}

uint64_t dispatch thunk of MetadataStoring.set(syncDate:forRecordsMatching:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of MetadataStoring.recordMetadata(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of MetadataStoring.purge()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of MetadataStoring.update(metadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of MetadataStoring.hasMetadata(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of MetadataStoring.garbageCollect()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of MetadataStoring.isValid(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of MetadataStoring.remove(pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of MetadataStoring.forget(recordID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 128))();
}

uint64_t dispatch thunk of MetadataStoring.hasPerformedInitialSync(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 136))();
}

uint64_t dispatch thunk of MetadataStoring.setPerformedInitialSync(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 144))();
}

uint64_t PairedDevice.PairedDeviceClass.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1C127C060 + 4 * byte_1C12B5F20[*v0]))(0x64696C61766E69, 0xE700000000000000);
}

uint64_t sub_1C127C060()
{
  return 0x656E6F6870;
}

uint64_t sub_1C127C074()
{
  return 6513005;
}

uint64_t sub_1C127C084()
{
  return 0x6863746177;
}

BOOL static PairedDevice.PairedDeviceClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PairedDevice.PairedDeviceClass.hash(into:)()
{
  return sub_1C12B57EC();
}

uint64_t PairedDevice.PairedDeviceClass.hashValue.getter()
{
  sub_1C12B57E0();
  sub_1C12B57EC();
  return sub_1C12B5804();
}

BOOL sub_1C127C118(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C127C12C()
{
  sub_1C12B57E0();
  sub_1C12B57EC();
  return sub_1C12B5804();
}

uint64_t sub_1C127C170()
{
  return sub_1C12B57EC();
}

uint64_t sub_1C127C198()
{
  sub_1C12B57E0();
  sub_1C12B57EC();
  return sub_1C12B5804();
}

uint64_t sub_1C127C1D8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1C127C208 + 4 * byte_1C12B5F24[*v0]))(0x64696C61766E69, 0xE700000000000000);
}

uint64_t sub_1C127C208()
{
  return 0x656E6F6870;
}

uint64_t sub_1C127C21C()
{
  return 6513005;
}

uint64_t sub_1C127C22C()
{
  return 0x6863746177;
}

uint64_t PairedDevice.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void PairedDevice.deviceClass.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

void PairedDevice.protocolVersion.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 17);
}

SessionSyncEngine::PairedDevice __swiftcall PairedDevice.init(identifier:deviceClass:protocolVersion:)(Swift::String identifier, SessionSyncEngine::PairedDevice::PairedDeviceClass deviceClass, SessionSyncEngine::SyncProtocolVersion protocolVersion)
{
  uint64_t v3;
  char v4;
  char v5;
  SessionSyncEngine::PairedDevice result;

  v4 = *(_BYTE *)deviceClass;
  v5 = *(_BYTE *)protocolVersion;
  *(Swift::String *)v3 = identifier;
  *(_BYTE *)(v3 + 16) = v4;
  *(_BYTE *)(v3 + 17) = v5;
  result.identifier = identifier;
  result.deviceClass = deviceClass;
  return result;
}

uint64_t PairedDevice.description.getter()
{
  sub_1C12B5660();
  sub_1C12B54BC();
  swift_bridgeObjectRetain();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  sub_1C12B54BC();
  swift_bridgeObjectRetain();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  sub_1C12B54BC();
  sub_1C12B56A8();
  return 0;
}

uint64_t _s17SessionSyncEngine12PairedDeviceV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  char v7;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a1 + 17);
  v4 = *(unsigned __int8 *)(a2 + 16);
  v5 = *(unsigned __int8 *)(a2 + 17);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    if (v2 != v4)
      return 0;
    return v3 ^ v5 ^ 1u;
  }
  v7 = sub_1C12B578C();
  result = 0;
  if ((v7 & 1) != 0 && v2 == v4)
    return v3 ^ v5 ^ 1u;
  return result;
}

unint64_t sub_1C127C458()
{
  unint64_t result;

  result = qword_1EF6D3EE0;
  if (!qword_1EF6D3EE0)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for PairedDevice.PairedDeviceClass, &type metadata for PairedDevice.PairedDeviceClass);
    atomic_store(result, (unint64_t *)&qword_1EF6D3EE0);
  }
  return result;
}

uint64_t destroy for PairedDevice()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s17SessionSyncEngine12PairedDeviceVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PairedDevice(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PairedDevice(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for PairedDevice(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 18))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairedDevice(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 18) = 1;
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
    *(_BYTE *)(result + 18) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PairedDevice()
{
  return &type metadata for PairedDevice;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PairedDevice.PairedDeviceClass(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PairedDevice.PairedDeviceClass(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C127C71C + 4 * byte_1C12B5F2D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1C127C750 + 4 * byte_1C12B5F28[v4]))();
}

uint64_t sub_1C127C750(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C127C758(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C127C760);
  return result;
}

uint64_t sub_1C127C76C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C127C774);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1C127C778(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C127C780(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C127C78C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C127C798(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PairedDevice.PairedDeviceClass()
{
  return &type metadata for PairedDevice.PairedDeviceClass;
}

uint64_t Message.init(messageType:version:encodedBody:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_BYTE *)a6 = *a3;
  *(_QWORD *)(a6 + 8) = result;
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_1C127C7C4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x546567617373656DLL;
  if (*v0 != 1)
    v1 = 0x426465646F636E65;
  if (*v0)
    return v1;
  else
    return 0x6E6F6973726576;
}

uint64_t sub_1C127C830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C127D344(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C127C854()
{
  return 0;
}

void sub_1C127C860(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1C127C86C()
{
  sub_1C127CAA8();
  return sub_1C12B5828();
}

uint64_t sub_1C127C894()
{
  sub_1C127CAA8();
  return sub_1C12B5834();
}

uint64_t Message.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D3EE8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v16 = *((_QWORD *)v1 + 2);
  v17 = v9;
  v10 = *((_QWORD *)v1 + 3);
  v14 = *((_QWORD *)v1 + 4);
  v15 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C127CAA8();
  sub_1C12B581C();
  LOBYTE(v18) = v8;
  v20 = 0;
  sub_1C127CAEC();
  sub_1C12B5774();
  if (!v2)
  {
    v12 = v14;
    v11 = v15;
    LOBYTE(v18) = 1;
    sub_1C12B575C();
    v18 = v11;
    v19 = v12;
    v20 = 2;
    sub_1C127CB30();
    sub_1C12B5774();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BA97BC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C127CAA8()
{
  unint64_t result;

  result = qword_1EF6D3EF0;
  if (!qword_1EF6D3EF0)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B61C0, &type metadata for Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D3EF0);
  }
  return result;
}

unint64_t sub_1C127CAEC()
{
  unint64_t result;

  result = qword_1EF6D3EF8;
  if (!qword_1EF6D3EF8)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncProtocolVersion, &type metadata for SyncProtocolVersion);
    atomic_store(result, (unint64_t *)&qword_1EF6D3EF8);
  }
  return result;
}

unint64_t sub_1C127CB30()
{
  unint64_t result;

  result = qword_1EF6D3F00;
  if (!qword_1EF6D3F00)
  {
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F00);
  }
  return result;
}

uint64_t Message.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D3F08);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C127CAA8();
  sub_1C12B5810();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v21 = 0;
  sub_1C127CDC0();
  sub_1C12B5738();
  v9 = v18;
  LOBYTE(v18) = 1;
  v10 = sub_1C12B5720();
  v12 = v11;
  v17 = v10;
  v20 = v9;
  v21 = 2;
  sub_1C127CE04();
  swift_bridgeObjectRetain();
  sub_1C12B5738();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = v18;
  v14 = v19;
  swift_bridgeObjectRetain();
  sub_1C127CE48(v13, v14);
  swift_bridgeObjectRelease();
  *(_BYTE *)a2 = v20;
  *(_QWORD *)(a2 + 8) = v17;
  *(_QWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 24) = v13;
  *(_QWORD *)(a2 + 32) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return sub_1C127CE8C(v13, v14);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_1C127CDC0()
{
  unint64_t result;

  result = qword_1EF6D3F10;
  if (!qword_1EF6D3F10)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncProtocolVersion, &type metadata for SyncProtocolVersion);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F10);
  }
  return result;
}

unint64_t sub_1C127CE04()
{
  unint64_t result;

  result = qword_1EF6D3F18;
  if (!qword_1EF6D3F18)
  {
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F18);
  }
  return result;
}

uint64_t sub_1C127CE48(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C127CE8C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C127CED0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Message.init(from:)(a1, a2);
}

uint64_t sub_1C127CEE4(_QWORD *a1)
{
  return Message.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for Message(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Message(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_1C127CE8C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for Message(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_1C127CE48(v4, v5);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithCopy for Message(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  sub_1C127CE48(v5, v4);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v4;
  sub_1C127CE8C(v6, v7);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Message(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  sub_1C127CE8C(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Message(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Message(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Message()
{
  return &type metadata for Message;
}

uint64_t getEnumTagSinglePayload for Message.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Message.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C127D1EC + 4 * byte_1C12B6085[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C127D220 + 4 * byte_1C12B6080[v4]))();
}

uint64_t sub_1C127D220(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C127D228(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C127D230);
  return result;
}

uint64_t sub_1C127D23C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C127D244);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C127D248(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C127D250(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Message.CodingKeys()
{
  return &type metadata for Message.CodingKeys;
}

unint64_t sub_1C127D270()
{
  unint64_t result;

  result = qword_1EF6D3F20;
  if (!qword_1EF6D3F20)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6198, &type metadata for Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F20);
  }
  return result;
}

unint64_t sub_1C127D2B8()
{
  unint64_t result;

  result = qword_1EF6D3F28;
  if (!qword_1EF6D3F28)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6108, &type metadata for Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F28);
  }
  return result;
}

unint64_t sub_1C127D300()
{
  unint64_t result;

  result = qword_1EF6D3F30;
  if (!qword_1EF6D3F30)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6130, &type metadata for Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F30);
  }
  return result;
}

uint64_t sub_1C127D344(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x426465646F636E65 && a2 == 0xEB0000000079646FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1C12B578C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t static Keybag.shared.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  if (qword_1ED78E6E0 != -1)
    swift_once();
  v2 = qword_1ED78DC38;
  a1[3] = _s9IOSKeybagCMa();
  a1[4] = (uint64_t)&off_1E7A7EDC8;
  *a1 = v2;
  return swift_retain();
}

void sub_1C127D530()
{
  uint64_t v0;

  _s9IOSKeybagCMa();
  swift_allocObject();
  sub_1C1296830();
  qword_1ED78DC38 = v0;
}

ValueMetadata *type metadata accessor for Keybag()
{
  return &type metadata for Keybag;
}

uint64_t RecordID.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RecordID.zone.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RecordID.description.getter()
{
  _QWORD v1[2];

  sub_1C12B5660();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "identifier: ");
  swift_bridgeObjectRetain();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  sub_1C12B54BC();
  swift_bridgeObjectRetain();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  return v1[0];
}

SessionSyncEngine::RecordID __swiftcall RecordID.init(identifier:zone:)(Swift::String identifier, Swift::String zone)
{
  Swift::String *v2;
  SessionSyncEngine::RecordID result;

  *v2 = identifier;
  v2[1] = zone;
  result.zone = zone;
  result.identifier = identifier;
  return result;
}

uint64_t RecordID.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C127D730()
{
  _BYTE *v0;

  if (*v0)
    return 1701736314;
  else
    return 0x696669746E656469;
}

uint64_t sub_1C127D768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C128068C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C127D78C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1C127D798()
{
  sub_1C127F1D4();
  return sub_1C12B5828();
}

uint64_t sub_1C127D7C0()
{
  sub_1C127F1D4();
  return sub_1C12B5834();
}

uint64_t RecordID.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D3F38);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v9[1] = *(_QWORD *)(v1 + 24);
  v9[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C127F1D4();
  sub_1C12B581C();
  v12 = 0;
  sub_1C12B575C();
  if (!v2)
  {
    v11 = 1;
    sub_1C12B575C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t RecordID.hashValue.getter()
{
  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  return sub_1C12B5804();
}

uint64_t RecordID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v18;
  char v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D3F48);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C127F1D4();
  sub_1C12B5810();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = 0;
  v9 = sub_1C12B5720();
  v11 = v10;
  v19 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_1C12B5720();
  v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16 = v12;
  v15(v8, v5);
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v16;
  a2[3] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C127DB40@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return RecordID.init(from:)(a1, a2);
}

uint64_t sub_1C127DB54(_QWORD *a1)
{
  return RecordID.encode(to:)(a1);
}

uint64_t sub_1C127DB68()
{
  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  return sub_1C12B5804();
}

uint64_t sub_1C127DBEC()
{
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C127DC5C()
{
  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  return sub_1C12B5804();
}

uint64_t RecordMetadata.recordID.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t RecordMetadata.lastModified.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for RecordMetadata(0) + 20);
  v4 = sub_1C12B5324();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t RecordMetadata.isDeleted.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for RecordMetadata(0) + 24));
}

uint64_t RecordMetadata.description.getter()
{
  sub_1C12B5660();
  sub_1C12B54BC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C12B5660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  sub_1C12B54BC();
  swift_bridgeObjectRetain();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C12B54BC();
  type metadata accessor for RecordMetadata(0);
  sub_1C12B5324();
  sub_1C127F22C((unint64_t *)&qword_1ED78DBF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
  sub_1C12B5780();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  sub_1C12B54BC();
  sub_1C12B52AC();
  sub_1C12B5504();
  sub_1C12B54BC();
  sub_1C12B54BC();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t RecordMetadata.init(recordID:lastModified:isDeleted:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_QWORD *)(a4 + 16) = v7;
  *(_QWORD *)(a4 + 24) = v8;
  v9 = type metadata accessor for RecordMetadata(0);
  v10 = a4 + *(int *)(v9 + 20);
  v11 = sub_1C12B5324();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a2, v11);
  *(_BYTE *)(a4 + *(int *)(v9 + 24)) = a3;
  return result;
}

uint64_t RecordMetadata.hash(into:)()
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  type metadata accessor for RecordMetadata(0);
  sub_1C12B5324();
  sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1C12B5468();
  return sub_1C12B57F8();
}

uint64_t sub_1C127E15C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x69646F4D7473616CLL;
  if (*v0 != 1)
    v1 = 0x6574656C65447369;
  if (*v0)
    return v1;
  else
    return 0x444964726F636572;
}

uint64_t sub_1C127E1C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1280778(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C127E1E8()
{
  sub_1C127F26C();
  return sub_1C12B5828();
}

uint64_t sub_1C127E210()
{
  sub_1C127F26C();
  return sub_1C12B5834();
}

uint64_t RecordMetadata.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  __int128 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D3F58);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C127F26C();
  sub_1C12B581C();
  v9 = *((_QWORD *)v3 + 2);
  v10 = *((_QWORD *)v3 + 3);
  v13 = *v3;
  v14 = v9;
  v15 = v10;
  v12[15] = 0;
  sub_1C127F2B0();
  sub_1C12B5774();
  if (!v2)
  {
    type metadata accessor for RecordMetadata(0);
    LOBYTE(v13) = 1;
    sub_1C12B5324();
    sub_1C127F22C(&qword_1EF6D3F70, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
    sub_1C12B5774();
    LOBYTE(v13) = 2;
    sub_1C12B5768();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t RecordMetadata.hashValue.getter()
{
  sub_1C12B57E0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  type metadata accessor for RecordMetadata(0);
  sub_1C12B5324();
  sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1C12B5468();
  sub_1C12B57F8();
  return sub_1C12B5804();
}

uint64_t RecordMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v23 = a2;
  v24 = sub_1C12B5324();
  v3 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D3F78);
  v6 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RecordMetadata(0);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v27 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1C127F26C();
  v26 = v8;
  v13 = v28;
  sub_1C12B5810();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  v28 = v6;
  v14 = (uint64_t)v11;
  v22 = v3;
  v15 = v24;
  v32 = 0;
  sub_1C127F2F4();
  v16 = v25;
  sub_1C12B5738();
  v17 = v30;
  v18 = v31;
  *(_OWORD *)v14 = v29;
  *(_QWORD *)(v14 + 16) = v17;
  *(_QWORD *)(v14 + 24) = v18;
  LOBYTE(v29) = 1;
  sub_1C127F22C(&qword_1EF6D3F88, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  sub_1C12B5738();
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v14 + *(int *)(v9 + 20), v5, v15);
  LOBYTE(v29) = 2;
  v19 = sub_1C12B572C();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v26, v16);
  *(_BYTE *)(v14 + *(int *)(v9 + 24)) = v19 & 1;
  sub_1C127F408(v14, v23, type metadata accessor for RecordMetadata);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return sub_1C127F44C(v14, type metadata accessor for RecordMetadata);
}

uint64_t sub_1C127E7FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return RecordMetadata.init(from:)(a1, a2);
}

uint64_t sub_1C127E810(_QWORD *a1)
{
  return RecordMetadata.encode(to:)(a1);
}

uint64_t sub_1C127E82C()
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_1C12B5324();
  sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1C12B5468();
  return sub_1C12B57F8();
}

uint64_t sub_1C127E91C()
{
  sub_1C12B57E0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_1C12B5324();
  sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1C12B5468();
  sub_1C12B57F8();
  return sub_1C12B5804();
}

uint64_t Record.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1C127F408(v1, a1, type metadata accessor for RecordMetadata);
}

uint64_t Record.data.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for Record(0) + 20);
  v2 = *(_QWORD *)v1;
  sub_1C127CE48(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t Record.init(metadata:data:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  _QWORD *v8;

  sub_1C127F380(a1, a4);
  result = type metadata accessor for Record(0);
  v8 = (_QWORD *)(a4 + *(int *)(result + 20));
  *v8 = a2;
  v8[1] = a3;
  return result;
}

BOOL sub_1C127EACC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1C127EAE4()
{
  _BYTE *v0;

  if (*v0)
    return 1635017060;
  else
    return 0x617461646174656DLL;
}

uint64_t sub_1C127EB18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C12808F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C127EB3C()
{
  sub_1C127F3C4();
  return sub_1C12B5828();
}

uint64_t sub_1C127EB64()
{
  sub_1C127F3C4();
  return sub_1C12B5834();
}

uint64_t Record.encode(to:)(_QWORD *a1)
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
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D3F90);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C127F3C4();
  sub_1C12B581C();
  LOBYTE(v11) = 0;
  type metadata accessor for RecordMetadata(0);
  sub_1C127F22C(&qword_1EF6D3FA0, type metadata accessor for RecordMetadata, (uint64_t)&protocol conformance descriptor for RecordMetadata);
  sub_1C12B5774();
  if (!v2)
  {
    v11 = *(_OWORD *)(v3 + *(int *)(type metadata accessor for Record(0) + 20));
    v10[15] = 1;
    sub_1C127CB30();
    sub_1C12B5774();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t Record.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  __int128 v22;
  char v23;

  v18 = a2;
  v19 = type metadata accessor for RecordMetadata(0);
  MEMORY[0x1E0C80A78]();
  v20 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D3FA8);
  v5 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Record(0);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C127F3C4();
  sub_1C12B5810();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = v8;
  v11 = (uint64_t)v10;
  LOBYTE(v22) = 0;
  sub_1C127F22C(&qword_1EF6D3FB0, type metadata accessor for RecordMetadata, (uint64_t)&protocol conformance descriptor for RecordMetadata);
  v12 = (uint64_t)v20;
  v13 = v21;
  sub_1C12B5738();
  sub_1C127F380(v12, v11);
  v23 = 1;
  sub_1C127CE04();
  sub_1C12B5738();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v13);
  v14 = v18;
  *(_OWORD *)(v11 + *(int *)(v17 + 20)) = v22;
  sub_1C127F408(v11, v14, type metadata accessor for Record);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1C127F44C(v11, type metadata accessor for Record);
}

uint64_t sub_1C127EF58@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Record.init(from:)(a1, a2);
}

uint64_t sub_1C127EF6C(_QWORD *a1)
{
  return Record.encode(to:)(a1);
}

uint64_t _s17SessionSyncEngine14RecordMetadataV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  char v10;
  BOOL v11;
  char v12;
  uint64_t v13;

  v4 = a1[2];
  v5 = a1[3];
  v6 = a2[2];
  v7 = a2[3];
  v8 = *a1 == *a2 && a1[1] == a2[1];
  if (v8 || (v9 = sub_1C12B578C(), v10 = 0, (v9 & 1) != 0))
  {
    v11 = v4 == v6 && v5 == v7;
    if (v11 || (v12 = sub_1C12B578C(), v10 = 0, (v12 & 1) != 0))
    {
      v13 = type metadata accessor for RecordMetadata(0);
      if ((sub_1C12B5300() & 1) != 0)
        v10 = *((_BYTE *)a1 + *(int *)(v13 + 24)) ^ *((_BYTE *)a2 + *(int *)(v13 + 24)) ^ 1;
      else
        v10 = 0;
    }
  }
  return v10 & 1;
}

void _s17SessionSyncEngine6RecordV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1[2];
  v5 = a1[3];
  v6 = a2[2];
  v7 = a2[3];
  v8 = *a1 == *a2 && a1[1] == a2[1];
  if (v8 || (sub_1C12B578C() & 1) != 0)
  {
    v9 = v4 == v6 && v5 == v7;
    if (v9 || (sub_1C12B578C() & 1) != 0)
    {
      v10 = type metadata accessor for RecordMetadata(0);
      if ((sub_1C12B5300() & 1) != 0
        && *((unsigned __int8 *)a1 + *(int *)(v10 + 24)) == *((unsigned __int8 *)a2 + *(int *)(v10 + 24)))
      {
        v11 = *(int *)(type metadata accessor for Record(0) + 20);
        sub_1C12B1B98(*(_QWORD *)((char *)a1 + v11), *(_QWORD *)((char *)a1 + v11 + 8));
      }
    }
  }
}

uint64_t _s17SessionSyncEngine8RecordIDV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_1C12B578C(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
      return 1;
    else
      return sub_1C12B578C();
  }
  return result;
}

unint64_t sub_1C127F1D4()
{
  unint64_t result;

  result = qword_1EF6D3F40;
  if (!qword_1EF6D3F40)
  {
    result = MEMORY[0x1C3BA97D4]("Uz|&8,", &type metadata for RecordID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F40);
  }
  return result;
}

uint64_t type metadata accessor for RecordMetadata(uint64_t a1)
{
  return sub_1C127F34C(a1, qword_1ED78E3B0);
}

uint64_t sub_1C127F22C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3BA97D4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C127F26C()
{
  unint64_t result;

  result = qword_1EF6D3F60;
  if (!qword_1EF6D3F60)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B67B4, &type metadata for RecordMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F60);
  }
  return result;
}

unint64_t sub_1C127F2B0()
{
  unint64_t result;

  result = qword_1EF6D3F68;
  if (!qword_1EF6D3F68)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for RecordID, &type metadata for RecordID);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F68);
  }
  return result;
}

unint64_t sub_1C127F2F4()
{
  unint64_t result;

  result = qword_1EF6D3F80;
  if (!qword_1EF6D3F80)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for RecordID, &type metadata for RecordID);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F80);
  }
  return result;
}

uint64_t type metadata accessor for Record(uint64_t a1)
{
  return sub_1C127F34C(a1, qword_1EF6D4018);
}

uint64_t sub_1C127F34C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C127F380(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C127F3C4()
{
  unint64_t result;

  result = qword_1EF6D3F98;
  if (!qword_1EF6D3F98)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6764, &type metadata for Record.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D3F98);
  }
  return result;
}

uint64_t sub_1C127F408(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C127F44C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1C127F48C()
{
  unint64_t result;

  result = qword_1ED78E808;
  if (!qword_1ED78E808)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for RecordID, &type metadata for RecordID);
    atomic_store(result, (unint64_t *)&qword_1ED78E808);
  }
  return result;
}

uint64_t sub_1C127F4D0()
{
  return sub_1C127F22C(&qword_1EF6D3FB8, type metadata accessor for RecordMetadata, (uint64_t)&protocol conformance descriptor for RecordMetadata);
}

uint64_t destroy for RecordID()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RecordID(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for RecordID(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for RecordID(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for RecordID(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RecordID(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RecordID()
{
  return &type metadata for RecordID;
}

_QWORD *initializeBufferWithCopyOfBuffer for RecordMetadata(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_1C12B5324();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t destroy for RecordMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1C12B5324();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for RecordMetadata(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_1C12B5324();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithCopy for RecordMetadata(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1C12B5324();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *initializeWithTake for RecordMetadata(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1C12B5324();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for RecordMetadata(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_1C12B5324();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for RecordMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C127FA3C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_1C12B5324();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for RecordMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C127FAC4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_1C12B5324();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1C127FB38()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C12B5324();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for Record(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = type metadata accessor for RecordMetadata(0);
    v10 = *(int *)(v9 + 20);
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_1C12B5324();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    *((_BYTE *)v4 + *(int *)(v9 + 24)) = *((_BYTE *)a2 + *(int *)(v9 + 24));
    v15 = *(int *)(a3 + 20);
    v16 = (_QWORD *)((char *)v4 + v15);
    v17 = (_QWORD *)((char *)a2 + v15);
    v18 = *v17;
    v19 = v17[1];
    sub_1C127CE48(*v17, v19);
    *v16 = v18;
    v16[1] = v19;
  }
  return v4;
}

uint64_t destroy for Record(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for RecordMetadata(0) + 20);
  v5 = sub_1C12B5324();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return sub_1C127CE8C(*(_QWORD *)(a1 + *(int *)(a2 + 20)), *(_QWORD *)(a1 + *(int *)(a2 + 20) + 8));
}

_QWORD *initializeWithCopy for Record(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = type metadata accessor for RecordMetadata(0);
  v9 = *(int *)(v8 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1C12B5324();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  *((_BYTE *)a1 + *(int *)(v8 + 24)) = *((_BYTE *)a2 + *(int *)(v8 + 24));
  v14 = *(int *)(a3 + 20);
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = *v16;
  v18 = v16[1];
  sub_1C127CE48(*v16, v18);
  *v15 = v17;
  v15[1] = v18;
  return a1;
}

_QWORD *assignWithCopy for Record(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for RecordMetadata(0);
  v7 = *(int *)(v6 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1C12B5324();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *((_BYTE *)a1 + *(int *)(v6 + 24)) = *((_BYTE *)a2 + *(int *)(v6 + 24));
  v11 = *(int *)(a3 + 20);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = *v13;
  v15 = v13[1];
  sub_1C127CE48(*v13, v15);
  v16 = *v12;
  v17 = v12[1];
  *v12 = v14;
  v12[1] = v15;
  sub_1C127CE8C(v16, v17);
  return a1;
}

_OWORD *initializeWithTake for Record(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = type metadata accessor for RecordMetadata(0);
  v8 = *(int *)(v7 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_1C12B5324();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *((_BYTE *)a1 + *(int *)(v7 + 24)) = *((_BYTE *)a2 + *(int *)(v7 + 24));
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *assignWithTake for Record(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for RecordMetadata(0);
  v9 = *(int *)(v8 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1C12B5324();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  *((_BYTE *)a1 + *(int *)(v8 + 24)) = *((_BYTE *)a2 + *(int *)(v8 + 24));
  v13 = *(int *)(a3 + 20);
  v14 = *(_QWORD *)((char *)a1 + v13);
  v15 = *(_QWORD *)((char *)a1 + v13 + 8);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  sub_1C127CE8C(v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for Record()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C1280024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v6 = type metadata accessor for RecordMetadata(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
  if (((4 * (_DWORD)v9) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v9) & 0xC | (v9 >> 2));
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Record()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C12800C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;

  result = type metadata accessor for RecordMetadata(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  v10 = (_QWORD *)(a1 + *(int *)(a4 + 20));
  *v10 = 0;
  v10[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

uint64_t sub_1C1280148()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for RecordMetadata(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *sub_1C12801C0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Record.CodingKeys()
{
  return &type metadata for Record.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for RecordMetadata.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C1280228 + 4 * byte_1C12B6235[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C128025C + 4 * asc_1C12B6230[v4]))();
}

uint64_t sub_1C128025C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1280264(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C128026CLL);
  return result;
}

uint64_t sub_1C1280278(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C1280280);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C1280284(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C128028C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecordMetadata.CodingKeys()
{
  return &type metadata for RecordMetadata.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SyncProtocolVersion(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s17SessionSyncEngine6RecordV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C1280384 + 4 * byte_1C12B623F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C12803B8 + 4 * byte_1C12B623A[v4]))();
}

uint64_t sub_1C12803B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C12803C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C12803C8);
  return result;
}

uint64_t sub_1C12803D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C12803DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C12803E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C12803E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecordID.CodingKeys()
{
  return &type metadata for RecordID.CodingKeys;
}

unint64_t sub_1C1280408()
{
  unint64_t result;

  result = qword_1EF6D4050;
  if (!qword_1EF6D4050)
  {
    result = MEMORY[0x1C3BA97D4]("]||&p.", &type metadata for RecordID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4050);
  }
  return result;
}

unint64_t sub_1C1280450()
{
  unint64_t result;

  result = qword_1EF6D4058;
  if (!qword_1EF6D4058)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6684, &type metadata for RecordMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4058);
  }
  return result;
}

unint64_t sub_1C1280498()
{
  unint64_t result;

  result = qword_1EF6D4060;
  if (!qword_1EF6D4060)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B673C, &type metadata for Record.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4060);
  }
  return result;
}

unint64_t sub_1C12804E0()
{
  unint64_t result;

  result = qword_1EF6D4068;
  if (!qword_1EF6D4068)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B66AC, &type metadata for Record.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4068);
  }
  return result;
}

unint64_t sub_1C1280528()
{
  unint64_t result;

  result = qword_1EF6D4070;
  if (!qword_1EF6D4070)
  {
    result = MEMORY[0x1C3BA97D4]("e{|& -", &type metadata for Record.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4070);
  }
  return result;
}

unint64_t sub_1C1280570()
{
  unint64_t result;

  result = qword_1EF6D4078;
  if (!qword_1EF6D4078)
  {
    result = MEMORY[0x1C3BA97D4]("U||&$.", &type metadata for RecordMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4078);
  }
  return result;
}

unint64_t sub_1C12805B8()
{
  unint64_t result;

  result = qword_1EF6D4080;
  if (!qword_1EF6D4080)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B661C, &type metadata for RecordMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4080);
  }
  return result;
}

unint64_t sub_1C1280600()
{
  unint64_t result;

  result = qword_1EF6D4088;
  if (!qword_1EF6D4088)
  {
    result = MEMORY[0x1C3BA97D4]("\r}|&", &type metadata for RecordID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4088);
  }
  return result;
}

unint64_t sub_1C1280648()
{
  unint64_t result;

  result = qword_1EF6D4090;
  if (!qword_1EF6D4090)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6564, &type metadata for RecordID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4090);
  }
  return result;
}

uint64_t sub_1C128068C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701736314 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1C12B578C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1C1280778(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x444964726F636572 && a2 == 0xE800000000000000;
  if (v2 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69646F4D7473616CLL && a2 == 0xEC00000064656966 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574656C65447369 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1C12B578C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1C12808F0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
  if (v2 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1C12B578C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t SyncState.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

SessionSyncEngine::SyncState __swiftcall SyncState.init(rawValue:)(SessionSyncEngine::SyncState rawValue)
{
  SessionSyncEngine::SyncState *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static SyncState.supportedDevice.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static SyncState.preferenceEnabled.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void sub_1C1280A08()
{
  qword_1ED78DCC0 = 3;
}

uint64_t sub_1C1280A2C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t static SyncState.active.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  if (qword_1ED78DCC8 != -1)
    result = swift_once();
  *a1 = qword_1ED78DCC0;
  return result;
}

uint64_t SyncState.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if ((*v0 & 1) != 0)
    sub_1C12B54BC();
  if ((v1 & 2) != 0)
    sub_1C12B54BC();
  return 0;
}

_QWORD *sub_1C1280B54@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1C1280B64(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1C1280B6C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1C1280B80@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1C1280B94@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1C1280BA8(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1C1280BD8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1C1280C04@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1C1280C28(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1C1280C3C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1C1280C50(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1C1280C64@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1C1280C78(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1C1280C8C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1C1280CA0(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1C1280CB4()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1C1280CC4()
{
  return sub_1C12B55F4();
}

_QWORD *sub_1C1280CDC(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1C1280CF0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1C1280D00(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_1C1280D0C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1C1280D24()
{
  unint64_t result;

  result = qword_1EF6D4098;
  if (!qword_1EF6D4098)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncState, &type metadata for SyncState);
    atomic_store(result, (unint64_t *)&qword_1EF6D4098);
  }
  return result;
}

unint64_t sub_1C1280D6C()
{
  unint64_t result;

  result = qword_1EF6D40A0;
  if (!qword_1EF6D40A0)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncState, &type metadata for SyncState);
    atomic_store(result, (unint64_t *)&qword_1EF6D40A0);
  }
  return result;
}

unint64_t sub_1C1280DB4()
{
  unint64_t result;

  result = qword_1EF6D40A8;
  if (!qword_1EF6D40A8)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncState, &type metadata for SyncState);
    atomic_store(result, (unint64_t *)&qword_1EF6D40A8);
  }
  return result;
}

unint64_t sub_1C1280DFC()
{
  unint64_t result;

  result = qword_1EF6D40B0;
  if (!qword_1EF6D40B0)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncState, &type metadata for SyncState);
    atomic_store(result, (unint64_t *)&qword_1EF6D40B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SyncState()
{
  return &type metadata for SyncState;
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:didReceiveMessage:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:shouldAcceptIncomingMessage:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:didSendWithRequestIdentifier:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t dispatch thunk of SyncServiceDelegate.syncService(_:didUpdatePairedDevice:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of SyncServicing.add(delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of SyncServicing.resume()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SyncServicing.send(message:destinations:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t MetadataStore.__allocating_init(persistentStore:)(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[40];

  sub_1C1280EFC(a1, (uint64_t)v4);
  type metadata accessor for MetadataStore();
  v2 = swift_allocObject();
  MetadataStore.init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)(10, (uint64_t)v4, 120.0, 60.0);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t sub_1C1280EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t MetadataStore.__allocating_init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  MetadataStore.init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)(a1, a2, a3, a4);
  return v8;
}

uint64_t type metadata accessor for MetadataStore()
{
  return objc_opt_self();
}

uint64_t MetadataStore.init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  *(double *)(v4 + 16) = a3;
  v6 = MEMORY[0x1E0DEE9E0];
  v7 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(v4 + 48) = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)(v4 + 56) = v7;
  *(double *)(v4 + 24) = a4;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = v6;
  sub_1C128E2EC(a2, (uint64_t)v11, &qword_1ED78DC30);
  v8 = v12;
  if (v12)
  {
    v9 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    sub_1C128E2B0((uint64_t)v11, &qword_1ED78DC30);
  }
  sub_1C128110C();
  sub_1C1281800();
  sub_1C128E2B0(a2, &qword_1ED78DC30);
  return v4;
}

Swift::Void __swiftcall MetadataStore.garbageCollect()()
{
  sub_1C128110C();
  sub_1C1281800();
}

uint64_t MetadataStore.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MetadataStore.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1C128110C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51[3];

  v1 = sub_1C1286E08();
  v2 = (uint64_t *)sub_1C1286FC8();
  v45 = v0;
  v3 = sub_1C128725C();
  if (qword_1ED78E810 != -1)
LABEL_38:
    swift_once();
  v4 = sub_1C12B5390();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED78DC40);
  swift_bridgeObjectRetain_n();
  v5 = sub_1C12B5384();
  v6 = sub_1C12B5540();
  v46 = v1;
  v48 = v2;
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v51[0] = v8;
    *(_DWORD *)v7 = 136446210;
    swift_bridgeObjectRetain();
    v9 = sub_1C12B551C();
    v11 = v10;
    swift_bridgeObjectRelease();
    v12 = v9;
    v2 = v48;
    sub_1C12882D0(v12, v11, v51);
    sub_1C12B55DC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v5, v6, "Removing obsolete device identifiers: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v8, -1, -1);
    MEMORY[0x1C3BA9870](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v13 = sub_1C12B5384();
  v14 = sub_1C12B5540();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v51[0] = v16;
    *(_DWORD *)v15 = 136446210;
    swift_bridgeObjectRetain();
    v17 = sub_1C12B551C();
    v19 = v18;
    swift_bridgeObjectRelease();
    sub_1C12882D0(v17, v19, v51);
    v2 = v48;
    sub_1C12B55DC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v13, v14, "Removing bloated device identifiers: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v16, -1, -1);
    MEMORY[0x1C3BA9870](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v20 = sub_1C12B5384();
  v21 = sub_1C12B5540();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v51[0] = v23;
    *(_DWORD *)v22 = 136446210;
    swift_bridgeObjectRetain();
    v24 = sub_1C12B551C();
    v26 = v25;
    swift_bridgeObjectRelease();
    sub_1C12882D0(v24, v26, v51);
    v2 = v48;
    sub_1C12B55DC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v20, v21, "Removing unsynced device identifiers: %{public}s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v23, -1, -1);
    MEMORY[0x1C3BA9870](v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v27 = sub_1C1296EB4((uint64_t)v2, v46);
  v3 = sub_1C1296EB4(v3, v27);
  v28 = 0;
  v47 = v3 + 56;
  v29 = 1 << *(_BYTE *)(v3 + 32);
  v30 = -1;
  if (v29 < 64)
    v30 = ~(-1 << v29);
  v1 = v30 & *(_QWORD *)(v3 + 56);
  v2 = (uint64_t *)(v45 + 48);
  v49 = (unint64_t)(v29 + 63) >> 6;
  while (1)
  {
    if (v1)
    {
      v31 = __clz(__rbit64(v1));
      v1 &= v1 - 1;
      v32 = v31 | (v28 << 6);
      goto LABEL_32;
    }
    v33 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    if (v33 >= v49)
      return swift_release();
    v34 = *(_QWORD *)(v47 + 8 * v33);
    ++v28;
    if (!v34)
    {
      v28 = v33 + 1;
      if (v33 + 1 >= v49)
        return swift_release();
      v34 = *(_QWORD *)(v47 + 8 * v28);
      if (!v34)
      {
        v28 = v33 + 2;
        if (v33 + 2 >= v49)
          return swift_release();
        v34 = *(_QWORD *)(v47 + 8 * v28);
        if (!v34)
          break;
      }
    }
LABEL_31:
    v1 = (v34 - 1) & v34;
    v32 = __clz(__rbit64(v34)) + (v28 << 6);
LABEL_32:
    v36 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v32);
    v38 = *v36;
    v37 = v36[1];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v39 = sub_1C128939C(v38, v37);
    v41 = v40;
    swift_bridgeObjectRelease();
    if ((v41 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v43 = *v2;
      v50 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1C128C270(&qword_1EF6D40D0);
        v43 = v50;
      }
      swift_bridgeObjectRelease();
      sub_1C128AC80(v39, v43);
      *v2 = v43;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
    swift_beginAccess();
    sub_1C1289164(v38, v37);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v35 = v33 + 3;
  if (v35 < v49)
  {
    v34 = *(_QWORD *)(v47 + 8 * v35);
    if (!v34)
    {
      while (1)
      {
        v28 = v35 + 1;
        if (__OFADD__(v35, 1))
          goto LABEL_37;
        if (v28 >= v49)
          return swift_release();
        v34 = *(_QWORD *)(v47 + 8 * v28);
        ++v35;
        if (v34)
          goto LABEL_31;
      }
    }
    v28 = v35;
    goto LABEL_31;
  }
  return swift_release();
}

uint64_t sub_1C1281800()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  unint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  unint64_t v59;
  int64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v1);
  v68 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E800);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (unint64_t *)((char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v4);
  v8 = (uint64_t *)((char *)&v61 - v7);
  v75 = MEMORY[0x1E0DEE9E8];
  v67 = v0 + 40;
  swift_beginAccess();
  v69 = v0;
  v9 = *(_QWORD *)(v0 + 40);
  v10 = *(_QWORD *)(v9 + 64);
  v64 = v9 + 64;
  v11 = 1 << *(_BYTE *)(v9 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v14 = (unint64_t)(v11 + 63) >> 6;
  v61 = v14 - 1;
  result = swift_bridgeObjectRetain();
  v16 = 0;
  v65 = v14;
  v66 = result;
  v62 = result + 104;
  v63 = v14 - 5;
  v17 = &qword_1ED78E7F8;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v19 = (v13 - 1) & v13;
      v20 = v18 | (v16 << 6);
      goto LABEL_8;
    }
    v28 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v28 >= v65)
    {
      v30 = v16;
    }
    else
    {
      v29 = *(_QWORD *)(v64 + 8 * v28);
      if (v29)
        goto LABEL_12;
      v30 = v16 + 1;
      if ((uint64_t)(v16 + 2) < v65)
      {
        v29 = *(_QWORD *)(v64 + 8 * (v16 + 2));
        if (v29)
        {
          v28 = v16 + 2;
          goto LABEL_12;
        }
        v30 = v16 + 2;
        if ((uint64_t)(v16 + 3) < v65)
        {
          v29 = *(_QWORD *)(v64 + 8 * (v16 + 3));
          if (v29)
          {
            v28 = v16 + 3;
LABEL_12:
            v19 = (v29 - 1) & v29;
            v20 = __clz(__rbit64(v29)) + (v28 << 6);
            v16 = v28;
LABEL_8:
            v21 = *(_QWORD *)(v66 + 56);
            v22 = (_QWORD *)(*(_QWORD *)(v66 + 48) + 32 * v20);
            v23 = v22[1];
            v24 = v22[2];
            v25 = v22[3];
            *v6 = *v22;
            v6[1] = v23;
            v6[2] = v24;
            v6[3] = v25;
            v26 = v21 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for RecordMetadata(0) - 8) + 72) * v20;
            v27 = __swift_instantiateConcreteTypeFromMangledName(v17);
            sub_1C128E064(v26, (uint64_t)v6 + *(int *)(v27 + 48));
            (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v6, 0, 1, v27);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_15;
          }
          v28 = v16 + 4;
          v30 = v16 + 3;
          if ((uint64_t)(v16 + 4) < v65)
          {
            v29 = *(_QWORD *)(v64 + 8 * v28);
            if (v29)
              goto LABEL_12;
            while (v63 != v16)
            {
              v29 = *(_QWORD *)(v62 + 8 * v16++);
              if (v29)
              {
                v28 = v16 + 4;
                goto LABEL_12;
              }
            }
            v30 = v61;
          }
        }
      }
    }
    v31 = __swift_instantiateConcreteTypeFromMangledName(v17);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v6, 1, 1, v31);
    v19 = 0;
    v16 = v30;
LABEL_15:
    sub_1C128E330((uint64_t)v6, (uint64_t)v8, &qword_1ED78E800);
    v32 = __swift_instantiateConcreteTypeFromMangledName(v17);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 48))(v8, 1, v32) == 1)
    {
      result = swift_release();
      v42 = 0;
      v43 = v75;
      v44 = *(_QWORD *)(v75 + 56);
      v70 = v75 + 56;
      v45 = 1 << *(_BYTE *)(v75 + 32);
      v46 = -1;
      if (v45 < 64)
        v46 = ~(-1 << v45);
      v47 = v46 & v44;
      v48 = (unint64_t)(v45 + 63) >> 6;
      while (1)
      {
        if (v47)
        {
          v49 = __clz(__rbit64(v47));
          v47 &= v47 - 1;
          v50 = v49 | (v42 << 6);
        }
        else
        {
          v58 = v42 + 1;
          if (__OFADD__(v42, 1))
          {
            __break(1u);
            goto LABEL_53;
          }
          if (v58 >= v48)
            return swift_release();
          v59 = *(_QWORD *)(v70 + 8 * v58);
          ++v42;
          if (!v59)
          {
            v42 = v58 + 1;
            if (v58 + 1 >= v48)
              return swift_release();
            v59 = *(_QWORD *)(v70 + 8 * v42);
            if (!v59)
            {
              v42 = v58 + 2;
              if (v58 + 2 >= v48)
                return swift_release();
              v59 = *(_QWORD *)(v70 + 8 * v42);
              if (!v59)
              {
                v60 = v58 + 3;
                if (v60 >= v48)
                  return swift_release();
                v59 = *(_QWORD *)(v70 + 8 * v60);
                if (!v59)
                {
                  while (1)
                  {
                    v42 = v60 + 1;
                    if (__OFADD__(v60, 1))
                      goto LABEL_54;
                    if (v42 >= v48)
                      return swift_release();
                    v59 = *(_QWORD *)(v70 + 8 * v42);
                    ++v60;
                    if (v59)
                      goto LABEL_50;
                  }
                }
                v42 = v60;
              }
            }
          }
LABEL_50:
          v47 = (v59 - 1) & v59;
          v50 = __clz(__rbit64(v59)) + (v42 << 6);
        }
        v51 = (uint64_t *)(*(_QWORD *)(v43 + 48) + 32 * v50);
        v53 = v51[1];
        v55 = v51[2];
        v54 = v51[3];
        v71 = *v51;
        v52 = v71;
        v72 = v53;
        v73 = v55;
        v74 = v54;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C128598C(&v71);
        v56 = type metadata accessor for RecordMetadata(0);
        v57 = (uint64_t)v68;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v68, 1, 1, v56);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C12834D8(v57, v52, v53, v55, v54);
        swift_endAccess();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
      }
    }
    v70 = v19;
    v33 = v6;
    v34 = v16;
    v35 = v17;
    v36 = *v8;
    v37 = v8[1];
    v38 = v8[2];
    v39 = v8[3];
    v40 = (uint64_t)v8 + *(int *)(v32 + 48);
    v41 = *(_BYTE *)(v40 + *(int *)(type metadata accessor for RecordMetadata(0) + 24));
    sub_1C128E0A8(v40);
    if ((v41 & 1) != 0 && (v71 = v36, v72 = v37, v73 = v38, v74 = v39, (sub_1C1287B38(&v71) & 1) != 0))
    {
      sub_1C1288B0C(&v71, v36, v37, v38, v39);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    v17 = v35;
    v16 = v34;
    v6 = v33;
    v13 = v70;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

uint64_t MetadataStore.unknownRecordIDs(in:)(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(_QWORD *)(a1 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  result = swift_beginAccess();
  if (v2)
  {
    v4 = 0;
    v5 = a1 + 56;
    v22 = -(uint64_t)v2;
    v21 = MEMORY[0x1E0DEE9D8];
    v20 = v2;
    v19 = a1 + 56;
    do
    {
      if (v4 <= v2)
        v6 = v2;
      else
        v6 = v4;
      v7 = -(uint64_t)v6;
      v8 = (uint64_t *)(v5 + 32 * v4++);
      while (1)
      {
        if (v7 + v4 == 1)
        {
          __break(1u);
          return result;
        }
        v10 = *(v8 - 3);
        v9 = *(v8 - 2);
        v12 = *(v8 - 1);
        v11 = *v8;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v13 = swift_bridgeObjectRetain();
        v14 = sub_1C128D070(v13, v10, v9, v12, v11);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
          break;
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        ++v4;
        v8 += 4;
        if (v22 + v4 == 1)
          goto LABEL_18;
      }
      result = swift_isUniquelyReferenced_nonNull_native();
      v15 = v21;
      if ((result & 1) == 0)
      {
        result = sub_1C128C94C(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v15 = v21;
      }
      v2 = v20;
      v17 = *(_QWORD *)(v15 + 16);
      v16 = *(_QWORD *)(v15 + 24);
      if (v17 >= v16 >> 1)
      {
        result = sub_1C128C94C(v16 > 1, v17 + 1, 1);
        v2 = v20;
        v15 = v21;
      }
      *(_QWORD *)(v15 + 16) = v17 + 1;
      v21 = v15;
      v18 = (_QWORD *)(v15 + 32 * v17);
      v18[4] = v10;
      v18[5] = v9;
      v18[6] = v12;
      v18[7] = v11;
      v5 = v19;
    }
    while (v22 + v4);
  }
  else
  {
    v21 = MEMORY[0x1E0DEE9D8];
  }
LABEL_18:
  swift_bridgeObjectRelease();
  swift_release();
  return v21;
}

uint64_t sub_1C1281FC4(uint64_t (*a1)(uint64_t), char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
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
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  uint64_t v39;
  int64_t v40;
  uint64_t v41;

  v4 = v3;
  v38 = a1;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E7F8);
  v7 = MEMORY[0x1E0C80A78](v37);
  v36 = (uint64_t)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v10 = (uint64_t *)((char *)&v33 - v9);
  v11 = *(_QWORD *)(a3 + 64);
  v34 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v35 = (unint64_t)(v12 + 63) >> 6;
  v39 = a3;
  result = swift_bridgeObjectRetain();
  v16 = 0;
  while (v14)
  {
    v41 = v4;
    v17 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    v40 = v16;
    v18 = v17 | (v16 << 6);
LABEL_19:
    v23 = *(_QWORD *)(v39 + 56);
    v24 = (uint64_t *)(*(_QWORD *)(v39 + 48) + 32 * v18);
    v25 = *v24;
    v26 = v24[1];
    v28 = v24[2];
    v27 = v24[3];
    v29 = type metadata accessor for RecordMetadata(0);
    sub_1C128E064(v23 + *(_QWORD *)(*(_QWORD *)(v29 - 8) + 72) * v18, (uint64_t)v10 + *(int *)(v37 + 48));
    *v10 = v25;
    v10[1] = v26;
    v10[2] = v28;
    v10[3] = v27;
    v30 = v36;
    sub_1C128E330((uint64_t)v10, v36, &qword_1ED78E7F8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31 = v41;
    v32 = v38(v30);
    v4 = v31;
    result = sub_1C128E2B0(v30, &qword_1ED78E7F8);
    if (v31)
      goto LABEL_28;
    v16 = v40;
    if ((v32 & 1) != 0)
    {
      a2 = 1;
LABEL_28:
      swift_release();
      return a2 & 1;
    }
  }
  v19 = __OFADD__(v16, 1);
  v20 = v16 + 1;
  if (v19)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v20 >= v35)
    goto LABEL_27;
  v21 = *(_QWORD *)(v34 + 8 * v20);
  if (v21)
  {
LABEL_18:
    v41 = v4;
    v14 = (v21 - 1) & v21;
    v40 = v20;
    v18 = __clz(__rbit64(v21)) + (v20 << 6);
    goto LABEL_19;
  }
  v22 = v20 + 1;
  if (v20 + 1 >= v35)
    goto LABEL_27;
  v21 = *(_QWORD *)(v34 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v20 + 2;
  if (v20 + 2 >= v35)
    goto LABEL_27;
  v21 = *(_QWORD *)(v34 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v20 + 3;
  if (v20 + 3 >= v35)
    goto LABEL_27;
  v21 = *(_QWORD *)(v34 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v20 + 4;
  if (v20 + 4 >= v35)
  {
LABEL_27:
    a2 = 0;
    goto LABEL_28;
  }
  v21 = *(_QWORD *)(v34 + 8 * v22);
  if (v21)
  {
LABEL_17:
    v20 = v22;
    goto LABEL_18;
  }
  while (1)
  {
    v20 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v20 >= v35)
      goto LABEL_27;
    v21 = *(_QWORD *)(v34 + 8 * v20);
    ++v22;
    if (v21)
      goto LABEL_18;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C1282284(uint64_t (*a1)(uint64_t), char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
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
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  uint64_t v39;
  int64_t v40;
  uint64_t v41;

  v4 = v3;
  v38 = a1;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40D8);
  v7 = MEMORY[0x1E0C80A78](v37);
  v36 = (uint64_t)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v33 - v9;
  v11 = *(_QWORD *)(a3 + 64);
  v34 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v35 = (unint64_t)(v12 + 63) >> 6;
  v39 = a3;
  result = swift_bridgeObjectRetain();
  v16 = 0;
  while (v14)
  {
    v41 = v4;
    v17 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    v40 = v16;
    v18 = v17 | (v16 << 6);
LABEL_19:
    v23 = *(_QWORD *)(v39 + 56);
    v24 = (uint64_t *)(*(_QWORD *)(v39 + 48) + 32 * v18);
    v25 = *v24;
    v26 = v24[1];
    v28 = v24[2];
    v27 = v24[3];
    v29 = sub_1C12B5324();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(&v10[*(int *)(v37 + 48)], v23 + *(_QWORD *)(*(_QWORD *)(v29 - 8) + 72) * v18, v29);
    *(_QWORD *)v10 = v25;
    *((_QWORD *)v10 + 1) = v26;
    *((_QWORD *)v10 + 2) = v28;
    *((_QWORD *)v10 + 3) = v27;
    v30 = v36;
    sub_1C128E330((uint64_t)v10, v36, &qword_1EF6D40D8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31 = v41;
    v32 = v38(v30);
    v4 = v31;
    result = sub_1C128E2B0(v30, &qword_1EF6D40D8);
    if (v31)
      goto LABEL_28;
    v16 = v40;
    if ((v32 & 1) != 0)
    {
      a2 = 1;
LABEL_28:
      swift_release();
      return a2 & 1;
    }
  }
  v19 = __OFADD__(v16, 1);
  v20 = v16 + 1;
  if (v19)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v20 >= v35)
    goto LABEL_27;
  v21 = *(_QWORD *)(v34 + 8 * v20);
  if (v21)
  {
LABEL_18:
    v41 = v4;
    v14 = (v21 - 1) & v21;
    v40 = v20;
    v18 = __clz(__rbit64(v21)) + (v20 << 6);
    goto LABEL_19;
  }
  v22 = v20 + 1;
  if (v20 + 1 >= v35)
    goto LABEL_27;
  v21 = *(_QWORD *)(v34 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v20 + 2;
  if (v20 + 2 >= v35)
    goto LABEL_27;
  v21 = *(_QWORD *)(v34 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v20 + 3;
  if (v20 + 3 >= v35)
    goto LABEL_27;
  v21 = *(_QWORD *)(v34 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v20 + 4;
  if (v20 + 4 >= v35)
  {
LABEL_27:
    a2 = 0;
    goto LABEL_28;
  }
  v21 = *(_QWORD *)(v34 + 8 * v22);
  if (v21)
  {
LABEL_17:
    v20 = v22;
    goto LABEL_18;
  }
  while (1)
  {
    v20 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v20 >= v35)
      goto LABEL_27;
    v21 = *(_QWORD *)(v34 + 8 * v20);
    ++v22;
    if (v21)
      goto LABEL_18;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t MetadataStore.recordIDs(minus:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_1C128D72C(v2, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_1C12825DC(v3);
  swift_release();
  return v4;
}

uint64_t sub_1C12825DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;

  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E7F8);
  v3 = MEMORY[0x1E0C80A78](v60);
  v55 = (uint64_t *)((char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = MEMORY[0x1E0C80A78](v3);
  v54 = (uint64_t *)((char *)&v47 - v6);
  v7 = MEMORY[0x1E0C80A78](v5);
  v53 = (uint64_t *)((char *)&v47 - v8);
  MEMORY[0x1E0C80A78](v7);
  v52 = (uint64_t *)((char *)&v47 - v9);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = MEMORY[0x1E0DEE9D8];
  if (!v10)
    return v11;
  v47 = v1;
  v61 = MEMORY[0x1E0DEE9D8];
  sub_1C128C94C(0, v10, 0);
  result = sub_1C12B1984(a1);
  v14 = result;
  v15 = 0;
  v16 = a1 + 64;
  v56 = a1 + 80;
  v50 = a1 + 64;
  v51 = a1;
  v48 = v10;
  v49 = v13;
  while ((v14 & 0x8000000000000000) == 0 && (uint64_t)v14 < 1 << *(_BYTE *)(a1 + 32))
  {
    v18 = v14 >> 6;
    if ((*(_QWORD *)(v16 + 8 * (v14 >> 6)) & (1 << v14)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v13)
      goto LABEL_26;
    v57 = v15;
    v58 = 1 << v14;
    v19 = v52;
    v20 = (uint64_t)v52 + *(int *)(v60 + 48);
    v21 = *(_QWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 56);
    v23 = (uint64_t *)(v21 + 32 * v14);
    v25 = *v23;
    v24 = v23[1];
    v27 = v23[2];
    v26 = v23[3];
    *v52 = *v23;
    v19[1] = v24;
    v19[2] = v27;
    v19[3] = v26;
    v28 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for RecordMetadata(0) - 8) + 72);
    v59 = v14;
    sub_1C128E064(v22 + v28 * v14, v20);
    v29 = v53;
    *v53 = v25;
    v29[1] = v24;
    v29[2] = v27;
    v29[3] = v26;
    v30 = v60;
    sub_1C128E064(v20, (uint64_t)v29 + *(int *)(v60 + 48));
    v31 = v54;
    sub_1C128E330((uint64_t)v29, (uint64_t)v54, &qword_1ED78E7F8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_1C128E2B0((uint64_t)v19, &qword_1ED78E7F8);
    v32 = *(int *)(v30 + 48);
    v33 = v55;
    v34 = (uint64_t)v55 + v32;
    v36 = *v31;
    v35 = v31[1];
    v37 = v31[2];
    v38 = v31[3];
    *v55 = *v31;
    v33[1] = v35;
    v33[2] = v37;
    v33[3] = v38;
    sub_1C128E064((uint64_t)v31 + v32, (uint64_t)v33 + v32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C128E0A8(v34);
    sub_1C128E2B0((uint64_t)v31, &qword_1ED78E7F8);
    v11 = v61;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = sub_1C128C94C(0, *(_QWORD *)(v11 + 16) + 1, 1);
      v11 = v61;
    }
    v40 = *(_QWORD *)(v11 + 16);
    v39 = *(_QWORD *)(v11 + 24);
    if (v40 >= v39 >> 1)
    {
      result = sub_1C128C94C(v39 > 1, v40 + 1, 1);
      v11 = v61;
    }
    *(_QWORD *)(v11 + 16) = v40 + 1;
    v41 = (_QWORD *)(v11 + 32 * v40);
    v41[4] = v36;
    v41[5] = v35;
    v41[6] = v37;
    v41[7] = v38;
    a1 = v51;
    v14 = 1 << *(_BYTE *)(v51 + 32);
    if (v59 >= (uint64_t)v14)
      goto LABEL_27;
    v16 = v50;
    v42 = *(_QWORD *)(v50 + 8 * v18);
    if ((v42 & v58) == 0)
      goto LABEL_28;
    LODWORD(v13) = v49;
    if (*(_DWORD *)(v51 + 36) != (_DWORD)v49)
      goto LABEL_29;
    v43 = v42 & (-2 << (v59 & 0x3F));
    if (v43)
    {
      v14 = __clz(__rbit64(v43)) | v59 & 0xFFFFFFFFFFFFFFC0;
      v17 = v48;
    }
    else
    {
      v44 = v18 + 1;
      v45 = (v14 + 63) >> 6;
      v17 = v48;
      if (v18 + 1 < v45)
      {
        v46 = *(_QWORD *)(v50 + 8 * v44);
        if (v46)
        {
LABEL_22:
          v14 = __clz(__rbit64(v46)) + (v44 << 6);
        }
        else
        {
          while (v45 - 2 != v18)
          {
            v46 = *(_QWORD *)(v56 + 8 * v18++);
            if (v46)
            {
              v44 = v18 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    v15 = v57 + 1;
    if (v57 + 1 == v17)
      return v11;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t MetadataStore.modifiedRecordIDs(for:)(uint64_t a1, uint64_t a2)
{
  return sub_1C1282DD4(a1, a2, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1C128D8E0);
}

uint64_t sub_1C12829AC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v8);
  v45 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_1C12B5324();
  v44 = *(_QWORD *)(v46 - 8);
  MEMORY[0x1E0C80A78](v46);
  v43 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = type metadata accessor for RecordMetadata(0);
  v14 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48);
  v47 = (uint64_t)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  v16 = a1[1];
  v18 = a1[2];
  v19 = a1[3];
  swift_beginAccess();
  v20 = *(_QWORD *)(v3 + 48);
  if (!*(_QWORD *)(v20 + 16))
    goto LABEL_12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21 = sub_1C128939C(a2, a3);
  if ((v22 & 1) != 0)
  {
    v23 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v24 = *(_QWORD *)(v4 + 40);
    if (*(_QWORD *)(v24 + 16))
    {
      v25 = v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v26 = v17;
      v27 = sub_1C12892F0(v17, v16, v18, v19);
      if ((v28 & 1) != 0)
      {
        sub_1C128E064(*(_QWORD *)(v24 + 56) + *(_QWORD *)(v14 + 72) * v27, (uint64_t)v13);
        v29 = 0;
      }
      else
      {
        v29 = 1;
      }
      v30 = v48;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, v29, 1, v48);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v30) != 1)
      {
        v35 = v47;
        sub_1C127F380((uint64_t)v13, v47);
        if (*(_QWORD *)(v23 + 16))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v36 = sub_1C12892F0(v26, v25, v18, v19);
          v37 = v23;
          v38 = v45;
          v39 = v46;
          v40 = v44;
          if ((v41 & 1) != 0)
          {
            (*(void (**)(char *, unint64_t, uint64_t))(v44 + 16))(v45, *(_QWORD *)(v37 + 56) + *(_QWORD *)(v44 + 72) * v36, v46);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v38, 0, 1, v39);
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v45, 1, 1, v46);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          v40 = v44;
          v38 = v45;
          v39 = v46;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v45, 1, 1, v46);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39) != 1)
        {
          v42 = v43;
          (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v43, v38, v39);
          v33 = sub_1C12B52D0();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v39);
          sub_1C128E0A8(v35);
          return v33 & 1;
        }
        sub_1C128E0A8(v35);
        v31 = &qword_1ED78DBF8;
        v32 = (uint64_t)v38;
        goto LABEL_11;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, 1, 1, v48);
    }
    swift_bridgeObjectRelease();
    v31 = &qword_1ED78E3F0;
    v32 = (uint64_t)v13;
LABEL_11:
    sub_1C128E2B0(v32, v31);
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_12:
  v33 = 0;
  return v33 & 1;
}

uint64_t MetadataStore.deletedRecordIDs(for:)(uint64_t a1, uint64_t a2)
{
  return sub_1C1282DD4(a1, a2, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1C128DB78);
}

uint64_t sub_1C1282DD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  v7 = swift_bridgeObjectRetain();
  v8 = sub_1C128DE10(v7, v3, a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v9 = sub_1C12825DC(v8);
  swift_release();
  return v9;
}

uint64_t MetadataStore.set(lastModifiedDate:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  char v51;
  unint64_t v52;
  char v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t *v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  _QWORD v62[2];
  __int128 v63;
  int v64;
  uint64_t v65;
  char *v66;
  _QWORD *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81[2];

  v5 = type metadata accessor for RecordMetadata(0);
  v71 = *(_QWORD *)(v5 - 8);
  v72 = v5;
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v62 - v9;
  v11 = sub_1C12B5324();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v13);
  v18 = *(_QWORD *)(a2 + 16);
  if (v18)
  {
    v68 = (char *)v62 - v17;
    v76 = (uint64_t *)(v2 + 40);
    swift_bridgeObjectRetain();
    v62[0] = a2;
    v19 = (uint64_t *)(a2 + 56);
    *(_QWORD *)&v20 = 136446722;
    v63 = v20;
    v62[1] = MEMORY[0x1E0DEE9B8] + 8;
    v77 = v11;
    v73 = v12;
    v66 = v15;
    v67 = v10;
    v69 = v8;
    v70 = a1;
    while (1)
    {
      v74 = v18;
      v21 = *(v19 - 3);
      v22 = *(v19 - 2);
      v23 = *v19;
      v78 = *(v19 - 1);
      v79 = v21;
      v24 = qword_1ED78E810;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v24 != -1)
        swift_once();
      v75 = v19;
      v25 = sub_1C12B5390();
      __swift_project_value_buffer(v25, (uint64_t)qword_1ED78DC40);
      v26 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
      v27 = v68;
      v26(v68, a1, v11);
      v26(v15, a1, v11);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v28 = sub_1C12B5384();
      v29 = sub_1C12B5540();
      v30 = v29;
      if (os_log_type_enabled(v28, v29))
      {
        v31 = swift_slowAlloc();
        v65 = swift_slowAlloc();
        v80 = (_QWORD *)v65;
        v81[0] = 0;
        *(_DWORD *)v31 = v63;
        v81[1] = 0xE000000000000000;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v64 = v30;
        sub_1C12B5660();
        swift_bridgeObjectRelease();
        strcpy((char *)v81, "identifier: ");
        BYTE5(v81[1]) = 0;
        HIWORD(v81[1]) = -5120;
        swift_bridgeObjectRetain();
        sub_1C12B54BC();
        swift_bridgeObjectRelease();
        sub_1C12B54BC();
        swift_bridgeObjectRetain();
        v32 = v78;
        sub_1C12B54BC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(_QWORD *)(v31 + 4) = sub_1C12882D0(v81[0], v81[1], (uint64_t *)&v80);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2082;
        sub_1C128E128();
        v33 = sub_1C12B5780();
        *(_QWORD *)(v31 + 14) = sub_1C12882D0(v33, v34, (uint64_t *)&v80);
        swift_bridgeObjectRelease();
        v35 = *(void (**)(char *, uint64_t))(v73 + 8);
        v35(v27, v77);
        *(_WORD *)(v31 + 22) = 2050;
        sub_1C12B52F4();
        *(_QWORD *)(v31 + 24) = v36;
        v35(v15, v77);
        v11 = v77;
        _os_log_impl(&dword_1C127A000, v28, (os_log_type_t)v64, "Updating lastModifiedDate for record %{public}s to %{public}s (%{public}f)", (uint8_t *)v31, 0x20u);
        v37 = v65;
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v37, -1, -1);
        MEMORY[0x1C3BA9870](v31, -1, -1);

      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        v38 = *(void (**)(char *, uint64_t))(v12 + 8);
        v38(v27, v11);
        v38(v15, v11);

        v32 = v78;
      }
      v39 = v72;
      v40 = v67;
      a1 = v70;
      v26((char *)v67 + *(int *)(v72 + 20), v70, v11);
      v41 = v79;
      *v40 = v79;
      v40[1] = v22;
      v40[2] = v32;
      v40[3] = v23;
      *((_BYTE *)v40 + *(int *)(v39 + 24)) = 0;
      v42 = v76;
      swift_beginAccess();
      v43 = (uint64_t)v69;
      sub_1C128E064((uint64_t)v40, (uint64_t)v69);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v80 = (_QWORD *)*v42;
      v45 = (uint64_t)v80;
      *v42 = 0x8000000000000000;
      v47 = sub_1C12892F0(v41, v22, v32, v23);
      v48 = *(_QWORD *)(v45 + 16);
      v49 = (v46 & 1) == 0;
      v50 = v48 + v49;
      if (__OFADD__(v48, v49))
        break;
      v51 = v46;
      if (*(_QWORD *)(v45 + 24) >= v50)
      {
        v54 = v75;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_1C128BBC8();
      }
      else
      {
        sub_1C12897F8(v50, isUniquelyReferenced_nonNull_native);
        v52 = sub_1C12892F0(v79, v22, v78, v23);
        v54 = v75;
        if ((v51 & 1) != (v53 & 1))
          goto LABEL_23;
        v47 = v52;
      }
      v56 = v78;
      v55 = v79;
      v57 = v80;
      if ((v51 & 1) != 0)
      {
        sub_1C128E0E4(v43, v80[7] + *(_QWORD *)(v71 + 72) * v47);
      }
      else
      {
        v80[(v47 >> 6) + 8] |= 1 << v47;
        v58 = (uint64_t *)(v57[6] + 32 * v47);
        *v58 = v55;
        v58[1] = v22;
        v58[2] = v56;
        v58[3] = v23;
        sub_1C127F380(v43, v57[7] + *(_QWORD *)(v71 + 72) * v47);
        v59 = v57[2];
        v60 = __OFADD__(v59, 1);
        v61 = v59 + 1;
        if (v60)
          goto LABEL_22;
        v57[2] = v61;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      v19 = v54 + 4;
      *v76 = (uint64_t)v57;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_1C128E0A8((uint64_t)v40);
      v12 = v73;
      v18 = v74 - 1;
      v11 = v77;
      v15 = v66;
      if (v74 == 1)
        return swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    result = sub_1C12B57A4();
    __break(1u);
  }
  return result;
}

uint64_t sub_1C12834D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  uint64_t v22;

  v6 = v5;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for RecordMetadata(0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 48))(a1, 1) == 1)
  {
    sub_1C128E2B0(a1, &qword_1ED78E3F0);
    sub_1C1288D30(a2, a3, a4, a5, (uint64_t)v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_1C128E2B0((uint64_t)v14, &qword_1ED78E3F0);
  }
  else
  {
    sub_1C127F380(a1, (uint64_t)v17);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v6;
    *v6 = 0x8000000000000000;
    sub_1C128AE54((uint64_t)v17, a2, a3, a4, a5, isUniquelyReferenced_nonNull_native);
    *v6 = v22;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C1283668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1C12B5324();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_1C128E2B0(a1, &qword_1ED78DBF8);
    sub_1C1288E80(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_1C128E2B0((uint64_t)v10, &qword_1ED78DBF8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_1C128B0F4((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t MetadataStore.set(deletedDate:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  _QWORD v52[2];
  __int128 v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t, uint64_t);
  uint64_t *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67[2];

  v63 = a1;
  v4 = type metadata accessor for RecordMetadata(0);
  v56 = *(_QWORD *)(v4 - 8);
  v57 = v4;
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v62 = (_QWORD *)((char *)v52 - v8);
  v9 = sub_1C12B5324();
  v10 = *(_QWORD *)(v9 - 8);
  result = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a2 + 16);
  if (!v14)
    return result;
  v61 = (uint64_t *)(v2 + 40);
  swift_bridgeObjectRetain();
  v52[0] = a2;
  v15 = (uint64_t *)(a2 + 56);
  *(_QWORD *)&v16 = 136446466;
  v53 = v16;
  v52[1] = MEMORY[0x1E0DEE9B8] + 8;
  v64 = v9;
  v58 = v10;
  v54 = v13;
  v55 = v7;
  while (1)
  {
    v59 = v14;
    v17 = *(v15 - 2);
    v65 = *(v15 - 3);
    v19 = *(v15 - 1);
    v18 = *v15;
    v20 = qword_1ED78E810;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v20 != -1)
      swift_once();
    v21 = sub_1C12B5390();
    __swift_project_value_buffer(v21, (uint64_t)qword_1ED78DC40);
    v60 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v60(v13, v63, v9);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v22 = v10;
    v23 = sub_1C12B5384();
    v24 = v13;
    v25 = sub_1C12B5540();
    if (os_log_type_enabled(v23, v25))
    {
      v26 = swift_slowAlloc();
      v27 = swift_slowAlloc();
      v66 = (_QWORD *)v27;
      v67[0] = 0;
      *(_DWORD *)v26 = v53;
      v67[1] = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C12B5660();
      swift_bridgeObjectRelease();
      strcpy((char *)v67, "identifier: ");
      BYTE5(v67[1]) = 0;
      HIWORD(v67[1]) = -5120;
      swift_bridgeObjectRetain();
      sub_1C12B54BC();
      swift_bridgeObjectRelease();
      sub_1C12B54BC();
      swift_bridgeObjectRetain();
      sub_1C12B54BC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_QWORD *)(v26 + 4) = sub_1C12882D0(v67[0], v67[1], (uint64_t *)&v66);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2082;
      sub_1C128E128();
      v28 = sub_1C12B5780();
      *(_QWORD *)(v26 + 14) = sub_1C12882D0(v28, v29, (uint64_t *)&v66);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v24, v64);
      _os_log_impl(&dword_1C127A000, v23, v25, "Updating deletedDate for record %{public}s to %{public}s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      v30 = v27;
      v9 = v64;
      MEMORY[0x1C3BA9870](v30, -1, -1);
      MEMORY[0x1C3BA9870](v26, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v9);
    }

    v31 = v57;
    v32 = v62;
    v60((char *)v62 + *(int *)(v57 + 20), v63, v9);
    v33 = v65;
    *v32 = v65;
    v32[1] = v17;
    v32[2] = v19;
    v32[3] = v18;
    *((_BYTE *)v32 + *(int *)(v31 + 24)) = 1;
    v34 = v61;
    swift_beginAccess();
    v35 = (uint64_t)v55;
    sub_1C128E064((uint64_t)v32, (uint64_t)v55);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v66 = (_QWORD *)*v34;
    v37 = (uint64_t)v66;
    *v34 = 0x8000000000000000;
    v39 = sub_1C12892F0(v33, v17, v19, v18);
    v40 = *(_QWORD *)(v37 + 16);
    v41 = (v38 & 1) == 0;
    v42 = v40 + v41;
    if (__OFADD__(v40, v41))
      break;
    v43 = v38;
    if (*(_QWORD *)(v37 + 24) >= v42)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v46 = v65;
        v47 = v66;
        if ((v38 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_1C128BBC8();
        v46 = v65;
        v47 = v66;
        if ((v43 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_1C12897F8(v42, isUniquelyReferenced_nonNull_native);
      v44 = sub_1C12892F0(v65, v17, v19, v18);
      if ((v43 & 1) != (v45 & 1))
        goto LABEL_25;
      v39 = v44;
      v46 = v65;
      v47 = v66;
      if ((v43 & 1) != 0)
      {
LABEL_3:
        sub_1C128E0E4(v35, v47[7] + *(_QWORD *)(v56 + 72) * v39);
        goto LABEL_4;
      }
    }
    v47[(v39 >> 6) + 8] |= 1 << v39;
    v48 = (uint64_t *)(v47[6] + 32 * v39);
    *v48 = v46;
    v48[1] = v17;
    v48[2] = v19;
    v48[3] = v18;
    sub_1C127F380(v35, v47[7] + *(_QWORD *)(v56 + 72) * v39);
    v49 = v47[2];
    v50 = __OFADD__(v49, 1);
    v51 = v49 + 1;
    if (v50)
      goto LABEL_24;
    v47[2] = v51;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_4:
    v15 += 4;
    *v61 = (uint64_t)v47;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_1C128E0A8((uint64_t)v62);
    v10 = v58;
    v14 = v59 - 1;
    v9 = v64;
    v13 = v54;
    if (v59 == 1)
      return swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  result = sub_1C12B57A4();
  __break(1u);
  return result;
}

uint64_t MetadataStore.set(syncDate:for:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  _QWORD *v59;
  uint64_t *v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  _QWORD v67[2];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  void (*v73)(char *, char *, uint64_t);
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;

  v5 = v4;
  v77 = a1;
  v9 = sub_1C12B5324();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v76 = (char *)v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)v67 - v17;
  v75 = *(char **)(a2 + 16);
  if (!v75)
    return result;
  v78 = v10;
  swift_beginAccess();
  v19 = *(_QWORD *)(v5 + 48);
  v20 = *(_QWORD *)(v19 + 16);
  v69 = a4;
  v70 = v5;
  v68 = a3;
  v72 = v15;
  v67[0] = v5 + 48;
  if (v20)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_1C128939C(a3, a4);
    if ((v22 & 1) != 0)
    {
      v80 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v80 = sub_1C1284374(MEMORY[0x1E0DEE9D8]);
LABEL_7:
  swift_bridgeObjectRetain();
  v23 = 0;
  v67[1] = a2;
  v24 = (uint64_t *)(a2 + 56);
  v26 = v77;
  v25 = v78;
  v74 = v18;
  v71 = v9;
  while (!__OFADD__(v23, 1))
  {
    v81 = v23 + 1;
    v31 = *(v24 - 3);
    v30 = *(v24 - 2);
    v32 = *(v24 - 1);
    v33 = *v24;
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v18, v26, v9);
    v79 = *(char **)(v25 + 56);
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v79)(v18, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v18, 1, v9) == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C128E2B0((uint64_t)v18, &qword_1ED78DBF8);
      v34 = v80;
      swift_bridgeObjectRetain();
      v35 = sub_1C12892F0(v31, v30, v32, v33);
      v37 = v36;
      swift_bridgeObjectRelease();
      if ((v37 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v83 = v34;
        v28 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v79;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1C128B940();
          v34 = v83;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v25 = v78;
        v39 = *(_QWORD *)(v34 + 56) + *(_QWORD *)(v78 + 72) * v35;
        v40 = v34;
        v29 = (uint64_t)v72;
        (*(void (**)(char *, unint64_t, uint64_t))(v78 + 32))(v72, v39, v9);
        v80 = v40;
        sub_1C128A834(v35, v40, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870]);
        swift_bridgeObjectRelease();
        v27 = 0;
      }
      else
      {
        v27 = 1;
        v25 = v78;
        v28 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v79;
        v29 = (uint64_t)v72;
      }
      v28(v29, v27, 1, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C128E2B0(v29, &qword_1ED78DBF8);
      v18 = v74;
      v26 = v77;
    }
    else
    {
      v79 = v23;
      v73 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
      v73(v76, v18, v9);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v41 = v80;
      v42 = swift_isUniquelyReferenced_nonNull_native();
      v83 = v41;
      v43 = v31;
      v44 = v31;
      v45 = v30;
      v46 = v30;
      v47 = v32;
      v48 = v33;
      v50 = sub_1C12892F0(v44, v46, v32, v33);
      v51 = *(_QWORD *)(v41 + 16);
      v52 = (v49 & 1) == 0;
      v53 = v51 + v52;
      if (__OFADD__(v51, v52))
        goto LABEL_32;
      v54 = v49;
      if (*(_QWORD *)(v41 + 24) >= v53)
      {
        v55 = v43;
        if ((v42 & 1) == 0)
          sub_1C128B940();
        v56 = v47;
      }
      else
      {
        sub_1C1289430(v53, v42);
        v55 = v43;
        v56 = v47;
        v57 = sub_1C12892F0(v43, v45, v47, v48);
        if ((v54 & 1) != (v58 & 1))
          goto LABEL_34;
        v50 = v57;
      }
      v23 = v79;
      v59 = (_QWORD *)v83;
      if ((v54 & 1) != 0)
      {
        v25 = v78;
        v9 = v71;
        (*(void (**)(unint64_t, char *, uint64_t))(v78 + 40))(*(_QWORD *)(v83 + 56) + *(_QWORD *)(v78 + 72) * v50, v76, v71);
      }
      else
      {
        *(_QWORD *)(v83 + 8 * (v50 >> 6) + 64) |= 1 << v50;
        v60 = (uint64_t *)(v59[6] + 32 * v50);
        *v60 = v55;
        v60[1] = v45;
        v60[2] = v56;
        v60[3] = v48;
        v9 = v71;
        v73((char *)(v59[7] + *(_QWORD *)(v78 + 72) * v50), v76, v71);
        v61 = v59[2];
        v62 = __OFADD__(v61, 1);
        v63 = v61 + 1;
        if (v62)
          goto LABEL_33;
        v59[2] = v63;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v25 = v78;
      }
      v80 = v83;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v26 = v77;
      v18 = v74;
    }
    v24 += 4;
    ++v23;
    if (v81 == v75)
    {
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v64 = v69;
      swift_bridgeObjectRetain();
      v65 = v70;
      v66 = swift_isUniquelyReferenced_nonNull_native();
      v82 = *(_QWORD *)(v65 + 48);
      *(_QWORD *)(v65 + 48) = 0x8000000000000000;
      sub_1C128B23C(v80, v68, v64, v66, &qword_1EF6D40D0);
      *(_QWORD *)(v65 + 48) = v82;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_1C128110C();
      return sub_1C1281800();
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  result = sub_1C12B57A4();
  __break(1u);
  return result;
}

unint64_t sub_1C1284374(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  char *v27;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40E8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40E0);
  v6 = sub_1C12B56F0();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v27 = (char *)v5 + *(int *)(v2 + 48);
  v9 = v6 + 64;
  v10 = *(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v11 = a1 + ((v10 + 32) & ~v10);
  v26 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1C128E2EC(v11, (uint64_t)v5, &qword_1EF6D40E8);
    v12 = *v5;
    v13 = v5[1];
    v15 = v5[2];
    v14 = v5[3];
    result = sub_1C12892F0(*v5, v13, v15, v14);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 32 * result);
    *v19 = v12;
    v19[1] = v13;
    v19[2] = v15;
    v19[3] = v14;
    v20 = v7[7];
    v21 = sub_1C12B5324();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18, v27, v21);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
    v11 += v26;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t MetadataStore.set(syncDate:forRecordsMatching:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  void (*v47)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t, uint64_t);
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  BOOL v84;
  unint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  unint64_t v92;
  uint64_t v93;
  _BOOL8 v94;
  uint64_t v95;
  char v96;
  unint64_t v97;
  char v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  BOOL v104;
  uint64_t v105;
  _QWORD v106[2];
  char *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;

  v5 = v4;
  v129 = a3;
  v110 = a1;
  v8 = sub_1C12B5324();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v109 = (char *)v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)v106 - v15;
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40B8);
  MEMORY[0x1E0C80A78](v122);
  v130 = (uint64_t)v106 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  v19 = MEMORY[0x1E0C80A78](v18);
  v126 = (_QWORD *)((char *)v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = MEMORY[0x1E0C80A78](v19);
  v125 = (uint64_t)v106 - v22;
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)v106 - v23;
  v123 = type metadata accessor for RecordMetadata(0);
  v25 = *(_QWORD *)(v123 - 8);
  v26 = MEMORY[0x1E0C80A78](v123);
  v117 = (_QWORD *)((char *)v106 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = MEMORY[0x1E0C80A78](v26);
  v30 = (_QWORD *)((char *)v106 - v29);
  v121 = *(_QWORD *)(a2 + 16);
  if (!v121)
    return result;
  v114 = v16;
  swift_beginAccess();
  v31 = *(_QWORD *)(v5 + 48);
  v32 = *(_QWORD *)(v31 + 16);
  v112 = v9;
  v107 = v14;
  if (!v32)
    goto LABEL_6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v33 = sub_1C128939C(v129, a4);
  if ((v34 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    v113 = sub_1C1284374(MEMORY[0x1E0DEE9D8]);
    goto LABEL_7;
  }
  v113 = *(_QWORD *)(*(_QWORD *)(v31 + 56) + 8 * v33);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_7:
  v106[1] = v5;
  v35 = a2 + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80));
  v106[0] = a2;
  swift_bridgeObjectRetain();
  v119 = (uint64_t *)(v5 + 40);
  swift_beginAccess();
  v36 = 0;
  v124 = *(_QWORD *)(v25 + 72);
  v118 = v8;
  v37 = v125;
  v38 = v126;
  v127 = v24;
  v120 = v30;
  v108 = v25;
  while (!__OFADD__(v36, 1))
  {
    v128 = v36 + 1;
    v129 = v35;
    sub_1C128E064(v35, (uint64_t)v30);
    v40 = *v119;
    if (*(_QWORD *)(*v119 + 16))
    {
      v41 = v30[2];
      v42 = v30[3];
      v44 = *v30;
      v43 = v30[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v45 = sub_1C12892F0(v44, v43, v41, v42);
      if ((v46 & 1) != 0)
      {
        v24 = v127;
        sub_1C128E064(*(_QWORD *)(v40 + 56) + v45 * v124, (uint64_t)v127);
        v47 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56);
        v48 = (uint64_t)v24;
        v49 = 0;
      }
      else
      {
        v47 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56);
        v24 = v127;
        v48 = (uint64_t)v127;
        v49 = 1;
      }
      v50 = v25;
      v51 = v123;
      v47(v48, v49, 1, v123);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v37 = v125;
      v38 = v126;
    }
    else
    {
      v47 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56);
      v50 = v25;
      v51 = v123;
      v47((uint64_t)v24, 1, 1, v123);
    }
    sub_1C128E064((uint64_t)v30, v37);
    v47(v37, 0, 1, v51);
    v52 = v130;
    v53 = v130 + *(int *)(v122 + 48);
    sub_1C128E2EC(v37, v130, &qword_1ED78E3F0);
    sub_1C128E2EC((uint64_t)v24, v53, &qword_1ED78E3F0);
    v54 = v37;
    v55 = v50;
    v56 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 48);
    if (v56(v52, 1, v51) == 1)
    {
      sub_1C128E2B0(v54, &qword_1ED78E3F0);
      v57 = v56(v53, 1, v51);
      v58 = (uint64_t)v114;
      v37 = v54;
      v24 = v127;
      v25 = v50;
      v59 = v118;
      if (v57 != 1)
        goto LABEL_9;
      sub_1C128E2B0(v130, &qword_1ED78E3F0);
      v30 = v120;
    }
    else
    {
      sub_1C128E2EC(v52, (uint64_t)v38, &qword_1ED78E3F0);
      if (v56(v53, 1, v51) == 1)
      {
        v37 = v125;
        sub_1C128E2B0(v125, &qword_1ED78E3F0);
        sub_1C128E0A8((uint64_t)v38);
        v24 = v127;
        v25 = v50;
LABEL_9:
        sub_1C128E2B0(v130, &qword_1EF6D40B8);
        v30 = v120;
        goto LABEL_10;
      }
      v73 = v117;
      sub_1C127F380(v53, (uint64_t)v117);
      v74 = *v38;
      v75 = v38[1];
      v76 = v38[2];
      v77 = v38[3];
      v78 = v73[2];
      v79 = v73[3];
      v24 = v127;
      v25 = v55;
      if ((v74 != *v73 || v75 != v73[1]) && (sub_1C12B578C() & 1) == 0
        || (v76 != v78 || v77 != v79) && (sub_1C12B578C() & 1) == 0
        || (sub_1C12B5300() & 1) == 0)
      {
        sub_1C128E0A8((uint64_t)v117);
        v37 = v125;
        sub_1C128E2B0(v125, &qword_1ED78E3F0);
        v38 = v126;
        sub_1C128E0A8((uint64_t)v126);
        sub_1C128E2B0(v130, &qword_1ED78E3F0);
        v30 = v120;
        goto LABEL_10;
      }
      v80 = *(int *)(v123 + 24);
      v38 = v126;
      v81 = *((unsigned __int8 *)v126 + v80);
      v82 = *((unsigned __int8 *)v117 + v80);
      sub_1C128E0A8((uint64_t)v117);
      v83 = v125;
      sub_1C128E2B0(v125, &qword_1ED78E3F0);
      sub_1C128E0A8((uint64_t)v38);
      sub_1C128E2B0(v130, &qword_1ED78E3F0);
      v84 = v81 == v82;
      v37 = v83;
      v58 = (uint64_t)v114;
      v30 = v120;
      v59 = v118;
      if (!v84)
        goto LABEL_10;
    }
    v60 = *v30;
    v61 = v30[1];
    v62 = v30[3];
    v116 = v30[2];
    v63 = v112;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 16))(v58, v110, v59);
    v111 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v63 + 56);
    v111(v58, 0, 1, v59);
    v64 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v58, 1, v59);
    v115 = v61;
    if (v64 == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C128E2B0(v58, &qword_1ED78DBF8);
      v65 = v61;
      v66 = v113;
      swift_bridgeObjectRetain();
      v67 = v116;
      v116 = v62;
      v68 = sub_1C12892F0(v60, v65, v67, v62);
      LOBYTE(v65) = v69;
      swift_bridgeObjectRelease();
      if ((v65 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v131 = (_QWORD *)v66;
        v25 = v108;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1C128B940();
          v66 = (uint64_t)v131;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v71 = (uint64_t)v107;
        (*(void (**)(char *, unint64_t, uint64_t))(v112 + 32))(v107, *(_QWORD *)(v66 + 56) + *(_QWORD *)(v112 + 72) * v68, v59);
        v113 = v66;
        sub_1C128A834(v68, v66, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870]);
        swift_bridgeObjectRelease();
        v72 = 0;
      }
      else
      {
        v72 = 1;
        v71 = (uint64_t)v107;
        v25 = v108;
      }
      v111(v71, v72, 1, v59);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C128E2B0(v71, &qword_1ED78DBF8);
      v38 = v126;
    }
    else
    {
      v111 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v63 + 32);
      ((void (*)(char *, uint64_t, uint64_t))v111)(v109, v58, v59);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v85 = v113;
      v86 = swift_isUniquelyReferenced_nonNull_native();
      v131 = (_QWORD *)v85;
      v87 = v61;
      v88 = v60;
      v89 = v116;
      v90 = v62;
      v92 = sub_1C12892F0(v60, v87, v116, v62);
      v93 = *(_QWORD *)(v85 + 16);
      v94 = (v91 & 1) == 0;
      v95 = v93 + v94;
      if (__OFADD__(v93, v94))
        goto LABEL_54;
      v96 = v91;
      if (*(_QWORD *)(v85 + 24) >= v95)
      {
        v25 = v108;
        if ((v86 & 1) == 0)
          sub_1C128B940();
      }
      else
      {
        sub_1C1289430(v95, v86);
        v97 = sub_1C12892F0(v88, v115, v89, v62);
        v25 = v108;
        if ((v96 & 1) != (v98 & 1))
          goto LABEL_56;
        v92 = v97;
      }
      v99 = v118;
      v24 = v127;
      v100 = v131;
      if ((v96 & 1) != 0)
      {
        (*(void (**)(unint64_t, char *, uint64_t))(v112 + 40))(v131[7] + *(_QWORD *)(v112 + 72) * v92, v109, v118);
      }
      else
      {
        v131[(v92 >> 6) + 8] |= 1 << v92;
        v101 = (uint64_t *)(v100[6] + 32 * v92);
        v102 = v115;
        *v101 = v88;
        v101[1] = v102;
        v101[2] = v116;
        v101[3] = v90;
        ((void (*)(unint64_t, char *, uint64_t))v111)(v100[7] + *(_QWORD *)(v112 + 72) * v92, v109, v99);
        v103 = v100[2];
        v104 = __OFADD__(v103, 1);
        v105 = v103 + 1;
        if (v104)
          goto LABEL_55;
        v100[2] = v105;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      v113 = (unint64_t)v131;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v37 = v125;
      v38 = v126;
    }
LABEL_10:
    v39 = v129;
    sub_1C128E2B0((uint64_t)v24, &qword_1ED78E3F0);
    sub_1C128E0A8((uint64_t)v30);
    ++v36;
    v35 = v39 + v124;
    if (v128 == v121)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C128110C();
      return sub_1C1281800();
    }
  }
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  result = sub_1C12B57A4();
  __break(1u);
  return result;
}

uint64_t MetadataStore.recordMetadata(for:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v5 = *a1;
  v4 = a1[1];
  v7 = a1[2];
  v6 = a1[3];
  swift_beginAccess();
  v8 = *(_QWORD *)(v2 + 40);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_1C12892F0(v5, v4, v7, v6);
    if ((v10 & 1) != 0)
    {
      v11 = v9;
      v12 = *(_QWORD *)(v8 + 56);
      v13 = type metadata accessor for RecordMetadata(0);
      v14 = *(_QWORD *)(v13 - 8);
      sub_1C128E064(v12 + *(_QWORD *)(v14 + 72) * v11, a2);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
    }
    else
    {
      v17 = type metadata accessor for RecordMetadata(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a2, 1, 1, v17);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v15 = type metadata accessor for RecordMetadata(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
}

Swift::Void __swiftcall MetadataStore.purge()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;

  v1 = v0;
  if (qword_1ED78E810 != -1)
    swift_once();
  v2 = sub_1C12B5390();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED78DC40);
  v3 = sub_1C12B5384();
  v4 = sub_1C12B5540();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C127A000, v3, v4, "Purging metadata store records", v5, 2u);
    MEMORY[0x1C3BA9870](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = MEMORY[0x1E0DEE9E0];
  v1[5] = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[6] = v6;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[7] = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall MetadataStore.update(metadata:)(Swift::OpaquePointer metadata)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  char *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t);
  int v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  int v57;
  uint64_t *v58;
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
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[2];
  __int128 v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  void (*v90)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v91;
  char *v92;
  char *v93;
  uint64_t v94[4];

  v2 = v1;
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40B8);
  MEMORY[0x1E0C80A78](v87);
  v5 = (char *)v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v83 = (uint64_t)v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v78 - v10;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)v78 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)v78 - v15;
  v17 = type metadata accessor for RecordMetadata(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x1E0C80A78](v17);
  v81 = (_QWORD *)((char *)v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = MEMORY[0x1E0C80A78](v19);
  v86 = (uint64_t)v78 - v22;
  MEMORY[0x1E0C80A78](v21);
  v24 = (_QWORD *)((char *)v78 - v23);
  v25 = *((_QWORD *)metadata._rawValue + 2);
  if (v25)
  {
    v89 = v14;
    v84 = (uint64_t *)v11;
    v82 = v2;
    v26 = (uint64_t *)(v2 + 40);
    v27 = (char *)metadata._rawValue
        + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
    v78[0] = metadata._rawValue;
    swift_bridgeObjectRetain();
    v91 = v26;
    swift_beginAccess();
    v85 = v18;
    v88 = *(_QWORD *)(v18 + 72);
    *(_QWORD *)&v28 = 136446210;
    v79 = v28;
    v78[1] = MEMORY[0x1E0DEE9B8] + 8;
    v92 = v5;
    v93 = v16;
    v80 = v17;
    while (1)
    {
      sub_1C128E064((uint64_t)v27, (uint64_t)v24);
      if (qword_1ED78E810 != -1)
        swift_once();
      v29 = sub_1C12B5390();
      __swift_project_value_buffer(v29, (uint64_t)qword_1ED78DC40);
      v30 = v86;
      sub_1C128E064((uint64_t)v24, v86);
      v31 = sub_1C12B5384();
      v32 = sub_1C12B5540();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = swift_slowAlloc();
        v34 = swift_slowAlloc();
        v94[0] = v34;
        *(_DWORD *)v33 = v79;
        v35 = RecordMetadata.description.getter();
        *(_QWORD *)(v33 + 4) = sub_1C12882D0(v35, v36, v94);
        swift_bridgeObjectRelease();
        sub_1C128E0A8(v30);
        _os_log_impl(&dword_1C127A000, v31, v32, "Updating record metadata: %{public}s", (uint8_t *)v33, 0xCu);
        swift_arrayDestroy();
        v37 = v34;
        v5 = v92;
        MEMORY[0x1C3BA9870](v37, -1, -1);
        v38 = v33;
        v16 = v93;
        MEMORY[0x1C3BA9870](v38, -1, -1);
      }
      else
      {
        sub_1C128E0A8(v30);
      }

      v39 = *v91;
      if (*(_QWORD *)(*v91 + 16))
      {
        v41 = v24[2];
        v40 = v24[3];
        v43 = *v24;
        v42 = v24[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v44 = sub_1C12892F0(v43, v42, v41, v40);
        v45 = v25;
        if ((v46 & 1) != 0)
        {
          v16 = v93;
          sub_1C128E064(*(_QWORD *)(v39 + 56) + v44 * v88, (uint64_t)v93);
          v47 = v85;
          v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v85 + 56);
          v48(v16, 0, 1, v17);
        }
        else
        {
          v47 = v85;
          v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v85 + 56);
          v16 = v93;
          v48(v93, 1, 1, v17);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v49 = v47;
        swift_bridgeObjectRelease();
        v5 = v92;
      }
      else
      {
        v45 = v25;
        v49 = v85;
        v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v85 + 56);
        v48(v16, 1, 1, v17);
      }
      v50 = (uint64_t)v89;
      sub_1C128E064((uint64_t)v24, (uint64_t)v89);
      v90 = v48;
      v48((char *)v50, 0, 1, v17);
      v51 = (uint64_t)&v5[*(int *)(v87 + 48)];
      sub_1C128E2EC((uint64_t)v16, (uint64_t)v5, &qword_1ED78E3F0);
      sub_1C128E2EC(v50, v51, &qword_1ED78E3F0);
      v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48);
      if (v52((uint64_t)v5, 1, v17) == 1)
      {
        sub_1C128E2B0(v50, &qword_1ED78E3F0);
        v53 = v52(v51, 1, v17);
        v54 = &qword_1EF6D40B8;
        v55 = v45;
        if (v53 != 1)
          goto LABEL_31;
        sub_1C128E2B0((uint64_t)v5, &qword_1ED78E3F0);
      }
      else
      {
        v56 = v84;
        sub_1C128E2EC((uint64_t)v5, (uint64_t)v84, &qword_1ED78E3F0);
        v57 = v52(v51, 1, v17);
        v54 = &qword_1EF6D40B8;
        v55 = v45;
        if (v57 == 1)
          goto LABEL_30;
        v58 = v81;
        sub_1C127F380(v51, (uint64_t)v81);
        v59 = *v56;
        v60 = v56[1];
        v61 = v56[2];
        v62 = v56[3];
        v63 = *v58;
        v64 = v58[1];
        v65 = v58[2];
        v66 = v58[3];
        if ((v59 != v63 || v60 != v64) && (sub_1C12B578C() & 1) == 0
          || (v61 != v65 || v62 != v66) && (sub_1C12B578C() & 1) == 0
          || (sub_1C12B5300() & 1) == 0)
        {
          sub_1C128E0A8((uint64_t)v81);
          v54 = &qword_1ED78E3F0;
          v56 = v84;
LABEL_30:
          sub_1C128E2B0((uint64_t)v89, &qword_1ED78E3F0);
          sub_1C128E0A8((uint64_t)v56);
          v17 = v80;
LABEL_31:
          sub_1C128E2B0((uint64_t)v5, v54);
LABEL_32:
          v72 = v24[1];
          v73 = v24[2];
          v74 = v24[3];
          v94[0] = *v24;
          v71 = v94[0];
          v94[1] = v72;
          v94[2] = v73;
          v94[3] = v74;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C128598C(v94);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v75 = v83;
          sub_1C128E064((uint64_t)v24, v83);
          v90((char *)v75, 0, 1, v17);
          swift_beginAccess();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v76 = v73;
          v77 = v74;
          v5 = v92;
          v16 = v93;
          sub_1C12834D8(v75, v71, v72, v76, v77);
          swift_endAccess();
          goto LABEL_4;
        }
        v17 = v80;
        v67 = *(int *)(v80 + 24);
        v68 = (uint64_t)v84;
        v69 = *((unsigned __int8 *)v84 + v67);
        v70 = *((unsigned __int8 *)v81 + v67);
        sub_1C128E0A8((uint64_t)v81);
        sub_1C128E2B0((uint64_t)v89, &qword_1ED78E3F0);
        sub_1C128E0A8(v68);
        sub_1C128E2B0((uint64_t)v5, &qword_1ED78E3F0);
        v16 = v93;
        if (v69 != v70)
          goto LABEL_32;
      }
LABEL_4:
      sub_1C128E2B0((uint64_t)v16, &qword_1ED78E3F0);
      sub_1C128E0A8((uint64_t)v24);
      v27 += v88;
      v25 = v55 - 1;
      if (!v25)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
  }
}

uint64_t sub_1C128598C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v36;
  char v37;
  _QWORD *v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  _QWORD *v47;
  unint64_t v48;
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t result;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *a1;
  v7 = a1[1];
  v8 = (uint64_t *)(v1 + 48);
  v61 = a1[2];
  v62 = v6;
  v65 = a1[3];
  v66 = v7;
  swift_beginAccess();
  v9 = *(_QWORD *)(v1 + 48);
  v10 = *(_QWORD *)(v9 + 64);
  v59 = v9 + 64;
  v11 = 1 << *(_BYTE *)(v9 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v60 = (unint64_t)(v11 + 63) >> 6;
  v63 = v9;
  swift_bridgeObjectRetain();
  v14 = 0;
  v64 = v5;
  if (v13)
    goto LABEL_7;
LABEL_8:
  while (2)
  {
    v18 = v14 + 1;
    if (!__OFADD__(v14, 1))
    {
      if (v18 < v60)
      {
        v19 = *(_QWORD *)(v59 + 8 * v18);
        ++v14;
        if (v19)
          goto LABEL_21;
        v14 = v18 + 1;
        if (v18 + 1 >= v60)
          return swift_release();
        v19 = *(_QWORD *)(v59 + 8 * v14);
        if (v19)
          goto LABEL_21;
        v14 = v18 + 2;
        if (v18 + 2 >= v60)
          return swift_release();
        v19 = *(_QWORD *)(v59 + 8 * v14);
        if (v19)
        {
LABEL_21:
          v13 = (v19 - 1) & v19;
          for (i = __clz(__rbit64(v19)) + (v14 << 6); ; i = v16 | (v14 << 6))
          {
            v21 = (uint64_t *)(*(_QWORD *)(v63 + 48) + 16 * i);
            v22 = *v21;
            v23 = v21[1];
            v24 = *(_QWORD *)(*(_QWORD *)(v63 + 56) + 8 * i);
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            v25 = v66;
            swift_bridgeObjectRetain();
            v26 = v65;
            swift_bridgeObjectRetain();
            v27 = sub_1C12892F0(v62, v25, v61, v26);
            LOBYTE(v25) = v28;
            swift_bridgeObjectRelease();
            if ((v25 & 1) != 0)
            {
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v68 = v24;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_1C128B940();
                v24 = v68;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v30 = *(_QWORD *)(v24 + 56);
              v31 = sub_1C12B5324();
              v32 = *(_QWORD *)(v31 - 8);
              v33 = v30 + *(_QWORD *)(v32 + 72) * v27;
              v34 = v64;
              (*(void (**)(char *, uint64_t, uint64_t))(v32 + 32))(v64, v33, v31);
              sub_1C128A834(v27, v24, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870]);
              swift_bridgeObjectRelease();
              v35 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56);
              v5 = v34;
              v35(v34, 0, 1, v31);
            }
            else
            {
              v36 = sub_1C12B5324();
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v5, 1, 1, v36);
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1C128E2B0((uint64_t)v5, &qword_1ED78DBF8);
            if (*(_QWORD *)(v24 + 16))
              break;
            swift_bridgeObjectRelease();
            swift_beginAccess();
            swift_bridgeObjectRetain();
            v48 = sub_1C128939C(v22, v23);
            v50 = v49;
            swift_bridgeObjectRelease();
            if ((v50 & 1) != 0)
            {
              v51 = swift_isUniquelyReferenced_nonNull_native();
              v52 = *v8;
              v67 = (_QWORD *)*v8;
              *v8 = 0x8000000000000000;
              if ((v51 & 1) == 0)
              {
                sub_1C128C270(&qword_1EF6D40D0);
                v52 = (uint64_t)v67;
              }
              swift_bridgeObjectRelease();
              sub_1C128AC80(v48, v52);
              *v8 = v52;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
            swift_endAccess();
            if (!v13)
              goto LABEL_8;
LABEL_7:
            v16 = __clz(__rbit64(v13));
            v13 &= v13 - 1;
          }
          swift_beginAccess();
          v37 = swift_isUniquelyReferenced_nonNull_native();
          v67 = (_QWORD *)*v8;
          v38 = v67;
          *v8 = 0x8000000000000000;
          v40 = sub_1C128939C(v22, v23);
          v41 = v38[2];
          v42 = (v39 & 1) == 0;
          v43 = v41 + v42;
          if (__OFADD__(v41, v42))
          {
            __break(1u);
            break;
          }
          v44 = v39;
          if (v38[3] < v43)
          {
            sub_1C128A210(v43, v37, &qword_1EF6D40D0);
            v45 = sub_1C128939C(v22, v23);
            if ((v44 & 1) != (v46 & 1))
              goto LABEL_50;
            v40 = v45;
            v47 = v67;
            if ((v44 & 1) == 0)
              goto LABEL_39;
LABEL_5:
            v15 = v47[7];
            swift_bridgeObjectRelease();
            *(_QWORD *)(v15 + 8 * v40) = v24;
LABEL_6:
            *v8 = (uint64_t)v47;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_endAccess();
            v5 = v64;
            if (!v13)
              continue;
            goto LABEL_7;
          }
          if ((v37 & 1) != 0)
          {
            v47 = v67;
            if ((v39 & 1) != 0)
              goto LABEL_5;
          }
          else
          {
            sub_1C128C270(&qword_1EF6D40D0);
            v47 = v67;
            if ((v44 & 1) != 0)
              goto LABEL_5;
          }
LABEL_39:
          v47[(v40 >> 6) + 8] |= 1 << v40;
          v53 = (uint64_t *)(v47[6] + 16 * v40);
          *v53 = v22;
          v53[1] = v23;
          *(_QWORD *)(v47[7] + 8 * v40) = v24;
          v54 = v47[2];
          v55 = __OFADD__(v54, 1);
          v56 = v54 + 1;
          if (v55)
            goto LABEL_48;
          v47[2] = v56;
          swift_bridgeObjectRetain();
          goto LABEL_6;
        }
        v20 = v18 + 3;
        if (v20 < v60)
        {
          v19 = *(_QWORD *)(v59 + 8 * v20);
          if (v19)
          {
            v14 = v20;
            goto LABEL_21;
          }
          while (1)
          {
            v14 = v20 + 1;
            if (__OFADD__(v20, 1))
              goto LABEL_49;
            if (v14 >= v60)
              return swift_release();
            v19 = *(_QWORD *)(v59 + 8 * v14);
            ++v20;
            if (v19)
              goto LABEL_21;
          }
        }
      }
      return swift_release();
    }
    break;
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  result = sub_1C12B57A4();
  __break(1u);
  return result;
}

Swift::Bool __swiftcall MetadataStore.hasMetadata(for:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  char v4;
  char v5;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v1 + 48) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C128939C(countAndFlagsBits, (uint64_t)object);
    v5 = v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t MetadataStore.isValid(at:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  char v5;
  _QWORD v7[5];

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 40);
  v7[2] = a1;
  swift_bridgeObjectRetain();
  v4 = sub_1C1281FC4(sub_1C128E170, (char)v7, v3);
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
    v5 = 0;
  else
    v5 = sub_1C1286024(a1);
  return v5 & 1;
}

uint64_t sub_1C1286024(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  _QWORD v19[5];

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 48);
  v4 = v3 + 64;
  v5 = 1 << *(_BYTE *)(v3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v3 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v10++, 1))
      break;
    if (v10 >= v8)
      goto LABEL_23;
    v16 = *(_QWORD *)(v4 + 8 * v10);
    if (!v16)
    {
      v17 = v10 + 1;
      if (v10 + 1 >= v8)
        goto LABEL_23;
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (!v16)
      {
        v17 = v10 + 2;
        if (v10 + 2 >= v8)
          goto LABEL_23;
        v16 = *(_QWORD *)(v4 + 8 * v17);
        if (!v16)
        {
          v17 = v10 + 3;
          if (v10 + 3 >= v8)
          {
LABEL_23:
            v18 = 1;
            goto LABEL_24;
          }
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (!v16)
          {
            while (1)
            {
              v10 = v17 + 1;
              if (__OFADD__(v17, 1))
                goto LABEL_26;
              if (v10 >= v8)
                goto LABEL_23;
              v16 = *(_QWORD *)(v4 + 8 * v10);
              ++v17;
              if (v16)
                goto LABEL_17;
            }
          }
        }
      }
      v10 = v17;
    }
LABEL_17:
    v7 = (v16 - 1) & v16;
    v12 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_5:
    v13 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v12);
    MEMORY[0x1E0C80A78](result);
    v19[2] = a1;
    swift_bridgeObjectRetain();
    v14 = sub_1C1282284((uint64_t (*)(uint64_t))sub_1C128E260, (char)v19, v13);
    result = swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
    {
      v18 = 0;
LABEL_24:
      swift_release();
      return v18;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

Swift::Void __swiftcall MetadataStore.remove(pairedDeviceIdentifier:)(Swift::String pairedDeviceIdentifier)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8[3];

  object = pairedDeviceIdentifier._object;
  countAndFlagsBits = pairedDeviceIdentifier._countAndFlagsBits;
  if (qword_1ED78E810 != -1)
    swift_once();
  v3 = sub_1C12B5390();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED78DC40);
  swift_bridgeObjectRetain_n();
  v4 = sub_1C12B5384();
  v5 = sub_1C12B5540();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v8[0] = v7;
    *(_DWORD *)v6 = 136446210;
    swift_bridgeObjectRetain();
    sub_1C12882D0(countAndFlagsBits, (unint64_t)object, v8);
    sub_1C12B55DC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C127A000, v4, v5, "Removing paired device identifier: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v7, -1, -1);
    MEMORY[0x1C3BA9870](v6, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  sub_1C1289164(countAndFlagsBits, (uint64_t)object);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C1288FBC(countAndFlagsBits, (uint64_t)object, &qword_1EF6D40D0);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

Swift::Bool __swiftcall MetadataStore.hasPerformedInitialSync(for:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t object;
  uint64_t countAndFlagsBits;
  uint64_t v4;

  object = (uint64_t)a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 56);
  swift_bridgeObjectRetain();
  LOBYTE(object) = sub_1C1286488(countAndFlagsBits, object, v4);
  swift_bridgeObjectRelease();
  return object & 1;
}

uint64_t sub_1C1286488(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1C12B57E0();
    sub_1C12B54B0();
    v6 = sub_1C12B5804();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1C12B578C() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1C12B578C() & 1) != 0)
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

Swift::Void __swiftcall MetadataStore.setPerformedInitialSync(for:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11[3];
  uint64_t v12;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 56);
  swift_bridgeObjectRetain();
  v5 = sub_1C1286488(countAndFlagsBits, (uint64_t)object, v4);
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v6 = sub_1C12B5390();
    __swift_project_value_buffer(v6, (uint64_t)qword_1ED78DC40);
    swift_bridgeObjectRetain_n();
    v7 = sub_1C12B5384();
    v8 = sub_1C12B5540();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v11[0] = v10;
      *(_DWORD *)v9 = 136446210;
      swift_bridgeObjectRetain();
      v12 = sub_1C12882D0(countAndFlagsBits, (unint64_t)object, v11);
      sub_1C12B55DC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C127A000, v7, v8, "Adding paired device identifier: %{public}s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v10, -1, -1);
      MEMORY[0x1C3BA9870](v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1C1288960(&v12, countAndFlagsBits, (uint64_t)object);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall MetadataStore.forget(recordID:)(SessionSyncEngine::RecordID recordID)
{
  uint64_t *countAndFlagsBits;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10[4];

  countAndFlagsBits = (uint64_t *)recordID.identifier._countAndFlagsBits;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *countAndFlagsBits;
  v6 = countAndFlagsBits[1];
  v8 = countAndFlagsBits[2];
  v7 = countAndFlagsBits[3];
  v10[0] = v5;
  v10[1] = v6;
  v10[2] = v8;
  v10[3] = v7;
  sub_1C128598C(v10);
  v9 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C12834D8((uint64_t)v4, v5, v6, v8, v7);
  swift_endAccess();
}

uint64_t sub_1C12868D8()
{
  uint64_t v0;
  uint64_t v1;

  swift_retain();
  v0 = swift_bridgeObjectRetain();
  v1 = sub_1C128D260(v0);
  swift_bridgeObjectRelease();
  swift_release();
  return v1;
}

uint64_t sub_1C128693C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_1C128D72C(v2, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_1C12825DC(v3);
  swift_release();
  return v4;
}

uint64_t sub_1C12869D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1C12869E8(a1, a2, a3, a4, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1C128D8E0);
}

uint64_t sub_1C12869DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1C12869E8(a1, a2, a3, a4, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1C128DB78);
}

uint64_t sub_1C12869E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = *v5;
  swift_beginAccess();
  swift_retain();
  swift_bridgeObjectRetain();
  v10 = swift_bridgeObjectRetain();
  v11 = sub_1C128DE10(v10, v9, a1, a2, a5);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v12 = sub_1C12825DC(v11);
  swift_release();
  return v12;
}

uint64_t sub_1C1286AA8(uint64_t a1, uint64_t a2)
{
  return MetadataStore.set(lastModifiedDate:for:)(a1, a2);
}

uint64_t sub_1C1286AC8(uint64_t a1, uint64_t a2)
{
  return MetadataStore.set(deletedDate:for:)(a1, a2);
}

uint64_t sub_1C1286AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MetadataStore.set(syncDate:for:pairedDeviceIdentifier:)(a1, a2, a3, a4);
}

uint64_t sub_1C1286B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MetadataStore.set(syncDate:forRecordsMatching:pairedDeviceIdentifier:)(a1, a2, a3, a4);
}

uint64_t sub_1C1286B28@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return MetadataStore.recordMetadata(for:)(a1, a2);
}

void sub_1C1286B48()
{
  MetadataStore.purge()();
}

void sub_1C1286B68(Swift::OpaquePointer a1)
{
  MetadataStore.update(metadata:)(a1);
}

BOOL sub_1C1286B88(uint64_t a1, uint64_t a2)
{
  return MetadataStore.hasMetadata(for:)(*(Swift::String *)&a1);
}

uint64_t sub_1C1286BAC()
{
  sub_1C128110C();
  return sub_1C1281800();
}

uint64_t sub_1C1286BD0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  _QWORD v8[5];

  v3 = *v1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 40);
  v8[2] = a1;
  swift_bridgeObjectRetain();
  v5 = sub_1C1281FC4(sub_1C128E374, (char)v8, v4);
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = sub_1C1286024(a1);
  return v6 & 1;
}

void sub_1C1286C60(uint64_t a1, uint64_t a2)
{
  MetadataStore.remove(pairedDeviceIdentifier:)(*(Swift::String *)&a1);
}

uint64_t sub_1C1286C80(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *a1;
  v6 = a1[1];
  v8 = a1[2];
  v7 = a1[3];
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = v8;
  v11[3] = v7;
  sub_1C128598C(v11);
  v9 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C12834D8((uint64_t)v4, v5, v6, v8, v7);
  return swift_endAccess();
}

uint64_t sub_1C1286D74(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *v2;
  swift_beginAccess();
  v6 = *(_QWORD *)(v5 + 56);
  swift_bridgeObjectRetain();
  LOBYTE(a2) = sub_1C1286488(a1, a2, v6);
  swift_bridgeObjectRelease();
  return a2 & 1;
}

void sub_1C1286DE8(uint64_t a1, uint64_t a2)
{
  MetadataStore.setPerformedInitialSync(for:)(*(Swift::String *)&a1);
}

uint64_t sub_1C1286E08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = MEMORY[0x1E0DEE9E8];
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 56);
  v2 = v1 + 56;
  v3 = 1 << *(_BYTE *)(v1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v1 + 56);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  if (v5)
    goto LABEL_6;
LABEL_7:
  v11 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v11 < v6)
    {
      v12 = *(_QWORD *)(v2 + 8 * v11);
      ++v8;
      if (v12)
        goto LABEL_20;
      v8 = v11 + 1;
      if (v11 + 1 >= v6)
        goto LABEL_24;
      v12 = *(_QWORD *)(v2 + 8 * v8);
      if (v12)
        goto LABEL_20;
      v8 = v11 + 2;
      if (v11 + 2 >= v6)
        goto LABEL_24;
      v12 = *(_QWORD *)(v2 + 8 * v8);
      if (v12)
      {
LABEL_20:
        v5 = (v12 - 1) & v12;
        for (i = __clz(__rbit64(v12)) + (v8 << 6); ; i = v9 | (v8 << 6))
        {
          v14 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * i);
          v16 = *v14;
          v15 = v14[1];
          swift_bridgeObjectRetain();
          if ((sub_1C1287564(v16, v15) & 1) != 0)
          {
            sub_1C1288960(&v17, v16, v15);
            result = swift_bridgeObjectRelease();
            if (!v5)
              goto LABEL_7;
          }
          else
          {
            result = swift_bridgeObjectRelease();
            if (!v5)
              goto LABEL_7;
          }
LABEL_6:
          v9 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      v13 = v11 + 3;
      if (v13 < v6)
      {
        v12 = *(_QWORD *)(v2 + 8 * v13);
        if (v12)
        {
          v8 = v13;
          goto LABEL_20;
        }
        while (1)
        {
          v8 = v13 + 1;
          if (__OFADD__(v13, 1))
            goto LABEL_26;
          if (v8 >= v6)
            break;
          v12 = *(_QWORD *)(v2 + 8 * v8);
          ++v13;
          if (v12)
            goto LABEL_20;
        }
      }
    }
LABEL_24:
    swift_release();
    return v18;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1C1286FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t result;
  int64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = MEMORY[0x1E0DEE9E8];
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 56);
  v2 = v1 + 56;
  v3 = 1 << *(_BYTE *)(v1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v1 + 56);
  v6 = (uint64_t *)(v0 + 48);
  v28 = v0;
  swift_bridgeObjectRetain();
  swift_beginAccess();
  result = swift_beginAccess();
  v8 = 0;
  v9 = (unint64_t)(v3 + 63) >> 6;
  v26 = (uint64_t *)(v0 + 48);
  v27 = v1 + 56;
  v25 = v9;
  while (v5)
  {
    v10 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    v11 = v10 | (v8 << 6);
LABEL_18:
    v15 = *v6;
    if (*(_QWORD *)(*v6 + 16))
    {
      v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v19 = sub_1C128939C(v18, v17);
      if ((v20 & 1) != 0)
      {
        v21 = v1;
        v22 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v19);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v23 = *(_QWORD *)(v28 + 40);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v24 = sub_1C128CC54(0, v23, v22);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        if (*(_QWORD *)(v28 + 32) < v24)
          sub_1C1288960(&v29, v18, v17);
        result = swift_bridgeObjectRelease();
        v1 = v21;
        v6 = v26;
        v2 = v27;
        v9 = v25;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        result = swift_bridgeObjectRelease();
      }
    }
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v8 >= v9)
    goto LABEL_27;
  v13 = *(_QWORD *)(v2 + 8 * v8);
  if (v13)
  {
LABEL_17:
    v5 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v8 << 6);
    goto LABEL_18;
  }
  v14 = v8 + 1;
  if (v8 + 1 >= v9)
    goto LABEL_27;
  v13 = *(_QWORD *)(v2 + 8 * v14);
  if (v13)
    goto LABEL_16;
  v14 = v8 + 2;
  if (v8 + 2 >= v9)
    goto LABEL_27;
  v13 = *(_QWORD *)(v2 + 8 * v14);
  if (v13)
    goto LABEL_16;
  v14 = v8 + 3;
  if (v8 + 3 >= v9)
  {
LABEL_27:
    swift_release();
    return v30;
  }
  v13 = *(_QWORD *)(v2 + 8 * v14);
  if (v13)
  {
LABEL_16:
    v8 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    v8 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v8 >= v9)
      goto LABEL_27;
    v13 = *(_QWORD *)(v2 + 8 * v8);
    ++v14;
    if (v13)
      goto LABEL_17;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1C128725C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t result;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t i;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = MEMORY[0x1E0DEE9E8];
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 48);
  v27 = v1 + 64;
  v2 = 1 << *(_BYTE *)(v1 + 32);
  if (v2 < 64)
    v3 = ~(-1 << v2);
  else
    v3 = -1;
  v4 = v3 & *(_QWORD *)(v1 + 64);
  v5 = (uint64_t *)(v0 + 56);
  swift_bridgeObjectRetain();
  result = swift_beginAccess();
  v7 = 0;
  v28 = (unint64_t)(v2 + 63) >> 6;
  if (v4)
    goto LABEL_21;
LABEL_7:
  v8 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v8 < v28)
    {
      v9 = *(_QWORD *)(v27 + 8 * v8);
      ++v7;
      if (v9)
        goto LABEL_20;
      v7 = v8 + 1;
      if (v8 + 1 >= v28)
        goto LABEL_42;
      v9 = *(_QWORD *)(v27 + 8 * v7);
      if (v9)
        goto LABEL_20;
      v7 = v8 + 2;
      if (v8 + 2 >= v28)
        goto LABEL_42;
      v9 = *(_QWORD *)(v27 + 8 * v7);
      if (v9)
      {
LABEL_20:
        v4 = (v9 - 1) & v9;
        for (i = __clz(__rbit64(v9)) + (v7 << 6); ; i = v12 | (v7 << 6))
        {
          v13 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * i);
          v15 = *v13;
          v14 = v13[1];
          v16 = *v5;
          if (*(_QWORD *)(*v5 + 16))
          {
            sub_1C12B57E0();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1C12B54B0();
            v17 = sub_1C12B5804();
            v18 = -1 << *(_BYTE *)(v16 + 32);
            v19 = v17 & ~v18;
            if (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
            {
              v20 = v1;
              v21 = *(_QWORD *)(v16 + 48);
              v22 = (_QWORD *)(v21 + 16 * v19);
              v23 = *v22 == v15 && v22[1] == v14;
              if (v23 || (sub_1C12B578C() & 1) != 0)
              {
LABEL_6:
                swift_bridgeObjectRelease();
                result = swift_bridgeObjectRelease();
                v1 = v20;
                v5 = (uint64_t *)(v0 + 56);
                if (!v4)
                  goto LABEL_7;
                goto LABEL_21;
              }
              v24 = ~v18;
              while (1)
              {
                v19 = (v19 + 1) & v24;
                if (((*(_QWORD *)(v16 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
                  break;
                v25 = (_QWORD *)(v21 + 16 * v19);
                v26 = *v25 == v15 && v25[1] == v14;
                if (v26 || (sub_1C12B578C() & 1) != 0)
                  goto LABEL_6;
              }
              swift_bridgeObjectRelease();
              v1 = v20;
              v5 = (uint64_t *)(v0 + 56);
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_bridgeObjectRetain();
          }
          sub_1C1288960(&v29, v15, v14);
          result = swift_bridgeObjectRelease();
          if (!v4)
            goto LABEL_7;
LABEL_21:
          v12 = __clz(__rbit64(v4));
          v4 &= v4 - 1;
        }
      }
      v10 = v8 + 3;
      if (v10 < v28)
      {
        v9 = *(_QWORD *)(v27 + 8 * v10);
        if (v9)
        {
          v7 = v10;
          goto LABEL_20;
        }
        while (1)
        {
          v7 = v10 + 1;
          if (__OFADD__(v10, 1))
            goto LABEL_44;
          if (v7 >= v28)
            break;
          v9 = *(_QWORD *)(v27 + 8 * v7);
          ++v10;
          if (v9)
            goto LABEL_20;
        }
      }
    }
LABEL_42:
    swift_release();
    return v30;
  }
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_1C1287564(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t result;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  unint64_t v54;
  void (*v55)(char *, unint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  int v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char v62;
  void (*v63)(char *, uint64_t);
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  int64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  unint64_t v77;
  uint64_t v78;

  v5 = sub_1C12B5324();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v71 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v70 = (char *)&v64 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v10);
  v76 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = type metadata accessor for RecordMetadata(0);
  v74 = *(_QWORD *)(v69 - 8);
  MEMORY[0x1E0C80A78](v69);
  v78 = (uint64_t)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E800);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (unint64_t *)((char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v14);
  v18 = (uint64_t *)((char *)&v64 - v17);
  swift_beginAccess();
  v72 = v2;
  v19 = *(_QWORD *)(v2 + 48);
  if (!*(_QWORD *)(v19 + 16))
    return 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = sub_1C128939C(a1, a2);
  if ((v21 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  v75 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22 = v72;
  swift_beginAccess();
  v23 = *(_QWORD *)(v22 + 40);
  v24 = *(_QWORD *)(v23 + 64);
  v67 = v23 + 64;
  v25 = 1 << *(_BYTE *)(v23 + 32);
  v26 = -1;
  if (v25 < 64)
    v26 = ~(-1 << v25);
  v27 = v26 & v24;
  v28 = (unint64_t)(v25 + 63) >> 6;
  v64 = v28 - 1;
  result = swift_bridgeObjectRetain();
  v30 = 0;
  v68 = v28;
  v73 = result;
  v65 = result + 104;
  v66 = v28 - 5;
  while (1)
  {
    if (v27)
    {
      v31 = __clz(__rbit64(v27));
      v27 &= v27 - 1;
      v77 = v30;
      v32 = v31 | (v30 << 6);
      goto LABEL_9;
    }
    v40 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v40 >= v68)
    {
      v42 = v30;
    }
    else
    {
      v41 = *(_QWORD *)(v67 + 8 * v40);
      if (v41)
        goto LABEL_13;
      v42 = v30 + 1;
      if ((uint64_t)(v30 + 2) < v68)
      {
        v41 = *(_QWORD *)(v67 + 8 * (v30 + 2));
        if (v41)
        {
          v40 = v30 + 2;
          goto LABEL_13;
        }
        v42 = v30 + 2;
        if ((uint64_t)(v30 + 3) < v68)
        {
          v41 = *(_QWORD *)(v67 + 8 * (v30 + 3));
          if (v41)
          {
            v40 = v30 + 3;
LABEL_13:
            v27 = (v41 - 1) & v41;
            v32 = __clz(__rbit64(v41)) + (v40 << 6);
            v77 = v40;
LABEL_9:
            v33 = *(_QWORD *)(v73 + 56);
            v34 = (_QWORD *)(*(_QWORD *)(v73 + 48) + 32 * v32);
            v35 = v34[1];
            v36 = v34[2];
            v37 = v34[3];
            *v16 = *v34;
            v16[1] = v35;
            v16[2] = v36;
            v16[3] = v37;
            v38 = v33 + *(_QWORD *)(v74 + 72) * v32;
            v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E7F8);
            sub_1C128E064(v38, (uint64_t)v16 + *(int *)(v39 + 48));
            (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v16, 0, 1, v39);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_16;
          }
          v40 = v30 + 4;
          v42 = v30 + 3;
          if ((uint64_t)(v30 + 4) < v68)
          {
            v41 = *(_QWORD *)(v67 + 8 * v40);
            if (v41)
              goto LABEL_13;
            while (v66 != v30)
            {
              v41 = *(_QWORD *)(v65 + 8 * v30++);
              if (v41)
              {
                v40 = v30 + 4;
                goto LABEL_13;
              }
            }
            v42 = v64;
          }
        }
      }
    }
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E7F8);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v16, 1, 1, v43);
    v27 = 0;
    v77 = v42;
LABEL_16:
    sub_1C128E330((uint64_t)v16, (uint64_t)v18, &qword_1ED78E800);
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E7F8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 48))(v18, 1, v44) == 1)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return 0;
    }
    v45 = v5;
    v46 = v6;
    v47 = *v18;
    v48 = v18[1];
    v50 = v18[2];
    v49 = v18[3];
    sub_1C127F380((uint64_t)v18 + *(int *)(v44 + 48), v78);
    v51 = v75;
    if (*(_QWORD *)(v75 + 16) && (v52 = sub_1C12892F0(v47, v48, v50, v49), (v53 & 1) != 0))
    {
      v6 = v46;
      v54 = *(_QWORD *)(v51 + 56) + *(_QWORD *)(v46 + 72) * v52;
      v55 = *(void (**)(char *, unint64_t, uint64_t))(v46 + 16);
      v5 = v45;
      v55(v76, v54, v45);
      v56 = 0;
    }
    else
    {
      v56 = 1;
      v6 = v46;
      v5 = v45;
    }
    v57 = (uint64_t)v76;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v76, v56, 1, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v58 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v57, 1, v5);
    sub_1C128E2B0(v57, &qword_1ED78DBF8);
    if (v58 == 1)
    {
      v59 = v70;
      v60 = v78;
      sub_1C12B52C4();
      v61 = v71;
      sub_1C12B530C();
      v62 = sub_1C12B52DC();
      v63 = *(void (**)(char *, uint64_t))(v6 + 8);
      v63(v61, v5);
      v63(v59, v5);
      result = sub_1C128E0A8(v60);
      v30 = v77;
      if ((v62 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_release();
        return 1;
      }
    }
    else
    {
      result = sub_1C128E0A8(v78);
      v30 = v77;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C1287B38(uint64_t *a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  int v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v4);
  v62 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C12B5324();
  v59 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x1E0C80A78](v6);
  v58 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v57 = (char *)&v53 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for RecordMetadata(0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v56 = (uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *a1;
  v17 = a1[1];
  v19 = a1[2];
  v18 = a1[3];
  swift_beginAccess();
  v20 = v2[5];
  if (!*(_QWORD *)(v20 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_7:
    sub_1C128E2B0((uint64_t)v12, &qword_1ED78E3F0);
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v54 = v18;
  v55 = v16;
  v21 = sub_1C12892F0(v16, v17, v19, v18);
  if ((v22 & 1) != 0)
  {
    sub_1C128E064(*(_QWORD *)(v20 + 56) + *(_QWORD *)(v14 + 72) * v21, (uint64_t)v12);
    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  v24 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v23, 1, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    goto LABEL_7;
  sub_1C127F380((uint64_t)v12, v56);
  sub_1C12B530C();
  sub_1C12B52C4();
  if ((sub_1C12B52D0() & 1) == 0)
  {
    v25 = 0;
LABEL_42:
    v52 = *(void (**)(char *, uint64_t))(v59 + 8);
    v52(v58, v6);
    v52(v57, v6);
    sub_1C128E0A8(v56);
    return v25;
  }
  v53 = v19;
  swift_beginAccess();
  v26 = v2[7];
  v27 = *(_QWORD *)(v26 + 56);
  v60 = v26;
  v61 = v26 + 56;
  v28 = 1 << *(_BYTE *)(v26 + 32);
  v29 = -1;
  if (v28 < 64)
    v29 = ~(-1 << v28);
  v30 = v29 & v27;
  v31 = v2 + 6;
  swift_bridgeObjectRetain();
  result = swift_beginAccess();
  v33 = 0;
  v62 = (char *)((unint64_t)(v28 + 63) >> 6);
  v34 = v54;
  while (v30)
  {
    v35 = __clz(__rbit64(v30));
    v30 &= v30 - 1;
    v36 = v35 | (v33 << 6);
LABEL_29:
    v40 = *v31;
    if (*(_QWORD *)(*v31 + 16))
    {
      v41 = v6;
      v42 = (uint64_t *)(*(_QWORD *)(v60 + 48) + 16 * v36);
      v43 = *v42;
      v44 = v42[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v45 = sub_1C128939C(v43, v44);
      if ((v46 & 1) != 0)
      {
        v47 = *(_QWORD *)(*(_QWORD *)(v40 + 56) + 8 * v45);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v47 + 16))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v48 = sub_1C12892F0(v55, v17, v53, v34);
          v6 = v41;
          v50 = v59;
          if ((v49 & 1) != 0)
          {
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v59 + 16))(v24, *(_QWORD *)(v47 + 56) + *(_QWORD *)(v59 + 72) * v48, v41);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v50 + 56))(v24, 0, 1, v41);
          }
          else
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v24, 1, 1, v41);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          v50 = v59;
          v6 = v41;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v24, 1, 1, v41);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v24, 1, v6);
        result = sub_1C128E2B0(v24, &qword_1ED78DBF8);
        if (v51 == 1)
        {
          v25 = 0;
LABEL_41:
          swift_release();
          goto LABEL_42;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v6 = v41;
      }
    }
  }
  v37 = v33 + 1;
  if (__OFADD__(v33, 1))
  {
    __break(1u);
    goto LABEL_45;
  }
  if (v37 >= (uint64_t)v62)
    goto LABEL_40;
  v38 = *(_QWORD *)(v61 + 8 * v37);
  ++v33;
  if (v38)
    goto LABEL_28;
  v33 = v37 + 1;
  if (v37 + 1 >= (uint64_t)v62)
    goto LABEL_40;
  v38 = *(_QWORD *)(v61 + 8 * v33);
  if (v38)
    goto LABEL_28;
  v33 = v37 + 2;
  if (v37 + 2 >= (uint64_t)v62)
    goto LABEL_40;
  v38 = *(_QWORD *)(v61 + 8 * v33);
  if (v38)
  {
LABEL_28:
    v30 = (v38 - 1) & v38;
    v36 = __clz(__rbit64(v38)) + (v33 << 6);
    goto LABEL_29;
  }
  v39 = v37 + 3;
  if (v39 >= (uint64_t)v62)
  {
LABEL_40:
    v25 = 1;
    goto LABEL_41;
  }
  v38 = *(_QWORD *)(v61 + 8 * v39);
  if (v38)
  {
    v33 = v39;
    goto LABEL_28;
  }
  while (1)
  {
    v33 = v39 + 1;
    if (__OFADD__(v39, 1))
      break;
    if (v33 >= (uint64_t)v62)
      goto LABEL_40;
    v38 = *(_QWORD *)(v61 + 8 * v33);
    ++v39;
    if (v38)
      goto LABEL_28;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_1C12880D8(uint64_t a1)
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
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD v18[2];

  v2 = sub_1C12B5324();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E7F8);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(int *)(v7 + 48);
  v11 = (uint64_t)&v9[v10];
  v12 = a1 + v10;
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)v9 = *(_OWORD *)a1;
  *((_QWORD *)v9 + 2) = v13;
  *((_QWORD *)v9 + 3) = v14;
  sub_1C128E064(v12, v11);
  v15 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11 + *(int *)(v15 + 20), v2);
  sub_1C128E0A8(v11);
  v16 = sub_1C12B52D0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v16 & 1;
}

uint64_t sub_1C12881FC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_1C1288230(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1C1288240(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C1288260(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1C12882D0(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1C12B55DC();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1C12882D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1C12883A0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C128E220((uint64_t)v12, *a3);
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
      sub_1C128E220((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1C12883A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C12B55E8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1C1288558(a5, a6);
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
  v8 = sub_1C12B569C();
  if (!v8)
  {
    sub_1C12B56B4();
    __break(1u);
LABEL_17:
    result = sub_1C12B56FC();
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

uint64_t sub_1C1288558(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C12885EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1C12887C4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1C12887C4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C12885EC(uint64_t a1, unint64_t a2)
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
      v3 = sub_1C1288760(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1C12B566C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1C12B56B4();
      __break(1u);
LABEL_10:
      v2 = sub_1C12B54C8();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1C12B56FC();
    __break(1u);
LABEL_14:
    result = sub_1C12B56B4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1C1288760(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DC88);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C12887C4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DC88);
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
  result = sub_1C12B56FC();
  __break(1u);
  return result;
}

uint64_t sub_1C1288910(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5;
  uint64_t result;

  a4();
  v5 = *a1 + 8;
  result = sub_1C12B55DC();
  *a1 = v5;
  return result;
}

uint64_t sub_1C1288960(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  v8 = sub_1C12B5804();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1C12B578C() & 1) != 0)
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
      if (v19 || (sub_1C12B578C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1C128C5D0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1C1288B0C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v28;
  uint64_t v30;

  v10 = *v5;
  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  v11 = sub_1C12B5804();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v15 = ~v12;
    v16 = *(_QWORD *)(v10 + 48);
    while (1)
    {
      v17 = (_QWORD *)(v16 + 32 * v13);
      v18 = v17[2];
      v19 = v17[3];
      v20 = *v17 == a2 && v17[1] == a3;
      if (v20 || (sub_1C12B578C() & 1) != 0)
      {
        v21 = v18 == a4 && v19 == a5;
        if (v21 || (sub_1C12B578C() & 1) != 0)
          break;
      }
      v13 = (v13 + 1) & v15;
      if (((*(_QWORD *)(v14 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
        goto LABEL_15;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = (uint64_t *)(*(_QWORD *)(*v28 + 48) + 32 * v13);
    v23 = v22[1];
    v24 = v22[2];
    v25 = v22[3];
    *a1 = *v22;
    a1[1] = v23;
    a1[2] = v24;
    a1[3] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *v28;
    *v28 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C128C768(a2, a3, a4, a5, v13, isUniquelyReferenced_nonNull_native);
    *v28 = v30;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    result = 1;
    a1[2] = a4;
    a1[3] = a5;
  }
  return result;
}

uint64_t sub_1C1288D30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v6;
  unint64_t v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v6 = v5;
  swift_bridgeObjectRetain();
  v12 = sub_1C12892F0(a1, a2, a3, a4);
  LOBYTE(a4) = v13;
  swift_bridgeObjectRelease();
  if ((a4 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v6;
    v21 = *v6;
    *v6 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C128BBC8();
      v15 = v21;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(v15 + 56);
    v17 = type metadata accessor for RecordMetadata(0);
    v18 = *(_QWORD *)(v17 - 8);
    sub_1C127F380(v16 + *(_QWORD *)(v18 + 72) * v12, a5);
    sub_1C128A834(v12, v15, type metadata accessor for RecordMetadata);
    *v6 = v15;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a5, 0, 1, v17);
  }
  else
  {
    v20 = type metadata accessor for RecordMetadata(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a5, 1, 1, v20);
  }
}

uint64_t sub_1C1288E80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1C128939C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C128C008();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_1C12B5324();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a3, v12 + *(_QWORD *)(v14 + 72) * v8, v13);
    sub_1C128AA80(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = sub_1C12B5324();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_1C1288FB0(uint64_t a1, uint64_t a2)
{
  return sub_1C1288FBC(a1, a2, &qword_1EF6D40C8);
}

uint64_t sub_1C1288FBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1C128939C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v5;
  v14 = *v5;
  *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C128C270(a3);
    v11 = v14;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_1C128AC80(v8, v11);
  *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1C1289098(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1C128939C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C128C41C();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1C128AC80(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C1289164(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  v6 = sub_1C12B5804();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1C12B578C() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1C12B578C() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C12ADF28();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_1C12AF868(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1C12892F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  v8 = sub_1C12B5804();
  return sub_1C128B6A0(a1, a2, a3, a4, v8);
}

unint64_t sub_1C128939C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C12B57E0();
  sub_1C12B54B0();
  v4 = sub_1C12B5804();
  return sub_1C128B79C(a1, a2, v4);
}

unint64_t sub_1C1289400(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C12B5618();
  return sub_1C128B87C(a1, v2);
}

uint64_t sub_1C1289430(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  int64_t v43;
  _QWORD *v44;
  uint64_t i;
  int v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;

  v3 = v2;
  v49 = sub_1C12B5324();
  v47 = *(_QWORD *)(v49 - 8);
  MEMORY[0x1E0C80A78](v49);
  v48 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40E0);
  v46 = a2;
  v7 = sub_1C12B56E4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_41;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 64);
  v44 = (_QWORD *)(v6 + 64);
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v42 = v2;
  v43 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain();
  v15 = 0;
  v16 = v47;
  for (i = v6; ; v6 = i)
  {
    if (v12)
    {
      v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v20 = v19 | (v15 << 6);
      goto LABEL_22;
    }
    v21 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v43)
      break;
    v22 = v44;
    v23 = v44[v21];
    ++v15;
    if (!v23)
    {
      v15 = v21 + 1;
      if (v21 + 1 >= v43)
        goto LABEL_34;
      v23 = v44[v15];
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v43)
        {
LABEL_34:
          swift_release();
          v3 = v42;
          if ((v46 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = v44[v24];
        if (!v23)
        {
          while (1)
          {
            v15 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v15 >= v43)
              goto LABEL_34;
            v23 = v44[v15];
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v15 = v24;
      }
    }
LABEL_21:
    v12 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v15 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v6 + 56);
    v26 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 32 * v20);
    v28 = *v26;
    v27 = v26[1];
    v30 = v26[2];
    v29 = v26[3];
    v31 = *(_QWORD *)(v16 + 72);
    v32 = v25 + v31 * v20;
    if ((v46 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v48, v32, v49);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v48, v32, v49);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1C12B57E0();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    result = sub_1C12B5804();
    v33 = -1 << *(_BYTE *)(v8 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v13 + 8 * (v34 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v13 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      v16 = v47;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      v16 = v47;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v13 + 8 * v35);
      }
      while (v39 == -1);
      v17 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 32 * v17);
    *v18 = v28;
    v18[1] = v27;
    v18[2] = v30;
    v18[3] = v29;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v16 + 32))(*(_QWORD *)(v8 + 56) + v31 * v17, v48, v49);
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v3 = v42;
  v22 = v44;
  if ((v46 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v40 = 1 << *(_BYTE *)(v6 + 32);
  if (v40 >= 64)
    bzero(v22, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v40;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t sub_1C12897F8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t i;
  uint64_t v44;
  int v45;
  uint64_t v46;

  v3 = v2;
  v5 = type metadata accessor for RecordMetadata(0);
  v44 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v46 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DC00);
  v45 = a2;
  v8 = sub_1C12B56E4();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    for (i = v7; ; v7 = i)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v45 & 1) != 0)
              {
                v39 = 1 << *(_BYTE *)(v7 + 32);
                if (v39 >= 64)
                  bzero(v42, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v39;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 32 * v20);
      v26 = *v25;
      v27 = v25[1];
      v29 = v25[2];
      v28 = v25[3];
      v30 = *(_QWORD *)(v44 + 72);
      v31 = v24 + v30 * v20;
      if ((v45 & 1) != 0)
      {
        sub_1C127F380(v31, v46);
      }
      else
      {
        sub_1C128E064(v31, v46);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_1C12B57E0();
      swift_bridgeObjectRetain();
      sub_1C12B54B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C12B54B0();
      swift_bridgeObjectRelease();
      result = sub_1C12B5804();
      v32 = -1 << *(_BYTE *)(v9 + 32);
      v33 = result & ~v32;
      v34 = v33 >> 6;
      if (((-1 << v33) & ~*(_QWORD *)(v14 + 8 * (v33 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v14 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v35 = 0;
        v36 = (unint64_t)(63 - v32) >> 6;
        do
        {
          if (++v34 == v36 && (v35 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v37 = v34 == v36;
          if (v34 == v36)
            v34 = 0;
          v35 |= v37;
          v38 = *(_QWORD *)(v14 + 8 * v34);
        }
        while (v38 == -1);
        v17 = __clz(__rbit64(~v38)) + (v34 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 32 * v17);
      *v18 = v26;
      v18[1] = v27;
      v18[2] = v29;
      v18[3] = v28;
      result = sub_1C127F380(v46, *(_QWORD *)(v9 + 56) + v30 * v17);
      ++*(_QWORD *)(v9 + 16);
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_1C1289B94(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40C0);
  v6 = sub_1C12B56E4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_1C128E210((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1C128E1A0(v25, (uint64_t)&v38);
      sub_1C128E220(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_1C12B5618();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_1C128E210(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C1289EA8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_1C12B5324();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D44C0);
  v43 = a2;
  v8 = sub_1C12B56E4();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_1C12B57E0();
      sub_1C12B54B0();
      result = sub_1C12B5804();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_1C128A210(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
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
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v37 = a2;
  v7 = sub_1C12B56E4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v35)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1C12B57E0();
    sub_1C12B54B0();
    result = sub_1C12B5804();
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
          goto LABEL_41;
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
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_1C128A520(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E8B8);
  v36 = a2;
  v6 = sub_1C12B56E4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1C12B57E0();
    sub_1C12B54B0();
    result = sub_1C12B5804();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1C128A834(unint64_t result, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v4 = result;
  v5 = a2 + 64;
  v6 = -1 << *(_BYTE *)(a2 + 32);
  v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(_QWORD *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    v8 = ~v6;
    result = sub_1C12B560C();
    if ((*(_QWORD *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      v9 = (result + 1) & v8;
      while (1)
      {
        sub_1C12B57E0();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        swift_bridgeObjectRelease();
        v10 = sub_1C12B5804();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v8;
        if (v4 >= (uint64_t)v9)
          break;
        if (v11 < v9)
          goto LABEL_11;
LABEL_12:
        v12 = *(_QWORD *)(a2 + 48);
        v13 = (_OWORD *)(v12 + 32 * v4);
        v14 = (_OWORD *)(v12 + 32 * v7);
        if (v4 != v7 || v13 >= v14 + 2)
        {
          v15 = v14[1];
          *v13 = *v14;
          v13[1] = v15;
        }
        v16 = *(_QWORD *)(a2 + 56);
        v17 = *(_QWORD *)(*(_QWORD *)(a3(0) - 8) + 72);
        v18 = v17 * v4;
        result = v16 + v17 * v4;
        v19 = v17 * v7;
        v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v4 = v7;
          if (v18 == v19)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v4 = v7;
LABEL_6:
        v7 = (v7 + 1) & v8;
        if (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          goto LABEL_21;
      }
      if (v11 < v9)
        goto LABEL_6;
LABEL_11:
      if (v4 < (uint64_t)v11)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    v23 = *v22;
    v24 = (-1 << v4) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C128AA80(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1C12B560C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_1C12B57E0();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        v9 = sub_1C12B5804();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(sub_1C12B5324() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
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

unint64_t sub_1C128AC80(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1C12B560C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1C12B57E0();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        v9 = sub_1C12B5804();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1C128AE54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD **v7;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;

  v7 = (_QWORD **)v6;
  v14 = (_QWORD *)*v6;
  v16 = sub_1C12892F0(a2, a3, a4, a5);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= v19 && (a6 & 1) != 0)
    {
LABEL_7:
      v22 = *v7;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = v22[7];
        v24 = v23 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for RecordMetadata(0) - 8) + 72) * v16;
        return sub_1C128E0E4(a1, v24);
      }
      goto LABEL_11;
    }
    if (v21 >= v19 && (a6 & 1) == 0)
    {
      sub_1C128BBC8();
      goto LABEL_7;
    }
    sub_1C12897F8(v19, a6 & 1);
    v26 = sub_1C12892F0(a2, a3, a4, a5);
    if ((v20 & 1) == (v27 & 1))
    {
      v16 = v26;
      v22 = *v7;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1C128B50C(v16, a2, a3, a4, a5, a1, v22);
      swift_bridgeObjectRetain();
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1C12B57A4();
  __break(1u);
  return result;
}

_OWORD *sub_1C128AFBC(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1C1289400(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        return sub_1C128E210(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1C128BE24();
      goto LABEL_7;
    }
    sub_1C1289B94(v13, a3 & 1);
    v19 = sub_1C1289400(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1C128E1A0(a2, (uint64_t)v21);
      return sub_1C128B598(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_1C12B57A4();
  __break(1u);
  return result;
}

uint64_t sub_1C128B0F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1C128939C(a2, a3);
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
        v19 = v18[7];
        v20 = sub_1C12B5324();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1C128C008();
      goto LABEL_7;
    }
    sub_1C1289EA8(v15, a4 & 1);
    v22 = sub_1C128939C(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1C128B610(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1C12B57A4();
  __break(1u);
  return result;
}

uint64_t sub_1C128B230(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1C128B23C(a1, a2, a3, a4, &qword_1EF6D40C8);
}

uint64_t sub_1C128B23C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v7 = v5;
  v12 = *v5;
  v14 = sub_1C128939C(a2, a3);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_1C128C270(a5);
LABEL_7:
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a2;
    v25[1] = a3;
    *(_QWORD *)(v20[7] + 8 * v14) = a1;
    v26 = v20[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (!v27)
    {
      v20[2] = v28;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1C128A210(v17, a4 & 1, a5);
  v23 = sub_1C128939C(a2, a3);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C12B57A4();
  __break(1u);
  return result;
}

uint64_t sub_1C128B3B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1C128939C(a2, a3);
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
    sub_1C128C41C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
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
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1C128A520(v15, a4 & 1);
  v21 = sub_1C128939C(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C12B57A4();
  __break(1u);
  return result;
}

uint64_t sub_1C128B50C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a7[(a1 >> 6) + 8] |= 1 << a1;
  v10 = (_QWORD *)(a7[6] + 32 * a1);
  *v10 = a2;
  v10[1] = a3;
  v10[2] = a4;
  v10[3] = a5;
  v11 = a7[7];
  v12 = type metadata accessor for RecordMetadata(0);
  result = sub_1C127F380(a6, v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * a1);
  v14 = a7[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a7[2] = v16;
  return result;
}

_OWORD *sub_1C128B598(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_1C128E210(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

uint64_t sub_1C128B610(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_1C12B5324();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

unint64_t sub_1C128B6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;

  v6 = v5 + 64;
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = a5 & ~v7;
  if (((*(_QWORD *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v13 = ~v7;
    v14 = *(_QWORD *)(v5 + 48);
    do
    {
      v15 = (_QWORD *)(v14 + 32 * v8);
      v16 = v15[2];
      v17 = v15[3];
      v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_1C12B578C() & 1) != 0)
      {
        v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_1C12B578C() & 1) != 0)
          break;
      }
      v8 = (v8 + 1) & v13;
    }
    while (((*(_QWORD *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

unint64_t sub_1C128B79C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C12B578C() & 1) == 0)
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
      while (!v14 && (sub_1C12B578C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C128B87C(uint64_t a1, uint64_t a2)
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
      sub_1C128E1A0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1C3BA9210](v9, a1);
      sub_1C128E1DC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1C128B940()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;

  v40 = sub_1C12B5324();
  v38 = *(_QWORD *)(v40 - 8);
  MEMORY[0x1E0C80A78](v40);
  v39 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40E0);
  v35 = v0;
  v2 = *v0;
  v3 = sub_1C12B56D8();
  v4 = *(_QWORD *)(v2 + 16);
  v42 = v3;
  if (!v4)
  {
    result = swift_release();
    v33 = v42;
    v32 = v35;
LABEL_28:
    *v32 = v33;
    return result;
  }
  v5 = v3;
  v6 = (void *)(v3 + 64);
  v7 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v2 || (unint64_t)v6 >= v2 + 64 + 8 * v7)
  {
    memmove(v6, (const void *)(v2 + 64), 8 * v7);
    v5 = v42;
  }
  v9 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v41 = v2;
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v36 = v2 + 64;
  v37 = (unint64_t)(v10 + 63) >> 6;
  v13 = v38;
  v14 = v39;
  v15 = v40;
  while (1)
  {
    if (v12)
    {
      v16 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v43 = v9;
      v17 = v16 | (v9 << 6);
      result = v41;
      goto LABEL_12;
    }
    v28 = v9 + 1;
    result = v41;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v37)
      goto LABEL_26;
    v29 = *(_QWORD *)(v36 + 8 * v28);
    v30 = v9 + 1;
    if (!v29)
    {
      v30 = v28 + 1;
      if (v28 + 1 >= v37)
        goto LABEL_26;
      v29 = *(_QWORD *)(v36 + 8 * v30);
      if (!v29)
        break;
    }
LABEL_25:
    v12 = (v29 - 1) & v29;
    v43 = v30;
    v17 = __clz(__rbit64(v29)) + (v30 << 6);
LABEL_12:
    v19 = 32 * v17;
    v20 = (uint64_t *)(*(_QWORD *)(result + 48) + 32 * v17);
    v21 = *v20;
    v22 = v20[1];
    v23 = v20[2];
    v24 = v20[3];
    v25 = *(_QWORD *)(v13 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v14, *(_QWORD *)(result + 56) + v25, v15);
    v26 = v42;
    v27 = (_QWORD *)(*(_QWORD *)(v42 + 48) + v19);
    *v27 = v21;
    v27[1] = v22;
    v27[2] = v23;
    v27[3] = v24;
    (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(_QWORD *)(v26 + 56) + v25, v14, v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = v43;
  }
  v31 = v28 + 2;
  if (v31 >= v37)
  {
LABEL_26:
    result = swift_release();
    v32 = v35;
    v33 = v42;
    goto LABEL_28;
  }
  v29 = *(_QWORD *)(v36 + 8 * v31);
  if (v29)
  {
    v30 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    v30 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v30 >= v37)
      goto LABEL_26;
    v29 = *(_QWORD *)(v36 + 8 * v30);
    ++v31;
    if (v29)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C128BBC8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;

  v1 = type metadata accessor for RecordMetadata(0);
  v35 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DC00);
  v32 = v0;
  v4 = *v0;
  v5 = sub_1C12B56D8();
  v6 = *(_QWORD *)(v4 + 16);
  v36 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v30 = v36;
    v29 = v32;
LABEL_28:
    *v29 = v30;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v36;
  }
  v33 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v34 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v26 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v34)
      goto LABEL_26;
    v27 = *(_QWORD *)(v33 + 8 * v26);
    ++v11;
    if (!v27)
    {
      v11 = v26 + 1;
      if (v26 + 1 >= v34)
        goto LABEL_26;
      v27 = *(_QWORD *)(v33 + 8 * v11);
      if (!v27)
        break;
    }
LABEL_25:
    v14 = (v27 - 1) & v27;
    v16 = __clz(__rbit64(v27)) + (v11 << 6);
LABEL_12:
    v17 = 32 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 32 * v16);
    v20 = *v18;
    v19 = v18[1];
    v22 = v18[2];
    v21 = v18[3];
    v23 = *(_QWORD *)(v35 + 72) * v16;
    sub_1C128E064(*(_QWORD *)(v4 + 56) + v23, (uint64_t)v3);
    v24 = v36;
    v25 = (_QWORD *)(*(_QWORD *)(v36 + 48) + v17);
    *v25 = v20;
    v25[1] = v19;
    v25[2] = v22;
    v25[3] = v21;
    sub_1C127F380((uint64_t)v3, *(_QWORD *)(v24 + 56) + v23);
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v34)
  {
LABEL_26:
    result = (void *)swift_release();
    v29 = v32;
    v30 = v36;
    goto LABEL_28;
  }
  v27 = *(_QWORD *)(v33 + 8 * v28);
  if (v27)
  {
    v11 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v11 >= v34)
      goto LABEL_26;
    v27 = *(_QWORD *)(v33 + 8 * v11);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C128BE24()
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
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40C0);
  v2 = *v0;
  v3 = sub_1C12B56D8();
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
    v16 = 40 * v15;
    sub_1C128E1A0(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1C128E220(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1C128E210(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
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

void *sub_1C128C008()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_1C12B5324();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D44C0);
  v31 = v0;
  v4 = *v0;
  v5 = sub_1C12B56D8();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C128C264()
{
  return sub_1C128C270(&qword_1EF6D40C8);
}

void *sub_1C128C270(uint64_t *a1)
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
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1C12B56D8();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_1C128C41C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E8B8);
  v2 = *v0;
  v3 = sub_1C12B56D8();
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

uint64_t sub_1C128C5D0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1C12AEE44();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1C12ADF28();
      goto LABEL_22;
    }
    sub_1C12AE4B8();
  }
  v11 = *v4;
  sub_1C12B57E0();
  sub_1C12B54B0();
  result = sub_1C12B5804();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1C12B578C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1C12B5798();
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
          result = sub_1C12B578C();
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

uint64_t sub_1C128C768(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t *v6;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v11 = result;
  v12 = *(_QWORD *)(*v6 + 16);
  v13 = *(_QWORD *)(*v6 + 24);
  if (v13 > v12 && (a6 & 1) != 0)
    goto LABEL_22;
  if ((a6 & 1) != 0)
  {
    sub_1C12AF120();
  }
  else
  {
    if (v13 > v12)
    {
      result = (uint64_t)sub_1C12AE0D8();
      goto LABEL_22;
    }
    sub_1C12AE764();
  }
  v14 = *v6;
  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  result = sub_1C12B5804();
  v15 = -1 << *(_BYTE *)(v14 + 32);
  a5 = result & ~v15;
  v16 = v14 + 56;
  if (((*(_QWORD *)(v14 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) != 0)
  {
    v17 = ~v15;
    v18 = *(_QWORD *)(v14 + 48);
    while (1)
    {
      v19 = (_QWORD *)(v18 + 32 * a5);
      v20 = v19[2];
      v21 = v19[3];
      v22 = *v19 == v11 && v19[1] == a2;
      if (v22 || (result = sub_1C12B578C(), (result & 1) != 0))
      {
        if (v20 == a3 && v21 == a4)
          break;
        result = sub_1C12B578C();
        if ((result & 1) != 0)
          break;
      }
      a5 = (a5 + 1) & v17;
      if (((*(_QWORD *)(v16 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) == 0)
        goto LABEL_22;
    }
    result = sub_1C12B5798();
    __break(1u);
  }
LABEL_22:
  v24 = *v29;
  *(_QWORD *)(*v29 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  v25 = (uint64_t *)(*(_QWORD *)(v24 + 48) + 32 * a5);
  *v25 = v11;
  v25[1] = a2;
  v25[2] = a3;
  v25[3] = a4;
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
    __break(1u);
  else
    *(_QWORD *)(v24 + 16) = v28;
  return result;
}

uint64_t sub_1C128C94C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1C128C984(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1C128C968(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1C128CAEC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1C128C984(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D40F0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1C12B56FC();
  __break(1u);
  return result;
}

uint64_t sub_1C128CAEC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4200);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1C12B56FC();
  __break(1u);
  return result;
}

uint64_t sub_1C128CC54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  _OWORD *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int64_t v61;
  uint64_t v62;

  v58 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v5);
  v57 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E7F8);
  v7 = MEMORY[0x1E0C80A78](v56);
  v55 = (_OWORD *)((char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x1E0C80A78](v7);
  v62 = (uint64_t)&v52 - v10;
  MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v52 - v11);
  v13 = *(_QWORD *)(a2 + 64);
  v53 = a2 + 64;
  v14 = 1 << *(_BYTE *)(a2 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v54 = (unint64_t)(v14 + 63) >> 6;
  v59 = a2;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  while (v16)
  {
    v60 = (v16 - 1) & v16;
    v61 = v18;
    v19 = __clz(__rbit64(v16)) | (v18 << 6);
LABEL_23:
    v24 = *(_QWORD *)(v59 + 56);
    v25 = (uint64_t *)(*(_QWORD *)(v59 + 48) + 32 * v19);
    v27 = *v25;
    v26 = v25[1];
    v29 = v25[2];
    v28 = v25[3];
    v30 = v24 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for RecordMetadata(0) - 8) + 72) * v19;
    v31 = v56;
    sub_1C128E064(v30, (uint64_t)v12 + *(int *)(v56 + 48));
    *v12 = v27;
    v12[1] = v26;
    v12[2] = v29;
    v12[3] = v28;
    v32 = v62;
    sub_1C128E330((uint64_t)v12, v62, &qword_1ED78E7F8);
    v33 = *(int *)(v31 + 48);
    v34 = v55;
    v35 = (uint64_t *)((char *)v55 + v33);
    v36 = v32 + v33;
    v37 = *(_QWORD *)(v32 + 16);
    v38 = *(_QWORD *)(v32 + 24);
    *v55 = *(_OWORD *)v32;
    *((_QWORD *)v34 + 2) = v37;
    *((_QWORD *)v34 + 3) = v38;
    sub_1C128E064(v36, (uint64_t)v35);
    v39 = *v35;
    v40 = v35[1];
    v42 = v35[2];
    v41 = v35[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C128E0A8((uint64_t)v35);
    if (*(_QWORD *)(a3 + 16) && (v43 = sub_1C12892F0(v39, v40, v42, v41), (v44 & 1) != 0))
    {
      v45 = v43;
      v46 = *(_QWORD *)(a3 + 56);
      v47 = sub_1C12B5324();
      v48 = *(_QWORD *)(v47 - 8);
      v49 = v46 + *(_QWORD *)(v48 + 72) * v45;
      v50 = (uint64_t)v57;
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v57, v49, v47);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v48 + 56))(v50, 0, 1, v47);
    }
    else
    {
      v47 = sub_1C12B5324();
      v50 = (uint64_t)v57;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v57, 1, 1, v47);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C12B5324();
    v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 48))(v50, 1, v47);
    sub_1C128E2B0(v50, &qword_1ED78DBF8);
    if (v51 == 1)
    {
      if (__OFADD__(v58, 1))
      {
        __break(1u);
LABEL_31:
        swift_release();
        return v58;
      }
      ++v58;
    }
    v16 = v60;
    v18 = v61;
    result = sub_1C128E2B0(v62, &qword_1ED78E7F8);
  }
  v20 = v18 + 1;
  if (__OFADD__(v18, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v20 >= v54)
    goto LABEL_31;
  v21 = *(_QWORD *)(v53 + 8 * v20);
  v22 = v18 + 1;
  if (v21)
    goto LABEL_22;
  v22 = v18 + 2;
  if (v18 + 2 >= v54)
    goto LABEL_31;
  v21 = *(_QWORD *)(v53 + 8 * v22);
  if (v21)
    goto LABEL_22;
  v22 = v18 + 3;
  if (v18 + 3 >= v54)
    goto LABEL_31;
  v21 = *(_QWORD *)(v53 + 8 * v22);
  if (v21)
    goto LABEL_22;
  v22 = v18 + 4;
  if (v18 + 4 >= v54)
    goto LABEL_31;
  v21 = *(_QWORD *)(v53 + 8 * v22);
  if (v21)
  {
LABEL_22:
    v60 = (v21 - 1) & v21;
    v61 = v22;
    v19 = __clz(__rbit64(v21)) + (v22 << 6);
    goto LABEL_23;
  }
  v23 = v18 + 5;
  if (v18 + 5 >= v54)
    goto LABEL_31;
  v21 = *(_QWORD *)(v53 + 8 * v23);
  if (v21)
  {
    v22 = v18 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    v22 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v22 >= v54)
      goto LABEL_31;
    v21 = *(_QWORD *)(v53 + 8 * v22);
    ++v23;
    if (v21)
      goto LABEL_22;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_1C128D070(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v24;
  int64_t v25;

  v9 = result;
  v10 = 0;
  v11 = 1 << *(_BYTE *)(result + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(result + 64);
  v25 = (unint64_t)(v11 + 63) >> 6;
  while (v13)
  {
    v14 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    v15 = v14 | (v10 << 6);
LABEL_22:
    v19 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 32 * v15);
    v20 = v19[2];
    v21 = v19[3];
    if (*v19 != a2 || v19[1] != a3)
    {
      result = sub_1C12B578C();
      if ((result & 1) == 0)
        continue;
    }
    if (v20 != a4 || v21 != a5)
    {
      result = sub_1C12B578C();
      if ((result & 1) == 0)
        continue;
    }
    return 1;
  }
  v16 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_35;
  }
  if (v16 >= v25)
    return 0;
  v17 = *(_QWORD *)(v24 + 8 * v16);
  ++v10;
  if (v17)
    goto LABEL_21;
  v10 = v16 + 1;
  if (v16 + 1 >= v25)
    return 0;
  v17 = *(_QWORD *)(v24 + 8 * v10);
  if (v17)
    goto LABEL_21;
  v10 = v16 + 2;
  if (v16 + 2 >= v25)
    return 0;
  v17 = *(_QWORD *)(v24 + 8 * v10);
  if (v17)
    goto LABEL_21;
  v10 = v16 + 3;
  if (v16 + 3 >= v25)
    return 0;
  v17 = *(_QWORD *)(v24 + 8 * v10);
  if (v17)
  {
LABEL_21:
    v13 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v10 << 6);
    goto LABEL_22;
  }
  v18 = v16 + 4;
  if (v18 >= v25)
    return 0;
  v17 = *(_QWORD *)(v24 + 8 * v18);
  if (v17)
  {
    v10 = v18;
    goto LABEL_21;
  }
  while (1)
  {
    v10 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v10 >= v25)
      return 0;
    v17 = *(_QWORD *)(v24 + 8 * v10);
    ++v18;
    if (v17)
      goto LABEL_21;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1C128D260(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 16);
  result = swift_beginAccess();
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
  v4 = 0;
  v5 = a1 + 56;
  v22 = -(uint64_t)v2;
  v6 = MEMORY[0x1E0DEE9D8];
  v7 = v2;
  v19 = v5;
  v20 = v2;
  do
  {
    v21 = v6;
    if (v4 <= v7)
      v8 = v7;
    else
      v8 = v4;
    v23 = -(uint64_t)v8;
    for (i = (uint64_t *)(v5 + 32 * v4++); ; i += 4)
    {
      if (v23 + v4 == 1)
      {
        __break(1u);
        return result;
      }
      v11 = *(i - 3);
      v10 = *(i - 2);
      v13 = *(i - 1);
      v12 = *i;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v14 = swift_bridgeObjectRetain();
      v15 = sub_1C128D070(v14, v11, v10, v13, v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
        break;
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      ++v4;
      if (v22 + v4 == 1)
        return v21;
    }
    v6 = v21;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = sub_1C128C94C(0, *(_QWORD *)(v21 + 16) + 1, 1);
      v6 = v21;
    }
    v5 = v19;
    v7 = v20;
    v17 = *(_QWORD *)(v6 + 16);
    v16 = *(_QWORD *)(v6 + 24);
    if (v17 >= v16 >> 1)
    {
      result = sub_1C128C94C(v16 > 1, v17 + 1, 1);
      v5 = v19;
      v7 = v20;
      v6 = v21;
    }
    *(_QWORD *)(v6 + 16) = v17 + 1;
    v18 = (_QWORD *)(v6 + 32 * v17);
    v18[4] = v11;
    v18[5] = v10;
    v18[6] = v13;
    v18[7] = v12;
  }
  while (v22 + v4);
  return v6;
}

uint64_t sub_1C128D450(unint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD *v40;
  int64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  int64_t v47;

  v35 = a2;
  v36 = a1;
  v6 = type metadata accessor for RecordMetadata(0);
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  result = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v45 = a3;
  v13 = a3[8];
  v12 = a3 + 8;
  v11 = v13;
  v14 = 1 << *((_BYTE *)v12 - 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v11;
  v40 = v12;
  v41 = (unint64_t)(v14 + 63) >> 6;
  v39 = a4;
  v37 = 0;
  v38 = (uint64_t *)(a4 + 56);
  v42 = v9;
  while (1)
  {
    if (v16)
    {
      v46 = (v16 - 1) & v16;
      v47 = v10;
      v17 = __clz(__rbit64(v16)) | (v10 << 6);
      goto LABEL_21;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v18 >= v41)
      return sub_1C12AFD48(v36, v35, v37, v45);
    v19 = v40[v18];
    v20 = v10 + 1;
    if (!v19)
    {
      v20 = v10 + 2;
      if (v10 + 2 >= v41)
        return sub_1C12AFD48(v36, v35, v37, v45);
      v19 = v40[v20];
      if (!v19)
      {
        v20 = v10 + 3;
        if (v10 + 3 >= v41)
          return sub_1C12AFD48(v36, v35, v37, v45);
        v19 = v40[v20];
        if (!v19)
          break;
      }
    }
LABEL_20:
    v46 = (v19 - 1) & v19;
    v47 = v20;
    v17 = __clz(__rbit64(v19)) + (v20 << 6);
LABEL_21:
    v22 = (uint64_t *)(v45[6] + 32 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = v22[2];
    v26 = v22[3];
    sub_1C128E064(v45[7] + *(_QWORD *)(v43 + 72) * v17, (uint64_t)v9);
    if ((v9[*(int *)(v44 + 24)] & 1) != 0)
      goto LABEL_4;
    v27 = *(_QWORD *)(v39 + 16);
    if (v27)
    {
      v28 = v38;
      while (1)
      {
        v29 = *(v28 - 1);
        v30 = *v28;
        v31 = *(v28 - 3) == v24 && *(v28 - 2) == v23;
        if (v31 || (sub_1C12B578C() & 1) != 0)
        {
          v32 = v29 == v25 && v30 == v26;
          if (v32 || (sub_1C12B578C() & 1) != 0)
            break;
        }
        v28 += 4;
        if (!--v27)
          goto LABEL_36;
      }
LABEL_4:
      v9 = v42;
      result = sub_1C128E0A8((uint64_t)v42);
      v10 = v47;
      v16 = v46;
    }
    else
    {
LABEL_36:
      v9 = v42;
      result = sub_1C128E0A8((uint64_t)v42);
      *(unint64_t *)((char *)v36 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v33 = __OFADD__(v37++, 1);
      v10 = v47;
      v16 = v46;
      if (v33)
      {
        __break(1u);
        return sub_1C12AFD48(v36, v35, v37, v45);
      }
    }
  }
  v21 = v10 + 4;
  if (v10 + 4 >= v41)
    return sub_1C12AFD48(v36, v35, v37, v45);
  v19 = v40[v21];
  if (v19)
  {
    v20 = v10 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    v20 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v20 >= v41)
      return sub_1C12AFD48(v36, v35, v37, v45);
    v19 = v40[v20];
    ++v21;
    if (v19)
      goto LABEL_20;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C128D72C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    v10 = sub_1C128D450((_QWORD *)((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, (_QWORD *)a1, a2);
    swift_bridgeObjectRelease();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    v10 = sub_1C128D450((unint64_t *)v11, v7, (_QWORD *)a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x1C3BA9870](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_1C128D8E0(unint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[4];
  _QWORD *v39;

  v29 = a2;
  v32 = a5;
  v33 = a6;
  v30 = a1;
  v7 = type metadata accessor for RecordMetadata(0);
  v36 = *(_QWORD *)(v7 - 8);
  v37 = v7;
  result = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = 0;
  v11 = 0;
  v39 = a3;
  v14 = a3[8];
  v13 = a3 + 8;
  v12 = v14;
  v15 = 1 << *((_BYTE *)v13 - 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v12;
  v34 = v13;
  v35 = (unint64_t)(v15 + 63) >> 6;
  while (v17)
  {
    v18 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    v19 = v18 | (v11 << 6);
LABEL_18:
    v23 = (uint64_t *)(v39[6] + 32 * v19);
    v24 = *v23;
    v25 = v23[1];
    v27 = v23[2];
    v26 = v23[3];
    sub_1C128E064(v39[7] + *(_QWORD *)(v36 + 72) * v19, (uint64_t)v10);
    if (v10[*(int *)(v37 + 24)] == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C128E0A8((uint64_t)v10);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v38[0] = v24;
      v38[1] = v25;
      v38[2] = v27;
      v38[3] = v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28 = sub_1C12829AC(v38, v32, v33);
      sub_1C128E0A8((uint64_t)v10);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v28 & 1) == 0)
      {
        *(unint64_t *)((char *)v30 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
        v20 = __OFADD__(v31++, 1);
        if (v20)
          goto LABEL_30;
      }
    }
  }
  v20 = __OFADD__(v11++, 1);
  if (v20)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v35)
    return sub_1C12AFD48(v30, v29, v31, v39);
  v21 = v34[v11];
  if (v21)
  {
LABEL_17:
    v17 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v11 << 6);
    goto LABEL_18;
  }
  v22 = v11 + 1;
  if (v11 + 1 >= v35)
    return sub_1C12AFD48(v30, v29, v31, v39);
  v21 = v34[v22];
  if (v21)
    goto LABEL_16;
  v22 = v11 + 2;
  if (v11 + 2 >= v35)
    return sub_1C12AFD48(v30, v29, v31, v39);
  v21 = v34[v22];
  if (v21)
    goto LABEL_16;
  v22 = v11 + 3;
  if (v11 + 3 >= v35)
    return sub_1C12AFD48(v30, v29, v31, v39);
  v21 = v34[v22];
  if (v21)
  {
LABEL_16:
    v11 = v22;
    goto LABEL_17;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v35)
      return sub_1C12AFD48(v30, v29, v31, v39);
    v21 = v34[v11];
    ++v22;
    if (v21)
      goto LABEL_17;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C128DB78(unint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[4];
  _QWORD *v39;

  v29 = a2;
  v32 = a5;
  v33 = a6;
  v30 = a1;
  v7 = type metadata accessor for RecordMetadata(0);
  v36 = *(_QWORD *)(v7 - 8);
  v37 = v7;
  result = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = 0;
  v11 = 0;
  v39 = a3;
  v14 = a3[8];
  v13 = a3 + 8;
  v12 = v14;
  v15 = 1 << *((_BYTE *)v13 - 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v12;
  v34 = v13;
  v35 = (unint64_t)(v15 + 63) >> 6;
  while (v17)
  {
    v18 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    v19 = v18 | (v11 << 6);
LABEL_18:
    v23 = (uint64_t *)(v39[6] + 32 * v19);
    v24 = *v23;
    v25 = v23[1];
    v27 = v23[2];
    v26 = v23[3];
    sub_1C128E064(v39[7] + *(_QWORD *)(v36 + 72) * v19, (uint64_t)v10);
    if (v10[*(int *)(v37 + 24)] == 1)
    {
      v38[0] = v24;
      v38[1] = v25;
      v38[2] = v27;
      v38[3] = v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28 = sub_1C12829AC(v38, v32, v33);
      sub_1C128E0A8((uint64_t)v10);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v28 & 1) == 0)
      {
        *(unint64_t *)((char *)v30 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
        v20 = __OFADD__(v31++, 1);
        if (v20)
          goto LABEL_30;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C128E0A8((uint64_t)v10);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
  }
  v20 = __OFADD__(v11++, 1);
  if (v20)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v35)
    return sub_1C12AFD48(v30, v29, v31, v39);
  v21 = v34[v11];
  if (v21)
  {
LABEL_17:
    v17 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v11 << 6);
    goto LABEL_18;
  }
  v22 = v11 + 1;
  if (v11 + 1 >= v35)
    return sub_1C12AFD48(v30, v29, v31, v39);
  v21 = v34[v22];
  if (v21)
    goto LABEL_16;
  v22 = v11 + 2;
  if (v11 + 2 >= v35)
    return sub_1C12AFD48(v30, v29, v31, v39);
  v21 = v34[v22];
  if (v21)
    goto LABEL_16;
  v22 = v11 + 3;
  if (v11 + 3 >= v35)
    return sub_1C12AFD48(v30, v29, v31, v39);
  v21 = v34[v22];
  if (v21)
  {
LABEL_16:
    v11 = v22;
    goto LABEL_17;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v35)
      return sub_1C12AFD48(v30, v29, v31, v39);
    v21 = v34[v11];
    ++v22;
    if (v21)
      goto LABEL_17;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C128DE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  char v11;
  unsigned int v12;
  unint64_t v13;
  size_t v14;
  uint64_t isStackAllocationSafe;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v11 = *(_BYTE *)(a1 + 32);
  v12 = v11 & 0x3F;
  v13 = (unint64_t)((1 << v11) + 63) >> 6;
  v14 = 8 * v13;
  swift_retain_n();
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v12 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    v19[0] = v19;
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v19 - ((v14 + 15) & 0x3FFFFFFFFFFFFFF0), v14);
    swift_retain();
    swift_bridgeObjectRetain();
    v16 = a5((char *)v19 - ((v14 + 15) & 0x3FFFFFFFFFFFFFF0), v13, a1, a2, a3, a4);
    swift_release();
    swift_bridgeObjectRelease();
    if (v5)
      swift_willThrow();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    v17 = (void *)swift_slowAlloc();
    bzero(v17, v14);
    swift_retain();
    swift_bridgeObjectRetain();
    v16 = a5((char *)v17, v13, a1, a2, a3, a4);
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x1C3BA9870](v17, -1, -1);
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v16;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1C128E064(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C128E0A8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C128E0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RecordMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C128E128()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED78DBF0;
  if (!qword_1ED78DBF0)
  {
    v1 = sub_1C12B5324();
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0CB08F0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED78DBF0);
  }
  return result;
}

uint64_t sub_1C128E170(uint64_t a1)
{
  return sub_1C12880D8(a1) & 1;
}

uint64_t method lookup function for MetadataStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MetadataStore.__allocating_init(deviceObsoletionDuration:tombstoneObsoletionDuration:maximumUnsyncedRecordCount:persistentStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_1C128E1A0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1C128E1DC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

_OWORD *sub_1C128E210(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1C128E220(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C128E260()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D40D8);
  return sub_1C12B52D0() & 1;
}

uint64_t sub_1C128E2B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C128E2EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C128E330(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C128E374(uint64_t a1)
{
  return sub_1C128E170(a1) & 1;
}

uint64_t sub_1C128E38C()
{
  return 1;
}

uint64_t sub_1C128E394()
{
  sub_1C12B57E0();
  sub_1C12B57EC();
  return sub_1C12B5804();
}

uint64_t sub_1C128E3D4()
{
  return sub_1C12B57EC();
}

uint64_t sub_1C128E3F8()
{
  sub_1C12B57E0();
  sub_1C12B57EC();
  return sub_1C12B5804();
}

id sub_1C128E444(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  void *v30;
  id result;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  int v49;
  uint64_t v50;
  _QWORD *v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  _BOOL4 v82;
  uint64_t v83;
  uint8_t *v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  _OWORD v93[2];
  __int128 v94;
  uint64_t v95;
  uint64_t v96[7];

  v90 = a2;
  v96[5] = *MEMORY[0x1E0C80C00];
  v4 = sub_1C12B542C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  LODWORD(v91) = *(unsigned __int8 *)a1;
  v8 = a1[1];
  v9 = (void *)a1[2];
  v89 = v2;
  v10 = *(void **)(v2 + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_queue);
  v12 = a1[3];
  v11 = a1[4];
  *v7 = v10;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF740], v4);
  v13 = v10;
  LOBYTE(a1) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((a1 & 1) == 0)
  {
    __break(1u);
    swift_once();
    v16 = sub_1C12B5390();
    __swift_project_value_buffer(v16, (uint64_t)qword_1ED78DC40);
    v17 = v9;
    v18 = v9;
    v19 = sub_1C12B5384();
    v20 = sub_1C12B5534();
    if (!os_log_type_enabled(v19, v20))
    {
      swift_release();

      return v9;
    }
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v96[0] = v22;
    *(_DWORD *)v21 = 136446210;
    *(_QWORD *)&v94 = v9;
    v23 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41E0);
    v24 = sub_1C12B5498();
    *(_QWORD *)&v94 = sub_1C12882D0(v24, v25, v96);
    sub_1C12B55DC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C127A000, v19, v20, "Failed to encode message: %{public}s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v22, -1, -1);
    MEMORY[0x1C3BA9870](v21, -1, -1);

LABEL_32:
    swift_release();
    return v9;
  }
  sub_1C12B5294();
  swift_allocObject();
  sub_1C12B5288();
  LOBYTE(v96[0]) = v91;
  v96[1] = v8;
  v96[2] = (uint64_t)v9;
  v96[3] = v12;
  v96[4] = v11;
  sub_1C1292D50();
  v14 = sub_1C12B527C();
  v91 = v15;
  v26 = v14;
  *(_QWORD *)&v94 = 0x6567617373656DLL;
  *((_QWORD *)&v94 + 1) = 0xE700000000000000;
  v27 = v15;
  sub_1C127CE48(v14, v15);
  sub_1C12B5630();
  v95 = MEMORY[0x1E0CB0338];
  *(_QWORD *)&v94 = v26;
  *((_QWORD *)&v94 + 1) = v27;
  sub_1C128E210(&v94, v93);
  v28 = MEMORY[0x1E0DEE9E0];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v92 = v28;
  sub_1C128AFBC(v93, (uint64_t)v96, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_1C128E1DC((uint64_t)v96);
  v30 = *(void **)(v89 + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_idsService);
  result = objc_msgSend(v30, sel_devices);
  if (result)
  {
    v32 = result;
    sub_1C1292D18(0, &qword_1ED78DC80);
    v33 = sub_1C12B54EC();

    v34 = v90;
    swift_bridgeObjectRetain();
    v35 = sub_1C1291D58(v33, v34);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v36 = sub_1C1291F38((uint64_t)v35);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v36 + 16))
    {
      v89 = v26;
      v37 = (void *)sub_1C12B5450();
      swift_bridgeObjectRelease();
      sub_1C128F07C(v36);
      swift_bridgeObjectRelease();
      v38 = (void *)sub_1C12B5510();
      swift_bridgeObjectRelease();
      v39 = (void *)sub_1C12B5450();
      v96[0] = 0;
      *(_QWORD *)&v94 = 0;
      v40 = objc_msgSend(v30, sel_sendMessage_toDestinations_priority_options_identifier_error_, v37, v38, 300, v39, v96, &v94);

      v41 = (void *)v96[0];
      if (!v40)
      {
        v66 = (id)v94;
        v67 = v41;
        v9 = (void *)sub_1C12B52A0();

        swift_willThrow();
        if (qword_1ED78E810 != -1)
          swift_once();
        v68 = sub_1C12B5390();
        __swift_project_value_buffer(v68, (uint64_t)qword_1ED78DC40);
        v69 = v9;
        v70 = v9;
        v71 = sub_1C12B5384();
        v72 = sub_1C12B5534();
        if (os_log_type_enabled(v71, v72))
        {
          v73 = (uint8_t *)swift_slowAlloc();
          v74 = swift_slowAlloc();
          v96[0] = v74;
          *(_DWORD *)v73 = 136446210;
          *(_QWORD *)&v94 = v9;
          v75 = v9;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41E0);
          v76 = sub_1C12B5498();
          *(_QWORD *)&v94 = sub_1C12882D0(v76, v77, v96);
          sub_1C12B55DC();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_1C127A000, v71, v72, "Failed to send message: %{public}s", v73, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v74, -1, -1);
          MEMORY[0x1C3BA9870](v73, -1, -1);
          sub_1C127CE8C(v89, v91);

          swift_release();
        }
        else
        {
          sub_1C127CE8C(v89, v91);
          swift_release();

        }
        return v9;
      }
      v42 = qword_1ED78E810;
      v43 = (id)v94;
      if (v41)
      {
        v44 = v41;
        if (v42 != -1)
          swift_once();
        v45 = sub_1C12B5390();
        __swift_project_value_buffer(v45, (uint64_t)qword_1ED78DC40);
        swift_bridgeObjectRetain_n();
        v46 = v44;
        v47 = sub_1C12B5384();
        v48 = sub_1C12B5540();
        v49 = v48;
        v88 = v47;
        if (os_log_type_enabled(v47, v48))
        {
          v50 = swift_slowAlloc();
          v51 = (_QWORD *)swift_slowAlloc();
          v87 = swift_slowAlloc();
          v96[0] = v87;
          *(_DWORD *)v50 = 138543618;
          v86 = v49;
          *(_QWORD *)&v94 = v46;
          v52 = v46;
          sub_1C12B55DC();
          *v51 = v41;

          *(_WORD *)(v50 + 12) = 2082;
          swift_bridgeObjectRetain();
          v53 = sub_1C12B551C();
          v55 = v54;
          swift_bridgeObjectRelease();
          *(_QWORD *)&v94 = sub_1C12882D0(v53, v55, v96);
          sub_1C12B55DC();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          v56 = v88;
          _os_log_impl(&dword_1C127A000, v88, (os_log_type_t)v86, "Sent message %{public}@ to %{public}s", (uint8_t *)v50, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41F0);
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v51, -1, -1);
          v57 = v87;
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v57, -1, -1);
          MEMORY[0x1C3BA9870](v50, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v9 = (void *)sub_1C12B548C();
        sub_1C127CE8C(v89, v91);

        swift_release();
        return v9;
      }
      if (v42 != -1)
        swift_once();
      v79 = sub_1C12B5390();
      __swift_project_value_buffer(v79, (uint64_t)qword_1ED78DC40);
      v80 = sub_1C12B5384();
      v81 = sub_1C12B5534();
      v82 = os_log_type_enabled(v80, v81);
      v83 = v89;
      if (v82)
      {
        v84 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v84 = 0;
        _os_log_impl(&dword_1C127A000, v80, v81, "Failed to retrieve identifier for message", v84, 2u);
        MEMORY[0x1C3BA9870](v84, -1, -1);
      }

      sub_1C1292D94();
      v9 = (void *)swift_allocError();
      v78 = v83;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_1ED78E810 != -1)
        swift_once();
      v58 = sub_1C12B5390();
      __swift_project_value_buffer(v58, (uint64_t)qword_1ED78DC40);
      swift_bridgeObjectRetain_n();
      v59 = sub_1C12B5384();
      v60 = sub_1C12B5534();
      if (os_log_type_enabled(v59, v60))
      {
        v89 = v26;
        v61 = (uint8_t *)swift_slowAlloc();
        v62 = swift_slowAlloc();
        v96[0] = v62;
        *(_DWORD *)v61 = 136446210;
        swift_bridgeObjectRetain();
        v63 = sub_1C12B551C();
        v65 = v64;
        swift_bridgeObjectRelease();
        *(_QWORD *)&v94 = sub_1C12882D0(v63, v65, v96);
        sub_1C12B55DC();
        swift_bridgeObjectRelease_n();
        v26 = v89;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C127A000, v59, v60, "Unable to find matching IDS identifier for destinations: %{public}s", v61, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v62, -1, -1);
        MEMORY[0x1C3BA9870](v61, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_1C1292D94();
      v9 = (void *)swift_allocError();
      v78 = v26;
    }
    sub_1C127CE8C(v78, v91);
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C128F07C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41F8);
    v2 = sub_1C12B5654();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E8];
  }
  v3 = a1 + 56;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v7 = (unint64_t)(63 - v4) >> 6;
  v8 = v2 + 56;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7)
      goto LABEL_37;
    v14 = *(_QWORD *)(v3 + 8 * v13);
    v15 = v10 + 1;
    if (!v14)
    {
      v15 = v10 + 2;
      if (v10 + 2 >= v7)
        goto LABEL_37;
      v14 = *(_QWORD *)(v3 + 8 * v15);
      if (!v14)
      {
        v15 = v10 + 3;
        if (v10 + 3 >= v7)
          goto LABEL_37;
        v14 = *(_QWORD *)(v3 + 8 * v15);
        if (!v14)
        {
          v15 = v10 + 4;
          if (v10 + 4 >= v7)
            goto LABEL_37;
          v14 = *(_QWORD *)(v3 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v14 - 1) & v14;
    v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    result = sub_1C12B5618();
    v17 = -1 << *(_BYTE *)(v2 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v8 + 8 * (v18 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v20 = 0;
      v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v22 = v19 == v21;
        if (v19 == v21)
          v19 = 0;
        v20 |= v22;
        v23 = *(_QWORD *)(v8 + 8 * v19);
      }
      while (v23 == -1);
      v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v2 + 48) + 40 * v11;
    *(_OWORD *)v12 = v24;
    *(_OWORD *)(v12 + 16) = v25;
    *(_QWORD *)(v12 + 32) = v26;
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_1C1292DD8();
    return v2;
  }
  v14 = *(_QWORD *)(v3 + 8 * v16);
  if (v14)
  {
    v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v7)
      goto LABEL_37;
    v14 = *(_QWORD *)(v3 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_1C128F36C(uint64_t *a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t *p_size;
  SEL *v11;
  uint8_t *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  char *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  unsigned __int8 v34;
  char *v35;
  uint64_t v36;
  __int16 v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t *v41;
  uint64_t *v42;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47[3];

  v45 = a1;
  v2 = sub_1C12B5390();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED78E810 != -1)
    goto LABEL_34;
  while (1)
  {
    v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED78DC40);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    v7 = (char *)(id)v1;
    v8 = sub_1C12B5384();
    v9 = sub_1C12B5540();
    p_size = &value witness table for Record.size;
    v11 = (SEL *)&unk_1E7A81000;
    if (os_log_type_enabled(v8, v9))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      v47[0] = v44;
      *(_DWORD *)v12 = 136446210;
      v13 = objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_idsService], sel_devices);
      if (!v13)
        goto LABEL_38;
      v14 = v13;
      v43[1] = v12 + 4;
      v15 = sub_1C1292D18(0, &qword_1ED78DC80);
      v16 = sub_1C12B54EC();

      v17 = MEMORY[0x1C3BA90E4](v16, v15);
      v19 = v18;
      swift_bridgeObjectRelease();
      v46 = sub_1C12882D0(v17, v19, v47);
      sub_1C12B55DC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C127A000, v8, v9, "Finding active paired device in devices: %{public}s", v12, 0xCu);
      v20 = v44;
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v20, -1, -1);
      MEMORY[0x1C3BA9870](v12, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v11 = (SEL *)&unk_1E7A81000;
      p_size = (_QWORD *)(&value witness table for Record + 64);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    v21 = objc_msgSend(*(id *)&v7[p_size[39]], v11[283]);
    if (!v21)
      break;
    v22 = v21;
    sub_1C1292D18(0, &qword_1ED78DC80);
    v1 = sub_1C12B54EC();

    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v2 = sub_1C12B56CC();
      if (!v2)
      {
LABEL_36:
        swift_bridgeObjectRelease_n();
        v42 = v45;
        *v45 = 0;
        v42[1] = 0;
        *((_WORD *)v42 + 8) = 0;
        return;
      }
    }
    else
    {
      v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v2)
        goto LABEL_36;
    }
    v3 = 4;
    v5 = (char *)&unk_1E7A81000;
    while (1)
    {
      v23 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C3BA9264](v3 - 4, v1) : *(id *)(v1 + 8 * v3);
      v24 = v23;
      v25 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      if (objc_msgSend(v23, sel_isLocallyPaired) && objc_msgSend(v24, sel_isActive))
      {
        v26 = (char *)objc_msgSend(v24, sel_deviceType);
        if ((unint64_t)(v26 - 2) < 3)
        {
          objc_msgSend(v24, sel_operatingSystemVersion);
          if (v47[0] >= 16)
            goto LABEL_21;
        }
        else if (v26 == (char *)6)
        {
          objc_msgSend(v24, sel_operatingSystemVersion);
          if (v47[0] >= 8)
          {
LABEL_21:
            swift_bridgeObjectRelease_n();
            v27 = v24;
            v28 = objc_msgSend(v27, sel_uniqueIDOverride);
            if (!v28)
              goto LABEL_39;
            v29 = v28;
            v30 = sub_1C12B5480();
            v32 = v31;

            v33 = objc_msgSend(v27, sel_deviceType);
            if ((unint64_t)v33 >= 7)
              v34 = 0;
            else
              v34 = 0x3000101010200uLL >> (8 * v33);
            v35 = (char *)objc_msgSend(v27, sel_deviceType);
            if ((unint64_t)(v35 - 2) >= 3)
            {
              if (v35 == (char *)6)
              {
                objc_msgSend(v27, sel_operatingSystemVersion);
                v39 = v47[0];

                v37 = v34;
                if (v39 <= 7)
                  goto LABEL_30;
LABEL_27:
                v38 = 256;
              }
              else
              {

                v38 = 0;
                v37 = v34;
              }
            }
            else
            {
              objc_msgSend(v27, sel_operatingSystemVersion);
              v36 = v47[0];

              v37 = v34;
              if (v36 >= 16)
                goto LABEL_27;
LABEL_30:
              v38 = 0;
            }
            v40 = v38 | v37;
            v41 = v45;
            *v45 = v30;
            v41[1] = v32;
            *((_WORD *)v41 + 8) = v40;
            return;
          }
        }
      }

      ++v3;
      if (v25 == v2)
        goto LABEL_36;
    }
    __break(1u);
LABEL_34:
    swift_once();
  }
  __break(1u);
LABEL_38:

  __break(1u);
LABEL_39:
  __break(1u);
}

id sub_1C128F8D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IDSServiceWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C128FAD8()
{
  uint64_t v0;

  sub_1C1292C70(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1C128FAFC(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  _BYTE v19[8];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v9 = *a3;
  v10 = *((_QWORD *)a3 + 1);
  v11 = *((_QWORD *)a3 + 2);
  v13 = *((_QWORD *)a3 + 3);
  v12 = *((_QWORD *)a3 + 4);
  result = MEMORY[0x1C3BA98D0](v5 + 16);
  if (result)
  {
    v17 = a5;
    v15 = *(_QWORD *)(v5 + 24);
    ObjectType = swift_getObjectType();
    v19[0] = v9;
    v20 = v10;
    v21 = v11;
    v22 = v13;
    v23 = v12;
    (*(void (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 8))(a1, a2, v19, a4, v17, ObjectType, v15);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1C128FBAC(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  char v16;
  uint64_t v18;
  _BYTE v20[8];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v9 = *a3;
  v10 = *((_QWORD *)a3 + 1);
  v11 = *((_QWORD *)a3 + 2);
  v13 = *((_QWORD *)a3 + 3);
  v12 = *((_QWORD *)a3 + 4);
  if (MEMORY[0x1C3BA98D0](v5 + 16))
  {
    v18 = a5;
    v14 = *(_QWORD *)(v5 + 24);
    ObjectType = swift_getObjectType();
    v20[0] = v9;
    v21 = v10;
    v22 = v11;
    v23 = v13;
    v24 = v12;
    v16 = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(a1, a2, v20, a4, v18, ObjectType, v14);
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

uint64_t sub_1C128FC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v12;
  uint64_t ObjectType;

  result = MEMORY[0x1C3BA98D0](v5 + 16);
  if (result)
  {
    v12 = *(_QWORD *)(v5 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 24))(a1, a2, a3, a4, a5, ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1C128FD0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t result;
  uint64_t v10;
  uint64_t ObjectType;
  _QWORD v12[2];
  __int16 v13;

  v6 = *a3;
  v7 = a3[1];
  v8 = *((_WORD *)a3 + 8);
  result = MEMORY[0x1C3BA98D0](v3 + 16);
  if (result)
  {
    v10 = *(_QWORD *)(v3 + 24);
    ObjectType = swift_getObjectType();
    v12[0] = v6;
    v12[1] = v7;
    v13 = v8;
    (*(void (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))(v10 + 32))(a1, a2, v12, ObjectType, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

char *IDSSyncService.__allocating_init(service:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return IDSSyncService.init(service:)(a1, a2);
}

char *IDSSyncService.init(service:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  char *v17;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  uint64_t v25;

  v22 = a1;
  v23 = a2;
  v21 = sub_1C12B5564();
  v3 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C12B554C();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v6);
  v8 = sub_1C12B5408();
  MEMORY[0x1E0C80A78](v8);
  v20 = OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue;
  v19[1] = sub_1C1292D18(0, (unint64_t *)&qword_1ED78E8B0);
  v9 = v2;
  sub_1C12B53FC();
  v25 = MEMORY[0x1E0DEE9D8];
  sub_1C127F22C((unint64_t *)&qword_1ED78E880, v7, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78E860);
  sub_1C1291B24((unint64_t *)&unk_1ED78E870, (uint64_t *)&unk_1ED78E860);
  sub_1C12B5600();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF8D8], v21);
  v10 = (void *)sub_1C12B5588();
  *(_QWORD *)(v19[2] + v20) = v10;
  *(_QWORD *)&v9[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates] = MEMORY[0x1E0DEE9D8];
  v11 = &v9[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice];
  *((_WORD *)v11 + 8) = 0;
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *(_DWORD *)&v9[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_pairedDeviceNotificationToken] = -1;
  v12 = objc_allocWithZone((Class)type metadata accessor for IDSServiceWrapper());
  v13 = v10;
  sub_1C12919C8(v22, v23, v13);
  v15 = v14;

  *(_QWORD *)&v9[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper] = v15;
  v16 = (objc_class *)type metadata accessor for IDSSyncService();
  v24.receiver = v9;
  v24.super_class = v16;
  v17 = (char *)objc_msgSendSuper2(&v24, sel_init);
  *(_QWORD *)(*(_QWORD *)&v17[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper]
            + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate
            + 8) = &off_1E7A7E590;
  swift_unknownObjectWeakAssign();
  return v17;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BA97C8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for IDSServiceWrapper()
{
  return objc_opt_self();
}

id IDSSyncService.__deallocating_deinit()
{
  char *v0;
  id v1;
  int *v2;
  objc_super v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  v2 = (int *)&v0[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_pairedDeviceNotificationToken];
  swift_beginAccess();
  notify_cancel(*v2);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for IDSSyncService();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id IDSSyncService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void IDSSyncService.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1C1290300()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;
  unsigned __int16 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t ObjectType;
  uint64_t v28;
  void (*v29)(uint64_t, _UNKNOWN **, uint64_t *, uint64_t, uint64_t);
  uint64_t v30;
  char v31;
  os_log_type_t type;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int16 v39;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice + 8);
  v5 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice + 16);
  v6 = *(_BYTE *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice + 17);
  v7 = *(_WORD *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_pairedDevice + 16);
  swift_bridgeObjectRetain();
  sub_1C128F36C(&v37);
  v8 = v37;
  v9 = v38;
  v10 = v39;
  if (qword_1ED78E810 != -1)
    swift_once();
  v34 = v8;
  v11 = sub_1C12B5390();
  __swift_project_value_buffer(v11, (uint64_t)qword_1ED78DC40);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v12 = sub_1C12B5384();
  type = sub_1C12B5540();
  v33 = v3;
  if (!os_log_type_enabled(v12, type))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    if (v4)
      goto LABEL_5;
LABEL_13:
    v19 = v34;
    if (!v9)
      return;
    goto LABEL_14;
  }
  v31 = v6;
  v13 = swift_slowAlloc();
  v30 = swift_slowAlloc();
  v35[0] = v30;
  *(_DWORD *)v13 = 136446466;
  v37 = v3;
  v38 = v4;
  v39 = v7;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED78E1E0);
  v14 = sub_1C12B5498();
  v37 = sub_1C12882D0(v14, v15, v35);
  sub_1C12B55DC();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v13 + 12) = 2082;
  v37 = v34;
  v38 = v9;
  v39 = v10;
  swift_bridgeObjectRetain();
  v16 = sub_1C12B5498();
  v37 = sub_1C12882D0(v16, v17, v35);
  sub_1C12B55DC();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1C127A000, v12, type, "Updating paired device from %{public}s to %{public}s", (uint8_t *)v13, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v30, -1, -1);
  v18 = v13;
  v6 = v31;
  MEMORY[0x1C3BA9870](v18, -1, -1);

  if (!v4)
    goto LABEL_13;
LABEL_5:
  v19 = v34;
  if (!v9 || (v33 != v34 || v4 != v9) && (sub_1C12B578C() & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  if (v5 != v10 || ((v10 & 0x100) == 0) == (v6 & 1))
  {
LABEL_15:
    *(_QWORD *)v2 = v19;
    *(_QWORD *)(v2 + 8) = v9;
    *(_WORD *)(v2 + 16) = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v20 = v1 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates;
    swift_beginAccess();
    v21 = *(_QWORD *)(*(_QWORD *)v20 + 16);
    if (v21)
    {
      v22 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
      v23 = v9;
      v24 = v19;
      v25 = v1;
      do
      {
        v26 = *v22;
        ObjectType = swift_getObjectType();
        v35[0] = v24;
        v35[1] = v23;
        v36 = v10;
        v28 = v10;
        v29 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t *, uint64_t, uint64_t))(v26 + 32);
        swift_unknownObjectRetain();
        v29(v25, &protocol witness table for IDSSyncService, v35, ObjectType, v26);
        v10 = v28;
        swift_unknownObjectRelease();
        v22 += 2;
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_1C12906E8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1C129077C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int *v10;
  _QWORD v12[6];

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v0, sel_pairedDeviceStateChangedWithNotification_, *MEMORY[0x1E0D517C0], 0);

  v3 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v3, sel_addObserver_selector_name_object_, v0, sel_pairedDeviceStateChangedWithNotification_, *MEMORY[0x1E0D517D0], 0);

  v4 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v0, sel_pairedDeviceStateChangedWithNotification_, *MEMORY[0x1E0D517A8], 0);

  v5 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v5, sel_addObserver_selector_name_object_, v0, sel_pairedDeviceStateChangedWithNotification_, *MEMORY[0x1E0D517B0], 0);

  sub_1C12B5480();
  v6 = *(NSObject **)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue);
  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12[4] = sub_1C1293198;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1C1290ABC;
  v12[3] = &block_descriptor_28;
  v8 = _Block_copy(v12);
  swift_release();
  v9 = sub_1C12B54A4();
  swift_bridgeObjectRelease();
  v10 = (int *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_pairedDeviceNotificationToken);
  swift_beginAccess();
  notify_register_dispatch((const char *)(v9 + 32), v10, v6, v8);
  swift_endAccess();
  _Block_release(v8);
  return swift_release();
}

void sub_1C12909B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1C3BA98D0](v2);
  if (v3)
  {
    v4 = (void *)v3;
    if (qword_1ED78E810 != -1)
      swift_once();
    v5 = sub_1C12B5390();
    __swift_project_value_buffer(v5, (uint64_t)qword_1ED78DC40);
    v6 = sub_1C12B5384();
    v7 = sub_1C12B5540();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C127A000, v6, v7, "Paired watch updated, will check for pairing change", v8, 2u);
      MEMORY[0x1C3BA9870](v8, -1, -1);
    }

    sub_1C1290300();
  }
}

uint64_t sub_1C1290ABC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

Swift::Void __swiftcall IDSSyncService.resume()()
{
  sub_1C1292A6C((uint64_t)&unk_1E7A7E490, (uint64_t)sub_1C1291AEC, (uint64_t)&block_descriptor);
}

void sub_1C1290B14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v1 = sub_1C12B542C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (uint64_t *)((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF740], v1);
  v6 = v5;
  LOBYTE(v5) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper)+ OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_idsService), sel_addDelegate_queue_, *(_QWORD *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper), *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_idsServiceWrapper)+ OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_queue));
    sub_1C129077C();
    sub_1C1290300();
  }
  else
  {
    __break(1u);
  }
}

uint64_t IDSSyncService.send(message:destinations:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  id v12;
  _OWORD v14[2];
  uint64_t v15;

  v9 = *(_OWORD *)(a1 + 16);
  v14[0] = *(_OWORD *)a1;
  v14[1] = v9;
  v15 = *(_QWORD *)(a1 + 32);
  sub_1C12B536C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v4;
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 40) = v11;
  *(_QWORD *)(v10 + 56) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v10 + 64) = a2;
  *(_QWORD *)(v10 + 72) = a3;
  *(_QWORD *)(v10 + 80) = a4;
  v12 = v4;
  sub_1C1291B6C((uint64_t)v14);
  swift_bridgeObjectRetain();
  sub_1C1291BAC(a3);
  sub_1C12B5360();
  return swift_release();
}

uint64_t sub_1C1290D0C(void (*a1)(void), uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, void (*a6)(id, uint64_t, uint64_t))
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  swift_retain();
  sub_1C1291BAC((uint64_t)a6);
  v10 = sub_1C128E444(a4, a5);
  v12 = v11;
  v14 = v13 & 1;
  if (a6)
  {
    swift_retain();
    a6(v10, v12, v14);
    sub_1C1293164((uint64_t)a6);
  }
  a1();
  sub_1C1293154(v10, v12, v14);
  sub_1C1293164((uint64_t)a6);
  return swift_release();
}

uint64_t IDSSyncService.add(delegate:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v12[6];

  v5 = *(NSObject **)&v2[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1C1291BE8;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_1C1291C04;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1C1291038;
  v12[3] = &block_descriptor_12;
  v8 = _Block_copy(v12);
  v9 = v2;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1C1290F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD **v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;

  type metadata accessor for IDSSyncService.WeakDelegate();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v5 + 24) = a3;
  swift_unknownObjectWeakAssign();
  v6 = (_QWORD **)(a1 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates);
  swift_beginAccess();
  v7 = *v6;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v6 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_1C129157C(0, v7[2] + 1, 1, v7);
    *v6 = v7;
  }
  v10 = v7[2];
  v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    v7 = sub_1C129157C((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
    *v6 = v7;
  }
  v7[2] = v10 + 1;
  v11 = &v7[2 * v10];
  v11[4] = v5;
  v11[5] = &off_1E7A7E5A8;
  return swift_endAccess();
}

uint64_t sub_1C1291038(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1C1291060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  id v12;
  _OWORD v14[2];
  uint64_t v15;

  v9 = *(_OWORD *)(a1 + 16);
  v14[0] = *(_OWORD *)a1;
  v14[1] = v9;
  v15 = *(_QWORD *)(a1 + 32);
  sub_1C12B536C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v4;
  v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 40) = v11;
  *(_QWORD *)(v10 + 56) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v10 + 64) = a2;
  *(_QWORD *)(v10 + 72) = a3;
  *(_QWORD *)(v10 + 80) = a4;
  v12 = v4;
  sub_1C1291B6C((uint64_t)v14);
  swift_bridgeObjectRetain();
  sub_1C1291BAC(a3);
  sub_1C12B5360();
  return swift_release();
}

uint64_t sub_1C1291168(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  uint64_t result;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ObjectType;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, _UNKNOWN **, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[8];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v7 = sub_1C12B542C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (uint64_t *)((char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v47 = *(unsigned __int8 *)a1;
  v11 = a1[1];
  v12 = a1[2];
  v13 = *(void **)(v3 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue);
  v49 = a1[3];
  v45 = a1[4];
  v46 = v11;
  *v10 = v13;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DEF740], v7);
  v14 = v13;
  v15 = sub_1C12B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
  if ((v15 & 1) != 0)
  {
    v17 = (uint64_t *)(v3 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates);
    swift_beginAccess();
    result = *v17;
    v18 = *(_QWORD *)(*v17 + 16);
    if (v18)
    {
      v42 = v12;
      v43 = a3;
      v44 = v3;
      v41 = swift_bridgeObjectRetain();
      v19 = (uint64_t *)(v41 + 40);
      v20 = v47;
      v22 = v45;
      v21 = v46;
      v23 = v49;
      do
      {
        v50 = v18;
        v27 = *v19;
        ObjectType = swift_getObjectType();
        v51[0] = v20;
        v29 = v42;
        v52 = v21;
        v53 = v42;
        v54 = v23;
        v55 = v22;
        v30 = *(uint64_t (**)(uint64_t, _UNKNOWN **, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 16);
        swift_unknownObjectRetain();
        v31 = v44;
        v32 = a2;
        v33 = a2;
        v34 = v43;
        v48 = ObjectType;
        if ((v30(v44, &protocol witness table for IDSSyncService, v51, v32, v43, ObjectType, v27) & 1) != 0)
        {
          v24 = v47;
          v51[0] = v47;
          v21 = v46;
          v52 = v46;
          v53 = v29;
          v25 = v45;
          v54 = v49;
          v55 = v45;
          (*(void (**)(uint64_t, _UNKNOWN **, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8))(v31, &protocol witness table for IDSSyncService, v51, v33, v34, v48, v27);
          swift_unknownObjectRelease();
          a2 = v33;
          v20 = v24;
          v22 = v25;
          v26 = v50;
        }
        else
        {
          if (qword_1ED78E810 != -1)
            swift_once();
          v35 = sub_1C12B5390();
          __swift_project_value_buffer(v35, (uint64_t)qword_1ED78DC40);
          v36 = sub_1C12B5384();
          v37 = sub_1C12B5540();
          v38 = os_log_type_enabled(v36, v37);
          a2 = v33;
          v20 = v47;
          v39 = v45;
          v21 = v46;
          v26 = v50;
          if (v38)
          {
            v40 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v40 = 0;
            _os_log_impl(&dword_1C127A000, v36, v37, "Discarding message because delegate rejected it", v40, 2u);
            MEMORY[0x1C3BA9870](v40, -1, -1);
            swift_unknownObjectRelease();

          }
          else
          {

            swift_unknownObjectRelease();
          }
          v22 = v39;
        }
        v19 += 2;
        v18 = v26 - 1;
        v23 = v49;
      }
      while (v18);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_1C1291470(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4200);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C1291C68(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1C129157C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E8C0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C1292E44(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C1291688(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C12916B0(a1, a2, a3, a4, (uint64_t *)&unk_1EF6D4210, type metadata accessor for Record);
}

uint64_t sub_1C129169C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C12916B0(a1, a2, a3, a4, (uint64_t *)&unk_1EF6D44F0, type metadata accessor for RecordMetadata);
}

uint64_t sub_1C12916B0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_1C12B56B4();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C129303C(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_1C12918BC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D40F0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C1292F4C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_1C12919C8(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  id v5;
  char *v6;
  void *v7;
  id v8;
  id v9;
  objc_super v10;

  *(_QWORD *)&v3[OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v5 = objc_allocWithZone(MEMORY[0x1E0D34358]);
  v6 = v3;
  v7 = (void *)sub_1C12B5474();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_initWithService_, v7);

  if (v8)
  {
    *(_QWORD *)&v6[OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_idsService] = v8;
    *(_QWORD *)&v6[OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_queue] = a3;
    v9 = a3;

    v10.receiver = v6;
    v10.super_class = (Class)type metadata accessor for IDSServiceWrapper();
    objc_msgSendSuper2(&v10, sel_init);
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for IDSSyncService()
{
  return objc_opt_self();
}

uint64_t sub_1C1291AC8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1C1291AEC()
{
  sub_1C1290B14();
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

uint64_t sub_1C1291B24(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C1291B6C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  swift_bridgeObjectRetain();
  sub_1C127CE48(v2, v3);
  return a1;
}

uint64_t sub_1C1291BAC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1C1291BBC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C1291BE8()
{
  uint64_t *v0;

  return sub_1C1290F24(v0[2], v0[3], v0[4]);
}

uint64_t sub_1C1291BF4()
{
  return swift_deallocObject();
}

uint64_t sub_1C1291C04()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C1291C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_1C1291C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t method lookup function for IDSSyncService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IDSSyncService.__allocating_init(service:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t type metadata accessor for IDSSyncService.WeakDelegate()
{
  return objc_opt_self();
}

uint64_t sub_1C1291C68(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1C12B56FC();
  __break(1u);
  return result;
}

_QWORD *sub_1C1291D58(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *result;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;

  if (!(a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_20:
    v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_21:
    swift_bridgeObjectRelease();
    return v4;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  v3 = sub_1C12B56CC();
  if (!v3)
    goto LABEL_20;
LABEL_3:
  v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v5 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x1C3BA9264](v5 - 4, a1);
    else
      v6 = *(id *)(a1 + 8 * v5);
    v7 = v6;
    v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    result = objc_msgSend(v6, sel_uniqueIDOverride);
    if (!result)
      break;
    v10 = result;
    v11 = sub_1C12B5480();
    v13 = v12;

    LOBYTE(v10) = sub_1C1286488(v11, v13, a2);
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0 && (v14 = IDSCopyIDForDevice()) != 0)
    {
      v15 = (void *)v14;
      v16 = sub_1C12B5480();
      v18 = v17;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_1C1291470(0, v4[2] + 1, 1, v4);
      v20 = v4[2];
      v19 = v4[3];
      if (v20 >= v19 >> 1)
        v4 = sub_1C1291470((_QWORD *)(v19 > 1), v20 + 1, 1, v4);
      v4[2] = v20 + 1;
      v21 = &v4[2 * v20];
      v21[4] = v16;
      v21[5] = v18;
    }
    else
    {

    }
    ++v5;
    if (v8 == v3)
      goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C1291F38(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1C12B5528();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1C1288960(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_1C1291FCC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;

  if (!a1)
  {
    __break(1u);
LABEL_42:
    __break(1u);
    return;
  }
  if (a4)
    v8 = (void *)sub_1C12B5474();
  else
    v8 = 0;
  v39 = objc_msgSend(a1, sel_deviceForFromID_, v8);

  if (v39)
  {
    v9 = objc_msgSend(v39, sel_uniqueIDOverride);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1C12B5480();
      v13 = v12;

      if (MEMORY[0x1C3BA98D0](v4 + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate))
      {
        if (a2)
        {
          sub_1C12B5630();
          if (*(_QWORD *)(a2 + 16) && (v14 = sub_1C1289400((uint64_t)&v40), (v15 & 1) != 0))
          {
            sub_1C128E220(*(_QWORD *)(a2 + 56) + 32 * v14, (uint64_t)&v44);
          }
          else
          {
            v44 = 0u;
            v45 = 0u;
          }
          sub_1C128E1DC((uint64_t)&v40);
          if (*((_QWORD *)&v45 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              sub_1C12B5270();
              swift_allocObject();
              sub_1C12B5264();
              sub_1C1292CD4();
              sub_1C12B5258();
              v37 = v42;
              v38 = v43;
              sub_1C1291168(&v40, v11, v13);
              swift_release();
              sub_1C127CE8C(0x6567617373656DLL, 0xE700000000000000);
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();

              sub_1C127CE8C(v37, v38);
              return;
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            sub_1C1292C94((uint64_t)&v44);
          }
          if (qword_1ED78E810 != -1)
            swift_once();
          v34 = sub_1C12B5390();
          __swift_project_value_buffer(v34, (uint64_t)qword_1ED78DC40);
          v24 = sub_1C12B5384();
          v35 = sub_1C12B5534();
          if (!os_log_type_enabled(v24, v35))
          {

            swift_unknownObjectRelease();
            goto LABEL_40;
          }
          v36 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_1C127A000, v24, v35, "Message has no payload", v36, 2u);
          MEMORY[0x1C3BA9870](v36, -1, -1);
          swift_unknownObjectRelease();
LABEL_38:

LABEL_40:
          return;
        }
        goto LABEL_42;
      }
      swift_bridgeObjectRelease();
      if (qword_1ED78E810 != -1)
        swift_once();
      v30 = sub_1C12B5390();
      __swift_project_value_buffer(v30, (uint64_t)qword_1ED78DC40);
      v31 = sub_1C12B5384();
      v32 = sub_1C12B5534();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_1C127A000, v31, v32, "Delegate is not configured; ignoring incoming message", v33, 2u);
        MEMORY[0x1C3BA9870](v33, -1, -1);
      }

    }
    else
    {
      if (qword_1ED78E810 != -1)
        swift_once();
      v23 = sub_1C12B5390();
      __swift_project_value_buffer(v23, (uint64_t)qword_1ED78DC40);
      swift_bridgeObjectRetain_n();
      v24 = sub_1C12B5384();
      v25 = sub_1C12B5534();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        *(_QWORD *)&v44 = v27;
        *(_DWORD *)v26 = 136446210;
        v41 = a4;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41B8);
        v28 = sub_1C12B5498();
        v40 = sub_1C12882D0(v28, v29, (uint64_t *)&v44);
        sub_1C12B55DC();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C127A000, v24, v25, "Received message from device with no uniqueIDOverride: %{public}s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v27, -1, -1);
        MEMORY[0x1C3BA9870](v26, -1, -1);
        goto LABEL_38;
      }

      swift_bridgeObjectRelease_n();
    }

    return;
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v16 = sub_1C12B5390();
  __swift_project_value_buffer(v16, (uint64_t)qword_1ED78DC40);
  swift_bridgeObjectRetain_n();
  v17 = sub_1C12B5384();
  v18 = sub_1C12B5534();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    *(_QWORD *)&v44 = v20;
    *(_DWORD *)v19 = 136446210;
    v41 = a4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41B8);
    v21 = sub_1C12B5498();
    v40 = sub_1C12882D0(v21, v22, (uint64_t *)&v44);
    sub_1C12B55DC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v17, v18, "Received message from unknown device: %{public}s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v20, -1, -1);
    MEMORY[0x1C3BA9870](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_1C12927BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t result;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t ObjectType;
  void (*v22)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;

  v4 = v3;
  v8 = sub_1C12B542C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (uint64_t *)((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)(v4 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue);
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF740], v8);
  v13 = v12;
  LOBYTE(v12) = sub_1C12B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) != 0)
  {
    v15 = (uint64_t *)(v4 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService__queue_delegates);
    swift_beginAccess();
    result = *v15;
    v16 = *(_QWORD *)(*v15 + 16);
    if (v16)
    {
      v23 = swift_bridgeObjectRetain();
      v17 = (uint64_t *)(v23 + 40);
      v18 = a2;
      v19 = a3;
      do
      {
        v20 = *v17;
        ObjectType = swift_getObjectType();
        v22 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 24);
        swift_unknownObjectRetain();
        v22(v4, &protocol witness table for IDSSyncService, a1, v18, v19, ObjectType, v20);
        swift_unknownObjectRelease();
        v17 += 2;
        --v16;
      }
      while (v16);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C1292934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  NSObject *oslog;

  if (MEMORY[0x1C3BA98D0](v3 + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate))
  {
    if (a2)
    {
      sub_1C12927BC(a1, a2, a3);
      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v7 = sub_1C12B5390();
    __swift_project_value_buffer(v7, (uint64_t)qword_1ED78DC40);
    oslog = sub_1C12B5384();
    v8 = sub_1C12B5534();
    if (os_log_type_enabled(oslog, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1C127A000, oslog, v8, "Delegate is not configured; ignoring successful message send", v9, 2u);
      MEMORY[0x1C3BA9870](v9, -1, -1);
    }

  }
}

uint64_t sub_1C1292A6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v6 = sub_1C12B53E4();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1C12B5408();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *(_QWORD *)&v3[OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_queue];
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v3;
  aBlock[4] = a2;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C12906E8;
  aBlock[3] = a3;
  v15 = _Block_copy(aBlock);
  v16 = v3;
  sub_1C12B53F0();
  v20 = MEMORY[0x1E0DEE9D8];
  sub_1C127F22C((unint64_t *)&unk_1ED78E840, v7, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78DC70);
  sub_1C1291B24((unint64_t *)&unk_1ED78E850, (uint64_t *)&unk_1ED78DC70);
  sub_1C12B5600();
  MEMORY[0x1C3BA9168](0, v13, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

void sub_1C1292C50()
{
  sub_1C1290300();
}

uint64_t sub_1C1292C70(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1C1292C94(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C1292CD4()
{
  unint64_t result;

  result = qword_1EF6D41C8;
  if (!qword_1EF6D41C8)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for Message, &type metadata for Message);
    atomic_store(result, (unint64_t *)&qword_1EF6D41C8);
  }
  return result;
}

uint64_t sub_1C1292D18(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1C1292D50()
{
  unint64_t result;

  result = qword_1EF6D41D8;
  if (!qword_1EF6D41D8)
  {
    result = MEMORY[0x1C3BA97D4]("=~|&p2", &type metadata for Message);
    atomic_store(result, (unint64_t *)&qword_1EF6D41D8);
  }
  return result;
}

unint64_t sub_1C1292D94()
{
  unint64_t result;

  result = qword_1EF6D41E8;
  if (!qword_1EF6D41E8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6C64, &type metadata for IDSServiceWrapper.SyncError);
    atomic_store(result, (unint64_t *)&qword_1EF6D41E8);
  }
  return result;
}

uint64_t sub_1C1292DD8()
{
  return swift_release();
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1C127CE8C(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 72))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C1292E30(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;

  return sub_1C1290D0C(a1, a2, *(_QWORD *)(v2 + 16), (_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 64), *(void (**)(id, uint64_t, uint64_t))(v2 + 72));
}

uint64_t sub_1C1292E44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DCB8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1C12B56FC();
  __break(1u);
  return result;
}

uint64_t sub_1C1292F4C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1C12B56FC();
  __break(1u);
  return result;
}

uint64_t sub_1C129303C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_1C12B56FC();
  __break(1u);
  return result;
}

void sub_1C1293154(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_1C1293164(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1C1293174()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1C1293198(uint64_t a1)
{
  uint64_t v1;

  sub_1C12909B4(a1, v1);
}

uint64_t getEnumTagSinglePayload for IDSServiceWrapper.SyncError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IDSServiceWrapper.SyncError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C1293234 + 4 * byte_1C12B6B20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C1293254 + 4 * byte_1C12B6B25[v4]))();
}

_BYTE *sub_1C1293234(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C1293254(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C129325C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C1293264(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C129326C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C1293274(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1C1293280()
{
  return 0;
}

ValueMetadata *type metadata accessor for IDSServiceWrapper.SyncError()
{
  return &type metadata for IDSServiceWrapper.SyncError;
}

unint64_t sub_1C129329C()
{
  unint64_t result;

  result = qword_1EF6D4220;
  if (!qword_1EF6D4220)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6C3C, &type metadata for IDSServiceWrapper.SyncError);
    atomic_store(result, (unint64_t *)&qword_1EF6D4220);
  }
  return result;
}

uint64_t SyncMessage.AckAction.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6563616C706572;
  else
    return 0x657461647075;
}

BOOL static SyncMessage.AckAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SyncMessage.AckAction.hash(into:)()
{
  return sub_1C12B57EC();
}

uint64_t sub_1C1293374()
{
  _BYTE *v0;

  if (*v0)
    return 0x6563616C706572;
  else
    return 0x657461647075;
}

uint64_t sub_1C12933AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1296320(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C12933D0()
{
  sub_1C12936AC();
  return sub_1C12B5828();
}

uint64_t sub_1C12933F8()
{
  sub_1C12936AC();
  return sub_1C12B5834();
}

uint64_t sub_1C1293420()
{
  return 0;
}

void sub_1C129342C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1C1293438()
{
  sub_1C12936F0();
  return sub_1C12B5828();
}

uint64_t sub_1C1293460()
{
  sub_1C12936F0();
  return sub_1C12B5834();
}

uint64_t sub_1C1293488()
{
  sub_1C1293734();
  return sub_1C12B5828();
}

uint64_t sub_1C12934B0()
{
  sub_1C1293734();
  return sub_1C12B5834();
}

uint64_t SyncMessage.AckAction.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4230);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4238);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4240);
  v18 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C12936AC();
  sub_1C12B581C();
  if ((v12 & 1) != 0)
  {
    v20 = 1;
    sub_1C12936F0();
    sub_1C12B5750();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_1C1293734();
    sub_1C12B5750();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v9);
}

unint64_t sub_1C12936AC()
{
  unint64_t result;

  result = qword_1EF6D4248;
  if (!qword_1EF6D4248)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B77A4, &type metadata for SyncMessage.AckAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4248);
  }
  return result;
}

unint64_t sub_1C12936F0()
{
  unint64_t result;

  result = qword_1EF6D4250;
  if (!qword_1EF6D4250)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7754, &type metadata for SyncMessage.AckAction.ReplaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4250);
  }
  return result;
}

unint64_t sub_1C1293734()
{
  unint64_t result;

  result = qword_1EF6D4258;
  if (!qword_1EF6D4258)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7704, &type metadata for SyncMessage.AckAction.UpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4258);
  }
  return result;
}

uint64_t SyncMessage.AckAction.hashValue.getter()
{
  sub_1C12B57E0();
  sub_1C12B57EC();
  return sub_1C12B5804();
}

uint64_t SyncMessage.AckAction.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v30 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4260);
  v32 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4268);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4270);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C12936AC();
  v11 = v33;
  sub_1C12B5810();
  if (v11)
    goto LABEL_7;
  v26 = v4;
  v27 = a1;
  v12 = v31;
  v13 = v32;
  v33 = v8;
  v14 = sub_1C12B5744();
  v15 = v7;
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v19 = sub_1C12B5690();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4278);
    *v21 = &type metadata for SyncMessage.AckAction;
    sub_1C12B5714();
    sub_1C12B5684();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x1E0DEC450], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v15);
    a1 = v27;
LABEL_7:
    v24 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  v16 = *(_BYTE *)(v14 + 32);
  if ((v16 & 1) != 0)
  {
    LODWORD(v28) = *(unsigned __int8 *)(v14 + 32);
    v35 = 1;
    sub_1C12936F0();
    sub_1C12B5708();
    v17 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v15);
    v16 = v28;
  }
  else
  {
    v34 = 0;
    sub_1C1293734();
    v22 = v6;
    sub_1C12B5708();
    v23 = v33;
    v18 = v30;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v15);
  }
  *v18 = v16;
  v24 = (uint64_t)v27;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t sub_1C1293B14@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return SyncMessage.AckAction.init(from:)(a1, a2);
}

uint64_t sub_1C1293B28(_QWORD *a1)
{
  return SyncMessage.AckAction.encode(to:)(a1);
}

uint64_t sub_1C1293B3C()
{
  _BYTE *v0;

  if (*v0)
    return 0x617461646174656DLL;
  else
    return 0x6E6F69746361;
}

uint64_t sub_1C1293B74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C1296408(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C1293B98()
{
  sub_1C12945C0();
  return sub_1C12B5828();
}

uint64_t sub_1C1293BC0()
{
  sub_1C12945C0();
  return sub_1C12B5834();
}

uint64_t sub_1C1293BE8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1C1293C14 + 4 * byte_1C12B6CB0[*v0]))(0x657461647075, 0xE600000000000000);
}

uint64_t sub_1C1293C14()
{
  return 0x6563616C706572;
}

uint64_t sub_1C1293C2C()
{
  return 7037793;
}

uint64_t sub_1C1293C3C()
{
  return 0x6B636F6C6E75;
}

uint64_t sub_1C1293C4C()
{
  return 0x636E79736572;
}

uint64_t sub_1C1293C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C12964F0(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C1293C80(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1C1293C8C()
{
  sub_1C12944F4();
  return sub_1C12B5828();
}

uint64_t sub_1C1293CB4()
{
  sub_1C12944F4();
  return sub_1C12B5834();
}

uint64_t sub_1C1293CDC()
{
  sub_1C1294648();
  return sub_1C12B5828();
}

uint64_t sub_1C1293D04()
{
  sub_1C1294648();
  return sub_1C12B5834();
}

uint64_t sub_1C1293D2C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1C1293D58()
{
  sub_1C1294538();
  return sub_1C12B5828();
}

uint64_t sub_1C1293D80()
{
  sub_1C1294538();
  return sub_1C12B5834();
}

uint64_t sub_1C1293DA8()
{
  sub_1C129457C();
  return sub_1C12B5828();
}

uint64_t sub_1C1293DD0()
{
  sub_1C129457C();
  return sub_1C12B5834();
}

uint64_t sub_1C1293DF8()
{
  _BYTE *v0;

  if (*v0)
    return 0x4D646574656C6564;
  else
    return 0x6465696669646F6DLL;
}

uint64_t sub_1C1293E4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C12966E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C1293E70()
{
  sub_1C129468C();
  return sub_1C12B5828();
}

uint64_t sub_1C1293E98()
{
  sub_1C129468C();
  return sub_1C12B5834();
}

void SyncMessage.MessageType.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[14];
  uint64_t v13;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4280);
  v12[4] = *(_QWORD *)(v3 - 8);
  v12[5] = v3;
  MEMORY[0x1E0C80A78](v3);
  v12[3] = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4288);
  v12[1] = *(_QWORD *)(v5 - 8);
  v12[2] = v5;
  MEMORY[0x1E0C80A78](v5);
  v12[0] = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4290);
  v12[11] = *(_QWORD *)(v7 - 8);
  v12[12] = v7;
  MEMORY[0x1E0C80A78](v7);
  v12[10] = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4298);
  v12[8] = *(_QWORD *)(v9 - 8);
  v12[9] = v9;
  MEMORY[0x1E0C80A78](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D42A0);
  v12[6] = *(_QWORD *)(v10 - 8);
  v12[7] = v10;
  MEMORY[0x1E0C80A78](v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D42A8);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v12[13] = *(_QWORD *)(v1 + 8);
  v11 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C12944F4();
  sub_1C12B581C();
  __asm { BR              X9 }
}

uint64_t sub_1C12940C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v3 - 88) = 0;
  sub_1C129468C();
  v4 = *(_QWORD *)(v3 - 112);
  sub_1C12B5750();
  *(_QWORD *)(v3 - 88) = v1;
  *(_BYTE *)(v3 - 65) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D42F0);
  sub_1C12950A8(&qword_1EF6D42F8, &qword_1EF6D4300, (uint64_t)&protocol conformance descriptor for Record, MEMORY[0x1E0DEAF10]);
  v5 = *(_QWORD *)(v3 - 168);
  v6 = *(_QWORD *)(v3 - 104);
  sub_1C12B5774();
  if (!v6)
  {
    *(_QWORD *)(v3 - 88) = *(_QWORD *)(v3 - 120);
    *(_BYTE *)(v3 - 65) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D42D8);
    sub_1C1295024(&qword_1EF6D42E0, &qword_1EF6D3FA0, (uint64_t)&protocol conformance descriptor for RecordMetadata, MEMORY[0x1E0DEAF10]);
    sub_1C12B5774();
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 176) + 8))(v2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8))(v0, v4);
}

unint64_t sub_1C12944F4()
{
  unint64_t result;

  result = qword_1EF6D42B0;
  if (!qword_1EF6D42B0)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B76B4, &type metadata for SyncMessage.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D42B0);
  }
  return result;
}

unint64_t sub_1C1294538()
{
  unint64_t result;

  result = qword_1EF6D42B8;
  if (!qword_1EF6D42B8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7664, &type metadata for SyncMessage.MessageType.ResyncCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D42B8);
  }
  return result;
}

unint64_t sub_1C129457C()
{
  unint64_t result;

  result = qword_1EF6D42C0;
  if (!qword_1EF6D42C0)
  {
    result = MEMORY[0x1C3BA97D4]("}w|&0\"", &type metadata for SyncMessage.MessageType.UnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D42C0);
  }
  return result;
}

unint64_t sub_1C12945C0()
{
  unint64_t result;

  result = qword_1EF6D42C8;
  if (!qword_1EF6D42C8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B75C4, &type metadata for SyncMessage.MessageType.AckCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D42C8);
  }
  return result;
}

unint64_t sub_1C1294604()
{
  unint64_t result;

  result = qword_1EF6D42D0;
  if (!qword_1EF6D42D0)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncMessage.AckAction, &type metadata for SyncMessage.AckAction);
    atomic_store(result, (unint64_t *)&qword_1EF6D42D0);
  }
  return result;
}

unint64_t sub_1C1294648()
{
  unint64_t result;

  result = qword_1EF6D42E8;
  if (!qword_1EF6D42E8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7574, &type metadata for SyncMessage.MessageType.ReplaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D42E8);
  }
  return result;
}

unint64_t sub_1C129468C()
{
  unint64_t result;

  result = qword_1EF6D4308;
  if (!qword_1EF6D4308)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7524, &type metadata for SyncMessage.MessageType.UpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4308);
  }
  return result;
}

uint64_t SyncMessage.MessageType.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;

  v31 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4310);
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x1E0C80A78](v3);
  v36 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4318);
  v25[4] = *(_QWORD *)(v5 - 8);
  v25[5] = v5;
  MEMORY[0x1E0C80A78](v5);
  v32 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4320);
  v29 = *(_QWORD *)(v35 - 8);
  MEMORY[0x1E0C80A78](v35);
  v34 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4328);
  v30 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v33 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4330);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4338);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_1C12944F4();
  v18 = v38;
  sub_1C12B5810();
  if (!v18)
  {
    v25[2] = v9;
    v25[3] = v12;
    v25[1] = v10;
    v38 = v14;
    v19 = sub_1C12B5744();
    if (*(_QWORD *)(v19 + 16) == 1)
      __asm { BR              X10 }
    v20 = sub_1C12B5690();
    swift_allocError();
    v21 = v13;
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4278);
    *v23 = &type metadata for SyncMessage.MessageType;
    sub_1C12B5714();
    sub_1C12B5684();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v23, *MEMORY[0x1E0DEC450], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v16, v21);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
}

unint64_t sub_1C1294FE0()
{
  unint64_t result;

  result = qword_1EF6D4340;
  if (!qword_1EF6D4340)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncMessage.AckAction, &type metadata for SyncMessage.AckAction);
    atomic_store(result, (unint64_t *)&qword_1EF6D4340);
  }
  return result;
}

uint64_t sub_1C1295024(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF6D42D8);
    v10 = sub_1C127F22C(a2, type metadata accessor for RecordMetadata, a3);
    result = MEMORY[0x1C3BA97D4](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C12950A8(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF6D42F0);
    v10 = sub_1C127F22C(a2, type metadata accessor for Record, a3);
    result = MEMORY[0x1C3BA97D4](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C129512C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncMessage.MessageType.init(from:)(a1, a2);
}

void sub_1C1295140(_QWORD *a1)
{
  SyncMessage.MessageType.encode(to:)(a1);
}

uint64_t SyncMessage.messageType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_1C1295168(v2, v3, v4);
}

uint64_t sub_1C1295168(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 >= 2u)
  {
    if (a3 != 2)
      return result;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

__n128 SyncMessage.init(messageType:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unsigned __int8 v2;
  __n128 result;

  v2 = a1[1].n128_u8[0];
  result = *a1;
  *a2 = *a1;
  a2[1].n128_u8[0] = v2;
  return result;
}

uint64_t sub_1C12951C0()
{
  return 0x546567617373656DLL;
}

uint64_t sub_1C12951E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x546567617373656DLL && a2 == 0xEB00000000657079)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1C12B578C();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1C129528C()
{
  sub_1C12953EC();
  return sub_1C12B5828();
}

uint64_t sub_1C12952B4()
{
  sub_1C12953EC();
  return sub_1C12B5834();
}

uint64_t SyncMessage.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD v10[3];
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4360);
  v10[0] = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v6 = v1[1];
  v8 = *((_BYTE *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C12953EC();
  sub_1C12B581C();
  v10[1] = v7;
  v10[2] = v6;
  v11 = v8;
  sub_1C1295430();
  sub_1C12B5774();
  return (*(uint64_t (**)(char *, uint64_t))(v10[0] + 8))(v5, v3);
}

unint64_t sub_1C12953EC()
{
  unint64_t result;

  result = qword_1EF6D4368;
  if (!qword_1EF6D4368)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B74D4, &type metadata for SyncMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4368);
  }
  return result;
}

unint64_t sub_1C1295430()
{
  unint64_t result;

  result = qword_1EF6D4370;
  if (!qword_1EF6D4370)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncMessage.MessageType, &type metadata for SyncMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_1EF6D4370);
  }
  return result;
}

uint64_t SyncMessage.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  __int128 v11;
  char v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4378);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C12953EC();
  sub_1C12B5810();
  if (!v2)
  {
    sub_1C129559C();
    sub_1C12B5738();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v12;
    *(_OWORD *)a2 = v11;
    *(_BYTE *)(a2 + 16) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1C129559C()
{
  unint64_t result;

  result = qword_1EF6D4380;
  if (!qword_1EF6D4380)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncMessage.MessageType, &type metadata for SyncMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_1EF6D4380);
  }
  return result;
}

unint64_t sub_1C12955E4()
{
  unint64_t result;

  result = qword_1EF6D4388;
  if (!qword_1EF6D4388)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncMessage.AckAction, &type metadata for SyncMessage.AckAction);
    atomic_store(result, (unint64_t *)&qword_1EF6D4388);
  }
  return result;
}

uint64_t sub_1C1295628@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SyncMessage.init(from:)(a1, a2);
}

uint64_t sub_1C129563C(_QWORD *a1)
{
  return SyncMessage.encode(to:)(a1);
}

uint64_t sub_1C1295654(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 >= 2u)
  {
    if (a3 != 2)
      return result;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SyncMessage()
{
  return &type metadata for SyncMessage;
}

ValueMetadata *type metadata accessor for SyncMessage.AckAction()
{
  return &type metadata for SyncMessage.AckAction;
}

uint64_t destroy for SyncMessage.MessageType(uint64_t a1)
{
  return sub_1C1295654(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1C1295168(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwca_0(uint64_t a1, uint64_t a2)
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
  sub_1C1295168(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1C1295654(v6, v7, v8);
  return a1;
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwta_0(uint64_t a1, uint64_t a2)
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
  sub_1C1295654(v4, v5, v6);
  return a1;
}

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwet_0(uint64_t a1, unsigned int a2)
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

uint64_t _s17SessionSyncEngine11SyncMessageV11MessageTypeOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1C129585C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_1C1295874(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for SyncMessage.MessageType()
{
  return &type metadata for SyncMessage.MessageType;
}

uint64_t storeEnumTagSinglePayload for SyncMessage.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C12958DC + 4 * byte_1C12B6CBE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C12958FC + 4 * byte_1C12B6CC3[v4]))();
}

_BYTE *sub_1C12958DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C12958FC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C1295904(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C129590C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C1295914(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C129591C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SyncMessage.CodingKeys()
{
  return &type metadata for SyncMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SyncMessage.MessageType.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SyncMessage.MessageType.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C1295A14 + 4 * byte_1C12B6CCD[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1C1295A48 + 4 * byte_1C12B6CC8[v4]))();
}

uint64_t sub_1C1295A48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1295A50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C1295A58);
  return result;
}

uint64_t sub_1C1295A64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C1295A6CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1C1295A70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1295A78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.CodingKeys()
{
  return &type metadata for SyncMessage.MessageType.CodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.UpdateCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.UpdateCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.ReplaceCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.ReplaceCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.AckCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.AckCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.UnlockCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.UnlockCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.MessageType.ResyncCodingKeys()
{
  return &type metadata for SyncMessage.MessageType.ResyncCodingKeys;
}

uint64_t _s17SessionSyncEngine11SyncMessageV9AckActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C1295B30 + 4 * byte_1C12B6CD7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C1295B64 + 4 * byte_1C12B6CD2[v4]))();
}

uint64_t sub_1C1295B64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1295B6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C1295B74);
  return result;
}

uint64_t sub_1C1295B80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C1295B88);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C1295B8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C1295B94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncMessage.AckAction.CodingKeys()
{
  return &type metadata for SyncMessage.AckAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.AckAction.UpdateCodingKeys()
{
  return &type metadata for SyncMessage.AckAction.UpdateCodingKeys;
}

ValueMetadata *type metadata accessor for SyncMessage.AckAction.ReplaceCodingKeys()
{
  return &type metadata for SyncMessage.AckAction.ReplaceCodingKeys;
}

unint64_t sub_1C1295BD4()
{
  unint64_t result;

  result = qword_1EF6D4390;
  if (!qword_1EF6D4390)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7074, &type metadata for SyncMessage.AckAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4390);
  }
  return result;
}

unint64_t sub_1C1295C1C()
{
  unint64_t result;

  result = qword_1EF6D4398;
  if (!qword_1EF6D4398)
  {
    result = MEMORY[0x1C3BA97D4]("M{|&T&", &type metadata for SyncMessage.MessageType.AckCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4398);
  }
  return result;
}

unint64_t sub_1C1295C64()
{
  unint64_t result;

  result = qword_1EF6D43A0;
  if (!qword_1EF6D43A0)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7284, &type metadata for SyncMessage.MessageType.ReplaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43A0);
  }
  return result;
}

unint64_t sub_1C1295CAC()
{
  unint64_t result;

  result = qword_1EF6D43A8;
  if (!qword_1EF6D43A8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B733C, &type metadata for SyncMessage.MessageType.UpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43A8);
  }
  return result;
}

unint64_t sub_1C1295CF4()
{
  unint64_t result;

  result = qword_1EF6D43B0;
  if (!qword_1EF6D43B0)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B73F4, &type metadata for SyncMessage.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43B0);
  }
  return result;
}

unint64_t sub_1C1295D3C()
{
  unint64_t result;

  result = qword_1EF6D43B8;
  if (!qword_1EF6D43B8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B74AC, &type metadata for SyncMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43B8);
  }
  return result;
}

unint64_t sub_1C1295D84()
{
  unint64_t result;

  result = qword_1EF6D43C0;
  if (!qword_1EF6D43C0)
  {
    result = MEMORY[0x1C3BA97D4]("ey|&t#", &type metadata for SyncMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43C0);
  }
  return result;
}

unint64_t sub_1C1295DCC()
{
  unint64_t result;

  result = qword_1EF6D43C8;
  if (!qword_1EF6D43C8)
  {
    result = MEMORY[0x1C3BA97D4]("-y|&L#", &type metadata for SyncMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43C8);
  }
  return result;
}

unint64_t sub_1C1295E14()
{
  unint64_t result;

  result = qword_1EF6D43D0;
  if (!qword_1EF6D43D0)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B72AC, &type metadata for SyncMessage.MessageType.UpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43D0);
  }
  return result;
}

unint64_t sub_1C1295E5C()
{
  unint64_t result;

  result = qword_1EF6D43D8;
  if (!qword_1EF6D43D8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B72D4, &type metadata for SyncMessage.MessageType.UpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43D8);
  }
  return result;
}

unint64_t sub_1C1295EA4()
{
  unint64_t result;

  result = qword_1EF6D43E0;
  if (!qword_1EF6D43E0)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B71F4, &type metadata for SyncMessage.MessageType.ReplaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43E0);
  }
  return result;
}

unint64_t sub_1C1295EEC()
{
  unint64_t result;

  result = qword_1EF6D43E8;
  if (!qword_1EF6D43E8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B721C, &type metadata for SyncMessage.MessageType.ReplaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43E8);
  }
  return result;
}

unint64_t sub_1C1295F34()
{
  unint64_t result;

  result = qword_1EF6D43F0;
  if (!qword_1EF6D43F0)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B713C, &type metadata for SyncMessage.MessageType.AckCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43F0);
  }
  return result;
}

unint64_t sub_1C1295F7C()
{
  unint64_t result;

  result = qword_1EF6D43F8;
  if (!qword_1EF6D43F8)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7164, &type metadata for SyncMessage.MessageType.AckCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D43F8);
  }
  return result;
}

unint64_t sub_1C1295FC4()
{
  unint64_t result;

  result = qword_1EF6D4400;
  if (!qword_1EF6D4400)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B70EC, &type metadata for SyncMessage.MessageType.UnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4400);
  }
  return result;
}

unint64_t sub_1C129600C()
{
  unint64_t result;

  result = qword_1EF6D4408;
  if (!qword_1EF6D4408)
  {
    result = MEMORY[0x1C3BA97D4]("]||&0'", &type metadata for SyncMessage.MessageType.UnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4408);
  }
  return result;
}

unint64_t sub_1C1296054()
{
  unint64_t result;

  result = qword_1EF6D4410;
  if (!qword_1EF6D4410)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B709C, &type metadata for SyncMessage.MessageType.ResyncCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4410);
  }
  return result;
}

unint64_t sub_1C129609C()
{
  unint64_t result;

  result = qword_1EF6D4418;
  if (!qword_1EF6D4418)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B70C4, &type metadata for SyncMessage.MessageType.ResyncCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4418);
  }
  return result;
}

unint64_t sub_1C12960E4()
{
  unint64_t result;

  result = qword_1EF6D4420;
  if (!qword_1EF6D4420)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B7364, &type metadata for SyncMessage.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4420);
  }
  return result;
}

unint64_t sub_1C129612C()
{
  unint64_t result;

  result = qword_1EF6D4428;
  if (!qword_1EF6D4428)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B738C, &type metadata for SyncMessage.MessageType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4428);
  }
  return result;
}

unint64_t sub_1C1296174()
{
  unint64_t result;

  result = qword_1EF6D4430;
  if (!qword_1EF6D4430)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6F94, &type metadata for SyncMessage.AckAction.UpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4430);
  }
  return result;
}

unint64_t sub_1C12961BC()
{
  unint64_t result;

  result = qword_1EF6D4438;
  if (!qword_1EF6D4438)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6FBC, &type metadata for SyncMessage.AckAction.UpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4438);
  }
  return result;
}

unint64_t sub_1C1296204()
{
  unint64_t result;

  result = qword_1EF6D4440;
  if (!qword_1EF6D4440)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6F44, &type metadata for SyncMessage.AckAction.ReplaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4440);
  }
  return result;
}

unint64_t sub_1C129624C()
{
  unint64_t result;

  result = qword_1EF6D4448;
  if (!qword_1EF6D4448)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6F6C, &type metadata for SyncMessage.AckAction.ReplaceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4448);
  }
  return result;
}

unint64_t sub_1C1296294()
{
  unint64_t result;

  result = qword_1EF6D4450;
  if (!qword_1EF6D4450)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B6FE4, &type metadata for SyncMessage.AckAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4450);
  }
  return result;
}

unint64_t sub_1C12962DC()
{
  unint64_t result;

  result = qword_1EF6D4458;
  if (!qword_1EF6D4458)
  {
    result = MEMORY[0x1C3BA97D4](&unk_1C12B700C, &type metadata for SyncMessage.AckAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6D4458);
  }
  return result;
}

uint64_t sub_1C1296320(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x657461647075 && a2 == 0xE600000000000000;
  if (v2 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6563616C706572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1C12B578C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1C1296408(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
  if (v2 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1C12B578C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1C12964F0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x657461647075 && a2 == 0xE600000000000000;
  if (v2 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6563616C706572 && a2 == 0xE700000000000000 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7037793 && a2 == 0xE300000000000000 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6B636F6C6E75 && a2 == 0xE600000000000000 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x636E79736572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_1C12B578C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_1C12966E4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6465696669646F6DLL && a2 == 0xEF7364726F636552;
  if (v2 || (sub_1C12B578C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4D646574656C6564 && a2 == 0xEF61746164617465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1C12B578C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_1C1296830()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1C12B5564();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C12B554C();
  MEMORY[0x1E0C80A78]();
  sub_1C12B5408();
  MEMORY[0x1E0C80A78]();
  v9[1] = sub_1C1296DAC();
  sub_1C12B53FC();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1C1296DE8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78E860);
  sub_1C1296E30((unint64_t *)&unk_1ED78E870, (uint64_t *)&unk_1ED78E860, MEMORY[0x1E0DEAF38]);
  sub_1C12B5600();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF8D8], v2);
  *(_QWORD *)(v0 + 16) = sub_1C12B5588();
  LOBYTE(aBlock[0]) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78DC60);
  swift_allocObject();
  *(_QWORD *)(v0 + 24) = sub_1C12B53A8();
  *(_BYTE *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 32) = MKBDeviceUnlockedSinceBoot() == 1;
  v6 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_1C1296E94;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C1296C5C;
  aBlock[3] = &block_descriptor_0;
  v7 = _Block_copy(aBlock);
  swift_release();
  v8 = MKBEventsRegister();
  _Block_release(v7);
  if (v8)
    *(_QWORD *)(v1 + 40) = v8;
  else
    __break(1u);
}

uint64_t sub_1C1296AB8()
{
  uint64_t v0;

  MKBEventsUnregister();

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t _s9IOSKeybagCMa()
{
  return objc_opt_self();
}

uint64_t sub_1C1296B0C(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  id v11;
  uint64_t (*v12)(_QWORD *, uint64_t);
  void *v13;
  id v14;
  _BYTE v15[8];

  v2 = sub_1C12B542C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v7 = result;
    v8 = *(void **)(result + 16);
    *v5 = v8;
    v9 = *MEMORY[0x1E0DEF740];
    v10 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v3 + 104);
    v10(v5, v9, v2);
    v11 = v8;
    LOBYTE(v8) = sub_1C12B5444();
    v12 = *(uint64_t (**)(_QWORD *, uint64_t))(v3 + 8);
    result = v12(v5, v2);
    if ((v8 & 1) != 0)
    {
      if (a1)
        return swift_release();
      v13 = *(void **)(v7 + 16);
      *v5 = v13;
      v10(v5, v9, v2);
      v14 = v13;
      LOBYTE(v13) = sub_1C12B5444();
      result = v12(v5, v2);
      if ((v13 & 1) != 0)
      {
        *(_BYTE *)(v7 + 32) = 1;
        v15[7] = 1;
        sub_1C12B539C();
        return swift_release();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_1C1296C5C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

BOOL sub_1C1296CBC()
{
  return MKBGetDeviceLockState() - 1 < 2;
}

uint64_t sub_1C1296CE0()
{
  unsigned __int8 v1;

  sub_1C12B5570();
  return v1;
}

uint64_t sub_1C1296D30()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78DC60);
  sub_1C1296E30((unint64_t *)&qword_1ED78E838, (uint64_t *)&unk_1ED78DC60, MEMORY[0x1E0C95FB8]);
  return sub_1C12B53B4();
}

void sub_1C1296DA0(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

unint64_t sub_1C1296DAC()
{
  unint64_t result;

  result = qword_1ED78E8B0;
  if (!qword_1ED78E8B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED78E8B0);
  }
  return result;
}

unint64_t sub_1C1296DE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED78E880;
  if (!qword_1ED78E880)
  {
    v1 = sub_1C12B554C();
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1ED78E880);
  }
  return result;
}

uint64_t sub_1C1296E30(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3BA97D4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C1296E70()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1C1296E94(int a1)
{
  return sub_1C1296B0C(a1);
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

uint64_t sub_1C1296EB4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = result;
  v3 = 0;
  v18 = a2;
  v4 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1C1288960(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1C1297030(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  BOOL v42;
  int isUniquelyReferenced_nonNull_native;
  char *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  BOOL v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t result;
  _QWORD *v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;

  v74 = type metadata accessor for RecordMetadata(0);
  v65 = *(_QWORD *)(v74 - 8);
  v4 = MEMORY[0x1E0C80A78](v74);
  v6 = (_QWORD **)((char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (_QWORD **)((char *)&v61 - v8);
  v10 = MEMORY[0x1E0C80A78](v7);
  v73 = (_QWORD **)((char *)&v61 - v11);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (uint64_t)&v61 - v13;
  MEMORY[0x1E0C80A78](v12);
  v64 = (uint64_t)&v61 - v15;
  v16 = 0;
  v66 = a1;
  v17 = *(_QWORD *)(a1 + 56);
  v62 = a1 + 56;
  v18 = 1 << *(_BYTE *)(a1 + 32);
  if (v18 < 64)
    v19 = ~(-1 << v18);
  else
    v19 = -1;
  v20 = v19 & v17;
  v63 = (unint64_t)(v18 + 63) >> 6;
  v61 = v9;
  while (1)
  {
    if (v20)
    {
      v68 = (v20 - 1) & v20;
      v69 = v16;
      v21 = __clz(__rbit64(v20)) | (v16 << 6);
    }
    else
    {
      v22 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_66;
      if (v22 >= v63)
      {
LABEL_64:
        swift_release();
        return (uint64_t)a2;
      }
      v23 = *(_QWORD *)(v62 + 8 * v22);
      v24 = v16 + 1;
      if (!v23)
      {
        v24 = v16 + 2;
        if (v16 + 2 >= v63)
          goto LABEL_64;
        v23 = *(_QWORD *)(v62 + 8 * v24);
        if (!v23)
        {
          v24 = v16 + 3;
          if (v16 + 3 >= v63)
            goto LABEL_64;
          v23 = *(_QWORD *)(v62 + 8 * v24);
          if (!v23)
          {
            v24 = v16 + 4;
            if (v16 + 4 >= v63)
              goto LABEL_64;
            v23 = *(_QWORD *)(v62 + 8 * v24);
            if (!v23)
            {
              v25 = v16 + 5;
              if (v16 + 5 >= v63)
                goto LABEL_64;
              v23 = *(_QWORD *)(v62 + 8 * v25);
              if (!v23)
              {
                while (1)
                {
                  v24 = v25 + 1;
                  if (__OFADD__(v25, 1))
                    break;
                  if (v24 >= v63)
                    goto LABEL_64;
                  v23 = *(_QWORD *)(v62 + 8 * v24);
                  ++v25;
                  if (v23)
                    goto LABEL_23;
                }
LABEL_67:
                __break(1u);
                goto LABEL_68;
              }
              v24 = v16 + 5;
            }
          }
        }
      }
LABEL_23:
      v68 = (v23 - 1) & v23;
      v69 = v24;
      v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }
    v26 = *(_QWORD *)(v66 + 48);
    v75 = *(_QWORD *)(v65 + 72);
    v27 = v64;
    sub_1C127F408(v26 + v75 * v21, v64, type metadata accessor for RecordMetadata);
    sub_1C12B3774(v27, v14, type metadata accessor for RecordMetadata);
    sub_1C12B57E0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v28 = v74;
    v29 = (char *)(v14 + *(int *)(v74 + 20));
    v30 = sub_1C12B5324();
    v31 = sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
    v72 = v29;
    v70 = v30;
    v67 = v31;
    sub_1C12B5468();
    v71 = (char *)*(int *)(v28 + 24);
    sub_1C12B57F8();
    v32 = sub_1C12B5804();
    v33 = -1 << *((_BYTE *)a2 + 32);
    v34 = v32 & ~v33;
    v35 = a2 + 7;
    if (((*(_QWORD *)((char *)a2 + ((v34 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> v34) & 1) != 0)
    {
      v36 = ~v33;
      while (1)
      {
        v9 = a2;
        sub_1C127F408(a2[6] + v34 * v75, (uint64_t)v6, type metadata accessor for RecordMetadata);
        v37 = v6[2];
        v38 = v6[3];
        v39 = *(_QWORD *)(v14 + 16);
        v40 = *(_QWORD *)(v14 + 24);
        v41 = *v6 == *(_QWORD *)v14 && v6[1] == *(_QWORD *)(v14 + 8);
        if (v41 || (sub_1C12B578C() & 1) != 0)
        {
          v42 = v37 == v39 && v38 == v40;
          if ((v42 || (sub_1C12B578C() & 1) != 0)
            && (sub_1C12B5300() & 1) != 0
            && *((unsigned __int8 *)v6 + *(int *)(v74 + 24)) == v71[v14])
          {
            break;
          }
        }
        sub_1C127F44C((uint64_t)v6, type metadata accessor for RecordMetadata);
        v34 = (v34 + 1) & v36;
        a2 = v9;
        if (((*(_QWORD *)((char *)v35 + ((v34 >> 3) & 0xFFFFFFFFFFFFF8)) >> v34) & 1) == 0)
          goto LABEL_40;
      }
      sub_1C127F44C((uint64_t)v6, type metadata accessor for RecordMetadata);
      a2 = v9;
      goto LABEL_5;
    }
LABEL_40:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1C127F408(v14, (uint64_t)v73, type metadata accessor for RecordMetadata);
    v76 = a2;
    if (a2[3] <= a2[2])
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      sub_1C12AE298();
LABEL_62:
    a2 = v76;
    *(_QWORD *)((char *)v76 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v34;
    sub_1C12B3774((uint64_t)v73, a2[6] + v34 * v75, type metadata accessor for RecordMetadata);
    v57 = a2[2];
    v58 = __OFADD__(v57, 1);
    v59 = v57 + 1;
    if (v58)
    {
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    a2[2] = v59;
LABEL_5:
    swift_bridgeObjectRelease();
    sub_1C127F44C(v14, type metadata accessor for RecordMetadata);
    v20 = v68;
    v16 = v69;
  }
  v9 = v61;
  if (isUniquelyReferenced_nonNull_native)
    sub_1C12AF458();
  else
    sub_1C12AEA68();
  v44 = (char *)v76;
  sub_1C12B57E0();
  v45 = v73;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v46 = v74;
  v71 = (char *)v45 + *(int *)(v74 + 20);
  sub_1C12B5468();
  v70 = *(int *)(v46 + 24);
  sub_1C12B57F8();
  v47 = sub_1C12B5804();
  v48 = -1 << v44[32];
  v34 = v47 & ~v48;
  v72 = v44;
  v49 = v44 + 56;
  if (((*(_QWORD *)&v44[((v34 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v34) & 1) == 0)
    goto LABEL_62;
  v50 = ~v48;
  while (1)
  {
    sub_1C127F408(*((_QWORD *)v72 + 6) + v34 * v75, (uint64_t)v9, type metadata accessor for RecordMetadata);
    v51 = v9[2];
    v52 = v9[3];
    v54 = v73[2];
    v53 = v73[3];
    v55 = *v9 == *v73 && v9[1] == v73[1];
    if (v55 || (sub_1C12B578C() & 1) != 0)
    {
      v56 = v51 == v54 && v52 == v53;
      if ((v56 || (sub_1C12B578C() & 1) != 0)
        && (sub_1C12B5300() & 1) != 0
        && *((unsigned __int8 *)v9 + *(int *)(v74 + 24)) == *((unsigned __int8 *)v73 + v70))
      {
        break;
      }
    }
    sub_1C127F44C((uint64_t)v9, type metadata accessor for RecordMetadata);
    v34 = (v34 + 1) & v50;
    if (((*(_QWORD *)&v49[(v34 >> 3) & 0xFFFFFFFFFFFFF8] >> v34) & 1) == 0)
      goto LABEL_62;
  }
LABEL_68:
  sub_1C127F44C((uint64_t)v9, type metadata accessor for RecordMetadata);
  result = sub_1C12B5798();
  __break(1u);
  return result;
}

BOOL static SyncEngine.Role.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SyncEngine.Role.hash(into:)()
{
  return sub_1C12B57EC();
}

uint64_t SyncEngine.Role.hashValue.getter()
{
  sub_1C12B57E0();
  sub_1C12B57EC();
  return sub_1C12B5804();
}

uint64_t sub_1C1297848(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  _QWORD v12[4];

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  if (!MEMORY[0x1C3BA98D0](v2 + 16))
    return 0;
  v8 = *(_QWORD *)(v2 + 24);
  ObjectType = swift_getObjectType();
  v12[0] = v4;
  v12[1] = v5;
  v12[2] = v6;
  v12[3] = v7;
  v10 = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v8 + 8))(a1, v12, ObjectType, v8);
  swift_unknownObjectRelease();
  return v10;
}

uint64_t sub_1C12978EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  uint64_t ObjectType;
  char v8;

  result = MEMORY[0x1C3BA98D0](v2 + 16);
  if (result)
  {
    v6 = *(_QWORD *)(v2 + 24);
    ObjectType = swift_getObjectType();
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, ObjectType, v6);
    swift_unknownObjectRelease();
    return v8 & 1;
  }
  return result;
}

uint64_t sub_1C1297960(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t ObjectType;
  _QWORD v11[4];

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  result = MEMORY[0x1C3BA98D0](v2 + 16);
  if (result)
  {
    v9 = *(_QWORD *)(v2 + 24);
    ObjectType = swift_getObjectType();
    v11[0] = v4;
    v11[1] = v5;
    v11[2] = v6;
    v11[3] = v7;
    (*(void (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v9 + 24))(a1, v11, ObjectType, v9);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1C12979E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v5;

  if (!MEMORY[0x1C3BA98D0](v1 + 16))
    return MEMORY[0x1E0DEE9D8];
  v3 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, ObjectType, v3);
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_1C1297A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;

  if (MEMORY[0x1C3BA98D0](v3 + 16))
  {
    v7 = *(_QWORD *)(v3 + 24);
    ObjectType = swift_getObjectType();
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, a3, ObjectType, v7);
    swift_unknownObjectRelease();
  }
  else
  {
    v10 = a2 + *(int *)(type metadata accessor for Record(0) + 20);
    v9 = *(_QWORD *)v10;
    sub_1C127CE48(*(_QWORD *)v10, *(_QWORD *)(v10 + 8));
  }
  return v9;
}

uint64_t sub_1C1297AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  uint64_t ObjectType;

  result = MEMORY[0x1C3BA98D0](v3 + 16);
  if (result)
  {
    v8 = *(_QWORD *)(v3 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, a2, a3, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1C1297B80()
{
  return sub_1C12B5570();
}

void sub_1C1297BC8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 248);
}

uint64_t sub_1C1297BD4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1C12B3988;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1C1291BAC(v1);
  return sub_1C1297D94((uint64_t)v4, v3);
}

uint64_t (*sub_1C1297C54())()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4460);
  sub_1C12B5570();
  if (!v2)
    return 0;
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = v2;
  *(_QWORD *)(v0 + 24) = v3;
  return sub_1C1291C04;
}

uint64_t sub_1C1297CE8@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(a1 + 272);
  v4 = *(_QWORD *)(a1 + 280);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1C12B3988;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_1C1291BAC(v3);
}

uint64_t sub_1C1297D58@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v1;

  return sub_1C1297CE8(v1, a1);
}

uint64_t sub_1C1297D70()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C1297D94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  _QWORD v11[6];

  v3 = v2;
  v6 = *(NSObject **)(v3 + 120);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1C1297EEC;
  *(_QWORD *)(v8 + 24) = v7;
  v11[4] = sub_1C1297F30;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1C1291038;
  v11[3] = &block_descriptor_1;
  v9 = _Block_copy(v11);
  swift_retain();
  sub_1C1291BAC(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C1293164(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a2 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1C1297EEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[2];
  v1 = v0[3];
  v3 = v0[4];
  v4 = *(_QWORD *)(v2 + 272);
  *(_QWORD *)(v2 + 272) = v1;
  *(_QWORD *)(v2 + 280) = v3;
  sub_1C1291BAC(v1);
  return sub_1C1293164(v4);
}

uint64_t sub_1C1297F20()
{
  return swift_deallocObject();
}

uint64_t sub_1C1297F30()
{
  uint64_t v0;

  return sub_1C1288240(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void (*sub_1C1297F50(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4460);
  sub_1C12B5570();
  v4 = v3[2];
  if (v4)
  {
    v5 = v3[3];
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1C12B3988;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *v3 = v7;
  v3[1] = v6;
  return sub_1C129800C;
}

void sub_1C129800C(uint64_t **a1, char a2)
{
  sub_1C129843C(a1, a2, (void (*)(uint64_t, uint64_t))sub_1C1297D94, (void (*)(uint64_t, uint64_t))sub_1C12B3990, (void (*)(uint64_t, uint64_t))sub_1C12B3994);
}

uint64_t sub_1C1298028(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1C12981C4;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1C1291BAC(v1);
  return sub_1C12981C8((uint64_t)v4, v3);
}

uint64_t (*sub_1C12980A8())(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4468);
  sub_1C12B5570();
  if (!v2)
    return 0;
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = v2;
  *(_QWORD *)(v0 + 24) = v3;
  return sub_1C12981C4;
}

uint64_t sub_1C129813C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD *, _QWORD *);

  v3 = *(_QWORD *)(a1 + 256);
  v4 = *(_QWORD *)(a1 + 264);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1C12B395C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = v5;
  return sub_1C1291BAC(v3);
}

uint64_t sub_1C12981AC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1C129813C(v1, a1);
}

uint64_t sub_1C12981C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  _QWORD v11[6];

  v3 = v2;
  v6 = *(NSObject **)(v3 + 120);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1C1298320;
  *(_QWORD *)(v8 + 24) = v7;
  v11[4] = sub_1C12B398C;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1C1291038;
  v11[3] = &block_descriptor_24;
  v9 = _Block_copy(v11);
  swift_retain();
  sub_1C1291BAC(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C1293164(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a2 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1C1298320()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[2];
  v1 = v0[3];
  v3 = v0[4];
  v4 = *(_QWORD *)(v2 + 256);
  *(_QWORD *)(v2 + 256) = v1;
  *(_QWORD *)(v2 + 264) = v3;
  sub_1C1291BAC(v1);
  return sub_1C1293164(v4);
}

uint64_t sub_1C1298354()
{
  return swift_deallocObject();
}

void (*sub_1C1298364(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4468);
  sub_1C12B5570();
  v4 = v3[2];
  if (v4)
  {
    v5 = v3[3];
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1C12981C4;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *v3 = v7;
  v3[1] = v6;
  return sub_1C1298420;
}

void sub_1C1298420(uint64_t **a1, char a2)
{
  sub_1C129843C(a1, a2, (void (*)(uint64_t, uint64_t))sub_1C12981C8, (void (*)(uint64_t, uint64_t))sub_1C1291BAC, (void (*)(uint64_t, uint64_t))sub_1C1293164);
}

void sub_1C129843C(uint64_t **a1, char a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t))
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *a1;
  v8 = **a1;
  v7 = (*a1)[1];
  if ((a2 & 1) != 0)
  {
    a4(**a1, v7);
    a3(v8, v7);
    a5(*v6, v6[1]);
  }
  else
  {
    a3(**a1, v7);
  }
  free(v6);
}

uint64_t sub_1C12984B0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1C12B3988;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1C1291BAC(v1);
  return sub_1C129864C((uint64_t)v4, v3);
}

uint64_t (*sub_1C1298530())()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4460);
  sub_1C12B5570();
  if (!v2)
    return 0;
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = v2;
  *(_QWORD *)(v0 + 24) = v3;
  return sub_1C12B3988;
}

uint64_t sub_1C12985C4@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(a1 + 288);
  v4 = *(_QWORD *)(a1 + 296);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1C12B3988;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_1C1291BAC(v3);
}

uint64_t sub_1C1298634@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v1;

  return sub_1C12985C4(v1, a1);
}

uint64_t sub_1C129864C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  _QWORD v11[6];

  v3 = v2;
  v6 = *(NSObject **)(v3 + 120);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1C12987A4;
  *(_QWORD *)(v8 + 24) = v7;
  v11[4] = sub_1C12B398C;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1C1291038;
  v11[3] = &block_descriptor_43;
  v9 = _Block_copy(v11);
  swift_retain();
  sub_1C1291BAC(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C1293164(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a2 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1C12987A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[2];
  v1 = v0[3];
  v3 = v0[4];
  v4 = *(_QWORD *)(v2 + 288);
  *(_QWORD *)(v2 + 288) = v1;
  *(_QWORD *)(v2 + 296) = v3;
  sub_1C1291BAC(v1);
  return sub_1C1293164(v4);
}

uint64_t sub_1C12987D8()
{
  return swift_deallocObject();
}

void (*sub_1C12987E8(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4460);
  sub_1C12B5570();
  v4 = v3[2];
  if (v4)
  {
    v5 = v3[3];
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1C12B3988;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *v3 = v7;
  v3[1] = v6;
  return sub_1C12988A4;
}

void sub_1C12988A4(uint64_t **a1, char a2)
{
  sub_1C129843C(a1, a2, (void (*)(uint64_t, uint64_t))sub_1C129864C, (void (*)(uint64_t, uint64_t))sub_1C12B3990, (void (*)(uint64_t, uint64_t))sub_1C12B3994);
}

uint64_t sub_1C12988C0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1C12B3988;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1C1291BAC(v1);
  return sub_1C1298A5C((uint64_t)v4, v3);
}

uint64_t (*sub_1C1298940())()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4460);
  sub_1C12B5570();
  if (!v2)
    return 0;
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = v2;
  *(_QWORD *)(v0 + 24) = v3;
  return sub_1C12B3988;
}

uint64_t sub_1C12989D4@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(a1 + 304);
  v4 = *(_QWORD *)(a1 + 312);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1C12B3988;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_1C1291BAC(v3);
}

uint64_t sub_1C1298A44@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v1;

  return sub_1C12989D4(v1, a1);
}

uint64_t sub_1C1298A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  _QWORD v11[6];

  v3 = v2;
  v6 = *(NSObject **)(v3 + 120);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1C1298BB4;
  *(_QWORD *)(v8 + 24) = v7;
  v11[4] = sub_1C12B398C;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1C1291038;
  v11[3] = &block_descriptor_62;
  v9 = _Block_copy(v11);
  swift_retain();
  sub_1C1291BAC(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C1293164(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a2 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1C1298BB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[2];
  v1 = v0[3];
  v3 = v0[4];
  v4 = *(_QWORD *)(v2 + 304);
  *(_QWORD *)(v2 + 304) = v1;
  *(_QWORD *)(v2 + 312) = v3;
  sub_1C1291BAC(v1);
  return sub_1C1293164(v4);
}

uint64_t sub_1C1298BE8()
{
  return swift_deallocObject();
}

void (*sub_1C1298BF8(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4460);
  sub_1C12B5570();
  v4 = v3[2];
  if (v4)
  {
    v5 = v3[3];
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1C12B3988;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *v3 = v7;
  v3[1] = v6;
  return sub_1C1298CB4;
}

void sub_1C1298CB4(uint64_t **a1, char a2)
{
  sub_1C129843C(a1, a2, (void (*)(uint64_t, uint64_t))sub_1C1298A5C, (void (*)(uint64_t, uint64_t))sub_1C12B3990, (void (*)(uint64_t, uint64_t))sub_1C12B3994);
}

double sub_1C1298CD0@<D0>(uint64_t *a1@<X3>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_1C12B5570();
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_1C1298D30(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1C12B3988;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1C1291BAC(v1);
  return sub_1C1298ECC((uint64_t)v4, v3);
}

uint64_t (*sub_1C1298DB0())()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4460);
  sub_1C12B5570();
  if (!v2)
    return 0;
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = v2;
  *(_QWORD *)(v0 + 24) = v3;
  return sub_1C12B3988;
}

uint64_t sub_1C1298E44@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(a1 + 320);
  v4 = *(_QWORD *)(a1 + 328);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1C1291C04;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_1C1291BAC(v3);
}

uint64_t sub_1C1298EB4@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v1;

  return sub_1C1298E44(v1, a1);
}

uint64_t sub_1C1298ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  _QWORD v11[6];

  v3 = v2;
  v6 = *(NSObject **)(v3 + 120);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1C1299058;
  *(_QWORD *)(v8 + 24) = v7;
  v11[4] = sub_1C12B398C;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1C1291038;
  v11[3] = &block_descriptor_81;
  v9 = _Block_copy(v11);
  swift_retain();
  sub_1C1291BAC(a1);
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);
  sub_1C1293164(a1);
  _Block_release(v9);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a2 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t objectdestroy_2Tm_0()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C1299058()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[2];
  v1 = v0[3];
  v3 = v0[4];
  v4 = *(_QWORD *)(v2 + 320);
  *(_QWORD *)(v2 + 320) = v1;
  *(_QWORD *)(v2 + 328) = v3;
  sub_1C1291BAC(v1);
  return sub_1C1293164(v4);
}

uint64_t sub_1C129908C()
{
  return swift_deallocObject();
}

void (*sub_1C129909C(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4460);
  sub_1C12B5570();
  v4 = v3[2];
  if (v4)
  {
    v5 = v3[3];
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1C12B3988;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *v3 = v7;
  v3[1] = v6;
  return sub_1C1299158;
}

void sub_1C1299158(uint64_t **a1, char a2)
{
  sub_1C129843C(a1, a2, (void (*)(uint64_t, uint64_t))sub_1C1298ECC, (void (*)(uint64_t, uint64_t))sub_1C12B3990, (void (*)(uint64_t, uint64_t))sub_1C12B3994);
}

uint64_t sub_1C1299174()
{
  uint64_t v1;

  sub_1C12B5570();
  return v1;
}

void sub_1C12991C4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)(v1 + 184) + 16);
}

uint64_t sub_1C12991D4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v3 = *a1;
  v4 = *(os_unfair_lock_s **)(*(_QWORD *)(*a1 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  v6 = *(_QWORD *)(v3 + 224);
  v5 = *(_QWORD *)(v3 + 232);
  LOWORD(v3) = *(_WORD *)(v3 + 240);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v4);
  result = swift_release();
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v5;
  *(_WORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_1C1299244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  __int16 v5;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v3);
  v4 = *(_QWORD *)(v1 + 232);
  v5 = *(_WORD *)(v1 + 240);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 224);
  *(_QWORD *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = v5;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);
  return swift_release();
}

uint64_t sub_1C12992A0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  os_unfair_lock_s *v5;

  v3 = *a1;
  v2 = a1[1];
  v4 = *((_WORD *)a1 + 8);
  v5 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v5);
  *(_QWORD *)(v1 + 224) = v3;
  *(_QWORD *)(v1 + 232) = v2;
  *(_WORD *)(v1 + 240) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v5);
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *SyncEngine.__allocating_init(syncService:metadataStore:keybag:retryTimer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;
  uint64_t v14;
  unsigned __int8 v15;
  _BYTE v16[40];
  _BYTE v17[40];

  sub_1C1280EFC(a3, (uint64_t)v17);
  sub_1C1280EFC(a4, (uint64_t)v16);
  v15 = 0;
  if (qword_1ED78DCC8 != -1)
    swift_once();
  v14 = qword_1ED78DCC0;
  type metadata accessor for SyncEngine();
  swift_allocObject();
  v12 = sub_1C12B2098(a1, a2, (uint64_t)v17, (uint64_t)v16, a5, a6, &v15, &v14, 86400, 0, 0);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v12;
}

_QWORD *SyncEngine.__allocating_init(syncService:metadataStore:keybag:retryTimer:role:syncState:inflightExpirationTime:localDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, uint64_t *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v19;

  swift_allocObject();
  v19 = sub_1C12B2098(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v19;
}

uint64_t type metadata accessor for SyncEngine()
{
  return objc_opt_self();
}

_QWORD *SyncEngine.init(syncService:metadataStore:keybag:retryTimer:role:syncState:inflightExpirationTime:localDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, uint64_t *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v11;

  v11 = sub_1C12B2098(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_1C1299570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 32);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(ObjectType, v1);
  sub_1C12B536C();
  swift_retain();
  sub_1C12B5360();
  return swift_release();
}

Swift::Void __swiftcall SyncEngine.validate()()
{
  sub_1C129AD70();
}

uint64_t SyncEngine.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C1293164(*(_QWORD *)(v0 + 256));
  sub_1C1293164(*(_QWORD *)(v0 + 272));
  sub_1C1293164(*(_QWORD *)(v0 + 288));
  sub_1C1293164(*(_QWORD *)(v0 + 304));
  sub_1C1293164(*(_QWORD *)(v0 + 320));
  return v0;
}

uint64_t SyncEngine.__deallocating_deinit()
{
  SyncEngine.deinit();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall SyncEngine.setHasPaired(with:)(Swift::String with)
{
  _QWORD *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;

  object = with._object;
  countAndFlagsBits = with._countAndFlagsBits;
  v4 = v1[8];
  v5 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v4);
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v5 + 144))(countAndFlagsBits, object, v4, v5);
}

uint64_t SyncEngine.localDeviceIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(v0 + 208))
  {
    v1 = *(_QWORD *)(v0 + 200);
  }
  else
  {
    v2 = IDSCopyLocalDeviceUniqueID();
    if (v2)
    {
      v3 = (void *)v2;
      v1 = sub_1C12B5480();

    }
    else
    {
      v1 = 0xD000000000000017;
    }
  }
  swift_bridgeObjectRetain();
  return v1;
}

Swift::Void __swiftcall SyncEngine.addRecordIDs(toSave:toDelete:)(Swift::OpaquePointer toSave, Swift::OpaquePointer toDelete)
{
  void *v2;
  Swift::OpaquePointer *v5;

  sub_1C12B536C();
  v5 = (Swift::OpaquePointer *)swift_allocObject();
  v5[2]._rawValue = v2;
  v5[3]._rawValue = toSave._rawValue;
  v5[4]._rawValue = toDelete._rawValue;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C12B5360();
  swift_release();
}

uint64_t sub_1C1299874(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void (*v14)(_QWORD);
  uint64_t v15;
  void (*v16)(_QWORD *, uint64_t);
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  char *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t ObjectType;
  os_unfair_lock_s *v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  os_unfair_lock_s *v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  id v47;
  unsigned int v48;
  void (*v49)(_QWORD *, _QWORD, uint64_t);
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;

  v3 = v2;
  v6 = sub_1C12B5324();
  v50 = *(_QWORD *)(v6 - 8);
  v51 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1C12B542C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (id *)((char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = *(void **)(v3 + 120);
  *v12 = v13;
  v14 = *(void (**)(_QWORD))(v10 + 104);
  v48 = *MEMORY[0x1E0DEF740];
  v49 = (void (*)(_QWORD *, _QWORD, uint64_t))v14;
  v14(v12);
  v47 = v13;
  v15 = sub_1C12B5444();
  v16 = *(void (**)(_QWORD *, uint64_t))(v10 + 8);
  v16(v12, v9);
  if ((v15 & 1) != 0)
  {
    sub_1C12B530C();
    v17 = v8;
    v19 = *(_QWORD *)(v3 + 64);
    v18 = *(_QWORD *)(v3 + 72);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 40), v19);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 48))(v17, a2, v19, v18);
    v20 = *(_QWORD *)(v3 + 64);
    v21 = *(_QWORD *)(v3 + 72);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 40), v20);
    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 40);
    v52 = v17;
    v22(v17, a1, v20, v21);
    v15 = *(_QWORD *)(v3 + 248);
    if (qword_1ED78DCC8 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v23 = v52;
  if ((qword_1ED78DCC0 & ~v15) != 0)
  {
    if (qword_1ED78E810 == -1)
      goto LABEL_11;
  }
  else
  {
    v24 = v47;
    *v12 = v47;
    v49(v12, v48, v9);
    v25 = v24;
    LOBYTE(v24) = sub_1C12B5444();
    v16(v12, v9);
    if ((v24 & 1) != 0)
    {
      v26 = *(_QWORD *)(v3 + 136);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v26 + 24))(ObjectType, v26);
      v28 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + 216) + 16);
      swift_retain();
      os_unfair_lock_lock(v28);
      v29 = *(_QWORD *)(v3 + 224);
      v30 = *(_QWORD *)(v3 + 232);
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v28);
      swift_release();
      if (v30)
        v31 = v29;
      else
        v31 = 0;
      v32 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + 216) + 16);
      swift_retain();
      os_unfair_lock_lock(v32);
      v33 = *(_QWORD *)(v3 + 232);
      v34 = *(_BYTE *)(v3 + 241);
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v32);
      swift_release();
      if (v33)
      {
        swift_bridgeObjectRelease();
        v35 = v34 & 1;
      }
      else
      {
        v35 = 2;
      }
      LOBYTE(v54) = v35;
      sub_1C129E3F8(v31, v30, (unsigned __int8 *)&v54);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v23, v51);
    }
    __break(1u);
  }
  swift_once();
LABEL_11:
  v36 = sub_1C12B5390();
  __swift_project_value_buffer(v36, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v37 = sub_1C12B5384();
  v38 = sub_1C12B5540();
  if (!os_log_type_enabled(v37, v38))
  {
    swift_release_n();

    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v23, v51);
  }
  v39 = (uint8_t *)swift_slowAlloc();
  v40 = swift_slowAlloc();
  v54 = v40;
  *(_DWORD *)v39 = 136380675;
  if (*(_QWORD *)(v3 + 208))
  {
    v41 = *(_QWORD *)(v3 + 200);
    v42 = *(_QWORD *)(v3 + 208);
  }
  else
  {
    v44 = IDSCopyLocalDeviceUniqueID();
    if (v44)
    {
      v45 = (void *)v44;
      v41 = sub_1C12B5480();
      v42 = v46;

    }
    else
    {
      v42 = 0x80000001C12BAE80;
      v41 = 0xD000000000000017;
    }
  }
  swift_bridgeObjectRetain();
  v53 = sub_1C12882D0(v41, v42, &v54);
  sub_1C12B55DC();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1C127A000, v37, v38, "(%{private}s) Not syncing altered records as the sync engine is disabled", v39, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v40, -1, -1);
  MEMORY[0x1C3BA9870](v39, -1, -1);

  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v52, v51);
}

uint64_t SyncEngine.set(dataSource:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  sub_1C12B536C();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a2;
  v9[5] = a3;
  v9[6] = a4;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C12B5360();
  return swift_release();
}

uint64_t sub_1C1299DCC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void (*v15)(_QWORD *, uint64_t, uint64_t);
  uint64_t (*v16)(_QWORD *, uint64_t);
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t ObjectType;
  os_unfair_lock_s *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  uint64_t v36;
  char v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 v45[24];

  v5 = v4;
  v40 = a2;
  v9 = sub_1C12B542C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = *(void **)(v4 + 120);
  *v12 = v13;
  v14 = *MEMORY[0x1E0DEF740];
  v15 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v10 + 104);
  v15(v12, v14, v9);
  v41 = v13;
  LOBYTE(v13) = sub_1C12B5444();
  v16 = *(uint64_t (**)(_QWORD *, uint64_t))(v10 + 8);
  result = v16(v12, v9);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }
  if (!a1)
  {
LABEL_7:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1C1289098((uint64_t)a3, a4);
    swift_endAccess();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  v42 = a3;
  a3 = (_QWORD *)(v5 + 144);
  swift_beginAccess();
  v18 = *(_QWORD *)(v5 + 144);
  v19 = a1;
  v20 = *(_QWORD *)(v18 + 16);
  v43 = v19;
  swift_unknownObjectRetain();
  if (v20)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_1C128939C((uint64_t)v42, a4);
    if ((v22 & 1) != 0)
    {
      v23 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v21);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v24 = MEMORY[0x1C3BA98D0](v23 + 16);
      swift_release();
      if (v24)
      {
        swift_unknownObjectRelease();
        sub_1C12B56C0();
        __break(1u);
        goto LABEL_7;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  type metadata accessor for SyncEngine.WeakSource();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v25 + 24) = v40;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v44 = *a3;
  *a3 = 0x8000000000000000;
  sub_1C128B3B0(v25, (uint64_t)v42, a4, isUniquelyReferenced_nonNull_native);
  *a3 = v44;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  v27 = v41;
  *v12 = v41;
  v15(v12, v14, v9);
  v28 = v27;
  LOBYTE(v27) = sub_1C12B5444();
  result = v16(v12, v9);
  if ((v27 & 1) == 0)
    goto LABEL_19;
  v29 = *(_QWORD *)(v5 + 136);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v29 + 24))(ObjectType, v29);
  v31 = *(os_unfair_lock_s **)(*(_QWORD *)(v5 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v31);
  v32 = *(_QWORD *)(v5 + 224);
  v33 = *(_QWORD *)(v5 + 232);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v31);
  swift_release();
  if (v33)
    v34 = v32;
  else
    v34 = 0;
  v35 = *(os_unfair_lock_s **)(*(_QWORD *)(v5 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v35);
  v36 = *(_QWORD *)(v5 + 232);
  v37 = *(_BYTE *)(v5 + 241);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v35);
  swift_release();
  if (v36)
  {
    swift_bridgeObjectRelease();
    v38 = v37 & 1;
  }
  else
  {
    v38 = 2;
  }
  v45[0] = v38;
  sub_1C129E3F8(v34, v33, v45);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall SyncEngine.set(syncEnabled:)(Swift::Bool syncEnabled)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v2 = v1;
  v4 = *(NSObject **)(v2 + 120);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v2;
  *(_BYTE *)(v5 + 24) = syncEnabled;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1C12B263C;
  *(_QWORD *)(v6 + 24) = v5;
  v8[4] = sub_1C12B398C;
  v8[5] = v6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1C1291038;
  v8[3] = &block_descriptor_103;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v4 & 1) != 0)
    __break(1u);
}

void sub_1C129A2D4(int a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  char v37;
  os_unfair_lock_s *v38;
  int64_t v39;
  uint64_t v40;
  __int16 v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, int64_t, uint64_t, uint64_t);
  char v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;

  v3 = v1;
  v5 = sub_1C12B542C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (uint64_t *)((char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v3 + 120);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0DEF740], v5);
  v10 = v9;
  LOBYTE(v9) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
LABEL_42:
    swift_once();
    goto LABEL_7;
  }
  v11 = *(_QWORD *)(v3 + 248);
  if ((v11 & 1) != 0)
    LODWORD(v6) = 0;
  else
    LODWORD(v6) = *(unsigned __int8 *)(v3 + 16);
  v2 = &unk_1ED78E000;
  if ((_DWORD)v6 != 1)
    goto LABEL_17;
  if (qword_1ED78E810 != -1)
    goto LABEL_42;
LABEL_7:
  v12 = sub_1C12B5390();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v13 = sub_1C12B5384();
  v14 = sub_1C12B5540();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v50 = v16;
    *(_DWORD *)v15 = 136381187;
    v17 = *(_QWORD *)(v3 + 208);
    v48 = a1;
    if (v17)
    {
      v18 = *(_QWORD *)(v3 + 200);
      v19 = v17;
    }
    else
    {
      v20 = IDSCopyLocalDeviceUniqueID();
      if (v20)
      {
        v21 = (void *)v20;
        v18 = sub_1C12B5480();
        v19 = v22;

      }
      else
      {
        v18 = 0xD000000000000017;
        v19 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v49 = sub_1C12882D0(v18, v19, &v50);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 1026;
    LODWORD(v49) = 0;
    sub_1C12B55DC();
    *(_WORD *)(v15 + 18) = 1026;
    LODWORD(v49) = 1;
    sub_1C12B55DC();
    _os_log_impl(&dword_1C127A000, v13, v14, "(%{private}s) Sync engine supported state has changed from %{BOOL,public}d to %{BOOL,public}d", (uint8_t *)v15, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v16, -1, -1);
    MEMORY[0x1C3BA9870](v15, -1, -1);

    a1 = v48;
    v2 = &unk_1ED78E000;
    v11 = *(_QWORD *)(v3 + 248);
    if ((v11 & 1) == 0)
      goto LABEL_16;
  }
  else
  {

    swift_release_n();
    v11 = *(_QWORD *)(v3 + 248);
    if ((v11 & 1) == 0)
    {
LABEL_16:
      v11 |= 1uLL;
      *(_QWORD *)(v3 + 248) = v11;
    }
  }
LABEL_17:
  if (((v11 >> 1) & 1) == (a1 & 1))
  {
    if ((v6 & 1) == 0)
      return;
    goto LABEL_35;
  }
  if (v2[258] != -1)
    swift_once();
  v23 = sub_1C12B5390();
  __swift_project_value_buffer(v23, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v24 = sub_1C12B5384();
  v25 = sub_1C12B5540();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = v11 & 2;
    v27 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v50 = v28;
    *(_DWORD *)v27 = 136381187;
    v29 = *(_QWORD *)(v3 + 208);
    v48 = a1;
    if (v29)
    {
      v30 = *(_QWORD *)(v3 + 200);
      v31 = v29;
    }
    else
    {
      v34 = IDSCopyLocalDeviceUniqueID();
      if (v34)
      {
        v35 = (void *)v34;
        v30 = sub_1C12B5480();
        v31 = v36;

      }
      else
      {
        v30 = 0xD000000000000017;
        v31 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v49 = sub_1C12882D0(v30, v31, &v50);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 1026;
    LODWORD(v49) = v26 >> 1;
    sub_1C12B55DC();
    *(_WORD *)(v27 + 18) = 1026;
    v37 = v48;
    LODWORD(v49) = v48 & 1;
    sub_1C12B55DC();
    _os_log_impl(&dword_1C127A000, v24, v25, "(%{private}s) Sync engine enabled state has changed from %{BOOL,public}d to %{BOOL,public}d", (uint8_t *)v27, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v28, -1, -1);
    MEMORY[0x1C3BA9870](v27, -1, -1);

    v32 = *(_QWORD *)(v3 + 248);
    if ((v37 & 1) != 0)
      goto LABEL_32;
LABEL_26:
    if ((v32 & 2) == 0)
      goto LABEL_35;
    v33 = v32 & 0xFFFFFFFFFFFFFFFDLL;
    goto LABEL_34;
  }

  swift_release_n();
  v32 = *(_QWORD *)(v3 + 248);
  if ((a1 & 1) == 0)
    goto LABEL_26;
LABEL_32:
  if ((v32 & 2) != 0)
    goto LABEL_35;
  v33 = v32 | 2;
LABEL_34:
  *(_QWORD *)(v3 + 248) = v33;
LABEL_35:
  sub_1C129A8DC();
  v38 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v38);
  v40 = *(_QWORD *)(v3 + 224);
  v39 = *(_QWORD *)(v3 + 232);
  v41 = *(_WORD *)(v3 + 240);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v38);
  swift_release();
  if (v39)
  {
    v42 = HIBYTE(v41) & 1;
    v43 = *(_QWORD *)(v3 + 64);
    v44 = *(_QWORD *)(v3 + 72);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 40), v43);
    v45 = *(uint64_t (**)(uint64_t, int64_t, uint64_t, uint64_t))(v44 + 136);
    swift_bridgeObjectRetain();
    v46 = v45(v40, v39, v43, v44);
    swift_bridgeObjectRelease();
    LOBYTE(v50) = v42;
    swift_bridgeObjectRetain();
    if ((v46 & 1) != 0)
      sub_1C129E3F8(v40, v39, (unsigned __int8 *)&v50);
    else
      sub_1C12A5B70(v40, v39, (char *)&v50);
    swift_bridgeObjectRelease_n();
  }
}

void sub_1C129A8DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_unfair_lock_s *v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;

  v1 = v0;
  v2 = sub_1C12B5324();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C12B542C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *(void **)(v1 + 120);
  *v9 = v10;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF740], v6);
  v11 = v10;
  LOBYTE(v10) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  sub_1C12A6204();
  sub_1C12A64D0();
  v6 = *(_QWORD *)(v1 + 248);
  if (qword_1ED78DCC8 != -1)
LABEL_26:
    swift_once();
  if ((qword_1ED78DCC0 & ~v6) == 0)
  {
    v12 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v12);
    v13 = *(_QWORD *)(v1 + 232);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v12);
    swift_bridgeObjectRelease();
    swift_release();
    if (v13)
    {
      v14 = *(_QWORD *)(v1 + 104);
      v15 = *(_QWORD *)(v1 + 112);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 80), v14);
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15) & 1) != 0)
      {
        v16 = *(_QWORD *)(v1 + 64);
        v17 = *(_QWORD *)(v1 + 72);
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 40), v16);
        sub_1C12B530C();
        v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 112))(v5, v16, v17);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        if ((v18 & 1) == 0)
        {
          if (qword_1ED78E810 != -1)
            swift_once();
          v19 = sub_1C12B5390();
          __swift_project_value_buffer(v19, (uint64_t)qword_1ED78DC40);
          swift_retain_n();
          v20 = sub_1C12B5384();
          v21 = sub_1C12B5540();
          if (os_log_type_enabled(v20, v21))
          {
            v22 = (uint8_t *)swift_slowAlloc();
            v23 = swift_slowAlloc();
            v40 = v23;
            *(_DWORD *)v22 = 136380675;
            if (*(_QWORD *)(v1 + 208))
            {
              v24 = *(_QWORD *)(v1 + 200);
              v25 = *(_QWORD *)(v1 + 208);
            }
            else
            {
              v26 = IDSCopyLocalDeviceUniqueID();
              if (v26)
              {
                v27 = (void *)v26;
                v24 = sub_1C12B5480();
                v25 = v28;

              }
              else
              {
                v25 = 0x80000001C12BAE80;
                v24 = 0xD000000000000017;
              }
            }
            swift_bridgeObjectRetain();
            v39 = sub_1C12882D0(v24, v25, &v40);
            sub_1C12B55DC();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C127A000, v20, v21, "(%{private}s) Metadata store is invalid; purging and syncing",
              v22,
              0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C3BA9870](v23, -1, -1);
            MEMORY[0x1C3BA9870](v22, -1, -1);

          }
          else
          {

            swift_release_n();
          }
          v29 = *(_QWORD *)(v1 + 64);
          v30 = *(_QWORD *)(v1 + 72);
          __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 40), v29);
          (*(void (**)(uint64_t, uint64_t))(v30 + 80))(v29, v30);
          v31 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 216) + 16);
          swift_retain();
          os_unfair_lock_lock(v31);
          v33 = *(_QWORD *)(v1 + 224);
          v32 = *(_QWORD *)(v1 + 232);
          swift_bridgeObjectRetain();
          os_unfair_lock_unlock(v31);
          swift_release();
          if (v32)
            v34 = v33;
          else
            v34 = 0;
          v35 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 216) + 16);
          swift_retain();
          os_unfair_lock_lock(v35);
          v36 = *(_QWORD *)(v1 + 232);
          v37 = *(_BYTE *)(v1 + 241);
          swift_bridgeObjectRetain();
          os_unfair_lock_unlock(v35);
          swift_release();
          if (v36)
          {
            swift_bridgeObjectRelease();
            v38 = v37 & 1;
          }
          else
          {
            v38 = 2;
          }
          LOBYTE(v40) = v38;
          sub_1C129E3F8(v34, v32, (unsigned __int8 *)&v40);
          swift_bridgeObjectRelease();
        }
      }
    }
  }
}

Swift::Void __swiftcall SyncEngine.sync()()
{
  sub_1C129AD70();
}

uint64_t sub_1C129AD70()
{
  sub_1C12B536C();
  swift_retain();
  sub_1C12B5360();
  return swift_release();
}

uint64_t sub_1C129ADE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t result;
  os_unfair_lock_s *v8;
  int64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  char v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;

  v1 = sub_1C12B542C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (uint64_t *)((char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + 120);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF740], v1);
  v6 = v5;
  LOBYTE(v5) = sub_1C12B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    v8 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v8);
    v10 = *(_QWORD *)(v0 + 224);
    v9 = *(_QWORD *)(v0 + 232);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v8);
    swift_release();
    v11 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v11);
    v12 = *(_QWORD *)(v0 + 232);
    v13 = *(_BYTE *)(v0 + 241);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v11);
    swift_release();
    if (v12)
    {
      swift_bridgeObjectRelease();
      v14 = v13 & 1;
    }
    else
    {
      v14 = 2;
    }
    if (v9)
      v15 = v10;
    else
      v15 = 0;
    v17 = v14;
    sub_1C129E3F8(v15, v9, &v17);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C129AF40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)v0 + 208))
  {
    v1 = *(_QWORD *)(*(_QWORD *)v0 + 200);
  }
  else
  {
    v2 = IDSCopyLocalDeviceUniqueID();
    if (v2)
    {
      v3 = (void *)v2;
      v1 = sub_1C12B5480();

    }
    else
    {
      v1 = 0xD000000000000017;
    }
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1C129AFC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  __int16 v6;

  v3 = *v1;
  v4 = *(os_unfair_lock_s **)(*(_QWORD *)(*v1 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  v5 = *(_QWORD *)(v3 + 232);
  v6 = *(_WORD *)(v3 + 240);
  *(_QWORD *)a1 = *(_QWORD *)(v3 + 224);
  *(_QWORD *)(a1 + 8) = v5;
  *(_WORD *)(a1 + 16) = v6;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v4);
  return swift_release();
}

uint64_t sub_1C129B020(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v2;
  sub_1C12B536C();
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v5;
  v6[3] = a1;
  v6[4] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C12B5360();
  return swift_release();
}

uint64_t sub_1C129B0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  _QWORD *v10;

  v9 = *v4;
  sub_1C12B536C();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v9;
  v10[3] = a1;
  v10[4] = a2;
  v10[5] = a3;
  v10[6] = a4;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C12B5360();
  return swift_release();
}

void sub_1C129B19C(Swift::Bool a1)
{
  SyncEngine.set(syncEnabled:)(a1);
}

uint64_t sub_1C129B1BC()
{
  return sub_1C129B200();
}

uint64_t sub_1C129B1E0()
{
  return sub_1C129B200();
}

uint64_t sub_1C129B200()
{
  sub_1C12B536C();
  swift_retain();
  sub_1C12B5360();
  return swift_release();
}

uint64_t sub_1C129B270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(ObjectType, v1);
  sub_1C12B536C();
  swift_retain();
  sub_1C12B5360();
  return swift_release();
}

uint64_t SyncEngine.syncService(_:didReceiveMessage:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  uint64_t result;
  _QWORD v19[6];
  _OWORD v20[2];
  uint64_t v21;

  v6 = v5;
  v12 = *(_OWORD *)(a3 + 16);
  v20[0] = *(_OWORD *)a3;
  v20[1] = v12;
  v21 = *(_QWORD *)(a3 + 32);
  v13 = *(NSObject **)(v5 + 120);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v6;
  *(_QWORD *)(v14 + 24) = a1;
  *(_QWORD *)(v14 + 32) = a2;
  v15 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v14 + 40) = *(_OWORD *)a3;
  *(_OWORD *)(v14 + 56) = v15;
  *(_QWORD *)(v14 + 72) = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(v14 + 80) = a4;
  *(_QWORD *)(v14 + 88) = a5;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1C12B26EC;
  *(_QWORD *)(v16 + 24) = v14;
  v19[4] = sub_1C12B398C;
  v19[5] = v16;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 1107296256;
  v19[2] = sub_1C1291038;
  v19[3] = &block_descriptor_113;
  v17 = _Block_copy(v19);
  swift_retain();
  swift_unknownObjectRetain();
  sub_1C1291B6C((uint64_t)v20);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v13, v17);
  _Block_release(v17);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v13 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t SyncEngine.syncService(_:shouldAcceptIncomingMessage:from:)()
{
  unsigned __int8 v1;

  sub_1C12B5570();
  return v1;
}

uint64_t SyncEngine._queue_syncService(_:shouldAcceptIncomingMessage:from:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  uint64_t result;
  char v20;
  os_unfair_lock_s *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  NSObject *v41;
  int v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;

  v6 = v5;
  v77 = a4;
  v78 = a5;
  v9 = sub_1C12B542C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = *(unsigned __int8 *)a3;
  v14 = a3[1];
  v15 = a3[2];
  v16 = a3[4];
  v76 = a3[3];
  v17 = *(void **)(v6 + 120);
  *v12 = v17;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0DEF740], v9);
  v18 = v17;
  LOBYTE(v17) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v10 + 8))(v12, v9);
  if ((v17 & 1) == 0)
  {
    __break(1u);
    goto LABEL_63;
  }
  if (*(_QWORD *)(v6 + 24) != a1)
    return 0;
  if (v14 == 0x69676E45636E7953 && v15 == 0xEA0000000000656ELL
    || (v20 = sub_1C12B578C(), result = 0, (v20 & 1) != 0))
  {
    v21 = *(os_unfair_lock_s **)(*(_QWORD *)(v6 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v21);
    v9 = *(_QWORD *)(v6 + 224);
    v14 = *(_QWORD *)(v6 + 232);
    v10 = *(unsigned __int16 *)(v6 + 240);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v21);
    swift_release();
    if (!v14)
      return 0;
    v22 = *(_QWORD *)(v6 + 104);
    v23 = *(_QWORD *)(v6 + 112);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + 80), v22);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v23 + 16))(v22, v23) & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_1ED78E810 != -1)
        swift_once();
      v24 = sub_1C12B5390();
      __swift_project_value_buffer(v24, (uint64_t)qword_1ED78DC40);
      swift_retain_n();
      v25 = sub_1C12B5384();
      v26 = sub_1C12B5534();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        v28 = swift_slowAlloc();
        v79 = v28;
        *(_DWORD *)v27 = 136380675;
        if (*(_QWORD *)(v6 + 208))
        {
          v29 = *(_QWORD *)(v6 + 200);
          v30 = *(_QWORD *)(v6 + 208);
        }
        else
        {
          v49 = IDSCopyLocalDeviceUniqueID();
          if (v49)
          {
            v50 = (void *)v49;
            v29 = sub_1C12B5480();
            v30 = v51;

          }
          else
          {
            v29 = 0xD000000000000017;
            v30 = 0x80000001C12BAE80;
          }
        }
        swift_bridgeObjectRetain();
        v81 = sub_1C12882D0(v29, v30, &v79);
        sub_1C12B55DC();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C127A000, v25, v26, "(%{private}s) Rejecting incoming message because keybag is locked", v27, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v28, -1, -1);
        MEMORY[0x1C3BA9870](v27, -1, -1);

        return 0;
      }

LABEL_29:
      swift_release_n();
      return 0;
    }
    a1 = *(_QWORD *)(v6 + 248);
    if (qword_1ED78DCC8 == -1)
    {
LABEL_11:
      if ((qword_1ED78DCC0 & ~a1) != 0)
      {
        swift_bridgeObjectRelease();
        if (qword_1ED78E810 != -1)
          swift_once();
        v31 = sub_1C12B5390();
        __swift_project_value_buffer(v31, (uint64_t)qword_1ED78DC40);
        swift_retain_n();
        v32 = sub_1C12B5384();
        v33 = sub_1C12B5534();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = swift_slowAlloc();
          v35 = swift_slowAlloc();
          v81 = v35;
          *(_DWORD *)v34 = 136380931;
          if (*(_QWORD *)(v6 + 208))
          {
            v36 = *(_QWORD *)(v6 + 200);
            v37 = *(_QWORD *)(v6 + 208);
          }
          else
          {
            v60 = IDSCopyLocalDeviceUniqueID();
            if (v60)
            {
              v61 = (void *)v60;
              v36 = sub_1C12B5480();
              v37 = v62;

            }
            else
            {
              v37 = 0x80000001C12BAE80;
              v36 = 0xD000000000000017;
            }
          }
          swift_bridgeObjectRetain();
          v79 = sub_1C12882D0(v36, v37, (uint64_t *)&v81);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v34 + 12) = 2082;
          v66 = *(_QWORD *)(v6 + 248);
          v79 = 0;
          v80 = 0xE000000000000000;
          if ((v66 & 1) != 0)
            sub_1C12B54BC();
          if ((v66 & 2) != 0)
            sub_1C12B54BC();
          v79 = sub_1C12882D0(v79, v80, (uint64_t *)&v81);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C127A000, v32, v33, "(%{private}s) Rejecting incoming message because the sync engine is disabled: %{public}s", (uint8_t *)v34, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v35, -1, -1);
          MEMORY[0x1C3BA9870](v34, -1, -1);

          return 0;
        }

      }
      else
      {
        if (v9 == v77 && v14 == v78 || (sub_1C12B578C() & 1) != 0)
        {
          if (v13)
          {
            swift_bridgeObjectRelease();
            return 1;
          }
          v78 = v10;
          if (qword_1ED78E810 != -1)
            swift_once();
          v38 = sub_1C12B5390();
          __swift_project_value_buffer(v38, (uint64_t)qword_1ED78DC40);
          swift_retain();
          swift_bridgeObjectRetain();
          v39 = v76;
          v40 = v16;
          sub_1C127CE48(v76, v16);
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          sub_1C127CE48(v39, v16);
          v41 = sub_1C12B5384();
          v42 = sub_1C12B5534();
          v43 = v41;
          if (os_log_type_enabled(v41, (os_log_type_t)v42))
          {
            v44 = swift_slowAlloc();
            v45 = swift_slowAlloc();
            v79 = v45;
            *(_DWORD *)v44 = 136381187;
            v46 = *(_QWORD *)(v6 + 208);
            LODWORD(v77) = v42;
            v75 = v45;
            if (v46)
            {
              v47 = *(_QWORD *)(v6 + 200);
              v48 = v46;
            }
            else
            {
              v63 = IDSCopyLocalDeviceUniqueID();
              if (v63)
              {
                v64 = (void *)v63;
                v47 = sub_1C12B5480();
                v48 = v65;

              }
              else
              {
                v47 = 0xD000000000000017;
                v48 = 0x80000001C12BAE80;
              }
            }
            swift_bridgeObjectRetain();
            v81 = sub_1C12882D0(v47, v48, &v79);
            sub_1C12B55DC();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v44 + 12) = 2050;
            swift_bridgeObjectRelease();
            v70 = v76;
            sub_1C127CE8C(v76, v40);
            v81 = 0;
            sub_1C12B55DC();
            swift_bridgeObjectRelease();
            sub_1C127CE8C(v70, v40);
            *(_WORD *)(v44 + 22) = 2050;
            swift_bridgeObjectRelease();
            v81 = (v78 >> 8) & 1;
            sub_1C12B55DC();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C127A000, v43, (os_log_type_t)v77, "(%{private}s) Rejecting message; version number not supported: versionNumber=%{public}ld; currentVersionNu"
              "mber=%{public}ld",
              (uint8_t *)v44,
              0x20u);
            v71 = v75;
            swift_arrayDestroy();
            MEMORY[0x1C3BA9870](v71, -1, -1);
            MEMORY[0x1C3BA9870](v44, -1, -1);

          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1C127CE8C(v39, v40);
            swift_bridgeObjectRelease();
            swift_release_n();
            sub_1C127CE8C(v39, v40);

            swift_bridgeObjectRelease();
          }
          return 0;
        }
        if (qword_1ED78E810 != -1)
          swift_once();
        v52 = sub_1C12B5390();
        __swift_project_value_buffer(v52, (uint64_t)qword_1ED78DC40);
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v53 = sub_1C12B5384();
        v54 = sub_1C12B5534();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = swift_slowAlloc();
          v56 = swift_slowAlloc();
          v79 = v56;
          *(_DWORD *)v55 = 136381187;
          v57 = *(_QWORD *)(v6 + 208);
          v76 = v56;
          if (v57)
          {
            v58 = *(_QWORD *)(v6 + 200);
            v59 = v57;
          }
          else
          {
            v67 = IDSCopyLocalDeviceUniqueID();
            if (v67)
            {
              v68 = (void *)v67;
              v58 = sub_1C12B5480();
              v59 = v69;

            }
            else
            {
              v58 = 0xD000000000000017;
              v59 = 0x80000001C12BAE80;
            }
          }
          swift_bridgeObjectRetain();
          v81 = sub_1C12882D0(v58, v59, &v79);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v55 + 12) = 2082;
          v72 = v78;
          swift_bridgeObjectRetain();
          v81 = sub_1C12882D0(v77, v72, &v79);
          sub_1C12B55DC();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v55 + 22) = 2082;
          swift_bridgeObjectRetain();
          v81 = sub_1C12882D0(v9, v14, &v79);
          sub_1C12B55DC();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1C127A000, v53, v54, "(%{private}s) Rejecting message; not from active device: deviceIdentifier=%{public}s; pairedDevice=%{public}s",
            (uint8_t *)v55,
            0x20u);
          v73 = v76;
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v73, -1, -1);
          MEMORY[0x1C3BA9870](v55, -1, -1);

          return 0;
        }

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      goto LABEL_29;
    }
LABEL_63:
    swift_once();
    goto LABEL_11;
  }
  return result;
}

uint64_t SyncEngine.syncService(_:didSendWithRequestIdentifier:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t result;
  _QWORD v18[6];

  v6 = v5;
  v12 = *(NSObject **)(v5 + 120);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v6;
  v13[3] = a1;
  v13[4] = a2;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_1C12B2794;
  *(_QWORD *)(v14 + 24) = v13;
  v18[4] = sub_1C12B398C;
  v18[5] = v14;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 1107296256;
  v18[2] = sub_1C1291038;
  v18[3] = &block_descriptor_123;
  v15 = _Block_copy(v18);
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v16 = a5;
  swift_retain();
  swift_release();
  dispatch_sync(v12, v15);
  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v12 & 1) != 0)
    __break(1u);
  return result;
}

void sub_1C129C1B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void (*v18)(_QWORD *, uint64_t, uint64_t);
  void (*v19)(_QWORD *, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  os_log_type_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  os_log_type_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  os_log_type_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  NSObject *v65;
  uint8_t *v66;
  uint32_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  void *v84;
  unint64_t v85;
  id v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  void *v90;
  unint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  os_log_type_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  void *v100;
  unint64_t v101;
  uint64_t v102;
  _QWORD v103[2];
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107[3];
  uint64_t v108;
  uint64_t v109[3];

  v6 = v5;
  v105 = a3;
  v106 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1C12B542C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (_QWORD *)((char *)v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = (void *)v6[15];
  *v15 = v16;
  v17 = *MEMORY[0x1E0DEF740];
  v18 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v13 + 104);
  v18(v15, v17, v12);
  v104 = v16;
  LOBYTE(v16) = sub_1C12B5444();
  v19 = *(void (**)(_QWORD *, uint64_t))(v13 + 8);
  v19(v15, v12);
  if ((v16 & 1) == 0)
  {
    __break(1u);
LABEL_76:
    swift_once();
LABEL_4:
    v20 = sub_1C12B5390();
    __swift_project_value_buffer(v20, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v21 = sub_1C12B5384();
    v22 = sub_1C12B5534();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v109[0] = v24;
      *(_DWORD *)v23 = 136380675;
      if (v6[26])
      {
        v25 = v6[25];
        v26 = v6[26];
      }
      else
      {
        v39 = IDSCopyLocalDeviceUniqueID();
        if (v39)
        {
          v40 = (void *)v39;
          v25 = sub_1C12B5480();
          v26 = v41;

        }
        else
        {
          v25 = 0xD000000000000017;
          v26 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v107[0] = sub_1C12882D0(v25, v26, v109);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v51 = v22;
      v52 = "(%{private}s) Ignoring message send callback as it is from an unknown sync service";
LABEL_45:
      v65 = v21;
      v66 = (uint8_t *)v23;
      v67 = 12;
LABEL_46:
      _os_log_impl(&dword_1C127A000, v65, v51, v52, v66, v67);
      swift_arrayDestroy();
      v68 = v24;
LABEL_47:
      MEMORY[0x1C3BA9870](v68, -1, -1);
      v69 = v23;
LABEL_48:
      MEMORY[0x1C3BA9870](v69, -1, -1);
      goto LABEL_49;
    }
    goto LABEL_21;
  }
  if (v6[3] != a1)
  {
    if (qword_1ED78E810 == -1)
      goto LABEL_4;
    goto LABEL_76;
  }
  v27 = v6[31];
  if (qword_1ED78DCC8 != -1)
    swift_once();
  if ((qword_1ED78DCC0 & ~v27) != 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v35 = sub_1C12B5390();
    __swift_project_value_buffer(v35, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v21 = sub_1C12B5384();
    v36 = sub_1C12B5534();
    if (os_log_type_enabled(v21, v36))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v109[0] = v24;
      *(_DWORD *)v23 = 136380675;
      if (v6[26])
      {
        v37 = v6[25];
        v38 = v6[26];
      }
      else
      {
        v53 = IDSCopyLocalDeviceUniqueID();
        if (v53)
        {
          v54 = (void *)v53;
          v37 = sub_1C12B5480();
          v38 = v55;

        }
        else
        {
          v37 = 0xD000000000000017;
          v38 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v107[0] = sub_1C12882D0(v37, v38, v109);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v51 = v36;
      v52 = "(%{private}s) Ignoring message send callback as the sync engine is disabled";
      goto LABEL_45;
    }
    goto LABEL_21;
  }
  if (!a5)
  {
    swift_beginAccess();
    v42 = v6[21];
    if (*(_QWORD *)(v42 + 16))
    {
      v43 = v106;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v44 = sub_1C128939C(v105, v43);
      if ((v45 & 1) != 0)
      {
        v103[1] = v6 + 21;
        v46 = *(_QWORD *)(*(_QWORD *)(v42 + 56) + 8 * v44);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v47 = v6[23];
        v48 = *(_QWORD *)(v46 + 16);
        v49 = *(_QWORD *)(v47 + 16);
        v103[0] = v46;
        if (v48 <= v49 >> 3)
        {
          v107[0] = v47;
          swift_bridgeObjectRetain();
          sub_1C12B0418(v46);
          v50 = v107[0];
        }
        else
        {
          swift_bridgeObjectRetain();
          v50 = sub_1C12B09BC(v46, v47);
        }
        v6[23] = v50;
        swift_bridgeObjectRelease();
        swift_beginAccess();
        v70 = v106;
        swift_bridgeObjectRetain();
        v71 = v105;
        sub_1C1288FB0(v105, v70);
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v72 = sub_1C12B5324();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v11, 1, 1, v72);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_1C1283668((uint64_t)v11, v71, v70);
        swift_endAccess();
        v73 = v104;
        *v15 = v104;
        v18(v15, v17, v12);
        v74 = v73;
        LOBYTE(v73) = sub_1C12B5444();
        v19(v15, v12);
        if ((v73 & 1) != 0)
        {
          sub_1C12A64D0();
          sub_1C12ABE7C();
          v15 = (_QWORD *)v103[0];
          if (qword_1ED78E810 == -1)
            goto LABEL_53;
        }
        else
        {
          __break(1u);
        }
        swift_once();
LABEL_53:
        v75 = sub_1C12B5390();
        __swift_project_value_buffer(v75, (uint64_t)qword_1ED78DC40);
        swift_retain_n();
        swift_bridgeObjectRetain();
        v76 = sub_1C12B5384();
        v77 = sub_1C12B5540();
        if (os_log_type_enabled(v76, v77))
        {
          v78 = swift_slowAlloc();
          v79 = swift_slowAlloc();
          *(_DWORD *)v78 = 136381187;
          v80 = v6[26];
          v106 = v79;
          v107[0] = v79;
          if (v80)
          {
            v81 = v6[25];
            v82 = v80;
          }
          else
          {
            v89 = IDSCopyLocalDeviceUniqueID();
            if (v89)
            {
              v90 = (void *)v89;
              v81 = sub_1C12B5480();
              v82 = v91;

            }
            else
            {
              v81 = 0xD000000000000017;
              v82 = 0x80000001C12BAE80;
            }
          }
          swift_bridgeObjectRetain();
          v108 = sub_1C12882D0(v81, v82, v107);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v78 + 12) = 2050;
          v93 = v15[2];
          swift_bridgeObjectRelease();
          v108 = v93;
          sub_1C12B55DC();
          swift_bridgeObjectRelease();
          *(_WORD *)(v78 + 22) = 2050;
          v94 = *(_QWORD *)(v6[23] + 16);
          swift_release();
          v108 = v94;
          sub_1C12B55DC();
          swift_release();
          _os_log_impl(&dword_1C127A000, v76, v77, "(%{private}s) Removed %{public}ld records; %{public}ld remaining",
            (uint8_t *)v78,
            0x20u);
          v95 = v106;
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v95, -1, -1);
          MEMORY[0x1C3BA9870](v78, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();
        }
        swift_retain_n();
        v21 = sub_1C12B5384();
        v96 = sub_1C12B5540();
        if (os_log_type_enabled(v21, v96))
        {
          v23 = swift_slowAlloc();
          v24 = swift_slowAlloc();
          v107[0] = v24;
          *(_DWORD *)v23 = 136380931;
          if (v6[26])
          {
            v97 = v6[25];
            v98 = v6[26];
          }
          else
          {
            v99 = IDSCopyLocalDeviceUniqueID();
            if (v99)
            {
              v100 = (void *)v99;
              v97 = sub_1C12B5480();
              v98 = v101;

            }
            else
            {
              v97 = 0xD000000000000017;
              v98 = 0x80000001C12BAE80;
            }
          }
          swift_bridgeObjectRetain();
          v108 = sub_1C12882D0(v97, v98, v107);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v23 + 12) = 2050;
          v102 = *(_QWORD *)(v6[21] + 16);
          swift_release();
          v108 = v102;
          sub_1C12B55DC();
          swift_release();
          v51 = v96;
          v52 = "(%{private}s) %{public}ld outstanding request identifiers";
          v65 = v21;
          v66 = (uint8_t *)v23;
          v67 = 22;
          goto LABEL_46;
        }
LABEL_21:

        goto LABEL_22;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (qword_1ED78E810 != -1)
      swift_once();
    v59 = sub_1C12B5390();
    __swift_project_value_buffer(v59, (uint64_t)qword_1ED78DC40);
    v60 = v106;
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v21 = sub_1C12B5384();
    v61 = sub_1C12B5534();
    if (os_log_type_enabled(v21, v61))
    {
      v62 = swift_slowAlloc();
      v104 = (id)swift_slowAlloc();
      v107[0] = (uint64_t)v104;
      *(_DWORD *)v62 = 136380931;
      if (v6[26])
      {
        v63 = v6[25];
        v64 = v6[26];
      }
      else
      {
        v83 = IDSCopyLocalDeviceUniqueID();
        if (v83)
        {
          v84 = (void *)v83;
          v63 = sub_1C12B5480();
          v64 = v85;

        }
        else
        {
          v63 = 0xD000000000000017;
          v64 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v108 = sub_1C12882D0(v63, v64, v107);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v62 + 12) = 2082;
      swift_bridgeObjectRetain();
      v108 = sub_1C12882D0(v105, v60, v107);
      sub_1C12B55DC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C127A000, v21, v61, "(%{private}s) Ignoring message send callback as we have no metadata for the request identifier: %{public}s", (uint8_t *)v62, 0x16u);
      v92 = v104;
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v92, -1, -1);
      v69 = v62;
      goto LABEL_48;
    }

    swift_bridgeObjectRelease_n();
LABEL_22:
    swift_release_n();
    return;
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v28 = sub_1C12B5390();
  __swift_project_value_buffer(v28, (uint64_t)qword_1ED78DC40);
  swift_retain();
  v29 = a5;
  swift_retain();
  v30 = a5;
  v21 = sub_1C12B5384();
  v31 = sub_1C12B5534();
  if (os_log_type_enabled(v21, v31))
  {
    v23 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v109[0] = v32;
    *(_DWORD *)v23 = 136380931;
    if (v6[26])
    {
      v33 = v6[25];
      v34 = v6[26];
    }
    else
    {
      v56 = IDSCopyLocalDeviceUniqueID();
      if (v56)
      {
        v57 = (void *)v56;
        v33 = sub_1C12B5480();
        v34 = v58;

      }
      else
      {
        v33 = 0xD000000000000017;
        v34 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v107[0] = sub_1C12882D0(v33, v34, v109);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2082;
    v107[0] = (uint64_t)a5;
    v86 = a5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D44D8);
    v87 = sub_1C12B5498();
    v107[0] = sub_1C12882D0(v87, v88, v109);
    sub_1C12B55DC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C127A000, v21, v31, "(%{private}s) Error in didSendWithRequestIdentifier sending record modifications: %{public}s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    v68 = v32;
    goto LABEL_47;
  }
  swift_release_n();

LABEL_49:
}

uint64_t SyncEngine.syncService(_:didUpdatePairedDevice:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  _QWORD v15[6];

  v4 = v3;
  v8 = *a3;
  v7 = a3[1];
  v9 = *((_WORD *)a3 + 8);
  v10 = *(NSObject **)(v3 + 120);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v4;
  *(_QWORD *)(v11 + 24) = a1;
  *(_QWORD *)(v11 + 32) = a2;
  *(_QWORD *)(v11 + 40) = v8;
  *(_QWORD *)(v11 + 48) = v7;
  *(_WORD *)(v11 + 56) = v9;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1C12B27D8;
  *(_QWORD *)(v12 + 24) = v11;
  v15[4] = sub_1C12B398C;
  v15[5] = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = sub_1C1291038;
  v15[3] = &block_descriptor_133;
  v13 = _Block_copy(v15);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  swift_release();
  dispatch_sync(v10, v13);
  _Block_release(v13);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v10 & 1) != 0)
    __break(1u);
  return result;
}

void sub_1C129D0E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  os_log_type_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v36[2];
  __int16 v37;
  uint64_t v38;

  v4 = v3;
  v7 = sub_1C12B542C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (uint64_t *)((char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(_QWORD *)a3;
  v12 = *(_QWORD *)(a3 + 8);
  v13 = *(_WORD *)(a3 + 16);
  v14 = (void *)v4[15];
  *v10 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DEF740], v7);
  v15 = v14;
  LOBYTE(v14) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
  if ((v14 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  if (v4[3] == a1)
  {
    v23 = v4[31];
    if (qword_1ED78DCC8 != -1)
      swift_once();
    if ((qword_1ED78DCC0 & ~v23) == 0)
    {
      v36[0] = v11;
      v36[1] = v12;
      v37 = v13;
      sub_1C129D590((uint64_t)v36);
      return;
    }
    if (qword_1ED78E810 != -1)
      swift_once();
    v24 = sub_1C12B5390();
    __swift_project_value_buffer(v24, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v17 = sub_1C12B5384();
    v25 = sub_1C12B5534();
    if (os_log_type_enabled(v17, v25))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v36[0] = v20;
      *(_DWORD *)v19 = 136380675;
      if (v4[26])
      {
        v26 = v4[25];
        v27 = v4[26];
      }
      else
      {
        v33 = IDSCopyLocalDeviceUniqueID();
        if (v33)
        {
          v34 = (void *)v33;
          v26 = sub_1C12B5480();
          v27 = v35;

        }
        else
        {
          v26 = 0xD000000000000017;
          v27 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v38 = sub_1C12882D0(v26, v27, v36);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v31 = v25;
      v32 = "(%{private}s) Ignoring message send callback as the sync engine is disabled";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  if (qword_1ED78E810 != -1)
    goto LABEL_27;
LABEL_4:
  v16 = sub_1C12B5390();
  __swift_project_value_buffer(v16, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v17 = sub_1C12B5384();
  v18 = sub_1C12B5534();
  if (!os_log_type_enabled(v17, v18))
    goto LABEL_16;
  v19 = (uint8_t *)swift_slowAlloc();
  v20 = swift_slowAlloc();
  v36[0] = v20;
  *(_DWORD *)v19 = 136380675;
  if (v4[26])
  {
    v21 = v4[25];
    v22 = v4[26];
  }
  else
  {
    v28 = IDSCopyLocalDeviceUniqueID();
    if (v28)
    {
      v29 = (void *)v28;
      v21 = sub_1C12B5480();
      v22 = v30;

    }
    else
    {
      v21 = 0xD000000000000017;
      v22 = 0x80000001C12BAE80;
    }
  }
  swift_bridgeObjectRetain();
  v38 = sub_1C12882D0(v21, v22, v36);
  sub_1C12B55DC();
  swift_release_n();
  swift_bridgeObjectRelease();
  v31 = v18;
  v32 = "(%{private}s) Ignoring message send callback as it is from an unknown sync service";
LABEL_25:
  _os_log_impl(&dword_1C127A000, v17, v31, v32, v19, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v20, -1, -1);
  MEMORY[0x1C3BA9870](v19, -1, -1);

}

uint64_t sub_1C129D514()
{
  unsigned __int8 v1;

  sub_1C12B5570();
  return v1;
}

void sub_1C129D590(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int64_t v8;
  _QWORD *v9;
  int v10;
  unsigned int v11;
  void (*v12)(_QWORD *, uint64_t, uint64_t);
  void *v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  os_unfair_lock_s *v27;
  uint64_t v28;
  int64_t v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  os_log_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t ObjectType;
  os_unfair_lock_s *v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  os_log_t v59;
  void (*v60)(_QWORD *, uint64_t, uint64_t);
  unsigned int v61;
  id v62;
  void (*v63)(_QWORD *, uint64_t);
  int v64;
  uint64_t v65;
  uint64_t v66;
  int64_t v67;
  __int16 v68;
  uint64_t v69;

  v2 = v1;
  v4 = sub_1C12B542C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(_QWORD **)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v10 = *(unsigned __int8 *)(a1 + 16);
  LODWORD(v59) = *(unsigned __int8 *)(a1 + 17);
  v64 = *(unsigned __int16 *)(a1 + 16);
  v13 = *(void **)(v2 + 120);
  *v7 = v13;
  v11 = *MEMORY[0x1E0DEF740];
  v12 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v5 + 104);
  v12(v7, *MEMORY[0x1E0DEF740], v4);
  v62 = v13;
  LODWORD(v13) = sub_1C12B5444();
  v63 = *(void (**)(_QWORD *, uint64_t))(v5 + 8);
  v63(v7, v4);
  if ((v13 & 1) != 0)
  {
    v61 = v11;
    v60 = v12;
    v65 = (uint64_t)v9;
    v14 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v14);
    v15 = *(_QWORD *)(v2 + 224);
    v13 = *(void **)(v2 + 232);
    v16 = *(_WORD *)(v2 + 240);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v14);
    swift_release();
    v9 = &unk_1ED78E000;
    if (v8)
    {
      if (v13)
      {
        v12 = (void (*)(_QWORD *, uint64_t, uint64_t))v65;
        if (v65 == v15 && (void *)v8 == v13 || (sub_1C12B578C() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          if (v10 == v16 && ((((v16 & 0x100) == 0) ^ v59) & 1) != 0)
          {
            LODWORD(v13) = 0;
            goto LABEL_29;
          }
          goto LABEL_15;
        }
LABEL_14:
        swift_bridgeObjectRelease();
LABEL_15:
        if (qword_1ED78E810 != -1)
          swift_once();
        v17 = sub_1C12B5390();
        __swift_project_value_buffer(v17, (uint64_t)qword_1ED78DC40);
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        v18 = sub_1C12B5384();
        v19 = sub_1C12B5540();
        if (os_log_type_enabled(v18, (os_log_type_t)v19))
        {
          v20 = swift_slowAlloc();
          v57 = swift_slowAlloc();
          v69 = v57;
          *(_DWORD *)v20 = 136381187;
          v21 = *(_QWORD *)(v2 + 208);
          v59 = v18;
          v58 = v19;
          if (v21)
          {
            v22 = *(_QWORD *)(v2 + 200);
            v23 = v21;
          }
          else
          {
            v24 = IDSCopyLocalDeviceUniqueID();
            if (v24)
            {
              v25 = (void *)v24;
              v22 = sub_1C12B5480();
              v23 = v26;

            }
            else
            {
              v22 = 0xD000000000000017;
              v23 = 0x80000001C12BAE80;
            }
          }
          swift_bridgeObjectRetain();
          v66 = sub_1C12882D0(v22, v23, &v69);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v20 + 12) = 2082;
          v56 = v20 + 14;
          v27 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + 216) + 16);
          swift_retain();
          os_unfair_lock_lock(v27);
          v28 = *(_QWORD *)(v2 + 224);
          v29 = *(_QWORD *)(v2 + 232);
          v30 = *(_WORD *)(v2 + 240);
          swift_bridgeObjectRetain();
          os_unfair_lock_unlock(v27);
          swift_release();
          v66 = v28;
          v67 = v29;
          v68 = v30;
          __swift_instantiateConcreteTypeFromMangledName(qword_1ED78E1E0);
          v31 = sub_1C12B5498();
          v66 = sub_1C12882D0(v31, v32, &v69);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v20 + 22) = 2082;
          v12 = (void (*)(_QWORD *, uint64_t, uint64_t))v65;
          v66 = v65;
          v67 = v8;
          v68 = v64;
          swift_bridgeObjectRetain();
          v33 = sub_1C12B5498();
          v66 = sub_1C12882D0(v33, v34, &v69);
          sub_1C12B55DC();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          v35 = v59;
          _os_log_impl(&dword_1C127A000, v59, (os_log_type_t)v58, "(%{private}s) Paired device changed from %{public}s to %{public}s ", (uint8_t *)v20, 0x20u);
          v36 = v57;
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v36, -1, -1);
          MEMORY[0x1C3BA9870](v20, -1, -1);

          v9 = &unk_1ED78E000;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();
        }
        v37 = v61;
        v38 = v62;
        *v7 = v62;
        v60(v7, v37, v4);
        v39 = v38;
        LOBYTE(v38) = sub_1C12B5444();
        v63(v7, v4);
        if ((v38 & 1) == 0)
        {
          __break(1u);
LABEL_49:
          swift_once();
          goto LABEL_36;
        }
        v40 = *(_QWORD *)(v2 + 136);
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v40 + 24))(ObjectType, v40);
        v42 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + 216) + 16);
        swift_bridgeObjectRetain();
        swift_retain();
        os_unfair_lock_lock(v42);
        *(_QWORD *)(v2 + 224) = v12;
        *(_QWORD *)(v2 + 232) = v8;
        *(_WORD *)(v2 + 240) = v64;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        os_unfair_lock_unlock(v42);
        swift_bridgeObjectRelease();
        swift_release();
        LODWORD(v13) = 1;
LABEL_29:
        v5 = *(_QWORD *)(v2 + 248);
        if (qword_1ED78DCC8 == -1)
          goto LABEL_30;
        goto LABEL_47;
      }
      swift_bridgeObjectRetain();
    }
    else if (!v13)
    {
      v12 = (void (*)(_QWORD *, uint64_t, uint64_t))v65;
      goto LABEL_29;
    }
    v12 = (void (*)(_QWORD *, uint64_t, uint64_t))v65;
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  __break(1u);
LABEL_47:
  swift_once();
LABEL_30:
  if ((qword_1ED78DCC0 & ~v5) == 0)
  {
    if ((_DWORD)v13)
    {
      sub_1C129A8DC();
      if (v8)
      {
        v43 = BYTE1(v64) & 1;
        v44 = *(_QWORD *)(v2 + 64);
        v45 = *(_QWORD *)(v2 + 72);
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 40), v44);
        if (((*(uint64_t (**)(void (*)(_QWORD *, uint64_t, uint64_t), int64_t, uint64_t, uint64_t))(v45 + 136))(v12, v8, v44, v45) & 1) != 0)
        {
          LOBYTE(v66) = v43;
          sub_1C129E3F8((uint64_t)v12, v8, (unsigned __int8 *)&v66);
        }
        else
        {
          LOBYTE(v66) = v43;
          sub_1C12A5B70((uint64_t)v12, v8, (char *)&v66);
        }
      }
    }
    return;
  }
  if (v9[258] != -1)
    goto LABEL_49;
LABEL_36:
  v46 = sub_1C12B5390();
  __swift_project_value_buffer(v46, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v47 = sub_1C12B5384();
  v48 = sub_1C12B5540();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v50 = swift_slowAlloc();
    v66 = v50;
    *(_DWORD *)v49 = 136380675;
    if (*(_QWORD *)(v2 + 208))
    {
      v51 = *(_QWORD *)(v2 + 200);
      v52 = *(_QWORD *)(v2 + 208);
    }
    else
    {
      v53 = IDSCopyLocalDeviceUniqueID();
      if (v53)
      {
        v54 = (void *)v53;
        v51 = sub_1C12B5480();
        v52 = v55;

      }
      else
      {
        v51 = 0xD000000000000017;
        v52 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v69 = sub_1C12882D0(v51, v52, &v66);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v47, v48, "(%{private}s) Ignoring paired device/enabled channge as the sync engine is not available", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v50, -1, -1);
    MEMORY[0x1C3BA9870](v49, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

void sub_1C129DD68()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v1 = v0;
  v2 = sub_1C12B542C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (void *)v0[15];
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF740], v2);
  v7 = v6;
  v8 = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v8 & 1) != 0)
  {
    v8 = v1[31];
    if (qword_1ED78DCC8 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  if ((qword_1ED78DCC0 & ~v8) == 0)
  {
    sub_1C12B5270();
    swift_allocObject();
    sub_1C12B5264();
    sub_1C12B37F8();
    sub_1C12B5258();
    __asm { BR              X10 }
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v9 = sub_1C12B5390();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v10 = sub_1C12B5384();
  v11 = sub_1C12B5534();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v20 = v13;
    *(_DWORD *)v12 = 136380675;
    if (v1[26])
    {
      v14 = v1[25];
      v15 = v1[26];
    }
    else
    {
      v16 = IDSCopyLocalDeviceUniqueID();
      if (v16)
      {
        v17 = (void *)v16;
        v14 = sub_1C12B5480();
        v15 = v18;

      }
      else
      {
        v14 = 0xD000000000000017;
        v15 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v22 = sub_1C12882D0(v14, v15, &v20);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v10, v11, "(%{private}s) Will not handle message because sync is inactive", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v13, -1, -1);
    MEMORY[0x1C3BA9870](v12, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

void sub_1C129E3F8(uint64_t a1, int64_t a2, unsigned __int8 *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v13)(uint64_t *, uint64_t, uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  os_log_type_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int64_t v52;
  unint64_t v53;
  int64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t ObjectType;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  unint64_t v82;
  os_log_type_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  unint64_t v87;
  uint64_t v88;
  void *v89;
  unint64_t v90;
  _BYTE v91[4];
  int v92;
  uint64_t v93;
  int64_t v94;
  uint64_t v95;
  _BYTE *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99[5];
  uint64_t v100;
  uint64_t v101;

  v4 = v3;
  v97 = sub_1C12B5324();
  v95 = *(_QWORD *)(v97 - 8);
  MEMORY[0x1E0C80A78](v97);
  v96 = &v91[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_1C12B542C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = &v91[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  LODWORD(v13) = *a3;
  v14 = (void *)v4[15];
  *v12 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0DEF740], v9);
  v15 = v14;
  v16 = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v10 + 8))(v12, v9);
  if ((v16 & 1) == 0)
  {
LABEL_73:
    __break(1u);
LABEL_74:
    swift_once();
    goto LABEL_4;
  }
  v17 = v4[13];
  v18 = v4[14];
  __swift_project_boxed_opaque_existential_1(v4 + 10, v17);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18) & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v26 = sub_1C12B5390();
    __swift_project_value_buffer(v26, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v20 = sub_1C12B5384();
    v27 = sub_1C12B5540();
    if (!os_log_type_enabled(v20, v27))
      goto LABEL_26;
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v99[0] = v23;
    *(_DWORD *)v22 = 136380675;
    if (v4[26])
    {
      v28 = v4[25];
      v29 = v4[26];
    }
    else
    {
      v38 = IDSCopyLocalDeviceUniqueID();
      if (v38)
      {
        v39 = (void *)v38;
        v28 = sub_1C12B5480();
        v29 = v40;

      }
      else
      {
        v28 = 0xD000000000000017;
        v29 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v100 = sub_1C12882D0(v28, v29, v99);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    v83 = v27;
    v84 = "(%{private}s) Will not sync because keybag is locked";
    goto LABEL_71;
  }
  v16 = v4[31];
  if (qword_1ED78DCC8 != -1)
    goto LABEL_74;
LABEL_4:
  if ((qword_1ED78DCC0 & ~v16) != 0)
  {
    if (qword_1ED78E810 != -1)
      goto LABEL_76;
    goto LABEL_18;
  }
  if (!a2)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v34 = sub_1C12B5390();
    __swift_project_value_buffer(v34, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v20 = sub_1C12B5384();
    v35 = sub_1C12B5540();
    if (!os_log_type_enabled(v20, v35))
      goto LABEL_26;
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v99[0] = v23;
    *(_DWORD *)v22 = 136380675;
    if (v4[26])
    {
      v36 = v4[25];
      v37 = v4[26];
    }
    else
    {
      v85 = IDSCopyLocalDeviceUniqueID();
      if (v85)
      {
        v86 = (void *)v85;
        v36 = sub_1C12B5480();
        v37 = v87;

      }
      else
      {
        v36 = 0xD000000000000017;
        v37 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v100 = sub_1C12882D0(v36, v37, v99);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    v83 = v35;
    v84 = "(%{private}s) Will not sync because pairedDeviceIdentifier is nil";
LABEL_71:
    _os_log_impl(&dword_1C127A000, v20, v83, v84, v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v23, -1, -1);
    MEMORY[0x1C3BA9870](v22, -1, -1);

    return;
  }
  if ((_DWORD)v13 == 2)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v19 = sub_1C12B5390();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v20 = sub_1C12B5384();
    v21 = sub_1C12B5540();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v99[0] = v23;
      *(_DWORD *)v22 = 136380675;
      if (v4[26])
      {
        v24 = v4[25];
        v25 = v4[26];
      }
      else
      {
        v88 = IDSCopyLocalDeviceUniqueID();
        if (v88)
        {
          v89 = (void *)v88;
          v24 = sub_1C12B5480();
          v25 = v90;

        }
        else
        {
          v24 = 0xD000000000000017;
          v25 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v100 = sub_1C12882D0(v24, v25, v99);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v83 = v21;
      v84 = "(%{private}s) Will not sync because version is nil";
      goto LABEL_71;
    }
    goto LABEL_26;
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v93 = a1;
  v94 = a2;
  v92 = v13 & 1;
  v41 = sub_1C12B5390();
  __swift_project_value_buffer(v41, (uint64_t)qword_1ED78DC40);
  v16 = sub_1C12B5384();
  v42 = sub_1C12B5540();
  if (os_log_type_enabled((os_log_t)v16, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_1C127A000, (os_log_t)v16, v42, "Performing sync for all data sources", v43, 2u);
    MEMORY[0x1C3BA9870](v43, -1, -1);
  }

  v101 = MEMORY[0x1E0DEE9D8];
  swift_beginAccess();
  v44 = v4[18];
  v45 = *(_QWORD *)(v44 + 64);
  v98 = v44 + 64;
  v46 = 1 << *(_BYTE *)(v44 + 32);
  v47 = -1;
  if (v46 < 64)
    v47 = ~(-1 << v46);
  v48 = v47 & v45;
  a2 = (unint64_t)(v46 + 63) >> 6;
  swift_bridgeObjectRetain();
  a1 = 0;
  while (1)
  {
    if (v48)
    {
      v50 = __clz(__rbit64(v48));
      v48 &= v48 - 1;
      v51 = v50 | (a1 << 6);
      goto LABEL_54;
    }
    v52 = a1 + 1;
    if (__OFADD__(a1, 1))
    {
      __break(1u);
      goto LABEL_73;
    }
    if (v52 >= a2)
      goto LABEL_56;
    v53 = *(_QWORD *)(v98 + 8 * v52);
    ++a1;
    if (!v53)
    {
      a1 = v52 + 1;
      if (v52 + 1 >= a2)
        goto LABEL_56;
      v53 = *(_QWORD *)(v98 + 8 * a1);
      if (!v53)
      {
        a1 = v52 + 2;
        if (v52 + 2 >= a2)
          goto LABEL_56;
        v53 = *(_QWORD *)(v98 + 8 * a1);
        if (!v53)
          break;
      }
    }
LABEL_53:
    v48 = (v53 - 1) & v53;
    v51 = __clz(__rbit64(v53)) + (a1 << 6);
LABEL_54:
    v55 = *(_QWORD *)(*(_QWORD *)(v44 + 56) + 8 * v51);
    v99[3] = type metadata accessor for SyncEngine();
    v99[4] = (uint64_t)&protocol witness table for SyncEngine;
    v99[0] = (uint64_t)v4;
    if (MEMORY[0x1C3BA98D0](v55 + 16))
    {
      v56 = *(_QWORD *)(v55 + 24);
      ObjectType = swift_getObjectType();
      v13 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v56 + 32);
      swift_retain_n();
      swift_retain();
      v49 = v13(v99, ObjectType, v56);
      swift_unknownObjectRelease();
    }
    else
    {
      swift_retain_n();
      swift_retain();
      v49 = MEMORY[0x1E0DEE9D8];
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
    swift_release();
    v16 = (uint64_t)&v101;
    sub_1C12A678C(v49);
    swift_release();
  }
  v54 = v52 + 3;
  if (v54 >= a2)
  {
LABEL_56:
    swift_release();
    v58 = v4[8];
    v59 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v58);
    v60 = v93;
    v98 = (*(uint64_t (**)(uint64_t, int64_t, uint64_t, uint64_t))(v59 + 24))(v93, v94, v58, v59);
    v61 = v4[8];
    v62 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v61);
    v63 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 8);
    v64 = swift_bridgeObjectRetain();
    v65 = v63(v64, v61, v62);
    swift_bridgeObjectRelease();
    v66 = v4[8];
    v67 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v66);
    v68 = v96;
    sub_1C12B530C();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v67 + 40))(v68, v65, v66, v67);
    v95 = *(_QWORD *)(v95 + 8);
    v69 = v97;
    ((void (*)(_BYTE *, uint64_t))v95)(v68, v97);
    v99[0] = v65;
    sub_1C12A678C(v98);
    v98 = v99[0];
    v70 = v4[8];
    v71 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v70);
    v72 = v94;
    v73 = (*(uint64_t (**)(uint64_t, int64_t, uint64_t, uint64_t))(v71 + 32))(v60, v94, v70, v71);
    v75 = v4[8];
    v74 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v75);
    v76 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 16))(v101, v75, v74);
    swift_bridgeObjectRelease();
    v77 = v4[8];
    v78 = v4[9];
    __swift_project_boxed_opaque_existential_1(v4 + 5, v77);
    sub_1C12B530C();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v78 + 48))(v68, v76, v77, v78);
    ((void (*)(_BYTE *, uint64_t))v95)(v68, v69);
    v99[0] = v73;
    sub_1C12A678C(v76);
    v79 = v99[0];
    LOBYTE(v99[0]) = v92;
    sub_1C12A68DC(v98, v79, v93, v72, (unsigned __int8 *)v99);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v53 = *(_QWORD *)(v98 + 8 * v54);
  if (v53)
  {
    a1 = v54;
    goto LABEL_53;
  }
  while (1)
  {
    a1 = v54 + 1;
    if (__OFADD__(v54, 1))
      break;
    if (a1 >= a2)
      goto LABEL_56;
    v53 = *(_QWORD *)(v98 + 8 * a1);
    ++v54;
    if (v53)
      goto LABEL_53;
  }
  __break(1u);
LABEL_76:
  swift_once();
LABEL_18:
  v30 = sub_1C12B5390();
  __swift_project_value_buffer(v30, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v20 = sub_1C12B5384();
  v31 = sub_1C12B5540();
  if (os_log_type_enabled(v20, v31))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v99[0] = v23;
    *(_DWORD *)v22 = 136380675;
    if (v4[26])
    {
      v32 = v4[25];
      v33 = v4[26];
    }
    else
    {
      v80 = IDSCopyLocalDeviceUniqueID();
      if (v80)
      {
        v81 = (void *)v80;
        v32 = sub_1C12B5480();
        v33 = v82;

      }
      else
      {
        v32 = 0xD000000000000017;
        v33 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v100 = sub_1C12882D0(v32, v33, v99);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    v83 = v31;
    v84 = "(%{private}s) Will not sync because sync is inactive";
    goto LABEL_71;
  }
LABEL_26:

  swift_release_n();
}

uint64_t sub_1C129EF7C(unint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  int v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v61[2];
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72[2];
  char v73;
  uint64_t v74;

  v7 = v6;
  v70 = a3;
  v71 = a4;
  v11 = sub_1C12B5324();
  v67 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v68 = (char *)v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1C12B542C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (_QWORD *)((char *)v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = *(_QWORD *)a1;
  v65 = *(_QWORD *)(a1 + 8);
  v66 = v17;
  LODWORD(a1) = *(unsigned __int8 *)(a1 + 16);
  v19 = *a2;
  v20 = *a6;
  v21 = *(void **)(v7 + 120);
  *v16 = v21;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E0DEF740], v13);
  v22 = v21;
  LOBYTE(v21) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v14 + 8))(v16, v13);
  if ((v21 & 1) != 0)
  {
    v64 = v20;
    v69 = a5;
    if (qword_1ED78E810 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v23 = sub_1C12B5390();
  v24 = __swift_project_value_buffer(v23, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v25 = sub_1C12B5384();
  v26 = sub_1C12B5540();
  if (os_log_type_enabled(v25, v26))
  {
    v62 = a1;
    v63 = v11;
    v27 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v72[0] = v28;
    *(_DWORD *)v27 = 136380931;
    v29 = *(_QWORD *)(v7 + 208);
    v61[1] = v24;
    if (v29)
    {
      v30 = *(_QWORD *)(v7 + 200);
      v31 = v29;
    }
    else
    {
      v32 = IDSCopyLocalDeviceUniqueID();
      if (v32)
      {
        v33 = (void *)v32;
        v30 = sub_1C12B5480();
        v31 = v34;

      }
      else
      {
        v30 = 0xD000000000000017;
        v31 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v74 = sub_1C12882D0(v30, v31, v72);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2082;
    if (v19)
      v35 = 0x6563616C706572;
    else
      v35 = 0x657461647075;
    if (v19)
      a1 = 0xE700000000000000;
    else
      a1 = 0xE600000000000000;
    v74 = sub_1C12882D0(v35, a1, v72);
    sub_1C12B55DC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v25, v26, "(%{private}s) Received ack message for action %{public}s", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v28, -1, -1);
    MEMORY[0x1C3BA9870](v27, -1, -1);

    v11 = v63;
    LOBYTE(a1) = v62;
  }
  else
  {

    swift_release_n();
  }
  v36 = *(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t))(v7 + 256);
  v37 = v69;
  if (v36)
  {
    v72[0] = v66;
    v72[1] = v65;
    v73 = a1;
    LOBYTE(v74) = v19;
    swift_retain();
    v36(v72, &v74, v70, v71, v37);
    sub_1C1293164((uint64_t)v36);
  }
  if (v19)
  {
    swift_retain_n();
    v38 = sub_1C12B5384();
    v39 = sub_1C12B5540();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = v11;
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v72[0] = v42;
      *(_DWORD *)v41 = 136380675;
      if (*(_QWORD *)(v7 + 208))
      {
        v43 = *(_QWORD *)(v7 + 200);
        v44 = *(_QWORD *)(v7 + 208);
      }
      else
      {
        v45 = IDSCopyLocalDeviceUniqueID();
        if (v45)
        {
          v46 = (void *)v45;
          v43 = sub_1C12B5480();
          v44 = v47;

        }
        else
        {
          v43 = 0xD000000000000017;
          v44 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v74 = sub_1C12882D0(v43, v44, v72);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C127A000, v38, v39, "(%{private}s) Paired device has performed an initial sync", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v42, -1, -1);
      MEMORY[0x1C3BA9870](v41, -1, -1);

      v11 = v40;
      v37 = v69;
    }
    else
    {

      swift_release_n();
    }
    v48 = *(_QWORD *)(v7 + 64);
    v49 = *(_QWORD *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 40), v48);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 144))(v71, v37, v48, v49);
  }
  v50 = v68;
  sub_1C12B530C();
  v51 = *(_BYTE *)(v7 + 16);
  v52 = *(_QWORD *)(v7 + 64);
  v53 = *(_QWORD *)(v7 + 72);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 40), v52);
  if ((v51 & 1) != 0)
  {
    v54 = v71;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 64))(v50, v70, v71, v37, v52, v53);
    v55 = *(_QWORD *)(v7 + 64);
    v56 = *(_QWORD *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 40), v55);
    if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 136))(v54, v37, v55, v56) & 1) == 0)
    {
      LOBYTE(v72[0]) = v64;
      sub_1C12A5B70(v54, v37, (char *)v72);
    }
  }
  else
  {
    v57 = v71;
    if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 136))(v71, v37, v52, v53) & 1) != 0)
    {
      v58 = *(_QWORD *)(v7 + 64);
      v59 = *(_QWORD *)(v7 + 72);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 40), v58);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 64))(v50, v70, v57, v37, v58, v59);
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v50, v11);
}

void sub_1C129F5E0(uint64_t a1, uint64_t a2, int64_t a3, unsigned __int8 *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = v4;
  v9 = sub_1C12B542C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  LODWORD(v13) = *a4;
  v14 = (void *)v5[15];
  *v12 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0DEF740], v9);
  v15 = v14;
  LOBYTE(v14) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v10 + 8))(v12, v9);
  if ((v14 & 1) != 0)
  {
    if (qword_1ED78E810 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v16 = sub_1C12B5390();
  __swift_project_value_buffer(v16, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v17 = sub_1C12B5384();
  v18 = sub_1C12B5540();
  if (!os_log_type_enabled(v17, v18))
  {

    swift_release_n();
    v24 = (void (*)(uint64_t))v5[34];
    if (!v24)
      goto LABEL_13;
    goto LABEL_12;
  }
  v19 = (uint8_t *)swift_slowAlloc();
  v20 = swift_slowAlloc();
  v32 = v20;
  *(_DWORD *)v19 = 136380675;
  v21 = v5[26];
  v30 = a2;
  HIDWORD(v29) = v13;
  v22 = a3;
  if (v21)
  {
    v13 = v5[25];
    v23 = v21;
  }
  else
  {
    v25 = IDSCopyLocalDeviceUniqueID();
    if (v25)
    {
      v26 = (void *)v25;
      v13 = sub_1C12B5480();
      v23 = v27;

    }
    else
    {
      v23 = 0x80000001C12BAE80;
      v13 = 0xD000000000000017;
    }
  }
  swift_bridgeObjectRetain();
  v31 = sub_1C12882D0(v13, v23, &v32);
  sub_1C12B55DC();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1C127A000, v17, v18, "(%{private}s) Received unlock message", v19, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v20, -1, -1);
  MEMORY[0x1C3BA9870](v19, -1, -1);

  a3 = v22;
  a2 = v30;
  LOBYTE(v13) = BYTE4(v29);
  v24 = (void (*)(uint64_t))v5[34];
  if (v24)
  {
LABEL_12:
    v28 = swift_retain();
    v24(v28);
    sub_1C1293164((uint64_t)v24);
  }
LABEL_13:
  sub_1C12A6204();
  sub_1C12A64D0();
  LOBYTE(v32) = v13;
  sub_1C129E3F8(a2, a3, (unsigned __int8 *)&v32);
}

void sub_1C129F8C4(uint64_t a1, uint64_t a2, int64_t a3, unsigned __int8 *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = v4;
  v9 = sub_1C12B542C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  LODWORD(v13) = *a4;
  v14 = (void *)v5[15];
  *v12 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0DEF740], v9);
  v15 = v14;
  LOBYTE(v14) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v10 + 8))(v12, v9);
  if ((v14 & 1) != 0)
  {
    if (qword_1ED78E810 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v16 = sub_1C12B5390();
  __swift_project_value_buffer(v16, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v17 = sub_1C12B5384();
  v18 = sub_1C12B5540();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v31 = v20;
    *(_DWORD *)v19 = 136380675;
    v21 = v5[26];
    v29 = a3;
    HIDWORD(v28) = v13;
    if (v21)
    {
      v13 = v5[25];
      v22 = v21;
    }
    else
    {
      v23 = IDSCopyLocalDeviceUniqueID();
      if (v23)
      {
        v24 = (void *)v23;
        v13 = sub_1C12B5480();
        v22 = v25;

      }
      else
      {
        v22 = 0x80000001C12BAE80;
        v13 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    v30 = sub_1C12882D0(v13, v22, &v31);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v17, v18, "(%{private}s) Received resync message", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v20, -1, -1);
    MEMORY[0x1C3BA9870](v19, -1, -1);

    a3 = v29;
    LOBYTE(v13) = BYTE4(v28);
  }
  else
  {

    swift_release_n();
  }
  v26 = v5[8];
  v27 = v5[9];
  __swift_project_boxed_opaque_existential_1(v5 + 5, v26);
  (*(void (**)(uint64_t, int64_t, uint64_t, uint64_t))(v27 + 120))(a2, a3, v26, v27);
  sub_1C12A6204();
  sub_1C12A64D0();
  LOBYTE(v31) = v13;
  sub_1C129E3F8(a2, a3, (unsigned __int8 *)&v31);
}

void sub_1C129FBA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int64_t v34;
  int64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ObjectType;
  void (*v44)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t);
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  os_log_type_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  unint64_t v65;
  os_log_type_t v66;
  const char *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned __int8 v75;
  uint64_t v76[5];
  uint64_t v77;

  v7 = v6;
  v73 = a4;
  v74 = a5;
  v11 = sub_1C12B542C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (uint64_t *)((char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *a6;
  v16 = *(void **)(v7 + 120);
  *v14 = v16;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DEF740], v11);
  v17 = v16;
  LOBYTE(v16) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
  if ((v16 & 1) == 0)
    goto LABEL_57;
  v69 = v15;
  v70 = a2;
  v71 = a3;
  if (qword_1ED78E810 != -1)
LABEL_58:
    swift_once();
  v18 = sub_1C12B5390();
  __swift_project_value_buffer(v18, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v19 = sub_1C12B5384();
  v20 = sub_1C12B5540();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v76[0] = v22;
    *(_DWORD *)v21 = 136380675;
    if (*(_QWORD *)(v7 + 208))
    {
      v23 = *(_QWORD *)(v7 + 200);
      v24 = *(_QWORD *)(v7 + 208);
    }
    else
    {
      v25 = IDSCopyLocalDeviceUniqueID();
      if (v25)
      {
        v26 = (void *)v25;
        v23 = sub_1C12B5480();
        v24 = v27;

      }
      else
      {
        v23 = 0xD000000000000017;
        v24 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v77 = sub_1C12882D0(v23, v24, v76);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v19, v20, "(%{private}s) Received replace message", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v22, -1, -1);
    MEMORY[0x1C3BA9870](v21, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v28 = *(_QWORD *)(v7 + 248);
  if (qword_1ED78DCC8 != -1)
    swift_once();
  if ((qword_1ED78DCC0 & ~v28) != 0)
  {
    swift_retain_n();
    v45 = sub_1C12B5384();
    v46 = sub_1C12B5534();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v76[0] = v48;
      *(_DWORD *)v47 = 136380675;
      if (*(_QWORD *)(v7 + 208))
      {
        v49 = *(_QWORD *)(v7 + 200);
        v50 = *(_QWORD *)(v7 + 208);
      }
      else
      {
        v60 = IDSCopyLocalDeviceUniqueID();
        if (v60)
        {
          v61 = (void *)v60;
          v49 = sub_1C12B5480();
          v50 = v62;

        }
        else
        {
          v49 = 0xD000000000000017;
          v50 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v77 = sub_1C12882D0(v49, v50, v76);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v66 = v46;
      v67 = "(%{private}s) Will not handle message because sync is inactive";
      goto LABEL_54;
    }
LABEL_44:

    swift_release_n();
    return;
  }
  if (*(_BYTE *)(v7 + 16) == 1)
  {
    swift_beginAccess();
    v29 = *(_QWORD *)(v7 + 144);
    v30 = *(_QWORD *)(v29 + 64);
    v72 = v29 + 64;
    v31 = 1 << *(_BYTE *)(v29 + 32);
    v32 = -1;
    if (v31 < 64)
      v32 = ~(-1 << v31);
    v33 = v32 & v30;
    v34 = (unint64_t)(v31 + 63) >> 6;
    swift_bridgeObjectRetain();
    v35 = 0;
    while (1)
    {
      if (v33)
      {
        v36 = __clz(__rbit64(v33));
        v33 &= v33 - 1;
        v37 = v36 | (v35 << 6);
      }
      else
      {
        v38 = v35 + 1;
        if (__OFADD__(v35, 1))
        {
          __break(1u);
          goto LABEL_56;
        }
        if (v38 >= v34)
          goto LABEL_45;
        v39 = *(_QWORD *)(v72 + 8 * v38);
        ++v35;
        if (!v39)
        {
          v35 = v38 + 1;
          if (v38 + 1 >= v34)
            goto LABEL_45;
          v39 = *(_QWORD *)(v72 + 8 * v35);
          if (!v39)
          {
            v35 = v38 + 2;
            if (v38 + 2 >= v34)
              goto LABEL_45;
            v39 = *(_QWORD *)(v72 + 8 * v35);
            if (!v39)
            {
              v40 = v38 + 3;
              if (v40 >= v34)
              {
LABEL_45:
                swift_release();
                v54 = *(_QWORD *)(v7 + 64);
                v55 = *(_QWORD *)(v7 + 72);
                __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 40), v54);
                (*(void (**)(uint64_t, uint64_t))(v55 + 80))(v54, v55);
                v56 = *(_QWORD *)(v7 + 64);
                v57 = *(_QWORD *)(v7 + 72);
                __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 40), v56);
                v59 = v73;
                v58 = v74;
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 144))(v73, v74, v56, v57);
                LOBYTE(v76[0]) = v69;
                v75 = 1;
                sub_1C12A07E8(v70, v71, v59, v58, (unsigned __int8 *)v76, &v75);
                return;
              }
              v39 = *(_QWORD *)(v72 + 8 * v40);
              if (!v39)
              {
                while (1)
                {
                  v35 = v40 + 1;
                  if (__OFADD__(v40, 1))
                    break;
                  if (v35 >= v34)
                    goto LABEL_45;
                  v39 = *(_QWORD *)(v72 + 8 * v35);
                  ++v40;
                  if (v39)
                    goto LABEL_35;
                }
LABEL_56:
                __break(1u);
LABEL_57:
                __break(1u);
                goto LABEL_58;
              }
              v35 = v40;
            }
          }
        }
LABEL_35:
        v33 = (v39 - 1) & v39;
        v37 = __clz(__rbit64(v39)) + (v35 << 6);
      }
      v41 = *(_QWORD *)(*(_QWORD *)(v29 + 56) + 8 * v37);
      v76[3] = type metadata accessor for SyncEngine();
      v76[4] = (uint64_t)&protocol witness table for SyncEngine;
      v76[0] = v7;
      if (MEMORY[0x1C3BA98D0](v41 + 16))
      {
        v42 = *(_QWORD *)(v41 + 24);
        ObjectType = swift_getObjectType();
        v44 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 48);
        swift_retain_n();
        swift_retain();
        v44(v76, v73, v74, ObjectType, v42);
        swift_unknownObjectRelease();
      }
      else
      {
        swift_retain_n();
        swift_retain();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
      swift_release();
      swift_release();
    }
  }
  swift_retain_n();
  v45 = sub_1C12B5384();
  v51 = sub_1C12B5534();
  if (!os_log_type_enabled(v45, v51))
    goto LABEL_44;
  v47 = (uint8_t *)swift_slowAlloc();
  v48 = swift_slowAlloc();
  v76[0] = v48;
  *(_DWORD *)v47 = 136380675;
  if (*(_QWORD *)(v7 + 208))
  {
    v52 = *(_QWORD *)(v7 + 200);
    v53 = *(_QWORD *)(v7 + 208);
  }
  else
  {
    v63 = IDSCopyLocalDeviceUniqueID();
    if (v63)
    {
      v64 = (void *)v63;
      v52 = sub_1C12B5480();
      v53 = v65;

    }
    else
    {
      v52 = 0xD000000000000017;
      v53 = 0x80000001C12BAE80;
    }
  }
  swift_bridgeObjectRetain();
  v77 = sub_1C12882D0(v52, v53, v76);
  sub_1C12B55DC();
  swift_release_n();
  swift_bridgeObjectRelease();
  v66 = v51;
  v67 = "(%{private}s) Paired device should never send a replace message";
LABEL_54:
  _os_log_impl(&dword_1C127A000, v45, v66, v67, v47, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v48, -1, -1);
  MEMORY[0x1C3BA9870](v47, -1, -1);

}

void sub_1C12A0344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v7 = v6;
  v13 = sub_1C12B542C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (uint64_t *)((char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = *a6;
  v18 = (void *)v7[15];
  *v16 = v18;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E0DEF740], v13);
  v19 = v18;
  v20 = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v14 + 8))(v16, v13);
  if ((v20 & 1) != 0)
  {
    v20 = v7[31];
    if (qword_1ED78DCC8 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  if ((qword_1ED78DCC0 & ~v20) != 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v28 = sub_1C12B5390();
    __swift_project_value_buffer(v28, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v29 = sub_1C12B5384();
    v30 = sub_1C12B5534();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v46 = v32;
      *(_DWORD *)v31 = 136380675;
      if (v7[26])
      {
        v33 = v7[25];
        v34 = v7[26];
      }
      else
      {
        v38 = IDSCopyLocalDeviceUniqueID();
        if (v38)
        {
          v39 = (void *)v38;
          v33 = sub_1C12B5480();
          v34 = v40;

        }
        else
        {
          v33 = 0xD000000000000017;
          v34 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v45 = sub_1C12882D0(v33, v34, &v46);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C127A000, v29, v30, "(%{private}s) Will not handle message because sync is inactive", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v32, -1, -1);
      MEMORY[0x1C3BA9870](v31, -1, -1);

    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    v44 = a2;
    if (qword_1ED78E810 != -1)
      swift_once();
    v21 = sub_1C12B5390();
    __swift_project_value_buffer(v21, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v22 = sub_1C12B5384();
    v23 = sub_1C12B5540();
    if (os_log_type_enabled(v22, v23))
    {
      v41 = a3;
      v42 = a4;
      v43 = a5;
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v46 = v25;
      *(_DWORD *)v24 = 136380675;
      if (v7[26])
      {
        v26 = v7[25];
        v27 = v7[26];
      }
      else
      {
        v35 = IDSCopyLocalDeviceUniqueID();
        if (v35)
        {
          v36 = (void *)v35;
          v26 = sub_1C12B5480();
          v27 = v37;

        }
        else
        {
          v26 = 0xD000000000000017;
          v27 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v45 = sub_1C12882D0(v26, v27, &v46);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C127A000, v22, v23, "(%{private}s) Received update message", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v25, -1, -1);
      MEMORY[0x1C3BA9870](v24, -1, -1);

      a4 = v42;
      a5 = v43;
      a3 = v41;
    }
    else
    {

      swift_release_n();
    }
    LOBYTE(v46) = v17;
    LOBYTE(v45) = 0;
    sub_1C12A07E8(v44, a3, a4, a5, (unsigned __int8 *)&v46, (unsigned __int8 *)&v45);
  }
}

void sub_1C12A07E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  uint64_t v6;
  uint64_t v7;
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
  char *v60;
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
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void (*v123)(uint64_t *, uint64_t, uint64_t);
  uint64_t v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t, uint64_t);
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  int v132;
  uint64_t v133;
  void (*v134)(char *, uint64_t, uint64_t);
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  char v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  os_log_type_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  char v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void (*v165)(char *);
  uint64_t v166;
  NSObject *v167;
  uint64_t v168;
  os_log_type_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t v175;
  NSObject *v176;
  os_log_type_t v177;
  uint64_t v178;
  NSObject *v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  uint64_t v183;
  void *v184;
  unint64_t v185;
  uint64_t v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  NSObject *v193;
  uint64_t v194;
  os_log_type_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  unint64_t v199;
  unint64_t v200;
  uint64_t v201;
  void *v202;
  unint64_t v203;
  uint64_t v204;
  void *v205;
  unint64_t v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  unint64_t v211;
  NSObject *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void (*v219)(uint64_t *, uint64_t, uint64_t);
  uint64_t v220;
  void *v221;
  unint64_t v222;
  uint64_t v223;
  void *v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  NSObject *v232;
  Class isa;
  uint64_t ObjectType;
  uint64_t (*v235)(uint64_t *, _QWORD *, uint64_t, Class);
  uint64_t v236;
  uint64_t v237;
  _QWORD *v238;
  unint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void (*v247)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void (*v253)(uint64_t *, uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  unint64_t v255;
  unint64_t v256;
  uint64_t v257;
  uint64_t v258;
  unint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  unint64_t v264;
  unint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  unint64_t v271;
  char v272;
  uint64_t v273;
  os_log_t v274;
  int v275;
  uint64_t v276;
  NSObject *v277;
  os_log_type_t v278;
  uint64_t v279;
  uint64_t v280;
  unint64_t v281;
  unint64_t v282;
  uint64_t v283;
  os_log_type_t v284;
  uint64_t v285;
  NSObject *v286;
  unint64_t v287;
  unint64_t v288;
  unint64_t v289;
  uint64_t inited;
  uint64_t *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  unint64_t v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  unint64_t v309;
  unint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  NSObject *v316;
  os_log_type_t v317;
  uint64_t v318;
  uint64_t v319;
  unint64_t v320;
  unint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t (*v327)(uint64_t *, _QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t v328;
  uint64_t v329;
  unint64_t v330;
  unint64_t v331;
  uint64_t v332;
  uint64_t v333;
  unint64_t v334;
  uint64_t v335;
  unint64_t v336;
  NSObject *v337;
  uint64_t v338;
  void *v339;
  unint64_t v340;
  uint64_t *v341;
  uint64_t *v342;
  uint64_t v343;
  unint64_t v344;
  char v345;
  char v346;
  uint64_t v347;
  NSObject *v348;
  os_log_type_t v349;
  uint64_t v350;
  unint64_t v351;
  unint64_t v352;
  uint64_t v353;
  uint64_t v354;
  NSObject *v355;
  os_log_type_t v356;
  uint64_t v357;
  uint64_t v358;
  unint64_t v359;
  unint64_t v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  unint64_t v364;
  uint64_t v365;
  uint64_t v366;
  unint64_t v367;
  uint64_t v368;
  uint64_t *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  unint64_t v376;
  uint64_t v377;
  void *v378;
  unint64_t v379;
  uint64_t v380;
  unint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t (*v385)(uint64_t *, _QWORD *, uint64_t, uint64_t);
  uint64_t v386;
  uint64_t v387;
  _QWORD *v388;
  unint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  void (*v397)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v398;
  unint64_t v399;
  NSObject *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t (*v403)(uint64_t *, _QWORD *, uint64_t, uint64_t);
  uint64_t v404;
  uint64_t v405;
  _QWORD *v406;
  unint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  void (*v415)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  void (*v421)(uint64_t *, uint64_t, uint64_t);
  uint64_t v422;
  uint64_t v423;
  unint64_t v424;
  uint64_t v425;
  uint64_t *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  __int128 v438;
  uint64_t v439;
  uint64_t v440;
  _QWORD *v441;
  uint64_t v442;
  uint64_t v443;
  _QWORD *v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  void (*v453)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v454;
  uint64_t v455;
  unint64_t v456;
  char v457;
  uint64_t v458;
  uint64_t *v459;
  uint64_t v460;
  uint64_t v461;
  NSObject *v462;
  int v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  unint64_t v467;
  unint64_t v468;
  unint64_t v469;
  uint64_t v470;
  NSObject *v471;
  os_log_type_t v472;
  uint64_t v473;
  uint64_t v474;
  unint64_t v475;
  unint64_t v476;
  uint64_t v477;
  uint64_t v478;
  void *v479;
  unint64_t v480;
  uint64_t v481;
  void *v482;
  unint64_t v483;
  uint64_t v484;
  uint64_t v485;
  unint64_t v486;
  uint64_t v487;
  uint64_t v488;
  unint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  unint64_t v493;
  os_log_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  void (*v503)(uint64_t *, uint64_t *, uint64_t, uint64_t);
  unint64_t v504;
  unint64_t v505;
  char *v506;
  uint64_t v507;
  void (*v508)(char *, uint64_t);
  NSObject *v509;
  os_log_type_t v510;
  uint8_t *v511;
  uint64_t v512;
  unint64_t v513;
  unint64_t v514;
  uint64_t v515;
  void *v516;
  unint64_t v517;
  uint64_t v518;
  unint64_t v519;
  uint64_t v520;
  uint64_t v521;
  unint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t *v529;
  uint64_t *v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  unint64_t v539;
  uint64_t v540;
  uint64_t v541;
  int v542;
  int v543;
  uint64_t v544;
  __int128 v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  char *v550;
  char *v551;
  char *v552;
  char *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  __int128 v560;
  __int128 v561;
  _QWORD *v562;
  uint64_t v563;
  unint64_t v564;
  uint64_t v565;
  uint64_t *v566;
  uint64_t v567;
  uint64_t v568;
  void (*v569)(char *, uint64_t);
  char *v570;
  NSObject *v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t *v575;
  uint64_t v576;
  _QWORD *v577;
  uint64_t v578;
  __int128 v579;
  uint64_t v580;
  uint64_t v581;
  char *v582;
  char *v583;
  uint64_t v584;
  uint64_t v585;
  char *v586;
  char *v587;
  uint64_t v588;
  _QWORD *v589;
  char *v590;
  uint64_t v591;
  uint64_t v592;
  __int128 v593;
  char *v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  _QWORD v598[3];
  uint64_t v599[2];
  uint64_t v600;
  uint64_t v601;
  _UNKNOWN **v602;

  v7 = v6;
  v585 = a4;
  v584 = a3;
  v547 = a2;
  v548 = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D44E8);
  MEMORY[0x1E0C80A78](v10);
  v528 = (uint64_t)&v518 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for RecordMetadata(0);
  v582 = *(char **)(v12 - 8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v518 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v13);
  v590 = (char *)&v518 - v17;
  v18 = MEMORY[0x1E0C80A78](v16);
  v581 = (uint64_t)&v518 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v572 = (uint64_t)&v518 - v21;
  v22 = MEMORY[0x1E0C80A78](v20);
  v565 = (uint64_t)&v518 - v23;
  v24 = MEMORY[0x1E0C80A78](v22);
  v575 = (uint64_t *)((char *)&v518 - v25);
  v26 = MEMORY[0x1E0C80A78](v24);
  v580 = (uint64_t)&v518 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v536 = (uint64_t)&v518 - v29;
  MEMORY[0x1E0C80A78](v28);
  v535 = (uint64_t)&v518 - v30;
  v595 = sub_1C12B5390();
  v559 = *(_QWORD *)(v595 - 8);
  v31 = MEMORY[0x1E0C80A78](v595);
  v551 = (char *)&v518 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v31);
  v550 = (char *)&v518 - v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  v35 = MEMORY[0x1E0C80A78](v34);
  v538 = (uint64_t)&v518 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x1E0C80A78](v35);
  v555 = (uint64_t)&v518 - v38;
  v39 = MEMORY[0x1E0C80A78](v37);
  v525 = (uint64_t *)((char *)&v518 - v40);
  v41 = MEMORY[0x1E0C80A78](v39);
  v530 = (uint64_t *)((char *)&v518 - v42);
  v43 = MEMORY[0x1E0C80A78](v41);
  v529 = (uint64_t *)((char *)&v518 - v44);
  v45 = MEMORY[0x1E0C80A78](v43);
  v534 = (uint64_t)&v518 - v46;
  v47 = MEMORY[0x1E0C80A78](v45);
  v537 = (uint64_t)&v518 - v48;
  v49 = MEMORY[0x1E0C80A78](v47);
  v554 = (uint64_t)&v518 - v50;
  v51 = MEMORY[0x1E0C80A78](v49);
  v557 = (uint64_t)&v518 - v52;
  v53 = MEMORY[0x1E0C80A78](v51);
  v563 = (uint64_t)&v518 - v54;
  v55 = MEMORY[0x1E0C80A78](v53);
  v574 = (uint64_t)&v518 - v56;
  MEMORY[0x1E0C80A78](v55);
  v588 = (uint64_t)&v518 - v57;
  v531 = type metadata accessor for Record(0);
  v540 = *(_QWORD *)(v531 - 8);
  v58 = MEMORY[0x1E0C80A78](v531);
  v60 = (char *)&v518 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = MEMORY[0x1E0C80A78](v58);
  v553 = (char *)&v518 - v62;
  v63 = MEMORY[0x1E0C80A78](v61);
  v541 = (uint64_t)&v518 - v64;
  v65 = MEMORY[0x1E0C80A78](v63);
  v546 = (uint64_t)&v518 - v66;
  v67 = MEMORY[0x1E0C80A78](v65);
  v527 = (uint64_t)&v518 - v68;
  v69 = MEMORY[0x1E0C80A78](v67);
  v524 = (uint64_t)&v518 - v70;
  v71 = MEMORY[0x1E0C80A78](v69);
  v526 = (uint64_t)&v518 - v72;
  v73 = MEMORY[0x1E0C80A78](v71);
  v532 = (uint64_t)&v518 - v74;
  v75 = MEMORY[0x1E0C80A78](v73);
  v533 = (uint64_t)&v518 - v76;
  v77 = MEMORY[0x1E0C80A78](v75);
  v552 = (char *)&v518 - v78;
  v79 = MEMORY[0x1E0C80A78](v77);
  v566 = (uint64_t *)((char *)&v518 - v80);
  v81 = MEMORY[0x1E0C80A78](v79);
  v567 = (uint64_t)&v518 - v82;
  v83 = MEMORY[0x1E0C80A78](v81);
  v556 = (uint64_t)&v518 - v84;
  v85 = MEMORY[0x1E0C80A78](v83);
  v558 = (uint64_t)&v518 - v86;
  v87 = MEMORY[0x1E0C80A78](v85);
  v576 = (uint64_t)&v518 - v88;
  MEMORY[0x1E0C80A78](v87);
  v90 = (uint64_t *)((char *)&v518 - v89);
  v573 = sub_1C12B5324();
  v564 = *(_QWORD *)(v573 - 8);
  v91 = MEMORY[0x1E0C80A78](v573);
  v570 = (char *)&v518 - ((v92 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = MEMORY[0x1E0C80A78](v91);
  v583 = (char *)&v518 - v94;
  MEMORY[0x1E0C80A78](v93);
  v586 = (char *)&v518 - v95;
  v96 = sub_1C12B542C();
  v97 = *(_QWORD *)(v96 - 8);
  MEMORY[0x1E0C80A78](v96);
  v99 = (uint64_t *)((char *)&v518 - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0));
  v543 = *a5;
  v542 = *a6;
  v100 = *(void **)(v7 + 120);
  *v99 = v100;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v97 + 104))(v99, *MEMORY[0x1E0DEF740], v96);
  v101 = v100;
  LOBYTE(v100) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v97 + 8))(v99, v96);
  if ((v100 & 1) == 0)
  {
    __break(1u);
LABEL_210:
    swift_once();
LABEL_201:
    __swift_project_value_buffer(v595, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v509 = sub_1C12B5384();
    v510 = sub_1C12B5534();
    if (os_log_type_enabled(v509, v510))
    {
      v511 = (uint8_t *)swift_slowAlloc();
      v512 = swift_slowAlloc();
      v599[0] = v512;
      *(_DWORD *)v511 = 136380675;
      if (*(_QWORD *)(v7 + 208))
      {
        v513 = *(_QWORD *)(v7 + 200);
        v514 = *(_QWORD *)(v7 + 208);
      }
      else
      {
        v515 = IDSCopyLocalDeviceUniqueID();
        if (v515)
        {
          v516 = (void *)v515;
          v513 = sub_1C12B5480();
          v514 = v517;

        }
        else
        {
          v513 = 0xD000000000000017;
          v514 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v597 = sub_1C12882D0(v513, v514, v599);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C127A000, v509, v510, "(%{private}s) Ignoring update from paired device that we have never synced with", v511, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v512, -1, -1);
      MEMORY[0x1C3BA9870](v511, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    return;
  }
  if ((*(_BYTE *)(v7 + 16) & 1) == 0)
  {
    v102 = *(_QWORD *)(v7 + 64);
    v103 = *(_QWORD *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 40), v102);
    if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v103 + 136))(v584, v585, v102, v103) & 1) == 0)
    {
      if (qword_1ED78E810 == -1)
        goto LABEL_201;
      goto LABEL_210;
    }
  }
  sub_1C12B530C();
  v104 = v570;
  sub_1C12B530C();
  sub_1C12B52C4();
  v569 = *(void (**)(char *, uint64_t))(v564 + 8);
  v569(v104, v573);
  v105 = *(_QWORD *)(v548 + 16);
  v578 = v7;
  v594 = v15;
  if (v105)
  {
    v577 = (_QWORD *)(v7 + 40);
    v106 = v540;
    v522 = (*(unsigned __int8 *)(v106 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80);
    v107 = v548 + v522;
    swift_bridgeObjectRetain();
    v568 = v7 + 144;
    swift_beginAccess();
    v108 = MEMORY[0x1E0DEE9D8];
    v562 = v598;
    *(_QWORD *)&v579 = *(_QWORD *)(v106 + 72);
    *(_QWORD *)&v109 = 136381187;
    v561 = v109;
    v110 = v107;
    v539 = (unint64_t)"Validating sync engine";
    v549 = MEMORY[0x1E0DEE9B8] + 8;
    *((_QWORD *)&v109 + 1) = 2;
    v545 = xmmword_1C12B7860;
    *(_QWORD *)&v109 = 136380931;
    v560 = v109;
    v592 = v12;
    v587 = v60;
    v589 = v90;
    while (1)
    {
      sub_1C127F408(v110, (uint64_t)v90, type metadata accessor for Record);
      v117 = sub_1C12B52DC();
      *(_QWORD *)&v593 = v110;
      if ((v117 & 1) != 0)
        break;
      if (qword_1ED78E810 != -1)
        swift_once();
      __swift_project_value_buffer(v595, (uint64_t)qword_1ED78DC40);
      v130 = (uint64_t)v90;
      sub_1C127F408((uint64_t)v90, (uint64_t)v60, type metadata accessor for Record);
      swift_retain_n();
      v131 = sub_1C12B5384();
      v132 = sub_1C12B5534();
      if (!os_log_type_enabled(v131, (os_log_type_t)v132))
      {

        sub_1C127F44C((uint64_t)v60, type metadata accessor for Record);
        swift_release_n();
        sub_1C127F44C(v130, type metadata accessor for Record);
        v90 = (_QWORD *)v130;
        v116 = v593;
        goto LABEL_10;
      }
      v591 = v105;
      v111 = swift_slowAlloc();
      v112 = swift_slowAlloc();
      v597 = v112;
      *(_DWORD *)v111 = v560;
      v113 = *(_QWORD *)(v7 + 208);
      v596 = v108;
      LODWORD(v571) = v132;
      if (v113)
      {
        v114 = *(_QWORD *)(v7 + 200);
        v115 = v113;
      }
      else
      {
        v183 = IDSCopyLocalDeviceUniqueID();
        if (v183)
        {
          v184 = (void *)v183;
          v114 = sub_1C12B5480();
          v115 = v185;

        }
        else
        {
          v115 = v539 | 0x8000000000000000;
          v114 = 0xD000000000000017;
        }
        v7 = v578;
      }
      swift_bridgeObjectRetain();
      *(_QWORD *)(v111 + 4) = sub_1C12882D0(v114, v115, &v597);
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v111 + 12) = 2082;
      v599[0] = 0;
      v599[1] = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C12B5660();
      swift_bridgeObjectRelease();
      strcpy((char *)v599, "identifier: ");
      BYTE5(v599[1]) = 0;
      HIWORD(v599[1]) = -5120;
      swift_bridgeObjectRetain();
      sub_1C12B54BC();
      swift_bridgeObjectRelease();
      sub_1C12B54BC();
      swift_bridgeObjectRetain();
      v60 = v587;
      sub_1C12B54BC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_QWORD *)(v111 + 14) = sub_1C12882D0(v599[0], v599[1], &v597);
      swift_bridgeObjectRelease();
      sub_1C127F44C((uint64_t)v60, type metadata accessor for Record);
      _os_log_impl(&dword_1C127A000, v131, (os_log_type_t)v571, "(%{private}s) Detected record from the future; dropping record %{public}s",
        (uint8_t *)v111,
        0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v112, -1, -1);
      MEMORY[0x1C3BA9870](v111, -1, -1);

      v90 = v589;
      sub_1C127F44C((uint64_t)v589, type metadata accessor for Record);
      v108 = v596;
      v105 = v591;
LABEL_9:
      v116 = v593;
LABEL_10:
      v110 = v116 + v579;
      if (!--v105)
      {
        swift_bridgeObjectRelease();
        goto LABEL_162;
      }
    }
    v591 = v105;
    v596 = v108;
    v118 = *(_QWORD *)(v7 + 64);
    v119 = *(_QWORD *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1(v577, v118);
    v120 = v90[1];
    v121 = v90[2];
    v122 = v90[3];
    v599[0] = *v90;
    v599[1] = v120;
    v600 = v121;
    v601 = v122;
    v123 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v119 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v124 = v588;
    v123(v599, v118, v119);
    v125 = v592;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v126 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v582 + 6);
    LODWORD(v118) = v126(v124, 1, v125);
    v127 = v124;
    v90 = v589;
    v128 = v574;
    sub_1C12B383C(v127, v574);
    v129 = v576;
    sub_1C127F408((uint64_t)v90, v576, type metadata accessor for Record);
    if ((_DWORD)v118 == 1)
    {
      sub_1C127F44C(v129, type metadata accessor for Record);
      sub_1C128E2B0(v128, &qword_1ED78E3F0);
      goto LABEL_20;
    }
    v133 = v563;
    sub_1C12B383C(v128, v563);
    v571 = v126;
    if (v126(v133, 1, v125) == 1)
    {
      __break(1u);
LABEL_212:
      __break(1u);
LABEL_213:
      __break(1u);
LABEL_214:
      __break(1u);
LABEL_215:
      __break(1u);
LABEL_216:
      __break(1u);
LABEL_217:
      __break(1u);
LABEL_218:
      __break(1u);
      return;
    }
    v134 = *(void (**)(char *, uint64_t, uint64_t))(v564 + 16);
    v135 = v570;
    v136 = v573;
    v134(v570, v133 + *(int *)(v125 + 20), v573);
    sub_1C127F44C(v133, type metadata accessor for RecordMetadata);
    v137 = v576;
    v138 = sub_1C12B52DC();
    v569(v135, v136);
    sub_1C127F44C(v137, type metadata accessor for Record);
    sub_1C128E2B0(v128, &qword_1ED78E3F0);
    v90 = v589;
    if ((v138 & 1) != 0)
    {
LABEL_20:
      v139 = *(_QWORD *)v568;
      v140 = (uint64_t)v566;
      if (*(_QWORD *)(*(_QWORD *)v568 + 16))
      {
        v142 = v90[2];
        v141 = v90[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v143 = sub_1C128939C(v142, v141);
        if ((v144 & 1) != 0)
        {
          v571 = *(NSObject **)(*(_QWORD *)(v139 + 56) + 8 * v143);
          swift_retain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (qword_1ED78E810 != -1)
            swift_once();
          __swift_project_value_buffer(v595, (uint64_t)qword_1ED78DC40);
          v145 = v558;
          sub_1C127F408((uint64_t)v90, v558, type metadata accessor for Record);
          v146 = v556;
          sub_1C127F408((uint64_t)v90, v556, type metadata accessor for Record);
          swift_retain_n();
          v147 = sub_1C12B5384();
          v148 = sub_1C12B5540();
          if (os_log_type_enabled(v147, v148))
          {
            v149 = v7;
            v150 = swift_slowAlloc();
            v151 = swift_slowAlloc();
            v599[0] = v151;
            *(_DWORD *)v150 = v561;
            v152 = *(_QWORD *)(v149 + 208);
            v544 = v151;
            if (v152)
            {
              v153 = *(_QWORD *)(v149 + 200);
              v154 = v152;
            }
            else
            {
              v204 = IDSCopyLocalDeviceUniqueID();
              if (v204)
              {
                v205 = (void *)v204;
                v153 = sub_1C12B5480();
                v154 = v206;

              }
              else
              {
                v154 = v539 | 0x8000000000000000;
                v153 = 0xD000000000000017;
              }
              v149 = v578;
            }
            swift_bridgeObjectRetain();
            v597 = sub_1C12882D0(v153, v154, v599);
            sub_1C12B55DC();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v150 + 12) = 2082;
            v226 = v558;
            v227 = RecordMetadata.description.getter();
            v597 = sub_1C12882D0(v227, v228, v599);
            sub_1C12B55DC();
            swift_bridgeObjectRelease();
            sub_1C127F44C(v226, type metadata accessor for Record);
            *(_WORD *)(v150 + 22) = 2082;
            v229 = *(_QWORD *)(v146 + 16);
            v230 = *(_QWORD *)(v146 + 24);
            swift_bridgeObjectRetain();
            v597 = sub_1C12882D0(v229, v230, v599);
            sub_1C12B55DC();
            swift_bridgeObjectRelease();
            sub_1C127F44C(v146, type metadata accessor for Record);
            _os_log_impl(&dword_1C127A000, v147, v148, "(%{private}s) Sending modified record %{public}s to data source for zone %{public}s", (uint8_t *)v150, 0x20u);
            v231 = v544;
            swift_arrayDestroy();
            MEMORY[0x1C3BA9870](v231, -1, -1);
            MEMORY[0x1C3BA9870](v150, -1, -1);

            v7 = v149;
            v90 = v589;
          }
          else
          {
            swift_release_n();
            sub_1C127F44C(v145, type metadata accessor for Record);
            sub_1C127F44C(v146, type metadata accessor for Record);

          }
          v601 = type metadata accessor for SyncEngine();
          v602 = &protocol witness table for SyncEngine;
          v599[0] = v7;
          v232 = v571;
          if (MEMORY[0x1C3BA98D0](&v571[2]))
          {
            isa = v232[3].isa;
            ObjectType = swift_getObjectType();
            v235 = (uint64_t (*)(uint64_t *, _QWORD *, uint64_t, Class))*((_QWORD *)isa + 2);
            swift_retain_n();
            LOBYTE(isa) = v235(v599, v90, ObjectType, isa);
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v599);
            swift_release();
            if ((isa & 1) != 0)
            {
              v236 = *(_QWORD *)(v7 + 64);
              v237 = *(_QWORD *)(v7 + 72);
              v238 = v577;
              __swift_project_boxed_opaque_existential_1(v577, v236);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D44F0);
              v239 = (v582[80] + 32) & ~(unint64_t)v582[80];
              v240 = swift_allocObject();
              *(_OWORD *)(v240 + 16) = v545;
              sub_1C127F408((uint64_t)v90, v240 + v239, type metadata accessor for RecordMetadata);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v237 + 88))(v240, v236, v237);
              swift_bridgeObjectRelease();
              v241 = *(_QWORD *)(v7 + 64);
              v242 = *(_QWORD *)(v7 + 72);
              __swift_project_boxed_opaque_existential_1(v238, v241);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D40F0);
              v243 = swift_allocObject();
              *(_OWORD *)(v243 + 16) = v545;
              v244 = v90[1];
              v245 = v90[2];
              v246 = v90[3];
              *(_QWORD *)(v243 + 32) = *v90;
              *(_QWORD *)(v243 + 40) = v244;
              *(_QWORD *)(v243 + 48) = v245;
              *(_QWORD *)(v243 + 56) = v246;
              v247 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v242 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v247(v586, v243, v584, v585, v241, v242);
LABEL_73:
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_74;
            }
          }
          else
          {
            swift_retain_n();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v599);
            swift_release();
          }
LABEL_72:
          v248 = *(_QWORD *)(v7 + 64);
          v249 = *(_QWORD *)(v7 + 72);
          __swift_project_boxed_opaque_existential_1(v577, v248);
          v250 = v90[1];
          v251 = v90[2];
          v252 = v90[3];
          v599[0] = *v90;
          v599[1] = v250;
          v600 = v251;
          v601 = v252;
          v253 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v249 + 128);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v253(v599, v248, v249);
          swift_bridgeObjectRelease();
          goto LABEL_73;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      if (qword_1ED78E810 != -1)
        swift_once();
      __swift_project_value_buffer(v595, (uint64_t)qword_1ED78DC40);
      v175 = v567;
      sub_1C127F408((uint64_t)v90, v567, type metadata accessor for Record);
      sub_1C127F408((uint64_t)v90, v140, type metadata accessor for Record);
      swift_retain_n();
      v176 = sub_1C12B5384();
      v177 = sub_1C12B5534();
      if (os_log_type_enabled(v176, v177))
      {
        v178 = swift_slowAlloc();
        v179 = swift_slowAlloc();
        v599[0] = (uint64_t)v179;
        *(_DWORD *)v178 = v561;
        v180 = *(_QWORD *)(v7 + 208);
        v571 = v179;
        if (v180)
        {
          v181 = *(_QWORD *)(v7 + 200);
          v182 = v180;
        }
        else
        {
          v201 = IDSCopyLocalDeviceUniqueID();
          if (v201)
          {
            v202 = (void *)v201;
            v181 = sub_1C12B5480();
            v182 = v203;

          }
          else
          {
            v182 = v539 | 0x8000000000000000;
            v181 = 0xD000000000000017;
          }
        }
        swift_bridgeObjectRetain();
        v597 = sub_1C12882D0(v181, v182, v599);
        sub_1C12B55DC();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v178 + 12) = 2082;
        v207 = v567;
        v208 = RecordMetadata.description.getter();
        v597 = sub_1C12882D0(v208, v209, v599);
        sub_1C12B55DC();
        swift_bridgeObjectRelease();
        sub_1C127F44C(v207, type metadata accessor for Record);
        *(_WORD *)(v178 + 22) = 2082;
        v210 = *(_QWORD *)(v140 + 16);
        v211 = *(_QWORD *)(v140 + 24);
        swift_bridgeObjectRetain();
        v597 = sub_1C12882D0(v210, v211, v599);
        sub_1C12B55DC();
        swift_bridgeObjectRelease();
        sub_1C127F44C(v140, type metadata accessor for Record);
        _os_log_impl(&dword_1C127A000, v176, v177, "(%{private}s) Could not find data source for incoming modified record %{public}s for zone %{public}s", (uint8_t *)v178, 0x20u);
        v212 = v571;
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v212, -1, -1);
        v213 = v178;
LABEL_59:
        MEMORY[0x1C3BA9870](v213, -1, -1);

        v7 = v578;
        v90 = v589;
        goto LABEL_60;
      }
      goto LABEL_40;
    }
    v155 = v557;
    sub_1C12B383C(v588, v557);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v571)(v155, 1, v125) == 1)
      goto LABEL_212;
    v156 = v570;
    v157 = v573;
    v134(v570, v155 + *(int *)(v125 + 20), v573);
    sub_1C127F44C(v155, type metadata accessor for RecordMetadata);
    v158 = sub_1C12B52D0();
    v569(v156, v157);
    if ((v158 & 1) == 0)
    {
      v186 = v559;
      v187 = v551;
      v188 = (uint64_t)v553;
      if (qword_1ED78E810 != -1)
        swift_once();
      v189 = v595;
      v190 = __swift_project_value_buffer(v595, (uint64_t)qword_1ED78DC40);
      (*(void (**)(char *, uint64_t, uint64_t))(v186 + 16))(v187, v190, v189);
      sub_1C127F408((uint64_t)v90, v188, type metadata accessor for Record);
      v191 = v555;
      sub_1C12B383C(v588, v555);
      swift_retain_n();
      v192 = v186;
      v193 = sub_1C12B5384();
      v194 = v7;
      v195 = sub_1C12B5534();
      if (os_log_type_enabled(v193, v195))
      {
        v196 = swift_slowAlloc();
        v197 = swift_slowAlloc();
        v599[0] = v197;
        *(_DWORD *)v196 = v561;
        v198 = *(_QWORD *)(v194 + 208);
        v544 = v197;
        if (v198)
        {
          v199 = *(_QWORD *)(v194 + 200);
          v200 = v198;
        }
        else
        {
          v223 = IDSCopyLocalDeviceUniqueID();
          if (v223)
          {
            v224 = (void *)v223;
            v199 = sub_1C12B5480();
            v200 = v225;

          }
          else
          {
            v200 = v539 | 0x8000000000000000;
            v199 = 0xD000000000000017;
          }
        }
        swift_bridgeObjectRetain();
        v597 = sub_1C12882D0(v199, v200, v599);
        sub_1C12B55DC();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v196 + 12) = 2082;
        v302 = (uint64_t)v553;
        v303 = RecordMetadata.description.getter();
        v597 = sub_1C12882D0(v303, v304, v599);
        sub_1C12B55DC();
        swift_bridgeObjectRelease();
        sub_1C127F44C(v302, type metadata accessor for Record);
        *(_WORD *)(v196 + 22) = 2082;
        v305 = v555;
        v306 = v538;
        sub_1C12B383C(v555, v538);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v571)(v306, 1, v592) == 1)
          goto LABEL_214;
        v307 = v536;
        sub_1C12B3774(v306, v536, type metadata accessor for RecordMetadata);
        v308 = RecordMetadata.description.getter();
        v310 = v309;
        sub_1C127F44C(v307, type metadata accessor for RecordMetadata);
        v597 = sub_1C12882D0(v308, v310, v599);
        sub_1C12B55DC();
        swift_bridgeObjectRelease();
        sub_1C128E2B0(v305, &qword_1ED78E3F0);
        _os_log_impl(&dword_1C127A000, v193, v195, "(%{private}s) Incoming modified record %{public}s has an identical lastModified date to the existing record %{public}s", (uint8_t *)v196, 0x20u);
        v311 = v544;
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v311, -1, -1);
        MEMORY[0x1C3BA9870](v196, -1, -1);

        (*(void (**)(char *, uint64_t))(v559 + 8))(v551, v595);
        v7 = v578;
        v108 = v596;
        v60 = v587;
        v90 = v589;
      }
      else
      {
        swift_release_n();
        sub_1C127F44C(v188, type metadata accessor for Record);
        sub_1C128E2B0(v191, &qword_1ED78E3F0);

        (*(void (**)(char *, uint64_t))(v192 + 8))(v187, v189);
        v7 = v194;
        v108 = v596;
        v60 = v587;
        v90 = v589;
      }
      goto LABEL_75;
    }
    v159 = v559;
    v160 = v550;
    v161 = v554;
    v162 = (uint64_t)v552;
    if (qword_1ED78E810 != -1)
      swift_once();
    v163 = v595;
    v164 = __swift_project_value_buffer(v595, (uint64_t)qword_1ED78DC40);
    v165 = *(void (**)(char *))(v159 + 16);
    v544 = v164;
    v165(v160);
    sub_1C127F408((uint64_t)v90, v162, type metadata accessor for Record);
    sub_1C12B383C(v588, v161);
    swift_retain_n();
    v166 = v159;
    v167 = sub_1C12B5384();
    v168 = v7;
    v169 = sub_1C12B5534();
    if (os_log_type_enabled(v167, v169))
    {
      v170 = swift_slowAlloc();
      v171 = swift_slowAlloc();
      v599[0] = v171;
      *(_DWORD *)v170 = v561;
      v172 = *(_QWORD *)(v168 + 208);
      v523 = v171;
      if (v172)
      {
        v173 = *(_QWORD *)(v168 + 200);
        v174 = v172;
      }
      else
      {
        v220 = IDSCopyLocalDeviceUniqueID();
        if (v220)
        {
          v221 = (void *)v220;
          v173 = sub_1C12B5480();
          v174 = v222;

        }
        else
        {
          v174 = v539 | 0x8000000000000000;
          v173 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      v597 = sub_1C12882D0(v173, v174, v599);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v170 + 12) = 2082;
      v257 = (uint64_t)v552;
      v258 = RecordMetadata.description.getter();
      v597 = sub_1C12882D0(v258, v259, v599);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      sub_1C127F44C(v257, type metadata accessor for Record);
      *(_WORD *)(v170 + 22) = 2082;
      v260 = v554;
      v261 = v537;
      sub_1C12B383C(v554, v537);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v571)(v261, 1, v592) == 1)
        goto LABEL_213;
      v262 = v535;
      sub_1C12B3774(v261, v535, type metadata accessor for RecordMetadata);
      v263 = RecordMetadata.description.getter();
      v265 = v264;
      sub_1C127F44C(v262, type metadata accessor for RecordMetadata);
      v597 = sub_1C12882D0(v263, v265, v599);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      sub_1C128E2B0(v260, &qword_1ED78E3F0);
      _os_log_impl(&dword_1C127A000, v167, v169, "(%{private}s) Incoming modified record %{public}s has an older lastModified date than the existing record %{public}s", (uint8_t *)v170, 0x20u);
      v266 = v523;
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v266, -1, -1);
      MEMORY[0x1C3BA9870](v170, -1, -1);

      (*(void (**)(char *, uint64_t))(v559 + 8))(v550, v595);
      v7 = v578;
    }
    else
    {
      swift_release_n();
      sub_1C127F44C(v162, type metadata accessor for Record);
      sub_1C128E2B0(v161, &qword_1ED78E3F0);

      (*(void (**)(char *, uint64_t))(v166 + 8))(v160, v163);
      v7 = v168;
    }
    v267 = *(_QWORD *)v568;
    v268 = v592;
    v90 = v589;
    if (*(_QWORD *)(*(_QWORD *)v568 + 16))
    {
      v270 = v589[2];
      v269 = v589[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v271 = sub_1C128939C(v270, v269);
      if ((v272 & 1) != 0)
      {
        v523 = *(_QWORD *)(*(_QWORD *)(v267 + 56) + 8 * v271);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v273 = v534;
        sub_1C12B383C(v588, v534);
        v274 = v571;
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v571)(v273, 1, v268) == 1)
          goto LABEL_215;
        v275 = *(unsigned __int8 *)(v273 + *(int *)(v268 + 24));
        sub_1C127F44C(v273, type metadata accessor for RecordMetadata);
        if (v275 == 1)
        {
          v276 = v533;
          sub_1C127F408((uint64_t)v90, v533, type metadata accessor for Record);
          swift_retain_n();
          v277 = sub_1C12B5384();
          v278 = sub_1C12B5540();
          if (os_log_type_enabled(v277, v278))
          {
            v279 = swift_slowAlloc();
            v280 = swift_slowAlloc();
            v599[0] = v280;
            *(_DWORD *)v279 = v560;
            if (*(_QWORD *)(v7 + 208))
            {
              v281 = *(_QWORD *)(v7 + 200);
              v282 = *(_QWORD *)(v7 + 208);
              v283 = v7;
            }
            else
            {
              v338 = IDSCopyLocalDeviceUniqueID();
              if (v338)
              {
                v339 = (void *)v338;
                v281 = sub_1C12B5480();
                v282 = v340;

              }
              else
              {
                v282 = v539 | 0x8000000000000000;
                v281 = 0xD000000000000017;
              }
              v283 = v578;
            }
            swift_bridgeObjectRetain();
            v597 = sub_1C12882D0(v281, v282, v599);
            sub_1C12B55DC();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v279 + 12) = 2082;
            v365 = v533;
            v366 = RecordMetadata.description.getter();
            v597 = sub_1C12882D0(v366, v367, v599);
            sub_1C12B55DC();
            swift_bridgeObjectRelease();
            sub_1C127F44C(v365, type metadata accessor for Record);
            _os_log_impl(&dword_1C127A000, v277, v278, "(%{private}s) Resyncing local deletion for modified record %{public}s", (uint8_t *)v279, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1C3BA9870](v280, -1, -1);
            MEMORY[0x1C3BA9870](v279, -1, -1);

            v7 = v283;
            v90 = v589;
          }
          else
          {
            swift_release_n();
            sub_1C127F44C(v276, type metadata accessor for Record);

          }
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D40F0);
          v368 = swift_allocObject();
          *(_OWORD *)(v368 + 16) = v545;
          v369 = v529;
          sub_1C12B383C(v588, (uint64_t)v529);
          if (((unsigned int (*)(uint64_t *, uint64_t, uint64_t))v571)(v369, 1, v592) == 1)
            goto LABEL_217;
          v371 = *v369;
          v370 = v369[1];
          v373 = v369[2];
          v372 = v369[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C127F44C((uint64_t)v369, type metadata accessor for RecordMetadata);
          *(_QWORD *)(v368 + 32) = v371;
          *(_QWORD *)(v368 + 40) = v370;
          *(_QWORD *)(v368 + 48) = v373;
          *(_QWORD *)(v368 + 56) = v372;
          sub_1C1299874(MEMORY[0x1E0DEE9D8], v368);
          goto LABEL_73;
        }
        v521 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D40F0);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v545;
        v291 = v530;
        sub_1C12B383C(v588, (uint64_t)v530);
        if (((unsigned int (*)(uint64_t *, uint64_t, uint64_t))v274)(v291, 1, v268) == 1)
          goto LABEL_216;
        v293 = *v291;
        v292 = v291[1];
        v295 = v291[2];
        v294 = v291[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C127F44C((uint64_t)v291, type metadata accessor for RecordMetadata);
        *(_QWORD *)(inited + 32) = v293;
        *(_QWORD *)(inited + 40) = v292;
        *(_QWORD *)(inited + 48) = v295;
        *(_QWORD *)(inited + 56) = v294;
        v296 = sub_1C12A49F8(inited);
        swift_setDeallocating();
        swift_arrayDestroy();
        if (*(_QWORD *)(v296 + 16))
        {
          v297 = v528;
          sub_1C127F408(v296 + v522, v528, type metadata accessor for Record);
          v298 = 0;
        }
        else
        {
          v298 = 1;
          v297 = v528;
        }
        v312 = v531;
        v313 = v532;
        v314 = v540;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v540 + 56))(v297, v298, 1, v531);
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v314 + 48))(v297, 1, v312) == 1)
        {
          sub_1C128E2B0(v297, &qword_1EF6D44E8);
          v315 = v527;
          sub_1C127F408((uint64_t)v90, v527, type metadata accessor for Record);
          swift_retain_n();
          v316 = sub_1C12B5384();
          v317 = sub_1C12B5540();
          if (os_log_type_enabled(v316, v317))
          {
            v318 = swift_slowAlloc();
            v319 = swift_slowAlloc();
            v599[0] = v319;
            *(_DWORD *)v318 = v560;
            if (*(_QWORD *)(v7 + 208))
            {
              v320 = *(_QWORD *)(v7 + 200);
              v321 = *(_QWORD *)(v7 + 208);
              v322 = v7;
            }
            else
            {
              v362 = IDSCopyLocalDeviceUniqueID();
              if (v362)
              {
                v363 = (void *)v362;
                v320 = sub_1C12B5480();
                v321 = v364;

              }
              else
              {
                v321 = v539 | 0x8000000000000000;
                v320 = 0xD000000000000017;
              }
              v322 = v578;
            }
            swift_bridgeObjectRetain();
            v597 = sub_1C12882D0(v320, v321, v599);
            sub_1C12B55DC();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v318 + 12) = 2082;
            v380 = RecordMetadata.description.getter();
            v597 = sub_1C12882D0(v380, v381, v599);
            sub_1C12B55DC();
            swift_bridgeObjectRelease();
            sub_1C127F44C(v315, type metadata accessor for Record);
            _os_log_impl(&dword_1C127A000, v316, v317, "(%{private}s) Resolved conflict to remote record because local record is missing; updating local record %{public}s",
              (uint8_t *)v318,
              0x16u);
            swift_arrayDestroy();
            MEMORY[0x1C3BA9870](v319, -1, -1);
            MEMORY[0x1C3BA9870](v318, -1, -1);

            v7 = v322;
            v90 = v589;
          }
          else
          {
            swift_release_n();
            sub_1C127F44C(v315, type metadata accessor for Record);

          }
          v601 = type metadata accessor for SyncEngine();
          v602 = &protocol witness table for SyncEngine;
          v599[0] = v7;
          v382 = v523;
          if (MEMORY[0x1C3BA98D0](v523 + 16))
          {
            v383 = *(_QWORD *)(v382 + 24);
            v384 = swift_getObjectType();
            v385 = *(uint64_t (**)(uint64_t *, _QWORD *, uint64_t, uint64_t))(v383 + 16);
            swift_retain_n();
            LOBYTE(v383) = v385(v599, v90, v384, v383);
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v599);
            swift_release();
            if ((v383 & 1) != 0)
            {
              v386 = *(_QWORD *)(v7 + 64);
              v387 = *(_QWORD *)(v7 + 72);
              v388 = v577;
              __swift_project_boxed_opaque_existential_1(v577, v386);
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D44F0);
              v389 = (v582[80] + 32) & ~(unint64_t)v582[80];
              v390 = swift_allocObject();
              *(_OWORD *)(v390 + 16) = v545;
              sub_1C127F408((uint64_t)v90, v390 + v389, type metadata accessor for RecordMetadata);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v387 + 88))(v390, v386, v387);
              swift_bridgeObjectRelease();
              v391 = *(_QWORD *)(v7 + 64);
              v392 = *(_QWORD *)(v7 + 72);
              __swift_project_boxed_opaque_existential_1(v388, v391);
              v393 = swift_allocObject();
              *(_OWORD *)(v393 + 16) = v545;
              v394 = v90[1];
              v395 = v90[2];
              v396 = v90[3];
              *(_QWORD *)(v393 + 32) = *v90;
              *(_QWORD *)(v393 + 40) = v394;
              *(_QWORD *)(v393 + 48) = v395;
              *(_QWORD *)(v393 + 56) = v396;
              v397 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v392 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v397(v586, v393, v584, v585, v391, v392);
              goto LABEL_73;
            }
          }
          else
          {
            swift_retain_n();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v599);
            swift_release();
          }
          goto LABEL_72;
        }
        sub_1C12B3774(v297, v313, type metadata accessor for Record);
        v601 = type metadata accessor for SyncEngine();
        v602 = &protocol witness table for SyncEngine;
        v518 = v601;
        v599[0] = v7;
        v323 = v523;
        v324 = v523 + 16;
        if (MEMORY[0x1C3BA98D0](v523 + 16))
        {
          v325 = *(_QWORD *)(v323 + 24);
          v326 = swift_getObjectType();
          v327 = *(uint64_t (**)(uint64_t *, _QWORD *, uint64_t, uint64_t, uint64_t))(v325 + 40);
          swift_retain_n();
          v328 = v327(v599, v90, v313, v326, v325);
          v312 = v531;
          v329 = v328;
          v331 = v330;
          swift_unknownObjectRelease();
        }
        else
        {
          v341 = (_QWORD *)((char *)v90 + *(int *)(v312 + 20));
          v329 = *v341;
          v331 = v341[1];
          swift_retain_n();
          sub_1C127CE48(v329, v331);
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v599);
        swift_release();
        v342 = (_QWORD *)((char *)v90 + *(int *)(v312 + 20));
        v343 = *v342;
        v344 = v342[1];
        sub_1C127CE48(*v342, v344);
        sub_1C12B1B98(v329, v331);
        v346 = v345;
        sub_1C127CE8C(v343, v344);
        v520 = v329;
        v519 = v331;
        if ((v346 & 1) == 0)
        {
          v354 = v526;
          sub_1C127F408((uint64_t)v90, v526, type metadata accessor for Record);
          swift_retain_n();
          v355 = sub_1C12B5384();
          v356 = sub_1C12B5540();
          if (os_log_type_enabled(v355, v356))
          {
            v357 = swift_slowAlloc();
            v358 = swift_slowAlloc();
            v599[0] = v358;
            *(_DWORD *)v357 = v560;
            if (*(_QWORD *)(v7 + 208))
            {
              v359 = *(_QWORD *)(v7 + 200);
              v360 = *(_QWORD *)(v7 + 208);
              v361 = v7;
            }
            else
            {
              v377 = IDSCopyLocalDeviceUniqueID();
              if (v377)
              {
                v378 = (void *)v377;
                v359 = sub_1C12B5480();
                v360 = v379;

              }
              else
              {
                v360 = v539 | 0x8000000000000000;
                v359 = 0xD000000000000017;
              }
              v361 = v578;
            }
            swift_bridgeObjectRetain();
            v597 = sub_1C12882D0(v359, v360, v599);
            sub_1C12B55DC();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v357 + 12) = 2082;
            v422 = v526;
            v423 = RecordMetadata.description.getter();
            v597 = sub_1C12882D0(v423, v424, v599);
            sub_1C12B55DC();
            swift_bridgeObjectRelease();
            sub_1C127F44C(v422, type metadata accessor for Record);
            _os_log_impl(&dword_1C127A000, v355, v356, "(%{private}s) Resolved conflict to local record; resyncing modified record %{public}s",
              (uint8_t *)v357,
              0x16u);
            swift_arrayDestroy();
            MEMORY[0x1C3BA9870](v358, -1, -1);
            MEMORY[0x1C3BA9870](v357, -1, -1);

            v7 = v361;
            v90 = v589;
          }
          else
          {
            swift_release_n();
            sub_1C127F44C(v354, type metadata accessor for Record);

          }
          v425 = swift_allocObject();
          *(_OWORD *)(v425 + 16) = v545;
          v426 = v525;
          sub_1C12B383C(v588, (uint64_t)v525);
          if (((unsigned int (*)(uint64_t *, uint64_t, uint64_t))v571)(v426, 1, v592) == 1)
            goto LABEL_218;
          v428 = *v426;
          v427 = v426[1];
          v430 = v426[2];
          v429 = v426[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C127F44C((uint64_t)v426, type metadata accessor for RecordMetadata);
          *(_QWORD *)(v425 + 32) = v428;
          *(_QWORD *)(v425 + 40) = v427;
          *(_QWORD *)(v425 + 48) = v430;
          *(_QWORD *)(v425 + 56) = v429;
          sub_1C1299874(v425, MEMORY[0x1E0DEE9D8]);
          swift_bridgeObjectRelease();
          swift_release();
          sub_1C127CE8C(v520, v519);
          goto LABEL_159;
        }
        v347 = v524;
        sub_1C127F408((uint64_t)v90, v524, type metadata accessor for Record);
        swift_retain_n();
        v348 = sub_1C12B5384();
        v349 = sub_1C12B5540();
        if (os_log_type_enabled(v348, v349))
        {
          v350 = swift_slowAlloc();
          v571 = swift_slowAlloc();
          v599[0] = (uint64_t)v571;
          *(_DWORD *)v350 = v560;
          if (*(_QWORD *)(v7 + 208))
          {
            v351 = *(_QWORD *)(v7 + 200);
            v352 = *(_QWORD *)(v7 + 208);
            v353 = v7;
          }
          else
          {
            v374 = IDSCopyLocalDeviceUniqueID();
            if (v374)
            {
              v375 = (void *)v374;
              v351 = sub_1C12B5480();
              v352 = v376;

            }
            else
            {
              v352 = v539 | 0x8000000000000000;
              v351 = 0xD000000000000017;
            }
            v353 = v578;
          }
          swift_bridgeObjectRetain();
          v597 = sub_1C12882D0(v351, v352, v599);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v350 + 12) = 2082;
          v398 = RecordMetadata.description.getter();
          v597 = sub_1C12882D0(v398, v399, v599);
          sub_1C12B55DC();
          swift_bridgeObjectRelease();
          sub_1C127F44C(v347, type metadata accessor for Record);
          _os_log_impl(&dword_1C127A000, v348, v349, "(%{private}s) Resolved conflict to remote record; updating local record %{public}s",
            (uint8_t *)v350,
            0x16u);
          v400 = v571;
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v400, -1, -1);
          MEMORY[0x1C3BA9870](v350, -1, -1);

          v7 = v353;
          v90 = v589;
        }
        else
        {
          swift_release_n();
          sub_1C127F44C(v347, type metadata accessor for Record);

        }
        v601 = v518;
        v602 = &protocol witness table for SyncEngine;
        v599[0] = v7;
        if (MEMORY[0x1C3BA98D0](v324))
        {
          v401 = *(_QWORD *)(v523 + 24);
          v402 = swift_getObjectType();
          v403 = *(uint64_t (**)(uint64_t *, _QWORD *, uint64_t, uint64_t))(v401 + 16);
          swift_retain_n();
          LOBYTE(v401) = v403(v599, v90, v402, v401);
          swift_unknownObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v599);
          swift_release();
          if ((v401 & 1) != 0)
          {
            v404 = *(_QWORD *)(v7 + 64);
            v405 = *(_QWORD *)(v7 + 72);
            v406 = v577;
            __swift_project_boxed_opaque_existential_1(v577, v404);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D44F0);
            v407 = (v582[80] + 32) & ~(unint64_t)v582[80];
            v408 = swift_allocObject();
            *(_OWORD *)(v408 + 16) = v545;
            sub_1C127F408((uint64_t)v90, v408 + v407, type metadata accessor for RecordMetadata);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v405 + 88))(v408, v404, v405);
            swift_bridgeObjectRelease();
            v409 = *(_QWORD *)(v7 + 64);
            v410 = *(_QWORD *)(v7 + 72);
            __swift_project_boxed_opaque_existential_1(v406, v409);
            v411 = swift_allocObject();
            *(_OWORD *)(v411 + 16) = v545;
            v412 = v90[1];
            v413 = v90[2];
            v414 = v90[3];
            *(_QWORD *)(v411 + 32) = *v90;
            *(_QWORD *)(v411 + 40) = v412;
            *(_QWORD *)(v411 + 48) = v413;
            *(_QWORD *)(v411 + 56) = v414;
            v415 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v410 + 56);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v415(v586, v411, v584, v585, v409, v410);
            swift_release();
            sub_1C127CE8C(v520, v519);
LABEL_153:
            swift_bridgeObjectRelease();
LABEL_159:
            sub_1C127F44C(v532, type metadata accessor for Record);
            goto LABEL_74;
          }
        }
        else
        {
          swift_retain_n();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v599);
          swift_release();
        }
        v416 = *(_QWORD *)(v7 + 64);
        v417 = *(_QWORD *)(v7 + 72);
        __swift_project_boxed_opaque_existential_1(v577, v416);
        v418 = v90[1];
        v419 = v90[2];
        v420 = v90[3];
        v599[0] = *v90;
        v599[1] = v418;
        v600 = v419;
        v601 = v420;
        v421 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v417 + 128);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v421(v599, v416, v417);
        swift_release();
        sub_1C127CE8C(v520, v519);
        swift_bridgeObjectRelease();
        goto LABEL_153;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v175 = v546;
    sub_1C127F408((uint64_t)v90, v546, type metadata accessor for Record);
    v140 = v541;
    sub_1C127F408((uint64_t)v90, v541, type metadata accessor for Record);
    swift_retain_n();
    v176 = sub_1C12B5384();
    v284 = sub_1C12B5534();
    if (os_log_type_enabled(v176, v284))
    {
      v285 = swift_slowAlloc();
      v286 = swift_slowAlloc();
      v599[0] = (uint64_t)v286;
      *(_DWORD *)v285 = v561;
      v287 = *(_QWORD *)(v7 + 208);
      v571 = v286;
      if (v287)
      {
        v288 = *(_QWORD *)(v7 + 200);
        v289 = v287;
      }
      else
      {
        v299 = IDSCopyLocalDeviceUniqueID();
        if (v299)
        {
          v300 = (void *)v299;
          v288 = sub_1C12B5480();
          v289 = v301;

        }
        else
        {
          v289 = v539 | 0x8000000000000000;
          v288 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      v597 = sub_1C12882D0(v288, v289, v599);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v285 + 12) = 2082;
      v332 = v546;
      v333 = RecordMetadata.description.getter();
      v597 = sub_1C12882D0(v333, v334, v599);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      sub_1C127F44C(v332, type metadata accessor for Record);
      *(_WORD *)(v285 + 22) = 2082;
      v335 = *(_QWORD *)(v140 + 16);
      v336 = *(_QWORD *)(v140 + 24);
      swift_bridgeObjectRetain();
      v597 = sub_1C12882D0(v335, v336, v599);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      sub_1C127F44C(v140, type metadata accessor for Record);
      _os_log_impl(&dword_1C127A000, v176, v284, "(%{private}s) Could not find data source for incoming modified record %{public}s for zone %{public}s", (uint8_t *)v285, 0x20u);
      v337 = v571;
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v337, -1, -1);
      v213 = v285;
      goto LABEL_59;
    }
LABEL_40:
    swift_release_n();
    sub_1C127F44C(v175, type metadata accessor for Record);
    sub_1C127F44C(v140, type metadata accessor for Record);

LABEL_60:
    v214 = *(_QWORD *)(v7 + 64);
    v215 = *(_QWORD *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1(v577, v214);
    v216 = v90[1];
    v217 = v90[2];
    v218 = v90[3];
    v599[0] = *v90;
    v599[1] = v216;
    v600 = v217;
    v601 = v218;
    v219 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v215 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v219(v599, v214, v215);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_74:
    v108 = v596;
    v60 = v587;
LABEL_75:
    sub_1C127F408((uint64_t)v90, v580, type metadata accessor for RecordMetadata);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v105 = v591;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v108 = sub_1C129169C(0, *(_QWORD *)(v108 + 16) + 1, 1, v108);
    v256 = *(_QWORD *)(v108 + 16);
    v255 = *(_QWORD *)(v108 + 24);
    if (v256 >= v255 >> 1)
      v108 = sub_1C129169C(v255 > 1, v256 + 1, 1, v108);
    *(_QWORD *)(v108 + 16) = v256 + 1;
    sub_1C12B3774(v580, v108+ ((v582[80] + 32) & ~(unint64_t)v582[80])+ *((_QWORD *)v582 + 9) * v256, type metadata accessor for RecordMetadata);
    sub_1C127F44C((uint64_t)v90, type metadata accessor for Record);
    sub_1C128E2B0(v588, &qword_1ED78E3F0);
    goto LABEL_9;
  }
  v108 = MEMORY[0x1E0DEE9D8];
LABEL_162:
  v431 = *(_QWORD *)(v547 + 16);
  v432 = (uint64_t)v575;
  if (!v431)
    goto LABEL_199;
  v589 = (_QWORD *)(v7 + 40);
  v433 = v582;
  v434 = v582[80];
  v435 = (v434 + 32) & ~v434;
  v436 = v547 + v435;
  swift_bridgeObjectRetain();
  swift_beginAccess();
  v437 = v436;
  v587 = (char *)*((_QWORD *)v433 + 9);
  v582 = &v587[v435];
  v580 = v434 | 7;
  v566 = &v599[1];
  v577 = v598;
  *((_QWORD *)&v438 + 1) = 2;
  v593 = xmmword_1C12B7860;
  *(_QWORD *)&v438 = 136381187;
  v579 = v438;
  v564 = (unint64_t)"Validating sync engine";
  v576 = MEMORY[0x1E0DEE9B8] + 8;
  v588 = v435;
  do
  {
    v591 = v431;
    v596 = v108;
    v592 = v437;
    sub_1C127F408(v437, v432, type metadata accessor for RecordMetadata);
    v439 = *(_QWORD *)(v7 + 64);
    v440 = *(_QWORD *)(v7 + 72);
    v441 = v589;
    __swift_project_boxed_opaque_existential_1(v589, v439);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D44F0);
    v442 = swift_allocObject();
    v443 = v435;
    v444 = (_QWORD *)v432;
    v445 = v442;
    *(_OWORD *)(v442 + 16) = v593;
    sub_1C127F408((uint64_t)v444, v442 + v443, type metadata accessor for RecordMetadata);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v440 + 88))(v445, v439, v440);
    swift_bridgeObjectRelease();
    v446 = *(_QWORD *)(v7 + 64);
    v447 = *(_QWORD *)(v7 + 72);
    __swift_project_boxed_opaque_existential_1(v441, v446);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D40F0);
    v448 = swift_allocObject();
    *(_OWORD *)(v448 + 16) = v593;
    v449 = v444[1];
    v450 = v444[2];
    v451 = v444[3];
    v452 = (uint64_t)v444;
    *(_QWORD *)(v448 + 32) = *v444;
    *(_QWORD *)(v448 + 40) = v449;
    *(_QWORD *)(v448 + 48) = v450;
    *(_QWORD *)(v448 + 56) = v451;
    v453 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v447 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v453(v586, v448, v584, v585, v446, v447);
    swift_bridgeObjectRelease();
    v454 = *(_QWORD *)(v7 + 144);
    v455 = (uint64_t)v590;
    if (*(_QWORD *)(v454 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v456 = sub_1C128939C(v450, v451);
      if ((v457 & 1) != 0)
      {
        v458 = *(_QWORD *)(*(_QWORD *)(v454 + 56) + 8 * v456);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_1ED78E810 != -1)
          swift_once();
        __swift_project_value_buffer(v595, (uint64_t)qword_1ED78DC40);
        v459 = (uint64_t *)v452;
        v460 = v565;
        sub_1C127F408(v452, v565, type metadata accessor for RecordMetadata);
        v461 = v572;
        sub_1C127F408(v452, v572, type metadata accessor for RecordMetadata);
        swift_retain_n();
        v462 = sub_1C12B5384();
        v463 = sub_1C12B5540();
        if (os_log_type_enabled(v462, (os_log_type_t)v463))
        {
          v464 = v7;
          v465 = swift_slowAlloc();
          v466 = swift_slowAlloc();
          v597 = v466;
          *(_DWORD *)v465 = v579;
          v467 = *(_QWORD *)(v464 + 208);
          v574 = v458;
          v571 = v462;
          LODWORD(v570) = v463;
          v568 = v466;
          if (v467)
          {
            v468 = *(_QWORD *)(v464 + 200);
            v469 = v467;
          }
          else
          {
            v481 = IDSCopyLocalDeviceUniqueID();
            if (v481)
            {
              v482 = (void *)v481;
              v468 = sub_1C12B5480();
              v469 = v483;

            }
            else
            {
              v469 = v564 | 0x8000000000000000;
              v468 = 0xD000000000000017;
            }
            v464 = v578;
          }
          swift_bridgeObjectRetain();
          v599[0] = sub_1C12882D0(v468, v469, &v597);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v465 + 12) = 2082;
          v567 = v465 + 14;
          v599[0] = 0;
          v599[1] = 0xE000000000000000;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C12B5660();
          swift_bridgeObjectRelease();
          strcpy((char *)v599, "identifier: ");
          BYTE5(v599[1]) = 0;
          HIWORD(v599[1]) = -5120;
          swift_bridgeObjectRetain();
          sub_1C12B54BC();
          swift_bridgeObjectRelease();
          sub_1C12B54BC();
          swift_bridgeObjectRetain();
          sub_1C12B54BC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v599[0] = sub_1C12882D0(v599[0], v599[1], &v597);
          sub_1C12B55DC();
          swift_bridgeObjectRelease();
          sub_1C127F44C(v460, type metadata accessor for RecordMetadata);
          *(_WORD *)(v465 + 22) = 2082;
          v491 = v572;
          v492 = *(_QWORD *)(v572 + 16);
          v493 = *(_QWORD *)(v572 + 24);
          swift_bridgeObjectRetain();
          v599[0] = sub_1C12882D0(v492, v493, &v597);
          sub_1C12B55DC();
          swift_bridgeObjectRelease();
          sub_1C127F44C(v491, type metadata accessor for RecordMetadata);
          v494 = v571;
          _os_log_impl(&dword_1C127A000, v571, (os_log_type_t)v570, "(%{private}s) Sending deleted recordID %{public}s to data source for zone %{public}s", (uint8_t *)v465, 0x20u);
          v495 = v568;
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v495, -1, -1);
          MEMORY[0x1C3BA9870](v465, -1, -1);

          v459 = v575;
          v458 = v574;
        }
        else
        {
          swift_release_n();
          sub_1C127F44C(v460, type metadata accessor for RecordMetadata);
          sub_1C127F44C(v461, type metadata accessor for RecordMetadata);

          v464 = v7;
        }
        v497 = *v459;
        v496 = v459[1];
        v498 = v459;
        v500 = v459[2];
        v499 = v459[3];
        v601 = type metadata accessor for SyncEngine();
        v602 = &protocol witness table for SyncEngine;
        v599[0] = v464;
        if (MEMORY[0x1C3BA98D0](v458 + 16))
        {
          v501 = *(_QWORD *)(v458 + 24);
          v502 = swift_getObjectType();
          v597 = v497;
          v598[0] = v496;
          v598[1] = v500;
          v598[2] = v499;
          v503 = *(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(v501 + 24);
          swift_retain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v503(v599, &v597, v502, v501);
          swift_unknownObjectRelease();
        }
        else
        {
          swift_retain_n();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        v7 = v464;
        v490 = v591;
        v435 = v588;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v599);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        v108 = v596;
        v432 = (uint64_t)v498;
        v477 = (uint64_t)v594;
        goto LABEL_193;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (qword_1ED78E810 != -1)
      swift_once();
    __swift_project_value_buffer(v595, (uint64_t)qword_1ED78DC40);
    v470 = v581;
    sub_1C127F408(v452, v581, type metadata accessor for RecordMetadata);
    sub_1C127F408(v452, v455, type metadata accessor for RecordMetadata);
    swift_retain_n();
    v471 = sub_1C12B5384();
    v472 = sub_1C12B5534();
    if (os_log_type_enabled(v471, v472))
    {
      v473 = swift_slowAlloc();
      v474 = swift_slowAlloc();
      v599[0] = v474;
      *(_DWORD *)v473 = v579;
      if (*(_QWORD *)(v7 + 208))
      {
        v475 = *(_QWORD *)(v7 + 200);
        v476 = *(_QWORD *)(v7 + 208);
      }
      else
      {
        v478 = IDSCopyLocalDeviceUniqueID();
        if (v478)
        {
          v479 = (void *)v478;
          v475 = sub_1C12B5480();
          v476 = v480;

        }
        else
        {
          v476 = v564 | 0x8000000000000000;
          v475 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      v597 = sub_1C12882D0(v475, v476, v599);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v473 + 12) = 2082;
      v484 = v581;
      v485 = RecordMetadata.description.getter();
      v597 = sub_1C12882D0(v485, v486, v599);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      sub_1C127F44C(v484, type metadata accessor for RecordMetadata);
      *(_WORD *)(v473 + 22) = 2082;
      v487 = (uint64_t)v590;
      v488 = *((_QWORD *)v590 + 2);
      v489 = *((_QWORD *)v590 + 3);
      swift_bridgeObjectRetain();
      v597 = sub_1C12882D0(v488, v489, v599);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      sub_1C127F44C(v487, type metadata accessor for RecordMetadata);
      _os_log_impl(&dword_1C127A000, v471, v472, "(%{private}s) Could not find data source for incoming deleted metadata %{public}s for zone %{public}s", (uint8_t *)v473, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v474, -1, -1);
      MEMORY[0x1C3BA9870](v473, -1, -1);

      v7 = v578;
      v477 = (uint64_t)v594;
      v432 = (uint64_t)v575;
      v108 = v596;
    }
    else
    {
      swift_release_n();
      sub_1C127F44C(v470, type metadata accessor for RecordMetadata);
      sub_1C127F44C(v455, type metadata accessor for RecordMetadata);

      v108 = v596;
      v432 = v452;
      v477 = (uint64_t)v594;
    }
    v490 = v591;
    v435 = v588;
LABEL_193:
    sub_1C127F408(v432, v477, type metadata accessor for RecordMetadata);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v108 = sub_1C129169C(0, *(_QWORD *)(v108 + 16) + 1, 1, v108);
    v505 = *(_QWORD *)(v108 + 16);
    v504 = *(_QWORD *)(v108 + 24);
    if (v505 >= v504 >> 1)
      v108 = sub_1C129169C(v504 > 1, v505 + 1, 1, v108);
    *(_QWORD *)(v108 + 16) = v505 + 1;
    v506 = v587;
    sub_1C12B3774(v477, v108 + v435 + v505 * (_QWORD)v587, type metadata accessor for RecordMetadata);
    sub_1C127F44C(v432, type metadata accessor for RecordMetadata);
    v437 = (uint64_t)&v506[v592];
    v431 = v490 - 1;
  }
  while (v431);
  swift_bridgeObjectRelease();
LABEL_199:
  LOBYTE(v599[0]) = v542;
  LOBYTE(v597) = v543;
  sub_1C12A5280((unsigned __int8 *)v599, v108, v584, v585, (char *)&v597);
  swift_bridgeObjectRelease();
  v507 = v573;
  v508 = v569;
  v569(v583, v573);
  v508(v586, v507);
}

uint64_t sub_1C12A49F8(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t result;
  uint64_t v18;
  uint64_t *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  void (*v28)(uint64_t *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ObjectType;
  uint64_t (*v36)(uint64_t *, uint64_t *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  __int128 v66;
  _QWORD *v67;
  uint64_t v68;
  int v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79[4];
  uint64_t v80[3];
  uint64_t v81;
  _UNKNOWN **v82;

  v2 = v1;
  v61 = type metadata accessor for Record(0);
  v60 = *(_QWORD *)(v61 - 8);
  v4 = MEMORY[0x1E0C80A78](v61);
  v63 = (uint64_t)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v62 = (uint64_t)&v58 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v7);
  v74 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RecordMetadata(0);
  v72 = *(_QWORD *)(v9 - 8);
  v73 = v9;
  MEMORY[0x1E0C80A78](v9);
  v75 = (uint64_t)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1C12B542C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (uint64_t *)((char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = (void *)v2[15];
  *v14 = v15;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DEF740], v11);
  v16 = v15;
  LOBYTE(v15) = sub_1C12B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) != 0)
  {
    v18 = *(_QWORD *)(a1 + 16);
    if (v18)
    {
      v71 = v2 + 5;
      swift_bridgeObjectRetain();
      v70 = v2 + 18;
      swift_beginAccess();
      v64 = MEMORY[0x1E0DEE9D8];
      v58 = a1;
      v19 = (uint64_t *)(a1 + 56);
      *(_QWORD *)&v20 = 136380931;
      v66 = v20;
      v59 = (unint64_t)"Validating sync engine";
      v65 = MEMORY[0x1E0DEE9B8] + 8;
      v67 = v2;
      while (1)
      {
        v78 = v18;
        v22 = *(v19 - 3);
        v21 = *(v19 - 2);
        v24 = *(v19 - 1);
        v23 = *v19;
        v25 = v2[8];
        v26 = v2[9];
        v27 = v2;
        __swift_project_boxed_opaque_existential_1(v71, v25);
        v76 = v22;
        v77 = v24;
        v80[0] = v22;
        v80[1] = v21;
        v80[2] = v24;
        v81 = v23;
        v28 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v26 + 72);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v29 = (uint64_t)v74;
        v28(v80, v25, v26);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v29, 1, v73) != 1)
          break;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1C128E2B0(v29, &qword_1ED78E3F0);
        v2 = v27;
LABEL_5:
        v19 += 4;
        v18 = v78 - 1;
        if (v78 == 1)
        {
          swift_bridgeObjectRelease();
          return v64;
        }
      }
      sub_1C12B3774(v29, v75, type metadata accessor for RecordMetadata);
      v30 = *v70;
      if (*(_QWORD *)(*v70 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v31 = sub_1C128939C(v77, v23);
        v2 = v27;
        if ((v32 & 1) != 0)
        {
          v33 = *(_QWORD *)(*(_QWORD *)(v30 + 56) + 8 * v31);
          swift_retain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v81 = type metadata accessor for SyncEngine();
          v82 = &protocol witness table for SyncEngine;
          v80[0] = (uint64_t)v2;
          if (MEMORY[0x1C3BA98D0](v33 + 16))
          {
            v34 = *(_QWORD *)(v33 + 24);
            ObjectType = swift_getObjectType();
            v79[0] = v76;
            v79[1] = v21;
            v79[2] = v77;
            v79[3] = v23;
            v36 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(v34 + 8);
            swift_retain_n();
            swift_retain();
            v37 = v36(v80, v79, ObjectType, v34);
            v2 = v67;
            v38 = v37;
            v40 = v39;
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
            swift_release();
            swift_release();
            if (v40 >> 60 != 15)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v41 = v62;
              sub_1C127F408(v75, v62, type metadata accessor for RecordMetadata);
              v42 = (uint64_t *)(v41 + *(int *)(v61 + 20));
              *v42 = v38;
              v42[1] = v40;
              sub_1C127F408(v41, v63, type metadata accessor for Record);
              sub_1C127CE48(v38, v40);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
                v43 = v64;
              else
                v43 = sub_1C1291688(0, *(_QWORD *)(v64 + 16) + 1, 1, v64);
              v45 = *(_QWORD *)(v43 + 16);
              v44 = *(_QWORD *)(v43 + 24);
              if (v45 >= v44 >> 1)
                v43 = sub_1C1291688(v44 > 1, v45 + 1, 1, v43);
              *(_QWORD *)(v43 + 16) = v45 + 1;
              v46 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
              v64 = v43;
              sub_1C12B3774(v63, v43 + v46 + *(_QWORD *)(v60 + 72) * v45, type metadata accessor for Record);
              sub_1C12B37B8(v38, v40);
              swift_release();
              sub_1C127F44C(v62, type metadata accessor for Record);
LABEL_25:
              sub_1C127F44C(v75, type metadata accessor for RecordMetadata);
              goto LABEL_5;
            }
          }
          else
          {
            swift_retain();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        v2 = v27;
      }
      if (qword_1ED78E810 != -1)
        swift_once();
      v47 = sub_1C12B5390();
      __swift_project_value_buffer(v47, (uint64_t)qword_1ED78DC40);
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v48 = sub_1C12B5384();
      v49 = sub_1C12B5540();
      if (os_log_type_enabled(v48, (os_log_type_t)v49))
      {
        v69 = v49;
        v50 = v2;
        v51 = swift_slowAlloc();
        v68 = swift_slowAlloc();
        v79[0] = v68;
        *(_DWORD *)v51 = v66;
        if (v50[26])
        {
          v52 = v50[25];
          v53 = v50[26];
        }
        else
        {
          v54 = IDSCopyLocalDeviceUniqueID();
          if (v54)
          {
            v55 = (void *)v54;
            v52 = sub_1C12B5480();
            v53 = v56;

          }
          else
          {
            v53 = v59 | 0x8000000000000000;
            v52 = 0xD000000000000017;
          }
          v50 = v67;
        }
        swift_bridgeObjectRetain();
        *(_QWORD *)(v51 + 4) = sub_1C12882D0(v52, v53, v79);
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v51 + 12) = 2082;
        v80[0] = 0;
        v80[1] = 0xE000000000000000;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1C12B5660();
        swift_bridgeObjectRelease();
        strcpy((char *)v80, "identifier: ");
        BYTE5(v80[1]) = 0;
        HIWORD(v80[1]) = -5120;
        swift_bridgeObjectRetain();
        sub_1C12B54BC();
        swift_bridgeObjectRelease();
        sub_1C12B54BC();
        swift_bridgeObjectRetain();
        sub_1C12B54BC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(_QWORD *)(v51 + 14) = sub_1C12882D0(v80[0], v80[1], v79);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C127A000, v48, (os_log_type_t)v69, "(%{private}s) Data source failed to provide data for %{public}s", (uint8_t *)v51, 0x16u);
        v57 = v68;
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v57, -1, -1);
        MEMORY[0x1C3BA9870](v51, -1, -1);
        swift_release();

        sub_1C127F44C(v75, type metadata accessor for RecordMetadata);
        v2 = v50;
        goto LABEL_5;
      }
      swift_release();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      goto LABEL_25;
    }
    return MEMORY[0x1E0DEE9D8];
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C12A5280(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  os_log_type_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  os_log_type_t v51;
  const char *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t ObjectType;
  uint64_t inited;
  uint64_t v65;
  void (*v66)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), _QWORD *, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[2];
  char v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;

  v6 = v5;
  v72 = a3;
  v11 = sub_1C12B542C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (uint64_t *)((char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *a1;
  v16 = *a5;
  v17 = (void *)v6[15];
  *v14 = v17;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E0DEF740], v11);
  v18 = v17;
  v19 = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
  if ((v19 & 1) == 0)
  {
    __break(1u);
LABEL_43:
    swift_once();
    goto LABEL_4;
  }
  v20 = v6[13];
  v21 = v6[14];
  __swift_project_boxed_opaque_existential_1(v6 + 10, v20);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21) & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v31 = sub_1C12B5390();
    __swift_project_value_buffer(v31, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v32 = sub_1C12B5384();
    v33 = sub_1C12B5540();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v76 = v35;
      *(_DWORD *)v34 = 136380675;
      if (v6[26])
      {
        v36 = v6[25];
        v37 = v6[26];
      }
      else
      {
        v42 = IDSCopyLocalDeviceUniqueID();
        if (v42)
        {
          v43 = (void *)v42;
          v36 = sub_1C12B5480();
          v37 = v44;

        }
        else
        {
          v36 = 0xD000000000000017;
          v37 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v73[0] = sub_1C12882D0(v36, v37, &v76);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v51 = v33;
      v52 = "(%{private}s) Will not send ack message because keybag is locked";
      goto LABEL_41;
    }
LABEL_38:

    swift_release_n();
    return;
  }
  v19 = v6[31];
  if (qword_1ED78DCC8 != -1)
    goto LABEL_43;
LABEL_4:
  if ((qword_1ED78DCC0 & ~v19) != 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v38 = sub_1C12B5390();
    __swift_project_value_buffer(v38, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v32 = sub_1C12B5384();
    v39 = sub_1C12B5540();
    if (os_log_type_enabled(v32, v39))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v76 = v35;
      *(_DWORD *)v34 = 136380675;
      if (v6[26])
      {
        v40 = v6[25];
        v41 = v6[26];
      }
      else
      {
        v48 = IDSCopyLocalDeviceUniqueID();
        if (v48)
        {
          v49 = (void *)v48;
          v40 = sub_1C12B5480();
          v41 = v50;

        }
        else
        {
          v40 = 0xD000000000000017;
          v41 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v73[0] = sub_1C12882D0(v40, v41, &v76);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v51 = v39;
      v52 = "(%{private}s) Will not send ack message because sync is inactive";
LABEL_41:
      _os_log_impl(&dword_1C127A000, v32, v51, v52, v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v35, -1, -1);
      MEMORY[0x1C3BA9870](v34, -1, -1);

      return;
    }
    goto LABEL_38;
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v22 = sub_1C12B5390();
  v23 = __swift_project_value_buffer(v22, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v24 = sub_1C12B5384();
  v25 = sub_1C12B5540();
  if (os_log_type_enabled(v24, (os_log_type_t)v25))
  {
    v71 = a4;
    v26 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v76 = v27;
    *(_DWORD *)v26 = 136381187;
    v28 = v6[26];
    v70 = v23;
    v69 = v25;
    v68 = v27;
    if (v28)
    {
      v29 = v6[25];
      v30 = v28;
    }
    else
    {
      v45 = IDSCopyLocalDeviceUniqueID();
      if (v45)
      {
        v46 = (void *)v45;
        v29 = sub_1C12B5480();
        v30 = v47;

      }
      else
      {
        v29 = 0xD000000000000017;
        v30 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v73[0] = sub_1C12882D0(v29, v30, &v76);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2082;
    if ((_DWORD)v15)
      v53 = 0x6563616C706572;
    else
      v53 = 0x657461647075;
    if ((_DWORD)v15)
      v54 = 0xE700000000000000;
    else
      v54 = 0xE600000000000000;
    v73[0] = sub_1C12882D0(v53, v54, &v76);
    sub_1C12B55DC();
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 22) = 2048;
    v55 = *(_QWORD *)(a2 + 16);
    swift_bridgeObjectRelease();
    v73[0] = v55;
    sub_1C12B55DC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v24, (os_log_type_t)v69, "(%{private}s) Sending ack message for action %{public}s with %ld metadata items", (uint8_t *)v26, 0x20u);
    v56 = v68;
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v56, -1, -1);
    MEMORY[0x1C3BA9870](v26, -1, -1);

    a4 = v71;
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  v75 = v16;
  v73[0] = v15;
  v73[1] = a2;
  v74 = 2;
  swift_bridgeObjectRetain();
  sub_1C12AA110(&v75, (uint64_t)v73, (uint64_t)&v76);
  swift_bridgeObjectRelease();
  v57 = v76;
  v58 = v77;
  v59 = v78;
  v60 = v79;
  v61 = v80;
  v62 = v6[4];
  ObjectType = swift_getObjectType();
  LOBYTE(v76) = v57;
  v77 = v58;
  v78 = v59;
  v79 = v60;
  v80 = v61;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4200);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C12B7860;
  *(_QWORD *)(inited + 32) = v72;
  *(_QWORD *)(inited + 40) = a4;
  swift_bridgeObjectRetain();
  v65 = sub_1C1291F38(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v66 = *(void (**)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), _QWORD *, uint64_t, uint64_t))(v62 + 24);
  swift_retain();
  v66(&v76, v65, sub_1C12B3884, v6, ObjectType, v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1C127CE8C(v60, v61);
}

void sub_1C12A5B70(uint64_t a1, uint64_t a2, char *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t inited;
  uint64_t v36;
  void (*v37)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), _QWORD *, uint64_t, uint64_t);
  uint64_t v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  os_log_type_t v44;
  const char *v45;
  uint64_t ObjectType;
  __int128 v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;

  v4 = v3;
  v8 = sub_1C12B542C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (uint64_t *)((char *)&ObjectType - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *a3;
  v13 = (void *)v4[15];
  *v11 = v13;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF740], v8);
  v14 = v13;
  v15 = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v15 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  v16 = v4[13];
  v17 = v4[14];
  __swift_project_boxed_opaque_existential_1(v4 + 10, v16);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v17 + 16))(v16, v17) & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v18 = sub_1C12B5390();
    __swift_project_value_buffer(v18, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v19 = sub_1C12B5384();
    v20 = sub_1C12B5540();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v50 = v22;
      *(_DWORD *)v21 = 136380675;
      if (v4[26])
      {
        v23 = v4[25];
        v24 = v4[26];
      }
      else
      {
        v38 = IDSCopyLocalDeviceUniqueID();
        if (v38)
        {
          v39 = (void *)v38;
          v23 = sub_1C12B5480();
          v24 = v40;

        }
        else
        {
          v23 = 0xD000000000000017;
          v24 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      *(_QWORD *)&v47 = sub_1C12882D0(v23, v24, &v50);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v44 = v20;
      v45 = "(%{private}s) Will not send resync message because keybag is locked";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  v15 = v4[31];
  if (qword_1ED78DCC8 != -1)
    goto LABEL_27;
LABEL_4:
  if ((qword_1ED78DCC0 & ~v15) == 0)
  {
    v49 = v12;
    v47 = xmmword_1C12B7870;
    v48 = 3;
    sub_1C12AA110(&v49, (uint64_t)&v47, (uint64_t)&v50);
    v29 = v50;
    v31 = v51;
    v30 = v52;
    v32 = v53;
    v33 = v54;
    v34 = v4[4];
    ObjectType = swift_getObjectType();
    LOBYTE(v50) = v29;
    v51 = v31;
    v52 = v30;
    v53 = v32;
    v54 = v33;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4200);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C12B7860;
    *(_QWORD *)(inited + 32) = a1;
    *(_QWORD *)(inited + 40) = a2;
    swift_bridgeObjectRetain();
    v36 = sub_1C1291F38(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    v37 = *(void (**)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), _QWORD *, uint64_t, uint64_t))(v34 + 24);
    swift_retain();
    v37(&v50, v36, sub_1C12B37CC, v4, ObjectType, v34);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C127CE8C(v32, v33);
    return;
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v25 = sub_1C12B5390();
  __swift_project_value_buffer(v25, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v19 = sub_1C12B5384();
  v26 = sub_1C12B5540();
  if (!os_log_type_enabled(v19, v26))
    goto LABEL_16;
  v21 = (uint8_t *)swift_slowAlloc();
  v22 = swift_slowAlloc();
  v50 = v22;
  *(_DWORD *)v21 = 136380675;
  if (v4[26])
  {
    v27 = v4[25];
    v28 = v4[26];
  }
  else
  {
    v41 = IDSCopyLocalDeviceUniqueID();
    if (v41)
    {
      v42 = (void *)v41;
      v27 = sub_1C12B5480();
      v28 = v43;

    }
    else
    {
      v27 = 0xD000000000000017;
      v28 = 0x80000001C12BAE80;
    }
  }
  swift_bridgeObjectRetain();
  *(_QWORD *)&v47 = sub_1C12882D0(v27, v28, &v50);
  sub_1C12B55DC();
  swift_release_n();
  swift_bridgeObjectRelease();
  v44 = v26;
  v45 = "(%{private}s) Will not send resync message because sync is inactive";
LABEL_25:
  _os_log_impl(&dword_1C127A000, v19, v44, v45, v21, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v22, -1, -1);
  MEMORY[0x1C3BA9870](v21, -1, -1);

}

uint64_t sub_1C12A6204()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21[3];

  v1 = v0;
  v2 = sub_1C12B542C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 8);
  v6 = (void *)v1[15];
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF740], v2);
  v7 = v6;
  LOBYTE(v6) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) != 0)
  {
    if (qword_1ED78E810 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v8 = sub_1C12B5390();
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v9 = sub_1C12B5384();
  v10 = sub_1C12B5540();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v21[0] = v12;
    *(_DWORD *)v11 = 136380675;
    if (v1[26])
    {
      v13 = v1[25];
      v14 = v1[26];
    }
    else
    {
      v15 = IDSCopyLocalDeviceUniqueID();
      if (v15)
      {
        v16 = (void *)v15;
        v13 = sub_1C12B5480();
        v14 = v17;

      }
      else
      {
        v14 = 0x80000001C12BAE80;
        v13 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    v20 = sub_1C12882D0(v13, v14, v21);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v9, v10, "(%{private}s) Removing all inflight metadata", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v12, -1, -1);
    MEMORY[0x1C3BA9870](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v1[23] = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v18 = MEMORY[0x1E0DEE9E0];
  v1[21] = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v1[22] = v18;
  return swift_bridgeObjectRelease();
}

void sub_1C12A64D0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  v2 = sub_1C12B542C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (void *)v1[15];
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF740], v2);
  v7 = v6;
  LOBYTE(v6) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_4;
  }
  if (!v1[19])
    return;
  if (qword_1ED78E810 != -1)
    goto LABEL_16;
LABEL_4:
  v8 = sub_1C12B5390();
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v9 = sub_1C12B5384();
  v10 = sub_1C12B5540();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v19 = v12;
    *(_DWORD *)v11 = 136380675;
    if (v1[26])
    {
      v13 = v1[25];
      v14 = v1[26];
    }
    else
    {
      v15 = IDSCopyLocalDeviceUniqueID();
      if (v15)
      {
        v16 = (void *)v15;
        v13 = sub_1C12B5480();
        v14 = v17;

      }
      else
      {
        v14 = 0x80000001C12BAE80;
        v13 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    v18 = sub_1C12882D0(v13, v14, &v19);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v9, v10, "(%{private}s) Cancelling expiration timer", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v12, -1, -1);
    MEMORY[0x1C3BA9870](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  if (v1[19])
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C12B55B8();
    swift_unknownObjectRelease();
    v1[19] = 0;
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1C12A678C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1C12918BC(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[4 * v8 + 4];
  if (a1 + 32 < v9 + 32 * v2 && v9 < a1 + 32 + 32 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1C12B56FC();
  __break(1u);
  return result;
}

void sub_1C12A68DC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  _QWORD *v31;
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
  _QWORD *v42;
  void *v43;
  void (*v44)(_QWORD);
  unint64_t v45;
  void (*v46)(_QWORD *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  _BOOL4 v53;
  uint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  os_log_type_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  void *v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  unint64_t v80;
  os_log_type_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
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
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  BOOL v109;
  BOOL v110;
  uint64_t *v111;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  BOOL v127;
  BOOL v128;
  uint64_t v129;
  __int128 v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  _QWORD *v136;
  _QWORD *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(uint64_t *, uint64_t, uint64_t);
  uint64_t v144;
  NSObject *v145;
  os_log_type_t v146;
  uint64_t v147;
  _QWORD *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  uint64_t v161;
  BOOL v162;
  BOOL v163;
  NSObject *v164;
  os_log_type_t v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  _QWORD *v171;
  unint64_t v172;
  char v173;
  unint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _QWORD *v188;
  uint64_t v189;
  BOOL v190;
  BOOL v191;
  uint64_t *v192;
  int v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  BOOL v206;
  BOOL v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  unint64_t v212;
  uint64_t v213;
  void *v214;
  unint64_t v215;
  uint64_t v216;
  unint64_t v217;
  NSObject *v218;
  os_log_type_t v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t v222;
  unint64_t v223;
  os_log_type_t v224;
  uint8_t *v225;
  uint64_t v226;
  unint64_t v227;
  unint64_t v228;
  uint64_t v229;
  void *v230;
  unint64_t v231;
  uint64_t v232;
  void *v233;
  unint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  NSObject *v239;
  os_log_type_t v240;
  _BOOL4 v241;
  uint8_t *v242;
  uint64_t v243;
  unint64_t v244;
  unint64_t v245;
  uint8_t *v246;
  uint64_t v247;
  unint64_t v248;
  unint64_t v249;
  unsigned __int8 v250;
  uint64_t v251;
  void *v252;
  unint64_t v253;
  uint64_t v254;
  void *v255;
  unint64_t v256;
  char v257;
  uint64_t v258;
  uint64_t v259;
  unint64_t v260;
  uint64_t v261;
  _QWORD *v262;
  char *v263;
  uint64_t v264;
  _QWORD *v265;
  _QWORD *v266;
  uint64_t v267;
  char v268;
  uint64_t v269;
  uint64_t v270;
  _QWORD *v271;
  uint64_t v272;
  _QWORD *v273;
  void *v274;
  uint64_t v275;
  id v276;
  char v277;
  NSObject *v278;
  os_log_type_t v279;
  _BOOL4 v280;
  uint64_t v281;
  uint64_t v282;
  unint64_t v283;
  unint64_t v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  unint64_t v288;
  uint64_t v289;
  uint64_t v290;
  NSObject *v291;
  os_log_type_t v292;
  uint64_t v293;
  _QWORD *v294;
  uint64_t v295;
  char v296;
  unint64_t v297;
  uint64_t v298;
  void *v299;
  unint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t v304;
  uint64_t v305;
  uint64_t v306;
  _QWORD *v307;
  uint64_t v308;
  _QWORD *v309;
  uint64_t v310;
  void (*v311)(uint64_t *, uint64_t, uint64_t (*)(void *, uint64_t, char), _QWORD *, uint64_t, uint64_t);
  uint64_t v312;
  _QWORD v313[2];
  uint64_t v314;
  void (*v315)(_QWORD *, uint64_t);
  char *v316;
  id v317;
  unsigned int v318;
  void (*v319)(_QWORD *, _QWORD, uint64_t);
  char *v320;
  uint64_t v321;
  _QWORD *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  int v327;
  uint64_t v328;
  uint64_t v329;
  unint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  __int128 v334;
  char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  _QWORD *v339;
  unint64_t v340;
  uint64_t v341;
  uint64_t *v342;
  _QWORD *v343;
  _QWORD *v344;
  uint64_t *v345;
  _QWORD *v346;
  uint64_t *v347;
  char *v348;
  _QWORD *v349;
  _QWORD *v350;
  uint64_t v351;
  _QWORD *v352;
  uint64_t ObjectType;
  uint64_t v354;
  _QWORD v355[2];
  unsigned __int8 v356;
  uint64_t v357;
  _QWORD *v358;
  unint64_t v359;
  uint64_t v360[2];
  uint64_t v361;
  uint64_t v362;
  _QWORD *v363;

  v6 = v5;
  v326 = a4;
  v325 = a3;
  v328 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v313 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v323 = sub_1C12B5348();
  v321 = *(_QWORD *)(v323 - 8);
  MEMORY[0x1E0C80A78](v323);
  v320 = (char *)v313 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v13);
  v335 = (char *)v313 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v354 = type metadata accessor for RecordMetadata(0);
  v341 = *(_QWORD *)(v354 - 8);
  v15 = MEMORY[0x1E0C80A78](v354);
  v351 = (uint64_t)v313 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v15);
  v345 = (_QWORD *)((char *)v313 - v18);
  v19 = MEMORY[0x1E0C80A78](v17);
  v344 = (_QWORD *)((char *)v313 - v20);
  v21 = MEMORY[0x1E0C80A78](v19);
  v349 = (_QWORD *)((char *)v313 - v22);
  v23 = MEMORY[0x1E0C80A78](v21);
  v332 = (uint64_t)v313 - v24;
  v25 = MEMORY[0x1E0C80A78](v23);
  v347 = (_QWORD *)((char *)v313 - v26);
  v27 = MEMORY[0x1E0C80A78](v25);
  v346 = (_QWORD *)((char *)v313 - v28);
  v29 = MEMORY[0x1E0C80A78](v27);
  v31 = (_QWORD *)((char *)v313 - v30);
  v32 = MEMORY[0x1E0C80A78](v29);
  v352 = (_QWORD *)((char *)v313 - v33);
  v34 = MEMORY[0x1E0C80A78](v32);
  v350 = (_QWORD *)((char *)v313 - v35);
  MEMORY[0x1E0C80A78](v34);
  ObjectType = (uint64_t)v313 - v36;
  v37 = type metadata accessor for Record(0);
  v336 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78](v37);
  *(_QWORD *)&v334 = (char *)v313 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_1C12B542C();
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v42 = (_QWORD *)((char *)v313 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0));
  v327 = *a5;
  v43 = (void *)v6[15];
  *v42 = v43;
  v44 = *(void (**)(_QWORD))(v40 + 104);
  v318 = *MEMORY[0x1E0DEF740];
  v319 = (void (*)(_QWORD *, _QWORD, uint64_t))v44;
  v44(v42);
  v317 = v43;
  v45 = sub_1C12B5444();
  v46 = *(void (**)(_QWORD *, uint64_t))(v40 + 8);
  v322 = v42;
  v324 = v39;
  v46(v42, v39);
  if ((v45 & 1) == 0)
    goto LABEL_229;
  v315 = v46;
  v316 = v11;
  v47 = v6[13];
  v48 = v6[14];
  __swift_project_boxed_opaque_existential_1(v6 + 10, v47);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v48 + 16))(v47, v48) & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v61 = sub_1C12B5390();
    __swift_project_value_buffer(v61, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v62 = sub_1C12B5384();
    v63 = sub_1C12B5540();
    if (!os_log_type_enabled(v62, v63))
      goto LABEL_206;
    v64 = (uint8_t *)swift_slowAlloc();
    v65 = swift_slowAlloc();
    v360[0] = v65;
    *(_DWORD *)v64 = 136380675;
    if (v6[26])
    {
      v66 = v6[25];
      v67 = v6[26];
    }
    else
    {
      v72 = IDSCopyLocalDeviceUniqueID();
      if (v72)
      {
        v73 = (void *)v72;
        v66 = sub_1C12B5480();
        v67 = v74;

      }
      else
      {
        v66 = 0xD000000000000017;
        v67 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v358 = (_QWORD *)sub_1C12882D0(v66, v67, v360);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    v81 = v63;
    v82 = "(%{private}s) Will not send records because keybag is locked";
    goto LABEL_178;
  }
  v45 = v6[31];
  if (qword_1ED78DCC8 != -1)
    goto LABEL_230;
  while (1)
  {
    if ((qword_1ED78DCC0 & ~v45) != 0)
    {
      if (qword_1ED78E810 != -1)
        swift_once();
      v68 = sub_1C12B5390();
      __swift_project_value_buffer(v68, (uint64_t)qword_1ED78DC40);
      swift_retain_n();
      v62 = sub_1C12B5384();
      v69 = sub_1C12B5540();
      if (!os_log_type_enabled(v62, v69))
        goto LABEL_206;
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v360[0] = v65;
      *(_DWORD *)v64 = 136380675;
      if (v6[26])
      {
        v70 = v6[25];
        v71 = v6[26];
      }
      else
      {
        v78 = IDSCopyLocalDeviceUniqueID();
        if (v78)
        {
          v79 = (void *)v78;
          v70 = sub_1C12B5480();
          v71 = v80;

        }
        else
        {
          v70 = 0xD000000000000017;
          v71 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v358 = (_QWORD *)sub_1C12882D0(v70, v71, v360);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v81 = v69;
      v82 = "(%{private}s) Will not send records because sync is inactive";
LABEL_178:
      _os_log_impl(&dword_1C127A000, v62, v81, v82, v64, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v65, -1, -1);
      MEMORY[0x1C3BA9870](v64, -1, -1);

      return;
    }
    if (qword_1ED78E810 != -1)
      swift_once();
    v49 = sub_1C12B5390();
    v50 = __swift_project_value_buffer(v49, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v329 = v50;
    v51 = sub_1C12B5384();
    v52 = sub_1C12B5540();
    v53 = os_log_type_enabled(v51, (os_log_type_t)v52);
    v339 = v6;
    if (v53)
    {
      v54 = swift_slowAlloc();
      v55 = (_QWORD *)swift_slowAlloc();
      v360[0] = (uint64_t)v55;
      *(_DWORD *)v54 = 136381187;
      v56 = v6[26];
      LODWORD(v348) = v52;
      v343 = v55;
      v57 = a1;
      if (v56)
      {
        v58 = v6[25];
        v59 = v56;
        v60 = v6;
      }
      else
      {
        v75 = IDSCopyLocalDeviceUniqueID();
        if (v75)
        {
          v76 = (void *)v75;
          v58 = sub_1C12B5480();
          v59 = v77;

        }
        else
        {
          v59 = 0x80000001C12BAE80;
          v58 = 0xD000000000000017;
        }
        v60 = v339;
      }
      swift_bridgeObjectRetain();
      v358 = (_QWORD *)sub_1C12882D0(v58, v59, v360);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 12) = 2050;
      a1 = v57;
      v83 = *(_QWORD *)(v57 + 16);
      swift_bridgeObjectRelease();
      v358 = (_QWORD *)v83;
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 22) = 2050;
      v84 = *(_QWORD *)(v328 + 16);
      swift_bridgeObjectRelease();
      v358 = (_QWORD *)v84;
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C127A000, v51, (os_log_type_t)v348, "(%{private}s) Sending %{public}ld modified records and %{public}ld deleted records", (uint8_t *)v54, 0x20u);
      v85 = v343;
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v85, -1, -1);
      MEMORY[0x1C3BA9870](v54, -1, -1);

      v6 = v60;
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v86 = swift_allocObject();
    v314 = v86;
    *(_QWORD *)(v86 + 16) = MEMORY[0x1E0DEE9E8];
    v342 = (uint64_t *)(v86 + 16);
    v87 = sub_1C12A49F8(a1);
    v88 = sub_1C12A98A8(v87);
    swift_bridgeObjectRelease();
    v89 = *(_QWORD *)(v88 + 16);
    v333 = v88;
    v331 = v89;
    if (!v89)
      break;
    v330 = v88 + ((*(unsigned __int8 *)(v336 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v336 + 80));
    swift_bridgeObjectRetain();
    v45 = 0;
    while (v45 < *(_QWORD *)(v333 + 16))
    {
      v93 = *(_QWORD *)(v336 + 72);
      v340 = v45;
      v94 = v330 + v93 * v45;
      v95 = v334;
      sub_1C127F408(v94, v334, type metadata accessor for Record);
      v96 = ObjectType;
      sub_1C127F408(v95, ObjectType, type metadata accessor for RecordMetadata);
      sub_1C127F44C(v95, type metadata accessor for Record);
      v97 = *v342;
      sub_1C12B57E0();
      v6 = *(_QWORD **)(v96 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1C12B54B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C12B54B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      v98 = v354;
      v99 = v96 + *(int *)(v354 + 20);
      v100 = sub_1C12B5324();
      v101 = sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
      v348 = (char *)v99;
      v338 = v100;
      v337 = v101;
      sub_1C12B5468();
      v343 = (_QWORD *)*(int *)(v98 + 24);
      sub_1C12B57F8();
      v102 = sub_1C12B5804();
      v103 = -1 << *(_BYTE *)(v97 + 32);
      a1 = v102 & ~v103;
      if (((*(_QWORD *)(v97 + 56 + ((a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
      {
        v104 = ~v103;
        v105 = *(_QWORD *)(v341 + 72);
        while (1)
        {
          sub_1C127F408(*(_QWORD *)(v97 + 48) + v105 * a1, (uint64_t)v31, type metadata accessor for RecordMetadata);
          v106 = v31[2];
          v6 = (_QWORD *)v31[3];
          v107 = *(_QWORD *)(ObjectType + 16);
          v108 = *(_QWORD **)(ObjectType + 24);
          v109 = *v31 == *(_QWORD *)ObjectType && v31[1] == *(_QWORD *)(ObjectType + 8);
          if (v109 || (sub_1C12B578C() & 1) != 0)
          {
            v110 = v106 == v107 && v6 == v108;
            if ((v110 || (sub_1C12B578C() & 1) != 0)
              && (sub_1C12B5300() & 1) != 0
              && *((unsigned __int8 *)v31 + *(int *)(v354 + 24)) == *((unsigned __int8 *)v343 + ObjectType))
            {
              break;
            }
          }
          sub_1C127F44C((uint64_t)v31, type metadata accessor for RecordMetadata);
          a1 = (a1 + 1) & v104;
          if (((*(_QWORD *)(v97 + 56 + ((a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) == 0)
            goto LABEL_56;
        }
        sub_1C127F44C((uint64_t)v31, type metadata accessor for RecordMetadata);
      }
      else
      {
LABEL_56:
        swift_bridgeObjectRelease();
        v111 = v342;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_1C127F408(ObjectType, (uint64_t)v350, type metadata accessor for RecordMetadata);
        v358 = (_QWORD *)*v111;
        v113 = (uint64_t)v358;
        *v111 = 0x8000000000000000;
        if (*(_QWORD *)(v113 + 24) > *(_QWORD *)(v113 + 16))
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_1C12AE298();
        }
        else
        {
          v6 = v352;
          if (isUniquelyReferenced_nonNull_native)
            sub_1C12AF458();
          else
            sub_1C12AEA68();
          v114 = (uint64_t)v358;
          sub_1C12B57E0();
          v115 = v350;
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          sub_1C12B54B0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1C12B54B0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v116 = v354;
          v348 = (char *)v115 + *(int *)(v354 + 20);
          sub_1C12B5468();
          v343 = (_QWORD *)*(int *)(v116 + 24);
          sub_1C12B57F8();
          v117 = sub_1C12B5804();
          v118 = -1 << *(_BYTE *)(v114 + 32);
          a1 = v117 & ~v118;
          if (((*(_QWORD *)(v114 + 56 + ((a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
          {
            v119 = ~v118;
            v120 = *(_QWORD *)(v341 + 72);
            while (1)
            {
              sub_1C127F408(*(_QWORD *)(v114 + 48) + v120 * a1, (uint64_t)v6, type metadata accessor for RecordMetadata);
              v121 = *v6;
              v122 = v6[1];
              v123 = v6[2];
              v124 = v6[3];
              v126 = v350[2];
              v125 = v350[3];
              v127 = v121 == *v350 && v122 == v350[1];
              if (v127 || (sub_1C12B578C() & 1) != 0)
              {
                v128 = v123 == v126 && v124 == v125;
                if ((v128 || (sub_1C12B578C() & 1) != 0)
                  && (sub_1C12B5300() & 1) != 0
                  && *((unsigned __int8 *)v352 + *(int *)(v354 + 24)) == *((unsigned __int8 *)v343 + (_QWORD)v350))
                {
                  break;
                }
              }
              v6 = v352;
              sub_1C127F44C((uint64_t)v352, type metadata accessor for RecordMetadata);
              a1 = (a1 + 1) & v119;
              if (((*(_QWORD *)(v114 + 56 + ((a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) == 0)
                goto LABEL_36;
            }
LABEL_232:
            v312 = (uint64_t)v352;
            goto LABEL_233;
          }
        }
LABEL_36:
        v45 = (unint64_t)v358;
        *(_QWORD *)((char *)v358 + ((a1 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << a1;
        sub_1C12B3774((uint64_t)v350, *(_QWORD *)(v45 + 48) + *(_QWORD *)(v341 + 72) * a1, type metadata accessor for RecordMetadata);
        v90 = *(_QWORD *)(v45 + 16);
        v91 = __OFADD__(v90, 1);
        v92 = v90 + 1;
        if (v91)
          goto LABEL_227;
        *(_QWORD *)(v45 + 16) = v92;
        *v342 = v45;
      }
      swift_bridgeObjectRelease();
      v45 = v340 + 1;
      sub_1C127F44C(ObjectType, type metadata accessor for RecordMetadata);
      v6 = v339;
      if (v45 == v331)
      {
        swift_bridgeObjectRelease();
        goto LABEL_77;
      }
    }
    __break(1u);
LABEL_227:
    __break(1u);
LABEL_228:
    __break(1u);
LABEL_229:
    __break(1u);
LABEL_230:
    swift_once();
  }
LABEL_77:
  v359 = MEMORY[0x1E0DEE9D8];
  v348 = *(char **)(v328 + 16);
  if (!v348)
  {
LABEL_165:
    v217 = v359;
    if (*(_QWORD *)(*v342 + 16))
    {
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v218 = sub_1C12B5384();
      v219 = sub_1C12B5540();
      if (os_log_type_enabled(v218, v219))
      {
        v220 = swift_slowAlloc();
        v221 = swift_slowAlloc();
        v360[0] = v221;
        *(_DWORD *)v220 = 136381187;
        if (v6[26])
        {
          v222 = v6[25];
          v223 = v6[26];
        }
        else
        {
          v229 = IDSCopyLocalDeviceUniqueID();
          if (v229)
          {
            v230 = (void *)v229;
            v222 = sub_1C12B5480();
            v223 = v231;

          }
          else
          {
            v223 = 0x80000001C12BAE80;
            v222 = 0xD000000000000017;
          }
        }
        swift_bridgeObjectRetain();
        v358 = (_QWORD *)sub_1C12882D0(v222, v223, v360);
        sub_1C12B55DC();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v220 + 12) = 2050;
        v235 = *(_QWORD *)(v333 + 16);
        swift_bridgeObjectRelease();
        v358 = (_QWORD *)v235;
        sub_1C12B55DC();
        swift_bridgeObjectRelease();
        *(_WORD *)(v220 + 22) = 2050;
        v236 = *(_QWORD *)(v217 + 16);
        swift_bridgeObjectRelease();
        v358 = (_QWORD *)v236;
        sub_1C12B55DC();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C127A000, v218, v219, "(%{private}s) Syncing %{public}ld modifications and %{public}ld deletions", (uint8_t *)v220, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v221, -1, -1);
        MEMORY[0x1C3BA9870](v220, -1, -1);

        v6 = v339;
        if ((v339[2] & 1) != 0)
          goto LABEL_191;
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        if ((v6[2] & 1) != 0)
          goto LABEL_191;
      }
      v237 = v6[8];
      v238 = v6[9];
      __swift_project_boxed_opaque_existential_1(v6 + 5, v237);
      LOBYTE(v238) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v238 + 136))(v325, v326, v237, v238);
      swift_retain_n();
      v239 = sub_1C12B5384();
      v240 = sub_1C12B5540();
      v241 = os_log_type_enabled(v239, v240);
      if ((v238 & 1) == 0)
      {
        if (v241)
        {
          v246 = (uint8_t *)swift_slowAlloc();
          v247 = swift_slowAlloc();
          v360[0] = v247;
          *(_DWORD *)v246 = 136380675;
          if (v6[26])
          {
            v248 = v6[25];
            v249 = v6[26];
          }
          else
          {
            v254 = IDSCopyLocalDeviceUniqueID();
            if (v254)
            {
              v255 = (void *)v254;
              v248 = sub_1C12B5480();
              v249 = v256;

            }
            else
            {
              v249 = 0x80000001C12BAE80;
              v248 = 0xD000000000000017;
            }
          }
          swift_bridgeObjectRetain();
          v358 = (_QWORD *)sub_1C12882D0(v248, v249, v360);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C127A000, v239, v240, "(%{private}s) Paired device has never synced; sending as replace",
            v246,
            0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v247, -1, -1);
          MEMORY[0x1C3BA9870](v246, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        v250 = 1;
        goto LABEL_204;
      }
      if (v241)
      {
        v242 = (uint8_t *)swift_slowAlloc();
        v243 = swift_slowAlloc();
        v360[0] = v243;
        *(_DWORD *)v242 = 136380675;
        if (v6[26])
        {
          v244 = v6[25];
          v245 = v6[26];
        }
        else
        {
          v251 = IDSCopyLocalDeviceUniqueID();
          if (v251)
          {
            v252 = (void *)v251;
            v244 = sub_1C12B5480();
            v245 = v253;

          }
          else
          {
            v245 = 0x80000001C12BAE80;
            v244 = 0xD000000000000017;
          }
        }
        swift_bridgeObjectRetain();
        v358 = (_QWORD *)sub_1C12882D0(v244, v245, v360);
        sub_1C12B55DC();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C127A000, v239, v240, "(%{private}s) Paired device has synced before; sending as update",
          v242,
          0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v243, -1, -1);
        MEMORY[0x1C3BA9870](v242, -1, -1);

        v250 = 0;
        goto LABEL_204;
      }

      swift_release_n();
LABEL_191:
      v250 = 0;
LABEL_204:
      v257 = v327;
      swift_beginAccess();
      v258 = v359;
      LOBYTE(v357) = v257;
      v259 = v333;
      v355[0] = v333;
      v355[1] = v359;
      v356 = v250;
      sub_1C12AA110((char *)&v357, (uint64_t)v355, (uint64_t)v360);
      sub_1C1295654(v259, v258, v250);
      LODWORD(v260) = LOBYTE(v360[0]);
      v261 = v361;
      v262 = v363;
      ObjectType = v360[1];
      v354 = v362;
      v263 = v320;
      sub_1C12B533C();
      v264 = sub_1C12B5330();
      v266 = v265;
      (*(void (**)(char *, uint64_t))(v321 + 8))(v263, v323);
      v267 = *v342;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v268 = swift_isUniquelyReferenced_nonNull_native();
      v355[0] = v6[21];
      v6[21] = 0x8000000000000000;
      sub_1C128B230(v267, v264, (uint64_t)v266, v268);
      v6[21] = v355[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_bridgeObjectRetain();
      v269 = (uint64_t)v316;
      sub_1C12B530C();
      v270 = sub_1C12B5324();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v270 - 8) + 56))(v269, 0, 1, v270);
      swift_beginAccess();
      sub_1C1283668(v269, v264, (uint64_t)v266);
      swift_endAccess();
      v271 = (_QWORD *)v6[23];
      swift_bridgeObjectRetain();
      v272 = swift_bridgeObjectRetain();
      v6[23] = sub_1C1297030(v272, v271);
      swift_bridgeObjectRelease();
      v273 = v322;
      v274 = v317;
      *v322 = v317;
      v275 = v324;
      v319(v273, v318, v324);
      v276 = v274;
      v277 = sub_1C12B5444();
      v315(v273, v275);
      if ((v277 & 1) != 0)
      {
        sub_1C12A64D0();
        sub_1C12ABE7C();
        swift_retain_n();
        swift_retain_n();
        v278 = sub_1C12B5384();
        v279 = sub_1C12B5540();
        v280 = os_log_type_enabled(v278, v279);
        v352 = (_QWORD *)v261;
        v351 = v264;
        v350 = v262;
        v349 = v266;
        if (v280)
        {
          LODWORD(v348) = v260;
          v281 = swift_slowAlloc();
          v282 = swift_slowAlloc();
          v360[0] = v282;
          *(_DWORD *)v281 = 136381187;
          if (v6[26])
          {
            v283 = v6[25];
            v284 = v6[26];
          }
          else
          {
            v286 = IDSCopyLocalDeviceUniqueID();
            if (v286)
            {
              v287 = (void *)v286;
              v283 = sub_1C12B5480();
              v284 = v288;

            }
            else
            {
              v284 = 0x80000001C12BAE80;
              v283 = 0xD000000000000017;
            }
            v6 = v339;
          }
          swift_bridgeObjectRetain();
          v355[0] = sub_1C12882D0(v283, v284, v360);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v281 + 12) = 2050;
          swift_beginAccess();
          v289 = *(_QWORD *)(*(_QWORD *)(v314 + 16) + 16);
          swift_release();
          v357 = v289;
          sub_1C12B55DC();
          swift_release();
          *(_WORD *)(v281 + 22) = 2050;
          v290 = *(_QWORD *)(v6[23] + 16);
          swift_release();
          v357 = v290;
          sub_1C12B55DC();
          swift_release();
          _os_log_impl(&dword_1C127A000, v278, v279, "(%{private}s) Added %{public}ld inflight records; %{public}ld remaining",
            (uint8_t *)v281,
            0x20u);
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v282, -1, -1);
          MEMORY[0x1C3BA9870](v281, -1, -1);

          v285 = v354;
          v264 = v351;
          LOBYTE(v260) = (_BYTE)v348;
        }
        else
        {

          swift_release_n();
          swift_release_n();
          v285 = v354;
        }
        swift_retain_n();
        v291 = sub_1C12B5384();
        v292 = sub_1C12B5540();
        if (os_log_type_enabled(v291, v292))
        {
          v293 = swift_slowAlloc();
          v294 = v6;
          v295 = swift_slowAlloc();
          v360[0] = v295;
          *(_DWORD *)v293 = 136380931;
          if (v294[26])
          {
            v296 = v260;
            v297 = v294[25];
            v260 = v294[26];
          }
          else
          {
            v296 = v260;
            v298 = IDSCopyLocalDeviceUniqueID();
            if (v298)
            {
              v299 = (void *)v298;
              v297 = sub_1C12B5480();
              v260 = v300;

              v294 = v339;
            }
            else
            {
              v260 = 0x80000001C12BAE80;
              v294 = v339;
              v297 = 0xD000000000000017;
            }
          }
          swift_bridgeObjectRetain();
          v357 = sub_1C12882D0(v297, v260, v360);
          sub_1C12B55DC();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v293 + 12) = 2050;
          v301 = *(_QWORD *)(v294[21] + 16);
          swift_release();
          v357 = v301;
          sub_1C12B55DC();
          swift_release();
          _os_log_impl(&dword_1C127A000, v291, v292, "(%{private}s) %{public}ld outstanding request identifiers", (uint8_t *)v293, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1C3BA9870](v295, -1, -1);
          MEMORY[0x1C3BA9870](v293, -1, -1);

          v6 = v294;
          v285 = v354;
          v264 = v351;
          LOBYTE(v260) = v296;
        }
        else
        {

          swift_release_n();
        }
        v302 = ObjectType;
        v303 = v6[4];
        ObjectType = swift_getObjectType();
        LOBYTE(v360[0]) = v260;
        v360[1] = v302;
        v361 = (uint64_t)v352;
        v304 = (unint64_t)v350;
        v362 = v285;
        v363 = v350;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4200);
        v305 = swift_allocObject();
        *(_OWORD *)(v305 + 16) = xmmword_1C12B7860;
        v306 = v285;
        *(_QWORD *)(v305 + 32) = v325;
        *(_QWORD *)(v305 + 40) = v326;
        swift_bridgeObjectRetain();
        v307 = v6;
        v308 = sub_1C1291F38(v305);
        swift_setDeallocating();
        swift_arrayDestroy();
        swift_deallocClassInstance();
        v309 = (_QWORD *)swift_allocObject();
        v309[2] = v307;
        v309[3] = v264;
        v310 = v314;
        v309[4] = v349;
        v309[5] = v310;
        v311 = *(void (**)(uint64_t *, uint64_t, uint64_t (*)(void *, uint64_t, char), _QWORD *, uint64_t, uint64_t))(v303 + 24);
        swift_retain();
        swift_retain();
        v311(v360, v308, sub_1C12B2D54, v309, ObjectType, v303);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        sub_1C127CE8C(v306, v304);
        swift_release();
        return;
      }
      __break(1u);
      goto LABEL_232;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain_n();
    v62 = sub_1C12B5384();
    v224 = sub_1C12B5540();
    if (os_log_type_enabled(v62, v224))
    {
      v225 = (uint8_t *)swift_slowAlloc();
      v226 = swift_slowAlloc();
      v360[0] = v226;
      *(_DWORD *)v225 = 136380675;
      if (v6[26])
      {
        v227 = v6[25];
        v228 = v6[26];
      }
      else
      {
        v232 = IDSCopyLocalDeviceUniqueID();
        if (v232)
        {
          v233 = (void *)v232;
          v227 = sub_1C12B5480();
          v228 = v234;

        }
        else
        {
          v228 = 0x80000001C12BAE80;
          v227 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      v358 = (_QWORD *)sub_1C12882D0(v227, v228, v360);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C127A000, v62, v224, "(%{private}s) Update message is empty; will not send", v225, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v226, -1, -1);
      MEMORY[0x1C3BA9870](v225, -1, -1);
      swift_release();

      return;
    }
    swift_release();
LABEL_206:

    swift_release_n();
    return;
  }
  v343 = v6 + 5;
  v340 = v328 + 32;
  v313[1] = &v360[1];
  swift_bridgeObjectRetain();
  v129 = 0;
  *(_QWORD *)&v130 = 136380931;
  v334 = v130;
  v330 = (unint64_t)"Validating sync engine";
  v331 = MEMORY[0x1E0DEE9B8] + 8;
  while (1)
  {
    v136 = (_QWORD *)(v340 + 32 * v129);
    v137 = (_QWORD *)*v136;
    v138 = v136[1];
    v139 = v136[2];
    v140 = v136[3];
    v141 = v6[8];
    v142 = v6[9];
    __swift_project_boxed_opaque_existential_1(v343, v141);
    v350 = v137;
    v360[0] = (uint64_t)v137;
    v360[1] = v138;
    v361 = v139;
    v362 = v140;
    v143 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v142 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v144 = (uint64_t)v335;
    v143(v360, v141, v142);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v341 + 48))(v144, 1, v354) != 1)
      break;
    sub_1C128E2B0(v144, &qword_1ED78E3F0);
    swift_retain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v145 = sub_1C12B5384();
    v146 = sub_1C12B5540();
    if (!os_log_type_enabled(v145, v146))
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_release_n();
      goto LABEL_83;
    }
    v338 = v139;
    v352 = (_QWORD *)v129;
    v131 = swift_slowAlloc();
    v132 = swift_slowAlloc();
    v358 = (_QWORD *)v132;
    *(_DWORD *)v131 = v334;
    if (v6[26])
    {
      v133 = v132;
      v134 = v6[25];
      v135 = v6[26];
    }
    else
    {
      v133 = v132;
      v210 = IDSCopyLocalDeviceUniqueID();
      if (v210)
      {
        v211 = (void *)v210;
        v134 = sub_1C12B5480();
        v135 = v212;

      }
      else
      {
        v135 = v330 | 0x8000000000000000;
        v134 = 0xD000000000000017;
      }
      v6 = v339;
    }
    swift_bridgeObjectRetain();
    *(_QWORD *)(v131 + 4) = sub_1C12882D0(v134, v135, (uint64_t *)&v358);
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v131 + 12) = 2082;
    v360[0] = 0;
    v360[1] = 0xE000000000000000;
    sub_1C12B5660();
    swift_bridgeObjectRelease();
    strcpy((char *)v360, "identifier: ");
    BYTE5(v360[1]) = 0;
    HIWORD(v360[1]) = -5120;
    swift_bridgeObjectRetain();
    sub_1C12B54BC();
    swift_bridgeObjectRelease();
    sub_1C12B54BC();
    swift_bridgeObjectRetain();
    sub_1C12B54BC();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v131 + 14) = sub_1C12882D0(v360[0], v360[1], (uint64_t *)&v358);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v145, v146, "(%{private}s) Metadata store does not contain an entry for deleted record %{public}s", (uint8_t *)v131, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v133, -1, -1);
    MEMORY[0x1C3BA9870](v131, -1, -1);

LABEL_82:
    v129 = (uint64_t)v352;
LABEL_83:
    if ((char *)++v129 == v348)
    {
      swift_bridgeObjectRelease();
      goto LABEL_165;
    }
  }
  v338 = v139;
  v352 = (_QWORD *)v129;
  v147 = v144;
  v148 = v346;
  sub_1C12B3774(v147, (uint64_t)v346, type metadata accessor for RecordMetadata);
  v149 = v6[23];
  if (*(_QWORD *)(v149 + 16))
  {
    v337 = v138;
    sub_1C12B57E0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v150 = v354;
    sub_1C12B5324();
    sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
    sub_1C12B5468();
    ObjectType = *(int *)(v150 + 24);
    sub_1C12B57F8();
    v151 = sub_1C12B5804();
    v152 = -1 << *(_BYTE *)(v149 + 32);
    v153 = v151 & ~v152;
    v154 = v347;
    if (((*(_QWORD *)(v149 + 56 + ((v153 >> 3) & 0xFFFFFFFFFFFFF8)) >> v153) & 1) != 0)
    {
      v336 = v140;
      v155 = ~v152;
      v156 = *(_QWORD *)(v341 + 72);
      while (1)
      {
        sub_1C127F408(*(_QWORD *)(v149 + 48) + v156 * v153, (uint64_t)v154, type metadata accessor for RecordMetadata);
        v157 = *v154;
        v158 = v154[1];
        v159 = v154[2];
        v160 = (_QWORD *)v154[3];
        v161 = v346[2];
        v6 = (_QWORD *)v346[3];
        v162 = v157 == *v346 && v158 == v346[1];
        if (v162 || (sub_1C12B578C() & 1) != 0)
        {
          v163 = v159 == v161 && v160 == v6;
          if ((v163 || (sub_1C12B578C() & 1) != 0)
            && (sub_1C12B5300() & 1) != 0
            && *((unsigned __int8 *)v347 + *(int *)(v354 + 24)) == *((unsigned __int8 *)v346 + ObjectType))
          {
            break;
          }
        }
        v154 = v347;
        sub_1C127F44C((uint64_t)v347, type metadata accessor for RecordMetadata);
        v153 = (v153 + 1) & v155;
        if (((*(_QWORD *)(v149 + 56 + ((v153 >> 3) & 0xFFFFFFFFFFFFF8)) >> v153) & 1) == 0)
          goto LABEL_107;
      }
      sub_1C127F44C((uint64_t)v347, type metadata accessor for RecordMetadata);
      swift_bridgeObjectRelease();
      v6 = v339;
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v164 = sub_1C12B5384();
      v165 = sub_1C12B5540();
      if (os_log_type_enabled(v164, v165))
      {
        v166 = swift_slowAlloc();
        v167 = swift_slowAlloc();
        v358 = (_QWORD *)v167;
        *(_DWORD *)v166 = v334;
        v168 = v6[26];
        ObjectType = v167;
        if (v168)
        {
          v169 = v6[25];
          v170 = v168;
          v171 = v6;
        }
        else
        {
          v213 = IDSCopyLocalDeviceUniqueID();
          if (v213)
          {
            v214 = (void *)v213;
            v169 = sub_1C12B5480();
            v170 = v215;

          }
          else
          {
            v170 = v330 | 0x8000000000000000;
            v169 = 0xD000000000000017;
          }
          v171 = v339;
        }
        swift_bridgeObjectRetain();
        v360[0] = sub_1C12882D0(v169, v170, (uint64_t *)&v358);
        sub_1C12B55DC();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v166 + 12) = 2082;
        v360[0] = 0;
        v360[1] = 0xE000000000000000;
        sub_1C12B5660();
        swift_bridgeObjectRelease();
        strcpy((char *)v360, "identifier: ");
        BYTE5(v360[1]) = 0;
        HIWORD(v360[1]) = -5120;
        swift_bridgeObjectRetain();
        sub_1C12B54BC();
        swift_bridgeObjectRelease();
        sub_1C12B54BC();
        swift_bridgeObjectRetain();
        sub_1C12B54BC();
        swift_bridgeObjectRelease();
        v360[0] = sub_1C12882D0(v360[0], v360[1], (uint64_t *)&v358);
        sub_1C12B55DC();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C127A000, v164, v165, "(%{private}s) Metadata for deleted record %{public}s is already syncing", (uint8_t *)v166, 0x16u);
        v216 = ObjectType;
        swift_arrayDestroy();
        MEMORY[0x1C3BA9870](v216, -1, -1);
        MEMORY[0x1C3BA9870](v166, -1, -1);

        sub_1C127F44C((uint64_t)v346, type metadata accessor for RecordMetadata);
        v6 = v171;
      }
      else
      {
        swift_release_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        sub_1C127F44C((uint64_t)v346, type metadata accessor for RecordMetadata);
      }
      goto LABEL_82;
    }
LABEL_107:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v148 = v346;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1C127F408((uint64_t)v148, v332, type metadata accessor for RecordMetadata);
  v172 = v359;
  v173 = swift_isUniquelyReferenced_nonNull_native();
  a1 = v351;
  if ((v173 & 1) == 0)
    v172 = sub_1C129169C(0, *(_QWORD *)(v172 + 16) + 1, 1, v172);
  v175 = *(_QWORD *)(v172 + 16);
  v174 = *(_QWORD *)(v172 + 24);
  if (v175 >= v174 >> 1)
    v172 = sub_1C129169C(v174 > 1, v175 + 1, 1, v172);
  *(_QWORD *)(v172 + 16) = v175 + 1;
  v176 = *(_QWORD *)(v341 + 72);
  sub_1C12B3774(v332, v172 + ((*(unsigned __int8 *)(v341 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v341 + 80)) + v176 * v175, type metadata accessor for RecordMetadata);
  v359 = v172;
  sub_1C127F408((uint64_t)v148, (uint64_t)v349, type metadata accessor for RecordMetadata);
  v177 = *v342;
  sub_1C12B57E0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v178 = v354;
  v179 = (_QWORD *)sub_1C12B5324();
  v180 = sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  v350 = v179;
  v338 = v180;
  sub_1C12B5468();
  ObjectType = *(int *)(v178 + 24);
  sub_1C12B57F8();
  v181 = sub_1C12B5804();
  v182 = -1 << *(_BYTE *)(v177 + 32);
  v183 = v181 & ~v182;
  if (((*(_QWORD *)(v177 + 56 + ((v183 >> 3) & 0xFFFFFFFFFFFFF8)) >> v183) & 1) != 0)
  {
    v184 = ~v182;
    while (1)
    {
      sub_1C127F408(*(_QWORD *)(v177 + 48) + v183 * v176, a1, type metadata accessor for RecordMetadata);
      v185 = *(_QWORD *)a1;
      v186 = *(_QWORD *)(a1 + 8);
      v187 = *(_QWORD *)(a1 + 16);
      v188 = *(_QWORD **)(a1 + 24);
      v189 = v349[2];
      v6 = (_QWORD *)v349[3];
      v190 = v185 == *v349 && v186 == v349[1];
      if (v190 || (sub_1C12B578C() & 1) != 0)
      {
        v191 = v187 == v189 && v188 == v6;
        if ((v191 || (sub_1C12B578C() & 1) != 0)
          && (sub_1C12B5300() & 1) != 0
          && *(unsigned __int8 *)(v351 + *(int *)(v354 + 24)) == *((unsigned __int8 *)v349 + ObjectType))
        {
          break;
        }
      }
      a1 = v351;
      sub_1C127F44C(v351, type metadata accessor for RecordMetadata);
      v183 = (v183 + 1) & v184;
      if (((*(_QWORD *)(v177 + 56 + ((v183 >> 3) & 0xFFFFFFFFFFFFF8)) >> v183) & 1) == 0)
        goto LABEL_128;
    }
    sub_1C127F44C(v351, type metadata accessor for RecordMetadata);
LABEL_153:
    swift_bridgeObjectRelease();
    sub_1C127F44C((uint64_t)v349, type metadata accessor for RecordMetadata);
    sub_1C127F44C((uint64_t)v346, type metadata accessor for RecordMetadata);
    v6 = v339;
    goto LABEL_82;
  }
LABEL_128:
  swift_bridgeObjectRelease();
  v192 = v342;
  v193 = swift_isUniquelyReferenced_nonNull_native();
  sub_1C127F408((uint64_t)v349, (uint64_t)v344, type metadata accessor for RecordMetadata);
  v358 = (_QWORD *)*v192;
  v194 = (uint64_t)v358;
  *v192 = 0x8000000000000000;
  if (*(_QWORD *)(v194 + 24) > *(_QWORD *)(v194 + 16))
  {
    if ((v193 & 1) == 0)
      sub_1C12AE298();
LABEL_150:
    v45 = (unint64_t)type metadata accessor for RecordMetadata;
LABEL_151:
    v31 = v358;
    *(_QWORD *)((char *)v358 + ((v183 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v183;
    sub_1C12B3774((uint64_t)v344, v31[6] + v183 * v176, type metadata accessor for RecordMetadata);
    v208 = v31[2];
    v91 = __OFADD__(v208, 1);
    v209 = v208 + 1;
    if (v91)
      goto LABEL_228;
    v31[2] = v209;
    *v342 = (uint64_t)v31;
    goto LABEL_153;
  }
  v195 = v345;
  if (v193)
    sub_1C12AF458();
  else
    sub_1C12AEA68();
  a1 = (unint64_t)v358;
  sub_1C12B57E0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C12B54B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v196 = v354;
  sub_1C12B5468();
  ObjectType = *(int *)(v196 + 24);
  sub_1C12B57F8();
  v197 = sub_1C12B5804();
  v198 = -1 << *(_BYTE *)(a1 + 32);
  v183 = v197 & ~v198;
  v6 = (_QWORD *)(a1 + 56);
  if (((*(_QWORD *)(a1 + 56 + ((v183 >> 3) & 0xFFFFFFFFFFFFF8)) >> v183) & 1) == 0)
    goto LABEL_150;
  v199 = ~v198;
  while (1)
  {
    sub_1C127F408(*(_QWORD *)(a1 + 48) + v183 * v176, (uint64_t)v195, type metadata accessor for RecordMetadata);
    v200 = *v195;
    v201 = v195[1];
    v202 = v195[2];
    v203 = v195[3];
    v204 = v344[2];
    v205 = v344[3];
    v206 = v200 == *v344 && v201 == v344[1];
    if (v206 || (sub_1C12B578C() & 1) != 0)
    {
      v207 = v202 == v204 && v203 == v205;
      if ((v207 || (sub_1C12B578C() & 1) != 0)
        && (sub_1C12B5300() & 1) != 0
        && *((unsigned __int8 *)v345 + *(int *)(v354 + 24)) == *((unsigned __int8 *)v344 + ObjectType))
      {
        break;
      }
    }
    v195 = v345;
    v45 = (unint64_t)type metadata accessor for RecordMetadata;
    sub_1C127F44C((uint64_t)v345, type metadata accessor for RecordMetadata);
    v183 = (v183 + 1) & v199;
    if (((*(_QWORD *)((char *)v6 + ((v183 >> 3) & 0xFFFFFFFFFFFFF8)) >> v183) & 1) == 0)
      goto LABEL_151;
  }
  v312 = (uint64_t)v345;
LABEL_233:
  sub_1C127F44C(v312, type metadata accessor for RecordMetadata);
  sub_1C12B5798();
  __break(1u);
}

uint64_t sub_1C12A98A8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD *v25;
  NSObject *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  os_log_t v32;
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  os_log_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  _QWORD *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  os_log_t v80;
  uint64_t v81;
  uint64_t v82[9];

  v79 = type metadata accessor for RecordMetadata(0);
  v68 = *(_QWORD *)(v79 - 8);
  MEMORY[0x1E0C80A78](v79);
  v4 = (uint64_t *)((char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for Record(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v67 = (uint64_t)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v70 = (char *)&v60 - v10;
  MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v60 - v11);
  v13 = sub_1C12B542C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (uint64_t *)((char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v71 = v1;
  v17 = (void *)v1[15];
  *v16 = v17;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E0DEF740], v13);
  v18 = v17;
  LOBYTE(v17) = sub_1C12B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v14 + 8))(v16, v13);
  if ((v17 & 1) != 0)
  {
    v74 = *(_QWORD *)(a1 + 16);
    if (v74)
    {
      v72 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v73 = a1 + v72;
      v20 = *(_QWORD *)(v6 + 72);
      v66 = &v82[1];
      v62 = a1;
      swift_bridgeObjectRetain();
      v21 = 0;
      v22 = MEMORY[0x1E0DEE9D8];
      *(_QWORD *)&v23 = 136380931;
      v64 = v23;
      v61 = (unint64_t)"Validating sync engine";
      v63 = MEMORY[0x1E0DEE9B8] + 8;
      v24 = (uint64_t)v70;
      v25 = v71;
      v69 = v20;
      while (1)
      {
        sub_1C127F408(v73 + v20 * v21, (uint64_t)v12, type metadata accessor for Record);
        v26 = v25[23];
        if (v26[2].isa)
        {
          v75 = v21;
          v76 = v22;
          v80 = v26;
          sub_1C12B57E0();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          sub_1C12B54B0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1C12B54B0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v27 = v79;
          v28 = (char *)v12 + *(int *)(v79 + 20);
          sub_1C12B5324();
          sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
          v78 = v28;
          sub_1C12B5468();
          v77 = *(int *)(v27 + 24);
          sub_1C12B57F8();
          v29 = sub_1C12B5804();
          v30 = -1 << LOBYTE(v80[4].isa);
          v31 = v29 & ~v30;
          v32 = v80;
          v33 = v80 + 7;
          if (((*(unint64_t *)((char *)&v80[7].isa + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) != 0)
          {
            v34 = ~v30;
            v35 = *(_QWORD *)(v68 + 72);
            while (1)
            {
              sub_1C127F408((uint64_t)v32[6].isa + v35 * v31, (uint64_t)v4, type metadata accessor for RecordMetadata);
              v36 = v4[2];
              v37 = v4[3];
              v39 = v12[2];
              v38 = v12[3];
              v40 = *v4 == *v12 && v4[1] == v12[1];
              if (v40 || (sub_1C12B578C() & 1) != 0)
              {
                v41 = v36 == v39 && v37 == v38;
                if ((v41 || (sub_1C12B578C() & 1) != 0)
                  && (sub_1C12B5300() & 1) != 0
                  && *((unsigned __int8 *)v4 + *(int *)(v79 + 24)) == *((unsigned __int8 *)v12 + v77))
                {
                  break;
                }
              }
              sub_1C127F44C((uint64_t)v4, type metadata accessor for RecordMetadata);
              v31 = (v31 + 1) & v34;
              v32 = v80;
              if (((*(unint64_t *)((char *)&v33->isa + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
                goto LABEL_25;
            }
            sub_1C127F44C((uint64_t)v4, type metadata accessor for RecordMetadata);
            swift_bridgeObjectRelease();
            if (qword_1ED78E810 != -1)
              swift_once();
            v42 = sub_1C12B5390();
            __swift_project_value_buffer(v42, (uint64_t)qword_1ED78DC40);
            v43 = v67;
            sub_1C127F408((uint64_t)v12, v67, type metadata accessor for Record);
            v25 = v71;
            swift_retain_n();
            v44 = sub_1C12B5384();
            v45 = sub_1C12B5540();
            v46 = os_log_type_enabled(v44, (os_log_type_t)v45);
            v21 = v75;
            v22 = v76;
            if (v46)
            {
              LODWORD(v78) = v45;
              v47 = swift_slowAlloc();
              v48 = swift_slowAlloc();
              *(_DWORD *)v47 = v64;
              v49 = v25[26];
              v80 = v44;
              v81 = v48;
              v77 = v48;
              if (v49)
              {
                v50 = v25[25];
                v51 = v49;
              }
              else
              {
                v54 = IDSCopyLocalDeviceUniqueID();
                if (v54)
                {
                  v55 = (void *)v54;
                  v50 = sub_1C12B5480();
                  v51 = v56;

                }
                else
                {
                  v51 = v61 | 0x8000000000000000;
                  v50 = 0xD000000000000017;
                }
              }
              swift_bridgeObjectRetain();
              v82[0] = sub_1C12882D0(v50, v51, &v81);
              sub_1C12B55DC();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v47 + 12) = 2082;
              v65 = v47 + 14;
              v57 = v67;
              v82[0] = 0;
              v82[1] = 0xE000000000000000;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              sub_1C12B5660();
              swift_bridgeObjectRelease();
              strcpy((char *)v82, "identifier: ");
              BYTE5(v82[1]) = 0;
              HIWORD(v82[1]) = -5120;
              swift_bridgeObjectRetain();
              sub_1C12B54BC();
              swift_bridgeObjectRelease();
              sub_1C12B54BC();
              swift_bridgeObjectRetain();
              sub_1C12B54BC();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              v82[0] = sub_1C12882D0(v82[0], v82[1], &v81);
              sub_1C12B55DC();
              swift_bridgeObjectRelease();
              sub_1C127F44C(v57, type metadata accessor for Record);
              v58 = v80;
              _os_log_impl(&dword_1C127A000, v80, (os_log_type_t)v78, "(%{private}s) Metadata for record %{public}s is already syncing", (uint8_t *)v47, 0x16u);
              v59 = v77;
              swift_arrayDestroy();
              MEMORY[0x1C3BA9870](v59, -1, -1);
              MEMORY[0x1C3BA9870](v47, -1, -1);

              sub_1C127F44C((uint64_t)v12, type metadata accessor for Record);
              v24 = (uint64_t)v70;
              v20 = v69;
              v21 = v75;
              v22 = v76;
            }
            else
            {

              sub_1C127F44C(v43, type metadata accessor for Record);
              swift_release_n();
              sub_1C127F44C((uint64_t)v12, type metadata accessor for Record);
              v24 = (uint64_t)v70;
              v20 = v69;
            }
            goto LABEL_31;
          }
LABEL_25:
          swift_bridgeObjectRelease();
          v24 = (uint64_t)v70;
          v25 = v71;
          v20 = v69;
          v21 = v75;
          v22 = v76;
        }
        sub_1C127F408((uint64_t)v12, v24, type metadata accessor for Record);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v22 = sub_1C1291688(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
        v53 = *(_QWORD *)(v22 + 16);
        v52 = *(_QWORD *)(v22 + 24);
        if (v53 >= v52 >> 1)
          v22 = sub_1C1291688(v52 > 1, v53 + 1, 1, v22);
        *(_QWORD *)(v22 + 16) = v53 + 1;
        sub_1C12B3774(v24, v22 + v72 + v53 * v20, type metadata accessor for Record);
        sub_1C127F44C((uint64_t)v12, type metadata accessor for Record);
LABEL_31:
        if (++v21 == v74)
        {
          swift_bridgeObjectRelease();
          return v22;
        }
      }
    }
    return MEMORY[0x1E0DEE9D8];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1C12AA110@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  uint64_t v33[2];
  char v34;
  uint64_t v35;

  v5 = v3;
  v7 = *a1;
  v8 = *(_QWORD *)a2;
  v9 = *(_QWORD *)(a2 + 8);
  v10 = *(_BYTE *)(a2 + 16);
  sub_1C12B5294();
  swift_allocObject();
  sub_1C12B5288();
  v33[0] = v8;
  v33[1] = v9;
  v34 = v10;
  sub_1C12B3730();
  v11 = sub_1C12B527C();
  if (v4)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v13 = sub_1C12B5390();
    __swift_project_value_buffer(v13, (uint64_t)qword_1ED78DC40);
    swift_retain();
    v14 = v4;
    swift_retain();
    v15 = v4;
    v16 = sub_1C12B5384();
    v17 = sub_1C12B5534();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v33[0] = v19;
      *(_DWORD *)v18 = 136380931;
      v32 = v17;
      v31 = v19;
      if (*(_QWORD *)(v5 + 208))
      {
        v20 = *(_QWORD *)(v5 + 200);
        v21 = *(_QWORD *)(v5 + 208);
      }
      else
      {
        v25 = IDSCopyLocalDeviceUniqueID();
        if (v25)
        {
          v26 = (void *)v25;
          v20 = sub_1C12B5480();
          v21 = v27;

        }
        else
        {
          v21 = 0x80000001C12BAE80;
          v20 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      v35 = sub_1C12882D0(v20, v21, v33);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2082;
      v35 = (uint64_t)v4;
      v28 = v4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41E0);
      v29 = sub_1C12B5498();
      v35 = sub_1C12882D0(v29, v30, v33);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C127A000, v16, v32, "(%{private}s) Failed to encode message: %{public}s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v31, -1, -1);
      MEMORY[0x1C3BA9870](v18, -1, -1);
    }
    else
    {
      swift_release_n();

    }
    swift_willThrow();
    return swift_release();
  }
  else
  {
    v22 = v11;
    v23 = v12;
    result = swift_release();
    *(_BYTE *)a3 = v7;
    *(_QWORD *)(a3 + 8) = 0x69676E45636E7953;
    *(_QWORD *)(a3 + 16) = 0xEA0000000000656ELL;
    *(_QWORD *)(a3 + 24) = v22;
    *(_QWORD *)(a3 + 32) = v23;
  }
  return result;
}

uint64_t sub_1C12AA44C(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t result;
  _QWORD v19[6];

  v13 = a7 + 16;
  v14 = *(NSObject **)(a4 + 120);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a4;
  *(_QWORD *)(v15 + 24) = a5;
  *(_QWORD *)(v15 + 32) = a6;
  *(_QWORD *)(v15 + 40) = a1;
  *(_QWORD *)(v15 + 48) = a2;
  a3 &= 1u;
  *(_BYTE *)(v15 + 56) = a3;
  *(_QWORD *)(v15 + 64) = v13;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1C12B2D9C;
  *(_QWORD *)(v16 + 24) = v15;
  v19[4] = sub_1C12B398C;
  v19[5] = v16;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 1107296256;
  v19[2] = sub_1C1291038;
  v19[3] = &block_descriptor_196;
  v17 = _Block_copy(v19);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C12B2DC4(a1, a2, a3);
  swift_retain();
  swift_release();
  dispatch_sync(v14, v17);
  _Block_release(v17);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v14 & 1) != 0)
    __break(1u);
  return result;
}

void sub_1C12AA5C8(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, char a6, uint64_t *a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41[3];

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C1288FB0(a2, a3);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = sub_1C12B5324();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C1283668((uint64_t)v16, a2, a3);
  swift_endAccess();
  if ((a6 & 1) != 0)
  {
    v18 = a4;
    if (qword_1ED78E810 != -1)
      swift_once();
    v19 = sub_1C12B5390();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED78DC40);
    sub_1C12B2DC4(a4, a5, 1);
    swift_retain();
    sub_1C12B2DC4(a4, a5, 1);
    swift_retain();
    v20 = sub_1C12B5384();
    v21 = sub_1C12B5534();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v41[0] = v23;
      *(_DWORD *)v22 = 136380931;
      v24 = a1[26];
      v38 = v23;
      v39 = a7;
      if (v24)
      {
        v25 = a1[25];
        v26 = v24;
      }
      else
      {
        v27 = IDSCopyLocalDeviceUniqueID();
        if (v27)
        {
          v28 = (void *)v27;
          v25 = sub_1C12B5480();
          v26 = v29;

        }
        else
        {
          v26 = 0x80000001C12BAE80;
          v25 = 0xD000000000000017;
        }
      }
      swift_bridgeObjectRetain();
      v40 = sub_1C12882D0(v25, v26, v41);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      v40 = (uint64_t)a4;
      v30 = a4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41E0);
      v31 = sub_1C12B5498();
      v40 = sub_1C12882D0(v31, v32, v41);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      sub_1C1293154(a4, a5, 1);
      sub_1C1293154(a4, a5, 1);
      _os_log_impl(&dword_1C127A000, v20, v21, "(%{private}s) Error sending record modifications: %s", (uint8_t *)v22, 0x16u);
      v33 = v38;
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v33, -1, -1);
      MEMORY[0x1C3BA9870](v22, -1, -1);

      a7 = v39;
    }
    else
    {
      swift_release_n();
      sub_1C1293154(a4, a5, 1);
      sub_1C1293154(a4, a5, 1);

    }
    v34 = a1[23];
    swift_beginAccess();
    v35 = *a7;
    if (*(_QWORD *)(v35 + 16) <= *(_QWORD *)(v34 + 16) >> 3)
    {
      v40 = v34;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1C12B0418(v35);
      swift_bridgeObjectRelease();
      v37 = v40;
    }
    else
    {
      swift_bridgeObjectRetain();
      v36 = swift_bridgeObjectRetain();
      v37 = sub_1C12B09BC(v36, v34);
      swift_bridgeObjectRelease();
    }
    a1[23] = v37;
    swift_bridgeObjectRelease();
    sub_1C12AAA24();
    sub_1C1293154(a4, a5, 1);
  }
}

void sub_1C12AAA24()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  void (*v13)(id, uint64_t (*)(char), _QWORD *, uint64_t, uint64_t);
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  os_log_type_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0;
  v2 = sub_1C12B542C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (void *)v1[15];
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF740], v2);
  v7 = v6;
  v8 = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  v9 = v1[13];
  v10 = v1[14];
  __swift_project_boxed_opaque_existential_1(v1 + 10, v9);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10) & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v14 = sub_1C12B5390();
    __swift_project_value_buffer(v14, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v15 = sub_1C12B5384();
    v16 = sub_1C12B5534();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v34 = v18;
      *(_DWORD *)v17 = 136380675;
      if (v1[26])
      {
        v19 = v1[25];
        v20 = v1[26];
      }
      else
      {
        v25 = IDSCopyLocalDeviceUniqueID();
        if (v25)
        {
          v26 = (void *)v25;
          v19 = sub_1C12B5480();
          v20 = v27;

        }
        else
        {
          v19 = 0xD000000000000017;
          v20 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v33 = sub_1C12882D0(v19, v20, &v34);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v31 = v16;
      v32 = "(%{private}s) Will not set retry timer because keybag is locked";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  v2 = v1[31];
  if (qword_1ED78DCC8 != -1)
    goto LABEL_27;
LABEL_4:
  if ((qword_1ED78DCC0 & ~v2) == 0)
  {
    v11 = v1[17];
    ObjectType = swift_getObjectType();
    v13 = *(void (**)(id, uint64_t (*)(char), _QWORD *, uint64_t, uint64_t))(v11 + 8);
    swift_retain();
    v13(v7, sub_1C12B2DD4, v1, ObjectType, v11);
    swift_release();
    return;
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v21 = sub_1C12B5390();
  __swift_project_value_buffer(v21, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v15 = sub_1C12B5384();
  v22 = sub_1C12B5534();
  if (!os_log_type_enabled(v15, v22))
    goto LABEL_16;
  v17 = (uint8_t *)swift_slowAlloc();
  v18 = swift_slowAlloc();
  v34 = v18;
  *(_DWORD *)v17 = 136380675;
  if (v1[26])
  {
    v23 = v1[25];
    v24 = v1[26];
  }
  else
  {
    v28 = IDSCopyLocalDeviceUniqueID();
    if (v28)
    {
      v29 = (void *)v28;
      v23 = sub_1C12B5480();
      v24 = v30;

    }
    else
    {
      v23 = 0xD000000000000017;
      v24 = 0x80000001C12BAE80;
    }
  }
  swift_bridgeObjectRetain();
  v33 = sub_1C12882D0(v23, v24, &v34);
  sub_1C12B55DC();
  swift_release_n();
  swift_bridgeObjectRelease();
  v31 = v22;
  v32 = "(%{private}s) Will not set retry timer because sync is inactive";
LABEL_25:
  _os_log_impl(&dword_1C127A000, v15, v31, v32, v17, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v18, -1, -1);
  MEMORY[0x1C3BA9870](v17, -1, -1);

}

uint64_t sub_1C12AAE8C(uint64_t a1)
{
  char *v1;
  char *v2;
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
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  _BOOL4 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  char *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  char **v56;
  uint64_t v57;
  char **v58;
  char *v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  unint64_t v81;
  char v82;
  char v83;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v85;
  uint64_t *v86;
  unint64_t v87;
  char v88;
  char v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(char *, uint64_t);
  void (*v109)(char *, uint64_t, uint64_t);
  char *v110;
  _QWORD *v111;
  char **v112;
  char **v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122[4];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DBF8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D44B0);
  v7 = MEMORY[0x1E0C80A78](v114);
  v113 = (char **)((char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x1E0C80A78](v7);
  v112 = (char **)((char *)&v99 - v10);
  v11 = MEMORY[0x1E0C80A78](v9);
  v111 = (uint64_t *)((char *)&v99 - v12);
  MEMORY[0x1E0C80A78](v11);
  v110 = (char *)&v99 - v13;
  v14 = sub_1C12B5324();
  v15 = *(_QWORD **)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1C12B542C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (uint64_t *)((char *)&v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = (void *)*((_QWORD *)v2 + 15);
  *v21 = v22;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E0DEF740], v18);
  v23 = v22;
  LOBYTE(v22) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v19 + 8))(v21, v18);
  if ((v22 & 1) == 0)
    goto LABEL_66;
  if (qword_1ED78E810 != -1)
LABEL_67:
    swift_once();
  v24 = sub_1C12B5390();
  __swift_project_value_buffer(v24, (uint64_t)qword_1ED78DC40);
  v109 = (void (*)(char *, uint64_t, uint64_t))v15[2];
  v109(v17, a1, v14);
  swift_retain_n();
  v25 = sub_1C12B5384();
  v26 = sub_1C12B5540();
  v27 = os_log_type_enabled(v25, (os_log_type_t)v26);
  v116 = v14;
  if (v27)
  {
    v118 = a1;
    v14 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v122[0] = v28;
    *(_DWORD *)v14 = 136380931;
    v29 = *((_QWORD *)v2 + 26);
    LODWORD(v117) = v26;
    v115 = (_QWORD *)v28;
    if (v29)
    {
      v30 = *((_QWORD *)v2 + 25);
      v31 = v29;
    }
    else
    {
      v32 = IDSCopyLocalDeviceUniqueID();
      if (v32)
      {
        v33 = (void *)v32;
        v30 = sub_1C12B5480();
        v31 = v34;

      }
      else
      {
        v31 = 0x80000001C12BAE80;
        v30 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    v121 = sub_1C12882D0(v30, v31, v122);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    sub_1C127F22C((unint64_t *)&qword_1ED78DBF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
    v35 = v116;
    v36 = sub_1C12B5780();
    v121 = sub_1C12882D0(v36, v37, v122);
    sub_1C12B55DC();
    swift_bridgeObjectRelease();
    v108 = (void (*)(char *, uint64_t))v15[1];
    v108(v17, v35);
    _os_log_impl(&dword_1C127A000, v25, (os_log_type_t)v117, "(%{private}s) Removing all inflight metadata before %{public}s", (uint8_t *)v14, 0x16u);
    v38 = v115;
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v38, -1, -1);
    MEMORY[0x1C3BA9870](v14, -1, -1);

    a1 = v118;
  }
  else
  {
    swift_release_n();
    v108 = (void (*)(char *, uint64_t))v15[1];
    v108(v17, v14);

  }
  v101 = (uint64_t *)(v2 + 176);
  v39 = swift_beginAccess();
  MEMORY[0x1E0C80A78](v39);
  *(&v99 - 2) = (uint64_t)v2;
  *(&v99 - 1) = a1;
  v40 = swift_bridgeObjectRetain();
  v41 = sub_1C12B35C0(v40, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1C12B2DE4, (uint64_t)(&v99 - 4));
  swift_bridgeObjectRelease();
  v17 = *(char **)(v41 + 16);
  v103 = v2;
  v115 = v15;
  v102 = v6;
  if (v17)
  {
    v121 = MEMORY[0x1E0DEE9D8];
    sub_1C128C968(0, (int64_t)v17, 0);
    v42 = sub_1C12B1988(v41);
    if (v42 < 0)
      goto LABEL_65;
    v14 = v42;
    if (v42 >= 1 << *(_BYTE *)(v41 + 32))
      goto LABEL_65;
    v44 = 0;
    v45 = v41 + 64;
    v100 = v41 + 80;
    v107 = v41;
    v104 = v17;
    v105 = v43;
    v106 = v41 + 64;
    v2 = (char *)v109;
    while (1)
    {
      a1 = (unint64_t)v14 >> 6;
      if ((*(_QWORD *)(v45 + 8 * ((unint64_t)v14 >> 6)) & (1 << v14)) == 0)
      {
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      if (*(_DWORD *)(v41 + 36) != (_DWORD)v43)
        goto LABEL_61;
      v117 = v44;
      v118 = 1 << v14;
      v46 = v114;
      v47 = v110;
      v48 = &v110[*(int *)(v114 + 48)];
      v49 = *(_QWORD *)(v41 + 56);
      v50 = (uint64_t *)(*(_QWORD *)(v41 + 48) + 16 * v14);
      v52 = *v50;
      v51 = v50[1];
      v53 = v116;
      ((void (*)(char *, uint64_t, uint64_t))v2)(v48, v49 + v15[9] * v14, v116);
      *v47 = v52;
      v47[1] = v51;
      v54 = v111;
      *v111 = v52;
      v54[1] = v51;
      ((void (*)(char *, char *, uint64_t))v2)((char *)v54 + *(int *)(v46 + 48), v48, v53);
      v55 = (uint64_t)v54;
      v56 = v112;
      v15 = &unk_1EF6D44B0;
      sub_1C128E330(v55, (uint64_t)v112, (uint64_t *)&unk_1EF6D44B0);
      swift_bridgeObjectRetain_n();
      sub_1C128E2B0((uint64_t)v47, (uint64_t *)&unk_1EF6D44B0);
      v57 = *(int *)(v46 + 48);
      v58 = v113;
      v59 = (char *)v113 + v57;
      v6 = *v56;
      v60 = v56[1];
      *v113 = *v56;
      v58[1] = v60;
      ((void (*)(char *, char *, uint64_t))v2)((char *)v58 + v57, (char *)v56 + v57, v53);
      swift_bridgeObjectRetain();
      v108(v59, v53);
      sub_1C128E2B0((uint64_t)v56, (uint64_t *)&unk_1EF6D44B0);
      v61 = v121;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C128C968(0, *(_QWORD *)(v61 + 16) + 1, 1);
        v61 = v121;
      }
      v63 = *(_QWORD *)(v61 + 16);
      v62 = *(_QWORD *)(v61 + 24);
      v17 = (char *)(v63 + 1);
      if (v63 >= v62 >> 1)
      {
        sub_1C128C968(v62 > 1, v63 + 1, 1);
        v61 = v121;
      }
      *(_QWORD *)(v61 + 16) = v17;
      v64 = v61 + 16 * v63;
      *(_QWORD *)(v64 + 32) = v6;
      *(_QWORD *)(v64 + 40) = v60;
      v41 = v107;
      v65 = 1 << *(_BYTE *)(v107 + 32);
      if (v14 >= v65)
        goto LABEL_62;
      v45 = v106;
      v66 = *(_QWORD *)(v106 + 8 * a1);
      if ((v66 & v118) == 0)
        goto LABEL_63;
      LODWORD(v43) = v105;
      if (*(_DWORD *)(v107 + 36) != (_DWORD)v105)
        goto LABEL_64;
      v67 = v66 & (-2 << (v14 & 0x3F));
      if (v67)
      {
        v14 = __clz(__rbit64(v67)) | v14 & 0xFFFFFFFFFFFFFFC0;
        v15 = v115;
        v17 = v104;
        goto LABEL_33;
      }
      v68 = a1 + 1;
      v69 = (unint64_t)(v65 + 63) >> 6;
      v15 = v115;
      v17 = v104;
      if (a1 + 1 < v69)
      {
        v70 = *(_QWORD *)(v106 + 8 * v68);
        if (v70)
        {
LABEL_31:
          v14 = __clz(__rbit64(v70)) + (v68 << 6);
          goto LABEL_33;
        }
        while (v69 - 2 != a1)
        {
          v70 = *(_QWORD *)(v100 + 8 * a1++);
          if (v70)
          {
            v68 = a1 + 1;
            goto LABEL_31;
          }
        }
      }
      v14 = 1 << *(_BYTE *)(v107 + 32);
LABEL_33:
      v44 = (uint64_t *)((char *)v117 + 1);
      if ((char *)v117 + 1 == v17)
      {
        swift_release();
        v2 = v103;
        goto LABEL_39;
      }
      if (v14 < 0 || v14 >= v65)
        goto LABEL_65;
    }
  }
  swift_release();
  v61 = MEMORY[0x1E0DEE9D8];
LABEL_39:
  v114 = v61;
  v71 = *(_QWORD *)(v61 + 16);
  if (v71)
  {
    v72 = (uint64_t *)(v2 + 168);
    swift_beginAccess();
    v73 = (uint64_t *)(v114 + 40);
    v117 = v72;
    v74 = v103;
    v75 = (uint64_t)v102;
    do
    {
      v76 = *v72;
      if (*(_QWORD *)(*v72 + 16))
      {
        v78 = *(v73 - 1);
        v77 = *v73;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v79 = sub_1C128939C(v78, v77);
        if ((v80 & 1) != 0)
        {
          v118 = *(_QWORD *)(*(_QWORD *)(v76 + 56) + 8 * v79);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v81 = sub_1C128939C(v78, v77);
          v83 = v82;
          swift_bridgeObjectRelease();
          if ((v83 & 1) != 0)
          {
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v85 = *v72;
            v119 = *v72;
            *v72 = 0x8000000000000000;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_1C128C264();
              v85 = v119;
            }
            swift_bridgeObjectRelease();
            sub_1C128AC7C(v81, v85);
            *v72 = v85;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          swift_endAccess();
          v86 = v101;
          swift_beginAccess();
          swift_bridgeObjectRetain();
          v87 = sub_1C128939C(v78, v77);
          v89 = v88;
          swift_bridgeObjectRelease();
          if ((v89 & 1) != 0)
          {
            v90 = swift_isUniquelyReferenced_nonNull_native();
            v91 = *v86;
            v119 = *v86;
            *v86 = 0x8000000000000000;
            if (!v90)
            {
              sub_1C128C008();
              v91 = v119;
            }
            swift_bridgeObjectRelease();
            v93 = v115;
            v92 = v116;
            ((void (*)(uint64_t, unint64_t, uint64_t))v115[4])(v75, *(_QWORD *)(v91 + 56) + v115[9] * v87, v116);
            sub_1C128AA80(v87, v91);
            *v86 = v91;
            swift_bridgeObjectRelease();
            v94 = 0;
          }
          else
          {
            v94 = 1;
            v93 = v115;
            v92 = v116;
          }
          ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v93[7])(v75, v94, 1, v92);
          swift_bridgeObjectRelease();
          sub_1C128E2B0(v75, &qword_1ED78DBF8);
          swift_endAccess();
          v95 = *((_QWORD *)v74 + 23);
          v72 = v117;
          v96 = v118;
          if (*(_QWORD *)(v118 + 16) <= *(_QWORD *)(v95 + 16) >> 3)
          {
            v120 = *((_QWORD *)v74 + 23);
            swift_bridgeObjectRetain();
            sub_1C12B0418(v96);
            swift_bridgeObjectRelease();
            v97 = v120;
          }
          else
          {
            swift_bridgeObjectRetain();
            v97 = sub_1C12B09BC(v96, v95);
            swift_bridgeObjectRelease();
          }
          *((_QWORD *)v74 + 23) = v97;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      v73 += 2;
      --v71;
    }
    while (v71);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C12AB964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v6;

  v0 = sub_1C12B5324();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C12B52C4();
  v4 = sub_1C12B52DC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t sub_1C12ABA0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  char v44;
  void (*v45)(char *, uint64_t);
  _QWORD v46[2];
  uint64_t v47;
  int64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  int64_t v53;

  v46[1] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D44C8);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v46 - v6;
  v8 = sub_1C12B5324();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v52 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v46 - v12;
  v14 = sub_1C12B542C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (_QWORD *)((char *)v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = *(void **)(v1 + 120);
  *v17 = v18;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x1E0DEF740], v14);
  v19 = v18;
  LOBYTE(v18) = sub_1C12B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) == 0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  sub_1C12B52B8();
  swift_beginAccess();
  v21 = *(_QWORD *)(v1 + 176);
  v22 = *(_QWORD *)(v21 + 64);
  v47 = v21 + 64;
  v23 = 1 << *(_BYTE *)(v21 + 32);
  v24 = -1;
  if (v23 < 64)
    v24 = ~(-1 << v23);
  v25 = v24 & v22;
  v48 = (unint64_t)(v23 + 63) >> 6;
  v46[0] = v48 - 1;
  v51 = v21;
  result = swift_bridgeObjectRetain();
  v53 = 0;
  v26 = (uint64_t *)&unk_1EF6D44B0;
  v49 = v13;
  v50 = v1;
  v27 = v13;
  if (!v25)
    goto LABEL_9;
LABEL_7:
  v28 = __clz(__rbit64(v25));
  v25 &= v25 - 1;
  v29 = v28 | (v53 << 6);
  while (2)
  {
    v30 = *(_QWORD *)(v51 + 56);
    v31 = (_QWORD *)(*(_QWORD *)(v51 + 48) + 16 * v29);
    v32 = v31[1];
    *(_QWORD *)v5 = *v31;
    *((_QWORD *)v5 + 1) = v32;
    v33 = v30 + *(_QWORD *)(v9 + 72) * v29;
    v34 = __swift_instantiateConcreteTypeFromMangledName(v26);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(&v5[*(int *)(v34 + 48)], v33, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v5, 0, 1, v34);
    swift_bridgeObjectRetain();
    v27 = v49;
    while (1)
    {
      sub_1C128E330((uint64_t)v5, (uint64_t)v7, &qword_1EF6D44C8);
      v39 = v26;
      v40 = __swift_instantiateConcreteTypeFromMangledName(v26);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 48))(v7, 1, v40) == 1)
      {
        swift_release();
        sub_1C12B52C4();
        return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v27, v8);
      }
      swift_bridgeObjectRelease();
      v41 = &v7[*(int *)(v40 + 48)];
      v42 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v43 = v52;
      v42(v52, v41, v8);
      v44 = sub_1C12B52DC();
      v45 = *(void (**)(char *, uint64_t))(v9 + 8);
      if ((v44 & 1) != 0)
      {
        v45(v27, v8);
        result = ((uint64_t (*)(char *, char *, uint64_t))v42)(v27, v43, v8);
        v26 = v39;
        if (v25)
          goto LABEL_7;
      }
      else
      {
        result = ((uint64_t (*)(char *, uint64_t))v45)(v43, v8);
        v26 = v39;
        if (v25)
          goto LABEL_7;
      }
LABEL_9:
      v35 = v53 + 1;
      if (__OFADD__(v53, 1))
      {
        __break(1u);
        goto LABEL_33;
      }
      if (v35 < v48)
      {
        v36 = *(_QWORD *)(v47 + 8 * v35);
        if (v36)
          goto LABEL_12;
        v37 = v53 + 2;
        ++v53;
        if (v35 + 1 < v48)
        {
          v36 = *(_QWORD *)(v47 + 8 * v37);
          if (v36)
            goto LABEL_15;
          v53 = v35 + 1;
          if (v35 + 2 < v48)
          {
            v36 = *(_QWORD *)(v47 + 8 * (v35 + 2));
            if (v36)
            {
              v35 += 2;
              goto LABEL_12;
            }
            v37 = v35 + 3;
            v53 = v35 + 2;
            if (v35 + 3 < v48)
              break;
          }
        }
      }
LABEL_26:
      v38 = __swift_instantiateConcreteTypeFromMangledName(v26);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v5, 1, 1, v38);
      v25 = 0;
    }
    v36 = *(_QWORD *)(v47 + 8 * v37);
    if (v36)
    {
LABEL_15:
      v35 = v37;
LABEL_12:
      v25 = (v36 - 1) & v36;
      v29 = __clz(__rbit64(v36)) + (v35 << 6);
      v53 = v35;
      continue;
    }
    break;
  }
  while (1)
  {
    v35 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v35 >= v48)
    {
      v53 = v46[0];
      goto LABEL_26;
    }
    v36 = *(_QWORD *)(v47 + 8 * v35);
    ++v37;
    if (v36)
      goto LABEL_12;
  }
LABEL_34:
  __break(1u);
  return result;
}

void sub_1C12ABE7C()
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
  char *v10;
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
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  os_log_type_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;
  unint64_t v61;
  os_log_type_t v62;
  const char *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t, uint64_t);
  void (*v72)(char *, uint64_t);
  uint64_t ObjectType;
  char *v74;
  void *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  id v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t aBlock[6];
  uint64_t v99;

  v1 = v0;
  v2 = sub_1C12B53E4();
  v91 = *(_QWORD *)(v2 - 8);
  v92 = v2;
  MEMORY[0x1E0C80A78](v2);
  v90 = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C12B5408();
  v88 = *(_QWORD *)(v4 - 8);
  v89 = v4;
  MEMORY[0x1E0C80A78](v4);
  v87 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C12B53D8();
  v85 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x1E0C80A78](v6);
  v86 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v78 - v9;
  v96 = sub_1C12B5420();
  v84 = *(_QWORD *)(v96 - 8);
  v11 = MEMORY[0x1E0C80A78](v96);
  v95 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v93 = (char *)&v78 - v13;
  v14 = sub_1C12B5594();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_1C12B5324();
  v82 = *(_QWORD *)(v83 - 8);
  MEMORY[0x1E0C80A78](v83);
  v97 = (uint64_t)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1C12B542C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v22 = (uint64_t *)((char *)&v78 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = (void *)v1[15];
  *v22 = v23;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v20 + 104))(v22, *MEMORY[0x1E0DEF740], v19);
  v94 = v23;
  LOBYTE(v23) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v20 + 8))(v22, v19);
  if ((v23 & 1) == 0)
  {
    __break(1u);
LABEL_51:
    swift_once();
LABEL_13:
    v35 = sub_1C12B5390();
    __swift_project_value_buffer(v35, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v36 = sub_1C12B5384();
    v37 = sub_1C12B5540();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      aBlock[0] = v39;
      *(_DWORD *)v38 = 136380675;
      if (v1[26])
      {
        v40 = v1[25];
        v41 = v1[26];
      }
      else
      {
        v50 = IDSCopyLocalDeviceUniqueID();
        if (v50)
        {
          v51 = (void *)v50;
          v40 = sub_1C12B5480();
          v41 = v52;

        }
        else
        {
          v40 = 0xD000000000000017;
          v41 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v99 = sub_1C12882D0(v40, v41, aBlock);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v62 = v37;
      v63 = "(%{private}s) No inflight metadata; will not start expiration timer";
      goto LABEL_49;
    }
    goto LABEL_26;
  }
  if (!*(_QWORD *)(v1[23] + 16))
  {
    if (qword_1ED78E810 == -1)
      goto LABEL_13;
    goto LABEL_51;
  }
  v24 = v1[13];
  v25 = v1[14];
  __swift_project_boxed_opaque_existential_1(v1 + 10, v24);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v25 + 16))(v24, v25) & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v42 = sub_1C12B5390();
    __swift_project_value_buffer(v42, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v36 = sub_1C12B5384();
    v43 = sub_1C12B5540();
    if (os_log_type_enabled(v36, v43))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      aBlock[0] = v39;
      *(_DWORD *)v38 = 136380675;
      if (v1[26])
      {
        v44 = v1[25];
        v45 = v1[26];
      }
      else
      {
        v53 = IDSCopyLocalDeviceUniqueID();
        if (v53)
        {
          v54 = (void *)v53;
          v44 = sub_1C12B5480();
          v45 = v55;

        }
        else
        {
          v44 = 0xD000000000000017;
          v45 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v99 = sub_1C12882D0(v44, v45, aBlock);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v62 = v43;
      v63 = "(%{private}s) Will not set expiration timer because keybag is locked";
      goto LABEL_49;
    }
LABEL_26:

    swift_release_n();
    return;
  }
  v26 = v1[31];
  if (qword_1ED78DCC8 != -1)
    swift_once();
  if ((qword_1ED78DCC0 & ~v26) != 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v46 = sub_1C12B5390();
    __swift_project_value_buffer(v46, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v36 = sub_1C12B5384();
    v47 = sub_1C12B5540();
    if (os_log_type_enabled(v36, v47))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      aBlock[0] = v39;
      *(_DWORD *)v38 = 136380675;
      if (v1[26])
      {
        v48 = v1[25];
        v49 = v1[26];
      }
      else
      {
        v59 = IDSCopyLocalDeviceUniqueID();
        if (v59)
        {
          v60 = (void *)v59;
          v48 = sub_1C12B5480();
          v49 = v61;

        }
        else
        {
          v48 = 0xD000000000000017;
          v49 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v99 = sub_1C12882D0(v48, v49, aBlock);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v62 = v47;
      v63 = "(%{private}s) Will not set expiration timer because sync is inactive";
LABEL_49:
      _os_log_impl(&dword_1C127A000, v36, v62, v63, v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v39, -1, -1);
      MEMORY[0x1C3BA9870](v38, -1, -1);

      return;
    }
    goto LABEL_26;
  }
  sub_1C12ABA0C(v97);
  sub_1C12B52E8();
  v28 = v27;
  if (qword_1ED78E810 != -1)
    swift_once();
  v29 = sub_1C12B5390();
  __swift_project_value_buffer(v29, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v30 = sub_1C12B5384();
  v31 = sub_1C12B5540();
  v81 = v30;
  if (os_log_type_enabled(v30, (os_log_type_t)v31))
  {
    v80 = v31;
    v32 = swift_slowAlloc();
    v79 = swift_slowAlloc();
    aBlock[0] = v79;
    *(_DWORD *)v32 = 136380931;
    v33 = v1[26];
    if (v33)
    {
      v78 = v1[25];
      v34 = v33;
    }
    else
    {
      v56 = IDSCopyLocalDeviceUniqueID();
      if (v56)
      {
        v57 = (void *)v56;
        v78 = sub_1C12B5480();
        v34 = v58;

      }
      else
      {
        v78 = 0xD000000000000017;
        v34 = 0x80000001C12BAE80;
      }
    }
    swift_bridgeObjectRetain();
    v99 = sub_1C12882D0(v78, v34, aBlock);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2048;
    v99 = *(_QWORD *)&v28;
    sub_1C12B55DC();
    v64 = v81;
    _os_log_impl(&dword_1C127A000, v81, (os_log_type_t)v80, "(%{private}s) Expiration timer will fire in %fs", (uint8_t *)v32, 0x16u);
    v65 = v79;
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v65, -1, -1);
    MEMORY[0x1C3BA9870](v32, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  sub_1C1292D18(0, (unint64_t *)&qword_1EF6D4488);
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1C127F22C((unint64_t *)&qword_1EF6D4490, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF938], MEMORY[0x1E0DEF948]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4498);
  sub_1C1296E30((unint64_t *)&qword_1EF6D44A0, &qword_1EF6D4498, MEMORY[0x1E0DEAF38]);
  sub_1C12B5600();
  v66 = sub_1C12B55A0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v67 = v95;
  sub_1C12B5414();
  if ((~*(_QWORD *)&v28 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_53;
  }
  v68 = v93;
  if (v28 <= -9.22337204e18)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  if (v28 < 9.22337204e18)
  {
    *(_QWORD *)v10 = (uint64_t)v28;
    v69 = *MEMORY[0x1E0DEF4A0];
    v70 = v85;
    v71 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 104);
    v71(v10, v69, v6);
    MEMORY[0x1C3BA9024](v67, v10);
    v72 = *(void (**)(char *, uint64_t))(v70 + 8);
    v72(v10, v6);
    v95 = *(char **)(v84 + 8);
    ((void (*)(char *, uint64_t))v95)(v67, v96);
    ObjectType = swift_getObjectType();
    *(_QWORD *)v10 = 10;
    v71(v10, v69, v6);
    v74 = v86;
    v71(v86, *MEMORY[0x1E0DEF498], v6);
    MEMORY[0x1C3BA91BC](v68, v74, v10, ObjectType);
    v72(v74, v6);
    v72(v10, v6);
    aBlock[4] = (uint64_t)sub_1C12B2DDC;
    aBlock[5] = (uint64_t)v1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C12906E8;
    aBlock[3] = (uint64_t)&block_descriptor_199;
    v75 = _Block_copy(aBlock);
    swift_retain();
    v76 = v87;
    sub_1C12B53F0();
    v77 = v90;
    sub_1C12ACE40();
    sub_1C12B55AC();
    _Block_release(v75);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v77, v92);
    (*(void (**)(char *, uint64_t))(v88 + 8))(v76, v89);
    swift_release();
    v1[19] = v66;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    if (v1[19])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1C12B55C4();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      ((void (*)(char *, uint64_t))v95)(v68, v96);
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v97, v83);
      return;
    }
    goto LABEL_55;
  }
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
}

uint64_t sub_1C12ACAFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0DEF498];
  v3 = sub_1C12B53D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_1C12ACB40(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t result;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v2 = sub_1C12B5324();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C12B542C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (void *)a1[15];
  *v9 = v10;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF740], v6);
  v11 = v10;
  LOBYTE(v10) = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    if (qword_1ED78E810 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v12 = sub_1C12B5390();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v13 = sub_1C12B5384();
  v14 = sub_1C12B5540();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v29 = v16;
    *(_DWORD *)v15 = 136380675;
    v17 = a1[26];
    v26 = v3;
    v27 = v2;
    if (v17)
    {
      v18 = a1[25];
      v19 = v17;
    }
    else
    {
      v20 = IDSCopyLocalDeviceUniqueID();
      if (v20)
      {
        v21 = (void *)v20;
        v18 = sub_1C12B5480();
        v19 = v22;

      }
      else
      {
        v19 = 0x80000001C12BAE80;
        v18 = 0xD000000000000017;
      }
    }
    swift_bridgeObjectRetain();
    v28 = sub_1C12882D0(v18, v19, &v29);
    sub_1C12B55DC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C127A000, v13, v14, "(%{private}s) Expiration timer fired", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BA9870](v16, -1, -1);
    MEMORY[0x1C3BA9870](v15, -1, -1);

    v3 = v26;
    v2 = v27;
  }
  else
  {

    swift_release_n();
  }
  sub_1C12A64D0();
  sub_1C12B530C();
  sub_1C12AAE8C((uint64_t)v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v24 = (void (*)(uint64_t))a1[36];
  if (v24)
  {
    v25 = swift_retain();
    v24(v25);
    return sub_1C1293164((uint64_t)v24);
  }
  return result;
}

uint64_t sub_1C12ACE40()
{
  sub_1C12B53E4();
  sub_1C127F22C((unint64_t *)&unk_1ED78E840, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78DC70);
  sub_1C1296E30((unint64_t *)&unk_1ED78E850, (uint64_t *)&unk_1ED78DC70, MEMORY[0x1E0DEAF38]);
  return sub_1C12B5600();
}

uint64_t sub_1C12ACEF4(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  id v11;
  uint64_t (*v12)(_QWORD *, uint64_t);
  uint64_t result;
  void (*v14)(uint64_t);
  uint64_t v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t ObjectType;
  os_unfair_lock_s *v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  char v27;

  v4 = sub_1C12B542C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)(a2 + 120);
  *v7 = v8;
  v9 = *MEMORY[0x1E0DEF740];
  v10 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v5 + 104);
  v10(v7, v9, v4);
  v11 = v8;
  LOBYTE(v8) = sub_1C12B5444();
  v12 = *(uint64_t (**)(_QWORD *, uint64_t))(v5 + 8);
  result = v12(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v14 = *(void (**)(uint64_t))(a2 + 304);
  if (v14)
  {
    v15 = swift_retain();
    v14(v15);
    sub_1C1293164((uint64_t)v14);
  }
  v16 = *(void (**)(uint64_t))(a2 + 320);
  if (v16 && (a1 & 1) != 0)
  {
    v17 = swift_retain();
    v16(v17);
    sub_1C1293164((uint64_t)v16);
  }
  *v7 = v11;
  v10(v7, v9, v4);
  v18 = v11;
  v19 = sub_1C12B5444();
  result = v12(v7, v4);
  if ((v19 & 1) == 0)
    goto LABEL_12;
  v20 = *(_QWORD *)(a2 + 136);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v20 + 16))(ObjectType, v20);
  v22 = *(os_unfair_lock_s **)(*(_QWORD *)(a2 + 216) + 16);
  swift_retain();
  os_unfair_lock_lock(v22);
  v23 = *(_QWORD *)(a2 + 224);
  v24 = *(_QWORD *)(a2 + 232);
  v25 = *(_WORD *)(a2 + 240);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v22);
  result = swift_release();
  if (v24)
  {
    v27 = HIBYTE(v25) & 1;
    swift_bridgeObjectRetain();
    sub_1C129E3F8(v23, v24, &v27);
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

void sub_1C12AD0D0(uint64_t *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  void (*v35)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), _QWORD *, uint64_t, uint64_t);
  uint64_t v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  os_log_type_t v42;
  const char *v43;
  uint64_t ObjectType;
  _QWORD v45[2];
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v2 = v1;
  v4 = sub_1C12B542C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (_QWORD *)((char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 48);
  v9 = *a1;
  v8 = a1[1];
  v10 = *((_BYTE *)a1 + 17);
  v11 = (void *)v2[15];
  *v7 = v11;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF740], v4);
  v12 = v11;
  v13 = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  v14 = v2[13];
  v15 = v2[14];
  __swift_project_boxed_opaque_existential_1(v2 + 10, v14);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15) & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v16 = sub_1C12B5390();
    __swift_project_value_buffer(v16, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v17 = sub_1C12B5384();
    v18 = sub_1C12B5540();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v48 = v20;
      *(_DWORD *)v19 = 136380675;
      if (v2[26])
      {
        v21 = v2[25];
        v22 = v2[26];
      }
      else
      {
        v36 = IDSCopyLocalDeviceUniqueID();
        if (v36)
        {
          v37 = (void *)v36;
          v21 = sub_1C12B5480();
          v22 = v38;

        }
        else
        {
          v21 = 0xD000000000000017;
          v22 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v45[0] = sub_1C12882D0(v21, v22, &v48);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v42 = v18;
      v43 = "(%{private}s) Will not send unlock message because keybag is locked";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  v13 = v2[31];
  if (qword_1ED78DCC8 != -1)
    goto LABEL_27;
LABEL_4:
  if ((qword_1ED78DCC0 & ~v13) == 0)
  {
    v47 = v10;
    v45[0] = 0;
    v45[1] = 0;
    v46 = 3;
    sub_1C12AA110(&v47, (uint64_t)v45, (uint64_t)&v48);
    v27 = v48;
    v29 = v49;
    v28 = v50;
    v30 = v51;
    v31 = v52;
    v32 = v2[4];
    ObjectType = swift_getObjectType();
    LOBYTE(v48) = v27;
    v49 = v29;
    v50 = v28;
    v51 = v30;
    v52 = v31;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4200);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C12B7860;
    *(_QWORD *)(inited + 32) = v9;
    *(_QWORD *)(inited + 40) = v8;
    swift_bridgeObjectRetain();
    v34 = sub_1C1291F38(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    v35 = *(void (**)(uint64_t *, uint64_t, void (*)(void *, uint64_t, char), _QWORD *, uint64_t, uint64_t))(v32 + 24);
    swift_retain();
    v35(&v48, v34, sub_1C12B3930, v2, ObjectType, v32);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C127CE8C(v30, v31);
    return;
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v23 = sub_1C12B5390();
  __swift_project_value_buffer(v23, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v17 = sub_1C12B5384();
  v24 = sub_1C12B5540();
  if (!os_log_type_enabled(v17, v24))
    goto LABEL_16;
  v19 = (uint8_t *)swift_slowAlloc();
  v20 = swift_slowAlloc();
  v48 = v20;
  *(_DWORD *)v19 = 136380675;
  if (v2[26])
  {
    v25 = v2[25];
    v26 = v2[26];
  }
  else
  {
    v39 = IDSCopyLocalDeviceUniqueID();
    if (v39)
    {
      v40 = (void *)v39;
      v25 = sub_1C12B5480();
      v26 = v41;

    }
    else
    {
      v25 = 0xD000000000000017;
      v26 = 0x80000001C12BAE80;
    }
  }
  swift_bridgeObjectRetain();
  v45[0] = sub_1C12882D0(v25, v26, &v48);
  sub_1C12B55DC();
  swift_release_n();
  swift_bridgeObjectRelease();
  v42 = v24;
  v43 = "(%{private}s) Will not send unlock message because sync is inactive";
LABEL_25:
  _os_log_impl(&dword_1C127A000, v17, v42, v43, v19, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v20, -1, -1);
  MEMORY[0x1C3BA9870](v19, -1, -1);

}

void sub_1C12AD758(void *a1, uint64_t a2, char a3, uint64_t a4, const char *a5, const char *a6)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  NSObject *oslog;
  uint64_t v36;

  if ((a3 & 1) != 0)
  {
    v18 = a1;
    if (qword_1ED78E810 != -1)
      swift_once();
    v19 = sub_1C12B5390();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED78DC40);
    sub_1C12B2DC4(a1, a2, 1);
    swift_retain();
    sub_1C12B2DC4(a1, a2, 1);
    swift_retain();
    oslog = sub_1C12B5384();
    v20 = sub_1C12B5534();
    if (os_log_type_enabled(oslog, v20))
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v36 = v22;
      *(_DWORD *)v21 = 136380931;
      v34 = a5;
      if (*(_QWORD *)(a4 + 208))
      {
        v23 = *(_QWORD *)(a4 + 200);
        v24 = *(_QWORD *)(a4 + 208);
      }
      else
      {
        v28 = IDSCopyLocalDeviceUniqueID();
        if (v28)
        {
          v29 = (void *)v28;
          v23 = sub_1C12B5480();
          v24 = v30;

        }
        else
        {
          v23 = 0xD000000000000017;
          v24 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      sub_1C12882D0(v23, v24, &v36);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      v31 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D41E0);
      v32 = sub_1C12B5498();
      sub_1C12882D0(v32, v33, &v36);
      sub_1C12B55DC();
      swift_bridgeObjectRelease();
      sub_1C1293154(a1, a2, 1);
      sub_1C1293154(a1, a2, 1);
      _os_log_impl(&dword_1C127A000, oslog, v20, v34, (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v22, -1, -1);
      MEMORY[0x1C3BA9870](v21, -1, -1);

      sub_1C1293154(a1, a2, 1);
    }
    else
    {
      sub_1C1293154(a1, a2, 1);
      swift_release_n();
      sub_1C1293154(a1, a2, 1);
      sub_1C1293154(a1, a2, 1);

    }
  }
  else
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v8 = sub_1C12B5390();
    __swift_project_value_buffer(v8, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v9 = sub_1C12B5384();
    v10 = sub_1C12B5540();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v36 = v12;
      *(_DWORD *)v11 = 136380675;
      if (*(_QWORD *)(a4 + 208))
      {
        v13 = *(_QWORD *)(a4 + 200);
        v14 = *(_QWORD *)(a4 + 208);
      }
      else
      {
        v25 = IDSCopyLocalDeviceUniqueID();
        if (v25)
        {
          v26 = (void *)v25;
          v13 = sub_1C12B5480();
          v14 = v27;

        }
        else
        {
          v13 = 0xD000000000000017;
          v14 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      sub_1C12882D0(v13, v14, &v36);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C127A000, v9, v10, a6, v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BA9870](v12, -1, -1);
      MEMORY[0x1C3BA9870](v11, -1, -1);

    }
    else
    {

      swift_release_n();
    }
  }
}

void sub_1C12ADC04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1C12ADC64(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x1C12ADE48);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void *sub_1C12ADE6C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_1C12B56FC();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_1C12ADF00@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void *sub_1C12ADF28()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4500);
  v2 = *v0;
  v3 = sub_1C12B563C();
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

void *sub_1C12AE0D8()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4510);
  v2 = *v0;
  v3 = sub_1C12B563C();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_28;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_28;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
      {
        v9 = v22 + 2;
        if (v22 + 2 >= v13)
          goto LABEL_28;
        v23 = *(_QWORD *)(v6 + 8 * v9);
        if (!v23)
          break;
      }
    }
LABEL_27:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 32 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = v17[2];
    v20 = v17[3];
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    v21[2] = v19;
    v21[3] = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 3;
  if (v24 >= v13)
    goto LABEL_28;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C12AE298()
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
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = type metadata accessor for RecordMetadata(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4478);
  v6 = *v0;
  v7 = sub_1C12B563C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    sub_1C127F408(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5, type metadata accessor for RecordMetadata);
    result = (void *)sub_1C12B3774((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20, type metadata accessor for RecordMetadata);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1C12AE4B8()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4500);
  v3 = sub_1C12B5648();
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
    sub_1C12B57E0();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    result = sub_1C12B5804();
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

uint64_t sub_1C12AE764()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
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

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4510);
  v3 = sub_1C12B5648();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v30 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v31 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v31)
      goto LABEL_33;
    v16 = *(_QWORD *)(v30 + 8 * v15);
    ++v10;
    if (!v16)
    {
      v10 = v15 + 1;
      if (v15 + 1 >= v31)
        goto LABEL_33;
      v16 = *(_QWORD *)(v30 + 8 * v10);
      if (!v16)
      {
        v10 = v15 + 2;
        if (v15 + 2 >= v31)
          goto LABEL_33;
        v16 = *(_QWORD *)(v30 + 8 * v10);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v14);
    v19 = *v18;
    v20 = v18[1];
    v21 = v18[2];
    v22 = v18[3];
    sub_1C12B57E0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    result = sub_1C12B5804();
    v23 = -1 << *(_BYTE *)(v4 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v8 + 8 * v25);
      }
      while (v29 == -1);
      v11 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 32 * v11);
    *v12 = v19;
    v12[1] = v20;
    v12[2] = v21;
    v12[3] = v22;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v31)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v30 + 8 * v17);
  if (v16)
  {
    v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v10 >= v31)
      goto LABEL_33;
    v16 = *(_QWORD *)(v30 + 8 * v10);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1C12AEA68()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
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
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;

  v1 = v0;
  v2 = type metadata accessor for RecordMetadata(0);
  v35 = *(_QWORD *)(v2 - 8);
  v36 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4478);
  v6 = sub_1C12B5648();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v31 = v0;
  v32 = v5 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v33 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 56;
  result = swift_retain();
  v14 = 0;
  v34 = v5;
  while (1)
  {
    if (v11)
    {
      v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v37 = v14;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v33)
      goto LABEL_33;
    v19 = *(_QWORD *)(v32 + 8 * v18);
    v20 = v14 + 1;
    if (!v19)
    {
      v20 = v14 + 2;
      if (v14 + 2 >= v33)
        goto LABEL_33;
      v19 = *(_QWORD *)(v32 + 8 * v20);
      if (!v19)
      {
        v20 = v14 + 3;
        if (v14 + 3 >= v33)
          goto LABEL_33;
        v19 = *(_QWORD *)(v32 + 8 * v20);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v11 = (v19 - 1) & v19;
    v37 = v20;
    v17 = __clz(__rbit64(v19)) + (v20 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v5 + 48);
    v23 = *(_QWORD *)(v35 + 72);
    sub_1C127F408(v22 + v23 * v17, (uint64_t)v4, type metadata accessor for RecordMetadata);
    sub_1C12B57E0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_1C12B5324();
    sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
    sub_1C12B5468();
    sub_1C12B57F8();
    result = sub_1C12B5804();
    v24 = -1 << *(_BYTE *)(v7 + 32);
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
          goto LABEL_36;
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
    result = sub_1C12B3774((uint64_t)v4, *(_QWORD *)(v7 + 48) + v15 * v23, type metadata accessor for RecordMetadata);
    ++*(_QWORD *)(v7 + 16);
    v5 = v34;
    v14 = v37;
  }
  v21 = v14 + 4;
  if (v14 + 4 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v32 + 8 * v21);
  if (v19)
  {
    v20 = v14 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v20 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v20 >= v33)
      goto LABEL_33;
    v19 = *(_QWORD *)(v32 + 8 * v20);
    ++v21;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1C12AEE44()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4500);
  v3 = sub_1C12B5648();
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
      sub_1C12B57E0();
      sub_1C12B54B0();
      result = sub_1C12B5804();
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

uint64_t sub_1C12AF120()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
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
  int64_t v32;
  _QWORD *v33;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4510);
  v3 = sub_1C12B5648();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v33 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v32 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v14 = v13 | (v10 << 6);
      }
      else
      {
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32)
          goto LABEL_33;
        v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v32)
            goto LABEL_33;
          v16 = v33[v10];
          if (!v16)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v32)
              goto LABEL_33;
            v16 = v33[v10];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v31 = 1 << *(_BYTE *)(v2 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  v10 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v10 >= v32)
                    goto LABEL_33;
                  v16 = v33[v10];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v10 = v17;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      v18 = v2;
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v14);
      v20 = *v19;
      v21 = v19[1];
      v22 = v19[2];
      v23 = v19[3];
      sub_1C12B57E0();
      swift_bridgeObjectRetain();
      sub_1C12B54B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C12B54B0();
      swift_bridgeObjectRelease();
      result = sub_1C12B5804();
      v24 = -1 << *(_BYTE *)(v4 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 32 * v11);
      *v12 = v20;
      v12[1] = v21;
      v12[2] = v22;
      v12[3] = v23;
      ++*(_QWORD *)(v4 + 16);
      v2 = v18;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1C12AF458()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
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
  int64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;

  v1 = v0;
  v2 = type metadata accessor for RecordMetadata(0);
  v36 = *(_QWORD *)(v2 - 8);
  v37 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4478);
  v6 = sub_1C12B5648();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v34 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v32 = v0;
    v33 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    v35 = v5;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v38 = v14;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_33;
        v19 = v34[v18];
        v20 = v14 + 1;
        if (!v19)
        {
          v20 = v14 + 2;
          if (v14 + 2 >= v33)
            goto LABEL_33;
          v19 = v34[v20];
          if (!v19)
          {
            v20 = v14 + 3;
            if (v14 + 3 >= v33)
              goto LABEL_33;
            v19 = v34[v20];
            if (!v19)
            {
              v21 = v14 + 4;
              if (v14 + 4 >= v33)
              {
LABEL_33:
                swift_release();
                v1 = v32;
                v31 = 1 << *(_BYTE *)(v5 + 32);
                if (v31 > 63)
                  bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v31;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v34[v21];
              if (!v19)
              {
                while (1)
                {
                  v20 = v21 + 1;
                  if (__OFADD__(v21, 1))
                    goto LABEL_39;
                  if (v20 >= v33)
                    goto LABEL_33;
                  v19 = v34[v20];
                  ++v21;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v20 = v14 + 4;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v38 = v20;
        v17 = __clz(__rbit64(v19)) + (v20 << 6);
      }
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      sub_1C12B3774(v22 + v23 * v17, (uint64_t)v4, type metadata accessor for RecordMetadata);
      sub_1C12B57E0();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1C12B54B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C12B54B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      sub_1C12B5324();
      sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
      sub_1C12B5468();
      sub_1C12B57F8();
      result = sub_1C12B5804();
      v24 = -1 << *(_BYTE *)(v7 + 32);
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
            goto LABEL_38;
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
      result = sub_1C12B3774((uint64_t)v4, *(_QWORD *)(v7 + 48) + v15 * v23, type metadata accessor for RecordMetadata);
      ++*(_QWORD *)(v7 + 16);
      v5 = v35;
      v14 = v38;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

unint64_t sub_1C12AF868(unint64_t result)
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
  uint64_t v10;
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
    v8 = sub_1C12B560C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1C12B57E0();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        v10 = sub_1C12B5804();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
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
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
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

uint64_t sub_1C12AFA2C(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = type metadata accessor for RecordMetadata(0);
  v3 = *(_QWORD *)(v28 - 8);
  result = MEMORY[0x1E0C80A78](v28);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v1;
  v7 = *v1;
  v8 = *v1 + 56;
  v9 = -1 << *(_BYTE *)(*v1 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    swift_retain();
    v12 = a1;
    v13 = sub_1C12B560C();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v14 = (v13 + 1) & v11;
      v15 = *(_QWORD *)(v3 + 72);
      v26 = v7;
      v27 = v8;
      v25 = v15;
      do
      {
        v16 = v15 * v10;
        sub_1C127F408(*(_QWORD *)(v7 + 48) + v15 * v10, (uint64_t)v6, type metadata accessor for RecordMetadata);
        sub_1C12B57E0();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        sub_1C12B5324();
        sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
        sub_1C12B5468();
        sub_1C12B57F8();
        v17 = sub_1C12B5804();
        sub_1C127F44C((uint64_t)v6, type metadata accessor for RecordMetadata);
        v18 = v17 & v11;
        if (v12 >= (uint64_t)v14)
        {
          if (v18 < v14)
          {
            v7 = v26;
            v8 = v27;
            v15 = v25;
            goto LABEL_6;
          }
          v7 = v26;
          v8 = v27;
          v15 = v25;
          if (v12 < (uint64_t)v18)
            goto LABEL_6;
        }
        else
        {
          v7 = v26;
          v8 = v27;
          v15 = v25;
          if (v18 < v14 && v12 < (uint64_t)v18)
            goto LABEL_6;
        }
        v19 = v15 * v12;
        if (v15 * v12 < v16 || *(_QWORD *)(v7 + 48) + v15 * v12 >= (unint64_t)(*(_QWORD *)(v7 + 48) + v16 + v15))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v12 = v10;
          if (v19 == v16)
            goto LABEL_6;
          swift_arrayInitWithTakeBackToFront();
        }
        v12 = v10;
LABEL_6:
        v10 = (v10 + 1) & v11;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(_QWORD *)(v8 + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v12) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v8 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v20 = *v24;
  v21 = *(_QWORD *)(*v24 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v20 + 16) = v23;
    ++*(_DWORD *)(v20 + 36);
  }
  return result;
}

uint64_t sub_1C12AFD48(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v8 = type metadata accessor for RecordMetadata(0);
  v47 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  MEMORY[0x1E0C80A78](v9);
  v46 = (uint64_t)&v41 - v11;
  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v45 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DC00);
  result = sub_1C12B56F0();
  v13 = result;
  v41 = a1;
  v42 = a2;
  if (a2 < 1)
    v14 = 0;
  else
    v14 = *a1;
  v15 = 0;
  v16 = result + 64;
  v17 = v45;
  v43 = a4;
  v44 = result;
  while (1)
  {
    if (v14)
    {
      v48 = (v14 - 1) & v14;
      v49 = v15;
      v18 = __clz(__rbit64(v14)) | (v15 << 6);
    }
    else
    {
      v19 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_40;
      if (v19 >= v42)
        return v13;
      v20 = v41[v19];
      v21 = v15 + 1;
      if (!v20)
      {
        v21 = v15 + 2;
        if (v15 + 2 >= v42)
          return v13;
        v20 = v41[v21];
        if (!v20)
        {
          v21 = v15 + 3;
          if (v15 + 3 >= v42)
            return v13;
          v20 = v41[v21];
          if (!v20)
          {
            v22 = v15 + 4;
            if (v15 + 4 >= v42)
              return v13;
            v20 = v41[v22];
            if (!v20)
            {
              while (1)
              {
                v21 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v21 >= v42)
                  return v13;
                v20 = v41[v21];
                ++v22;
                if (v20)
                  goto LABEL_24;
              }
            }
            v21 = v15 + 4;
          }
        }
      }
LABEL_24:
      v48 = (v20 - 1) & v20;
      v49 = v21;
      v18 = __clz(__rbit64(v20)) + (v21 << 6);
    }
    v23 = a4[7];
    v24 = (uint64_t *)(a4[6] + 32 * v18);
    v26 = *v24;
    v25 = v24[1];
    v27 = v24[2];
    v28 = v24[3];
    v29 = v46;
    v30 = *(_QWORD *)(v47 + 72);
    sub_1C127F408(v23 + v30 * v18, v46, type metadata accessor for RecordMetadata);
    sub_1C12B3774(v29, v17, type metadata accessor for RecordMetadata);
    v13 = v44;
    sub_1C12B57E0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    result = sub_1C12B5804();
    v31 = -1 << *(_BYTE *)(v13 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v16 + 8 * (v32 >> 6))) != 0)
    {
      v34 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v16 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      v17 = v45;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v31) >> 6;
      v17 = v45;
      do
      {
        if (++v33 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v37 = v33 == v36;
        if (v33 == v36)
          v33 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v16 + 8 * v33);
      }
      while (v38 == -1);
      v34 = __clz(__rbit64(~v38)) + (v33 << 6);
    }
    *(_QWORD *)(v16 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v34;
    v39 = (_QWORD *)(*(_QWORD *)(v13 + 48) + 32 * v34);
    *v39 = v26;
    v39[1] = v25;
    v39[2] = v27;
    v39[3] = v28;
    result = sub_1C12B3774(v17, *(_QWORD *)(v13 + 56) + v34 * v30, type metadata accessor for RecordMetadata);
    ++*(_QWORD *)(v13 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v43;
    v14 = v48;
    v15 = v49;
    if (!a3)
      return v13;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C12B00D0(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;

  v8 = sub_1C12B5324();
  v49 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v51 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v48 = (char *)&v43 - v12;
  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v47 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D44C0);
  result = sub_1C12B56F0();
  v14 = result;
  v44 = a1;
  v45 = a2;
  if (a2 < 1)
    v15 = 0;
  else
    v15 = *a1;
  v16 = 0;
  v17 = result + 64;
  v18 = v47;
  v19 = v48;
  v46 = a4;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v50 = v16;
      v21 = v20 | (v16 << 6);
    }
    else
    {
      v22 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_40;
      if (v22 >= v45)
        return v14;
      v23 = v44[v22];
      v24 = v16 + 1;
      if (!v23)
      {
        v24 = v16 + 2;
        if (v16 + 2 >= v45)
          return v14;
        v23 = v44[v24];
        if (!v23)
        {
          v24 = v16 + 3;
          if (v16 + 3 >= v45)
            return v14;
          v23 = v44[v24];
          if (!v23)
          {
            v25 = v16 + 4;
            if (v16 + 4 >= v45)
              return v14;
            v23 = v44[v25];
            if (!v23)
            {
              while (1)
              {
                v24 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_41;
                if (v24 >= v45)
                  return v14;
                v23 = v44[v24];
                ++v25;
                if (v23)
                  goto LABEL_24;
              }
            }
            v24 = v16 + 4;
          }
        }
      }
LABEL_24:
      v15 = (v23 - 1) & v23;
      v50 = v24;
      v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }
    v26 = a4[7];
    v27 = (uint64_t *)(a4[6] + 16 * v21);
    v28 = *v27;
    v29 = v27[1];
    v30 = v49;
    v31 = *(_QWORD *)(v49 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v19, v26 + v31 * v21, v18);
    v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v51, v19, v18);
    sub_1C12B57E0();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    result = sub_1C12B5804();
    v33 = -1 << *(_BYTE *)(v14 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v36 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      v18 = v47;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v33) >> 6;
      v18 = v47;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v39 = v35 == v38;
        if (v35 == v38)
          v35 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v40 == -1);
      v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    v41 = (_QWORD *)(*(_QWORD *)(v14 + 48) + 16 * v36);
    *v41 = v28;
    v41[1] = v29;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(_QWORD *)(v14 + 56) + v36 * v31, v51, v18);
    ++*(_QWORD *)(v14 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v46;
    v16 = v50;
    if (!a3)
      return v14;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C12B0418(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t (*v38)(uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  BOOL v44;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = type metadata accessor for RecordMetadata(0);
  v7 = *(_QWORD *)(v59 - 8);
  v8 = MEMORY[0x1E0C80A78](v59);
  v10 = (uint64_t *)((char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (uint64_t *)((char *)&v47 - v12);
  result = MEMORY[0x1E0C80A78](v11);
  v54 = (uint64_t)&v47 - v15;
  if (!*(_QWORD *)(*v2 + 16))
    return result;
  v16 = *(_QWORD *)(a1 + 56);
  v48 = a1 + 56;
  v17 = 1 << *(_BYTE *)(a1 + 32);
  if (v17 < 64)
    v18 = ~(-1 << v17);
  else
    v18 = -1;
  v19 = v18 & v16;
  v49 = (unint64_t)(v17 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v20 = 0;
  v21 = type metadata accessor for RecordMetadata;
  v51 = v6;
  v52 = v2;
  v53 = a1;
  v50 = v7;
  while (1)
  {
    if (v19)
    {
      v55 = (v19 - 1) & v19;
      v56 = v20;
      v23 = __clz(__rbit64(v19)) | (v20 << 6);
      goto LABEL_26;
    }
    v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_47;
    }
    if (v24 >= v49)
      return swift_release();
    v25 = *(_QWORD *)(v48 + 8 * v24);
    v26 = v20 + 1;
    if (!v25)
    {
      v26 = v20 + 2;
      if (v20 + 2 >= v49)
        return swift_release();
      v25 = *(_QWORD *)(v48 + 8 * v26);
      if (!v25)
      {
        v26 = v20 + 3;
        if (v20 + 3 >= v49)
          return swift_release();
        v25 = *(_QWORD *)(v48 + 8 * v26);
        if (!v25)
        {
          v26 = v20 + 4;
          if (v20 + 4 >= v49)
            return swift_release();
          v25 = *(_QWORD *)(v48 + 8 * v26);
          if (!v25)
            break;
        }
      }
    }
LABEL_25:
    v55 = (v25 - 1) & v25;
    v56 = v26;
    v23 = __clz(__rbit64(v25)) + (v26 << 6);
LABEL_26:
    v28 = *(_QWORD *)(a1 + 48);
    v61 = *(_QWORD *)(v7 + 72);
    v29 = v54;
    sub_1C127F408(v28 + v61 * v23, v54, v21);
    sub_1C12B3774(v29, (uint64_t)v13, v21);
    v30 = *v2;
    sub_1C12B57E0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v31 = v59;
    v32 = (char *)v13 + *(int *)(v59 + 20);
    sub_1C12B5324();
    sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
    v58 = v32;
    sub_1C12B5468();
    v57 = *(int *)(v31 + 24);
    sub_1C12B57F8();
    v33 = sub_1C12B5804();
    v34 = -1 << *(_BYTE *)(v30 + 32);
    v35 = v33 & ~v34;
    v62 = v30;
    v36 = v30 + 56;
    if (((*(_QWORD *)(v30 + 56 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) != 0)
    {
      v60 = ~v34;
      while (1)
      {
        v37 = v35 * v61;
        v38 = v21;
        sub_1C127F408(*(_QWORD *)(v62 + 48) + v35 * v61, (uint64_t)v10, v21);
        v39 = v10[2];
        v40 = v10[3];
        v41 = v13[2];
        v42 = v13[3];
        v43 = *v10 == *v13 && v10[1] == v13[1];
        if (v43 || (sub_1C12B578C() & 1) != 0)
        {
          v44 = v39 == v41 && v40 == v42;
          if ((v44 || (sub_1C12B578C() & 1) != 0)
            && (sub_1C12B5300() & 1) != 0
            && *((unsigned __int8 *)v10 + *(int *)(v59 + 24)) == *((unsigned __int8 *)v13 + v57))
          {
            break;
          }
        }
        v21 = v38;
        sub_1C127F44C((uint64_t)v10, v38);
        v35 = (v35 + 1) & v60;
        if (((*(_QWORD *)(v36 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
          goto LABEL_6;
      }
      v21 = v38;
      sub_1C127F44C((uint64_t)v10, v38);
      swift_bridgeObjectRelease();
      v2 = v52;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v46 = *v2;
      v63 = *v2;
      *v2 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1C12AE298();
        v46 = v63;
      }
      v22 = (uint64_t)v51;
      sub_1C12B3774(*(_QWORD *)(v46 + 48) + v37, (uint64_t)v51, v38);
      sub_1C12AFA2C(v35);
      *v2 = v63;
      swift_bridgeObjectRelease();
      v7 = v50;
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v50 + 56))(v22, 0, 1, v59);
    }
    else
    {
LABEL_6:
      swift_bridgeObjectRelease();
      v7 = v50;
      v22 = (uint64_t)v51;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v51, 1, 1, v59);
      v2 = v52;
    }
    sub_1C128E2B0(v22, &qword_1ED78E3F0);
    result = sub_1C127F44C((uint64_t)v13, v21);
    a1 = v53;
    v19 = v55;
    v20 = v56;
  }
  v27 = v20 + 5;
  if (v20 + 5 >= v49)
    return swift_release();
  v25 = *(_QWORD *)(v48 + 8 * v27);
  if (v25)
  {
    v26 = v20 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v26 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v26 >= v49)
      return swift_release();
    v25 = *(_QWORD *)(v48 + 8 * v26);
    ++v27;
    if (v25)
      goto LABEL_25;
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_1C12B09BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  BOOL v47;
  uint64_t isStackAllocationSafe;
  uint64_t v49;
  char v50;
  unint64_t v51;
  size_t v52;
  uint64_t v53;
  void *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int64_t v67;
  unint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for RecordMetadata(0);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char **)((char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = MEMORY[0x1E0C80A78](v8);
  v14 = (char **)((char *)&v57 - v13);
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v59 = v12;
  v15 = -1 << *(_BYTE *)(a1 + 32);
  v17 = a1 + 56;
  v16 = *(_QWORD *)(a1 + 56);
  v18 = ~v15;
  v19 = -v15;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  else
    v20 = -1;
  v64 = a1;
  v65 = a1 + 56;
  v21 = v20 & v16;
  v66 = v18;
  v67 = 0;
  v68 = v20 & v16;
  v62 = v11;
  v63 = (char *)(a2 + 56);
  swift_bridgeObjectRetain();
  v22 = 0;
  v57 = v6;
  v58 = a2;
  while (1)
  {
    v60 = v21;
    v61 = (char *)v22;
    if (v21)
    {
      v23 = v17;
      v24 = (v21 - 1) & v21;
      v25 = __clz(__rbit64(v21)) | (v22 << 6);
      v26 = v22;
      v27 = v59;
LABEL_9:
      sub_1C127F408(*(_QWORD *)(a1 + 48) + *(_QWORD *)(v27 + 72) * v25, (uint64_t)v6, type metadata accessor for RecordMetadata);
      v28 = 0;
      goto LABEL_29;
    }
    v26 = v22 + 1;
    v27 = v59;
    if (__OFADD__(v22, 1))
      __break(1u);
    v29 = (unint64_t)(v18 + 64) >> 6;
    if (v26 >= v29)
    {
LABEL_28:
      v23 = v17;
      v24 = 0;
      v28 = 1;
      v26 = v22;
      goto LABEL_29;
    }
    v30 = *(_QWORD *)(v17 + 8 * v26);
    if (v30)
      goto LABEL_13;
    v22 += 2;
    if (v26 + 1 >= v29)
      goto LABEL_46;
    v30 = *(_QWORD *)(v17 + 8 * v22);
    if (v30)
      goto LABEL_16;
    if (v26 + 2 >= v29)
      goto LABEL_28;
    v30 = *(_QWORD *)(v17 + 8 * (v26 + 2));
    if (v30)
    {
      v26 += 2;
      goto LABEL_13;
    }
    v22 = v26 + 3;
    if (v26 + 3 < v29)
    {
      v30 = *(_QWORD *)(v17 + 8 * v22);
      if (v30)
      {
LABEL_16:
        v26 = v22;
LABEL_13:
        v23 = v17;
        v24 = (v30 - 1) & v30;
        v25 = __clz(__rbit64(v30)) + (v26 << 6);
        goto LABEL_9;
      }
      v26 += 4;
      if (v26 >= v29)
        goto LABEL_28;
      v30 = *(_QWORD *)(v17 + 8 * v26);
      if (v30)
        goto LABEL_13;
      v26 = v29 - 1;
      v31 = v61 + 6;
      while ((char *)v29 != v31)
      {
        v30 = *(_QWORD *)(v17 + 8 * (_QWORD)v31++);
        if (v30)
        {
          v26 = (int64_t)(v31 - 1);
          goto LABEL_13;
        }
      }
LABEL_46:
      v23 = v17;
      v24 = 0;
      v28 = 1;
      goto LABEL_29;
    }
    v23 = v17;
    v24 = 0;
    v28 = 1;
    v26 += 2;
LABEL_29:
    v32 = a1;
    v33 = v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v6, v28, 1, v62);
    v64 = v32;
    v65 = v23;
    v66 = v18;
    v67 = v26;
    v68 = v24;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v6, 1, v33) == 1)
    {
      sub_1C1292DD8();
      sub_1C128E2B0((uint64_t)v6, &qword_1ED78E3F0);
      return v58;
    }
    sub_1C12B3774((uint64_t)v6, (uint64_t)v14, type metadata accessor for RecordMetadata);
    v34 = v58;
    sub_1C12B57E0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v35 = (char *)v14 + *(int *)(v33 + 20);
    sub_1C12B5324();
    sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
    v61 = v35;
    sub_1C12B5468();
    v60 = *(int *)(v33 + 24);
    sub_1C12B57F8();
    v36 = sub_1C12B5804();
    v37 = -1 << *(_BYTE *)(v34 + 32);
    v38 = v36 & ~v37;
    if (((*(_QWORD *)&v63[(v38 >> 3) & 0xFFFFFFFFFFFFF8] >> v38) & 1) != 0)
      break;
LABEL_6:
    sub_1C127F44C((uint64_t)v14, type metadata accessor for RecordMetadata);
    v22 = v67;
    v21 = v68;
    a1 = v64;
    v17 = v65;
    v18 = v66;
    v6 = v57;
  }
  v39 = v34;
  v40 = ~v37;
  v41 = *(_QWORD *)(v59 + 72);
  while (1)
  {
    sub_1C127F408(*(_QWORD *)(v39 + 48) + v41 * v38, (uint64_t)v10, type metadata accessor for RecordMetadata);
    v42 = v10[2];
    v43 = v10[3];
    v44 = v14[2];
    v45 = v14[3];
    v46 = *v10 == *v14 && v10[1] == v14[1];
    if (v46 || (sub_1C12B578C() & 1) != 0)
    {
      v47 = v42 == v44 && v43 == v45;
      if ((v47 || (sub_1C12B578C() & 1) != 0)
        && (sub_1C12B5300() & 1) != 0
        && *((unsigned __int8 *)v10 + *(int *)(v62 + 24)) == *((unsigned __int8 *)v14 + v60))
      {
        break;
      }
    }
    sub_1C127F44C((uint64_t)v10, type metadata accessor for RecordMetadata);
    v38 = (v38 + 1) & v40;
    if (((*(_QWORD *)&v63[(v38 >> 3) & 0xFFFFFFFFFFFFF8] >> v38) & 1) == 0)
      goto LABEL_6;
  }
  sub_1C127F44C((uint64_t)v10, type metadata accessor for RecordMetadata);
  isStackAllocationSafe = sub_1C127F44C((uint64_t)v14, type metadata accessor for RecordMetadata);
  v49 = v39;
  v50 = *(_BYTE *)(v39 + 32);
  v51 = (unint64_t)((1 << v50) + 63) >> 6;
  v52 = 8 * v51;
  if ((v50 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    memcpy((char *)&v57 - ((v52 + 15) & 0x3FFFFFFFFFFFFFF0), v63, v52);
    v53 = sub_1C12B1084((unint64_t *)((char *)&v57 - ((v52 + 15) & 0x3FFFFFFFFFFFFFF0)), v51, v49, v38, &v64);
    swift_release();
    sub_1C1292DD8();
    return v53;
  }
  else
  {
    v55 = (void *)swift_slowAlloc();
    memcpy(v55, v63, v52);
    v56 = sub_1C12B1084((unint64_t *)v55, v51, v49, v38, &v64);
    swift_release();
    sub_1C1292DD8();
    MEMORY[0x1C3BA9870](v55, -1, -1);
    return v56;
  }
}

uint64_t sub_1C12B1084(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  int64_t v50;
  unint64_t v51;
  int64_t v52;
  int64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t *v58;
  char *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v56 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for RecordMetadata(0);
  v12 = *(_QWORD *)(v64 - 8);
  v13 = MEMORY[0x1E0C80A78](v64);
  v15 = (uint64_t *)((char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = MEMORY[0x1E0C80A78](v13);
  v18 = (uint64_t *)((char *)&v55 - v17);
  v19 = *(_QWORD *)(a3 + 16);
  v20 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  v21 = *(unint64_t *)((char *)a1 + v20) & ((-1 << a4) - 1);
  v58 = a1;
  v59 = v11;
  *(unint64_t *)((char *)a1 + v20) = v21;
  v22 = v19 - 1;
  v66 = a3;
  v65 = a3 + 56;
  v60 = a5;
  v61 = v12;
  while (2)
  {
    v57 = v22;
    do
    {
      while (1)
      {
        v24 = *a5;
        v23 = (char *)a5[1];
        v25 = a5[2];
        v26 = a5[3];
        v27 = a5[4];
        v62 = v25;
        v63 = v23;
        if (v27)
        {
          v28 = (v27 - 1) & v27;
          v29 = __clz(__rbit64(v27)) | (v26 << 6);
LABEL_6:
          sub_1C127F408(*(_QWORD *)(v24 + 48) + *(_QWORD *)(v12 + 72) * v29, (uint64_t)v11, type metadata accessor for RecordMetadata);
          v30 = 0;
          goto LABEL_7;
        }
        v49 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          goto LABEL_53;
        }
        v50 = (unint64_t)(v25 + 64) >> 6;
        if (v49 >= v50)
        {
          v28 = 0;
          v30 = 1;
          goto LABEL_7;
        }
        v51 = *(_QWORD *)&v23[8 * v49];
        if (v51)
          goto LABEL_28;
        v52 = v26 + 2;
        if (v26 + 2 >= v50)
          goto LABEL_44;
        v51 = *(_QWORD *)&v23[8 * v52];
        if (v51)
          goto LABEL_32;
        if (v26 + 3 >= v50)
          goto LABEL_45;
        v51 = *(_QWORD *)&v23[8 * v26 + 24];
        if (v51)
        {
          v49 = v26 + 3;
          goto LABEL_28;
        }
        v52 = v26 + 4;
        if (v26 + 4 < v50)
        {
          v51 = *(_QWORD *)&v23[8 * v52];
          if (v51)
          {
LABEL_32:
            v49 = v52;
LABEL_28:
            v28 = (v51 - 1) & v51;
            v29 = __clz(__rbit64(v51)) + (v49 << 6);
            v26 = v49;
            goto LABEL_6;
          }
          v49 = v26 + 5;
          if (v26 + 5 < v50)
          {
            v51 = *(_QWORD *)&v23[8 * v49];
            if (v51)
              goto LABEL_28;
            v49 = v50 - 1;
            v53 = v26 + 6;
            while (v50 != v53)
            {
              v51 = *(_QWORD *)&v23[8 * v53++];
              if (v51)
              {
                v49 = v53 - 1;
                goto LABEL_28;
              }
            }
LABEL_44:
            v28 = 0;
            v30 = 1;
            v26 = v49;
            goto LABEL_7;
          }
LABEL_45:
          v28 = 0;
          v30 = 1;
          v26 = v52;
          goto LABEL_7;
        }
        v28 = 0;
        v30 = 1;
        v26 += 3;
LABEL_7:
        v31 = v64;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v11, v30, 1, v64);
        v32 = v63;
        *a5 = v24;
        a5[1] = v32;
        a5[2] = v62;
        a5[3] = v26;
        a5[4] = v28;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, v31) == 1)
        {
          sub_1C128E2B0((uint64_t)v11, &qword_1ED78E3F0);
          v54 = v66;
          swift_retain();
          return sub_1C12B15E4(v58, v56, v57, v54);
        }
        sub_1C12B3774((uint64_t)v11, (uint64_t)v18, type metadata accessor for RecordMetadata);
        v33 = v31;
        v34 = v66;
        sub_1C12B57E0();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1C12B54B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v35 = (char *)v18 + *(int *)(v33 + 20);
        sub_1C12B5324();
        sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
        v63 = v35;
        sub_1C12B5468();
        v62 = *(int *)(v33 + 24);
        sub_1C12B57F8();
        v36 = sub_1C12B5804();
        v37 = -1 << *(_BYTE *)(v34 + 32);
        v38 = v36 & ~v37;
        if (((*(_QWORD *)(v65 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) != 0)
          break;
LABEL_3:
        result = sub_1C127F44C((uint64_t)v18, type metadata accessor for RecordMetadata);
        v11 = v59;
        a5 = v60;
        v12 = v61;
      }
      v39 = ~v37;
      v40 = *(_QWORD *)(v61 + 72);
      while (1)
      {
        sub_1C127F408(*(_QWORD *)(v66 + 48) + v40 * v38, (uint64_t)v15, type metadata accessor for RecordMetadata);
        v41 = v15[2];
        v42 = v15[3];
        v44 = v18[2];
        v43 = v18[3];
        v45 = *v15 == *v18 && v15[1] == v18[1];
        if (v45 || (sub_1C12B578C() & 1) != 0)
        {
          v46 = v41 == v44 && v42 == v43;
          if ((v46 || (sub_1C12B578C() & 1) != 0)
            && (sub_1C12B5300() & 1) != 0
            && *((unsigned __int8 *)v15 + *(int *)(v64 + 24)) == *((unsigned __int8 *)v18 + v62))
          {
            break;
          }
        }
        sub_1C127F44C((uint64_t)v15, type metadata accessor for RecordMetadata);
        v38 = (v38 + 1) & v39;
        if (((*(_QWORD *)(v65 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) == 0)
          goto LABEL_3;
      }
      sub_1C127F44C((uint64_t)v15, type metadata accessor for RecordMetadata);
      result = sub_1C127F44C((uint64_t)v18, type metadata accessor for RecordMetadata);
      v47 = (v38 >> 3) & 0x1FFFFFFFFFFFFFF8;
      v11 = v59;
      v48 = *(unint64_t *)((char *)v58 + v47);
      *(unint64_t *)((char *)v58 + v47) = v48 & ~(1 << v38);
      a5 = v60;
      v12 = v61;
    }
    while ((v48 & (1 << v38)) == 0);
    v22 = v57 - 1;
    if (__OFSUB__(v57, 1))
    {
LABEL_53:
      __break(1u);
      return result;
    }
    if (v57 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1C12B15E4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v33;
  unint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = type metadata accessor for RecordMetadata(0);
  v37 = *(_QWORD *)(v8 - 8);
  v38 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6D4478);
  result = sub_1C12B5654();
  v11 = result;
  v34 = a1;
  v35 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *a1;
  v14 = 0;
  v15 = result + 56;
  v36 = a4;
  while (1)
  {
    if (v13)
    {
      v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v39 = v14;
      v17 = v16 | (v14 << 6);
    }
    else
    {
      v18 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v18 >= v35)
      {
LABEL_37:
        swift_release();
        return v11;
      }
      v19 = v34[v18];
      v20 = v14 + 1;
      if (!v19)
      {
        v20 = v14 + 2;
        if (v14 + 2 >= v35)
          goto LABEL_37;
        v19 = v34[v20];
        if (!v19)
        {
          v20 = v14 + 3;
          if (v14 + 3 >= v35)
            goto LABEL_37;
          v19 = v34[v20];
          if (!v19)
          {
            v21 = v14 + 4;
            if (v14 + 4 >= v35)
              goto LABEL_37;
            v19 = v34[v21];
            if (!v19)
            {
              while (1)
              {
                v20 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_41;
                if (v20 >= v35)
                  goto LABEL_37;
                v19 = v34[v20];
                ++v21;
                if (v19)
                  goto LABEL_24;
              }
            }
            v20 = v14 + 4;
          }
        }
      }
LABEL_24:
      v13 = (v19 - 1) & v19;
      v39 = v20;
      v17 = __clz(__rbit64(v19)) + (v20 << 6);
    }
    v22 = *(_QWORD *)(a4 + 48);
    v23 = *(_QWORD *)(v37 + 72);
    sub_1C127F408(v22 + v23 * v17, (uint64_t)v10, type metadata accessor for RecordMetadata);
    sub_1C12B57E0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C12B54B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_1C12B5324();
    sub_1C127F22C(&qword_1EF6D3F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
    sub_1C12B5468();
    sub_1C12B57F8();
    result = sub_1C12B5804();
    v24 = -1 << *(_BYTE *)(v11 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v15 + 8 * (v25 >> 6))) != 0)
    {
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v15 + 8 * v26);
      }
      while (v31 == -1);
      v27 = __clz(__rbit64(~v31)) + (v26 << 6);
    }
    *(_QWORD *)(v15 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    result = sub_1C12B3774((uint64_t)v10, *(_QWORD *)(v11 + 48) + v27 * v23, type metadata accessor for RecordMetadata);
    ++*(_QWORD *)(v11 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v36;
    v14 = v39;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C12B1988(uint64_t a1)
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

uint64_t sub_1C12B1A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_1C12ADC04((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_1C12B1AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

  result = sub_1C12B5234();
  v11 = result;
  if (result)
  {
    result = sub_1C12B524C();
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
  v14 = sub_1C12B5240();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1C12ADC04(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1C12B1B98(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1C12B1BE4()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1C12B1C18 + *((int *)qword_1C12B1DF0 + (v0 >> 62))))();
}

uint64_t sub_1C12B1C28@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

void sub_1C12B1E10(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *oslog;

  v1 = *a1;
  if ((*a1 & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v2 = sub_1C12B5390();
    __swift_project_value_buffer(v2, (uint64_t)qword_1ED78DC40);
    v3 = sub_1C12B5384();
    v4 = sub_1C12B5540();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C127A000, v3, v4, "Sync engine is disabled because of unsupported device", v5, 2u);
      MEMORY[0x1C3BA9870](v5, -1, -1);
    }

  }
  if ((v1 & 2) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v6 = sub_1C12B5390();
    __swift_project_value_buffer(v6, (uint64_t)qword_1ED78DC40);
    v7 = sub_1C12B5384();
    v8 = sub_1C12B5540();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1C127A000, v7, v8, "Sync engine is disabled because of preference", v9, 2u);
      MEMORY[0x1C3BA9870](v9, -1, -1);
    }

  }
  if (qword_1ED78DCC8 != -1)
    swift_once();
  if ((qword_1ED78DCC0 & ~v1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v10 = sub_1C12B5390();
    __swift_project_value_buffer(v10, (uint64_t)qword_1ED78DC40);
    oslog = sub_1C12B5384();
    v11 = sub_1C12B5540();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C127A000, oslog, v11, "Sync engine is enabled", v12, 2u);
      MEMORY[0x1C3BA9870](v12, -1, -1);
    }

  }
}

_QWORD *sub_1C12B2098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, uint64_t *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ObjectType;
  void (*v48)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v51;
  int v52;
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
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;

  v12 = v11;
  v67 = a4;
  v56 = a2;
  v57 = a3;
  v55 = a1;
  v61 = a11;
  v62 = a6;
  v59 = a10;
  v60 = a5;
  v58 = a9;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78E890);
  MEMORY[0x1E0C80A78](v15);
  v63 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78DC58);
  v18 = *(_QWORD *)(v17 - 8);
  v65 = v17;
  v66 = v18;
  MEMORY[0x1E0C80A78](v17);
  v64 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_1C12B5564();
  v20 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51);
  v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1C12B554C();
  v24 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v23);
  v25 = sub_1C12B5408();
  MEMORY[0x1E0C80A78](v25);
  v52 = *a7;
  v54 = *a8;
  v53 = sub_1C1292D18(0, (unint64_t *)&qword_1ED78E8B0);
  sub_1C12B53FC();
  v69 = MEMORY[0x1E0DEE9D8];
  sub_1C127F22C((unint64_t *)&qword_1ED78E880, v24, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78E860);
  sub_1C1296E30((unint64_t *)&unk_1ED78E870, (uint64_t *)&unk_1ED78E860, MEMORY[0x1E0DEAF38]);
  sub_1C12B5600();
  (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))(v22, *MEMORY[0x1E0DEF8D8], v51);
  v11[15] = sub_1C12B5588();
  v26 = MEMORY[0x1E0DEE9E0];
  v11[18] = MEMORY[0x1E0DEE9E0];
  v11[19] = 0;
  v11[21] = v26;
  v11[22] = v26;
  v11[23] = MEMORY[0x1E0DEE9E8];
  type metadata accessor for UnfairLock();
  v11[25] = 0;
  v11[26] = 0;
  v11[24] = 0;
  v27 = swift_allocObject();
  v28 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v27 + 16) = v28;
  *v28 = 0;
  v12[28] = 0;
  v12[29] = 0;
  v12[27] = v27;
  *((_WORD *)v12 + 120) = 0;
  *((_OWORD *)v12 + 16) = 0u;
  *((_OWORD *)v12 + 17) = 0u;
  *((_OWORD *)v12 + 18) = 0u;
  *((_OWORD *)v12 + 19) = 0u;
  *((_OWORD *)v12 + 20) = 0u;
  v29 = v56;
  v12[3] = v55;
  v12[4] = v29;
  v30 = v57;
  sub_1C1280EFC(v57, (uint64_t)(v12 + 5));
  v31 = v67;
  sub_1C1280EFC(v67, (uint64_t)(v12 + 10));
  v32 = v62;
  v12[16] = v60;
  v12[17] = v32;
  *((_BYTE *)v12 + 16) = v52;
  v12[20] = v58;
  v33 = v61;
  v12[25] = v59;
  v12[26] = v33;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  v34 = v54;
  v12[31] = v54;
  v35 = (_QWORD *)v31;
  v36 = *(_QWORD *)(v31 + 24);
  v37 = v35[4];
  __swift_project_boxed_opaque_existential_1(v35, v36);
  v38 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 24))(v36, v37);
  v68 = (id)v12[15];
  v39 = v68;
  v69 = v38;
  v40 = sub_1C12B5558();
  v41 = (uint64_t)v63;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v63, 1, 1, v40);
  v42 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E830);
  sub_1C1296E30(&qword_1ED78E828, &qword_1ED78E830, MEMORY[0x1E0C95D90]);
  sub_1C12B38B0();
  v43 = v64;
  sub_1C12B53C0();
  sub_1C128E2B0(v41, (uint64_t *)&unk_1ED78E890);

  swift_release();
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = sub_1C12B3908;
  *(_QWORD *)(v44 + 24) = v12;
  sub_1C1296E30((unint64_t *)&unk_1ED78E818, &qword_1ED78DC58, MEMORY[0x1E0C95CB8]);
  swift_retain();
  v45 = v65;
  v46 = sub_1C12B53CC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v43, v45);
  v12[24] = v46;
  swift_release();
  v69 = v34;
  sub_1C12B1E10(&v69);
  ObjectType = swift_getObjectType();
  v48 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v29 + 8);
  v49 = swift_retain();
  v48(v49, &protocol witness table for SyncEngine, ObjectType, v29);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v30);
  __swift_destroy_boxed_opaque_existential_1(v67);
  return v12;
}

uint64_t sub_1C12B25D0(uint64_t (*a1)(void))
{
  sub_1C129A8DC();
  return a1();
}

uint64_t sub_1C12B260C()
{
  return objectdestroy_92Tm();
}

uint64_t sub_1C12B2618()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1C12B263C()
{
  uint64_t v0;

  sub_1C129A2D4(*(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_1C12B2664()
{
  return swift_deallocObject();
}

uint64_t sub_1C12B2674(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = sub_1C129ADE0();
  return a1(v2);
}

uint64_t sub_1C12B26A8()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C127CE8C(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1C12B26EC()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  __int128 v3;
  _OWORD v4[2];
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_OWORD *)(v0 + 56);
  v4[0] = *(_OWORD *)(v0 + 40);
  v4[1] = v3;
  v5 = *(_QWORD *)(v0 + 72);
  sub_1C12B2EFC((char *)v4, v1, v2);
}

uint64_t sub_1C12B2734()
{
  return swift_deallocObject();
}

uint64_t sub_1C12B2744@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_1C12B2BB0(a1, a2);
}

uint64_t sub_1C12B2758()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_1C12B2794()
{
  uint64_t v0;

  sub_1C129C1B4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(void **)(v0 + 56));
}

uint64_t sub_1C12B27C0()
{
  return swift_deallocObject();
}

uint64_t sub_1C12B27D0()
{
  return objectdestroy_92Tm();
}

void sub_1C12B27D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int16 v3;
  __int128 v4;
  __int16 v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_WORD *)(v0 + 56);
  v4 = *(_OWORD *)(v0 + 40);
  v5 = v3;
  sub_1C129D0E4(v1, v2, (uint64_t)&v4);
}

uint64_t sub_1C12B281C()
{
  return swift_deallocObject();
}

unint64_t sub_1C12B2830()
{
  unint64_t result;

  result = qword_1EF6D4470;
  if (!qword_1EF6D4470)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncEngine.Role, &type metadata for SyncEngine.Role);
    atomic_store(result, (unint64_t *)&qword_1EF6D4470);
  }
  return result;
}

double sub_1C12B2874@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C1298CD0(&qword_1EF6D4460, a1);
}

double sub_1C12B289C@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C1298CD0(&qword_1EF6D4468, a1);
}

double sub_1C12B28C4@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C1298CD0(&qword_1EF6D4460, a1);
}

double sub_1C12B28EC@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C1298CD0(&qword_1EF6D4460, a1);
}

double sub_1C12B2914@<D0>(_OWORD *a1@<X8>)
{
  return sub_1C1298CD0(&qword_1EF6D4460, a1);
}

uint64_t sub_1C12B2940(uint64_t a1)
{
  uint64_t v1;
  __int16 v2;
  uint64_t v4[2];
  __int16 v5;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_WORD *)(a1 + 16);
  v4[0] = *(_QWORD *)a1;
  v4[1] = v1;
  v5 = v2;
  swift_bridgeObjectRetain();
  return sub_1C12992A0(v4);
}

uint64_t method lookup function for SyncEngine()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SyncEngine.syncState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveUnlockMessage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveUnlockMessage.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveUnlockMessage.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveAckMessage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveAckMessage.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of SyncEngine.didReceiveAckMessage.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of SyncEngine.didFireMetadataExpirationTimer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of SyncEngine.didFireMetadataExpirationTimer.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of SyncEngine.didFireMetadataExpirationTimer.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of SyncEngine.didFireRetryTimer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of SyncEngine.didFireRetryTimer.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of SyncEngine.didFireRetryTimer.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of SyncEngine.didExhaustRetryTimer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of SyncEngine.didExhaustRetryTimer.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of SyncEngine.didExhaustRetryTimer.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of SyncEngine.inflightMetadataCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of SyncEngine.pairedDevice.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of SyncEngine.__allocating_init(syncService:metadataStore:keybag:retryTimer:role:syncState:inflightExpirationTime:localDeviceIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 800))();
}

uint64_t dispatch thunk of SyncEngine.start()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 808))();
}

uint64_t storeEnumTagSinglePayload for SyncEngine.Role(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C12B2AD8 + 4 * byte_1C12B7885[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C12B2B0C + 4 * byte_1C12B7880[v4]))();
}

uint64_t sub_1C12B2B0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C12B2B14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C12B2B1CLL);
  return result;
}

uint64_t sub_1C12B2B28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C12B2B30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C12B2B34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C12B2B3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncEngine.Role()
{
  return &type metadata for SyncEngine.Role;
}

uint64_t type metadata accessor for SyncEngine.WeakSource()
{
  return objc_opt_self();
}

uint64_t sub_1C12B2B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t *, _QWORD *);
  _QWORD v8[2];
  uint64_t v9;

  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, _QWORD *))(v5 + 16);
  v8[1] = a5;
  v9 = a3;
  v8[0] = a4;
  return v6(a1, a2, &v9, v8);
}

uint64_t sub_1C12B2BB0@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = SyncEngine._queue_syncService(_:shouldAcceptIncomingMessage:from:)(*(_QWORD *)(v2 + 24), a1, *(_QWORD **)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C12B2BF8()
{
  return objectdestroy_92Tm();
}

uint64_t objectdestroy_92Tm()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C12B2C40(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1C1299DCC(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD **)(v1 + 40), *(_QWORD *)(v1 + 48));
  return a1(v3);
}

uint64_t objectdestroy_89Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C12B2CBC(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1C1299874(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
  return a1(v3);
}

uint64_t sub_1C12B2CFC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C12B2D20()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C12B2D54(void *a1, uint64_t a2, char a3)
{
  uint64_t *v3;

  return sub_1C12AA44C(a1, a2, a3 & 1, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_1C12B2D64()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  sub_1C1293154(*(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject();
}

void sub_1C12B2D9C()
{
  uint64_t v0;

  sub_1C12AA5C8(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56), *(uint64_t **)(v0 + 64));
}

uint64_t sub_1C12B2DB4()
{
  return swift_deallocObject();
}

id sub_1C12B2DC4(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

uint64_t sub_1C12B2DD4(char a1)
{
  uint64_t v1;

  return sub_1C12ACEF4(a1, v1);
}

uint64_t sub_1C12B2DDC()
{
  _QWORD *v0;

  return sub_1C12ACB40(v0);
}

uint64_t sub_1C12B2DE4()
{
  return sub_1C12AB964();
}

uint64_t sub_1C12B2DEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t result;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v13[2];
  __int16 v14;

  v1 = sub_1C12B542C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (uint64_t *)((char *)&v13[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + 120);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF740], v1);
  v6 = v5;
  LOBYTE(v5) = sub_1C12B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    v8 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 216) + 16);
    swift_retain();
    os_unfair_lock_lock(v8);
    v10 = *(_QWORD *)(v0 + 224);
    v9 = *(_QWORD *)(v0 + 232);
    v11 = *(_WORD *)(v0 + 240);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v8);
    result = swift_release();
    if (v9)
    {
      v13[0] = v10;
      v13[1] = v9;
      v14 = v11 & 0x1FF;
      sub_1C12AD0D0(v13);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1C12B2EFC(char *a1, uint64_t a2, int64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  os_log_type_t v39;
  const char *v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43[5];
  uint64_t v44;

  v4 = v3;
  v41 = a2;
  v42 = a3;
  v6 = sub_1C12B542C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *a1;
  v11 = *((_QWORD *)a1 + 1);
  v12 = *((_QWORD *)a1 + 2);
  v14 = *((_QWORD *)a1 + 3);
  v13 = *((_QWORD *)a1 + 4);
  v15 = (void *)v4[15];
  *v9 = v15;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0DEF740], v6);
  v16 = v15;
  v17 = sub_1C12B5444();
  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  if ((v17 & 1) == 0)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_4;
  }
  v18 = v4[13];
  v19 = v4[14];
  __swift_project_boxed_opaque_existential_1(v4 + 10, v18);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19) & 1) == 0)
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v22 = sub_1C12B5390();
    __swift_project_value_buffer(v22, (uint64_t)qword_1ED78DC40);
    swift_retain_n();
    v23 = sub_1C12B5384();
    v24 = sub_1C12B5540();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v43[0] = v26;
      *(_DWORD *)v25 = 136380675;
      if (v4[26])
      {
        v27 = v4[25];
        v28 = v4[26];
      }
      else
      {
        v33 = IDSCopyLocalDeviceUniqueID();
        if (v33)
        {
          v34 = (void *)v33;
          v27 = sub_1C12B5480();
          v28 = v35;

        }
        else
        {
          v27 = 0xD000000000000017;
          v28 = 0x80000001C12BAE80;
        }
      }
      swift_bridgeObjectRetain();
      v44 = sub_1C12882D0(v27, v28, v43);
      sub_1C12B55DC();
      swift_release_n();
      swift_bridgeObjectRelease();
      v39 = v24;
      v40 = "(%{private}s) Will not handle message because keybag is locked";
      goto LABEL_25;
    }
LABEL_16:

    swift_release_n();
    return;
  }
  v17 = v4[31];
  if (qword_1ED78DCC8 != -1)
    goto LABEL_27;
LABEL_4:
  if ((qword_1ED78DCC0 & ~v17) == 0)
  {
    LOBYTE(v43[0]) = v10;
    v43[1] = v11;
    v43[2] = v12;
    v43[3] = v14;
    v43[4] = v13;
    v21 = v41;
    v20 = v42;
    sub_1C129DD68();
    LOBYTE(v43[0]) = v10;
    sub_1C129E3F8(v21, v20, (unsigned __int8 *)v43);
    return;
  }
  if (qword_1ED78E810 != -1)
    swift_once();
  v29 = sub_1C12B5390();
  __swift_project_value_buffer(v29, (uint64_t)qword_1ED78DC40);
  swift_retain_n();
  v23 = sub_1C12B5384();
  v30 = sub_1C12B5534();
  if (!os_log_type_enabled(v23, v30))
    goto LABEL_16;
  v25 = (uint8_t *)swift_slowAlloc();
  v26 = swift_slowAlloc();
  v43[0] = v26;
  *(_DWORD *)v25 = 136380675;
  if (v4[26])
  {
    v31 = v4[25];
    v32 = v4[26];
  }
  else
  {
    v36 = IDSCopyLocalDeviceUniqueID();
    if (v36)
    {
      v37 = (void *)v36;
      v31 = sub_1C12B5480();
      v32 = v38;

    }
    else
    {
      v31 = 0xD000000000000017;
      v32 = 0x80000001C12BAE80;
    }
  }
  swift_bridgeObjectRetain();
  v44 = sub_1C12882D0(v31, v32, v43);
  sub_1C12B55DC();
  swift_release_n();
  swift_bridgeObjectRelease();
  v39 = v30;
  v40 = "(%{private}s) Will not handle message because sync is inactive";
LABEL_25:
  _os_log_impl(&dword_1C127A000, v23, v39, v40, v25, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3BA9870](v26, -1, -1);
  MEMORY[0x1C3BA9870](v25, -1, -1);

}

uint64_t sub_1C12B336C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, char *);
  _QWORD *v31;

  v25 = a2;
  v30 = a4;
  v26 = a1;
  v5 = sub_1C12B5324();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v31 = (_QWORD *)a3;
  v11 = *(_QWORD *)(a3 + 64);
  v27 = 0;
  v28 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v29 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_5;
    }
    v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v20 >= v29)
      return sub_1C12B00D0(v26, v25, v27, v31);
    v21 = *(_QWORD *)(v28 + 8 * v20);
    ++v10;
    if (!v21)
    {
      v10 = v20 + 1;
      if (v20 + 1 >= v29)
        return sub_1C12B00D0(v26, v25, v27, v31);
      v21 = *(_QWORD *)(v28 + 8 * v10);
      if (!v21)
      {
        v10 = v20 + 2;
        if (v20 + 2 >= v29)
          return sub_1C12B00D0(v26, v25, v27, v31);
        v21 = *(_QWORD *)(v28 + 8 * v10);
        if (!v21)
          break;
      }
    }
LABEL_20:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_5:
    v17 = (uint64_t *)(v31[6] + 16 * v16);
    v18 = *v17;
    v19 = v17[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v31[7] + *(_QWORD *)(v6 + 72) * v16, v5);
    swift_bridgeObjectRetain();
    LOBYTE(v18) = v30(v18, v19, v9);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    result = swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
    {
      *(unint64_t *)((char *)v26 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v27++, 1))
      {
        __break(1u);
        return sub_1C12B00D0(v26, v25, v27, v31);
      }
    }
  }
  v22 = v20 + 3;
  if (v22 >= v29)
    return sub_1C12B00D0(v26, v25, v27, v31);
  v21 = *(_QWORD *)(v28 + 8 * v22);
  if (v21)
  {
    v10 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    v10 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v10 >= v29)
      return sub_1C12B00D0(v26, v25, v27, v31);
    v21 = *(_QWORD *)(v28 + 8 * v10);
    ++v22;
    if (v21)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1C12B35C0(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, char *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    v10 = sub_1C12B336C((_QWORD *)((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_1C12B336C((unint64_t *)v11, v8, v6, a2);
    MEMORY[0x1C3BA9870](v11, -1, -1);
  }
  return a3;
}

unint64_t sub_1C12B3730()
{
  unint64_t result;

  result = qword_1EF6D44D0;
  if (!qword_1EF6D44D0)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncMessage, &type metadata for SyncMessage);
    atomic_store(result, (unint64_t *)&qword_1EF6D44D0);
  }
  return result;
}

uint64_t sub_1C12B3774(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C12B37B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1C127CE8C(a1, a2);
  return a1;
}

void sub_1C12B37CC(void *a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_1C12AD758(a1, a2, a3 & 1, v3, "(%{private}s) Failed to send resync message: %{public}s", "(%{private}s) Sent resync message");
}

unint64_t sub_1C12B37F8()
{
  unint64_t result;

  result = qword_1EF6D44E0;
  if (!qword_1EF6D44E0)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncMessage, &type metadata for SyncMessage);
    atomic_store(result, (unint64_t *)&qword_1EF6D44E0);
  }
  return result;
}

uint64_t sub_1C12B383C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED78E3F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C12B3884(void *a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_1C12AD758(a1, a2, a3 & 1, v3, "(%{private}s) Failed to send ack message: %{public}s", "(%{private}s) Sent ack message");
}

unint64_t sub_1C12B38B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED78E8A0;
  if (!qword_1ED78E8A0)
  {
    v1 = sub_1C1292D18(255, (unint64_t *)&qword_1ED78E8B0);
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0DEF7F8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED78E8A0);
  }
  return result;
}

uint64_t sub_1C12B390C(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

void sub_1C12B3930(void *a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_1C12AD758(a1, a2, a3 & 1, v3, "(%{private}s) Failed to send unlock message: %{public}s", "(%{private}s) Sent unlock message");
}

uint64_t sub_1C12B395C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(a1, a2, *a3, *a4, a4[1]);
}

uint64_t dispatch thunk of KeybagStateProviding.isLocked.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of KeybagStateProviding.hasUnlockedSinceBoot.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of KeybagStateProviding.firstUnlockPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1C12B3A58()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t LinearRetryTimer.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  v0 = swift_allocObject();
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C12B5E70;
  *(_OWORD *)(v0 + 32) = xmmword_1C12B5E80;
  return v0;
}

uint64_t LinearRetryTimer.init()()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  *(_QWORD *)(v0 + 40) = 0;
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C12B5E70;
  *(_QWORD *)(v0 + 32) = 3;
  return v0;
}

_QWORD *LinearRetryTimer.__allocating_init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;

  v4 = (_QWORD *)swift_allocObject();
  v4[5] = 0;
  type metadata accessor for UnfairLock();
  v5 = swift_allocObject();
  v6 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v6;
  *v6 = 0;
  v4[6] = v5;
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a1;
  return v4;
}

_QWORD *LinearRetryTimer.init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  _DWORD *v6;

  v2[5] = 0;
  type metadata accessor for UnfairLock();
  v5 = swift_allocObject();
  v6 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v6;
  *v6 = 0;
  v2[6] = v5;
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = a1;
  return v2;
}

uint64_t LinearRetryTimer.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t LinearRetryTimer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LinearRetryTimer()
{
  return objc_opt_self();
}

uint64_t SyncProtocolVersion.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t static SyncProtocolVersion.< infix(_:_:)(_BYTE *a1, _BYTE *a2)
{
  return *a2 & ~*a1 & 1;
}

SessionSyncEngine::SyncProtocolVersion_optional __swiftcall SyncProtocolVersion.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (SessionSyncEngine::SyncProtocolVersion_optional)rawValue;
}

unint64_t sub_1C12B3CC8()
{
  unint64_t result;

  result = qword_1EF6D4668;
  if (!qword_1EF6D4668)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncProtocolVersion, &type metadata for SyncProtocolVersion);
    atomic_store(result, (unint64_t *)&qword_1EF6D4668);
  }
  return result;
}

_QWORD *sub_1C12B3D0C@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_1C12B3D2C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_1C12B3D38()
{
  sub_1C12B3EFC();
  return sub_1C12B54E0();
}

uint64_t sub_1C12B3D94()
{
  sub_1C12B3EFC();
  return sub_1C12B54D4();
}

uint64_t sub_1C12B3DE0(_BYTE *a1, _BYTE *a2)
{
  return *a2 & ~*a1 & 1;
}

uint64_t sub_1C12B3DF4(_BYTE *a1, _BYTE *a2)
{
  return *a2 & 1 | ((*a1 & 1) == 0);
}

uint64_t sub_1C12B3E08(_BYTE *a1, _BYTE *a2)
{
  return *a1 & 1 | ((*a2 & 1) == 0);
}

uint64_t sub_1C12B3E1C(_BYTE *a1, _BYTE *a2)
{
  return *a1 & ~*a2 & 1;
}

uint64_t storeEnumTagSinglePayload for SyncProtocolVersion(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C12B3E7C + 4 * byte_1C12B7AD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C12B3EB0 + 4 * byte_1C12B7AD0[v4]))();
}

uint64_t sub_1C12B3EB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C12B3EB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C12B3EC0);
  return result;
}

uint64_t sub_1C12B3ECC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C12B3ED4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C12B3ED8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C12B3EE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncProtocolVersion()
{
  return &type metadata for SyncProtocolVersion;
}

unint64_t sub_1C12B3EFC()
{
  unint64_t result;

  result = qword_1EF6D4670;
  if (!qword_1EF6D4670)
  {
    result = MEMORY[0x1C3BA97D4](&protocol conformance descriptor for SyncProtocolVersion, &type metadata for SyncProtocolVersion);
    atomic_store(result, (unint64_t *)&qword_1EF6D4670);
  }
  return result;
}

uint64_t sub_1C12B3F40()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t _s10TestKeybagCMa()
{
  return objc_opt_self();
}

uint64_t sub_1C12B3F84()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)v0 + 16);
}

uint64_t sub_1C12B3F90()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)v0 + 17);
}

uint64_t sub_1C12B3F9C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED78DC60);
  sub_1C12B3FEC();
  return sub_1C12B53B4();
}

unint64_t sub_1C12B3FEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED78E838;
  if (!qword_1ED78E838)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED78DC60);
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0C95FB8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED78E838);
  }
  return result;
}

uint64_t dispatch thunk of MetadataPersisting.recordMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MetadataPersisting.pairedDeviceIdentifiers.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MetadataPersisting.recordIDSyncDatesByPairedDeviceIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MetadataPersisting.purge()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of MetadataPersisting.update(metadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of MetadataPersisting.removeMetadata(recordID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of MetadataPersisting.setPerformedInitialSync(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of MetadataPersisting.removePerformedInitialSync(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of MetadataPersisting.removeRecordIDSyncDates(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of MetadataPersisting.removeRecordIDSyncDates(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of MetadataPersisting.set(syncDate:recordID:pairedDeviceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t CustomizableRetryTimer.init()()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  *(_QWORD *)(v0 + 40) = 0;
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C12B5E70;
  *(_QWORD *)(v0 + 32) = 3;
  return v0;
}

_QWORD *CustomizableRetryTimer.init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  _DWORD *v6;

  v2[5] = 0;
  type metadata accessor for UnfairLock();
  v5 = swift_allocObject();
  v6 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v6;
  *v6 = 0;
  v2[6] = v5;
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = a1;
  return v2;
}

uint64_t CustomizableRetryTimer.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1C12B4180(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  os_unfair_lock_s *v7;

  v7 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v7);
  sub_1C12B4340(a1, a2, a3);
  os_unfair_lock_unlock(v7);
  return swift_release();
}

uint64_t sub_1C12B41E8()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = v0;
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v2);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)(v0 + 48) + 16));
  if (qword_1ED78E810 != -1)
    swift_once();
  v3 = sub_1C12B5390();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED78DC40);
  v4 = sub_1C12B5384();
  v5 = sub_1C12B5540();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C127A000, v4, v5, "Resetting retry timer", v6, 2u);
    MEMORY[0x1C3BA9870](v6, -1, -1);
  }

  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return swift_release();
}

uint64_t sub_1C12B42F8()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v1);
  sub_1C12B4A74();
  os_unfair_lock_unlock(v1);
  return swift_release();
}

void sub_1C12B4340(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
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
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t *, uint64_t, uint64_t);
  char *v37;
  void (*v38)(uint64_t *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t ObjectType;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  _QWORD aBlock[7];

  v4 = v3;
  v60 = a3;
  v58 = a2;
  v65 = a1;
  v5 = sub_1C12B53E4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1C12B5408();
  v62 = *(_QWORD *)(v9 - 8);
  v63 = v9;
  MEMORY[0x1E0C80A78](v9);
  v59 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1C12B53D8();
  v56 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x1E0C80A78](v11);
  v57 = (uint64_t)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v15 = (uint64_t *)((char *)&v51 - v14);
  v64 = sub_1C12B5420();
  v55 = *(_QWORD *)(v64 - 8);
  v16 = MEMORY[0x1E0C80A78](v64);
  v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v61 = (char *)&v51 - v19;
  v20 = sub_1C12B5594();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v4[6] + 16));
  if ((uint64_t)v4[4] >= 1)
  {
    v54 = v8;
    v24 = (*(uint64_t (**)(void))(*v4 + 232))();
    v25 = v4[4];
    v26 = __OFSUB__(v25, 1);
    v27 = v25 - 1;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      v52 = v5;
      v53 = v21;
      v21 = v24;
      v4[4] = v27;
      if (qword_1ED78E810 == -1)
      {
LABEL_4:
        v28 = sub_1C12B5390();
        __swift_project_value_buffer(v28, (uint64_t)qword_1ED78DC40);
        v29 = sub_1C12B5384();
        v30 = sub_1C12B5540();
        v31 = os_log_type_enabled(v29, v30);
        v51 = v6;
        if (v31)
        {
          v32 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v32 = 134349056;
          aBlock[0] = v21;
          sub_1C12B55DC();
          _os_log_impl(&dword_1C127A000, v29, v30, "Retry timer will fire in %{public}llus", v32, 0xCu);
          MEMORY[0x1C3BA9870](v32, -1, -1);
        }

        sub_1C12B4F60();
        aBlock[0] = MEMORY[0x1E0DEE9D8];
        sub_1C12B4F9C();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D4498);
        sub_1C12B4FE4();
        sub_1C12B5600();
        v33 = sub_1C12B55A0();
        (*(void (**)(char *, uint64_t))(v53 + 8))(v23, v20);
        sub_1C12B5414();
        if ((v21 & 0x8000000000000000) == 0)
        {
          *v15 = v21;
          v34 = *MEMORY[0x1E0DEF4A0];
          v35 = v56;
          v36 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v56 + 104);
          v36(v15, v34, v11);
          v37 = v61;
          MEMORY[0x1C3BA9024](v18, v15);
          v38 = *(void (**)(uint64_t *, uint64_t))(v35 + 8);
          v38(v15, v11);
          v39 = v18;
          v40 = v64;
          v65 = *(NSObject **)(v55 + 8);
          ((void (*)(char *, uint64_t))v65)(v39, v64);
          ObjectType = swift_getObjectType();
          *v15 = 10;
          v36(v15, v34, v11);
          v42 = v57;
          sub_1C12ACAFC(v57);
          MEMORY[0x1C3BA91BC](v37, v42, v15, ObjectType);
          v38((uint64_t *)v42, v11);
          v38(v15, v11);
          v43 = (_QWORD *)swift_allocObject();
          v44 = v58;
          v43[2] = v4;
          v43[3] = v44;
          v43[4] = v60;
          aBlock[4] = sub_1C12B505C;
          aBlock[5] = v43;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_1C12906E8;
          aBlock[3] = &block_descriptor_2;
          v45 = _Block_copy(aBlock);
          swift_retain();
          swift_retain();
          v46 = v59;
          sub_1C12ACE3C();
          v47 = v54;
          sub_1C12ACE40();
          sub_1C12B55AC();
          _Block_release(v45);
          (*(void (**)(char *, uint64_t))(v51 + 8))(v47, v52);
          (*(void (**)(char *, uint64_t))(v62 + 8))(v46, v63);
          swift_release();
          v4[5] = v33;
          swift_unknownObjectRetain();
          swift_unknownObjectRelease();
          if (v4[5])
          {
            swift_getObjectType();
            swift_unknownObjectRetain();
            sub_1C12B55C4();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            ((void (*)(char *, uint64_t))v65)(v37, v40);
          }
          else
          {
            ((void (*)(char *, uint64_t))v65)(v37, v40);
            swift_unknownObjectRelease();
          }
          return;
        }
        __break(1u);
        goto LABEL_17;
      }
    }
    swift_once();
    goto LABEL_4;
  }
  if (qword_1ED78E810 != -1)
LABEL_17:
    swift_once();
  v48 = sub_1C12B5390();
  __swift_project_value_buffer(v48, (uint64_t)qword_1ED78DC40);
  v65 = sub_1C12B5384();
  v49 = sub_1C12B5534();
  if (os_log_type_enabled(v65, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v50 = 0;
    _os_log_impl(&dword_1C127A000, v65, v49, "Exhausted retry attempts; will not try again", v50, 2u);
    MEMORY[0x1C3BA9870](v50, -1, -1);
  }

}

void sub_1C12B4990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)(v0 + 48) + 16));
  if (qword_1ED78E810 != -1)
    swift_once();
  v2 = sub_1C12B5390();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED78DC40);
  v3 = sub_1C12B5384();
  v4 = sub_1C12B5540();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C127A000, v3, v4, "Resetting retry timer", v5, 2u);
    MEMORY[0x1C3BA9870](v5, -1, -1);
  }

  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v1 + 16);
}

void sub_1C12B4A74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)(v0 + 48) + 16));
  if (*(_QWORD *)(v0 + 40))
  {
    if (qword_1ED78E810 != -1)
      swift_once();
    v2 = sub_1C12B5390();
    __swift_project_value_buffer(v2, (uint64_t)qword_1ED78DC40);
    v3 = sub_1C12B5384();
    v4 = sub_1C12B5540();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C127A000, v3, v4, "Cancelling retry timer", v5, 2u);
      MEMORY[0x1C3BA9870](v5, -1, -1);
    }

    if (*(_QWORD *)(v1 + 40))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1C12B55B8();
      swift_unknownObjectRelease();
    }
    *(_QWORD *)(v1 + 40) = 0;
    swift_unknownObjectRelease();
  }
}

uint64_t CustomizableRetryTimer.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;

  v0 = swift_allocObject();
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_OWORD *)(v0 + 16) = xmmword_1C12B5E70;
  *(_OWORD *)(v0 + 32) = xmmword_1C12B5E80;
  return v0;
}

_QWORD *CustomizableRetryTimer.__allocating_init(maxRetries:retryTimeInSeconds:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;

  v4 = (_QWORD *)swift_allocObject();
  v4[5] = 0;
  type metadata accessor for UnfairLock();
  v5 = swift_allocObject();
  v6 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v6;
  *v6 = 0;
  v4[6] = v5;
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a1;
  return v4;
}

uint64_t sub_1C12B4C94(uint64_t a1, uint64_t (*a2)(BOOL))
{
  os_unfair_lock_s *v4;
  BOOL v6;

  v4 = *(os_unfair_lock_s **)(*(_QWORD *)(a1 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_1C12B4D10(a1, &v6);
  os_unfair_lock_unlock(v4);
  swift_release();
  return a2(v6);
}

void sub_1C12B4D10(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (__OFSUB__(*(_QWORD *)(a1 + 16), v3))
  {
    __break(1u);
  }
  else if (qword_1ED78E810 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v4 = sub_1C12B5390();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED78DC40);
  v5 = sub_1C12B5384();
  v6 = sub_1C12B5540();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 134349056;
    sub_1C12B55DC();
    _os_log_impl(&dword_1C127A000, v5, v6, "Retry timer fired (attempt #%{public}ld)", v7, 0xCu);
    MEMORY[0x1C3BA9870](v7, -1, -1);
  }

  sub_1C12B4A74();
  *a2 = v3 == 0;
}

uint64_t CustomizableRetryTimer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1C12B4E80(uint64_t a1, uint64_t a2)
{
  return sub_1C12B4E98(a1, a2, sub_1C12B4A74);
}

uint64_t sub_1C12B4E8C(uint64_t a1, uint64_t a2)
{
  return sub_1C12B4E98(a1, a2, sub_1C12B4990);
}

uint64_t sub_1C12B4E98(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  os_unfair_lock_s *v5;

  v5 = *(os_unfair_lock_s **)(*(_QWORD *)(v3 + 48) + 16);
  swift_retain();
  os_unfair_lock_lock(v5);
  a3();
  os_unfair_lock_unlock(v5);
  return swift_release();
}

uint64_t sub_1C12B4EE4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t type metadata accessor for CustomizableRetryTimer()
{
  return objc_opt_self();
}

uint64_t method lookup function for CustomizableRetryTimer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CustomizableRetryTimer.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.__allocating_init(maxRetries:retryTimeInSeconds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.start(queue:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of CustomizableRetryTimer.secondsUntilNextFireTime()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

unint64_t sub_1C12B4F60()
{
  unint64_t result;

  result = qword_1EF6D4488;
  if (!qword_1EF6D4488)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF6D4488);
  }
  return result;
}

unint64_t sub_1C12B4F9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF6D4490;
  if (!qword_1EF6D4490)
  {
    v1 = sub_1C12B5594();
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0DEF948], v1);
    atomic_store(result, (unint64_t *)&qword_1EF6D4490);
  }
  return result;
}

unint64_t sub_1C12B4FE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF6D44A0;
  if (!qword_1EF6D44A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF6D4498);
    result = MEMORY[0x1C3BA97D4](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EF6D44A0);
  }
  return result;
}

uint64_t sub_1C12B5030()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C12B505C()
{
  uint64_t v0;

  return sub_1C12B4C94(*(_QWORD *)(v0 + 16), *(uint64_t (**)(BOOL))(v0 + 24));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1C12B5080()
{
  uint64_t v0;

  MEMORY[0x1C3BA9870](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnfairLock()
{
  return objc_opt_self();
}

uint64_t sub_1C12B50CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1C12B5354();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C12B5390();
  __swift_allocate_value_buffer(v4, qword_1ED78DC40);
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED78DC40);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0C8FE60], v0);
  return sub_1C12B5378();
}

uint64_t static Logger.syncEngine.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED78E810 != -1)
    swift_once();
  v2 = sub_1C12B5390();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED78DC40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

uint64_t sub_1C12B5234()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1C12B5240()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1C12B524C()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1C12B5258()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1C12B5264()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1C12B5270()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1C12B527C()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1C12B5288()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1C12B5294()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1C12B52A0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C12B52AC()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1C12B52B8()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_1C12B52C4()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1C12B52D0()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1C12B52DC()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1C12B52E8()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1C12B52F4()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1C12B5300()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1C12B530C()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1C12B5318()
{
  return MEMORY[0x1E0CB0828]();
}

uint64_t sub_1C12B5324()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1C12B5330()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1C12B533C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1C12B5348()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1C12B5354()
{
  return MEMORY[0x1E0C8FF30]();
}

uint64_t sub_1C12B5360()
{
  return MEMORY[0x1E0D8CDB8]();
}

uint64_t sub_1C12B536C()
{
  return MEMORY[0x1E0D8CDC0]();
}

uint64_t sub_1C12B5378()
{
  return MEMORY[0x1E0C90220]();
}

uint64_t sub_1C12B5384()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C12B5390()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C12B539C()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1C12B53A8()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1C12B53B4()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1C12B53C0()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1C12B53CC()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1C12B53D8()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1C12B53E4()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1C12B53F0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1C12B53FC()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1C12B5408()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1C12B5414()
{
  return MEMORY[0x1E0DEF6D8]();
}

uint64_t sub_1C12B5420()
{
  return MEMORY[0x1E0DEF6E8]();
}

uint64_t sub_1C12B542C()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1C12B5438()
{
  return MEMORY[0x1E0DEF760]();
}

uint64_t sub_1C12B5444()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1C12B5450()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C12B545C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C12B5468()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1C12B5474()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C12B5480()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C12B548C()
{
  return MEMORY[0x1E0CB1A58]();
}

uint64_t sub_1C12B5498()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C12B54A4()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1C12B54B0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C12B54BC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C12B54C8()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C12B54D4()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1C12B54E0()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1C12B54EC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C12B54F8()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1C12B5504()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1C12B5510()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1C12B551C()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1C12B5528()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1C12B5534()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C12B5540()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C12B554C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1C12B5558()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1C12B5564()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1C12B5570()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1C12B557C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1C12B5588()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1C12B5594()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1C12B55A0()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1C12B55AC()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1C12B55B8()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1C12B55C4()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1C12B55D0()
{
  return MEMORY[0x1E0DEFA98]();
}

uint64_t sub_1C12B55DC()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C12B55E8()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C12B55F4()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1C12B5600()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1C12B560C()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1C12B5618()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1C12B5624()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1C12B5630()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1C12B563C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1C12B5648()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1C12B5654()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1C12B5660()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C12B566C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C12B5678()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C12B5684()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1C12B5690()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1C12B569C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C12B56A8()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1C12B56B4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C12B56C0()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1C12B56CC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C12B56D8()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1C12B56E4()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1C12B56F0()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1C12B56FC()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C12B5708()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1C12B5714()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1C12B5720()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1C12B572C()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1C12B5738()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C12B5744()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1C12B5750()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1C12B575C()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1C12B5768()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1C12B5774()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C12B5780()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C12B578C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C12B5798()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1C12B57A4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C12B57B0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C12B57BC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C12B57C8()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C12B57D4()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C12B57E0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C12B57EC()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C12B57F8()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1C12B5804()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C12B5810()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C12B581C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C12B5828()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C12B5834()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1E0D33E20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x1E0D4E4A8]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x1E0D4E4B0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}


uint64_t FetchSyncChangesetRequestProtobuf.zoneRequests.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FetchSyncChangesetRequestProtobuf.zoneRequests.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*FetchSyncChangesetRequestProtobuf.zoneRequests.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for FetchSyncChangesetRequestProtobuf, a1);
}

uint64_t type metadata accessor for FetchSyncChangesetRequestProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550F9F20);
}

uint64_t FetchSyncChangesetRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for FetchSyncChangesetRequestProtobuf);
}

uint64_t (*FetchSyncChangesetRequestProtobuf.unknownFields.modify())()
{
  type metadata accessor for FetchSyncChangesetRequestProtobuf(0);
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.zone.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.zone.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.changeWindow.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_21A8327FC(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t sub_21A8327FC(uint64_t a1, unint64_t a2)
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

uint64_t sub_21A832844(uint64_t a1, unint64_t a2)
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

uint64_t (*FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.changeWindow.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A83321C(type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, a1);
}

uint64_t type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550F9FB0);
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A833274(a1, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t (*FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.unknownFields.modify())()
{
  type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0);
  return nullsub_1;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_21A8504D0;
  type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t FetchSyncChangesetRequestProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21A833360((void (*)(_QWORD))type metadata accessor for FetchSyncChangesetRequestProtobuf, a1);
}

uint64_t (*FetchSyncChangesetResponseProtobuf.zoneChangesets.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for FetchSyncChangesetResponseProtobuf, a1);
}

uint64_t sub_21A832958@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1(0) + 20);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t type metadata accessor for FetchSyncChangesetResponseProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FA048);
}

uint64_t FetchSyncChangesetResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_21A8329C4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2(0) + 20);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*FetchSyncChangesetResponseProtobuf.unknownFields.modify())()
{
  type metadata accessor for FetchSyncChangesetResponseProtobuf(0);
  return nullsub_1;
}

uint64_t (*FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t _s21SeymourServerProtocol33FetchSyncChangesetRequestProtobufV04ZonefgH0V12changeWindow10Foundation4DataVvs_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_21A832844(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.changeWindow.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t SyncChangesetResponse;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_21A832DFC(v1 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v4);
  v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 1, v6) != 1)
    return sub_21A832E44((uint64_t)v4, (uint64_t)a1);
  v7 = MEMORY[0x24BEE4AF8];
  *a1 = 0;
  a1[1] = v7;
  a1[2] = v7;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_21A836DBC((uint64_t)v4, &qword_2550F9E40);
}

uint64_t sub_21A832B6C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t SyncChangesetResponse;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_21A832DFC(a1 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v5);
  v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_21A832E44((uint64_t)v5, (uint64_t)a2);
  v8 = MEMORY[0x24BEE4AF8];
  *a2 = 0;
  a2[1] = v8;
  a2[2] = v8;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_21A836DBC((uint64_t)v5, &qword_2550F9E40);
}

uint64_t sub_21A832C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A833088(a1, (uint64_t)v7);
  v8 = a2 + *(int *)(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_21A836DBC(v8, &qword_2550F9E40);
  sub_21A832E44((uint64_t)v7, v8);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_21A836DBC(v3, &qword_2550F9E40);
  sub_21A832E44(a1, v3);
  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22074A898]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, (uint64_t *)&unk_2550FA0D8);
}

uint64_t sub_21A832DC8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21A832DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A832E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void (*FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 28);
  *((_DWORD *)v3 + 12) = v10;
  sub_21A832DFC(v1 + v10, (uint64_t)v5);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    *v9 = 0;
    v9[1] = v11;
    v9[2] = v11;
    _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
    sub_21A836DBC((uint64_t)v5, &qword_2550F9E40);
  }
  else
  {
    sub_21A832E44((uint64_t)v5, (uint64_t)v9);
  }
  return sub_21A832FA0;
}

void sub_21A832FA0(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = *(void **)a1;
  v3 = *(int *)(*(_QWORD *)a1 + 48);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  v5 = *(void **)(*(_QWORD *)a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v8 = *(void **)(*(_QWORD *)a1 + 8);
  v9 = **(_QWORD **)a1 + v3;
  if ((a2 & 1) != 0)
  {
    sub_21A833088(*(_QWORD *)(*(_QWORD *)a1 + 40), (uint64_t)v4);
    sub_21A836DBC(v9, &qword_2550F9E40);
    sub_21A832E44((uint64_t)v4, v9);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
    sub_21A8330CC((uint64_t)v5);
  }
  else
  {
    sub_21A836DBC(**(_QWORD **)a1 + v3, &qword_2550F9E40);
    sub_21A832E44((uint64_t)v5, v9);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
  }
  free(v5);
  free(v4);
  free(v8);
  free(v2);
}

uint64_t sub_21A833088(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A8330CC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SyncRecordChangesetProtobuf();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.hasRecordChangeset.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t SyncChangesetResponse;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_21A832DFC(v0 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v2);
  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  v5 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4) != 1;
  sub_21A836DBC((uint64_t)v2, &qword_2550F9E40);
  return v5;
}

Swift::Void __swiftcall FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.clearRecordChangeset()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_21A836DBC(v1, &qword_2550F9E40);
  v2 = type metadata accessor for SyncRecordChangesetProtobuf();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A83321C(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, a1);
}

uint64_t sub_21A83321C@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1(0) + 24);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A833274(a1, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A833274(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2(0) + 24);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.modify())()
{
  type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  return nullsub_1;
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t SyncChangesetResponse;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_21A8504D0;
  SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  v3 = a1 + *(int *)(SyncChangesetResponse + 28);
  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
}

uint64_t FetchSyncChangesetResponseProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21A833360((void (*)(_QWORD))type metadata accessor for FetchSyncChangesetResponseProtobuf, a1);
}

uint64_t sub_21A833360@<X0>(void (*a1)(_QWORD)@<X0>, _QWORD *a2@<X8>)
{
  *a2 = MEMORY[0x24BEE4AF8];
  a1(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static FetchSyncChangesetRequestProtobuf.protoMessageName.getter()
{
  return 0xD000000000000021;
}

uint64_t sub_21A8333BC(uint64_t a1)
{
  return sub_21A833C58(a1, qword_2550F9D08, (uint64_t)"zoneRequests", 12);
}

uint64_t static FetchSyncChangesetRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9D00, (uint64_t)qword_2550F9D08, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t FetchSyncChangesetRequestProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A833DA4(a1, a2, a3, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, &qword_2550F9E48, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t FetchSyncChangesetRequestProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A833EA0(a1, a2, a3, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, &qword_2550F9E48, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, (void (*)(_QWORD))type metadata accessor for FetchSyncChangesetRequestProtobuf);
}

uint64_t static FetchSyncChangesetRequestProtobuf.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A84ABF8, type metadata accessor for FetchSyncChangesetRequestProtobuf) & 1;
}

uint64_t FetchSyncChangesetRequestProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for FetchSyncChangesetRequestProtobuf, &qword_2550F9E50, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_21A8334AC@<X0>(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A8334D4()
{
  return 0xD000000000000021;
}

uint64_t (*sub_21A8334FC())()
{
  return nullsub_1;
}

uint64_t sub_21A833510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FetchSyncChangesetRequestProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_21A833524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FetchSyncChangesetRequestProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A83353C()
{
  sub_21A835654(&qword_2550FA138, type metadata accessor for FetchSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A833590@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9D00, (uint64_t)qword_2550F9D08, a1);
}

uint64_t sub_21A8335AC()
{
  sub_21A835654(&qword_2550F9E80, type metadata accessor for FetchSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A8335F0()
{
  sub_21A835654(&qword_2550F9E80, type metadata accessor for FetchSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A833644(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A84ABF8, type metadata accessor for FetchSyncChangesetRequestProtobuf) & 1;
}

unint64_t static FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.protoMessageName.getter()
{
  return 0xD00000000000003ELL;
}

uint64_t sub_21A833688()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550F9D28);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550F9D28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A8504E0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "zone";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "changeWindow";
  *((_QWORD *)v11 + 1) = 12;
  v11[16] = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9D20, (uint64_t)qword_2550F9D28, a1);
}

uint64_t sub_21A8337F4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_21A8501D8();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21A85007C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_21A850094();
      }
      else if (result == 1)
      {
        sub_21A8500DC();
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_21A850190(), !v1))
    __asm { BR              X10 }
  return result;
}

uint64_t FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, &qword_2550F9E58, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_21A833A28@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_21A8504D0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A833A58()
{
  return 0xD00000000000003ELL;
}

uint64_t (*sub_21A833A7C())()
{
  return nullsub_1;
}

uint64_t sub_21A833A90()
{
  return FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A833AA4()
{
  return FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A833AB8()
{
  sub_21A835654(&qword_2550FA130, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A833B08@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9D20, (uint64_t)qword_2550F9D28, a1);
}

uint64_t sub_21A833B24@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_21A8501D8();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_21A833B90()
{
  sub_21A835654(&qword_2550F9E48, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A833BD0()
{
  sub_21A835654(&qword_2550F9E48, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
  return sub_21A850118();
}

unint64_t static FetchSyncChangesetResponseProtobuf.protoMessageName.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_21A833C40(uint64_t a1)
{
  return sub_21A833C58(a1, qword_2550F9D48, (uint64_t)"zoneChangesets", 14);
}

uint64_t sub_21A833C58(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_21A8501D8();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21A8504F0;
  v12 = v11 + v10 + *(int *)(v8 + 48);
  *(_QWORD *)(v11 + v10) = 1;
  *(_QWORD *)v12 = a3;
  *(_QWORD *)(v12 + 8) = a4;
  *(_BYTE *)(v12 + 16) = 2;
  v13 = *MEMORY[0x24BE5C318];
  v14 = sub_21A8501B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
  return sub_21A8501C0();
}

uint64_t static FetchSyncChangesetResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9D40, (uint64_t)qword_2550F9D48, a1);
}

uint64_t FetchSyncChangesetResponseProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A833DA4(a1, a2, a3, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550F9E60, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A833DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t result;
  char v11;

  while (1)
  {
    result = sub_21A85007C();
    if (v6 || (v11 & 1) != 0)
      break;
    if (result == 1)
    {
      a4(0);
      sub_21A835654(a5, a4, a6);
      sub_21A8500E8();
    }
    v6 = 0;
  }
  return result;
}

uint64_t FetchSyncChangesetResponseProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A833EA0(a1, a2, a3, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550F9E60, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (void (*)(_QWORD))type metadata accessor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_21A833EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, uint64_t a6, void (*a7)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  void (*v13)(_QWORD);

  if (!*(_QWORD *)(*(_QWORD *)v7 + 16)
    || (v13 = a7, a4(0), sub_21A835654(a5, a4, a6), result = sub_21A85019C(), a7 = v13, !v8))
  {
    a7(0);
    return sub_21A850028();
  }
  return result;
}

uint64_t static FetchSyncChangesetResponseProtobuf.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A84A1DC, type metadata accessor for FetchSyncChangesetResponseProtobuf) & 1;
}

uint64_t FetchSyncChangesetResponseProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for FetchSyncChangesetResponseProtobuf, &qword_2550F9E68, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf);
}

unint64_t sub_21A833FDC()
{
  return 0xD000000000000022;
}

uint64_t sub_21A833FF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21A834038(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 20);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t sub_21A834078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FetchSyncChangesetResponseProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_21A83408C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FetchSyncChangesetResponseProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A8340A0()
{
  sub_21A835654(&qword_2550FA128, type metadata accessor for FetchSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A8340F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9D40, (uint64_t)qword_2550F9D48, a1);
}

uint64_t sub_21A83410C()
{
  sub_21A835654(&qword_2550F9EA8, type metadata accessor for FetchSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A83414C()
{
  sub_21A835654(&qword_2550F9EA8, type metadata accessor for FetchSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A83419C(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A84A1DC, type metadata accessor for FetchSyncChangesetResponseProtobuf) & 1;
}

unint64_t static FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.protoMessageName.getter()
{
  return 0xD000000000000038;
}

uint64_t sub_21A8341E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550F9D68);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550F9D68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A850500;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "zone";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "changeWindow";
  *((_QWORD *)v11 + 1) = 12;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "recordChangeset";
  *(_QWORD *)(v12 + 8) = 15;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9D60, (uint64_t)qword_2550F9D68, a1);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21A85007C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          sub_21A834454();
          break;
        case 2:
          sub_21A850094();
          break;
        case 1:
          sub_21A8500DC();
          break;
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t sub_21A834454()
{
  type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  type metadata accessor for SyncRecordChangesetProtobuf();
  sub_21A835654(&qword_2550FA150, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  return sub_21A8500F4();
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_21A850190(), !v1))
    __asm { BR              X10 }
  return result;
}

uint64_t sub_21A834614(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t SyncChangesetResponse;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SyncRecordChangesetProtobuf();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_21A832DFC(a1 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_21A836DBC((uint64_t)v4, &qword_2550F9E40);
  sub_21A832E44((uint64_t)v4, (uint64_t)v8);
  sub_21A835654(&qword_2550FA150, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  sub_21A8501A8();
  return sub_21A8330CC((uint64_t)v8);
}

uint64_t FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550F9E70, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A834794(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  sub_21A8502BC();
  a1(0);
  sub_21A835654(a2, a1, a3);
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A834810@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0xE000000000000000;
  *(_OWORD *)(a2 + 16) = xmmword_21A8504D0;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  v4 = a2 + *(int *)(a1 + 28);
  v5 = type metadata accessor for SyncRecordChangesetProtobuf();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
}

unint64_t sub_21A834878()
{
  return 0xD000000000000038;
}

uint64_t sub_21A834894@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21A8348D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 24);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t sub_21A834914()
{
  return FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A834928()
{
  return FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A83493C()
{
  sub_21A835654(&qword_2550FA120, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A83498C@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9D60, (uint64_t)qword_2550F9D68, a1);
}

uint64_t sub_21A8349A8()
{
  sub_21A835654(&qword_2550F9E60, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A8349E8()
{
  sub_21A8502BC();
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A834A3C()
{
  sub_21A835654(&qword_2550F9E60, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A834A8C()
{
  sub_21A8502BC();
  sub_21A8501F0();
  return sub_21A8502D4();
}

void sub_21A834AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_21A834B40(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x21A834D24);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_21A834D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_21A834AE0((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_21A834E1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

  result = sub_21A84FF38();
  v11 = result;
  if (result)
  {
    result = sub_21A84FF50();
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
  v14 = sub_21A84FF44();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_21A834AE0(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_21A834ED0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21A834F1C()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_21A834F50 + *((int *)qword_21A835128 + (v0 >> 62))))();
}

uint64_t sub_21A834F60@<X0>(int a1@<W8>)
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

uint64_t _s21SeymourServerProtocol34FetchSyncChangesetResponseProtobufV04ZonefH0V2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
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
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  uint64_t SyncChangesetResponse;
  uint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  char v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;

  v4 = sub_21A850040();
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v42 = (char *)&v40 - v7;
  v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v41 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA140);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v40 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v40 - v21;
  if (*a1 == *a2 && a1[1] == a2[1] || (v23 = 0, (sub_21A85025C() & 1) != 0))
  {
    sub_21A834ED0(a1[2], a1[3]);
    if ((v24 & 1) != 0)
    {
      SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
      sub_21A832DFC((uint64_t)a1 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v22);
      v40 = SyncChangesetResponse;
      sub_21A832DFC((uint64_t)a2 + *(int *)(SyncChangesetResponse + 28), (uint64_t)v20);
      v26 = (uint64_t)&v13[*(int *)(v11 + 48)];
      sub_21A832DFC((uint64_t)v22, (uint64_t)v13);
      sub_21A832DFC((uint64_t)v20, v26);
      v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      if (v27((uint64_t)v13, 1, v8) == 1)
      {
        sub_21A836DBC((uint64_t)v20, &qword_2550F9E40);
        sub_21A836DBC((uint64_t)v22, &qword_2550F9E40);
        if (v27(v26, 1, v8) == 1)
        {
          sub_21A836DBC((uint64_t)v13, &qword_2550F9E40);
LABEL_14:
          v31 = v40;
          v32 = (char *)a1 + *(int *)(v40 + 24);
          v34 = v44;
          v33 = v45;
          v35 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
          v36 = v42;
          v35(v42, v32, v45);
          v37 = (char *)a2 + *(int *)(v31 + 24);
          v38 = v43;
          v35(v43, v37, v33);
          sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
          v23 = sub_21A8501FC();
          v39 = *(void (**)(char *, uint64_t))(v34 + 8);
          v39(v38, v33);
          v39(v36, v33);
          return v23 & 1;
        }
      }
      else
      {
        sub_21A832DFC((uint64_t)v13, (uint64_t)v17);
        if (v27(v26, 1, v8) != 1)
        {
          v29 = v41;
          sub_21A832E44(v26, v41);
          v30 = static SyncRecordChangesetProtobuf.== infix(_:_:)(v17, v29);
          sub_21A8330CC(v29);
          sub_21A836DBC((uint64_t)v20, &qword_2550F9E40);
          sub_21A836DBC((uint64_t)v22, &qword_2550F9E40);
          sub_21A8330CC((uint64_t)v17);
          sub_21A836DBC((uint64_t)v13, &qword_2550F9E40);
          if ((v30 & 1) != 0)
            goto LABEL_14;
          goto LABEL_11;
        }
        sub_21A836DBC((uint64_t)v20, &qword_2550F9E40);
        sub_21A836DBC((uint64_t)v22, &qword_2550F9E40);
        sub_21A8330CC((uint64_t)v17);
      }
      sub_21A836DBC((uint64_t)v13, &qword_2550FA140);
    }
LABEL_11:
    v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_21A835518(_QWORD *a1, char *a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t (*a4)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;

  v8 = sub_21A850040();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  if ((a3(*a1, *(_QWORD *)a2) & 1) != 0)
  {
    v15 = a4(0);
    v16 = (char *)a1 + *(int *)(v15 + 20);
    v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v17(v14, v16, v8);
    v17(v12, &a2[*(int *)(v15 + 20)], v8);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v18 = sub_21A8501FC();
    v19 = *(void (**)(char *, uint64_t))(v9 + 8);
    v19(v12, v8);
    v19(v14, v8);
  }
  else
  {
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_21A835654(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22074A8B0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s21SeymourServerProtocol33FetchSyncChangesetRequestProtobufV04ZonefgH0V2eeoiySbAE_AEtFZ_0(_QWORD *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  char v12;
  char v13;
  uint64_t SyncChangesetRequest;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *a1 == *(_QWORD *)a2 && a1[1] == *((_QWORD *)a2 + 1);
  if (v11 || (v12 = 0, (sub_21A85025C() & 1) != 0))
  {
    sub_21A834ED0(a1[2], a1[3]);
    if ((v13 & 1) != 0)
    {
      SyncChangesetRequest = type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0);
      v15 = (char *)a1 + *(int *)(SyncChangesetRequest + 24);
      v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v16(v10, v15, v4);
      v16(v8, &a2[*(int *)(SyncChangesetRequest + 24)], v4);
      sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v12 = sub_21A8501FC();
      v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
    }
    else
    {
      v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t sub_21A8357EC()
{
  return sub_21A835654(&qword_2550F9E78, type metadata accessor for FetchSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_21A835818()
{
  return sub_21A835654(&qword_2550F9E80, type metadata accessor for FetchSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_21A835844()
{
  return sub_21A835654(&qword_2550F9E50, type metadata accessor for FetchSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_21A835870()
{
  return sub_21A835654(&qword_2550F9E88, type metadata accessor for FetchSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf);
}

uint64_t sub_21A83589C()
{
  return sub_21A835654(&qword_2550F9E90, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_21A8358C8()
{
  return sub_21A835654(&qword_2550F9E48, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_21A8358F4()
{
  return sub_21A835654(&qword_2550F9E58, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_21A835920()
{
  return sub_21A835654(&qword_2550F9E98, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
}

uint64_t sub_21A83594C()
{
  return sub_21A835654(&qword_2550F9EA0, type metadata accessor for FetchSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_21A835978()
{
  return sub_21A835654(&qword_2550F9EA8, type metadata accessor for FetchSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_21A8359A4()
{
  return sub_21A835654(&qword_2550F9E68, type metadata accessor for FetchSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_21A8359D0()
{
  return sub_21A835654(&qword_2550F9EB0, type metadata accessor for FetchSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf);
}

uint64_t sub_21A8359FC()
{
  return sub_21A835654(&qword_2550F9EB8, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A835A28()
{
  return sub_21A835654(&qword_2550F9E60, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A835A54()
{
  return sub_21A835654(&qword_2550F9E70, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A835A80()
{
  return sub_21A835654(&qword_2550F9EC0, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t getEnumTagSinglePayload for FetchSyncChangesetRequestProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for FetchSyncChangesetRequestProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *initializeBufferWithCopyOfBuffer for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[2];
    v9 = a2[3];
    swift_bridgeObjectRetain();
    sub_21A8327FC(v8, v9);
    a1[2] = v8;
    a1[3] = v9;
    v10 = *(int *)(a3 + 24);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_21A850040();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t destroy for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  sub_21A832844(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[2];
  v8 = a2[3];
  swift_bridgeObjectRetain();
  sub_21A8327FC(v7, v8);
  a1[2] = v7;
  a1[3] = v8;
  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

_QWORD *assignWithCopy for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[2];
  v7 = a2[3];
  sub_21A8327FC(v6, v7);
  v8 = a1[2];
  v9 = a1[3];
  a1[2] = v6;
  a1[3] = v7;
  sub_21A832844(v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *initializeWithTake for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a1[2];
  v8 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_21A832844(v7, v8);
  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = a2 + v9;
  v12 = sub_21A850040();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A835DF0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A835E78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A835EEC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitScoresRequestProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_21A850040();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for SubmitScoresRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for SubmitScoresRequestProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for SubmitScoresRequestProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *initializeWithTake for SubmitScoresRequestProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for SubmitScoresRequestProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchSyncChangesetResponseProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21A850040();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for FetchSyncChangesetResponseProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *__swift_store_extra_inhabitant_indexTm(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_21A850040();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A836304()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[2];
    v9 = a2[3];
    swift_bridgeObjectRetain();
    sub_21A8327FC(v8, v9);
    a1[2] = v8;
    a1[3] = v9;
    v10 = *(int *)(a3 + 24);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_21A850040();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    v15 = *(int *)(a3 + 28);
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = type metadata accessor for SyncRecordChangesetProtobuf();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      v22 = v17[1];
      *v16 = *v17;
      v16[1] = v22;
      v16[2] = v17[2];
      v23 = *(int *)(v18 + 28);
      v24 = (char *)v16 + v23;
      v25 = (char *)v17 + v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14(v24, v25, v13);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t destroy for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void (*v9)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  sub_21A832844(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_21A850040();
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v9(v4, v5);
  v6 = a1 + *(int *)(a2 + 28);
  v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v6 + *(int *)(v7 + 28), v5);
  }
  return result;
}

_QWORD *initializeWithCopy for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[2];
  v8 = a2[3];
  swift_bridgeObjectRetain();
  sub_21A8327FC(v7, v8);
  a1[2] = v7;
  a1[3] = v8;
  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_21A850040();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  v14 = *(int *)(a3 + 28);
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = type metadata accessor for SyncRecordChangesetProtobuf();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v20 = v16[1];
    *v15 = *v16;
    v15[1] = v20;
    v15[2] = v16[2];
    v21 = *(int *)(v17 + 28);
    v22 = (char *)v15 + v21;
    v23 = (char *)v16 + v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v22, v23, v12);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

_QWORD *assignWithCopy for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  uint64_t v23;
  char *v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[2];
  v7 = a2[3];
  sub_21A8327FC(v6, v7);
  v8 = a1[2];
  v9 = a1[3];
  a1[2] = v6;
  a1[3] = v7;
  sub_21A832844(v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_21A850040();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(char *, char *, uint64_t))(v14 + 24);
  v15(v11, v12, v13);
  v16 = *(int *)(a3 + 28);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = type metadata accessor for SyncRecordChangesetProtobuf();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v12) = v21(v17, 1, v19);
  v22 = v21(v18, 1, v19);
  if (!(_DWORD)v12)
  {
    if (!v22)
    {
      *(_QWORD *)v17 = *(_QWORD *)v18;
      *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v15(&v17[*(int *)(v19 + 28)], &v18[*(int *)(v19 + 28)], v13);
      return a1;
    }
    sub_21A8330CC((uint64_t)v17);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
  v23 = *(int *)(v19 + 28);
  v24 = &v17[v23];
  v25 = &v18[v23];
  v26 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26(v24, v25, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

_OWORD *initializeWithTake for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21A850040();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 28);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = type metadata accessor for SyncRecordChangesetProtobuf();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
    v13[2] = v14[2];
    v11((char *)v13 + *(int *)(v15 + 28), (char *)v14 + *(int *)(v15 + 28), v10);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

_QWORD *assignWithTake for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  uint64_t v22;

  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a1[2];
  v8 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_21A832844(v7, v8);
  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = a2 + v9;
  v12 = sub_21A850040();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 40);
  v14(v10, v11, v12);
  v15 = *(int *)(a3 + 28);
  v16 = (char *)a1 + v15;
  v17 = (char *)(a2 + v15);
  v18 = type metadata accessor for SyncRecordChangesetProtobuf();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v11) = v20(v16, 1, v18);
  v21 = v20(v17, 1, v18);
  if (!(_DWORD)v11)
  {
    if (!v21)
    {
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
      swift_bridgeObjectRelease();
      *((_QWORD *)v16 + 2) = *((_QWORD *)v17 + 2);
      swift_bridgeObjectRelease();
      v14(&v16[*(int *)(v18 + 28)], (uint64_t)&v17[*(int *)(v18 + 28)], v12);
      return a1;
    }
    sub_21A8330CC((uint64_t)v16);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    return a1;
  }
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *((_QWORD *)v16 + 2) = *((_QWORD *)v17 + 2);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v16[*(int *)(v18 + 28)], &v17[*(int *)(v18 + 28)], v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A836B80(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21A850040();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A836C30(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v8 = sub_21A850040();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_21A836CD0()
{
  unint64_t v0;
  unint64_t v1;

  sub_21A850040();
  if (v0 <= 0x3F)
  {
    sub_21A836D68();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_21A836D68()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2550FA0E8[0])
  {
    type metadata accessor for SyncRecordChangesetProtobuf();
    v0 = sub_21A850220();
    if (!v1)
      atomic_store(v0, qword_2550FA0E8);
  }
}

uint64_t sub_21A836DBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t FetchScoresResponseProtobuf.communityScores.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t ScoresResponseProtobuf;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  sub_21A836F60(v1 + *(int *)(ScoresResponseProtobuf + 20), (uint64_t)v5);
  v7 = sub_21A84FF8C();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v5, v7);
  sub_21A84FF80();
  return sub_21A836DBC((uint64_t)v5, &qword_2550FA180);
}

uint64_t type metadata accessor for FetchScoresResponseProtobuf()
{
  uint64_t result;

  result = qword_2550FA200;
  if (!qword_2550FA200)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21A836F60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A836FA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t ScoresResponseProtobuf;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  sub_21A836F60(a1 + *(int *)(ScoresResponseProtobuf + 20), (uint64_t)v6);
  v8 = sub_21A84FF8C();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v6, v8);
  sub_21A84FF80();
  return sub_21A836DBC((uint64_t)v6, &qword_2550FA180);
}

uint64_t sub_21A837080(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_21A84FF8C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = a2 + *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  sub_21A836DBC(v8, &qword_2550FA180);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v8, v7, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t FetchScoresResponseProtobuf.communityScores.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  sub_21A836DBC(v3, &qword_2550FA180);
  v4 = sub_21A84FF8C();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
}

void (*FetchScoresResponseProtobuf.communityScores.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = sub_21A84FF8C();
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  *((_DWORD *)v3 + 12) = v10;
  sub_21A836F60(v1 + v10, (uint64_t)v5);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_21A84FF80();
    sub_21A836DBC((uint64_t)v5, &qword_2550FA180);
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v9, v5, v6);
  }
  return sub_21A8372D4;
}

void sub_21A8372D4(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = *(void **)a1;
  v3 = *(int *)(*(_QWORD *)a1 + 48);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  v5 = *(void **)(*(_QWORD *)a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v8 = *(void **)(*(_QWORD *)a1 + 8);
  v9 = **(_QWORD **)a1 + v3;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v7 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 32), v5, v6);
    sub_21A836DBC(v9, &qword_2550FA180);
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 32))(v9, v4, v6);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v5, v6);
  }
  else
  {
    sub_21A836DBC(**(_QWORD **)a1 + v3, &qword_2550FA180);
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 32))(v9, v5, v6);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
  }
  free(v5);
  free(v4);
  free(v8);
  free(v2);
}

BOOL FetchScoresResponseProtobuf.hasCommunityScores.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t ScoresResponseProtobuf;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  sub_21A836F60(v0 + *(int *)(ScoresResponseProtobuf + 20), (uint64_t)v3);
  v5 = sub_21A84FF8C();
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_21A836DBC((uint64_t)v3, &qword_2550FA180);
  return v6;
}

Swift::Void __swiftcall FetchScoresResponseProtobuf.clearCommunityScores()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  sub_21A836DBC(v1, &qword_2550FA180);
  v2 = sub_21A84FF8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t FetchScoresResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t FetchScoresResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*FetchScoresResponseProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t FetchScoresResponseProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  v2 = a1 + *(int *)(type metadata accessor for FetchScoresResponseProtobuf() + 20);
  v3 = sub_21A84FF8C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
}

unint64_t static FetchScoresResponseProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21A8375D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA168);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA168);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21A8504F0;
  v5 = v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v4 + v3) = 1;
  *(_QWORD *)v5 = "communityScores";
  *(_QWORD *)(v5 + 8) = 15;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x24BE5C318];
  v7 = sub_21A8501B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  return sub_21A8501C0();
}

uint64_t static FetchScoresResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9D80 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FA168);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t FetchScoresResponseProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_21A85007C();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
      sub_21A8377B4();
  }
  return result;
}

uint64_t sub_21A8377B4()
{
  type metadata accessor for FetchScoresResponseProtobuf();
  sub_21A84FF8C();
  sub_21A835654(&qword_2550FA258, (uint64_t (*)(uint64_t))MEMORY[0x24BE8BC10], MEMORY[0x24BE8BC00]);
  return sub_21A8500F4();
}

uint64_t FetchScoresResponseProtobuf.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  result = sub_21A83789C(v0);
  if (!v1)
    return sub_21A850028();
  return result;
}

uint64_t sub_21A83789C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t ScoresResponseProtobuf;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21A84FF8C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  sub_21A836F60(a1 + *(int *)(ScoresResponseProtobuf + 20), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_21A836DBC((uint64_t)v4, &qword_2550FA180);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_21A835654(&qword_2550FA258, (uint64_t (*)(uint64_t))MEMORY[0x24BE8BC10], MEMORY[0x24BE8BC00]);
  sub_21A8501A8();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t FetchScoresResponseProtobuf.hashValue.getter()
{
  sub_21A8502BC();
  type metadata accessor for FetchScoresResponseProtobuf();
  sub_21A835654(&qword_2550FA188, (uint64_t (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchScoresResponseProtobuf);
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A837A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  v4 = a2 + *(int *)(a1 + 20);
  v5 = sub_21A84FF8C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
}

unint64_t sub_21A837AC8()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21A837AE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_21A837B1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*sub_21A837B54())()
{
  return nullsub_1;
}

uint64_t sub_21A837B64()
{
  return FetchScoresResponseProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A837B78()
{
  return FetchScoresResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A837B8C()
{
  sub_21A835654(&qword_2550FA240, (uint64_t (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchScoresResponseProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A837BDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9D80 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FA168);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_21A837C4C()
{
  sub_21A835654(&qword_2550FA198, (uint64_t (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchScoresResponseProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A837C8C()
{
  sub_21A835654(&qword_2550FA198, (uint64_t (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchScoresResponseProtobuf);
  return sub_21A850118();
}

uint64_t _s21SeymourServerProtocol27FetchScoresResponseProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t ScoresResponseProtobuf;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  char *v28;
  char v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  char *v34;
  char *v35;
  char v36;
  void (*v37)(char *, uint64_t);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v4 = sub_21A850040();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)&v39 - v7;
  v8 = sub_21A84FF8C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v40 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA248);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v39 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v39 - v21;
  ScoresResponseProtobuf = type metadata accessor for FetchScoresResponseProtobuf();
  v24 = *(int *)(ScoresResponseProtobuf + 20);
  v41 = a1;
  sub_21A836F60(a1 + v24, (uint64_t)v22);
  v25 = *(int *)(ScoresResponseProtobuf + 20);
  v42 = a2;
  sub_21A836F60(a2 + v25, (uint64_t)v20);
  v26 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_21A836F60((uint64_t)v22, (uint64_t)v13);
  sub_21A836F60((uint64_t)v20, v26);
  v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v27((uint64_t)v13, 1, v8) != 1)
  {
    sub_21A836F60((uint64_t)v13, (uint64_t)v17);
    if (v27(v26, 1, v8) != 1)
    {
      v28 = v40;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v40, v26, v8);
      sub_21A835654(&qword_2550FA250, (uint64_t (*)(uint64_t))MEMORY[0x24BE8BC10], MEMORY[0x24BE8BC20]);
      v29 = sub_21A8501FC();
      v30 = *(void (**)(char *, uint64_t))(v9 + 8);
      v30(v28, v8);
      sub_21A836DBC((uint64_t)v20, &qword_2550FA180);
      sub_21A836DBC((uint64_t)v22, &qword_2550FA180);
      v30(v17, v8);
      sub_21A836DBC((uint64_t)v13, &qword_2550FA180);
      if ((v29 & 1) != 0)
        goto LABEL_8;
LABEL_9:
      v36 = 0;
      return v36 & 1;
    }
    sub_21A836DBC((uint64_t)v20, &qword_2550FA180);
    sub_21A836DBC((uint64_t)v22, &qword_2550FA180);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
LABEL_6:
    sub_21A836DBC((uint64_t)v13, &qword_2550FA248);
    goto LABEL_9;
  }
  sub_21A836DBC((uint64_t)v20, &qword_2550FA180);
  sub_21A836DBC((uint64_t)v22, &qword_2550FA180);
  if (v27(v26, 1, v8) != 1)
    goto LABEL_6;
  sub_21A836DBC((uint64_t)v13, &qword_2550FA180);
LABEL_8:
  v32 = v45;
  v31 = v46;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 16);
  v34 = v43;
  v33(v43, v41, v46);
  v35 = v44;
  v33(v44, v42, v31);
  sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v36 = sub_21A8501FC();
  v37 = *(void (**)(char *, uint64_t))(v32 + 8);
  v37(v35, v31);
  v37(v34, v31);
  return v36 & 1;
}

uint64_t sub_21A8380B8()
{
  return sub_21A835654(&qword_2550FA190, (uint64_t (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchScoresResponseProtobuf);
}

uint64_t sub_21A8380E4()
{
  return sub_21A835654(&qword_2550FA198, (uint64_t (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchScoresResponseProtobuf);
}

uint64_t sub_21A838110()
{
  return sub_21A835654(&qword_2550FA188, (uint64_t (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchScoresResponseProtobuf);
}

uint64_t sub_21A83813C()
{
  return sub_21A835654(&qword_2550FA1A0, (uint64_t (*)(uint64_t))type metadata accessor for FetchScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchScoresResponseProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for FetchScoresResponseProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_21A850040();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21A84FF8C();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_21A84FF8C();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t initializeWithCopy for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_21A84FF8C();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_21A84FF8C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_21A84FF8C();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for FetchScoresResponseProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_21A84FF8C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchScoresResponseProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83871C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_21A850040();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for FetchScoresResponseProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A8387A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_21A850040();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA180);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_21A838820()
{
  unint64_t v0;
  unint64_t v1;

  sub_21A850040();
  if (v0 <= 0x3F)
  {
    sub_21A8388A4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_21A8388A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2550FA210)
  {
    sub_21A84FF8C();
    v0 = sub_21A850220();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2550FA210);
  }
}

uint64_t FetchSyncableCountsRequestProtobuf.zones.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FetchSyncableCountsRequestProtobuf.zones.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*FetchSyncableCountsRequestProtobuf.zones.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncableCountsRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for FetchSyncableCountsRequestProtobuf, a1);
}

uint64_t type metadata accessor for FetchSyncableCountsRequestProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FA328);
}

uint64_t FetchSyncableCountsRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for FetchSyncableCountsRequestProtobuf);
}

uint64_t (*FetchSyncableCountsRequestProtobuf.unknownFields.modify())()
{
  type metadata accessor for FetchSyncableCountsRequestProtobuf(0);
  return nullsub_1;
}

uint64_t FetchSyncableCountsRequestProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
  type metadata accessor for FetchSyncableCountsRequestProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A8389C8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA400);
  v2 = (_QWORD *)sub_21A850244();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_21A83F4EC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 6;
    v2[2] = v13;
    if (!--v3)
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

uint64_t (*FetchSyncableCountsResponseProtobuf.countsByZone.modify())()
{
  return nullsub_1;
}

uint64_t FetchSyncableCountsResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for FetchSyncableCountsResponseProtobuf, a1);
}

uint64_t type metadata accessor for FetchSyncableCountsResponseProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FA3B8);
}

uint64_t FetchSyncableCountsResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for FetchSyncableCountsResponseProtobuf);
}

uint64_t (*FetchSyncableCountsResponseProtobuf.unknownFields.modify())()
{
  type metadata accessor for FetchSyncableCountsResponseProtobuf(0);
  return nullsub_1;
}

uint64_t FetchSyncableCountsResponseProtobuf.init()@<X0>(unint64_t *a1@<X8>)
{
  *a1 = sub_21A8389C8(MEMORY[0x24BEE4AF8]);
  type metadata accessor for FetchSyncableCountsResponseProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static FetchSyncableCountsRequestProtobuf.protoMessageName.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_21A838B98(uint64_t a1)
{
  return sub_21A833C58(a1, qword_2550FA260, (uint64_t)"zones", 5);
}

uint64_t static FetchSyncableCountsRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9D88, (uint64_t)qword_2550FA260, a1);
}

uint64_t FetchSyncableCountsRequestProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_21A85007C();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
      sub_21A8500C4();
  }
  return result;
}

uint64_t FetchSyncableCountsRequestProtobuf.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 16) || (result = sub_21A850178(), !v1))
  {
    type metadata accessor for FetchSyncableCountsRequestProtobuf(0);
    return sub_21A850028();
  }
  return result;
}

uint64_t static FetchSyncableCountsRequestProtobuf.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, (uint64_t (*)(_QWORD, _QWORD))sub_21A84A118, type metadata accessor for FetchSyncableCountsRequestProtobuf) & 1;
}

uint64_t FetchSyncableCountsRequestProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for FetchSyncableCountsRequestProtobuf, &qword_2550FA290, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsRequestProtobuf);
}

unint64_t sub_21A838D10()
{
  return 0xD000000000000022;
}

uint64_t sub_21A838D2C()
{
  return FetchSyncableCountsRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A838D40()
{
  return FetchSyncableCountsRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A838D54()
{
  sub_21A835654(&qword_2550FA3F8, type metadata accessor for FetchSyncableCountsRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsRequestProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A838DA4@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9D88, (uint64_t)qword_2550FA260, a1);
}

uint64_t sub_21A838DC0()
{
  sub_21A835654(&qword_2550FA2A8, type metadata accessor for FetchSyncableCountsRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsRequestProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A838E00()
{
  sub_21A835654(&qword_2550FA2A8, type metadata accessor for FetchSyncableCountsRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsRequestProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A838E50(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, (uint64_t (*)(_QWORD, _QWORD))sub_21A84A118, type metadata accessor for FetchSyncableCountsRequestProtobuf) & 1;
}

unint64_t static FetchSyncableCountsResponseProtobuf.protoMessageName.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_21A838E94(uint64_t a1)
{
  return sub_21A833C58(a1, qword_2550FA278, (uint64_t)"countsByZone", 12);
}

uint64_t static FetchSyncableCountsResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9D90, (uint64_t)qword_2550FA278, a1);
}

uint64_t FetchSyncableCountsResponseProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_21A85007C();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
      sub_21A838F38();
  }
  return result;
}

uint64_t sub_21A838F38()
{
  sub_21A850010();
  sub_21A85001C();
  return sub_21A850070();
}

uint64_t FetchSyncableCountsResponseProtobuf.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 16) || (sub_21A850010(), sub_21A85001C(), result = sub_21A850130(), !v1))
  {
    type metadata accessor for FetchSyncableCountsResponseProtobuf(0);
    return sub_21A850028();
  }
  return result;
}

uint64_t static FetchSyncableCountsResponseProtobuf.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A83926C, type metadata accessor for FetchSyncableCountsResponseProtobuf) & 1;
}

uint64_t FetchSyncableCountsResponseProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for FetchSyncableCountsResponseProtobuf, &qword_2550FA298, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_21A8390C8@<X0>(unint64_t *a1@<X8>)
{
  *a1 = sub_21A8389C8(MEMORY[0x24BEE4AF8]);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A839104()
{
  return 0xD000000000000023;
}

uint64_t sub_21A839120()
{
  return FetchSyncableCountsResponseProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A839134()
{
  return FetchSyncableCountsResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A839148()
{
  sub_21A835654(&qword_2550FA3F0, type metadata accessor for FetchSyncableCountsResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsResponseProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A839198@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9D90, (uint64_t)qword_2550FA278, a1);
}

uint64_t sub_21A8391B4()
{
  sub_21A835654(&qword_2550FA2C0, type metadata accessor for FetchSyncableCountsResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsResponseProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A8391F4()
{
  sub_21A835654(&qword_2550FA2C0, type metadata accessor for FetchSyncableCountsResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsResponseProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A839244(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A83926C, type metadata accessor for FetchSyncableCountsResponseProtobuf) & 1;
}

uint64_t sub_21A83926C(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  char v20;
  char v21;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9)
      return 1;
    v13 = *(_QWORD *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v9)
        return 1;
      v13 = *(_QWORD *)(v5 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v9)
          return 1;
        v13 = *(_QWORD *)(v5 + 8 * v4);
        if (!v13)
        {
          v4 = v12 + 3;
          if (v12 + 3 >= v9)
            return 1;
          v13 = *(_QWORD *)(v5 + 8 * v4);
          if (!v13)
            break;
        }
      }
    }
LABEL_23:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v16 = *v15;
    v17 = v15[1];
    v18 = *(_DWORD *)(*(_QWORD *)(v3 + 56) + 4 * v11);
    swift_bridgeObjectRetain();
    v19 = sub_21A83F4EC(v16, v17);
    v21 = v20;
    result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0 || *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * v19) != v18)
      return 0;
  }
  v14 = v12 + 4;
  if (v14 >= v9)
    return 1;
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v9)
      return 1;
    v13 = *(_QWORD *)(v5 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_23;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_21A839414()
{
  return sub_21A835654(&qword_2550FA2A0, type metadata accessor for FetchSyncableCountsRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsRequestProtobuf);
}

uint64_t sub_21A839440()
{
  return sub_21A835654(&qword_2550FA2A8, type metadata accessor for FetchSyncableCountsRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsRequestProtobuf);
}

uint64_t sub_21A83946C()
{
  return sub_21A835654(&qword_2550FA290, type metadata accessor for FetchSyncableCountsRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsRequestProtobuf);
}

uint64_t sub_21A839498()
{
  return sub_21A835654(&qword_2550FA2B0, type metadata accessor for FetchSyncableCountsRequestProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsRequestProtobuf);
}

uint64_t sub_21A8394C4()
{
  return sub_21A835654(&qword_2550FA2B8, type metadata accessor for FetchSyncableCountsResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_21A8394F0()
{
  return sub_21A835654(&qword_2550FA2C0, type metadata accessor for FetchSyncableCountsResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_21A83951C()
{
  return sub_21A835654(&qword_2550FA298, type metadata accessor for FetchSyncableCountsResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsResponseProtobuf);
}

uint64_t sub_21A839548()
{
  return sub_21A835654(&qword_2550FA2C8, type metadata accessor for FetchSyncableCountsResponseProtobuf, (uint64_t)&protocol conformance descriptor for FetchSyncableCountsResponseProtobuf);
}

uint64_t getEnumTagSinglePayload for FetchSyncableCountsRequestProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for FetchSyncableCountsRequestProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for FetchSyncableCountsResponseProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for FetchSyncableCountsResponseProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void ServerErrorProtobuf.type.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t ServerErrorProtobuf.type.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = v2;
  return result;
}

uint64_t (*ServerErrorProtobuf.type.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.zone.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ServerErrorProtobuf.zone.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ServerErrorProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.zones.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ServerErrorProtobuf.zones.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*ServerErrorProtobuf.zones.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.argumentName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ServerErrorProtobuf.argumentName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*ServerErrorProtobuf.argumentName.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.errorDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ServerErrorProtobuf.errorDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t (*ServerErrorProtobuf.errorDescription.modify())()
{
  return nullsub_1;
}

uint64_t ServerErrorProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ServerErrorProtobuf() + 36);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ServerErrorProtobuf()
{
  uint64_t result;

  result = qword_2550FA4E8;
  if (!qword_2550FA4E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ServerErrorProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ServerErrorProtobuf() + 36);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*ServerErrorProtobuf.unknownFields.modify())()
{
  type metadata accessor for ServerErrorProtobuf();
  return nullsub_1;
}

void ServerErrorProtobuf.ErrorType.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

unint64_t ServerErrorProtobuf.ErrorType.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 0xD;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t ServerErrorProtobuf.ErrorType.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_21A8398A8()
{
  qword_2550FA408 = (uint64_t)&unk_24DD2D928;
}

uint64_t static ServerErrorProtobuf.ErrorType.allCases.getter()
{
  if (qword_2550F9D98 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

void sub_21A8398FC(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t sub_21A839910()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_21A839918@<X0>(_QWORD *a1@<X8>)
{
  if (qword_2550F9D98 != -1)
    swift_once();
  *a1 = qword_2550FA408;
  return swift_bridgeObjectRetain();
}

unint64_t sub_21A839968@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return ServerErrorProtobuf.ErrorType.init(rawValue:)(*a1, a2);
}

void sub_21A839970(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_21A83997C()
{
  sub_21A8502BC();
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A8399E4()
{
  sub_21A83A110();
  return sub_21A850064();
}

uint64_t sub_21A839A1C()
{
  sub_21A8502BC();
  sub_21A8501F0();
  return sub_21A8502D4();
}

BOOL sub_21A839A80(uint64_t a1, uint64_t *a2)
{
  return sub_21A839BCC(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

uint64_t sub_21A839A9C(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEE00736574794264;
  v3 = 0x6574707972636E65;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000010;
    else
      v5 = 0x696669746E656469;
    if (v4 == 1)
      v6 = 0x800000021A853500;
    else
      v6 = 0xEA00000000007265;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x6574707972636E65;
  v6 = 0xEE00736574794264;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0xD000000000000010;
    else
      v3 = 0x696669746E656469;
    if (v7 == 1)
      v2 = 0x800000021A853500;
    else
      v2 = 0xEA00000000007265;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_21A85025C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_21A839BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t ServerErrorProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0xE000000000000000;
  *(_QWORD *)(a1 + 32) = v1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0xE000000000000000;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0xE000000000000000;
  type metadata accessor for ServerErrorProtobuf();
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ServerErrorProtobuf.protoMessageName.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_21A839C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA410);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA410);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A8510B0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "type";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "zone";
  *(_QWORD *)(v11 + 8) = 4;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "zones";
  *((_QWORD *)v13 + 1) = 5;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "argumentName";
  *((_QWORD *)v15 + 1) = 12;
  v15[16] = 2;
  v10();
  v16 = v6 + 4 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 4 * v3) = 5;
  *(_QWORD *)v16 = "errorDescription";
  *(_QWORD *)(v16 + 8) = 16;
  *(_BYTE *)(v16 + 16) = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static ServerErrorProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DA0, (uint64_t)qword_2550FA410, a1);
}

uint64_t ServerErrorProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_21A85007C();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_21A83A110();
          v4 = v3;
          sub_21A850088();
          goto LABEL_5;
        case 2:
        case 4:
        case 5:
          v4 = v3;
          sub_21A8500DC();
          goto LABEL_5;
        case 3:
          v4 = v3;
          sub_21A8500C4();
LABEL_5:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t ServerErrorProtobuf.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*v0 || (sub_21A83A110(), result = sub_21A85013C(), !v1))
  {
    v3 = v0[3];
    v4 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0)
      v4 = v0[2] & 0xFFFFFFFFFFFFLL;
    if (!v4 || (result = sub_21A850190(), !v1))
    {
      if (!*(_QWORD *)(v0[4] + 16) || (result = sub_21A850178(), !v1))
      {
        v5 = v0[6];
        v6 = HIBYTE(v5) & 0xF;
        if ((v5 & 0x2000000000000000) == 0)
          v6 = v0[5] & 0xFFFFFFFFFFFFLL;
        if (!v6 || (result = sub_21A850190(), !v1))
        {
          v7 = v0[8];
          v8 = HIBYTE(v7) & 0xF;
          if ((v7 & 0x2000000000000000) == 0)
            v8 = v0[7] & 0xFFFFFFFFFFFFLL;
          if (!v8 || (result = sub_21A850190(), !v1))
          {
            type metadata accessor for ServerErrorProtobuf();
            return sub_21A850028();
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_21A83A110()
{
  unint64_t result;

  result = qword_2550FA440;
  if (!qword_2550FA440)
  {
    result = MEMORY[0x22074A8B0](&protocol conformance descriptor for ServerErrorProtobuf.ErrorType, &type metadata for ServerErrorProtobuf.ErrorType);
    atomic_store(result, (unint64_t *)&qword_2550FA440);
  }
  return result;
}

uint64_t ServerErrorProtobuf.hashValue.getter()
{
  sub_21A8502BC();
  type metadata accessor for ServerErrorProtobuf();
  sub_21A835654(&qword_2550FA448, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A83A1C4@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0xE000000000000000;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0xE000000000000000;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0xE000000000000000;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A83A208()
{
  return 0xD000000000000013;
}

uint64_t sub_21A83A224@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 36);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21A83A264(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 36);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_21A83A2A4())()
{
  return nullsub_1;
}

uint64_t sub_21A83A2B8()
{
  return ServerErrorProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A83A2CC()
{
  return ServerErrorProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A83A2E0()
{
  sub_21A835654(&qword_2550FA530, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A83A330@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DA0, (uint64_t)qword_2550FA410, a1);
}

uint64_t sub_21A83A34C()
{
  sub_21A835654(&qword_2550FA480, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A83A38C()
{
  sub_21A835654(&qword_2550FA480, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A83A3E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  _QWORD *v27;
  char *v28;
  _QWORD *v29;
  char *v30;
  _QWORD *v31;
  char *v32;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA428);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA428);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A8510C0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "bootstrapRequired";
  *(_QWORD *)(v7 + 8) = 17;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "mismatchedZones";
  *(_QWORD *)(v11 + 8) = 15;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "invalidZone";
  *((_QWORD *)v13 + 1) = 11;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "invalidPayload";
  *((_QWORD *)v15 + 1) = 14;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 4;
  *(_QWORD *)v17 = "invalidArgument";
  *((_QWORD *)v17 + 1) = 15;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 5;
  *(_QWORD *)v19 = "transportFailed";
  *((_QWORD *)v19 + 1) = 15;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 6;
  *(_QWORD *)v21 = "serverFailed";
  *((_QWORD *)v21 + 1) = 12;
  v21[16] = 2;
  v10();
  v22 = (_QWORD *)(v6 + 7 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 7;
  *(_QWORD *)v23 = "fetchRequired";
  *((_QWORD *)v23 + 1) = 13;
  v23[16] = 2;
  v10();
  v24 = v6 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 8 * v3) = 8;
  *(_QWORD *)v24 = "cacheFailed";
  *(_QWORD *)(v24 + 8) = 11;
  *(_BYTE *)(v24 + 16) = 2;
  v10();
  v25 = (_QWORD *)(v6 + 9 * v3);
  v26 = (char *)v25 + *(int *)(v1 + 48);
  *v25 = 9;
  *(_QWORD *)v26 = "zoneCreationRequired";
  *((_QWORD *)v26 + 1) = 20;
  v26[16] = 2;
  v10();
  v27 = (_QWORD *)(v6 + 10 * v3);
  v28 = (char *)v27 + *(int *)(v1 + 48);
  *v27 = 10;
  *(_QWORD *)v28 = "zoneDeletionRequired";
  *((_QWORD *)v28 + 1) = 20;
  v28[16] = 2;
  v10();
  v29 = (_QWORD *)(v6 + 11 * v3);
  v30 = (char *)v29 + *(int *)(v1 + 48);
  *v29 = 11;
  *(_QWORD *)v30 = "noEncryptionKey";
  *((_QWORD *)v30 + 1) = 15;
  v30[16] = 2;
  v10();
  v31 = (_QWORD *)(v6 + 12 * v3);
  v32 = (char *)v31 + *(int *)(v1 + 48);
  *v31 = 12;
  *(_QWORD *)v32 = "resetRequired";
  *((_QWORD *)v32 + 1) = 13;
  v32[16] = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static ServerErrorProtobuf.ErrorType._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DA8, (uint64_t)qword_2550FA428, a1);
}

uint64_t sub_21A83A7A0@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DA8, (uint64_t)qword_2550FA428, a1);
}

uint64_t _s21SeymourServerProtocol0B13ErrorProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *a2;
  if (*((_BYTE *)a2 + 8) == 1)
    __asm { BR              X11 }
  if (*(_QWORD *)a1 != v11)
    goto LABEL_17;
  if (*(_QWORD *)(a1 + 16) != a2[2] || *(_QWORD *)(a1 + 24) != a2[3])
  {
    v13 = 0;
    if ((sub_21A85025C() & 1) == 0)
      return v13 & 1;
  }
  if ((sub_21A84A118(*(_QWORD **)(a1 + 32), (_QWORD *)a2[4]) & 1) == 0)
  {
LABEL_17:
    v13 = 0;
    return v13 & 1;
  }
  if (*(_QWORD *)(a1 + 40) == a2[5] && *(_QWORD *)(a1 + 48) == a2[6] || (v13 = 0, (sub_21A85025C() & 1) != 0))
  {
    if (*(_QWORD *)(a1 + 56) == a2[7] && *(_QWORD *)(a1 + 64) == a2[8] || (v13 = 0, (sub_21A85025C() & 1) != 0))
    {
      v14 = type metadata accessor for ServerErrorProtobuf();
      v15 = a1 + *(int *)(v14 + 36);
      v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v16(v10, v15, v4);
      v16(v8, (uint64_t)a2 + *(int *)(v14 + 36), v4);
      sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v13 = sub_21A8501FC();
      v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
    }
  }
  return v13 & 1;
}

unint64_t sub_21A83AA30()
{
  unint64_t result;

  result = qword_2550FA450;
  if (!qword_2550FA450)
  {
    result = MEMORY[0x22074A8B0](&protocol conformance descriptor for ServerErrorProtobuf.ErrorType, &type metadata for ServerErrorProtobuf.ErrorType);
    atomic_store(result, (unint64_t *)&qword_2550FA450);
  }
  return result;
}

unint64_t sub_21A83AA78()
{
  unint64_t result;

  result = qword_2550FA458;
  if (!qword_2550FA458)
  {
    result = MEMORY[0x22074A8B0](&protocol conformance descriptor for ServerErrorProtobuf.ErrorType, &type metadata for ServerErrorProtobuf.ErrorType);
    atomic_store(result, (unint64_t *)&qword_2550FA458);
  }
  return result;
}

unint64_t sub_21A83AAC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550FA460;
  if (!qword_2550FA460)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550FA468);
    result = MEMORY[0x22074A8B0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2550FA460);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22074A8A4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21A83AB54()
{
  unint64_t result;

  result = qword_2550FA470;
  if (!qword_2550FA470)
  {
    result = MEMORY[0x22074A8B0](&protocol conformance descriptor for ServerErrorProtobuf.ErrorType, &type metadata for ServerErrorProtobuf.ErrorType);
    atomic_store(result, (unint64_t *)&qword_2550FA470);
  }
  return result;
}

uint64_t sub_21A83AB98()
{
  return sub_21A835654(&qword_2550FA478, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
}

uint64_t sub_21A83ABC4()
{
  return sub_21A835654(&qword_2550FA480, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
}

uint64_t sub_21A83ABF0()
{
  return sub_21A835654(&qword_2550FA448, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
}

uint64_t sub_21A83AC1C()
{
  return sub_21A835654(&qword_2550FA488, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
}

_QWORD *initializeBufferWithCopyOfBuffer for ServerErrorProtobuf(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v5 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v5;
    v6 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v6;
    v7 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v7;
    v8 = *(int *)(a3 + 36);
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    *(_QWORD *)(a1 + 64) = a2[8];
    v11 = sub_21A850040();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  return v3;
}

uint64_t destroy for ServerErrorProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 36);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for ServerErrorProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(int *)(a3 + 36);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v10 = sub_21A850040();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for ServerErrorProtobuf(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 36);
  v8 = a1 + v7;
  v9 = (uint64_t)a2 + v7;
  v10 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ServerErrorProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v4 = *(int *)(a3 + 36);
  v5 = a1 + v4;
  v6 = a2 + v4;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v7 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for ServerErrorProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 36);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerErrorProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83B074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ServerErrorProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83B0FC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A83B170()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ServerErrorProtobuf.ErrorType(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ServerErrorProtobuf.ErrorType(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_21A83B268(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_21A83B284(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ServerErrorProtobuf.ErrorType()
{
  return &type metadata for ServerErrorProtobuf.ErrorType;
}

uint64_t ScoreEstimationMarkerProtobuf.position.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ScoreEstimationMarkerProtobuf.position.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ScoreEstimationMarkerProtobuf.position.modify())()
{
  return nullsub_1;
}

float ScoreEstimationMarkerProtobuf.height.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 4);
}

void ScoreEstimationMarkerProtobuf.height.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 4) = a1;
}

uint64_t (*ScoreEstimationMarkerProtobuf.height.modify())()
{
  return nullsub_1;
}

float ScoreEstimationMarkerProtobuf.increment.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 8);
}

void ScoreEstimationMarkerProtobuf.increment.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 8) = a1;
}

uint64_t (*ScoreEstimationMarkerProtobuf.increment.modify())()
{
  return nullsub_1;
}

float ScoreEstimationMarkerProtobuf.desiredPosition.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 12);
}

void ScoreEstimationMarkerProtobuf.desiredPosition.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 12) = a1;
}

uint64_t (*ScoreEstimationMarkerProtobuf.desiredPosition.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationMarkerProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScoreEstimationMarkerProtobuf() + 32);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ScoreEstimationMarkerProtobuf()
{
  uint64_t result;

  result = qword_2550FA5C8;
  if (!qword_2550FA5C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ScoreEstimationMarkerProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScoreEstimationMarkerProtobuf() + 32);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*ScoreEstimationMarkerProtobuf.unknownFields.modify())()
{
  type metadata accessor for ScoreEstimationMarkerProtobuf();
  return nullsub_1;
}

uint64_t ScoreEstimationMarkerProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  type metadata accessor for ScoreEstimationMarkerProtobuf();
  *a1 = 0;
  a1[1] = 0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ScoreEstimationMarkerProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_21A83B478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA538);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA538);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A851460;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "position";
  *(_QWORD *)(v7 + 8) = 8;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "height";
  *(_QWORD *)(v11 + 8) = 6;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "increment";
  *((_QWORD *)v13 + 1) = 9;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "desiredPosition";
  *((_QWORD *)v15 + 1) = 15;
  v15[16] = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static ScoreEstimationMarkerProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9DB0 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FA538);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t ScoreEstimationMarkerProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21A85007C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_21A8500AC();
          break;
        case 2:
        case 3:
        case 4:
          sub_21A8500A0();
          break;
        default:
          break;
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t ScoreEstimationMarkerProtobuf.traverse<A>(visitor:)()
{
  _DWORD *v0;
  uint64_t v1;
  uint64_t result;

  if (!*v0 || (result = sub_21A850160(), !v1))
  {
    if (!v0[1] || (result = sub_21A850154(), !v1))
    {
      if (!v0[2] || (result = sub_21A850154(), !v1))
      {
        if (!v0[3] || (result = sub_21A850154(), !v1))
        {
          type metadata accessor for ScoreEstimationMarkerProtobuf();
          return sub_21A850028();
        }
      }
    }
  }
  return result;
}

uint64_t ScoreEstimationMarkerProtobuf.hashValue.getter()
{
  sub_21A8502BC();
  type metadata accessor for ScoreEstimationMarkerProtobuf();
  sub_21A835654(&qword_2550FA550, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A83B8F4@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A83B914()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_21A83B930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21A83B970(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 32);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_21A83B9B0())()
{
  return nullsub_1;
}

uint64_t sub_21A83B9C4()
{
  return ScoreEstimationMarkerProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A83B9D8()
{
  return ScoreEstimationMarkerProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A83B9EC()
{
  sub_21A835654(&qword_2550FA610, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A83BA3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9DB0 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FA538);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_21A83BAAC()
{
  sub_21A835654(&qword_2550FA560, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A83BAEC()
{
  sub_21A835654(&qword_2550FA560, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
  return sub_21A850118();
}

uint64_t _s21SeymourServerProtocol29ScoreEstimationMarkerProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if (*(_DWORD *)a1 == *(_DWORD *)a2
    && *(float *)(a1 + 4) == *(float *)(a2 + 4)
    && *(float *)(a1 + 8) == *(float *)(a2 + 8)
    && *(float *)(a1 + 12) == *(float *)(a2 + 12))
  {
    v11 = type metadata accessor for ScoreEstimationMarkerProtobuf();
    v12 = a1 + *(int *)(v11 + 32);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, a2 + *(int *)(v11 + 32), v4);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_21A8501FC();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_21A83BCA4()
{
  return sub_21A835654(&qword_2550FA558, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
}

uint64_t sub_21A83BCD0()
{
  return sub_21A835654(&qword_2550FA560, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
}

uint64_t sub_21A83BCFC()
{
  return sub_21A835654(&qword_2550FA550, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
}

uint64_t sub_21A83BD28()
{
  return sub_21A835654(&qword_2550FA568, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScoreEstimationMarkerProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v5 = *(int *)(a3 + 32);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_21A850040();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for ScoreEstimationMarkerProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 32);
  v3 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_OWORD *initializeWithCopy for ScoreEstimationMarkerProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 32);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for ScoreEstimationMarkerProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  v4 = *(int *)(a3 + 32);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *initializeWithTake for ScoreEstimationMarkerProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 32);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for ScoreEstimationMarkerProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 4) = *(_QWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  v4 = *(int *)(a3 + 32);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScoreEstimationMarkerProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83BFB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 32);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for ScoreEstimationMarkerProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83C004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 32);
  v6 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_21A83C048()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21A83C0C4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RuntimeLinker()
{
  return objc_opt_self();
}

uint64_t static SyncRecordType.encryptionKey.getter()
{
  return 0x6974707972636E45;
}

uint64_t static SyncRecordType.syncable.getter()
{
  return 0x656C6261636E7953;
}

ValueMetadata *type metadata accessor for SyncRecordType()
{
  return &type metadata for SyncRecordType;
}

uint64_t ScoreCacheProtobuf.lowerScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreCacheProtobuf.lowerScores.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ScoreCacheProtobuf.lowerScores.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.lowerMiddleScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreCacheProtobuf.lowerMiddleScores.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ScoreCacheProtobuf.lowerMiddleScores.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.upperMiddleScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreCacheProtobuf.upperMiddleScores.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*ScoreCacheProtobuf.upperMiddleScores.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.upperScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreCacheProtobuf.upperScores.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*ScoreCacheProtobuf.upperScores.modify())()
{
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScoreCacheProtobuf() + 32);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ScoreCacheProtobuf()
{
  uint64_t result;

  result = qword_2550FA748;
  if (!qword_2550FA748)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ScoreCacheProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScoreCacheProtobuf() + 32);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*ScoreCacheProtobuf.unknownFields.modify())()
{
  type metadata accessor for ScoreCacheProtobuf();
  return nullsub_1;
}

uint64_t ScoreCacheProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  *a1 = MEMORY[0x24BEE4AF8];
  a1[1] = v2;
  a1[2] = v2;
  a1[3] = v2;
  type metadata accessor for ScoreCacheProtobuf();
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ScoreCacheProtobuf.protoMessageName.getter()
{
  return 0xD000000000000012;
}

uint64_t sub_21A83C390()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA6B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA6B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A851460;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "lowerScores";
  *(_QWORD *)(v7 + 8) = 11;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "lowerMiddleScores";
  *(_QWORD *)(v11 + 8) = 17;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "upperMiddleScores";
  *((_QWORD *)v13 + 1) = 17;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "upperScores";
  *((_QWORD *)v15 + 1) = 11;
  v15[16] = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static ScoreCacheProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9DB8 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FA6B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t ScoreCacheProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;

  result = sub_21A85007C();
  if (!v0)
  {
    v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BE892A8];
    v4 = MEMORY[0x24BE892A0];
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          sub_21A84FF5C();
          sub_21A835654(&qword_2550FA6C8, v3, v4);
          sub_21A8500E8();
          break;
        default:
          break;
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t ScoreCacheProtobuf.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*v0 + 16)
    || (sub_21A84FF5C(),
        sub_21A835654(&qword_2550FA6C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE892A8], MEMORY[0x24BE892A0]),
        result = sub_21A85019C(),
        !v1))
  {
    if (!*(_QWORD *)(v0[1] + 16)
      || (sub_21A84FF5C(),
          sub_21A835654(&qword_2550FA6C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE892A8], MEMORY[0x24BE892A0]),
          result = sub_21A85019C(),
          !v1))
    {
      if (!*(_QWORD *)(v0[2] + 16)
        || (sub_21A84FF5C(),
            sub_21A835654(&qword_2550FA6C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE892A8], MEMORY[0x24BE892A0]),
            result = sub_21A85019C(),
            !v1))
      {
        if (!*(_QWORD *)(v0[3] + 16)
          || (sub_21A84FF5C(),
              sub_21A835654(&qword_2550FA6C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE892A8], MEMORY[0x24BE892A0]),
              result = sub_21A85019C(),
              !v1))
        {
          type metadata accessor for ScoreCacheProtobuf();
          return sub_21A850028();
        }
      }
    }
  }
  return result;
}

uint64_t ScoreCacheProtobuf.hashValue.getter()
{
  sub_21A8502BC();
  type metadata accessor for ScoreCacheProtobuf();
  sub_21A835654(&qword_2550FA6D0, (uint64_t (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf, (uint64_t)&protocol conformance descriptor for ScoreCacheProtobuf);
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A83C9A8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  *a1 = MEMORY[0x24BEE4AF8];
  a1[1] = v1;
  a1[2] = v1;
  a1[3] = v1;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A83C9D4()
{
  return 0xD000000000000012;
}

uint64_t sub_21A83C9F0()
{
  return ScoreCacheProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A83CA04()
{
  return ScoreCacheProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A83CA18()
{
  sub_21A835654(&qword_2550FA790, (uint64_t (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf, (uint64_t)&protocol conformance descriptor for ScoreCacheProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A83CA68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9DB8 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FA6B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_21A83CAD8()
{
  sub_21A835654(&qword_2550FA6E0, (uint64_t (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf, (uint64_t)&protocol conformance descriptor for ScoreCacheProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A83CB18()
{
  sub_21A835654(&qword_2550FA6E0, (uint64_t (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf, (uint64_t)&protocol conformance descriptor for ScoreCacheProtobuf);
  return sub_21A850118();
}

uint64_t _s21SeymourServerProtocol18ScoreCacheProtobufV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if ((sub_21A84BB84(*a1, *a2) & 1) != 0
    && (sub_21A84BB84(a1[1], a2[1]) & 1) != 0
    && (sub_21A84BB84(a1[2], a2[2]) & 1) != 0
    && (sub_21A84BB84(a1[3], a2[3]) & 1) != 0)
  {
    v11 = type metadata accessor for ScoreCacheProtobuf();
    v12 = (char *)a1 + *(int *)(v11 + 32);
    v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, (char *)a2 + *(int *)(v11 + 32), v4);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_21A8501FC();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_21A83CCD0()
{
  return sub_21A835654(&qword_2550FA6D8, (uint64_t (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf, (uint64_t)&protocol conformance descriptor for ScoreCacheProtobuf);
}

uint64_t sub_21A83CCFC()
{
  return sub_21A835654(&qword_2550FA6E0, (uint64_t (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf, (uint64_t)&protocol conformance descriptor for ScoreCacheProtobuf);
}

uint64_t sub_21A83CD28()
{
  return sub_21A835654(&qword_2550FA6D0, (uint64_t (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf, (uint64_t)&protocol conformance descriptor for ScoreCacheProtobuf);
}

uint64_t sub_21A83CD54()
{
  return sub_21A835654(&qword_2550FA6E8, (uint64_t (*)(uint64_t))type metadata accessor for ScoreCacheProtobuf, (uint64_t)&protocol conformance descriptor for ScoreCacheProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScoreCacheProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    a1[3] = a2[3];
    v7 = *(int *)(a3 + 32);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_21A850040();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t destroy for ScoreCacheProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for ScoreCacheProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

_QWORD *assignWithCopy for ScoreCacheProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for ScoreCacheProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 32);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for ScoreCacheProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScoreCacheProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83D110(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21A850040();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 32)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ScoreCacheProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21A83D198(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_21A850040();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 32)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A83D20C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t SubmitScoresRequestProtobuf.scores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SubmitScoresRequestProtobuf.scores.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SubmitScoresRequestProtobuf.scores.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SubmitScoresRequestProtobuf(0) + 20);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for SubmitScoresRequestProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_253F24050);
}

uint64_t SubmitScoresRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SubmitScoresRequestProtobuf(0) + 20);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*SubmitScoresRequestProtobuf.unknownFields.modify())()
{
  type metadata accessor for SubmitScoresRequestProtobuf(0);
  return nullsub_1;
}

uint64_t SubmitScoresRequestProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
  type metadata accessor for SubmitScoresRequestProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t (*SubmitScoresResponseProtobuf.accepted.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.rejected.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SubmitScoresResponseProtobuf.rejected.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SubmitScoresResponseProtobuf.rejected.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A83321C(type metadata accessor for SubmitScoresResponseProtobuf, a1);
}

uint64_t type metadata accessor for SubmitScoresResponseProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_253F240E0);
}

uint64_t SubmitScoresResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A833274(a1, type metadata accessor for SubmitScoresResponseProtobuf);
}

uint64_t (*SubmitScoresResponseProtobuf.unknownFields.modify())()
{
  type metadata accessor for SubmitScoresResponseProtobuf(0);
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.reason.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.reason.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.reason.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.score.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.score.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.score.modify())()
{
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A83321C(type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, a1);
}

uint64_t type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FA8A0);
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A833274(a1, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t (*SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.unknownFields.modify())()
{
  type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
  return nullsub_1;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t SubmitScoresResponseProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  *a1 = MEMORY[0x24BEE4AF8];
  a1[1] = v2;
  type metadata accessor for SubmitScoresResponseProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static SubmitScoresRequestProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21A83D63C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA798);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA798);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21A8504F0;
  v5 = v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v4 + v3) = 1;
  *(_QWORD *)v5 = "scores";
  *(_QWORD *)(v5 + 8) = 6;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x24BE5C318];
  v7 = sub_21A8501B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  return sub_21A8501C0();
}

uint64_t static SubmitScoresRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DC0, (uint64_t)qword_2550FA798, a1);
}

uint64_t SubmitScoresRequestProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;

  result = sub_21A85007C();
  if (!v0)
  {
    v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BE8B678];
    v4 = MEMORY[0x24BE8B670];
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        sub_21A84FF74();
        sub_21A835654(&qword_2550FA7E0, v3, v4);
        sub_21A8500E8();
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t SubmitScoresRequestProtobuf.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 16)
    || (sub_21A84FF74(),
        sub_21A835654(&qword_2550FA7E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE8B678], MEMORY[0x24BE8B670]),
        result = sub_21A85019C(),
        !v1))
  {
    type metadata accessor for SubmitScoresRequestProtobuf(0);
    return sub_21A850028();
  }
  return result;
}

uint64_t SubmitScoresRequestProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for SubmitScoresRequestProtobuf, &qword_2550FA7E8, (uint64_t)&protocol conformance descriptor for SubmitScoresRequestProtobuf);
}

unint64_t sub_21A83D930()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21A83D94C()
{
  return SubmitScoresRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A83D960()
{
  return SubmitScoresRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A83D974()
{
  sub_21A835654(&qword_2550FA8F0, type metadata accessor for SubmitScoresRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresRequestProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A83D9C4@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DC0, (uint64_t)qword_2550FA798, a1);
}

uint64_t sub_21A83D9E0()
{
  sub_21A835654(&qword_2550FA810, type metadata accessor for SubmitScoresRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresRequestProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A83DA20()
{
  sub_21A835654(&qword_2550FA810, type metadata accessor for SubmitScoresRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresRequestProtobuf);
  return sub_21A850118();
}

unint64_t static SubmitScoresResponseProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_21A83DA90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA7B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA7B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A8504E0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "accepted";
  *(_QWORD *)(v7 + 8) = 8;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "rejected";
  *((_QWORD *)v11 + 1) = 8;
  v11[16] = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static SubmitScoresResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DC8, (uint64_t)qword_2550FA7B0, a1);
}

uint64_t SubmitScoresResponseProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21A85007C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
        sub_21A835654(&qword_2550FA7F0, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
        sub_21A8500E8();
      }
      else if (result == 1)
      {
        sub_21A8500C4();
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t SubmitScoresResponseProtobuf.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*v0 + 16) || (result = sub_21A850178(), !v1))
  {
    if (!*(_QWORD *)(v0[1] + 16)
      || (type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0),
          sub_21A835654(&qword_2550FA7F0, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf), result = sub_21A85019C(), !v1))
    {
      type metadata accessor for SubmitScoresResponseProtobuf(0);
      return sub_21A850028();
    }
  }
  return result;
}

uint64_t SubmitScoresResponseProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for SubmitScoresResponseProtobuf, &qword_2550FA7F8, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf);
}

uint64_t sub_21A83DE28@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  *a1 = MEMORY[0x24BEE4AF8];
  a1[1] = v1;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A83DE50()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_21A83DE6C()
{
  return SubmitScoresResponseProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A83DE80()
{
  return SubmitScoresResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A83DE94()
{
  sub_21A835654(&qword_2550FA8E8, type metadata accessor for SubmitScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A83DEE4@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DC8, (uint64_t)qword_2550FA7B0, a1);
}

uint64_t sub_21A83DF00()
{
  sub_21A835654(&qword_2550FA828, type metadata accessor for SubmitScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A83DF40()
{
  sub_21A835654(&qword_2550FA828, type metadata accessor for SubmitScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf);
  return sub_21A850118();
}

unint64_t static SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.protoMessageName.getter()
{
  return 0xD00000000000003BLL;
}

uint64_t sub_21A83DFB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA7C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA7C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A8504E0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "reason";
  *(_QWORD *)(v7 + 8) = 6;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "score";
  *((_QWORD *)v11 + 1) = 5;
  v11[16] = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DD0, (uint64_t)qword_2550FA7C8, a1);
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21A85007C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1)
        sub_21A8500DC();
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_21A850190(), !v1))
  {
    v5 = v0[3];
    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    if (!v6 || (result = sub_21A850190(), !v1))
    {
      type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
      return sub_21A850028();
    }
  }
  return result;
}

uint64_t SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, &qword_2550FA800, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_21A83E2A4@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A83E2CC()
{
  return 0xD00000000000003BLL;
}

uint64_t sub_21A83E2E8()
{
  return SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A83E2FC()
{
  return SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A83E310()
{
  sub_21A835654(&qword_2550FA8E0, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A83E360@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DD0, (uint64_t)qword_2550FA7C8, a1);
}

uint64_t sub_21A83E37C()
{
  sub_21A835654(&qword_2550FA7F0, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A83E3BC()
{
  sub_21A835654(&qword_2550FA7F0, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
  return sub_21A850118();
}

uint64_t _s21SeymourServerProtocol28SubmitScoresResponseProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if ((sub_21A84A118(*(_QWORD **)a1, *(_QWORD **)a2) & 1) != 0
    && (sub_21A84B600(*(_QWORD *)(a1 + 8), *(_QWORD *)(a2 + 8)) & 1) != 0)
  {
    v11 = type metadata accessor for SubmitScoresResponseProtobuf(0);
    v12 = a1 + *(int *)(v11 + 24);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, a2 + *(int *)(v11 + 24), v4);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_21A8501FC();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t _s21SeymourServerProtocol28SubmitScoresResponseProtobufV07Sessione9RejectionG0V2eeoiySbAE_AEtFZ_0(_QWORD *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *a1 == *(_QWORD *)a2 && a1[1] == *((_QWORD *)a2 + 1);
  if (v11 || (v12 = 0, (sub_21A85025C() & 1) != 0))
  {
    v13 = a1[2] == *((_QWORD *)a2 + 2) && a1[3] == *((_QWORD *)a2 + 3);
    if (v13 || (v12 = 0, (sub_21A85025C() & 1) != 0))
    {
      v14 = type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
      v15 = (char *)a1 + *(int *)(v14 + 24);
      v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v16(v10, v15, v4);
      v16(v8, &a2[*(int *)(v14 + 24)], v4);
      sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v12 = sub_21A8501FC();
      v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
    }
  }
  return v12 & 1;
}

uint64_t _s21SeymourServerProtocol27SubmitScoresRequestProtobufV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if ((sub_21A84B7D8(*a1, *a2) & 1) != 0)
  {
    v11 = type metadata accessor for SubmitScoresRequestProtobuf(0);
    v12 = (char *)a1 + *(int *)(v11 + 20);
    v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, (char *)a2 + *(int *)(v11 + 20), v4);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_21A8501FC();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_21A83E7EC()
{
  return sub_21A835654(&qword_2550FA808, type metadata accessor for SubmitScoresRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresRequestProtobuf);
}

uint64_t sub_21A83E818()
{
  return sub_21A835654(&qword_2550FA810, type metadata accessor for SubmitScoresRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresRequestProtobuf);
}

uint64_t sub_21A83E844()
{
  return sub_21A835654(&qword_2550FA7E8, type metadata accessor for SubmitScoresRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresRequestProtobuf);
}

uint64_t sub_21A83E870()
{
  return sub_21A835654(&qword_2550FA818, type metadata accessor for SubmitScoresRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresRequestProtobuf);
}

uint64_t sub_21A83E89C()
{
  return sub_21A835654(&qword_2550FA820, type metadata accessor for SubmitScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf);
}

uint64_t sub_21A83E8C8()
{
  return sub_21A835654(&qword_2550FA828, type metadata accessor for SubmitScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf);
}

uint64_t sub_21A83E8F4()
{
  return sub_21A835654(&qword_2550FA7F8, type metadata accessor for SubmitScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf);
}

uint64_t sub_21A83E920()
{
  return sub_21A835654(&qword_2550FA830, type metadata accessor for SubmitScoresResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf);
}

uint64_t sub_21A83E94C()
{
  return sub_21A835654(&qword_2550FA838, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_21A83E978()
{
  return sub_21A835654(&qword_2550FA7F0, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_21A83E9A4()
{
  return sub_21A835654(&qword_2550FA800, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t sub_21A83E9D0()
{
  return sub_21A835654(&qword_2550FA840, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf, (uint64_t)&protocol conformance descriptor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
}

uint64_t getEnumTagSinglePayload for SubmitScoresRequestProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83EA08(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21A850040();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SubmitScoresRequestProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21A83EA90(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_21A850040();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitScoresResponseProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    a1[1] = a2[1];
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_21A850040();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for SubmitScoresResponseProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for SubmitScoresResponseProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_21A850040();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *assignWithCopy for SubmitScoresResponseProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for SubmitScoresResponseProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for SubmitScoresResponseProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubmitScoresResponseProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83EDF4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21A850040();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SubmitScoresResponseProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21A83EE7C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_21A850040();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A83EEF0()
{
  return sub_21A83F2B8();
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_21A850040();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

_QWORD *assignWithCopy for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *assignWithTake for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83F1B0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A83F238(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A83F2AC()
{
  return sub_21A83F2B8();
}

uint64_t sub_21A83F2B8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t ServerError.init(wrapping:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;

  swift_getErrorValue();
  v5 = sub_21A850280();
  if (*(_QWORD *)(v5 + 16) && (v6 = sub_21A83F4EC(1635017060, 0xE400000000000000), (v7 & 1) != 0))
  {
    sub_21A83F618(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v13);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v14 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_21A8327FC(v11, v12);
      sub_21A83F5D4();
      sub_21A84FFBC();
      MEMORY[0x22074A868](a1);
      result = sub_21A832844(v11, v12);
      if (v2)
        return result;
LABEL_12:
      v9 = v14;
      *(_OWORD *)a2 = v13;
      *(_BYTE *)(a2 + 16) = v9;
      return result;
    }
  }
  else
  {
    sub_21A83F550((uint64_t)&v13);
  }
  swift_getErrorValue();
  if (sub_21A850274())
  {
    ServerError.init(wrapping:)(&v13);
    result = MEMORY[0x22074A868](a1);
    if (v2)
      return result;
    goto LABEL_12;
  }
  sub_21A83F590();
  swift_allocError();
  *(_OWORD *)v10 = xmmword_21A851D00;
  *(_BYTE *)(v10 + 16) = 10;
  swift_willThrow();
  return MEMORY[0x22074A868](a1);
}

unint64_t sub_21A83F4EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21A8502BC();
  sub_21A850208();
  v4 = sub_21A8502D4();
  return sub_21A83F654(a1, a2, v4);
}

uint64_t sub_21A83F550(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA8F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21A83F590()
{
  unint64_t result;

  result = qword_2550FA900;
  if (!qword_2550FA900)
  {
    result = MEMORY[0x22074A8B0](&protocol conformance descriptor for ServerError, &type metadata for ServerError);
    atomic_store(result, (unint64_t *)&qword_2550FA900);
  }
  return result;
}

unint64_t sub_21A83F5D4()
{
  unint64_t result;

  result = qword_2550FA908;
  if (!qword_2550FA908)
  {
    result = MEMORY[0x22074A8B0](&protocol conformance descriptor for ServerError, &type metadata for ServerError);
    atomic_store(result, (unint64_t *)&qword_2550FA908);
  }
  return result;
}

uint64_t sub_21A83F618(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21A83F654(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21A85025C() & 1) == 0)
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
      while (!v14 && (sub_21A85025C() & 1) == 0);
    }
  }
  return v6;
}

void ServerError.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_21A83F778()
{
  uint64_t v0;
  __int128 *v1;

  sub_21A8502C8();
  return sub_21A83FC9C(v1, v0);
}

uint64_t sub_21A83F7BC()
{
  sub_21A8502C8();
  return sub_21A850208();
}

uint64_t sub_21A83F804()
{
  return sub_21A8502C8();
}

uint64_t sub_21A83F848(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = sub_21A84FFF8();
  v40 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v33 - v9;
  result = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v33 - v12;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v14 = 0;
  v15 = *(_QWORD *)(a1 + 56);
  v34 = a1;
  v35 = a1 + 56;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v18 = v17 & v15;
  v36 = (unint64_t)(v16 + 63) >> 6;
  v39 = a2 + 56;
  v33 = (char *)&v33 - v12;
  if (!v18)
    goto LABEL_9;
LABEL_7:
  v37 = (v18 - 1) & v18;
  v38 = v14;
  for (i = __clz(__rbit64(v18)) | (v14 << 6); ; i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    v24 = v40;
    v25 = *(_QWORD *)(v40 + 72);
    v26 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 16);
    v26(v13, *(_QWORD *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v10, v13, v4);
    sub_21A840670(&qword_2550FA918, MEMORY[0x24BE8DAE8]);
    v27 = sub_21A8501E4();
    v28 = -1 << *(_BYTE *)(a2 + 32);
    v29 = v27 & ~v28;
    if (((*(_QWORD *)(v39 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v4);
      return 0;
    }
    v30 = ~v28;
    while (1)
    {
      v26(v7, *(_QWORD *)(a2 + 48) + v29 * v25, v4);
      sub_21A840670(&qword_2550FA920, MEMORY[0x24BE8DAF0]);
      v31 = sub_21A8501FC();
      v32 = *(void (**)(char *, uint64_t))(v40 + 8);
      v32(v7, v4);
      if ((v31 & 1) != 0)
        break;
      v29 = (v29 + 1) & v30;
      if (((*(_QWORD *)(v39 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      {
        v32(v10, v4);
        return 0;
      }
    }
    result = ((uint64_t (*)(char *, uint64_t))v32)(v10, v4);
    v13 = v33;
    a1 = v34;
    v18 = v37;
    v14 = v38;
    if (v37)
      goto LABEL_7;
LABEL_9:
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v20 >= v36)
      return 1;
    v21 = *(_QWORD *)(v35 + 8 * v20);
    v22 = v14 + 1;
    if (!v21)
    {
      v22 = v20 + 1;
      if (v20 + 1 >= v36)
        return 1;
      v21 = *(_QWORD *)(v35 + 8 * v22);
      if (!v21)
      {
        v22 = v20 + 2;
        if (v20 + 2 >= v36)
          return 1;
        v21 = *(_QWORD *)(v35 + 8 * v22);
        if (!v21)
        {
          v22 = v20 + 3;
          if (v20 + 3 >= v36)
            return 1;
          v21 = *(_QWORD *)(v35 + 8 * v22);
          if (!v21)
            break;
        }
      }
    }
LABEL_24:
    v37 = (v21 - 1) & v21;
    v38 = v22;
  }
  v23 = v20 + 4;
  if (v23 >= v36)
    return 1;
  v21 = *(_QWORD *)(v35 + 8 * v23);
  if (v21)
  {
    v22 = v23;
    goto LABEL_24;
  }
  while (1)
  {
    v22 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v22 >= v36)
      return 1;
    v21 = *(_QWORD *)(v35 + 8 * v22);
    ++v23;
    if (v21)
      goto LABEL_24;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t ServerError.hashValue.getter()
{
  sub_21A8502BC();
  ServerError.hash(into:)();
  return sub_21A8502D4();
}

uint64_t sub_21A83FBF8()
{
  sub_21A8502BC();
  ServerError.hash(into:)();
  return sub_21A8502D4();
}

uint64_t sub_21A83FC4C()
{
  sub_21A8502BC();
  ServerError.hash(into:)();
  return sub_21A8502D4();
}

uint64_t sub_21A83FC9C(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v25;
  int64_t v26;
  _QWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v4 = sub_21A84FFF8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *((_QWORD *)a1 + 8);
  v9 = a1[1];
  v28 = *a1;
  v29 = v9;
  v10 = a1[2];
  v11 = a1[3];
  v27[0] = a1;
  v30 = v10;
  v31 = v11;
  v32 = v8;
  v27[1] = sub_21A8502D4();
  v12 = a2 + 56;
  v13 = 1 << *(_BYTE *)(a2 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(a2 + 56);
  v16 = (unint64_t)(v13 + 63) >> 6;
  v17 = a2;
  result = swift_bridgeObjectRetain();
  v19 = 0;
  v20 = 0;
  while (1)
  {
    if (v15)
    {
      v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v22 = v21 | (v20 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v20++, 1))
      goto LABEL_19;
    if (v20 >= v16)
    {
LABEL_17:
      swift_release();
      return sub_21A8502C8();
    }
    v25 = *(_QWORD *)(v12 + 8 * v20);
    if (!v25)
      break;
LABEL_16:
    v15 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v20 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v17 + 48) + *(_QWORD *)(v5 + 72) * v22, v4);
    sub_21A840670(&qword_2550FA918, MEMORY[0x24BE8DAE8]);
    v23 = sub_21A8501E4();
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v19 ^= v23;
  }
  v26 = v20 + 1;
  if (v20 + 1 >= v16)
    goto LABEL_17;
  v25 = *(_QWORD *)(v12 + 8 * v26);
  if (v25)
  {
    ++v20;
    goto LABEL_16;
  }
  while (1)
  {
    v20 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v20 >= v16)
      goto LABEL_17;
    v25 = *(_QWORD *)(v12 + 8 * v20);
    ++v26;
    if (v25)
      goto LABEL_16;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

void _s21SeymourServerProtocol0B5ErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_21A83FEC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;
  char v6;

  if (v5)
  {
    sub_21A840438(v1, v0, v5);
    sub_21A840438(v3, v2, v4);
    sub_21A84047C(v3, v2, v4);
    sub_21A84047C(v1, v0, v5);
    return 0;
  }
  else
  {
    sub_21A840438(v1, v0, 0);
    sub_21A840438(v3, v2, 0);
    v6 = sub_21A83F848(v3, v1);
    sub_21A84047C(v3, v2, 0);
    sub_21A84047C(v1, v0, 0);
    return v6 & 1;
  }
}

unint64_t sub_21A8403F0()
{
  unint64_t result;

  result = qword_2550FA910;
  if (!qword_2550FA910)
  {
    result = MEMORY[0x22074A8B0](&protocol conformance descriptor for ServerError, &type metadata for ServerError);
    atomic_store(result, (unint64_t *)&qword_2550FA910);
  }
  return result;
}

uint64_t sub_21A840438(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for ServerError(uint64_t a1)
{
  return sub_21A84047C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_21A84047C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s21SeymourServerProtocol11ServerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_21A840438(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ServerError(uint64_t a1, uint64_t a2)
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
  sub_21A840438(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_21A84047C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ServerError(uint64_t a1, uint64_t a2)
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
  sub_21A84047C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF6 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 246);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 0xA)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ServerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF5)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 246;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF6)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF6)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_21A840630(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 9u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 10);
}

uint64_t sub_21A840648(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xA)
  {
    *(_QWORD *)result = a2 - 10;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 10;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ServerError()
{
  return &type metadata for ServerError;
}

uint64_t sub_21A840670(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_21A84FFF8();
    result = MEMORY[0x22074A8B0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SyncRecordChangesetProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  *a1 = 0;
  a1[1] = v2;
  a1[2] = v2;
  type metadata accessor for SyncRecordChangesetProtobuf();
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t type metadata accessor for SyncRecordChangesetProtobuf()
{
  uint64_t result;

  result = qword_2550FA9B8;
  if (!qword_2550FA9B8)
    return swift_getSingletonMetadata();
  return result;
}

double SyncRecordChangesetProtobuf.timestamp.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void SyncRecordChangesetProtobuf.timestamp.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*SyncRecordChangesetProtobuf.timestamp.modify())()
{
  return nullsub_1;
}

uint64_t SyncRecordChangesetProtobuf.inserted.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncRecordChangesetProtobuf.inserted.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SyncRecordChangesetProtobuf.inserted.modify())()
{
  return nullsub_1;
}

uint64_t SyncRecordChangesetProtobuf.deleted.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncRecordChangesetProtobuf.deleted.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*SyncRecordChangesetProtobuf.deleted.modify())()
{
  return nullsub_1;
}

uint64_t SyncRecordChangesetProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SyncRecordChangesetProtobuf() + 28);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SyncRecordChangesetProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SyncRecordChangesetProtobuf() + 28);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*SyncRecordChangesetProtobuf.unknownFields.modify())()
{
  type metadata accessor for SyncRecordChangesetProtobuf();
  return nullsub_1;
}

unint64_t static SyncRecordChangesetProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21A8408A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FA928);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FA928);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A850500;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 2;
  *(_QWORD *)v7 = "timestamp";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 4;
  *(_QWORD *)v11 = "inserted";
  *((_QWORD *)v11 + 1) = 8;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 5;
  *(_QWORD *)v12 = "deleted";
  *(_QWORD *)(v12 + 8) = 7;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static SyncRecordChangesetProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9DD8 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FA928);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t SyncRecordChangesetProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21A85007C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 5 || result == 4)
      {
        sub_21A850004();
        sub_21A835654(&qword_2550FA940, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17920]);
        sub_21A8500E8();
      }
      else if (result == 2)
      {
        sub_21A8500D0();
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t SyncRecordChangesetProtobuf.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  if (!*v0 || (result = sub_21A850184(), !v1))
  {
    if (!*(_QWORD *)(v0[1] + 16)
      || (sub_21A850004(),
          sub_21A835654(&qword_2550FA940, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17920]),
          result = sub_21A85019C(),
          !v1))
    {
      if (!*(_QWORD *)(v0[2] + 16)
        || (sub_21A850004(),
            sub_21A835654(&qword_2550FA940, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17920]),
            result = sub_21A85019C(),
            !v1))
      {
        type metadata accessor for SyncRecordChangesetProtobuf();
        return sub_21A850028();
      }
    }
  }
  return result;
}

uint64_t SyncRecordChangesetProtobuf.hashValue.getter()
{
  sub_21A8502BC();
  type metadata accessor for SyncRecordChangesetProtobuf();
  sub_21A835654(&qword_2550FA948, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A840DB4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  *a1 = 0;
  a1[1] = v1;
  a1[2] = v1;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A840DE0()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21A840DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 28);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21A840E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 28);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_21A840E7C())()
{
  return nullsub_1;
}

uint64_t sub_21A840E90()
{
  return SyncRecordChangesetProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A840EA4()
{
  return SyncRecordChangesetProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A840EB8()
{
  sub_21A835654(&qword_2550FA9F8, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A840F08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9DD8 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FA928);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_21A840F78()
{
  sub_21A835654(&qword_2550FA150, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A840FB8()
{
  sub_21A835654(&qword_2550FA150, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  return sub_21A850118();
}

uint64_t _s21SeymourServerProtocol27SyncRecordChangesetProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if (*(double *)a1 == *(double *)a2
    && (sub_21A8498D8(*(_QWORD *)(a1 + 8), *(_QWORD *)(a2 + 8)) & 1) != 0
    && (sub_21A8498D8(*(_QWORD *)(a1 + 16), *(_QWORD *)(a2 + 16)) & 1) != 0)
  {
    v11 = type metadata accessor for SyncRecordChangesetProtobuf();
    v12 = a1 + *(int *)(v11 + 28);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, a2 + *(int *)(v11 + 28), v4);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_21A8501FC();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_21A841160()
{
  return sub_21A835654(&qword_2550FA950, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
}

uint64_t sub_21A84118C()
{
  return sub_21A835654(&qword_2550FA150, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
}

uint64_t sub_21A8411B8()
{
  return sub_21A835654(&qword_2550FA948, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
}

uint64_t sub_21A8411E4()
{
  return sub_21A835654(&qword_2550FA958, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for SyncRecordChangesetProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    v6 = *(int *)(a3 + 28);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_21A850040();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for SyncRecordChangesetProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for SyncRecordChangesetProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_21A850040();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *assignWithCopy for SyncRecordChangesetProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for SyncRecordChangesetProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for SyncRecordChangesetProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncRecordChangesetProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A841524(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SyncRecordChangesetProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A8415AC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A841620()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t EncryptionKeyProofProtobuf.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EncryptionKeyProofProtobuf.identifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*EncryptionKeyProofProtobuf.identifier.modify())()
{
  return nullsub_1;
}

uint64_t EncryptionKeyProofProtobuf.etag.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EncryptionKeyProofProtobuf.etag.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*EncryptionKeyProofProtobuf.etag.modify())()
{
  return nullsub_1;
}

uint64_t EncryptionKeyProofProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for EncryptionKeyProofProtobuf(0) + 24);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for EncryptionKeyProofProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FAB78);
}

uint64_t EncryptionKeyProofProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for EncryptionKeyProofProtobuf(0) + 24);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*EncryptionKeyProofProtobuf.unknownFields.modify())()
{
  type metadata accessor for EncryptionKeyProofProtobuf(0);
  return nullsub_1;
}

uint64_t EncryptionKeyProofProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  type metadata accessor for EncryptionKeyProofProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t SubmitSyncChangesetRequestProtobuf.zoneChangesets.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SubmitSyncChangesetRequestProtobuf.zoneChangesets.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SubmitSyncChangesetRequestProtobuf.zoneChangesets.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for SubmitSyncChangesetRequestProtobuf, a1);
}

uint64_t type metadata accessor for SubmitSyncChangesetRequestProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FAC10);
}

uint64_t SubmitSyncChangesetRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t (*SubmitSyncChangesetRequestProtobuf.unknownFields.modify())()
{
  type metadata accessor for SubmitSyncChangesetRequestProtobuf(0);
  return nullsub_1;
}

uint64_t (*SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.key.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_2550FAA78);
  v7 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_21A841DEC((uint64_t)v5, (uint64_t)a1, type metadata accessor for EncryptionKeyProofProtobuf);
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_21A836DBC((uint64_t)v5, &qword_2550FAA78);
}

uint64_t type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, (uint64_t *)&unk_2550FACA0);
}

uint64_t sub_21A841A34@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(a1 + *(int *)(v7 + 24), (uint64_t)v6, &qword_2550FAA78);
  v8 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_21A841DEC((uint64_t)v6, (uint64_t)a2, type metadata accessor for EncryptionKeyProofProtobuf);
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  a2[2] = 0;
  a2[3] = 0xE000000000000000;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_21A836DBC((uint64_t)v6, &qword_2550FAA78);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.key.setter(uint64_t a1)
{
  return sub_21A84276C(a1, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_2550FAA78, type metadata accessor for EncryptionKeyProofProtobuf);
}

void (*SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.key.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 24);
  *((_DWORD *)v3 + 12) = v10;
  sub_21A841DA8(v1 + v10, (uint64_t)v5, &qword_2550FAA78);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *v9 = 0;
    v9[1] = 0xE000000000000000;
    v9[2] = 0;
    v9[3] = 0xE000000000000000;
    _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
    sub_21A836DBC((uint64_t)v5, &qword_2550FAA78);
  }
  else
  {
    sub_21A841DEC((uint64_t)v5, (uint64_t)v9, type metadata accessor for EncryptionKeyProofProtobuf);
  }
  return sub_21A841C6C;
}

void sub_21A841C6C(uint64_t a1, char a2)
{
  sub_21A842914(a1, a2, &qword_2550FAA78, type metadata accessor for EncryptionKeyProofProtobuf);
}

BOOL SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.hasKey.getter()
{
  return sub_21A842A30(&qword_2550FAA78, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, type metadata accessor for EncryptionKeyProofProtobuf);
}

Swift::Void __swiftcall SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.clearKey()()
{
  sub_21A842B08(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_2550FAA78, type metadata accessor for EncryptionKeyProofProtobuf);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.recordChangeset.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(v1 + *(int *)(v6 + 28), (uint64_t)v5, &qword_2550F9E40);
  v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_21A841DEC((uint64_t)v5, (uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  v8 = MEMORY[0x24BEE4AF8];
  *a1 = 0;
  a1[1] = v8;
  a1[2] = v8;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_21A836DBC((uint64_t)v5, &qword_2550F9E40);
}

uint64_t sub_21A841DA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A841DEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A841E30@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(a1 + *(int *)(v7 + 28), (uint64_t)v6, &qword_2550F9E40);
  v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_21A841DEC((uint64_t)v6, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  v9 = MEMORY[0x24BEE4AF8];
  *a2 = 0;
  a2[1] = v9;
  a2[2] = v9;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_21A836DBC((uint64_t)v6, &qword_2550F9E40);
}

uint64_t sub_21A841F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A8421A4(a1, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  v8 = a2 + *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_21A836DBC(v8, &qword_2550F9E40);
  sub_21A841DEC((uint64_t)v7, v8, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v8, 0, 1, v4);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.recordChangeset.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_21A836DBC(v3, &qword_2550F9E40);
  sub_21A841DEC(a1, v3, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
}

void (*SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.recordChangeset.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 28);
  *((_DWORD *)v3 + 12) = v10;
  sub_21A841DA8(v1 + v10, (uint64_t)v5, &qword_2550F9E40);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    *v9 = 0;
    v9[1] = v11;
    v9[2] = v11;
    _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
    sub_21A836DBC((uint64_t)v5, &qword_2550F9E40);
  }
  else
  {
    sub_21A841DEC((uint64_t)v5, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  }
  return sub_21A842190;
}

void sub_21A842190(uint64_t a1, char a2)
{
  sub_21A842914(a1, a2, &qword_2550F9E40, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t sub_21A8421A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A8421E8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.hasRecordChangeset.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(v0 + *(int *)(v4 + 28), (uint64_t)v3, &qword_2550F9E40);
  v5 = type metadata accessor for SyncRecordChangesetProtobuf();
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_21A836DBC((uint64_t)v3, &qword_2550F9E40);
  return v6;
}

Swift::Void __swiftcall SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.clearRecordChangeset()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0) + 28);
  sub_21A836DBC(v1, &qword_2550F9E40);
  v2 = type metadata accessor for SyncRecordChangesetProtobuf();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, a1);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t (*SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.unknownFields.modify())()
{
  type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  return nullsub_1;
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  *a1 = 0;
  a1[1] = 0xE000000000000000;
  v2 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  v3 = (char *)a1 + *(int *)(v2 + 24);
  v4 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)a1 + *(int *)(v2 + 28);
  v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
}

uint64_t SubmitSyncChangesetRequestProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21A833360((void (*)(_QWORD))type metadata accessor for SubmitSyncChangesetRequestProtobuf, a1);
}

uint64_t (*SubmitSyncChangesetResponseProtobuf.zoneChangesets.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for SubmitSyncChangesetResponseProtobuf, a1);
}

uint64_t type metadata accessor for SubmitSyncChangesetResponseProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FAD40);
}

uint64_t SubmitSyncChangesetResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t (*SubmitSyncChangesetResponseProtobuf.unknownFields.modify())()
{
  type metadata accessor for SubmitSyncChangesetResponseProtobuf(0);
  return nullsub_1;
}

uint64_t (*SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.zone.modify())()
{
  return nullsub_1;
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_2550F9E40);
  v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    return sub_21A841DEC((uint64_t)v5, (uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  v8 = MEMORY[0x24BEE4AF8];
  *a1 = 0;
  a1[1] = v8;
  a1[2] = v8;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_21A836DBC((uint64_t)v5, &qword_2550F9E40);
}

uint64_t type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FADD0);
}

uint64_t sub_21A84258C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(a1 + *(int *)(v7 + 24), (uint64_t)v6, &qword_2550F9E40);
  v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) != 1)
    return sub_21A841DEC((uint64_t)v6, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  v9 = MEMORY[0x24BEE4AF8];
  *a2 = 0;
  a2[1] = v9;
  a2[2] = v9;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  return sub_21A836DBC((uint64_t)v6, &qword_2550F9E40);
}

uint64_t sub_21A842680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v12 = a5(0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - v14;
  sub_21A8421A4(a1, (uint64_t)&v18 - v14, a5);
  v16 = a2 + *(int *)(a6(0) + 24);
  sub_21A836DBC(v16, a7);
  sub_21A841DEC((uint64_t)v15, v16, a5);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.setter(uint64_t a1)
{
  return sub_21A84276C(a1, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550F9E40, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t sub_21A84276C(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = v4 + *(int *)(a2(0) + 24);
  sub_21A836DBC(v8, a3);
  sub_21A841DEC(a1, v8, a4);
  v9 = a4(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
}

void (*SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.recordChangeset.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[1] = v5;
  v6 = type metadata accessor for SyncRecordChangesetProtobuf();
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v3[4] = malloc(v8);
  v9 = malloc(v8);
  v3[5] = v9;
  v10 = *(int *)(type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0) + 24);
  *((_DWORD *)v3 + 12) = v10;
  sub_21A841DA8(v1 + v10, (uint64_t)v5, &qword_2550F9E40);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    *v9 = 0;
    v9[1] = v11;
    v9[2] = v11;
    _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
    sub_21A836DBC((uint64_t)v5, &qword_2550F9E40);
  }
  else
  {
    sub_21A841DEC((uint64_t)v5, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  }
  return sub_21A842190;
}

void sub_21A842914(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = *(void **)a1;
  v7 = *(int *)(*(_QWORD *)a1 + 48);
  v8 = *(void **)(*(_QWORD *)a1 + 32);
  v9 = *(void **)(*(_QWORD *)a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v11 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v12 = *(void **)(*(_QWORD *)a1 + 8);
  v13 = **(_QWORD **)a1 + v7;
  if ((a2 & 1) != 0)
  {
    sub_21A8421A4(*(_QWORD *)(*(_QWORD *)a1 + 40), (uint64_t)v8, a4);
    sub_21A836DBC(v13, a3);
    sub_21A841DEC((uint64_t)v8, v13, a4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    sub_21A8421E8((uint64_t)v9, a4);
  }
  else
  {
    sub_21A836DBC(**(_QWORD **)a1 + v7, a3);
    sub_21A841DEC((uint64_t)v9, v13, a4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
  }
  free(v9);
  free(v8);
  free(v12);
  free(v6);
}

BOOL SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.hasRecordChangeset.getter()
{
  return sub_21A842A30(&qword_2550F9E40, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
}

BOOL sub_21A842A30(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2(0);
  sub_21A841DA8(v3 + *(int *)(v10 + 24), (uint64_t)v9, a1);
  v11 = a3(0);
  v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 1, v11) != 1;
  sub_21A836DBC((uint64_t)v9, a1);
  return v12;
}

Swift::Void __swiftcall SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.clearRecordChangeset()()
{
  sub_21A842B08(type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550F9E40, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t sub_21A842B08(uint64_t (*a1)(_QWORD), uint64_t *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = v3 + *(int *)(a1(0) + 24);
  sub_21A836DBC(v6, a2);
  v7 = a3(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, a1);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t (*SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.unknownFields.modify())()
{
  type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  return nullsub_1;
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;

  *a1 = 0;
  a1[1] = 0xE000000000000000;
  v2 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  v3 = (char *)a1 + *(int *)(v2 + 24);
  v4 = type metadata accessor for SyncRecordChangesetProtobuf();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
}

uint64_t SubmitSyncChangesetResponseProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21A833360((void (*)(_QWORD))type metadata accessor for SubmitSyncChangesetResponseProtobuf, a1);
}

unint64_t static EncryptionKeyProofProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_21A842C3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FAA00);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FAA00);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A8504E0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "identifier";
  *(_QWORD *)(v7 + 8) = 10;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "etag";
  *((_QWORD *)v11 + 1) = 4;
  v11[16] = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static EncryptionKeyProofProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DE0, (uint64_t)qword_2550FAA00, a1);
}

uint64_t EncryptionKeyProofProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21A85007C();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1)
        sub_21A8500DC();
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t EncryptionKeyProofProtobuf.traverse<A>(visitor:)()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_21A850190(), !v1))
  {
    v5 = v0[3];
    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    if (!v6 || (result = sub_21A850190(), !v1))
    {
      type metadata accessor for EncryptionKeyProofProtobuf(0);
      return sub_21A850028();
    }
  }
  return result;
}

uint64_t EncryptionKeyProofProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for EncryptionKeyProofProtobuf, &qword_2550FAA80, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
}

unint64_t sub_21A842F30()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_21A842F4C()
{
  return EncryptionKeyProofProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A842F60()
{
  return EncryptionKeyProofProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A842F74()
{
  sub_21A835654(&qword_2550FAE30, type metadata accessor for EncryptionKeyProofProtobuf, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A842FC4@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DE0, (uint64_t)qword_2550FAA00, a1);
}

uint64_t sub_21A842FE0()
{
  sub_21A835654(&qword_2550FAAC0, type metadata accessor for EncryptionKeyProofProtobuf, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A843020()
{
  sub_21A835654(&qword_2550FAAC0, type metadata accessor for EncryptionKeyProofProtobuf, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
  return sub_21A850118();
}

unint64_t static SubmitSyncChangesetRequestProtobuf.protoMessageName.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_21A843090(uint64_t a1)
{
  return sub_21A843C00(a1, qword_2550FAA18);
}

uint64_t static SubmitSyncChangesetRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DE8, (uint64_t)qword_2550FAA18, a1);
}

uint64_t SubmitSyncChangesetRequestProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A833DA4(a1, a2, a3, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_2550FAA88, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t SubmitSyncChangesetRequestProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A833EA0(a1, a2, a3, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_2550FAA88, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, (void (*)(_QWORD))type metadata accessor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t static SubmitSyncChangesetRequestProtobuf.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A849FDC, type metadata accessor for SubmitSyncChangesetRequestProtobuf) & 1;
}

uint64_t SubmitSyncChangesetRequestProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for SubmitSyncChangesetRequestProtobuf, &qword_2550FAA90, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf);
}

unint64_t sub_21A84315C()
{
  return 0xD000000000000022;
}

uint64_t sub_21A843178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetRequestProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_21A84318C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetRequestProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A8431A0()
{
  sub_21A835654(&qword_2550FAE28, type metadata accessor for SubmitSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A8431F0@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DE8, (uint64_t)qword_2550FAA18, a1);
}

uint64_t sub_21A84320C()
{
  sub_21A835654(&qword_2550FAAD8, type metadata accessor for SubmitSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A84324C()
{
  sub_21A835654(&qword_2550FAAD8, type metadata accessor for SubmitSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A84329C(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A849FDC, type metadata accessor for SubmitSyncChangesetRequestProtobuf) & 1;
}

unint64_t static SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.protoMessageName.getter()
{
  return 0xD000000000000038;
}

uint64_t sub_21A8432E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FAA30);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FAA30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A850500;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "zone";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "key";
  *((_QWORD *)v11 + 1) = 3;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "recordChangeset";
  *(_QWORD *)(v12 + 8) = 15;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DF0, (uint64_t)qword_2550FAA30, a1);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;

  v5 = v3;
  result = sub_21A85007C();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          sub_21A843588();
          break;
        case 2:
          sub_21A844188(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, type metadata accessor for EncryptionKeyProofProtobuf, &qword_2550FAAC0, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
          break;
        case 1:
          sub_21A8500DC();
          break;
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t sub_21A843588()
{
  type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  type metadata accessor for SyncRecordChangesetProtobuf();
  sub_21A835654(&qword_2550FA150, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  return sub_21A8500F4();
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v8 = v3[1];
  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = *v3 & 0xFFFFFFFFFFFFLL;
  if (!v9 || (result = sub_21A850190(), !v4))
  {
    result = sub_21A8436FC((uint64_t)v3, a1, a2, a3);
    if (!v4)
    {
      sub_21A843870((uint64_t)v3, a1, a2, a3);
      type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
      return sub_21A850028();
    }
  }
  return result;
}

uint64_t sub_21A8436FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_2550FAA78);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_21A836DBC((uint64_t)v7, &qword_2550FAA78);
  sub_21A841DEC((uint64_t)v7, (uint64_t)v11, type metadata accessor for EncryptionKeyProofProtobuf);
  sub_21A835654(&qword_2550FAAC0, type metadata accessor for EncryptionKeyProofProtobuf, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
  sub_21A8501A8();
  return sub_21A8421E8((uint64_t)v11, type metadata accessor for EncryptionKeyProofProtobuf);
}

uint64_t sub_21A843870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(a1 + *(int *)(v12 + 28), (uint64_t)v7, &qword_2550F9E40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_21A836DBC((uint64_t)v7, &qword_2550F9E40);
  sub_21A841DEC((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  sub_21A835654(&qword_2550FA150, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  sub_21A8501A8();
  return sub_21A8421E8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_2550FAA98, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A843A04@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  *a2 = 0;
  a2[1] = 0xE000000000000000;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  v4 = (char *)a2 + *(int *)(a1 + 24);
  v5 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = (char *)a2 + *(int *)(a1 + 28);
  v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
}

unint64_t sub_21A843A94()
{
  return 0xD000000000000038;
}

uint64_t sub_21A843AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_21A843AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A843AD8()
{
  sub_21A835654(&qword_2550FAE20, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A843B28@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DF0, (uint64_t)qword_2550FAA30, a1);
}

uint64_t sub_21A843B44()
{
  sub_21A835654(&qword_2550FAA88, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A843B84()
{
  sub_21A835654(&qword_2550FAA88, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
  return sub_21A850118();
}

unint64_t static SubmitSyncChangesetResponseProtobuf.protoMessageName.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_21A843BF4(uint64_t a1)
{
  return sub_21A843C00(a1, qword_2550FAA48);
}

uint64_t sub_21A843C00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_21A8501D8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  v6 = (v5 + 32) & ~v5;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21A8504F0;
  v8 = v7 + v6 + *(int *)(v4 + 48);
  *(_QWORD *)(v7 + v6) = 1;
  *(_QWORD *)v8 = "zoneChangesets";
  *(_QWORD *)(v8 + 8) = 14;
  *(_BYTE *)(v8 + 16) = 2;
  v9 = *MEMORY[0x24BE5C318];
  v10 = sub_21A8501B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v8, v9, v10);
  return sub_21A8501C0();
}

uint64_t static SubmitSyncChangesetResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9DF8, (uint64_t)qword_2550FAA48, a1);
}

uint64_t SubmitSyncChangesetResponseProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A833DA4(a1, a2, a3, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550FAAA0, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t SubmitSyncChangesetResponseProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A833EA0(a1, a2, a3, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550FAAA0, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (void (*)(_QWORD))type metadata accessor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t static SubmitSyncChangesetResponseProtobuf.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A8498F4, type metadata accessor for SubmitSyncChangesetResponseProtobuf) & 1;
}

uint64_t SubmitSyncChangesetResponseProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for SubmitSyncChangesetResponseProtobuf, &qword_2550FAAA8, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf);
}

unint64_t sub_21A843DC0()
{
  return 0xD000000000000023;
}

uint64_t sub_21A843DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetResponseProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_21A843DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetResponseProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A843E04()
{
  sub_21A835654(&qword_2550FAE18, type metadata accessor for SubmitSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A843E54@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9DF8, (uint64_t)qword_2550FAA48, a1);
}

uint64_t sub_21A843E70()
{
  sub_21A835654(&qword_2550FAB00, type metadata accessor for SubmitSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A843EB0()
{
  sub_21A835654(&qword_2550FAB00, type metadata accessor for SubmitSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A843F00(_QWORD *a1, char *a2)
{
  return sub_21A835518(a1, a2, sub_21A8498F4, type metadata accessor for SubmitSyncChangesetResponseProtobuf) & 1;
}

unint64_t static SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.protoMessageName.getter()
{
  return 0xD000000000000039;
}

uint64_t sub_21A843F44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FAA60);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FAA60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A8504E0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "zone";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "recordChangeset";
  *((_QWORD *)v11 + 1) = 15;
  v11[16] = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9E00, (uint64_t)qword_2550FAA60, a1);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;

  v5 = v3;
  result = sub_21A85007C();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      if (result == 2)
      {
        sub_21A844188(a1, v5, a2, a3, (void (*)(_QWORD))type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, &qword_2550FA150, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
      }
      else if (result == 1)
      {
        sub_21A8500DC();
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t sub_21A844188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  a5(0);
  a6(0);
  sub_21A835654(a7, a6, a8);
  return sub_21A8500F4();
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v8 = v3[1];
  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = *v3 & 0xFFFFFFFFFFFFLL;
  if (!v9 || (result = sub_21A850190(), !v4))
  {
    result = sub_21A8442EC((uint64_t)v3, a1, a2, a3);
    if (!v4)
    {
      type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
      return sub_21A850028();
    }
  }
  return result;
}

uint64_t sub_21A8442EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  sub_21A841DA8(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_2550F9E40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_21A836DBC((uint64_t)v7, &qword_2550F9E40);
  sub_21A841DEC((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
  sub_21A835654(&qword_2550FA150, (uint64_t (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SyncRecordChangesetProtobuf);
  sub_21A8501A8();
  return sub_21A8421E8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
}

uint64_t SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550FAAB0, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A844480@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char *v4;
  uint64_t v5;

  *a2 = 0;
  a2[1] = 0xE000000000000000;
  _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
  v4 = (char *)a2 + *(int *)(a1 + 24);
  v5 = type metadata accessor for SyncRecordChangesetProtobuf();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
}

unint64_t sub_21A8444DC()
{
  return 0xD000000000000039;
}

uint64_t sub_21A8444F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_21A84450C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A844520()
{
  sub_21A835654(&qword_2550FAE10, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A844570@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9E00, (uint64_t)qword_2550FAA60, a1);
}

uint64_t sub_21A84458C()
{
  sub_21A835654(&qword_2550FAAA0, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A8445CC()
{
  sub_21A835654(&qword_2550FAAA0, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
  return sub_21A850118();
}

uint64_t _s21SeymourServerProtocol35SubmitSyncChangesetResponseProtobufV04ZonefH0V2eeoiySbAE_AEtFZ_0(uint64_t *a1, char *a2)
{
  uint64_t v4;
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  char v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;

  v4 = sub_21A850040();
  v44 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v42 = (char *)&v40 - v7;
  v8 = type metadata accessor for SyncRecordChangesetProtobuf();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v41 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA140);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v40 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v40 - v21;
  v23 = *a1;
  v24 = a1[1];
  v25 = *(_QWORD *)a2;
  v26 = *((_QWORD *)a2 + 1);
  v45 = a2;
  if (v23 == v25 && v24 == v26 || (v27 = 0, (sub_21A85025C() & 1) != 0))
  {
    v40 = v4;
    v28 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
    sub_21A841DA8((uint64_t)a1 + *(int *)(v28 + 24), (uint64_t)v22, &qword_2550F9E40);
    sub_21A841DA8((uint64_t)&v45[*(int *)(v28 + 24)], (uint64_t)v20, &qword_2550F9E40);
    v29 = (uint64_t)&v13[*(int *)(v11 + 48)];
    sub_21A841DA8((uint64_t)v22, (uint64_t)v13, &qword_2550F9E40);
    sub_21A841DA8((uint64_t)v20, v29, &qword_2550F9E40);
    v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    if (v30((uint64_t)v13, 1, v8) == 1)
    {
      sub_21A836DBC((uint64_t)v20, &qword_2550F9E40);
      sub_21A836DBC((uint64_t)v22, &qword_2550F9E40);
      if (v30(v29, 1, v8) == 1)
      {
        sub_21A836DBC((uint64_t)v13, &qword_2550F9E40);
LABEL_11:
        v33 = v44;
        v34 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
        v35 = v42;
        v36 = v40;
        v34(v42, (char *)a1 + *(int *)(v28 + 20), v40);
        v37 = v43;
        v34(v43, &v45[*(int *)(v28 + 20)], v36);
        sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v27 = sub_21A8501FC();
        v38 = *(void (**)(char *, uint64_t))(v33 + 8);
        v38(v37, v36);
        v38(v35, v36);
        return v27 & 1;
      }
    }
    else
    {
      sub_21A841DA8((uint64_t)v13, (uint64_t)v17, &qword_2550F9E40);
      if (v30(v29, 1, v8) != 1)
      {
        v31 = v41;
        sub_21A841DEC(v29, v41, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
        v32 = static SyncRecordChangesetProtobuf.== infix(_:_:)(v17, v31);
        sub_21A8421E8(v31, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
        sub_21A836DBC((uint64_t)v20, &qword_2550F9E40);
        sub_21A836DBC((uint64_t)v22, &qword_2550F9E40);
        sub_21A8421E8((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
        sub_21A836DBC((uint64_t)v13, &qword_2550F9E40);
        if ((v32 & 1) != 0)
          goto LABEL_11;
LABEL_12:
        v27 = 0;
        return v27 & 1;
      }
      sub_21A836DBC((uint64_t)v20, &qword_2550F9E40);
      sub_21A836DBC((uint64_t)v22, &qword_2550F9E40);
      sub_21A8421E8((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
    }
    sub_21A836DBC((uint64_t)v13, &qword_2550FA140);
    goto LABEL_12;
  }
  return v27 & 1;
}

uint64_t _s21SeymourServerProtocol34SubmitSyncChangesetRequestProtobufV04ZonefH0V2eeoiySbAE_AEtFZ_0(char *a1, char *a2)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  int *v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  char v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  char *v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;

  v4 = sub_21A850040();
  v62 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v61 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v60 = (char *)&v57 - v7;
  v69 = type metadata accessor for SyncRecordChangesetProtobuf();
  v66 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v59 = (uint64_t)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA140);
  MEMORY[0x24BDAC7A8](v65);
  v70 = (uint64_t)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v63 = (uint64_t)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v67 = (uint64_t)&v57 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v68 = (uint64_t)&v57 - v15;
  v16 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v64 = (uint64_t *)((char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAE38);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (uint64_t *)((char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v57 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v57 - v29;
  v31 = *(_QWORD *)a1;
  v32 = *((_QWORD *)a1 + 1);
  v71 = a1;
  v72 = a2;
  if (v31 == *(_QWORD *)a2 && v32 == *((_QWORD *)a2 + 1) || (v33 = 0, (sub_21A85025C() & 1) != 0))
  {
    v58 = v4;
    v34 = (int *)type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
    sub_21A841DA8((uint64_t)&v71[v34[6]], (uint64_t)v30, &qword_2550FAA78);
    sub_21A841DA8((uint64_t)&v72[v34[6]], (uint64_t)v28, &qword_2550FAA78);
    v35 = (uint64_t)&v21[*(int *)(v19 + 48)];
    sub_21A841DA8((uint64_t)v30, (uint64_t)v21, &qword_2550FAA78);
    sub_21A841DA8((uint64_t)v28, v35, &qword_2550FAA78);
    v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
    if (v36((uint64_t)v21, 1, v16) == 1)
    {
      sub_21A836DBC((uint64_t)v28, &qword_2550FAA78);
      sub_21A836DBC((uint64_t)v30, &qword_2550FAA78);
      if (v36(v35, 1, v16) == 1)
      {
        sub_21A836DBC((uint64_t)v21, &qword_2550FAA78);
        v37 = v58;
LABEL_17:
        v42 = v68;
        sub_21A841DA8((uint64_t)&v71[v34[7]], v68, &qword_2550F9E40);
        v43 = v67;
        sub_21A841DA8((uint64_t)&v72[v34[7]], v67, &qword_2550F9E40);
        v44 = v70;
        v45 = v70 + *(int *)(v65 + 48);
        sub_21A841DA8(v42, v70, &qword_2550F9E40);
        sub_21A841DA8(v43, v45, &qword_2550F9E40);
        v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48);
        v47 = v69;
        if (v46(v44, 1, v69) == 1)
        {
          sub_21A836DBC(v43, &qword_2550F9E40);
          sub_21A836DBC(v42, &qword_2550F9E40);
          if (v46(v45, 1, v47) == 1)
          {
            sub_21A836DBC(v44, &qword_2550F9E40);
LABEL_28:
            v52 = v62;
            v53 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
            v54 = v60;
            v53(v60, &v71[v34[5]], v37);
            v55 = v61;
            v53(v61, &v72[v34[5]], v37);
            sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
            v33 = sub_21A8501FC();
            v56 = *(void (**)(char *, uint64_t))(v52 + 8);
            v56(v55, v37);
            v56(v54, v37);
            return v33 & 1;
          }
        }
        else
        {
          v48 = v63;
          sub_21A841DA8(v44, v63, &qword_2550F9E40);
          if (v46(v45, 1, v47) != 1)
          {
            v50 = v59;
            sub_21A841DEC(v45, v59, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
            v51 = static SyncRecordChangesetProtobuf.== infix(_:_:)(v48, v50);
            sub_21A8421E8(v50, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
            sub_21A836DBC(v43, &qword_2550F9E40);
            sub_21A836DBC(v42, &qword_2550F9E40);
            sub_21A8421E8(v48, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
            sub_21A836DBC(v44, &qword_2550F9E40);
            if ((v51 & 1) != 0)
              goto LABEL_28;
            goto LABEL_25;
          }
          sub_21A836DBC(v43, &qword_2550F9E40);
          sub_21A836DBC(v42, &qword_2550F9E40);
          sub_21A8421E8(v48, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
        }
        v38 = &qword_2550FA140;
        v39 = v44;
        goto LABEL_24;
      }
    }
    else
    {
      sub_21A841DA8((uint64_t)v21, (uint64_t)v25, &qword_2550FAA78);
      if (v36(v35, 1, v16) != 1)
      {
        v40 = v64;
        sub_21A841DEC(v35, (uint64_t)v64, type metadata accessor for EncryptionKeyProofProtobuf);
        if ((*v25 == *v40 && v25[1] == v40[1] || (sub_21A85025C() & 1) != 0)
          && (v25[2] == v40[2] && v25[3] == v40[3] || (sub_21A85025C() & 1) != 0))
        {
          sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
          v37 = v58;
          v41 = sub_21A8501FC();
          sub_21A8421E8((uint64_t)v40, type metadata accessor for EncryptionKeyProofProtobuf);
          sub_21A836DBC((uint64_t)v28, &qword_2550FAA78);
          sub_21A836DBC((uint64_t)v30, &qword_2550FAA78);
          sub_21A8421E8((uint64_t)v25, type metadata accessor for EncryptionKeyProofProtobuf);
          sub_21A836DBC((uint64_t)v21, &qword_2550FAA78);
          if ((v41 & 1) == 0)
          {
LABEL_25:
            v33 = 0;
            return v33 & 1;
          }
          goto LABEL_17;
        }
        sub_21A8421E8((uint64_t)v40, type metadata accessor for EncryptionKeyProofProtobuf);
        sub_21A836DBC((uint64_t)v28, &qword_2550FAA78);
        sub_21A836DBC((uint64_t)v30, &qword_2550FAA78);
        sub_21A8421E8((uint64_t)v25, type metadata accessor for EncryptionKeyProofProtobuf);
        v39 = (uint64_t)v21;
        v38 = &qword_2550FAA78;
LABEL_24:
        sub_21A836DBC(v39, v38);
        goto LABEL_25;
      }
      sub_21A836DBC((uint64_t)v28, &qword_2550FAA78);
      sub_21A836DBC((uint64_t)v30, &qword_2550FAA78);
      sub_21A8421E8((uint64_t)v25, type metadata accessor for EncryptionKeyProofProtobuf);
    }
    v38 = &qword_2550FAE38;
    v39 = (uint64_t)v21;
    goto LABEL_24;
  }
  return v33 & 1;
}

uint64_t _s21SeymourServerProtocol26EncryptionKeyProofProtobufV2eeoiySbAC_ACtFZ_0(_QWORD *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *a1 == *(_QWORD *)a2 && a1[1] == *((_QWORD *)a2 + 1);
  if (v11 || (v12 = 0, (sub_21A85025C() & 1) != 0))
  {
    v13 = a1[2] == *((_QWORD *)a2 + 2) && a1[3] == *((_QWORD *)a2 + 3);
    if (v13 || (v12 = 0, (sub_21A85025C() & 1) != 0))
    {
      v14 = type metadata accessor for EncryptionKeyProofProtobuf(0);
      v15 = (char *)a1 + *(int *)(v14 + 24);
      v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v16(v10, v15, v4);
      v16(v8, &a2[*(int *)(v14 + 24)], v4);
      sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v12 = sub_21A8501FC();
      v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
    }
  }
  return v12 & 1;
}

uint64_t sub_21A845328()
{
  return sub_21A835654(&qword_2550FAAB8, type metadata accessor for EncryptionKeyProofProtobuf, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
}

uint64_t sub_21A845354()
{
  return sub_21A835654(&qword_2550FAAC0, type metadata accessor for EncryptionKeyProofProtobuf, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
}

uint64_t sub_21A845380()
{
  return sub_21A835654(&qword_2550FAA80, type metadata accessor for EncryptionKeyProofProtobuf, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
}

uint64_t sub_21A8453AC()
{
  return sub_21A835654(&qword_2550FAAC8, type metadata accessor for EncryptionKeyProofProtobuf, (uint64_t)&protocol conformance descriptor for EncryptionKeyProofProtobuf);
}

uint64_t sub_21A8453D8()
{
  return sub_21A835654(&qword_2550FAAD0, type metadata accessor for SubmitSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t sub_21A845404()
{
  return sub_21A835654(&qword_2550FAAD8, type metadata accessor for SubmitSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t sub_21A845430()
{
  return sub_21A835654(&qword_2550FAA90, type metadata accessor for SubmitSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t sub_21A84545C()
{
  return sub_21A835654(&qword_2550FAAE0, type metadata accessor for SubmitSyncChangesetRequestProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf);
}

uint64_t sub_21A845488()
{
  return sub_21A835654(&qword_2550FAAE8, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A8454B4()
{
  return sub_21A835654(&qword_2550FAA88, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A8454E0()
{
  return sub_21A835654(&qword_2550FAA98, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A84550C()
{
  return sub_21A835654(&qword_2550FAAF0, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A845538()
{
  return sub_21A835654(&qword_2550FAAF8, type metadata accessor for SubmitSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t sub_21A845564()
{
  return sub_21A835654(&qword_2550FAB00, type metadata accessor for SubmitSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t sub_21A845590()
{
  return sub_21A835654(&qword_2550FAAA8, type metadata accessor for SubmitSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t sub_21A8455BC()
{
  return sub_21A835654(&qword_2550FAB08, type metadata accessor for SubmitSyncChangesetResponseProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf);
}

uint64_t sub_21A8455E8()
{
  return sub_21A835654(&qword_2550FAB10, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A845614()
{
  return sub_21A835654(&qword_2550FAAA0, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A845640()
{
  return sub_21A835654(&qword_2550FAAB0, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A84566C()
{
  return sub_21A835654(&qword_2550FAB18, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, (uint64_t)&protocol conformance descriptor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
}

uint64_t sub_21A84569C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21A842680(a1, a2, a3, a4, type metadata accessor for EncryptionKeyProofProtobuf, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf, &qword_2550FAA78);
}

uint64_t sub_21A8456D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21A842680(a1, a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf, &qword_2550F9E40);
}

uint64_t getEnumTagSinglePayload for EncryptionKeyProofProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A84570C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for EncryptionKeyProofProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A845794(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A845808()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SubmitSyncChangesetRequestProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for SubmitSyncChangesetRequestProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(uint64_t *a1, uint64_t *a2, int *a3)
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
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  void (*v37)(char *, char *, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21A850040();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = type metadata accessor for EncryptionKeyProofProtobuf(0);
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v20 = v15[1];
      *v14 = *v15;
      v14[1] = v20;
      v21 = v15[3];
      v14[2] = v15[2];
      v14[3] = v21;
      v22 = *(int *)(v16 + 24);
      v37 = v12;
      v23 = (char *)v14 + v22;
      v24 = (char *)v15 + v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v25 = v23;
      v12 = v37;
      v37(v25, v24, v11);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    v26 = a3[7];
    v27 = (uint64_t *)((char *)v4 + v26);
    v28 = (uint64_t *)((char *)a2 + v26);
    v29 = type metadata accessor for SyncRecordChangesetProtobuf();
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = v28[1];
      *v27 = *v28;
      v27[1] = v32;
      v27[2] = v28[2];
      v33 = *(int *)(v29 + 28);
      v34 = (char *)v27 + v33;
      v35 = (char *)v28 + v33;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12(v34, v35, v11);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
  }
  return v4;
}

uint64_t destroy for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void (*v11)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_21A850040();
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v11(v4, v5);
  v6 = a1 + a2[6];
  v7 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11(v6 + *(int *)(v7 + 24), v5);
  }
  v8 = a1 + a2[7];
  v9 = type metadata accessor for SyncRecordChangesetProtobuf();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v11)(v8 + *(int *)(v9 + 28), v5);
  }
  return result;
}

_QWORD *initializeWithCopy for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void (*v35)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21A850040();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v18 = v14[1];
    *v13 = *v14;
    v13[1] = v18;
    v19 = v14[3];
    v13[2] = v14[2];
    v13[3] = v19;
    v20 = *(int *)(v15 + 24);
    v35 = v11;
    v21 = (char *)v13 + v20;
    v22 = (char *)v14 + v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = v21;
    v11 = v35;
    v35(v23, v22, v10);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v24 = a3[7];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  v27 = type metadata accessor for SyncRecordChangesetProtobuf();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    v30 = v26[1];
    *v25 = *v26;
    v25[1] = v30;
    v25[2] = v26[2];
    v31 = *(int *)(v27 + 28);
    v32 = (char *)v25 + v31;
    v33 = (char *)v26 + v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v32, v33, v10);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  return a1;
}

_QWORD *assignWithCopy for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t, uint64_t);
  int v28;
  int v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  void (*v36)(char *, char *, uint64_t);
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  v38 = *(_QWORD *)(v9 - 8);
  v37 = *(void (**)(char *, char *, uint64_t))(v38 + 24);
  v37(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      *v11 = *v12;
      v11[1] = v12[1];
      v11[2] = v12[2];
      v11[3] = v12[3];
      v18 = *(int *)(v13 + 24);
      v19 = (char *)v11 + v18;
      v20 = (char *)v12 + v18;
      v36 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v36(v19, v20, v9);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    sub_21A8421E8((uint64_t)v11, type metadata accessor for EncryptionKeyProofProtobuf);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[2] = v12[2];
  v11[3] = v12[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37((char *)v11 + *(int *)(v13 + 24), (char *)v12 + *(int *)(v13 + 24), v9);
LABEL_7:
  v22 = a3[7];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = type metadata accessor for SyncRecordChangesetProtobuf();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  v28 = v27(v23, 1, v25);
  v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      *(_QWORD *)v23 = *(_QWORD *)v24;
      *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v23 + 2) = *((_QWORD *)v24 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v37(&v23[*(int *)(v25 + 28)], &v24[*(int *)(v25 + 28)], v9);
      return a1;
    }
    sub_21A8421E8((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
    goto LABEL_12;
  }
  if (v29)
  {
LABEL_12:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    return a1;
  }
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
  *((_QWORD *)v23 + 2) = *((_QWORD *)v24 + 2);
  v30 = *(int *)(v25 + 28);
  v31 = &v23[v30];
  v32 = &v24[v30];
  v33 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v33(v31, v32, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  return a1;
}

_OWORD *initializeWithTake for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = (_OWORD *)((char *)a1 + v11);
  v13 = (_OWORD *)((char *)a2 + v11);
  v14 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v17 = v13[1];
    *v12 = *v13;
    v12[1] = v17;
    v10((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v9);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v18 = a3[7];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v21 = type metadata accessor for SyncRecordChangesetProtobuf();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    *(_OWORD *)v19 = *(_OWORD *)v20;
    v19[2] = v20[2];
    v10((char *)v19 + *(int *)(v21 + 28), (char *)v20 + *(int *)(v21 + 28), v9);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

_QWORD *assignWithTake for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD *, uint64_t, uint64_t);
  int v17;
  int v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21A850040();
  v34 = *(_QWORD *)(v10 - 8);
  v33 = *(void (**)(char *, char *, uint64_t))(v34 + 40);
  v33(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = type metadata accessor for EncryptionKeyProofProtobuf(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      v19 = *((_OWORD *)v13 + 1);
      *(_OWORD *)v12 = *(_OWORD *)v13;
      *((_OWORD *)v12 + 1) = v19;
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v10);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    sub_21A8421E8((uint64_t)v12, type metadata accessor for EncryptionKeyProofProtobuf);
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  v31 = v13[1];
  *v12 = *v13;
  v12[1] = v31;
  swift_bridgeObjectRelease();
  v32 = v13[3];
  v12[2] = v13[2];
  v12[3] = v32;
  swift_bridgeObjectRelease();
  v33((char *)v12 + *(int *)(v14 + 24), (char *)v13 + *(int *)(v14 + 24), v10);
LABEL_7:
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for SyncRecordChangesetProtobuf();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  v27 = v26(v22, 1, v24);
  v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
      swift_bridgeObjectRelease();
      *((_QWORD *)v22 + 2) = *((_QWORD *)v23 + 2);
      swift_bridgeObjectRelease();
      v33(&v22[*(int *)(v24 + 28)], &v23[*(int *)(v24 + 28)], v10);
      return a1;
    }
    sub_21A8421E8((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
    goto LABEL_12;
  }
  if (v28)
  {
LABEL_12:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    return a1;
  }
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *((_QWORD *)v22 + 2) = *((_QWORD *)v23 + 2);
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(&v22[*(int *)(v24 + 28)], &v23[*(int *)(v24 + 28)], v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A84653C(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21A850040();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[6];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a3[7];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A846614(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_21A850040();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FAA78);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[6];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[7];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_21A8466DC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_21A850040();
  if (v0 <= 0x3F)
  {
    sub_21A8467A8(319, qword_2550FACB0, (void (*)(uint64_t))type metadata accessor for EncryptionKeyProofProtobuf);
    if (v1 <= 0x3F)
    {
      sub_21A8467A8(319, qword_2550FA0E8, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_21A8467A8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_21A850220();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t getEnumTagSinglePayload for SubmitSyncChangesetResponseProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for SubmitSyncChangesetResponseProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *initializeBufferWithCopyOfBuffer for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21A850040();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = type metadata accessor for SyncRecordChangesetProtobuf();
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v20 = v15[1];
      *v14 = *v15;
      v14[1] = v20;
      v14[2] = v15[2];
      v21 = *(int *)(v16 + 28);
      v22 = (char *)v14 + v21;
      v23 = (char *)v15 + v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12(v22, v23, v11);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t destroy for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void (*v9)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21A850040();
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v9(v4, v5);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = type metadata accessor for SyncRecordChangesetProtobuf();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v6 + *(int *)(v7 + 28), v5);
  }
  return result;
}

_QWORD *initializeWithCopy for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21A850040();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = type metadata accessor for SyncRecordChangesetProtobuf();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v18 = v14[1];
    *v13 = *v14;
    v13[1] = v18;
    v13[2] = v14[2];
    v19 = *(int *)(v15 + 28);
    v20 = (char *)v13 + v19;
    v21 = (char *)v14 + v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v20, v21, v10);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

_QWORD *assignWithCopy for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for SyncRecordChangesetProtobuf();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v8) = v17(v13, 1, v15);
  v18 = v17(v14, 1, v15);
  if (!(_DWORD)v8)
  {
    if (!v18)
    {
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v11(&v13[*(int *)(v15 + 28)], &v14[*(int *)(v15 + 28)], v9);
      return a1;
    }
    sub_21A8421E8((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    return a1;
  }
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
  v19 = *(int *)(v15 + 28);
  v20 = &v13[v19];
  v21 = &v14[v19];
  v22 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22(v20, v21, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

_OWORD *initializeWithTake for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = type metadata accessor for SyncRecordChangesetProtobuf();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    *(_OWORD *)v12 = *(_OWORD *)v13;
    v12[2] = v13[2];
    v10((char *)v12 + *(int *)(v14 + 28), (char *)v13 + *(int *)(v14 + 28), v9);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

_QWORD *assignWithTake for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  int v19;
  uint64_t v20;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21A850040();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = type metadata accessor for SyncRecordChangesetProtobuf();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v9) = v18(v14, 1, v16);
  v19 = v18(v15, 1, v16);
  if (!(_DWORD)v9)
  {
    if (!v19)
    {
      *(_QWORD *)v14 = *(_QWORD *)v15;
      *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
      swift_bridgeObjectRelease();
      *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
      swift_bridgeObjectRelease();
      v12(&v14[*(int *)(v16 + 28)], &v15[*(int *)(v16 + 28)], v10);
      return a1;
    }
    sub_21A8421E8((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v14[*(int *)(v16 + 28)], &v15[*(int *)(v16 + 28)], v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A846FD4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21A850040();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A847084(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v8 = sub_21A850040();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_21A847124()
{
  unint64_t v0;
  unint64_t v1;

  sub_21A850040();
  if (v0 <= 0x3F)
  {
    sub_21A8467A8(319, qword_2550FA0E8, (void (*)(uint64_t))type metadata accessor for SyncRecordChangesetProtobuf);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t PingProtobuf.ping.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PingProtobuf.ping.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PingProtobuf.ping.modify())()
{
  return nullsub_1;
}

uint64_t PingProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for PingProtobuf, a1);
}

uint64_t type metadata accessor for PingProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FAF08);
}

uint64_t PingProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for PingProtobuf);
}

uint64_t (*PingProtobuf.unknownFields.modify())()
{
  type metadata accessor for PingProtobuf(0);
  return nullsub_1;
}

uint64_t PingProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21A84731C((void (*)(_QWORD))type metadata accessor for PingProtobuf, a1);
}

uint64_t (*PongProtobuf.pong.modify())()
{
  return nullsub_1;
}

uint64_t PongProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for PongProtobuf, a1);
}

uint64_t type metadata accessor for PongProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FAF98);
}

uint64_t PongProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for PongProtobuf);
}

uint64_t (*PongProtobuf.unknownFields.modify())()
{
  type metadata accessor for PongProtobuf(0);
  return nullsub_1;
}

uint64_t PongProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21A84731C((void (*)(_QWORD))type metadata accessor for PongProtobuf, a1);
}

uint64_t sub_21A84731C@<X0>(void (*a1)(_QWORD)@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  a1(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t static PingProtobuf.protoMessageName.getter()
{
  return 0x746F7250676E6950;
}

uint64_t sub_21A847378(uint64_t a1)
{
  return sub_21A8475D0(a1, qword_2550FAE40, (uint64_t)"ping");
}

uint64_t static PingProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9E08, (uint64_t)qword_2550FAE40, a1);
}

uint64_t PingProtobuf.decodeMessage<A>(decoder:)()
{
  return sub_21A847704();
}

uint64_t PingProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A84778C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for PingProtobuf);
}

uint64_t static PingProtobuf.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_21A8479C4(a1, a2, type metadata accessor for PingProtobuf) & 1;
}

uint64_t PingProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for PingProtobuf, &qword_2550FAE70, (uint64_t)&protocol conformance descriptor for PingProtobuf);
}

uint64_t sub_21A847414@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

uint64_t sub_21A847438()
{
  return 0x746F7250676E6950;
}

uint64_t sub_21A847458()
{
  return PingProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A84746C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PingProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A847480()
{
  sub_21A835654(&qword_2550FAFD8, type metadata accessor for PingProtobuf, (uint64_t)&protocol conformance descriptor for PingProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A8474D0@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9E08, (uint64_t)qword_2550FAE40, a1);
}

uint64_t sub_21A8474EC()
{
  sub_21A835654(&qword_2550FAE88, type metadata accessor for PingProtobuf, (uint64_t)&protocol conformance descriptor for PingProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A84752C()
{
  sub_21A835654(&qword_2550FAE88, type metadata accessor for PingProtobuf, (uint64_t)&protocol conformance descriptor for PingProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A84757C(_QWORD *a1, char *a2)
{
  return sub_21A8479C4(a1, a2, type metadata accessor for PingProtobuf) & 1;
}

uint64_t static PongProtobuf.protoMessageName.getter()
{
  return 0x746F7250676E6F50;
}

uint64_t sub_21A8475BC(uint64_t a1)
{
  return sub_21A8475D0(a1, qword_2550FAE58, (uint64_t)"pong");
}

uint64_t sub_21A8475D0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = sub_21A8501D8();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (v7 + 32) & ~v7;
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21A8504F0;
  v10 = v9 + v8 + *(int *)(v6 + 48);
  *(_QWORD *)(v9 + v8) = 1;
  *(_QWORD *)v10 = a3;
  *(_QWORD *)(v10 + 8) = 4;
  *(_BYTE *)(v10 + 16) = 2;
  v11 = *MEMORY[0x24BE5C318];
  v12 = sub_21A8501B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  return sub_21A8501C0();
}

uint64_t static PongProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9E10, (uint64_t)qword_2550FAE58, a1);
}

uint64_t PongProtobuf.decodeMessage<A>(decoder:)()
{
  return sub_21A847704();
}

uint64_t sub_21A847704()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_21A85007C();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
      sub_21A8500DC();
  }
  return result;
}

uint64_t PongProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A84778C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for PongProtobuf);
}

uint64_t sub_21A84778C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD))
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v7 = v4[1];
  v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v8 = *v4 & 0xFFFFFFFFFFFFLL;
  if (!v8 || (result = sub_21A850190(), !v5))
  {
    a4(0);
    return sub_21A850028();
  }
  return result;
}

uint64_t static PongProtobuf.== infix(_:_:)(_QWORD *a1, char *a2)
{
  return sub_21A8479C4(a1, a2, type metadata accessor for PongProtobuf) & 1;
}

uint64_t PongProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for PongProtobuf, &qword_2550FAE78, (uint64_t)&protocol conformance descriptor for PongProtobuf);
}

uint64_t sub_21A847874()
{
  return 0x746F7250676E6F50;
}

uint64_t sub_21A847894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PongProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A8478A8()
{
  sub_21A835654(&qword_2550FAFD0, type metadata accessor for PongProtobuf, (uint64_t)&protocol conformance descriptor for PongProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A8478F8@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9E10, (uint64_t)qword_2550FAE58, a1);
}

uint64_t sub_21A847914()
{
  sub_21A835654(&qword_2550FAEA0, type metadata accessor for PongProtobuf, (uint64_t)&protocol conformance descriptor for PongProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A847954()
{
  sub_21A835654(&qword_2550FAEA0, type metadata accessor for PongProtobuf, (uint64_t)&protocol conformance descriptor for PongProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A8479A4(_QWORD *a1, char *a2)
{
  return sub_21A8479C4(a1, a2, type metadata accessor for PongProtobuf) & 1;
}

uint64_t sub_21A8479C4(_QWORD *a1, char *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  char v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v6 = sub_21A850040();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - v11;
  v13 = *a1 == *(_QWORD *)a2 && a1[1] == *((_QWORD *)a2 + 1);
  if (v13 || (v14 = 0, (sub_21A85025C() & 1) != 0))
  {
    v15 = a3(0);
    v16 = (char *)a1 + *(int *)(v15 + 20);
    v17 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v17(v12, v16, v6);
    v17(v10, &a2[*(int *)(v15 + 20)], v6);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_21A8501FC();
    v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v18(v10, v6);
    v18(v12, v6);
  }
  return v14 & 1;
}

uint64_t sub_21A847B08()
{
  return sub_21A835654(&qword_2550FAE80, type metadata accessor for PingProtobuf, (uint64_t)&protocol conformance descriptor for PingProtobuf);
}

uint64_t sub_21A847B34()
{
  return sub_21A835654(&qword_2550FAE88, type metadata accessor for PingProtobuf, (uint64_t)&protocol conformance descriptor for PingProtobuf);
}

uint64_t sub_21A847B60()
{
  return sub_21A835654(&qword_2550FAE70, type metadata accessor for PingProtobuf, (uint64_t)&protocol conformance descriptor for PingProtobuf);
}

uint64_t sub_21A847B8C()
{
  return sub_21A835654(&qword_2550FAE90, type metadata accessor for PingProtobuf, (uint64_t)&protocol conformance descriptor for PingProtobuf);
}

uint64_t sub_21A847BB8()
{
  return sub_21A835654(&qword_2550FAE98, type metadata accessor for PongProtobuf, (uint64_t)&protocol conformance descriptor for PongProtobuf);
}

uint64_t sub_21A847BE4()
{
  return sub_21A835654(&qword_2550FAEA0, type metadata accessor for PongProtobuf, (uint64_t)&protocol conformance descriptor for PongProtobuf);
}

uint64_t sub_21A847C10()
{
  return sub_21A835654(&qword_2550FAE78, type metadata accessor for PongProtobuf, (uint64_t)&protocol conformance descriptor for PongProtobuf);
}

uint64_t sub_21A847C3C()
{
  return sub_21A835654(&qword_2550FAEA8, type metadata accessor for PongProtobuf, (uint64_t)&protocol conformance descriptor for PongProtobuf);
}

uint64_t getEnumTagSinglePayload for PingProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for PingProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *_s21SeymourServerProtocol12PingProtobufVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_21A850040();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t _s21SeymourServerProtocol12PingProtobufVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *_s21SeymourServerProtocol12PingProtobufVwcp_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_21A850040();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *_s21SeymourServerProtocol12PingProtobufVwca_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *_s21SeymourServerProtocol12PingProtobufVwtk_0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *_s21SeymourServerProtocol12PingProtobufVwta_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for PongProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for PongProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm_0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A84804C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t ValidateEncryptionKeyRequestProtobuf.encryptionKeys.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ValidateEncryptionKeyRequestProtobuf.encryptionKeys.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ValidateEncryptionKeyRequestProtobuf.encryptionKeys.modify())()
{
  return nullsub_1;
}

uint64_t ValidateEncryptionKeyRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for ValidateEncryptionKeyRequestProtobuf, a1);
}

uint64_t type metadata accessor for ValidateEncryptionKeyRequestProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_253F24178);
}

uint64_t ValidateEncryptionKeyRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t (*ValidateEncryptionKeyRequestProtobuf.unknownFields.modify())()
{
  type metadata accessor for ValidateEncryptionKeyRequestProtobuf(0);
  return nullsub_1;
}

uint64_t ValidateEncryptionKeyRequestProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21A833360((void (*)(_QWORD))type metadata accessor for ValidateEncryptionKeyRequestProtobuf, a1);
}

uint64_t (*ValidateEncryptionKeyResponseProtobuf.encryptionKeys.modify())()
{
  return nullsub_1;
}

uint64_t ValidateEncryptionKeyResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A832958(type metadata accessor for ValidateEncryptionKeyResponseProtobuf, a1);
}

uint64_t type metadata accessor for ValidateEncryptionKeyResponseProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_253F24208);
}

uint64_t ValidateEncryptionKeyResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  return sub_21A8329C4(a1, type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t (*ValidateEncryptionKeyResponseProtobuf.unknownFields.modify())()
{
  type metadata accessor for ValidateEncryptionKeyResponseProtobuf(0);
  return nullsub_1;
}

uint64_t ValidateEncryptionKeyResponseProtobuf.init()@<X0>(_QWORD *a1@<X8>)
{
  return sub_21A833360((void (*)(_QWORD))type metadata accessor for ValidateEncryptionKeyResponseProtobuf, a1);
}

unint64_t static ValidateEncryptionKeyRequestProtobuf.protoMessageName.getter()
{
  return 0xD000000000000024;
}

uint64_t sub_21A8481F8(uint64_t a1)
{
  return sub_21A848414(a1, qword_2550FAFE0);
}

uint64_t static ValidateEncryptionKeyRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9E18, (uint64_t)qword_2550FAFE0, a1);
}

uint64_t ValidateEncryptionKeyRequestProtobuf.decodeMessage<A>(decoder:)()
{
  return sub_21A848544();
}

uint64_t ValidateEncryptionKeyRequestProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A848644(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t static ValidateEncryptionKeyRequestProtobuf.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_21A8488A8(a1, a2, type metadata accessor for ValidateEncryptionKeyRequestProtobuf) & 1;
}

uint64_t ValidateEncryptionKeyRequestProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for ValidateEncryptionKeyRequestProtobuf, &qword_2550FB010, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyRequestProtobuf);
}

unint64_t sub_21A84828C()
{
  return 0xD000000000000024;
}

uint64_t sub_21A8482A8()
{
  return ValidateEncryptionKeyRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A8482BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ValidateEncryptionKeyRequestProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A8482D0()
{
  sub_21A835654(&qword_2550FB058, type metadata accessor for ValidateEncryptionKeyRequestProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyRequestProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A848320@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9E18, (uint64_t)qword_2550FAFE0, a1);
}

uint64_t sub_21A84833C()
{
  sub_21A835654(&qword_2550FB028, type metadata accessor for ValidateEncryptionKeyRequestProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyRequestProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A84837C()
{
  sub_21A835654(&qword_2550FB028, type metadata accessor for ValidateEncryptionKeyRequestProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyRequestProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A8483CC(uint64_t *a1, uint64_t *a2)
{
  return sub_21A8488A8(a1, a2, type metadata accessor for ValidateEncryptionKeyRequestProtobuf) & 1;
}

unint64_t static ValidateEncryptionKeyResponseProtobuf.protoMessageName.getter()
{
  return 0xD000000000000025;
}

uint64_t sub_21A848408(uint64_t a1)
{
  return sub_21A848414(a1, qword_2550FAFF8);
}

uint64_t sub_21A848414(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_21A8501D8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  v6 = (v5 + 32) & ~v5;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21A8504F0;
  v8 = v7 + v6 + *(int *)(v4 + 48);
  *(_QWORD *)(v7 + v6) = 1;
  *(_QWORD *)v8 = "encryptionKeys";
  *(_QWORD *)(v8 + 8) = 14;
  *(_BYTE *)(v8 + 16) = 2;
  v9 = *MEMORY[0x24BE5C318];
  v10 = sub_21A8501B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v8, v9, v10);
  return sub_21A8501C0();
}

uint64_t static ValidateEncryptionKeyResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9E20, (uint64_t)qword_2550FAFF8, a1);
}

uint64_t ValidateEncryptionKeyResponseProtobuf.decodeMessage<A>(decoder:)()
{
  return sub_21A848544();
}

uint64_t sub_21A848544()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;

  result = sub_21A85007C();
  if (!v0)
  {
    v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BE17930];
    v4 = MEMORY[0x24BE17920];
    while ((v2 & 1) == 0)
    {
      if (result == 1)
      {
        sub_21A850004();
        sub_21A835654(&qword_2550FA940, v3, v4);
        sub_21A8500E8();
      }
      result = sub_21A85007C();
    }
  }
  return result;
}

uint64_t ValidateEncryptionKeyResponseProtobuf.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21A848644(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_21A848644(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)v4 + 16)
    || (sub_21A850004(),
        sub_21A835654(&qword_2550FA940, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17920]),
        result = sub_21A85019C(),
        !v5))
  {
    a4(0);
    return sub_21A850028();
  }
  return result;
}

uint64_t static ValidateEncryptionKeyResponseProtobuf.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_21A8488A8(a1, a2, type metadata accessor for ValidateEncryptionKeyResponseProtobuf) & 1;
}

uint64_t ValidateEncryptionKeyResponseProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for ValidateEncryptionKeyResponseProtobuf, &qword_2550FB018, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyResponseProtobuf);
}

unint64_t sub_21A84875C()
{
  return 0xD000000000000025;
}

uint64_t sub_21A848778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ValidateEncryptionKeyResponseProtobuf.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_21A84878C()
{
  sub_21A835654(&qword_2550FB050, type metadata accessor for ValidateEncryptionKeyResponseProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyResponseProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A8487DC@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9E20, (uint64_t)qword_2550FAFF8, a1);
}

uint64_t sub_21A8487F8()
{
  sub_21A835654(&qword_2550FB040, type metadata accessor for ValidateEncryptionKeyResponseProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyResponseProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A848838()
{
  sub_21A835654(&qword_2550FB040, type metadata accessor for ValidateEncryptionKeyResponseProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyResponseProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A848888(uint64_t *a1, uint64_t *a2)
{
  return sub_21A8488A8(a1, a2, type metadata accessor for ValidateEncryptionKeyResponseProtobuf) & 1;
}

uint64_t sub_21A8488A8(uint64_t *a1, uint64_t *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v6 = sub_21A850040();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v19 - v11;
  if ((sub_21A8498D8(*a1, *a2) & 1) != 0)
  {
    v13 = a3(0);
    v14 = (char *)a1 + *(int *)(v13 + 20);
    v15 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v15(v12, v14, v6);
    v15(v10, (char *)a2 + *(int *)(v13 + 20), v6);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v16 = sub_21A8501FC();
    v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v10, v6);
    v17(v12, v6);
  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

uint64_t sub_21A8489E0()
{
  return sub_21A835654(&qword_2550FB020, type metadata accessor for ValidateEncryptionKeyRequestProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t sub_21A848A0C()
{
  return sub_21A835654(&qword_2550FB028, type metadata accessor for ValidateEncryptionKeyRequestProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t sub_21A848A38()
{
  return sub_21A835654(&qword_2550FB010, type metadata accessor for ValidateEncryptionKeyRequestProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t sub_21A848A64()
{
  return sub_21A835654(&qword_2550FB030, type metadata accessor for ValidateEncryptionKeyRequestProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyRequestProtobuf);
}

uint64_t sub_21A848A90()
{
  return sub_21A835654(&qword_2550FB038, type metadata accessor for ValidateEncryptionKeyResponseProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_21A848ABC()
{
  return sub_21A835654(&qword_2550FB040, type metadata accessor for ValidateEncryptionKeyResponseProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_21A848AE8()
{
  return sub_21A835654(&qword_2550FB018, type metadata accessor for ValidateEncryptionKeyResponseProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t sub_21A848B14()
{
  return sub_21A835654(&qword_2550FB048, type metadata accessor for ValidateEncryptionKeyResponseProtobuf, (uint64_t)&protocol conformance descriptor for ValidateEncryptionKeyResponseProtobuf);
}

uint64_t getEnumTagSinglePayload for ValidateEncryptionKeyRequestProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ValidateEncryptionKeyRequestProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for ValidateEncryptionKeyResponseProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ValidateEncryptionKeyResponseProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

SeymourServerProtocol::RecordField_optional __swiftcall RecordField.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SeymourServerProtocol::RecordField_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21A850250();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t RecordField.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000010;
  if (*v0 != 1)
    v1 = 0x696669746E656469;
  if (*v0)
    return v1;
  else
    return 0x6574707972636E65;
}

uint64_t sub_21A848C50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21A839A9C(*a1, *a2);
}

unint64_t sub_21A848C60()
{
  unint64_t result;

  result = qword_2550FB060;
  if (!qword_2550FB060)
  {
    result = MEMORY[0x22074A8B0](&protocol conformance descriptor for RecordField, &type metadata for RecordField);
    atomic_store(result, (unint64_t *)&qword_2550FB060);
  }
  return result;
}

uint64_t sub_21A848CA4()
{
  sub_21A8502BC();
  sub_21A850208();
  swift_bridgeObjectRelease();
  return sub_21A8502D4();
}

uint64_t sub_21A848D58()
{
  sub_21A850208();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21A848DE8()
{
  sub_21A8502BC();
  sub_21A850208();
  swift_bridgeObjectRelease();
  return sub_21A8502D4();
}

SeymourServerProtocol::RecordField_optional sub_21A848E98(Swift::String *a1)
{
  return RecordField.init(rawValue:)(*a1);
}

void sub_21A848EA4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xEE00736574794264;
  v4 = 0x800000021A853500;
  v5 = 0xD000000000000010;
  if (v2 != 1)
  {
    v5 = 0x696669746E656469;
    v4 = 0xEA00000000007265;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6574707972636E65;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecordField(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RecordField(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21A849000 + 4 * byte_21A852E65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21A849034 + 4 * byte_21A852E60[v4]))();
}

uint64_t sub_21A849034(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A84903C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21A849044);
  return result;
}

uint64_t sub_21A849050(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21A849058);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21A84905C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A849064(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21A849070(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21A849078(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecordField()
{
  return &type metadata for RecordField;
}

uint64_t ScoreEstimationProtobuf.seconds.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ScoreEstimationProtobuf.seconds.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ScoreEstimationProtobuf.seconds.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationProtobuf.markers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ScoreEstimationProtobuf.markers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ScoreEstimationProtobuf.markers.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationProtobuf.sampleCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ScoreEstimationProtobuf.sampleCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*ScoreEstimationProtobuf.sampleCount.modify())()
{
  return nullsub_1;
}

uint64_t ScoreEstimationProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScoreEstimationProtobuf() + 28);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ScoreEstimationProtobuf()
{
  uint64_t result;

  result = qword_2550FB0F8;
  if (!qword_2550FB0F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ScoreEstimationProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ScoreEstimationProtobuf() + 28);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*ScoreEstimationProtobuf.unknownFields.modify())()
{
  type metadata accessor for ScoreEstimationProtobuf();
  return nullsub_1;
}

uint64_t ScoreEstimationProtobuf.init()@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 16) = 0;
  type metadata accessor for ScoreEstimationProtobuf();
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ScoreEstimationProtobuf.protoMessageName.getter()
{
  return 0xD000000000000017;
}

uint64_t sub_21A849260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FB068);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FB068);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21A850500;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "seconds";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21A8501B4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "markers";
  *((_QWORD *)v11 + 1) = 7;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 3;
  *(_QWORD *)v12 = "sampleCount";
  *(_QWORD *)(v12 + 8) = 11;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_21A8501C0();
}

uint64_t static ScoreEstimationProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9E28 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FB068);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t ScoreEstimationProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_21A85007C();
  v3 = v0;
  if (!v0)
  {
    while (1)
    {
      if ((v2 & 1) != 0)
        return result;
      if (result == 3)
        break;
      if (result == 2)
      {
        type metadata accessor for ScoreEstimationMarkerProtobuf();
        sub_21A835654(&qword_2550FA560, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf);
        v4 = v3;
        sub_21A8500E8();
        goto LABEL_5;
      }
      if (result == 1)
      {
        v4 = v3;
        sub_21A8500AC();
        goto LABEL_5;
      }
LABEL_6:
      result = sub_21A85007C();
    }
    v4 = v3;
    sub_21A8500B8();
LABEL_5:
    v3 = v4;
    goto LABEL_6;
  }
  return result;
}

uint64_t ScoreEstimationProtobuf.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_DWORD *)v0 || (result = sub_21A850160(), !v1))
  {
    if (!*(_QWORD *)(*(_QWORD *)(v0 + 8) + 16)
      || (type metadata accessor for ScoreEstimationMarkerProtobuf(),
          sub_21A835654(&qword_2550FA560, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationMarkerProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationMarkerProtobuf), result = sub_21A85019C(), !v1))
    {
      if (!*(_QWORD *)(v0 + 16) || (result = sub_21A85016C(), !v1))
      {
        type metadata accessor for ScoreEstimationProtobuf();
        return sub_21A850028();
      }
    }
  }
  return result;
}

uint64_t ScoreEstimationProtobuf.hashValue.getter()
{
  sub_21A8502BC();
  type metadata accessor for ScoreEstimationProtobuf();
  sub_21A835654(&qword_2550FB080, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationProtobuf);
  sub_21A8501F0();
  return sub_21A8502D4();
}

uint64_t sub_21A849714@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 16) = 0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A849740()
{
  return 0xD000000000000017;
}

uint64_t sub_21A84975C()
{
  return ScoreEstimationProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A849770()
{
  return ScoreEstimationProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A849784()
{
  sub_21A835654(&qword_2550FB138, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A8497D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550F9E28 != -1)
    swift_once();
  v2 = sub_21A8501D8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550FB068);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_21A849844()
{
  sub_21A835654(&qword_2550FB090, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A849884()
{
  sub_21A835654(&qword_2550FB090, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationProtobuf);
  return sub_21A850118();
}

uint64_t sub_21A8498D8(uint64_t a1, uint64_t a2)
{
  return sub_21A84B7F4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], &qword_2550FB140, MEMORY[0x24BE17940]);
}

uint64_t sub_21A8498F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  unint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  unsigned int v43;
  double *v44;
  __n128 v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t (*v50)(char *, unint64_t, uint64_t, __n128);
  char *v51;
  uint64_t result;
  char *v53;
  char v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t (*v60)(char *, unint64_t, uint64_t, __n128);
  char *v61;
  char *v62;
  char v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  char v66;
  char v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  double *v80;
  char *v81;
  _QWORD *v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;

  v84 = a2;
  v87 = a1;
  v2 = sub_21A850004();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v69 - v7;
  v9 = type metadata accessor for SyncRecordChangesetProtobuf();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (double *)((char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (unint64_t *)((char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA140);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v26 = *(_QWORD *)(v87 + 16);
  if (v26 != *(_QWORD *)(v25 + 16))
  {
LABEL_38:
    v67 = 0;
    return v67 & 1;
  }
  v76 = v16;
  v77 = v10;
  v80 = v12;
  v81 = (char *)&v69 - v23;
  v71 = v21;
  v82 = v24;
  v79 = v18;
  v86 = v8;
  if (!v26 || v87 == v25)
  {
    v67 = 1;
    return v67 & 1;
  }
  v27 = 0;
  v28 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v73 = v25 + v28;
  v74 = v87 + v28;
  v72 = *(_QWORD *)(v22 + 72);
  v87 = v3;
  v30 = v81;
  v29 = v82;
  v31 = v71;
  v32 = v6;
  v33 = v15;
  v34 = v9;
  v85 = v32;
  v69 = v9;
  v70 = v26;
  v75 = v33;
  while (1)
  {
    v78 = v27;
    v35 = v72 * v27;
    sub_21A8421A4(v74 + v72 * v27, (uint64_t)v30, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    sub_21A8421A4(v73 + v35, (uint64_t)v29, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    v36 = *v30 == *v29 && v30[1] == v29[1];
    if (!v36 && (sub_21A85025C() & 1) == 0)
      goto LABEL_37;
    v37 = *(int *)(v31 + 24);
    v38 = (uint64_t)v30 + v37;
    v39 = (uint64_t)v29 + v37;
    v40 = (uint64_t)v79;
    v41 = (uint64_t)&v79[*(int *)(v76 + 48)];
    sub_21A832DFC(v38, (uint64_t)v79);
    sub_21A832DFC(v39, v41);
    v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48);
    if (v42(v40, 1, v34) == 1)
    {
      if (v42(v41, 1, v34) == 1)
      {
        sub_21A836DBC(v40, &qword_2550F9E40);
        goto LABEL_30;
      }
      v68 = &qword_2550FA140;
LABEL_36:
      sub_21A836DBC(v40, v68);
      v30 = v81;
      v29 = v82;
LABEL_37:
      sub_21A8421E8((uint64_t)v29, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
      sub_21A8421E8((uint64_t)v30, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
      goto LABEL_38;
    }
    sub_21A832DFC(v40, (uint64_t)v33);
    v43 = v42(v41, 1, v34);
    v44 = v80;
    if (v43 == 1)
    {
      v68 = &qword_2550FA140;
LABEL_35:
      sub_21A8421E8((uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
      goto LABEL_36;
    }
    sub_21A832E44(v41, (uint64_t)v80);
    v45.n128_u64[0] = *v33;
    if (*(double *)v33 != *v44
      || (v46 = *((_QWORD *)v80 + 1), v84 = v75[1], v47 = *(_QWORD *)(v84 + 16), v47 != *(_QWORD *)(v46 + 16)))
    {
LABEL_34:
      sub_21A8421E8((uint64_t)v80, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
      v68 = &qword_2550F9E40;
      v33 = v75;
      v40 = (uint64_t)v79;
      goto LABEL_35;
    }
    if (v47 && v84 != v46)
      break;
LABEL_22:
    v56 = *((_QWORD *)v80 + 2);
    v84 = v75[2];
    v57 = *(_QWORD *)(v84 + 16);
    if (v57 != *(_QWORD *)(v56 + 16))
      goto LABEL_34;
    if (v57 && v84 != v56)
    {
      v58 = 0;
      v59 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      v83 = *(_QWORD *)(v3 + 72);
      v60 = *(uint64_t (**)(char *, unint64_t, uint64_t, __n128))(v3 + 16);
      do
      {
        v61 = v86;
        result = v60(v86, v84 + v59, v2, v45);
        if (v58 >= *(_QWORD *)(v56 + 16))
          goto LABEL_43;
        v62 = v85;
        ((void (*)(char *, unint64_t, uint64_t))v60)(v85, v56 + v59, v2);
        sub_21A835654(&qword_2550FB140, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17940]);
        v63 = sub_21A8501FC();
        v64 = *(void (**)(char *, uint64_t))(v87 + 8);
        v64(v62, v2);
        v64(v61, v2);
        v3 = v87;
        if ((v63 & 1) == 0)
          goto LABEL_34;
        ++v58;
        v59 += v83;
      }
      while (v57 != v58);
    }
    v34 = v69;
    v33 = v75;
    v65 = (uint64_t)v80;
    sub_21A850040();
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v66 = sub_21A8501FC();
    sub_21A8421E8(v65, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
    sub_21A8421E8((uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for SyncRecordChangesetProtobuf);
    sub_21A836DBC((uint64_t)v79, &qword_2550F9E40);
    v30 = v81;
    v29 = v82;
    v31 = v71;
    if ((v66 & 1) == 0)
      goto LABEL_37;
LABEL_30:
    sub_21A850040();
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v30 = v81;
    v29 = v82;
    v67 = sub_21A8501FC();
    sub_21A8421E8((uint64_t)v29, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    sub_21A8421E8((uint64_t)v30, type metadata accessor for SubmitSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    if ((v67 & 1) != 0)
    {
      v27 = v78 + 1;
      if (v78 + 1 != v70)
        continue;
    }
    return v67 & 1;
  }
  v48 = 0;
  v49 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v83 = *(_QWORD *)(v3 + 72);
  v50 = *(uint64_t (**)(char *, unint64_t, uint64_t, __n128))(v3 + 16);
  while (1)
  {
    v51 = v86;
    result = v50(v86, v84 + v49, v2, v45);
    if (v48 >= *(_QWORD *)(v46 + 16))
      break;
    v53 = v85;
    ((void (*)(char *, unint64_t, uint64_t))v50)(v85, v46 + v49, v2);
    sub_21A835654(&qword_2550FB140, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17940]);
    v54 = sub_21A8501FC();
    v55 = *(void (**)(char *, uint64_t))(v87 + 8);
    v55(v53, v2);
    v55(v51, v2);
    v3 = v87;
    if ((v54 & 1) == 0)
      goto LABEL_34;
    ++v48;
    v49 += v83;
    if (v47 == v48)
      goto LABEL_22;
  }
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_21A849FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_21A8421A4(a1 + v12, (uint64_t)v10, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
        sub_21A8421A4(a2 + v12, (uint64_t)v7, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
        v15 = static SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf.== infix(_:_:)(v10, v7);
        sub_21A8421E8((uint64_t)v7, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
        sub_21A8421E8((uint64_t)v10, type metadata accessor for SubmitSyncChangesetRequestProtobuf.ZoneChangesetProtobuf);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_21A84A118(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_21A85025C(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_21A85025C() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_21A84A1DC(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  BOOL v26;
  char v27;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t SyncChangesetResponse;
  char *v36;
  _QWORD *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = sub_21A850004();
  v39 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v29 - v7;
  v9 = type metadata accessor for SyncRecordChangesetProtobuf();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v36 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550F9E40);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA140);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  SyncChangesetResponse = type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf(0);
  v18 = MEMORY[0x24BDAC7A8](SyncChangesetResponse);
  v34 = (char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v37 = (_QWORD *)((char *)v29 - v21);
  v22 = *(_QWORD *)(a1 + 16);
  if (v22 != *(_QWORD *)(a2 + 16))
  {
LABEL_12:
    v27 = 0;
    return v27 & 1;
  }
  if (v22 && a1 != a2)
  {
    v29[4] = 0;
    v29[5] = v15;
    v32 = v17;
    v33 = v14;
    v23 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    v30 = a2 + v23;
    v31 = a1 + v23;
    v29[6] = *(_QWORD *)(v20 + 72);
    v40 = v8;
    v24 = v34;
    v29[1] = v9;
    v29[2] = v10;
    v29[3] = v22;
    v25 = v37;
    sub_21A8421A4(v31, (uint64_t)v37, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    sub_21A8421A4(v30, (uint64_t)v24, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    v26 = *v25 == *v24 && v25[1] == v24[1];
    if (v26 || (sub_21A85025C() & 1) != 0)
      __asm { BR              X10 }
    sub_21A8421E8((uint64_t)v24, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    sub_21A8421E8((uint64_t)v37, type metadata accessor for FetchSyncChangesetResponseProtobuf.ZoneChangesetProtobuf);
    goto LABEL_12;
  }
  v27 = 1;
  return v27 & 1;
}

uint64_t sub_21A84ABF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  _QWORD v14[5];
  uint64_t SyncChangesetRequest;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  SyncChangesetRequest = type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf(0);
  v4 = MEMORY[0x24BDAC7A8](SyncChangesetRequest);
  v6 = (_QWORD *)((char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v9 = (_QWORD *)((char *)v14 - v8);
  v16 = a1;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v10 && v16 != a2)
  {
    v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v14[4] = *(_QWORD *)(v7 + 72);
    sub_21A8421A4(v16 + v11, (uint64_t)v14 - v8, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
    sub_21A8421A4(a2 + v11, (uint64_t)v6, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
    v12 = *v9 == *v6 && v9[1] == v6[1];
    if (v12 || (sub_21A85025C() & 1) != 0)
      __asm { BR              X10 }
    sub_21A8421E8((uint64_t)v6, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
    sub_21A8421E8((uint64_t)v9, type metadata accessor for FetchSyncChangesetRequestProtobuf.ZoneChangesetRequestProtobuf);
    return 0;
  }
  return 1;
}

uint64_t sub_21A84B600(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;

  v16 = type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf(0);
  v4 = MEMORY[0x24BDAC7A8](v16);
  v6 = (uint64_t *)((char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v9 = (uint64_t *)((char *)&v15 - v8);
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 == *(_QWORD *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
      return 1;
    v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v15 = *(_QWORD *)(v7 + 72);
    while (1)
    {
      sub_21A8421A4(a1 + v11, (uint64_t)v9, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
      sub_21A8421A4(a2 + v11, (uint64_t)v6, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
      v12 = *v9 == *v6 && v9[1] == v6[1];
      if (!v12 && (sub_21A85025C() & 1) == 0)
        break;
      v13 = v9[2] == v6[2] && v9[3] == v6[3];
      if (!v13 && (sub_21A85025C() & 1) == 0)
        break;
      sub_21A850040();
      sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      if ((sub_21A8501FC() & 1) == 0)
        break;
      sub_21A8421E8((uint64_t)v6, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
      sub_21A8421E8((uint64_t)v9, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
      v11 += v15;
      if (!--v10)
        return 1;
    }
    sub_21A8421E8((uint64_t)v6, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
    sub_21A8421E8((uint64_t)v9, type metadata accessor for SubmitScoresResponseProtobuf.SessionScoresRejectionProtobuf);
  }
  return 0;
}

uint64_t sub_21A84B7D8(uint64_t a1, uint64_t a2)
{
  return sub_21A84B7F4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE8B678], &qword_2550FB148, MEMORY[0x24BE8B688]);
}

uint64_t sub_21A84B7F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, unint64_t, uint64_t);
  uint64_t v21;
  unint64_t *v22;
  unint64_t *v23;
  uint64_t v24;
  char v25;
  void (*v26)(uint64_t, uint64_t);
  BOOL v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, unint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);

  v10 = a3(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v30 - v14;
  v16 = *(_QWORD *)(a1 + 16);
  if (v16 == *(_QWORD *)(a2 + 16))
  {
    if (!v16 || a1 == a2)
    {
      v25 = 1;
    }
    else
    {
      v33 = v13;
      v34 = v12;
      v35 = a3;
      v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      v30 = *(_QWORD *)(v12 + 72);
      v31 = a1;
      v32 = *(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 16);
      v18 = v16 - 1;
      v19 = v13;
      do
      {
        v20 = v32;
        v32((uint64_t)v15, a1 + v17, v10);
        v21 = a2;
        v20(v19, a2 + v17, v10);
        v22 = a4;
        v23 = a4;
        v24 = a5;
        sub_21A835654(v23, v35, a5);
        v25 = sub_21A8501FC();
        v26 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
        v26(v19, v10);
        v26((uint64_t)v15, v10);
        v28 = v18-- != 0;
        if ((v25 & 1) == 0)
          break;
        v17 += v30;
        a5 = v24;
        a4 = v22;
        a2 = v21;
        a1 = v31;
      }
      while (v28);
    }
  }
  else
  {
    v25 = 0;
  }
  return v25 & 1;
}

uint64_t sub_21A84B998(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  float *v6;
  uint64_t v7;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;

  v18 = type metadata accessor for ScoreEstimationMarkerProtobuf();
  v4 = MEMORY[0x24BDAC7A8](v18);
  v6 = (float *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v9 = (float *)((char *)&v17 - v8);
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 != *(_QWORD *)(a2 + 16))
  {
LABEL_17:
    v13 = 0;
    return v13 & 1;
  }
  if (v10 && a1 != a2)
  {
    v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v17 = *(_QWORD *)(v7 + 72);
    v12 = v10 - 1;
    while (1)
    {
      sub_21A8421A4(a1 + v11, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for ScoreEstimationMarkerProtobuf);
      sub_21A8421A4(a2 + v11, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for ScoreEstimationMarkerProtobuf);
      if (*(_DWORD *)v9 != *(_DWORD *)v6 || v9[1] != v6[1] || v9[2] != v6[2] || v9[3] != v6[3])
        break;
      sub_21A850040();
      sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v13 = sub_21A8501FC();
      sub_21A8421E8((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for ScoreEstimationMarkerProtobuf);
      sub_21A8421E8((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for ScoreEstimationMarkerProtobuf);
      v15 = v12-- != 0;
      if ((v13 & 1) != 0)
      {
        v11 += v17;
        if (v15)
          continue;
      }
      return v13 & 1;
    }
    sub_21A8421E8((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for ScoreEstimationMarkerProtobuf);
    sub_21A8421E8((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for ScoreEstimationMarkerProtobuf);
    goto LABEL_17;
  }
  v13 = 1;
  return v13 & 1;
}

uint64_t sub_21A84BB84(uint64_t a1, uint64_t a2)
{
  return sub_21A84B7F4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BE892A8], &qword_2550FB150, MEMORY[0x24BE892B8]);
}

uint64_t _s21SeymourServerProtocol23ScoreEstimationProtobufV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if (*(_DWORD *)a1 == *(_DWORD *)a2
    && (sub_21A84B998(*(_QWORD *)(a1 + 8), *(_QWORD *)(a2 + 8)) & 1) != 0
    && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v11 = type metadata accessor for ScoreEstimationProtobuf();
    v12 = a1 + *(int *)(v11 + 28);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, a2 + *(int *)(v11 + 28), v4);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_21A8501FC();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_21A84BCF4()
{
  return sub_21A835654(&qword_2550FB088, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationProtobuf);
}

uint64_t sub_21A84BD20()
{
  return sub_21A835654(&qword_2550FB090, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationProtobuf);
}

uint64_t sub_21A84BD4C()
{
  return sub_21A835654(&qword_2550FB080, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationProtobuf);
}

uint64_t sub_21A84BD78()
{
  return sub_21A835654(&qword_2550FB098, (uint64_t (*)(uint64_t))type metadata accessor for ScoreEstimationProtobuf, (uint64_t)&protocol conformance descriptor for ScoreEstimationProtobuf);
}

uint64_t *initializeBufferWithCopyOfBuffer for ScoreEstimationProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v5 = a2[2];
    a1[1] = a2[1];
    a1[2] = v5;
    v6 = *(int *)(a3 + 28);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_21A850040();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(int *)(a3 + 28);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_21A850040();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t assignWithCopy for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for ScoreEstimationProtobuf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScoreEstimationProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A84C078(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ScoreEstimationProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A84C100(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_21A850040();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21A84C174()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21A84C208()
{
  sub_21A83F5D4();
  return sub_21A84FFB0();
}

uint64_t sub_21A84C23C()
{
  sub_21A83F5D4();
  return sub_21A84FFBC();
}

uint64_t sub_21A84C298()
{
  sub_21A83F5D4();
  return sub_21A84FF98();
}

uint64_t sub_21A84C2CC()
{
  sub_21A83F5D4();
  return sub_21A84FFA4();
}

uint64_t sub_21A84C328()
{
  sub_21A83F5D4();
  return sub_21A84FFC8();
}

uint64_t sub_21A84C35C()
{
  sub_21A83F5D4();
  return sub_21A84FFD4();
}

uint64_t ServerError.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[6];

  v23[5] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FB158);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_21A84FFF8();
  v9 = a1;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v13 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8]((char *)v23 - v14);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  MEMORY[0x24BDAC7A8](v18);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    v19 = (char *)&loc_21A84C5F8 + 4 * word_21A8530E0[*(_QWORD *)a1];
    v23[4] = 0;
    __asm { BR              X10 }
  }
  v20 = sub_21A84FF68();
  sub_21A835654(&qword_2550FB160, (uint64_t (*)(uint64_t))MEMORY[0x24BE897B0], MEMORY[0x24BE897B8]);
  swift_allocError();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v21, *MEMORY[0x24BE89798], v20);
  swift_willThrow();
  return sub_21A84CE6C(v9);
}

uint64_t sub_21A84CE6C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ServerErrorProtobuf();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21A84CEA8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FB158);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ServerError.protobuf()()
{
  type metadata accessor for ServerErrorProtobuf();
  sub_21A835654(&qword_2550FA480, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
  return sub_21A850124();
}

void sub_21A84CF78(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v11[8];

  v6 = sub_21A84FFF8();
  v11[5] = *(_QWORD *)(v6 - 8);
  v11[6] = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v11[4] = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11[3] = (char *)v11 - v9;
  v10 = (char *)&loc_21A84D014 + *((int *)qword_21A84D918 + a4);
  v11[7] = a2;
  __asm { BR              X10 }
}

uint64_t sub_21A84D028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  int v7;
  int v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  char v24;
  uint64_t result;

  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 1;
  v4 = *(_QWORD *)(v2 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    *(_QWORD *)(v3 - 144) = v1;
    *(_QWORD *)(v3 - 136) = v0;
    *(_QWORD *)(v3 - 72) = v5;
    sub_21A84E8C4(0, v4, 0);
    v6 = sub_21A84E9E0(v2);
    v8 = v7;
    v10 = v9 & 1;
    *(_QWORD *)(v3 - 128) = v2 + 56;
    do
    {
      if (v6 < 0 || v6 >= 1 << *(_BYTE *)(v2 + 32))
      {
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        JUMPOUT(0x21A84D8E8);
      }
      if (((*(_QWORD *)(*(_QWORD *)(v3 - 128) + (((unint64_t)v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
        goto LABEL_15;
      if (*(_DWORD *)(v2 + 36) != v8)
        goto LABEL_16;
      v12 = *(_QWORD *)(v3 - 104);
      v11 = *(_QWORD *)(v3 - 96);
      v13 = *(_QWORD *)(v2 + 48) + *(_QWORD *)(v12 + 72) * v6;
      v14 = *(_QWORD *)(v3 - 120);
      (*(void (**)(uint64_t, int64_t, uint64_t))(v12 + 16))(v14, v13, v11);
      v15 = *(_QWORD *)(v3 - 112);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v15, v14, v11);
      v16 = sub_21A84FFEC();
      v18 = v17;
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
      v5 = *(_QWORD *)(v3 - 72);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21A84E8C4(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = *(_QWORD *)(v3 - 72);
      }
      v20 = *(_QWORD *)(v5 + 16);
      v19 = *(_QWORD *)(v5 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_21A84E8C4((char *)(v19 > 1), v20 + 1, 1);
        v5 = *(_QWORD *)(v3 - 72);
      }
      *(_QWORD *)(v5 + 16) = v20 + 1;
      v21 = v5 + 16 * v20;
      *(_QWORD *)(v21 + 32) = v16;
      *(_QWORD *)(v21 + 40) = v18;
      v2 = *(_QWORD *)(v3 - 88);
      v22 = sub_21A84EA80(v6, v8, v10 & 1, v2);
      v6 = v22;
      v8 = v23;
      v10 = v24 & 1;
      --v4;
    }
    while (v4);
    sub_21A84ED00(v22, v23, v24 & 1);
    v1 = *(_QWORD *)(v3 - 144);
  }
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = v5;
  return result;
}

uint64_t sub_21A84D944@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ServerError.init(_:)(a1, a2);
}

uint64_t sub_21A84D958()
{
  type metadata accessor for ServerErrorProtobuf();
  sub_21A835654(&qword_2550FA480, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
  return sub_21A850124();
}

uint64_t sub_21A84D9E8()
{
  return sub_21A84FFD4();
}

uint64_t sub_21A84D9FC()
{
  return sub_21A84FFC8();
}

uint64_t sub_21A84DA10()
{
  return sub_21A84FFA4();
}

uint64_t sub_21A84DA24()
{
  return sub_21A84FF98();
}

uint64_t sub_21A84DA38(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_21A84FFF8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_21A835654(&qword_2550FA918, v11, MEMORY[0x24BE8DAE8]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_21A8501E4();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_21A835654(&qword_2550FA920, (uint64_t (*)(uint64_t))MEMORY[0x24BE8DAD8], MEMORY[0x24BE8DAF0]);
      v21 = sub_21A8501FC();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_21A84E000((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_21A84DC94()
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
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_21A84FFF8();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FB178);
  v6 = sub_21A850238();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
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
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_21A835654(&qword_2550FA918, (uint64_t (*)(uint64_t))MEMORY[0x24BE8DAD8], MEMORY[0x24BE8DAE8]);
      result = sub_21A8501E4();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_21A84E000(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_21A84FFF8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_21A84DC94();
  }
  else
  {
    if (v11 > v10)
    {
      sub_21A84E204();
      goto LABEL_12;
    }
    sub_21A84E428();
  }
  v12 = *v3;
  sub_21A835654(&qword_2550FA918, (uint64_t (*)(uint64_t))MEMORY[0x24BE8DAD8], MEMORY[0x24BE8DAE8]);
  v13 = sub_21A8501E4();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_21A835654(&qword_2550FA920, (uint64_t (*)(uint64_t))MEMORY[0x24BE8DAD8], MEMORY[0x24BE8DAF0]);
      v18 = sub_21A8501FC();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_21A850268();
  __break(1u);
  return result;
}

void *sub_21A84E204()
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
  v2 = sub_21A84FFF8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FB178);
  v6 = *v0;
  v7 = sub_21A85022C();
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
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
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

uint64_t sub_21A84E428()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
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
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_21A84FFF8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FB178);
  v7 = sub_21A850238();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_21A835654(&qword_2550FA918, (uint64_t (*)(uint64_t))MEMORY[0x24BE8DAD8], MEMORY[0x24BE8DAE8]);
    result = sub_21A8501E4();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

size_t sub_21A84E750(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FB170);
  v10 = *(_QWORD *)(sub_21A84FFF8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_21A84FFF8() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_21A84E8C4(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21A84E8E0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21A84E8E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550FB168);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_21A84E9E0(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_21A84EA80(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_21A84EB64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v2 = sub_21A84FFF8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_21A835654(&qword_2550FA918, v10, MEMORY[0x24BE8DAE8]);
  result = sub_21A850214();
  v16 = result;
  if (v9)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v14(v6, v12, v2);
      sub_21A84DA38((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v12 += v13;
      --v9;
    }
    while (v9);
    return v16;
  }
  return result;
}

void sub_21A84EC8C(uint64_t a1)
{
  uint64_t v1;

  sub_21A84CF78(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
}

uint64_t sub_21A84ECA8()
{
  return sub_21A835654(&qword_2550FA480, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
}

uint64_t sub_21A84ECD4()
{
  return sub_21A835654(&qword_2550FA488, (uint64_t (*)(uint64_t))type metadata accessor for ServerErrorProtobuf, (uint64_t)&protocol conformance descriptor for ServerErrorProtobuf);
}

uint64_t sub_21A84ED00(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_21A84ED10(uint64_t a1)
{
  sub_21A84EC8C(a1);
}

uint64_t ExecuteTasksRequestProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ExecuteTasksRequestProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*ExecuteTasksRequestProtobuf.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t ExecuteTasksResponseProtobuf.executedTasksCount.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ExecuteTasksResponseProtobuf.executedTasksCount.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ExecuteTasksResponseProtobuf.executedTasksCount.modify())()
{
  return nullsub_1;
}

uint64_t ExecuteTasksResponseProtobuf.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ExecuteTasksResponseProtobuf(0) + 20);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ExecuteTasksResponseProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FB2D8);
}

uint64_t ExecuteTasksResponseProtobuf.unknownFields.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ExecuteTasksResponseProtobuf(0) + 20);
  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*ExecuteTasksResponseProtobuf.unknownFields.modify())()
{
  type metadata accessor for ExecuteTasksResponseProtobuf(0);
  return nullsub_1;
}

uint64_t ExecuteTasksResponseProtobuf.init()@<X0>(_DWORD *a1@<X8>)
{
  *a1 = 0;
  type metadata accessor for ExecuteTasksResponseProtobuf(0);
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t static ExecuteTasksRequestProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21A84EEE4()
{
  uint64_t v0;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FB180);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FB180);
  return sub_21A8501CC();
}

uint64_t static ExecuteTasksRequestProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9E30, (uint64_t)qword_2550FB180, a1);
}

uint64_t ExecuteTasksRequestProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  do
    result = sub_21A85007C();
  while (!v0 && (v2 & 1) == 0);
  return result;
}

uint64_t ExecuteTasksRequestProtobuf.traverse<A>(visitor:)()
{
  return sub_21A850028();
}

uint64_t static ExecuteTasksRequestProtobuf.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v4 = sub_21A850040();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v15 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&v15 - v10, a1, v4);
  v12(v9, a2, v4);
  sub_21A835654(&qword_2550FA148, v5, MEMORY[0x24BE5BF20]);
  LOBYTE(a2) = sub_21A8501FC();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v4);
  v13(v11, v4);
  return a2 & 1;
}

uint64_t ExecuteTasksRequestProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for ExecuteTasksRequestProtobuf, &qword_2550FB1B0, (uint64_t)&protocol conformance descriptor for ExecuteTasksRequestProtobuf);
}

unint64_t sub_21A84F0C8()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_21A84F0E4()
{
  return ExecuteTasksRequestProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A84F0F8()
{
  return ExecuteTasksRequestProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A84F10C()
{
  sub_21A835654(&qword_2550FB318, type metadata accessor for ExecuteTasksRequestProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksRequestProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A84F15C@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9E30, (uint64_t)qword_2550FB180, a1);
}

uint64_t sub_21A84F178()
{
  sub_21A835654(&qword_2550FB1C8, type metadata accessor for ExecuteTasksRequestProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksRequestProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A84F1B8()
{
  sub_21A835654(&qword_2550FB1C8, type metadata accessor for ExecuteTasksRequestProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksRequestProtobuf);
  return sub_21A850118();
}

uint64_t type metadata accessor for ExecuteTasksRequestProtobuf(uint64_t a1)
{
  return sub_21A832DC8(a1, qword_2550FB248);
}

uint64_t sub_21A84F21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v4 = sub_21A850040();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v15 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&v15 - v10, a1, v4);
  v12(v9, a2, v4);
  sub_21A835654(&qword_2550FA148, v5, MEMORY[0x24BE5BF20]);
  LOBYTE(a2) = sub_21A8501FC();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v4);
  v13(v11, v4);
  return a2 & 1;
}

unint64_t static ExecuteTasksResponseProtobuf.protoMessageName.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_21A84F344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_21A8501D8();
  __swift_allocate_value_buffer(v0, qword_2550FB198);
  __swift_project_value_buffer(v0, (uint64_t)qword_2550FB198);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA158);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550FA160);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21A8504F0;
  v5 = v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v4 + v3) = 1;
  *(_QWORD *)v5 = "executedTasksCount";
  *(_QWORD *)(v5 + 8) = 18;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x24BE5C318];
  v7 = sub_21A8501B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  return sub_21A8501C0();
}

uint64_t static ExecuteTasksResponseProtobuf._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21A8337F4(&qword_2550F9E38, (uint64_t)qword_2550FB198, a1);
}

uint64_t ExecuteTasksResponseProtobuf.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_21A85007C();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
      sub_21A8500AC();
  }
  return result;
}

uint64_t ExecuteTasksResponseProtobuf.traverse<A>(visitor:)()
{
  _DWORD *v0;
  uint64_t v1;
  uint64_t result;

  if (!*v0 || (result = sub_21A850160(), !v1))
  {
    type metadata accessor for ExecuteTasksResponseProtobuf(0);
    return sub_21A850028();
  }
  return result;
}

uint64_t ExecuteTasksResponseProtobuf.hashValue.getter()
{
  return sub_21A834794(type metadata accessor for ExecuteTasksResponseProtobuf, &qword_2550FB1B8, (uint64_t)&protocol conformance descriptor for ExecuteTasksResponseProtobuf);
}

uint64_t sub_21A84F580@<X0>(_DWORD *a1@<X8>)
{
  *a1 = 0;
  return _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0();
}

unint64_t sub_21A84F5A0()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_21A84F5BC()
{
  return ExecuteTasksResponseProtobuf.decodeMessage<A>(decoder:)();
}

uint64_t sub_21A84F5D0()
{
  return ExecuteTasksResponseProtobuf.traverse<A>(visitor:)();
}

uint64_t sub_21A84F5E4()
{
  sub_21A835654(&qword_2550FB310, type metadata accessor for ExecuteTasksResponseProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksResponseProtobuf);
  return sub_21A850058();
}

uint64_t sub_21A84F634@<X0>(uint64_t a1@<X8>)
{
  return sub_21A833B24(&qword_2550F9E38, (uint64_t)qword_2550FB198, a1);
}

uint64_t sub_21A84F650()
{
  sub_21A835654(&qword_2550FB1E0, type metadata accessor for ExecuteTasksResponseProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksResponseProtobuf);
  return sub_21A85010C();
}

uint64_t sub_21A84F690()
{
  sub_21A835654(&qword_2550FB1E0, type metadata accessor for ExecuteTasksResponseProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksResponseProtobuf);
  return sub_21A850118();
}

uint64_t _s21SeymourServerProtocol28ExecuteTasksResponseProtobufV2eeoiySbAC_ACtFZ_0(_DWORD *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_21A850040();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if (*a1 == *(_DWORD *)a2)
  {
    v11 = type metadata accessor for ExecuteTasksResponseProtobuf(0);
    v12 = (char *)a1 + *(int *)(v11 + 20);
    v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, &a2[*(int *)(v11 + 20)], v4);
    sub_21A835654(&qword_2550FA148, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_21A8501FC();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_21A84F818()
{
  return sub_21A835654(&qword_2550FB1C0, type metadata accessor for ExecuteTasksRequestProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksRequestProtobuf);
}

uint64_t sub_21A84F844()
{
  return sub_21A835654(&qword_2550FB1C8, type metadata accessor for ExecuteTasksRequestProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksRequestProtobuf);
}

uint64_t sub_21A84F870()
{
  return sub_21A835654(&qword_2550FB1B0, type metadata accessor for ExecuteTasksRequestProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksRequestProtobuf);
}

uint64_t sub_21A84F89C()
{
  return sub_21A835654(&qword_2550FB1D0, type metadata accessor for ExecuteTasksRequestProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksRequestProtobuf);
}

uint64_t sub_21A84F8C8()
{
  return sub_21A835654(&qword_2550FB1D8, type metadata accessor for ExecuteTasksResponseProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksResponseProtobuf);
}

uint64_t sub_21A84F8F4()
{
  return sub_21A835654(&qword_2550FB1E0, type metadata accessor for ExecuteTasksResponseProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksResponseProtobuf);
}

uint64_t sub_21A84F920()
{
  return sub_21A835654(&qword_2550FB1B8, type metadata accessor for ExecuteTasksResponseProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksResponseProtobuf);
}

uint64_t sub_21A84F94C()
{
  return sub_21A835654(&qword_2550FB1E8, type metadata accessor for ExecuteTasksResponseProtobuf, (uint64_t)&protocol conformance descriptor for ExecuteTasksResponseProtobuf);
}

uint64_t initializeBufferWithCopyOfBuffer for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A850040();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for ExecuteTasksRequestProtobuf(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ExecuteTasksRequestProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A850040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecuteTasksRequestProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A84FB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ExecuteTasksRequestProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A84FB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_21A84FB8C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExecuteTasksResponseProtobuf(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_21A850040();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for ExecuteTasksResponseProtobuf(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_DWORD *initializeWithCopy for ExecuteTasksResponseProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for ExecuteTasksResponseProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_DWORD *initializeWithTake for ExecuteTasksResponseProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithTake for ExecuteTasksResponseProtobuf(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_21A850040();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecuteTasksResponseProtobuf()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A84FE30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for ExecuteTasksResponseProtobuf()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A84FE7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = sub_21A850040();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_21A84FEC0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A850040();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21A84FF38()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21A84FF44()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21A84FF50()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21A84FF5C()
{
  return MEMORY[0x24BE892A8]();
}

uint64_t sub_21A84FF68()
{
  return MEMORY[0x24BE897B0]();
}

uint64_t sub_21A84FF74()
{
  return MEMORY[0x24BE8B678]();
}

uint64_t sub_21A84FF80()
{
  return MEMORY[0x24BE8BC08]();
}

uint64_t sub_21A84FF8C()
{
  return MEMORY[0x24BE8BC10]();
}

uint64_t sub_21A84FF98()
{
  return MEMORY[0x24BE8CF40]();
}

uint64_t sub_21A84FFA4()
{
  return MEMORY[0x24BE8CF48]();
}

uint64_t sub_21A84FFB0()
{
  return MEMORY[0x24BE8CF50]();
}

uint64_t sub_21A84FFBC()
{
  return MEMORY[0x24BE8CF58]();
}

uint64_t sub_21A84FFC8()
{
  return MEMORY[0x24BE8CF60]();
}

uint64_t sub_21A84FFD4()
{
  return MEMORY[0x24BE8CF68]();
}

uint64_t sub_21A84FFE0()
{
  return MEMORY[0x24BE8DAB0]();
}

uint64_t sub_21A84FFEC()
{
  return MEMORY[0x24BE8DAB8]();
}

uint64_t sub_21A84FFF8()
{
  return MEMORY[0x24BE8DAD8]();
}

uint64_t sub_21A850004()
{
  return MEMORY[0x24BE17930]();
}

uint64_t sub_21A850010()
{
  return MEMORY[0x24BE5BEC0]();
}

uint64_t sub_21A85001C()
{
  return MEMORY[0x24BE5BED8]();
}

uint64_t sub_21A850028()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t _s21SeymourServerProtocol27ExecuteTasksRequestProtobufVACycfC_0()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_21A850040()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_21A85004C()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_21A850058()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_21A850064()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_21A850070()
{
  return MEMORY[0x24BE5C030]();
}

uint64_t sub_21A85007C()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_21A850088()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_21A850094()
{
  return MEMORY[0x24BE5C0A8]();
}

uint64_t sub_21A8500A0()
{
  return MEMORY[0x24BE5C0B8]();
}

uint64_t sub_21A8500AC()
{
  return MEMORY[0x24BE5C0C8]();
}

uint64_t sub_21A8500B8()
{
  return MEMORY[0x24BE5C0D8]();
}

uint64_t sub_21A8500C4()
{
  return MEMORY[0x24BE5C0E8]();
}

uint64_t sub_21A8500D0()
{
  return MEMORY[0x24BE5C108]();
}

uint64_t sub_21A8500DC()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t sub_21A8500E8()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_21A8500F4()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_21A850100()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_21A85010C()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_21A850118()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_21A850124()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_21A850130()
{
  return MEMORY[0x24BE5C218]();
}

uint64_t sub_21A85013C()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_21A850148()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t sub_21A850154()
{
  return MEMORY[0x24BE5C2A0]();
}

uint64_t sub_21A850160()
{
  return MEMORY[0x24BE5C2A8]();
}

uint64_t sub_21A85016C()
{
  return MEMORY[0x24BE5C2B0]();
}

uint64_t sub_21A850178()
{
  return MEMORY[0x24BE5C2C0]();
}

uint64_t sub_21A850184()
{
  return MEMORY[0x24BE5C2D8]();
}

uint64_t sub_21A850190()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_21A85019C()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_21A8501A8()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_21A8501B4()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_21A8501C0()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_21A8501CC()
{
  return MEMORY[0x24BE5C348]();
}

uint64_t sub_21A8501D8()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_21A8501E4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21A8501F0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21A8501FC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21A850208()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21A850214()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21A850220()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21A85022C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21A850238()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21A850244()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21A850250()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21A85025C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21A850268()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21A850274()
{
  return MEMORY[0x24BE8DCD0]();
}

uint64_t sub_21A850280()
{
  return MEMORY[0x24BE8DCF8]();
}

uint64_t sub_21A85028C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21A850298()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21A8502A4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21A8502B0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21A8502BC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21A8502C8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21A8502D4()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}


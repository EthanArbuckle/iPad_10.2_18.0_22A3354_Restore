int main(int argc, const char **argv, const char **envp)
{
  if (qword_100050F58 != -1)
    swift_once(&qword_100050F58, sub_10001E35C);
  sub_10001D2FC();
}

uint64_t sub_100001AB0(uint64_t a1, uint64_t a2)
{
  return sub_100001B78(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100001ABC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100001AFC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100001B6C(uint64_t a1, uint64_t a2)
{
  return sub_100001B78(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100001B78(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100001BB4(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100001C28(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100001CA4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

id sub_100001CE4()
{
  id *v0;

  return *v0;
}

uint64_t sub_100001CEC@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100001CF4(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100001D7C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(BGSystemTaskSchedulerErrorDomain);
}

uint64_t sub_100001D8C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000228C(&qword_100050FB8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038860);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100001DCC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000228C(&qword_100050FB8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038860);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100001E0C(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000228C(&qword_100050FB8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038860);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100001E70()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100001EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000228C(&qword_100050FB8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038860);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100001EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD v7[10];

  v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

_QWORD *sub_100001F50@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100001F60(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100001F6C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100001FB0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_100002050(a1, &qword_100050F70, (uint64_t)&unk_10004D908);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_100002050(a1, &qword_100050F78, (uint64_t)&unk_10004D930);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_100002050(a1, &qword_100050F80, (uint64_t)&unk_10004D958);
}

void type metadata accessor for BGSystemTaskSchedulerError(uint64_t a1)
{
  sub_100002050(a1, &qword_100050F88, (uint64_t)&unk_10004D978);
}

void type metadata accessor for APSIncomingMessagePriority(uint64_t a1)
{
  sub_100002050(a1, &qword_100050F90, (uint64_t)&unk_10004D9A0);
}

void type metadata accessor for APSIncomingMessagePushType(uint64_t a1)
{
  sub_100002050(a1, &qword_100050F98, (uint64_t)&unk_10004D9C0);
}

void sub_100002050(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100002094(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10000228C(&qword_100051008, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10003881C);
  v3 = sub_10000228C((unint64_t *)&unk_100051010, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100038770);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100002118(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000228C(&qword_100050FD8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038624);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100002158(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000228C(&qword_100050FD8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038624);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_10000219C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000228C(&qword_100050FB8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038860);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_1000021DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_10000228C(&qword_100050FB8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038860);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100002234()
{
  return sub_10000228C(&qword_100050FA0, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_10003854C);
}

uint64_t sub_100002260()
{
  return sub_10000228C(&qword_100050FA8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038574);
}

uint64_t sub_10000228C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

BOOL sub_1000022CC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000022E0()
{
  return sub_10000228C(&qword_100050FB0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_100038664);
}

uint64_t sub_10000230C()
{
  return sub_10000228C(&qword_100050FB8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038860);
}

uint64_t sub_100002338()
{
  return sub_10000228C(&qword_100050FC0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100038734);
}

uint64_t sub_100002364()
{
  return sub_10000228C(&qword_100050FC8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_100038708);
}

uint64_t sub_100002390()
{
  return sub_10000228C(&qword_100050FD0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1000387A4);
}

uint64_t sub_1000023BC()
{
  return sub_10000228C(&qword_100050FD8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038624);
}

uint64_t sub_1000023E8()
{
  return sub_10000228C(&qword_100050FE0, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_1000385F4);
}

uint64_t sub_100002414()
{
  return sub_10000228C(&qword_100050FE8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_1000385B4);
}

uint64_t sub_100002440()
{
  return sub_10000228C(&qword_100050FF0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10003868C);
}

uint64_t sub_10000246C()
{
  return sub_10000228C(&qword_100050FF8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1000386C4);
}

unint64_t sub_10000249C()
{
  unint64_t result;

  result = qword_100051000;
  if (!qword_100051000)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100051000);
  }
  return result;
}

BOOL sub_1000024E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000024F4()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002538()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100002560(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000025A0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000025D0 + 4 * byte_1000388D0[*v0]))(0x6E6F6973726576, 0xE700000000000000);
}

uint64_t sub_1000025D0()
{
  return 0x6E6F697461657263;
}

uint64_t sub_1000025F0()
{
  return 0x696665446B736174;
}

unint64_t sub_100002614()
{
  return 0xD000000000000010;
}

uint64_t sub_100002630()
{
  return 0x617261506B736174;
}

uint64_t sub_100002654@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000989C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100002678()
{
  return 0;
}

void sub_100002684(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100002690(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100008178();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000026B8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100008178();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000026E0(_QWORD *a1)
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
  int *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;

  v3 = v1;
  v5 = sub_100007800(&qword_100051260);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000A980(a1, v9);
  v11 = sub_100008178();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for MLHostPushMessage.CodingKeys, &type metadata for MLHostPushMessage.CodingKeys, v11, v9, v10);
  v12 = *v3;
  v32 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, &v32, v5);
  if (!v2)
  {
    v13 = (int *)type metadata accessor for MLHostPushMessage(0);
    v14 = (char *)v3 + v13[5];
    v31 = 1;
    v15 = type metadata accessor for Date(0);
    v16 = sub_10000228C(&qword_100051268, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v14, &v31, v5, v15, v16);
    v17 = (char *)v3 + v13[6];
    v30 = 2;
    v18 = type metadata accessor for TaskDefinition(0);
    v19 = sub_10000228C(&qword_100051270, (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition, (uint64_t)&protocol conformance descriptor for TaskDefinition);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v17, &v30, v5, v18, v19);
    v20 = (char *)v3 + v13[7];
    v29 = 3;
    v21 = type metadata accessor for MLHostSystemParameters(0);
    v22 = sub_10000228C(&qword_100051278, (uint64_t (*)(uint64_t))&type metadata accessor for MLHostSystemParameters, (uint64_t)&protocol conformance descriptor for MLHostSystemParameters);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v20, &v29, v5, v21, v22);
    v23 = (uint64_t *)((char *)v3 + v13[8]);
    v24 = *v23;
    v25 = v23[1];
    v28 = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v24, v25, &v28, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100002928@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  _QWORD *v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;

  v43 = a2;
  v3 = sub_100007800(&qword_100051180);
  __chkstk_darwin(v3);
  v44 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskDefinition(0);
  v6 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  v46 = v6;
  __chkstk_darwin(v5);
  v48 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = type metadata accessor for Date(0);
  v49 = *(_QWORD *)(v47 - 8);
  __chkstk_darwin(v47);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_100007800(&qword_100051238);
  v10 = *(_QWORD *)(v50 - 8);
  __chkstk_darwin(v50);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for MLHostPushMessage(0);
  __chkstk_darwin(v13);
  v15 = (uint64_t *)((char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = a1[3];
  v17 = a1[4];
  sub_10000A980(a1, v16);
  v18 = sub_100008178();
  v51 = v12;
  v19 = v52;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for MLHostPushMessage.CodingKeys, &type metadata for MLHostPushMessage.CodingKeys, v18, v16, v17);
  if (v19)
    return sub_10000A9A4(a1);
  v41 = v15;
  v42 = v10;
  v21 = v48;
  v20 = v49;
  v52 = a1;
  v57 = 0;
  v22 = v50;
  v23 = KeyedDecodingContainer.decode(_:forKey:)(&v57, v50);
  v24 = v41;
  *v41 = v23;
  v56 = 1;
  v25 = sub_10000228C(&qword_100051248, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v26 = v22;
  v27 = v47;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v47, &v56, v26, v47, v25);
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))((char *)v24 + v13[5], v9, v27);
  v55 = 2;
  v28 = sub_10000228C(&qword_100051250, (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition, (uint64_t)&protocol conformance descriptor for TaskDefinition);
  v29 = v21;
  v30 = (uint64_t)v24;
  v31 = v45;
  v32 = v50;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v45, &v55, v50, v45, v28);
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 32))(v30 + v13[6], v29, v31);
  v33 = type metadata accessor for MLHostSystemParameters(0);
  v54 = 3;
  v34 = sub_10000228C(&qword_100051258, (uint64_t (*)(uint64_t))&type metadata accessor for MLHostSystemParameters, (uint64_t)&protocol conformance descriptor for MLHostSystemParameters);
  v35 = (uint64_t)v44;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v33, &v54, v32, v33, v34);
  sub_1000081BC(v35, v30 + v13[7]);
  v53 = 4;
  v36 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v53, v32);
  v38 = v37;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v51, v32);
  v39 = (uint64_t *)(v30 + v13[8]);
  *v39 = v36;
  v39[1] = v38;
  sub_10000B5A4(v30, v43, type metadata accessor for MLHostPushMessage);
  sub_10000A9A4(v52);
  return sub_10000B5E8(v30, type metadata accessor for MLHostPushMessage);
}

uint64_t sub_100002DE4(_QWORD *a1)
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  char v20;

  v3 = v1;
  v5 = sub_100007800(&qword_100051398);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000A980(a1, v9);
  v11 = sub_10000B560();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for MLHostPushParameters.CodingKeys, &type metadata for MLHostPushParameters.CodingKeys, v11, v9, v10);
  v20 = 0;
  v12 = type metadata accessor for MLHostSystemParameters(0);
  v13 = sub_10000228C(&qword_100051278, (uint64_t (*)(uint64_t))&type metadata accessor for MLHostSystemParameters, (uint64_t)&protocol conformance descriptor for MLHostSystemParameters);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v3, &v20, v5, v12, v13);
  if (!v2)
  {
    v14 = (uint64_t *)(v3 + *(int *)(type metadata accessor for MLHostPushParameters(0) + 20));
    v15 = *v14;
    v16 = v14[1];
    v19 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v15, v16, &v19, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100002F38@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char v31;
  char v32;

  v28 = a2;
  v4 = sub_100007800(&qword_100051180);
  __chkstk_darwin(v4);
  v29 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_100007800(&qword_1000513A8);
  v6 = *(_QWORD *)(v30 - 8);
  __chkstk_darwin(v30);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MLHostPushParameters(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_10000A980(a1, v12);
  v14 = sub_10000B560();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for MLHostPushParameters.CodingKeys, &type metadata for MLHostPushParameters.CodingKeys, v14, v12, v13);
  if (v2)
    return sub_10000A9A4(a1);
  v27 = v9;
  v15 = v6;
  v16 = (uint64_t)v11;
  v17 = v28;
  v18 = type metadata accessor for MLHostSystemParameters(0);
  v32 = 0;
  v19 = sub_10000228C(&qword_100051258, (uint64_t (*)(uint64_t))&type metadata accessor for MLHostSystemParameters, (uint64_t)&protocol conformance descriptor for MLHostSystemParameters);
  v21 = (uint64_t)v29;
  v20 = v30;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v18, &v32, v30, v18, v19);
  sub_1000081BC(v21, v16);
  v31 = 1;
  v22 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v31, v20);
  v24 = v23;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v20);
  v25 = (uint64_t *)(v16 + *(int *)(v27 + 20));
  *v25 = v22;
  v25[1] = v24;
  sub_10000B5A4(v16, v17, type metadata accessor for MLHostPushParameters);
  sub_10000A9A4(a1);
  return sub_10000B5E8(v16, type metadata accessor for MLHostPushParameters);
}

uint64_t sub_1000031B4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100002928(a1, a2);
}

uint64_t sub_1000031C8(_QWORD *a1)
{
  return sub_1000026E0(a1);
}

BOOL sub_1000031DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1000031F4()
{
  _BYTE *v0;

  if (*v0)
    return 0x617261506B736174;
  else
    return 0xD000000000000010;
}

uint64_t sub_100003240@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100009B10(a1, a2);
  *a3 = result;
  return result;
}

void sub_100003264(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100003270(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B560();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003298(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B560();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000032C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100002F38(a1, a2);
}

uint64_t sub_1000032D4(_QWORD *a1)
{
  return sub_100002DE4(a1);
}

uint64_t sub_1000032E8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  __n128 v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t isUniquelyReferenced_nonNull_native;
  _QWORD *v55;
  char v56;
  unint64_t v57;
  uint64_t v58;
  _BOOL8 v59;
  uint64_t v60;
  char v61;
  unint64_t v62;
  char v63;
  _QWORD *v64;
  uint64_t *v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  void *v72;
  uint64_t v73;
  id v74;
  NSString v75;
  id v76;
  id v77;
  NSString v78;
  id v79;
  void (*v80)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v81;
  id v82;
  id v83;
  void (**v84)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v85)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  id v87[2];
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  int64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94[3];
  _QWORD *v95;

  v5 = v4;
  v93 = a1;
  v92 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v9 = *(_QWORD *)(v92 - 8);
  __chkstk_darwin(v92);
  v11 = (char *)v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v12);
  v14 = (char *)v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v15);
  v17 = (char *)v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_10001DA18((uint64_t)_swiftEmptyArrayStorage);
  v89 = v5;
  v5[3] = v18;
  v19 = (uint64_t)(v5 + 3);
  *(_QWORD *)(v19 + 48) = sub_10001DB38((uint64_t)_swiftEmptyArrayStorage);
  v87[1] = a2;
  v88 = a3;
  if (a3)
  {
    v20 = (uint64_t)a2;
  }
  else
  {
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(APSEnvironmentProduction);
    a3 = v21;
  }
  v22 = v89;
  v89[5] = v20;
  v22[6] = a3;
  if (a4)
  {
    swift_bridgeObjectRetain(v88);
    v23 = (uint64_t)a4;
  }
  else
  {
    v91 = sub_10000AB78(0, &qword_1000512C8, OS_dispatch_queue_ptr);
    v24 = swift_bridgeObjectRetain(v88);
    static DispatchQoS.unspecified.getter(v24);
    v94[0] = (uint64_t)_swiftEmptyArrayStorage;
    v25 = sub_10000228C(&qword_1000512D0, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
    v26 = sub_100007800(&qword_1000512D8);
    v27 = sub_10000ABB0();
    dispatch thunk of SetAlgebra.init<A>(_:)(v94, v26, v27, v12, v25);
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v92);
    v23 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000001BLL, 0x8000000100042040, v17, v14, v11, 0);
  }
  v89[4] = v23;
  v28 = *(_QWORD *)(v93 + 64);
  v90 = v93 + 64;
  v29 = 1 << *(_BYTE *)(v93 + 32);
  v30 = -1;
  if (v29 < 64)
    v30 = ~(-1 << v29);
  v31 = v30 & v28;
  v91 = (unint64_t)(v29 + 63) >> 6;
  v87[0] = a4;
  v32 = 0;
  v92 = v19;
  while (1)
  {
    if (v31)
    {
      v36 = __clz(__rbit64(v31));
      v31 &= v31 - 1;
      v37 = v36 | (v32 << 6);
      goto LABEL_28;
    }
    v38 = v32 + 1;
    if (__OFADD__(v32, 1))
      goto LABEL_51;
    if (v38 >= v91)
      break;
    v39 = *(_QWORD *)(v90 + 8 * v38);
    ++v32;
    if (!v39)
    {
      v32 = v38 + 1;
      if (v38 + 1 >= v91)
        break;
      v39 = *(_QWORD *)(v90 + 8 * v32);
      if (!v39)
      {
        v32 = v38 + 2;
        if (v38 + 2 >= v91)
          break;
        v39 = *(_QWORD *)(v90 + 8 * v32);
        if (!v39)
        {
          v40 = v38 + 3;
          if (v40 >= v91)
            break;
          v39 = *(_QWORD *)(v90 + 8 * v40);
          if (!v39)
          {
            while (1)
            {
              v32 = v40 + 1;
              if (__OFADD__(v40, 1))
                goto LABEL_52;
              if (v32 >= v91)
                goto LABEL_44;
              v39 = *(_QWORD *)(v90 + 8 * v32);
              ++v40;
              if (v39)
                goto LABEL_27;
            }
          }
          v32 = v40;
        }
      }
    }
LABEL_27:
    v31 = (v39 - 1) & v39;
    v37 = __clz(__rbit64(v39)) + (v32 << 6);
LABEL_28:
    v41 = (uint64_t *)(*(_QWORD *)(v93 + 48) + 16 * v37);
    v42 = *v41;
    v43 = v41[1];
    v44 = *(_QWORD *)(*(_QWORD *)(v93 + 56) + 8 * v37);
    v45 = *(_QWORD *)(v44 + 16);
    swift_bridgeObjectRetain(v43);
    swift_bridgeObjectRetain(v44);
    v46 = Set.init(minimumCapacity:)(v45, &type metadata for String, &protocol witness table for String);
    v95 = (_QWORD *)v46;
    v47 = *(_QWORD *)(v44 + 16);
    if (v47)
    {
      v48 = v32;
      v49 = (uint64_t *)(v44 + 40);
      do
      {
        v50 = *(v49 - 1);
        v51 = *v49;
        swift_bridgeObjectRetain(*v49);
        sub_10002A6D0(v94, v50, v51);
        swift_bridgeObjectRelease(v94[1]);
        v49 += 2;
        --v47;
      }
      while (v47);
      swift_bridgeObjectRelease(v44);
      v52 = (uint64_t)v95;
      v32 = v48;
    }
    else
    {
      v52 = v46;
      swift_bridgeObjectRelease(v44);
    }
    v53 = (_QWORD *)v92;
    swift_beginAccess(v92, v94, 33, 0);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v53);
    v95 = (_QWORD *)*v53;
    v55 = v95;
    *v53 = 0x8000000000000000;
    v57 = sub_1000088BC(v42, v43);
    v58 = v55[2];
    v59 = (v56 & 1) == 0;
    v60 = v58 + v59;
    if (__OFADD__(v58, v59))
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    v61 = v56;
    if (v55[3] >= v60)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v64 = v95;
        if ((v56 & 1) != 0)
          goto LABEL_10;
      }
      else
      {
        sub_100019B58();
        v64 = v95;
        if ((v61 & 1) != 0)
          goto LABEL_10;
      }
    }
    else
    {
      sub_10002A87C(v60, isUniquelyReferenced_nonNull_native);
      v62 = sub_1000088BC(v42, v43);
      if ((v61 & 1) != (v63 & 1))
        goto LABEL_54;
      v57 = v62;
      v64 = v95;
      if ((v61 & 1) != 0)
      {
LABEL_10:
        v33 = v64[7];
        v34 = 8 * v57;
        swift_bridgeObjectRelease(*(_QWORD *)(v33 + v34));
        *(_QWORD *)(v33 + v34) = v52;
        goto LABEL_11;
      }
    }
    v64[(v57 >> 6) + 8] |= 1 << v57;
    v65 = (uint64_t *)(v64[6] + 16 * v57);
    *v65 = v42;
    v65[1] = v43;
    *(_QWORD *)(v64[7] + 8 * v57) = v52;
    v66 = v64[2];
    v67 = __OFADD__(v66, 1);
    v68 = v66 + 1;
    if (v67)
      goto LABEL_50;
    v64[2] = v68;
    swift_bridgeObjectRetain(v43);
LABEL_11:
    v35 = *v53;
    *v53 = v64;
    swift_bridgeObjectRelease(v43);
    swift_bridgeObjectRelease(v35);
    swift_endAccess(v94);
  }
LABEL_44:
  swift_release(v93);
  v69 = sub_100007800(&qword_1000512E8);
  v70 = swift_allocObject(v69, 20, 7);
  *(_DWORD *)(v70 + 16) = 0;
  v71 = v89;
  v89[2] = v70;
  v71[8] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MLHostAPSListener()), "init");
  v72 = (void *)v71[4];
  v73 = v88;
  if (v88)
  {
    v74 = v72;
    v75 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v73);
  }
  else
  {
    v76 = v72;
    v75 = 0;
  }
  v77 = objc_allocWithZone((Class)APSConnection);
  v78 = String._bridgeToObjectiveC()();
  v79 = objc_msgSend(v77, "initWithEnvironmentName:namedDelegatePort:queue:", v75, v78, v72);

  if (v79)
  {
    v80 = (void (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v89;
    v89[7] = v79;
    v81 = (void *)*((_QWORD *)v80 + 8);
    v82 = v79;
    v83 = v81;
    objc_msgSend(v82, "setDelegate:", v83);

    v84 = (void (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*((_QWORD *)v80 + 8) + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
    v85 = v84[1];
    *v84 = sub_10000ABFC;
    v84[1] = v80;
    swift_retain(v80);
    swift_release(v85);
    return (uint64_t)v80;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void sub_100003998(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t *, uint64_t *, _QWORD *, _QWORD *, uint64_t *);
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  unint64_t v44;
  uint64_t v45[3];

  v10 = v9;
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v17 = type metadata accessor for Logger(0);
  sub_10000A8E8(v17, (uint64_t)qword_100052B80);
  swift_bridgeObjectRetain_n(a2, 2);
  v18 = swift_bridgeObjectRetain_n(a4, 2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.info.getter(v19);
  if (os_log_type_enabled(v19, v20))
  {
    v37 = a8;
    v21 = swift_slowAlloc(22, -1);
    v36 = a7;
    v22 = swift_slowAlloc(64, -1);
    v45[0] = v22;
    *(_DWORD *)v21 = 136315394;
    swift_bridgeObjectRetain(a2);
    v43 = sub_100008204(a1, a2, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    v43 = sub_100008204(a3, a4, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v21 + 14, v21 + 22);
    swift_bridgeObjectRelease_n(a4, 3);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Processing message: %s %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy(v22, 2, (char *)&type metadata for Any + 8);
    v23 = v22;
    a7 = v36;
    swift_slowDealloc(v23, -1, -1);
    v24 = v21;
    a8 = v37;
    swift_slowDealloc(v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a4, 2);
    swift_bridgeObjectRelease_n(a2, 2);
  }
  swift_beginAccess(v10 + 72, v45, 32, 0);
  v25 = *(_QWORD *)(v10 + 72);
  if (*(_QWORD *)(v25 + 16))
  {
    swift_bridgeObjectRetain(a2);
    v26 = sub_1000088BC(a1, a2);
    if ((v27 & 1) != 0)
    {
      v28 = *(_QWORD *)(v25 + 56) + 16 * v26;
      v30 = *(void (**)(uint64_t *, uint64_t *, _QWORD *, _QWORD *, uint64_t *))v28;
      v29 = *(_QWORD *)(v28 + 8);
      swift_endAccess(v45);
      swift_retain(v29);
      swift_bridgeObjectRelease(a2);
      v45[0] = a1;
      v45[1] = a2;
      v43 = a3;
      v44 = a4;
      v42[0] = a5;
      v42[1] = a6;
      v41[0] = a7;
      v41[1] = a8;
      v40 = a9;
      v30(v45, &v43, v42, v41, &v40);
      swift_release(v29);
      return;
    }
    swift_bridgeObjectRelease(a2);
  }
  swift_endAccess(v45);
  v31 = swift_bridgeObjectRetain_n(a2, 2);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.info.getter(v32);
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(12, -1);
    v35 = swift_slowAlloc(32, -1);
    v45[0] = v35;
    *(_DWORD *)v34 = 136315138;
    swift_bridgeObjectRetain(a2);
    v43 = sub_100008204(a1, a2, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v34 + 4, v34 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "No handler registered for topic: %s", v34, 0xCu);
    swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v34, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
}

void sub_100003DB0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int64_t v36;
  int64_t v37;
  unint64_t v38;
  int64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  Swift::Int v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  id v57;
  id v58;
  NSString v59;
  id v60;
  NSString v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  id v69;
  __n128 v70;
  uint64_t v71;
  Class isa;
  os_unfair_lock_s *lock;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  int64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88[9];
  char v89[32];

  lock = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 16) + 16);
  os_unfair_lock_lock(lock);
  if (qword_100050F28 == -1)
    goto LABEL_2;
LABEL_74:
  swift_once(&qword_100050F28, sub_10001E040);
LABEL_2:
  v1 = type metadata accessor for Logger(0);
  v81 = sub_10000A8E8(v1, (uint64_t)qword_100052B80);
  v2 = Logger.logObject.getter(v81);
  v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Subscribing to all topics and channels", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  swift_beginAccess(v82 + 24, v89, 0, 0);
  v5 = *(_QWORD *)(v82 + 24);
  v74 = v5 + 64;
  v6 = 1 << *(_BYTE *)(v5 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v5 + 64);
  v75 = (unint64_t)(v6 + 63) >> 6;
  v76 = *(_QWORD *)(v82 + 24);
  swift_bridgeObjectRetain(v5);
  v9 = 0;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v11 = (v8 - 1) & v8;
      v77 = v9;
      v12 = v10 | (v9 << 6);
      goto LABEL_25;
    }
    v13 = v9 + 1;
    if (__OFADD__(v9, 1))
      goto LABEL_72;
    if (v13 >= v75)
      break;
    v14 = *(_QWORD *)(v74 + 8 * v13);
    v15 = v9 + 1;
    if (!v14)
    {
      v15 = v9 + 2;
      if (v9 + 2 >= v75)
        break;
      v14 = *(_QWORD *)(v74 + 8 * v15);
      if (!v14)
      {
        v15 = v9 + 3;
        if (v9 + 3 >= v75)
          break;
        v14 = *(_QWORD *)(v74 + 8 * v15);
        if (!v14)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v75)
            break;
          v14 = *(_QWORD *)(v74 + 8 * v16);
          if (!v14)
          {
            while (1)
            {
              v15 = v16 + 1;
              if (__OFADD__(v16, 1))
                goto LABEL_73;
              if (v15 >= v75)
                goto LABEL_69;
              v14 = *(_QWORD *)(v74 + 8 * v15);
              ++v16;
              if (v14)
                goto LABEL_24;
            }
          }
          v15 = v9 + 4;
        }
      }
    }
LABEL_24:
    v11 = (v14 - 1) & v14;
    v77 = v15;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_25:
    v17 = (uint64_t *)(*(_QWORD *)(v76 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_QWORD *)(*(_QWORD *)(v76 + 56) + 8 * v12);
    swift_bridgeObjectRetain(v18);
    v84 = v20;
    swift_bridgeObjectRetain(v20);
    v21 = sub_10000466C(v82);
    swift_bridgeObjectRetain_n(v18, 2);
    v22 = swift_bridgeObjectRetain_n(v21, 2);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.debug.getter();
    v80 = v19;
    v78 = v11;
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc(22, -1);
      v26 = swift_slowAlloc(64, -1);
      v88[0] = v26;
      *(_DWORD *)v25 = 136315394;
      swift_bridgeObjectRetain(v18);
      v87 = sub_100008204(v19, v18, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(v18, 3);
      *(_WORD *)(v25 + 12) = 2080;
      swift_bridgeObjectRetain(v21);
      v28 = Set.description.getter(v27, &type metadata for String, &protocol witness table for String);
      v30 = v29;
      swift_bridgeObjectRelease(v21);
      v87 = sub_100008204(v28, v30, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v25 + 14, v25 + 22);
      swift_bridgeObjectRelease_n(v21, 2);
      swift_bridgeObjectRelease(v30);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Currently subscribed channels for topic %s: %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy(v26, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v21, 2);
      swift_bridgeObjectRelease_n(v18, 2);
    }
    v31 = 0;
    v32 = v84 + 56;
    v33 = 1 << *(_BYTE *)(v84 + 32);
    if (v33 < 64)
      v34 = ~(-1 << v33);
    else
      v34 = -1;
    v35 = v34 & *(_QWORD *)(v84 + 56);
    v36 = (unint64_t)(v33 + 63) >> 6;
    v83 = v21 + 56;
    v79 = v21;
    if (v35)
    {
      while (1)
      {
        v67 = __clz(__rbit64(v35));
        v40 = (v35 - 1) & v35;
        v41 = v67 | (v31 << 6);
LABEL_48:
        v86 = v40;
        v42 = (uint64_t *)(*(_QWORD *)(v84 + 48) + 16 * v41);
        v44 = *v42;
        v43 = v42[1];
        if (!*(_QWORD *)(v21 + 16))
          break;
        Hasher.init(_seed:)(v88, *(_QWORD *)(v21 + 40));
        swift_bridgeObjectRetain(v43);
        String.hash(into:)(v88, v44, v43);
        v45 = Hasher._finalize()();
        v46 = -1 << *(_BYTE *)(v21 + 32);
        v47 = v45 & ~v46;
        if (((*(_QWORD *)(v83 + ((v47 >> 3) & 0xFFFFFFFFFFFFF8)) >> v47) & 1) != 0)
        {
          v48 = *(_QWORD *)(v21 + 48);
          v49 = (_QWORD *)(v48 + 16 * v47);
          v50 = v49[1];
          v51 = *v49 == v44 && v50 == v43;
          if (!v51 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v49, v50, v44, v43, 0) & 1) == 0)
          {
            v52 = ~v46;
            do
            {
              v47 = (v47 + 1) & v52;
              if (((*(_QWORD *)(v83 + ((v47 >> 3) & 0xFFFFFFFFFFFFF8)) >> v47) & 1) == 0)
                goto LABEL_64;
              v53 = (_QWORD *)(v48 + 16 * v47);
              v54 = v53[1];
              v55 = *v53 == v44 && v54 == v43;
            }
            while (!v55 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v53, v54, v44, v43, 0) & 1) == 0);
          }
          swift_bridgeObjectRelease(v43);
          v35 = v86;
          if (!v86)
            goto LABEL_34;
        }
        else
        {
LABEL_64:
          v85 = v31;
          v56 = *(void **)(v82 + 56);
          v57 = objc_allocWithZone((Class)PKPublicChannel);
          swift_bridgeObjectRetain(v43);
          v58 = v56;
          v59 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v43);
          v60 = objc_msgSend(v57, "initWithChannelID:", v59);

          v61 = String._bridgeToObjectiveC()();
          objc_msgSend(v58, "subscribeToChannel:forTopic:", v60, v61);

          swift_bridgeObjectRetain_n(v18, 2);
          swift_bridgeObjectRetain(v43);
          v63 = Logger.logObject.getter(v62);
          v64 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v63, v64))
          {
            v65 = swift_slowAlloc(22, -1);
            v66 = swift_slowAlloc(64, -1);
            v88[0] = v66;
            *(_DWORD *)v65 = 136315394;
            swift_bridgeObjectRetain(v43);
            *(_QWORD *)(v65 + 4) = sub_100008204(v44, v43, v88);
            swift_bridgeObjectRelease_n(v43, 3);
            *(_WORD *)(v65 + 12) = 2080;
            swift_bridgeObjectRetain(v18);
            v21 = v79;
            *(_QWORD *)(v65 + 14) = sub_100008204(v80, v18, v88);
            swift_bridgeObjectRelease_n(v18, 3);
            _os_log_impl((void *)&_mh_execute_header, v63, v64, "Subscribed to channel: %s for topic: %s", (uint8_t *)v65, 0x16u);
            swift_arrayDestroy(v66, 2, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v66, -1, -1);
            swift_slowDealloc(v65, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n(v18, 2);
            swift_bridgeObjectRelease_n(v43, 2);
          }
          v31 = v85;
          v35 = v86;
          if (!v86)
            goto LABEL_34;
        }
      }
      swift_bridgeObjectRetain(v43);
      goto LABEL_64;
    }
LABEL_34:
    v37 = v31 + 1;
    if (__OFADD__(v31, 1))
    {
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }
    if (v37 < v36)
    {
      v38 = *(_QWORD *)(v32 + 8 * v37);
      ++v31;
      if (v38)
        goto LABEL_47;
      v31 = v37 + 1;
      if (v37 + 1 < v36)
      {
        v38 = *(_QWORD *)(v32 + 8 * v31);
        if (v38)
          goto LABEL_47;
        v31 = v37 + 2;
        if (v37 + 2 < v36)
        {
          v38 = *(_QWORD *)(v32 + 8 * v31);
          if (v38)
            goto LABEL_47;
          v39 = v37 + 3;
          if (v39 < v36)
          {
            v38 = *(_QWORD *)(v32 + 8 * v39);
            if (v38)
            {
              v31 = v39;
LABEL_47:
              v40 = (v38 - 1) & v38;
              v41 = __clz(__rbit64(v38)) + (v31 << 6);
              goto LABEL_48;
            }
            while (1)
            {
              v31 = v39 + 1;
              if (__OFADD__(v39, 1))
                goto LABEL_71;
              if (v31 >= v36)
                break;
              v38 = *(_QWORD *)(v32 + 8 * v31);
              ++v39;
              if (v38)
                goto LABEL_47;
            }
          }
        }
      }
    }
    swift_bridgeObjectRelease(v18);
    swift_release(v84);
    v9 = v77;
    v8 = v78;
    swift_bridgeObjectRelease(v21);
  }
LABEL_69:
  swift_release(v76);
  v68 = *(_QWORD *)(v82 + 24);
  v69 = *(id *)(v82 + 56);
  v70 = swift_bridgeObjectRetain(v68);
  v71 = sub_10002BF38(v70);
  swift_bridgeObjectRelease(v68);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v71);
  objc_msgSend(v69, "_setEnabledTopics:", isa);

  os_unfair_lock_unlock(lock);
}

uint64_t sub_10000466C(uint64_t a1)
{
  id v1;
  NSString v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v1 = *(id *)(a1 + 56);
  v2 = String._bridgeToObjectiveC()();
  v14 = 0;
  v3 = objc_msgSend(v1, "registeredChannelsForTopic:error:", v2, &v14);

  v4 = v14;
  if (v3)
  {
    v5 = sub_10000AB78(0, &qword_1000512B0, PKPublicChannel_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v5);
    v7 = v4;

    v8 = sub_1000047B0(v6);
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v9 = v14;
    v10 = _convertNSErrorToError(_:)(v4);

    swift_willThrow(v11);
    swift_errorRelease(v10);
    v8 = _swiftEmptyArrayStorage;
  }
  v12 = sub_10002C418((uint64_t)v8);
  swift_bridgeObjectRelease(v8);
  return v12;
}

_QWORD *sub_1000047B0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  if ((unint64_t)a1 >> 62)
    goto LABEL_17;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v2; v2 = _CocoaArrayWrapper.endIndex.getter(v16))
  {
    v3 = _swiftEmptyArrayStorage;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1)
         : *(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = objc_msgSend(v5, "channelID");
      if (v8)
      {
        v9 = v8;
        v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
        v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
          v3 = sub_1000193E4(0, v3[2] + 1, 1, v3);
        v14 = v3[2];
        v13 = v3[3];
        if (v14 >= v13 >> 1)
          v3 = sub_1000193E4((_QWORD *)(v13 > 1), v14 + 1, 1, v3);
        v3[2] = v14 + 1;
        v15 = &v3[2 * v14];
        v15[4] = v10;
        v15[5] = v12;
      }
      else
      {

      }
      ++v4;
      if (v7 == v2)
        goto LABEL_22;
    }
    __break(1u);
LABEL_17:
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
  v3 = _swiftEmptyArrayStorage;
LABEL_22:
  swift_bridgeObjectRelease(a1);
  return v3;
}

void sub_100004944(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  Swift::Int v36;
  Swift::Int v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  Class isa;
  NSString v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  id v62;
  void *v63;
  _QWORD *v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  _QWORD *v73;
  Class v74;
  void *v75;
  id v76;
  id v77;
  NSString v78;
  id v79;
  NSString v80;
  uint64_t v81;
  os_log_type_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  uint64_t v88;
  os_unfair_lock_s *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93[3];

  v3 = v2;
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + 16) + 16);
  os_unfair_lock_lock(v6);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v7 = type metadata accessor for Logger(0);
  sub_10000A8E8(v7, (uint64_t)qword_100052B80);
  v8 = swift_bridgeObjectRetain_n(a2, 2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v93[0] = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain(a2);
    v92 = sub_100008204(a1, a2, v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Subscribing to a random channel on topic: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  swift_beginAccess(v3 + 24, v93, 32, 0);
  v13 = *(_QWORD *)(v3 + 24);
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain(a2);
    v14 = sub_1000088BC(a1, a2);
    if ((v15 & 1) != 0)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
      swift_endAccess(v93);
      swift_bridgeObjectRetain(v16);
      swift_bridgeObjectRelease(a2);
      v17 = sub_100005644(v3, a1, a2);
      v18 = sub_1000047B0((uint64_t)v17);
      v19 = sub_10002C418((uint64_t)v18);
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRetain_n(a2, 2);
      v20 = swift_bridgeObjectRetain_n(v19, 2);
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.debug.getter();
      v89 = v6;
      if (os_log_type_enabled(v21, v22))
      {
        v88 = a1;
        v23 = swift_slowAlloc(22, -1);
        v86 = v17;
        v24 = swift_slowAlloc(64, -1);
        v93[0] = v24;
        *(_DWORD *)v23 = 136315394;
        v25 = swift_bridgeObjectRetain(v19);
        v26 = Set.description.getter(v25, &type metadata for String, &protocol witness table for String);
        v28 = v27;
        swift_bridgeObjectRelease(v19);
        v92 = sub_100008204(v26, v28, v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v23 + 4, v23 + 12);
        swift_bridgeObjectRelease_n(v19, 2);
        swift_bridgeObjectRelease(v28);
        *(_WORD *)(v23 + 12) = 2080;
        swift_bridgeObjectRetain(a2);
        v92 = sub_100008204(v88, a2, v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v23 + 14, v23 + 22);
        swift_bridgeObjectRelease_n(a2, 3);
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Currently subscribed to channels: %s, for topic %s", (uint8_t *)v23, 0x16u);
        swift_arrayDestroy(v24, 2, (char *)&type metadata for Any + 8);
        v29 = v24;
        v17 = v86;
        swift_slowDealloc(v29, -1, -1);
        v30 = v23;
        a1 = v88;
        swift_slowDealloc(v30, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a2, 2);
        swift_bridgeObjectRelease_n(v19, 2);
      }
      v36 = sub_100008D70(v16, v19);
      v37 = v36;
      if (*(_QWORD *)(v36 + 16) == 1)
      {
        swift_bridgeObjectRelease(v17);
        swift_bridgeObjectRelease(v16);
        swift_bridgeObjectRetain_n(a2, 2);
        v38 = swift_retain(v37);
        v39 = Logger.logObject.getter(v38);
        v40 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v39, v40))
        {
          v41 = swift_slowAlloc(22, -1);
          v42 = swift_slowAlloc(64, -1);
          v93[0] = v42;
          *(_DWORD *)v41 = 136315394;
          v43 = swift_retain(v37);
          v44 = Set.description.getter(v43, &type metadata for String, &protocol witness table for String);
          v46 = v45;
          swift_release(v37);
          v92 = sub_100008204(v44, v46, v93);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v41 + 4, v41 + 12);
          swift_release_n(v37, 2);
          swift_bridgeObjectRelease(v46);
          *(_WORD *)(v41 + 12) = 2080;
          swift_bridgeObjectRetain(a2);
          v92 = sub_100008204(a1, a2, v93);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v41 + 14, v41 + 22);
          swift_bridgeObjectRelease_n(a2, 3);
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "There already exists one valid channel subscription %s for topic: %s. Skipping new subscription.", (uint8_t *)v41, 0x16u);
          swift_arrayDestroy(v42, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v42, -1, -1);
          v47 = v41;
LABEL_30:
          swift_slowDealloc(v47, -1, -1);

          goto LABEL_34;
        }

        swift_bridgeObjectRelease_n(a2, 2);
        swift_release_n(v37, 2);
LABEL_34:
        v6 = v89;
        goto LABEL_35;
      }
      swift_release(v36);
      v48 = swift_bridgeObjectRetain_n(a2, 2);
      v49 = Logger.logObject.getter(v48);
      v50 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc(12, -1);
        v87 = v17;
        v52 = v16;
        v53 = swift_slowAlloc(32, -1);
        v93[0] = v53;
        *(_DWORD *)v51 = 136315138;
        swift_bridgeObjectRetain(a2);
        v92 = sub_100008204(a1, a2, v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v51 + 4, v51 + 12);
        swift_bridgeObjectRelease_n(a2, 3);
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Unsubscribing from all current channels for topic %s and subscribing to a new random channel.", v51, 0xCu);
        swift_arrayDestroy(v53, 1, (char *)&type metadata for Any + 8);
        v54 = v53;
        v16 = v52;
        v17 = v87;
        swift_slowDealloc(v54, -1, -1);
        swift_slowDealloc(v51, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a2, 2);
      }
      v55 = *(void **)(v3 + 56);
      sub_10000AB78(0, &qword_1000512B0, PKPublicChannel_ptr);
      v56 = v55;
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v17);
      v58 = String._bridgeToObjectiveC()();
      objc_msgSend(v56, "unsubscribeFromChannels:forTopic:", isa, v58);

      v59 = sub_100005980(v16);
      v61 = v60;
      swift_bridgeObjectRelease(v16);
      if (v61)
      {
        v62 = objc_msgSend(*(id *)(v3 + 56), "opportunisticTopics");
        if (v62)
        {
          v63 = v62;
          v64 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v62, &type metadata for String);

        }
        else
        {
          v64 = _swiftEmptyArrayStorage;
        }
        v70 = sub_10002C418((uint64_t)v64);
        swift_bridgeObjectRelease(v64);
        v92 = v70;
        swift_bridgeObjectRetain(a2);
        sub_10002A6D0(v93, a1, a2);
        swift_bridgeObjectRelease(v93[1]);
        v71 = v92;
        v72 = *(id *)(v3 + 56);
        v73 = sub_10002BE54(v71);
        swift_bridgeObjectRelease(v71);
        v74 = Array._bridgeToObjectiveC()().super.isa;
        swift_release(v73);
        objc_msgSend(v72, "_setOpportunisticTopics:", v74);

        v75 = *(void **)(v3 + 56);
        v76 = objc_allocWithZone((Class)PKPublicChannel);
        v77 = v75;
        swift_bridgeObjectRetain(v61);
        v78 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v61);
        v79 = objc_msgSend(v76, "initWithChannelID:", v78);

        v80 = String._bridgeToObjectiveC()();
        objc_msgSend(v77, "subscribeToChannel:forTopic:", v79, v80);

        swift_bridgeObjectRetain_n(a2, 2);
        v81 = swift_bridgeObjectRetain(v61);
        v39 = Logger.logObject.getter(v81);
        v82 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v39, v82))
        {
          v83 = swift_slowAlloc(22, -1);
          v84 = swift_slowAlloc(64, -1);
          v93[0] = v84;
          *(_DWORD *)v83 = 136315394;
          swift_bridgeObjectRetain(v61);
          v90 = sub_100008204(v59, v61, v93);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91, v83 + 4, v83 + 12);
          swift_bridgeObjectRelease_n(v61, 3);
          *(_WORD *)(v83 + 12) = 2080;
          swift_bridgeObjectRetain(a2);
          v90 = sub_100008204(a1, a2, v93);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91, v83 + 14, v83 + 22);
          swift_bridgeObjectRelease_n(a2, 3);
          _os_log_impl((void *)&_mh_execute_header, v39, v82, "Subscribed to random channel: %s for topic: %s", (uint8_t *)v83, 0x16u);
          swift_arrayDestroy(v84, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v84, -1, -1);
          v47 = v83;
          goto LABEL_30;
        }

        swift_bridgeObjectRelease_n(a2, 2);
        v85 = v61;
      }
      else
      {
        v65 = swift_bridgeObjectRetain_n(a2, 2);
        v66 = Logger.logObject.getter(v65);
        v67 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v66, (os_log_type_t)v67))
        {
          v68 = (uint8_t *)swift_slowAlloc(12, -1);
          v69 = swift_slowAlloc(32, -1);
          v93[0] = v69;
          *(_DWORD *)v68 = 136315138;
          swift_bridgeObjectRetain(a2);
          v92 = sub_100008204(a1, a2, v93);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v68 + 4, v68 + 12);
          swift_bridgeObjectRelease_n(a2, 3);
          _os_log_impl((void *)&_mh_execute_header, v66, (os_log_type_t)v67, "No channel options are provided for topic %s. Failed to register new random channel for this topic.", v68, 0xCu);
          swift_arrayDestroy(v69, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v69, -1, -1);
          swift_slowDealloc(v68, -1, -1);

          goto LABEL_34;
        }

        v85 = a2;
      }
      swift_bridgeObjectRelease_n(v85, 2);
      goto LABEL_34;
    }
    swift_bridgeObjectRelease(a2);
  }
  swift_endAccess(v93);
  v31 = swift_bridgeObjectRetain_n(a2, 2);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(12, -1);
    v35 = swift_slowAlloc(32, -1);
    v93[0] = v35;
    *(_DWORD *)v34 = 136315138;
    swift_bridgeObjectRetain(a2);
    v92 = sub_100008204(a1, a2, v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v93, v34 + 4, v34 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "There is no channel for topic: %s", v34, 0xCu);
    swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v34, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
LABEL_35:
  os_unfair_lock_unlock(v6);
}

_QWORD *sub_100005644(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v5;
  NSString v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v5 = *(id *)(a1 + 56);
  v6 = String._bridgeToObjectiveC()();
  v26 = 0;
  v7 = objc_msgSend(v5, "registeredChannelsForTopic:error:", v6, &v26);

  v8 = v26;
  if (v7)
  {
    v9 = sub_10000AB78(0, &qword_1000512B0, PKPublicChannel_ptr);
    v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v9);
    v11 = v8;

  }
  else
  {
    v12 = v26;
    v13 = _convertNSErrorToError(_:)(v8);

    swift_willThrow();
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v14 = type metadata accessor for Logger(0);
    sub_10000A8E8(v14, (uint64_t)qword_100052B80);
    swift_bridgeObjectRetain(a3);
    swift_errorRetain(v13);
    swift_bridgeObjectRetain(a3);
    v15 = swift_errorRetain(v13);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc(22, -1);
      v19 = (uint64_t *)swift_slowAlloc(8, -1);
      v20 = (void *)swift_slowAlloc(32, -1);
      v26 = v20;
      *(_DWORD *)v18 = 136315394;
      swift_bridgeObjectRetain(a3);
      v24 = sub_100008204(a2, a3, (uint64_t *)&v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease_n(a3, 3);
      *(_WORD *)(v18 + 12) = 2112;
      swift_errorRetain(v13);
      v21 = _swift_stdlib_bridgeErrorToNSError(v13);
      v24 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v18 + 14, v18 + 22);
      *v19 = v21;
      swift_errorRelease(v13);
      swift_errorRelease(v13);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed at querying registered channes for topic: %s -- %@", (uint8_t *)v18, 0x16u);
      v22 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v19, 1, v22);
      swift_slowDealloc(v19, -1, -1);
      swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v18, -1, -1);

      swift_errorRelease(v13);
    }
    else
    {
      swift_errorRelease(v13);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_errorRelease(v13);
      swift_errorRelease(v13);

    }
    return _swiftEmptyArrayStorage;
  }
  return (_QWORD *)v10;
}

uint64_t sub_100005980(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v3 = sub_100008CE8(v2);
  result = sub_1000096C0(a1);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v7 = result;
    v8 = v5;
    v9 = v6;
    v10 = v6 & 1;
    if (v3)
    {
      sub_10000AB64(result, v5, v6 & 1);
      v11 = v7;
      v19 = v8;
      do
      {
        v12 = v8;
        v13 = v11;
        v14 = v10 & 1;
        v11 = sub_100009760(v11, v8, v10 & 1, a1);
        v8 = v15;
        v10 = v16 & 1;
        sub_10000AB58(v13, v12, v14);
        --v3;
      }
      while (v3);
      sub_10000AB58(v7, v19, v9 & 1);
    }
    else
    {
      v11 = result;
    }
    v17 = sub_100009844(v11, v8, v10, a1);
    swift_bridgeObjectRetain(v18);
    sub_10000AB58(v11, v8, v10);
    return v17;
  }
  __break(1u);
  return result;
}

void sub_100005AB4()
{
  uint64_t v0;
  id *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id *v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  id v25;
  NSString v26;
  id v27;
  id *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  NSString v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  Class isa;
  id v60;
  Class v61;
  id v62;
  Class v63;
  id v64;
  Class v65;
  os_unfair_lock_s *v66;
  id *v67;
  _QWORD *v68;
  id *v69;
  NSObject *log;
  unint64_t v71;
  os_log_type_t v72;
  _QWORD *v73;
  os_unfair_lock_s *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id *v79;

  v1 = (id *)v0;
  v2 = *(_QWORD *)(v0 + 16) + 16;
  os_unfair_lock_lock((os_unfair_lock_t)v2);
  if (qword_100050F28 != -1)
    goto LABEL_43;
  while (1)
  {
    v3 = type metadata accessor for Logger(0);
    v4 = sub_10000A8E8(v3, (uint64_t)qword_100052B80);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unsubscribing all topics and channels", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    v8 = sub_1000062AC((uint64_t)v1);
    v9 = swift_bridgeObjectRetain_n(v8, 2);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.info.getter();
    v67 = v1;
    v68 = v8;
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = (id *)swift_slowAlloc(32, -1);
      v79 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain(v68);
      v14 = Array.description.getter(v68, &type metadata for String);
      v16 = v15;
      swift_bridgeObjectRelease(v68);
      v77 = sub_100008204(v14, v16, (uint64_t *)&v79);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease_n(v68, 2);
      swift_bridgeObjectRelease(v16);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "unregistering channels from topics: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      v17 = v13;
      v8 = v68;
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v8, 2);
    }
    v74 = (os_unfair_lock_s *)v8[2];
    if (!v74)
      break;
    v66 = (os_unfair_lock_s *)v2;
    v2 = 0;
    v73 = v8 + 4;
    while (v2 < v8[2])
    {
      v21 = &v73[2 * v2];
      v22 = *v21;
      v23 = v21[1];
      v24 = v1[7];
      swift_bridgeObjectRetain(v23);
      v25 = v24;
      v76 = v22;
      v26 = String._bridgeToObjectiveC()();
      v79 = 0;
      v27 = objc_msgSend(v25, "registeredChannelsForTopic:error:", v26, &v79);

      v28 = v79;
      if (v27)
      {
        v29 = sub_10000AB78(0, &qword_1000512B0, PKPublicChannel_ptr);
        v75 = v27;
        v30 = v23;
        v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v27, v29);
        swift_bridgeObjectRetain_n(v30, 2);
        v32 = v28;
        swift_bridgeObjectRetain(v31);
        v34 = Logger.logObject.getter(v33);
        v72 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v34, v72))
        {
          v71 = v30;
          v35 = swift_slowAlloc(22, -1);
          v1 = (id *)swift_slowAlloc(64, -1);
          v79 = v1;
          *(_DWORD *)v35 = 136315394;
          if ((unint64_t)v31 >> 62)
          {
            v55 = v34;
            if (v31 < 0)
              v56 = v31;
            else
              v56 = v31 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(v31);
            v57 = v56;
            v34 = v55;
            v36 = _CocoaArrayWrapper.endIndex.getter(v57);
          }
          else
          {
            v36 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain(v31);
          }
          log = v34;
          v69 = v1;
          if (v36)
          {
            if (v36 < 1)
              goto LABEL_42;
            v37 = 0;
            v38 = _swiftEmptyArrayStorage;
            do
            {
              if ((v31 & 0xC000000000000001) != 0)
                v39 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v37, v31);
              else
                v39 = *(id *)(v31 + 8 * v37 + 32);
              v40 = v39;
              v41 = objc_msgSend(v40, "channelID");
              if (v41)
              {
                v42 = v41;
                v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
                v45 = v44;

                if ((swift_isUniquelyReferenced_nonNull_native(v38) & 1) == 0)
                  v38 = sub_1000193E4(0, v38[2] + 1, 1, v38);
                v47 = v38[2];
                v46 = v38[3];
                if (v47 >= v46 >> 1)
                  v38 = sub_1000193E4((_QWORD *)(v46 > 1), v47 + 1, 1, v38);
                v38[2] = v47 + 1;
                v48 = &v38[2 * v47];
                v48[4] = v43;
                v48[5] = v45;
              }
              else
              {

              }
              ++v37;
            }
            while (v36 != v37);
          }
          else
          {
            v38 = _swiftEmptyArrayStorage;
          }
          swift_bridgeObjectRelease(v31);
          v50 = Array.description.getter(v38, &type metadata for String);
          v52 = v51;
          swift_bridgeObjectRelease(v38);
          *(_QWORD *)(v35 + 4) = sub_100008204(v50, v52, (uint64_t *)&v79);
          swift_bridgeObjectRelease_n(v31, 2);
          swift_bridgeObjectRelease(v52);
          *(_WORD *)(v35 + 12) = 2080;
          v49 = v71;
          swift_bridgeObjectRetain(v71);
          *(_QWORD *)(v35 + 14) = sub_100008204(v76, v71, (uint64_t *)&v79);
          swift_bridgeObjectRelease_n(v71, 3);
          _os_log_impl((void *)&_mh_execute_header, log, v72, "Unsubscribed channels: %s for topic: %s", (uint8_t *)v35, 0x16u);
          swift_arrayDestroy(v69, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v69, -1, -1);
          swift_slowDealloc(v35, -1, -1);

          v1 = v67;
          v8 = v68;
        }
        else
        {

          swift_bridgeObjectRelease_n(v30, 2);
          swift_bridgeObjectRelease_n(v31, 2);
          v49 = v30;
        }
        v53 = v1[7];
        v54 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v49);
        objc_msgSend(v53, "unsubscribeFromChannels:forTopic:", v75, v54);

      }
      else
      {
        v18 = v79;
        swift_bridgeObjectRelease(v23);
        v19 = _convertNSErrorToError(_:)(v28);

        swift_willThrow(v20);
        swift_errorRelease(v19);
      }
      if ((os_unfair_lock_s *)++v2 == v74)
      {
        swift_bridgeObjectRelease(v8);
        v2 = (unint64_t)v66;
        goto LABEL_40;
      }
    }
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    swift_once(&qword_100050F28, sub_10001E040);
  }
  swift_bridgeObjectRelease(v8);
LABEL_40:
  v58 = v1[7];
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v58, "_setEnabledTopics:", isa);

  v60 = v1[7];
  v61 = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v60, "_setOpportunisticTopics:", v61);

  v62 = v1[7];
  v63 = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v62, "_setIgnoredTopics:", v63);

  v64 = v1[7];
  v65 = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v64, "_setNonWakingTopics:", v65);

  os_unfair_lock_unlock((os_unfair_lock_t)v2);
}

_QWORD *sub_1000062AC(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v36 = &_swiftEmptySetSingleton;
  v2 = objc_msgSend(*(id *)(a1 + 56), "enabledTopics");
  if (v2)
  {
    v3 = v2;
    v4 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String);

    v5 = v4[2];
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    v4 = _swiftEmptyArrayStorage;
    v5 = _swiftEmptyArrayStorage[2];
    if (!v5)
      goto LABEL_7;
  }
  v6 = v4 + 5;
  do
  {
    v7 = *(v6 - 1);
    v8 = *v6;
    swift_bridgeObjectRetain(*v6);
    sub_10002A6D0(&v34, v7, v8);
    swift_bridgeObjectRelease(v35);
    v6 += 2;
    --v5;
  }
  while (v5);
LABEL_7:
  swift_bridgeObjectRelease(v4);
  v9 = objc_msgSend(*(id *)(a1 + 56), "opportunisticTopics");
  if (v9)
  {
    v10 = v9;
    v11 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, &type metadata for String);

    v12 = v11[2];
    if (!v12)
      goto LABEL_13;
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
    v12 = _swiftEmptyArrayStorage[2];
    if (!v12)
      goto LABEL_13;
  }
  v13 = v11 + 5;
  do
  {
    v14 = *(v13 - 1);
    v15 = *v13;
    swift_bridgeObjectRetain(*v13);
    sub_10002A6D0(&v34, v14, v15);
    swift_bridgeObjectRelease(v35);
    v13 += 2;
    --v12;
  }
  while (v12);
LABEL_13:
  swift_bridgeObjectRelease(v11);
  v16 = objc_msgSend(*(id *)(a1 + 56), "ignoredTopics");
  if (v16)
  {
    v17 = v16;
    v18 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, &type metadata for String);

    v19 = v18[2];
    if (!v19)
      goto LABEL_19;
  }
  else
  {
    v18 = _swiftEmptyArrayStorage;
    v19 = _swiftEmptyArrayStorage[2];
    if (!v19)
      goto LABEL_19;
  }
  v20 = v18 + 5;
  do
  {
    v21 = *(v20 - 1);
    v22 = *v20;
    swift_bridgeObjectRetain(*v20);
    sub_10002A6D0(&v34, v21, v22);
    swift_bridgeObjectRelease(v35);
    v20 += 2;
    --v19;
  }
  while (v19);
LABEL_19:
  swift_bridgeObjectRelease(v18);
  v23 = objc_msgSend(*(id *)(a1 + 56), "nonWakingTopics");
  if (v23)
  {
    v24 = v23;
    v25 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, &type metadata for String);

    v26 = v25[2];
    if (!v26)
      goto LABEL_25;
  }
  else
  {
    v25 = _swiftEmptyArrayStorage;
    v26 = _swiftEmptyArrayStorage[2];
    if (!v26)
      goto LABEL_25;
  }
  v27 = v25 + 5;
  do
  {
    v28 = *(v27 - 1);
    v29 = *v27;
    swift_bridgeObjectRetain(*v27);
    sub_10002A6D0(&v34, v28, v29);
    swift_bridgeObjectRelease(v35);
    v27 += 2;
    --v26;
  }
  while (v26);
LABEL_25:
  swift_bridgeObjectRelease(v25);
  swift_beginAccess(a1 + 24, &v34, 0, 0);
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 24));
  sub_100006574(v30);
  v31 = v36;
  v32 = sub_10002BE54((uint64_t)v36);
  swift_bridgeObjectRelease(v31);
  return v32;
}

uint64_t sub_100006574(uint64_t result)
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
  v3 = result + 64;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 64);
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
    sub_10002A6D0(v16, v11, v12);
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

uint64_t sub_1000066E0()
{
  uint64_t *v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;
  void *v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  void *object;
  uint64_t v15;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v1 = *v0;
  v2 = (os_unfair_lock_s *)(v0[2] + 16);
  os_unfair_lock_lock(v2);
  v17[0] = 0;
  v17[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(42);
  v3 = _typeName(_:qualified:)(v1, 0);
  v5 = v4;
  swift_bridgeObjectRelease(0xE000000000000000);
  v18 = v3;
  v19 = v5;
  v6._object = (void *)0x8000000100041DB0;
  v6._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v6);
  v7 = v0[5];
  v8 = (void *)v0[6];
  swift_bridgeObjectRetain(v8);
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v8);
  v10._countAndFlagsBits = 0xD000000000000013;
  v10._object = (void *)0x8000000100041DD0;
  String.append(_:)(v10);
  swift_beginAccess(v0 + 3, v17, 0, 0);
  v11 = v0[3];
  swift_bridgeObjectRetain(v11);
  v12 = sub_100007800(&qword_100051230);
  v13._countAndFlagsBits = Dictionary.description.getter(v11, &type metadata for String, v12, &protocol witness table for String);
  object = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(object);
  v15 = v18;
  os_unfair_lock_unlock(v2);
  return v15;
}

uint64_t sub_100006840()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  uint64_t *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t result;
  os_unfair_lock_s *lock;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _BYTE v44[24];

  lock = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 16) + 16);
  os_unfair_lock_lock(lock);
  v1 = (_QWORD *)sub_10001D8C4((uint64_t)_swiftEmptyArrayStorage);
  swift_beginAccess(v0 + 24, v44, 0, 0);
  v2 = *(_QWORD *)(v0 + 24);
  v38 = v2 + 64;
  v3 = 1 << *(_BYTE *)(v2 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v2 + 64);
  v39 = (unint64_t)(v3 + 63) >> 6;
  v40 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(v2);
  v6 = 0;
  while (1)
  {
    if (v5)
    {
      v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v9 = v8 | (v6 << 6);
    }
    else
    {
      v10 = v6 + 1;
      if (__OFADD__(v6, 1))
        goto LABEL_43;
      if (v10 >= v39)
      {
LABEL_39:
        swift_release(v40);
        os_unfair_lock_unlock(lock);
        return (uint64_t)v1;
      }
      v11 = *(_QWORD *)(v38 + 8 * v10);
      ++v6;
      if (!v11)
      {
        v6 = v10 + 1;
        if (v10 + 1 >= v39)
          goto LABEL_39;
        v11 = *(_QWORD *)(v38 + 8 * v6);
        if (!v11)
        {
          v6 = v10 + 2;
          if (v10 + 2 >= v39)
            goto LABEL_39;
          v11 = *(_QWORD *)(v38 + 8 * v6);
          if (!v11)
          {
            v12 = v10 + 3;
            if (v12 >= v39)
              goto LABEL_39;
            v11 = *(_QWORD *)(v38 + 8 * v12);
            if (!v11)
            {
              while (1)
              {
                v6 = v12 + 1;
                if (__OFADD__(v12, 1))
                  goto LABEL_44;
                if (v6 >= v39)
                  goto LABEL_39;
                v11 = *(_QWORD *)(v38 + 8 * v6);
                ++v12;
                if (v11)
                  goto LABEL_21;
              }
            }
            v6 = v12;
          }
        }
      }
LABEL_21:
      v5 = (v11 - 1) & v11;
      v9 = __clz(__rbit64(v11)) + (v6 << 6);
    }
    v13 = (uint64_t *)(*(_QWORD *)(v40 + 48) + 16 * v9);
    v15 = *v13;
    v14 = v13[1];
    v16 = *(_QWORD *)(*(_QWORD *)(v40 + 56) + 8 * v9);
    v17 = *(_QWORD *)(v16 + 16);
    if (v17)
    {
      v41 = *v13;
      v18 = sub_100007800(&qword_1000512C0);
      v19 = (_QWORD *)swift_allocObject(v18, 16 * v17 + 32, 7);
      v20 = j__malloc_size(v19);
      v21 = v20 - 32;
      if (v20 < 32)
        v21 = v20 - 17;
      v19[2] = v17;
      v19[3] = 2 * (v21 >> 4);
      v42 = sub_10002C020((uint64_t)&v43, v19 + 4, v17, v16);
      v22 = (uint64_t)v43;
      swift_bridgeObjectRetain_n(v16, 2);
      swift_bridgeObjectRetain(v14);
      sub_10000AB70(v22);
      if (v42 != v17)
        goto LABEL_41;
      swift_bridgeObjectRelease(v16);
      v15 = v41;
    }
    else
    {
      swift_bridgeObjectRetain(v13[1]);
      v19 = _swiftEmptyArrayStorage;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v1);
    v43 = v1;
    v25 = sub_1000088BC(v15, v14);
    v26 = v1[2];
    v27 = (v24 & 1) == 0;
    v28 = v26 + v27;
    if (__OFADD__(v26, v27))
      break;
    v29 = v24;
    if (v1[3] >= v28)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v1 = v43;
        if ((v24 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_100019F94();
        v1 = v43;
        if ((v29 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_10002AF08(v28, isUniquelyReferenced_nonNull_native);
      v30 = sub_1000088BC(v15, v14);
      if ((v29 & 1) != (v31 & 1))
        goto LABEL_45;
      v25 = v30;
      v1 = v43;
      if ((v29 & 1) != 0)
      {
LABEL_4:
        v7 = v1[7];
        swift_bridgeObjectRelease(*(_QWORD *)(v7 + 8 * v25));
        *(_QWORD *)(v7 + 8 * v25) = v19;
        goto LABEL_5;
      }
    }
    v1[(v25 >> 6) + 8] |= 1 << v25;
    v32 = (uint64_t *)(v1[6] + 16 * v25);
    *v32 = v15;
    v32[1] = v14;
    *(_QWORD *)(v1[7] + 8 * v25) = v19;
    v33 = v1[2];
    v34 = __OFADD__(v33, 1);
    v35 = v33 + 1;
    if (v34)
      goto LABEL_42;
    v1[2] = v35;
    swift_bridgeObjectRetain(v14);
LABEL_5:
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(0x8000000000000000);
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100006C08()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v43;
  unint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  char v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t result;
  os_unfair_lock_t lock;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  id v65;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 16) + 16);
  os_unfair_lock_lock(v1);
  v61 = v0;
  v2 = sub_10000723C(v0);
  v63 = (_QWORD *)sub_10001D8C4((uint64_t)_swiftEmptyArrayStorage);
  v60 = v2[2];
  if (v60)
  {
    lock = v1;
    v3 = 0;
    v59 = v2 + 4;
    v58 = v2;
    while (1)
    {
      if (v3 >= v2[2])
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
      }
      v5 = &v59[2 * v3];
      v7 = *v5;
      v6 = v5[1];
      v8 = *(void **)(v61 + 56);
      swift_bridgeObjectRetain(v6);
      v9 = v8;
      v10 = String._bridgeToObjectiveC()();
      v65 = 0;
      v11 = objc_msgSend(v9, "registeredChannelsForTopic:error:", v10, &v65);

      v12 = v65;
      v64 = v7;
      if (!v11)
      {
        v29 = v65;
        v30 = _convertNSErrorToError(_:)(v12);

        swift_willThrow(v31);
        if (qword_100050F28 != -1)
          swift_once(&qword_100050F28, sub_10001E040);
        v32 = type metadata accessor for Logger(0);
        sub_10000A8E8(v32, (uint64_t)qword_100052B80);
        swift_errorRetain(v30);
        swift_bridgeObjectRetain(v6);
        v33 = swift_errorRetain(v30);
        v34 = Logger.logObject.getter(v33);
        v35 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v34, v35))
        {
          v36 = swift_slowAlloc(22, -1);
          v37 = (uint64_t *)swift_slowAlloc(8, -1);
          v38 = (void *)swift_slowAlloc(32, -1);
          v65 = v38;
          *(_DWORD *)v36 = 136315394;
          swift_bridgeObjectRetain(v6);
          *(_QWORD *)(v36 + 4) = sub_100008204(v64, v6, (uint64_t *)&v65);
          swift_bridgeObjectRelease_n(v6, 3);
          *(_WORD *)(v36 + 12) = 2112;
          swift_errorRetain(v30);
          v39 = _swift_stdlib_bridgeErrorToNSError(v30);
          *(_QWORD *)(v36 + 14) = v39;
          *v37 = v39;
          swift_errorRelease(v30);
          swift_errorRelease(v30);
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed at fetching registered channels for topic: %s - %@", (uint8_t *)v36, 0x16u);
          v40 = sub_100007800(&qword_100051288);
          swift_arrayDestroy(v37, 1, v40);
          swift_slowDealloc(v37, -1, -1);
          swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
          v2 = v58;
          swift_slowDealloc(v38, -1, -1);
          swift_slowDealloc(v36, -1, -1);

          swift_errorRelease(v30);
        }
        else
        {
          swift_errorRelease(v30);
          swift_bridgeObjectRelease_n(v6, 2);
          swift_errorRelease(v30);
          swift_errorRelease(v30);

        }
        goto LABEL_5;
      }
      v62 = v6;
      v13 = sub_10000AB78(0, &qword_1000512B0, PKPublicChannel_ptr);
      v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v13);
      v15 = v12;

      if ((unint64_t)v14 >> 62)
      {
        if (v14 < 0)
          v41 = v14;
        else
          v41 = v14 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v14);
        v16 = _CocoaArrayWrapper.endIndex.getter(v41);
        if (v16)
        {
LABEL_10:
          if (v16 < 1)
            goto LABEL_47;
          v17 = 0;
          v18 = _swiftEmptyArrayStorage;
          do
          {
            if ((v14 & 0xC000000000000001) != 0)
              v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17, v14);
            else
              v19 = *(id *)(v14 + 8 * v17 + 32);
            v20 = v19;
            v21 = objc_msgSend(v20, "channelID");
            if (v21)
            {
              v22 = v21;
              v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
              v25 = v24;

              if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0)
                v18 = sub_1000193E4(0, v18[2] + 1, 1, v18);
              v27 = v18[2];
              v26 = v18[3];
              if (v27 >= v26 >> 1)
                v18 = sub_1000193E4((_QWORD *)(v26 > 1), v27 + 1, 1, v18);
              v18[2] = v27 + 1;
              v28 = &v18[2 * v27];
              v28[4] = v23;
              v28[5] = v25;
            }
            else
            {

            }
            ++v17;
          }
          while (v16 != v17);
          goto LABEL_33;
        }
      }
      else
      {
        v16 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v14);
        if (v16)
          goto LABEL_10;
      }
      v18 = _swiftEmptyArrayStorage;
LABEL_33:
      swift_bridgeObjectRelease_n(v14, 2);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v63);
      v65 = v63;
      v44 = sub_1000088BC(v64, v62);
      v45 = v63[2];
      v46 = (v43 & 1) == 0;
      v47 = v45 + v46;
      if (__OFADD__(v45, v46))
        goto LABEL_46;
      v48 = v43;
      if (v63[3] >= v47)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_100019F94();
      }
      else
      {
        sub_10002AF08(v47, isUniquelyReferenced_nonNull_native);
        v49 = sub_1000088BC(v64, v62);
        if ((v48 & 1) != (v50 & 1))
        {
          result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
          __break(1u);
          return result;
        }
        v44 = v49;
      }
      v51 = v65;
      v63 = v65;
      if ((v48 & 1) != 0)
      {
        v4 = *((_QWORD *)v65 + 7);
        swift_bridgeObjectRelease(*(_QWORD *)(v4 + 8 * v44));
        *(_QWORD *)(v4 + 8 * v44) = v18;
      }
      else
      {
        *((_QWORD *)v65 + (v44 >> 6) + 8) |= 1 << v44;
        v52 = (uint64_t *)(v51[6] + 16 * v44);
        *v52 = v64;
        v52[1] = v62;
        *(_QWORD *)(v51[7] + 8 * v44) = v18;
        v53 = v51[2];
        v54 = __OFADD__(v53, 1);
        v55 = v53 + 1;
        if (v54)
          goto LABEL_48;
        v51[2] = v55;
        swift_bridgeObjectRetain(v62);
      }
      swift_bridgeObjectRelease(v62);
      swift_bridgeObjectRelease(0x8000000000000000);
      v2 = v58;
LABEL_5:
      if (++v3 == v60)
      {
        swift_bridgeObjectRelease(v2);
        v1 = lock;
        goto LABEL_44;
      }
    }
  }
  swift_bridgeObjectRelease(v2);
LABEL_44:
  os_unfair_lock_unlock(v1);
  return (uint64_t)v63;
}

_QWORD *sub_10000723C(uint64_t a1)
{
  _QWORD *result;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  result = objc_msgSend(*(id *)(a1 + 56), "enabledTopics");
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = result;
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

  sub_10000B864(v4);
  result = objc_msgSend(*(id *)(a1 + 56), "opportunisticTopics");
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v5 = result;
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

  sub_10000B864(v6);
  result = objc_msgSend(*(id *)(a1 + 56), "ignoredTopics");
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v7 = result;
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

  sub_10000B864(v8);
  result = objc_msgSend(*(id *)(a1 + 56), "nonWakingTopics");
  if (result)
  {
    v9 = result;
    v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

    sub_10000B864(v10);
    return _swiftEmptyArrayStorage;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100007388()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  return v0;
}

uint64_t sub_1000073D4()
{
  uint64_t v0;

  sub_100007388();
  return swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for NotificationRegistry()
{
  return objc_opt_self(_TtC7mlhostd20NotificationRegistry);
}

uint64_t sub_100007414()
{
  return sub_1000066E0();
}

id sub_100007630(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for MLHostAPSListener()
{
  return objc_opt_self(_TtC7mlhostd17MLHostAPSListener);
}

uint64_t *sub_100007698(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v21);
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[6];
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v14 = type metadata accessor for TaskDefinition(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[7];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = type metadata accessor for MLHostSystemParameters(0);
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      v20 = sub_100007800(&qword_100051180);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    v22 = a3[8];
    v23 = (uint64_t *)((char *)v4 + v22);
    v24 = (uint64_t *)((char *)a2 + v22);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    swift_bridgeObjectRetain(v25);
  }
  return v4;
}

uint64_t sub_100007800(uint64_t *a1)
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

uint64_t sub_100007840(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a1 + a2[5];
  v5 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[6];
  v7 = type metadata accessor for TaskDefinition(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[7];
  v9 = type metadata accessor for MLHostSystemParameters(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[8] + 8));
}

_QWORD *sub_100007904(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for TaskDefinition(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for MLHostSystemParameters(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = sub_100007800(&qword_100051180);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v20 = a3[8];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  swift_bridgeObjectRetain(v23);
  return a1;
}

_QWORD *sub_100007A40(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for TaskDefinition(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for MLHostSystemParameters(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v15, v16, v17);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v22 = sub_100007800(&qword_100051180);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
LABEL_7:
  v23 = a3[8];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  *v24 = *v25;
  v26 = v25[1];
  v27 = v24[1];
  v24[1] = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  return a1;
}

_QWORD *sub_100007BDC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for TaskDefinition(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for MLHostSystemParameters(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = sub_100007800(&qword_100051180);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  return a1;
}

_QWORD *sub_100007D0C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for TaskDefinition(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for MLHostSystemParameters(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v22 = sub_100007800(&qword_100051180);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
LABEL_7:
  v23 = a3[8];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  v27 = *v25;
  v26 = v25[1];
  v28 = v24[1];
  *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease(v28);
  return a1;
}

uint64_t sub_100007E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007EA4);
}

uint64_t sub_100007EA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v13;
  int v14;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = type metadata accessor for TaskDefinition(0);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v11 = sub_100007800(&qword_100051180);
  v7 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v9 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v13 = *(_QWORD *)(a1 + a3[8] + 8);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v14 = v13 - 1;
  if (v14 < 0)
    v14 = -1;
  return (v14 + 1);
}

uint64_t sub_100007F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007F8C);
}

uint64_t sub_100007F8C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  v12 = type metadata accessor for TaskDefinition(0);
  v9 = *(_QWORD *)(v12 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v12;
    v11 = a4[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  result = sub_100007800(&qword_100051180);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  *(_QWORD *)(a1 + a4[8] + 8) = a2;
  return result;
}

uint64_t type metadata accessor for MLHostPushMessage(uint64_t a1)
{
  return sub_10000B268(a1, (uint64_t *)&unk_1000511E0, (uint64_t)&nominal type descriptor for MLHostPushMessage);
}

void sub_10000806C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[5];

  v8[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v2 = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v8[1] = *(_QWORD *)(v2 - 8) + 64;
    v4 = type metadata accessor for TaskDefinition(319);
    if (v5 <= 0x3F)
    {
      v8[2] = *(_QWORD *)(v4 - 8) + 64;
      sub_100008124(319);
      if (v7 <= 0x3F)
      {
        v8[3] = *(_QWORD *)(v6 - 8) + 64;
        v8[4] = &unk_100038988;
        swift_initStructMetadata(a1, 256, 5, v8, a1 + 16);
      }
    }
  }
}

void sub_100008124(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000511F0)
  {
    v2 = type metadata accessor for MLHostSystemParameters(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000511F0);
  }
}

unint64_t sub_100008178()
{
  unint64_t result;

  result = qword_100051240;
  if (!qword_100051240)
  {
    result = swift_getWitnessTable(&unk_100038B48, &type metadata for MLHostPushMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100051240);
  }
  return result;
}

uint64_t sub_1000081BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007800(&qword_100051180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008204(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_1000082D4(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_10000AAC8((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_10000AAC8((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000A9A4(v13);
  return v8;
}

uint64_t sub_1000082D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000848C(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_10000848C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100008520(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100008770(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100008770(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100008520(uint64_t a1, unint64_t a2)
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
      v5 = sub_100008694(v4, 0);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100008694(uint64_t a1, uint64_t a2)
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
    return _swiftEmptyArrayStorage;
  v4 = sub_100007800(&qword_1000512A8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000086F8(unint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100008770(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100007800(&qword_1000512A8);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
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

unint64_t sub_1000088BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000089D0(a1, a2, v5);
}

unint64_t sub_100008920(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_100008AB0(a1, v7);
}

unint64_t sub_1000089A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100008C24(a1, v4);
}

unint64_t sub_1000089D0(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100008AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_100008C24(uint64_t a1, uint64_t a2)
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
      sub_10000AB08(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000A900((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100008CE8(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    swift_stdlib_random(&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          swift_stdlib_random(&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Int sub_100008D70(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  Swift::Int v9;
  void *v10;
  uint64_t v12;

  v4 = *(_BYTE *)(a2 + 32);
  v5 = v4 & 0x3F;
  v6 = (1 << v4) + 63;
  v7 = v6 >> 6;
  v8 = 8 * (v6 >> 6);
  if (v5 <= 0xD || (swift_stdlib_isStackAllocationSafe(8 * (v6 >> 6), 8) & 1) != 0)
  {
    __chkstk_darwin();
    bzero((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    v9 = sub_100008EF0((Swift::Int)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a2, a1);
    swift_release(a2);
  }
  else
  {
    v10 = (void *)swift_slowAlloc(v8, -1);
    bzero(v10, v8);
    v9 = sub_100008EF0((Swift::Int)v10, v7, a2, a1);
    swift_release(a2);
    swift_slowDealloc(v10, -1, -1);
  }
  return v9;
}

Swift::Int sub_100008EF0(Swift::Int result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  Swift::Int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  int64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  Swift::Int v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  BOOL v61;
  unint64_t *v63;
  uint64_t v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  int64_t v68;
  int64_t v69;
  _QWORD v71[9];
  uint64_t v72;

  v4 = a4;
  v5 = a3;
  v63 = (unint64_t *)result;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(a4 + 16);
  v72 = a4;
  if (v7 < v6)
  {
    v8 = 0;
    v64 = a4 + 56;
    v9 = 1 << *(_BYTE *)(a4 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(a4 + 56);
    v65 = (unint64_t)(v9 + 63) >> 6;
    v67 = 0;
    v12 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v11)
        {
          v13 = __clz(__rbit64(v11));
          v11 &= v11 - 1;
          v68 = v8;
          v14 = v13 | (v8 << 6);
        }
        else
        {
          v15 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v15 >= v65)
            goto LABEL_79;
          v16 = *(_QWORD *)(v64 + 8 * v15);
          v17 = v8 + 1;
          if (!v16)
          {
            v17 = v8 + 2;
            if (v8 + 2 >= v65)
              goto LABEL_79;
            v16 = *(_QWORD *)(v64 + 8 * v17);
            if (!v16)
            {
              v17 = v8 + 3;
              if (v8 + 3 >= v65)
                goto LABEL_79;
              v16 = *(_QWORD *)(v64 + 8 * v17);
              if (!v16)
              {
                v18 = v8 + 4;
                if (v8 + 4 >= v65)
                  goto LABEL_79;
                v16 = *(_QWORD *)(v64 + 8 * v18);
                if (!v16)
                {
                  while (1)
                  {
                    v17 = v18 + 1;
                    if (__OFADD__(v18, 1))
                      goto LABEL_83;
                    if (v17 >= v65)
                      goto LABEL_79;
                    v16 = *(_QWORD *)(v64 + 8 * v17);
                    ++v18;
                    if (v16)
                      goto LABEL_22;
                  }
                }
                v17 = v8 + 4;
              }
            }
          }
LABEL_22:
          v11 = (v16 - 1) & v16;
          v68 = v17;
          v14 = __clz(__rbit64(v16)) + (v17 << 6);
        }
        v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v14);
        v21 = *v19;
        v20 = v19[1];
        Hasher.init(_seed:)(v71, *(_QWORD *)(v5 + 40));
        swift_bridgeObjectRetain(v20);
        String.hash(into:)(v71, v21, v20);
        v22 = Hasher._finalize()();
        v23 = -1 << *(_BYTE *)(v5 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
          break;
LABEL_6:
        result = swift_bridgeObjectRelease(v20);
        v8 = v68;
        v5 = a3;
        v4 = v72;
      }
      v27 = *(_QWORD *)(a3 + 48);
      v28 = (_QWORD *)(v27 + 16 * v24);
      v29 = v28[1];
      v30 = *v28 == v21 && v29 == v20;
      if (!v30 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v28, v29, v21, v20, 0) & 1) == 0)
      {
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v12 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = v34[1];
          v36 = *v34 == v21 && v35 == v20;
          if (v36 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v34, v35, v21, v20, 0) & 1) != 0)
          {
            result = swift_bridgeObjectRelease(v20);
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      result = swift_bridgeObjectRelease(v20);
LABEL_38:
      v8 = v68;
      v5 = a3;
      v63[v25] |= v26;
      v37 = __OFADD__(v67++, 1);
      v4 = v72;
      if (v37)
        goto LABEL_82;
    }
  }
  v38 = 0;
  v66 = a3 + 56;
  v67 = 0;
  v39 = 1 << *(_BYTE *)(a3 + 32);
  if (v39 < 64)
    v40 = ~(-1 << v39);
  else
    v40 = -1;
  v41 = v40 & *(_QWORD *)(a3 + 56);
  v69 = (unint64_t)(v39 + 63) >> 6;
  v42 = a4 + 56;
  while (1)
  {
    if (v41)
    {
      v43 = __clz(__rbit64(v41));
      v41 &= v41 - 1;
      v44 = v43 | (v38 << 6);
      goto LABEL_63;
    }
    v45 = v38 + 1;
    if (__OFADD__(v38, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v45 >= v69)
      goto LABEL_79;
    v46 = *(_QWORD *)(v66 + 8 * v45);
    ++v38;
    if (!v46)
    {
      v38 = v45 + 1;
      if (v45 + 1 >= v69)
        goto LABEL_79;
      v46 = *(_QWORD *)(v66 + 8 * v38);
      if (!v46)
      {
        v38 = v45 + 2;
        if (v45 + 2 >= v69)
          goto LABEL_79;
        v46 = *(_QWORD *)(v66 + 8 * v38);
        if (!v46)
          break;
      }
    }
LABEL_62:
    v41 = (v46 - 1) & v46;
    v44 = __clz(__rbit64(v46)) + (v38 << 6);
LABEL_63:
    v48 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v44);
    v50 = *v48;
    v49 = v48[1];
    Hasher.init(_seed:)(v71, *(_QWORD *)(v4 + 40));
    swift_bridgeObjectRetain(v49);
    String.hash(into:)(v71, v50, v49);
    v51 = Hasher._finalize()();
    v52 = -1 << *(_BYTE *)(v4 + 32);
    v53 = v51 & ~v52;
    if (((*(_QWORD *)(v42 + ((v53 >> 3) & 0xFFFFFFFFFFFFF8)) >> v53) & 1) == 0)
      goto LABEL_46;
    v54 = *(_QWORD *)(v72 + 48);
    v55 = (_QWORD *)(v54 + 16 * v53);
    v56 = v55[1];
    v57 = *v55 == v50 && v56 == v49;
    if (v57 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v55, v56, v50, v49, 0) & 1) != 0)
    {
LABEL_76:
      result = swift_bridgeObjectRelease(v49);
      *(unint64_t *)((char *)v63 + ((v44 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v44;
      v37 = __OFADD__(v67++, 1);
      v5 = a3;
      v4 = v72;
      if (v37)
      {
        __break(1u);
LABEL_79:
        swift_retain(v5);
        return sub_10000942C(v63, a2, v67, v5);
      }
    }
    else
    {
      v58 = ~v52;
      while (1)
      {
        v53 = (v53 + 1) & v58;
        if (((*(_QWORD *)(v42 + ((v53 >> 3) & 0xFFFFFFFFFFFFF8)) >> v53) & 1) == 0)
          break;
        v59 = (_QWORD *)(v54 + 16 * v53);
        v60 = v59[1];
        v61 = *v59 == v50 && v60 == v49;
        if (v61 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v59, v60, v50, v49, 0) & 1) != 0)
          goto LABEL_76;
      }
LABEL_46:
      result = swift_bridgeObjectRelease(v49);
      v5 = a3;
      v4 = v72;
    }
  }
  v47 = v45 + 3;
  if (v47 >= v69)
    goto LABEL_79;
  v46 = *(_QWORD *)(v66 + 8 * v47);
  if (v46)
  {
    v38 = v47;
    goto LABEL_62;
  }
  while (1)
  {
    v38 = v47 + 1;
    if (__OFADD__(v47, 1))
      break;
    if (v38 >= v69)
      goto LABEL_79;
    v46 = *(_QWORD *)(v66 + 8 * v38);
    ++v47;
    if (v46)
      goto LABEL_62;
  }
LABEL_84:
  __break(1u);
  return result;
}

Swift::Int sub_10000942C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  Swift::Int result;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  _QWORD v32[9];

  v4 = a4;
  if (!a3)
  {
    v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release(v4);
    return (Swift::Int)v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_100007800(&qword_1000512B8);
  result = static _SetStorage.allocate(capacity:)(v5);
  v8 = (_QWORD *)result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    Hasher.init(_seed:)(v32, v8[5]);
    swift_bridgeObjectRetain(v19);
    String.hash(into:)(v32, v18, v19);
    result = Hasher._finalize()();
    v20 = -1 << *((_BYTE *)v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(v8[6] + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++v8[2];
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000096C0(uint64_t a1)
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

int64_t sub_100009760(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_100009844(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_10000989C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;

  if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F6973726576, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144)
  {
    v7 = 0xEC00000065746144;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461657263, 0xEC00000065746144, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x696665446B736174 && a2 == 0xEE006E6F6974696ELL)
  {
    v8 = 0xEE006E6F6974696ELL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x696665446B736174, 0xEE006E6F6974696ELL, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0xD000000000000010)
  {
    v9 = 0x8000000100042080;
    if (a2 == 0x8000000100042080)
      goto LABEL_25;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010, 0x8000000100042080, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
LABEL_25:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if (a1 == 0x617261506B736174 && a2 == 0xEE0073726574656DLL)
  {
    swift_bridgeObjectRelease(0xEE0073726574656DLL);
    return 4;
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0x617261506B736174, 0xEE0073726574656DLL, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_100009B10(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  char v6;

  if (a1 == 0xD000000000000010)
  {
    v4 = 0x8000000100042080;
    if (a2 == 0x8000000100042080)
      goto LABEL_5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010, 0x8000000100042080, a1, a2, 0) & 1) != 0)
  {
    v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  if (a1 == 0x617261506B736174 && a2 == 0xEE0073726574656DLL)
  {
    swift_bridgeObjectRelease(0xEE0073726574656DLL);
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x617261506B736174, 0xEE0073726574656DLL, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_100009C20(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  os_log_type_t v32;
  uint8_t *v33;
  os_log_type_t v34;
  uint8_t *v35;
  const char *v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  uint8_t *v74;
  _QWORD *v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  void (*v92)(os_log_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, id);
  uint64_t v93;
  void *v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  os_log_t oslog;
  NSObject *osloga;
  NSObject *v105;
  __int128 v106;
  __int128 v107;
  id v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;

  v2 = v1;
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000A8E8(v4, (uint64_t)qword_100052B80);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received relay push", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  if (!a1)
  {
    v105 = Logger.logObject.getter(v9);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v105, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v105, v32, "Push message has nil message.", v33, 2u);
      swift_slowDealloc(v33, -1, -1);
    }
    goto LABEL_20;
  }
  v105 = a1;
  v10 = -[NSObject topic](v105, "topic");
  if (!v10)
    goto LABEL_14;
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v14 = v13;

  v15 = -[NSObject channelID](v105, "channelID");
  if (!v15)
  {
    v10 = (id)swift_bridgeObjectRelease(v14);
LABEL_14:
    osloga = Logger.logObject.getter(v10);
    v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(osloga, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v35 = 0;
      v36 = "Push message has nil topic / channel.";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, osloga, v34, v36, v35, 2u);
      swift_slowDealloc(v35, -1, -1);

      return;
    }
    goto LABEL_19;
  }
  v16 = v15;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v19 = v18;

  v20 = -[NSObject userInfo](v105, "userInfo");
  if (!v20)
  {
    swift_bridgeObjectRelease(v19);
    v37 = swift_bridgeObjectRelease(v14);
    osloga = Logger.logObject.getter(v37);
    v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(osloga, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v35 = 0;
      v36 = "Push message has nil userInfo.";
      goto LABEL_16;
    }
LABEL_19:

LABEL_20:
    return;
  }
  v21 = v20;
  v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v20, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  swift_bridgeObjectRetain_n(v14, 2);
  v23 = swift_bridgeObjectRetain_n(v22, 2);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.debug.getter();
  v101 = v2;
  v102 = v17;
  oslog = (os_log_t)v12;
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc(22, -1);
    v98 = (void *)swift_slowAlloc(64, -1);
    v108 = v98;
    *(_DWORD *)v26 = 136315394;
    swift_bridgeObjectRetain(v14);
    *(_QWORD *)&v110 = sub_100008204(v12, v14, (uint64_t *)&v108);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, (char *)&v110 + 8, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease_n(v14, 3);
    *(_WORD *)(v26 + 12) = 2080;
    v27 = Dictionary.description.getter(v22, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v28 = v14;
    v30 = v29;
    *(_QWORD *)&v110 = sub_100008204(v27, v29, (uint64_t *)&v108);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, (char *)&v110 + 8, v26 + 14, v26 + 22);
    swift_bridgeObjectRelease_n(v22, 2);
    v31 = v30;
    v14 = v28;
    swift_bridgeObjectRelease(v31);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Push message for topic %s: %s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy(v98, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v98, -1, -1);
    swift_slowDealloc(v26, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v22, 2);
    swift_bridgeObjectRelease_n(v14, 2);
  }
  strcpy((char *)&v106, "messageBundle");
  HIWORD(v106) = -4864;
  AnyHashable.init<A>(_:)(&v108, &v106, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v22 + 16) && (v38 = sub_1000089A0((uint64_t)&v108), (v39 & 1) != 0))
  {
    sub_10000AAC8(*(_QWORD *)(v22 + 56) + 32 * v38, (uint64_t)&v106);
  }
  else
  {
    v106 = 0u;
    v107 = 0u;
  }
  swift_bridgeObjectRelease(v22);
  sub_10000A900((uint64_t)&v108);
  if (*((_QWORD *)&v107 + 1))
  {
    sub_10000A970(&v106, &v110);
    v40 = -[NSObject pushType](v105, "pushType");
    if (v40 == (id)1024)
    {
      v41 = 0xEC00000079746976;
      v42 = 0x697463416576696CLL;
    }
    else if (v40 == (id)8)
    {
      v41 = 0xE500000000000000;
      v42 = 0x7472656C61;
    }
    else if (v40 == (id)4)
    {
      v41 = 0xEA0000000000646ELL;
      v42 = 0x756F72676B636162;
    }
    else
    {
      v108 = v40;
      type metadata accessor for APSIncomingMessagePushType(0);
      v42 = String.init<A>(describing:)(&v108, v48);
      v41 = v49;
    }
    v50 = -[NSObject priority](v105, "priority");
    if (v50 == (id)1)
    {
      v51 = 0xE300000000000000;
      v52 = 7827308;
    }
    else if (v50 == (id)10)
    {
      v51 = 0xE400000000000000;
      v52 = 1751607656;
    }
    else if (v50 == (id)5)
    {
      v51 = 0xE600000000000000;
      v52 = 0x6D756964656DLL;
    }
    else
    {
      v108 = v50;
      type metadata accessor for APSIncomingMessagePriority(0);
      v52 = String.init<A>(describing:)(&v108, v53);
      v51 = v54;
    }
    v55 = (void *)objc_opt_self(NSJSONSerialization);
    v56 = v111;
    v57 = sub_10000A980(&v110, v111);
    v58 = _bridgeAnythingToObjectiveC<A>(_:)(v57, v56);
    v108 = 0;
    v59 = objc_msgSend(v55, "dataWithJSONObject:options:error:", v58, 0, &v108);
    swift_unknownObjectRelease(v58);
    v60 = v108;
    if (v59)
    {
      v97 = v52;
      v99 = v42;
      v100 = v51;
      v61 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v59);
      v63 = v62;

      v64 = type metadata accessor for JSONDecoder(0);
      swift_allocObject(v64, *(unsigned int *)(v64 + 48), *(unsigned __int16 *)(v64 + 52));
      v65 = JSONDecoder.init()();
      v66 = sub_100007800(&qword_100051290);
      v67 = sub_10000A9C4();
      dispatch thunk of JSONDecoder.decode<A>(_:from:)(&v108, v66, v61, v63, v66, v67);
      v96 = v41;
      swift_release(v65);
      v78 = v108;
      v79 = swift_bridgeObjectRetain_n(v108, 2);
      v80 = Logger.logObject.getter(v79);
      v81 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v80, v81))
      {
        v95 = v14;
        v83 = (uint8_t *)swift_slowAlloc(12, -1);
        v94 = (void *)swift_slowAlloc(32, -1);
        v108 = v94;
        *(_DWORD *)v83 = 136315138;
        v84 = v19;
        v85 = type metadata accessor for MLHostPushMessage(0);
        swift_bridgeObjectRetain(v78);
        v87 = Array.description.getter(v86, v85);
        v89 = v88;
        swift_bridgeObjectRelease(v78);
        v90 = v87;
        v19 = v84;
        *(_QWORD *)&v106 = sub_100008204(v90, v89, (uint64_t *)&v108);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, (char *)&v106 + 8, v83 + 4, v83 + 12);
        swift_bridgeObjectRelease_n(v78, 2);
        v91 = v89;
        v14 = v95;
        swift_bridgeObjectRelease(v91);
        _os_log_impl((void *)&_mh_execute_header, v80, v81, "Decoded pushed message bundle: %s", v83, 0xCu);
        swift_arrayDestroy(v94, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v94, -1, -1);
        swift_slowDealloc(v83, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v78, 2);
      }
      v92 = *(void (**)(os_log_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, id))(v101 + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
      v93 = *(_QWORD *)(v101 + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage + 8);
      swift_retain(v93);
      v92(oslog, v14, v102, v19, v99, v96, v97, v100, v78);
      swift_release(v93);

      sub_10000AA84(v61, v63);
      swift_bridgeObjectRelease(v78);
      swift_bridgeObjectRelease(v100);
      swift_bridgeObjectRelease(v96);
      swift_bridgeObjectRelease(v19);
      swift_bridgeObjectRelease(v14);
    }
    else
    {
      v68 = v60;
      swift_bridgeObjectRelease(v51);
      swift_bridgeObjectRelease(v41);
      swift_bridgeObjectRelease(v19);
      swift_bridgeObjectRelease(v14);
      v69 = _convertNSErrorToError(_:)(v68);

      swift_willThrow(v70);
      swift_errorRetain(v69);
      v71 = swift_errorRetain(v69);
      v72 = Logger.logObject.getter(v71);
      v73 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v72, (os_log_type_t)v73))
      {
        v74 = (uint8_t *)swift_slowAlloc(12, -1);
        v75 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v74 = 138412290;
        swift_errorRetain(v69);
        v76 = (void *)_swift_stdlib_bridgeErrorToNSError(v69);
        v108 = v76;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v108, &v109, v74 + 4, v74 + 12);
        *v75 = v76;
        swift_errorRelease(v69);
        swift_errorRelease(v69);
        _os_log_impl((void *)&_mh_execute_header, v72, (os_log_type_t)v73, "Received invalid push message, error: %@. Skipping callback.", v74, 0xCu);
        v77 = sub_100007800(&qword_100051288);
        swift_arrayDestroy(v75, 1, v77);
        swift_slowDealloc(v75, -1, -1);
        swift_slowDealloc(v74, -1, -1);

        swift_errorRelease(v69);
      }
      else
      {

        swift_errorRelease(v69);
        swift_errorRelease(v69);
        swift_errorRelease(v69);

      }
    }
    sub_10000A9A4(&v110);
  }
  else
  {
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(v14);
    v43 = sub_10000A934((uint64_t)&v106, &qword_100051280);
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc(12, -1);
      v47 = (void *)swift_slowAlloc(32, -1);
      v108 = v47;
      *(_DWORD *)v46 = 136315138;
      *(_QWORD *)&v110 = sub_100008204(0x426567617373656DLL, 0xED0000656C646E75, (uint64_t *)&v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, (char *)&v110 + 8, v46 + 4, v46 + 12);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "The push message body must be a JSON dictionary with key: %s.", v46, 0xCu);
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v46, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_10000A8E8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000A900(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10000A934(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100007800(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_10000A970(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *sub_10000A980(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000A9A4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_10000A9C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051298;
  if (!qword_100051298)
  {
    v1 = sub_10000AA40(&qword_100051290);
    sub_10000228C(&qword_1000512A0, type metadata accessor for MLHostPushMessage, (uint64_t)&unk_1000389C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100051298);
  }
  return result;
}

uint64_t sub_10000AA40(uint64_t *a1)
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

uint64_t sub_10000AA84(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000AAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000AB08(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000AB44(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000AA84(result, a2);
  return result;
}

uint64_t sub_10000AB58(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_10000AB64(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_10000AB70(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000AB78(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_10000ABB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000512E0;
  if (!qword_1000512E0)
  {
    v1 = sub_10000AA40(&qword_1000512D8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000512E0);
  }
  return result;
}

void sub_10000ABFC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100003998(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t *sub_10000AC08(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v10);
  }
  else
  {
    v7 = type metadata accessor for MLHostSystemParameters(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = sub_100007800(&qword_100051180);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(a3 + 20);
    v12 = (uint64_t *)((char *)a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain(v14);
  }
  return a1;
}

uint64_t sub_10000ACFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for MLHostSystemParameters(0);
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 20) + 8));
}

char *sub_10000AD68(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = type metadata accessor for MLHostSystemParameters(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_100007800(&qword_100051180);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *((_QWORD *)v11 + 1);
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = v12;
  swift_bridgeObjectRetain(v12);
  return a1;
}

char *sub_10000AE30(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = type metadata accessor for MLHostSystemParameters(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = sub_100007800(&qword_100051180);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v15 = *((_QWORD *)v14 + 1);
  v16 = *((_QWORD *)v13 + 1);
  *((_QWORD *)v13 + 1) = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  return a1;
}

char *sub_10000AF58(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for MLHostSystemParameters(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_100007800(&qword_100051180);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_10000B014(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for MLHostSystemParameters(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = sub_100007800(&qword_100051180);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v16 = *(_QWORD *)v14;
  v15 = *((_QWORD *)v14 + 1);
  v17 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v15;
  swift_bridgeObjectRelease(v17);
  return a1;
}

uint64_t sub_10000B12C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B138);
}

uint64_t sub_10000B138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_100007800(&qword_100051180);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_10000B1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B1D4);
}

uint64_t sub_10000B1D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100007800(&qword_100051180);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t type metadata accessor for MLHostPushParameters(uint64_t a1)
{
  return sub_10000B268(a1, qword_100051348, (uint64_t)&nominal type descriptor for MLHostPushParameters);
}

uint64_t sub_10000B268(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

void sub_10000B29C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  sub_100008124(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_100038988;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

_BYTE *initializeBufferWithCopyOfBuffer for MLHostPushMessage.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MLHostPushMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MLHostPushMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000B3F8 + 4 * byte_1000388DA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000B42C + 4 * byte_1000388D5[v4]))();
}

uint64_t sub_10000B42C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B434(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000B43CLL);
  return result;
}

uint64_t sub_10000B448(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000B450);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10000B454(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B45C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B468(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000B470(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MLHostPushMessage.CodingKeys()
{
  return &type metadata for MLHostPushMessage.CodingKeys;
}

unint64_t sub_10000B48C()
{
  unint64_t result;

  result = qword_100051380;
  if (!qword_100051380)
  {
    result = swift_getWitnessTable(&unk_100038AD0, &type metadata for MLHostPushMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100051380);
  }
  return result;
}

unint64_t sub_10000B4D4()
{
  unint64_t result;

  result = qword_100051388;
  if (!qword_100051388)
  {
    result = swift_getWitnessTable(&unk_100038A40, &type metadata for MLHostPushMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100051388);
  }
  return result;
}

unint64_t sub_10000B51C()
{
  unint64_t result;

  result = qword_100051390;
  if (!qword_100051390)
  {
    result = swift_getWitnessTable(&unk_100038A68, &type metadata for MLHostPushMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100051390);
  }
  return result;
}

unint64_t sub_10000B560()
{
  unint64_t result;

  result = qword_1000513A0;
  if (!qword_1000513A0)
  {
    result = swift_getWitnessTable(&unk_100038C50, &type metadata for MLHostPushParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000513A0);
  }
  return result;
}

uint64_t sub_10000B5A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B5E8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for MLHostPushParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MLHostPushParameters.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000B700 + 4 * byte_1000388E4[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000B734 + 4 * byte_1000388DF[v4]))();
}

uint64_t sub_10000B734(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B73C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000B744);
  return result;
}

uint64_t sub_10000B750(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000B758);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000B75C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B764(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000B770(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MLHostPushParameters.CodingKeys()
{
  return &type metadata for MLHostPushParameters.CodingKeys;
}

unint64_t sub_10000B790()
{
  unint64_t result;

  result = qword_1000513B0;
  if (!qword_1000513B0)
  {
    result = swift_getWitnessTable(&unk_100038C28, &type metadata for MLHostPushParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000513B0);
  }
  return result;
}

unint64_t sub_10000B7D8()
{
  unint64_t result;

  result = qword_1000513B8;
  if (!qword_1000513B8)
  {
    result = swift_getWitnessTable(&unk_100038B98, &type metadata for MLHostPushParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000513B8);
  }
  return result;
}

unint64_t sub_10000B820()
{
  unint64_t result;

  result = qword_1000513C0;
  if (!qword_1000513C0)
  {
    result = swift_getWitnessTable(&unk_100038BC0, &type metadata for MLHostPushParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000513C0);
  }
  return result;
}

uint64_t sub_10000B864(uint64_t a1)
{
  _QWORD *v1;
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
  char v16;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = (_QWORD *)*v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v1);
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
  v3 = sub_1000193E4(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy(v9);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
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
  v16 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v16, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000B9B4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_10000D7E8(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

_QWORD *sub_10000BB6C()
{
  uint64_t v0;
  _QWORD *result;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  result = _swiftEmptyArrayStorage;
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = (void *)objc_opt_self(_EXQueryController);
    swift_bridgeObjectRetain(v2);
    v5 = (uint64_t *)(v2 + 40);
    do
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      v8 = objc_allocWithZone((Class)_EXQuery);
      swift_bridgeObjectRetain(v6);
      v9 = String._bridgeToObjectiveC()();
      v10 = objc_msgSend(v8, "initWithExtensionPointIdentifier:", v9);

      v11 = objc_msgSend(v4, "executeQuery:", v10);
      v12 = sub_10000E54C();
      v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

      v14 = sub_10000DE64(v13, v7, v6);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v6);
      sub_10000B9B4((uint64_t)v14);

      v5 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease(v2);
    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10000BCB8(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  _BYTE v22[24];
  char v23[24];
  uint64_t v24;

  v3 = (_QWORD *)(a2 + 32);
  swift_beginAccess(a2 + 32, v23, 1, 0);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 32) = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v4);
  v5 = (uint64_t)sub_10000BB6C();
  v6 = v5;
  if ((unint64_t)v5 >> 62)
  {
    if (v5 >= 0)
      v5 &= 0xFFFFFFFFFFFFFF8uLL;
    result = _CocoaArrayWrapper.endIndex.getter(v5);
    if (!result)
      return swift_bridgeObjectRelease(v6);
  }
  else
  {
    result = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!result)
      return swift_bridgeObjectRelease(v6);
  }
  if (result >= 1)
  {
    v8 = 0;
    v21 = v6 & 0xC000000000000001;
    v24 = result;
    v9 = v6;
    do
    {
      if (v21)
        v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v6);
      else
        v10 = *(id *)(v6 + 8 * v8 + 32);
      v11 = v10;
      v12 = objc_msgSend(v10, "bundleIdentifier");
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      v15 = v14;

      swift_beginAccess(v3, v22, 33, 0);
      v16 = (_QWORD *)*v3;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
      *v3 = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v16 = sub_1000193E4(0, v16[2] + 1, 1, v16);
        *v3 = v16;
      }
      v19 = v16[2];
      v18 = v16[3];
      if (v19 >= v18 >> 1)
      {
        v16 = sub_1000193E4((_QWORD *)(v18 > 1), v19 + 1, 1, v16);
        *v3 = v16;
      }
      ++v8;
      v16[2] = v19 + 1;
      v20 = &v16[2 * v19];
      v20[4] = v13;
      v20[5] = v15;
      swift_endAccess(v22);

      v6 = v9;
    }
    while (v24 != v8);
    return swift_bridgeObjectRelease(v6);
  }
  __break(1u);
  return result;
}

void sub_10000BE88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;

  v0 = type metadata accessor for URL(0);
  v54 = *(_QWORD *)(v0 - 8);
  v55 = v0;
  __chkstk_darwin(v0);
  v53 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100007800(&qword_100051530);
  __chkstk_darwin(v2);
  v4 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ExtensionRecord(0);
  v56 = *(_QWORD *)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v52 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v51 = (char *)&v44 - v9;
  __chkstk_darwin(v8);
  v45 = (char *)&v44 - v10;
  v11 = (uint64_t)sub_10000BB6C();
  v12 = v11;
  if (!((unint64_t)v11 >> 62))
  {
    v13 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v11);
    if (v13)
      goto LABEL_3;
LABEL_20:
    v57 = (char *)_swiftEmptyArrayStorage;
LABEL_21:
    swift_bridgeObjectRelease_n(v12, 2);
    return;
  }
  if (v11 < 0)
    v43 = v11;
  else
    v43 = v11 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v11);
  v13 = _CocoaArrayWrapper.endIndex.getter(v43);
  if (!v13)
    goto LABEL_20;
LABEL_3:
  if (v13 >= 1)
  {
    v14 = 0;
    v47 = v12 & 0xC000000000000001;
    v57 = (char *)_swiftEmptyArrayStorage;
    v49 = v5;
    v50 = v4;
    v46 = v12;
    v48 = v13;
    v15 = v51;
    do
    {
      if (v47)
        v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, v12);
      else
        v16 = *(id *)(v12 + 8 * v14 + 32);
      v17 = v16;
      v18 = objc_msgSend(v17, "localizedName");
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      v58 = v20;
      v59 = v19;

      v21 = objc_msgSend(v17, "bundleIdentifier");
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      v25 = objc_msgSend(v17, "url");
      v26 = v53;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v27 = URL.absoluteString.getter();
      v29 = v28;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v26, v55);
      v30 = objc_msgSend(v17, "extensionPointIdentifier");
      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      v33 = v32;

      ExtensionRecord.init(name:bundleIdentifier:url:extensionPointIdentifier:)(v59, v58, v22, v24, v27, v29, v31, v33);
      v34 = v56;
      v35 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
      v37 = v49;
      v36 = (uint64_t)v50;
      v35(v50, v15, v49);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v36, 0, 1, v37);

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v36, 1, v37) == 1)
      {
        sub_10000A934(v36, &qword_100051530);
        v12 = v46;
      }
      else
      {
        v38 = v45;
        v35(v45, (char *)v36, v37);
        v35(v52, v38, v37);
        if ((swift_isUniquelyReferenced_nonNull_native(v57) & 1) == 0)
          v57 = (char *)sub_1000194F0(0, *((_QWORD *)v57 + 2) + 1, 1, (unint64_t)v57);
        v12 = v46;
        v40 = *((_QWORD *)v57 + 2);
        v39 = *((_QWORD *)v57 + 3);
        if (v40 >= v39 >> 1)
          v57 = (char *)sub_1000194F0(v39 > 1, v40 + 1, 1, (unint64_t)v57);
        v41 = v56;
        v42 = v57;
        *((_QWORD *)v57 + 2) = v40 + 1;
        v35(&v42[((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * v40], v52, v37);
      }
      ++v14;
    }
    while (v48 != v14);
    goto LABEL_21;
  }
  __break(1u);
}

uint64_t sub_10000C2A4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_unfair_lock_s *v26;
  char v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  id v31;
  _BYTE *v32;
  void *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  void (*v47)(_BYTE *, uint64_t);
  os_log_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  _BYTE *v54;
  Class isa;
  id v56;
  id v57;
  _BYTE *v58;
  uint64_t v59;
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, _QWORD, uint64_t, uint64_t);
  int v67;
  _BYTE v69[4];
  int v70;
  os_log_t v71;
  uint64_t v72;
  void (*v73)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE *v79;
  uint64_t v80;
  void *v81;
  _BYTE *v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88[2];
  char v89[32];

  v80 = a3;
  v81 = a4;
  v9 = sub_100007800(&qword_1000514E0);
  __chkstk_darwin(v9);
  v85 = &v69[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_100007800(&qword_1000514E8);
  __chkstk_darwin(v11);
  v79 = &v69[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for UUID(0);
  v78 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v16 = &v69[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  v18 = &v69[-v17];
  v19 = type metadata accessor for _AppExtensionIdentity(0);
  __chkstk_darwin(v19);
  v21 = &v69[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = type metadata accessor for _AppExtensionProcess.Configuration(0);
  v83 = *(_QWORD *)(v22 - 8);
  v84 = v22;
  v23 = __chkstk_darwin(v22);
  v82 = &v69[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v23);
  v86 = &v69[-v25];
  v26 = (os_unfair_lock_s *)(*(_QWORD *)(v5 + 24) + 16);
  os_unfair_lock_lock(v26);
  swift_beginAccess(v5 + 32, v89, 0, 0);
  v27 = sub_10000E87C(a1, a2, *(_QWORD **)(v5 + 32));
  os_unfair_lock_unlock(v26);
  if ((v27 & 1) == 0)
  {
    v51 = type metadata accessor for _AppExtensionProcess(0);
    v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56);
    v53 = a5;
    return v52(v53, 1, 1, v51);
  }
  v77 = a5;
  v28 = sub_10000BB6C();
  swift_bridgeObjectRetain(a2);
  v29 = 0;
  v30 = sub_10000E01C((unint64_t)v28, a1, a2);
  swift_bridgeObjectRelease(v28);
  swift_bridgeObjectRelease(a2);
  if (!v30)
  {
    v51 = type metadata accessor for _AppExtensionProcess(0);
    v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56);
    v53 = v77;
    return v52(v53, 1, 1, v51);
  }
  v31 = v30;
  _AppExtensionIdentity.init(_:)();
  v32 = v86;
  _AppExtensionProcess.Configuration.init(appExtension:onInterruption:)(v21, nullsub_1, 0);
  v33 = v81;
  if (v81)
  {
    v75 = v31;
    v76 = 0;
    swift_bridgeObjectRetain(v81);
    v34 = v18;
    sub_10000C9D0(0xD000000000000011, 0x8000000100042120, v80, v33);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v35 = type metadata accessor for Logger(0);
    sub_10000A8E8(v35, (uint64_t)qword_100052B80);
    v36 = v78;
    v37 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v78 + 16);
    v37(v16, v34, v13);
    swift_bridgeObjectRetain_n(a2, 2);
    swift_bridgeObjectRetain(v33);
    v39 = Logger.logObject.getter(v38);
    v40 = static os_log_type_t.debug.getter();
    v41 = v40;
    if (os_log_type_enabled(v39, v40))
    {
      v42 = swift_slowAlloc(32, -1);
      v74 = v34;
      v43 = v42;
      v72 = swift_slowAlloc(96, -1);
      v88[0] = v72;
      *(_DWORD *)v43 = 136315650;
      v73 = v37;
      v71 = v39;
      v44 = UUID.uuidString.getter();
      v70 = v41;
      v46 = v45;
      v87 = sub_100008204(v44, v45, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v43 + 4, v43 + 12);
      swift_bridgeObjectRelease(v46);
      v47 = *(void (**)(_BYTE *, uint64_t))(v36 + 8);
      v47(v16, v13);
      *(_WORD *)(v43 + 12) = 2080;
      swift_bridgeObjectRetain(v33);
      v87 = sub_100008204(v80, (unint64_t)v33, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v43 + 14, v43 + 22);
      v37 = v73;
      swift_bridgeObjectRelease_n(v33, 3);
      *(_WORD *)(v43 + 22) = 2080;
      swift_bridgeObjectRetain(a2);
      v87 = sub_100008204(a1, a2, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, v88, v43 + 24, v43 + 32);
      swift_bridgeObjectRelease_n(a2, 3);
      v48 = v71;
      _os_log_impl((void *)&_mh_execute_header, v71, (os_log_type_t)v70, "Requesting instanceIdentifier %s for taskName %s and bundleId %s", (uint8_t *)v43, 0x20u);
      v49 = v72;
      swift_arrayDestroy(v72, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1, -1);
      v50 = v43;
      v34 = v74;
      swift_slowDealloc(v50, -1, -1);

    }
    else
    {
      v47 = *(void (**)(_BYTE *, uint64_t))(v36 + 8);
      v47(v16, v13);

      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease_n(v33, 2);
    }
    v54 = v79;
    v37(v79, v34, v13);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v54, 0, 1, v13);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v36 + 48))(v54, 1, v13) == 1)
    {
      isa = 0;
    }
    else
    {
      isa = UUID._bridgeToObjectiveC()().super.isa;
      v47(v54, v13);
    }
    v56 = objc_msgSend(objc_allocWithZone((Class)_EXExtensionInstanceIdentifier), "initWithIdentifier:", isa);

    v57 = v56;
    v58 = v86;
    _AppExtensionProcess.Configuration.instanceIdentifier.setter(v57);
    v47(v34, v13);
    v32 = v58;
    v31 = v75;
    v29 = v76;
  }
  v60 = v82;
  v59 = v83;
  v61 = v84;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v83 + 16))(v82, v32, v84);
  v62 = (uint64_t)v85;
  _AppExtensionProcess.init(configuration:)(v60);
  if (v29)
  {

    swift_errorRelease(v29);
    (*(void (**)(_BYTE *, uint64_t))(v59 + 8))(v32, v61);
    v63 = type metadata accessor for _AppExtensionProcess(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v62, 1, 1, v63);
    v64 = v77;
LABEL_18:
    sub_10000A934(v62, &qword_1000514E0);
    type metadata accessor for _AppExtensionProcess(0);
    v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56);
    v53 = v64;
    v51 = v63;
    return v52(v53, 1, 1, v51);
  }
  (*(void (**)(_BYTE *, uint64_t))(v59 + 8))(v32, v61);

  v63 = type metadata accessor for _AppExtensionProcess(0);
  v65 = *(_QWORD *)(v63 - 8);
  v66 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v65 + 56);
  v66(v62, 0, 1, v63);
  v67 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v62, 1, v63);
  v64 = v77;
  if (v67 == 1)
    goto LABEL_18;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v77, v62, v63);
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v66)(v64, 0, 1, v63);
}

void sub_10000C9D0(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = sub_100007800(&qword_1000514F0);
  __chkstk_darwin(v15);
  v8 = type metadata accessor for SHA256(0);
  __chkstk_darwin(v8);
  v14 = type metadata accessor for SHA256Digest(0);
  __chkstk_darwin(v14);
  swift_bridgeObjectRetain(a2);
  v9._countAndFlagsBits = 58;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);
  v10._countAndFlagsBits = a3;
  v10._object = a4;
  String.append(_:)(v10);
  sub_10000CE5C(a1, a2);
  v12 = v11;
  v13 = sub_10000228C(&qword_1000514F8, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256, (uint64_t)&protocol conformance descriptor for SHA256);
  dispatch thunk of HashFunction.init()(v8, v13);
  __asm { BR              X10 }
}

uint64_t sub_10000CB54()
{
  unint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;

  *(_QWORD *)(v7 - 104) = v6;
  *(_WORD *)(v7 - 96) = v0;
  *(_BYTE *)(v7 - 94) = BYTE2(v0);
  *(_BYTE *)(v7 - 93) = BYTE3(v0);
  *(_BYTE *)(v7 - 92) = BYTE4(v0);
  *(_BYTE *)(v7 - 91) = BYTE5(v0);
  dispatch thunk of HashFunction.update(bufferPointer:)(v7 - 104, v7 - 104 + BYTE6(v0), v4, v3);
  sub_10000AA84(v6, v0);
  v8 = *(_QWORD *)(v7 - 144);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of HashFunction.finalize())(v4, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 136) + 8))(v5, v4);
  sub_10000AA84(v6, v0);
  v9 = *(_QWORD *)(v7 - 120);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v9 + 16))(v2, v1, v8);
  *(_QWORD *)((char *)v2 + *(int *)(*(_QWORD *)(v7 - 128) + 36)) = 16;
  v10 = sub_10000DAD4(v2);
  sub_10000A934((uint64_t)v2, &qword_1000514F0);
  if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0)
    v10 = (uint64_t)sub_10000D6C4((_QWORD *)v10);
  v11 = *(_QWORD *)(v10 + 16);
  if (v11 < 7)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(_BYTE *)(v10 + 38) = *(_BYTE *)(v10 + 38) & 0xF | 0x50;
  if (v11 < 9)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x10000CDF0);
  }
  *(_BYTE *)(v10 + 40) = *(_BYTE *)(v10 + 40) & 0x3F | 0x80;
  v12 = objc_msgSend(objc_allocWithZone((Class)NSUUID), "initWithUUIDBytes:", v10 + 32);
  swift_bridgeObjectRelease(v10);
  ((void (*)(id))static UUID._unconditionallyBridgeFromObjectiveC(_:))(v12);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v1, v8);
}

uint64_t sub_10000CE08()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[4]);
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ExtensionKitRegistry()
{
  return objc_opt_self(_TtC7mlhostd20ExtensionKitRegistry);
}

uint64_t sub_10000CE5C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  Swift::Int v12;
  uint64_t v13;
  __int128 v17[2];
  uint64_t v18;
  __int128 v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)&v19 = a1;
  *((_QWORD *)&v19 + 1) = a2;
  swift_bridgeObjectRetain(a2);
  v2 = sub_100007800(&qword_100051508);
  if (!swift_dynamicCast(v17, &v19, &type metadata for String.UTF8View, v2, 6))
  {
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    sub_10000A934((uint64_t)v17, &qword_100051510);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v20[0] = a1;
      v20[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v7 = (char *)v20 + (HIBYTE(a2) & 0xF);
      v8 = v20;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v6 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v5 = _StringObject.sharedUTF8.getter(a1, a2);
      }
      if (v5)
        v7 = (_BYTE *)(v5 + v6);
      else
        v7 = 0;
      v8 = (_BYTE *)v5;
    }
    v9 = sub_10000E3BC(v8, v7);
    v11 = v10;
    if (v10 >> 60 != 15)
    {
      swift_bridgeObjectRelease(a2);
      *(_QWORD *)&v17[0] = v9;
      *((_QWORD *)&v17[0] + 1) = v11;
      return *(_QWORD *)&v17[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v12 = String.UTF8View._foreignCount()();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v12 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v12 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v17[0] = sub_10000E420(v12);
    *((_QWORD *)&v17[0] + 1) = v13;
    __chkstk_darwin(*(_QWORD *)&v17[0]);
    sub_10000D360();
    __asm { BR              X12 }
  }
  sub_10000E518(v17, (uint64_t)v20);
  v3 = v21;
  v4 = v22;
  sub_10000A980(v20, v21);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(&v19, sub_10000D650, 0, &type metadata for Data._Representation, v3, v4);
  swift_bridgeObjectRelease(a2);
  v17[0] = v19;
  sub_10000A9A4(v20);
  return *(_QWORD *)&v17[0];
}

void sub_10000D360()
{
  __asm { BR              X11 }
}

_QWORD *sub_10000D3C0@<X0>(uint64_t a1@<X8>)
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

_BYTE *sub_10000D650@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)sub_10000E204(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_10000E2C4((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_10000E33C((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_10000D6C4(_QWORD *a1)
{
  return sub_100019504(0, a1[2], 0, a1);
}

_QWORD *sub_10000D6D8(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
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

char *sub_10000D73C(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
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

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)__DataStorage._offset.getter();
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
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_10000D7E8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000E588();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100007800(&qword_100051520);
          v13 = sub_10000D9E0(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10000E54C();
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_10000D9E0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10000DA60(v6, a2, a3);
  return sub_10000DA34;
}

void sub_10000DA34(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10000DA60(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_10000DACC;
  }
  __break(1u);
  return result;
}

void sub_10000DACC(id *a1)
{

}

uint64_t sub_10000DAD4(_QWORD *a1)
{
  size_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  size_t v21;
  unint64_t v22;
  size_t v23;
  BOOL v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v3 = type metadata accessor for SHA256Digest(0);
  __chkstk_darwin(v3);
  (*(void (**)(char *, _QWORD *, uint64_t))(v5 + 16))((char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  v6 = sub_10000228C(&qword_100051500, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256Digest, (uint64_t)&protocol conformance descriptor for SHA256Digest);
  dispatch thunk of Sequence.makeIterator()(&v31, v3, v6);
  result = sub_100007800(&qword_1000514F0);
  v8 = *(_QWORD *)((char *)a1 + *(int *)(result + 36));
  v9 = v31;
  if (!v8 || (v10 = v32, v11 = *(_QWORD *)(v31 + 16), v32 == v11))
  {
    result = swift_bridgeObjectRelease(v31);
    v1 = 0;
    a1 = _swiftEmptyArrayStorage;
    goto LABEL_27;
  }
  if ((v32 & 0x8000000000000000) == 0)
  {
    if (v32 < *(_QWORD *)(v31 + 16))
    {
      v1 = 0;
      a1 = _swiftEmptyArrayStorage;
      v12 = v8 - 1;
      v13 = &_swiftEmptyArrayStorage[4];
      v14 = v11 - 1;
      v30 = v14;
      while (1)
      {
        v15 = *(_BYTE *)(v9 + v10 + 32);
        if (!v1)
        {
          v16 = a1[3];
          if ((uint64_t)((v16 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_32;
          v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
          if (v17 <= 1)
            v18 = 1;
          else
            v18 = v17;
          v19 = sub_100007800(&qword_1000512A8);
          v20 = (_QWORD *)swift_allocObject(v19, v18 + 32, 7);
          v21 = 2 * j__malloc_size(v20) - 64;
          v20[2] = v18;
          v20[3] = v21;
          v22 = (unint64_t)(v20 + 4);
          v23 = a1[3] >> 1;
          if (a1[2])
          {
            if (v20 != a1 || v22 >= (unint64_t)a1 + v23 + 32)
              memmove(v20 + 4, a1 + 4, v23);
            a1[2] = 0;
          }
          v13 = (_BYTE *)(v22 + v23);
          v1 = (v21 >> 1) - v23;
          result = swift_release(a1);
          a1 = v20;
          v14 = v30;
        }
        v25 = __OFSUB__(v1--, 1);
        if (v25)
          break;
        *v13 = v15;
        if (!v12 || v14 == v10)
          goto LABEL_26;
        ++v10;
        ++v13;
        --v12;
        if (v10 >= *(_QWORD *)(v9 + 16))
          goto LABEL_25;
      }
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
LABEL_25:
    __break(1u);
LABEL_26:
    result = swift_bridgeObjectRelease(v9);
LABEL_27:
    v26 = a1[3];
    if (v26 < 2)
      return (uint64_t)a1;
    v27 = v26 >> 1;
    v25 = __OFSUB__(v27, v1);
    v28 = v27 - v1;
    if (!v25)
    {
      a1[2] = v28;
      return (uint64_t)a1;
    }
    goto LABEL_33;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_10000DD18(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = __DataStorage._bytes.getter();
  v5 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v5 += a1 - result;
  }
  v6 = __OFSUB__(a2, a1);
  v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  v8 = __DataStorage._length.getter();
  if (v8 >= v7)
    v9 = v7;
  else
    v9 = v8;
  v10 = v5 + v9;
  if (v5)
    v11 = v10;
  else
    v11 = 0;
  v12 = type metadata accessor for SHA256(0);
  v13 = sub_10000228C(&qword_1000514F8, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256, (uint64_t)&protocol conformance descriptor for SHA256);
  return dispatch thunk of HashFunction.update(bufferPointer:)(v5, v11, v12, v13);
}

uint64_t sub_10000DDDC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if (result)
  {
    v5 = result;
    v8 = *a3;
    v7 = a3[1];
    swift_bridgeObjectRetain(v7);
    result = _StringGuts.copyUTF8(into:)(v5, a2, v8, v7);
    if ((v9 & 1) == 0)
    {
      v10 = result;
      result = swift_bridgeObjectRelease(v7);
      *a4 = 0;
      a4[1] = 0xE000000000000000;
      a4[2] = 15;
      a4[3] = v10;
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

_QWORD *sub_10000DE64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  if ((unint64_t)a1 >> 62)
    goto LABEL_22;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      v6 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
LABEL_9:
        v8 = v7;
        v9 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_21;
        v10 = v5;
        v11 = objc_msgSend(v7, "extensionPointIdentifier");
        v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
        v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          v17 = swift_bridgeObjectRelease(a3);
LABEL_17:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
          v18 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
          v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v8);
          specialized ContiguousArray._endMutation()(v19);
          goto LABEL_5;
        }
        v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, a2, a3, 0);
        v17 = swift_bridgeObjectRelease(v14);
        if ((v16 & 1) != 0)
          goto LABEL_17;

LABEL_5:
        ++v6;
        v5 = v10;
        if (v9 == v10)
          return _swiftEmptyArrayStorage;
      }
      if (v6 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      if (a1 < 0)
        v21 = a1;
      else
        v21 = a1 & 0xFFFFFFFFFFFFFF8;
      v5 = _CocoaArrayWrapper.endIndex.getter(v21);
      if (!v5)
        return _swiftEmptyArrayStorage;
    }
    v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_10000E01C(unint64_t a1, uint64_t a2, uint64_t a3)
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
      v15 = objc_msgSend(v10, "bundleIdentifier", v23);
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
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

uint64_t sub_10000E1C0(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000E204(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;

  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_10000E2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (a1)
    v3 = a2 - a1;
  else
    v3 = 0;
  v4 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = type metadata accessor for Data.RangeReference(0);
    result = swift_allocObject(v6, 32, 7);
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v3;
  }
  return result;
}

uint64_t sub_10000E33C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  if (a1)
    v3 = a2 - a1;
  else
    v3 = 0;
  v4 = type metadata accessor for __DataStorage(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v3 & 0x80000000) == 0)
    return v3 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_10000E3BC(_BYTE *result, _BYTE *a2)
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
      return (_BYTE *)sub_10000E204(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_10000E2C4((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_10000E33C((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_10000E420(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

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
      v2 = type metadata accessor for __DataStorage(0);
      swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
      __DataStorage.init(length:)(v1);
      if (v1 >= 0x7FFFFFFF)
      {
        v3 = type metadata accessor for Data.RangeReference(0);
        result = swift_allocObject(v3, 32, 7);
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

_QWORD *sub_10000E4BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
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
  result = sub_10000D6D8((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_10000E530, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_10000E518(__int128 *a1, uint64_t a2)
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

uint64_t sub_10000E530@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_10000DDDC(a1, a2, *(uint64_t **)(v3 + 16), a3);
}

unint64_t sub_10000E54C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051518;
  if (!qword_100051518)
  {
    v1 = objc_opt_self(_EXExtensionIdentity);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100051518);
  }
  return result;
}

unint64_t sub_10000E588()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051528;
  if (!qword_100051528)
  {
    v1 = sub_10000AA40(&qword_100051520);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100051528);
  }
  return result;
}

uint64_t sub_10000E5D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
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
  uint64_t v19;

  v4 = v3;
  v8 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MLHostTask(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_10000A934(a1, &qword_100051638);
    sub_10001981C(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease(a3);
    return sub_10000A934((uint64_t)v10, &qword_100051638);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v19 = *v4;
    *v4 = 0x8000000000000000;
    sub_10002B224((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    v17 = *v4;
    *v4 = v19;
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v17);
  }
}

uint64_t sub_10000E748(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_10000E87C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000E940()
{
  uint64_t v0;
  uint64_t inited;
  NSString *v2;
  unint64_t result;
  _BYTE v4[72];

  v0 = sub_100007800(&qword_100051690);
  inited = swift_initStackObject(v0, v4);
  *(_OWORD *)(inited + 16) = xmmword_100038D20;
  *(_QWORD *)(inited + 64) = &type metadata for Int;
  *(_QWORD *)(inited + 32) = NSFilePosixPermissions;
  *(_QWORD *)(inited + 40) = 448;
  v2 = NSFilePosixPermissions;
  result = sub_10001D8D0(inited);
  qword_100051538 = result;
  return result;
}

uint64_t sub_10000E9B8(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  __n128 v20;
  void (*v21)(char *, uint64_t);
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  __n128 v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  char *v37;
  id v38;
  NSObject *v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  NSString v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  Class isa;
  unsigned __int8 v64;
  void (*v65)(char *, uint64_t, uint64_t, uint64_t);
  void (*v66)(char *, uint64_t, uint64_t, uint64_t);
  id v67;
  uint64_t v68;
  NSString v69;
  Class v70;
  unsigned int v71;
  void (*v72)(char *, uint64_t, uint64_t, uint64_t);
  void (*v73)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  void (**v81)(char *, uint64_t, uint64_t, uint64_t);
  void (*v82)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v83;
  void (*v85)(char *, uint64_t, uint64_t);
  uint64_t v86;
  unint64_t v87;
  void (*v88)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v89;
  char *v90;
  __int128 v91;
  char *v92;
  char v93;
  void (*v94)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v95;
  uint64_t v96;

  v90 = a2;
  v92 = a3;
  *(_QWORD *)&v91 = a1;
  v3 = type metadata accessor for URL.DirectoryHint(0);
  v86 = *(_QWORD *)(v3 - 8);
  v4 = v86;
  __chkstk_darwin(v3);
  v6 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v7);
  v9 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v85 - v15;
  v88 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v88(v9, 1, 1, v10);
  v17 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v18(v6, enum case for URL.DirectoryHint.inferFromPath(_:), v3);
  v85 = v18;
  v19 = v90;
  v20 = swift_bridgeObjectRetain(v90);
  URL.init(filePath:directoryHint:relativeTo:)(v91, v19, v6, v9, v20);
  v94 = (void (*)(char *, uint64_t, uint64_t, uint64_t))0xD00000000000001BLL;
  v95 = 0x80000001000422A0;
  v18(v6, v17, v3);
  v87 = sub_10001CF54();
  URL.appending<A>(path:directoryHint:)(&v94, v6, &type metadata for String, v87);
  v86 = *(_QWORD *)(v86 + 8);
  ((void (*)(char *, uint64_t))v86)(v6, v3);
  swift_bridgeObjectRelease(v95);
  v21 = *(void (**)(char *, uint64_t))(v11 + 8);
  v21(v14, v10);
  v22 = URL.path(percentEncoded:)(0);
  v21(v16, v10);
  v23 = v89;
  *(Swift::String *)(v89 + 24) = v22;
  v24 = v23;
  v88(v9, 1, 1, v10);
  v25 = v85;
  v26.n128_f64[0] = ((double (*)(char *, uint64_t, uint64_t))v85)(v6, v17, v3);
  URL.init(filePath:directoryHint:relativeTo:)(v91, v90, v6, v9, v26);
  v94 = (void (*)(char *, uint64_t, uint64_t, uint64_t))0xD00000000000001FLL;
  v95 = 0x80000001000422C0;
  v25(v6, v17, v3);
  URL.appending<A>(path:directoryHint:)(&v94, v6, &type metadata for String, v87);
  ((void (*)(char *, uint64_t))v86)(v6, v3);
  swift_bridgeObjectRelease(v95);
  v21(v14, v10);
  v27 = URL.path(percentEncoded:)(0);
  v21(v16, v10);
  *(Swift::String *)(v24 + 40) = v27;
  v28 = sub_100007800(&qword_1000512E8);
  v29 = swift_allocObject(v28, 20, 7);
  *(_DWORD *)(v29 + 16) = 0;
  *(_QWORD *)(v24 + 56) = v29;
  v30 = (void (*)(char *, uint64_t, uint64_t, uint64_t))_swiftEmptyArrayStorage;
  *(_QWORD *)(v24 + 64) = sub_10001D9FC((uint64_t)_swiftEmptyArrayStorage);
  v31 = (id)((uint64_t (*)(void))BiomeLibrary)();
  v32 = objc_msgSend(v31, "Lighthouse");
  swift_unknownObjectRelease(v31);
  v33 = objc_msgSend(v32, "Ledger");
  swift_unknownObjectRelease(v32);
  v34 = objc_msgSend(v33, "TaskStatus");
  v35 = swift_unknownObjectRelease(v33);
  *(_QWORD *)(v24 + 72) = v34;
  v36 = (id)BiomeLibrary(v35);
  v37 = v92;
  v38 = objc_msgSend(v36, "Lighthouse");
  swift_unknownObjectRelease(v36);
  v39 = objc_msgSend(v38, "Ledger");
  swift_unknownObjectRelease(v38);
  v40 = -[NSObject TaskError](v39, "TaskError");
  swift_unknownObjectRelease(v39);
  *(_QWORD *)(v24 + 80) = v40;
  v42 = *((_QWORD *)v37 + 2);
  if (!v42)
    goto LABEL_21;
  v43 = 0;
  v44 = v37 + 40;
  v87 = v42 - 1;
  *(_QWORD *)&v41 = 136315138;
  v91 = v41;
  v90 = (char *)&type metadata for Any + 8;
  do
  {
    v88 = v30;
    v45 = (unint64_t *)&v44[16 * v43];
    v46 = v43;
    while (1)
    {
      if (v46 >= *((_QWORD *)v37 + 2))
      {
        __break(1u);
        goto LABEL_32;
      }
      v48 = *(v45 - 1);
      v47 = *v45;
      v93 = 1;
      v49 = (void *)objc_opt_self(NSFileManager);
      v39 = objc_msgSend(v49, "defaultManager", swift_bridgeObjectRetain(v47).n128_f64[0]);
      v50 = String._bridgeToObjectiveC()();
      v51 = -[NSObject fileExistsAtPath:isDirectory:](v39, "fileExistsAtPath:isDirectory:", v50, &v93);

      if (!v51)
      {
        if (qword_100050F28 != -1)
          swift_once(&qword_100050F28, sub_10001E040);
        v52 = type metadata accessor for Logger(0);
        sub_10000A8E8(v52, (uint64_t)qword_100052B80);
        v53 = swift_bridgeObjectRetain_n(v47, 2);
        v39 = Logger.logObject.getter(v53);
        v54 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v39, v54))
        {
          v55 = swift_slowAlloc(12, -1);
          v56 = swift_slowAlloc(32, -1);
          v96 = v56;
          *(_DWORD *)v55 = v91;
          swift_bridgeObjectRetain(v47);
          *(_QWORD *)(v55 + 4) = sub_100008204(v48, v47, &v96);
          swift_bridgeObjectRelease_n(v47, 3);
          _os_log_impl((void *)&_mh_execute_header, v39, v54, "Skipping staticTask folder %s because doesn't exist.", (uint8_t *)v55, 0xCu);
          swift_arrayDestroy(v56, 1, v90);
          swift_slowDealloc(v56, -1, -1);
          swift_slowDealloc(v55, -1, -1);
          swift_bridgeObjectRelease(v47);

        }
        else
        {

          swift_bridgeObjectRelease_n(v47, 3);
        }
        goto LABEL_5;
      }
      if ((v93 & 1) != 0)
        break;
      swift_bridgeObjectRelease(v47);
LABEL_5:
      v37 = v92;
      ++v46;
      v45 += 2;
      if (v42 == v46)
      {
        v30 = v88;
        goto LABEL_21;
      }
    }
    v30 = v88;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v88);
    v94 = v30;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_10001A14C(0, *((_QWORD *)v30 + 2) + 1, 1);
      v30 = v94;
    }
    v59 = *((_QWORD *)v30 + 2);
    v58 = *((_QWORD *)v30 + 3);
    v39 = (v59 + 1);
    if (v59 >= v58 >> 1)
    {
      sub_10001A14C(v58 > 1, v59 + 1, 1);
      v30 = v94;
    }
    v43 = v46 + 1;
    *((_QWORD *)v30 + 2) = v39;
    v60 = (_QWORD *)((char *)v30 + 16 * v59);
    v60[4] = v48;
    v60[5] = v47;
    v37 = v92;
  }
  while (v87 != v46);
LABEL_21:
  swift_bridgeObjectRelease(v37);
  v61 = v89;
  *(_QWORD *)(v89 + 16) = v30;
  v39 = objc_opt_self(NSFileManager);
  v44 = (char *)-[NSObject defaultManager](v39, "defaultManager");
  v62 = *(_QWORD *)(v61 + 32);
  swift_bridgeObjectRetain(v62);
  v37 = (char *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v62);
  if (qword_100050F20 != -1)
LABEL_32:
    swift_once(&qword_100050F20, sub_10000E940);
  type metadata accessor for FileAttributeKey(0);
  sub_10000228C(&qword_100051008, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10003881C);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v94 = 0;
  v64 = objc_msgSend(v44, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v37, 1, isa, &v94);

  v65 = v94;
  if ((v64 & 1) == 0)
    goto LABEL_25;
  v66 = v94;
  v67 = -[NSObject defaultManager](v39, "defaultManager");
  v68 = *(_QWORD *)(v89 + 48);
  swift_bridgeObjectRetain(v68);
  v69 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v68);
  v70 = Dictionary._bridgeToObjectiveC()().super.isa;
  v94 = 0;
  v71 = objc_msgSend(v67, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v69, 1, v70, &v94);

  v65 = v94;
  if (v71)
  {
    v72 = v94;
  }
  else
  {
LABEL_25:
    v73 = v65;
    v74 = _convertNSErrorToError(_:)(v65);

    swift_willThrow(v75);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v76 = type metadata accessor for Logger(0);
    sub_10000A8E8(v76, (uint64_t)qword_100052B80);
    swift_errorRetain(v74);
    v77 = swift_errorRetain(v74);
    v78 = Logger.logObject.getter(v77);
    v79 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v78, v79))
    {
      v80 = (uint8_t *)swift_slowAlloc(12, -1);
      v81 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v80 = 138412290;
      swift_errorRetain(v74);
      v82 = (void (*)(char *, uint64_t, uint64_t, uint64_t))_swift_stdlib_bridgeErrorToNSError(v74);
      v94 = v82;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, &v95, v80 + 4, v80 + 12);
      *v81 = v82;
      swift_errorRelease(v74);
      swift_errorRelease(v74);
      _os_log_impl((void *)&_mh_execute_header, v78, v79, "Failed at creating folder: %@", v80, 0xCu);
      v83 = sub_100007800(&qword_100051288);
      swift_arrayDestroy((void (**)(char *, uint64_t, uint64_t, uint64_t))v81, 1, v83);
      swift_slowDealloc((void (**)(char *, uint64_t, uint64_t, uint64_t))v81, -1, -1);
      swift_slowDealloc(v80, -1, -1);

      swift_errorRelease(v74);
    }
    else
    {
      swift_errorRelease(v74);
      swift_errorRelease(v74);
      swift_errorRelease(v74);

    }
  }
  return v89;
}

uint64_t sub_10000F424()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  os_unfair_lock_s *v7;
  Swift::String v8;
  void *object;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  void *v14;
  Swift::String v15;
  uint64_t v16;
  void *v17;
  Swift::String v18;
  Swift::String v19;
  void *v20;
  uint64_t v21;
  Swift::String v22;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  v24[0] = 0;
  v24[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(49);
  v3 = _typeName(_:qualified:)(v2, 0);
  v5 = v4;
  swift_bridgeObjectRelease(0xE000000000000000);
  v25 = v3;
  v26 = v5;
  v6._countAndFlagsBits = 0x203A736B73617428;
  v6._object = (void *)0xE800000000000000;
  String.append(_:)(v6);
  v7 = (os_unfair_lock_s *)(v0[7] + 16);
  os_unfair_lock_lock(v7);
  swift_beginAccess(v1 + 8, v24, 0, 0);
  os_unfair_lock_unlock(v7);
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(object);
  v10._countAndFlagsBits = 0x636974617473202CLL;
  v10._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v10);
  v11 = v1[2];
  v12 = swift_bridgeObjectRetain(v11);
  v13._countAndFlagsBits = Array.description.getter(v12, &type metadata for String);
  v14 = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  v15._countAndFlagsBits = 0x696D616E7964202CLL;
  v15._object = (void *)0xEB00000000203A63;
  String.append(_:)(v15);
  v16 = v1[3];
  v17 = (void *)v1[4];
  swift_bridgeObjectRetain(v17);
  v18._countAndFlagsBits = v16;
  v18._object = v17;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(v17);
  v19._countAndFlagsBits = 0x737465737361202CLL;
  v19._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v19);
  v21 = v1[5];
  v20 = (void *)v1[6];
  swift_bridgeObjectRetain(v20);
  v22._countAndFlagsBits = v21;
  v22._object = v20;
  String.append(_:)(v22);
  swift_bridgeObjectRelease(v20);
  return v25;
}

void *sub_10000F5F0()
{
  id v0;
  NSString v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v0 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v1 = String._bridgeToObjectiveC()();
  v21 = 0;
  v2 = objc_msgSend(v0, "contentsOfDirectoryAtPath:error:", v1, &v21);

  v3 = v21;
  if (v2)
  {
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String);
    v5 = v3;

    v6 = *(_QWORD *)(v4 + 16);
    if (v6)
    {
      v7 = (_QWORD *)(v4 + 40);
      v8 = _swiftEmptyArrayStorage;
      do
      {
        v10 = *(v7 - 1);
        v9 = *v7;
        swift_bridgeObjectRetain(*v7);
        v11._countAndFlagsBits = 0x7473696C702ELL;
        v11._object = (void *)0xE600000000000000;
        if (String.hasSuffix(_:)(v11))
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
          v21 = v8;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_10001A14C(0, v8[2] + 1, 1);
            v8 = v21;
          }
          v14 = v8[2];
          v13 = v8[3];
          if (v14 >= v13 >> 1)
          {
            sub_10001A14C(v13 > 1, v14 + 1, 1);
            v8 = v21;
          }
          v8[2] = v14 + 1;
          v15 = &v8[2 * v14];
          v15[4] = v10;
          v15[5] = v9;
        }
        else
        {
          swift_bridgeObjectRelease(v9);
        }
        v7 += 2;
        --v6;
      }
      while (v6);
    }
    else
    {
      v8 = _swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease(v4);
    v19 = sub_10002C418((uint64_t)v8);
    swift_release(v8);
  }
  else
  {
    v16 = v21;
    v17 = _convertNSErrorToError(_:)(v3);

    swift_willThrow(v18);
    swift_errorRelease(v17);
    return &_swiftEmptySetSingleton;
  }
  return (void *)v19;
}

uint64_t sub_10000F7F8()
{
  uint64_t v0;
  id v1;
  NSString v2;
  void *v3;
  uint64_t result;
  id v5;
  NSString v6;
  void *v7;
  void **v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *, uint64_t);
  void *v11;
  uint64_t (*v12)();
  uint64_t v13;

  v1 = objc_msgSend(*(id *)(v0 + 72), "pruner");
  v2 = String._bridgeToObjectiveC()();
  v12 = sub_10000F9D8;
  v13 = 0;
  v8 = _NSConcreteStackBlock;
  v9 = 1107296256;
  v10 = sub_10001D2EC;
  v11 = &unk_10004DD28;
  v3 = _Block_copy(&v8);
  swift_release(v13);
  objc_msgSend(v1, "deleteWithPolicy:eventsPassingTest:", v2, v3);

  _Block_release(v3);
  result = swift_isEscapingClosureAtFileLocation(0, "", 85, 114, 66, 1);
  if ((result & 1) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  v5 = objc_msgSend(*(id *)(v0 + 80), "pruner");
  v6 = String._bridgeToObjectiveC()();
  v12 = sub_10000F9D8;
  v13 = 0;
  v8 = _NSConcreteStackBlock;
  v9 = 1107296256;
  v10 = sub_10000F9E0;
  v11 = &unk_10004DD50;
  v7 = _Block_copy(&v8);
  swift_release(v13);
  objc_msgSend(v5, "deleteWithPolicy:eventsPassingTest:", v6, v7);

  _Block_release(v7);
  result = swift_isEscapingClosureAtFileLocation(0, "", 85, 118, 65, 1);
  if ((result & 1) != 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_10000F9D8()
{
  return 1;
}

uint64_t sub_10000F9E0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v5)(void *, uint64_t);
  id v6;

  v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

uint64_t sub_10000FA34(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v7;
  _BYTE v8[24];

  v2 = (uint64_t *)(a1 + 64);
  swift_beginAccess(a1 + 64, v8, 33, 0);
  v3 = *(_QWORD *)(a1 + 64);
  if (*(_QWORD *)(v3 + 16))
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v3);
    v7 = *v2;
    *v2 = 0x8000000000000000;
    sub_100007800(&qword_1000516B8);
    _NativeDictionary.removeAll(isUnique:)(isUniquelyReferenced_nonNull_native);
    v5 = *v2;
    *v2 = v7;
    swift_bridgeObjectRelease(v5);
  }
  return swift_endAccess(v8);
}

uint64_t sub_10000FAD8(uint64_t a1, unint64_t a2)
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  char v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  __n128 v50;
  char *v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  void *object;
  void *v57;
  __objc2_prot *v58;
  id v59;
  NSString v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  _BOOL4 v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  void *v78;
  uint64_t v80;
  os_unfair_lock_s *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  id v85;
  NSString v86;
  unsigned int v87;
  id v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  uint8_t *v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  id v101;
  NSObject *v102;
  os_log_type_t v103;
  uint8_t *v104;
  _QWORD *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  os_unfair_lock_s *v111;
  uint64_t v112;
  void *v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  char *v118;
  char *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  id v128;
  id v129;
  _QWORD v130[2];
  id v131;
  unint64_t v132;

  v5 = type metadata accessor for URL.DirectoryHint(0);
  v122 = *(_QWORD *)(v5 - 8);
  v123 = v5;
  __chkstk_darwin(v5);
  v121 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v7);
  v117 = (char *)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = type metadata accessor for URL(0);
  v125 = *(_QWORD *)(v120 - 8);
  v9 = __chkstk_darwin(v120);
  v118 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v119 = (char *)&v109 - v11;
  v12 = type metadata accessor for TaskType(0);
  v124 = *(_QWORD *)(v12 - 8);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v109 - v16;
  v18 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v18);
  v20 = (char *)&v109 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for MLHostTask(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v127 = (char *)&v109 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + 56) + 16);
  os_unfair_lock_lock(v24);
  swift_beginAccess(v2 + 64, &v131, 32, 0);
  v126 = v2;
  v25 = *(_QWORD *)(v2 + 64);
  if (*(_QWORD *)(v25 + 16))
  {
    swift_bridgeObjectRetain(a2);
    v26 = sub_1000088BC(a1, a2);
    if ((v27 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v22 + 16))(v20, *(_QWORD *)(v25 + 56) + *(_QWORD *)(v22 + 72) * v26, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v20, 0, 1, v21);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
    }
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
  }
  swift_endAccess(&v131);
  os_unfair_lock_unlock(v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_10000A934((uint64_t)v20, &qword_100051638);
LABEL_22:
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v73 = type metadata accessor for Logger(0);
    sub_10000A8E8(v73, (uint64_t)qword_100052B80);
    v74 = swift_bridgeObjectRetain_n(a2, 2);
    v75 = Logger.logObject.getter(v74);
    v76 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v75, v76))
    {
      v77 = (uint8_t *)swift_slowAlloc(12, -1);
      v78 = (void *)swift_slowAlloc(32, -1);
      v131 = v78;
      *(_DWORD *)v77 = 136315138;
      swift_bridgeObjectRetain(a2);
      v129 = (id)sub_100008204(a1, a2, (uint64_t *)&v131);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, v130, v77 + 4, v77 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "DynamicTask %s not found in registry.", v77, 0xCu);
      swift_arrayDestroy(v78, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v78, -1, -1);
      swift_slowDealloc(v77, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(a2, 2);
    }

    return 0;
  }
  v111 = v24;
  v28 = v127;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v127, v20, v21);
  v29 = v22;
  v30 = sub_10000F5F0();
  swift_bridgeObjectRetain(a2);
  v115 = a1;
  v113 = (void *)sub_10001B290((uint64_t)v30, a1, a2);
  v32 = v31;
  v116 = a2;
  swift_bridgeObjectRelease(a2);
  v33 = swift_bridgeObjectRelease(v30);
  v114 = v32;
  if (!v32)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v21);
    goto LABEL_21;
  }
  v110 = v29;
  v112 = v21;
  MLHostTask.taskType.getter(v33);
  v34 = v124;
  (*(void (**)(char *, _QWORD, uint64_t))(v124 + 104))(v15, enum case for TaskType.dynamicTask(_:), v12);
  v35 = sub_10000228C(&qword_100051670, (uint64_t (*)(uint64_t))&type metadata accessor for TaskType, (uint64_t)&protocol conformance descriptor for TaskType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v131, v12, v35);
  dispatch thunk of RawRepresentable.rawValue.getter(&v129, v12, v35);
  v36 = v132;
  v37 = v130[0];
  if (v131 != v129 || v132 != v130[0])
  {
    v39 = _stringCompareWithSmolCheck(_:_:expecting:)(v131, v132, v129, v130[0], 0);
    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease(v36);
    v40 = *(void (**)(char *, uint64_t))(v34 + 8);
    v40(v15, v12);
    v40(v17, v12);
    if ((v39 & 1) != 0)
      goto LABEL_15;
    (*(void (**)(char *, uint64_t))(v110 + 8))(v28, v112);
    swift_bridgeObjectRelease(v114);
LABEL_21:
    a1 = v115;
    a2 = v116;
    goto LABEL_22;
  }
  swift_bridgeObjectRelease_n(v132, 2);
  v38 = *(void (**)(char *, uint64_t))(v34 + 8);
  v38(v15, v12);
  v38(v17, v12);
LABEL_15:
  v124 = 0;
  v41 = *(_QWORD *)(v126 + 24);
  v42 = *(_QWORD *)(v126 + 32);
  v43 = v117;
  v44 = v120;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v125 + 56))(v117, 1, 1, v120);
  v45 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v47 = v121;
  v46 = v122;
  v48 = *(void (**)(char *, uint64_t, uint64_t))(v122 + 104);
  v49 = v123;
  v48(v121, enum case for URL.DirectoryHint.inferFromPath(_:), v123);
  v50 = swift_bridgeObjectRetain(v42);
  v51 = v118;
  URL.init(filePath:directoryHint:relativeTo:)(v41, v42, v47, v43, v50);
  v52 = v114;
  v131 = v113;
  v132 = v114;
  v48(v47, v45, v49);
  v53 = sub_10001CF54();
  v54 = v119;
  URL.appending<A>(path:directoryHint:)(&v131, v47, &type metadata for String, v53);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v49);
  v55 = *(void (**)(char *, uint64_t))(v125 + 8);
  v55(v51, v44);
  object = URL.path(percentEncoded:)(0)._object;
  v55(v54, v44);
  v57 = (void *)objc_opt_self(NSFileManager);
  v58 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  v59 = objc_msgSend(v57, "defaultManager");
  v60 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v131 = 0;
  LODWORD(object) = objc_msgSend(v59, "removeItemAtPath:error:", v60, &v131);

  v61 = v131;
  if (!(_DWORD)object)
    goto LABEL_34;
  v62 = qword_100050F28;
  v63 = v131;
  if (v62 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v64 = type metadata accessor for Logger(0);
  sub_10000A8E8(v64, (uint64_t)qword_100052B80);
  swift_bridgeObjectRetain(v52);
  v66 = Logger.logObject.getter(v65);
  v67 = static os_log_type_t.info.getter();
  v68 = os_log_type_enabled(v66, v67);
  v69 = v116;
  if (v68)
  {
    v70 = v116;
    v71 = (uint8_t *)swift_slowAlloc(12, -1);
    v72 = (void *)swift_slowAlloc(32, -1);
    v131 = v72;
    *(_DWORD *)v71 = 136315138;
    swift_bridgeObjectRetain(v52);
    v129 = (id)sub_100008204((uint64_t)v113, v52, (uint64_t *)&v131);
    v69 = v70;
    v58 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, v130, v71 + 4, v71 + 12);
    swift_bridgeObjectRelease_n(v52, 3);
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "Removed task definition: %s", v71, 0xCu);
    swift_arrayDestroy(v72, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v72, -1, -1);
    swift_slowDealloc(v71, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v52, 2);
  }

  v80 = v112;
  v81 = v111;
  v82 = MLHostTask.taskFolder.getter();
  if (!v83)
    goto LABEL_42;
  v84 = v82;
  v52 = v83;
  v85 = objc_msgSend(v57, (SEL)v58[42].isa);
  v86 = String._bridgeToObjectiveC()();
  v131 = 0;
  v87 = objc_msgSend(v85, "removeItemAtPath:error:", v86, &v131);

  v61 = v131;
  if (!v87)
  {
LABEL_34:
    v94 = v61;
    swift_bridgeObjectRelease(v52);
    v95 = (void *)_convertNSErrorToError(_:)(v61);

    swift_willThrow(v96);
    v131 = v95;
    v97 = sub_100007800(&qword_100051620);
    v98 = sub_10000AB78(0, &qword_100051628, NSError_ptr);
    swift_dynamicCast(&v129, &v131, v97, v98, 0);
    v99 = v129;
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v100 = type metadata accessor for Logger(0);
    sub_10000A8E8(v100, (uint64_t)qword_100052B80);
    v101 = v99;
    v102 = Logger.logObject.getter(v101);
    v103 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v102, v103))
    {
      v104 = (uint8_t *)swift_slowAlloc(12, -1);
      v105 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v104 = 138412290;
      v128 = v101;
      v106 = v101;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v128, &v129, v104 + 4, v104 + 12);
      *v105 = v101;

      _os_log_impl((void *)&_mh_execute_header, v102, v103, "Failed removing items: %@", v104, 0xCu);
      v107 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v105, 1, v107);
      swift_slowDealloc(v105, -1, -1);
      swift_slowDealloc(v104, -1, -1);
    }
    else
    {

    }
    v108 = v112;

    (*(void (**)(char *, uint64_t))(v110 + 8))(v127, v108);
    swift_errorRelease(v131);
    return 0;
  }
  v88 = v131;
  swift_bridgeObjectRetain(v52);
  v90 = Logger.logObject.getter(v89);
  v91 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v90, v91))
  {
    v92 = (uint8_t *)swift_slowAlloc(12, -1);
    v93 = (void *)swift_slowAlloc(32, -1);
    v131 = v93;
    *(_DWORD *)v92 = 136315138;
    swift_bridgeObjectRetain(v52);
    v129 = (id)sub_100008204(v84, v52, (uint64_t *)&v131);
    v81 = v111;
    v80 = v112;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, v130, v92 + 4, v92 + 12);
    swift_bridgeObjectRelease_n(v52, 3);
    _os_log_impl((void *)&_mh_execute_header, v90, v91, "Removed task folder: %s", v92, 0xCu);
    swift_arrayDestroy(v93, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v93, -1, -1);
    swift_slowDealloc(v92, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v52, 2);
  }

LABEL_42:
  os_unfair_lock_lock(v81);
  sub_1000107D0(v126, v115, v69);
  os_unfair_lock_unlock(v81);
  (*(void (**)(char *, uint64_t))(v110 + 8))(v127, v80);
  return 1;
}

uint64_t sub_1000107D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v11[24];

  v6 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v6);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_beginAccess(a1 + 64, v11, 33, 0);
  sub_10001981C(a2, a3, (uint64_t)v8);
  swift_endAccess(v11);
  return sub_10000A934((uint64_t)v8, &qword_100051638);
}

_QWORD *sub_100010890()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  os_unfair_lock_s *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  v1 = sub_1000109EC();
  v2 = v1;
  if (v1[2])
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 56) + 16);
    os_unfair_lock_lock(v3);
    sub_10001196C((uint64_t)v2, v0);
    os_unfair_lock_unlock(v3);
    swift_bridgeObjectRetain(v2);
    v4 = sub_10001B5EC(v0, v2);
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    swift_bridgeObjectRelease(v1);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_10000A8E8(v5, (uint64_t)qword_100052B80);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "No task pruned. Skipping cleanup.", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    return _swiftEmptyArrayStorage;
  }
  return v2;
}

_QWORD *sub_1000109EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  __n128 v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t i;
  BOOL v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  __n128 v46;
  char *v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  Swift::String v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char v72;
  uint64_t v73;
  char v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint64_t v85;
  void *v86;
  __n128 v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  char *v91;
  void (*v92)(char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  id v98;
  NSString v99;
  unsigned int v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  NSObject *v111;
  os_log_type_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t *v116;
  id v117;
  uint64_t v118;
  void (*v119)(char *, uint64_t);
  id v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  os_log_type_t v124;
  uint64_t v125;
  void *v126;
  __n128 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  _QWORD *v134;
  _QWORD *v135;
  uint64_t v137;
  _QWORD *v138;
  char *v139;
  uint64_t *v140;
  __n128 v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  __n128 v146;
  uint64_t v147;
  char *v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  int64_t v153;
  unsigned int v154;
  char *v155;
  char *v156;
  char *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  _QWORD *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  int64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char v174;
  uint64_t v175;
  id v176[2];

  v1 = sub_100007800(&qword_100051648);
  __chkstk_darwin(v1);
  v3 = (char *)&v137 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = type metadata accessor for Date(0);
  v150 = *(_QWORD *)(v151 - 8);
  v4 = __chkstk_darwin(v151);
  v143 = (char *)&v137 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v145 = (char *)&v137 - v7;
  __chkstk_darwin(v6);
  v9 = (char *)&v137 - v8;
  v10 = sub_100007800(&qword_100051650);
  __chkstk_darwin(v10);
  v161 = (char *)&v137 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskDefinition(0);
  v164 = *(_QWORD *)(v12 - 8);
  v165 = v12;
  v13 = __chkstk_darwin(v12);
  v142 = (char *)&v137 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v163 = (char *)&v137 - v15;
  v16 = type metadata accessor for URL.DirectoryHint(0);
  v159 = *(_QWORD *)(v16 - 8);
  v160 = v16;
  __chkstk_darwin(v16);
  v158 = (char *)&v137 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v18);
  v157 = (char *)&v137 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for URL(0);
  v169 = *(_QWORD *)(v20 - 8);
  v170 = v20;
  v21 = __chkstk_darwin(v20);
  v156 = (char *)&v137 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v155 = (char *)&v137 - v23;
  v24 = sub_10000F5F0();
  v26 = 0;
  v147 = 0;
  v27 = v24[7];
  v152 = (char *)(v24 + 7);
  v162 = v24;
  v28 = 1 << *((_BYTE *)v24 + 32);
  v29 = -1;
  if (v28 < 64)
    v29 = ~(-1 << v28);
  v30 = v29 & v27;
  v153 = (unint64_t)(v28 + 63) >> 6;
  v154 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v139 = &v174;
  v140 = &v173;
  v138 = _swiftEmptyArrayStorage;
  v25.n128_u64[0] = 136315138;
  v146 = v25;
  v144 = (char *)&type metadata for Any + 8;
  v25.n128_u64[0] = 136315394;
  v141 = v25;
  v171 = v0;
  v148 = v3;
  v149 = v9;
  if ((v29 & v27) == 0)
    goto LABEL_5;
LABEL_4:
  v167 = (v30 - 1) & v30;
  v168 = v26;
  for (i = __clz(__rbit64(v30)) | (v26 << 6); ; i = __clz(__rbit64(v34)) + (v33 << 6))
  {
    v36 = v162[6] + 16 * i;
    v38 = *(void **)v36;
    v37 = *(void **)(v36 + 8);
    v39 = *(_QWORD *)(v171 + 32);
    v166 = *(_QWORD *)(v171 + 24);
    v40 = v157;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v169 + 56))(v157, 1, 1, v170);
    v42 = v158;
    v41 = v159;
    v43 = *(void (**)(char *, uint64_t, uint64_t))(v159 + 104);
    v44 = v154;
    v45 = v160;
    v43(v158, v154, v160);
    swift_bridgeObjectRetain(v37);
    v46 = swift_bridgeObjectRetain(v39);
    v47 = v156;
    v48 = v40;
    v49 = (unint64_t)v37;
    URL.init(filePath:directoryHint:relativeTo:)(v166, v39, v42, v48, v46);
    v166 = (uint64_t)v38;
    v176[0] = v38;
    v176[1] = v37;
    v43(v42, v44, v45);
    v50 = sub_10001CF54();
    v51 = v155;
    URL.appending<A>(path:directoryHint:)(v176, v42, &type metadata for String, v50);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v45);
    v52 = v170;
    v53 = *(void (**)(char *, uint64_t))(v169 + 8);
    v53(v47, v170);
    v54 = URL.path(percentEncoded:)(1);
    v53(v51, v52);
    v55 = v161;
    sub_100011D70(v54._countAndFlagsBits, (unint64_t)v54._object, v161);
    v56 = v164;
    v57 = v165;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v164 + 48))(v55, 1, v165) == 1)
    {
      swift_bridgeObjectRelease(v54._object);
      sub_10000A934((uint64_t)v55, &qword_100051650);
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v58 = type metadata accessor for Logger(0);
      sub_10000A8E8(v58, (uint64_t)qword_100052B80);
      swift_bridgeObjectRetain(v37);
      v60 = Logger.logObject.getter(v59);
      v61 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v60, v61))
      {
        v62 = swift_slowAlloc(12, -1);
        v63 = (void *)swift_slowAlloc(32, -1);
        v176[0] = v63;
        *(_DWORD *)v62 = v146.n128_u32[0];
        swift_bridgeObjectRetain(v49);
        *(_QWORD *)(v62 + 4) = sub_100008204(v166, v49, (uint64_t *)v176);
        swift_bridgeObjectRelease_n(v49, 3);
        _os_log_impl((void *)&_mh_execute_header, v60, v61, "Found invalid definition file: %s", (uint8_t *)v62, 0xCu);
        swift_arrayDestroy(v63, 1, v144);
        swift_slowDealloc(v63, -1, -1);
        swift_slowDealloc(v62, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v49, 2);
      }
      goto LABEL_24;
    }
    v64 = (*(uint64_t (**)(char *, char *, uint64_t))(v56 + 32))(v163, v55, v57);
    v65 = (uint64_t)v148;
    TaskDefinition.endDate.getter(v64);
    v66 = v150;
    v67 = v151;
    v68 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v65, 1, v151);
    v69 = v149;
    if (v68 == 1)
    {
      sub_10000A934(v65, &qword_100051648);
    }
    else
    {
      v70 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 32))(v149, v65, v67);
      v71 = v145;
      static Date.now.getter(v70);
      v72 = static Date.> infix(_:_:)(v69, v71);
      v73 = v66;
      v74 = v72;
      v75 = *(void (**)(char *, uint64_t))(v73 + 8);
      v75(v71, v67);
      if ((v74 & 1) != 0)
      {
        swift_bridgeObjectRelease(v54._object);
        swift_bridgeObjectRelease(v37);
        if (qword_100050F28 != -1)
          swift_once(&qword_100050F28, sub_10001E040);
        v76 = type metadata accessor for Logger(0);
        sub_10000A8E8(v76, (uint64_t)qword_100052B80);
        v77 = v164;
        v78 = v142;
        v79 = v165;
        (*(void (**)(char *, char *, uint64_t))(v164 + 16))(v142, v163, v165);
        v80 = v143;
        v81 = v149;
        v82 = (*(uint64_t (**)(char *, char *, uint64_t))(v150 + 16))(v143, v149, v67);
        v83 = Logger.logObject.getter(v82);
        v84 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v83, v84))
        {
          v85 = swift_slowAlloc(22, -1);
          v86 = (void *)swift_slowAlloc(64, -1);
          v176[0] = v86;
          v87 = v141;
          *(_DWORD *)v85 = v141.n128_u32[0];
          v88 = TaskDefinition.name.getter(v87);
          v90 = v89;
          v173 = sub_100008204(v88, v89, (uint64_t *)v176);
          v91 = v139;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, v139, v85 + 4, v85 + 12);
          swift_bridgeObjectRelease(v90);
          v92 = *(void (**)(char *, uint64_t))(v77 + 8);
          v92(v142, v165);
          *(_WORD *)(v85 + 12) = 2080;
          v93 = sub_10000228C(&qword_100051658, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
          v94 = dispatch thunk of CustomStringConvertible.description.getter(v151, v93);
          v96 = v95;
          v173 = sub_100008204(v94, v95, (uint64_t *)v176);
          v97 = v151;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v173, v91, v85 + 14, v85 + 22);
          swift_bridgeObjectRelease(v96);
          v75(v143, v97);
          _os_log_impl((void *)&_mh_execute_header, v83, v84, "Skipping %s because expiration date is in the future %s", (uint8_t *)v85, 0x16u);
          swift_arrayDestroy(v86, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v86, -1, -1);
          swift_slowDealloc(v85, -1, -1);

          v75(v81, v97);
          v92(v163, v165);
        }
        else
        {

          v75(v80, v67);
          v119 = *(void (**)(char *, uint64_t))(v77 + 8);
          v119(v78, v79);
          v75(v81, v67);
          v119(v163, v79);
        }
LABEL_24:
        v30 = v167;
        v26 = v168;
        if (v167)
          goto LABEL_4;
        goto LABEL_5;
      }
      v75(v69, v67);
      v57 = v165;
    }
    v98 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
    v99 = String._bridgeToObjectiveC()();
    v176[0] = 0;
    v100 = objc_msgSend(v98, "removeItemAtPath:error:", v99, v176);

    v101 = v176[0];
    if (v100)
    {
      v120 = v176[0];
      swift_bridgeObjectRelease(v54._object);
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v121 = type metadata accessor for Logger(0);
      sub_10000A8E8(v121, (uint64_t)qword_100052B80);
      swift_bridgeObjectRetain(v37);
      v123 = Logger.logObject.getter(v122);
      v124 = static os_log_type_t.info.getter(v123);
      if (os_log_type_enabled(v123, v124))
      {
        v125 = swift_slowAlloc(12, -1);
        v126 = (void *)swift_slowAlloc(32, -1);
        v176[0] = v126;
        *(_DWORD *)v125 = v146.n128_u32[0];
        swift_bridgeObjectRetain(v49);
        *(_QWORD *)(v125 + 4) = sub_100008204(v166, v49, (uint64_t *)v176);
        swift_bridgeObjectRelease_n(v49, 3);
        _os_log_impl((void *)&_mh_execute_header, v123, v124, "Removed expired task definition: %s", (uint8_t *)v125, 0xCu);
        swift_arrayDestroy(v126, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v126, -1, -1);
        swift_slowDealloc(v125, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v49, 2);
      }
      v128 = v164;
      v129 = TaskDefinition.name.getter(v127);
      v131 = v130;
      if ((swift_isUniquelyReferenced_nonNull_native(v138) & 1) == 0)
        v138 = sub_1000193E4(0, v138[2] + 1, 1, v138);
      v133 = v138[2];
      v132 = v138[3];
      if (v133 >= v132 >> 1)
        v138 = sub_1000193E4((_QWORD *)(v132 > 1), v133 + 1, 1, v138);
      v134 = v138;
      v138[2] = v133 + 1;
      v135 = &v134[2 * v133];
      v135[4] = v129;
      v135[5] = v131;
      (*(void (**)(void))(v128 + 8))();
      goto LABEL_24;
    }
    v102 = v176[0];
    swift_bridgeObjectRelease(v37);
    v103 = (void *)_convertNSErrorToError(_:)(v101);

    swift_willThrow(v104);
    v176[0] = v103;
    v105 = sub_100007800(&qword_100051620);
    v106 = sub_10000AB78(0, &qword_100051628, NSError_ptr);
    swift_dynamicCast(&v173, v176, v105, v106, 0);
    v107 = (void *)v173;
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v108 = type metadata accessor for Logger(0);
    sub_10000A8E8(v108, (uint64_t)qword_100052B80);
    v109 = v107;
    swift_bridgeObjectRetain(v54._object);
    v111 = Logger.logObject.getter(v110);
    v112 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v111, v112))
    {
      v113 = swift_slowAlloc(22, -1);
      v114 = (_QWORD *)swift_slowAlloc(8, -1);
      v115 = swift_slowAlloc(32, -1);
      v175 = v115;
      *(_DWORD *)v113 = v141.n128_u32[0];
      swift_bridgeObjectRetain(v54._object);
      v172 = sub_100008204(v54._countAndFlagsBits, (unint64_t)v54._object, &v175);
      v116 = v140;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v140, v113 + 4, v113 + 12);
      swift_bridgeObjectRelease_n(v54._object, 3);
      *(_WORD *)(v113 + 12) = 2112;
      v172 = (uint64_t)v109;
      v117 = v109;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v172, v116, v113 + 14, v113 + 22);
      *v114 = v109;

      _os_log_impl((void *)&_mh_execute_header, v111, v112, "Failed at removing task definition: %s %@", (uint8_t *)v113, 0x16u);
      v118 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v114, 1, v118);
      swift_slowDealloc(v114, -1, -1);
      swift_arrayDestroy(v115, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v115, -1, -1);
      swift_slowDealloc(v113, -1, -1);

      (*(void (**)(char *, uint64_t))(v164 + 8))(v163, v165);
    }
    else
    {
      swift_bridgeObjectRelease_n(v54._object, 2);

      (*(void (**)(char *, uint64_t))(v164 + 8))(v163, v57);
    }
    v30 = v167;
    v26 = v168;
    swift_errorRelease(v176[0]);
    v147 = 0;
    if (v30)
      goto LABEL_4;
LABEL_5:
    v32 = __OFADD__(v26, 1);
    v33 = v26 + 1;
    if (v32)
    {
      __break(1u);
      goto LABEL_57;
    }
    if (v33 >= v153)
      goto LABEL_55;
    v34 = *(_QWORD *)&v152[8 * v33];
    if (!v34)
      break;
LABEL_15:
    v167 = (v34 - 1) & v34;
    v168 = v33;
  }
  v35 = v33 + 1;
  if (v33 + 1 >= v153)
    goto LABEL_55;
  v34 = *(_QWORD *)&v152[8 * v35];
  if (v34)
    goto LABEL_14;
  v35 = v33 + 2;
  if (v33 + 2 >= v153)
    goto LABEL_55;
  v34 = *(_QWORD *)&v152[8 * v35];
  if (v34)
  {
LABEL_14:
    v33 = v35;
    goto LABEL_15;
  }
  v35 = v33 + 3;
  if (v33 + 3 < v153)
  {
    v34 = *(_QWORD *)&v152[8 * v35];
    if (!v34)
    {
      while (1)
      {
        v33 = v35 + 1;
        if (__OFADD__(v35, 1))
          break;
        if (v33 >= v153)
          goto LABEL_55;
        v34 = *(_QWORD *)&v152[8 * v33];
        ++v35;
        if (v34)
          goto LABEL_15;
      }
LABEL_57:
      __break(1u);
    }
    goto LABEL_14;
  }
LABEL_55:
  swift_release(v162);
  return v138;
}

uint64_t sub_10001196C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  __n128 v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  char v22;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  char *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  __n128 v48;
  char *v49;
  uint64_t *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54[3];
  uint64_t v55;

  v5 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v5);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MLHostTask(0);
  v53 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  result = __chkstk_darwin(v9);
  v52 = (char *)&v44 - v12;
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v51 = v11;
    v46 = v2;
    v14 = (uint64_t *)(a2 + 64);
    v15 = swift_bridgeObjectRetain(a1);
    v45 = a1;
    v16 = (uint64_t *)(a1 + 40);
    v15.n128_u64[0] = 136315138;
    v48 = v15;
    v47 = (char *)&type metadata for Any + 8;
    v49 = v7;
    v50 = (uint64_t *)(a2 + 64);
    do
    {
      v17 = *(v16 - 1);
      v18 = *v16;
      swift_beginAccess(v14, v54, 33, 0);
      v19 = *v14;
      swift_bridgeObjectRetain(v18);
      swift_bridgeObjectRetain(v19);
      v20 = sub_1000088BC(v17, v18);
      v22 = v21;
      swift_bridgeObjectRelease(v19);
      if ((v22 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v14);
        v24 = *v14;
        v55 = *v14;
        *v14 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_100019B78((uint64_t (*)(_QWORD))&type metadata accessor for MLHostTask, &qword_100051640);
          v24 = v55;
        }
        swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v24 + 48) + 16 * v20 + 8));
        v25 = v53;
        (*(void (**)(char *, unint64_t, uint64_t))(v53 + 32))(v7, *(_QWORD *)(v24 + 56) + *(_QWORD *)(v53 + 72) * v20, v8);
        sub_10001995C(v20, v24);
        v26 = *v14;
        *v14 = v24;
        swift_bridgeObjectRelease(v26);
        v27 = 0;
      }
      else
      {
        v27 = 1;
        v25 = v53;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v7, v27, 1, v8);
      swift_endAccess(v54);
      swift_bridgeObjectRelease(v18);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v7, 1, v8) == 1)
      {
        sub_10000A934((uint64_t)v7, &qword_100051638);
      }
      else
      {
        v28 = v52;
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v52, v7, v8);
        v29 = v8;
        if (qword_100050F28 != -1)
          swift_once(&qword_100050F28, sub_10001E040);
        v30 = type metadata accessor for Logger(0);
        sub_10000A8E8(v30, (uint64_t)qword_100052B80);
        v31 = v51;
        v32 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 16))(v51, v28, v29);
        v33 = Logger.logObject.getter(v32);
        v34 = v28;
        v35 = static os_log_type_t.info.getter(v33);
        if (os_log_type_enabled(v33, v35))
        {
          v36 = swift_slowAlloc(12, -1);
          v37 = swift_slowAlloc(32, -1);
          v54[0] = v37;
          *(_DWORD *)v36 = v48.n128_u32[0];
          v38 = MLHostTask.name.getter(v37);
          v40 = v39;
          *(_QWORD *)(v36 + 4) = sub_100008204(v38, v39, v54);
          swift_bridgeObjectRelease(v40);
          v41 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
          v41(v31, v29);
          _os_log_impl((void *)&_mh_execute_header, v33, v35, "Task %s is removed from TaskRegistry", (uint8_t *)v36, 0xCu);
          swift_arrayDestroy(v37, 1, v47);
          v42 = v37;
          v7 = v49;
          swift_slowDealloc(v42, -1, -1);
          swift_slowDealloc(v36, -1, -1);

          v41((uint64_t)v52, v29);
        }
        else
        {

          v43 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
          v43(v31, v29);
          v43((uint64_t)v34, v29);
        }
        v8 = v29;
        v14 = v50;
      }
      v16 += 2;
      --v13;
    }
    while (v13);
    return swift_bridgeObjectRelease(v45);
  }
  return result;
}

uint64_t sub_100011D70@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  Swift::String v17;
  id v18;
  NSString v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, _QWORD, uint64_t, uint64_t);
  void (*v46)(char *, char *, uint64_t);
  char *v47;
  uint64_t v48;
  char *v49;
  _QWORD v51[5];
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v6 = type metadata accessor for TaskValidationError(0);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = __chkstk_darwin(v7);
  v10 = (char *)v51 - v9;
  __chkstk_darwin(v8);
  v11 = sub_100007800(&qword_100051650);
  __chkstk_darwin(v11);
  v13 = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TaskDefinition(0);
  v59 = *(_QWORD *)(v14 - 8);
  v60 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17._countAndFlagsBits = 0x7473696C702ELL;
  v17._object = (void *)0xE600000000000000;
  if (String.hasSuffix(_:)(v17))
  {
    v53 = v10;
    v58 = a3;
    v18 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
    v57 = a1;
    v19 = String._bridgeToObjectiveC()();
    v20 = objc_msgSend(v18, "contentsAtPath:", v19);

    if (v20)
    {
      v52 = v16;
      v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v20);
      v23 = v22;

      v24 = type metadata accessor for PropertyListDecoder(0);
      swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
      v25 = PropertyListDecoder.init()();
      v26 = sub_10000228C(&qword_100051250, (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition, (uint64_t)&protocol conformance descriptor for TaskDefinition);
      v27 = v60;
      v55 = v21;
      v56 = v23;
      v54 = v25;
      dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v60, v21, v23, v60, v26);
      v51[4] = v6;
      v44 = v59;
      v45 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56);
      v45(v13, 0, 1, v27);
      v46 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
      v47 = v52;
      v46(v52, v13, v27);
      validateTaskDefinition(_:)(v47);
      v48 = v27;
      v49 = v58;
      swift_release(v54);
      sub_10000AA84(v55, v56);
      v46(v49, v47, v48);
      return ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v45)(v49, 0, 1, v48);
    }
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v38 = type metadata accessor for Logger(0);
    sub_10000A8E8(v38, (uint64_t)qword_100052B80);
    v39 = swift_bridgeObjectRetain_n(a2, 2);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc(12, -1);
      v43 = swift_slowAlloc(32, -1);
      v62 = v43;
      *(_DWORD *)v42 = 136315138;
      swift_bridgeObjectRetain(a2);
      v61 = sub_100008204(v57, a2, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v42 + 4, v42 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Failed reading data from: %s", v42, 0xCu);
      swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1, -1);
      swift_slowDealloc(v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    v37 = v58;
    v35 = v60;
    v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56);
  }
  else
  {
    v28 = a1;
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v29 = type metadata accessor for Logger(0);
    sub_10000A8E8(v29, (uint64_t)qword_100052B80);
    v30 = swift_bridgeObjectRetain_n(a2, 2);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(12, -1);
      v34 = swift_slowAlloc(32, -1);
      v62 = v34;
      *(_DWORD *)v33 = 136315138;
      swift_bridgeObjectRetain(a2);
      v61 = sub_100008204(v28, a2, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v33 + 4, v33 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Invalid task definition file: %s", v33, 0xCu);
      swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v33, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    v35 = v60;
    v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56);
    v37 = a3;
  }
  return v36((uint64_t)v37, 1, 1, v35);
}

uint64_t sub_100012B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  _BYTE v12[24];

  swift_beginAccess(a1 + 64, v12, 0, 0);
  v8 = *(_QWORD *)(a1 + 64);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(v8);
  v10 = sub_10001CFB0(v9, a2, a3);
  swift_bridgeObjectRelease(v8);
  result = swift_bridgeObjectRelease(a3);
  *a4 = v10 & 1;
  return result;
}

uint64_t sub_100012BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v17;
  os_unfair_lock_s *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[24];

  v3 = v2;
  v28 = a1;
  v5 = sub_100007800(&qword_100051648);
  __chkstk_darwin(v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskStatus(0);
  v26 = *(_QWORD *)(v8 - 8);
  v27 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for MLHostTask(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + 56) + 16);
  os_unfair_lock_lock(v18);
  swift_beginAccess(v2 + 64, v29, 32, 0);
  v19 = *(_QWORD *)(v2 + 64);
  if (*(_QWORD *)(v19 + 16))
  {
    swift_bridgeObjectRetain(a2);
    v20 = sub_1000088BC(v28, a2);
    if ((v21 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v13, *(_QWORD *)(v19 + 56) + *(_QWORD *)(v15 + 72) * v20, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    }
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  }
  swift_endAccess(v29);
  os_unfair_lock_unlock(v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    return sub_10000A934((uint64_t)v13, &qword_100051638);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v10, enum case for TaskStatus.taskNotStarted(_:), v27);
  v23 = MLHostTask.status.setter(v10);
  Date.init()(v23);
  v24 = type metadata accessor for Date(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v7, 0, 1, v24);
  MLHostTask.lastExecutionDate.setter(v7);
  os_unfair_lock_lock(v18);
  sub_100013410(v3, (uint64_t)v17);
  os_unfair_lock_unlock(v18);
  sub_100013508((uint64_t)v17);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_100012EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[24];

  v4 = v3;
  v25 = a3;
  v7 = type metadata accessor for TaskStatus(0);
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MLHostTask(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + 56) + 16);
  os_unfair_lock_lock(v17);
  swift_beginAccess(v3 + 64, v26, 32, 0);
  v18 = *(_QWORD *)(v3 + 64);
  if (*(_QWORD *)(v18 + 16))
  {
    swift_bridgeObjectRetain(a2);
    v19 = sub_1000088BC(a1, a2);
    if ((v20 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v12, *(_QWORD *)(v18 + 56) + *(_QWORD *)(v14 + 72) * v19, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    }
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  }
  swift_endAccess(v26);
  os_unfair_lock_unlock(v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    return sub_10000A934((uint64_t)v12, &qword_100051638);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v9, v25, v24);
  MLHostTask.status.setter(v9);
  os_unfair_lock_lock(v17);
  sub_100013410(v4, (uint64_t)v16);
  os_unfair_lock_unlock(v17);
  sub_100013508((uint64_t)v16);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

void sub_100013124(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  id v18;
  NSString v19;
  NSString v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = v4;
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v10 = type metadata accessor for Logger(0);
  sub_10000A8E8(v10, (uint64_t)qword_100052B80);
  swift_bridgeObjectRetain_n(a2, 2);
  v11 = swift_bridgeObjectRetain_n(a4, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v5;
    v14 = swift_slowAlloc(22, -1);
    v15 = swift_slowAlloc(64, -1);
    v25 = v15;
    *(_DWORD *)v14 = 136315394;
    swift_bridgeObjectRetain(a2);
    v24 = sub_100008204(a1, a2, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    v24 = sub_100008204(a3, a4, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v14 + 14, v14 + 22);
    swift_bridgeObjectRelease_n(a4, 3);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Persisting task error: %s %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    v16 = v14;
    v5 = v23;
    swift_slowDealloc(v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a4, 2);
    swift_bridgeObjectRelease_n(a2, 2);
  }
  sub_10000AB78(0, &qword_100051678, NSNumber_ptr);
  isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
  v18 = objc_allocWithZone((Class)BMLighthouseTaskError);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  v21 = objc_msgSend(v18, "initWithVersion:taskName:errorCode:", isa, v19, v20);

  v22 = objc_msgSend(*(id *)(v5 + 80), "source");
  objc_msgSend(v22, "sendEvent:", v21);

}

uint64_t sub_100013410(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v15[24];

  v4 = sub_100007800(&qword_100051638);
  v5 = __chkstk_darwin(v4);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = MLHostTask.name.getter(v5);
  v10 = v9;
  v11 = type metadata accessor for MLHostTask(0);
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v7, a2, v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
  swift_beginAccess(a1 + 64, v15, 33, 0);
  sub_10000E5D4((uint64_t)v7, v8, v10);
  return swift_endAccess(v15);
}

void sub_100013508(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Class isa;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSString v27;
  NSString v28;
  id v29;
  id v30;
  _QWORD v31[2];
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = v1;
  v4 = type metadata accessor for TaskStatus(0);
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  __chkstk_darwin(v4);
  v33 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MLHostTask(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v10 = type metadata accessor for Logger(0);
  sub_10000A8E8(v10, (uint64_t)qword_100052B80);
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v37 = v15;
    v31[1] = a1;
    v32 = v1;
    *(_DWORD *)v14 = 136315138;
    v16 = MLHostTask.description.getter();
    v18 = v17;
    v36 = sub_100008204(v16, v17, &v37);
    v2 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Persisting task: %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  sub_10000AB78(0, &qword_100051678, NSNumber_ptr);
  isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
  MLHostTask.name.getter(isa);
  v21 = v20;
  v22 = v33;
  v23 = MLHostTask.status.getter();
  TaskStatus.rawValue.getter(v23);
  v25 = v24;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v22, v35);
  v26 = objc_allocWithZone((Class)BMLighthouseTaskStatus);
  v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v21);
  v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v25);
  v29 = objc_msgSend(v26, "initWithVersion:taskName:taskState:taskSource:pushMetadata:pullMetadata:", isa, v27, v28, 0, 0, 0);

  v30 = objc_msgSend(*(id *)(v2 + 72), "source");
  objc_msgSend(v30, "sendEvent:", v29);

}

void sub_100013848(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t);
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  os_log_t v58;
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
  id v73;
  id v74;
  Class isa;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  unint64_t v81;
  id v82;
  NSString v83;
  NSString v84;
  NSString v85;
  id v86;
  id v87;
  uint64_t v88;
  os_log_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;

  v95 = a3;
  v96 = a1;
  v97 = a2;
  v7 = sub_100007800(&qword_100051648);
  __chkstk_darwin(v7);
  v92 = (char *)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = type metadata accessor for TaskStatus(0);
  v9 = *(_QWORD *)(v91 - 8);
  __chkstk_darwin(v91);
  v11 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100007800(&qword_100051698);
  __chkstk_darwin(v12);
  v14 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100007800(&qword_1000516A0);
  __chkstk_darwin(v15);
  v17 = (char *)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for PushMetadata(0);
  v98 = *(_QWORD *)(v18 - 8);
  v99 = v18;
  __chkstk_darwin(v18);
  v20 = (char *)&v88 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for DynamicTaskSource(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v88 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v93 = a4;
  v25(v24, a4, v21);
  v26 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v24, v21);
  if (v26 == enum case for DynamicTaskSource.push(_:))
  {
    sub_10001D128(a5, (uint64_t)v14);
    v27 = type metadata accessor for TaskMetadata(0);
    v28 = *(_QWORD *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v14, 1, v27) == 1)
    {
      sub_10000A934((uint64_t)v14, &qword_100051698);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v98 + 56))(v17, 1, 1, v99);
LABEL_10:
      sub_10000A934((uint64_t)v17, &qword_1000516A0);
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v37 = type metadata accessor for Logger(0);
      v38 = sub_10000A8E8(v37, (uint64_t)qword_100052B80);
      v31 = Logger.logObject.getter(v38);
      v32 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v31, v32))
        goto LABEL_15;
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      v34 = "Incomplete push metadata.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v31, v32, v34, v33, 2u);
      swift_slowDealloc(v33, -1, -1);
LABEL_15:

      return;
    }
    TaskMetadata.pushMetadata.getter();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v27);
    v36 = v98;
    v35 = v99;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v98 + 48))(v17, 1, v99) == 1)
      goto LABEL_10;
    v44 = v20;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v20, v17, v35);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v45 = type metadata accessor for Logger(0);
    sub_10000A8E8(v45, (uint64_t)qword_100052B80);
    v46 = v91;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v95, v91);
    v47 = v97;
    v48 = swift_bridgeObjectRetain_n(v97, 2);
    v49 = Logger.logObject.getter(v48);
    v50 = static os_log_type_t.debug.getter();
    v51 = os_log_type_enabled(v49, v50);
    v52 = v96;
    if (v51)
    {
      v53 = swift_slowAlloc(22, -1);
      v90 = swift_slowAlloc(64, -1);
      v101 = v90;
      *(_DWORD *)v53 = 136315394;
      v89 = v49;
      swift_bridgeObjectRetain(v47);
      v100 = sub_100008204(v52, v47, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v53 + 4, v53 + 12);
      v54 = swift_bridgeObjectRelease_n(v47, 3);
      *(_WORD *)(v53 + 12) = 2080;
      v55 = TaskStatus.rawValue.getter(v54);
      v57 = v56;
      v100 = sub_100008204(v55, v56, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v53 + 14, v53 + 22);
      swift_bridgeObjectRelease(v57);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v46);
      v58 = v89;
      _os_log_impl((void *)&_mh_execute_header, v89, v50, "Donating task status for push event: taskName: %s, taskStatus: %s", (uint8_t *)v53, 0x16u);
      v59 = v90;
      swift_arrayDestroy(v90, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v59, -1, -1);
      swift_slowDealloc(v53, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n(v47, 2);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v46);

    }
    v60 = PushMetadata.topic.getter();
    v91 = v61;
    v62 = PushMetadata.channelID.getter();
    v64 = v63;
    v65 = PushMetadata.pushType.getter();
    v67 = v66;
    v68 = PushMetadata.pushPriority.getter();
    v70 = v69;
    v71 = (uint64_t)v92;
    PushMetadata.creationDate.getter();
    v72 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v71, 0, 1, v72);
    v73 = objc_allocWithZone((Class)BMLighthouseTaskStatusPushMetadata);
    v74 = sub_100019250(v60, v91, v62, v64, v65, v67, v68, v70, v71);
    sub_10000AB78(0, &qword_100051678, NSNumber_ptr);
    isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
    TaskStatus.rawValue.getter(isa);
    v77 = v76;
    DynamicTaskSource.rawValue.getter();
    v79 = v78;
    v80 = objc_allocWithZone((Class)BMLighthouseTaskStatus);
    v81 = v97;
    swift_bridgeObjectRetain(v97);
    v82 = v74;
    v83 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v81);
    v84 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v77);
    v85 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v79);
    v86 = objc_msgSend(v80, "initWithVersion:taskName:taskState:taskSource:pushMetadata:pullMetadata:", isa, v83, v84, v85, v82, 0);

    v87 = objc_msgSend(*(id *)(v94 + 72), "source");
    objc_msgSend(v87, "sendEvent:", v86);

    (*(void (**)(char *, uint64_t))(v98 + 8))(v44, v99);
  }
  else
  {
    if (v26 == enum case for DynamicTaskSource.pull(_:))
    {
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v29 = type metadata accessor for Logger(0);
      v30 = sub_10000A8E8(v29, (uint64_t)qword_100052B80);
      v31 = Logger.logObject.getter(v30);
      v32 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v31, v32))
        goto LABEL_15;
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      v34 = "Donating task status for pull events is not implemented yet.";
      goto LABEL_14;
    }
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v39 = type metadata accessor for Logger(0);
    v40 = sub_10000A8E8(v39, (uint64_t)qword_100052B80);
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Invalid taskSource, skipping donation.", v43, 2u);
      swift_slowDealloc(v43, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
}

uint64_t sub_1000140B8@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X8>)
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
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char v48;
  void (*v49)(char *, uint64_t);
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  char *v60;
  uint64_t v61;
  __n128 v62;
  char *v63;
  __n128 v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  void (*v68)(char *, uint64_t);
  Swift::String v69;
  id v70;
  NSString v71;
  Class isa;
  unsigned int v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  void *v85;
  __n128 v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  void (*v90)(char *, uint64_t);
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  void (*v97)(char *, uint64_t);
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint8_t *v105;
  void *v106;
  __n128 v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  char *v119;
  uint8_t *v120;
  void *v121;
  void *v122;
  __n128 v123;
  char *v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  id v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  id v135;
  id v136;
  NSObject *v137;
  os_log_type_t v138;
  _BOOL4 v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  os_unfair_lock_s *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  char *v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  char *v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  char *v173;
  char *v174;
  uint64_t countAndFlagsBits;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void (*v180)(char *, uint64_t);
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;

  v178 = a2;
  countAndFlagsBits = type metadata accessor for TaskValidationError(0);
  v172 = *(_QWORD *)(countAndFlagsBits - 8);
  v3 = __chkstk_darwin(countAndFlagsBits);
  v167 = (char *)&v152 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v174 = (char *)&v152 - v6;
  __chkstk_darwin(v5);
  v173 = (char *)&v152 - v7;
  v154 = type metadata accessor for TaskType(0);
  v158 = *(_QWORD *)(v154 - 8);
  __chkstk_darwin(v154);
  v159 = (char *)&v152 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MLHostTask(0);
  v176 = *(_QWORD *)(v9 - 8);
  v177 = v9;
  __chkstk_darwin(v9);
  v160 = (char *)&v152 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v181 = type metadata accessor for TaskDefinition(0);
  v179 = *(_QWORD *)(v181 - 8);
  v11 = __chkstk_darwin(v181);
  v168 = (char *)&v152 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v169 = (char *)&v152 - v14;
  v15 = __chkstk_darwin(v13);
  v171 = (char *)&v152 - v16;
  v17 = __chkstk_darwin(v15);
  v161 = (char *)&v152 - v18;
  v19 = __chkstk_darwin(v17);
  v156 = (char *)&v152 - v20;
  v21 = __chkstk_darwin(v19);
  v157 = (uint64_t)&v152 - v22;
  __chkstk_darwin(v21);
  v155 = (char *)&v152 - v23;
  v164 = type metadata accessor for URL.DirectoryHint(0);
  v165 = *(_QWORD *)(v164 - 8);
  __chkstk_darwin(v164);
  v163 = (char *)&v152 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v25);
  v162 = (char *)&v152 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v170 = type metadata accessor for URL(0);
  v27 = *(_QWORD *)(v170 - 8);
  v28 = __chkstk_darwin(v170);
  v30 = (char *)&v152 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v32 = (char *)&v152 - v31;
  v33 = sub_100007800(&qword_100051648);
  __chkstk_darwin(v33);
  v35 = (char *)&v152 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = type metadata accessor for Date(0);
  v37 = *(_QWORD *)(v36 - 8);
  v38 = __chkstk_darwin(v36);
  v40 = (char *)&v152 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38);
  v42 = (char *)&v152 - v41;
  v43 = validateTaskDefinition(_:)(a1);
  v180 = a1;
  v173 = v30;
  v174 = v32;
  countAndFlagsBits = v27;
  v44 = v170;
  v152 = 0;
  v45 = v171;
  v153 = v42;
  TaskDefinition.endDate.getter(v43);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36) == 1)
  {
    sub_10000A934((uint64_t)v35, &qword_100051648);
LABEL_13:
    v97 = v180;
    v98 = v181;
    v99 = v179;
    v100 = v45;
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v101 = type metadata accessor for Logger(0);
    sub_10000A8E8(v101, (uint64_t)qword_100052B80);
    v102 = (*(uint64_t (**)(char *, void (*)(char *, uint64_t), uint64_t))(v99 + 16))(v45, v97, v98);
    v103 = Logger.logObject.getter(v102);
    v104 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v103, v104))
    {
      v105 = (uint8_t *)swift_slowAlloc(12, -1);
      v106 = (void *)swift_slowAlloc(32, -1);
      v184 = v106;
      v107.n128_u64[0] = 136315138;
      *(_DWORD *)v105 = 136315138;
      v108 = TaskDefinition.name.getter(v107);
      v110 = v109;
      v187 = sub_100008204(v108, v109, (uint64_t *)&v184);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v187, &v188, v105 + 4, v105 + 12);
      swift_bridgeObjectRelease(v110);
      (*(void (**)(char *, uint64_t))(v99 + 8))(v100, v98);
      _os_log_impl((void *)&_mh_execute_header, v103, v104, "Task %s must have a valid endDate (> now).", v105, 0xCu);
      swift_arrayDestroy(v106, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v106, -1, -1);
      swift_slowDealloc(v105, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v99 + 8))(v45, v98);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v176 + 56))(v178, 1, 1, v177);
  }
  v46 = v153;
  v47 = (*(uint64_t (**)(char *, char *, uint64_t))(v37 + 32))(v153, v35, v36);
  static Date.now.getter(v47);
  v48 = static Date.> infix(_:_:)(v46, v40);
  v49 = *(void (**)(char *, uint64_t))(v37 + 8);
  v49(v40, v36);
  if ((v48 & 1) == 0)
  {
    v49(v46, v36);
    goto LABEL_13;
  }
  v50 = v180;
  v51 = v166;
  sub_1000156F4(v180);
  if (!v52)
  {
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v112 = type metadata accessor for Logger(0);
    sub_10000A8E8(v112, (uint64_t)qword_100052B80);
    v113 = v179;
    v114 = v161;
    v115 = v181;
    v116 = (*(uint64_t (**)(char *, void (*)(char *, uint64_t), uint64_t))(v179 + 16))(v161, v50, v181);
    v117 = Logger.logObject.getter(v116);
    v118 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v117, v118))
    {
      v119 = v114;
      v120 = (uint8_t *)swift_slowAlloc(12, -1);
      v121 = (void *)swift_slowAlloc(32, -1);
      v171 = (char *)v49;
      v122 = v121;
      v184 = v121;
      v123.n128_u64[0] = 136315138;
      *(_DWORD *)v120 = 136315138;
      v172 = v36;
      v124 = v119;
      v125 = TaskDefinition.name.getter(v123);
      v127 = v126;
      v187 = sub_100008204(v125, v126, (uint64_t *)&v184);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v187, &v188, v120 + 4, v120 + 12);
      swift_bridgeObjectRelease(v127);
      (*(void (**)(char *, uint64_t))(v113 + 8))(v124, v115);
      _os_log_impl((void *)&_mh_execute_header, v117, v118, "Failed at storing taskDefinition: %s", v120, 0xCu);
      swift_arrayDestroy(v122, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v122, -1, -1);
      swift_slowDealloc(v120, -1, -1);

      ((void (*)(char *, uint64_t))v171)(v153, v172);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v113 + 8))(v114, v115);
      v49(v46, v36);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v176 + 56))(v178, 1, 1, v177);
  }
  v171 = (char *)v49;
  v172 = v36;
  swift_bridgeObjectRelease(v52);
  v53 = *(_QWORD *)(v51 + 40);
  v54 = *(_QWORD *)(v51 + 48);
  v55 = v162;
  v56 = v44;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(countAndFlagsBits + 56))(v162, 1, 1, v44);
  v57 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v58 = v165;
  v59 = *(void (**)(char *, uint64_t, uint64_t))(v165 + 104);
  v60 = v163;
  v61 = v164;
  v59(v163, enum case for URL.DirectoryHint.inferFromPath(_:), v164);
  v62 = swift_bridgeObjectRetain(v54);
  v63 = v173;
  URL.init(filePath:directoryHint:relativeTo:)(v53, v54, v60, v55, v62);
  v184 = (id)TaskDefinition.name.getter(v64);
  v185 = v65;
  v59(v60, v57, v61);
  v66 = sub_10001CF54();
  v67 = v174;
  URL.appending<A>(path:directoryHint:)(&v184, v60, &type metadata for String, v66);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v61);
  swift_bridgeObjectRelease(v185);
  v68 = *(void (**)(char *, uint64_t))(countAndFlagsBits + 8);
  v68(v63, v56);
  v69 = URL.path(percentEncoded:)(0);
  v68(v67, v56);
  v70 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  countAndFlagsBits = v69._countAndFlagsBits;
  v71 = String._bridgeToObjectiveC()();
  if (qword_100050F20 != -1)
    swift_once(&qword_100050F20, sub_10000E940);
  type metadata accessor for FileAttributeKey(0);
  sub_10000228C(&qword_100051008, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10003881C);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v184 = 0;
  v73 = objc_msgSend(v70, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v71, 1, isa, &v184);

  v74 = v184;
  v75 = v181;
  v76 = v179;
  if (v73)
  {
    v77 = qword_100050F28;
    v78 = v184;
    if (v77 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v79 = type metadata accessor for Logger(0);
    sub_10000A8E8(v79, (uint64_t)qword_100052B80);
    v80 = v155;
    v174 = *(char **)(v76 + 16);
    ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v174)(v155, v180, v75);
    v81 = swift_bridgeObjectRetain_n(v69._object, 2);
    v82 = Logger.logObject.getter(v81);
    v83 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v82, v83))
    {
      v84 = swift_slowAlloc(22, -1);
      v85 = (void *)swift_slowAlloc(64, -1);
      v184 = v85;
      v86.n128_u64[0] = 136315394;
      *(_DWORD *)v84 = 136315394;
      v87 = TaskDefinition.name.getter(v86);
      v89 = v88;
      v187 = sub_100008204(v87, v88, (uint64_t *)&v184);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v187, &v188, v84 + 4, v84 + 12);
      swift_bridgeObjectRelease(v89);
      v90 = v180;
      v179 = *(_QWORD *)(v179 + 8);
      ((void (*)(char *, uint64_t))v179)(v80, v181);
      *(_WORD *)(v84 + 12) = 2080;
      swift_bridgeObjectRetain(v69._object);
      v91 = countAndFlagsBits;
      v187 = sub_100008204(countAndFlagsBits, (unint64_t)v69._object, (uint64_t *)&v184);
      v75 = v181;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v187, &v188, v84 + 14, v84 + 22);
      swift_bridgeObjectRelease_n(v69._object, 3);
      _os_log_impl((void *)&_mh_execute_header, v82, v83, "Created taskFolder for %s: %s", (uint8_t *)v84, 0x16u);
      swift_arrayDestroy(v85, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v85, -1, -1);
      swift_slowDealloc(v84, -1, -1);

      v92 = v90;
      v93 = v166;
      v94 = (uint64_t)v160;
      v95 = v154;
      v96 = v159;
    }
    else
    {
      v179 = *(_QWORD *)(v76 + 8);
      ((void (*)(char *, uint64_t))v179)(v80, v75);
      swift_bridgeObjectRelease_n(v69._object, 2);

      v93 = v166;
      v94 = (uint64_t)v160;
      v95 = v154;
      v96 = v159;
      v91 = countAndFlagsBits;
      v92 = v180;
    }
    v146 = v157;
    sub_100015F18((uint64_t)v92, v157);
    v147 = v156;
    ((void (*)(char *, uint64_t, uint64_t))v174)(v156, v146, v75);
    (*(void (**)(char *, _QWORD, uint64_t))(v158 + 104))(v96, enum case for TaskType.dynamicTask(_:), v95);
    MLHostTask.init(taskDefinition:taskType:taskFolder:)(v147, v96, v91, v69._object);
    v148 = (os_unfair_lock_s *)(*(_QWORD *)(v93 + 56) + 16);
    os_unfair_lock_lock(v148);
    sub_100016394(v93, v94);
    os_unfair_lock_unlock(v148);
    ((void (*)(uint64_t, uint64_t))v179)(v146, v75);
    ((void (*)(char *, uint64_t))v171)(v153, v172);
    v150 = v176;
    v149 = v177;
    v151 = v178;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v176 + 32))(v178, v94, v177);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v150 + 56))(v151, 0, 1, v149);
  }
  else
  {
    v128 = v184;
    v129 = (void *)_convertNSErrorToError(_:)(v74);

    swift_willThrow(v130);
    v184 = v129;
    v131 = sub_100007800(&qword_100051620);
    v132 = sub_10000AB78(0, &qword_100051628, NSError_ptr);
    swift_dynamicCast(&v187, &v184, v131, v132, 0);
    v133 = (void *)v187;
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v134 = type metadata accessor for Logger(0);
    sub_10000A8E8(v134, (uint64_t)qword_100052B80);
    v135 = v133;
    swift_bridgeObjectRetain(v69._object);
    v136 = v135;
    v137 = Logger.logObject.getter(v136);
    v138 = static os_log_type_t.error.getter();
    v139 = os_log_type_enabled(v137, v138);
    v140 = countAndFlagsBits;
    if (v139)
    {
      v141 = swift_slowAlloc(22, -1);
      v142 = (_QWORD *)swift_slowAlloc(8, -1);
      v181 = swift_slowAlloc(32, -1);
      v186 = v181;
      *(_DWORD *)v141 = 136315394;
      swift_bridgeObjectRetain(v69._object);
      v182 = sub_100008204(v140, (unint64_t)v69._object, &v186);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v182, &v183, v141 + 4, v141 + 12);
      swift_bridgeObjectRelease_n(v69._object, 3);
      *(_WORD *)(v141 + 12) = 2112;
      v182 = (uint64_t)v136;
      v143 = v136;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v182, &v183, v141 + 14, v141 + 22);
      *v142 = v136;

      _os_log_impl((void *)&_mh_execute_header, v137, v138, "Failed at creating taskFolder: %s %@", (uint8_t *)v141, 0x16u);
      v144 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v142, 1, v144);
      swift_slowDealloc(v142, -1, -1);
      v145 = v181;
      swift_arrayDestroy(v181, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v145, -1, -1);
      swift_slowDealloc(v141, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v69._object, 2);
    }
    ((void (*)(char *, uint64_t))v171)(v153, v172);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v176 + 56))(v178, 1, 1, v177);
    return swift_errorRelease(v184);
  }
}

uint64_t sub_1000156F4(void (*a1)(char *, uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  void (*v36)(char *, uint64_t);
  char *v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t countAndFlagsBits;
  _QWORD v62[3];
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v2 = v1;
  v66 = a1;
  v67 = type metadata accessor for TaskDefinition(0);
  v62[2] = *(_QWORD *)(v67 - 8);
  __chkstk_darwin(v67);
  v62[1] = (char *)v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = type metadata accessor for URL.DirectoryHint(0);
  v4 = *(_QWORD *)(v69 - 8);
  __chkstk_darwin(v69);
  v6 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v7);
  v9 = (char *)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL(0);
  v64 = *(_QWORD *)(v10 - 8);
  v11 = v64;
  v12 = __chkstk_darwin(v10);
  v62[0] = (char *)v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)v62 - v15;
  __chkstk_darwin(v14);
  v68 = (char *)v62 - v17;
  v72 = TaskDefinition.name.getter(v18);
  v73 = v19;
  v20._countAndFlagsBits = 0x7473696C702ELL;
  v20._object = (void *)0xE600000000000000;
  String.append(_:)(v20);
  v65 = v72;
  v63 = v73;
  v22 = *(_QWORD *)(v1 + 24);
  v21 = *(_QWORD *)(v2 + 32);
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v24 = v9;
  v23(v9, 1, 1, v10);
  v25 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v27 = v69;
  v26(v6, enum case for URL.DirectoryHint.inferFromPath(_:), v69);
  v28 = swift_bridgeObjectRetain(v21);
  v29 = v21;
  v30 = v67;
  URL.init(filePath:directoryHint:relativeTo:)(v22, v29, v6, v24, v28);
  v31 = v63;
  v72 = v65;
  v73 = v63;
  v32 = v25;
  v33 = v64;
  v26(v6, v32, v27);
  v34 = v68;
  v35 = sub_10001CF54();
  URL.appending<A>(path:directoryHint:)(&v72, v6, &type metadata for String, v35);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v27);
  v36 = *(void (**)(char *, uint64_t))(v33 + 8);
  v37 = v16;
  v38 = v66;
  v69 = v10;
  v36(v37, v10);
  swift_bridgeObjectRelease(v31);
  v39 = type metadata accessor for PropertyListEncoder(0);
  swift_allocObject(v39, *(unsigned int *)(v39 + 48), *(unsigned __int16 *)(v39 + 52));
  v40 = PropertyListEncoder.init()();
  dispatch thunk of PropertyListEncoder.outputFormat.setter(100);
  v41 = sub_10000228C(&qword_100051270, (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition, (uint64_t)&protocol conformance descriptor for TaskDefinition);
  v42 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v38, v30, v41);
  v44 = v43;
  v45 = (char *)v62[0];
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v46 = type metadata accessor for Logger(0);
  v47 = sub_10000A8E8(v46, (uint64_t)qword_100052B80);
  v48 = (*(uint64_t (**)(char *, char *, uint64_t))(v33 + 16))(v45, v34, v69);
  v67 = v47;
  v49 = Logger.logObject.getter(v48);
  v50 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc(12, -1);
    v52 = swift_slowAlloc(32, -1);
    v72 = v52;
    v64 = v42;
    *(_DWORD *)v51 = 136315138;
    v66 = v36;
    v53 = sub_10000228C(&qword_100051630, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v65 = v44;
    v54 = v69;
    v55 = dispatch thunk of CustomStringConvertible.description.getter(v69, v53);
    v57 = v56;
    v70 = sub_100008204(v55, v56, &v72);
    v36 = v66;
    v42 = v64;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v51 + 4, v51 + 12);
    swift_bridgeObjectRelease(v57);
    v58 = v54;
    v44 = v65;
    v36((char *)v62[0], v58);
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Storing taskDefinition at URL: %s", v51, 0xCu);
    swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
    v59 = v52;
    v34 = v68;
    swift_slowDealloc(v59, -1, -1);
    swift_slowDealloc(v51, -1, -1);
  }
  else
  {
    v36(v45, v69);
  }

  Data.write(to:options:)(v34, 0, v42, v44);
  countAndFlagsBits = URL.path(percentEncoded:)(0)._countAndFlagsBits;
  sub_10000AA84(v42, v44);
  swift_release(v40);
  v36(v34, v69);
  return countAndFlagsBits;
}

uint64_t sub_100015F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t inited;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t *, _QWORD);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t *, _QWORD);
  uint64_t v53;
  int v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66[48];
  uint64_t v67;

  sub_100007800(&qword_100051680);
  __chkstk_darwin();
  v60 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskRequest(0);
  v62 = *(_QWORD *)(v5 - 8);
  v63 = v5;
  __chkstk_darwin();
  v61 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007800(&qword_100051688);
  __chkstk_darwin();
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for XPCActivityCriteria(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v59 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskDefinition(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin();
  v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v16(a2, a1, v12);
  v17 = sub_100007800(&qword_1000512C0);
  inited = swift_initStackObject(v17, v66);
  *(_OWORD *)(inited + 16) = xmmword_100038D20;
  v19 = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)(v15, a2, v12);
  v20 = TaskDefinition.bundleIdentifier.getter(v19);
  v22 = v21;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  *(_QWORD *)(inited + 32) = v20;
  *(_QWORD *)(inited + 40) = v22;
  v23 = sub_10002C418(inited);
  swift_setDeallocating(inited);
  v24 = swift_arrayDestroy(inited + 32, *(_QWORD *)(inited + 16), &type metadata for String);
  v67 = v23;
  TaskDefinition.criteria.getter(v24);
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v25((uint64_t)v8, 1, v9) == 1)
  {
    v26 = sub_10000A934((uint64_t)v8, &qword_100051688);
    v28 = v62;
    v27 = v63;
  }
  else
  {
    v29 = v59;
    v30 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(v59, v8, v9);
    v31 = XPCActivityCriteria.duetRelatedApplications.getter(v30);
    if (v31)
    {
      v32 = v31;
      v58 = v9;
      v33 = *(_QWORD *)(v31 + 16);
      if (v33)
      {
        v34 = (uint64_t *)(v31 + 40);
        do
        {
          v35 = *(v34 - 1);
          v36 = *v34;
          swift_bridgeObjectRetain(*v34);
          sub_10002A6D0(&v64, v35, v36);
          swift_bridgeObjectRelease(v65);
          v34 += 2;
          --v33;
        }
        while (v33);
      }
      swift_bridgeObjectRelease(v32);
      v9 = v58;
    }
    v37 = (void (*)(uint64_t *, _QWORD))TaskDefinition.criteria.modify(&v64);
    if (!v25(v38, 1, v9))
    {
      v39 = v67;
      v40 = swift_bridgeObjectRetain(v67);
      v41 = sub_10002BE54(v40);
      swift_bridgeObjectRelease(v39);
      XPCActivityCriteria.duetRelatedApplications.setter(v41);
    }
    v37(&v64, 0);
    v28 = v62;
    v27 = v63;
    v26 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v29, v9);
  }
  v42 = (uint64_t)v60;
  TaskDefinition.taskRequest.getter(v26);
  v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 48);
  if (v43(v42, 1, v27) == 1)
  {
    swift_bridgeObjectRelease(v67);
    return sub_10000A934(v42, &qword_100051680);
  }
  else
  {
    v45 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 32))(v61, v42, v27);
    v46 = TaskRequest.relatedApplications.getter(v45);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)(v46 + 16);
      if (v48)
      {
        v49 = (uint64_t *)(v46 + 40);
        do
        {
          v50 = *(v49 - 1);
          v51 = *v49;
          swift_bridgeObjectRetain(*v49);
          sub_10002A6D0(&v64, v50, v51);
          swift_bridgeObjectRelease(v65);
          v49 += 2;
          --v48;
        }
        while (v48);
      }
      swift_bridgeObjectRelease(v47);
    }
    v52 = (void (*)(uint64_t *, _QWORD))TaskDefinition.taskRequest.modify(&v64);
    v54 = v43(v53, 1, v27);
    v55 = v67;
    if (v54)
    {
      swift_bridgeObjectRelease(v67);
    }
    else
    {
      v56 = sub_10002BE54(v67);
      swift_bridgeObjectRelease(v55);
      TaskRequest.relatedApplications.setter(v56);
    }
    v52(&v64, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v61, v27);
  }
}

uint64_t sub_100016394(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint8_t *v37;
  uint8_t *v38;
  uint64_t v39;
  os_log_t v40;
  uint64_t v41[3];
  char v42[24];
  uint64_t v43;
  uint64_t v44;

  v4 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MLHostTask(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1 + 64;
  swift_beginAccess(a1 + 64, v42, 0, 0);
  v12 = *(_QWORD *)(a1 + 64);
  swift_bridgeObjectRetain(v12);
  v14 = MLHostTask.name.getter(v13);
  v16 = v15;
  if (*(_QWORD *)(v12 + 16))
  {
    sub_1000088BC(v14, v15);
    v18 = v17;
    swift_bridgeObjectRelease(v12);
    v19 = swift_bridgeObjectRelease(v16);
    if ((v18 & 1) != 0)
    {
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v20 = type metadata accessor for Logger(0);
      sub_10000A8E8(v20, (uint64_t)qword_100052B80);
      v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
      v22 = Logger.logObject.getter(v21);
      v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v40 = v22;
        v24 = (uint8_t *)swift_slowAlloc(12, -1);
        v25 = swift_slowAlloc(32, -1);
        v39 = v25;
        v41[0] = v25;
        v38 = v24;
        *(_DWORD *)v24 = 136315138;
        v37 = v24 + 4;
        v26 = MLHostTask.name.getter(v25);
        v28 = v27;
        v43 = sub_100008204(v26, v27, v41);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v37, v24 + 12);
        swift_bridgeObjectRelease(v28);
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        v22 = v40;
        v29 = v23;
        v30 = v38;
        _os_log_impl((void *)&_mh_execute_header, v40, v29, "Task %s already present in TaskRegistry is being replaced.", v38, 0xCu);
        v31 = v39;
        swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v31, -1, -1);
        swift_slowDealloc(v30, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }

    }
  }
  else
  {
    swift_bridgeObjectRelease(v12);
    v19 = swift_bridgeObjectRelease(v16);
  }
  v32 = MLHostTask.name.getter(v19);
  v34 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a2, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  swift_beginAccess(v11, v41, 33, 0);
  sub_10000E5D4((uint64_t)v6, v32, v34);
  return swift_endAccess(v41);
}

void sub_1000166B4(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
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
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint8_t *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint8_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  void *v74;
  char isUniquelyReferenced_nonNull_native;
  void (*v76)(uint64_t, uint64_t);
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int (*v92)(uint64_t *, uint64_t, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(char *, uint64_t, uint64_t);
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __n128 v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  void (*v110)(char *, uint64_t);
  Swift::String v111;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  char *v119;
  uint64_t v120;
  void *v121;
  char v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  uint64_t v130;
  int64_t v131;
  unint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  NSString v140;
  id v141;
  id v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  _QWORD *v146;
  void *v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  int64_t v152;
  _QWORD *v153;
  os_unfair_lock_s *v154;
  _QWORD *v155;
  uint64_t v156;
  NSObject *v157;
  os_log_type_t v158;
  uint8_t *v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int64_t v166;
  uint64_t v167;
  int64_t v168;
  char *v169;
  char *v170;
  uint64_t v171;
  char *v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unsigned int (*v181)(uint64_t *, uint64_t, uint64_t);
  uint64_t *v182;
  uint64_t *v183;
  _QWORD *v184;
  _QWORD *v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t *v189;
  char *v190;
  uint64_t v191;
  char *v192;
  char *v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  id v202;
  char v203[8];
  id v204;
  uint64_t v205;

  v2 = v1;
  v175 = type metadata accessor for URL.DirectoryHint(0);
  v174 = *(_QWORD *)(v175 - 8);
  __chkstk_darwin(v175);
  v173 = (char *)&v162 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v5);
  v172 = (char *)&v162 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v171 = type metadata accessor for URL(0);
  v180 = *(_QWORD *)(v171 - 8);
  v7 = __chkstk_darwin(v171);
  v170 = (char *)&v162 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v169 = (char *)&v162 - v9;
  v10 = type metadata accessor for TaskType(0);
  v197 = *(_QWORD *)(v10 - 8);
  v198 = v10;
  __chkstk_darwin(v10);
  v196 = (char *)&v162 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for MLHostTask(0);
  v194 = *(_QWORD *)(v12 - 8);
  v195 = v12;
  v13 = __chkstk_darwin(v12);
  v193 = (char *)&v162 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v192 = (char *)&v162 - v15;
  v16 = type metadata accessor for TaskDefinition(0);
  v201 = *(_QWORD *)(v16 - 8);
  v17 = __chkstk_darwin(v16);
  v183 = (uint64_t *)((char *)&v162 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = __chkstk_darwin(v17);
  v21 = (uint64_t)&v162 - v20;
  v22 = __chkstk_darwin(v19);
  v188 = (char *)&v162 - v23;
  v24 = __chkstk_darwin(v22);
  v186 = (uint64_t)&v162 - v25;
  __chkstk_darwin(v24);
  v190 = (char *)&v162 - v26;
  v27 = sub_100007800(&qword_1000516C8);
  v28 = __chkstk_darwin(v27);
  v184 = (uint64_t *)((char *)&v162 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  v30 = __chkstk_darwin(v28);
  v182 = (uint64_t *)((char *)&v162 - v31);
  v32 = __chkstk_darwin(v30);
  v34 = (unint64_t)&v162 - v33;
  __chkstk_darwin(v32);
  v36 = (uint64_t *)((char *)&v162 - v35);
  if (qword_100050F28 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once(&qword_100050F28, sub_10001E040);
LABEL_2:
    v37 = type metadata accessor for Logger(0);
    v38 = sub_10000A8E8(v37, (uint64_t)qword_100052B80);
    v39 = Logger.logObject.getter(v38);
    v40 = static os_log_type_t.info.getter();
    v41 = os_log_type_enabled(v39, v40);
    v185 = (_QWORD *)v2;
    if (v41)
    {
      v42 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Loading tasks from StaticRegistry.", v42, 2u);
      v2 = (unint64_t)v185;
      swift_slowDealloc(v42, -1, -1);
    }
    v176 = v21;

    v43 = sub_1000177EC(*(_QWORD *)(v2 + 16), a1);
    v164 = v38;
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = v43;
      v47 = a1;
      v48 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Loading tasks from DynamicRegistry.", v48, 2u);
      v49 = v48;
      a1 = v47;
      v43 = v46;
      swift_slowDealloc(v49, -1, -1);
    }

    v50 = sub_100007800(&qword_1000512C0);
    v51 = swift_allocObject(v50, 48, 7);
    *(_OWORD *)(v51 + 16) = xmmword_100038D20;
    v52 = *(_QWORD *)(v2 + 32);
    *(_QWORD *)(v51 + 32) = *(_QWORD *)(v2 + 24);
    *(_QWORD *)(v51 + 40) = v52;
    swift_bridgeObjectRetain(v52);
    v53 = sub_1000177EC(v51, a1);
    v54 = swift_bridgeObjectRelease(v51);
    v199 = v34;
    v189 = v36;
    if (a1)
    {
      __chkstk_darwin(v54);
      *(&v162 - 2) = a1;
      v55 = a1;
      v56 = sub_10001AC00(v43, (uint64_t (*)(uint64_t, uint64_t, char *, __n128))sub_10001D2F8, (uint64_t)(&v162 - 4));
      v57 = swift_bridgeObjectRelease(v43);
      __chkstk_darwin(v57);
      *(&v162 - 2) = v55;
      v58 = sub_10001AC00(v53, (uint64_t (*)(uint64_t, uint64_t, char *, __n128))sub_10001D2D0, (uint64_t)(&v162 - 4));
      swift_bridgeObjectRelease(v53);
      v43 = v56;
      v53 = v58;
    }
    v59 = sub_10001A2D0(v43);
    swift_bridgeObjectRelease(v43);
    v177 = sub_10001A2D0(v53);
    v187 = 0;
    swift_bridgeObjectRelease(v53);
    v60 = sub_10001D9FC((uint64_t)_swiftEmptyArrayStorage);
    v200 = 0;
    v202 = (id)v60;
    v61 = *(_QWORD *)(v59 + 64);
    v166 = v59 + 64;
    v178 = v59;
    v62 = 1 << *(_BYTE *)(v59 + 32);
    v63 = -1;
    if (v62 < 64)
      v63 = ~(-1 << v62);
    v2 = v63 & v61;
    LODWORD(v181) = enum case for TaskType.staticTask(_:);
    v168 = (unint64_t)(v62 + 63) >> 6;
    v165 = v168 - 1;
    v34 = (unint64_t)&unk_1000516D0;
    v191 = v16;
    a1 = v201;
    if ((v63 & v61) != 0)
      break;
LABEL_15:
    v21 = v199;
    v86 = v200 + 1;
    v36 = v189;
    if (!__OFADD__(v200, 1))
    {
      if (v86 < v168)
      {
        v87 = *(_QWORD *)(v166 + 8 * v86);
        if (v87)
        {
LABEL_18:
          v2 = (v87 - 1) & v87;
          v79 = __clz(__rbit64(v87)) + (v86 << 6);
          v200 = v86;
          goto LABEL_14;
        }
        v88 = v200 + 2;
        ++v200;
        if (v86 + 1 < v168)
        {
          v87 = *(_QWORD *)(v166 + 8 * v88);
          if (v87)
          {
LABEL_21:
            v86 = v88;
            goto LABEL_18;
          }
          v200 = v86 + 1;
          if (v86 + 2 < v168)
          {
            v87 = *(_QWORD *)(v166 + 8 * (v86 + 2));
            if (v87)
            {
              v86 += 2;
              goto LABEL_18;
            }
            v88 = v86 + 3;
            v200 = v86 + 2;
            if (v86 + 3 < v168)
            {
              v87 = *(_QWORD *)(v166 + 8 * v88);
              if (v87)
                goto LABEL_21;
              while (1)
              {
                v86 = v88 + 1;
                if (__OFADD__(v88, 1))
                {
                  __break(1u);
LABEL_77:
                  __break(1u);
                }
                if (v86 >= v168)
                  break;
                v87 = *(_QWORD *)(v166 + 8 * v86);
                ++v88;
                if (v87)
                  goto LABEL_18;
              }
              v200 = v165;
            }
          }
        }
      }
      v89 = sub_100007800((uint64_t *)v34);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v21, 1, 1, v89);
      v2 = 0;
      goto LABEL_33;
    }
    __break(1u);
LABEL_74:
    __break(1u);
  }
  while (1)
  {
    v78 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    v21 = v199;
    v79 = v78 | (v200 << 6);
    v36 = v189;
LABEL_14:
    v80 = *(_QWORD *)(v178 + 56);
    v81 = (_QWORD *)(*(_QWORD *)(v178 + 48) + 16 * v79);
    v82 = v81[1];
    *(_QWORD *)v21 = *v81;
    *(_QWORD *)(v21 + 8) = v82;
    v83 = v201;
    v84 = v80 + *(_QWORD *)(v201 + 72) * v79;
    v85 = sub_100007800((uint64_t *)v34);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v21 + *(int *)(v85 + 48), v84, v16);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v85 - 8) + 56))(v21, 0, 1, v85);
    swift_bridgeObjectRetain(v82);
LABEL_33:
    sub_10001D288(v21, (uint64_t)v36);
    v90 = sub_100007800((uint64_t *)v34);
    v91 = *(_QWORD *)(v90 - 8);
    v92 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v91 + 48);
    if (v92(v36, 1, v90) == 1)
      break;
    v65 = *v36;
    v64 = v36[1];
    v66 = (uint64_t)v190;
    (*(void (**)(char *, char *, uint64_t))(a1 + 32))(v190, (char *)v36 + *(int *)(v90 + 48), v16);
    v67 = v34;
    v68 = v186;
    sub_100015F18(v66, v186);
    v69 = v188;
    (*(void (**)(char *, uint64_t, uint64_t))(a1 + 16))(v188, v68, v16);
    v70 = v196;
    (*(void (**)(char *, _QWORD, uint64_t))(v197 + 104))(v196, v181, v198);
    v71 = v192;
    MLHostTask.init(taskDefinition:taskType:taskFolder:)(v69, v70, 0, 0);
    v72 = (uint64_t)v193;
    v73 = v71;
    v16 = v191;
    (*(void (**)(char *, char *, uint64_t))(v194 + 32))(v193, v73, v195);
    v74 = v202;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v202);
    v204 = v74;
    sub_10002B224(v72, v65, v64, isUniquelyReferenced_nonNull_native);
    v202 = v204;
    swift_bridgeObjectRelease(v64);
    swift_bridgeObjectRelease(0x8000000000000000);
    v76 = *(void (**)(uint64_t, uint64_t))(a1 + 8);
    v77 = v68;
    v34 = v67;
    v76(v77, v16);
    v76(v66, v16);
    if (!v2)
      goto LABEL_15;
  }
  v181 = v92;
  swift_release(v178);
  v21 = 0;
  v93 = *(_QWORD *)(v177 + 64);
  v165 = v177 + 64;
  v94 = 1 << *(_BYTE *)(v177 + 32);
  v95 = -1;
  if (v94 < 64)
    v95 = ~(-1 << v94);
  v34 = v95 & v93;
  LODWORD(v168) = enum case for URL.DirectoryHint.inferFromPath(_:);
  LODWORD(v178) = enum case for TaskType.dynamicTask(_:);
  v166 = (unint64_t)(v94 + 63) >> 6;
  v163 = v166 - 1;
  v36 = v183;
  a1 = v176;
  v179 = v91;
  v167 = v90;
  while (1)
  {
    v124 = (uint64_t)v184;
    if (v34)
    {
      v125 = __clz(__rbit64(v34));
      v126 = (v34 - 1) & v34;
      v127 = v125 | (v21 << 6);
LABEL_41:
      v128 = *(_QWORD *)(v177 + 56);
      v129 = (_QWORD *)(*(_QWORD *)(v177 + 48) + 16 * v127);
      v130 = v129[1];
      *v184 = *v129;
      *(_QWORD *)(v124 + 8) = v130;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v201 + 16))(v124 + *(int *)(v90 + 48), v128 + *(_QWORD *)(v201 + 72) * v127, v16);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v91 + 56))(v124, 0, 1, v90);
      swift_bridgeObjectRetain(v130);
      goto LABEL_51;
    }
    v131 = v21 + 1;
    if (__OFADD__(v21, 1))
      goto LABEL_74;
    if (v131 < v166)
    {
      v132 = *(_QWORD *)(v165 + 8 * v131);
      if (v132)
        goto LABEL_45;
      v21 += 2;
      if (v131 + 1 >= v166)
      {
        v21 = v131;
      }
      else
      {
        v132 = *(_QWORD *)(v165 + 8 * v21);
        if (v132)
        {
          ++v131;
LABEL_45:
          v126 = (v132 - 1) & v132;
          v127 = __clz(__rbit64(v132)) + (v131 << 6);
          v21 = v131;
          goto LABEL_41;
        }
        if (v131 + 2 < v166)
        {
          v132 = *(_QWORD *)(v165 + 8 * (v131 + 2));
          if (v132)
          {
            v131 += 2;
            goto LABEL_45;
          }
          v152 = v131 + 3;
          if (v131 + 3 >= v166)
          {
            v21 = v131 + 2;
          }
          else
          {
            v132 = *(_QWORD *)(v165 + 8 * v152);
            if (v132)
            {
              v131 += 3;
              goto LABEL_45;
            }
            while (1)
            {
              v131 = v152 + 1;
              if (__OFADD__(v152, 1))
                goto LABEL_77;
              if (v131 >= v166)
                break;
              v132 = *(_QWORD *)(v165 + 8 * v131);
              ++v152;
              if (v132)
                goto LABEL_45;
            }
            v21 = v163;
          }
        }
      }
    }
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v91 + 56))(v184, 1, 1, v90);
    v126 = 0;
LABEL_51:
    v133 = v182;
    sub_10001D288(v124, (uint64_t)v182);
    if (v181(v133, 1, v90) == 1)
      break;
    v188 = (char *)v126;
    v134 = (uint64_t)v36;
    v136 = *v133;
    v135 = v133[1];
    (*(void (**)(uint64_t, char *, uint64_t))(v201 + 32))(a1, (char *)v133 + *(int *)(v90 + 48), v16);
    sub_100015F18(a1, v134);
    v137 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
    v138 = (uint64_t)v185;
    v139 = v185[5];
    v186 = v185[6];
    v140 = String._bridgeToObjectiveC()();
    v204 = 0;
    v141 = objc_msgSend(v137, "contentsOfDirectoryAtPath:error:", v140, &v204);

    v142 = v204;
    if (v141)
    {
      v143 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v141, &type metadata for String);
      v144 = v142;

      swift_retain(v138);
      v145 = v187;
      v146 = sub_10001AD70(v143, v138);
      v187 = v145;
      swift_bridgeObjectRelease(v143);
      swift_release(v138);
      v147 = (void *)sub_10002C418((uint64_t)v146);
      swift_bridgeObjectRelease(v146);
    }
    else
    {
      v148 = v204;
      v149 = _convertNSErrorToError(_:)(v142);

      swift_willThrow(v150);
      swift_errorRelease(v149);
      v187 = 0;
      v147 = &_swiftEmptySetSingleton;
    }
    v189 = (uint64_t *)v21;
    v200 = v136;
    v151 = sub_10000E748(v136, v135, (uint64_t)v147);
    swift_bridgeObjectRelease(v147);
    v199 = v135;
    if ((v151 & 1) != 0)
    {
      v96 = v172;
      v97 = v171;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v180 + 56))(v172, 1, 1, v171);
      v98 = v174;
      v99 = *(void (**)(char *, uint64_t, uint64_t))(v174 + 104);
      v100 = v173;
      v101 = v139;
      v102 = v168;
      v103 = v175;
      v99(v173, v168, v175);
      v104 = v186;
      v105 = swift_bridgeObjectRetain(v186);
      v106 = v170;
      URL.init(filePath:directoryHint:relativeTo:)(v101, v104, v100, v96, v105);
      v204 = (id)v200;
      v205 = v199;
      v107 = v102;
      v90 = v167;
      v99(v100, v107, v103);
      v108 = sub_10001CF54();
      v109 = v169;
      URL.appending<A>(path:directoryHint:)(&v204, v100, &type metadata for String, v108);
      (*(void (**)(char *, uint64_t))(v98 + 8))(v100, v103);
      v110 = *(void (**)(char *, uint64_t))(v180 + 8);
      a1 = v176;
      v110(v106, v97);
      v111 = URL.path(percentEncoded:)(0);
      countAndFlagsBits = v111._countAndFlagsBits;
      object = v111._object;
      v114 = v97;
      v36 = v183;
      v110(v109, v114);
      v115 = v198;
      v16 = v191;
    }
    else
    {
      countAndFlagsBits = 0;
      object = 0;
      v115 = v198;
      v16 = v191;
      v36 = v183;
    }
    v116 = v201;
    v117 = v190;
    (*(void (**)(char *, uint64_t *, uint64_t))(v201 + 16))(v190, v36, v16);
    v118 = v196;
    (*(void (**)(char *, _QWORD, uint64_t))(v197 + 104))(v196, v178, v115);
    v119 = v192;
    MLHostTask.init(taskDefinition:taskType:taskFolder:)(v117, v118, countAndFlagsBits, object);
    v120 = (uint64_t)v193;
    (*(void (**)(char *, char *, uint64_t))(v194 + 32))(v193, v119, v195);
    v121 = v202;
    v122 = swift_isUniquelyReferenced_nonNull_native(v202);
    v204 = v121;
    v123 = v199;
    sub_10002B224(v120, v200, v199, v122);
    v202 = v204;
    swift_bridgeObjectRelease(v123);
    swift_bridgeObjectRelease(0x8000000000000000);
    v2 = *(_QWORD *)(v116 + 8);
    ((void (*)(uint64_t *, uint64_t))v2)(v36, v16);
    ((void (*)(uint64_t, uint64_t))v2)(a1, v16);
    v91 = v179;
    v21 = (uint64_t)v189;
    v34 = (unint64_t)v188;
  }
  swift_release(v177);
  v153 = v185;
  v154 = (os_unfair_lock_s *)(v185[7] + 16);
  os_unfair_lock_lock(v154);
  v155 = v202;
  swift_bridgeObjectRetain(v202);
  v157 = Logger.logObject.getter(v156);
  v158 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v157, v158))
  {
    v159 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v159 = 134217984;
    v204 = (id)v155[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v204, &v205, v159 + 4, v159 + 12);
    swift_bridgeObjectRelease(v155);
    _os_log_impl((void *)&_mh_execute_header, v157, v158, "Injecting %ld tasks in TaskRegistry.", v159, 0xCu);
    swift_slowDealloc(v159, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease(v155);
  }
  swift_beginAccess(&v202, &v204, 0, 0);
  v160 = v202;
  swift_beginAccess(v153 + 8, v203, 1, 0);
  v161 = v153[8];
  v153[8] = v160;
  swift_bridgeObjectRelease(v161);
  os_unfair_lock_unlock(v154);
}

uint64_t sub_1000177EC(unint64_t a1, uint64_t a2)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  __n128 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37;
  NSString v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void **v44;
  uint64_t v45;
  void *v46;
  Swift::String v47;
  unint64_t v48;
  Swift::String v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  _QWORD *v72;
  __n128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  char v78;
  void (*v79)(char *, char *, uint64_t);
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  uint64_t v86;
  __n128 v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  char *v91;
  void (*v92)(char *, char *, uint64_t);
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  void (*v105)(char *, uint64_t);
  _QWORD *v106;
  void (*v107)(char *, uint64_t);
  uint64_t v108;
  NSObject *v109;
  os_log_type_t v110;
  char *v111;
  uint64_t v112;
  _QWORD *v113;
  __n128 v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  char *v118;
  void (*v119)(char *, uint64_t);
  char *v120;
  _QWORD *v121;
  __n128 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v128;
  uint64_t v129;
  _BOOL8 v130;
  uint64_t v131;
  char v132;
  unint64_t v133;
  char v134;
  _QWORD *v135;
  uint64_t *v136;
  uint64_t v137;
  BOOL v138;
  uint64_t v139;
  _QWORD *v140;
  _QWORD *v141;
  uint64_t v142;
  uint64_t v143;
  NSObject *v144;
  os_log_type_t v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD *v151;
  uint64_t v152;
  unint64_t v153;
  NSObject *v154;
  os_log_type_t v155;
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t result;
  uint64_t v163;
  unint64_t v164;
  __n128 v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  unint64_t v169;
  id v170;
  uint64_t v171;
  char *v172;
  char *v173;
  uint64_t v174;
  __n128 v175;
  char *v176;
  char *v177;
  void (*v178)(char *, char *, uint64_t);
  char *v179;
  uint64_t v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t (*v183)(char *, char *, uint64_t);
  char *v184;
  __n128 v185;
  uint64_t v186;
  char *v187;
  _QWORD *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  char v194[8];
  _QWORD *v195;
  void (*v196)(char *, char *, uint64_t);
  unint64_t v197;

  v5 = sub_100007800(&qword_100051650);
  __chkstk_darwin(v5);
  v187 = (char *)&v163 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskDefinition(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v184 = (char *)&v163 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v179 = (char *)&v163 - v12;
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v163 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v163 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v163 - v19;
  v195 = (_QWORD *)sub_10001DC60((uint64_t)_swiftEmptyArrayStorage);
  v171 = *(_QWORD *)(a1 + 16);
  if (v171)
  {
    v170 = (id)objc_opt_self(NSFileManager);
    v169 = a1 + 32;
    v176 = v194;
    v164 = a1;
    v21 = swift_bridgeObjectRetain(a1);
    v22 = 0;
    v166 = 0;
    v21.n128_u64[0] = 136315138;
    v185 = v21;
    v167 = (char *)&type metadata for Any + 8;
    v21.n128_u64[0] = 138412290;
    v165 = v21;
    v21.n128_u64[0] = 136315394;
    v175 = v21;
    v186 = v2;
    v180 = a2;
    v190 = v7;
    v192 = v8;
    v177 = v20;
    v172 = v15;
    v173 = v18;
    do
    {
      v174 = v22;
      v24 = v169 + 16 * v22;
      v25 = *(_QWORD **)v24;
      v26 = *(_QWORD *)(v24 + 8);
      v27 = qword_100050F28;
      swift_bridgeObjectRetain(v26);
      if (v27 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v28 = type metadata accessor for Logger(0);
      v29 = sub_10000A8E8(v28, (uint64_t)qword_100052B80);
      v30 = swift_bridgeObjectRetain_n(v26, 2);
      v31 = Logger.logObject.getter(v30);
      v32 = static os_log_type_t.info.getter();
      v33 = os_log_type_enabled(v31, v32);
      v188 = v25;
      if (v33)
      {
        v34 = swift_slowAlloc(12, -1);
        v35 = (_QWORD *)swift_slowAlloc(32, -1);
        v196 = v35;
        *(_DWORD *)v34 = v185.n128_u32[0];
        swift_bridgeObjectRetain(v26);
        *(_QWORD *)(v34 + 4) = sub_100008204((uint64_t)v188, v26, (uint64_t *)&v196);
        swift_bridgeObjectRelease_n(v26, 3);
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Loading tasks from folder: %s", (uint8_t *)v34, 0xCu);
        swift_arrayDestroy(v35, 1, v167);
        v36 = v35;
        v25 = v188;
        swift_slowDealloc(v36, -1, -1);
        swift_slowDealloc(v34, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v26, 2);
      }
      v37 = objc_msgSend(v170, "defaultManager");
      v38 = String._bridgeToObjectiveC()();
      v196 = 0;
      v39 = objc_msgSend(v37, "contentsOfDirectoryAtPath:error:", v38, &v196);

      v40 = v196;
      if (v39)
      {
        v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v39, &type metadata for String);
        v42 = v40;

        v43 = *(_QWORD *)(v41 + 16);
        if (v43)
        {
          v168 = v41;
          v44 = (void **)(v41 + 40);
          v181 = v26;
          v182 = v29;
          while (1)
          {
            v191 = v43;
            v45 = (uint64_t)*(v44 - 1);
            v46 = *v44;
            v196 = v25;
            v197 = v26;
            swift_bridgeObjectRetain(v26);
            swift_bridgeObjectRetain(v46);
            v47._countAndFlagsBits = 47;
            v47._object = (void *)0xE100000000000000;
            String.append(_:)(v47);
            v48 = v197;
            swift_bridgeObjectRetain(v197);
            v49._countAndFlagsBits = v45;
            v49._object = v46;
            String.append(_:)(v49);
            swift_bridgeObjectRelease(v48);
            swift_bridgeObjectRelease(v46);
            v50 = (uint64_t)v196;
            v51 = v197;
            v52 = swift_bridgeObjectRetain_n(v197, 2);
            v53 = Logger.logObject.getter(v52);
            v54 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v53, v54))
            {
              v55 = swift_slowAlloc(12, -1);
              v56 = (_QWORD *)swift_slowAlloc(32, -1);
              v196 = v56;
              *(_DWORD *)v55 = v185.n128_u32[0];
              swift_bridgeObjectRetain(v51);
              *(_QWORD *)(v55 + 4) = sub_100008204(v50, v51, (uint64_t *)&v196);
              swift_bridgeObjectRelease_n(v51, 3);
              _os_log_impl((void *)&_mh_execute_header, v53, v54, "Loading task from: %s", (uint8_t *)v55, 0xCu);
              swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
              v57 = v56;
              v7 = v190;
              swift_slowDealloc(v57, -1, -1);
              swift_slowDealloc(v55, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n(v51, 2);
            }
            v58 = v192;
            v59 = v187;
            v189 = v50;
            sub_100011D70(v50, v51, v187);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v59, 1, v7) == 1)
            {
              sub_10000A934((uint64_t)v59, &qword_100051650);
              swift_bridgeObjectRetain(v51);
              v61 = Logger.logObject.getter(v60);
              v62 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v61, v62))
              {
                v63 = swift_slowAlloc(12, -1);
                v64 = (_QWORD *)swift_slowAlloc(32, -1);
                v196 = v64;
                *(_DWORD *)v63 = v185.n128_u32[0];
                swift_bridgeObjectRetain(v51);
                *(_QWORD *)(v63 + 4) = sub_100008204(v189, v51, (uint64_t *)&v196);
                swift_bridgeObjectRelease_n(v51, 3);
                _os_log_impl((void *)&_mh_execute_header, v61, v62, "Skipping loading from: %s", (uint8_t *)v63, 0xCu);
                swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
                v65 = v64;
                v7 = v190;
                swift_slowDealloc(v65, -1, -1);
                swift_slowDealloc(v63, -1, -1);

              }
              else
              {

                swift_bridgeObjectRelease_n(v51, 2);
              }
            }
            else
            {
              v183 = *(uint64_t (**)(char *, char *, uint64_t))(v58 + 32);
              v66 = v183(v20, v59, v7);
              v67 = v180;
              if (v180
                && (v68 = TaskDefinition.bundleIdentifier.getter(v66),
                    v70 = v69,
                    v71 = sub_10000E748(v68, v69, v67),
                    swift_bridgeObjectRelease(v70),
                    (v71 & 1) == 0))
              {
                swift_bridgeObjectRelease(v51);
                v94 = v173;
                v95 = (*(uint64_t (**)(char *, char *, uint64_t))(v58 + 16))(v173, v20, v7);
                v96 = v20;
                v97 = v58;
                v98 = Logger.logObject.getter(v95);
                v99 = static os_log_type_t.info.getter();
                if (os_log_type_enabled(v98, v99))
                {
                  v100 = swift_slowAlloc(12, -1);
                  v101 = (_QWORD *)swift_slowAlloc(32, -1);
                  v196 = v101;
                  *(_DWORD *)v100 = v185.n128_u32[0];
                  v102 = ((uint64_t (*)(void))TaskDefinition.name.getter)();
                  v104 = v103;
                  *(_QWORD *)(v100 + 4) = sub_100008204(v102, v103, (uint64_t *)&v196);
                  swift_bridgeObjectRelease(v104);
                  v105 = *(void (**)(char *, uint64_t))(v97 + 8);
                  v105(v94, v190);
                  _os_log_impl((void *)&_mh_execute_header, v98, v99, "Task %s is discared because its bundleIdentifier is not available in the OS.", (uint8_t *)v100, 0xCu);
                  swift_arrayDestroy(v101, 1, (char *)&type metadata for Any + 8);
                  v106 = v101;
                  v7 = v190;
                  swift_slowDealloc(v106, -1, -1);
                  swift_slowDealloc(v100, -1, -1);

                  v105(v96, v7);
                }
                else
                {

                  v107 = *(void (**)(char *, uint64_t))(v97 + 8);
                  v107(v94, v7);
                  v107(v96, v7);
                }
                v20 = v96;
                v26 = v181;
              }
              else
              {
                v72 = v195;
                v73 = swift_bridgeObjectRetain(v195);
                v74 = TaskDefinition.name.getter(v73);
                v76 = v75;
                if (v72[2])
                {
                  sub_1000088BC(v74, v75);
                  v78 = v77;
                  swift_bridgeObjectRelease(v72);
                  swift_bridgeObjectRelease(v76);
                  v79 = *(void (**)(char *, char *, uint64_t))(v192 + 16);
                  v80 = v179;
                  if ((v78 & 1) != 0)
                  {
                    v81 = v20;
                    v82 = v172;
                    v79(v172, v81, v7);
                    v83 = swift_bridgeObjectRetain_n(v51, 2);
                    v84 = Logger.logObject.getter(v83);
                    v85 = static os_log_type_t.error.getter();
                    if (os_log_type_enabled(v84, v85))
                    {
                      v86 = swift_slowAlloc(22, -1);
                      v178 = (void (*)(char *, char *, uint64_t))swift_slowAlloc(64, -1);
                      v196 = v178;
                      v87 = v175;
                      *(_DWORD *)v86 = v175.n128_u32[0];
                      v88 = TaskDefinition.name.getter(v87);
                      v90 = v89;
                      v193 = sub_100008204(v88, v89, (uint64_t *)&v196);
                      v91 = v176;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v176, v86 + 4, v86 + 12);
                      swift_bridgeObjectRelease(v90);
                      (*(void (**)(char *, uint64_t))(v192 + 8))(v82, v190);
                      *(_WORD *)(v86 + 12) = 2080;
                      swift_bridgeObjectRetain(v51);
                      v193 = sub_100008204(v189, v51, (uint64_t *)&v196);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v91, v86 + 14, v86 + 22);
                      swift_bridgeObjectRelease_n(v51, 3);
                      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Task %s already in registry is overlayed by %s", (uint8_t *)v86, 0x16u);
                      v92 = v178;
                      swift_arrayDestroy(v178, 2, (char *)&type metadata for Any + 8);
                      v7 = v190;
                      swift_slowDealloc(v92, -1, -1);
                      v93 = v86;
                      v80 = v179;
                      swift_slowDealloc(v93, -1, -1);

                    }
                    else
                    {
                      (*(void (**)(char *, uint64_t))(v192 + 8))(v82, v7);

                      swift_bridgeObjectRelease_n(v51, 2);
                    }
                    v20 = v177;
                  }
                  v79(v80, v20, v7);
                }
                else
                {
                  swift_bridgeObjectRelease(v72);
                  swift_bridgeObjectRelease(v76);
                  v79 = *(void (**)(char *, char *, uint64_t))(v192 + 16);
                  v80 = v179;
                  v79(v179, v20, v7);
                }
                swift_bridgeObjectRetain(v51);
                v109 = Logger.logObject.getter(v108);
                v110 = static os_log_type_t.info.getter();
                if (os_log_type_enabled(v109, v110))
                {
                  v111 = v80;
                  v112 = swift_slowAlloc(22, -1);
                  v113 = (_QWORD *)swift_slowAlloc(64, -1);
                  v196 = v113;
                  v114 = v175;
                  *(_DWORD *)v112 = v175.n128_u32[0];
                  v115 = TaskDefinition.name.getter(v114);
                  v117 = v116;
                  v193 = sub_100008204(v115, v116, (uint64_t *)&v196);
                  v178 = v79;
                  v118 = v176;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v176, v112 + 4, v112 + 12);
                  swift_bridgeObjectRelease(v117);
                  v119 = *(void (**)(char *, uint64_t))(v192 + 8);
                  v120 = v111;
                  v20 = v177;
                  v119(v120, v190);
                  *(_WORD *)(v112 + 12) = 2080;
                  swift_bridgeObjectRetain(v51);
                  v193 = sub_100008204(v189, v51, (uint64_t *)&v196);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v118, v112 + 14, v112 + 22);
                  swift_bridgeObjectRelease_n(v51, 3);
                  v79 = v178;
                  _os_log_impl((void *)&_mh_execute_header, v109, v110, "Loaded %s from: %s", (uint8_t *)v112, 0x16u);
                  swift_arrayDestroy(v113, 2, (char *)&type metadata for Any + 8);
                  v121 = v113;
                  v7 = v190;
                  swift_slowDealloc(v121, -1, -1);
                  swift_slowDealloc(v112, -1, -1);

                }
                else
                {
                  v119 = *(void (**)(char *, uint64_t))(v192 + 8);
                  v119(v80, v7);

                  swift_bridgeObjectRelease_n(v51, 2);
                }
                v123 = TaskDefinition.name.getter(v122);
                v125 = v124;
                v79(v184, v20, v7);
                v126 = v195;
                isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v195);
                v195 = (_QWORD *)0x8000000000000000;
                v196 = v126;
                a1 = sub_1000088BC(v123, v125);
                v129 = v126[2];
                v130 = (v128 & 1) == 0;
                v131 = v129 + v130;
                if (__OFADD__(v129, v130))
                {
                  __break(1u);
LABEL_61:
                  __break(1u);
                  goto LABEL_62;
                }
                v132 = v128;
                if (v126[3] >= v131)
                {
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                    sub_100019B78((uint64_t (*)(_QWORD))&type metadata accessor for TaskDefinition, &qword_1000516D8);
                }
                else
                {
                  sub_10002A888(v131, isUniquelyReferenced_nonNull_native);
                  v133 = sub_1000088BC(v123, v125);
                  if ((v132 & 1) != (v134 & 1))
                  {
                    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
                    __break(1u);
                    return result;
                  }
                  a1 = v133;
                }
                v26 = v181;
                v135 = v196;
                if ((v132 & 1) != 0)
                {
                  v7 = v190;
                  (*(void (**)(unint64_t, char *, uint64_t))(v192 + 40))(v196[7] + *(_QWORD *)(v192 + 72) * a1, v184, v190);
                }
                else
                {
                  v196[(a1 >> 6) + 8] |= 1 << a1;
                  v136 = (uint64_t *)(v135[6] + 16 * a1);
                  *v136 = v123;
                  v136[1] = v125;
                  v7 = v190;
                  v183((char *)(v135[7] + *(_QWORD *)(v192 + 72) * a1), v184, v190);
                  v137 = v135[2];
                  v138 = __OFADD__(v137, 1);
                  v139 = v137 + 1;
                  if (v138)
                    goto LABEL_61;
                  v135[2] = v139;
                  swift_bridgeObjectRetain(v125);
                }
                v140 = v195;
                v195 = v196;
                swift_bridgeObjectRelease(v125);
                swift_bridgeObjectRelease(v140);
                v119(v20, v7);
              }
            }
            v25 = v188;
            v44 += 2;
            v43 = v191 - 1;
            if (v191 == 1)
            {
              swift_bridgeObjectRelease(v26);
              v23 = v168;
              goto LABEL_4;
            }
          }
        }
        swift_bridgeObjectRelease(v26);
        v23 = v41;
LABEL_4:
        swift_bridgeObjectRelease(v23);
      }
      else
      {
        v141 = v196;
        swift_bridgeObjectRelease(v26);
        v142 = _convertNSErrorToError(_:)(v40);

        swift_willThrow();
        v166 = 0;
        swift_errorRetain(v142);
        v143 = swift_errorRetain(v142);
        v144 = Logger.logObject.getter(v143);
        v145 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v144, v145))
        {
          v146 = swift_slowAlloc(12, -1);
          v147 = (uint64_t *)swift_slowAlloc(8, -1);
          *(_DWORD *)v146 = v165.n128_u32[0];
          swift_errorRetain(v142);
          v148 = _swift_stdlib_bridgeErrorToNSError(v142);
          *(_QWORD *)(v146 + 4) = v148;
          *v147 = v148;
          swift_errorRelease(v142);
          swift_errorRelease(v142);
          _os_log_impl((void *)&_mh_execute_header, v144, v145, "Failed at reading tasks from disk: %@", (uint8_t *)v146, 0xCu);
          v149 = sub_100007800(&qword_100051288);
          swift_arrayDestroy(v147, 1, v149);
          swift_slowDealloc(v147, -1, -1);
          swift_slowDealloc(v146, -1, -1);

          swift_errorRelease(v142);
        }
        else
        {
          swift_errorRelease(v142);
          swift_errorRelease(v142);
          swift_errorRelease(v142);

        }
      }
      v22 = v174 + 1;
    }
    while (v174 + 1 != v171);
    a1 = v164;
    swift_bridgeObjectRelease(v164);
  }
  if (qword_100050F28 != -1)
LABEL_62:
    swift_once(&qword_100050F28, sub_10001E040);
  v150 = type metadata accessor for Logger(0);
  sub_10000A8E8(v150, (uint64_t)qword_100052B80);
  v151 = v195;
  swift_bridgeObjectRetain_n(a1, 2);
  swift_bridgeObjectRetain(v151);
  v153 = a1;
  v154 = Logger.logObject.getter(v152);
  v155 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v154, v155))
  {
    v156 = swift_slowAlloc(22, -1);
    v157 = (_QWORD *)swift_slowAlloc(32, -1);
    v196 = v157;
    *(_DWORD *)v156 = 134218242;
    v193 = v151[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v194, v156 + 4, v156 + 12);
    swift_bridgeObjectRelease(v151);
    *(_WORD *)(v156 + 12) = 2080;
    swift_bridgeObjectRetain(v153);
    v159 = Array.description.getter(v158, &type metadata for String);
    v161 = v160;
    swift_bridgeObjectRelease(v153);
    v193 = sub_100008204(v159, v161, (uint64_t *)&v196);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v193, v194, v156 + 14, v156 + 22);
    swift_bridgeObjectRelease_n(v153, 2);
    swift_bridgeObjectRelease(v161);
    _os_log_impl((void *)&_mh_execute_header, v154, v155, "Loaded %ld tasks from: %s.", (uint8_t *)v156, 0x16u);
    swift_arrayDestroy(v157, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v157, -1, -1);
    swift_slowDealloc(v156, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v153, 2);
    swift_bridgeObjectRelease(v151);
  }
  swift_beginAccess(&v195, (void (**)(char *, char *, uint64_t))&v196, 0, 0);
  return (uint64_t)v195;
}

uint64_t sub_10001895C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v7 = TaskDefinition.bundleIdentifier.getter(a1);
  v9 = v8;
  v10 = sub_10000E748(v7, v8, a4);
  swift_bridgeObjectRelease(v9);
  if ((v10 & 1) == 0)
  {
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v11 = type metadata accessor for Logger(0);
    sub_10000A8E8(v11, (uint64_t)qword_100052B80);
    v12 = swift_bridgeObjectRetain_n(a2, 2);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v16 = swift_slowAlloc(32, -1);
      v19 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain(a2);
      v18 = sub_100008204(a1, a2, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Task %s is discarded because its bundleIdentifier is not available in the OS.", v15, 0xCu);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
  }
  return v10 & 1;
}

uint64_t sub_100018B2C(uint64_t a1, unint64_t a2)
{
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v63 = a1;
  v64 = a2;
  v2 = sub_100007800(&qword_100051648);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v59 - v6;
  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v62 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v59 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v59 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v59 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v59 - v22;
  TaskDefinition.startDate.getter(v21);
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v24(v7, 1, v8) == 1)
  {
    v25 = sub_10000A934((uint64_t)v7, &qword_100051648);
  }
  else
  {
    v61 = (uint64_t)v17;
    v26 = v14;
    v27 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v23, v7, v8);
    static Date.now.getter(v27);
    v28 = static Date.< infix(_:_:)(v20, v23);
    v29 = *(void (**)(char *, uint64_t))(v9 + 8);
    v29(v20, v8);
    if ((v28 & 1) != 0)
    {
      v62 = (char *)v29;
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v30 = type metadata accessor for Logger(0);
      sub_10000A8E8(v30, (uint64_t)qword_100052B80);
      v31 = v61;
      (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v61, v23, v8);
      v32 = v64;
      v33 = swift_bridgeObjectRetain_n(v64, 2);
      v34 = Logger.logObject.getter(v33);
      v35 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = swift_slowAlloc(22, -1);
        v60 = swift_slowAlloc(64, -1);
        v66 = v60;
        *(_DWORD *)v36 = 136315394;
        swift_bridgeObjectRetain(v32);
        v65 = sub_100008204(v63, v32, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v36 + 4, v36 + 12);
        swift_bridgeObjectRelease_n(v32, 3);
        *(_WORD *)(v36 + 12) = 2080;
        v37 = sub_10000228C(&qword_100051658, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
        v38 = dispatch thunk of CustomStringConvertible.description.getter(v8, v37);
        v40 = v39;
        v65 = sub_100008204(v38, v39, &v66);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v36 + 14, v36 + 22);
        swift_bridgeObjectRelease(v40);
        v41 = v62;
        ((void (*)(uint64_t, uint64_t))v62)(v31, v8);
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Task %s is discarded due to startDate %s", (uint8_t *)v36, 0x16u);
        v42 = v60;
        swift_arrayDestroy(v60, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v42, -1, -1);
        swift_slowDealloc(v36, -1, -1);

      }
      else
      {

        v41 = v62;
        ((void (*)(uint64_t, uint64_t))v62)(v31, v8);
        swift_bridgeObjectRelease_n(v32, 2);
      }
      ((void (*)(char *, uint64_t))v41)(v23, v8);
      return 0;
    }
    v25 = ((uint64_t (*)(char *, uint64_t))v29)(v23, v8);
    v14 = v26;
  }
  TaskDefinition.endDate.getter(v25);
  if (v24(v5, 1, v8) == 1)
  {
    sub_10000A934((uint64_t)v5, &qword_100051648);
    return 1;
  }
  v43 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v14, v5, v8);
  static Date.now.getter(v43);
  v44 = static Date.> infix(_:_:)(v20, v14);
  v45 = *(void (**)(char *, uint64_t))(v9 + 8);
  v45(v20, v8);
  if ((v44 & 1) == 0)
  {
    v45(v14, v8);
    return 1;
  }
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v46 = type metadata accessor for Logger(0);
  sub_10000A8E8(v46, (uint64_t)qword_100052B80);
  v47 = v62;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v62, v14, v8);
  v48 = v64;
  v49 = swift_bridgeObjectRetain_n(v64, 2);
  v50 = Logger.logObject.getter(v49);
  v51 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = swift_slowAlloc(22, -1);
    v61 = swift_slowAlloc(64, -1);
    v66 = v61;
    *(_DWORD *)v52 = 136315394;
    swift_bridgeObjectRetain(v48);
    v65 = sub_100008204(v63, v48, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v52 + 4, v52 + 12);
    swift_bridgeObjectRelease_n(v48, 3);
    *(_WORD *)(v52 + 12) = 2080;
    v53 = sub_10000228C(&qword_100051658, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    v54 = dispatch thunk of CustomStringConvertible.description.getter(v8, v53);
    v56 = v55;
    v65 = sub_100008204(v54, v55, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66, v52 + 14, v52 + 22);
    swift_bridgeObjectRelease(v56);
    v45(v47, v8);
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "Task %s is discarded due to endDate %s", (uint8_t *)v52, 0x16u);
    v57 = v61;
    swift_arrayDestroy(v61, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v57, -1, -1);
    swift_slowDealloc(v52, -1, -1);

  }
  else
  {

    v45(v47, v8);
    swift_bridgeObjectRelease_n(v48, 2);
  }
  v45(v14, v8);
  return 0;
}

uint64_t sub_1000191A4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));

  return v0;
}

uint64_t sub_1000191F0()
{
  uint64_t v0;

  sub_1000191A4();
  return swift_deallocClassInstance(v0, 88, 7);
}

uint64_t type metadata accessor for TaskRegistry()
{
  return objc_opt_self(_TtC7mlhostd12TaskRegistry);
}

uint64_t sub_100019230()
{
  return sub_10000F424();
}

id sub_100019250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  NSString v15;
  NSString v16;
  uint64_t v17;
  NSString v18;
  NSString v19;
  uint64_t v20;
  uint64_t v21;
  Class isa;
  id v23;

  v10 = v9;
  if (a2)
  {
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v15 = 0;
    if (a4)
    {
LABEL_3:
      v16 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(a4);
      v17 = a9;
      if (a6)
        goto LABEL_4;
LABEL_8:
      v18 = 0;
      if (a8)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  v16 = 0;
  v17 = a9;
  if (!a6)
    goto LABEL_8;
LABEL_4:
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a6);
  if (a8)
  {
LABEL_5:
    v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a8);
    goto LABEL_10;
  }
LABEL_9:
  v19 = 0;
LABEL_10:
  v20 = type metadata accessor for Date(0);
  v21 = *(_QWORD *)(v20 - 8);
  isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v17, 1, v20) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v17, v20);
  }
  v23 = objc_msgSend(v10, "initWithTopic:channelID:pushType:pushPriority:creationDate:", v15, v16, v18, v19, isa);

  return v23;
}

uint64_t sub_1000193C4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

_QWORD *sub_1000193E4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      v10 = sub_100007800(&qword_1000512C0);
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
    sub_10001B1A0(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000194F0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_100019610(a1, a2, a3, a4, &qword_1000516A8, (uint64_t (*)(_QWORD))&type metadata accessor for ExtensionRecord);
}

_QWORD *sub_100019504(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
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
      v10 = sub_100007800(&qword_1000512A8);
      v11 = (_QWORD *)swift_allocObject(v10, v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * v12 - 64;
      v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= (_QWORD *)((char *)a4 + v8 + 32))
          memmove(v13, a4 + 4, v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v13 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10001B508(0, v8, (char *)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000195FC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_100019610(a1, a2, a3, a4, &qword_1000516B0, (uint64_t (*)(_QWORD))&type metadata accessor for MLHostTask);
}

uint64_t sub_100019610(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
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
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
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
    v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_100007800(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  v19 = j__malloc_size(v18);
  if (!v15)
    goto LABEL_29;
  if (v19 - v17 == 0x8000000000000000 && v15 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  v21 = a6(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(_QWORD *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }
    else if (v18 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001D170(0, v11, v24, a4, a6);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_10001981C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_1000088BC(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v12 = *v4;
    v19 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100019B78((uint64_t (*)(_QWORD))&type metadata accessor for MLHostTask, &qword_100051640);
      v12 = v19;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    v13 = *(_QWORD *)(v12 + 56);
    v14 = type metadata accessor for MLHostTask(0);
    v15 = *(_QWORD *)(v14 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 32))(a3, v13 + *(_QWORD *)(v15 + 72) * v9, v14);
    sub_10001995C(v9, v12);
    v16 = *v4;
    *v4 = v12;
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a3, 0, 1, v14);
  }
  else
  {
    v18 = type metadata accessor for MLHostTask(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a3, 1, 1, v18);
  }
}

unint64_t sub_10001995C(unint64_t result, uint64_t a2)
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
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[9];

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
      while (1)
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v29, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v29, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v13 < v8)
          goto LABEL_11;
LABEL_12:
        v14 = *(_QWORD *)(a2 + 48);
        v15 = (_OWORD *)(v14 + 16 * v3);
        v16 = (_OWORD *)(v14 + 16 * v6);
        if (v3 != v6 || v15 >= v16 + 1)
          *v15 = *v16;
        v17 = *(_QWORD *)(a2 + 56);
        v18 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for MLHostTask(0) - 8) + 72);
        v19 = v18 * v3;
        result = v17 + v18 * v3;
        v20 = v18 * v6;
        v21 = v17 + v18 * v6 + v18;
        if (v19 < v20 || result >= v21)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v19 == v20)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v13 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v13)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v24 = *v23;
    v25 = (-1 << v3) - 1;
  }
  else
  {
    v23 = (uint64_t *)(v4 + 8 * (result >> 6));
    v25 = *v23;
    v24 = (-1 << result) - 1;
  }
  *v23 = v25 & v24;
  v26 = *(_QWORD *)(a2 + 16);
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_100019B58()
{
  sub_100019FA0(&qword_1000516E0);
}

void *sub_100019B64()
{
  return sub_100019B78((uint64_t (*)(_QWORD))&type metadata accessor for MLHostTask, &qword_100051640);
}

void *sub_100019B78(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;

  v37 = a1(0);
  v4 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  v6 = (char *)&v33 - v5;
  sub_100007800(a2);
  v34 = v2;
  v7 = *v2;
  v8 = static _DictionaryStorage.copy(original:)(*v2);
  v9 = *(_QWORD *)(v7 + 16);
  v38 = v8;
  if (!v9)
  {
    result = (void *)swift_release(v7);
    v32 = v38;
    v31 = v34;
LABEL_28:
    *v31 = v32;
    return result;
  }
  v10 = v8;
  result = (void *)(v8 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v7 || (unint64_t)result >= v7 + 64 + 8 * v12)
  {
    result = memmove(result, (const void *)(v7 + 64), 8 * v12);
    v10 = v38;
  }
  v35 = v7 + 64;
  v14 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v7 + 16);
  v15 = 1 << *(_BYTE *)(v7 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v7 + 64);
  v36 = (unint64_t)(v15 + 63) >> 6;
  v18 = v37;
  while (1)
  {
    if (v17)
    {
      v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    v28 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v36)
      goto LABEL_26;
    v29 = *(_QWORD *)(v35 + 8 * v28);
    ++v14;
    if (!v29)
    {
      v14 = v28 + 1;
      if (v28 + 1 >= v36)
        goto LABEL_26;
      v29 = *(_QWORD *)(v35 + 8 * v14);
      if (!v29)
        break;
    }
LABEL_25:
    v17 = (v29 - 1) & v29;
    v20 = __clz(__rbit64(v29)) + (v14 << 6);
LABEL_12:
    v21 = 16 * v20;
    v22 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
    v24 = *v22;
    v23 = v22[1];
    v25 = *(_QWORD *)(v4 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(_QWORD *)(v7 + 56) + v25, v18);
    v26 = v38;
    v27 = (_QWORD *)(*(_QWORD *)(v38 + 48) + v21);
    *v27 = v24;
    v27[1] = v23;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(_QWORD *)(v26 + 56) + v25, v6, v18);
    result = (void *)swift_bridgeObjectRetain(v23);
  }
  v30 = v28 + 2;
  if (v30 >= v36)
  {
LABEL_26:
    result = (void *)swift_release(v7);
    v31 = v34;
    v32 = v38;
    goto LABEL_28;
  }
  v29 = *(_QWORD *)(v35 + 8 * v30);
  if (v29)
  {
    v14 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v14 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v14 >= v36)
      goto LABEL_26;
    v29 = *(_QWORD *)(v35 + 8 * v14);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100019DD4()
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
  sub_100007800(&qword_100051668);
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

void sub_100019F94()
{
  sub_100019FA0(&qword_1000516C0);
}

void sub_100019FA0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  sub_100007800(a1);
  v3 = *v1;
  v4 = static _DictionaryStorage.copy(original:)(*v1);
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    swift_release(v3);
    *v2 = v5;
    return;
  }
  v6 = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)v6 >= v3 + 64 + 8 * v8)
    memmove(v6, (const void *)(v3 + 64), 8 * v8);
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
    swift_bridgeObjectRetain(v21);
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
}

uint64_t sub_10001A14C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10001A168(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10001A168(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100007800(&qword_1000512C0);
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
    v11 = (char *)_swiftEmptyArrayStorage;
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

uint64_t sub_10001A2D0(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v2 = isStackAllocationSafe;
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = v3 & 0x3F;
  v5 = (1 << v3) + 63;
  v6 = v5 >> 6;
  v7 = 8 * (v5 >> 6);
  if (v4 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v5 >> 6), 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    v8 = sub_10001A420((unint64_t *)((char *)&v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0)), v6, v2);
    if (v1)
      swift_willThrow(v8);
    else
      return v8;
  }
  else
  {
    v9 = (void *)swift_slowAlloc(v7, -1);
    bzero(v9, v7);
    v2 = sub_10001A420((unint64_t *)v9, v6, v2);
    swift_slowDealloc(v9, -1, -1);
  }
  return v2;
}

uint64_t sub_10001A420(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;

  v24 = a2;
  v25 = a1;
  v4 = type metadata accessor for TaskDefinition(0);
  v5 = *(_QWORD *)(v4 - 8);
  result = __chkstk_darwin(v4);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 0;
  v10 = *(_QWORD *)(a3 + 64);
  v26 = 0;
  v27 = a3 + 64;
  v11 = 1 << *(_BYTE *)(a3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v28 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_5;
    }
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v19 >= v28)
      return sub_10001A664(v25, v24, v26, (_QWORD *)a3);
    v20 = *(_QWORD *)(v27 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v28)
        return sub_10001A664(v25, v24, v26, (_QWORD *)a3);
      v20 = *(_QWORD *)(v27 + 8 * v9);
      if (!v20)
      {
        v9 = v19 + 2;
        if (v19 + 2 >= v28)
          return sub_10001A664(v25, v24, v26, (_QWORD *)a3);
        v20 = *(_QWORD *)(v27 + 8 * v9);
        if (!v20)
          break;
      }
    }
LABEL_20:
    v13 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    v16 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v15);
    v17 = *v16;
    v18 = v16[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v8, *(_QWORD *)(a3 + 56) + *(_QWORD *)(v5 + 72) * v15, v4);
    swift_bridgeObjectRetain(v18);
    LOBYTE(v17) = sub_100018B2C(v17, v18);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    result = swift_bridgeObjectRelease(v18);
    if ((v17 & 1) != 0)
    {
      *(unint64_t *)((char *)v25 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v26++, 1))
      {
        __break(1u);
        return sub_10001A664(v25, v24, v26, (_QWORD *)a3);
      }
    }
  }
  v21 = v19 + 3;
  if (v21 >= v28)
    return sub_10001A664(v25, v24, v26, (_QWORD *)a3);
  v20 = *(_QWORD *)(v27 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v28)
      return sub_10001A664(v25, v24, v26, (_QWORD *)a3);
    v20 = *(_QWORD *)(v27 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

Swift::Int sub_10001A664(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int result;
  Swift::Int v14;
  unint64_t v15;
  uint64_t v16;
  Swift::Int v17;
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
  _QWORD v52[9];

  v8 = type metadata accessor for TaskDefinition(0);
  v49 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v51 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v48 = (char *)&v43 - v12;
  if (!a3)
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  if (a4[2] == a3)
  {
    swift_retain(a4);
    return (Swift::Int)a4;
  }
  v47 = v11;
  sub_100007800(&qword_1000516D8);
  result = static _DictionaryStorage.allocate(capacity:)(a3);
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
    Hasher.init(_seed:)(v52, *(_QWORD *)(v14 + 40));
    swift_bridgeObjectRetain(v29);
    String.hash(into:)(v52, v28, v29);
    result = Hasher._finalize()();
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

uint64_t sub_10001A9AC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *, __n128))
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
  __n128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, char *, __n128);
  _QWORD *v32;

  v26 = a2;
  v31 = a4;
  v27 = a1;
  v5 = type metadata accessor for TaskDefinition(0);
  v6 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v32 = (_QWORD *)a3;
  v11 = *(_QWORD *)(a3 + 64);
  v28 = 0;
  v29 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v30 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_5;
    }
    v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v21 >= v30)
      return sub_10001A664(v27, v26, v28, v32);
    v22 = *(_QWORD *)(v29 + 8 * v21);
    ++v10;
    if (!v22)
    {
      v10 = v21 + 1;
      if (v21 + 1 >= v30)
        return sub_10001A664(v27, v26, v28, v32);
      v22 = *(_QWORD *)(v29 + 8 * v10);
      if (!v22)
      {
        v10 = v21 + 2;
        if (v21 + 2 >= v30)
          return sub_10001A664(v27, v26, v28, v32);
        v22 = *(_QWORD *)(v29 + 8 * v10);
        if (!v22)
          break;
      }
    }
LABEL_20:
    v14 = (v22 - 1) & v22;
    v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_5:
    v17 = (uint64_t *)(v32[6] + 16 * v16);
    v18 = *v17;
    v19 = v17[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v32[7] + *(_QWORD *)(v6 + 72) * v16, v5);
    v20 = swift_bridgeObjectRetain(v19);
    LOBYTE(v18) = v31(v18, v19, v9, v20);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    result = swift_bridgeObjectRelease(v19);
    if ((v18 & 1) != 0)
    {
      *(unint64_t *)((char *)v27 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v28++, 1))
      {
        __break(1u);
        return sub_10001A664(v27, v26, v28, v32);
      }
    }
  }
  v23 = v21 + 3;
  if (v23 >= v30)
    return sub_10001A664(v27, v26, v28, v32);
  v22 = *(_QWORD *)(v29 + 8 * v23);
  if (v22)
  {
    v10 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    v10 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v10 >= v30)
      return sub_10001A664(v27, v26, v28, v32);
    v22 = *(_QWORD *)(v29 + 8 * v10);
    ++v23;
    if (v22)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_10001AC00(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, char *, __n128), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v6 = isStackAllocationSafe;
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = v7 & 0x3F;
  v9 = (1 << v7) + 63;
  v10 = v9 >> 6;
  v11 = 8 * (v9 >> 6);
  if (v8 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v9 >> 6), 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0), v11);
    v12 = sub_10001A9AC((unint64_t *)((char *)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0)), v10, v6, a2);
    if (v3)
      swift_willThrow(v12);
    else
      return v12;
  }
  else
  {
    v13 = (void *)swift_slowAlloc(v11, -1);
    bzero(v13, v11);
    a3 = sub_10001A9AC((unint64_t *)v13, v10, v6, a2);
    swift_slowDealloc(v13, -1, -1);
  }
  return a3;
}

_QWORD *sub_10001AD70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  __n128 v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  void *object;
  id v37;
  NSString v38;
  _QWORD *v39;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[2];
  char v66;
  _QWORD *v67;

  v58 = a2;
  v4 = type metadata accessor for URL.DirectoryHint(0);
  v56 = *(_QWORD *)(v4 - 8);
  v57 = v4;
  __chkstk_darwin(v4);
  v54 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v6);
  v55 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v63 = *(_QWORD *)(v8 - 8);
  v64 = v8;
  v9 = __chkstk_darwin(v8);
  v53 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v52 = (char *)&v45 - v11;
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
    return _swiftEmptyArrayStorage;
  v13 = 0;
  v50 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v14 = a1 + 40;
  v49 = -(uint64_t)v12;
  v15 = _swiftEmptyArrayStorage;
  v47 = v2;
  v46 = v12;
  v45 = a1 + 40;
  v16 = v56;
  do
  {
    v48 = v15;
    if (v13 <= v12)
      v17 = v12;
    else
      v17 = v13;
    v51 = -(uint64_t)v17;
    v18 = (_QWORD *)(v14 + 16 * v13);
    v19 = v13 + 1;
    while (1)
    {
      if (v51 + v19 == 1)
        __break(1u);
      v20 = *v18;
      v61 = *(v18 - 1);
      v62 = v19;
      v59 = v18;
      v66 = 1;
      v21 = *(_QWORD *)(v58 + 48);
      v60 = *(_QWORD *)(v58 + 40);
      v22 = v55;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v63 + 56))(v55, 1, 1, v64);
      v23 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
      v24 = v54;
      v25 = v50;
      v26 = v57;
      v23(v54, v50, v57);
      swift_bridgeObjectRetain(v20);
      v27 = swift_bridgeObjectRetain(v21);
      v28 = v53;
      v29 = v22;
      v30 = v20;
      v31 = v61;
      URL.init(filePath:directoryHint:relativeTo:)(v60, v21, v24, v29, v27);
      v65[0] = v31;
      v65[1] = v30;
      v23(v24, v25, v26);
      v32 = sub_10001CF54();
      v33 = v52;
      URL.appending<A>(path:directoryHint:)(v65, v24, &type metadata for String, v32);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v24, v26);
      v34 = v64;
      v35 = *(void (**)(char *, uint64_t))(v63 + 8);
      v35(v28, v64);
      object = URL.path(percentEncoded:)(0)._object;
      v35(v33, v34);
      v37 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
      v38 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      LODWORD(object) = objc_msgSend(v37, "fileExistsAtPath:isDirectory:", v38, &v66);

      if ((_DWORD)object)
      {
        if ((v66 & 1) != 0)
          break;
      }
      swift_bridgeObjectRelease(v30);
      v19 = v62 + 1;
      v18 = v59 + 2;
      if (v49 + v62 + 1 == 1)
        return v48;
    }
    v39 = v48;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v48);
    v15 = v39;
    v67 = v39;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_10001A14C(0, v39[2] + 1, 1);
      v15 = v67;
    }
    v13 = v62;
    v14 = v45;
    v42 = v15[2];
    v41 = v15[3];
    if (v42 >= v41 >> 1)
    {
      sub_10001A14C(v41 > 1, v42 + 1, 1);
      v15 = v67;
    }
    v15[2] = v42 + 1;
    v43 = &v15[2 * v42];
    v43[4] = v31;
    v43[5] = v30;
    v12 = v46;
  }
  while (v49 + v13);
  return v15;
}

uint64_t sub_10001B1A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10001B290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t j;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;

  v27 = a2;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 56);
  v23 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  j = 0;
  if (!v7)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v10 | (j << 6); ; i = __clz(__rbit64(v13)) + (j << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v17 = *v15;
    v16 = v15[1];
    v25 = a3;
    v26[0] = 0x7473696C702ELL;
    v26[1] = 0xE600000000000000;
    v24 = v27;
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRetain(a3);
    v24 = String.init<A>(_:)(&v24, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
    v25 = v18;
    String.append<A>(contentsOf:)(v26, &type metadata for String, &protocol witness table for String);
    v19 = v25;
    if (v17 == v24 && v16 == v25)
    {
      swift_release(a1);
      swift_bridgeObjectRelease(v16);
      return v17;
    }
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v16, v24, v25, 0);
    swift_bridgeObjectRelease(v19);
    if ((v21 & 1) != 0)
    {
      swift_release(a1);
      return v17;
    }
    result = swift_bridgeObjectRelease(v16);
    if (v7)
      goto LABEL_4;
LABEL_5:
    v12 = j + 1;
    if (__OFADD__(j, 1))
      break;
    if (v12 >= v23)
      goto LABEL_29;
    v13 = *(_QWORD *)(v22 + 8 * v12);
    ++j;
    if (v13)
      goto LABEL_19;
    j = v12 + 1;
    if (v12 + 1 >= v23)
      goto LABEL_29;
    v13 = *(_QWORD *)(v22 + 8 * j);
    if (v13)
      goto LABEL_19;
    j = v12 + 2;
    if (v12 + 2 >= v23)
      goto LABEL_29;
    v13 = *(_QWORD *)(v22 + 8 * j);
    if (v13)
      goto LABEL_19;
    j = v12 + 3;
    if (v12 + 3 >= v23)
      goto LABEL_29;
    v13 = *(_QWORD *)(v22 + 8 * j);
    if (v13)
      goto LABEL_19;
    v14 = v12 + 4;
    if (v14 >= v23)
    {
LABEL_29:
      swift_release(a1);
      return 0;
    }
    v13 = *(_QWORD *)(v22 + 8 * v14);
    for (j = v14; !v13; ++v14)
    {
      j = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_32;
      if (j >= v23)
        goto LABEL_29;
      v13 = *(_QWORD *)(v22 + 8 * j);
    }
LABEL_19:
    v7 = (v13 - 1) & v13;
  }
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

char *sub_10001B508(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

_QWORD *sub_10001B5EC(uint64_t a1, _QWORD *a2)
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
  char *v15;
  id v16;
  uint64_t v17;
  NSString v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  __int128 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v38;
  int64_t v39;
  _QWORD *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  BOOL v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __n128 v65;
  char *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  void (*v72)(char *, uint64_t);
  id v73;
  NSURL *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  char *v84;
  id v85;
  NSObject *v86;
  os_log_type_t v87;
  char *v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  int64_t v111;
  void *v112;
  char *v113;
  NSObject *v114;
  os_log_type_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  void *v122;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v124;
  unint64_t v125;
  _QWORD *v126;
  _QWORD *v127;
  char *v129;
  _QWORD *v130;
  uint64_t *v131;
  char *v132;
  __int128 v133;
  uint64_t v134;
  char *v135;
  __int128 v136;
  unsigned int v137;
  _QWORD *v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  char *v142;
  uint64_t v143;
  char *v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  _QWORD *v148;
  uint64_t v149;
  char *v150;
  int64_t v151;
  char *v152;
  void *v153;
  uint64_t v154;
  unint64_t v155;
  int64_t v156;
  void *v157;
  void *v158;
  uint64_t v159;
  id v160[2];

  v4 = type metadata accessor for URL.DirectoryHint(0);
  v146 = *(_QWORD *)(v4 - 8);
  v147 = v4;
  __chkstk_darwin(v4);
  v145 = (char *)&v129 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v6);
  v144 = (char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v149 = type metadata accessor for URL(0);
  v143 = *(_QWORD *)(v149 - 8);
  v8 = __chkstk_darwin(v149);
  v135 = (char *)&v129 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v129 = (char *)&v129 - v11;
  v12 = __chkstk_darwin(v10);
  v142 = (char *)&v129 - v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v129 - v14;
  v141 = (id)objc_opt_self(NSFileManager);
  v16 = objc_msgSend(v141, "defaultManager");
  v17 = *(_QWORD *)(a1 + 48);
  v140 = *(_QWORD *)(a1 + 40);
  v139 = v17;
  v18 = String._bridgeToObjectiveC()();
  v160[0] = 0;
  v19 = objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v18, v160);

  v20 = v160[0];
  if (v19)
  {
    v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for String);
    v22 = v20;

    swift_retain(a1);
    v23 = sub_10001AD70(v21, a1);
    v134 = 0;
    swift_bridgeObjectRelease(v21);
    swift_release(a1);
    v24 = (_QWORD *)sub_10002C418((uint64_t)v23);
    swift_bridgeObjectRelease(v23);
  }
  else
  {
    v26 = v160[0];
    v27 = _convertNSErrorToError(_:)(v20);

    swift_willThrow(v28);
    swift_errorRelease(v27);
    v134 = 0;
    v24 = &_swiftEmptySetSingleton;
  }
  v29 = 0;
  v30 = v24[7];
  v150 = (char *)(v24 + 7);
  v31 = 1 << *((_BYTE *)v24 + 32);
  v32 = -1;
  if (v31 < 64)
    v32 = ~(-1 << v31);
  v33 = v32 & v30;
  v151 = (unint64_t)(v31 + 63) >> 6;
  v137 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v131 = a2 + 7;
  v130 = _swiftEmptyArrayStorage;
  *(_QWORD *)&v25 = 136315138;
  v136 = v25;
  v132 = (char *)&type metadata for Any + 8;
  *(_QWORD *)&v25 = 136315394;
  v133 = v25;
  v148 = a2;
  v152 = v15;
  v138 = v24;
  while (1)
  {
    if (v33)
    {
      v35 = __clz(__rbit64(v33));
      v33 &= v33 - 1;
      v36 = v35 | (v29 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v29++, 1))
      goto LABEL_64;
    if (v29 >= v151)
      break;
    v38 = *(_QWORD *)&v150[8 * v29];
    if (!v38)
    {
      v39 = v29 + 1;
      if (v29 + 1 >= v151)
        break;
      v38 = *(_QWORD *)&v150[8 * v39];
      if (v38)
        goto LABEL_18;
      v39 = v29 + 2;
      if (v29 + 2 >= v151)
        break;
      v38 = *(_QWORD *)&v150[8 * v39];
      if (v38)
      {
LABEL_18:
        v29 = v39;
      }
      else
      {
        v111 = v29 + 3;
        if (v29 + 3 >= v151)
          break;
        v38 = *(_QWORD *)&v150[8 * v111];
        for (v29 += 3; !v38; ++v111)
        {
          v29 = v111 + 1;
          if (__OFADD__(v111, 1))
            goto LABEL_65;
          if (v29 >= v151)
            goto LABEL_62;
          v38 = *(_QWORD *)&v150[8 * v29];
        }
      }
    }
    v33 = (v38 - 1) & v38;
    v36 = __clz(__rbit64(v38)) + (v29 << 6);
LABEL_20:
    v40 = (_QWORD *)(v24[6] + 16 * v36);
    v42 = (void *)*v40;
    v41 = v40[1];
    v43 = a2[2];
    if (!v43)
      goto LABEL_43;
    v44 = (void *)a2[4];
    v45 = a2[5];
    v46 = v44 == v42 && v45 == v41;
    if (v46 || (_stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, *v40, v40[1], 0) & 1) != 0)
    {
LABEL_26:
      v157 = v42;
      v47 = qword_100050F28;
      swift_bridgeObjectRetain(v41);
      if (v47 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v48 = type metadata accessor for Logger(0);
      v49 = sub_10000A8E8(v48, (uint64_t)qword_100052B80);
      v50 = swift_bridgeObjectRetain_n(v41, 2);
      v154 = v49;
      v51 = Logger.logObject.getter(v50);
      v52 = static os_log_type_t.debug.getter();
      v53 = os_log_type_enabled(v51, v52);
      v155 = v33;
      v156 = v29;
      v153 = (void *)v41;
      if (v53)
      {
        v54 = swift_slowAlloc(12, -1);
        v55 = (void *)swift_slowAlloc(32, -1);
        v160[0] = v55;
        *(_DWORD *)v54 = v136;
        swift_bridgeObjectRetain(v41);
        *(_QWORD *)(v54 + 4) = sub_100008204((uint64_t)v157, v41, (uint64_t *)v160);
        swift_bridgeObjectRelease_n(v41, 3);
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Pruning taskFolder: %s", (uint8_t *)v54, 0xCu);
        swift_arrayDestroy(v55, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v55, -1, -1);
        swift_slowDealloc(v54, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v41, 2);
      }
      v56 = v143;
      v57 = v144;
      v58 = v149;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v143 + 56))(v144, 1, 1, v149);
      v60 = v145;
      v59 = v146;
      v61 = *(void (**)(char *, uint64_t, uint64_t))(v146 + 104);
      v62 = v137;
      v63 = v147;
      v61(v145, v137, v147);
      v64 = v139;
      v65 = swift_bridgeObjectRetain(v139);
      v66 = v142;
      URL.init(filePath:directoryHint:relativeTo:)(v140, v64, v60, v57, v65);
      v67 = v153;
      v160[0] = v157;
      v160[1] = v153;
      v68 = v62;
      v69 = v58;
      v61(v60, v68, v63);
      v70 = sub_10001CF54();
      v71 = v152;
      URL.appending<A>(path:directoryHint:)(v160, v60, &type metadata for String, v70);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v63);
      v72 = *(void (**)(char *, uint64_t))(v56 + 8);
      v72(v66, v58);
      v73 = objc_msgSend(v141, "defaultManager");
      URL._bridgeToObjectiveC()(v74);
      v76 = v75;
      v160[0] = 0;
      LODWORD(v59) = objc_msgSend(v73, "removeItemAtURL:error:", v75, v160);

      v77 = v160[0];
      if ((_DWORD)v59)
      {
        v112 = v67;
        v113 = v129;
        (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v129, v71, v69);
        v114 = Logger.logObject.getter(v77);
        v115 = static os_log_type_t.info.getter(v114);
        if (os_log_type_enabled(v114, v115))
        {
          v116 = swift_slowAlloc(12, -1);
          v117 = (void *)swift_slowAlloc(32, -1);
          v160[0] = v117;
          *(_DWORD *)v116 = v136;
          v118 = sub_10000228C(&qword_100051630, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
          v119 = dispatch thunk of CustomStringConvertible.description.getter(v69, v118);
          v121 = v120;
          *(_QWORD *)(v116 + 4) = sub_100008204(v119, v120, (uint64_t *)v160);
          swift_bridgeObjectRelease(v121);
          v72(v113, v69);
          _os_log_impl((void *)&_mh_execute_header, v114, v115, "Removed taskFolder: %s", (uint8_t *)v116, 0xCu);
          swift_arrayDestroy(v117, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v117, -1, -1);
          swift_slowDealloc(v116, -1, -1);
        }
        else
        {
          v72(v113, v69);
        }

        a2 = v148;
        v24 = v138;
        v122 = v157;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v130);
        v29 = v156;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v130 = sub_1000193E4(0, v130[2] + 1, 1, v130);
        v125 = v130[2];
        v124 = v130[3];
        if (v125 >= v124 >> 1)
          v130 = sub_1000193E4((_QWORD *)(v124 > 1), v125 + 1, 1, v130);
        v126 = v130;
        v130[2] = v125 + 1;
        v127 = &v126[2 * v125];
        v127[4] = v122;
        v127[5] = v112;
        v72(v71, v149);
        v33 = v155;
      }
      else
      {
        v78 = v160[0];
        swift_bridgeObjectRelease(v67);
        v79 = (void *)_convertNSErrorToError(_:)(v77);

        swift_willThrow(v80);
        v160[0] = v79;
        v81 = sub_100007800(&qword_100051620);
        v82 = sub_10000AB78(0, &qword_100051628, NSError_ptr);
        swift_dynamicCast(&v158, v160, v81, v82, 0);
        v83 = v158;
        v84 = v135;
        (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v135, v71, v69);
        v85 = v83;
        v86 = Logger.logObject.getter(v85);
        v87 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v86, v87))
        {
          v88 = v84;
          v89 = swift_slowAlloc(22, -1);
          v90 = (_QWORD *)swift_slowAlloc(8, -1);
          v91 = swift_slowAlloc(32, -1);
          v159 = v91;
          *(_DWORD *)v89 = v133;
          v92 = sub_10000228C(&qword_100051630, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
          v93 = dispatch thunk of CustomStringConvertible.description.getter(v69, v92);
          v95 = v94;
          *(_QWORD *)(v89 + 4) = sub_100008204(v93, v94, &v159);
          swift_bridgeObjectRelease(v95);
          v72(v88, v69);
          *(_WORD *)(v89 + 12) = 2112;
          *(_QWORD *)(v89 + 14) = v85;
          *v90 = v85;

          _os_log_impl((void *)&_mh_execute_header, v86, v87, "Failed at removing taskFolder: %s %@", (uint8_t *)v89, 0x16u);
          v96 = sub_100007800(&qword_100051288);
          swift_arrayDestroy(v90, 1, v96);
          swift_slowDealloc(v90, -1, -1);
          swift_arrayDestroy(v91, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v91, -1, -1);
          swift_slowDealloc(v89, -1, -1);

          v34 = v152;
        }
        else
        {

          v72(v84, v69);
          v34 = v71;
        }
        v72(v34, v69);
        a2 = v148;
        swift_errorRelease(v160[0]);
        v134 = 0;
        v24 = v138;
        v33 = v155;
        v29 = v156;
      }
    }
    else
    {
      if (v43 != 1)
      {
        v97 = v131;
        v98 = 1;
        while (1)
        {
          v99 = v98 + 1;
          if (__OFADD__(v98, 1))
            break;
          v100 = (void *)*(v97 - 1);
          v101 = *v97;
          v102 = v100 == v42 && v101 == v41;
          if (v102 || (_stringCompareWithSmolCheck(_:_:expecting:)(v100, v101, v42, v41, 0) & 1) != 0)
            goto LABEL_26;
          v97 += 2;
          ++v98;
          if (v99 == v43)
            goto LABEL_43;
        }
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
      }
LABEL_43:
      v103 = qword_100050F28;
      swift_bridgeObjectRetain(v41);
      if (v103 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v104 = type metadata accessor for Logger(0);
      sub_10000A8E8(v104, (uint64_t)qword_100052B80);
      swift_bridgeObjectRetain(v41);
      v106 = Logger.logObject.getter(v105);
      v107 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v106, v107))
      {
        v108 = swift_slowAlloc(12, -1);
        v109 = (uint64_t)v42;
        v110 = (void *)swift_slowAlloc(32, -1);
        v160[0] = v110;
        *(_DWORD *)v108 = v136;
        swift_bridgeObjectRetain(v41);
        *(_QWORD *)(v108 + 4) = sub_100008204(v109, v41, (uint64_t *)v160);
        swift_bridgeObjectRelease_n(v41, 3);
        _os_log_impl((void *)&_mh_execute_header, v106, v107, "Skipping taskFolder: %s", (uint8_t *)v108, 0xCu);
        swift_arrayDestroy(v110, 1, v132);
        swift_slowDealloc(v110, -1, -1);
        swift_slowDealloc(v108, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v41, 2);
      }
    }
  }
LABEL_62:
  swift_release(v24);
  return v130;
}

_QWORD *sub_10001C2C0(uint64_t a1, uint64_t a2)
{
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
  id v16;
  uint64_t v17;
  NSString v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  __int128 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  __objc2_prot *v34;
  uint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v39;
  int64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  _QWORD *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  BOOL v63;
  uint64_t v64;
  void *v65;
  void *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  void (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __n128 v75;
  char *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  char *v80;
  void (*v81)(char *, uint64_t);
  id v82;
  NSURL *v83;
  void *v84;
  void *v85;
  id v86;
  char *v87;
  id v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  char *v94;
  id v95;
  NSObject *v96;
  os_log_type_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  NSObject *v110;
  os_log_type_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  void *v118;
  unint64_t v119;
  unint64_t v120;
  _QWORD *v121;
  _QWORD *v122;
  uint64_t v124;
  void *v125;
  char *v126;
  _QWORD *v127;
  __int128 v128;
  char *v129;
  uint64_t v130;
  unsigned int v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v143;
  uint64_t v144;
  char *v145;
  int64_t v146;
  char *v147;
  void *v148;
  uint64_t v149;
  int64_t v150;
  unint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  id v155[2];

  v4 = type metadata accessor for URL.DirectoryHint(0);
  v140 = *(_QWORD *)(v4 - 8);
  v141 = v4;
  __chkstk_darwin(v4);
  v139 = (char *)&v124 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v6);
  v138 = (char *)&v124 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v144 = type metadata accessor for URL(0);
  v152 = *(_QWORD *)(v144 - 8);
  v8 = __chkstk_darwin(v144);
  v10 = (char *)&v124 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v126 = (char *)&v124 - v12;
  v13 = __chkstk_darwin(v11);
  v137 = (char *)&v124 - v14;
  __chkstk_darwin(v13);
  v136 = (char *)&v124 - v15;
  v135 = (id)objc_opt_self(NSFileManager);
  v16 = objc_msgSend(v135, "defaultManager");
  v17 = *(_QWORD *)(a1 + 48);
  v134 = *(_QWORD *)(a1 + 40);
  v133 = v17;
  v18 = String._bridgeToObjectiveC()();
  v155[0] = 0;
  v19 = objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v18, v155);

  v20 = v155[0];
  if (v19)
  {
    v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for String);
    v22 = v20;

    swift_retain(a1);
    v23 = sub_10001AD70(v21, a1);
    v130 = 0;
    swift_bridgeObjectRelease(v21);
    swift_release(a1);
    v24 = (_QWORD *)sub_10002C418((uint64_t)v23);
    swift_bridgeObjectRelease(v23);
  }
  else
  {
    v26 = v155[0];
    v27 = _convertNSErrorToError(_:)(v20);

    swift_willThrow(v28);
    swift_errorRelease(v27);
    v130 = 0;
    v24 = &_swiftEmptySetSingleton;
  }
  v29 = 0;
  v30 = v24[7];
  v145 = (char *)(v24 + 7);
  v31 = 1 << *((_BYTE *)v24 + 32);
  v32 = -1;
  if (v31 < 64)
    v32 = ~(-1 << v31);
  v33 = v32 & v30;
  v146 = (unint64_t)(v31 + 63) >> 6;
  v131 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v127 = _swiftEmptyArrayStorage;
  v34 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  v35 = qword_100052B80;
  *(_QWORD *)&v25 = 136315138;
  v143 = v25;
  v129 = (char *)&type metadata for Any + 8;
  *(_QWORD *)&v25 = 136315394;
  v128 = v25;
  v142 = a2;
  v147 = v10;
  v132 = v24;
  while (v33)
  {
    v36 = __clz(__rbit64(v33));
    v33 &= v33 - 1;
    v37 = v36 | (v29 << 6);
LABEL_21:
    v41 = (uint64_t *)(v24[6] + 16 * v37);
    v42 = *v41;
    v43 = v41[1];
    swift_bridgeObjectRetain(v43);
    v44 = sub_10000E748(v42, v43, a2);
    v45 = *(_QWORD *)&v34[53].cb;
    if ((v44 & 1) != 0)
    {
      if (v45 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v46 = type metadata accessor for Logger(0);
      sub_10000A8E8(v46, (uint64_t)v35);
      swift_bridgeObjectRetain(v43);
      v48 = Logger.logObject.getter(v47);
      v49 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = swift_slowAlloc(12, -1);
        v151 = v33;
        v51 = v50;
        v52 = v35;
        v53 = v24;
        v54 = a2;
        v55 = (void *)swift_slowAlloc(32, -1);
        v155[0] = v55;
        *(_DWORD *)v51 = v143;
        swift_bridgeObjectRetain(v43);
        *(_QWORD *)(v51 + 4) = sub_100008204(v42, v43, (uint64_t *)v155);
        swift_bridgeObjectRelease_n(v43, 3);
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "Skipping taskFolder: %s", (uint8_t *)v51, 0xCu);
        swift_arrayDestroy(v55, 1, v129);
        v56 = v55;
        a2 = v54;
        v24 = v53;
        v35 = v52;
        swift_slowDealloc(v56, -1, -1);
        v57 = v51;
        v33 = v151;
        v34 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
        swift_slowDealloc(v57, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v43, 2);
      }
    }
    else
    {
      if (v45 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v58 = type metadata accessor for Logger(0);
      v59 = sub_10000A8E8(v58, (uint64_t)v35);
      v60 = swift_bridgeObjectRetain_n(v43, 2);
      v61 = Logger.logObject.getter(v60);
      v62 = static os_log_type_t.debug.getter();
      v63 = os_log_type_enabled(v61, v62);
      v150 = v29;
      v151 = v33;
      v148 = (void *)v43;
      v149 = v59;
      if (v63)
      {
        v64 = swift_slowAlloc(12, -1);
        v65 = (void *)swift_slowAlloc(32, -1);
        v155[0] = v65;
        *(_DWORD *)v64 = v143;
        swift_bridgeObjectRetain(v43);
        *(_QWORD *)(v64 + 4) = sub_100008204(v42, v43, (uint64_t *)v155);
        swift_bridgeObjectRelease_n(v43, 3);
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "Pruning taskFolder: %s", (uint8_t *)v64, 0xCu);
        swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v65, -1, -1);
        swift_slowDealloc(v64, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v43, 2);
      }
      v66 = (void *)v42;
      v67 = v138;
      v68 = v144;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v152 + 56))(v138, 1, 1, v144);
      v70 = v139;
      v69 = v140;
      v71 = *(void (**)(char *, uint64_t, uint64_t))(v140 + 104);
      v72 = v131;
      v73 = v141;
      v71(v139, v131, v141);
      v74 = v133;
      v75 = swift_bridgeObjectRetain(v133);
      v76 = v137;
      URL.init(filePath:directoryHint:relativeTo:)(v134, v74, v70, v67, v75);
      v77 = v66;
      v155[0] = v66;
      v78 = v148;
      v155[1] = v148;
      v71(v70, v72, v73);
      v79 = sub_10001CF54();
      v80 = v136;
      URL.appending<A>(path:directoryHint:)(v155, v70, &type metadata for String, v79);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v73);
      v81 = *(void (**)(char *, uint64_t))(v152 + 8);
      v81(v76, v68);
      v82 = objc_msgSend(v135, "defaultManager");
      URL._bridgeToObjectiveC()(v83);
      v85 = v84;
      v155[0] = 0;
      LODWORD(v70) = objc_msgSend(v82, "removeItemAtURL:error:", v84, v155);

      v86 = v155[0];
      if ((_DWORD)v70)
      {
        v125 = v77;
        v109 = v126;
        (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v126, v80, v68);
        v110 = Logger.logObject.getter(v86);
        v111 = static os_log_type_t.info.getter(v110);
        if (os_log_type_enabled(v110, v111))
        {
          v112 = swift_slowAlloc(12, -1);
          v113 = (void *)swift_slowAlloc(32, -1);
          v155[0] = v113;
          *(_DWORD *)v112 = v143;
          v114 = sub_10000228C(&qword_100051630, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
          v115 = dispatch thunk of CustomStringConvertible.description.getter(v68, v114);
          v117 = v116;
          *(_QWORD *)(v112 + 4) = sub_100008204(v115, v116, (uint64_t *)v155);
          swift_bridgeObjectRelease(v117);
          v81(v109, v68);
          _os_log_impl((void *)&_mh_execute_header, v110, v111, "Removed taskFolder: %s", (uint8_t *)v112, 0xCu);
          swift_arrayDestroy(v113, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v113, -1, -1);
          swift_slowDealloc(v112, -1, -1);
        }
        else
        {
          v81(v109, v68);
        }

        a2 = v142;
        v29 = v150;
        v33 = v151;
        v34 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
        if ((swift_isUniquelyReferenced_nonNull_native(v127) & 1) == 0)
          v127 = sub_1000193E4(0, v127[2] + 1, 1, v127);
        v118 = v125;
        v120 = v127[2];
        v119 = v127[3];
        if (v120 >= v119 >> 1)
          v127 = sub_1000193E4((_QWORD *)(v119 > 1), v120 + 1, 1, v127);
        v121 = v127;
        v127[2] = v120 + 1;
        v122 = &v121[2 * v120];
        v122[4] = v118;
        v122[5] = v78;
        v81(v80, v144);
        v24 = v132;
        v35 = qword_100052B80;
      }
      else
      {
        v87 = v80;
        v88 = v155[0];
        swift_bridgeObjectRelease(v78);
        v89 = (void *)_convertNSErrorToError(_:)(v86);

        swift_willThrow(v90);
        v155[0] = v89;
        v91 = sub_100007800(&qword_100051620);
        v92 = sub_10000AB78(0, &qword_100051628, NSError_ptr);
        swift_dynamicCast(&v153, v155, v91, v92, 0);
        v93 = v153;
        v94 = v147;
        (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v147, v87, v68);
        v95 = v93;
        v96 = Logger.logObject.getter(v95);
        v97 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v96, v97))
        {
          v98 = swift_slowAlloc(22, -1);
          v99 = v68;
          v100 = (_QWORD *)swift_slowAlloc(8, -1);
          v101 = swift_slowAlloc(32, -1);
          v154 = v101;
          *(_DWORD *)v98 = v128;
          v102 = sub_10000228C(&qword_100051630, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
          v103 = dispatch thunk of CustomStringConvertible.description.getter(v99, v102);
          v105 = v104;
          *(_QWORD *)(v98 + 4) = sub_100008204(v103, v104, &v154);
          swift_bridgeObjectRelease(v105);
          v81(v147, v99);
          *(_WORD *)(v98 + 12) = 2112;
          *(_QWORD *)(v98 + 14) = v95;
          *v100 = v95;

          _os_log_impl((void *)&_mh_execute_header, v96, v97, "Failed at removing taskFolder: %s %@", (uint8_t *)v98, 0x16u);
          v106 = sub_100007800(&qword_100051288);
          swift_arrayDestroy(v100, 1, v106);
          swift_slowDealloc(v100, -1, -1);
          swift_arrayDestroy(v101, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v101, -1, -1);
          swift_slowDealloc(v98, -1, -1);

          v107 = v87;
          v108 = v99;
        }
        else
        {

          v81(v94, v68);
          v107 = v87;
          v108 = v68;
        }
        v81(v107, v108);
        a2 = v142;
        v33 = v151;
        swift_errorRelease(v155[0]);
        v130 = 0;
        v24 = v132;
        v29 = v150;
        v34 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
        v35 = qword_100052B80;
      }
    }
  }
  if (__OFADD__(v29++, 1))
  {
    __break(1u);
    goto LABEL_50;
  }
  if (v29 >= v146)
    goto LABEL_48;
  v39 = *(_QWORD *)&v145[8 * v29];
  if (v39)
  {
LABEL_20:
    v33 = (v39 - 1) & v39;
    v37 = __clz(__rbit64(v39)) + (v29 << 6);
    goto LABEL_21;
  }
  v40 = v29 + 1;
  if (v29 + 1 >= v146)
    goto LABEL_48;
  v39 = *(_QWORD *)&v145[8 * v40];
  if (v39)
    goto LABEL_19;
  v40 = v29 + 2;
  if (v29 + 2 >= v146)
    goto LABEL_48;
  v39 = *(_QWORD *)&v145[8 * v40];
  if (v39)
  {
LABEL_19:
    v29 = v40;
    goto LABEL_20;
  }
  v40 = v29 + 3;
  if (v29 + 3 < v146)
  {
    v39 = *(_QWORD *)&v145[8 * v40];
    if (!v39)
    {
      while (1)
      {
        v29 = v40 + 1;
        if (__OFADD__(v40, 1))
          break;
        if (v29 >= v146)
          goto LABEL_48;
        v39 = *(_QWORD *)&v145[8 * v29];
        ++v40;
        if (v39)
          goto LABEL_20;
      }
LABEL_50:
      __break(1u);
    }
    goto LABEL_19;
  }
LABEL_48:
  swift_release(v24);
  return v127;
}

unint64_t sub_10001CF54()
{
  unint64_t result;

  result = qword_100051618;
  if (!qword_100051618)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100051618);
  }
  return result;
}

uint64_t sub_10001CF98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001CFA8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001CFB0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v5 = result;
  v6 = 0;
  v7 = result + 64;
  v8 = 1 << *(_BYTE *)(result + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(result + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v13 = v12 | (v6 << 6);
LABEL_22:
    v17 = (_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v13);
    v18 = v17[1];
    if (*v17 != a2 || v18 != a3)
    {
      result = _stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a2, a3, 0);
      if ((result & 1) == 0)
        continue;
    }
    return 1;
  }
  v14 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v14 >= v11)
    return 0;
  v15 = *(_QWORD *)(v7 + 8 * v14);
  ++v6;
  if (v15)
    goto LABEL_21;
  v6 = v14 + 1;
  if (v14 + 1 >= v11)
    return 0;
  v15 = *(_QWORD *)(v7 + 8 * v6);
  if (v15)
    goto LABEL_21;
  v6 = v14 + 2;
  if (v14 + 2 >= v11)
    return 0;
  v15 = *(_QWORD *)(v7 + 8 * v6);
  if (v15)
    goto LABEL_21;
  v6 = v14 + 3;
  if (v14 + 3 >= v11)
    return 0;
  v15 = *(_QWORD *)(v7 + 8 * v6);
  if (v15)
  {
LABEL_21:
    v10 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_22;
  }
  v16 = v14 + 4;
  if (v16 >= v11)
    return 0;
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
  {
    v6 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v11)
      return 0;
    v15 = *(_QWORD *)(v7 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_21;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10001D128(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007800(&qword_100051698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D170(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a5(0) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v5;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001D288(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007800(&qword_1000516C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D2D0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10001895C(a1, a2, a3, *(_QWORD *)(v3 + 16)) & 1;
}

void sub_10001D2FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  id v7;
  NSString v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void **v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  os_unfair_lock_s *v22;
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  id v26;
  NSString v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSString v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  void **aBlock;
  uint64_t v41;
  void (*v42)(uint64_t, void *);
  void *v43;
  void *v44;
  uint64_t v45;

  v1 = v0;
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v2 = type metadata accessor for Logger(0);
  v38 = sub_10000A8E8(v2, (uint64_t)qword_100052B80);
  v3 = Logger.logObject.getter(v38);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "MLHostDaemon starting", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = (void *)objc_opt_self(BGSystemTaskScheduler);
  v7 = objc_msgSend(v6, "sharedScheduler");
  v8 = String._bridgeToObjectiveC()();
  v44 = sub_100023150;
  v45 = 0;
  aBlock = _NSConcreteStackBlock;
  v41 = 1107296256;
  v42 = sub_10001FE70;
  v43 = &unk_10004DD88;
  v9 = _Block_copy(&aBlock);
  objc_msgSend(v7, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v8, 0, v9);
  _Block_release(v9);

  sub_10001F64C();
  sub_100021EE4();
  sub_100022654();
  type metadata accessor for XPCListener(0);
  v10 = *(void **)(v1 + 40);
  v11 = v10;
  swift_retain(v1);
  v12 = XPCListener.__allocating_init(serviceName:queue:handler:)(0xD000000000000015, 0x80000001000423E0, v10, sub_10002A2D8, v1);
  v13 = swift_retain(v12);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    v17 = (void **)swift_slowAlloc(32, -1);
    aBlock = v17;
    *(_DWORD *)v16 = 136315138;
    v18 = XPCListener.description.getter();
    v20 = v19;
    v39 = sub_100008204(v18, v19, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &aBlock, v16 + 4, v16 + 12);
    swift_release_n(v12, 2);
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "XPC listener: (%s)", v16, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);

  }
  else
  {

    swift_release_n(v12, 2);
  }
  v21 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry);
  sub_100004944(0xD000000000000016, 0x8000000100042400);
  v22 = (os_unfair_lock_s *)(*(_QWORD *)(v21 + 16) + 16);
  swift_retain(v1);
  os_unfair_lock_lock(v22);
  v23 = swift_allocObject(&unk_10004DDC0, 32, 7);
  *(_QWORD *)(v23 + 16) = sub_10002A2E0;
  *(_QWORD *)(v23 + 24) = v1;
  swift_beginAccess(v21 + 72, &aBlock, 33, 0);
  swift_retain(v1);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(v21 + 72));
  v39 = *(_QWORD *)(v21 + 72);
  *(_QWORD *)(v21 + 72) = 0x8000000000000000;
  sub_10002B370((uint64_t)sub_10002A328, v23, 0xD000000000000016, 0x8000000100042400, isUniquelyReferenced_nonNull_native);
  v25 = *(_QWORD *)(v21 + 72);
  *(_QWORD *)(v21 + 72) = v39;
  swift_bridgeObjectRelease(v25);
  swift_endAccess(&aBlock);
  os_unfair_lock_unlock(v22);
  swift_release(v1);
  v26 = objc_msgSend(v6, "sharedScheduler");
  v27 = String._bridgeToObjectiveC()();
  v44 = sub_10002B4E4;
  v45 = v1;
  aBlock = _NSConcreteStackBlock;
  v41 = 1107296256;
  v42 = sub_10001FE70;
  v43 = &unk_10004DDD8;
  v28 = _Block_copy(&aBlock);
  v29 = v45;
  swift_retain(v1);
  swift_release(v29);
  objc_msgSend(v26, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v27, 0, v28);
  _Block_release(v28);

  v30 = objc_msgSend(v6, "sharedScheduler");
  v31 = String._bridgeToObjectiveC()();
  v44 = sub_10002B4EC;
  v45 = v1;
  aBlock = _NSConcreteStackBlock;
  v41 = 1107296256;
  v42 = sub_10001FE70;
  v43 = &unk_10004DE00;
  v32 = _Block_copy(&aBlock);
  v33 = v45;
  swift_retain(v1);
  swift_release(v33);
  objc_msgSend(v30, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v31, 0, v32);
  _Block_release(v32);

  v35 = Logger.logObject.getter(v34);
  v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "MLHostDaemon started", v37, 2u);
    swift_slowDealloc(v37, -1, -1);
  }

  dispatch_main();
}

unint64_t sub_10001D8C4(uint64_t a1)
{
  return sub_10001DA24(a1, &qword_1000516C0);
}

unint64_t sub_10001D8D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007800(&qword_1000518A0);
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
    sub_100036E58(v7, (uint64_t)&v14, &qword_1000518A8);
    v8 = v14;
    result = sub_100008920(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_10000A970(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
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

unint64_t sub_10001D9FC(uint64_t a1)
{
  return sub_10001DC7C(a1, &qword_100051948, &qword_100051640, (uint64_t (*)(_QWORD))&type metadata accessor for MLHostTask);
}

unint64_t sub_10001DA18(uint64_t a1)
{
  return sub_10001DA24(a1, &qword_1000516E0);
}

unint64_t sub_10001DA24(uint64_t a1, uint64_t *a2)
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
  sub_100007800(a2);
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
    swift_bridgeObjectRetain(v10);
    result = sub_1000088BC(v8, v9);
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

unint64_t sub_10001DB38(uint64_t a1)
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
  sub_100007800(&qword_100051668);
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
    result = sub_1000088BC(v7, v8);
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

unint64_t sub_10001DC60(uint64_t a1)
{
  return sub_10001DC7C(a1, &qword_100051950, &qword_1000516D8, (uint64_t (*)(_QWORD))&type metadata accessor for TaskDefinition);
}

unint64_t sub_10001DC7C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t result;
  char v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(_QWORD);
  uint64_t *v34;

  v33 = a4;
  v34 = a2;
  v6 = sub_100007800(a2);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (uint64_t *)((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
  {
    v12 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v30 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v30);
    return (unint64_t)v12;
  }
  sub_100007800(a3);
  v11 = static _DictionaryStorage.allocate(capacity:)(v10);
  v12 = (_QWORD *)v11;
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    goto LABEL_9;
  v14 = (char *)v9 + *(int *)(v6 + 48);
  v15 = v11 + 64;
  v16 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v32 = a1;
  v17 = a1 + v16;
  v18 = *(_QWORD *)(v7 + 72);
  swift_retain(v11);
  while (1)
  {
    sub_100036E58(v17, (uint64_t)v9, v34);
    v19 = *v9;
    v20 = v9[1];
    result = sub_1000088BC(*v9, v20);
    if ((v22 & 1) != 0)
      break;
    v23 = result;
    *(_QWORD *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v24 = (uint64_t *)(v12[6] + 16 * result);
    *v24 = v19;
    v24[1] = v20;
    v25 = v12[7];
    v26 = v33(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v25 + *(_QWORD *)(*(_QWORD *)(v26 - 8) + 72) * v23, v14, v26);
    v27 = v12[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_12;
    v12[2] = v29;
    v17 += v18;
    if (!--v13)
    {
      swift_release(v12);
      v30 = v32;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_10001DE18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  sub_100007800(&qword_100051940);
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
  v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v7 = *(v6 - 2);
    v8 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    result = sub_1000088BC(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v6 += 3;
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

unint64_t sub_10001DF28(uint64_t a1)
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
  sub_100007800(&qword_100051830);
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
    result = sub_1000088BC(v7, v8);
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

uint64_t sub_10001E040()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10002A280(v0, qword_100052B80);
  sub_10000A8E8(v0, (uint64_t)qword_100052B80);
  return Logger.init(subsystem:category:)(0xD000000000000014, 0x8000000100042380, 0x6474736F686C6DLL, 0xE700000000000000);
}

void sub_10001E0B4()
{
  qword_1000516E8 = (uint64_t)&off_10004D6E8;
}

void sub_10001E0C8()
{
  qword_1000516F0 = (uint64_t)&off_10004D728;
}

void sub_10001E0DC()
{
  qword_1000516F8 = (uint64_t)&off_10004D778;
}

void *sub_10001E0F0()
{
  void *result;

  result = (void *)sub_10001DE18((uint64_t)&off_10004D7B8);
  off_100051700 = result;
  return result;
}

unint64_t sub_10001E114()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t result;
  _BYTE v3[56];

  v0 = sub_100007800(&qword_100051958);
  inited = swift_initStackObject(v0, v3);
  *(_OWORD *)(inited + 16) = xmmword_100038D20;
  *(_QWORD *)(inited + 32) = 0xD000000000000016;
  *(_QWORD *)(inited + 40) = 0x8000000100042400;
  *(_QWORD *)(inited + 48) = &off_1000491B8;
  result = sub_10001DA24(inited, &qword_1000516C0);
  qword_100051708 = result;
  return result;
}

_QWORD *sub_10001E188@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_10001E194(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_10001E19C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_10001E1B0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_10001E1C4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10001E1D8(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_10001E208@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_10001E234@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_10001E258(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_10001E26C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_10001E280(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_10001E294@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10001E2A8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_10001E2BC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_10001E2D0(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_10001E2E4()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_10001E2F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_QWORD *sub_10001E30C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_10001E320@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_10002D54C(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_10001E35C()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for MLHostDaemon(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = sub_10001E398();
  qword_100052B98 = result;
  return result;
}

uint64_t sub_10001E398()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  NSString v18;
  id v19;
  void (*v20)(char *, char *, uint64_t);
  Swift::String v21;
  char *v22;
  __n128 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  unint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t inited;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  _BOOL4 v68;
  uint8_t *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t result;
  _QWORD v105[2];
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char v121[56];
  uint64_t v122;
  _BYTE v123[56];
  char *v124;
  unint64_t v125;

  v116 = *(_QWORD *)v0;
  v1 = type metadata accessor for MLHostConfig(0);
  v118 = *(_QWORD *)(v1 - 8);
  v119 = v1;
  __chkstk_darwin(v1);
  v117 = (char *)v105 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v109 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v113 = (char *)v105 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v111);
  v112 = (char *)v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v6);
  v110 = (char *)v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v8);
  v10 = (char *)v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v120 = (char *)v105 - v16;
  *(_BYTE *)(v0 + 16) = os_variant_has_internal_diagnostics("com.apple.mlhost");
  v17 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v18 = String._bridgeToObjectiveC()();
  v19 = objc_msgSend(v17, "containerURLForSecurityApplicationGroupIdentifier:", v18);

  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_41;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

  v20 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v20(v10, v15, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  v114 = v12;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
LABEL_41:
    sub_10000A934((uint64_t)v10, &qword_100051610);
    v124 = 0;
    v125 = 0xE000000000000000;
    _StringGuts.grow(_:)(42);
    swift_bridgeObjectRelease(v125);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003ELL, 0x8000000100042680, "mlhostd/MLHostDaemon.swift", 26, 2, 117, 0);
    __break(1u);
    return result;
  }
  v115 = v11;
  v20(v120, v10, v11);
  v21 = URL.path(percentEncoded:)(0);
  v108 = v0;
  *(Swift::String *)(v0 + 24) = v21;
  v105[1] = sub_10000AB78(0, &qword_1000512C8, OS_dispatch_queue_ptr);
  v22 = v110;
  static DispatchQoS.unspecified.getter(v23);
  v124 = (char *)_swiftEmptyArrayStorage;
  v24 = sub_10000228C(&qword_1000512D0, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v107 = v24;
  v25 = sub_100007800(&qword_1000512D8);
  v106 = v25;
  v26 = sub_10000ABB0();
  v27 = v112;
  v28 = v111;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v124, v25, v26, v111, v24);
  v29 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v109 + 104);
  v31 = v113;
  v30(v113, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v3);
  v32 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000024, 0x80000001000426C0, v22, v27, v31, 0);
  v33 = v108;
  *(_QWORD *)(v108 + 40) = v32;
  static DispatchQoS.background.getter();
  v124 = (char *)_swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v124, v106, v26, v28, v107);
  v30(v31, v29, v3);
  v34 = v31;
  v35 = v33;
  *(_QWORD *)(v33 + 48) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000001DLL, 0x80000001000426F0, v22, v27, v34, 0);
  v36 = v117;
  sub_10001F288();
  v37 = v33 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
  (*(void (**)(uint64_t, char *, uint64_t))(v118 + 32))(v33 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config, v36, v119);
  if (*(_BYTE *)(v33 + 16) == 1)
  {
    swift_beginAccess(v37, &v124, 33, 0);
    MLHostConfig.cloudEnvironment.setter(0x6D706F6C65766564, 0xEB00000000746E65);
    MLHostConfig.cloudContainer.setter(0xD000000000000022, 0x8000000100042710);
    swift_endAccess(&v124);
  }
  v38 = swift_beginAccess(v37, &v124, 32, 0);
  v39 = MLHostConfig.apsEnvironment.getter(v38);
  v41 = v40;
  swift_endAccess(&v124);
  if (!v41)
    goto LABEL_13;
  if (v39 != 0x6D706F6C65766564 || v41 != 0xEB00000000746E65)
  {
    v42 = _stringCompareWithSmolCheck(_:_:expecting:)(v39, v41, 0x6D706F6C65766564, 0xEB00000000746E65, 0);
    swift_bridgeObjectRelease(v41);
    if ((v42 & 1) != 0)
      goto LABEL_10;
LABEL_13:
    v44 = *(unsigned __int8 *)(v33 + 16);
    v45 = sub_100007800(&qword_100051958);
    if (v44 == 1)
    {
      inited = swift_initStackObject(v45, v121);
      *(_OWORD *)(inited + 16) = xmmword_100038D20;
      *(_QWORD *)(inited + 32) = 0xD000000000000016;
      *(_QWORD *)(inited + 40) = 0x8000000100042400;
      if (qword_100050F60 != -1)
        swift_once(&qword_100050F60, sub_100037034);
      v47 = qword_100052BA0;
    }
    else
    {
      inited = swift_initStackObject(v45, v123);
      *(_OWORD *)(inited + 16) = xmmword_100038D20;
      *(_QWORD *)(inited + 32) = 0xD000000000000016;
      *(_QWORD *)(inited + 40) = 0x8000000100042400;
      if (qword_100050F68 != -1)
        swift_once(&qword_100050F68, sub_100037048);
      v47 = qword_100052BA8;
    }
    *(_QWORD *)(inited + 48) = v47;
    swift_bridgeObjectRetain(v47);
    v43 = sub_10001DA24(inited, &qword_1000516C0);
    goto LABEL_21;
  }
  swift_bridgeObjectRelease(0xEB00000000746E65);
LABEL_10:
  if (qword_100050F50 != -1)
    swift_once(&qword_100050F50, sub_10001E114);
  v43 = qword_100051708;
  swift_bridgeObjectRetain(qword_100051708);
LABEL_21:
  if (qword_100050F30 != -1)
    swift_once(&qword_100050F30, sub_10001E0B4);
  v48 = qword_1000516E8;
  v49 = type metadata accessor for ExtensionKitRegistry();
  v50 = (_QWORD *)swift_allocObject(v49, 40, 7);
  v50[2] = v48;
  v50[4] = _swiftEmptyArrayStorage;
  v51 = sub_100007800(&qword_1000512E8);
  v52 = swift_allocObject(v51, 20, 7);
  *(_DWORD *)(v52 + 16) = 0;
  v50[3] = v52;
  *(_QWORD *)(v35 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry) = v50;
  v53 = *(_QWORD *)(v35 + 24);
  v54 = *(char **)(v35 + 32);
  v55 = qword_100050F38;
  swift_bridgeObjectRetain(v48);
  swift_bridgeObjectRetain(v54);
  if (v55 != -1)
    swift_once(&qword_100050F38, sub_10001E0C8);
  v56 = (char *)qword_1000516F0;
  v57 = type metadata accessor for TaskRegistry();
  swift_allocObject(v57, 88, 7);
  swift_bridgeObjectRetain(v56);
  *(_QWORD *)(v35 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry) = sub_10000E9B8(v53, v54, v56);
  v58 = swift_beginAccess(v37, &v124, 32, 0);
  v59 = (void *)MLHostConfig.apsEnvironment.getter(v58);
  v61 = v60;
  swift_endAccess(&v124);
  v62 = type metadata accessor for NotificationRegistry();
  swift_allocObject(v62, 80, 7);
  *(_QWORD *)(v35 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry) = sub_1000032E8(v43, v59, v61, 0);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v63 = type metadata accessor for Logger(0);
  v64 = sub_10000A8E8(v63, (uint64_t)qword_100052B80);
  v65 = swift_retain_n(v35, 2);
  v66 = Logger.logObject.getter(v65);
  v67 = static os_log_type_t.info.getter(v66);
  v68 = os_log_type_enabled(v66, v67);
  v116 = v64;
  if (v68)
  {
    v69 = (uint8_t *)swift_slowAlloc(12, -1);
    v70 = (char *)swift_slowAlloc(32, -1);
    v113 = v70;
    *(_DWORD *)v69 = 136315138;
    v124 = v70;
    v112 = (char *)(v69 + 4);
    v71 = v118;
    v72 = v119;
    v73 = v117;
    (*(void (**)(char *, uint64_t, uint64_t))(v118 + 16))(v117, v35 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config, v119);
    v74 = sub_10000228C(&qword_100051928, (uint64_t (*)(uint64_t))&type metadata accessor for MLHostConfig, (uint64_t)&protocol conformance descriptor for MLHostConfig);
    v75 = dispatch thunk of CustomStringConvertible.description.getter(v72, v74);
    v77 = v76;
    (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v72);
    v122 = sub_100008204(v75, v77, (uint64_t *)&v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, v123, v112, v69 + 12);
    swift_release_n(v35, 2);
    swift_bridgeObjectRelease(v77);
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "MLHostDaemon config: %s", v69, 0xCu);
    v78 = v113;
    swift_arrayDestroy(v113, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v78, -1, -1);
    swift_slowDealloc(v69, -1, -1);

  }
  else
  {

    swift_release_n(v35, 2);
  }
  v79 = swift_retain(v35);
  v80 = Logger.logObject.getter(v79);
  v81 = static os_log_type_t.info.getter(v80);
  if (os_log_type_enabled(v80, v81))
  {
    v82 = (uint8_t *)swift_slowAlloc(12, -1);
    v83 = (char *)swift_slowAlloc(32, -1);
    v124 = v83;
    *(_DWORD *)v82 = 136315138;
    v84 = *(_QWORD *)(v35 + 24);
    v85 = *(_QWORD *)(v35 + 32);
    swift_bridgeObjectRetain(v85);
    v122 = sub_100008204(v84, v85, (uint64_t *)&v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, v123, v82 + 4, v82 + 12);
    swift_release(v35);
    swift_bridgeObjectRelease(v85);
    _os_log_impl((void *)&_mh_execute_header, v80, v81, "MLHostDaemon baseFolder: %s", v82, 0xCu);
    swift_arrayDestroy(v83, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v83, -1, -1);
    swift_slowDealloc(v82, -1, -1);

  }
  else
  {

    swift_release(v35);
  }
  v86 = swift_retain_n(v35, 2);
  v87 = Logger.logObject.getter(v86);
  v88 = static os_log_type_t.info.getter(v87);
  if (os_log_type_enabled(v87, v88))
  {
    v89 = (uint8_t *)swift_slowAlloc(12, -1);
    v90 = (char *)swift_slowAlloc(32, -1);
    *(_DWORD *)v89 = 136315138;
    v124 = v90;
    v91 = *(_QWORD *)(v35 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    swift_retain(v91);
    v92 = sub_10000F424();
    v94 = v93;
    swift_release(v91);
    v122 = sub_100008204(v92, v94, (uint64_t *)&v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, v123, v89 + 4, v89 + 12);
    swift_release_n(v35, 2);
    swift_bridgeObjectRelease(v94);
    _os_log_impl((void *)&_mh_execute_header, v87, v88, "MLHostDaemon taskRegistry: %s", v89, 0xCu);
    swift_arrayDestroy(v90, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v90, -1, -1);
    swift_slowDealloc(v89, -1, -1);

  }
  else
  {

    swift_release_n(v35, 2);
  }
  v95 = swift_retain_n(v35, 2);
  v96 = Logger.logObject.getter(v95);
  v97 = static os_log_type_t.info.getter(v96);
  if (os_log_type_enabled(v96, v97))
  {
    v98 = (uint8_t *)swift_slowAlloc(12, -1);
    v99 = (char *)swift_slowAlloc(32, -1);
    *(_DWORD *)v98 = 136315138;
    v124 = v99;
    v100 = *(_QWORD *)(v35 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry);
    swift_retain(v100);
    v101 = sub_1000066E0();
    v103 = v102;
    swift_release(v100);
    v122 = sub_100008204(v101, v103, (uint64_t *)&v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, v123, v98 + 4, v98 + 12);
    swift_release_n(v35, 2);
    swift_bridgeObjectRelease(v103);
    _os_log_impl((void *)&_mh_execute_header, v96, v97, "MLHostDaemon notificationRegistry: %s", v98, 0xCu);
    swift_arrayDestroy(v99, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v99, -1, -1);
    swift_slowDealloc(v98, -1, -1);
  }
  else
  {
    swift_release_n(v35, 2);
  }

  (*(void (**)(char *, uint64_t))(v114 + 8))(v120, v115);
  return v35;
}

void sub_10001F288()
{
  unint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  unint64_t v6;
  NSString v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;

  v0 = 0xEA00000000006E6FLL;
  v1 = 0x69746375646F7270;
  v2 = objc_allocWithZone((Class)NSUserDefaults);
  v3 = String._bridgeToObjectiveC()();
  v26 = objc_msgSend(v2, "initWithSuiteName:", v3);

  if (v26)
  {
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend(v26, "stringForKey:", v4);

    if (v5)
    {
      v1 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      v0 = v6;

    }
    v7 = String._bridgeToObjectiveC()();
    v8 = objc_msgSend(v26, "stringForKey:", v7);

    if (v8)
    {
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      v11 = v10;

    }
    else
    {
      v9 = 0xD00000000000001ALL;
      v11 = 0x8000000100042740;
    }
    v20 = String._bridgeToObjectiveC()();
    v21 = objc_msgSend(v26, "stringForKey:", v20);

    if (v21)
    {
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

    }
    else
    {
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(APSEnvironmentProduction);
      v24 = v25;
    }
    MLHostConfig.init(cloudEnvironment:cloudContainer:apsEnvironment:)(v1, v0, v9, v11, v22, v24);

  }
  else
  {
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_10000A8E8(v12, (uint64_t)qword_100052B80);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(12, -1);
      v17 = swift_slowAlloc(32, -1);
      v28 = v17;
      *(_DWORD *)v16 = 136315138;
      v27 = sub_100008204(0xD000000000000010, 0x80000001000425C0, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v16 + 4, v16 + 12);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed at reading UserDefaults(%s). Using default config.", v16, 0xCu);
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);
    }

    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(APSEnvironmentProduction);
    MLHostConfig.init(cloudEnvironment:cloudContainer:apsEnvironment:)(0x69746375646F7270, 0xEA00000000006E6FLL, 0xD00000000000001ALL, 0x8000000100042740, v18, v19);
  }
}

uint64_t sub_10001F64C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[24];
  uint64_t v28[4];

  v1 = v0;
  v2 = os_transaction_create("loadTasks");
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
  v4 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + 24) + 16);
  os_unfair_lock_lock(v4);
  sub_10000BCB8(v5, v3);
  os_unfair_lock_unlock(v4);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v6 = type metadata accessor for Logger(0);
  sub_10000A8E8(v6, (uint64_t)qword_100052B80);
  v7 = swift_retain_n(v1, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v25 = v2;
    v11 = swift_slowAlloc(32, -1);
    v28[0] = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + 24) + 16);
    os_unfair_lock_lock(v12);
    swift_beginAccess(v3 + 32, v27, 0, 0);
    v13 = *(_QWORD *)(v3 + 32);
    swift_bridgeObjectRetain(v13);
    v15 = sub_10002C418(v14);
    swift_bridgeObjectRelease(v13);
    os_unfair_lock_unlock(v12);
    v16 = Set.description.getter(v15, &type metadata for String, &protocol witness table for String);
    v18 = v17;
    swift_bridgeObjectRelease(v15);
    v26 = sub_100008204(v16, v18, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, v27, v10 + 4, v10 + 12);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Discovered extensions: %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    v19 = v11;
    v2 = v25;
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
  v20 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + 24) + 16);
  os_unfair_lock_lock(v20);
  swift_beginAccess(v3 + 32, v28, 0, 0);
  v21 = *(_QWORD *)(v3 + 32);
  swift_bridgeObjectRetain(v21);
  v23 = sub_10002C418(v22);
  swift_bridgeObjectRelease(v21);
  os_unfair_lock_unlock(v20);
  sub_1000166B4(v23);
  swift_unknownObjectRelease(v2);
  return swift_bridgeObjectRelease(v23);
}

uint64_t sub_10001F914(uint64_t a1)
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

void sub_10001F940(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = type metadata accessor for MLHostTask(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v8 = type metadata accessor for Logger(0);
  sub_10000A8E8(v8, (uint64_t)qword_100052B80);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(12, -1);
    v19 = a2;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc(32, -1);
    v21 = v14;
    *(_DWORD *)v13 = 136315138;
    v15 = MLHostTask.bundleIdentifier.getter(v14);
    v17 = v16;
    v20 = sub_100008204(v15, v16, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v17);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v19, v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

}

uint64_t sub_10001FB30(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[3];

  v6 = type metadata accessor for TaskStatus(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MLHostTask(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = swift_projectBox(a3);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v14 = type metadata accessor for Logger(0);
  sub_10000A8E8(v14, (uint64_t)qword_100052B80);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  swift_errorRetain(a1);
  v15 = swift_errorRetain(a1);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(22, -1);
    v34 = v7;
    v19 = v18;
    v31 = (uint64_t *)swift_slowAlloc(8, -1);
    v20 = swift_slowAlloc(32, -1);
    v32 = v20;
    v38[0] = v20;
    *(_DWORD *)v19 = 136315394;
    v35 = v6;
    v21 = MLHostTask.bundleIdentifier.getter(v20);
    v23 = v22;
    v37 = sub_100008204(v21, v22, v38);
    v33 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    *(_WORD *)(v19 + 12) = 2112;
    swift_errorRetain(a1);
    v24 = _swift_stdlib_bridgeErrorToNSError(a1);
    v37 = v24;
    v9 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v19 + 14, v19 + 22);
    v25 = v31;
    *v31 = v24;
    v6 = v35;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Error for XPCConnection with %s: %@", (uint8_t *)v19, 0x16u);
    v26 = sub_100007800(&qword_100051288);
    swift_arrayDestroy(v25, 1, v26);
    swift_slowDealloc(v25, -1, -1);
    v27 = v32;
    swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    v28 = v19;
    v7 = v34;
    swift_slowDealloc(v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for TaskStatus.taskFailed(_:), v6);
  v29 = v36;
  swift_beginAccess(v36, v38, 1, 0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 40))(v29, v9, v6);
}

uint64_t sub_10001FE74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  void **v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t result;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void **v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t, uint64_t);
  void (*v65)(char *, uint64_t);
  char *v66;
  void **v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE v72[16];
  uint64_t v73[3];

  v63 = a5;
  v9 = type metadata accessor for MLHostTask(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v66 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v59 - v13;
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v67 = (void **)(a3 + 16);
  v15 = type metadata accessor for Logger(0);
  v16 = sub_10000A8E8(v15, (uint64_t)qword_100052B80);
  v64 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v64(v14, a2, v9);
  v17 = a1;
  v65 = (void (*)(char *, uint64_t))v16;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.info.getter(v18);
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc(22, -1);
    v21 = swift_slowAlloc(8, -1);
    v68 = v9;
    v60 = (_QWORD *)v21;
    v22 = swift_slowAlloc(32, -1);
    v61 = v22;
    v73[0] = v22;
    *(_DWORD *)v20 = 136315394;
    v62 = a2;
    v23 = MLHostTask.name.getter(v22);
    v25 = v24;
    v71 = sub_100008204(v23, v24, v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, v72, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease(v25);
    v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v14, v68);
    *(_WORD *)(v20 + 12) = 2112;
    v71 = (uint64_t)v17;
    v27 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, v72, v20 + 14, v20 + 22);
    v28 = v60;
    *v60 = v17;

    a2 = v62;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Task %s completed shouldRun with result %@.", (uint8_t *)v20, 0x16u);
    v29 = sub_100007800(&qword_100051288);
    swift_arrayDestroy(v28, 1, v29);
    v9 = v68;
    swift_slowDealloc(v28, -1, -1);
    v30 = v61;
    swift_arrayDestroy(v61, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1, -1);
    swift_slowDealloc(v20, -1, -1);

  }
  else
  {
    v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v14, v9);

  }
  v31 = v67;
  swift_beginAccess(v67, v73, 1, 0);
  v32 = *v31;
  *v31 = v17;

  v33 = MLHostResult.status.getter(v17);
  v34 = MLHostResultStatus.rawValue.getter(v33);
  v37 = 0;
  if (v34 == MLHostResultStatus.rawValue.getter(2))
  {
    v35 = MLHostResult.policy.getter();
    v36 = MLHostResultPolicy.rawValue.getter(v35);
    if (v36 == MLHostResultPolicy.rawValue.getter(0))
      v37 = 1;
  }
  v38 = swift_beginAccess(a4 + 16, &v71, 1, 0);
  *(_BYTE *)(a4 + 16) = v37;
  result = MLHostResult.errorString.getter(v38);
  if (v40)
  {
    v41 = result;
    v42 = v40;
    v43 = v66;
    v64(v66, a2, v9);
    v44 = swift_bridgeObjectRetain_n(v42, 2);
    v45 = Logger.logObject.getter(v44);
    v46 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = swift_slowAlloc(22, -1);
      v65 = v26;
      v48 = v43;
      v49 = v47;
      v50 = swift_slowAlloc(64, -1);
      v67 = (void **)v50;
      v68 = v9;
      v70 = v50;
      *(_DWORD *)v49 = 136315394;
      v51 = MLHostTask.name.getter(v50);
      v53 = v52;
      v69 = sub_100008204(v51, v52, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v49 + 4, v49 + 12);
      swift_bridgeObjectRelease(v53);
      v65(v48, v68);
      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain(v42);
      v69 = sub_100008204(v41, v42, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v49 + 14, v49 + 22);
      swift_bridgeObjectRelease_n(v42, 3);
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Task %s returned error in shouldRun: %s", (uint8_t *)v49, 0x16u);
      v54 = v67;
      swift_arrayDestroy(v67, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v54, -1, -1);
      swift_slowDealloc(v49, -1, -1);

    }
    else
    {
      v26(v43, v9);

      v55 = swift_bridgeObjectRelease_n(v42, 2);
    }
    v56 = MLHostTask.name.getter(v55);
    v58 = v57;
    sub_100013124(v56, v57, v41, v42);
    swift_bridgeObjectRelease(v42);
    return swift_bridgeObjectRelease(v58);
  }
  return result;
}

uint64_t sub_1000203D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void **v35;
  void *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  uint64_t v68;
  void **v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE v77[16];
  uint64_t v78[4];

  v66 = a5;
  v9 = type metadata accessor for TaskStatus(0);
  v72 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v71 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MLHostTask(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v61 - v16;
  v70 = swift_projectBox(a4);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v69 = (void **)(a3 + 16);
  v18 = type metadata accessor for Logger(0);
  v19 = sub_10000A8E8(v18, (uint64_t)qword_100052B80);
  v67 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v67(v17, a2, v11);
  v20 = a1;
  v68 = v19;
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.info.getter(v21);
  if (os_log_type_enabled(v21, v22))
  {
    v23 = swift_slowAlloc(22, -1);
    v73 = v11;
    v24 = v23;
    v62 = (_QWORD *)swift_slowAlloc(8, -1);
    v25 = swift_slowAlloc(32, -1);
    v63 = v25;
    v78[0] = v25;
    *(_DWORD *)v24 = 136315394;
    v65 = a2;
    v26 = MLHostTask.name.getter(v25);
    v28 = v27;
    v76 = sub_100008204(v26, v27, v78);
    v64 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, v77, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v28);
    v29 = *(void (**)(char *, uint64_t))(v12 + 8);
    v29(v17, v73);
    *(_WORD *)(v24 + 12) = 2112;
    v76 = (uint64_t)v20;
    v30 = v20;
    v9 = v64;
    a2 = v65;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, v77, v24 + 14, v24 + 22);
    v31 = v62;
    *v62 = v20;

    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Task %s completed doWork with result %@.", (uint8_t *)v24, 0x16u);
    v32 = sub_100007800(&qword_100051288);
    swift_arrayDestroy(v31, 1, v32);
    swift_slowDealloc(v31, -1, -1);
    v33 = v63;
    swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1, -1);
    v34 = v24;
    v11 = v73;
    swift_slowDealloc(v34, -1, -1);

  }
  else
  {
    v29 = *(void (**)(char *, uint64_t))(v12 + 8);
    v29(v17, v11);

  }
  v35 = v69;
  swift_beginAccess(v69, v78, 1, 0);
  v36 = *v35;
  *v35 = v20;

  v37 = MLHostResult.status.getter(v20);
  v38 = v71;
  if (v37 == 2)
  {
    v40 = enum case for TaskStatus.taskCompleted(_:);
    v39 = v72;
  }
  else
  {
    v39 = v72;
    v40 = enum case for TaskStatus.taskFailed(_:);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 104))(v71, v40, v9);
  v41 = v70;
  swift_beginAccess(v70, &v76, 1, 0);
  v42 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 40))(v41, v38, v9);
  result = MLHostResult.errorString.getter(v42);
  if (v44)
  {
    v45 = result;
    v46 = v44;
    v67(v15, a2, v11);
    v47 = swift_bridgeObjectRetain_n(v46, 2);
    v48 = Logger.logObject.getter(v47);
    v49 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = swift_slowAlloc(22, -1);
      v73 = v11;
      v51 = v50;
      v52 = swift_slowAlloc(64, -1);
      v71 = (char *)v52;
      v75 = v52;
      *(_DWORD *)v51 = 136315394;
      v72 = v45;
      v53 = MLHostTask.name.getter(v52);
      v55 = v54;
      v74 = sub_100008204(v53, v54, &v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v51 + 4, v51 + 12);
      swift_bridgeObjectRelease(v55);
      v29(v15, v73);
      v45 = v72;
      *(_WORD *)(v51 + 12) = 2080;
      swift_bridgeObjectRetain(v46);
      v74 = sub_100008204(v45, v46, &v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v51 + 14, v51 + 22);
      swift_bridgeObjectRelease_n(v46, 3);
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "Task %s returned error: %s", (uint8_t *)v51, 0x16u);
      v56 = v71;
      swift_arrayDestroy(v71, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1, -1);
      swift_slowDealloc(v51, -1, -1);

    }
    else
    {
      v29(v15, v11);

      v57 = swift_bridgeObjectRelease_n(v46, 2);
    }
    v58 = MLHostTask.name.getter(v57);
    v60 = v59;
    sub_100013124(v58, v59, v45, v46);
    swift_bridgeObjectRelease(v46);
    return swift_bridgeObjectRelease(v60);
  }
  return result;
}

uint64_t sub_100020980(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  Swift::String v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void **v30;
  uint64_t v31;
  id v32;
  NSString v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  void **v48;
  _BYTE v50[12];
  int v51;
  void **v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(_BYTE *, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  void **aBlock;
  uint64_t v61;
  void (*v62)(uint64_t, void *);
  void *v63;
  id (*v64)(void *);
  uint64_t v65;

  v3 = v2;
  v6 = type metadata accessor for MLHostTask(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v57 = v9;
  v58 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __chkstk_darwin(v8);
  v12 = &v50[-v11];
  if ((a2 & 1) != 0)
  {
    aBlock = (void **)MLHostTask.name.getter(v10);
    v61 = v13;
    v14._countAndFlagsBits = 0x6E616D65646E6F2ELL;
    v14._object = (void *)0xE900000000000064;
    String.append(_:)(v14);
    v16 = (uint64_t)aBlock;
    v15 = v61;
  }
  else
  {
    v16 = MLHostTask.name.getter(v10);
    v15 = v17;
  }
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v18 = type metadata accessor for Logger(0);
  v19 = sub_10000A8E8(v18, (uint64_t)qword_100052B80);
  v55 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16);
  v55(v12, a1, v6);
  v20 = swift_bridgeObjectRetain_n(v15, 2);
  v56 = v19;
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.info.getter();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc(22, -1);
    v54 = v3;
    v25 = v24;
    v52 = (void **)swift_slowAlloc(64, -1);
    aBlock = v52;
    *(_DWORD *)v25 = 136315394;
    swift_bridgeObjectRetain(v15);
    v59 = sub_100008204(v16, v15, (uint64_t *)&aBlock);
    v53 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &aBlock, v25 + 4, v25 + 12);
    v26 = swift_bridgeObjectRelease_n(v15, 3);
    *(_WORD *)(v25 + 12) = 2080;
    v51 = v23;
    v27 = MLHostTask.bundleIdentifier.getter(v26);
    v29 = v28;
    v59 = sub_100008204(v27, v28, (uint64_t *)&aBlock);
    a1 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &aBlock, v25 + 14, v25 + 22);
    swift_bridgeObjectRelease(v29);
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
    _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v51, "Registering task %s with bundleIdentifier %s.", (uint8_t *)v25, 0x16u);
    v30 = v52;
    swift_arrayDestroy(v52, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1, -1);
    v31 = v25;
    v3 = v54;
    swift_slowDealloc(v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v15, 2);
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  }

  v32 = objc_msgSend((id)objc_opt_self(BGSystemTaskScheduler), "sharedScheduler");
  v33 = String._bridgeToObjectiveC()();
  v34 = *(_QWORD *)(v3 + 48);
  v35 = v58;
  v55(v58, a1, v6);
  v36 = *(unsigned __int8 *)(v7 + 80);
  v37 = (v36 + 24) & ~v36;
  v38 = swift_allocObject(&unk_10004DED8, v37 + v57, v36 | 7);
  v39 = v6;
  v40 = v38;
  *(_QWORD *)(v38 + 16) = v3;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(v38 + v37, v35, v39);
  v64 = sub_100036748;
  v65 = v40;
  aBlock = _NSConcreteStackBlock;
  v61 = 1107296256;
  v62 = sub_10001FE70;
  v63 = &unk_10004DEF0;
  v41 = _Block_copy(&aBlock);
  v42 = v65;
  swift_retain(v3);
  swift_release(v42);
  v43 = objc_msgSend(v32, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v33, v34, v41);
  _Block_release(v41);

  v44 = swift_bridgeObjectRetain_n(v15, 2);
  v45 = Logger.logObject.getter(v44);
  v46 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = swift_slowAlloc(18, -1);
    v48 = (void **)swift_slowAlloc(32, -1);
    aBlock = v48;
    *(_DWORD *)v47 = 136315394;
    swift_bridgeObjectRetain(v15);
    v59 = sub_100008204(v16, v15, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &aBlock, v47 + 4, v47 + 12);
    swift_bridgeObjectRelease_n(v15, 3);
    *(_WORD *)(v47 + 12) = 1024;
    LODWORD(v59) = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, (char *)&v59 + 4, v47 + 14, v47 + 18);
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "Task %s registration info: %{BOOL}d", (uint8_t *)v47, 0x12u);
    swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1, -1);
    swift_slowDealloc(v47, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v15, 2);
  }
  return v16;
}

id sub_100020ED0(void *a1, char *a2, uint64_t a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  char v57[24];

  v54 = a1;
  v5 = sub_100007800(&qword_100051850);
  __chkstk_darwin(v5);
  v49 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskStatus(0);
  v52 = *(_QWORD *)(v7 - 8);
  v53 = v7;
  __chkstk_darwin(v7);
  v51 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MLHostTask(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v50 = (char *)&v48 - v15;
  v16 = *(_QWORD *)&a2[OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry];
  v17 = MLHostTask.bundleIdentifier.getter(v14);
  v19 = v18;
  v20 = (os_unfair_lock_s *)(*(_QWORD *)(v16 + 24) + 16);
  os_unfair_lock_lock(v20);
  swift_beginAccess(v16 + 32, v57, 0, 0);
  LOBYTE(v17) = sub_10000E87C(v17, v19, *(_QWORD **)(v16 + 32));
  os_unfair_lock_unlock(v20);
  swift_bridgeObjectRelease(v19);
  if ((v17 & 1) != 0)
  {
    v21 = type metadata accessor for TaskPriority(0);
    v22 = (uint64_t)v49;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v49, 1, 1, v21);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a3, v9);
    v23 = *(unsigned __int8 *)(v10 + 80);
    v24 = (v23 + 48) & ~v23;
    v25 = (char *)swift_allocObject(&unk_10004DF28, v24 + v11, v23 | 7);
    *((_QWORD *)v25 + 2) = 0;
    *((_QWORD *)v25 + 3) = 0;
    v26 = v54;
    *((_QWORD *)v25 + 4) = v54;
    *((_QWORD *)v25 + 5) = a2;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v25[v24], v13, v9);
    v27 = v26;
    swift_retain(a2);
    v28 = sub_100021A80(v22, (uint64_t)&unk_100051860, (uint64_t)v25);
    return (id)swift_release(v28);
  }
  else
  {
    v49 = a2;
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v30 = type metadata accessor for Logger(0);
    sub_10000A8E8(v30, (uint64_t)qword_100052B80);
    v31 = v50;
    v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v50, a3, v9);
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(12, -1);
      v36 = swift_slowAlloc(32, -1);
      v56 = v36;
      *(_DWORD *)v35 = 136315138;
      v48 = v35 + 4;
      v37 = MLHostTask.bundleIdentifier.getter(v36);
      v39 = v38;
      v55 = sub_100008204(v37, v38, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v48, v35 + 12);
      swift_bridgeObjectRelease(v39);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v31, v9);
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Invalid extension name: %s", v35, 0xCu);
      swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v35, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v31, v9);
    }

    v40 = v54;
    v42 = MLHostTask.name.getter(v41);
    v44 = v43;
    v46 = (uint64_t)v51;
    v45 = v52;
    v47 = v53;
    (*(void (**)(char *, _QWORD, uint64_t))(v52 + 104))(v51, enum case for TaskStatus.taskFailed(_:), v53);
    sub_100012EC4(v42, v44, v46);
    swift_bridgeObjectRelease(v44);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
    return objc_msgSend(v40, "setTaskCompleted");
  }
}

uint64_t sub_100021304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6[12] = a5;
  v6[13] = a6;
  v6[11] = a4;
  v7 = type metadata accessor for MLHostTask(0);
  v6[14] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[15] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[16] = swift_task_alloc(v9);
  v6[17] = swift_task_alloc(v9);
  return swift_task_switch(sub_1000213A4, 0, 0);
}

uint64_t sub_1000213A4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (void *)v0[11];
  v2 = swift_allocObject(&unk_10004DF78, 17, 7);
  v0[18] = v2;
  *(_BYTE *)(v2 + 16) = 0;
  v0[6] = sub_10003696C;
  v0[7] = v2;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10001F914;
  v0[5] = &unk_10004DF90;
  v3 = _Block_copy(v0 + 2);
  v4 = v0[7];
  swift_retain(v2);
  swift_release(v4);
  objc_msgSend(v1, "setExpirationHandler:", v3);
  _Block_release(v3);
  v5 = dword_10005187C;
  swift_retain(v2);
  v6 = (_QWORD *)swift_task_alloc(v5);
  v0[19] = v6;
  *v6 = v0;
  v6[1] = sub_1000214D4;
  return sub_10002DD94(v0[13], v0[12], v2);
}

uint64_t sub_1000214D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 144);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_QWORD *)(*(_QWORD *)v1 + 160) = a1;
  swift_task_dealloc(v2);
  swift_release(v3);
  return swift_task_switch(sub_100021564, 0, 0);
}

uint64_t sub_100021564()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
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
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v42;
  unsigned int v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v1 = v0 + 72;
  v2 = *(void **)(v0 + 160);
  if (v2)
  {
    v3 = v2;
    v4 = MLHostResult.status.getter();
    v5 = MLHostResultStatus.rawValue.getter(v4);
    if (v5 != MLHostResultStatus.rawValue.getter(1)
      || (v6 = MLHostResult.policy.getter(),
          v7 = MLHostResultPolicy.rawValue.getter(v6),
          v7 != MLHostResultPolicy.rawValue.getter(1)))
    {
      v23 = *(_QWORD *)(v0 + 144);
      objc_msgSend(*(id *)(v0 + 88), "setTaskCompleted");
LABEL_9:

      goto LABEL_16;
    }
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v8 = *(_QWORD *)(v0 + 120);
    v9 = *(_QWORD *)(v0 + 128);
    v11 = *(_QWORD *)(v0 + 104);
    v10 = *(_QWORD *)(v0 + 112);
    v12 = type metadata accessor for Logger(0);
    sub_10000A8E8(v12, (uint64_t)qword_100052B80);
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v11, v10);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.info.getter(v14);
    v16 = os_log_type_enabled(v14, v15);
    v17 = *(_QWORD *)(v0 + 120);
    v18 = *(_QWORD *)(v0 + 128);
    if (v16)
    {
      v54 = *(_QWORD *)(v0 + 112);
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v55 = swift_slowAlloc(32, -1);
      v57 = v55;
      *(_DWORD *)v19 = 136315138;
      v20 = MLHostTask.name.getter(v55);
      v22 = v21;
      *(_QWORD *)(v0 + 80) = sub_100008204(v20, v21, &v57);
      v1 = v0 + 72;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease(v22);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v54);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Task %s has reschedule policy, passing retry to DAS.", v19, 0xCu);
      swift_arrayDestroy(v55, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v55, -1, -1);
      swift_slowDealloc(v19, -1, -1);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v17 + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
    }

    v42 = *(void **)(v0 + 88);
    *(_QWORD *)(v0 + 72) = 0;
    v43 = objc_msgSend(v42, "setTaskExpiredWithRetryAfter:error:", v1, 300.0);
    v44 = *(void **)(v0 + 72);
    if (v43)
    {
      v23 = *(_QWORD *)(v0 + 144);
      v45 = v44;
      goto LABEL_9;
    }
    v46 = v44;
    v47 = _convertNSErrorToError(_:)(v44);

    v49 = swift_willThrow(v48);
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Task setTaskExpiredWithRetryAfter failed. Fallback to default strategy.", v52, 2u);
      swift_slowDealloc(v52, -1, -1);
    }
    v23 = *(_QWORD *)(v0 + 144);
    v53 = *(void **)(v0 + 88);

    objc_msgSend(v53, "setTaskCompleted");
    swift_errorRelease(v47);
  }
  else
  {
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v24 = *(_QWORD *)(v0 + 136);
    v25 = *(_QWORD *)(v0 + 112);
    v26 = *(_QWORD *)(v0 + 120);
    v27 = *(_QWORD *)(v0 + 104);
    v28 = type metadata accessor for Logger(0);
    sub_10000A8E8(v28, (uint64_t)qword_100052B80);
    v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v27, v25);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.debug.getter();
    v32 = os_log_type_enabled(v30, v31);
    v33 = *(_QWORD *)(v0 + 136);
    v34 = *(_QWORD *)(v0 + 120);
    if (v32)
    {
      v56 = *(_QWORD *)(v0 + 112);
      v35 = (uint8_t *)swift_slowAlloc(12, -1);
      v36 = swift_slowAlloc(32, -1);
      v57 = v36;
      *(_DWORD *)v35 = 136315138;
      v37 = MLHostTask.name.getter(v36);
      v39 = v38;
      *(_QWORD *)(v0 + 64) = sub_100008204(v37, v38, &v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v35 + 4, v35 + 12);
      swift_bridgeObjectRelease(v39);
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v56);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Task %s returned nil, marking DAS task as completed.", v35, 0xCu);
      swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v35, -1, -1);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v34 + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112));
    }

    v23 = *(_QWORD *)(v0 + 144);
    objc_msgSend(*(id *)(v0 + 88), "setTaskCompleted");
  }
LABEL_16:
  swift_release(v23);
  v40 = *(_QWORD *)(v0 + 128);
  swift_task_dealloc(*(_QWORD *)(v0 + 136));
  swift_task_dealloc(v40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100021A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000A934(a1, &qword_100051850);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10, v13);
      v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v16 = v15;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v17 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v17 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v14 = 0;
  v16 = 0;
LABEL_6:
  v18 = swift_allocObject(&unk_10004DF50, 32, 7);
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
  return swift_task_create(v9, v19, (char *)&type metadata for () + 8, &unk_100051870, v18);
}

void sub_100021BCC(uint64_t a1, void *a2)
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

uint64_t sub_100021C1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  char *v21;
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
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v0 = sub_100007800(&qword_100051680);
  __chkstk_darwin(v0);
  v39 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for TaskRequest(0);
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  __chkstk_darwin(v2);
  v38 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007800(&qword_100051688);
  __chkstk_darwin(v4);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskDefinition(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v38 - v12;
  v14 = type metadata accessor for XPCActivityCriteria(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MLHostTask.taskDefinition.getter(v16);
  TaskDefinition.criteria.getter(v19);
  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v13, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v6, 1, v14) == 1)
  {
    v21 = v38;
    v22 = sub_10000A934((uint64_t)v6, &qword_100051688);
    v23 = MLHostTask.taskDefinition.getter(v22);
    v24 = (uint64_t)v39;
    TaskDefinition.taskRequest.getter(v23);
    v20(v11, v7);
    v26 = v40;
    v25 = v41;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v24, 1, v41) == 1)
    {
      sub_10000A934(v24, &qword_100051680);
      return 0;
    }
    else
    {
      v32 = v21;
      v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 32))(v21, v24, v25);
      v34 = MLHostTask.name.getter(v33);
      v36 = v35;
      v27 = TaskRequest.getSystemTaskRequest(identifier:)(v34);
      swift_bridgeObjectRelease(v36);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v32, v25);
    }
  }
  else
  {
    v28 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v18, v6, v14);
    v29 = MLHostTask.name.getter(v28);
    v31 = v30;
    v27 = XPCActivityCriteria.getSystemTaskRequest(identifier:)(v29);
    swift_bridgeObjectRelease(v31);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
  return v27;
}

void sub_100021EE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  __int128 v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  os_unfair_lock_s *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  char *v31;
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
  os_unfair_lock_s *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  char *v75;
  __int128 v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  _QWORD *v81;
  char *v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88[24];
  uint64_t v89[3];
  char v90[32];

  v1 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v1);
  v3 = (char *)&v72 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MLHostTask(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v77 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v9 = (char *)&v72 - v8;
  v10 = os_transaction_create("registerActivities");
  v83 = v0;
  v11 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  v12 = (os_unfair_lock_s *)(*(_QWORD *)(v11 + 56) + 16);
  os_unfair_lock_lock(v12);
  v86 = v11 + 64;
  swift_beginAccess(v11 + 64, v90, 0, 0);
  v87 = v11;
  v13 = *(_QWORD *)(v11 + 64);
  swift_bridgeObjectRetain(v13);
  v15 = sub_10002BF3C(v14);
  swift_bridgeObjectRelease(v13);
  os_unfair_lock_unlock(v12);
  v85 = v15[2];
  if (!v85)
  {
    v71 = v10;
LABEL_46:
    swift_unknownObjectRelease(v71);
    swift_release(v15);
    return;
  }
  v72 = v10;
  v17 = 0;
  v78 = OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry;
  v84 = v15 + 4;
  *(_QWORD *)&v16 = 136315138;
  v76 = v16;
  v75 = (char *)&type metadata for Any + 8;
  *(_QWORD *)&v16 = 136315394;
  v74 = v16;
  v81 = v15;
  v82 = v3;
  v80 = v9;
  while (1)
  {
    if (v17 >= v15[2])
    {
      __break(1u);
      goto LABEL_48;
    }
    v18 = &v84[2 * v17];
    v19 = *v18;
    v20 = v18[1];
    v21 = v87;
    v22 = (os_unfair_lock_s *)(*(_QWORD *)(v87 + 56) + 16);
    swift_bridgeObjectRetain(v20);
    os_unfair_lock_lock(v22);
    swift_beginAccess(v86, v89, 32, 0);
    v23 = *(_QWORD *)(v21 + 64);
    if (*(_QWORD *)(v23 + 16))
    {
      swift_bridgeObjectRetain(v20);
      v24 = sub_1000088BC(v19, v20);
      if ((v25 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v3, *(_QWORD *)(v23 + 56) + *(_QWORD *)(v5 + 72) * v24, v4);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
      }
      swift_bridgeObjectRelease(v20);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    }
    swift_endAccess(v89);
    os_unfair_lock_unlock(v22);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_10000A934((uint64_t)v3, &qword_100051638);
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v26 = type metadata accessor for Logger(0);
      sub_10000A8E8(v26, (uint64_t)qword_100052B80);
      swift_bridgeObjectRetain(v20);
      v28 = Logger.logObject.getter(v27);
      v29 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = swift_slowAlloc(12, -1);
        v31 = v9;
        v32 = v5;
        v33 = v4;
        v34 = v19;
        v35 = swift_slowAlloc(32, -1);
        v89[0] = v35;
        *(_DWORD *)v30 = v76;
        swift_bridgeObjectRetain(v20);
        v36 = v34;
        v4 = v33;
        v5 = v32;
        v9 = v31;
        v3 = v82;
        *(_QWORD *)(v30 + 4) = sub_100008204(v36, v20, v89);
        swift_bridgeObjectRelease_n(v20, 3);
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Skipping %s because is not available in TaskRegistry", (uint8_t *)v30, 0xCu);
        swift_arrayDestroy(v35, 1, v75);
        swift_slowDealloc(v35, -1, -1);
        v37 = v30;
        v15 = v81;
        swift_slowDealloc(v37, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v20, 2);
      }
      goto LABEL_4;
    }
    v79 = v19;
    v38 = (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))(v9, v3, v4);
    v39 = *(_QWORD *)(v83 + v78);
    v40 = MLHostTask.bundleIdentifier.getter(v38);
    v42 = v41;
    v43 = (os_unfair_lock_s *)(*(_QWORD *)(v39 + 24) + 16);
    os_unfair_lock_lock(v43);
    swift_beginAccess(v39 + 32, v88, 0, 0);
    v44 = *(_QWORD **)(v39 + 32);
    v45 = v44[2];
    if (!v45)
      goto LABEL_25;
    v46 = v44[4];
    v47 = v44[5];
    v48 = v46 == v40 && v47 == v42;
    if (!v48 && (_stringCompareWithSmolCheck(_:_:expecting:)(v46, v47, v40, v42, 0) & 1) == 0)
    {
      if (v45 == 1)
        goto LABEL_25;
      v64 = v44[6];
      v65 = v44[7];
      if ((v64 != v40 || v65 != v42) && (_stringCompareWithSmolCheck(_:_:expecting:)(v64, v65, v40, v42, 0) & 1) == 0)
        break;
    }
LABEL_23:
    os_unfair_lock_unlock(v43);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v42);
    v9 = v80;
    sub_100020980((uint64_t)v80, 0);
    swift_bridgeObjectRelease(v49);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
LABEL_30:
    v15 = v81;
    v3 = v82;
LABEL_4:
    if (++v17 == v85)
    {
      v71 = v72;
      goto LABEL_46;
    }
  }
  if (v45 == 2)
  {
LABEL_25:
    os_unfair_lock_unlock(v43);
    swift_bridgeObjectRelease(v42);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v50 = type metadata accessor for Logger(0);
    sub_10000A8E8(v50, (uint64_t)qword_100052B80);
    v51 = v77;
    v9 = v80;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v77, v80, v4);
    swift_bridgeObjectRetain(v20);
    v53 = Logger.logObject.getter(v52);
    v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = swift_slowAlloc(22, -1);
      v56 = swift_slowAlloc(64, -1);
      v89[0] = v56;
      *(_DWORD *)v55 = v74;
      swift_bridgeObjectRetain(v20);
      *(_QWORD *)(v55 + 4) = sub_100008204(v79, v20, v89);
      v57 = swift_bridgeObjectRelease_n(v20, 3);
      *(_WORD *)(v55 + 12) = 2080;
      v58 = MLHostTask.bundleIdentifier.getter(v57);
      v60 = v59;
      *(_QWORD *)(v55 + 14) = sub_100008204(v58, v59, v89);
      swift_bridgeObjectRelease(v60);
      v61 = *(void (**)(char *, uint64_t))(v5 + 8);
      v61(v51, v4);
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Skipping %s because invalid extension: %s", (uint8_t *)v55, 0x16u);
      swift_arrayDestroy(v56, 2, (char *)&type metadata for Any + 8);
      v62 = v56;
      v9 = v80;
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v55, -1, -1);

      v61(v9, v4);
    }
    else
    {

      v63 = *(void (**)(char *, uint64_t))(v5 + 8);
      v63(v51, v4);
      swift_bridgeObjectRelease_n(v20, 2);
      v63(v9, v4);
    }
    goto LABEL_30;
  }
  v66 = v44 + 9;
  v67 = 2;
  while (!__OFADD__(v67, 1))
  {
    v68 = *(v66 - 1);
    v69 = *v66;
    if (v68 == v40 && v69 == v42)
      goto LABEL_23;
    v73 = v67 + 1;
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(v68, v69, v40, v42, 0) & 1) != 0)
      goto LABEL_23;
    v66 += 2;
    ++v67;
    if (v73 == v45)
      goto LABEL_25;
  }
LABEL_48:
  __break(1u);
}

uint64_t sub_100022654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  char *v35;
  __int128 v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[3];
  char v42[24];

  v1 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v1);
  v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MLHostTask(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = os_transaction_create("scheduleActivities");
  v8 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  v9 = (os_unfair_lock_s *)(*(_QWORD *)(v8 + 56) + 16);
  os_unfair_lock_lock(v9);
  v39 = v8 + 64;
  swift_beginAccess(v8 + 64, v42, 0, 0);
  v40 = v8;
  v10 = *(_QWORD *)(v8 + 64);
  swift_bridgeObjectRetain(v10);
  v12 = sub_10002BF3C(v11);
  swift_bridgeObjectRelease(v10);
  os_unfair_lock_unlock(v9);
  v34 = v12;
  v14 = v12[2];
  if (v14)
  {
    v15 = v34 + 5;
    *(_QWORD *)&v13 = 136315138;
    v36 = v13;
    v35 = (char *)&type metadata for Any + 8;
    v37 = v7;
    v38 = v3;
    do
    {
      v17 = *(v15 - 1);
      v16 = *v15;
      v18 = v40;
      v19 = (os_unfair_lock_s *)(*(_QWORD *)(v40 + 56) + 16);
      swift_bridgeObjectRetain(*v15);
      os_unfair_lock_lock(v19);
      swift_beginAccess(v39, v41, 32, 0);
      v20 = *(_QWORD *)(v18 + 64);
      if (*(_QWORD *)(v20 + 16))
      {
        swift_bridgeObjectRetain(v16);
        v21 = sub_1000088BC(v17, v16);
        if ((v22 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v3, *(_QWORD *)(v20 + 56) + *(_QWORD *)(v5 + 72) * v21, v4);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
        }
        swift_bridgeObjectRelease(v16);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
      }
      swift_endAccess(v41);
      os_unfair_lock_unlock(v19);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
      {
        sub_10000A934((uint64_t)v3, &qword_100051638);
        if (qword_100050F28 != -1)
          swift_once(&qword_100050F28, sub_10001E040);
        v23 = type metadata accessor for Logger(0);
        sub_10000A8E8(v23, (uint64_t)qword_100052B80);
        swift_bridgeObjectRetain(v16);
        v25 = Logger.logObject.getter(v24);
        v26 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = swift_slowAlloc(12, -1);
          v28 = swift_slowAlloc(32, -1);
          v41[0] = v28;
          *(_DWORD *)v27 = v36;
          swift_bridgeObjectRetain(v16);
          *(_QWORD *)(v27 + 4) = sub_100008204(v17, v16, v41);
          swift_bridgeObjectRelease_n(v16, 3);
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "Skipping %s because is not available in TaskRegistry", (uint8_t *)v27, 0xCu);
          swift_arrayDestroy(v28, 1, v35);
          v29 = v28;
          v7 = v37;
          swift_slowDealloc(v29, -1, -1);
          v30 = v27;
          v3 = v38;
          swift_slowDealloc(v30, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n(v16, 2);
        }
      }
      else
      {
        swift_bridgeObjectRelease(v16);
        (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
        sub_10002C4AC((uint64_t)v7);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      v15 += 2;
      --v14;
    }
    while (v14);
  }
  swift_unknownObjectRelease(v33);
  return swift_release(v34);
}

uint64_t sub_100022A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  _BYTE v12[24];

  v1 = os_transaction_create("deregisterActivities");
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(v2 + 56) + 16);
  os_unfair_lock_lock(v3);
  swift_beginAccess(v2 + 64, v12, 0, 0);
  v4 = *(_QWORD *)(v2 + 64);
  swift_bridgeObjectRetain(v4);
  v6 = sub_10002BF3C(v5);
  swift_bridgeObjectRelease(v4);
  os_unfair_lock_unlock(v3);
  v7 = v6[2];
  if (v7)
  {
    v8 = v6 + 5;
    do
    {
      v9 = *(v8 - 1);
      v10 = *v8;
      swift_bridgeObjectRetain(*v8);
      sub_100036140(v9, v10);
      swift_bridgeObjectRelease(v10);
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  swift_unknownObjectRelease(v1);
  return swift_release(v6);
}

void sub_100022B04(void (*a1)(char *, uint64_t)@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  os_unfair_lock_s *v20;
  __n128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_unfair_lock_s *v25;
  os_unfair_lock_s *v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  uint8_t *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint8_t *);
  unint64_t v38;
  void (*v39)(char *, char *, uint8_t *);
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t *v68;
  char *v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[24];
  uint64_t v75;

  v4 = v2;
  v7 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v7);
  v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MLHostTask(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = validateTaskDefinition(_:)(a1);
  if (!v3)
  {
    v69 = v13;
    v71 = a2;
    v72 = v11;
    v15 = *(_QWORD *)(v4 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
    v16 = TaskDefinition.bundleIdentifier.getter(v14);
    v17 = v4;
    v19 = v18;
    v20 = (os_unfair_lock_s *)(*(_QWORD *)(v15 + 24) + 16);
    os_unfair_lock_lock(v20);
    swift_beginAccess(v15 + 32, v74, 0, 0);
    LOBYTE(v16) = sub_10000E87C(v16, v19, *(_QWORD **)(v15 + 32));
    os_unfair_lock_unlock(v20);
    swift_bridgeObjectRelease(v19);
    if ((v16 & 1) == 0)
    {
      v33 = type metadata accessor for TaskValidationError(0);
      v34 = sub_10000228C(&qword_100051660, (uint64_t (*)(uint64_t))&type metadata accessor for TaskValidationError, (uint64_t)&protocol conformance descriptor for TaskValidationError);
      swift_allocError(v33, v34, 0, 0);
      v36 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, enum case for TaskValidationError.invalidBundleIdentifier(_:), v33);
      swift_willThrow(v36);
      return;
    }
    v68 = (uint8_t *)v10;
    v22 = TaskDefinition.name.getter(v21);
    v67 = v17;
    v23 = *(_QWORD *)(v17 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    v24 = __chkstk_darwin(v22);
    *(&v63 - 4) = v23;
    *(&v63 - 3) = v24;
    v66 = v24;
    v26 = v25 + 4;
    v70 = v27;
    *(&v63 - 2) = v27;
    os_unfair_lock_lock(v25 + 4);
    sub_1000366B8(&v75);
    v28 = v75;
    os_unfair_lock_unlock(v26);
    sub_1000140B8(a1, (uint64_t)v9);
    v29 = v72;
    v30 = v68;
    v31 = (*(uint64_t (**)(char *, uint64_t, uint8_t *))(v72 + 48))(v9, 1, v68);
    v32 = (uint64_t)v69;
    if (v31 == 1)
    {
      swift_bridgeObjectRelease(v70);
      sub_10000A934((uint64_t)v9, &qword_100051638);
    }
    else
    {
      v37 = *(void (**)(char *, char *, uint8_t *))(v29 + 32);
      v37(v69, v9, v30);
      v38 = v70;
      if (v28)
      {
        v39 = v37;
        if (qword_100050F28 != -1)
          swift_once(&qword_100050F28, sub_10001E040);
        v65 = v23;
        v40 = type metadata accessor for Logger(0);
        sub_10000A8E8(v40, (uint64_t)qword_100052B80);
        v41 = swift_bridgeObjectRetain_n(v38, 2);
        v42 = Logger.logObject.getter(v41);
        v43 = static os_log_type_t.info.getter(v42);
        if (os_log_type_enabled(v42, v43))
        {
          v44 = (uint8_t *)swift_slowAlloc(12, -1);
          v45 = swift_slowAlloc(32, -1);
          v75 = v45;
          *(_DWORD *)v44 = 136315138;
          v30 = v68;
          v64 = v44 + 4;
          swift_bridgeObjectRetain(v70);
          v73 = sub_100008204(v66, v70, &v75);
          v29 = v72;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, v74, v64, v44 + 12);
          swift_bridgeObjectRelease_n(v70, 3);
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "Task %s is replacing an existing task, unregistering its existing activity.", v44, 0xCu);
          swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v45, -1, -1);
          v46 = v44;
          v38 = v70;
          swift_slowDealloc(v46, -1, -1);

        }
        else
        {

          v47 = swift_bridgeObjectRelease_n(v38, 2);
        }
        v37 = v39;
        v48 = MLHostTask.name.getter(v47);
        v50 = v49;
        sub_100036140(v48, v49);
        swift_bridgeObjectRelease(v50);
        v23 = v65;
      }
      sub_100020980(v32, 0);
      swift_bridgeObjectRelease(v51);
      if ((sub_10002C4AC(v32) & 1) != 0)
      {
        swift_bridgeObjectRelease(v38);
        v52 = v71;
        v37(v71, (char *)v32, v30);
        v53 = 0;
LABEL_22:
        (*(void (**)(char *, uint64_t, uint64_t, uint8_t *))(v29 + 56))(v52, v53, 1, v30);
        return;
      }
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v54 = type metadata accessor for Logger(0);
      sub_10000A8E8(v54, (uint64_t)qword_100052B80);
      v55 = swift_bridgeObjectRetain_n(v38, 2);
      v56 = Logger.logObject.getter(v55);
      v57 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc(12, -1);
        v59 = swift_slowAlloc(32, -1);
        v65 = v23;
        v60 = v59;
        v75 = v59;
        *(_DWORD *)v58 = 136315138;
        v68 = v58 + 4;
        swift_bridgeObjectRetain(v70);
        v61 = v66;
        v73 = sub_100008204(v66, v70, &v75);
        v29 = v72;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, v74, v68, v58 + 12);
        swift_bridgeObjectRelease_n(v70, 3);
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Task %s failed registration with DAS.", v58, 0xCu);
        swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v60, -1, -1);
        v62 = v58;
        v38 = v70;
        swift_slowDealloc(v62, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v38, 2);
        v61 = v66;
      }
      sub_10000FAD8(v61, v38);
      swift_bridgeObjectRelease(v38);
      (*(void (**)(uint64_t, uint8_t *))(v29 + 8))(v32, v30);
    }
    v53 = 1;
    v52 = v71;
    goto LABEL_22;
  }
}

id sub_100023150(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10000A8E8(v2, (uint64_t)qword_100052B80);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v10 = v7;
    *(_DWORD *)v6 = 136315138;
    v9 = sub_100008204(0xD000000000000019, 0x80000001000423A0, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Daemon performing %s activity.", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  return objc_msgSend(a1, "setTaskCompleted");
}

uint64_t sub_1000232D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t TaskRequest;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t ExtensionRequest;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t HostConfigurationRequest;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t NotificationsConfigRequest;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;

  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v4 = type metadata accessor for Logger(0);
  sub_10000A8E8(v4, (uint64_t)qword_100052B80);
  v5 = swift_retain(a1);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 67109120;
    LODWORD(v64) = dispatch thunk of XPCIncomingConnection.pid.getter();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, (char *)&v64 + 4, v8 + 4, v8 + 8);
    swift_release(a1);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Incoming connection from: %d", v8, 8u);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_release(a1);
  }
  v9 = sub_100023CB4();
  v11 = v10;
  v12 = swift_retain(a1);
  v13 = Logger.logObject.getter(v12);
  if ((v11 & 1) == 0)
  {
    v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc(18, -1);
      v16 = swift_slowAlloc(32, -1);
      v64 = v16;
      *(_DWORD *)v15 = 67109378;
      LODWORD(v63) = dispatch thunk of XPCIncomingConnection.pid.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, (char *)&v63 + 4, v15 + 4, v15 + 8);
      swift_release(a1);
      *(_WORD *)(v15 + 8) = 2080;
      v63 = v9;
      v17 = sub_100036DFC();
      v18 = String.init<A>(_:radix:uppercase:)(&v63, 2, 0, &type metadata for Int, v17);
      v20 = v19;
      v63 = sub_100008204(v18, v19, &v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v15 + 10, v15 + 18);
      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Accepting connection from: %d with entitlements: %s", (uint8_t *)v15, 0x12u);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v15, -1, -1);

    }
    else
    {

      swift_release(a1);
    }
    type metadata accessor for XPCConnection(0);
    v23 = swift_retain(a1);
    v24 = XPCConnection.__allocating_init(incomingConnection:)(v23);
    if ((v9 & 4) != 0)
    {
      v25 = type metadata accessor for ListTasksRequest(0);
      v26 = sub_10000228C(&qword_1000518F0, (uint64_t (*)(uint64_t))&type metadata accessor for ListTasksRequest, (uint64_t)&protocol conformance descriptor for ListTasksRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(v25, sub_100036D70, a2, v25, v26);
      swift_release(a2);
      TaskRequest = type metadata accessor for GetTaskRequest(0);
      v28 = sub_10000228C(&qword_1000518F8, (uint64_t (*)(uint64_t))&type metadata accessor for GetTaskRequest, (uint64_t)&protocol conformance descriptor for GetTaskRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(TaskRequest, sub_100036D88, a2, TaskRequest, v28);
      swift_release(a2);
      v29 = type metadata accessor for ListExtensionsRequest(0);
      v30 = sub_10000228C(&qword_100051900, (uint64_t (*)(uint64_t))&type metadata accessor for ListExtensionsRequest, (uint64_t)&protocol conformance descriptor for ListExtensionsRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(v29, sub_100036DA0, a2, v29, v30);
      swift_release(a2);
      ExtensionRequest = type metadata accessor for GetExtensionRequest(0);
      v32 = sub_10000228C(&qword_100051908, (uint64_t (*)(uint64_t))&type metadata accessor for GetExtensionRequest, (uint64_t)&protocol conformance descriptor for GetExtensionRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(ExtensionRequest, sub_100036DE4, a2, ExtensionRequest, v32);
      swift_release(a2);
      if ((v9 & 8) == 0)
      {
LABEL_14:
        if ((v9 & 0x10) == 0)
          goto LABEL_15;
        goto LABEL_25;
      }
    }
    else if ((v9 & 8) == 0)
    {
      goto LABEL_14;
    }
    v33 = type metadata accessor for AddTaskRequest(0);
    v34 = sub_10000228C(&qword_1000518E8, (uint64_t (*)(uint64_t))&type metadata accessor for AddTaskRequest, (uint64_t)&protocol conformance descriptor for AddTaskRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v33, sub_100036D58, a2, v33, v34);
    swift_release(a2);
    if ((v9 & 0x10) == 0)
    {
LABEL_15:
      if ((v9 & 1) == 0)
        goto LABEL_16;
      goto LABEL_26;
    }
LABEL_25:
    v35 = type metadata accessor for ResetTasksRequest(0);
    v36 = sub_10000228C(&qword_1000518D8, (uint64_t (*)(uint64_t))&type metadata accessor for ResetTasksRequest, (uint64_t)&protocol conformance descriptor for ResetTasksRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v35, sub_100036D28, a2, v35, v36);
    swift_release(a2);
    v37 = type metadata accessor for CleanTasksRequest(0);
    v38 = sub_10000228C(&qword_1000518E0, (uint64_t (*)(uint64_t))&type metadata accessor for CleanTasksRequest, (uint64_t)&protocol conformance descriptor for CleanTasksRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v37, sub_100036D40, a2, v37, v38);
    swift_release(a2);
    if ((v9 & 1) == 0)
    {
LABEL_16:
      if ((v9 & 2) == 0)
        goto LABEL_17;
      goto LABEL_27;
    }
LABEL_26:
    HostConfigurationRequest = type metadata accessor for GetHostConfigurationRequest(0);
    v40 = sub_10000228C(&qword_1000518D0, (uint64_t (*)(uint64_t))&type metadata accessor for GetHostConfigurationRequest, (uint64_t)&protocol conformance descriptor for GetHostConfigurationRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(HostConfigurationRequest, sub_100036D10, a2, HostConfigurationRequest, v40);
    swift_release(a2);
    if ((v9 & 2) == 0)
    {
LABEL_17:
      if ((v9 & 1) == 0)
        goto LABEL_18;
      goto LABEL_28;
    }
LABEL_27:
    v41 = type metadata accessor for SetHostConfigurationRequest(0);
    v42 = sub_10000228C(&qword_1000518C8, (uint64_t (*)(uint64_t))&type metadata accessor for SetHostConfigurationRequest, (uint64_t)&protocol conformance descriptor for SetHostConfigurationRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v41, sub_100036CF8, a2, v41, v42);
    swift_release(a2);
    if ((v9 & 1) == 0)
    {
LABEL_18:
      if ((v9 & 2) == 0)
        goto LABEL_19;
      goto LABEL_29;
    }
LABEL_28:
    NotificationsConfigRequest = type metadata accessor for GetNotificationsConfigRequest(0);
    v44 = sub_10000228C(&qword_1000518C0, (uint64_t (*)(uint64_t))&type metadata accessor for GetNotificationsConfigRequest, (uint64_t)&protocol conformance descriptor for GetNotificationsConfigRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(NotificationsConfigRequest, sub_100036CE0, a2, NotificationsConfigRequest, v44);
    swift_release(a2);
    if ((v9 & 2) == 0)
    {
LABEL_19:
      if ((v9 & 0x20) == 0)
        return v24;
LABEL_30:
      v47 = dispatch thunk of XPCIncomingConnection.valueStringArray(forEntitlement:)(0xD000000000000025, 0x8000000100042550);
      if (v47)
        v48 = (_QWORD *)v47;
      else
        v48 = _swiftEmptyArrayStorage;
      v49 = sub_10002C418((uint64_t)v48);
      swift_bridgeObjectRelease(v48);
      v50 = swift_bridgeObjectRetain_n(v49, 2);
      v51 = Logger.logObject.getter(v50);
      v52 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc(12, -1);
        v54 = swift_slowAlloc(32, -1);
        v64 = v54;
        *(_DWORD *)v53 = 136315138;
        swift_bridgeObjectRetain(v49);
        v56 = Set.description.getter(v55, &type metadata for String, &protocol witness table for String);
        v58 = v57;
        swift_bridgeObjectRelease(v49);
        v63 = sub_100008204(v56, v58, &v64);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v53 + 4, v53 + 12);
        swift_bridgeObjectRelease_n(v49, 2);
        swift_bridgeObjectRelease(v58);
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Accepted connection with allowedTasks: %s", v53, 0xCu);
        swift_arrayDestroy(v54, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v54, -1, -1);
        swift_slowDealloc(v53, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v49, 2);
      }
      v59 = type metadata accessor for GetOnDemandTaskRequest(0);
      v60 = swift_allocObject(&unk_10004E180, 32, 7);
      *(_QWORD *)(v60 + 16) = v49;
      *(_QWORD *)(v60 + 24) = a2;
      v61 = sub_10000228C(&qword_1000518B0, (uint64_t (*)(uint64_t))&type metadata accessor for GetOnDemandTaskRequest, (uint64_t)&protocol conformance descriptor for GetOnDemandTaskRequest);
      swift_retain(a2);
      dispatch thunk of XPCConnection.handle<A>(_:handler:)(v59, sub_100036CB0, v60, v59, v61);
      swift_release(v60);
      return v24;
    }
LABEL_29:
    v45 = type metadata accessor for ResetNotificationsRequest(0);
    v46 = sub_10000228C(&qword_1000518B8, (uint64_t (*)(uint64_t))&type metadata accessor for ResetNotificationsRequest, (uint64_t)&protocol conformance descriptor for ResetNotificationsRequest);
    swift_retain(a2);
    dispatch thunk of XPCConnection.handle<A>(_:handler:)(v45, sub_100036CC8, a2, v45, v46);
    swift_release(a2);
    if ((v9 & 0x20) == 0)
      return v24;
    goto LABEL_30;
  }
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v13, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v22 = 67109120;
    LODWORD(v64) = dispatch thunk of XPCIncomingConnection.pid.getter();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, (char *)&v64 + 4, v22 + 4, v22 + 8);
    swift_release(a1);
    _os_log_impl((void *)&_mh_execute_header, v13, v21, "Invalid entitlements. Dropping connection from: %d", v22, 8u);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

    swift_release(a1);
  }
  return 0;
}

uint64_t sub_100023CB4()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  char v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v19;
  uint64_t v21;

  if (qword_100050F48 == -1)
    goto LABEL_2;
LABEL_33:
  swift_once(&qword_100050F48, sub_10001E0F0);
LABEL_2:
  v0 = off_100051700;
  v1 = (char *)off_100051700 + 64;
  v2 = 1 << *((_BYTE *)off_100051700 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *((_QWORD *)off_100051700 + 8);
  v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain(off_100051700);
  v6 = 0;
  v21 = 0;
  if (v4)
  {
LABEL_5:
    v7 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v8 = v7 | (v6 << 6);
    goto LABEL_6;
  }
  while (1)
  {
    v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    if (v15 >= v5)
      goto LABEL_30;
    v16 = *(_QWORD *)&v1[8 * v15];
    ++v6;
    if (!v16)
    {
      v6 = v15 + 1;
      if (v15 + 1 >= v5)
        goto LABEL_30;
      v16 = *(_QWORD *)&v1[8 * v6];
      if (!v16)
      {
        v6 = v15 + 2;
        if (v15 + 2 >= v5)
          goto LABEL_30;
        v16 = *(_QWORD *)&v1[8 * v6];
        if (!v16)
          break;
      }
    }
LABEL_21:
    v4 = (v16 - 1) & v16;
    v8 = __clz(__rbit64(v16)) + (v6 << 6);
LABEL_6:
    v9 = (uint64_t *)(v0[6] + 16 * v8);
    v10 = *v9;
    v11 = v9[1];
    v12 = *(_QWORD *)(v0[7] + 8 * v8);
    v13 = swift_bridgeObjectRetain(v11);
    v14 = dispatch thunk of XPCIncomingConnection.valueBool(forEntitlement:)(v10, v11, v13);
    swift_bridgeObjectRelease(v11);
    if (v14 == 2)
    {
      if (v4)
        goto LABEL_5;
    }
    else
    {
      if ((v12 & ~v21) == 0 || (v14 & 1) == 0)
        v19 = 0;
      else
        v19 = v12;
      v21 |= v19;
      if (v4)
        goto LABEL_5;
    }
  }
  v17 = v15 + 3;
  if (v17 < v5)
  {
    v16 = *(_QWORD *)&v1[8 * v17];
    if (!v16)
    {
      while (1)
      {
        v6 = v17 + 1;
        if (__OFADD__(v17, 1))
          goto LABEL_32;
        if (v6 >= v5)
          goto LABEL_30;
        v16 = *(_QWORD *)&v1[8 * v6];
        ++v17;
        if (v16)
          goto LABEL_21;
      }
    }
    v6 = v17;
    goto LABEL_21;
  }
LABEL_30:
  swift_release(v0);
  return v21;
}

uint64_t sub_100023E94@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  _BYTE v38[24];
  char v39[24];
  char *v40;

  v33 = a2;
  v3 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MLHostTask(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v37 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v36 = (char *)&v31 - v10;
  v11 = *(_QWORD *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  v12 = (os_unfair_lock_s *)(*(_QWORD *)(v11 + 56) + 16);
  os_unfair_lock_lock(v12);
  v34 = v11 + 64;
  swift_beginAccess(v11 + 64, v39, 0, 0);
  v35 = v11;
  v13 = *(_QWORD *)(v11 + 64);
  swift_bridgeObjectRetain(v13);
  v15 = sub_10002BF3C(v14);
  swift_bridgeObjectRelease(v13);
  os_unfair_lock_unlock(v12);
  v16 = v15[2];
  v32 = v15;
  if (v16)
  {
    v17 = v15 + 5;
    v40 = (char *)_swiftEmptyArrayStorage;
    do
    {
      v18 = *(v17 - 1);
      v19 = *v17;
      v20 = v35;
      v21 = (os_unfair_lock_s *)(*(_QWORD *)(v35 + 56) + 16);
      swift_bridgeObjectRetain(*v17);
      os_unfair_lock_lock(v21);
      swift_beginAccess(v34, v38, 32, 0);
      v22 = *(_QWORD *)(v20 + 64);
      if (*(_QWORD *)(v22 + 16))
      {
        swift_bridgeObjectRetain(v19);
        v23 = sub_1000088BC(v18, v19);
        if ((v24 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v5, *(_QWORD *)(v22 + 56) + *(_QWORD *)(v7 + 72) * v23, v6);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
        }
        swift_bridgeObjectRelease(v19);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
      }
      swift_endAccess(v38);
      os_unfair_lock_unlock(v21);
      swift_bridgeObjectRelease(v19);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
      {
        sub_10000A934((uint64_t)v5, &qword_100051638);
      }
      else
      {
        v25 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v26 = v36;
        v25(v36, v5, v6);
        (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v37, v26, v6);
        if ((swift_isUniquelyReferenced_nonNull_native(v40) & 1) == 0)
          v40 = (char *)sub_1000195FC(0, *((_QWORD *)v40 + 2) + 1, 1, (unint64_t)v40);
        v28 = *((_QWORD *)v40 + 2);
        v27 = *((_QWORD *)v40 + 3);
        if (v28 >= v27 >> 1)
          v40 = (char *)sub_1000195FC(v27 > 1, v28 + 1, 1, (unint64_t)v40);
        v29 = v40;
        *((_QWORD *)v40 + 2) = v28 + 1;
        v25(&v29[((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v28], v37, v6);
        (*(void (**)(char *, uint64_t))(v7 + 8))(v36, v6);
      }
      v17 += 2;
      --v16;
    }
    while (v16);
  }
  else
  {
    v40 = (char *)_swiftEmptyArrayStorage;
  }
  swift_release(v32);
  return ListTasksResponse.init(tasks:)(v40);
}

uint64_t sub_1000241EC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t Task;
  uint64_t v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _BYTE v30[24];

  v29 = a2;
  v3 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MLHostTask(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v28 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v27 - v11;
  v13 = *(_QWORD *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  Task = GetTaskRequest.name.getter(v10);
  v16 = v15;
  v17 = (os_unfair_lock_s *)(*(_QWORD *)(v13 + 56) + 16);
  os_unfair_lock_lock(v17);
  swift_beginAccess(v13 + 64, v30, 32, 0);
  v18 = *(_QWORD *)(v13 + 64);
  if (*(_QWORD *)(v18 + 16))
  {
    swift_bridgeObjectRetain(v16);
    v19 = sub_1000088BC(Task, v16);
    if ((v20 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v5, *(_QWORD *)(v18 + 56) + *(_QWORD *)(v7 + 72) * v19, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    }
    swift_bridgeObjectRelease(v16);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  swift_endAccess(v30);
  os_unfair_lock_unlock(v17);
  swift_bridgeObjectRelease(v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_10000A934((uint64_t)v5, &qword_100051638);
    v21 = type metadata accessor for XPCRemoteError(0);
    v22 = sub_10000228C(&qword_100051918, (uint64_t (*)(uint64_t))&type metadata accessor for XPCRemoteError, (uint64_t)&protocol conformance descriptor for XPCRemoteError);
    swift_allocError(v21, v22, 0, 0);
    strcpy(v23, "taskNotFound");
    v23[13] = 0;
    *((_WORD *)v23 + 7) = -5120;
    v24 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, enum case for XPCRemoteError.genericError(_:), v21);
    return swift_willThrow(v24);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    v26 = v28;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v28, v12, v6);
    GetTaskResponse.init(task:)(v26);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

uint64_t sub_1000244B8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t Extension;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t (*v25)(char *, unint64_t, uint64_t, __n128);
  __n128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char v48[24];
  uint64_t v49;

  v46 = a2;
  v3 = sub_100007800(&qword_100051530);
  __chkstk_darwin(v3);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ExtensionRecord(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v45 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v42 - v11;
  v13 = __chkstk_darwin(v10);
  v44 = (char *)&v42 - v14;
  v15 = *(_QWORD *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
  Extension = GetExtensionRequest.bundleIdentifier.getter(v13);
  v18 = v17;
  v19 = (os_unfair_lock_s *)(*(_QWORD *)(v15 + 24) + 16);
  os_unfair_lock_lock(v19);
  swift_beginAccess(v15 + 32, v48, 0, 0);
  v20 = sub_10000E87C(Extension, v18, *(_QWORD **)(v15 + 32));
  os_unfair_lock_unlock(v19);
  if ((v20 & 1) != 0)
  {
    v49 = v18;
    v43 = v5;
    sub_10000BE88();
    v22 = v21;
    v23 = *(_QWORD *)(v21 + 16);
    if (v23)
    {
      v24 = v21 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
      v47 = *(_QWORD *)(v7 + 72);
      v25 = *(uint64_t (**)(char *, unint64_t, uint64_t, __n128))(v7 + 16);
      v42 = v21;
      v26 = swift_bridgeObjectRetain(v21);
      while (1)
      {
        v27 = v25(v12, v24, v6, v26);
        v28 = ExtensionRecord.bundleIdentifier.getter(v27);
        v30 = v29;
        v31 = v49;
        if (v28 == Extension && v29 == v49)
        {
          v22 = v42;
          swift_bridgeObjectRelease(v42);
          v33 = v31;
          v34 = v31;
          goto LABEL_13;
        }
        v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, Extension, v49, 0);
        swift_bridgeObjectRelease(v30);
        if ((v32 & 1) != 0)
          break;
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
        v24 += v47;
        if (!--v23)
        {
          v22 = v42;
          swift_bridgeObjectRelease(v42);
          goto LABEL_9;
        }
      }
      v22 = v42;
      v33 = v42;
      v34 = v49;
LABEL_13:
      swift_bridgeObjectRelease(v33);
      v5 = v43;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v43, v12, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
      swift_bridgeObjectRelease(v34);
    }
    else
    {
LABEL_9:
      v5 = v43;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v43, 1, 1, v6);
      swift_bridgeObjectRelease(v49);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    v22 = v18;
  }
  swift_bridgeObjectRelease(v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_10000A934((uint64_t)v5, &qword_100051530);
    v35 = type metadata accessor for XPCRemoteError(0);
    v36 = sub_10000228C(&qword_100051918, (uint64_t (*)(uint64_t))&type metadata accessor for XPCRemoteError, (uint64_t)&protocol conformance descriptor for XPCRemoteError);
    swift_allocError(v35, v36, 0, 0);
    *v37 = 0xD000000000000011;
    v37[1] = 0x8000000100042580;
    v38 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v37, enum case for XPCRemoteError.genericError(_:), v35);
    return swift_willThrow(v38);
  }
  else
  {
    v40 = v44;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v44, v5, v6);
    v41 = v45;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v45, v40, v6);
    GetExtensionResponse.init(extensionRecord:)(v41);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v40, v6);
  }
}

uint64_t sub_100024894@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint8_t *v30;
  __n128 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint8_t *v35;
  uint8_t *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t *v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  char *v60;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint8_t *v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t);
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t (*v92)(char *, char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;

  v87 = a2;
  v83 = a3;
  v90 = type metadata accessor for TaskValidationError(0);
  v4 = *(_QWORD *)(v90 - 8);
  v5 = __chkstk_darwin(v90);
  v81 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v89 = (char *)&v74 - v8;
  __chkstk_darwin(v7);
  v80 = (char *)&v74 - v9;
  v10 = sub_100007800(&qword_100051920);
  __chkstk_darwin(v10);
  v82 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v12);
  v85 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TaskDefinition(0);
  v91 = *(_QWORD *)(v14 - 8);
  v92 = (uint64_t (*)(char *, char *, uint64_t))v14;
  v15 = __chkstk_darwin(v14);
  v84 = (void (*)(char *, uint64_t))((char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v15);
  v18 = (char *)&v74 - v17;
  v19 = type metadata accessor for AddTaskRequest(0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v22 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v23 = type metadata accessor for Logger(0);
  v24 = sub_10000A8E8(v23, (uint64_t)qword_100052B80);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v86 = a1;
  v26 = v25(v22, a1, v19);
  v79 = v24;
  v27 = Logger.logObject.getter(v26);
  v28 = static os_log_type_t.info.getter(v27);
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc(12, -1);
    v77 = swift_slowAlloc(32, -1);
    v95 = v77;
    v78 = v4;
    *(_DWORD *)v29 = 136315138;
    v30 = v29 + 12;
    v75 = v29 + 4;
    v76 = v29;
    v31.n128_f64[0] = ((double (*)(void))AddTaskRequest.taskDefinition.getter)();
    v32 = TaskDefinition.name.getter(v31);
    v34 = v33;
    (*(void (**)(char *, uint64_t (*)(char *, char *, uint64_t)))(v91 + 8))(v18, v92);
    v93 = sub_100008204(v32, v34, &v95);
    v35 = v30;
    v4 = v78;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94, v75, v35);
    swift_bridgeObjectRelease(v34);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    v36 = v76;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Processing AddTaskRequest for task: %s", v76, 0xCu);
    v37 = v77;
    swift_arrayDestroy(v77, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v36, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }

  v38 = v84;
  AddTaskRequest.taskDefinition.getter();
  v39 = v85;
  v40 = (uint64_t)v88;
  sub_100022B04(v38, v85);
  v42 = v89;
  v41 = v90;
  if (v40)
  {
    (*(void (**)(_QWORD, uint64_t (*)(char *, char *, uint64_t)))(v91 + 8))(v38, v92);
    v95 = v40;
    swift_errorRetain(v40);
    v43 = sub_100007800(&qword_100051620);
    v44 = v81;
    if ((swift_dynamicCast(v81, &v95, v43, v41, 0) & 1) != 0)
    {
      swift_errorRelease(v40);
      v45 = v80;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v80, v44, v41);
      v92 = *(uint64_t (**)(char *, char *, uint64_t))(v4 + 16);
      v46 = v92(v42, v45, v41);
      v47 = Logger.logObject.getter(v46);
      v48 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc(12, -1);
        v88 = (uint64_t *)swift_slowAlloc(8, -1);
        v50 = v4;
        *(_DWORD *)v49 = 138412290;
        v51 = sub_10000228C(&qword_100051660, (uint64_t (*)(uint64_t))&type metadata accessor for TaskValidationError, (uint64_t)&protocol conformance descriptor for TaskValidationError);
        v52 = swift_allocError(v41, v51, 0, 0);
        v91 = 0;
        v53 = v42;
        v54 = v52;
        v92(v55, v53, v41);
        v56 = _swift_stdlib_bridgeErrorToNSError(v54);
        v93 = v56;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94, v49 + 4, v49 + 12);
        v57 = v88;
        *v88 = v56;
        v58 = *(void (**)(char *, uint64_t))(v4 + 8);
        v58(v53, v41);
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Failed to register task due to TaskValidation error: %@", v49, 0xCu);
        v59 = sub_100007800(&qword_100051288);
        swift_arrayDestroy(v57, 1, v59);
        swift_slowDealloc(v57, -1, -1);
        swift_slowDealloc(v49, -1, -1);
      }
      else
      {
        v50 = v4;
        v58 = *(void (**)(char *, uint64_t))(v4 + 8);
        v58(v42, v41);
      }

      v70 = v82;
      v71 = v80;
      v92(v82, v80, v41);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v70, 0, 1, v41);
      AddTaskResponse.init(result:error:)(0, v70);
      v58(v71, v41);
      v72 = v95;
    }
    else
    {
      swift_errorRelease(v95);
      swift_errorRetain(v40);
      v62 = swift_errorRetain(v40);
      v63 = Logger.logObject.getter(v62);
      v64 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v63, v64))
      {
        v65 = (uint8_t *)swift_slowAlloc(12, -1);
        v66 = swift_slowAlloc(8, -1);
        v78 = v4;
        v92 = (uint64_t (*)(char *, char *, uint64_t))v66;
        *(_DWORD *)v65 = 138412290;
        swift_errorRetain(v40);
        v67 = _swift_stdlib_bridgeErrorToNSError(v40);
        v95 = v67;
        v41 = v90;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v65 + 4, v65 + 12);
        v68 = v92;
        *(_QWORD *)v92 = v67;
        swift_errorRelease(v40);
        swift_errorRelease(v40);
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "Failed to register task with error: %@", v65, 0xCu);
        v69 = sub_100007800(&qword_100051288);
        swift_arrayDestroy(v68, 1, v69);
        v4 = v78;
        swift_slowDealloc(v68, -1, -1);
        swift_slowDealloc(v65, -1, -1);
      }
      else
      {
        swift_errorRelease(v40);
        swift_errorRelease(v40);
      }

      v73 = v82;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v82, 1, 1, v41);
      AddTaskResponse.init(result:error:)(0, v73);
      v72 = v40;
    }
    return swift_errorRelease(v72);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t (*)(char *, char *, uint64_t)))(v91 + 8))(v38, v92);
    sub_10000A934((uint64_t)v39, &qword_100051638);
    v60 = v82;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v82, 1, 1, v41);
    return AddTaskResponse.init(result:error:)(1, v60);
  }
}

void sub_10002506C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000A8E8(v4, (uint64_t)qword_100052B80);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Resetting Tasks", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  sub_100022A28();
  v9 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry) + 56)
                          + 16);
  os_unfair_lock_lock(v9);
  sub_1000193C4(v10, sub_100036E40);
  if (v2)
  {
    os_unfair_lock_unlock(v9);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v9);
    sub_10000F7F8();
    v11 = ResetTasksResponse.init(reloaded:)(0);
    if ((ResetTasksRequest.reload.getter(v11) & 1) != 0)
    {
      sub_10001F64C();
      sub_100021EE4();
      sub_100022654();
      ResetTasksResponse.reloaded.setter(1);
    }
  }
}

uint64_t sub_1000251F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  __int128 v23;
  uint64_t v24;
  unint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  char v44;
  void (*v45)(unint64_t, char *, uint64_t);
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v57[3];
  char *v58;
  __int128 v59;
  uint64_t v60;
  char *v61;
  unsigned int v62;
  char *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t (*v66)(char *, char *, uint64_t);
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78[32];
  uint64_t v79;

  v57[1] = a2;
  v3 = type metadata accessor for TaskType(0);
  v71 = *(_QWORD *)(v3 - 8);
  v72 = v3;
  v4 = __chkstk_darwin(v3);
  v70 = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v69 = (char *)v57 - v6;
  v7 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v7);
  v9 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MLHostTask(0);
  v67 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v61 = (char *)v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v73 = (char *)v57 - v13;
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v14 = type metadata accessor for Logger(0);
  v60 = sub_10000A8E8(v14, (uint64_t)qword_100052B80);
  v15 = Logger.logObject.getter(v60);
  v16 = ((uint64_t (*)(void))static os_log_type_t.info.getter)();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Cleaning dynamicTasks", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

  v18 = *(_QWORD *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  v19 = (os_unfair_lock_s *)(*(_QWORD *)(v18 + 56) + 16);
  os_unfair_lock_lock(v19);
  v68 = v18 + 64;
  swift_beginAccess(v18 + 64, v78, 0, 0);
  v79 = v18;
  v20 = *(_QWORD *)(v18 + 64);
  swift_bridgeObjectRetain(v20);
  v22 = sub_10002BF3C(v21);
  swift_bridgeObjectRelease(v20);
  os_unfair_lock_unlock(v19);
  v24 = v22[2];
  v57[0] = v22;
  if (v24)
  {
    v62 = enum case for TaskType.dynamicTask(_:);
    v65 = _swiftEmptyArrayStorage;
    v25 = v22 + 5;
    *(_QWORD *)&v23 = 136315138;
    v59 = v23;
    v58 = (char *)&type metadata for Any + 8;
    v26 = v67;
    v63 = v9;
    v64 = v10;
    while (1)
    {
      v27 = *(v25 - 1);
      v28 = *v25;
      v29 = v79;
      v30 = (os_unfair_lock_s *)(*(_QWORD *)(v79 + 56) + 16);
      swift_bridgeObjectRetain(*v25);
      os_unfair_lock_lock(v30);
      swift_beginAccess(v68, &v76, 32, 0);
      v31 = *(_QWORD *)(v29 + 64);
      if (*(_QWORD *)(v31 + 16))
      {
        swift_bridgeObjectRetain(v28);
        v32 = sub_1000088BC(v27, v28);
        if ((v33 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v26 + 16))(v9, *(_QWORD *)(v31 + 56) + *(_QWORD *)(v26 + 72) * v32, v10);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v9, 0, 1, v10);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v9, 1, 1, v10);
        }
        swift_bridgeObjectRelease(v28);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v9, 1, 1, v10);
      }
      swift_endAccess(&v76);
      os_unfair_lock_unlock(v30);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v9, 1, v10) == 1)
      {
        swift_bridgeObjectRelease(v28);
        sub_10000A934((uint64_t)v9, &qword_100051638);
      }
      else
      {
        v66 = *(uint64_t (**)(char *, char *, uint64_t))(v26 + 32);
        v34 = v66(v73, v9, v10);
        MLHostTask.taskType.getter(v34);
        v35 = v72;
        (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v70, v62, v72);
        v36 = sub_10000228C(&qword_100051670, (uint64_t (*)(uint64_t))&type metadata accessor for TaskType, (uint64_t)&protocol conformance descriptor for TaskType);
        dispatch thunk of RawRepresentable.rawValue.getter(&v76, v35, v36);
        dispatch thunk of RawRepresentable.rawValue.getter(&v74, v35, v36);
        v37 = v77;
        v38 = v75;
        if (v76 == v74 && v77 == v75)
        {
          swift_bridgeObjectRelease_n(v77, 2);
          v39 = *(void (**)(char *, uint64_t))(v71 + 8);
          v40 = v72;
          v39(v70, v72);
          v39(v69, v40);
LABEL_20:
          v44 = sub_10000FAD8(v27, v28);
          v9 = v63;
          v10 = v64;
          if ((v44 & 1) != 0)
          {
            sub_100036140(v27, v28);
            swift_bridgeObjectRelease(v28);
            (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v61, v73, v10);
            if ((swift_isUniquelyReferenced_nonNull_native(v65) & 1) == 0)
              v65 = (_QWORD *)sub_1000195FC(0, v65[2] + 1, 1, (unint64_t)v65);
            v45 = (void (*)(unint64_t, char *, uint64_t))v66;
            v47 = v65[2];
            v46 = v65[3];
            if (v47 >= v46 >> 1)
              v65 = (_QWORD *)sub_1000195FC(v46 > 1, v47 + 1, 1, (unint64_t)v65);
            v48 = v65;
            v65[2] = v47 + 1;
            v49 = (unint64_t)v48
                + ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80))
                + *(_QWORD *)(v67 + 72) * v47;
            v26 = v67;
            v45(v49, v61, v10);
          }
          else
          {
            swift_bridgeObjectRetain(v28);
            v51 = Logger.logObject.getter(v50);
            v52 = static os_log_type_t.info.getter(v51);
            if (os_log_type_enabled(v51, v52))
            {
              v53 = swift_slowAlloc(12, -1);
              v54 = swift_slowAlloc(32, -1);
              v76 = v54;
              *(_DWORD *)v53 = v59;
              swift_bridgeObjectRetain(v28);
              *(_QWORD *)(v53 + 4) = sub_100008204(v27, v28, &v76);
              swift_bridgeObjectRelease_n(v28, 3);
              _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed at removing task: %s", (uint8_t *)v53, 0xCu);
              swift_arrayDestroy(v54, 1, v58);
              v55 = v54;
              v10 = v64;
              swift_slowDealloc(v55, -1, -1);
              swift_slowDealloc(v53, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n(v28, 2);
            }

            v26 = v67;
          }
          (*(void (**)(char *, uint64_t))(v26 + 8))(v73, v10);
          goto LABEL_8;
        }
        v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v76, v77, v74, v75, 0);
        swift_bridgeObjectRelease(v37);
        swift_bridgeObjectRelease(v38);
        v42 = *(void (**)(char *, uint64_t))(v71 + 8);
        v43 = v72;
        v42(v70, v72);
        v42(v69, v43);
        if ((v41 & 1) != 0)
          goto LABEL_20;
        v26 = v67;
        v10 = v64;
        (*(void (**)(char *, uint64_t))(v67 + 8))(v73, v64);
        swift_bridgeObjectRelease(v28);
        v9 = v63;
      }
LABEL_8:
      v25 += 2;
      if (!--v24)
        goto LABEL_33;
    }
  }
  v65 = _swiftEmptyArrayStorage;
LABEL_33:
  swift_release(v57[0]);
  return CleanTasksResponse.init(tasks:)(v65);
}

uint64_t sub_100025918(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = type metadata accessor for MLHostConfig(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
  swift_beginAccess(v7, v10, 0, 0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  return GetHostConfigurationResponse.init(config:)(v6);
}

uint64_t sub_1000259D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _BOOL4 v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v35;
  uint8_t *v36;
  int v37;
  uint64_t v38;
  os_log_t v39;
  uint64_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[3];
  uint64_t v47;
  uint64_t v48;

  v44 = a2;
  v6 = type metadata accessor for SetHostConfigurationRequest(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MLHostConfig(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = a1;
  SetHostConfigurationRequest.config.getter(v12);
  v15 = sub_10002D584();
  v43 = v11;
  v16 = *(void (**)(char *, uint64_t))(v11 + 8);
  v16(v14, v10);
  if (v15)
  {
    v41 = v15;
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v42 = a3;
    v17 = type metadata accessor for Logger(0);
    sub_10000A8E8(v17, (uint64_t)qword_100052B80);
    v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v45, v6);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.info.getter();
    v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      v39 = v19;
      v22 = swift_slowAlloc(12, -1);
      v37 = v21;
      v23 = (uint8_t *)v22;
      v24 = swift_slowAlloc(32, -1);
      v38 = v24;
      v46[0] = v24;
      v40 = v3;
      *(_DWORD *)v23 = 136315138;
      v25 = v23 + 12;
      v35 = v23 + 4;
      v36 = v23;
      SetHostConfigurationRequest.config.getter(v24);
      v26 = sub_10000228C(&qword_100051928, (uint64_t (*)(uint64_t))&type metadata accessor for MLHostConfig, (uint64_t)&protocol conformance descriptor for MLHostConfig);
      v27 = dispatch thunk of CustomStringConvertible.description.getter(v10, v26);
      v29 = v28;
      v16(v14, v10);
      v47 = sub_100008204(v27, v29, v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v35, v25);
      swift_bridgeObjectRelease(v29);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      v19 = v39;
      v30 = v36;
      _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v37, "Updated MLHost config: %s", v36, 0xCu);
      v31 = v38;
      swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v30, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }

    SetHostConfigurationRequest.config.getter(v32);
    v33 = v44 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
    swift_beginAccess(v44 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config, v46, 33, 0);
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 40))(v33, v14, v10);
    swift_endAccess(v46);
    LOBYTE(v15) = v41;
  }
  return SetHostConfigurationResponse.init(success:error:)(v15, 0, 0);
}

uint64_t sub_100025D0C()
{
  uint64_t v0;

  if ((GetNotificationsConfigRequest.registeredOnly.getter() & 1) != 0)
    v0 = sub_100006C08();
  else
    v0 = sub_100006840();
  return GetNotificationsConfigResponse.init(channelsByTopic:)(v0);
}

uint64_t sub_100025D68()
{
  char v0;

  sub_100005AB4();
  if ((ResetNotificationsRequest.reload.getter() & 1) != 0)
    sub_100003DB0();
  v0 = ResetNotificationsRequest.reload.getter();
  return ResetTasksResponse.init(reloaded:)(v0 & 1);
}

uint64_t sub_100025DDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_unfair_lock_s *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  NSObject *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  char *v77;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  os_log_type_t v97;
  uint8_t *v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  void (*v104)(char *, uint64_t);
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  Swift::String v109;
  uint64_t v110;
  void *v111;
  id v112;
  NSString v113;
  id v114;
  uint64_t v115;
  id v116;
  char *v117;
  uint64_t v118;
  NSObject *v119;
  NSObject *v120;
  os_log_type_t v121;
  uint8_t *v122;
  NSObject *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  id v130;
  NSString v131;
  char *v132;
  uint64_t v133;
  void *v134;
  NSObject *v135;
  NSObject *v136;
  uint64_t v137;
  id v138;
  NSObject *v139;
  id v140;
  id v141;
  char *v142;
  char *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  NSObject *v149;
  os_log_type_t v150;
  uint8_t *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  char *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  char *v164;
  char *v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  char *v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  NSObject *v186;
  uint64_t v187;

  v163 = type metadata accessor for OnDemandResult(0);
  v161 = *(_QWORD *)(v163 - 8);
  __chkstk_darwin(v163);
  v162 = (char *)&v158 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for OnDemandError(0);
  v182 = *(_QWORD *)(v9 - 8);
  v183 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v158 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v168 = type metadata accessor for TaskStatus(0);
  v167 = *(_QWORD *)(v168 - 8);
  v12 = __chkstk_darwin(v168);
  v166 = (char *)&v158 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v165 = (char *)&v158 - v14;
  v15 = sub_100007800(&qword_100051680);
  __chkstk_darwin(v15);
  v171 = (char *)&v158 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v170 = type metadata accessor for TaskDefinition(0);
  v169 = *(_QWORD *)(v170 - 8);
  __chkstk_darwin(v170);
  v18 = (char *)&v158 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for TaskRequest(0);
  v20 = *(_QWORD *)(v19 - 8);
  v176 = v19;
  v177 = v20;
  __chkstk_darwin(v19);
  v174 = (char *)&v158 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v173 = type metadata accessor for GetOnDemandTaskRequest(0);
  v178 = *(_QWORD *)(v173 - 8);
  __chkstk_darwin(v173);
  v172 = (char *)&v158 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v23);
  v25 = (char *)&v158 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for MLHostTask(0);
  v27 = *(_QWORD *)(v26 - 8);
  v180 = v26;
  v181 = v27;
  v28 = __chkstk_darwin(v26);
  v164 = (char *)&v158 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __chkstk_darwin(v28);
  v179 = (char *)&v158 - v31;
  v32 = GetOnDemandTaskRequest.taskName.getter(v30);
  v34 = v33;
  v35 = sub_10000E748(v32, v33, a2);
  v36 = swift_bridgeObjectRelease(v34);
  if ((v35 & 1) == 0)
  {
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v48 = type metadata accessor for Logger(0);
    v49 = sub_10000A8E8(v48, (uint64_t)qword_100052B80);
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Client not authorized for onDemand requests.", v52, 2u);
      swift_slowDealloc(v52, -1, -1);
    }

    (*(void (**)(char *, _QWORD, uint64_t))(v182 + 104))(v11, enum case for OnDemandError.clientUnauthorized(_:), v183);
    v53 = v11;
    return GetOnDemandTaskRequestResponse.init(error:)(v53);
  }
  v160 = v11;
  v175 = a4;
  v158 = a3;
  v37 = *(_QWORD *)(a3 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  v159 = a1;
  v38 = GetOnDemandTaskRequest.taskName.getter(v36);
  v40 = v39;
  v41 = (os_unfair_lock_s *)(*(_QWORD *)(v37 + 56) + 16);
  os_unfair_lock_lock(v41);
  swift_beginAccess(v37 + 64, &v186, 32, 0);
  v42 = *(_QWORD *)(v37 + 64);
  if (*(_QWORD *)(v42 + 16))
  {
    swift_bridgeObjectRetain(v40);
    v43 = sub_1000088BC(v38, v40);
    v44 = v180;
    if ((v45 & 1) != 0)
    {
      v46 = *(_QWORD *)(v42 + 56);
      v47 = v181;
      (*(void (**)(char *, unint64_t, uint64_t))(v181 + 16))(v25, v46 + *(_QWORD *)(v181 + 72) * v43, v180);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v25, 0, 1, v44);
    }
    else
    {
      v47 = v181;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v181 + 56))(v25, 1, 1, v180);
    }
    swift_bridgeObjectRelease(v40);
  }
  else
  {
    v44 = v180;
    v47 = v181;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v181 + 56))(v25, 1, 1, v180);
  }
  swift_endAccess(&v186);
  os_unfair_lock_unlock(v41);
  swift_bridgeObjectRelease(v40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v25, 1, v44) == 1)
  {
    sub_10000A934((uint64_t)v25, &qword_100051638);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v54 = type metadata accessor for Logger(0);
    sub_10000A8E8(v54, (uint64_t)qword_100052B80);
    v55 = v178;
    v56 = v172;
    v57 = v173;
    v58 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v178 + 16))(v172, v159, v173);
    v59 = Logger.logObject.getter(v58);
    v60 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc(12, -1);
      v62 = swift_slowAlloc(32, -1);
      v186 = v62;
      *(_DWORD *)v61 = 136315138;
      v63 = GetOnDemandTaskRequest.taskName.getter(v62);
      v65 = v64;
      v185 = (id)sub_100008204(v63, v64, (uint64_t *)&v186);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v185, &v186, v61 + 4, v61 + 12);
      swift_bridgeObjectRelease(v65);
      (*(void (**)(char *, uint64_t))(v178 + 8))(v56, v57);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "Invalid taskName for onDemand request: %s", v61, 0xCu);
      swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v61, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
    }

    v79 = v160;
    (*(void (**)(char *, _QWORD, uint64_t))(v182 + 104))(v160, enum case for OnDemandError.taskInvalid(_:), v183);
    v53 = v79;
    return GetOnDemandTaskRequestResponse.init(error:)(v53);
  }
  v66 = v179;
  v67 = (*(uint64_t (**)(char *, char *, uint64_t))(v47 + 32))(v179, v25, v44);
  v68 = MLHostTask.taskDefinition.getter(v67);
  v69 = (uint64_t)v171;
  TaskDefinition.taskRequest.getter(v68);
  (*(void (**)(char *, uint64_t))(v169 + 8))(v18, v170);
  v70 = v176;
  v71 = v177;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v177 + 48))(v69, 1, v176) == 1)
  {
    sub_10000A934(v69, &qword_100051680);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v72 = type metadata accessor for Logger(0);
    v73 = sub_10000A8E8(v72, (uint64_t)qword_100052B80);
    v74 = Logger.logObject.getter(v73);
    v75 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v76 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, v75, "Task should use new style taskDefinition with taskRequest section.", v76, 2u);
      swift_slowDealloc(v76, -1, -1);
    }

    v77 = v160;
    (*(void (**)(char *, _QWORD, uint64_t))(v182 + 104))(v160, enum case for OnDemandError.taskInvalid(_:), v183);
    GetOnDemandTaskRequestResponse.init(error:)(v77);
    return (*(uint64_t (**)(char *, uint64_t))(v181 + 8))(v66, v44);
  }
  else
  {
    v80 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 32))(v174, v69, v70);
    v81 = v165;
    MLHostTask.status.getter(v80);
    v82 = v167;
    v83 = v70;
    v84 = v166;
    v85 = v168;
    (*(void (**)(char *, _QWORD, uint64_t))(v167 + 104))(v166, enum case for TaskStatus.taskRunning(_:), v168);
    v86 = sub_10000228C(&qword_100051930, (uint64_t (*)(uint64_t))&type metadata accessor for TaskStatus, (uint64_t)&protocol conformance descriptor for TaskStatus);
    v87 = dispatch thunk of static Equatable.== infix(_:_:)(v81, v84, v85, v86);
    v88 = *(void (**)(char *, uint64_t))(v82 + 8);
    v88(v84, v85);
    v89 = ((uint64_t (*)(char *, uint64_t))v88)(v81, v85);
    if ((v87 & 1) != 0)
    {
      v90 = v179;
      if (qword_100050F28 != -1)
        swift_once(&qword_100050F28, sub_10001E040);
      v91 = type metadata accessor for Logger(0);
      sub_10000A8E8(v91, (uint64_t)qword_100052B80);
      v92 = v181;
      v93 = v164;
      v94 = (*(uint64_t (**)(char *, char *, uint64_t))(v181 + 16))(v164, v90, v44);
      v95 = Logger.logObject.getter(v94);
      v96 = v44;
      v97 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v95, v97))
      {
        v98 = (uint8_t *)swift_slowAlloc(12, -1);
        v99 = swift_slowAlloc(32, -1);
        v186 = v99;
        *(_DWORD *)v98 = 136315138;
        v100 = sub_10000228C(&qword_100051848, (uint64_t (*)(uint64_t))&type metadata accessor for MLHostTask, (uint64_t)&protocol conformance descriptor for MLHostTask);
        v101 = dispatch thunk of CustomStringConvertible.description.getter(v96, v100);
        v103 = v102;
        v185 = (id)sub_100008204(v101, v102, (uint64_t *)&v186);
        v90 = v179;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v185, &v186, v98 + 4, v98 + 12);
        swift_bridgeObjectRelease(v103);
        v104 = *(void (**)(char *, uint64_t))(v92 + 8);
        v104(v164, v96);
        _os_log_impl((void *)&_mh_execute_header, v95, v97, "Found existing running task: %s", v98, 0xCu);
        swift_arrayDestroy(v99, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v99, -1, -1);
        v105 = v98;
        v71 = v177;
        swift_slowDealloc(v105, -1, -1);
      }
      else
      {
        v104 = *(void (**)(char *, uint64_t))(v92 + 8);
        v104(v93, v96);
      }

      v126 = v160;
      (*(void (**)(char *, _QWORD, uint64_t))(v182 + 104))(v160, enum case for OnDemandError.taskRunning(_:), v183);
      GetOnDemandTaskRequestResponse.init(error:)(v126);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v174, v176);
      return ((uint64_t (*)(char *, uint64_t))v104)(v90, v96);
    }
    else
    {
      v106 = v83;
      v107 = (uint64_t)v179;
      v186 = MLHostTask.name.getter(v89);
      v187 = v108;
      v109._countAndFlagsBits = 0x6E616D65646E6F2ELL;
      v109._object = (void *)0xE900000000000064;
      String.append(_:)(v109);
      v110 = v187;
      v111 = (void *)objc_opt_self(BGSystemTaskScheduler);
      v112 = objc_msgSend(v111, "sharedScheduler");
      v113 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v110);
      v114 = objc_msgSend(v112, "taskRequestForIdentifier:", v113);

      if (v114)
      {
        v115 = qword_100050F28;
        v116 = v114;
        v117 = v174;
        if (v115 != -1)
          swift_once(&qword_100050F28, sub_10001E040);
        v118 = type metadata accessor for Logger(0);
        sub_10000A8E8(v118, (uint64_t)qword_100052B80);
        v119 = v116;
        v120 = Logger.logObject.getter(v119);
        v121 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v120, v121))
        {
          v122 = (uint8_t *)swift_slowAlloc(12, -1);
          v178 = swift_slowAlloc(8, -1);
          *(_DWORD *)v122 = 138412290;
          v186 = v119;
          v123 = v119;
          v106 = v176;
          v117 = v174;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v186, &v187, v122 + 4, v122 + 12);
          v124 = v178;
          *(_QWORD *)v178 = v114;

          v107 = (uint64_t)v179;
          _os_log_impl((void *)&_mh_execute_header, v120, v121, "Found existing taskRequest: %@", v122, 0xCu);
          v125 = sub_100007800(&qword_100051288);
          swift_arrayDestroy(v124, 1, v125);
          swift_slowDealloc(v124, -1, -1);
          swift_slowDealloc(v122, -1, -1);
        }
        else
        {

          v120 = v119;
        }
        v143 = v160;

        (*(void (**)(char *, _QWORD, uint64_t))(v182 + 104))(v143, enum case for OnDemandError.taskPending(_:), v183);
        GetOnDemandTaskRequestResponse.init(error:)(v143);

        (*(void (**)(char *, uint64_t))(v177 + 8))(v117, v106);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v181 + 8))(v107, v180);
      }
      else
      {
        v127 = sub_100020980(v107, 1);
        v129 = v128;
        v130 = objc_allocWithZone((Class)BGNonRepeatingSystemTaskRequest);
        swift_bridgeObjectRetain(v129);
        v178 = v127;
        v131 = String._bridgeToObjectiveC()();
        v132 = v174;
        v133 = v107;
        v134 = v131;
        swift_bridgeObjectRelease(v129);
        v135 = objc_msgSend(v130, "initWithIdentifier:", v134);

        v186 = v135;
        v136 = v135;
        -[NSObject setScheduleAfter:](v136, "setScheduleAfter:", 0.5);
        -[NSObject setTrySchedulingBefore:](v136, "setTrySchedulingBefore:", 10.0);

        v137 = sub_10000AB78(0, &qword_100051938, BGNonRepeatingSystemTaskRequest_ptr);
        TaskRequest.asSystemRequest<A>(request:)(&v186, v137);
        v138 = objc_msgSend(v111, "sharedScheduler");
        v139 = v186;
        v185 = 0;
        LOBYTE(v136) = objc_msgSend(v138, "submitTaskRequest:error:", v186, &v185);

        v140 = v185;
        if ((v136 & 1) != 0)
        {
          v141 = v185;
          swift_bridgeObjectRelease(v129);
          v142 = v162;
          (*(void (**)(char *, _QWORD, uint64_t))(v161 + 104))(v162, enum case for OnDemandResult.taskScheduled(_:), v163);
          GetOnDemandTaskRequestResponse.init(result:)(v142);

          (*(void (**)(char *, uint64_t))(v177 + 8))(v132, v83);
          return (*(uint64_t (**)(uint64_t, uint64_t))(v181 + 8))(v133, v180);
        }
        else
        {
          v144 = v185;
          v145 = _convertNSErrorToError(_:)(v140);

          swift_willThrow(v146);
          if (qword_100050F28 != -1)
            swift_once(&qword_100050F28, sub_10001E040);
          v147 = type metadata accessor for Logger(0);
          sub_10000A8E8(v147, (uint64_t)qword_100052B80);
          v148 = swift_bridgeObjectRetain_n(v129, 2);
          v149 = Logger.logObject.getter(v148);
          v150 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v149, v150))
          {
            v151 = (uint8_t *)swift_slowAlloc(12, -1);
            v152 = v145;
            v153 = (void *)swift_slowAlloc(32, -1);
            v185 = v153;
            *(_DWORD *)v151 = 136315138;
            swift_bridgeObjectRetain(v129);
            v154 = v178;
            v184 = sub_100008204(v178, v129, (uint64_t *)&v185);
            v106 = v176;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v184, &v185, v151 + 4, v151 + 12);
            swift_bridgeObjectRelease_n(v129, 3);
            _os_log_impl((void *)&_mh_execute_header, v149, v150, "Failed at scheduling ondemand task: %s", v151, 0xCu);
            swift_arrayDestroy(v153, 1, (char *)&type metadata for Any + 8);
            v155 = v153;
            v145 = v152;
            swift_slowDealloc(v155, -1, -1);
            swift_slowDealloc(v151, -1, -1);

            v156 = v174;
            v157 = v160;
          }
          else
          {

            swift_bridgeObjectRelease_n(v129, 2);
            v156 = v174;
            v157 = v160;
            v154 = v178;
          }
          sub_100036140(v154, v129);
          swift_bridgeObjectRelease(v129);
          (*(void (**)(char *, _QWORD, uint64_t))(v182 + 104))(v157, enum case for OnDemandError.schedulingError(_:), v183);
          GetOnDemandTaskRequestResponse.init(error:)(v157);
          swift_errorRelease(v145);

          (*(void (**)(char *, uint64_t))(v177 + 8))(v156, v106);
          return (*(uint64_t (**)(char *, uint64_t))(v181 + 8))(v179, v180);
        }
      }
    }
  }
}

void sub_100026F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _BYTE *v28;
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
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  _BOOL4 v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  __n128 v69;
  uint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  _BYTE *v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  __n128 v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  _BYTE *v87;
  _BYTE *v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __n128 v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __n128 v107;
  _BYTE *v108;
  uint64_t v109;
  _BYTE *v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE *v113;
  uint64_t v114;
  _BYTE *v115;
  __n128 v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _BYTE *v126;
  uint64_t v127;
  void (*v128)(uint64_t, uint64_t);
  double (*v129)(uint64_t, uint64_t);
  uint64_t v130;
  __n128 v131;
  void (*v132)(char *, uint64_t);
  unint64_t v133;
  unint64_t v134;
  char *v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  int v140;
  _BYTE *v141;
  uint64_t v142;
  NSObject *v143;
  os_log_type_t v144;
  uint8_t *v145;
  uint64_t v146;
  __n128 v147;
  uint64_t v148;
  unint64_t v149;
  unint64_t v150;
  __n128 v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _BYTE *v160;
  uint64_t v161;
  _BYTE *v162;
  uint64_t v163;
  uint64_t *v164;
  void (*v165)(_BYTE *, uint64_t);
  uint64_t v166;
  _BYTE *v167;
  uint64_t v168;
  NSObject *v169;
  os_log_type_t v170;
  uint8_t *v171;
  uint64_t v172;
  __n128 v173;
  uint64_t v174;
  unint64_t v175;
  unint64_t v176;
  uint64_t v177;
  __n128 v178;
  uint64_t v179;
  unint64_t v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  _BYTE *v189;
  _QWORD *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  __n128 v194;
  _BYTE *v195;
  uint64_t v196;
  unint64_t v197;
  unint64_t v198;
  void *v199;
  Class isa;
  id v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  _BYTE *v205;
  _QWORD *v206;
  _BYTE *v207;
  uint64_t v208;
  uint64_t v209;
  double (*v210)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v211;
  uint64_t v212;
  uint64_t v213;
  __n128 v214;
  _BYTE *v215;
  _BYTE *v216;
  _BYTE *v217;
  unint64_t v218;
  _BYTE *v219;
  void (*v220)(_BYTE *, uint64_t);
  _BYTE *v221;
  uint64_t v222;
  uint64_t v223;
  _QWORD *v224;
  uint64_t v225;
  __n128 v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t v229;
  uint64_t *v230;
  uint64_t *v231;
  _BYTE *v232;
  uint64_t *v233;
  uint64_t *v234;
  uint64_t v235;
  NSObject *v236;
  os_log_type_t v237;
  _BOOL4 v238;
  uint64_t v239;
  uint64_t v240;
  __n128 v241;
  uint64_t v242;
  unint64_t v243;
  unint64_t v244;
  char *v245;
  uint64_t v246;
  uint64_t *v247;
  uint64_t v248;
  __n128 v249;
  uint64_t v250;
  unint64_t v251;
  unint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  _BYTE *v260;
  _BYTE *v261;
  uint64_t v262;
  uint64_t v263;
  NSObject *v264;
  os_log_type_t v265;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  __n128 v270;
  os_log_type_t v271;
  uint64_t v272;
  unint64_t v273;
  unint64_t v274;
  char *v275;
  uint64_t v276;
  uint64_t v277;
  unint64_t v278;
  unint64_t v279;
  id v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  _BYTE *v284;
  uint64_t v285;
  NSObject *v286;
  os_log_type_t v287;
  BOOL v288;
  uint64_t v289;
  uint64_t v290;
  __n128 v291;
  uint64_t v292;
  unint64_t v293;
  unint64_t v294;
  char *v295;
  uint64_t v296;
  uint64_t *v297;
  uint64_t v298;
  __n128 v299;
  uint64_t v300;
  unint64_t v301;
  unint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  __n128 v308;
  uint64_t v309;
  unint64_t v310;
  unint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  _BYTE *v317;
  uint64_t v318;
  _BYTE v319[12];
  unsigned int v320;
  _BYTE *v321;
  uint64_t *v322;
  _BYTE *v323;
  _BYTE *v324;
  __n128 v325;
  uint64_t v326;
  unsigned int v327;
  unsigned int v328;
  _BYTE *v329;
  uint64_t v330;
  uint64_t v331;
  unsigned int v332;
  _BYTE *v333;
  _BYTE *v334;
  _BYTE *v335;
  _BYTE *v336;
  _BYTE *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  _BYTE *v341;
  uint64_t *v342;
  void (*v343)(_BYTE *, uint64_t);
  _BYTE *v344;
  _BYTE *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  _BYTE *v349;
  char *v350;
  unsigned int v351;
  __n128 v352;
  char *v353;
  __n128 v354;
  unsigned int v355;
  unsigned int v356;
  uint64_t v357;
  _BYTE *v358;
  _BYTE *v359;
  _BYTE *v360;
  uint64_t v361;
  char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  _BYTE *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  _BYTE *v375;
  uint64_t v376;
  uint64_t v377;
  _BYTE *v378;
  _BYTE *v379;
  uint64_t v380;
  _BYTE *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  void (*v386)(uint64_t, uint64_t);
  void (*v387)(uint64_t, uint64_t);
  void (*v388)(char *, uint64_t);
  uint64_t v389;
  uint64_t v390;
  _BYTE *v391;
  _BYTE *v392;
  uint64_t v393;
  _BYTE *v394;
  unint64_t v395;
  void (*v396)(_BYTE *, _QWORD, uint64_t);
  void (*v397)(_BYTE *, _QWORD, uint64_t);
  void (*v398)(_BYTE *, _BYTE *, uint64_t);
  void (*v399)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v400;
  unsigned int v401;
  _BYTE *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  _BYTE *v407;
  uint64_t v408;
  char v409;
  uint64_t v410;
  unint64_t v411;

  v370 = a8;
  v369 = a7;
  v368 = a6;
  v367 = a5;
  v366 = a4;
  v365 = a3;
  v364 = a2;
  v363 = a1;
  v340 = type metadata accessor for MLHostPushParameters(0);
  __chkstk_darwin(v340);
  v345 = &v319[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v339 = type metadata accessor for URL.DirectoryHint(0);
  v338 = *(_QWORD *)(v339 - 8);
  __chkstk_darwin(v339);
  v337 = &v319[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_100007800(&qword_100051610);
  __chkstk_darwin(v12);
  v336 = &v319[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v348 = type metadata accessor for URL(0);
  v347 = *(_QWORD *)(v348 - 8);
  v14 = __chkstk_darwin(v348);
  v16 = &v319[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = __chkstk_darwin(v14);
  v335 = &v319[-v18];
  __chkstk_darwin(v17);
  v20 = &v319[-v19];
  v21 = type metadata accessor for JSONEncoder.OutputFormatting(0);
  __chkstk_darwin(v21);
  v334 = &v319[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v331 = type metadata accessor for String.Encoding(0);
  v330 = *(_QWORD *)(v331 - 8);
  __chkstk_darwin(v331);
  v329 = &v319[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = sub_100007800(&qword_100051638);
  __chkstk_darwin(v24);
  v26 = &v319[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v374 = type metadata accessor for MLHostTask(0);
  v373 = *(_QWORD *)(v374 - 8);
  __chkstk_darwin(v374);
  v28 = &v319[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29 = sub_100007800(&qword_100051698);
  __chkstk_darwin(v29);
  v394 = &v319[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v393 = type metadata accessor for DynamicTaskSource(0);
  v361 = *(_QWORD *)(v393 - 8);
  __chkstk_darwin(v393);
  v392 = &v319[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v403 = type metadata accessor for TaskStatus(0);
  v385 = *(_QWORD *)(v403 - 8);
  __chkstk_darwin(v403);
  v391 = &v319[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v33 = sub_100007800(&qword_100051838);
  __chkstk_darwin(v33);
  v360 = &v319[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v35 = sub_100007800(&qword_1000516A0);
  __chkstk_darwin(v35);
  v359 = &v319[-((v36 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v390 = type metadata accessor for TaskMetadata(0);
  v384 = *(_QWORD *)(v390 - 8);
  __chkstk_darwin(v390);
  v402 = &v319[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v383 = type metadata accessor for PushMetadata(0);
  v382 = *(_QWORD *)(v383 - 8);
  __chkstk_darwin(v383);
  v381 = &v319[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v380 = type metadata accessor for Date(0);
  v372 = *(_QWORD *)(v380 - 8);
  __chkstk_darwin(v380);
  v371 = &v319[-((v39 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v389 = type metadata accessor for MLHostPushMessage(0);
  v40 = *(_QWORD *)(v389 - 8);
  v41 = __chkstk_darwin(v389);
  v333 = &v319[-((v42 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v43 = __chkstk_darwin(v41);
  v323 = &v319[-v44];
  v45 = __chkstk_darwin(v43);
  v358 = &v319[-v46];
  v47 = __chkstk_darwin(v45);
  v324 = &v319[-v48];
  v49 = __chkstk_darwin(v47);
  v341 = &v319[-v50];
  v51 = __chkstk_darwin(v49);
  v379 = &v319[-v52];
  v53 = __chkstk_darwin(v51);
  v55 = &v319[-v54];
  v56 = __chkstk_darwin(v53);
  v58 = &v319[-v57];
  __chkstk_darwin(v56);
  v407 = &v319[-v59];
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v60 = type metadata accessor for Logger(0);
  v61 = sub_10000A8E8(v60, (uint64_t)qword_100052B80);
  swift_bridgeObjectRetain(a9);
  v406 = v61;
  v63 = Logger.logObject.getter(v62);
  v64 = static os_log_type_t.info.getter(v63);
  v65 = os_log_type_enabled(v63, v64);
  v344 = v20;
  v362 = v26;
  v349 = v28;
  if (!v65)
  {

    swift_bridgeObjectRelease(a9);
    v67 = *(_QWORD *)(a9 + 16);
    if (!v67)
      return;
    goto LABEL_7;
  }
  v66 = (uint8_t *)swift_slowAlloc(12, -1);
  *(_DWORD *)v66 = 134217984;
  v410 = *(_QWORD *)(a9 + 16);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, &v411, v66 + 4, v66 + 12);
  swift_bridgeObjectRelease(a9);
  _os_log_impl((void *)&_mh_execute_header, v63, v64, "Received push notification with %ld messages.", v66, 0xCu);
  swift_slowDealloc(v66, -1, -1);

  v67 = *(_QWORD *)(a9 + 16);
  if (v67)
  {
LABEL_7:
    v321 = v16;
    v377 = a10;
    v357 = OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry;
    v68 = a9 + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
    v356 = enum case for TaskStatus.taskCreated(_:);
    v401 = enum case for DynamicTaskSource.push(_:);
    v355 = enum case for TaskStatus.taskReceived(_:);
    v350 = &v409;
    v332 = enum case for TaskStatus.taskSuccessfullyRegistered(_:);
    v327 = enum case for TaskStatus.taskParametersFailedToStore(_:);
    v328 = enum case for URL.DirectoryHint.inferFromPath(_:);
    v320 = enum case for TaskStatus.taskParametersStored(_:);
    v351 = enum case for TaskStatus.taskFailedToRegister(_:);
    v376 = *(_QWORD *)(v40 + 72);
    v326 = a9;
    v69 = swift_bridgeObjectRetain(a9);
    v395 = 0;
    v69.n128_u64[0] = 134218242;
    v354 = v69;
    v353 = (char *)&type metadata for Any + 8;
    v69.n128_u64[0] = 136315138;
    v352 = v69;
    v69.n128_u64[0] = 136315394;
    v325 = v69;
    v70 = v372;
    v71 = v371;
    v72 = v389;
    v375 = v55;
    v378 = v58;
    v73 = v407;
    while (1)
    {
      v404 = v68;
      v405 = v67;
      sub_100036674(v68, (uint64_t)v73);
      sub_100036674((uint64_t)v73, (uint64_t)v58);
      v74 = sub_100036674((uint64_t)v73, (uint64_t)v55);
      v75 = Logger.logObject.getter(v74);
      v76 = static os_log_type_t.info.getter(v75);
      if (os_log_type_enabled(v75, v76))
      {
        v77 = swift_slowAlloc(22, -1);
        v78 = swift_slowAlloc(32, -1);
        v79 = (uint64_t *)v58;
        v80 = v78;
        v410 = v78;
        *(_DWORD *)v77 = v354.n128_u32[0];
        v81 = *v79;
        sub_10000B5E8((uint64_t)v79, type metadata accessor for MLHostPushMessage);
        *(_QWORD *)(v77 + 4) = v81;
        *(_WORD *)(v77 + 12) = 2080;
        v83 = TaskDefinition.name.getter(v82);
        v85 = v84;
        *(_QWORD *)(v77 + 14) = sub_100008204(v83, v84, &v410);
        swift_bridgeObjectRelease(v85);
        sub_10000B5E8((uint64_t)v55, type metadata accessor for MLHostPushMessage);
        _os_log_impl((void *)&_mh_execute_header, v75, v76, "Received new push message: version: %ld, task: %s", (uint8_t *)v77, 0x16u);
        swift_arrayDestroy(v80, 1, v353);
        swift_slowDealloc(v80, -1, -1);
        swift_slowDealloc(v77, -1, -1);
      }
      else
      {
        sub_10000B5E8((uint64_t)v58, type metadata accessor for MLHostPushMessage);
        sub_10000B5E8((uint64_t)v55, type metadata accessor for MLHostPushMessage);
      }

      v86 = (uint64_t)v379;
      v87 = v407;
      v88 = &v407[*(int *)(v72 + 20)];
      static Date.now.getter(v89);
      v90 = static Date.> infix(_:_:)(v88, v71);
      v91 = v380;
      (*(void (**)(_BYTE *, uint64_t))(v70 + 8))(v71, v380);
      if ((v90 & 1) != 0)
      {
        v92 = sub_100036674((uint64_t)v87, v86);
        v93 = Logger.logObject.getter(v92);
        v73 = v87;
        v94 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v93, v94))
        {
          v95 = v86;
          v96 = swift_slowAlloc(12, -1);
          v97 = swift_slowAlloc(32, -1);
          v410 = v97;
          v98 = v352;
          *(_DWORD *)v96 = v352.n128_u32[0];
          v99 = TaskDefinition.name.getter(v98);
          v101 = v100;
          *(_QWORD *)(v96 + 4) = sub_100008204(v99, v100, &v410);
          swift_bridgeObjectRelease(v101);
          v102 = v95;
          v55 = v375;
          sub_10000B5E8(v102, type metadata accessor for MLHostPushMessage);
          _os_log_impl((void *)&_mh_execute_header, v93, v94, "Push task cannot be registered before created, task name: %s.", (uint8_t *)v96, 0xCu);
          swift_arrayDestroy(v97, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v97, -1, -1);
          swift_slowDealloc(v96, -1, -1);

        }
        else
        {

          sub_10000B5E8(v86, type metadata accessor for MLHostPushMessage);
        }
        sub_10000B5E8((uint64_t)v73, type metadata accessor for MLHostPushMessage);
        goto LABEL_10;
      }
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v70 + 16))(v71, v88, v91);
      v103 = v364;
      swift_bridgeObjectRetain(v364);
      v104 = v366;
      swift_bridgeObjectRetain(v366);
      v105 = v368;
      swift_bridgeObjectRetain(v368);
      v106 = v370;
      v107 = swift_bridgeObjectRetain(v370);
      v108 = v381;
      PushMetadata.init(topic:channelID:pushType:pushPriority:creationDate:)(v363, v103, v365, v104, v367, v105, v369, v106, v107, v71);
      v109 = v382;
      v110 = v359;
      v111 = v383;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v382 + 16))(v359, v108, v383);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v109 + 56))(v110, 0, 1, v111);
      v112 = type metadata accessor for PullMetadata(0);
      v113 = v360;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v112 - 8) + 56))(v360, 1, 1, v112);
      v114 = v72;
      v115 = v402;
      v116.n128_f64[0] = TaskMetadata.init(pushMetadata:pullMetadata:)(v110, v113);
      v400 = *(_QWORD *)(v377 + v357);
      v388 = (void (*)(char *, uint64_t))&v87[*(int *)(v114 + 24)];
      v117 = TaskDefinition.name.getter(v116);
      v119 = v118;
      v396 = *(void (**)(_BYTE *, _QWORD, uint64_t))(v385 + 104);
      v120 = (uint64_t)v391;
      v396(v391, v356, v403);
      v121 = v361;
      v397 = *(void (**)(_BYTE *, _QWORD, uint64_t))(v361 + 104);
      v122 = (uint64_t)v392;
      v123 = v393;
      v397(v392, v401, v393);
      v124 = v384;
      v398 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v384 + 16);
      v125 = (uint64_t)v394;
      v126 = v115;
      v127 = v390;
      v398(v394, v126, v390);
      v399 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v124 + 56);
      v399(v125, 0, 1, v127);
      sub_100013848(v117, v119, v120, v122, v125);
      swift_bridgeObjectRelease(v119);
      sub_10000A934(v125, &qword_100051698);
      v128 = *(void (**)(uint64_t, uint64_t))(v121 + 8);
      v128(v122, v123);
      v129 = *(double (**)(uint64_t, uint64_t))(v385 + 8);
      v130 = v403;
      v131.n128_f64[0] = v129(v120, v403);
      v132 = v388;
      v387 = (void (*)(uint64_t, uint64_t))TaskDefinition.name.getter(v131);
      v134 = v133;
      v396((_BYTE *)v120, v355, v130);
      v397((_BYTE *)v122, v401, v123);
      v398((_BYTE *)v125, v402, v127);
      v399(v125, 0, 1, v127);
      sub_100013848((uint64_t)v387, v134, v120, v122, v125);
      swift_bridgeObjectRelease(v134);
      sub_10000A934(v125, &qword_100051698);
      v386 = v128;
      v128(v122, v123);
      v387 = (void (*)(uint64_t, uint64_t))v129;
      v129(v120, v130);
      v135 = v362;
      v136 = v395;
      sub_100022B04(v132, v362);
      v137 = v374;
      v138 = v373;
      if (v136)
        break;
      v140 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v373 + 48))(v135, 1, v374);
      v139 = (uint64_t)v358;
      v395 = 0;
      if (v140 == 1)
        goto LABEL_20;
      v162 = v349;
      v163 = (*(uint64_t (**)(_BYTE *, char *, uint64_t))(v138 + 32))(v349, v135, v137);
      v164 = (uint64_t *)MLHostTask.taskFolder.getter(v163);
      v166 = v389;
      v141 = v407;
      if (!v165)
      {
        (*(void (**)(_BYTE *, uint64_t))(v138 + 8))(v162, v137);
        goto LABEL_21;
      }
      v342 = v164;
      v343 = v165;
      v167 = v341;
      v168 = sub_100036674((uint64_t)v407, (uint64_t)v341);
      v169 = Logger.logObject.getter(v168);
      v170 = static os_log_type_t.info.getter(v169);
      if (os_log_type_enabled(v169, v170))
      {
        v171 = (uint8_t *)swift_slowAlloc(12, -1);
        v172 = swift_slowAlloc(32, -1);
        v410 = v172;
        v173 = v352;
        *(_DWORD *)v171 = v352.n128_u32[0];
        v174 = TaskDefinition.name.getter(v173);
        v176 = v175;
        v408 = sub_100008204(v174, v175, &v410);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v408, v350, v171 + 4, v171 + 12);
        swift_bridgeObjectRelease(v176);
        sub_10000B5E8((uint64_t)v167, type metadata accessor for MLHostPushMessage);
        _os_log_impl((void *)&_mh_execute_header, v169, v170, "Task %s is successfully registered via push message.", v171, 0xCu);
        swift_arrayDestroy(v172, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v172, -1, -1);
        swift_slowDealloc(v171, -1, -1);
      }
      else
      {
        sub_10000B5E8((uint64_t)v167, type metadata accessor for MLHostPushMessage);
      }

      v177 = v166;
      v179 = TaskDefinition.name.getter(v178);
      v181 = v180;
      v182 = (uint64_t)v391;
      v183 = v403;
      v396(v391, v332, v403);
      v184 = (uint64_t)v392;
      v185 = v393;
      v397(v392, v401, v393);
      v186 = (uint64_t)v394;
      v187 = v390;
      v398(v394, v402, v390);
      v399(v186, 0, 1, v187);
      sub_100013848(v179, v181, v182, v184, v186);
      swift_bridgeObjectRelease(v181);
      sub_10000A934(v186, &qword_100051698);
      v386(v184, v185);
      v387(v182, v183);
      v188 = *(int *)(v177 + 32);
      v189 = v407;
      v190 = &v407[v188];
      v191 = *(_QWORD *)&v407[v188 + 8];
      v192 = v177;
      if (v191)
      {
        v193 = *v190;
        v194 = swift_bridgeObjectRetain(*(_QWORD *)&v407[v188 + 8]);
        v195 = v329;
        static String.Encoding.utf8.getter(v194);
        v196 = String.data(using:allowLossyConversion:)(v195, 0, v193, v191);
        v198 = v197;
        swift_bridgeObjectRelease(v191);
        (*(void (**)(_BYTE *, uint64_t))(v330 + 8))(v195, v331);
        if (v198 >> 60 != 15)
        {
          v199 = (void *)objc_opt_self(NSJSONSerialization);
          isa = Data._bridgeToObjectiveC()().super.isa;
          v410 = 0;
          v201 = objc_msgSend(v199, "JSONObjectWithData:options:error:", isa, 4, &v410);

          v202 = v410;
          if (!v201)
          {
            v395 = v198;
            v280 = (id)v410;
            swift_bridgeObjectRelease(v343);
            v281 = _convertNSErrorToError(_:)(v202);

            swift_willThrow(v282);
            v283 = (uint64_t)v189;
            v284 = v323;
            sub_100036674(v283, (uint64_t)v323);
            swift_errorRetain(v281);
            v285 = swift_errorRetain(v281);
            v286 = Logger.logObject.getter(v285);
            v287 = static os_log_type_t.error.getter();
            v288 = os_log_type_enabled(v286, v287);
            v346 = v196;
            v343 = (void (*)(_BYTE *, uint64_t))v281;
            if (v288)
            {
              v289 = swift_slowAlloc(22, -1);
              v342 = (uint64_t *)swift_slowAlloc(8, -1);
              v290 = swift_slowAlloc(32, -1);
              v410 = v290;
              v291 = v325;
              *(_DWORD *)v289 = v325.n128_u32[0];
              v292 = TaskDefinition.name.getter(v291);
              v294 = v293;
              v408 = sub_100008204(v292, v293, &v410);
              v295 = v350;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v408, v350, v289 + 4, v289 + 12);
              swift_bridgeObjectRelease(v294);
              sub_10000B5E8((uint64_t)v284, type metadata accessor for MLHostPushMessage);
              *(_WORD *)(v289 + 12) = 2112;
              swift_errorRetain(v281);
              v296 = _swift_stdlib_bridgeErrorToNSError(v281);
              v408 = v296;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v408, v295, v289 + 14, v289 + 22);
              v297 = v342;
              *v342 = v296;
              swift_errorRelease(v281);
              swift_errorRelease(v281);
              _os_log_impl((void *)&_mh_execute_header, v286, v287, "Failed at storing parameters for pushed task %s, with error: %@", (uint8_t *)v289, 0x16u);
              v298 = sub_100007800(&qword_100051288);
              swift_arrayDestroy(v297, 1, v298);
              swift_slowDealloc(v297, -1, -1);
              swift_arrayDestroy(v290, 1, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v290, -1, -1);
              swift_slowDealloc(v289, -1, -1);
            }
            else
            {
              sub_10000B5E8((uint64_t)v284, type metadata accessor for MLHostPushMessage);
              swift_errorRelease(v281);
              swift_errorRelease(v281);
            }

            v309 = TaskDefinition.name.getter(v308);
            v311 = v310;
            v312 = (uint64_t)v391;
            v313 = v403;
            v396(v391, v327, v403);
            v314 = (uint64_t)v392;
            v315 = v393;
            v397(v392, v401, v393);
            v316 = (uint64_t)v394;
            v317 = v402;
            v318 = v390;
            v398(v394, v402, v390);
            v399(v316, 0, 1, v318);
            sub_100013848(v309, v311, v312, v314, v316);
            sub_10000AB44(v346, v395);
            swift_bridgeObjectRelease(v311);
            swift_errorRelease(v343);
            sub_10000A934(v316, &qword_100051698);
            v386(v314, v315);
            v387(v312, v313);
            (*(void (**)(_BYTE *, uint64_t))(v373 + 8))(v349, v374);
            (*(void (**)(_BYTE *, uint64_t))(v384 + 8))(v317, v318);
            (*(void (**)(_BYTE *, uint64_t))(v382 + 8))(v381, v383);
            v73 = v407;
            sub_10000B5E8((uint64_t)v407, type metadata accessor for MLHostPushMessage);
            v395 = 0;
            goto LABEL_26;
          }
          v203 = (id)v410;
          _bridgeAnyObjectToAny(_:)(&v410, v201);
          sub_10000AB44(v196, v198);
          swift_unknownObjectRelease(v201);
          sub_10000A9A4(&v410);
        }
      }
      v204 = type metadata accessor for JSONEncoder(0);
      swift_allocObject(v204, *(unsigned int *)(v204 + 48), *(unsigned __int16 *)(v204 + 52));
      v346 = JSONEncoder.init()();
      v205 = v334;
      static JSONEncoder.OutputFormatting.prettyPrinted.getter();
      dispatch thunk of JSONEncoder.outputFormatting.setter(v205);
      v206 = v190;
      v207 = v336;
      v208 = v348;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v347 + 56))(v336, 1, 1, v348);
      v209 = v338;
      v210 = *(double (**)(_BYTE *, _QWORD, uint64_t))(v338 + 104);
      v211 = v337;
      v212 = v328;
      v213 = v339;
      v214.n128_f64[0] = v210(v337, v328, v339);
      v215 = v335;
      v216 = v207;
      v217 = v407;
      URL.init(filePath:directoryHint:relativeTo:)(v342, v343, v211, v216, v214);
      v410 = 0x6574656D61726170;
      v411 = 0xEF6E6F736A2E7372;
      v210(v211, v212, v213);
      v218 = sub_10001CF54();
      v219 = v344;
      URL.appending<A>(path:directoryHint:)(&v410, v211, &type metadata for String, v218);
      (*(void (**)(_BYTE *, uint64_t))(v209 + 8))(v211, v213);
      swift_bridgeObjectRelease(v411);
      v220 = *(void (**)(_BYTE *, uint64_t))(v347 + 8);
      v220(v215, v208);
      v221 = v345;
      sub_100036E58((uint64_t)&v217[*(int *)(v192 + 28)], (uint64_t)v345, &qword_100051180);
      v222 = v206[1];
      v223 = v340;
      v224 = &v221[*(int *)(v340 + 20)];
      *v224 = *v206;
      v224[1] = v222;
      v225 = sub_10000228C(&qword_100051840, type metadata accessor for MLHostPushParameters, (uint64_t)&unk_100038B20);
      v226 = swift_bridgeObjectRetain(v222);
      v227 = v225;
      v228 = v395;
      v229 = dispatch thunk of JSONEncoder.encode<A>(_:)(v221, v223, v227, v226);
      v231 = (uint64_t *)v228;
      v343 = v220;
      if (v228)
      {
        v395 = 0;
        v232 = v333;
        sub_100036674((uint64_t)v217, (uint64_t)v333);
        swift_errorRetain(v231);
        v235 = swift_errorRetain(v231);
        v236 = Logger.logObject.getter(v235);
        v237 = static os_log_type_t.error.getter();
        v238 = os_log_type_enabled(v236, v237);
        v342 = v231;
        if (v238)
        {
          v239 = swift_slowAlloc(22, -1);
          v322 = (uint64_t *)swift_slowAlloc(8, -1);
          v240 = swift_slowAlloc(32, -1);
          v410 = v240;
          v241 = v325;
          *(_DWORD *)v239 = v325.n128_u32[0];
          v242 = TaskDefinition.name.getter(v241);
          v244 = v243;
          v408 = sub_100008204(v242, v243, &v410);
          v245 = v350;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v408, v350, v239 + 4, v239 + 12);
          swift_bridgeObjectRelease(v244);
          sub_10000B5E8((uint64_t)v232, type metadata accessor for MLHostPushMessage);
          *(_WORD *)(v239 + 12) = 2112;
          swift_errorRetain(v231);
          v246 = _swift_stdlib_bridgeErrorToNSError(v231);
          v408 = v246;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v408, v245, v239 + 14, v239 + 22);
          v247 = v322;
          *v322 = v246;
          swift_errorRelease(v231);
          swift_errorRelease(v231);
          _os_log_impl((void *)&_mh_execute_header, v236, v237, "Failed at storing parameters for pushed task %s, with error: %@", (uint8_t *)v239, 0x16u);
          v248 = sub_100007800(&qword_100051288);
          swift_arrayDestroy(v247, 1, v248);
          swift_slowDealloc(v247, -1, -1);
          swift_arrayDestroy(v240, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v240, -1, -1);
          swift_slowDealloc(v239, -1, -1);
        }
        else
        {
          sub_10000B5E8((uint64_t)v232, type metadata accessor for MLHostPushMessage);
          swift_errorRelease(v231);
          swift_errorRelease(v231);
        }

        v250 = TaskDefinition.name.getter(v249);
        v252 = v251;
        v253 = (uint64_t)v391;
        v254 = v403;
        v396(v391, v327, v403);
        v255 = (uint64_t)v392;
        v256 = v393;
        v397(v392, v401, v393);
        v257 = (uint64_t)v394;
        v160 = v402;
        v161 = v390;
        v398(v394, v402, v390);
        v399(v257, 0, 1, v161);
        sub_100013848(v250, v252, v253, v255, v257);
        swift_bridgeObjectRelease(v252);
        swift_release(v346);
        swift_errorRelease(v342);
        sub_10000A934(v257, &qword_100051698);
        v386(v255, v256);
        v258 = v253;
        v259 = v254;
      }
      else
      {
        v233 = (uint64_t *)v229;
        v234 = v230;
        Data.write(to:options:)(v219, 0, v229, v230);
        v322 = v233;
        v342 = v234;
        v395 = 0;
        v260 = v324;
        sub_100036674((uint64_t)v217, (uint64_t)v324);
        v261 = v321;
        v262 = v348;
        v263 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v347 + 16))(v321, v219, v348);
        v264 = Logger.logObject.getter(v263);
        v265 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v264, v265))
        {
          v267 = (uint64_t)v260;
          v268 = swift_slowAlloc(22, -1);
          v269 = swift_slowAlloc(64, -1);
          v410 = v269;
          v270 = v325;
          *(_DWORD *)v268 = v325.n128_u32[0];
          v271 = v265;
          v272 = TaskDefinition.name.getter(v270);
          v274 = v273;
          v408 = sub_100008204(v272, v273, &v410);
          v275 = v350;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v408, v350, v268 + 4, v268 + 12);
          swift_bridgeObjectRelease(v274);
          sub_10000B5E8(v267, type metadata accessor for MLHostPushMessage);
          *(_WORD *)(v268 + 12) = 2080;
          v276 = sub_10000228C(&qword_100051630, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
          v277 = dispatch thunk of CustomStringConvertible.description.getter(v348, v276);
          v279 = v278;
          v408 = sub_100008204(v277, v278, &v410);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v408, v275, v268 + 14, v268 + 22);
          swift_bridgeObjectRelease(v279);
          v220(v261, v348);
          _os_log_impl((void *)&_mh_execute_header, v264, v271, "Task %s parameters are stored at: %s", (uint8_t *)v268, 0x16u);
          swift_arrayDestroy(v269, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v269, -1, -1);
          swift_slowDealloc(v268, -1, -1);
        }
        else
        {
          sub_10000B5E8((uint64_t)v260, type metadata accessor for MLHostPushMessage);
          v220(v261, v262);
        }

        v300 = TaskDefinition.name.getter(v299);
        v302 = v301;
        v303 = (uint64_t)v391;
        v304 = v403;
        v396(v391, v320, v403);
        v305 = (uint64_t)v392;
        v306 = v393;
        v397(v392, v401, v393);
        v307 = (uint64_t)v394;
        v160 = v402;
        v161 = v390;
        v398(v394, v402, v390);
        v399(v307, 0, 1, v161);
        sub_100013848(v300, v302, v303, v305, v307);
        swift_bridgeObjectRelease(v302);
        sub_10000AA84((uint64_t)v322, (unint64_t)v342);
        swift_release(v346);
        sub_10000A934(v307, &qword_100051698);
        v386(v305, v306);
        v258 = v303;
        v259 = v304;
      }
      v387(v258, v259);
      sub_10000B5E8((uint64_t)v345, type metadata accessor for MLHostPushParameters);
      v343(v344, v348);
      (*(void (**)(_BYTE *, uint64_t))(v373 + 8))(v349, v374);
LABEL_25:
      (*(void (**)(_BYTE *, uint64_t))(v384 + 8))(v160, v161);
      (*(void (**)(_BYTE *, uint64_t))(v382 + 8))(v381, v383);
      v73 = v407;
      sub_10000B5E8((uint64_t)v407, type metadata accessor for MLHostPushMessage);
LABEL_26:
      v70 = v372;
      v71 = v371;
      v72 = v389;
      v55 = v375;
LABEL_10:
      v58 = v378;
      v68 = v404 + v376;
      v67 = v405 - 1;
      if (v405 == 1)
      {
        swift_bridgeObjectRelease(v326);
        return;
      }
    }
    swift_errorRelease(v136);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v138 + 56))(v135, 1, 1, v137);
    v395 = 0;
    v139 = (uint64_t)v358;
LABEL_20:
    v141 = v407;
    sub_10000A934((uint64_t)v135, &qword_100051638);
LABEL_21:
    v142 = sub_100036674((uint64_t)v141, v139);
    v143 = Logger.logObject.getter(v142);
    v144 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v143, v144))
    {
      v145 = (uint8_t *)swift_slowAlloc(12, -1);
      v146 = swift_slowAlloc(32, -1);
      v410 = v146;
      v147 = v352;
      *(_DWORD *)v145 = v352.n128_u32[0];
      v148 = TaskDefinition.name.getter(v147);
      v150 = v149;
      v408 = sub_100008204(v148, v149, &v410);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v408, v350, v145 + 4, v145 + 12);
      swift_bridgeObjectRelease(v150);
      sub_10000B5E8(v139, type metadata accessor for MLHostPushMessage);
      _os_log_impl((void *)&_mh_execute_header, v143, v144, "Failed to register pushed task %s. Skipping pushed task.", v145, 0xCu);
      swift_arrayDestroy(v146, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v146, -1, -1);
      swift_slowDealloc(v145, -1, -1);
    }
    else
    {
      sub_10000B5E8(v139, type metadata accessor for MLHostPushMessage);
    }

    v152 = TaskDefinition.name.getter(v151);
    v154 = v153;
    v155 = (uint64_t)v391;
    v156 = v403;
    v396(v391, v351, v403);
    v157 = (uint64_t)v392;
    v158 = v393;
    v397(v392, v401, v393);
    v159 = (uint64_t)v394;
    v160 = v402;
    v161 = v390;
    v398(v394, v402, v390);
    v399(v159, 0, 1, v161);
    sub_100013848(v152, v154, v155, v157, v159);
    swift_bridgeObjectRelease(v154);
    sub_10000A934(v159, &qword_100051698);
    v386(v157, v158);
    v387(v155, v156);
    goto LABEL_25;
  }
}

id sub_100029174(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _QWORD *v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t aBlock[6];

  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000A8E8(v4, (uint64_t)qword_100052B80);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter(v6);
  v8 = (_QWORD *)&loc_100038000;
  if (os_log_type_enabled(v6, v7))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    aBlock[0] = v10;
    *(_DWORD *)v9 = 136315138;
    v18 = sub_100008204(0xD00000000000001DLL, 0x8000000100042420, aBlock);
    v8 = &loc_100038000;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, aBlock, v9 + 4, v9 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Daemon performing %s activity.", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }

  aBlock[4] = (uint64_t)nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10001F914;
  aBlock[3] = (uint64_t)&unk_10004DEA0;
  v11 = _Block_copy(aBlock);
  objc_msgSend(a1, "setExpirationHandler:", v11);
  _Block_release(v11);
  if (*(_BYTE *)(a2 + 16) == 1)
    v12 = sub_10000F7F8();
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.info.getter(v13);
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = swift_slowAlloc(32, -1);
    aBlock[0] = v16;
    *(_DWORD *)v15 = v8[406];
    v18 = sub_100008204(0xD00000000000001DLL, 0x8000000100042420, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, aBlock, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Daemon completed %s activity.", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);
  }

  return objc_msgSend(a1, "setTaskCompleted");
}

void sub_100029484(void *a1, uint64_t a2)
{
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t *v24;
  uint8_t *v25;
  uint64_t v26;
  os_unfair_lock_s *v27;
  void **v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  os_unfair_lock_s *v46;
  void **v47;
  char *v48;
  os_unfair_lock_s *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  void **v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  uint64_t inited;
  os_unfair_lock_s *v78;
  double v79;
  id v80;
  id v81;
  double v82;
  id v83;
  id v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSString v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  char *v108;
  uint64_t v109;
  char *v110;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _BYTE v116[224];
  char v117[24];
  void **aBlock;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t (*v122)();
  uint64_t v123;

  v98 = type metadata accessor for CoreAnalyticsEvents(0);
  v4 = *(_QWORD *)(v98 - 8);
  __chkstk_darwin(v98);
  v6 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Calendar(0);
  v104 = *(_QWORD *)(v7 - 8);
  v105 = v7;
  __chkstk_darwin(v7);
  v103 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v108 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v101 = (char *)&v95 - v14;
  __chkstk_darwin(v13);
  v110 = (char *)&v95 - v15;
  v122 = nullsub_1;
  v123 = 0;
  aBlock = _NSConcreteStackBlock;
  v119 = 1107296256;
  v120 = sub_10001F914;
  v121 = &unk_10004DE28;
  v16 = _Block_copy(&aBlock);
  v17 = a1;
  objc_msgSend(a1, "setExpirationHandler:", v16);
  _Block_release(v16);
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v18 = type metadata accessor for Logger(0);
  v19 = sub_10000A8E8(v18, (uint64_t)qword_100052B80);
  v20 = swift_retain(a2);
  v112 = v19;
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.info.getter(v21);
  v23 = os_log_type_enabled(v21, v22);
  v24 = &qword_100051000;
  v99 = v17;
  v106 = v9;
  v96 = v6;
  v97 = v4;
  v102 = v10;
  if (v23)
  {
    v25 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v25 = 134217984;
    v26 = *(_QWORD *)(a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    v27 = (os_unfair_lock_s *)(*(_QWORD *)(v26 + 56) + 16);
    os_unfair_lock_lock(v27);
    swift_beginAccess(v26 + 64, &v113, 0, 0);
    v28 = *(void ***)(*(_QWORD *)(v26 + 64) + 16);
    os_unfair_lock_unlock(v27);
    aBlock = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v119, v25 + 4, v25 + 12);
    swift_release(a2);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "MLHostDaemon: TaskRegistry has %ld tasks before pruning.", v25, 0xCu);
    swift_slowDealloc(v25, -1, -1);

    v24 = &qword_100051000;
  }
  else
  {

    swift_release(a2);
  }
  v29 = v24[227];
  v100 = a2;
  v109 = *(_QWORD *)(a2 + v29);
  v107 = sub_100010890();
  v31 = v107[2];
  if (v31)
  {
    v32 = v107 + 5;
    *(_QWORD *)&v30 = 136315138;
    v111 = v30;
    do
    {
      v34 = *(v32 - 1);
      v33 = *v32;
      v35 = swift_bridgeObjectRetain_n(*v32, 3);
      v36 = Logger.logObject.getter(v35);
      v37 = static os_log_type_t.info.getter(v36);
      if (os_log_type_enabled(v36, v37))
      {
        v38 = swift_slowAlloc(12, -1);
        v39 = (void **)swift_slowAlloc(32, -1);
        aBlock = v39;
        *(_DWORD *)v38 = v111;
        swift_bridgeObjectRetain(v33);
        *(_QWORD *)(v38 + 4) = sub_100008204(v34, v33, (uint64_t *)&aBlock);
        swift_bridgeObjectRelease_n(v33, 3);
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "Unregistering task %s because it was pruned.", (uint8_t *)v38, 0xCu);
        swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v39, -1, -1);
        swift_slowDealloc(v38, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v33, 2);
      }
      v32 += 2;
      sub_100036140(v34, v33);
      swift_bridgeObjectRelease(v33);
      --v31;
    }
    while (v31);
  }
  swift_bridgeObjectRelease(v107);
  v40 = v100;
  v41 = swift_retain(v100);
  v42 = Logger.logObject.getter(v41);
  v43 = static os_log_type_t.info.getter(v42);
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v44 = 134217984;
    v45 = v109;
    v46 = (os_unfair_lock_s *)(*(_QWORD *)(v109 + 56) + 16);
    os_unfair_lock_lock(v46);
    swift_beginAccess(v45 + 64, &v114, 0, 0);
    v47 = *(void ***)(*(_QWORD *)(v45 + 64) + 16);
    os_unfair_lock_unlock(v46);
    aBlock = v47;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v119, v44 + 4, v44 + 12);
    swift_release(v40);
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "MLHostDaemon: TaskRegistry has %ld tasks after pruning.", v44, 0xCu);
    swift_slowDealloc(v44, -1, -1);

    v48 = v103;
  }
  else
  {

    swift_release(v40);
    v48 = v103;
    v45 = v109;
  }
  v49 = (os_unfair_lock_s *)(*(_QWORD *)(v45 + 56) + 16);
  os_unfair_lock_lock(v49);
  swift_beginAccess(v45 + 64, v117, 0, 0);
  v50 = *(_QWORD *)(v45 + 64);
  swift_bridgeObjectRetain(v50);
  v52 = sub_10002BF3C(v51);
  swift_bridgeObjectRelease(v50);
  os_unfair_lock_unlock(v49);
  v53 = sub_10002C418((uint64_t)v52);
  swift_release(v52);
  swift_bridgeObjectRetain(v53);
  v54 = sub_10001C2C0(v45, v53);
  swift_bridgeObjectRelease_n(v53, 2);
  swift_bridgeObjectRetain(v54);
  v56 = Logger.logObject.getter(v55);
  v57 = static os_log_type_t.info.getter(v56);
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc(12, -1);
    v59 = (void **)swift_slowAlloc(32, -1);
    aBlock = v59;
    *(_DWORD *)v58 = 136315138;
    *(_QWORD *)&v111 = v58 + 4;
    swift_bridgeObjectRetain(v54);
    v61 = Array.description.getter(v60, &type metadata for String);
    v63 = v62;
    swift_bridgeObjectRelease(v54);
    v115 = sub_100008204(v61, v63, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, v116, v111, v58 + 12);
    swift_bridgeObjectRelease_n(v54, 2);
    swift_bridgeObjectRelease(v63);
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "MLHostDaemon: pruned orphaned taskFolders: %s", v58, 0xCu);
    swift_arrayDestroy(v59, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v59, -1, -1);
    swift_slowDealloc(v58, -1, -1);

  }
  else
  {

    v64 = swift_bridgeObjectRelease_n(v54, 2);
  }
  v65 = v105;
  v66 = v106;
  v67 = v104;
  v68 = Logger.logObject.getter(v64);
  v69 = static os_log_type_t.info.getter(v68);
  if (os_log_type_enabled(v68, v69))
  {
    v70 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v70 = 0;
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "MLHostDaemon: sending device telemetry", v70, 2u);
    swift_slowDealloc(v70, -1, -1);
  }

  v71 = static Calendar.current.getter();
  v72 = v101;
  static Date.now.getter(v71);
  v73 = v110;
  Calendar.startOfDay(for:)(v72);
  v74 = v102;
  v75 = *(void (**)(char *, uint64_t))(v102 + 8);
  v75(v72, v66);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v48, v65);
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v72, v73, v66);
  Date.init(timeInterval:since:)(v72, -86400.0);
  v76 = sub_100007800(&qword_100051818);
  inited = swift_initStackObject(v76, v116);
  *(_OWORD *)(inited + 16) = xmmword_100038DD0;
  *(_QWORD *)(inited + 32) = 0x49747865746E6F63;
  *(_QWORD *)(inited + 40) = 0xE900000000000064;
  sub_10000AB78(0, &qword_100051820, NSString_ptr);
  *(_QWORD *)(inited + 48) = NSString.init(stringLiteral:)("DAEMON", 6, 2);
  *(_QWORD *)(inited + 56) = 0x756F43736B736174;
  *(_QWORD *)(inited + 64) = 0xEA0000000000746ELL;
  v78 = (os_unfair_lock_s *)(*(_QWORD *)(v109 + 56) + 16);
  os_unfair_lock_lock(v78);
  os_unfair_lock_unlock(v78);
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 80) = 0x6E7552736B736174;
  *(_QWORD *)(inited + 88) = 0xE800000000000000;
  sub_10000AB78(0, &qword_100051678, NSNumber_ptr);
  *(NSNumber *)(inited + 96) = NSNumber.init(integerLiteral:)(-1);
  strcpy((char *)(inited + 104), "tasksDeferred");
  *(_WORD *)(inited + 118) = -4864;
  *(NSNumber *)(inited + 120) = NSNumber.init(integerLiteral:)(-1);
  *(_QWORD *)(inited + 128) = 0x696146736B736174;
  *(_QWORD *)(inited + 136) = 0xEB0000000064656CLL;
  *(NSNumber *)(inited + 144) = NSNumber.init(integerLiteral:)(-1);
  strcpy((char *)(inited + 152), "tasksCompleted");
  *(_BYTE *)(inited + 167) = -18;
  *(NSNumber *)(inited + 168) = NSNumber.init(integerLiteral:)(-1);
  *(_QWORD *)(inited + 176) = 0x745374656B637562;
  *(_QWORD *)(inited + 184) = 0xEB00000000747261;
  v79 = Date.timeIntervalSince1970.getter();
  if ((~*(_QWORD *)&v79 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v79 <= -9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v79 >= 9.22337204e18)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v80 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithLongLong:", (uint64_t)v79);
  v81 = objc_msgSend(v80, "stringValue");

  if (!v81)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  *(_QWORD *)(inited + 192) = v81;
  *(_QWORD *)(inited + 200) = 0x6E4574656B637562;
  *(_QWORD *)(inited + 208) = 0xE900000000000064;
  v82 = Date.timeIntervalSince1970.getter();
  if ((~*(_QWORD *)&v82 & 0x7FF0000000000000) == 0)
    goto LABEL_32;
  if (v82 <= -9.22337204e18)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v82 >= 9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v83 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithLongLong:", (uint64_t)v82);
  v84 = objc_msgSend(v83, "stringValue");

  if (v84)
  {
    *(_QWORD *)(inited + 216) = v84;
    v85 = sub_10001DF28(inited);
    v87 = v96;
    v86 = v97;
    v88 = v98;
    v89 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v97 + 104))(v96, enum case for CoreAnalyticsEvents.deviceStatusTelemetry(_:), v98);
    CoreAnalyticsEvents.rawValue.getter(v89);
    v91 = v90;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v87, v88);
    v92 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v91);
    v93 = swift_allocObject(&unk_10004DE60, 24, 7);
    *(_QWORD *)(v93 + 16) = v85;
    v122 = sub_10003666C;
    v123 = v93;
    aBlock = _NSConcreteStackBlock;
    v119 = 1107296256;
    v120 = sub_10002A080;
    v121 = &unk_10004DE78;
    v94 = _Block_copy(&aBlock);
    swift_release(v123);
    AnalyticsSendEventLazy(v92, v94);
    _Block_release(v94);

    objc_msgSend(v99, "setTaskCompleted");
    v75(v108, v66);
    v75(v110, v66);
    return;
  }
LABEL_36:
  __break(1u);
}

Class sub_10002A080(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary v5;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_10000AB78(0, &qword_100051828, NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

uint64_t sub_10002A104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

  v1 = v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
  v2 = type metadata accessor for MLHostConfig(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10002A19C()
{
  return type metadata accessor for MLHostDaemon(0);
}

uint64_t type metadata accessor for MLHostDaemon(uint64_t a1)
{
  uint64_t result;

  result = qword_100051758;
  if (!qword_100051758)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MLHostDaemon);
  return result;
}

uint64_t sub_10002A1E0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[8];

  v4[0] = &unk_100038E18;
  v4[1] = &unk_100038E30;
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for MLHostConfig(319);
  if (v3 <= 0x3F)
  {
    v4[4] = *(_QWORD *)(result - 8) + 64;
    v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[6] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[7] = (char *)&value witness table for Builtin.NativeObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 8, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t *sub_10002A280(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10002A2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002A2D0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002A2D8(uint64_t a1)
{
  uint64_t v1;

  return sub_1000232D4(a1, v1);
}

void sub_10002A2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  sub_100026F18(a1, a2, a3, a4, a5, a6, a7, a8, a9, v9);
}

uint64_t sub_10002A304()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A328(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v5 + 16))(*a1, a1[1], *a2, a2[1], *a3, a3[1], *a4, a4[1], *a5);
}

uint64_t sub_10002A37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = type metadata accessor for ContinuousClock.Instant(0);
  *(_QWORD *)(v6 + 64) = v12;
  v13 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 72) = v13;
  v14 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v6 + 80) = swift_task_alloc(v14);
  *(_QWORD *)(v6 + 88) = swift_task_alloc(v14);
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch(sub_10002A420, 0, 0);
}

uint64_t sub_10002A420()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _QWORD *v8;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  v4 = type metadata accessor for ContinuousClock(0);
  v5 = sub_10000228C(&qword_100051888, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
  dispatch thunk of Clock.now.getter(v4, v5);
  v6 = sub_10000228C(&qword_100051890, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)(v0 + 5, v2, v6);
  v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v7;
  v7(v1, v2);
  v8 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
  v0[13] = v8;
  *v8 = v0;
  v8[1] = sub_10002A538;
  return dispatch thunk of Clock.sleep(until:tolerance:)(v0[11], v0 + 2, v4, v5);
}

uint64_t sub_10002A538()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v2 = *(_QWORD *)(*v1 + 104);
  v4 = *(_QWORD *)(*v1 + 88);
  v5 = *(_QWORD *)(*v1 + 64);
  v6 = *v1;
  *(_QWORD *)(v6 + 112) = v0;
  swift_task_dealloc(v2);
  v3(v4, v5);
  if (v0)
    return swift_task_switch(sub_10002A5E4, 0, 0);
  v8 = *(_QWORD *)(v6 + 80);
  swift_task_dealloc(*(_QWORD *)(v6 + 88));
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_10002A5E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002A620(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10002A684;
  return v6(a1);
}

uint64_t sub_10002A684()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10002A6D0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_10002B860(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_10002A87C(uint64_t a1, uint64_t a2)
{
  return sub_10002AF14(a1, a2, &qword_1000516E0);
}

Swift::Int sub_10002A888(uint64_t a1, uint64_t a2)
{
  return sub_10002A89C(a1, a2, (uint64_t (*)(_QWORD))&type metadata accessor for TaskDefinition, &qword_1000516D8);
}

Swift::Int sub_10002A89C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  Swift::Int result;
  int64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  int v47;
  char *v48;
  uint64_t v49;
  _QWORD v50[9];

  v6 = v4;
  v49 = a3(0);
  v9 = *(_QWORD *)(v49 - 8);
  __chkstk_darwin(v49);
  v48 = (char *)&v43 - v10;
  v11 = *v6;
  if (*(_QWORD *)(*v6 + 24) > a1)
    a1 = *(_QWORD *)(*v6 + 24);
  sub_100007800(a4);
  v47 = a2;
  v12 = static _DictionaryStorage.resize(original:capacity:move:)(v11, a1, a2);
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v44 = v6;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v46 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v45 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain(v11);
  v20 = 0;
  while (1)
  {
    if (v17)
    {
      v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v24 = v23 | (v20 << 6);
      goto LABEL_24;
    }
    v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45)
      goto LABEL_36;
    v26 = v46[v25];
    ++v20;
    if (!v26)
    {
      v20 = v25 + 1;
      if (v25 + 1 >= v45)
        goto LABEL_36;
      v26 = v46[v20];
      if (!v26)
        break;
    }
LABEL_23:
    v17 = (v26 - 1) & v26;
    v24 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_24:
    v28 = *(_QWORD *)(v11 + 56);
    v29 = v11;
    v30 = (uint64_t *)(*(_QWORD *)(v11 + 48) + 16 * v24);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v9 + 72);
    v34 = v28 + v33 * v24;
    if ((v47 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v48, v34, v49);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v48, v34, v49);
      swift_bridgeObjectRetain(v31);
    }
    Hasher.init(_seed:)(v50, *(_QWORD *)(v13 + 40));
    String.hash(into:)(v50, v32, v31);
    result = Hasher._finalize()();
    v35 = -1 << *(_BYTE *)(v13 + 32);
    v36 = result & ~v35;
    v37 = v36 >> 6;
    if (((-1 << v36) & ~*(_QWORD *)(v18 + 8 * (v36 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v36) & ~*(_QWORD *)(v18 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v38 = 0;
      v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v40 = v37 == v39;
        if (v37 == v39)
          v37 = 0;
        v38 |= v40;
        v41 = *(_QWORD *)(v18 + 8 * v37);
      }
      while (v41 == -1);
      v21 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v22 = (_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v21);
    *v22 = v32;
    v22[1] = v31;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(*(_QWORD *)(v13 + 56) + v33 * v21, v48, v49);
    ++*(_QWORD *)(v13 + 16);
    v11 = v29;
  }
  v27 = v25 + 2;
  if (v27 < v45)
  {
    v26 = v46[v27];
    if (!v26)
    {
      while (1)
      {
        v20 = v27 + 1;
        if (__OFADD__(v27, 1))
          goto LABEL_43;
        if (v20 >= v45)
          goto LABEL_36;
        v26 = v46[v20];
        ++v27;
        if (v26)
          goto LABEL_23;
      }
    }
    v20 = v27;
    goto LABEL_23;
  }
LABEL_36:
  swift_release(v11);
  v6 = v44;
  if ((v47 & 1) != 0)
  {
    v42 = 1 << *(_BYTE *)(v11 + 32);
    if (v42 >= 64)
      bzero(v46, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v46 = -1 << v42;
    *(_QWORD *)(v11 + 16) = 0;
  }
LABEL_41:
  result = swift_release(v11);
  *v6 = v13;
  return result;
}

Swift::Int sub_10002AC00(uint64_t a1, uint64_t a2)
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
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  _QWORD *v38;
  __int128 v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100007800(&qword_100051668);
  v7 = a2;
  v8 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v9 = v8;
  if (*(_QWORD *)(v5 + 16))
  {
    v36 = v3;
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v38 = (_QWORD *)(v5 + 64);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v10 + 63) >> 6;
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
        if (v24 >= v37)
          goto LABEL_36;
        v25 = v38[v24];
        ++v15;
        if (!v25)
        {
          v15 = v24 + 1;
          if (v24 + 1 >= v37)
            goto LABEL_36;
          v25 = v38[v15];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v37)
            {
LABEL_36:
              swift_release(v5);
              v3 = v36;
              if ((v7 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v5 + 32);
                if (v35 >= 64)
                  bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v35;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v25 = v38[v26];
            if (!v25)
            {
              while (1)
              {
                v15 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_43;
                if (v15 >= v37)
                  goto LABEL_36;
                v25 = v38[v15];
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
      v39 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v31);
      if ((v7 & 1) == 0)
      {
        swift_bridgeObjectRetain(v33);
        swift_retain(*((_QWORD *)&v39 + 1));
      }
      Hasher.init(_seed:)(v40, *(_QWORD *)(v9 + 40));
      String.hash(into:)(v40, v34, v33);
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
      *(_OWORD *)(*(_QWORD *)(v9 + 56) + v20) = v39;
      ++*(_QWORD *)(v9 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v9;
  return result;
}

Swift::Int sub_10002AF08(uint64_t a1, uint64_t a2)
{
  return sub_10002AF14(a1, a2, &qword_1000516C0);
}

Swift::Int sub_10002AF14(uint64_t a1, uint64_t a2, uint64_t *a3)
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
  sub_100007800(a3);
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
      swift_bridgeObjectRetain(v34);
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

void sub_10002B224(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1000088BC(a2, a3);
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
        v20 = type metadata accessor for MLHostTask(0);
        (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
        return;
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100019B64();
      goto LABEL_7;
    }
    sub_10002A89C(v15, a4 & 1, (uint64_t (*)(_QWORD))&type metadata accessor for MLHostTask, &qword_100051640);
    v21 = sub_1000088BC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10002B4F4(v12, a2, a3, a1, v18);
      swift_bridgeObjectRetain(a3);
      return;
    }
  }
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

void sub_10002B370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1000088BC(a3, a4);
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
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_100019DD4();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      swift_release(v21[1]);
      *v21 = a1;
      v21[1] = a2;
      return;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v24 = (uint64_t *)(v20[6] + 16 * v14);
    *v24 = a3;
    v24[1] = a4;
    v25 = (_QWORD *)(v20[7] + 16 * v14);
    *v25 = a1;
    v25[1] = a2;
    v26 = v20[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (!v27)
    {
      v20[2] = v28;
      swift_bridgeObjectRetain(a4);
      return;
    }
    goto LABEL_14;
  }
  sub_10002AC00(v17, a5 & 1);
  v22 = sub_1000088BC(a3, a4);
  if ((v18 & 1) == (v23 & 1))
  {
    v14 = v22;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

id sub_10002B4E4(void *a1)
{
  uint64_t v1;

  return sub_100029174(a1, v1);
}

void sub_10002B4EC(void *a1)
{
  uint64_t v1;

  sub_100029484(a1, v1);
}

uint64_t sub_10002B4F4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = type metadata accessor for MLHostTask(0);
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

Swift::Int sub_10002B584(uint64_t a1)
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
  sub_100007800(&qword_1000512B8);
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

uint64_t sub_10002B860(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_10002B584(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_10002B9F8();
      goto LABEL_22;
    }
    sub_10002BBA8(v11);
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

void *sub_10002B9F8()
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
  sub_100007800(&qword_1000512B8);
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

Swift::Int sub_10002BBA8(uint64_t a1)
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
  sub_100007800(&qword_1000512B8);
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

_QWORD *sub_10002BE54(uint64_t a1)
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
    return _swiftEmptyArrayStorage;
  v3 = sub_100007800(&qword_1000512C0);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_10002C020((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10000AB70(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v4;
}

_QWORD *sub_10002BF3C(uint64_t a1)
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
    return _swiftEmptyArrayStorage;
  v3 = sub_100007800(&qword_1000512C0);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_10002C21C((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10000AB70(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t sub_10002C020(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_10002C21C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_10002C418(uint64_t a1)
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
      sub_10002A6D0(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10002C4AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t (*v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  id v57;
  uint64_t v58;
  uint64_t v59;
  NSString v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  void *v68;
  id v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  char *v74;
  void (*v75)(char *, uint64_t, uint64_t);
  id v76;
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  _QWORD *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  char *v91;
  id v92;
  NSObject *v93;
  os_log_type_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  id v103;
  os_log_t v104;
  uint64_t v105;
  void *v106;
  id v107;
  unsigned int v108;
  id v109;
  id v110;
  id v112;
  unsigned int v113;
  id v114;
  id v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  char *v122;
  id v123;
  NSObject *v124;
  os_log_type_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  id v136;
  char *v137;
  uint64_t v138;
  os_log_type_t v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  void *v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  id v151;
  id v152;
  os_log_t v153;
  void *v154;
  char *v155;
  char *v156;
  char *v157;
  void (*v158)(char *, uint64_t, uint64_t);
  id v159;
  id v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  id v172;

  v2 = type metadata accessor for MLHostTask(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v153 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v153 - v8;
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v153 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v153 - v14;
  v16 = __chkstk_darwin(v13);
  v165 = (char *)&v153 - v17;
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v153 - v19;
  __chkstk_darwin(v18);
  v22 = (char *)&v153 - v21;
  v23 = (void *)sub_100021C1C();
  if (!v23)
  {
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v27 = type metadata accessor for Logger(0);
    sub_10000A8E8(v27, (uint64_t)qword_100052B80);
    v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, a1, v2);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(12, -1);
      v32 = (void *)swift_slowAlloc(32, -1);
      v172 = v32;
      *(_DWORD *)v31 = 136315138;
      v33 = sub_10000228C(&qword_100051848, (uint64_t (*)(uint64_t))&type metadata accessor for MLHostTask, (uint64_t)&protocol conformance descriptor for MLHostTask);
      v34 = dispatch thunk of CustomStringConvertible.description.getter(v2, v33);
      v36 = v35;
      v170 = sub_100008204(v34, v35, (uint64_t *)&v172);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v31 + 4, v31 + 12);
      swift_bridgeObjectRelease(v36);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Failed at generating BGSystemTaskRequest from taskDefinition: %s", v31, 0xCu);
      swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v31, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
    }
    goto LABEL_42;
  }
  v24 = v23;
  v157 = v15;
  v25 = v23;
  v26 = objc_msgSend(v25, "groupName");
  v166 = v2;
  v162 = a1;
  v164 = v3;
  v159 = v25;
  v155 = v9;
  v156 = v6;
  if (v26)
  {

  }
  else
  {
    MLHostTask.bundleIdentifier.getter(0);
    v38 = v37;
    v39 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v38);
    objc_msgSend(v25, "setGroupName:", v39);

    objc_msgSend(v25, "setGroupConcurrencyLimit:", 1);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v40 = type metadata accessor for Logger(0);
    sub_10000A8E8(v40, (uint64_t)qword_100052B80);
    v41 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v41(v22, a1, v2);
    v42 = ((uint64_t (*)(char *, uint64_t, uint64_t))v41)(v20, a1, v2);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = swift_slowAlloc(22, -1);
      v46 = (void *)swift_slowAlloc(64, -1);
      v163 = (uint64_t)v46;
      v172 = v46;
      *(_DWORD *)v45 = 136315394;
      v47 = MLHostTask.name.getter(v46);
      v49 = v48;
      v170 = sub_100008204(v47, v48, (uint64_t *)&v172);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v45 + 4, v45 + 12);
      swift_bridgeObjectRelease(v49);
      v50 = *(uint64_t (**)(char *, uint64_t))(v164 + 8);
      v51 = v50(v22, v166);
      *(_WORD *)(v45 + 12) = 2080;
      v52 = MLHostTask.bundleIdentifier.getter(v51);
      v54 = v53;
      v170 = sub_100008204(v52, v53, (uint64_t *)&v172);
      v25 = v159;
      v2 = v166;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v45 + 14, v45 + 22);
      swift_bridgeObjectRelease(v54);
      v50(v20, v2);
      a1 = v162;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Modified request for task %s: assigned group name: %s", (uint8_t *)v45, 0x16u);
      v55 = v163;
      swift_arrayDestroy(v163, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v55, -1, -1);
      swift_slowDealloc(v45, -1, -1);
    }
    else
    {
      v56 = *(void (**)(char *, uint64_t))(v3 + 8);
      v56(v22, v2);
      v56(v20, v2);
    }

  }
  v161 = (id)objc_opt_self(BGSystemTaskScheduler);
  v57 = objc_msgSend(v161, "sharedScheduler");
  MLHostTask.name.getter(v57);
  v59 = v58;
  v60 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v59);
  v61 = objc_msgSend(v57, "taskRequestForIdentifier:", v60);

  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v62 = type metadata accessor for Logger(0);
  v63 = sub_10000A8E8(v62, (uint64_t)qword_100052B80);
  v64 = v61;
  v163 = v63;
  v65 = Logger.logObject.getter(v64);
  v66 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (uint8_t *)swift_slowAlloc(12, -1);
    v68 = (void *)swift_slowAlloc(32, -1);
    v172 = v68;
    *(_DWORD *)v67 = 136315138;
    if (v64)
    {
      v69 = objc_msgSend(v64, "description");
      v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v69);
      v72 = v71;

    }
    else
    {
      v72 = 0xE300000000000000;
      v70 = 4271950;
    }
    v170 = sub_100008204(v70, v72, (uint64_t *)&v172);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v67 + 4, v67 + 12);

    swift_bridgeObjectRelease(v72);
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Existing BGST.taskRequest: %s", v67, 0xCu);
    swift_arrayDestroy(v68, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v68, -1, -1);
    swift_slowDealloc(v67, -1, -1);

    v2 = v166;
    a1 = v162;
  }
  else
  {

  }
  v73 = v164;
  v74 = v165;
  v75 = *(void (**)(char *, uint64_t, uint64_t))(v164 + 16);
  v158 = v75;
  if (v64)
  {
    v75(v165, a1, v2);
    v76 = v25;
    v77 = Logger.logObject.getter(v76);
    v78 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v77, v78))
    {
      v79 = swift_slowAlloc(22, -1);
      v154 = v24;
      v80 = v74;
      v81 = v79;
      v82 = (_QWORD *)swift_slowAlloc(8, -1);
      v83 = (void *)swift_slowAlloc(32, -1);
      v160 = v64;
      v84 = v83;
      v172 = v83;
      *(_DWORD *)v81 = 136315394;
      v85 = MLHostTask.name.getter(v83);
      v87 = v86;
      v170 = sub_100008204(v85, v86, (uint64_t *)&v172);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v81 + 4, v81 + 12);
      swift_bridgeObjectRelease(v87);
      v165 = *(char **)(v164 + 8);
      ((void (*)(char *, uint64_t))v165)(v80, v166);
      *(_WORD *)(v81 + 12) = 2112;
      v170 = (uint64_t)v76;
      v88 = v76;
      v2 = v166;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v81 + 14, v81 + 22);
      *v82 = v154;

      _os_log_impl((void *)&_mh_execute_header, v77, v78, "Task %s has existing request, updating request: %@.", (uint8_t *)v81, 0x16u);
      v89 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v82, 1, v89);
      swift_slowDealloc(v82, -1, -1);
      swift_arrayDestroy(v84, 1, (char *)&type metadata for Any + 8);
      v90 = v84;
      v64 = v160;
      swift_slowDealloc(v90, -1, -1);
      swift_slowDealloc(v81, -1, -1);

    }
    else
    {
      v165 = *(char **)(v73 + 8);
      ((void (*)(char *, uint64_t))v165)(v74, v2);

    }
    v107 = objc_msgSend(v161, "sharedScheduler");
    v172 = 0;
    v108 = objc_msgSend(v107, "updateTaskRequest:error:", v76, &v172);

    v109 = v172;
    if (v108)
    {
      v110 = v172;

      return 1;
    }
  }
  else
  {
    v154 = v24;
    v91 = v157;
    v75(v157, a1, v2);
    v92 = v25;
    v93 = Logger.logObject.getter(v92);
    v94 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = v73;
      v96 = swift_slowAlloc(22, -1);
      v97 = (_QWORD *)swift_slowAlloc(8, -1);
      v98 = (void *)swift_slowAlloc(32, -1);
      v160 = 0;
      v99 = v98;
      v172 = v98;
      *(_DWORD *)v96 = 136315394;
      v153 = v93;
      v100 = MLHostTask.name.getter(v98);
      v102 = v101;
      v170 = sub_100008204(v100, v101, (uint64_t *)&v172);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v96 + 4, v96 + 12);
      swift_bridgeObjectRelease(v102);
      v165 = *(char **)(v95 + 8);
      ((void (*)(char *, uint64_t))v165)(v91, v166);
      *(_WORD *)(v96 + 12) = 2112;
      v170 = (uint64_t)v92;
      v103 = v92;
      v2 = v166;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v96 + 14, v96 + 22);
      *v97 = v154;

      v104 = v153;
      _os_log_impl((void *)&_mh_execute_header, v153, v94, "Task %s has no request, submitting request: %@", (uint8_t *)v96, 0x16u);
      v105 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v97, 1, v105);
      swift_slowDealloc(v97, -1, -1);
      swift_arrayDestroy(v99, 1, (char *)&type metadata for Any + 8);
      v106 = v99;
      v64 = v160;
      swift_slowDealloc(v106, -1, -1);
      swift_slowDealloc(v96, -1, -1);

    }
    else
    {
      v165 = *(char **)(v73 + 8);
      ((void (*)(char *, uint64_t))v165)(v91, v2);

    }
    v112 = objc_msgSend(v161, "sharedScheduler");
    v172 = 0;
    v113 = objc_msgSend(v112, "submitTaskRequest:error:", v92, &v172);

    v109 = v172;
    if (v113)
    {
      v114 = v172;

      return 1;
    }
  }
  v115 = v109;
  v116 = (void *)_convertNSErrorToError(_:)(v109);

  swift_willThrow(v117);
  v172 = v116;
  swift_errorRetain(v116);
  v118 = sub_100007800(&qword_100051620);
  type metadata accessor for BGSystemTaskSchedulerError(0);
  v120 = v119;
  if (swift_dynamicCast(&v170, &v172, v118, v119, 0))
  {
    v160 = v64;
    swift_errorRelease(v116);
    v121 = (void *)v170;
    v122 = v155;
    v158(v155, v162, v2);
    v123 = v121;
    v124 = Logger.logObject.getter(v123);
    v125 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v124, v125))
    {
      v126 = swift_slowAlloc(22, -1);
      v127 = swift_slowAlloc(64, -1);
      v171 = v127;
      *(_DWORD *)v126 = 136315394;
      v128 = MLHostTask.name.getter(v127);
      v130 = v129;
      v168 = sub_100008204(v128, v129, &v171);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, &v169, v126 + 4, v126 + 12);
      swift_bridgeObjectRelease(v130);
      ((void (*)(char *, uint64_t))v165)(v122, v2);
      *(_WORD *)(v126 + 12) = 2080;
      v167 = (uint64_t)v123;
      v131 = sub_10000228C(&qword_100050FB8, (uint64_t (*)(uint64_t))type metadata accessor for BGSystemTaskSchedulerError, (uint64_t)&unk_100038860);
      _BridgedStoredNSError.code.getter(&v168, v120, v131);
      v167 = v168;
      type metadata accessor for Code(0);
      v133 = String.init<A>(describing:)(&v167, v132);
      v135 = v134;
      v168 = sub_100008204(v133, v134, &v171);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, &v169, v126 + 14, v126 + 22);

      swift_bridgeObjectRelease(v135);
      _os_log_impl((void *)&_mh_execute_header, v124, v125, "Task %s schedule request failed: %s", (uint8_t *)v126, 0x16u);
      swift_arrayDestroy(v127, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v127, -1, -1);
      swift_slowDealloc(v126, -1, -1);

      v136 = v159;
    }
    else
    {

      v151 = v159;
      ((void (*)(char *, uint64_t))v165)(v122, v2);

    }
    swift_errorRelease(v172);
    return 0;
  }
  swift_errorRelease(v172);
  v137 = v156;
  v158(v156, v162, v2);
  swift_errorRetain(v116);
  v138 = swift_errorRetain(v116);
  v29 = Logger.logObject.getter(v138);
  v139 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v29, v139))
  {

    v152 = v159;
    swift_errorRelease(v116);
    ((void (*)(char *, uint64_t))v165)(v137, v2);
    swift_errorRelease(v116);
    swift_errorRelease(v116);
LABEL_42:

    return 0;
  }
  v140 = swift_slowAlloc(22, -1);
  v141 = swift_slowAlloc(8, -1);
  v160 = v64;
  v142 = (_QWORD *)v141;
  v143 = (void *)swift_slowAlloc(32, -1);
  v166 = (uint64_t)v143;
  v172 = v143;
  *(_DWORD *)v140 = 136315394;
  v144 = MLHostTask.name.getter(v143);
  v146 = v145;
  v170 = sub_100008204(v144, v145, (uint64_t *)&v172);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v140 + 4, v140 + 12);
  swift_bridgeObjectRelease(v146);
  ((void (*)(char *, uint64_t))v165)(v137, v2);
  *(_WORD *)(v140 + 12) = 2112;
  swift_errorRetain(v116);
  v147 = _swift_stdlib_bridgeErrorToNSError(v116);
  v170 = v147;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v140 + 14, v140 + 22);
  *v142 = v147;
  swift_errorRelease(v116);
  swift_errorRelease(v116);
  _os_log_impl((void *)&_mh_execute_header, v29, v139, "Task %s schedule request failed: %@", (uint8_t *)v140, 0x16u);
  v148 = sub_100007800(&qword_100051288);
  swift_arrayDestroy(v142, 1, v148);
  swift_slowDealloc(v142, -1, -1);
  v149 = v166;
  swift_arrayDestroy(v166, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v149, -1, -1);
  swift_slowDealloc(v140, -1, -1);

  swift_errorRelease(v116);
  v150 = v159;

  return 0;
}

uint64_t sub_10002D54C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

BOOL sub_10002D584()
{
  id v0;
  NSString v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  NSString v20;
  uint64_t v22;
  uint64_t v23;

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  if (v2)
  {
    MLHostConfig.cloudEnvironment.getter();
    v4 = v3;
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    v6 = String._bridgeToObjectiveC()();
    objc_msgSend(v2, "setObject:forKey:", v5, v6);

    MLHostConfig.cloudContainer.getter();
    if (v7)
    {
      v8 = v7;
      v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v8);
    }
    else
    {
      v9 = 0;
    }
    v16 = String._bridgeToObjectiveC()();
    objc_msgSend(v2, "setObject:forKey:", v9, v16);
    swift_unknownObjectRelease(v9);

    MLHostConfig.apsEnvironment.getter();
    if (v17)
    {
      v18 = v17;
      v19 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v18);
    }
    else
    {
      v19 = 0;
    }
    v20 = String._bridgeToObjectiveC()();
    objc_msgSend(v2, "setObject:forKey:", v19, v20);
    swift_unknownObjectRelease(v19);

  }
  else
  {
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v10 = type metadata accessor for Logger(0);
    v11 = sub_10000A8E8(v10, (uint64_t)qword_100052B80);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v15 = swift_slowAlloc(32, -1);
      v23 = v15;
      *(_DWORD *)v14 = 136315138;
      v22 = sub_100008204(0xD000000000000010, 0x80000001000425C0, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v14 + 4, v14 + 12);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed at reading UserDefaults(%s). Skipping saving config.", v14, 0xCu);
      swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);
    }

  }
  return v2 != 0;
}

void sub_10002D87C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  NSString v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  unsigned int v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;

  v5 = objc_allocWithZone((Class)RBSTerminateContext);
  swift_bridgeObjectRetain(a3);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  v33 = objc_msgSend(v5, "initWithExplanation:", v6);

  objc_msgSend(v33, "setReportType:", 0);
  objc_msgSend(v33, "setMaximumTerminationResistance:", 20);
  v7 = objc_msgSend((id)objc_opt_self(RBSProcessIdentifier), "identifierWithPid:", a1);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend((id)objc_opt_self(RBSProcessPredicate), "predicateMatchingIdentifier:", v7);
    v10 = objc_msgSend(objc_allocWithZone((Class)RBSTerminateRequest), "initWithPredicate:context:", v9, v33);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_10000A8E8(v11, (uint64_t)qword_100052B80);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.info.getter(v13);
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v15 = 67109120;
      LODWORD(v34) = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, (char *)&v34 + 4, v15 + 4, v15 + 8);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "RBS request termination for pid: %d", v15, 8u);
      swift_slowDealloc(v15, -1, -1);
    }

    v34 = 0;
    v16 = objc_msgSend(v10, "execute:", &v34);
    v17 = v34;
    if (v16)
    {
      v18 = v34;

LABEL_12:
      return;
    }
    v23 = v34;
    v24 = _convertNSErrorToError(_:)(v17);

    swift_willThrow(v25);
    swift_errorRetain(v24);
    v26 = swift_errorRetain(v24);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v29 = 138412290;
      swift_errorRetain(v24);
      v31 = (void *)_swift_stdlib_bridgeErrorToNSError(v24);
      v34 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v29 + 4, v29 + 12);
      *v30 = v31;
      swift_errorRelease(v24);
      swift_errorRelease(v24);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "RBS request failed: %@", v29, 0xCu);
      v32 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v30, 1, v32);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

      swift_errorRelease(v24);
    }
    else
    {

      swift_errorRelease(v24);
      swift_errorRelease(v24);
      swift_errorRelease(v24);

    }
  }
  else
  {
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v19 = type metadata accessor for Logger(0);
    v20 = sub_10000A8E8(v19, (uint64_t)qword_100052B80);
    v8 = Logger.logObject.getter(v20);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v22 = 67109120;
      LODWORD(v34) = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, (char *)&v34 + 4, v22 + 4, v22 + 8);
      _os_log_impl((void *)&_mh_execute_header, v8, v21, "RBS failed at creating identifier for pid: %d", v22, 8u);
      swift_slowDealloc(v22, -1, -1);

      goto LABEL_12;
    }

  }
}

uint64_t sub_10002DD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3[110] = a3;
  v3[109] = a2;
  v3[108] = a1;
  v4 = type metadata accessor for ContinuousClock(0);
  v3[111] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[112] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[113] = swift_task_alloc(v6);
  v3[114] = swift_task_alloc(v6);
  v3[115] = swift_task_alloc(v6);
  v7 = type metadata accessor for ContinuousClock.Instant(0);
  v3[116] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[117] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[118] = swift_task_alloc(v9);
  v3[119] = swift_task_alloc(v9);
  v3[120] = swift_task_alloc(v9);
  v3[121] = swift_task_alloc(v9);
  v3[122] = swift_task_alloc(v9);
  v10 = type metadata accessor for TaskStatus(0);
  v3[123] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v3[124] = v11;
  v3[125] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UUID(0);
  v3[126] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v3[127] = v13;
  v3[128] = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for SandboxError(0);
  v3[129] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v3[130] = v15;
  v3[131] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for URL.DirectoryHint(0);
  v3[132] = v16;
  v17 = *(_QWORD *)(v16 - 8);
  v3[133] = v17;
  v3[134] = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100007800(&qword_100051610);
  v3[135] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v18 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for URL(0);
  v3[136] = v19;
  v20 = *(_QWORD *)(v19 - 8);
  v3[137] = v20;
  v3[138] = swift_task_alloc((*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for MLHostTask(0);
  v3[139] = v21;
  v22 = *(_QWORD *)(v21 - 8);
  v3[140] = v22;
  v23 = *(_QWORD *)(v22 + 64);
  v3[141] = v23;
  v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[142] = swift_task_alloc(v24);
  v3[143] = swift_task_alloc(v24);
  v3[144] = swift_task_alloc(v24);
  v3[145] = swift_task_alloc(v24);
  v3[146] = swift_task_alloc(v24);
  v3[147] = swift_task_alloc(v24);
  v3[148] = swift_task_alloc(v24);
  v3[149] = swift_task_alloc(v24);
  v3[150] = swift_task_alloc(v24);
  v3[151] = swift_task_alloc(v24);
  v3[152] = swift_task_alloc(v24);
  v3[153] = swift_task_alloc(v24);
  v25 = sub_100007800(&qword_1000514E0);
  v3[154] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v25 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for _AppExtensionProcess(0);
  v3[155] = v26;
  v27 = *(_QWORD *)(v26 - 8);
  v3[156] = v27;
  v3[157] = swift_task_alloc((*(_QWORD *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002E08C, 0, 0);
}

uint64_t sub_10002E08C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  void *object;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  NSXPCConnection v36;
  NSXPCConnection v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  Class isa;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void (*v70)(uint64_t, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t, uint64_t);
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(_QWORD);
  _QWORD *v84;
  unint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t);
  uint64_t v115;
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
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  NSObject *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  os_log_type_t v138;
  _BOOL4 v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  __n128 v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  NSString v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  NSObject *v190;
  os_log_type_t v191;
  _BOOL4 v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  unint64_t v199;
  unint64_t v200;
  uint64_t (*v201)(uint64_t, uint64_t);
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  unint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t (*v217)(uint64_t, uint64_t);
  uint64_t v218;
  uint64_t v219;
  _QWORD *v220;
  unint64_t v221;
  unint64_t v222;
  uint64_t v223;
  void *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void (*v234)(uint64_t, uint64_t);
  _QWORD *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void (*v244)(uint64_t, uint64_t);
  int v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  NSObject *v249;
  os_log_type_t v250;
  BOOL v251;
  void (*v252)(uint64_t, uint64_t);
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  unint64_t v257;
  unint64_t v258;
  uint64_t v259;
  unint64_t v260;
  unint64_t v261;
  uint64_t (*v262)(_QWORD, uint64_t, uint64_t);
  uint64_t v263;
  NSObject *v264;
  os_log_type_t v265;
  BOOL v266;
  void (*v267)(uint64_t, uint64_t);
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  unint64_t v273;
  unint64_t v274;
  uint64_t v275;
  unint64_t v276;
  unint64_t v277;
  uint64_t v278;
  void (*v279)(uint64_t, uint64_t);
  void (*v280)(uint64_t, _QWORD, uint64_t);
  void *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  id v288;
  uint64_t v289;
  Swift::String v290;
  void *v291;
  Swift::String v292;
  uint64_t v293;
  uint64_t v294;
  NSObject *v295;
  os_log_type_t v296;
  BOOL v297;
  void (*v298)(uint64_t, uint64_t);
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t v304;
  unint64_t v305;
  uint64_t v306;
  unint64_t v307;
  unint64_t v308;
  uint64_t (*v309)(uint64_t, uint64_t);
  uint64_t v310;
  void (*v311)(uint64_t, _QWORD, uint64_t);
  void *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  id v323;
  uint64_t v324;
  Swift::String v325;
  void *v326;
  Swift::String v327;
  uint64_t v328;
  id v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  unint64_t v337;
  unint64_t v338;
  void *v339;
  uint64_t v340;
  void *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  void (*v345)(uint64_t, uint64_t);
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  void (*v352)(_QWORD, uint64_t, uint64_t);
  uint64_t v353;
  uint64_t v354;
  NSObject *v355;
  os_log_type_t v356;
  BOOL v357;
  void (*v358)(uint64_t, uint64_t);
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  unint64_t v363;
  unint64_t v364;
  uint64_t v365;
  unint64_t v366;
  unint64_t v367;
  id v368;
  uint64_t v369;
  uint64_t v370;
  NSObject *v371;
  os_log_type_t v372;
  BOOL v373;
  void (*v374)(uint64_t, uint64_t);
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  unint64_t v380;
  unint64_t v381;
  unint64_t v382;
  uint64_t v383;
  unint64_t v384;
  unint64_t v385;
  uint64_t (*v386)(uint64_t, uint64_t);
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  void (*v395)(uint64_t, uint64_t, uint64_t);
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void (*v404)(uint64_t, uint64_t);
  uint64_t v405;
  uint64_t v406;
  void *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  Swift::String v413;
  uint64_t v414;
  Swift::String v415;
  void *v416;
  Swift::String v417;
  Swift::String v418;
  uint64_t v419;
  void *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  void (*v424)(uint64_t, uint64_t);
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  _QWORD *v430;
  void *v431;
  uint64_t v432;
  uint64_t v433;
  _QWORD *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t *v439;
  uint64_t *v440;
  _DWORD *v441;
  uint64_t *v442;
  uint64_t *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  void *v447;
  uint64_t v448;
  uint64_t v449;
  _BYTE *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  os_log_type_t type[8];
  os_log_type_t typea[8];
  os_log_type_t typeb[8];
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  unsigned __int8 *v464;
  uint64_t v465;
  void (*v466)(uint64_t, uint64_t, _QWORD);
  uint64_t v467;
  unint64_t v468;
  uint64_t v469;
  unint64_t v470;
  void (*v471)(uint64_t, _QWORD, uint64_t);
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  unsigned int v475;
  uint64_t v476;
  unsigned __int8 *v477;
  void *v478;
  uint64_t v479;
  void (*v480)(uint64_t, uint64_t, _QWORD);
  void *aBlocka;
  char *aBlock;
  void *aBlockb;
  void *aBlockc;
  void *aBlockd;
  void *v486;
  void (*v487)(uint64_t, uint64_t, uint64_t);
  void *v488;
  void *v489;
  void *v490;
  _BYTE *v491;
  os_log_type_t v492[8];
  os_log_type_t v493[8];
  os_log_type_t v494[8];
  os_log_type_t v495;
  os_log_type_t v496[8];
  os_log_type_t v497[8];
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  id v504;
  id v505;
  id v506;
  id v507;
  id v508;
  unsigned int v509;
  _QWORD *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  os_log_type_t v516;
  void (*v517)(uint64_t, uint64_t);
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  void *v523;
  _QWORD *v524;
  void *v525;
  uint64_t v526;
  void (*v527)(uint64_t, uint64_t, uint64_t);
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  void (*v536)(void *, void *);
  void (*v537)(uint64_t, uint64_t);
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  id v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548[4];

  v2 = v1;
  v3 = v1 + 696;
  v4 = *(_QWORD *)(v1 + 1248);
  v5 = *(_QWORD *)(v2 + 1240);
  v6 = *(_QWORD *)(v2 + 1232);
  strcpy((char *)v548, "transaction_");
  BYTE5(v548[1]) = 0;
  HIWORD(v548[1]) = -5120;
  v7._countAndFlagsBits = MLHostTask.name.getter(a1);
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  v9 = String.utf8CString.getter(v548[0], v548[1]);
  swift_bridgeObjectRelease(v548[1]);
  *(_QWORD *)(v2 + 1264) = os_transaction_create(v9 + 32);
  v10 = swift_release(v9);
  v11 = MLHostTask.bundleIdentifier.getter(v10);
  v13 = v12;
  v14 = MLHostTask.name.getter(v11);
  v16 = v15;
  sub_10000C2A4(v11, v13, v14, v15, v6);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v13);
  v547 = v2;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v5) == 1)
  {
    v540 = v3;
    sub_10000A934(*(_QWORD *)(v2 + 1232), &qword_1000514E0);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v17 = *(_QWORD *)(v2 + 1224);
    v18 = *(_QWORD *)(v2 + 1120);
    v19 = *(_QWORD *)(v2 + 1112);
    v20 = *(_QWORD *)(v2 + 864);
    v21 = type metadata accessor for Logger(0);
    sub_10000A8E8(v21, (uint64_t)qword_100052B80);
    v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v20, v19);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    v25 = os_log_type_enabled(v23, v24);
    v26 = *(_QWORD *)(v2 + 1224);
    v27 = *(_QWORD *)(v2 + 1120);
    v28 = *(_QWORD *)(v2 + 1112);
    if (v25)
    {
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v548[0] = v30;
      *(_DWORD *)v29 = 136315138;
      v31 = MLHostTask.bundleIdentifier.getter(v30);
      v33 = v32;
      *(_QWORD *)(v547 + 696) = sub_100008204(v31, v32, v548);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v540, v547 + 704, v29 + 4, v29 + 12);
      v34 = v33;
      v2 = v547;
      swift_bridgeObjectRelease(v34);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed at starting process for extension: %s", v29, 0xCu);
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v27 + 8))(*(_QWORD *)(v2 + 1224), *(_QWORD *)(v2 + 1112));
    }

    v56 = *(_QWORD *)(v2 + 1000);
    v57 = *(_QWORD *)(v2 + 992);
    v58 = *(_QWORD *)(v2 + 984);
    v60 = MLHostTask.name.getter(v59);
    v62 = v61;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v57 + 104))(v56, enum case for TaskStatus.taskFailed(_:), v58);
    sub_100012EC4(v60, v62, v56);
    swift_bridgeObjectRelease(v62);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v58);
LABEL_19:
    v447 = 0;
LABEL_20:
    v115 = *(_QWORD *)(v2 + 1264);
    v116 = *(_QWORD *)(v2 + 1256);
    v117 = *(_QWORD *)(v2 + 1232);
    v118 = *(_QWORD *)(v2 + 1224);
    v119 = *(_QWORD *)(v2 + 1216);
    v120 = *(_QWORD *)(v2 + 1208);
    v121 = *(_QWORD *)(v2 + 1200);
    v122 = *(_QWORD *)(v547 + 1192);
    v123 = *(_QWORD *)(v547 + 1184);
    v124 = *(_QWORD *)(v547 + 1176);
    v125 = *(_QWORD *)(v547 + 1168);
    v448 = *(_QWORD *)(v547 + 1160);
    v451 = *(_QWORD *)(v547 + 1152);
    *(_QWORD *)type = *(_QWORD *)(v547 + 1144);
    v459 = *(_QWORD *)(v547 + 1136);
    v463 = *(_QWORD *)(v547 + 1104);
    v467 = *(_QWORD *)(v547 + 1080);
    v472 = *(_QWORD *)(v547 + 1072);
    v476 = *(_QWORD *)(v547 + 1048);
    aBlockb = *(void **)(v547 + 1024);
    v488 = *(void **)(v547 + 1000);
    *(_QWORD *)v494 = *(_QWORD *)(v547 + 976);
    v499 = *(_QWORD *)(v547 + 968);
    v506 = *(id *)(v547 + 960);
    v511 = *(_QWORD *)(v547 + 952);
    v519 = *(_QWORD *)(v547 + 944);
    v528 = *(_QWORD *)(v547 + 920);
    v535 = *(_QWORD *)(v547 + 912);
    v542 = *(_QWORD *)(v547 + 904);
    swift_unknownObjectRelease(v115);
    swift_task_dealloc(v116);
    swift_task_dealloc(v117);
    swift_task_dealloc(v118);
    swift_task_dealloc(v119);
    swift_task_dealloc(v120);
    swift_task_dealloc(v121);
    swift_task_dealloc(v122);
    swift_task_dealloc(v123);
    swift_task_dealloc(v124);
    swift_task_dealloc(v125);
    swift_task_dealloc(v448);
    swift_task_dealloc(v451);
    swift_task_dealloc(*(_QWORD *)type);
    swift_task_dealloc(v459);
    swift_task_dealloc(v463);
    swift_task_dealloc(v467);
    swift_task_dealloc(v472);
    swift_task_dealloc(v476);
    swift_task_dealloc(aBlockb);
    swift_task_dealloc(v488);
    swift_task_dealloc(*(_QWORD *)v494);
    swift_task_dealloc(v499);
    swift_task_dealloc(v506);
    swift_task_dealloc(v511);
    swift_task_dealloc(v519);
    swift_task_dealloc(v528);
    swift_task_dealloc(v535);
    swift_task_dealloc(v542);
    return (*(uint64_t (**)(void *))(v547 + 8))(v447);
  }
  v35 = (uint64_t *)(v2 + 848);
  v534 = v2 + 856;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v2 + 1248) + 32))(*(_QWORD *)(v2 + 1256), *(_QWORD *)(v2 + 1232), *(_QWORD *)(v2 + 1240));
  v36.super.isa = _AppExtensionProcess.makeXPCConnection()().super.isa;
  *(NSXPCConnection *)(v2 + 1272) = v36;
  if (v37.super.isa)
  {
    swift_errorRelease(v37.super.isa);
    if (qword_100050F28 != -1)
      swift_once(&qword_100050F28, sub_10001E040);
    v38 = *(_QWORD *)(v2 + 1208);
    v39 = *(_QWORD *)(v2 + 1120);
    v40 = *(_QWORD *)(v2 + 1112);
    v41 = *(_QWORD *)(v2 + 864);
    v42 = type metadata accessor for Logger(0);
    sub_10000A8E8(v42, (uint64_t)qword_100052B80);
    v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v38, v41, v40);
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.error.getter();
    v46 = os_log_type_enabled(v44, v45);
    v47 = *(_QWORD *)(v2 + 1208);
    v48 = *(_QWORD *)(v2 + 1120);
    v49 = *(_QWORD *)(v2 + 1112);
    if (v46)
    {
      v50 = (uint8_t *)swift_slowAlloc(12, -1);
      v51 = swift_slowAlloc(32, -1);
      v548[0] = v51;
      *(_DWORD *)v50 = 136315138;
      v52 = MLHostTask.bundleIdentifier.getter(v51);
      v54 = v53;
      *v35 = sub_100008204(v52, v53, v548);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v35, v534, v50 + 4, v50 + 12);
      v55 = v54;
      v2 = v547;
      swift_bridgeObjectRelease(v55);
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Failed at opening XPCConnection for extension: %s", v50, 0xCu);
      swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1, -1);
      swift_slowDealloc(v50, -1, -1);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v48 + 8))(*(_QWORD *)(v2 + 1208), *(_QWORD *)(v2 + 1112));
    }

    v104 = *(_QWORD *)(v2 + 1256);
    v105 = *(_QWORD *)(v2 + 1248);
    v106 = *(_QWORD *)(v2 + 1240);
    v107 = *(_QWORD *)(v2 + 1000);
    v108 = *(_QWORD *)(v547 + 992);
    v109 = *(_QWORD *)(v547 + 984);
    v111 = MLHostTask.name.getter(v110);
    v113 = v112;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v108 + 104))(v107, enum case for TaskStatus.taskFailed(_:), v109);
    sub_100012EC4(v111, v113, v107);
    swift_bridgeObjectRelease(v113);
    v114 = *(void (**)(uint64_t, uint64_t))(v108 + 8);
    v2 = v547;
    v114(v107, v109);
    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v104, v106);
    goto LABEL_19;
  }
  isa = v36.super.isa;
  v444 = v2 + 848;
  v541 = v3;
  aBlocka = (void *)(v2 + 112);
  v486 = (void *)(v2 + 160);
  v504 = (id)(v2 + 208);
  v510 = (_QWORD *)(v2 + 256);
  v64 = *(_QWORD *)(v2 + 1216);
  v65 = *(_QWORD *)(v2 + 1128);
  v435 = v2 + 792;
  v498 = v2 + 800;
  v66 = *(_QWORD *)(v2 + 1120);
  v437 = v2 + 824;
  v446 = v2 + 1456;
  v67 = *(_QWORD *)(v2 + 1112);
  v526 = *(_QWORD *)(v2 + 992);
  *(_QWORD *)v492 = *(_QWORD *)(v2 + 984);
  v68 = *(_QWORD *)(v2 + 864);
  v69 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_);
  -[objc_class setRemoteObjectInterface:](isa, "setRemoteObjectInterface:", v69);

  v70 = *(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16);
  *(_QWORD *)(v2 + 1280) = v70;
  v70(v64, v68, v67);
  LODWORD(v71) = *(_DWORD *)(v66 + 80);
  *(_DWORD *)(v2 + 1460) = v71;
  v71 = v71;
  v72 = (v71 + 16) & ~v71;
  v73 = v72 + v65;
  v74 = v71 | 7;
  v518 = v74;
  v75 = swift_allocObject(&unk_10004DFC8, v72 + v65, v74);
  v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 32);
  *(_QWORD *)(v547 + 1288) = v76;
  v76(v75 + v72, v64, v67);
  *(_QWORD *)(v547 + 144) = sub_1000369AC;
  *(_QWORD *)(v547 + 152) = v75;
  *(_QWORD *)(v547 + 112) = _NSConcreteStackBlock;
  *(_QWORD *)(v547 + 120) = 1107296256;
  *(_QWORD *)(v547 + 128) = sub_10001F914;
  *(_QWORD *)(v547 + 136) = &unk_10004DFE0;
  v77 = _Block_copy(aBlocka);
  swift_release(*(_QWORD *)(v547 + 152));
  -[objc_class setInterruptionHandler:](isa, "setInterruptionHandler:", v77);
  _Block_release(v77);
  v70(v64, v68, v67);
  v78 = swift_allocObject(&unk_10004E018, v73, v74);
  v76(v78 + v72, v64, v67);
  *(_QWORD *)(v547 + 192) = sub_100036A1C;
  *(_QWORD *)(v547 + 200) = v78;
  *(_QWORD *)(v547 + 160) = _NSConcreteStackBlock;
  *(_QWORD *)(v547 + 168) = 1107296256;
  *(_QWORD *)(v547 + 176) = sub_10001F914;
  *(_QWORD *)(v547 + 184) = &unk_10004E030;
  v79 = _Block_copy(v486);
  swift_release(*(_QWORD *)(v547 + 200));
  -[objc_class setInvalidationHandler:](isa, "setInvalidationHandler:", v79);
  _Block_release(v79);
  -[objc_class resume](isa, "resume");
  v80 = swift_allocBox(*(_QWORD *)v492);
  v82 = v81;
  *(_QWORD *)(v547 + 1296) = v80;
  *(_QWORD *)(v547 + 1304) = v81;
  LODWORD(v81) = enum case for TaskStatus.taskRunning(_:);
  *(_DWORD *)(v547 + 1464) = enum case for TaskStatus.taskRunning(_:);
  v83 = *(void (**)(_QWORD))(v526 + 104);
  *(_QWORD *)(v547 + 1312) = v83;
  v475 = v81;
  v84 = (_QWORD *)v547;
  v471 = (void (*)(uint64_t, _QWORD, uint64_t))v83;
  v83(v82);
  v527 = v70;
  v70(v64, v68, v67);
  v85 = (v73 + 7) & 0xFFFFFFFFFFFFFFF8;
  v86 = swift_allocObject(&unk_10004E068, v85 + 8, v518);
  v487 = v76;
  *(_QWORD *)v493 = v72;
  v76(v86 + v72, v64, v67);
  aBlock = (char *)v85;
  *(_QWORD *)(v86 + v85) = v80;
  *(_QWORD *)(v547 + 240) = sub_100036ADC;
  *(_QWORD *)(v547 + 248) = v86;
  *(_QWORD *)(v547 + 208) = _NSConcreteStackBlock;
  *(_QWORD *)(v547 + 216) = 1107296256;
  *(_QWORD *)(v547 + 224) = sub_10001FE70;
  *(_QWORD *)(v547 + 232) = &unk_10004E080;
  v87 = _Block_copy(v504);
  v88 = *(_QWORD *)(v547 + 248);
  swift_retain(v80);
  swift_release(v88);
  v89 = -[objc_class remoteObjectProxyWithErrorHandler:](isa, "remoteObjectProxyWithErrorHandler:", v87);
  _Block_release(v87);
  _bridgeAnyObjectToAny(_:)(v510, v89);
  swift_unknownObjectRelease(v89);
  v90 = sub_100007800(&qword_100051880);
  v91 = swift_dynamicCast(v498, v510, (char *)&type metadata for Any + 8, v90, 7);
  v505 = *(id *)(v547 + 800);
  *(_QWORD *)(v547 + 1320) = v505;
  v92 = MLHostTask.taskFolder.getter(v91);
  v94 = v93;
  *(_BYTE *)(v547 + 569) = 1;
  if (qword_100050F40 != -1)
    swift_once(&qword_100050F40, sub_10001E0DC);
  v439 = (uint64_t *)(v547 + 744);
  v440 = (uint64_t *)(v547 + 680);
  v436 = v547 + 816;
  v441 = (_DWORD *)(v547 + 1452);
  v442 = (uint64_t *)(v547 + 672);
  v95 = (_QWORD *)qword_1000516F8;
  swift_bridgeObjectRetain(qword_1000516F8);
  v97 = MLHostTask.bundleIdentifier.getter(v96);
  v99 = v98;
  v100 = sub_10000E87C(v97, v98, v95);
  swift_bridgeObjectRelease(v99);
  v101 = swift_bridgeObjectRelease(v95);
  if ((v100 & 1) != 0)
  {
    v102 = *(_QWORD *)(v547 + 872);
    swift_bridgeObjectRelease(v94);
    *(_BYTE *)(v547 + 569) = 0;
    v103 = *(_QWORD *)(v102 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    v92 = *(_QWORD *)(v103 + 40);
    v94 = *(_QWORD *)(v103 + 48);
    swift_bridgeObjectRetain_n(v94, 2);
  }
  else
  {
    if (!v94)
      goto LABEL_29;
    swift_bridgeObjectRetain(v94);
  }
  v512 = v92;
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v127 = *(_QWORD *)(v547 + 1200);
  v128 = *(_QWORD *)(v547 + 1112);
  v129 = *(_QWORD *)(v547 + 864);
  v130 = type metadata accessor for Logger(0);
  v131 = sub_10000A8E8(v130, (uint64_t)qword_100052B80);
  v464 = (unsigned __int8 *)(v547 + 569);
  v132 = *(unsigned __int8 *)(v547 + 569);
  v527(v127, v129, v128);
  v133 = swift_bridgeObjectRetain_n(v94, 2);
  v438 = v131;
  v134 = Logger.logObject.getter(v133);
  v138 = static os_log_type_t.debug.getter(v134, v135, v136, v137);
  v139 = os_log_type_enabled(v134, v138);
  v140 = *(_QWORD *)(v547 + 1200);
  v141 = *(_QWORD *)(v547 + 1120);
  v142 = *(_QWORD *)(v547 + 1112);
  v468 = v94;
  if (v139)
  {
    v143 = swift_slowAlloc(28, -1);
    v452 = swift_slowAlloc(64, -1);
    v548[0] = v452;
    *(_DWORD *)v143 = 67109634;
    *v441 = v132;
    v144 = UnsafeMutableRawBufferPointer.copyMemory(from:)(v441, v446, v143 + 4, v143 + 8);
    *(_WORD *)(v143 + 8) = 2080;
    v145 = MLHostTask.name.getter(v144);
    v147 = v146;
    *(_QWORD *)(v547 + 736) = sub_100008204(v145, v146, v548);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 736, v439, v143 + 10, v143 + 18);
    swift_bridgeObjectRelease(v147);
    (*(void (**)(uint64_t, uint64_t))(v141 + 8))(v140, v142);
    *(_WORD *)(v143 + 18) = 2080;
    swift_bridgeObjectRetain(v94);
    *v442 = sub_100008204(v92, v94, v548);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v442, v440, v143 + 20, v143 + 28);
    swift_bridgeObjectRelease_n(v94, 3);
    _os_log_impl((void *)&_mh_execute_header, v134, v138, "Granting sandbox extension (ro: %{BOOL}d) to %s for taskFolder: %s", (uint8_t *)v143, 0x1Cu);
    swift_arrayDestroy(v452, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v452, -1, -1);
    swift_slowDealloc(v143, -1, -1);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v141 + 8))(v140, v142);
    swift_bridgeObjectRelease_n(v94, 2);
  }

  v148 = *(_QWORD *)(v547 + 1104);
  v149 = *(_QWORD *)(v547 + 1096);
  v150 = *(_QWORD *)(v547 + 1088);
  v151 = *(_QWORD *)(v547 + 1080);
  v152 = *(_QWORD *)(v547 + 1072);
  v153 = *(_QWORD *)(v547 + 1064);
  v154 = *(_QWORD *)(v547 + 1056);
  *(_QWORD *)typea = type metadata accessor for SandboxExtension(0);
  v158 = _AppExtensionProcess.auditToken.getter(*(_QWORD *)typea, v155, v156, v157);
  v449 = v160;
  v453 = v159;
  v162 = v161;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v149 + 56))(v151, 1, 1, v150);
  v163.n128_f64[0] = (*(double (**)(uint64_t, _QWORD, uint64_t))(v153 + 104))(v152, enum case for URL.DirectoryHint.inferFromPath(_:), v154);
  v92 = v512;
  v94 = v468;
  URL.init(filePath:directoryHint:relativeTo:)(v512, v468, v152, v151, v163);
  swift_beginAccess(v464, v547 + 336, 0, 0);
  v164 = static SandboxExtension.issue(auditToken:url:readonly:)(v158, v453, v162, v449, v148, *v464);
  v165 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v547 + 1096) + 8))(*(_QWORD *)(v547 + 1104), *(_QWORD *)(v547 + 1088));
  SandboxExtension.token.getter(v165);
  v167 = v166;
  v168 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v167);
  objc_msgSend(v505, "consumeSandboxExtensionWithToken:", v168, v435, v436, v437, v438);

  v101 = swift_release(v164);
LABEL_29:
  v169 = *(_QWORD *)(v547 + 1024);
  v170 = *(_QWORD *)(v547 + 1016);
  v171 = *(_QWORD *)(v547 + 1008);
  v172 = UUID.init()(v101);
  v173 = UUID.uuidString.getter(v172);
  v175 = v174;
  v176 = (*(uint64_t (**)(uint64_t, uint64_t))(v170 + 8))(v169, v171);
  v177 = MLHostTask.name.getter(v176);
  v179 = v178;
  v180 = objc_allocWithZone((Class)type metadata accessor for MLHostExtensionContext(0));
  v500 = MLHostExtensionContext.init(taskId:taskName:taskFolder:)(v173, v175, v177, v179, v92, v94);
  *(_QWORD *)(v547 + 1328) = v500;
  v181 = swift_allocObject(&unk_10004E0B8, 24, 7);
  *(_QWORD *)(v547 + 1336) = v181;
  v469 = v181;
  *(_QWORD *)(v181 + 16) = 0;
  v182 = swift_allocObject(&unk_10004DF78, 17, 7);
  *(_QWORD *)(v547 + 1344) = v182;
  v465 = v182;
  *(_BYTE *)(v182 + 16) = 2;
  v454 = v182 + 16;
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v183 = (uint64_t *)(v547 + 832);
  v184 = *(_QWORD *)(v547 + 1192);
  v185 = *(_QWORD *)(v547 + 1184);
  v186 = *(_QWORD *)(v547 + 1112);
  v187 = *(_QWORD *)(v547 + 864);
  v188 = type metadata accessor for Logger(0);
  *(_QWORD *)(v547 + 1352) = sub_10000A8E8(v188, (uint64_t)qword_100052B80);
  v527(v184, v187, v186);
  v189 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v527)(v185, v187, v186);
  v190 = Logger.logObject.getter(v189);
  v191 = static os_log_type_t.info.getter(v190);
  v192 = os_log_type_enabled(v190, v191);
  v193 = *(_QWORD *)(v547 + 1192);
  v194 = *(_QWORD *)(v547 + 1184);
  v195 = *(_QWORD *)(v547 + 1120);
  v196 = *(_QWORD *)(v547 + 1112);
  if (v192)
  {
    v197 = swift_slowAlloc(22, -1);
    v460 = swift_slowAlloc(64, -1);
    v548[0] = v460;
    *(_DWORD *)v197 = 136315394;
    v198 = MLHostTask.name.getter(v460);
    v200 = v199;
    *v183 = sub_100008204(v198, v199, v548);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v183, v547 + 840, v197 + 4, v197 + 12);
    swift_bridgeObjectRelease(v200);
    v201 = *(uint64_t (**)(uint64_t, uint64_t))(v195 + 8);
    v202 = v201(v193, v196);
    *(_WORD *)(v197 + 12) = 2080;
    v203 = MLHostTask.bundleIdentifier.getter(v202);
    v205 = v204;
    *(_QWORD *)(v547 + 840) = sub_100008204(v203, v204, v548);
    v84 = (_QWORD *)v547;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 840, v444, v197 + 14, v197 + 22);
    swift_bridgeObjectRelease(v205);
    v201(v194, v196);
    _os_log_impl((void *)&_mh_execute_header, v190, v191, "Task %s starting with extension: %s", (uint8_t *)v197, 0x16u);
    swift_arrayDestroy(v460, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v460, -1, -1);
    swift_slowDealloc(v197, -1, -1);
  }
  else
  {
    v201 = *(uint64_t (**)(uint64_t, uint64_t))(v195 + 8);
    v201(v193, v196);
    v201(v194, v196);
  }

  v450 = v84 + 71;
  v84[170] = v201;
  v206 = v84[152];
  v207 = v84[139];
  v208 = v84[125];
  v209 = v84[124];
  v210 = v84[123];
  v461 = v84[110];
  v211 = v84[109];
  v212 = *(_QWORD *)(v547 + 864);
  *(_QWORD *)(v547 + 1368) = *(_QWORD *)(v211 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  v214 = MLHostTask.name.getter(v213);
  v216 = v215;
  v471(v208, v475, v210);
  sub_100012EC4(v214, v216, v208);
  swift_bridgeObjectRelease(v216);
  v217 = *(uint64_t (**)(uint64_t, uint64_t))(v209 + 8);
  *(_QWORD *)(v547 + 1376) = v217;
  v218 = v217(v208, v210);
  static ContinuousClock.now.getter(v218);
  v219 = v212;
  v220 = (_QWORD *)v547;
  v527(v206, v219, v207);
  v221 = (unint64_t)(aBlock + 15) & 0xFFFFFFFFFFFFFFF8;
  v222 = (v221 + 15) & 0xFFFFFFFFFFFFFFF8;
  v223 = swift_allocObject(&unk_10004E0E0, v222 + 8, v518);
  v487(v223 + *(_QWORD *)v493, v206, v207);
  *(_QWORD *)&aBlock[v223] = v469;
  *(_QWORD *)(v223 + v221) = v465;
  *(_QWORD *)(v223 + v222) = v211;
  *(_QWORD *)(v547 + 96) = sub_100036B54;
  *(_QWORD *)(v547 + 104) = v223;
  *(_QWORD *)(v547 + 64) = _NSConcreteStackBlock;
  *(_QWORD *)(v547 + 72) = 1107296256;
  *(_QWORD *)(v547 + 80) = sub_10001FE70;
  *(_QWORD *)(v547 + 88) = &unk_10004E0F8;
  v224 = _Block_copy((const void *)(v547 + 64));
  v225 = *(_QWORD *)(v547 + 104);
  swift_retain(v469);
  swift_retain(v465);
  swift_retain(v211);
  swift_release(v225);
  objc_msgSend(v505, "shouldRunWithContext:reply:", v500, v224);
  _Block_release(v224);
  v226 = swift_beginAccess(v461 + 16, v547 + 360, 0, 0);
  if (*(_BYTE *)(v461 + 16) == 1)
  {
    v227 = *(_QWORD *)(v547 + 1344);
  }
  else
  {
    swift_beginAccess(v454, v547 + 384, 0, 0);
    v226 = swift_beginAccess(v461 + 16, v547 + 288, 0, 0);
    v227 = *(_QWORD *)(v547 + 1344);
    if (*(_BYTE *)(v227 + 16) == 2)
    {
      v228 = *(_QWORD *)(v547 + 968);
      v229 = *(_QWORD *)(v547 + 936);
      v230 = *(_QWORD *)(v547 + 928);
      v231 = *(_QWORD *)(v547 + 888);
      ContinuousClock.init()(v226);
      *(_QWORD *)(v547 + 632) = 500000000000000000;
      *(_QWORD *)(v547 + 640) = 0;
      *(_OWORD *)(v547 + 576) = 0u;
      v450[24] = 1;
      v232 = sub_10000228C(&qword_100051888, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
      dispatch thunk of Clock.now.getter(v231, v232);
      v233 = sub_10000228C(&qword_100051890, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
      dispatch thunk of InstantProtocol.advanced(by:)(v547 + 632, v230, v233);
      v234 = *(void (**)(uint64_t, uint64_t))(v229 + 8);
      *(_QWORD *)(v547 + 1424) = v234;
      v234(v228, v230);
      v235 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
      *(_QWORD *)(v547 + 1432) = v235;
      *v235 = v547;
      v235[1] = sub_100033398;
      v236 = *(_QWORD *)(v547 + 888);
      v237 = v547 + 576;
      v238 = *(_QWORD *)(v547 + 944);
      v239 = v232;
      return dispatch thunk of Clock.sleep(until:tolerance:)(v238, v237, v236, v239);
    }
  }
  v513 = v547 + 760;
  v240 = *(_QWORD *)(v547 + 968);
  v241 = *(_QWORD *)(v547 + 936);
  v242 = *(_QWORD *)(v547 + 928);
  static ContinuousClock.now.getter(v226);
  v520 = ContinuousClock.Instant.duration(to:)(v240);
  v529 = v243;
  v244 = *(void (**)(uint64_t, uint64_t))(v241 + 8);
  *(_QWORD *)(v547 + 1384) = v244;
  v244(v240, v242);
  swift_beginAccess(v227 + 16, v547 + 480, 0, 0);
  v245 = *(unsigned __int8 *)(v227 + 16);
  v246 = *(_QWORD *)(v547 + 1112);
  v247 = *(_QWORD *)(v547 + 864);
  if (v245 == 2)
  {
    v536 = (void (*)(void *, void *))v244;
    v248 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v547 + 1280))(*(_QWORD *)(v547 + 1176), v247, v246);
    v249 = Logger.logObject.getter(v248);
    v250 = static os_log_type_t.info.getter(v249);
    v251 = os_log_type_enabled(v249, v250);
    v252 = *(void (**)(uint64_t, uint64_t))(v547 + 1360);
    v253 = *(_QWORD *)(v547 + 1176);
    v254 = *(_QWORD *)(v547 + 1112);
    if (v251)
    {
      v477 = (unsigned __int8 *)(*(_QWORD *)(v547 + 880) + 16);
      v255 = swift_slowAlloc(28, -1);
      v501 = swift_slowAlloc(64, -1);
      v548[0] = v501;
      *(_DWORD *)v255 = 136315650;
      v495 = v250;
      v256 = MLHostTask.name.getter(v501);
      v258 = v257;
      *(_QWORD *)(v547 + 760) = sub_100008204(v256, v257, v548);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v513, v547 + 768, v255 + 4, v255 + 12);
      swift_bridgeObjectRelease(v258);
      v252(v253, v254);
      *(_WORD *)(v255 + 12) = 1024;
      swift_beginAccess(v477, v547 + 528, 0, 0);
      *(_DWORD *)(v547 + 1456) = *v477;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v446, v547 + 1460, v255 + 14, v255 + 18);
      *(_WORD *)(v255 + 18) = 2080;
      v259 = Duration.description.getter(v520, v529);
      v261 = v260;
      *(_QWORD *)(v547 + 688) = sub_100008204(v259, v260, v548);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 688, v541, v255 + 20, v255 + 28);
      swift_bridgeObjectRelease(v261);
      _os_log_impl((void *)&_mh_execute_header, v249, v495, "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.", (uint8_t *)v255, 0x1Cu);
      swift_arrayDestroy(v501, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v501, -1, -1);
      swift_slowDealloc(v255, -1, -1);
    }
    else
    {
      v252(*(_QWORD *)(v547 + 1176), *(_QWORD *)(v547 + 1112));
    }

    v279 = *(void (**)(uint64_t, uint64_t))(v547 + 1376);
    v502 = *(_QWORD *)(v547 + 1344);
    v514 = *(_QWORD *)(v547 + 1336);
    v478 = *(void **)(v547 + 1328);
    *(_QWORD *)v496 = *(_QWORD *)(v547 + 1320);
    v280 = *(void (**)(uint64_t, _QWORD, uint64_t))(v547 + 1312);
    v507 = *(id *)(v547 + 1296);
    v281 = *(void **)(v547 + 1272);
    v521 = *(_QWORD *)(v547 + 1256);
    v530 = *(_QWORD *)(v547 + 1248);
    v543 = *(_QWORD *)(v547 + 1240);
    v282 = *(_QWORD *)(v547 + 1000);
    v283 = *(_QWORD *)(v547 + 984);
    aBlockc = *(void **)(v547 + 928);
    v489 = *(void **)(v547 + 976);
    v285 = MLHostTask.name.getter(v284);
    v287 = v286;
    v280(v282, enum case for TaskStatus.taskDeferred(_:), v283);
    sub_100012EC4(v285, v287, v282);
    swift_bridgeObjectRelease(v287);
    v279(v282, v283);
    v288 = objc_msgSend(v281, "processIdentifier");
    v548[0] = 0;
    v548[1] = 0xE000000000000000;
    _StringGuts.grow(_:)(37);
    v289 = swift_bridgeObjectRelease(v548[1]);
    v548[0] = 0x206B736154;
    v548[1] = 0xE500000000000000;
    v290._countAndFlagsBits = MLHostTask.name.getter(v289);
    v291 = v290._object;
    String.append(_:)(v290);
    swift_bridgeObjectRelease(v291);
    v292._countAndFlagsBits = 0xD00000000000001ELL;
    v292._object = (void *)0x80000001000424F0;
    String.append(_:)(v292);
    v293 = v548[1];
    sub_10002D87C((uint64_t)v288, v548[0], v548[1]);

    swift_bridgeObjectRelease(v293);
    swift_unknownObjectRelease(*(_QWORD *)v496);
    v536(v489, aBlockc);
    swift_release(v502);
    swift_release(v514);
    swift_release(v507);
    objc_msgSend(v281, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v530 + 8))(v521, v543);
    v447 = 0;
    v2 = v547;
    goto LABEL_20;
  }
  v262 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v547 + 1280);
  if ((v245 & 1) == 0)
  {
    v537 = v244;
    v263 = v262(*(_QWORD *)(v547 + 1160), v247, v246);
    v264 = Logger.logObject.getter(v263);
    v265 = static os_log_type_t.info.getter(v264);
    v266 = os_log_type_enabled(v264, v265);
    v267 = *(void (**)(uint64_t, uint64_t))(v547 + 1360);
    v268 = *(_QWORD *)(v547 + 1160);
    v269 = *(_QWORD *)(v547 + 1112);
    if (v266)
    {
      v270 = swift_slowAlloc(28, -1);
      v271 = swift_slowAlloc(64, -1);
      v548[0] = v271;
      *(_DWORD *)v270 = 136315650;
      v272 = MLHostTask.name.getter(v271);
      v274 = v273;
      *v440 = sub_100008204(v272, v273, v548);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v440, v547 + 688, v270 + 4, v270 + 12);
      swift_bridgeObjectRelease(v274);
      v267(v268, v269);
      *(_WORD *)(v270 + 12) = 1024;
      *(_DWORD *)(v547 + 1448) = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 1448, v441, v270 + 14, v270 + 18);
      *(_WORD *)(v270 + 18) = 2080;
      v275 = Duration.description.getter(v520, v529);
      v277 = v276;
      *(_QWORD *)(v547 + 664) = sub_100008204(v275, v276, v548);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 664, v442, v270 + 20, v270 + 28);
      swift_bridgeObjectRelease(v277);
      _os_log_impl((void *)&_mh_execute_header, v264, v265, "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v270, 0x1Cu);
      swift_arrayDestroy(v271, 2, (char *)&type metadata for Any + 8);
      v278 = v271;
      v220 = (_QWORD *)v547;
      swift_slowDealloc(v278, -1, -1);
      swift_slowDealloc(v270, -1, -1);
    }
    else
    {
      v267(*(_QWORD *)(v547 + 1160), *(_QWORD *)(v547 + 1112));
    }

    v309 = (uint64_t (*)(uint64_t, uint64_t))v220[172];
    v310 = v220[167];
    v490 = (void *)v220[166];
    *(_QWORD *)v497 = v220[165];
    v503 = v220[168];
    v311 = (void (*)(uint64_t, _QWORD, uint64_t))v220[164];
    v508 = (id)v220[162];
    v312 = (void *)v220[159];
    v515 = v220[157];
    v522 = v220[156];
    v531 = v220[155];
    v313 = v220[125];
    v314 = v220[123];
    v473 = v220[116];
    v479 = v220[122];
    v316 = MLHostTask.name.getter(v315);
    v318 = v317;
    v311(v313, enum case for TaskStatus.taskFailed(_:), v314);
    sub_100012EC4(v316, v318, v313);
    swift_bridgeObjectRelease(v318);
    v319 = v309(v313, v314);
    v320 = MLHostTask.name.getter(v319);
    v322 = v321;
    sub_100012BF4(v320, v321);
    swift_bridgeObjectRelease(v322);
    v323 = objc_msgSend(v312, "processIdentifier");
    v548[0] = 0;
    v548[1] = 0xE000000000000000;
    _StringGuts.grow(_:)(27);
    v324 = swift_bridgeObjectRelease(v548[1]);
    v548[0] = 0x206B736154;
    v548[1] = 0xE500000000000000;
    v2 = v547;
    v325._countAndFlagsBits = MLHostTask.name.getter(v324);
    v326 = v325._object;
    String.append(_:)(v325);
    swift_bridgeObjectRelease(v326);
    v327._object = (void *)0x8000000100042510;
    v327._countAndFlagsBits = 0xD000000000000014;
    String.append(_:)(v327);
    v328 = v548[1];
    sub_10002D87C((uint64_t)v323, v548[0], v548[1]);
    swift_bridgeObjectRelease(v328);

    swift_unknownObjectRelease(*(_QWORD *)v497);
    v537(v479, v473);
    swift_beginAccess(v310 + 16, v547 + 408, 0, 0);
    v447 = *(void **)(v310 + 16);
    v329 = v447;
    swift_release(v503);
    swift_release(v310);
    swift_release(v508);
    objc_msgSend(v312, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v522 + 8))(v515, v531);
    goto LABEL_20;
  }
  v443 = (uint64_t *)(v547 + 768);
  v294 = v262(*(_QWORD *)(v547 + 1168), v247, v246);
  v295 = Logger.logObject.getter(v294);
  v296 = static os_log_type_t.info.getter(v295);
  v297 = os_log_type_enabled(v295, v296);
  v298 = *(void (**)(uint64_t, uint64_t))(v547 + 1360);
  v299 = *(_QWORD *)(v547 + 1168);
  v300 = *(_QWORD *)(v547 + 1112);
  if (v297)
  {
    v301 = swift_slowAlloc(28, -1);
    v302 = swift_slowAlloc(64, -1);
    v548[0] = v302;
    *(_DWORD *)v301 = 136315650;
    v303 = MLHostTask.name.getter(v302);
    v305 = v304;
    *(_QWORD *)(v547 + 808) = sub_100008204(v303, v304, v548);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 808, v436, v301 + 4, v301 + 12);
    swift_bridgeObjectRelease(v305);
    v298(v299, v300);
    *(_WORD *)(v301 + 12) = 1024;
    *(_DWORD *)(v547 + 572) = 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 572, v547 + 576, v301 + 14, v301 + 18);
    *(_WORD *)(v301 + 18) = 2080;
    v306 = Duration.description.getter(v520, v529);
    v308 = v307;
    *(_QWORD *)(v547 + 824) = sub_100008204(v306, v307, v548);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v437, v547 + 832, v301 + 20, v301 + 28);
    swift_bridgeObjectRelease(v308);
    _os_log_impl((void *)&_mh_execute_header, v295, v296, "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v301, 0x1Cu);
    swift_arrayDestroy(v302, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v302, -1, -1);
    swift_slowDealloc(v301, -1, -1);
  }
  else
  {
    v298(*(_QWORD *)(v547 + 1168), *(_QWORD *)(v547 + 1112));
  }

  v330 = *(_QWORD *)(v547 + 1336);
  v523 = *(void **)(v547 + 1320);
  v532 = *(_QWORD *)(v547 + 1328);
  v331 = *(_QWORD *)(v547 + 1304);
  v480 = *(void (**)(uint64_t, uint64_t, _QWORD))(v547 + 1288);
  aBlockd = *(void **)(v547 + 1296);
  v332 = *(unsigned __int8 *)(v547 + 1460);
  v462 = *(_QWORD *)(v547 + 1216);
  v466 = *(void (**)(uint64_t, uint64_t, _QWORD))(v547 + 1280);
  *(_QWORD *)typeb = *(_QWORD *)(v547 + 1112);
  v333 = *(_QWORD *)(v547 + 1000);
  v334 = *(_QWORD *)(v547 + 992);
  v335 = *(_QWORD *)(v547 + 984);
  v455 = *(_QWORD *)(v547 + 864);
  v491 = (_BYTE *)(*(_QWORD *)(v547 + 880) + 16);
  v336 = (v332 + 16) & ~v332;
  v470 = (*(_QWORD *)(v547 + 1128) + v336 + 7) & 0xFFFFFFFFFFFFFFF8;
  v474 = *(_QWORD *)(v547 + 872);
  v337 = (v470 + 15) & 0xFFFFFFFFFFFFFFF8;
  v338 = (v337 + 15) & 0xFFFFFFFFFFFFFFF8;
  v445 = v332 | 7;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v547 + 1312))(v333, *(unsigned int *)(v547 + 1464), v335);
  swift_beginAccess(v331, v547 + 312, 1, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v334 + 40))(v331, v333, v335);
  swift_beginAccess(v330 + 16, v547 + 432, 1, 0);
  v339 = *(void **)(v330 + 16);
  *(_QWORD *)(v330 + 16) = 0;

  v466(v462, v455, *(_QWORD *)typeb);
  v340 = swift_allocObject(&unk_10004E130, v338 + 8, v445);
  v480(v340 + v336, v462, *(_QWORD *)typeb);
  *(_QWORD *)(v340 + v470) = v330;
  *(_QWORD *)(v340 + v337) = aBlockd;
  *(_QWORD *)(v340 + v338) = v474;
  *(_QWORD *)(v547 + 48) = sub_100036C00;
  *(_QWORD *)(v547 + 56) = v340;
  *(_QWORD *)(v547 + 16) = _NSConcreteStackBlock;
  *(_QWORD *)(v547 + 24) = 1107296256;
  *(_QWORD *)(v547 + 32) = sub_10001FE70;
  *(_QWORD *)(v547 + 40) = &unk_10004E148;
  v341 = _Block_copy((const void *)(v547 + 16));
  v342 = *(_QWORD *)(v547 + 56);
  swift_retain(aBlockd);
  swift_retain(v330);
  swift_retain(v474);
  swift_release(v342);
  objc_msgSend(v523, "doWorkWithContext:reply:", v532, v341);
  _Block_release(v341);
  v343 = swift_beginAccess(v491, v547 + 456, 0, 0);
  if (*v491 != 1)
  {
    v343 = swift_beginAccess(*(_QWORD *)(v547 + 880) + 16, v547 + 504, 0, 0);
    v344 = *(_QWORD *)(v547 + 1336);
    if (*(_QWORD *)(v344 + 16))
      goto LABEL_55;
    v424 = *(void (**)(uint64_t, uint64_t))(v547 + 1384);
    v425 = *(_QWORD *)(v547 + 968);
    v426 = *(_QWORD *)(v547 + 928);
    v427 = *(_QWORD *)(v547 + 888);
    ContinuousClock.init()(v343);
    *(_QWORD *)(v547 + 616) = 500000000000000000;
    *(_QWORD *)(v547 + 624) = 0;
    *(_OWORD *)(v547 + 552) = 0u;
    *v450 = 1;
    v428 = sub_10000228C(&qword_100051888, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v427, v428);
    v429 = sub_10000228C(&qword_100051890, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v547 + 616, v426, v429);
    v424(v425, v426);
    v430 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    *(_QWORD *)(v547 + 1408) = v430;
    *v430 = v547;
    v430[1] = sub_100031EE0;
    v236 = *(_QWORD *)(v547 + 888);
    v238 = *(_QWORD *)(v547 + 952);
    v237 = v547 + 552;
    v239 = v428;
    return dispatch thunk of Clock.sleep(until:tolerance:)(v238, v237, v236, v239);
  }
  v344 = *(_QWORD *)(v547 + 1336);
LABEL_55:
  v345 = *(void (**)(uint64_t, uint64_t))(v547 + 1384);
  v346 = *(_QWORD *)(v547 + 968);
  v347 = *(_QWORD *)(v547 + 928);
  static ContinuousClock.now.getter(v343);
  v348 = ContinuousClock.Instant.duration(to:)(v346);
  v350 = v349;
  v345(v346, v347);
  v351 = *(void **)(v344 + 16);
  v352 = *(void (**)(_QWORD, uint64_t, uint64_t))(v547 + 1280);
  v353 = *(_QWORD *)(v547 + 1112);
  v354 = *(_QWORD *)(v547 + 864);
  if (v351)
  {
    v352(*(_QWORD *)(v547 + 1152), v354, v353);
    v544 = v351;
    v355 = Logger.logObject.getter(v544);
    v356 = static os_log_type_t.info.getter(v355);
    v357 = os_log_type_enabled(v355, v356);
    v358 = *(void (**)(uint64_t, uint64_t))(v547 + 1360);
    v359 = *(_QWORD *)(v547 + 1152);
    v360 = *(_QWORD *)(v547 + 1112);
    v447 = v351;
    if (v357)
    {
      v361 = swift_slowAlloc(32, -1);
      v524 = (_QWORD *)swift_slowAlloc(8, -1);
      v538 = swift_slowAlloc(64, -1);
      v548[0] = v538;
      *(_DWORD *)v361 = 136315650;
      v362 = MLHostTask.name.getter(v538);
      v516 = v356;
      v364 = v363;
      *v443 = sub_100008204(v362, v363, v548);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v443, v547 + 776, v361 + 4, v361 + 12);
      swift_bridgeObjectRelease(v364);
      v358(v359, v360);
      *(_WORD *)(v361 + 12) = 2080;
      v365 = Duration.description.getter(v348, v350);
      v367 = v366;
      *(_QWORD *)(v547 + 776) = sub_100008204(v365, v366, v548);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 776, v547 + 784, v361 + 14, v361 + 22);
      swift_bridgeObjectRelease(v367);
      *(_WORD *)(v361 + 22) = 2112;
      *(_QWORD *)(v547 + 784) = v544;
      v368 = v544;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 784, v435, v361 + 24, v361 + 32);
      *v524 = v351;

      _os_log_impl((void *)&_mh_execute_header, v355, v516, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v361, 0x20u);
      v369 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v524, 1, v369);
      swift_slowDealloc(v524, -1, -1);
      swift_arrayDestroy(v538, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v538, -1, -1);
      swift_slowDealloc(v361, -1, -1);
    }
    else
    {
      v358(v359, v360);

    }
    v386 = *(uint64_t (**)(uint64_t, uint64_t))(v547 + 1376);
    v387 = *(_QWORD *)(v547 + 1304);
    v388 = *(_QWORD *)(v547 + 1000);
    v389 = *(_QWORD *)(v547 + 992);
    v390 = *(_QWORD *)(v547 + 984);
    v392 = MLHostTask.name.getter(v391);
    v394 = v393;
    v395 = *(void (**)(uint64_t, uint64_t, uint64_t))(v389 + 16);
    v395(v388, v387, v390);
    sub_100012EC4(v392, v394, v388);
    swift_bridgeObjectRelease(v394);
    v396 = v386(v388, v390);
    v2 = v547;
    v397 = MLHostTask.name.getter(v396);
    v399 = v398;
    sub_100012BF4(v397, v398);
    v400 = swift_bridgeObjectRelease(v399);
    v401 = MLHostResult.status.getter(v400);
    v402 = MLHostResultStatus.rawValue.getter(v401);
    v403 = MLHostResultStatus.rawValue.getter(1);
    v404 = *(void (**)(uint64_t, uint64_t))(v547 + 1384);
    v405 = *(_QWORD *)(v547 + 1344);
    v406 = *(_QWORD *)(v547 + 1336);
    if (v402 == v403)
    {
      v407 = *(void **)(v547 + 1328);
      v408 = *(_QWORD *)(v547 + 1320);
      v404(*(_QWORD *)(v547 + 976), *(_QWORD *)(v547 + 928));

      swift_unknownObjectRelease(v408);
    }
    else
    {
      v517 = *(void (**)(uint64_t, uint64_t))(v547 + 1376);
      v525 = *(void **)(v547 + 1328);
      v409 = *(_QWORD *)(v547 + 1304);
      v410 = *(_QWORD *)(v547 + 1000);
      v411 = *(_QWORD *)(v547 + 984);
      v539 = *(_QWORD *)(v547 + 976);
      v546 = *(_QWORD *)(v547 + 1320);
      v533 = *(_QWORD *)(v547 + 928);
      v509 = objc_msgSend(*(id *)(v547 + 1272), "processIdentifier");
      v548[0] = 0;
      v548[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      v412 = v548[1];
      *(_QWORD *)(v547 + 648) = v548[0];
      *(_QWORD *)(v547 + 656) = v412;
      v413._countAndFlagsBits = 0x206B736154;
      v413._object = (void *)0xE500000000000000;
      String.append(_:)(v413);
      v415._countAndFlagsBits = MLHostTask.name.getter(v414);
      v416 = v415._object;
      String.append(_:)(v415);
      swift_bridgeObjectRelease(v416);
      v417._countAndFlagsBits = 0xD00000000000001CLL;
      v417._object = (void *)0x8000000100042530;
      String.append(_:)(v417);
      v395(v410, v409, v411);
      _print_unlocked<A, B>(_:_:)(v410, v547 + 648, v411, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      v517(v410, v411);
      v418._countAndFlagsBits = 46;
      v418._object = (void *)0xE100000000000000;
      v2 = v547;
      String.append(_:)(v418);
      v419 = *(_QWORD *)(v547 + 656);
      sub_10002D87C(v509, *(_QWORD *)(v2 + 648), *(_QWORD *)(v2 + 656));

      swift_bridgeObjectRelease(v419);
      swift_unknownObjectRelease(v546);
      v404(v539, v533);
    }
    swift_release(v405);
    swift_release(v406);
    v420 = *(void **)(v2 + 1272);
    v421 = *(_QWORD *)(v2 + 1256);
    v422 = *(_QWORD *)(v2 + 1248);
    v423 = *(_QWORD *)(v2 + 1240);
    swift_release(*(_QWORD *)(v2 + 1296));
    objc_msgSend(v420, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v422 + 8))(v421, v423);
    goto LABEL_20;
  }
  v545 = v348;
  v370 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v352)(*(_QWORD *)(v547 + 1144), v354, v353);
  v371 = Logger.logObject.getter(v370);
  v372 = static os_log_type_t.info.getter(v371);
  v373 = os_log_type_enabled(v371, v372);
  v374 = *(void (**)(uint64_t, uint64_t))(v547 + 1360);
  v375 = *(_QWORD *)(v547 + 1144);
  v376 = *(_QWORD *)(v547 + 1112);
  if (v373)
  {
    v377 = swift_slowAlloc(22, -1);
    v378 = swift_slowAlloc(64, -1);
    v548[0] = v378;
    *(_DWORD *)v377 = 136315394;
    v379 = MLHostTask.name.getter(v378);
    v381 = v380;
    *v439 = sub_100008204(v379, v380, v548);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v439, v547 + 752, v377 + 4, v377 + 12);
    v382 = v381;
    v220 = (_QWORD *)v547;
    swift_bridgeObjectRelease(v382);
    v374(v375, v376);
    *(_WORD *)(v377 + 12) = 2080;
    v383 = Duration.description.getter(v545, v350);
    v385 = v384;
    *(_QWORD *)(v547 + 752) = sub_100008204(v383, v384, v548);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v547 + 752, v513, v377 + 14, v377 + 22);
    swift_bridgeObjectRelease(v385);
    _os_log_impl((void *)&_mh_execute_header, v371, v372, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v377, 0x16u);
    swift_arrayDestroy(v378, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v378, -1, -1);
    swift_slowDealloc(v377, -1, -1);
  }
  else
  {
    v374(*(_QWORD *)(v547 + 1144), *(_QWORD *)(v547 + 1112));
  }

  v431 = (void *)v220[165];
  static ContinuousClock.now.getter(v432);
  ContinuousClock.init()(objc_msgSend(v431, "doStop"));
  v433 = dword_100051898;
  v434 = (_QWORD *)swift_task_alloc(unk_10005189C);
  v220[174] = v434;
  *v434 = v220;
  v434[1] = sub_100030E58;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100051898 + v433))(5000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_100030E58()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 1392);
  *(_QWORD *)(*(_QWORD *)v1 + 1400) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(_QWORD, _QWORD))(v2[112] + 8))(v2[115], v2[111]);
  if (v0)
    v4 = sub_1000316C0;
  else
    v4 = sub_100030F1C;
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100030F1C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, _QWORD, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  Swift::String v35;
  uint64_t v36;
  Swift::String v37;
  void *object;
  Swift::String v39;
  Swift::String v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v93;
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
  void (*v105)(uint64_t, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t, uint64_t);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124[4];

  v1 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1384);
  v2 = *(_QWORD *)(v0 + 1336);
  v3 = *(_QWORD *)(v0 + 968);
  v4 = *(_QWORD *)(v0 + 928);
  static ContinuousClock.now.getter();
  v5 = ContinuousClock.Instant.duration(to:)(v3);
  v117 = v6;
  v120 = v5;
  v7 = v1(v3, v4);
  v8 = *(void **)(v2 + 16);
  v9 = *(void (**)(uint64_t, uint64_t))(v0 + 1376);
  v10 = *(_QWORD *)(v0 + 1000);
  if (v8)
  {
    v11 = *(_QWORD *)(v0 + 1304);
    v12 = *(_QWORD *)(v0 + 992);
    v13 = *(_QWORD *)(v0 + 984);
    v113 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1376);
    v14 = v8;
    v15 = MLHostTask.name.getter(v14);
    v17 = v16;
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    v18(v10, v11, v13);
    sub_100012EC4(v15, v17, v10);
    swift_bridgeObjectRelease(v17);
    v19 = v113(v10, v13);
    v20 = MLHostTask.name.getter(v19);
    v22 = v21;
    sub_100012BF4(v20, v21);
    v23 = swift_bridgeObjectRelease(v22);
    v24 = MLHostResult.status.getter(v23);
    v25 = MLHostResultStatus.rawValue.getter(v24);
    if (v25 == MLHostResultStatus.rawValue.getter(1))
    {

    }
    else
    {
      v114 = *(void (**)(uint64_t, uint64_t))(v0 + 1376);
      v31 = *(_QWORD *)(v0 + 1304);
      v32 = *(_QWORD *)(v0 + 1000);
      v33 = *(_QWORD *)(v0 + 984);
      v34 = objc_msgSend(*(id *)(v0 + 1272), "processIdentifier");
      v124[0] = 0;
      v124[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      *(_QWORD *)(v0 + 600) = 0;
      *(_QWORD *)(v0 + 608) = 0xE000000000000000;
      v35._countAndFlagsBits = 0x206B736154;
      v35._object = (void *)0xE500000000000000;
      String.append(_:)(v35);
      v37._countAndFlagsBits = MLHostTask.name.getter(v36);
      object = v37._object;
      String.append(_:)(v37);
      swift_bridgeObjectRelease(object);
      v39._object = (void *)0x8000000100042530;
      v39._countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v39);
      v18(v32, v31, v33);
      _print_unlocked<A, B>(_:_:)(v32, v0 + 600, v33, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      v114(v32, v33);
      v40._countAndFlagsBits = 46;
      v40._object = (void *)0xE100000000000000;
      String.append(_:)(v40);
      v41 = *(_QWORD *)(v0 + 608);
      sub_10002D87C((uint64_t)v34, *(_QWORD *)(v0 + 600), v41);

      swift_bridgeObjectRelease(v41);
    }
  }
  else
  {
    v26 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 1312);
    v27 = *(_QWORD *)(v0 + 984);
    v28 = MLHostTask.name.getter(v7);
    v30 = v29;
    v26(v10, enum case for TaskStatus.taskDeferred(_:), v27);
    sub_100012EC4(v28, v30, v10);
    swift_bridgeObjectRelease(v30);
    v9(v10, v27);
  }
  v42 = *(_QWORD *)(v0 + 1336);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 1280))(*(_QWORD *)(v0 + 1136), *(_QWORD *)(v0 + 864), *(_QWORD *)(v0 + 1112));
  v43 = swift_retain_n(v42, 2);
  v44 = Logger.logObject.getter(v43);
  v45 = static os_log_type_t.info.getter(v44);
  if (os_log_type_enabled(v44, v45))
  {
    v105 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
    v108 = *(_QWORD *)(v0 + 1336);
    v46 = *(_QWORD *)(v0 + 1136);
    v47 = *(_QWORD *)(v0 + 1112);
    v48 = swift_slowAlloc(32, -1);
    v111 = (_QWORD *)swift_slowAlloc(8, -1);
    v115 = swift_slowAlloc(64, -1);
    v124[0] = v115;
    *(_DWORD *)v48 = 136315650;
    v49 = MLHostTask.name.getter(v115);
    v51 = v50;
    *(_QWORD *)(v0 + 704) = sub_100008204(v49, v50, v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 704, v0 + 712, v48 + 4, v48 + 12);
    swift_bridgeObjectRelease(v51);
    v105(v46, v47);
    *(_WORD *)(v48 + 12) = 2080;
    v52 = Duration.description.getter(v120, v117);
    v54 = v53;
    *(_QWORD *)(v0 + 712) = sub_100008204(v52, v53, v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 712, v0 + 720, v48 + 14, v48 + 22);
    swift_bridgeObjectRelease(v54);
    *(_WORD *)(v48 + 22) = 2112;
    v55 = *(void **)(v108 + 16);
    if (v55)
    {
      *(_QWORD *)(v0 + 728) = v55;
      v56 = v55;
      v57 = v0 + 728;
      v58 = v0 + 736;
      v59 = v48 + 24;
      v60 = v48 + 32;
    }
    else
    {
      v60 = v48 + 32;
      *(_QWORD *)(v0 + 720) = 0;
      v57 = v0 + 720;
      v58 = v0 + 728;
      v59 = v48 + 24;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v57, v58, v59, v60);
    v69 = *(void (**)(uint64_t, uint64_t))(v0 + 1384);
    v70 = *(_QWORD *)(v0 + 1336);
    v71 = *(void **)(v0 + 1328);
    v72 = *(_QWORD *)(v0 + 1320);
    v118 = *(_QWORD *)(v0 + 960);
    v122 = *(_QWORD *)(v0 + 976);
    v73 = *(_QWORD *)(v0 + 928);
    *v111 = v55;
    swift_release_n(v70, 2);
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v48, 0x20u);
    v74 = sub_100007800(&qword_100051288);
    swift_arrayDestroy(v111, 1, v74);
    swift_slowDealloc(v111, -1, -1);
    swift_arrayDestroy(v115, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v115, -1, -1);
    swift_slowDealloc(v48, -1, -1);

    swift_unknownObjectRelease(v72);
    v69(v118, v73);
    v69(v122, v73);
  }
  else
  {
    v61 = *(void (**)(uint64_t, uint64_t))(v0 + 1384);
    v62 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
    v63 = *(_QWORD *)(v0 + 1336);
    v64 = *(_QWORD *)(v0 + 1320);
    v65 = *(_QWORD *)(v0 + 1136);
    v66 = *(_QWORD *)(v0 + 1112);
    v121 = *(_QWORD *)(v0 + 976);
    v67 = *(_QWORD *)(v0 + 960);
    v68 = *(_QWORD *)(v0 + 928);

    swift_unknownObjectRelease(v64);
    swift_release_n(v63, 2);
    v62(v65, v66);
    v61(v67, v68);
    v61(v121, v68);
  }
  v75 = *(_QWORD *)(v0 + 1344);
  v76 = *(_QWORD *)(v0 + 1336);
  v77 = *(_QWORD *)(v0 + 1296);
  v78 = *(void **)(v0 + 1272);
  v79 = *(_QWORD *)(v0 + 1256);
  v80 = *(_QWORD *)(v0 + 1248);
  v81 = *(_QWORD *)(v0 + 1240);
  v93 = *(void **)(v76 + 16);
  v82 = v93;
  swift_release(v75);
  swift_release(v76);
  swift_release(v77);
  objc_msgSend(v78, "invalidate");

  _AppExtensionProcess.invalidate()();
  (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v81);
  v83 = *(_QWORD *)(v0 + 1256);
  v84 = *(_QWORD *)(v0 + 1232);
  v85 = *(_QWORD *)(v0 + 1224);
  v86 = *(_QWORD *)(v0 + 1216);
  v87 = *(_QWORD *)(v0 + 1208);
  v88 = *(_QWORD *)(v0 + 1200);
  v89 = *(_QWORD *)(v0 + 1192);
  v90 = *(_QWORD *)(v0 + 1184);
  v91 = *(_QWORD *)(v0 + 1176);
  v94 = *(_QWORD *)(v0 + 1168);
  v95 = *(_QWORD *)(v0 + 1160);
  v96 = *(_QWORD *)(v0 + 1152);
  v97 = *(_QWORD *)(v0 + 1144);
  v98 = *(_QWORD *)(v0 + 1136);
  v99 = *(_QWORD *)(v0 + 1104);
  v100 = *(_QWORD *)(v0 + 1080);
  v101 = *(_QWORD *)(v0 + 1072);
  v102 = *(_QWORD *)(v0 + 1048);
  v103 = *(_QWORD *)(v0 + 1024);
  v104 = *(_QWORD *)(v0 + 1000);
  v106 = *(_QWORD *)(v0 + 976);
  v107 = *(_QWORD *)(v0 + 968);
  v109 = *(_QWORD *)(v0 + 960);
  v110 = *(_QWORD *)(v0 + 952);
  v112 = *(_QWORD *)(v0 + 944);
  v116 = *(_QWORD *)(v0 + 920);
  v119 = *(_QWORD *)(v0 + 912);
  v123 = *(_QWORD *)(v0 + 904);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 1264));
  swift_task_dealloc(v83);
  swift_task_dealloc(v84);
  swift_task_dealloc(v85);
  swift_task_dealloc(v86);
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  swift_task_dealloc(v98);
  swift_task_dealloc(v99);
  swift_task_dealloc(v100);
  swift_task_dealloc(v101);
  swift_task_dealloc(v102);
  swift_task_dealloc(v103);
  swift_task_dealloc(v104);
  swift_task_dealloc(v106);
  swift_task_dealloc(v107);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v112);
  swift_task_dealloc(v116);
  swift_task_dealloc(v119);
  swift_task_dealloc(v123);
  return (*(uint64_t (**)(void *))(v0 + 8))(v93);
}

uint64_t sub_1000316C0(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  Swift::String v41;
  uint64_t v42;
  Swift::String v43;
  void *object;
  Swift::String v45;
  Swift::String v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130[4];

  v2 = Logger.logObject.getter(a1);
  v3 = static os_log_type_t.error.getter();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v1 + 1400);
  if (v4)
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Task.sleep interrupted, skipping waiting for extension termination.", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }
  swift_errorRelease(v5);

  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 1384);
  v8 = *(_QWORD *)(v1 + 1336);
  v9 = *(_QWORD *)(v1 + 968);
  v10 = *(_QWORD *)(v1 + 928);
  static ContinuousClock.now.getter();
  v11 = ContinuousClock.Instant.duration(to:)(v9);
  v123 = v12;
  v126 = v11;
  v13 = v7(v9, v10);
  v14 = *(void **)(v8 + 16);
  v15 = *(void (**)(uint64_t, uint64_t))(v1 + 1376);
  v16 = *(_QWORD *)(v1 + 1000);
  if (v14)
  {
    v17 = *(_QWORD *)(v1 + 1304);
    v18 = *(_QWORD *)(v1 + 992);
    v19 = *(_QWORD *)(v1 + 984);
    v119 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 1376);
    v20 = v14;
    v21 = MLHostTask.name.getter(v20);
    v23 = v22;
    v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    v24(v16, v17, v19);
    sub_100012EC4(v21, v23, v16);
    swift_bridgeObjectRelease(v23);
    v25 = v119(v16, v19);
    v26 = MLHostTask.name.getter(v25);
    v28 = v27;
    sub_100012BF4(v26, v27);
    v29 = swift_bridgeObjectRelease(v28);
    v30 = MLHostResult.status.getter(v29);
    v31 = MLHostResultStatus.rawValue.getter(v30);
    if (v31 == MLHostResultStatus.rawValue.getter(1))
    {

    }
    else
    {
      v120 = *(void (**)(uint64_t, uint64_t))(v1 + 1376);
      v37 = *(_QWORD *)(v1 + 1304);
      v38 = *(_QWORD *)(v1 + 1000);
      v39 = *(_QWORD *)(v1 + 984);
      v40 = objc_msgSend(*(id *)(v1 + 1272), "processIdentifier");
      v130[0] = 0;
      v130[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      *(_QWORD *)(v1 + 600) = 0;
      *(_QWORD *)(v1 + 608) = 0xE000000000000000;
      v41._countAndFlagsBits = 0x206B736154;
      v41._object = (void *)0xE500000000000000;
      String.append(_:)(v41);
      v43._countAndFlagsBits = MLHostTask.name.getter(v42);
      object = v43._object;
      String.append(_:)(v43);
      swift_bridgeObjectRelease(object);
      v45._object = (void *)0x8000000100042530;
      v45._countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v45);
      v24(v38, v37, v39);
      _print_unlocked<A, B>(_:_:)(v38, v1 + 600, v39, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      v120(v38, v39);
      v46._countAndFlagsBits = 46;
      v46._object = (void *)0xE100000000000000;
      String.append(_:)(v46);
      v47 = *(_QWORD *)(v1 + 608);
      sub_10002D87C((uint64_t)v40, *(_QWORD *)(v1 + 600), v47);

      swift_bridgeObjectRelease(v47);
    }
  }
  else
  {
    v32 = *(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 1312);
    v33 = *(_QWORD *)(v1 + 984);
    v34 = MLHostTask.name.getter(v13);
    v36 = v35;
    v32(v16, enum case for TaskStatus.taskDeferred(_:), v33);
    sub_100012EC4(v34, v36, v16);
    swift_bridgeObjectRelease(v36);
    v15(v16, v33);
  }
  v48 = *(_QWORD *)(v1 + 1336);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v1 + 1280))(*(_QWORD *)(v1 + 1136), *(_QWORD *)(v1 + 864), *(_QWORD *)(v1 + 1112));
  v49 = swift_retain_n(v48, 2);
  v50 = Logger.logObject.getter(v49);
  v51 = static os_log_type_t.info.getter(v50);
  if (os_log_type_enabled(v50, v51))
  {
    v111 = *(void (**)(uint64_t, uint64_t))(v1 + 1360);
    v114 = *(_QWORD *)(v1 + 1336);
    v52 = *(_QWORD *)(v1 + 1136);
    v53 = *(_QWORD *)(v1 + 1112);
    v54 = swift_slowAlloc(32, -1);
    v117 = (_QWORD *)swift_slowAlloc(8, -1);
    v121 = swift_slowAlloc(64, -1);
    v130[0] = v121;
    *(_DWORD *)v54 = 136315650;
    v55 = MLHostTask.name.getter(v121);
    v57 = v56;
    *(_QWORD *)(v1 + 704) = sub_100008204(v55, v56, v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 704, v1 + 712, v54 + 4, v54 + 12);
    swift_bridgeObjectRelease(v57);
    v111(v52, v53);
    *(_WORD *)(v54 + 12) = 2080;
    v58 = Duration.description.getter(v126, v123);
    v60 = v59;
    *(_QWORD *)(v1 + 712) = sub_100008204(v58, v59, v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 712, v1 + 720, v54 + 14, v54 + 22);
    swift_bridgeObjectRelease(v60);
    *(_WORD *)(v54 + 22) = 2112;
    v61 = *(void **)(v114 + 16);
    if (v61)
    {
      *(_QWORD *)(v1 + 728) = v61;
      v62 = v61;
      v63 = v1 + 728;
      v64 = v1 + 736;
      v65 = v54 + 24;
      v66 = v54 + 32;
    }
    else
    {
      v66 = v54 + 32;
      *(_QWORD *)(v1 + 720) = 0;
      v63 = v1 + 720;
      v64 = v1 + 728;
      v65 = v54 + 24;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v63, v64, v65, v66);
    v75 = *(void (**)(uint64_t, uint64_t))(v1 + 1384);
    v76 = *(_QWORD *)(v1 + 1336);
    v77 = *(void **)(v1 + 1328);
    v78 = *(_QWORD *)(v1 + 1320);
    v124 = *(_QWORD *)(v1 + 960);
    v128 = *(_QWORD *)(v1 + 976);
    v79 = *(_QWORD *)(v1 + 928);
    *v117 = v61;
    swift_release_n(v76, 2);
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v54, 0x20u);
    v80 = sub_100007800(&qword_100051288);
    swift_arrayDestroy(v117, 1, v80);
    swift_slowDealloc(v117, -1, -1);
    swift_arrayDestroy(v121, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v121, -1, -1);
    swift_slowDealloc(v54, -1, -1);

    swift_unknownObjectRelease(v78);
    v75(v124, v79);
    v75(v128, v79);
  }
  else
  {
    v67 = *(void (**)(uint64_t, uint64_t))(v1 + 1384);
    v68 = *(void (**)(uint64_t, uint64_t))(v1 + 1360);
    v69 = *(_QWORD *)(v1 + 1336);
    v70 = *(_QWORD *)(v1 + 1320);
    v71 = *(_QWORD *)(v1 + 1136);
    v72 = *(_QWORD *)(v1 + 1112);
    v127 = *(_QWORD *)(v1 + 976);
    v73 = *(_QWORD *)(v1 + 960);
    v74 = *(_QWORD *)(v1 + 928);

    swift_unknownObjectRelease(v70);
    swift_release_n(v69, 2);
    v68(v71, v72);
    v67(v73, v74);
    v67(v127, v74);
  }
  v81 = *(_QWORD *)(v1 + 1344);
  v82 = *(_QWORD *)(v1 + 1336);
  v83 = *(_QWORD *)(v1 + 1296);
  v84 = *(void **)(v1 + 1272);
  v85 = *(_QWORD *)(v1 + 1256);
  v86 = *(_QWORD *)(v1 + 1248);
  v87 = *(_QWORD *)(v1 + 1240);
  v99 = *(void **)(v82 + 16);
  v88 = v99;
  swift_release(v81);
  swift_release(v82);
  swift_release(v83);
  objc_msgSend(v84, "invalidate");

  _AppExtensionProcess.invalidate()();
  (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v87);
  v89 = *(_QWORD *)(v1 + 1256);
  v90 = *(_QWORD *)(v1 + 1232);
  v91 = *(_QWORD *)(v1 + 1224);
  v92 = *(_QWORD *)(v1 + 1216);
  v93 = *(_QWORD *)(v1 + 1208);
  v94 = *(_QWORD *)(v1 + 1200);
  v95 = *(_QWORD *)(v1 + 1192);
  v96 = *(_QWORD *)(v1 + 1184);
  v97 = *(_QWORD *)(v1 + 1176);
  v100 = *(_QWORD *)(v1 + 1168);
  v101 = *(_QWORD *)(v1 + 1160);
  v102 = *(_QWORD *)(v1 + 1152);
  v103 = *(_QWORD *)(v1 + 1144);
  v104 = *(_QWORD *)(v1 + 1136);
  v105 = *(_QWORD *)(v1 + 1104);
  v106 = *(_QWORD *)(v1 + 1080);
  v107 = *(_QWORD *)(v1 + 1072);
  v108 = *(_QWORD *)(v1 + 1048);
  v109 = *(_QWORD *)(v1 + 1024);
  v110 = *(_QWORD *)(v1 + 1000);
  v112 = *(_QWORD *)(v1 + 976);
  v113 = *(_QWORD *)(v1 + 968);
  v115 = *(_QWORD *)(v1 + 960);
  v116 = *(_QWORD *)(v1 + 952);
  v118 = *(_QWORD *)(v1 + 944);
  v122 = *(_QWORD *)(v1 + 920);
  v125 = *(_QWORD *)(v1 + 912);
  v129 = *(_QWORD *)(v1 + 904);
  swift_unknownObjectRelease(*(_QWORD *)(v1 + 1264));
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  swift_task_dealloc(v100);
  swift_task_dealloc(v101);
  swift_task_dealloc(v102);
  swift_task_dealloc(v103);
  swift_task_dealloc(v104);
  swift_task_dealloc(v105);
  swift_task_dealloc(v106);
  swift_task_dealloc(v107);
  swift_task_dealloc(v108);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v112);
  swift_task_dealloc(v113);
  swift_task_dealloc(v115);
  swift_task_dealloc(v116);
  swift_task_dealloc(v118);
  swift_task_dealloc(v122);
  swift_task_dealloc(v125);
  swift_task_dealloc(v129);
  return (*(uint64_t (**)(void *))(v1 + 8))(v99);
}

uint64_t sub_100031EE0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 1408);
  *(_QWORD *)(*v1 + 1416) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 1384))(*(_QWORD *)(v2 + 952), *(_QWORD *)(v2 + 928));
    v4 = sub_100032A10;
  }
  else
  {
    v5 = *(void (**)(uint64_t, uint64_t))(v2 + 1384);
    v6 = *(_QWORD *)(v2 + 952);
    v7 = *(_QWORD *)(v2 + 928);
    v8 = *(_QWORD *)(v2 + 912);
    v9 = *(_QWORD *)(v2 + 896);
    v10 = *(_QWORD *)(v2 + 888);
    v5(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    v4 = sub_100031FCC;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100031FCC()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void (*v9)(_QWORD, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  BOOL v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  BOOL v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t, os_log_t);
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  Swift::String v69;
  uint64_t v70;
  Swift::String v71;
  void *object;
  Swift::String v73;
  Swift::String v74;
  uint64_t v75;
  void *v76;
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
  void (*v90)(uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  void *v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unsigned int v114;
  uint64_t v115;
  void (*type)(uint64_t, uint64_t);
  os_log_type_t typea[8];
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;

  v1 = *(_QWORD *)(v0 + 1336);
  if (*(_BYTE *)(*(_QWORD *)(v0 + 880) + 16) == 1 || *(_QWORD *)(v1 + 16))
  {
    v2 = *(void (**)(uint64_t, uint64_t))(v0 + 1384);
    v3 = *(_QWORD *)(v0 + 968);
    v4 = *(_QWORD *)(v0 + 928);
    static ContinuousClock.now.getter();
    v5 = ContinuousClock.Instant.duration(to:)(v3);
    v7 = v6;
    v2(v3, v4);
    v8 = *(void **)(v1 + 16);
    v9 = *(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 1280);
    v10 = *(_QWORD *)(v0 + 1112);
    v11 = *(_QWORD *)(v0 + 864);
    if (v8)
    {
      v9(*(_QWORD *)(v0 + 1152), v11, v10);
      v12 = v8;
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.info.getter(v13);
      v15 = os_log_type_enabled(v13, v14);
      v16 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
      v17 = *(_QWORD *)(v0 + 1152);
      v18 = *(_QWORD *)(v0 + 1112);
      v128 = v8;
      if (v15)
      {
        log = v13;
        v19 = swift_slowAlloc(32, -1);
        v118 = (_QWORD *)swift_slowAlloc(8, -1);
        v125 = swift_slowAlloc(64, -1);
        v132 = v125;
        *(_DWORD *)v19 = 136315650;
        v20 = MLHostTask.name.getter(v125);
        v22 = v21;
        *(_QWORD *)(v0 + 768) = sub_100008204(v20, v21, &v132);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 768, v0 + 776, v19 + 4, v19 + 12);
        swift_bridgeObjectRelease(v22);
        v16(v17, v18);
        *(_WORD *)(v19 + 12) = 2080;
        v23 = Duration.description.getter(v5, v7);
        v25 = v24;
        *(_QWORD *)(v0 + 776) = sub_100008204(v23, v24, &v132);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 776, v0 + 784, v19 + 14, v19 + 22);
        swift_bridgeObjectRelease(v25);
        *(_WORD *)(v19 + 22) = 2112;
        *(_QWORD *)(v0 + 784) = v12;
        v26 = v12;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 784, v0 + 792, v19 + 24, v19 + 32);
        *v118 = v128;

        _os_log_impl((void *)&_mh_execute_header, log, v14, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v19, 0x20u);
        v27 = sub_100007800(&qword_100051288);
        swift_arrayDestroy(v118, 1, v27);
        swift_slowDealloc(v118, -1, -1);
        swift_arrayDestroy(v125, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v125, -1, -1);
        swift_slowDealloc(v19, -1, -1);

      }
      else
      {
        v16(v17, v18);

      }
      v43 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1376);
      v44 = *(_QWORD *)(v0 + 1304);
      v45 = *(_QWORD *)(v0 + 1000);
      v46 = *(_QWORD *)(v0 + 992);
      v47 = *(_QWORD *)(v0 + 984);
      v48 = MLHostTask.name.getter(v28);
      v50 = v49;
      v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16);
      v51(v45, v44, v47);
      sub_100012EC4(v48, v50, v45);
      swift_bridgeObjectRelease(v50);
      v52 = v43(v45, v47);
      v53 = MLHostTask.name.getter(v52);
      v55 = v54;
      sub_100012BF4(v53, v54);
      v56 = swift_bridgeObjectRelease(v55);
      v57 = MLHostResult.status.getter(v56);
      v58 = MLHostResultStatus.rawValue.getter(v57);
      v59 = MLHostResultStatus.rawValue.getter(1);
      v60 = *(void (**)(uint64_t, os_log_t))(v0 + 1384);
      if (v58 == v59)
      {
        v61 = *(_QWORD *)(v0 + 1344);
        v62 = *(_QWORD *)(v0 + 1336);
        v63 = *(void **)(v0 + 1328);
        v64 = *(_QWORD *)(v0 + 1320);
        v60(*(_QWORD *)(v0 + 976), *(os_log_t *)(v0 + 928));
        swift_unknownObjectRelease(v64);

      }
      else
      {
        type = *(void (**)(uint64_t, uint64_t))(v0 + 1376);
        v112 = *(_QWORD *)(v0 + 1344);
        v62 = *(_QWORD *)(v0 + 1336);
        v130 = *(void **)(v0 + 1328);
        v119 = *(_QWORD *)(v0 + 1320);
        v65 = *(_QWORD *)(v0 + 1304);
        v66 = *(_QWORD *)(v0 + 1000);
        v67 = *(_QWORD *)(v0 + 984);
        v126 = *(_QWORD *)(v0 + 976);
        logb = *(os_log_t *)(v0 + 928);
        v114 = objc_msgSend(*(id *)(v0 + 1272), "processIdentifier");
        v132 = 0;
        v133 = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        v68 = v133;
        *(_QWORD *)(v0 + 648) = v132;
        *(_QWORD *)(v0 + 656) = v68;
        v69._countAndFlagsBits = 0x206B736154;
        v69._object = (void *)0xE500000000000000;
        String.append(_:)(v69);
        v71._countAndFlagsBits = MLHostTask.name.getter(v70);
        object = v71._object;
        String.append(_:)(v71);
        swift_bridgeObjectRelease(object);
        v73._object = (void *)0x8000000100042530;
        v73._countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v73);
        v51(v66, v65, v67);
        v61 = v112;
        _print_unlocked<A, B>(_:_:)(v66, v0 + 648, v67, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        type(v66, v67);
        v74._countAndFlagsBits = 46;
        v74._object = (void *)0xE100000000000000;
        String.append(_:)(v74);
        v75 = *(_QWORD *)(v0 + 656);
        sub_10002D87C(v114, *(_QWORD *)(v0 + 648), v75);
        swift_unknownObjectRelease(v119);
        swift_bridgeObjectRelease(v75);

        v60(v126, logb);
      }
      swift_release(v62);
      swift_release(v61);
      v76 = *(void **)(v0 + 1272);
      v77 = *(_QWORD *)(v0 + 1256);
      v78 = *(_QWORD *)(v0 + 1248);
      v79 = *(_QWORD *)(v0 + 1240);
      swift_release(*(_QWORD *)(v0 + 1296));
      objc_msgSend(v76, "invalidate");

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v79);
      v80 = *(_QWORD *)(v0 + 1256);
      v81 = *(_QWORD *)(v0 + 1232);
      v82 = *(_QWORD *)(v0 + 1224);
      v83 = *(_QWORD *)(v0 + 1216);
      v84 = *(_QWORD *)(v0 + 1208);
      v85 = *(_QWORD *)(v0 + 1200);
      v86 = *(_QWORD *)(v0 + 1192);
      v87 = *(_QWORD *)(v0 + 1184);
      v88 = *(_QWORD *)(v0 + 1176);
      v100 = *(_QWORD *)(v0 + 1168);
      v101 = *(_QWORD *)(v0 + 1160);
      v102 = *(_QWORD *)(v0 + 1152);
      v103 = *(_QWORD *)(v0 + 1144);
      v104 = *(_QWORD *)(v0 + 1136);
      v105 = *(_QWORD *)(v0 + 1104);
      v106 = *(_QWORD *)(v0 + 1080);
      v107 = *(_QWORD *)(v0 + 1072);
      v108 = *(_QWORD *)(v0 + 1048);
      v109 = *(_QWORD *)(v0 + 1024);
      v110 = *(_QWORD *)(v0 + 1000);
      v111 = *(_QWORD *)(v0 + 976);
      v113 = *(_QWORD *)(v0 + 968);
      v115 = *(_QWORD *)(v0 + 960);
      *(_QWORD *)typea = *(_QWORD *)(v0 + 952);
      v120 = *(_QWORD *)(v0 + 944);
      logc = *(os_log_t *)(v0 + 920);
      v127 = *(_QWORD *)(v0 + 912);
      v131 = *(_QWORD *)(v0 + 904);
      swift_unknownObjectRelease(*(_QWORD *)(v0 + 1264));
      swift_task_dealloc(v80);
      swift_task_dealloc(v81);
      swift_task_dealloc(v82);
      swift_task_dealloc(v83);
      swift_task_dealloc(v84);
      swift_task_dealloc(v85);
      swift_task_dealloc(v86);
      swift_task_dealloc(v87);
      swift_task_dealloc(v88);
      swift_task_dealloc(v100);
      swift_task_dealloc(v101);
      swift_task_dealloc(v102);
      swift_task_dealloc(v103);
      swift_task_dealloc(v104);
      swift_task_dealloc(v105);
      swift_task_dealloc(v106);
      swift_task_dealloc(v107);
      swift_task_dealloc(v108);
      swift_task_dealloc(v109);
      swift_task_dealloc(v110);
      swift_task_dealloc(v111);
      swift_task_dealloc(v113);
      swift_task_dealloc(v115);
      swift_task_dealloc(*(_QWORD *)typea);
      swift_task_dealloc(v120);
      swift_task_dealloc(logc);
      swift_task_dealloc(v127);
      swift_task_dealloc(v131);
      return (*(uint64_t (**)(void *))(v0 + 8))(v128);
    }
    else
    {
      v29 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v9)(*(_QWORD *)(v0 + 1144), v11, v10);
      v30 = Logger.logObject.getter(v29);
      v31 = static os_log_type_t.info.getter(v30);
      v32 = os_log_type_enabled(v30, v31);
      v33 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
      v34 = *(_QWORD *)(v0 + 1144);
      v35 = *(_QWORD *)(v0 + 1112);
      if (v32)
      {
        v36 = swift_slowAlloc(22, -1);
        v129 = swift_slowAlloc(64, -1);
        v132 = v129;
        *(_DWORD *)v36 = 136315394;
        v37 = MLHostTask.name.getter(v129);
        loga = v7;
        v39 = v38;
        *(_QWORD *)(v0 + 744) = sub_100008204(v37, v38, &v132);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 744, v0 + 752, v36 + 4, v36 + 12);
        swift_bridgeObjectRelease(v39);
        v33(v34, v35);
        *(_WORD *)(v36 + 12) = 2080;
        v40 = Duration.description.getter(v5, loga);
        v42 = v41;
        *(_QWORD *)(v0 + 752) = sub_100008204(v40, v41, &v132);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 752, v0 + 760, v36 + 14, v36 + 22);
        swift_bridgeObjectRelease(v42);
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy(v129, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v129, -1, -1);
        swift_slowDealloc(v36, -1, -1);
      }
      else
      {
        v33(*(_QWORD *)(v0 + 1144), *(_QWORD *)(v0 + 1112));
      }

      v97 = *(void **)(v0 + 1320);
      static ContinuousClock.now.getter();
      ContinuousClock.init()(objc_msgSend(v97, "doStop"));
      v98 = dword_100051898;
      v99 = (_QWORD *)swift_task_alloc(unk_10005189C);
      *(_QWORD *)(v0 + 1392) = v99;
      *v99 = v0;
      v99[1] = sub_100030E58;
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100051898 + v98))(5000000000000000000, 0, 0, 0, 1);
    }
  }
  else
  {
    v90 = *(void (**)(uint64_t, uint64_t))(v0 + 1384);
    v91 = *(_QWORD *)(v0 + 968);
    v92 = *(_QWORD *)(v0 + 928);
    v93 = *(_QWORD *)(v0 + 888);
    ((void (*)(void))ContinuousClock.init())();
    *(_QWORD *)(v0 + 616) = 500000000000000000;
    *(_QWORD *)(v0 + 624) = 0;
    *(_OWORD *)(v0 + 552) = 0u;
    *(_BYTE *)(v0 + 568) = 1;
    v94 = sub_10000228C(&qword_100051888, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v93, v94);
    v95 = sub_10000228C(&qword_100051890, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v0 + 616, v92, v95);
    v90(v91, v92);
    v96 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    *(_QWORD *)(v0 + 1408) = v96;
    *v96 = v0;
    v96[1] = sub_100031EE0;
    return dispatch thunk of Clock.sleep(until:tolerance:)(*(_QWORD *)(v0 + 952), v0 + 552, *(_QWORD *)(v0 + 888), v94);
  }
}

uint64_t sub_100032A10()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void (*v13)(_QWORD, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  BOOL v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  BOOL v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, os_log_t);
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  Swift::String v73;
  uint64_t v74;
  Swift::String v75;
  void *object;
  Swift::String v77;
  Swift::String v78;
  uint64_t v79;
  void *v80;
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
  uint64_t v92;
  void *v94;
  uint64_t v95;
  _QWORD *v96;
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
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  uint64_t v112;
  void (*type)(uint64_t, uint64_t);
  os_log_type_t typea[8];
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;

  v1 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 896) + 8))(*(_QWORD *)(v0 + 912), *(_QWORD *)(v0 + 888));
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Task.sleep interrupted, skipping waiting for extension completion.", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }
  swift_errorRelease(*(_QWORD *)(v0 + 1416));

  v5 = *(void (**)(uint64_t, uint64_t))(v0 + 1384);
  v6 = *(_QWORD *)(v0 + 1336);
  v7 = *(_QWORD *)(v0 + 968);
  v8 = *(_QWORD *)(v0 + 928);
  static ContinuousClock.now.getter();
  v9 = ContinuousClock.Instant.duration(to:)(v7);
  v11 = v10;
  v5(v7, v8);
  v12 = *(void **)(v6 + 16);
  v13 = *(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 1280);
  v14 = *(_QWORD *)(v0 + 1112);
  v15 = *(_QWORD *)(v0 + 864);
  if (v12)
  {
    v13(*(_QWORD *)(v0 + 1152), v15, v14);
    v16 = v12;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.info.getter(v17);
    v19 = os_log_type_enabled(v17, v18);
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
    v21 = *(_QWORD *)(v0 + 1152);
    v22 = *(_QWORD *)(v0 + 1112);
    v125 = v12;
    if (v19)
    {
      log = v17;
      v23 = swift_slowAlloc(32, -1);
      v115 = (_QWORD *)swift_slowAlloc(8, -1);
      v122 = swift_slowAlloc(64, -1);
      v129 = v122;
      *(_DWORD *)v23 = 136315650;
      v24 = MLHostTask.name.getter(v122);
      v26 = v25;
      *(_QWORD *)(v0 + 768) = sub_100008204(v24, v25, &v129);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 768, v0 + 776, v23 + 4, v23 + 12);
      swift_bridgeObjectRelease(v26);
      v20(v21, v22);
      *(_WORD *)(v23 + 12) = 2080;
      v27 = Duration.description.getter(v9, v11);
      v29 = v28;
      *(_QWORD *)(v0 + 776) = sub_100008204(v27, v28, &v129);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 776, v0 + 784, v23 + 14, v23 + 22);
      swift_bridgeObjectRelease(v29);
      *(_WORD *)(v23 + 22) = 2112;
      *(_QWORD *)(v0 + 784) = v16;
      v30 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 784, v0 + 792, v23 + 24, v23 + 32);
      *v115 = v125;

      _os_log_impl((void *)&_mh_execute_header, log, v18, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v23, 0x20u);
      v31 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v115, 1, v31);
      swift_slowDealloc(v115, -1, -1);
      swift_arrayDestroy(v122, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v122, -1, -1);
      swift_slowDealloc(v23, -1, -1);

    }
    else
    {
      v20(v21, v22);

    }
    v47 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1376);
    v48 = *(_QWORD *)(v0 + 1304);
    v49 = *(_QWORD *)(v0 + 1000);
    v50 = *(_QWORD *)(v0 + 992);
    v51 = *(_QWORD *)(v0 + 984);
    v52 = MLHostTask.name.getter(v32);
    v54 = v53;
    v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
    v55(v49, v48, v51);
    sub_100012EC4(v52, v54, v49);
    swift_bridgeObjectRelease(v54);
    v56 = v47(v49, v51);
    v57 = MLHostTask.name.getter(v56);
    v59 = v58;
    sub_100012BF4(v57, v58);
    v60 = swift_bridgeObjectRelease(v59);
    v61 = MLHostResult.status.getter(v60);
    v62 = MLHostResultStatus.rawValue.getter(v61);
    v63 = MLHostResultStatus.rawValue.getter(1);
    v64 = *(void (**)(uint64_t, os_log_t))(v0 + 1384);
    if (v62 == v63)
    {
      v65 = *(_QWORD *)(v0 + 1344);
      v66 = *(_QWORD *)(v0 + 1336);
      v67 = *(void **)(v0 + 1328);
      v68 = *(_QWORD *)(v0 + 1320);
      v64(*(_QWORD *)(v0 + 976), *(os_log_t *)(v0 + 928));
      swift_unknownObjectRelease(v68);

    }
    else
    {
      type = *(void (**)(uint64_t, uint64_t))(v0 + 1376);
      v109 = *(_QWORD *)(v0 + 1344);
      v66 = *(_QWORD *)(v0 + 1336);
      v127 = *(void **)(v0 + 1328);
      v116 = *(_QWORD *)(v0 + 1320);
      v69 = *(_QWORD *)(v0 + 1304);
      v70 = *(_QWORD *)(v0 + 1000);
      v71 = *(_QWORD *)(v0 + 984);
      v123 = *(_QWORD *)(v0 + 976);
      logb = *(os_log_t *)(v0 + 928);
      v111 = objc_msgSend(*(id *)(v0 + 1272), "processIdentifier");
      v129 = 0;
      v130 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      v72 = v130;
      *(_QWORD *)(v0 + 648) = v129;
      *(_QWORD *)(v0 + 656) = v72;
      v73._countAndFlagsBits = 0x206B736154;
      v73._object = (void *)0xE500000000000000;
      String.append(_:)(v73);
      v75._countAndFlagsBits = MLHostTask.name.getter(v74);
      object = v75._object;
      String.append(_:)(v75);
      swift_bridgeObjectRelease(object);
      v77._object = (void *)0x8000000100042530;
      v77._countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v77);
      v55(v70, v69, v71);
      v65 = v109;
      _print_unlocked<A, B>(_:_:)(v70, v0 + 648, v71, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      type(v70, v71);
      v78._countAndFlagsBits = 46;
      v78._object = (void *)0xE100000000000000;
      String.append(_:)(v78);
      v79 = *(_QWORD *)(v0 + 656);
      sub_10002D87C(v111, *(_QWORD *)(v0 + 648), v79);
      swift_unknownObjectRelease(v116);
      swift_bridgeObjectRelease(v79);

      v64(v123, logb);
    }
    swift_release(v66);
    swift_release(v65);
    v80 = *(void **)(v0 + 1272);
    v81 = *(_QWORD *)(v0 + 1256);
    v82 = *(_QWORD *)(v0 + 1248);
    v83 = *(_QWORD *)(v0 + 1240);
    swift_release(*(_QWORD *)(v0 + 1296));
    objc_msgSend(v80, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v81, v83);
    v84 = *(_QWORD *)(v0 + 1256);
    v85 = *(_QWORD *)(v0 + 1232);
    v86 = *(_QWORD *)(v0 + 1224);
    v87 = *(_QWORD *)(v0 + 1216);
    v88 = *(_QWORD *)(v0 + 1208);
    v89 = *(_QWORD *)(v0 + 1200);
    v90 = *(_QWORD *)(v0 + 1192);
    v91 = *(_QWORD *)(v0 + 1184);
    v92 = *(_QWORD *)(v0 + 1176);
    v97 = *(_QWORD *)(v0 + 1168);
    v98 = *(_QWORD *)(v0 + 1160);
    v99 = *(_QWORD *)(v0 + 1152);
    v100 = *(_QWORD *)(v0 + 1144);
    v101 = *(_QWORD *)(v0 + 1136);
    v102 = *(_QWORD *)(v0 + 1104);
    v103 = *(_QWORD *)(v0 + 1080);
    v104 = *(_QWORD *)(v0 + 1072);
    v105 = *(_QWORD *)(v0 + 1048);
    v106 = *(_QWORD *)(v0 + 1024);
    v107 = *(_QWORD *)(v0 + 1000);
    v108 = *(_QWORD *)(v0 + 976);
    v110 = *(_QWORD *)(v0 + 968);
    v112 = *(_QWORD *)(v0 + 960);
    *(_QWORD *)typea = *(_QWORD *)(v0 + 952);
    v117 = *(_QWORD *)(v0 + 944);
    logc = *(os_log_t *)(v0 + 920);
    v124 = *(_QWORD *)(v0 + 912);
    v128 = *(_QWORD *)(v0 + 904);
    swift_unknownObjectRelease(*(_QWORD *)(v0 + 1264));
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v88);
    swift_task_dealloc(v89);
    swift_task_dealloc(v90);
    swift_task_dealloc(v91);
    swift_task_dealloc(v92);
    swift_task_dealloc(v97);
    swift_task_dealloc(v98);
    swift_task_dealloc(v99);
    swift_task_dealloc(v100);
    swift_task_dealloc(v101);
    swift_task_dealloc(v102);
    swift_task_dealloc(v103);
    swift_task_dealloc(v104);
    swift_task_dealloc(v105);
    swift_task_dealloc(v106);
    swift_task_dealloc(v107);
    swift_task_dealloc(v108);
    swift_task_dealloc(v110);
    swift_task_dealloc(v112);
    swift_task_dealloc(*(_QWORD *)typea);
    swift_task_dealloc(v117);
    swift_task_dealloc(logc);
    swift_task_dealloc(v124);
    swift_task_dealloc(v128);
    return (*(uint64_t (**)(void *))(v0 + 8))(v125);
  }
  else
  {
    v33 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v13)(*(_QWORD *)(v0 + 1144), v15, v14);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.info.getter(v34);
    v36 = os_log_type_enabled(v34, v35);
    v37 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
    v38 = *(_QWORD *)(v0 + 1144);
    v39 = *(_QWORD *)(v0 + 1112);
    if (v36)
    {
      v40 = swift_slowAlloc(22, -1);
      v126 = swift_slowAlloc(64, -1);
      v129 = v126;
      *(_DWORD *)v40 = 136315394;
      v41 = MLHostTask.name.getter(v126);
      loga = v11;
      v43 = v42;
      *(_QWORD *)(v0 + 744) = sub_100008204(v41, v42, &v129);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 744, v0 + 752, v40 + 4, v40 + 12);
      swift_bridgeObjectRelease(v43);
      v37(v38, v39);
      *(_WORD *)(v40 + 12) = 2080;
      v44 = Duration.description.getter(v9, loga);
      v46 = v45;
      *(_QWORD *)(v0 + 752) = sub_100008204(v44, v45, &v129);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 752, v0 + 760, v40 + 14, v40 + 22);
      swift_bridgeObjectRelease(v46);
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy(v126, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v126, -1, -1);
      swift_slowDealloc(v40, -1, -1);
    }
    else
    {
      v37(*(_QWORD *)(v0 + 1144), *(_QWORD *)(v0 + 1112));
    }

    v94 = *(void **)(v0 + 1320);
    static ContinuousClock.now.getter();
    ContinuousClock.init()(objc_msgSend(v94, "doStop"));
    v95 = dword_100051898;
    v96 = (_QWORD *)swift_task_alloc(unk_10005189C);
    *(_QWORD *)(v0 + 1392) = v96;
    *v96 = v0;
    v96[1] = sub_100030E58;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100051898 + v95))(5000000000000000000, 0, 0, 0, 1);
  }
}

uint64_t sub_100033398()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 1432);
  *(_QWORD *)(*v1 + 1440) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 1424))(*(_QWORD *)(v2 + 944), *(_QWORD *)(v2 + 928));
    v4 = sub_100034B38;
  }
  else
  {
    v5 = *(void (**)(uint64_t, uint64_t))(v2 + 1424);
    v6 = *(_QWORD *)(v2 + 944);
    v7 = *(_QWORD *)(v2 + 928);
    v8 = *(_QWORD *)(v2 + 904);
    v9 = *(_QWORD *)(v2 + 896);
    v10 = *(_QWORD *)(v2 + 888);
    v5(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    v4 = sub_100033484;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100033484(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  BOOL v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t (*v38)(_QWORD, uint64_t, uint64_t);
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  BOOL v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t, _QWORD, uint64_t);
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  Swift::String v65;
  void *object;
  Swift::String v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  BOOL v72;
  void (*v73)(uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t, _QWORD, uint64_t);
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  Swift::String v99;
  void *v100;
  Swift::String v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(uint64_t, uint64_t);
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void (*v126)(_QWORD, uint64_t, uint64_t);
  uint64_t v127;
  uint64_t v128;
  id v129;
  NSObject *v130;
  os_log_type_t v131;
  BOOL v132;
  void (*v133)(uint64_t, uint64_t);
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  os_log_type_t v149;
  BOOL v150;
  void (*v151)(uint64_t, uint64_t);
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void (*v169)(uint64_t, uint64_t, uint64_t);
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void (*v178)(uint64_t, uint64_t);
  uint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  Swift::String v186;
  uint64_t v187;
  Swift::String v188;
  void *v189;
  Swift::String v190;
  Swift::String v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
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
  void (*v206)(uint64_t, uint64_t);
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  _QWORD *v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  _QWORD *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void (*v228)(uint64_t, uint64_t, uint64_t);
  uint64_t v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void (*v238)(uint64_t, uint64_t, uint64_t);
  uint64_t v239;
  unsigned __int8 *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  _BYTE *v246;
  uint64_t v247;
  void *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  os_log_t log;
  os_log_t loga;
  unsigned int logb;
  os_log_t logc;
  os_log_type_t type[8];
  os_log_type_t typea[8];
  void (*typeb)(uint64_t, uint64_t);
  os_log_type_t typec[8];
  void *aBlock;
  void *aBlocka;
  _QWORD *aBlockb;
  void *aBlockc;
  void *aBlockd;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  os_log_type_t v282;
  void *v283;
  uint64_t v284;
  void (*v285)(uint64_t, uint64_t);
  void (*v286)(uint64_t, uint64_t);
  void *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;

  v2 = *(_QWORD *)(v1 + 1344);
  if (*(_BYTE *)(*(_QWORD *)(v1 + 880) + 16) != 1 && *(_BYTE *)(v2 + 16) == 2)
  {
    v3 = *(_QWORD *)(v1 + 968);
    v4 = *(_QWORD *)(v1 + 936);
    v5 = *(_QWORD *)(v1 + 928);
    v6 = *(_QWORD *)(v1 + 888);
    ContinuousClock.init()(a1);
    *(_QWORD *)(v1 + 632) = 500000000000000000;
    *(_QWORD *)(v1 + 640) = 0;
    *(_OWORD *)(v1 + 576) = 0u;
    *(_BYTE *)(v1 + 592) = 1;
    v7 = sub_10000228C(&qword_100051888, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
    dispatch thunk of Clock.now.getter(v6, v7);
    v8 = sub_10000228C(&qword_100051890, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)(v1 + 632, v5, v8);
    v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    *(_QWORD *)(v1 + 1424) = v9;
    v9(v3, v5);
    v10 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
    *(_QWORD *)(v1 + 1432) = v10;
    *v10 = v1;
    v10[1] = sub_100033398;
    v11 = *(_QWORD *)(v1 + 888);
    v12 = v1 + 576;
    v13 = *(_QWORD *)(v1 + 944);
    v14 = v7;
    return dispatch thunk of Clock.sleep(until:tolerance:)(v13, v12, v11, v14);
  }
  v265 = v1 + 688;
  v16 = *(_QWORD *)(v1 + 968);
  v17 = *(_QWORD *)(v1 + 936);
  v18 = *(_QWORD *)(v1 + 928);
  ((void (*)(void))static ContinuousClock.now.getter)();
  v271 = ContinuousClock.Instant.duration(to:)(v16);
  v278 = v19;
  v20 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  *(_QWORD *)(v1 + 1384) = v20;
  v20(v16, v18);
  swift_beginAccess(v2 + 16, v1 + 480, 0, 0);
  v21 = *(unsigned __int8 *)(v2 + 16);
  v22 = *(_QWORD *)(v1 + 1112);
  v23 = *(_QWORD *)(v1 + 864);
  if (v21 == 2)
  {
    v285 = v20;
    v24 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v1 + 1280))(*(_QWORD *)(v1 + 1176), v23, v22);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.info.getter(v25);
    v27 = os_log_type_enabled(v25, v26);
    v28 = *(void (**)(uint64_t, uint64_t))(v1 + 1360);
    v29 = *(_QWORD *)(v1 + 1176);
    v30 = *(_QWORD *)(v1 + 1112);
    if (v27)
    {
      v240 = (unsigned __int8 *)(*(_QWORD *)(v1 + 880) + 16);
      v31 = swift_slowAlloc(28, -1);
      aBlock = (void *)swift_slowAlloc(64, -1);
      v289 = (uint64_t)aBlock;
      *(_DWORD *)v31 = 136315650;
      v32 = MLHostTask.name.getter(aBlock);
      v34 = v33;
      *(_QWORD *)(v1 + 760) = sub_100008204(v32, v33, &v289);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 760, v1 + 768, v31 + 4, v31 + 12);
      swift_bridgeObjectRelease(v34);
      v28(v29, v30);
      *(_WORD *)(v31 + 12) = 1024;
      swift_beginAccess(v240, v1 + 528, 0, 0);
      *(_DWORD *)(v1 + 1456) = *v240;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1456, v1 + 1460, v31 + 14, v31 + 18);
      *(_WORD *)(v31 + 18) = 2080;
      v35 = Duration.description.getter(v271, v278);
      v37 = v36;
      *(_QWORD *)(v1 + 688) = sub_100008204(v35, v36, &v289);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v265, v1 + 696, v31 + 20, v31 + 28);
      swift_bridgeObjectRelease(v37);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.", (uint8_t *)v31, 0x1Cu);
      swift_arrayDestroy(aBlock, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(aBlock, -1, -1);
      swift_slowDealloc(v31, -1, -1);
    }
    else
    {
      v28(*(_QWORD *)(v1 + 1176), *(_QWORD *)(v1 + 1112));
    }

    v54 = *(void (**)(uint64_t, uint64_t))(v1 + 1376);
    *(_QWORD *)type = *(_QWORD *)(v1 + 1336);
    aBlocka = *(void **)(v1 + 1344);
    v236 = *(_QWORD *)(v1 + 1320);
    v55 = *(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 1312);
    v248 = *(void **)(v1 + 1328);
    log = *(os_log_t *)(v1 + 1296);
    v56 = *(void **)(v1 + 1272);
    v266 = *(_QWORD *)(v1 + 1256);
    v272 = *(_QWORD *)(v1 + 1248);
    v279 = *(_QWORD *)(v1 + 1240);
    v57 = *(_QWORD *)(v1 + 1000);
    v58 = *(_QWORD *)(v1 + 984);
    v241 = *(_QWORD *)(v1 + 928);
    v244 = *(_QWORD *)(v1 + 976);
    v60 = MLHostTask.name.getter(v59);
    v62 = v61;
    v55(v57, enum case for TaskStatus.taskDeferred(_:), v58);
    sub_100012EC4(v60, v62, v57);
    swift_bridgeObjectRelease(v62);
    v54(v57, v58);
    v63 = objc_msgSend(v56, "processIdentifier");
    v289 = 0;
    v290 = 0xE000000000000000;
    _StringGuts.grow(_:)(37);
    v64 = swift_bridgeObjectRelease(v290);
    v289 = 0x206B736154;
    v290 = 0xE500000000000000;
    v65._countAndFlagsBits = MLHostTask.name.getter(v64);
    object = v65._object;
    String.append(_:)(v65);
    swift_bridgeObjectRelease(object);
    v67._countAndFlagsBits = 0xD00000000000001ELL;
    v67._object = (void *)0x80000001000424F0;
    String.append(_:)(v67);
    v68 = v290;
    sub_10002D87C((uint64_t)v63, v289, v290);
    swift_unknownObjectRelease(v236);
    swift_bridgeObjectRelease(v68);

    v285(v244, v241);
    swift_release(log);
    swift_release(*(_QWORD *)type);
    swift_release(aBlocka);
    objc_msgSend(v56, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v272 + 8))(v266, v279);
    v287 = 0;
LABEL_31:
    v197 = *(_QWORD *)(v1 + 1256);
    v198 = *(_QWORD *)(v1 + 1232);
    v199 = *(_QWORD *)(v1 + 1224);
    v200 = *(_QWORD *)(v1 + 1216);
    v201 = *(_QWORD *)(v1 + 1208);
    v202 = *(_QWORD *)(v1 + 1200);
    v203 = *(_QWORD *)(v1 + 1192);
    v204 = *(_QWORD *)(v1 + 1184);
    v205 = *(_QWORD *)(v1 + 1176);
    v218 = *(_QWORD *)(v1 + 1168);
    v220 = *(_QWORD *)(v1 + 1160);
    v221 = *(_QWORD *)(v1 + 1152);
    v223 = *(_QWORD *)(v1 + 1144);
    v225 = *(_QWORD *)(v1 + 1136);
    v227 = *(_QWORD *)(v1 + 1104);
    v229 = *(_QWORD *)(v1 + 1080);
    v232 = *(_QWORD *)(v1 + 1072);
    v235 = *(_QWORD *)(v1 + 1048);
    v239 = *(_QWORD *)(v1 + 1024);
    v243 = *(_QWORD *)(v1 + 1000);
    v247 = *(_QWORD *)(v1 + 976);
    v251 = *(_QWORD *)(v1 + 968);
    logc = *(os_log_t *)(v1 + 960);
    *(_QWORD *)typec = *(_QWORD *)(v1 + 952);
    aBlockd = *(void **)(v1 + 944);
    v270 = *(_QWORD *)(v1 + 920);
    v277 = *(_QWORD *)(v1 + 912);
    v284 = *(_QWORD *)(v1 + 904);
    swift_unknownObjectRelease(*(_QWORD *)(v1 + 1264));
    swift_task_dealloc(v197);
    swift_task_dealloc(v198);
    swift_task_dealloc(v199);
    swift_task_dealloc(v200);
    swift_task_dealloc(v201);
    swift_task_dealloc(v202);
    swift_task_dealloc(v203);
    swift_task_dealloc(v204);
    swift_task_dealloc(v205);
    swift_task_dealloc(v218);
    swift_task_dealloc(v220);
    swift_task_dealloc(v221);
    swift_task_dealloc(v223);
    swift_task_dealloc(v225);
    swift_task_dealloc(v227);
    swift_task_dealloc(v229);
    swift_task_dealloc(v232);
    swift_task_dealloc(v235);
    swift_task_dealloc(v239);
    swift_task_dealloc(v243);
    swift_task_dealloc(v247);
    swift_task_dealloc(v251);
    swift_task_dealloc(logc);
    swift_task_dealloc(*(_QWORD *)typec);
    swift_task_dealloc(aBlockd);
    swift_task_dealloc(v270);
    swift_task_dealloc(v277);
    swift_task_dealloc(v284);
    return (*(uint64_t (**)(void *))(v1 + 8))(v287);
  }
  v38 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v1 + 1280);
  if ((v21 & 1) == 0)
  {
    v286 = v20;
    v39 = v38(*(_QWORD *)(v1 + 1160), v23, v22);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.info.getter(v40);
    v42 = os_log_type_enabled(v40, v41);
    v43 = *(void (**)(uint64_t, uint64_t))(v1 + 1360);
    v44 = *(_QWORD *)(v1 + 1160);
    v45 = *(_QWORD *)(v1 + 1112);
    if (v42)
    {
      v46 = swift_slowAlloc(28, -1);
      v47 = swift_slowAlloc(64, -1);
      v289 = v47;
      *(_DWORD *)v46 = 136315650;
      v48 = MLHostTask.name.getter(v47);
      v50 = v49;
      *(_QWORD *)(v1 + 680) = sub_100008204(v48, v49, &v289);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 680, v265, v46 + 4, v46 + 12);
      swift_bridgeObjectRelease(v50);
      v43(v44, v45);
      *(_WORD *)(v46 + 12) = 1024;
      *(_DWORD *)(v1 + 1448) = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 1448, v1 + 1452, v46 + 14, v46 + 18);
      *(_WORD *)(v46 + 18) = 2080;
      v51 = Duration.description.getter(v271, v278);
      v53 = v52;
      *(_QWORD *)(v1 + 664) = sub_100008204(v51, v52, &v289);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 664, v1 + 672, v46 + 20, v46 + 28);
      swift_bridgeObjectRelease(v53);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v46, 0x1Cu);
      swift_arrayDestroy(v47, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v46, -1, -1);
    }
    else
    {
      v43(*(_QWORD *)(v1 + 1160), *(_QWORD *)(v1 + 1112));
    }

    v84 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 1376);
    v245 = *(void **)(v1 + 1328);
    v249 = *(_QWORD *)(v1 + 1336);
    v230 = *(_QWORD *)(v1 + 1320);
    v85 = *(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 1312);
    loga = *(os_log_t *)(v1 + 1296);
    *(_QWORD *)typea = *(_QWORD *)(v1 + 1344);
    v86 = *(void **)(v1 + 1272);
    v267 = *(_QWORD *)(v1 + 1256);
    v273 = *(_QWORD *)(v1 + 1248);
    v280 = *(_QWORD *)(v1 + 1240);
    v87 = *(_QWORD *)(v1 + 1000);
    v88 = *(_QWORD *)(v1 + 984);
    v233 = *(_QWORD *)(v1 + 928);
    v237 = *(_QWORD *)(v1 + 976);
    v90 = MLHostTask.name.getter(v89);
    v92 = v91;
    v85(v87, enum case for TaskStatus.taskFailed(_:), v88);
    sub_100012EC4(v90, v92, v87);
    swift_bridgeObjectRelease(v92);
    v93 = v84(v87, v88);
    v94 = MLHostTask.name.getter(v93);
    v96 = v95;
    sub_100012BF4(v94, v95);
    swift_bridgeObjectRelease(v96);
    v97 = objc_msgSend(v86, "processIdentifier");
    v289 = 0;
    v290 = 0xE000000000000000;
    _StringGuts.grow(_:)(27);
    v98 = swift_bridgeObjectRelease(v290);
    v289 = 0x206B736154;
    v290 = 0xE500000000000000;
    v99._countAndFlagsBits = MLHostTask.name.getter(v98);
    v100 = v99._object;
    String.append(_:)(v99);
    swift_bridgeObjectRelease(v100);
    v101._object = (void *)0x8000000100042510;
    v101._countAndFlagsBits = 0xD000000000000014;
    String.append(_:)(v101);
    v102 = v290;
    sub_10002D87C((uint64_t)v97, v289, v290);
    swift_unknownObjectRelease(v230);

    swift_bridgeObjectRelease(v102);
    v286(v237, v233);
    swift_beginAccess(v249 + 16, v1 + 408, 0, 0);
    v287 = *(void **)(v249 + 16);
    v103 = v287;
    swift_release(loga);
    swift_release(v249);
    swift_release(*(_QWORD *)typea);
    objc_msgSend(v86, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v273 + 8))(v267, v280);
    goto LABEL_31;
  }
  v69 = v38(*(_QWORD *)(v1 + 1168), v23, v22);
  v70 = Logger.logObject.getter(v69);
  v71 = static os_log_type_t.info.getter(v70);
  v72 = os_log_type_enabled(v70, v71);
  v73 = *(void (**)(uint64_t, uint64_t))(v1 + 1360);
  v74 = *(_QWORD *)(v1 + 1168);
  v75 = *(_QWORD *)(v1 + 1112);
  v217 = v1 + 760;
  if (v72)
  {
    v76 = swift_slowAlloc(28, -1);
    v77 = swift_slowAlloc(64, -1);
    v289 = v77;
    *(_DWORD *)v76 = 136315650;
    v78 = MLHostTask.name.getter(v77);
    v80 = v79;
    *(_QWORD *)(v1 + 808) = sub_100008204(v78, v79, &v289);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 808, v1 + 816, v76 + 4, v76 + 12);
    swift_bridgeObjectRelease(v80);
    v73(v74, v75);
    *(_WORD *)(v76 + 12) = 1024;
    *(_DWORD *)(v1 + 572) = 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 572, v1 + 576, v76 + 14, v76 + 18);
    *(_WORD *)(v76 + 18) = 2080;
    v81 = Duration.description.getter(v271, v278);
    v83 = v82;
    *(_QWORD *)(v1 + 824) = sub_100008204(v81, v82, &v289);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 824, v1 + 832, v76 + 20, v76 + 28);
    swift_bridgeObjectRelease(v83);
    _os_log_impl((void *)&_mh_execute_header, v70, v71, "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v76, 0x1Cu);
    swift_arrayDestroy(v77, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v77, -1, -1);
    swift_slowDealloc(v76, -1, -1);
  }
  else
  {
    v73(v74, v75);
  }

  v104 = *(_QWORD *)(v1 + 1336);
  v274 = *(void **)(v1 + 1320);
  v281 = *(_QWORD *)(v1 + 1328);
  v105 = *(_QWORD *)(v1 + 1304);
  v238 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1288);
  v242 = *(_QWORD *)(v1 + 1296);
  v106 = *(unsigned __int8 *)(v1 + 1460);
  v226 = *(_QWORD *)(v1 + 1216);
  v228 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1280);
  v224 = *(_QWORD *)(v1 + 1112);
  v107 = *(_QWORD *)(v1 + 1000);
  v108 = *(_QWORD *)(v1 + 992);
  v109 = *(_QWORD *)(v1 + 984);
  v246 = (_BYTE *)(*(_QWORD *)(v1 + 880) + 16);
  v110 = (v106 + 16) & ~v106;
  v231 = (*(_QWORD *)(v1 + 1128) + v110 + 7) & 0xFFFFFFFFFFFFFFF8;
  v234 = *(_QWORD *)(v1 + 872);
  v111 = (v231 + 15) & 0xFFFFFFFFFFFFFFF8;
  v112 = (v111 + 15) & 0xFFFFFFFFFFFFFFF8;
  v222 = *(_QWORD *)(v1 + 864);
  v219 = v106 | 7;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 1312))(v107, *(unsigned int *)(v1 + 1464), v109);
  swift_beginAccess(v105, v1 + 312, 1, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v108 + 40))(v105, v107, v109);
  swift_beginAccess(v104 + 16, v1 + 432, 1, 0);
  v113 = *(void **)(v104 + 16);
  *(_QWORD *)(v104 + 16) = 0;

  v228(v226, v222, v224);
  v114 = swift_allocObject(&unk_10004E130, v112 + 8, v219);
  v238(v114 + v110, v226, v224);
  *(_QWORD *)(v114 + v231) = v104;
  *(_QWORD *)(v114 + v111) = v242;
  *(_QWORD *)(v114 + v112) = v234;
  *(_QWORD *)(v1 + 48) = sub_100036C00;
  *(_QWORD *)(v1 + 56) = v114;
  *(_QWORD *)(v1 + 16) = _NSConcreteStackBlock;
  *(_QWORD *)(v1 + 24) = 1107296256;
  *(_QWORD *)(v1 + 32) = sub_10001FE70;
  *(_QWORD *)(v1 + 40) = &unk_10004E148;
  v115 = _Block_copy((const void *)(v1 + 16));
  v116 = *(_QWORD *)(v1 + 56);
  swift_retain(v242);
  swift_retain(v104);
  swift_retain(v234);
  swift_release(v116);
  objc_msgSend(v274, "doWorkWithContext:reply:", v281, v115);
  _Block_release(v115);
  v117 = swift_beginAccess(v246, v1 + 456, 0, 0);
  if (*v246 == 1)
  {
    v118 = *(_QWORD *)(v1 + 1336);
  }
  else
  {
    v117 = swift_beginAccess(*(_QWORD *)(v1 + 880) + 16, v1 + 504, 0, 0);
    v118 = *(_QWORD *)(v1 + 1336);
    if (!*(_QWORD *)(v118 + 16))
    {
      v206 = *(void (**)(uint64_t, uint64_t))(v1 + 1384);
      v207 = *(_QWORD *)(v1 + 968);
      v208 = *(_QWORD *)(v1 + 928);
      v209 = *(_QWORD *)(v1 + 888);
      ContinuousClock.init()(v117);
      *(_QWORD *)(v1 + 616) = 500000000000000000;
      *(_QWORD *)(v1 + 624) = 0;
      *(_OWORD *)(v1 + 552) = 0u;
      *(_BYTE *)(v1 + 568) = 1;
      v210 = sub_10000228C(&qword_100051888, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
      dispatch thunk of Clock.now.getter(v209, v210);
      v211 = sub_10000228C(&qword_100051890, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
      dispatch thunk of InstantProtocol.advanced(by:)(v1 + 616, v208, v211);
      v206(v207, v208);
      v212 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
      *(_QWORD *)(v1 + 1408) = v212;
      *v212 = v1;
      v212[1] = sub_100031EE0;
      v11 = *(_QWORD *)(v1 + 888);
      v13 = *(_QWORD *)(v1 + 952);
      v12 = v1 + 552;
      v14 = v210;
      return dispatch thunk of Clock.sleep(until:tolerance:)(v13, v12, v11, v14);
    }
  }
  v119 = *(void (**)(uint64_t, uint64_t))(v1 + 1384);
  v120 = *(_QWORD *)(v1 + 968);
  v121 = *(_QWORD *)(v1 + 928);
  static ContinuousClock.now.getter(v117);
  v122 = ContinuousClock.Instant.duration(to:)(v120);
  v124 = v123;
  v119(v120, v121);
  v125 = *(void **)(v118 + 16);
  v126 = *(void (**)(_QWORD, uint64_t, uint64_t))(v1 + 1280);
  v127 = *(_QWORD *)(v1 + 1112);
  v128 = *(_QWORD *)(v1 + 864);
  if (v125)
  {
    v126(*(_QWORD *)(v1 + 1152), v128, v127);
    v129 = v125;
    v130 = Logger.logObject.getter(v129);
    v131 = static os_log_type_t.info.getter(v130);
    v132 = os_log_type_enabled(v130, v131);
    v133 = *(void (**)(uint64_t, uint64_t))(v1 + 1360);
    v134 = *(_QWORD *)(v1 + 1152);
    v135 = *(_QWORD *)(v1 + 1112);
    v287 = v125;
    if (v132)
    {
      v275 = v122;
      v136 = swift_slowAlloc(32, -1);
      aBlockb = (_QWORD *)swift_slowAlloc(8, -1);
      v268 = swift_slowAlloc(64, -1);
      v289 = v268;
      *(_DWORD *)v136 = 136315650;
      v137 = MLHostTask.name.getter(v268);
      v138 = v124;
      v140 = v139;
      *(_QWORD *)(v1 + 768) = sub_100008204(v137, v139, &v289);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 768, v1 + 776, v136 + 4, v136 + 12);
      swift_bridgeObjectRelease(v140);
      v133(v134, v135);
      *(_WORD *)(v136 + 12) = 2080;
      v141 = Duration.description.getter(v275, v138);
      v143 = v142;
      *(_QWORD *)(v1 + 776) = sub_100008204(v141, v142, &v289);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 776, v1 + 784, v136 + 14, v136 + 22);
      swift_bridgeObjectRelease(v143);
      *(_WORD *)(v136 + 22) = 2112;
      *(_QWORD *)(v1 + 784) = v129;
      v144 = v129;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 784, v1 + 792, v136 + 24, v136 + 32);
      *aBlockb = v287;

      _os_log_impl((void *)&_mh_execute_header, v130, v131, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v136, 0x20u);
      v145 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(aBlockb, 1, v145);
      swift_slowDealloc(aBlockb, -1, -1);
      swift_arrayDestroy(v268, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v268, -1, -1);
      swift_slowDealloc(v136, -1, -1);

    }
    else
    {
      v133(v134, v135);

    }
    v161 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 1376);
    v162 = *(_QWORD *)(v1 + 1304);
    v163 = *(_QWORD *)(v1 + 1000);
    v164 = *(_QWORD *)(v1 + 992);
    v165 = *(_QWORD *)(v1 + 984);
    v166 = MLHostTask.name.getter(v146);
    v168 = v167;
    v169 = *(void (**)(uint64_t, uint64_t, uint64_t))(v164 + 16);
    v169(v163, v162, v165);
    sub_100012EC4(v166, v168, v163);
    swift_bridgeObjectRelease(v168);
    v170 = v161(v163, v165);
    v171 = MLHostTask.name.getter(v170);
    v173 = v172;
    sub_100012BF4(v171, v172);
    v174 = swift_bridgeObjectRelease(v173);
    v175 = MLHostResult.status.getter(v174);
    v176 = MLHostResultStatus.rawValue.getter(v175);
    v177 = MLHostResultStatus.rawValue.getter(1);
    v178 = *(void (**)(uint64_t, uint64_t))(v1 + 1384);
    if (v176 == v177)
    {
      v179 = *(_QWORD *)(v1 + 1344);
      v180 = *(_QWORD *)(v1 + 1336);
      v181 = *(void **)(v1 + 1328);
      v182 = *(_QWORD *)(v1 + 1320);
      v178(*(_QWORD *)(v1 + 976), *(_QWORD *)(v1 + 928));
      swift_unknownObjectRelease(v182);

    }
    else
    {
      typeb = *(void (**)(uint64_t, uint64_t))(v1 + 1376);
      v179 = *(_QWORD *)(v1 + 1344);
      v180 = *(_QWORD *)(v1 + 1336);
      v283 = *(void **)(v1 + 1328);
      aBlockc = *(void **)(v1 + 1320);
      v250 = *(_QWORD *)(v1 + 1304);
      v183 = *(_QWORD *)(v1 + 1000);
      v184 = *(_QWORD *)(v1 + 984);
      v276 = *(_QWORD *)(v1 + 976);
      v269 = *(_QWORD *)(v1 + 928);
      logb = objc_msgSend(*(id *)(v1 + 1272), "processIdentifier", v217);
      v289 = 0;
      v290 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      v185 = v290;
      *(_QWORD *)(v1 + 648) = v289;
      *(_QWORD *)(v1 + 656) = v185;
      v186._countAndFlagsBits = 0x206B736154;
      v186._object = (void *)0xE500000000000000;
      String.append(_:)(v186);
      v188._countAndFlagsBits = MLHostTask.name.getter(v187);
      v189 = v188._object;
      String.append(_:)(v188);
      swift_bridgeObjectRelease(v189);
      v190._countAndFlagsBits = 0xD00000000000001CLL;
      v190._object = (void *)0x8000000100042530;
      String.append(_:)(v190);
      v169(v183, v250, v184);
      _print_unlocked<A, B>(_:_:)(v183, v1 + 648, v184, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      typeb(v183, v184);
      v191._countAndFlagsBits = 46;
      v191._object = (void *)0xE100000000000000;
      String.append(_:)(v191);
      v192 = *(_QWORD *)(v1 + 656);
      sub_10002D87C(logb, *(_QWORD *)(v1 + 648), v192);
      swift_unknownObjectRelease(aBlockc);
      swift_bridgeObjectRelease(v192);

      v178(v276, v269);
    }
    swift_release(v180);
    swift_release(v179);
    v193 = *(void **)(v1 + 1272);
    v194 = *(_QWORD *)(v1 + 1256);
    v195 = *(_QWORD *)(v1 + 1248);
    v196 = *(_QWORD *)(v1 + 1240);
    swift_release(*(_QWORD *)(v1 + 1296));
    objc_msgSend(v193, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v194, v196);
    goto LABEL_31;
  }
  v147 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v126)(*(_QWORD *)(v1 + 1144), v128, v127);
  v148 = Logger.logObject.getter(v147);
  v149 = static os_log_type_t.info.getter(v148);
  v150 = os_log_type_enabled(v148, v149);
  v151 = *(void (**)(uint64_t, uint64_t))(v1 + 1360);
  v152 = *(_QWORD *)(v1 + 1144);
  v153 = *(_QWORD *)(v1 + 1112);
  if (v150)
  {
    v282 = v149;
    v154 = swift_slowAlloc(22, -1);
    v288 = swift_slowAlloc(64, -1);
    v289 = v288;
    *(_DWORD *)v154 = 136315394;
    v155 = MLHostTask.name.getter(v288);
    v157 = v156;
    *(_QWORD *)(v1 + 744) = sub_100008204(v155, v156, &v289);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 744, v1 + 752, v154 + 4, v154 + 12);
    swift_bridgeObjectRelease(v157);
    v151(v152, v153);
    *(_WORD *)(v154 + 12) = 2080;
    v158 = Duration.description.getter(v122, v124);
    v160 = v159;
    *(_QWORD *)(v1 + 752) = sub_100008204(v158, v159, &v289);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 752, v217, v154 + 14, v154 + 22);
    swift_bridgeObjectRelease(v160);
    _os_log_impl((void *)&_mh_execute_header, v148, v282, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v154, 0x16u);
    swift_arrayDestroy(v288, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v288, -1, -1);
    swift_slowDealloc(v154, -1, -1);
  }
  else
  {
    v151(*(_QWORD *)(v1 + 1144), *(_QWORD *)(v1 + 1112));
  }

  v213 = *(void **)(v1 + 1320);
  static ContinuousClock.now.getter(v214);
  ContinuousClock.init()(objc_msgSend(v213, "doStop"));
  v215 = dword_100051898;
  v216 = (_QWORD *)swift_task_alloc(unk_10005189C);
  *(_QWORD *)(v1 + 1392) = v216;
  *v216 = v1;
  v216[1] = sub_100030E58;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100051898 + v215))(5000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_100034B38()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  BOOL v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t (*v29)(_QWORD, uint64_t, uint64_t);
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  BOOL v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t, _QWORD, uint64_t);
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  Swift::String v56;
  void *object;
  Swift::String v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  BOOL v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t, _QWORD, uint64_t);
  void *v77;
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
  id v88;
  uint64_t v89;
  Swift::String v90;
  void *v91;
  Swift::String v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(uint64_t, uint64_t);
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void (*v117)(_QWORD, uint64_t, uint64_t);
  uint64_t v118;
  uint64_t v119;
  id v120;
  NSObject *v121;
  os_log_type_t v122;
  BOOL v123;
  void (*v124)(uint64_t, uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  os_log_type_t v140;
  BOOL v141;
  void (*v142)(uint64_t, uint64_t);
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  uint64_t v149;
  unint64_t v150;
  unint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void (*v160)(uint64_t, uint64_t, uint64_t);
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void (*v169)(uint64_t, void *);
  uint64_t v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  Swift::String v177;
  uint64_t v178;
  Swift::String v179;
  void *v180;
  Swift::String v181;
  Swift::String v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void (*v198)(uint64_t, uint64_t);
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  _QWORD *v204;
  void *v205;
  uint64_t v206;
  uint64_t v207;
  _QWORD *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void (*v221)(uint64_t, uint64_t, uint64_t);
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  unsigned __int8 *v230;
  uint64_t v231;
  void (*v232)(uint64_t, uint64_t, uint64_t);
  uint64_t v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  uint64_t v239;
  _BYTE *v240;
  uint64_t v241;
  uint64_t v242;
  os_log_t log;
  os_log_t loga;
  unsigned int logb;
  os_log_t logc;
  os_log_type_t type[8];
  os_log_type_t typea[8];
  void (*typeb)(uint64_t, uint64_t);
  os_log_type_t typec[8];
  uint64_t v251;
  uint64_t v252;
  _QWORD *v253;
  uint64_t v254;
  uint64_t v255;
  void *aBlock;
  void *aBlocka;
  void *aBlockb;
  void *aBlockc;
  void *aBlockd;
  void *aBlocke;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  os_log_type_t v273;
  void *v274;
  uint64_t v275;
  void (*v276)(uint64_t, uint64_t);
  void (*v277)(uint64_t, uint64_t);
  void *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;

  aBlock = (void *)(v0 + 688);
  v1 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 896) + 8))(*(_QWORD *)(v0 + 904), *(_QWORD *)(v0 + 888));
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Task.sleep interrupted, skipping waiting for extension completion.", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }
  swift_errorRelease(*(_QWORD *)(v0 + 1440));

  v5 = *(_QWORD *)(v0 + 1344);
  v6 = *(_QWORD *)(v0 + 968);
  v7 = *(_QWORD *)(v0 + 936);
  v8 = *(_QWORD *)(v0 + 928);
  static ContinuousClock.now.getter(v9);
  v262 = ContinuousClock.Instant.duration(to:)(v6);
  v269 = v10;
  v11 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  *(_QWORD *)(v0 + 1384) = v11;
  v11(v6, v8);
  swift_beginAccess(v5 + 16, v0 + 480, 0, 0);
  v12 = *(unsigned __int8 *)(v5 + 16);
  v13 = *(_QWORD *)(v0 + 1112);
  v14 = *(_QWORD *)(v0 + 864);
  if (v12 == 2)
  {
    v276 = v11;
    v15 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v0 + 1280))(*(_QWORD *)(v0 + 1176), v14, v13);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.info.getter(v16);
    v18 = os_log_type_enabled(v16, v17);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
    v20 = *(_QWORD *)(v0 + 1176);
    v21 = *(_QWORD *)(v0 + 1112);
    if (v18)
    {
      v230 = (unsigned __int8 *)(*(_QWORD *)(v0 + 880) + 16);
      v22 = swift_slowAlloc(28, -1);
      v251 = swift_slowAlloc(64, -1);
      v280 = v251;
      *(_DWORD *)v22 = 136315650;
      v23 = MLHostTask.name.getter(v251);
      v25 = v24;
      *(_QWORD *)(v0 + 760) = sub_100008204(v23, v24, &v280);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 760, v0 + 768, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease(v25);
      v19(v20, v21);
      *(_WORD *)(v22 + 12) = 1024;
      swift_beginAccess(v230, v0 + 528, 0, 0);
      *(_DWORD *)(v0 + 1456) = *v230;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1456, v0 + 1460, v22 + 14, v22 + 18);
      *(_WORD *)(v22 + 18) = 2080;
      v26 = Duration.description.getter(v262, v269);
      v28 = v27;
      *(_QWORD *)(v0 + 688) = sub_100008204(v26, v27, &v280);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(aBlock, v0 + 696, v22 + 20, v22 + 28);
      swift_bridgeObjectRelease(v28);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.", (uint8_t *)v22, 0x1Cu);
      swift_arrayDestroy(v251, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v251, -1, -1);
      swift_slowDealloc(v22, -1, -1);
    }
    else
    {
      v19(*(_QWORD *)(v0 + 1176), *(_QWORD *)(v0 + 1112));
    }

    v45 = *(void (**)(uint64_t, uint64_t))(v0 + 1376);
    *(_QWORD *)type = *(_QWORD *)(v0 + 1336);
    v252 = *(_QWORD *)(v0 + 1344);
    v226 = *(_QWORD *)(v0 + 1320);
    v46 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 1312);
    v238 = *(void **)(v0 + 1328);
    log = *(os_log_t *)(v0 + 1296);
    v47 = *(void **)(v0 + 1272);
    aBlocka = *(void **)(v0 + 1256);
    v263 = *(_QWORD *)(v0 + 1248);
    v270 = *(_QWORD *)(v0 + 1240);
    v48 = *(_QWORD *)(v0 + 1000);
    v49 = *(_QWORD *)(v0 + 984);
    v231 = *(_QWORD *)(v0 + 928);
    v234 = *(_QWORD *)(v0 + 976);
    v51 = MLHostTask.name.getter(v50);
    v53 = v52;
    v46(v48, enum case for TaskStatus.taskDeferred(_:), v49);
    sub_100012EC4(v51, v53, v48);
    swift_bridgeObjectRelease(v53);
    v45(v48, v49);
    v54 = objc_msgSend(v47, "processIdentifier");
    v280 = 0;
    v281 = 0xE000000000000000;
    _StringGuts.grow(_:)(37);
    v55 = swift_bridgeObjectRelease(v281);
    v280 = 0x206B736154;
    v281 = 0xE500000000000000;
    v56._countAndFlagsBits = MLHostTask.name.getter(v55);
    object = v56._object;
    String.append(_:)(v56);
    swift_bridgeObjectRelease(object);
    v58._countAndFlagsBits = 0xD00000000000001ELL;
    v58._object = (void *)0x80000001000424F0;
    String.append(_:)(v58);
    v59 = v281;
    sub_10002D87C((uint64_t)v54, v280, v281);
    swift_unknownObjectRelease(v226);
    swift_bridgeObjectRelease(v59);

    v276(v234, v231);
    swift_release(log);
    swift_release(*(_QWORD *)type);
    swift_release(v252);
    objc_msgSend(v47, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(void *, uint64_t))(v263 + 8))(aBlocka, v270);
    v278 = 0;
LABEL_29:
    v188 = *(_QWORD *)(v0 + 1256);
    v189 = *(_QWORD *)(v0 + 1232);
    v190 = *(_QWORD *)(v0 + 1224);
    v191 = *(_QWORD *)(v0 + 1216);
    v192 = *(_QWORD *)(v0 + 1208);
    v193 = *(_QWORD *)(v0 + 1200);
    v194 = *(_QWORD *)(v0 + 1192);
    v195 = *(_QWORD *)(v0 + 1184);
    v196 = *(_QWORD *)(v0 + 1176);
    v209 = *(_QWORD *)(v0 + 1168);
    v210 = *(_QWORD *)(v0 + 1160);
    v212 = *(_QWORD *)(v0 + 1152);
    v213 = *(_QWORD *)(v0 + 1144);
    v215 = *(_QWORD *)(v0 + 1136);
    v217 = *(_QWORD *)(v0 + 1104);
    v219 = *(_QWORD *)(v0 + 1080);
    v222 = *(_QWORD *)(v0 + 1072);
    v225 = *(_QWORD *)(v0 + 1048);
    v229 = *(_QWORD *)(v0 + 1024);
    v233 = *(_QWORD *)(v0 + 1000);
    v237 = *(_QWORD *)(v0 + 976);
    v242 = *(_QWORD *)(v0 + 968);
    logc = *(os_log_t *)(v0 + 960);
    *(_QWORD *)typec = *(_QWORD *)(v0 + 952);
    v255 = *(_QWORD *)(v0 + 944);
    aBlocke = *(void **)(v0 + 920);
    v268 = *(_QWORD *)(v0 + 912);
    v275 = *(_QWORD *)(v0 + 904);
    swift_unknownObjectRelease(*(_QWORD *)(v0 + 1264));
    swift_task_dealloc(v188);
    swift_task_dealloc(v189);
    swift_task_dealloc(v190);
    swift_task_dealloc(v191);
    swift_task_dealloc(v192);
    swift_task_dealloc(v193);
    swift_task_dealloc(v194);
    swift_task_dealloc(v195);
    swift_task_dealloc(v196);
    swift_task_dealloc(v209);
    swift_task_dealloc(v210);
    swift_task_dealloc(v212);
    swift_task_dealloc(v213);
    swift_task_dealloc(v215);
    swift_task_dealloc(v217);
    swift_task_dealloc(v219);
    swift_task_dealloc(v222);
    swift_task_dealloc(v225);
    swift_task_dealloc(v229);
    swift_task_dealloc(v233);
    swift_task_dealloc(v237);
    swift_task_dealloc(v242);
    swift_task_dealloc(logc);
    swift_task_dealloc(*(_QWORD *)typec);
    swift_task_dealloc(v255);
    swift_task_dealloc(aBlocke);
    swift_task_dealloc(v268);
    swift_task_dealloc(v275);
    return (*(uint64_t (**)(void *))(v0 + 8))(v278);
  }
  v29 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v0 + 1280);
  if ((v12 & 1) == 0)
  {
    v277 = v11;
    v30 = v29(*(_QWORD *)(v0 + 1160), v14, v13);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.info.getter(v31);
    v33 = os_log_type_enabled(v31, v32);
    v34 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
    v35 = *(_QWORD *)(v0 + 1160);
    v36 = *(_QWORD *)(v0 + 1112);
    if (v33)
    {
      v37 = swift_slowAlloc(28, -1);
      v38 = swift_slowAlloc(64, -1);
      v280 = v38;
      *(_DWORD *)v37 = 136315650;
      v39 = MLHostTask.name.getter(v38);
      v41 = v40;
      *(_QWORD *)(v0 + 680) = sub_100008204(v39, v40, &v280);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 680, aBlock, v37 + 4, v37 + 12);
      swift_bridgeObjectRelease(v41);
      v34(v35, v36);
      *(_WORD *)(v37 + 12) = 1024;
      *(_DWORD *)(v0 + 1448) = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1448, v0 + 1452, v37 + 14, v37 + 18);
      *(_WORD *)(v37 + 18) = 2080;
      v42 = Duration.description.getter(v262, v269);
      v44 = v43;
      *(_QWORD *)(v0 + 664) = sub_100008204(v42, v43, &v280);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 664, v0 + 672, v37 + 20, v37 + 28);
      swift_bridgeObjectRelease(v44);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v37, 0x1Cu);
      swift_arrayDestroy(v38, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);
    }
    else
    {
      v34(*(_QWORD *)(v0 + 1160), *(_QWORD *)(v0 + 1112));
    }

    v75 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1376);
    v235 = *(void **)(v0 + 1328);
    v239 = *(_QWORD *)(v0 + 1336);
    v220 = *(_QWORD *)(v0 + 1320);
    v76 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 1312);
    loga = *(os_log_t *)(v0 + 1296);
    *(_QWORD *)typea = *(_QWORD *)(v0 + 1344);
    v77 = *(void **)(v0 + 1272);
    aBlockb = *(void **)(v0 + 1256);
    v264 = *(_QWORD *)(v0 + 1248);
    v271 = *(_QWORD *)(v0 + 1240);
    v78 = *(_QWORD *)(v0 + 1000);
    v79 = *(_QWORD *)(v0 + 984);
    v223 = *(_QWORD *)(v0 + 928);
    v227 = *(_QWORD *)(v0 + 976);
    v81 = MLHostTask.name.getter(v80);
    v83 = v82;
    v76(v78, enum case for TaskStatus.taskFailed(_:), v79);
    sub_100012EC4(v81, v83, v78);
    swift_bridgeObjectRelease(v83);
    v84 = v75(v78, v79);
    v85 = MLHostTask.name.getter(v84);
    v87 = v86;
    sub_100012BF4(v85, v86);
    swift_bridgeObjectRelease(v87);
    v88 = objc_msgSend(v77, "processIdentifier");
    v280 = 0;
    v281 = 0xE000000000000000;
    _StringGuts.grow(_:)(27);
    v89 = swift_bridgeObjectRelease(v281);
    v280 = 0x206B736154;
    v281 = 0xE500000000000000;
    v90._countAndFlagsBits = MLHostTask.name.getter(v89);
    v91 = v90._object;
    String.append(_:)(v90);
    swift_bridgeObjectRelease(v91);
    v92._object = (void *)0x8000000100042510;
    v92._countAndFlagsBits = 0xD000000000000014;
    String.append(_:)(v92);
    v93 = v281;
    sub_10002D87C((uint64_t)v88, v280, v281);
    swift_unknownObjectRelease(v220);

    swift_bridgeObjectRelease(v93);
    v277(v227, v223);
    swift_beginAccess(v239 + 16, v0 + 408, 0, 0);
    v278 = *(void **)(v239 + 16);
    v94 = v278;
    swift_release(loga);
    swift_release(v239);
    swift_release(*(_QWORD *)typea);
    objc_msgSend(v77, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(void *, uint64_t))(v264 + 8))(aBlockb, v271);
    goto LABEL_29;
  }
  v60 = v29(*(_QWORD *)(v0 + 1168), v14, v13);
  v61 = Logger.logObject.getter(v60);
  v62 = static os_log_type_t.info.getter(v61);
  v63 = os_log_type_enabled(v61, v62);
  v64 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
  v65 = *(_QWORD *)(v0 + 1168);
  v66 = *(_QWORD *)(v0 + 1112);
  if (v63)
  {
    v67 = swift_slowAlloc(28, -1);
    v68 = swift_slowAlloc(64, -1);
    v280 = v68;
    *(_DWORD *)v67 = 136315650;
    v69 = MLHostTask.name.getter(v68);
    v71 = v70;
    *(_QWORD *)(v0 + 808) = sub_100008204(v69, v70, &v280);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 808, v0 + 816, v67 + 4, v67 + 12);
    swift_bridgeObjectRelease(v71);
    v64(v65, v66);
    *(_WORD *)(v67 + 12) = 1024;
    *(_DWORD *)(v0 + 572) = 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 572, v0 + 576, v67 + 14, v67 + 18);
    *(_WORD *)(v67 + 18) = 2080;
    v72 = Duration.description.getter(v262, v269);
    v74 = v73;
    *(_QWORD *)(v0 + 824) = sub_100008204(v72, v73, &v280);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 824, v0 + 832, v67 + 20, v67 + 28);
    swift_bridgeObjectRelease(v74);
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v67, 0x1Cu);
    swift_arrayDestroy(v68, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v68, -1, -1);
    swift_slowDealloc(v67, -1, -1);
  }
  else
  {
    v64(v65, v66);
  }

  v95 = *(_QWORD *)(v0 + 1336);
  v265 = *(void **)(v0 + 1320);
  v272 = *(_QWORD *)(v0 + 1328);
  v96 = *(_QWORD *)(v0 + 1304);
  v232 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1288);
  v236 = *(_QWORD *)(v0 + 1296);
  v97 = *(unsigned __int8 *)(v0 + 1460);
  v218 = *(_QWORD *)(v0 + 1216);
  v221 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1280);
  v216 = *(_QWORD *)(v0 + 1112);
  v98 = *(_QWORD *)(v0 + 1000);
  v99 = *(_QWORD *)(v0 + 992);
  v100 = *(_QWORD *)(v0 + 984);
  v240 = (_BYTE *)(*(_QWORD *)(v0 + 880) + 16);
  v101 = (v97 + 16) & ~v97;
  v224 = (*(_QWORD *)(v0 + 1128) + v101 + 7) & 0xFFFFFFFFFFFFFFF8;
  v228 = *(_QWORD *)(v0 + 872);
  v102 = (v224 + 15) & 0xFFFFFFFFFFFFFFF8;
  v103 = (v102 + 15) & 0xFFFFFFFFFFFFFFF8;
  v214 = *(_QWORD *)(v0 + 864);
  v211 = v97 | 7;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 1312))(v98, *(unsigned int *)(v0 + 1464), v100);
  swift_beginAccess(v96, v0 + 312, 1, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v99 + 40))(v96, v98, v100);
  swift_beginAccess(v95 + 16, v0 + 432, 1, 0);
  v104 = *(void **)(v95 + 16);
  *(_QWORD *)(v95 + 16) = 0;

  v221(v218, v214, v216);
  v105 = swift_allocObject(&unk_10004E130, v103 + 8, v211);
  v232(v105 + v101, v218, v216);
  *(_QWORD *)(v105 + v224) = v95;
  *(_QWORD *)(v105 + v102) = v236;
  *(_QWORD *)(v105 + v103) = v228;
  *(_QWORD *)(v0 + 48) = sub_100036C00;
  *(_QWORD *)(v0 + 56) = v105;
  *(_QWORD *)(v0 + 16) = _NSConcreteStackBlock;
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_10001FE70;
  *(_QWORD *)(v0 + 40) = &unk_10004E148;
  v106 = _Block_copy((const void *)(v0 + 16));
  v107 = *(_QWORD *)(v0 + 56);
  swift_retain(v236);
  swift_retain(v95);
  swift_retain(v228);
  swift_release(v107);
  objc_msgSend(v265, "doWorkWithContext:reply:", v272, v106);
  _Block_release(v106);
  v108 = swift_beginAccess(v240, v0 + 456, 0, 0);
  if (*v240 == 1)
  {
    v109 = *(_QWORD *)(v0 + 1336);
  }
  else
  {
    v108 = swift_beginAccess(*(_QWORD *)(v0 + 880) + 16, v0 + 504, 0, 0);
    v109 = *(_QWORD *)(v0 + 1336);
    if (!*(_QWORD *)(v109 + 16))
    {
      v198 = *(void (**)(uint64_t, uint64_t))(v0 + 1384);
      v199 = *(_QWORD *)(v0 + 968);
      v200 = *(_QWORD *)(v0 + 928);
      v201 = *(_QWORD *)(v0 + 888);
      ContinuousClock.init()(v108);
      *(_QWORD *)(v0 + 616) = 500000000000000000;
      *(_QWORD *)(v0 + 624) = 0;
      *(_OWORD *)(v0 + 552) = 0u;
      *(_BYTE *)(v0 + 568) = 1;
      v202 = sub_10000228C(&qword_100051888, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
      dispatch thunk of Clock.now.getter(v201, v202);
      v203 = sub_10000228C(&qword_100051890, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
      dispatch thunk of InstantProtocol.advanced(by:)(v0 + 616, v200, v203);
      v198(v199, v200);
      v204 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
      *(_QWORD *)(v0 + 1408) = v204;
      *v204 = v0;
      v204[1] = sub_100031EE0;
      return dispatch thunk of Clock.sleep(until:tolerance:)(*(_QWORD *)(v0 + 952), v0 + 552, *(_QWORD *)(v0 + 888), v202);
    }
  }
  v110 = *(void (**)(uint64_t, uint64_t))(v0 + 1384);
  v111 = *(_QWORD *)(v0 + 968);
  v112 = *(_QWORD *)(v0 + 928);
  static ContinuousClock.now.getter(v108);
  v113 = ContinuousClock.Instant.duration(to:)(v111);
  v115 = v114;
  v110(v111, v112);
  v116 = *(void **)(v109 + 16);
  v117 = *(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 1280);
  v118 = *(_QWORD *)(v0 + 1112);
  v119 = *(_QWORD *)(v0 + 864);
  if (v116)
  {
    v117(*(_QWORD *)(v0 + 1152), v119, v118);
    v120 = v116;
    v121 = Logger.logObject.getter(v120);
    v122 = static os_log_type_t.info.getter(v121);
    v123 = os_log_type_enabled(v121, v122);
    v124 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
    v125 = *(_QWORD *)(v0 + 1152);
    v126 = *(_QWORD *)(v0 + 1112);
    v278 = v116;
    if (v123)
    {
      v266 = v113;
      v127 = swift_slowAlloc(32, -1);
      v253 = (_QWORD *)swift_slowAlloc(8, -1);
      aBlockc = (void *)swift_slowAlloc(64, -1);
      v280 = (uint64_t)aBlockc;
      *(_DWORD *)v127 = 136315650;
      v128 = MLHostTask.name.getter(aBlockc);
      v129 = v115;
      v131 = v130;
      *(_QWORD *)(v0 + 768) = sub_100008204(v128, v130, &v280);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 768, v0 + 776, v127 + 4, v127 + 12);
      swift_bridgeObjectRelease(v131);
      v124(v125, v126);
      *(_WORD *)(v127 + 12) = 2080;
      v132 = Duration.description.getter(v266, v129);
      v134 = v133;
      *(_QWORD *)(v0 + 776) = sub_100008204(v132, v133, &v280);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 776, v0 + 784, v127 + 14, v127 + 22);
      swift_bridgeObjectRelease(v134);
      *(_WORD *)(v127 + 22) = 2112;
      *(_QWORD *)(v0 + 784) = v120;
      v135 = v120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 784, v0 + 792, v127 + 24, v127 + 32);
      *v253 = v278;

      _os_log_impl((void *)&_mh_execute_header, v121, v122, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v127, 0x20u);
      v136 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v253, 1, v136);
      swift_slowDealloc(v253, -1, -1);
      swift_arrayDestroy(aBlockc, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(aBlockc, -1, -1);
      swift_slowDealloc(v127, -1, -1);

    }
    else
    {
      v124(v125, v126);

    }
    v152 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1376);
    v153 = *(_QWORD *)(v0 + 1304);
    v154 = *(_QWORD *)(v0 + 1000);
    v155 = *(_QWORD *)(v0 + 992);
    v156 = *(_QWORD *)(v0 + 984);
    v157 = MLHostTask.name.getter(v137);
    v159 = v158;
    v160 = *(void (**)(uint64_t, uint64_t, uint64_t))(v155 + 16);
    v160(v154, v153, v156);
    sub_100012EC4(v157, v159, v154);
    swift_bridgeObjectRelease(v159);
    v161 = v152(v154, v156);
    v162 = MLHostTask.name.getter(v161);
    v164 = v163;
    sub_100012BF4(v162, v163);
    v165 = swift_bridgeObjectRelease(v164);
    v166 = MLHostResult.status.getter(v165);
    v167 = MLHostResultStatus.rawValue.getter(v166);
    v168 = MLHostResultStatus.rawValue.getter(1);
    v169 = *(void (**)(uint64_t, void *))(v0 + 1384);
    if (v167 == v168)
    {
      v170 = *(_QWORD *)(v0 + 1344);
      v171 = *(_QWORD *)(v0 + 1336);
      v172 = *(void **)(v0 + 1328);
      v173 = *(_QWORD *)(v0 + 1320);
      v169(*(_QWORD *)(v0 + 976), *(void **)(v0 + 928));
      swift_unknownObjectRelease(v173);

    }
    else
    {
      typeb = *(void (**)(uint64_t, uint64_t))(v0 + 1376);
      v170 = *(_QWORD *)(v0 + 1344);
      v171 = *(_QWORD *)(v0 + 1336);
      v274 = *(void **)(v0 + 1328);
      v254 = *(_QWORD *)(v0 + 1320);
      v241 = *(_QWORD *)(v0 + 1304);
      v174 = *(_QWORD *)(v0 + 1000);
      v175 = *(_QWORD *)(v0 + 984);
      v267 = *(_QWORD *)(v0 + 976);
      aBlockd = *(void **)(v0 + 928);
      logb = objc_msgSend(*(id *)(v0 + 1272), "processIdentifier");
      v280 = 0;
      v281 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      v176 = v281;
      *(_QWORD *)(v0 + 648) = v280;
      *(_QWORD *)(v0 + 656) = v176;
      v177._countAndFlagsBits = 0x206B736154;
      v177._object = (void *)0xE500000000000000;
      String.append(_:)(v177);
      v179._countAndFlagsBits = MLHostTask.name.getter(v178);
      v180 = v179._object;
      String.append(_:)(v179);
      swift_bridgeObjectRelease(v180);
      v181._countAndFlagsBits = 0xD00000000000001CLL;
      v181._object = (void *)0x8000000100042530;
      String.append(_:)(v181);
      v160(v174, v241, v175);
      _print_unlocked<A, B>(_:_:)(v174, v0 + 648, v175, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      typeb(v174, v175);
      v182._countAndFlagsBits = 46;
      v182._object = (void *)0xE100000000000000;
      String.append(_:)(v182);
      v183 = *(_QWORD *)(v0 + 656);
      sub_10002D87C(logb, *(_QWORD *)(v0 + 648), v183);
      swift_unknownObjectRelease(v254);
      swift_bridgeObjectRelease(v183);

      v169(v267, aBlockd);
    }
    swift_release(v171);
    swift_release(v170);
    v184 = *(void **)(v0 + 1272);
    v185 = *(_QWORD *)(v0 + 1256);
    v186 = *(_QWORD *)(v0 + 1248);
    v187 = *(_QWORD *)(v0 + 1240);
    swift_release(*(_QWORD *)(v0 + 1296));
    objc_msgSend(v184, "invalidate");

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v185, v187);
    goto LABEL_29;
  }
  v138 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v117)(*(_QWORD *)(v0 + 1144), v119, v118);
  v139 = Logger.logObject.getter(v138);
  v140 = static os_log_type_t.info.getter(v139);
  v141 = os_log_type_enabled(v139, v140);
  v142 = *(void (**)(uint64_t, uint64_t))(v0 + 1360);
  v143 = *(_QWORD *)(v0 + 1144);
  v144 = *(_QWORD *)(v0 + 1112);
  if (v141)
  {
    v273 = v140;
    v145 = swift_slowAlloc(22, -1);
    v279 = swift_slowAlloc(64, -1);
    v280 = v279;
    *(_DWORD *)v145 = 136315394;
    v146 = MLHostTask.name.getter(v279);
    v148 = v147;
    *(_QWORD *)(v0 + 744) = sub_100008204(v146, v147, &v280);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 744, v0 + 752, v145 + 4, v145 + 12);
    swift_bridgeObjectRelease(v148);
    v142(v143, v144);
    *(_WORD *)(v145 + 12) = 2080;
    v149 = Duration.description.getter(v113, v115);
    v151 = v150;
    *(_QWORD *)(v0 + 752) = sub_100008204(v149, v150, &v280);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 752, v0 + 760, v145 + 14, v145 + 22);
    swift_bridgeObjectRelease(v151);
    _os_log_impl((void *)&_mh_execute_header, v139, v273, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v145, 0x16u);
    swift_arrayDestroy(v279, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v279, -1, -1);
    swift_slowDealloc(v145, -1, -1);
  }
  else
  {
    v142(*(_QWORD *)(v0 + 1144), *(_QWORD *)(v0 + 1112));
  }

  v205 = *(void **)(v0 + 1320);
  static ContinuousClock.now.getter(v206);
  ContinuousClock.init()(objc_msgSend(v205, "doStop"));
  v207 = dword_100051898;
  v208 = (_QWORD *)swift_task_alloc(unk_10005189C);
  *(_QWORD *)(v0 + 1392) = v208;
  *v208 = v0;
  v208[1] = sub_100030E58;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100051898 + v207))(5000000000000000000, 0, 0, 0, 1);
}

void sub_100036140(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  __objc2_prot *v11;
  id v12;
  NSString v13;
  unsigned int v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSString v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;

  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v4 = type metadata accessor for Logger(0);
  sub_10000A8E8(v4, (uint64_t)qword_100052B80);
  v5 = swift_bridgeObjectRetain_n(a2, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (void *)swift_slowAlloc(32, -1);
    v36 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    v34 = sub_100008204(a1, a2, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Deregistering task: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  v10 = (void *)objc_opt_self(BGSystemTaskScheduler);
  v11 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  v12 = objc_msgSend(v10, "sharedScheduler");
  v13 = String._bridgeToObjectiveC()();
  v36 = 0;
  v14 = objc_msgSend(v12, "cancelTaskRequestWithIdentifier:error:", v13, &v36);

  v15 = v36;
  if (v14)
  {
    v16 = v36;
  }
  else
  {
    v17 = v36;
    v18 = _convertNSErrorToError(_:)(v15);

    swift_willThrow(v19);
    swift_errorRetain(v18);
    v20 = swift_errorRetain(v18);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v23 = 138412290;
      swift_errorRetain(v18);
      v24 = (void *)_swift_stdlib_bridgeErrorToNSError(v18);
      v36 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v23 + 4, v23 + 12);
      *v33 = v24;
      v11 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
      swift_errorRelease(v18);
      swift_errorRelease(v18);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Task cancellation failed: %@", v23, 0xCu);
      v25 = sub_100007800(&qword_100051288);
      swift_arrayDestroy(v33, 1, v25);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v23, -1, -1);

      swift_errorRelease(v18);
    }
    else
    {
      swift_errorRelease(v18);
      swift_errorRelease(v18);
      swift_errorRelease(v18);

    }
  }
  v26 = objc_msgSend(v10, (SEL)v11[44].isa, v33);
  v27 = String._bridgeToObjectiveC()();
  objc_msgSend(v26, "deregisterTaskWithIdentifier:", v27);

  v28 = swift_bridgeObjectRetain_n(a2, 2);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc(12, -1);
    v32 = (void *)swift_slowAlloc(32, -1);
    v36 = v32;
    *(_DWORD *)v31 = 136315138;
    swift_bridgeObjectRetain(a2);
    v34 = sub_100008204(a1, a2, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v31 + 4, v31 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Task deregistered successfully: %s", v31, 0xCu);
    swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
}

uint64_t sub_100036648()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003666C()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100036674(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MLHostPushMessage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000366B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;

  return sub_100012B54(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_1000366D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for MLHostTask(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

id sub_100036748(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MLHostTask(0) - 8) + 80);
  return sub_100020ED0(a1, *(char **)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_100036788()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for MLHostTask(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10003680C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MLHostTask(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc(dword_10005185C);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_1000368A4;
  return sub_100021304(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_1000368A4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000368EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10005186C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000368A4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100051868 + dword_100051868))(a1, v4);
}

uint64_t sub_10003695C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003696C()
{
  uint64_t v0;
  uint64_t result;
  _BYTE v2[24];

  result = swift_beginAccess(v0 + 16, v2, 1, 0);
  *(_BYTE *)(v0 + 16) = 1;
  return result;
}

void sub_1000369AC()
{
  sub_100036A28("Connection to %s interrupted!");
}

uint64_t sub_1000369BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for MLHostTask(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100036A1C()
{
  sub_100036A28("Connection to %s invalidated!");
}

void sub_100036A28(const char *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MLHostTask(0) - 8) + 80);
  sub_10001F940(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_100036A68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for MLHostTask(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100036ADC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for MLHostTask(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_10001FB30(a1, v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_100036B2C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100036B54(uint64_t a1)
{
  return sub_100036C0C(a1, (uint64_t (*)(uint64_t, unint64_t, _QWORD, _QWORD, _QWORD))sub_10001FE74);
}

uint64_t sub_100036B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = type metadata accessor for MLHostTask(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));
  swift_release(*(_QWORD *)(v0 + v7));
  swift_release(*(_QWORD *)(v0 + v8));
  return swift_deallocObject(v0, v8 + 8, v5);
}

uint64_t sub_100036C00(uint64_t a1)
{
  return sub_100036C0C(a1, (uint64_t (*)(uint64_t, unint64_t, _QWORD, _QWORD, _QWORD))sub_1000203D0);
}

uint64_t sub_100036C0C(uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, _QWORD, _QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(type metadata accessor for MLHostTask(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  return a2(a1, v2 + v5, *(_QWORD *)(v2 + v6), *(_QWORD *)(v2 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v2 + ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_100036C84()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100036CB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100025DDC(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_100036CC8()
{
  return sub_100025D68();
}

uint64_t sub_100036CE0()
{
  return sub_100025D0C();
}

uint64_t sub_100036CF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1000259D0(a1, v2, a2);
}

uint64_t sub_100036D10(uint64_t a1)
{
  uint64_t v1;

  return sub_100025918(a1, v1);
}

void sub_100036D28(uint64_t a1)
{
  uint64_t v1;

  sub_10002506C(a1, v1);
}

uint64_t sub_100036D40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000251F0(v1, a1);
}

uint64_t sub_100036D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100024894(a1, v2, a2);
}

uint64_t sub_100036D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100023E94(v1, a1);
}

uint64_t sub_100036D88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000241EC(v1, a1);
}

uint64_t sub_100036DA0()
{
  sub_10000BE88();
  return ListExtensionsResponse.init(extensions:)();
}

uint64_t sub_100036DE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000244B8(v1, a1);
}

unint64_t sub_100036DFC()
{
  unint64_t result;

  result = qword_100051910;
  if (!qword_100051910)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100051910);
  }
  return result;
}

uint64_t sub_100036E40()
{
  uint64_t v0;

  return sub_10000FA34(v0);
}

uint64_t sub_100036E58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100007800(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for ClientPermissions()
{
  return &type metadata for ClientPermissions;
}

unint64_t sub_100036EB0()
{
  unint64_t result;

  result = qword_100051960;
  if (!qword_100051960)
  {
    result = swift_getWitnessTable(&unk_100038E94, &type metadata for ClientPermissions);
    atomic_store(result, (unint64_t *)&qword_100051960);
  }
  return result;
}

unint64_t sub_100036EF8()
{
  unint64_t result;

  result = qword_100051968;
  if (!qword_100051968)
  {
    result = swift_getWitnessTable(&unk_100038E64, &type metadata for ClientPermissions);
    atomic_store(result, (unint64_t *)&qword_100051968);
  }
  return result;
}

unint64_t sub_100036F40()
{
  unint64_t result;

  result = qword_100051970;
  if (!qword_100051970)
  {
    result = swift_getWitnessTable(&unk_100038EBC, &type metadata for ClientPermissions);
    atomic_store(result, (unint64_t *)&qword_100051970);
  }
  return result;
}

unint64_t sub_100036F88()
{
  unint64_t result;

  result = qword_100051978;
  if (!qword_100051978)
  {
    result = swift_getWitnessTable(&unk_100038EF4, &type metadata for ClientPermissions);
    atomic_store(result, (unint64_t *)&qword_100051978);
  }
  return result;
}

void sub_100037034()
{
  qword_100052BA0 = (uint64_t)&off_1000491E8;
}

void sub_100037048()
{
  qword_100052BA8 = (uint64_t)&off_100049848;
}

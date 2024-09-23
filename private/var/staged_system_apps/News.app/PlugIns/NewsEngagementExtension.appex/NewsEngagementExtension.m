void sub_100005140(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_10000518C(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1000051E0 + 4 * byte_10000A874[a2]))(a3 + 1);
}

uint64_t sub_1000051E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  char v5;

  v4 = 0x800000010000A480;
  if (a1 == a3 + 1 && v3 == 0x800000010000A480)
  {
    v5 = 1;
    v4 = v3;
  }
  else
  {
    v5 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
  }
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(v3);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(v4);
  return v5 & 1;
}

void sub_10000526C(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_1000052C4()
{
  uint64_t v0;
  uint64_t v2;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v2, v0 + 1, 0x800000010000A480);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(0x800000010000A480);
  return Hasher._finalize()();
}

void sub_100005330(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_100005374(uint64_t a1, uint64_t a2)
{
  ((void (*)(uint64_t, uint64_t, unint64_t))String.hash(into:))(a1, a2 + 1, 0x800000010000A480);
  return ((uint64_t (*)(unint64_t))swift_bridgeObjectRelease)(0x800000010000A480);
}

void sub_1000053C4(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_100005418()
{
  uint64_t v0;
  uint64_t v2;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v2, v0 + 1, 0x800000010000A480);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(0x800000010000A480);
  return Hasher._finalize()();
}

uint64_t sub_100005480@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C468, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_1000054D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100005D5C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000054F8@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C4A0, v3);
  result = swift_bridgeObjectRelease(object);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_10000554C()
{
  return 0;
}

void sub_100005558(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100005564(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005FCC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000558C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005FCC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000055B4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1000055EC + 4 * byte_10000A884[a1]))(0xD000000000000016, 0x800000010000A460);
}

uint64_t sub_1000055EC(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_100005624(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  char v13;

  v4 = sub_100005F68(&qword_100010500);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100005FA8(a1, v8);
  v10 = sub_100005FCC();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for PluginRequest.CodingKeys, &type metadata for PluginRequest.CodingKeys, v10, v8, v9);
  v13 = a2;
  sub_1000062FC();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_10000571C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = sub_100005E48(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_100005744(_QWORD *a1)
{
  char *v1;

  return sub_100005624(a1, *v1);
}

uint64_t sub_10000575C(char a1)
{
  Swift::String v2;
  Swift::String v3;
  char v5;
  _QWORD v6[2];

  v6[0] = 0;
  v6[1] = 0xE000000000000000;
  v2._countAndFlagsBits = 0x646E616D6D6F635BLL;
  v2._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v2);
  v5 = a1;
  _print_unlocked<A, B>(_:_:)(&v5, v6, &type metadata for JsonPayload, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v3._countAndFlagsBits = 93;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return v6[0];
}

uint64_t sub_1000057E4()
{
  char *v0;

  return sub_10000575C(*v0);
}

_BYTE *initializeBufferWithCopyOfBuffer for Command(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for JsonPayload()
{
  return &type metadata for JsonPayload;
}

ValueMetadata *type metadata accessor for PluginRequest()
{
  return &type metadata for PluginRequest;
}

uint64_t sub_100005824()
{
  return 1;
}

void sub_100005830()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_100005858(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  char v13;

  v4 = sub_100005F68(&qword_1000104F0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100005FA8(a1, v8);
  v10 = sub_100006230();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for JsonPayload.CodingKeys, &type metadata for JsonPayload.CodingKeys, v10, v8, v9);
  v13 = a2;
  sub_1000062B8();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100005950(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  char v13;

  v4 = sub_100005F68(&qword_100010558);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100005FA8(a1, v8);
  v10 = sub_1000066F4();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for Request.CodingKeys, &type metadata for Request.CodingKeys, v10, v8, v9);
  v13 = a2;
  sub_10000677C();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100005A4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100006074(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100005A74(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006230();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100005A9C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006230();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_100005AC4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = sub_100006110(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_100005AEC(_QWORD *a1)
{
  char *v1;

  return sub_100005858(a1, *v1);
}

Swift::Int sub_100005B04()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_100005B44(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100005B84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100006538(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100005BAC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000066F4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100005BD4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000066F4();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_100005BFC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = sub_1000065D4(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_100005C24(_QWORD *a1)
{
  char *v1;

  return sub_100005950(a1, *v1);
}

void sub_100005C3C(char *a1)
{
  sub_100005140(*a1);
}

void sub_100005C48()
{
  char *v0;

  sub_10000526C(*v0);
}

void sub_100005C50(uint64_t a1)
{
  char *v1;

  sub_100005330(a1, *v1);
}

void sub_100005C58(uint64_t a1)
{
  char *v1;

  sub_1000053C4(a1, *v1);
}

unint64_t sub_100005C60@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100006B7C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100005C8C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1000055B4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100006B38();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_100005D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100006B38();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_100005D5C()
{
  return 0x7961702D6E6F736ALL;
}

Swift::Int sub_100005D7C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0x7961702D6E6F736ALL, 0xEC00000064616F6CLL);
  return Hasher._finalize()();
}

uint64_t sub_100005DD4(uint64_t a1)
{
  return String.hash(into:)(a1, 0x7961702D6E6F736ALL, 0xEC00000064616F6CLL);
}

Swift::Int sub_100005DF4(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0x7961702D6E6F736ALL, 0xEC00000064616F6CLL);
  return Hasher._finalize()();
}

unint64_t sub_100005E48(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_100005F68(&qword_1000104C0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = (unint64_t)sub_100005FA8(a1, v7);
  v10 = sub_100005FCC();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PluginRequest.CodingKeys, &type metadata for PluginRequest.CodingKeys, v10, v7, v8);
  if (v1)
  {
    sub_100006010(a1);
  }
  else
  {
    sub_100006030();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v9 = v13;
    sub_100006010(a1);
  }
  return v9;
}

uint64_t sub_100005F68(uint64_t *a1)
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

_QWORD *sub_100005FA8(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100005FCC()
{
  unint64_t result;

  result = qword_1000104C8;
  if (!qword_1000104C8)
  {
    result = swift_getWitnessTable(&unk_10000AC00, &type metadata for PluginRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000104C8);
  }
  return result;
}

uint64_t sub_100006010(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_100006030()
{
  unint64_t result;

  result = qword_1000104D0;
  if (!qword_1000104D0)
  {
    result = swift_getWitnessTable(&unk_10000A954, &type metadata for JsonPayload);
    atomic_store(result, (unint64_t *)&qword_1000104D0);
  }
  return result;
}

uint64_t sub_100006074(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;

  if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(a2);
    v5 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x74736575716572, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    v5 = v4 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_1000060F8()
{
  return 0x74736575716572;
}

unint64_t sub_100006110(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_100005F68(&qword_1000104D8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = (unint64_t)sub_100005FA8(a1, v7);
  v10 = sub_100006230();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for JsonPayload.CodingKeys, &type metadata for JsonPayload.CodingKeys, v10, v7, v8);
  if (v1)
  {
    sub_100006010(a1);
  }
  else
  {
    sub_100006274();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v9 = v13;
    sub_100006010(a1);
  }
  return v9;
}

unint64_t sub_100006230()
{
  unint64_t result;

  result = qword_1000104E0;
  if (!qword_1000104E0)
  {
    result = swift_getWitnessTable(&unk_10000ABB0, &type metadata for JsonPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000104E0);
  }
  return result;
}

unint64_t sub_100006274()
{
  unint64_t result;

  result = qword_1000104E8;
  if (!qword_1000104E8)
  {
    result = swift_getWitnessTable(&unk_10000AB88, &type metadata for Request);
    atomic_store(result, (unint64_t *)&qword_1000104E8);
  }
  return result;
}

unint64_t sub_1000062B8()
{
  unint64_t result;

  result = qword_1000104F8;
  if (!qword_1000104F8)
  {
    result = swift_getWitnessTable(&unk_10000AB60, &type metadata for Request);
    atomic_store(result, (unint64_t *)&qword_1000104F8);
  }
  return result;
}

unint64_t sub_1000062FC()
{
  unint64_t result;

  result = qword_100010508;
  if (!qword_100010508)
  {
    result = swift_getWitnessTable(&unk_10000A92C, &type metadata for JsonPayload);
    atomic_store(result, (unint64_t *)&qword_100010508);
  }
  return result;
}

uint64_t sub_10000634C()
{
  return 0;
}

ValueMetadata *type metadata accessor for JsonPayload.CodingKeys()
{
  return &type metadata for JsonPayload.CodingKeys;
}

ValueMetadata *type metadata accessor for PluginRequest.CodingKeys()
{
  return &type metadata for PluginRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for Request()
{
  return &type metadata for Request;
}

unint64_t sub_10000638C()
{
  unint64_t result;

  result = qword_100010510;
  if (!qword_100010510)
  {
    result = swift_getWitnessTable(&unk_10000AA80, &type metadata for PluginRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010510);
  }
  return result;
}

unint64_t sub_1000063D4()
{
  unint64_t result;

  result = qword_100010518;
  if (!qword_100010518)
  {
    result = swift_getWitnessTable(&unk_10000AB38, &type metadata for JsonPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010518);
  }
  return result;
}

unint64_t sub_10000641C()
{
  unint64_t result;

  result = qword_100010520;
  if (!qword_100010520)
  {
    result = swift_getWitnessTable(&unk_10000AAA8, &type metadata for JsonPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010520);
  }
  return result;
}

unint64_t sub_100006464()
{
  unint64_t result;

  result = qword_100010528;
  if (!qword_100010528)
  {
    result = swift_getWitnessTable(&unk_10000AAD0, &type metadata for JsonPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010528);
  }
  return result;
}

unint64_t sub_1000064AC()
{
  unint64_t result;

  result = qword_100010530;
  if (!qword_100010530)
  {
    result = swift_getWitnessTable("A ", &type metadata for PluginRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010530);
  }
  return result;
}

unint64_t sub_1000064F4()
{
  unint64_t result;

  result = qword_100010538;
  if (!qword_100010538)
  {
    result = swift_getWitnessTable(&unk_10000A9E0, &type metadata for PluginRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010538);
  }
  return result;
}

uint64_t sub_100006538(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;

  if (a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(a2);
    v5 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x646E616D6D6F63, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    v5 = v4 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_1000065BC()
{
  return 0x646E616D6D6F63;
}

unint64_t sub_1000065D4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_100005F68(&qword_100010540);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = (unint64_t)sub_100005FA8(a1, v7);
  v10 = sub_1000066F4();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for Request.CodingKeys, &type metadata for Request.CodingKeys, v10, v7, v8);
  if (v1)
  {
    sub_100006010(a1);
  }
  else
  {
    sub_100006738();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v9 = v13;
    sub_100006010(a1);
  }
  return v9;
}

unint64_t sub_1000066F4()
{
  unint64_t result;

  result = qword_100010548;
  if (!qword_100010548)
  {
    result = swift_getWitnessTable(&unk_10000AE00, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010548);
  }
  return result;
}

unint64_t sub_100006738()
{
  unint64_t result;

  result = qword_100010550;
  if (!qword_100010550)
  {
    result = swift_getWitnessTable(&unk_10000ADD8, &type metadata for Command);
    atomic_store(result, (unint64_t *)&qword_100010550);
  }
  return result;
}

unint64_t sub_10000677C()
{
  unint64_t result;

  result = qword_100010560;
  if (!qword_100010560)
  {
    result = swift_getWitnessTable(&unk_10000ADB0, &type metadata for Command);
    atomic_store(result, (unint64_t *)&qword_100010560);
  }
  return result;
}

uint64_t _s23NewsEngagementExtension11JsonPayloadV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s23NewsEngagementExtension11JsonPayloadV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100006850 + 4 * byte_10000A888[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100006870 + 4 * byte_10000A88D[v4]))();
}

_BYTE *sub_100006850(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100006870(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100006878(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100006880(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100006888(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100006890(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Request.CodingKeys()
{
  return &type metadata for Request.CodingKeys;
}

uint64_t _s23NewsEngagementExtension7CommandOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s23NewsEngagementExtension7CommandOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100006988 + 4 * byte_10000A897[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1000069BC + 4 * byte_10000A892[v4]))();
}

uint64_t sub_1000069BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000069C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000069CCLL);
  return result;
}

uint64_t sub_1000069D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000069E0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1000069E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000069EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000069F8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100006A00(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Command()
{
  return &type metadata for Command;
}

unint64_t sub_100006A1C()
{
  unint64_t result;

  result = qword_100010568;
  if (!qword_100010568)
  {
    result = swift_getWitnessTable(&unk_10000ACD0, &type metadata for Command);
    atomic_store(result, (unint64_t *)&qword_100010568);
  }
  return result;
}

unint64_t sub_100006A64()
{
  unint64_t result;

  result = qword_100010570;
  if (!qword_100010570)
  {
    result = swift_getWitnessTable(&unk_10000AD88, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010570);
  }
  return result;
}

unint64_t sub_100006AAC()
{
  unint64_t result;

  result = qword_100010578;
  if (!qword_100010578)
  {
    result = swift_getWitnessTable(&unk_10000ACF8, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010578);
  }
  return result;
}

unint64_t sub_100006AF4()
{
  unint64_t result;

  result = qword_100010580;
  if (!qword_100010580)
  {
    result = swift_getWitnessTable(&unk_10000AD20, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010580);
  }
  return result;
}

unint64_t sub_100006B38()
{
  unint64_t result;

  result = qword_100010588;
  if (!qword_100010588)
  {
    result = swift_getWitnessTable(&unk_10000AC58, &type metadata for Command);
    atomic_store(result, (unint64_t *)&qword_100010588);
  }
  return result;
}

unint64_t sub_100006B7C(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C4D8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

uint64_t sub_100006BC8(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  void *v16;
  id v17;
  uint64_t v18;

  v5 = (void *)objc_opt_self(NSJSONSerialization);
  v6 = a1[3];
  v7 = sub_100005FA8(a1, v6);
  v8 = _bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  v17 = 0;
  v9 = objc_msgSend(v5, "dataWithJSONObject:options:error:", v8, a2, &v17);
  swift_unknownObjectRelease(v8);
  v10 = v17;
  if (v9)
  {
    v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v13 = v12;

    v14 = sub_100009C04();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)(&v18, &type metadata for PluginRequest, v11, v13, &type metadata for PluginRequest, v14);
    result = sub_100009C48(v11, v13);
    if (!v2)
      return v18;
  }
  else
  {
    v16 = v10;
    _convertNSErrorToError(_:)();

    return swift_willThrow();
  }
  return result;
}

BOOL sub_100006D10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100006D24()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100006D68()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100006D90(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

double sub_100006DE0()
{
  double result;

  qword_1000105B0 = 0;
  result = 0.0;
  xmmword_100010590 = 0u;
  unk_1000105A0 = 0u;
  return result;
}

double sub_100006DF8@<D0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  NSString v20;
  id v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  void (*v29)(char *, uint64_t);
  double result;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;

  v39 = a1;
  v1 = type metadata accessor for EngagementDataManagerConfig(0);
  v37 = *(_QWORD *)(v1 - 8);
  v38 = v1;
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v36 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v5 = (char *)&v36 - v4;
  v6 = sub_100005F68(&qword_100010728);
  __chkstk_darwin(v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v36 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v36 - v17;
  v19 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v20 = String._bridgeToObjectiveC()();
  v21 = objc_msgSend(v19, "containerURLForSecurityApplicationGroupIdentifier:", v20);

  if (v21)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v21);

    v22 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v22(v8, v16, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v22(v18, v8, v9);
      URL.appendingPathComponent(_:isDirectory:)(0xD000000000000012, 0x800000010000A5B0, 1);
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v16, v9);
      EngagementDataManagerConfig.init(localStorageDirectory:)(v13);
      v24 = v36;
      v23 = v37;
      v25 = v38;
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v36, v5, v38);
      v26 = type metadata accessor for EngagementDataManager(0);
      swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
      v27 = EngagementDataManager.init(config:)(v24);
      v28 = v39;
      v39[3] = v26;
      v28[4] = (uint64_t)&protocol witness table for EngagementDataManager;
      *v28 = v27;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v25);
      v29 = *(void (**)(char *, uint64_t))(v10 + 8);
      v29(v16, v9);
      v29(v18, v9);
      return result;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  sub_100009BC8((uint64_t)v8, &qword_100010728);
  if (qword_1000104B8 != -1)
    swift_once(&qword_1000104B8, sub_100009E34);
  v31 = type metadata accessor for Logger(0);
  sub_10000979C(v31, (uint64_t)qword_100011730);
  v32 = Logger.logObject.getter();
  v33 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Error while loading container for News. Ensure you have access to the application group folder.", v34, 2u);
    swift_slowDealloc(v34, -1, -1);
  }

  v35 = v39;
  v39[4] = 0;
  result = 0.0;
  *(_OWORD *)v35 = 0u;
  *((_OWORD *)v35 + 1) = 0u;
  return result;
}

uint64_t sub_1000071C8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  if (qword_1000104B8 != -1)
    swift_once(&qword_1000104B8, sub_100009E34);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_10000979C(v12, (uint64_t)qword_100011730);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "PerformRequest: Asking Manager for properties", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  v17 = a1[3];
  v18 = a1[4];
  sub_100005FA8(a1, v17);
  v19 = (_QWORD *)swift_allocObject(&unk_10000CB20, 56, 7);
  v19[2] = a2;
  v19[3] = a3;
  v19[4] = a4;
  v19[5] = a5;
  v19[6] = a6;
  swift_bridgeObjectRetain(a3);
  swift_retain(a5);
  dispatch thunk of EngagementCollectorManagerType.getProperties(propertyName:completion:)(a2, a3, sub_100009A28, v19, v17, v18);
  return swift_release(v19);
}

uint64_t sub_100007330(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t *, _QWORD), uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t inited;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint8_t *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  char *v57;
  char v58[56];
  char v59[80];
  uint64_t v60;
  uint64_t v61[3];
  uint64_t v62;

  v10 = sub_100005F68(&qword_1000106F0);
  __chkstk_darwin(v10);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for StatePropertyValue(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009B84(a1, (uint64_t)v12, &qword_1000106F0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_100009BC8((uint64_t)v12, &qword_1000106F0);
    if (qword_1000104B8 != -1)
      swift_once(&qword_1000104B8, sub_100009E34);
    v17 = type metadata accessor for Logger(0);
    sub_10000979C(v17, (uint64_t)qword_100011730);
    v18 = swift_bridgeObjectRetain_n(a3, 2);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(12, -1);
      v22 = swift_slowAlloc(32, -1);
      v61[0] = v22;
      *(_DWORD *)v21 = 136315138;
      swift_bridgeObjectRetain(a3);
      v60 = sub_10000814C(a2, a3, v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, v61, v21 + 4, v21 + 12);
      swift_bridgeObjectRelease_n(a3, 3);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to get propertyValues for %s, returning empty response", v21, 0xCu);
      swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v21, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a3, 2);
    }
    v50 = sub_100009A38();
    v62 = sub_100005F68(&qword_1000106F8);
    v61[0] = v50;
    a4(v61, 0);
  }
  else
  {
    v23 = (*(uint64_t (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    v57 = v16;
    v24 = StatePropertyValue.value.getter(v23);
    v25 = sub_100005F68(&qword_1000106F8);
    v62 = v25;
    v61[0] = v24;
    v26 = sub_100005F68(&qword_100010700);
    inited = swift_initStackObject(v26, v59);
    v56 = xmmword_10000AE60;
    *(_OWORD *)(inited + 16) = xmmword_10000AE60;
    *(_QWORD *)(inited + 32) = 0x65736E6F70736572;
    *(_QWORD *)(inited + 40) = 0xE800000000000000;
    sub_100009B30((uint64_t)v61, inited + 48);
    v28 = sub_100007B00(inited);
    v29 = sub_100005F68(&qword_100010708);
    v30 = swift_initStackObject(v29, v58);
    *(_OWORD *)(v30 + 16) = v56;
    strcpy((char *)(v30 + 32), "json-payload");
    *(_BYTE *)(v30 + 45) = 0;
    *(_WORD *)(v30 + 46) = -5120;
    *(_QWORD *)(v30 + 48) = v28;
    v31 = sub_100007C34(v30);
    v32 = sub_100007D4C(v31);
    swift_bridgeObjectRelease(v31);
    sub_100006010(v61);
    if (qword_1000104B8 != -1)
      swift_once(&qword_1000104B8, sub_100009E34);
    v33 = type metadata accessor for Logger(0);
    sub_10000979C(v33, (uint64_t)qword_100011730);
    v34 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "PerformRequest: Sending value back to AMS", v36, 2u);
      swift_slowDealloc(v36, -1, -1);
    }

    v37 = swift_bridgeObjectRetain_n(v32, 2);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = swift_slowAlloc(12, -1);
      v55 = a5;
      v41 = (uint8_t *)v40;
      v42 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v56 = a4;
      v54 = v42;
      v61[0] = v42;
      *(_DWORD *)v41 = 136315138;
      v52 = v41 + 4;
      v43 = swift_bridgeObjectRetain(v32);
      v53 = (char *)&type metadata for Any + 8;
      v44 = v25;
      v45 = Dictionary.description.getter(v43, &type metadata for String);
      v47 = v46;
      swift_bridgeObjectRelease(v32);
      v48 = v45;
      v25 = v44;
      v60 = sub_10000814C(v48, v47, v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, v61, v52, v41 + 12);
      swift_bridgeObjectRelease_n(v32, 2);
      swift_bridgeObjectRelease(v47);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Plugin Response = %s", v41, 0xCu);
      v49 = v54;
      swift_arrayDestroy(v54, 1, v53);
      a4 = (void (*)(uint64_t *, _QWORD))v56;
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v41, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v32, 2);
    }
    v62 = v25;
    v61[0] = v32;
    a4(v61, 0);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v57, v13);
  }
  return sub_100009BC8((uint64_t)v61, &qword_1000106A8);
}

uint64_t sub_100007948(uint64_t a1)
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

void sub_1000079F0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;

  sub_100009B84(a1, (uint64_t)v11, &qword_1000106A8);
  v5 = v12;
  if (!v12)
  {
    v10 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = sub_100005FA8(v11, v12);
  v7 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = _bridgeAnythingToObjectiveC<A>(_:)(v9, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_100006010(v11);
  if (a2)
LABEL_3:
    a2 = (void *)_convertErrorToNSError(_:)(a2);
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v10, a2);
  swift_unknownObjectRelease(v10);

}

unint64_t sub_100007B00(uint64_t a1)
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
  sub_100005F68(&qword_100010710);
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
    sub_100009B84(v7, (uint64_t)&v16, &qword_100010720);
    v8 = v16;
    v9 = v17;
    result = sub_10000878C(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100009B6C(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_100007C34(uint64_t a1)
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
  sub_100005F68(&qword_100010718);
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
    swift_bridgeObjectRetain(v9);
    result = sub_10000878C(v7, v8);
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
    v4[2] = v15;
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

unint64_t sub_100007D4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  unint64_t result;
  int64_t i;
  uint64_t *v11;
  char *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _OWORD v47[2];

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100005F68(&qword_100010710);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v38 = v1 + 64;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 64);
  v37 = (unint64_t)(63 - v4) >> 6;
  v7 = &v44;
  v8 = &v46;
  result = swift_bridgeObjectRetain(v1);
  i = 0;
  v11 = (uint64_t *)&unk_1000106F8;
  v12 = (char *)&type metadata for Any + 8;
  if (v6)
    goto LABEL_10;
LABEL_11:
  v21 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v21 >= v37)
    goto LABEL_32;
  v22 = *(_QWORD *)(v38 + 8 * v21);
  v23 = i + 1;
  if (!v22)
  {
    v23 = i + 2;
    if (i + 2 >= v37)
      goto LABEL_32;
    v22 = *(_QWORD *)(v38 + 8 * v23);
    if (!v22)
    {
      v23 = i + 3;
      if (i + 3 >= v37)
        goto LABEL_32;
      v22 = *(_QWORD *)(v38 + 8 * v23);
      if (!v22)
      {
        v23 = i + 4;
        if (i + 4 >= v37)
          goto LABEL_32;
        v22 = *(_QWORD *)(v38 + 8 * v23);
        if (!v22)
        {
          v24 = i + 5;
          if (i + 5 < v37)
          {
            v22 = *(_QWORD *)(v38 + 8 * v24);
            if (v22)
            {
              v23 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v23 = v24 + 1;
              if (__OFADD__(v24, 1))
                goto LABEL_36;
              if (v23 >= v37)
                break;
              v22 = *(_QWORD *)(v38 + 8 * v23);
              ++v24;
              if (v22)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_100009B7C(v1);
          return (unint64_t)v3;
        }
      }
    }
  }
LABEL_26:
  v40 = (v22 - 1) & v22;
  v20 = __clz(__rbit64(v22)) + (v23 << 6);
  for (i = v23; ; v20 = __clz(__rbit64(v6)) | (i << 6))
  {
    v25 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v20);
    v26 = v25[1];
    v27 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v20);
    v42 = *v25;
    v43 = v26;
    v41 = v27;
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v27);
    v28 = sub_100005F68(v11);
    swift_dynamicCast(v7, &v41, v28, v12, 7);
    v29 = v42;
    v30 = v43;
    sub_100009B6C(v7, v8);
    sub_100009B6C(v8, v47);
    sub_100009B6C(v47, &v45);
    result = sub_10000878C(v29, v30);
    v31 = result;
    if ((v32 & 1) != 0)
    {
      v39 = i;
      v13 = v8;
      v14 = v7;
      v15 = v1;
      v16 = v12;
      v17 = v11;
      v18 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease(v18[1]);
      *v18 = v29;
      v18[1] = v30;
      v11 = v17;
      v12 = v16;
      v1 = v15;
      v7 = v14;
      v8 = v13;
      i = v39;
      v19 = (_QWORD *)(v3[7] + 32 * v31);
      sub_100006010(v19);
      result = (unint64_t)sub_100009B6C(&v45, v19);
      v6 = v40;
      if (!v40)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v33 = (uint64_t *)(v3[6] + 16 * result);
    *v33 = v29;
    v33[1] = v30;
    result = (unint64_t)sub_100009B6C(&v45, (_OWORD *)(v3[7] + 32 * result));
    v34 = v3[2];
    v35 = __OFADD__(v34, 1);
    v36 = v34 + 1;
    if (v35)
      goto LABEL_34;
    v3[2] = v36;
    v6 = v40;
    if (!v40)
      goto LABEL_11;
LABEL_10:
    v40 = (v6 - 1) & v6;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id sub_1000080F0(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for NewsEngagementPluginProvider()
{
  return objc_opt_self(_TtC23NewsEngagementExtension28NewsEngagementPluginProvider);
}

uint64_t sub_10000814C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_10000821C(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_100009B30((uint64_t)v13, *a3);
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
      sub_100009B30((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006010(v13);
  return v8;
}

uint64_t sub_10000821C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000083D4(a5, a6);
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

uint64_t sub_1000083D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100008468(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100008640(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100008640(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100008468(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000085DC(v4, 0);
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

_QWORD *sub_1000085DC(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005F68(&qword_100010738);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100008640(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005F68(&qword_100010738);
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

unint64_t sub_10000878C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000087F0(a1, a2, v5);
}

unint64_t sub_1000087F0(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_1000088D0(_QWORD *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
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
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  Swift::String v25;
  __int128 v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  Swift::String v48;
  Swift::String v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  unint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE v75[8];
  __int128 aBlock;
  __int128 v77;
  uint64_t v78[5];
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v68 = a2;
  v63 = type metadata accessor for DispatchWorkItemFlags(0);
  v73 = *(_QWORD *)(v63 - 8);
  __chkstk_darwin(v63);
  v72 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v65 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v67 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v7);
  v64 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = type metadata accessor for DispatchQoS(0);
  v70 = *(_QWORD *)(v71 - 8);
  __chkstk_darwin(v71);
  v69 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = swift_allocObject(&unk_10000CAA8, 24, 7);
  *(_QWORD *)(v74 + 16) = a3;
  _Block_copy(a3);
  if (qword_1000104B8 != -1)
    swift_once(&qword_1000104B8, sub_100009E34);
  v14 = sub_10000979C(v10, (uint64_t)qword_100011730);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Received request.", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

  v18 = (void *)objc_opt_self(NSJSONSerialization);
  v19 = a1[3];
  v20 = sub_100005FA8(a1, v19);
  v21 = _bridgeAnythingToObjectiveC<A>(_:)(v20, v19);
  LODWORD(v18) = objc_msgSend(v18, "isValidJSONObject:", v21);
  swift_unknownObjectRelease(v21);
  if ((_DWORD)v18)
  {
    v22 = type metadata accessor for JSONDecoder(0);
    swift_allocObject(v22, *(unsigned int *)(v22 + 48), *(unsigned __int16 *)(v22 + 52));
    v23 = JSONDecoder.init()();
    v42 = sub_100006BC8(a1, 0);
    swift_release(v23);
    if (qword_1000104B0 != -1)
      swift_once(&qword_1000104B0, sub_100006DE0);
    v43 = sub_100006DF8((uint64_t *)&aBlock);
    swift_beginAccess(&xmmword_100010590, &v79, 33, 0, v43);
    sub_1000097F8((uint64_t)&aBlock, (uint64_t)&xmmword_100010590);
    swift_endAccess(&v79);
    sub_100009B84((uint64_t)&xmmword_100010590, (uint64_t)&aBlock, &qword_1000106B0);
    if (*((_QWORD *)&v77 + 1))
    {
      sub_100009840(&aBlock, (uint64_t)&v79);
      v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
      v45 = Logger.logObject.getter(v44);
      v46 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc(12, -1);
        v61 = swift_slowAlloc(32, -1);
        v78[0] = v61;
        *(_DWORD *)v47 = 136380675;
        *(_QWORD *)&aBlock = 0;
        *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
        v48._countAndFlagsBits = 0x646E616D6D6F635BLL;
        v48._object = (void *)0xEA0000000000203ALL;
        String.append(_:)(v48);
        v62 = v42;
        v75[0] = v42;
        _print_unlocked<A, B>(_:_:)(v75, &aBlock, &type metadata for JsonPayload, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        v49._countAndFlagsBits = 93;
        v49._object = (void *)0xE100000000000000;
        String.append(_:)(v49);
        v50 = *((_QWORD *)&aBlock + 1);
        *(_QWORD *)&aBlock = sub_10000814C(aBlock, *((unint64_t *)&aBlock + 1), v78);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 8, v47 + 4, v47 + 12);
        swift_bridgeObjectRelease(v50);
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "performRequest: receivedRequest = %{private}s", v47, 0xCu);
        v51 = v61;
        swift_arrayDestroy(v61, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v51, -1, -1);
        swift_slowDealloc(v47, -1, -1);

        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        v52 = v62;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        v52 = v42;
      }
      __asm { BR              X10 }
    }
    v54 = sub_100009BC8((uint64_t)&aBlock, &qword_1000106B0);
    v55 = Logger.logObject.getter(v54);
    v56 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "Failed to instantiate manager", v57, 2u);
      swift_slowDealloc(v57, -1, -1);
    }

    v58 = sub_1000097B4();
    aBlock = 0u;
    v77 = 0u;
    v33 = swift_allocError(&type metadata for NewsEngagementPluginError, v58, 0, 0);
    *v59 = 0;
  }
  else
  {
    *(_QWORD *)&aBlock = 0;
    *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
    v24._countAndFlagsBits = 91;
    v24._object = (void *)0xE100000000000000;
    String.append(_:)(v24);
    _print_unlocked<A, B>(_:_:)(a1, &aBlock, (char *)&type metadata for Any + 8, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v25._countAndFlagsBits = 93;
    v25._object = (void *)0xE100000000000000;
    String.append(_:)(v25);
    v26 = aBlock;
    v27 = swift_bridgeObjectRetain(*((_QWORD *)&aBlock + 1));
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(12, -1);
      v31 = swift_slowAlloc(32, -1);
      *(_QWORD *)&aBlock = v31;
      *(_DWORD *)v30 = 136315138;
      swift_bridgeObjectRetain(*((_QWORD *)&v26 + 1));
      v79 = sub_10000814C(v26, *((unint64_t *)&v26 + 1), (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v30 + 4, v30 + 12);
      swift_bridgeObjectRelease_n(*((_QWORD *)&v26 + 1), 3);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Invalid input = %s", v30, 0xCu);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v30, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(*((_QWORD *)&v26 + 1), 2);
    }
    v32 = sub_1000097B4();
    aBlock = 0u;
    v77 = 0u;
    v33 = swift_allocError(&type metadata for NewsEngagementPluginError, v32, 0, 0);
    *v34 = 2;
  }
  sub_100009B84((uint64_t)&aBlock, (uint64_t)&v79, &qword_1000106A8);
  v35 = v81;
  if (v81)
  {
    v36 = sub_100005FA8(&v79, v81);
    v37 = *(_QWORD *)(v35 - 8);
    __chkstk_darwin(v36);
    v39 = (char *)&v60 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v37 + 16))(v39);
    v40 = _bridgeAnythingToObjectiveC<A>(_:)(v39, v35);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v35);
    sub_100006010(&v79);
  }
  else
  {
    v40 = 0;
  }
  v41 = (void *)_convertErrorToNSError(_:)(v33);
  ((void (**)(_QWORD, uint64_t, void *))a3)[2](a3, v40, v41);
  swift_unknownObjectRelease(v40);

  swift_errorRelease(v33);
  sub_100009BC8((uint64_t)&aBlock, &qword_1000106A8);
  return swift_release(v74);
}

uint64_t sub_100009770()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100009794(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_1000079F0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10000979C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_1000097B4()
{
  unint64_t result;

  result = qword_1000106A0;
  if (!qword_1000106A0)
  {
    result = swift_getWitnessTable(&unk_10000AF64, &type metadata for NewsEngagementPluginError);
    atomic_store(result, (unint64_t *)&qword_1000106A0);
  }
  return result;
}

uint64_t sub_1000097F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005F68(&qword_1000106B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009840(__int128 *a1, uint64_t a2)
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

unint64_t sub_100009858()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000106B8;
  if (!qword_1000106B8)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000106B8);
  }
  return result;
}

uint64_t sub_100009894(uint64_t *a1)
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

uint64_t sub_1000098D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000991C()
{
  _QWORD *v0;

  sub_100006010(v0 + 2);
  swift_bridgeObjectRelease(v0[8]);
  swift_release(v0[10]);
  return swift_deallocObject(v0, 96, 7);
}

uint64_t sub_100009950()
{
  _QWORD *v0;

  return sub_1000071C8(v0 + 2, v0[7], v0[8], v0[9], v0[10], v0[11]);
}

uint64_t sub_100009964(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009974(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000997C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000099BC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100009894(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000099FC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100009A28(uint64_t a1)
{
  uint64_t v1;

  return sub_100007330(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(uint64_t *, _QWORD))(v1 + 32), *(_QWORD *)(v1 + 40));
}

unint64_t sub_100009A38()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE v8[56];
  _BYTE v9[80];
  _QWORD v10[4];

  v10[3] = sub_100005F68(&qword_1000106F8);
  v10[0] = &_swiftEmptyDictionarySingleton;
  v0 = sub_100005F68(&qword_100010700);
  inited = swift_initStackObject(v0, v9);
  *(_OWORD *)(inited + 16) = xmmword_10000AE60;
  *(_QWORD *)(inited + 32) = 0x65736E6F70736572;
  *(_QWORD *)(inited + 40) = 0xE800000000000000;
  sub_100009B30((uint64_t)v10, inited + 48);
  v2 = sub_100007B00(inited);
  v3 = sub_100005F68(&qword_100010708);
  v4 = swift_initStackObject(v3, v8);
  *(_OWORD *)(v4 + 16) = xmmword_10000AE60;
  strcpy((char *)(v4 + 32), "json-payload");
  *(_BYTE *)(v4 + 45) = 0;
  *(_WORD *)(v4 + 46) = -5120;
  *(_QWORD *)(v4 + 48) = v2;
  v5 = sub_100007C34(v4);
  v6 = sub_100007D4C(v5);
  swift_bridgeObjectRelease(v5);
  sub_100006010(v10);
  return v6;
}

uint64_t sub_100009B30(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100009B6C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100009B7C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100009B84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005F68(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009BC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005F68(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100009C04()
{
  unint64_t result;

  result = qword_100010730;
  if (!qword_100010730)
  {
    result = swift_getWitnessTable(&unk_10000A97C, &type metadata for PluginRequest);
    atomic_store(result, (unint64_t *)&qword_100010730);
  }
  return result;
}

uint64_t sub_100009C48(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t getEnumTagSinglePayload for NewsEngagementPluginError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NewsEngagementPluginError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100009D6C + 4 * byte_10000AE99[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100009DA0 + 4 * byte_10000AE94[v4]))();
}

uint64_t sub_100009DA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009DA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100009DB0);
  return result;
}

uint64_t sub_100009DBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100009DC4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100009DC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009DD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NewsEngagementPluginError()
{
  return &type metadata for NewsEngagementPluginError;
}

unint64_t sub_100009DF0()
{
  unint64_t result;

  result = qword_100010740;
  if (!qword_100010740)
  {
    result = swift_getWitnessTable(&unk_10000AF3C, &type metadata for NewsEngagementPluginError);
    atomic_store(result, (unint64_t *)&qword_100010740);
  }
  return result;
}

uint64_t sub_100009E34()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100009EB4(v0, qword_100011730);
  sub_10000979C(v0, (uint64_t)qword_100011730);
  return Logger.init(subsystem:category:)(0xD000000000000019, 0x800000010000A810, 0xD000000000000017, 0x800000010000A830);
}

uint64_t *sub_100009EB4(uint64_t a1, uint64_t *a2)
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

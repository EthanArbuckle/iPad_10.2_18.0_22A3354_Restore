uint64_t sub_100001BB8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  URL.init(fileURLWithPath:)(a1, 0xD000000000000017, 0x8000000100003B90);
  v2 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

uint64_t sub_100001C14()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;

  type metadata accessor for String.Encoding(0);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)&v26 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for URL.DirectoryHint(0);
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000209C(&qword_100008010);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (uint64_t *)((char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v26 - v13;
  URL.init(fileURLWithPath:)(v7, 0xD000000000000017, 0x8000000100003B90);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1000020DC((uint64_t)v7);
    v15 = sub_10000209C(&qword_100008018);
    v16 = swift_allocObject(v15, 64, 7);
    *(_OWORD *)(v16 + 16) = xmmword_100003980;
    *(_QWORD *)(v16 + 56) = &type metadata for String;
    *(_QWORD *)(v16 + 32) = 0xD000000000000020;
    *(_QWORD *)(v16 + 40) = 0x8000000100003BB0;
    print(_:separator:terminator:)(v16, 32, 0xE100000000000000, 10, 0xE100000000000000);
    return swift_bridgeObjectRelease(v16);
  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v9 + 32))(v14, v7, v8);
    v27 = 0xD000000000000012;
    v28 = 0x8000000100003BE0;
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for URL.DirectoryHint.inferFromPath(_:), v2);
    v18 = sub_10000211C();
    URL.appending<A>(path:directoryHint:)(&v27, v5, &type metadata for String, v18);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v19 = swift_bridgeObjectRelease(v28);
    static String.Encoding.utf8.getter(v19);
    v20 = String.init(contentsOf:encoding:)(v12, v1);
    v22 = v21;
    v23 = *(void (**)(char *, uint64_t))(v9 + 8);
    v23(v12, v8);
    v24 = sub_10000209C(&qword_100008018);
    v25 = swift_allocObject(v24, 64, 7);
    *(_OWORD *)(v25 + 16) = xmmword_100003980;
    *(_QWORD *)(v25 + 56) = &type metadata for String;
    *(_QWORD *)(v25 + 32) = v20;
    *(_QWORD *)(v25 + 40) = v22;
    print(_:separator:terminator:)(v25, 32, 0xE100000000000000, 10, 0xE100000000000000);
    swift_bridgeObjectRelease(v25);
    return ((uint64_t (*)(char *, uint64_t))v23)(v14, v8);
  }
}

uint64_t sub_10000209C(uint64_t *a1)
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

uint64_t sub_1000020DC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000209C(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000211C()
{
  unint64_t result;

  result = qword_100008020;
  if (!qword_100008020)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t sub_100002160()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD aBlock[5];
  uint64_t v28;

  v24 = type metadata accessor for DispatchTimeInterval(0);
  v0 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v2 = (uint64_t *)((char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = type metadata accessor for DispatchTime(0);
  v23 = *(_QWORD *)(v25 - 8);
  v3 = __chkstk_darwin(v25);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v23 - v6;
  v8 = objc_msgSend(objc_allocWithZone((Class)SoftwareTransparency), "initWithApplication:", 0);
  v9 = dispatch_semaphore_create(0);
  v10 = swift_allocObject(&unk_1000042B0, 32, 7);
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  v11 = swift_allocObject(&unk_1000042D8, 32, 7);
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v9;
  aBlock[4] = sub_100002584;
  v28 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000258C;
  aBlock[3] = &unk_1000042F0;
  v12 = _Block_copy(aBlock);
  v13 = v28;
  swift_retain(v10);
  v14 = v9;
  swift_release(v13);
  v26 = v8;
  objc_msgSend(v8, "sysdiagnoseInfoWithCompletion:", v12);
  _Block_release(v12);
  static DispatchTime.now()();
  *v2 = 2500;
  v15 = v24;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v0 + 104))(v2, enum case for DispatchTimeInterval.milliseconds(_:), v24);
  + infix(_:_:)(v5, v2);
  (*(void (**)(_QWORD *, uint64_t))(v0 + 8))(v2, v15);
  v16 = *(void (**)(char *, uint64_t))(v23 + 8);
  v17 = v25;
  v16(v5, v25);
  LOBYTE(v15) = OS_dispatch_semaphore.wait(timeout:)(v7);
  v16(v7, v17);
  if ((v15 & 1) != 0 || (swift_beginAccess(v10 + 16, aBlock, 0, 0), (v18 = *(_QWORD *)(v10 + 24)) == 0))
  {

    swift_release(v10);
    return 0;
  }
  else
  {
    v19 = *(_QWORD *)(v10 + 16);
    v20 = sub_10000209C(&qword_100008018);
    v21 = swift_allocObject(v20, 64, 7);
    *(_OWORD *)(v21 + 16) = xmmword_100003980;
    *(_QWORD *)(v21 + 56) = &type metadata for String;
    *(_QWORD *)(v21 + 32) = v19;
    *(_QWORD *)(v21 + 40) = v18;
    swift_bridgeObjectRetain(v18);
    print(_:separator:terminator:)(v21, 32, 0xE100000000000000, 10, 0xE100000000000000);
    swift_release(v10);
    swift_bridgeObjectRelease(v21);

    return 1;
  }
}

uint64_t sub_100002454()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100002478(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[24];

  v6 = type metadata accessor for String.Encoding(0);
  result = __chkstk_darwin(v6);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a2 >> 60 != 15)
  {
    v10 = sub_1000035F4(a1, a2);
    static String.Encoding.utf8.getter(v10);
    v11 = String.init(data:encoding:)(a1, a2, v9);
    if (v12)
    {
      v13 = v11;
      v14 = v12;
      swift_beginAccess(a3 + 16, v17, 1, 0);
      v15 = *(_QWORD *)(a3 + 24);
      *(_QWORD *)(a3 + 16) = v13;
      *(_QWORD *)(a3 + 24) = v14;
      swift_bridgeObjectRelease(v15);
      OS_dispatch_semaphore.signal()();
    }
    return sub_10000359C(a1, a2);
  }
  return result;
}

uint64_t sub_100002558()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100002584(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_100002478(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10000258C(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void (*v6)(void *, unint64_t, void *);
  id v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v4 = a2;
  v6 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    swift_retain(v5);
    v7 = v4;
    v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v9 = v8;

  }
  else
  {
    swift_retain(v5);
    v9 = 0xF000000000000000;
  }
  v10 = a3;
  v6(v4, v9, a3);

  sub_10000359C((uint64_t)v4, v9);
  return swift_release(v5);
}

uint64_t sub_100002620(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100002630(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t transparencySysdiagnose.init()()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  sub_10000209C(&qword_100008028);
  __chkstk_darwin();
  v1 = (char *)&v7 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NameSpecification(0);
  v2 = __chkstk_darwin();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static NameSpecification.long.getter(v2);
  ArgumentHelp.init(stringLiteral:)(0xD000000000000013, 0x8000000100003C50);
  v5 = type metadata accessor for ArgumentHelp(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 0, 1, v5);
  return Flag<A>.init(wrappedValue:name:help:)(0, v4, v1);
}

uint64_t variable initialization expression of transparencySysdiagnose._useFallback()
{
  return 0;
}

uint64_t property wrapper backing initializer of transparencySysdiagnose.useFallback(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  sub_10000209C(&qword_100008028);
  __chkstk_darwin();
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NameSpecification(0);
  v4 = __chkstk_darwin();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static NameSpecification.long.getter(v4);
  ArgumentHelp.init(stringLiteral:)(0xD000000000000013, 0x8000000100003C50);
  v7 = type metadata accessor for ArgumentHelp(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 0, 1, v7);
  return Flag<A>.init(wrappedValue:name:help:)(a1, v6, v3);
}

uint64_t sub_10000282C()
{
  uint64_t v0;
  uint64_t var1;

  v0 = sub_10000209C(&qword_100008030);
  Flag.wrappedValue.getter(&var1, v0);
  return var1;
}

uint64_t sub_10000285C(char a1)
{
  uint64_t v1;
  char v3;

  v3 = a1;
  v1 = sub_10000209C(&qword_100008030);
  return Flag.wrappedValue.setter(&v3, v1);
}

void (*sub_100002890(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v3 = sub_10000209C(&qword_100008030);
  v2[4] = Flag.wrappedValue.modify(v2, v3);
  return sub_1000028E8;
}

void sub_1000028E8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> transparencySysdiagnose.run()()
{
  uint64_t v0;
  uint64_t var1;

  v0 = sub_10000209C(&qword_100008030);
  Flag.wrappedValue.getter(&var1, v0);
  if ((var1 & 1) != 0 || (sub_100002160() & 1) == 0)
    sub_100001C14();
}

uint64_t sub_100002960()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for transparencySysdiagnose(0);
  v1 = sub_10000309C(&qword_100008038, (uint64_t)&protocol conformance descriptor for transparencySysdiagnose);
  return static ParsableCommand.main()(v0, v1);
}

uint64_t type metadata accessor for transparencySysdiagnose(uint64_t a1)
{
  uint64_t result;

  result = qword_100008280;
  if (!qword_100008280)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for transparencySysdiagnose);
  return result;
}

uint64_t sub_1000029E0()
{
  return 1;
}

Swift::Int sub_1000029E8()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_100002A28()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100002A4C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100002A88()
{
  return 0x626C6C6146657375;
}

uint64_t sub_100002AA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x626C6C6146657375 && a2 == 0xEB000000006B6361)
  {
    result = swift_bridgeObjectRelease(0xEB000000006B6361);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x626C6C6146657375, 0xEB000000006B6361, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_100002B54()
{
  return 0;
}

void sub_100002B60(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100002B6C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100002E64();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100002B94(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100002E64();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t transparencySysdiagnose.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;

  v27 = a2;
  v3 = sub_10000209C(&qword_100008030);
  v26 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v28 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10000209C(&qword_100008040);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000209C(&qword_100008028);
  __chkstk_darwin(v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for NameSpecification(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for transparencySysdiagnose(0);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static NameSpecification.long.getter(v16);
  ArgumentHelp.init(stringLiteral:)(0xD000000000000013, 0x8000000100003C50);
  v19 = type metadata accessor for ArgumentHelp(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v11, 0, 1, v19);
  Flag<A>.init(wrappedValue:name:help:)(0, v14, v11);
  v20 = a1[3];
  v21 = a1[4];
  sub_100002E40(a1, v20);
  v22 = sub_100002E64();
  v23 = v29;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for transparencySysdiagnose.CodingKeys, &type metadata for transparencySysdiagnose.CodingKeys, v22, v20, v21);
  if (!v23)
  {
    sub_100002F04();
    KeyedDecodingContainer.decode<A>(_:forKey:)(v3);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v18, v28, v3);
    sub_100002F94((uint64_t)v18, v27);
  }
  sub_100002EA8(a1);
  return sub_100002EC8((uint64_t)v18);
}

_QWORD *sub_100002E40(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100002E64()
{
  unint64_t result;

  result = qword_1000080F0[0];
  if (!qword_1000080F0[0])
  {
    result = swift_getWitnessTable(&unk_100003B5C, &type metadata for transparencySysdiagnose.CodingKeys);
    atomic_store(result, qword_1000080F0);
  }
  return result;
}

uint64_t sub_100002EA8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100002EC8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for transparencySysdiagnose(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100002F04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008048;
  if (!qword_100008048)
  {
    v1 = sub_100002F50(&qword_100008030);
    result = swift_getWitnessTable(&protocol conformance descriptor for Flag<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100008048);
  }
  return result;
}

uint64_t sub_100002F50(uint64_t *a1)
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

uint64_t sub_100002F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for transparencySysdiagnose(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_100002FE0()
{
  ParsableArguments.validate()();
}

uint64_t sub_100002FF8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return transparencySysdiagnose.init(from:)(a1, a2);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for transparencySysdiagnose(0);
  v4 = sub_10000309C(&qword_100008038, (uint64_t)&protocol conformance descriptor for transparencySysdiagnose);
  static ParsableCommand.main()(v3, v4);
  return 0;
}

uint64_t sub_100003054()
{
  return sub_10000309C(&qword_100008050, (uint64_t)&protocol conformance descriptor for transparencySysdiagnose);
}

uint64_t sub_100003078()
{
  return sub_10000309C(&qword_100008058, (uint64_t)&protocol conformance descriptor for transparencySysdiagnose);
}

uint64_t sub_10000309C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for transparencySysdiagnose(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000209C(&qword_100008030);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for transparencySysdiagnose(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000209C(&qword_100008030);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000209C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000209C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000209C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for transparencySysdiagnose(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000209C(&qword_100008030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for transparencySysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100003280);
}

uint64_t sub_100003280(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000209C(&qword_100008030);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for transparencySysdiagnose(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000032CC);
}

uint64_t sub_1000032CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000209C(&qword_100008030);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_100003310(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_100003378();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
  }
}

void sub_100003378()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1000080B8)
  {
    v0 = type metadata accessor for Flag(0, &type metadata for Bool);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1000080B8);
  }
}

uint64_t getEnumTagSinglePayload for transparencySysdiagnose.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for transparencySysdiagnose.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100003464 + 4 * byte_1000039A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100003484 + 4 * byte_1000039A5[v4]))();
}

_BYTE *sub_100003464(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100003484(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000348C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100003494(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000349C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000034A4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for transparencySysdiagnose.CodingKeys()
{
  return &type metadata for transparencySysdiagnose.CodingKeys;
}

unint64_t sub_1000034C8()
{
  unint64_t result;

  result = qword_100008390[0];
  if (!qword_100008390[0])
  {
    result = swift_getWitnessTable(&unk_100003B34, &type metadata for transparencySysdiagnose.CodingKeys);
    atomic_store(result, qword_100008390);
  }
  return result;
}

unint64_t sub_100003510()
{
  unint64_t result;

  result = qword_1000084A0;
  if (!qword_1000084A0)
  {
    result = swift_getWitnessTable(&unk_100003AA4, &type metadata for transparencySysdiagnose.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000084A0);
  }
  return result;
}

unint64_t sub_100003558()
{
  unint64_t result;

  result = qword_1000084A8[0];
  if (!qword_1000084A8[0])
  {
    result = swift_getWitnessTable(&unk_100003ACC, &type metadata for transparencySysdiagnose.CodingKeys);
    atomic_store(result, qword_1000084A8);
  }
  return result;
}

uint64_t sub_10000359C(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1000035B0(result, a2);
  return result;
}

uint64_t sub_1000035B0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000035F4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

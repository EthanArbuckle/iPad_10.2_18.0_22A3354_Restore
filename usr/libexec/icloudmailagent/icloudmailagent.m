uint64_t start()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  v0 = objc_autoreleasePoolPush();
  v1 = _MCCLogSystem();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "icloudmailagent is starting up...", buf, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCCAgentConnectionManager sharedInstance](_TtC15icloudmailagent25MCCAgentConnectionManager, "sharedInstance"));
  objc_msgSend(v3, "start");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CategorizationManager sharedInstance](CategorizationManager, "sharedInstance"));
  objc_msgSend(v4, "start");

  objc_autoreleasePoolPop(v0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v5, "run");

  v6 = _MCCLogSystem();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "icloudmailagent is shutting down...", v9, 2u);
  }

  return 0;
}

uint64_t sub_100003AC4(void *a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::String v10;

  if (a1 == (void *)2)
    return 0xD000000000000013;
  if (a1 == (void *)1)
    return 0x4349464954524543;
  if (a1
    && (type metadata accessor for CFString(0),
        v4 = v3,
        sub_100009040(a1),
        v5 = sub_100009054((unint64_t *)&qword_10003AAE0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C148), v6 = (id)kSecAttrKeyTypeECSECPrimeRandom, LOBYTE(v4) = static _CFObject.== infix(_:_:)(v6, a1, v4, v5), v6, (v4 & 1) != 0))
  {
    v7 = 0xE200000000000000;
    v8 = 17221;
  }
  else
  {
    v7 = 0xE300000000000000;
    v8 = 4281170;
  }
  v9 = v7;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease(v7);
  v10._countAndFlagsBits = 0x4554415649525020;
  v10._object = (void *)0xEC00000059454B20;
  String.append(_:)(v10);
  sub_100009018(a1);
  return 0;
}

uint64_t sub_100003C0C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20[2];
  uint64_t v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;

  *(_QWORD *)&v22 = a1;
  *((_QWORD *)&v22 + 1) = a2;
  v23 = a3;
  v24 = a4;
  swift_bridgeObjectRetain(a4);
  v4 = sub_1000073FC(&qword_10003AAF8);
  if (swift_dynamicCast(v20, &v22, &type metadata for Substring.UTF8View, v4, 6))
  {
    sub_100009144(v20, (uint64_t)&v16);
    v5 = v18;
    v6 = v19;
    sub_10000915C(&v16, v18);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(&v22, sub_100004D60, 0, &type metadata for Data._Representation, v5, v6);
    swift_bridgeObjectRelease(a4);
    v20[0] = v22;
    sub_100009180(&v16);
  }
  else
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
    sub_1000090DC((uint64_t)v20, &qword_10003AB00);
    sub_10000520C(a1, a2, a3, a4, &v16);
    v8 = v16;
    v7 = v17;
    if (v17 >> 60 == 15)
    {
      v9 = sub_100004F10(a1, a2, a3, a4);
      *(_QWORD *)&v20[0] = sub_100005744(v9);
      *((_QWORD *)&v20[0] + 1) = v10;
      __chkstk_darwin(*(_QWORD *)&v20[0]);
      sub_100004A44();
      __asm { BR              X12 }
    }
    swift_bridgeObjectRelease(a4);
    *(_QWORD *)&v20[0] = v8;
    *((_QWORD *)&v20[0] + 1) = v7;
  }
  return *(_QWORD *)&v20[0];
}

void sub_10000405C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

unsigned __int8 *sub_1000040A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 **v4;
  const void *v5;
  char **v6;
  CC_LONG v7;
  char *v8;
  char v9;
  unsigned __int8 *result;

  v7 = BYTE6(a4);
  v8 = *v6;
  v9 = ((uint64_t (*)(char *))swift_isUniquelyReferenced_nonNull_native)(*v6);
  *v6 = v8;
  if ((v9 & 1) == 0)
    v8 = sub_10000F27C(0, *((_QWORD *)v8 + 2), 0, v8);
  *v6 = v8;
  result = CC_SHA1(v5, v7, (unsigned __int8 *)v8 + 32);
  *v4 = result;
  return result;
}

uint64_t sub_1000041D4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_100004298()
{
  qword_10003B1E8 = 0x6173755F74726563;
  unk_10003B1F0 = 0xEA00000000006567;
}

void sub_1000042C0()
{
  qword_10003B1F8 = 0x6D6D6F635F6A6273;
  unk_10003B200 = 0xEF656D616E5F6E6FLL;
}

void sub_1000042F0()
{
  qword_10003B208 = 0x67726F5F6A6273;
  unk_10003B210 = 0xE700000000000000;
}

void sub_100004314()
{
  qword_10003B218 = 0x6E756F635F6A6273;
  unk_10003B220 = 0xEB00000000797274;
}

void sub_100004340()
{
  qword_10003B228 = 0x6D6D6F635F737369;
  unk_10003B230 = 0xEF656D616E5F6E6FLL;
}

void sub_100004370()
{
  qword_10003B238 = 0x67726F5F737369;
  unk_10003B240 = 0xE700000000000000;
}

void sub_100004394()
{
  qword_10003B248 = 0x6E756F635F737369;
  unk_10003B250 = 0xEB00000000797274;
}

void sub_1000043C0()
{
  qword_10003B258 = 0x6C6169726573;
  unk_10003B260 = 0xE600000000000000;
}

void sub_1000043E0()
{
  qword_10003B268 = 0x696C61765F746F6ELL;
  unk_10003B270 = 0xEF72657466615F64;
}

void sub_100004410()
{
  qword_10003B278 = 0x5F73657269707865;
  unk_10003B280 = 0xEA00000000006E6FLL;
}

void sub_100004438()
{
  strcpy((char *)&qword_10003B288, "cert_alt_email");
  unk_10003B297 = -18;
}

void sub_100004468()
{
  qword_10003B298 = 0x64695F74726563;
  unk_10003B2A0 = 0xE700000000000000;
}

void sub_10000448C()
{
  strcpy((char *)&qword_10003A838, "Subject Name");
  unk_10003A845 = 0;
  unk_10003A846 = -5120;
}

void sub_1000044B8()
{
  qword_10003A850 = 0x4E20726575737349;
  *(_QWORD *)algn_10003A858 = 0xEB00000000656D61;
}

void sub_1000044E4()
{
  strcpy((char *)&qword_10003A868, "Serial Number");
  unk_10003A876 = -4864;
}

void sub_100004514()
{
  qword_10003A880 = 0x79746964696C6156;
  *(_QWORD *)algn_10003A888 = 0xEF646F6972655020;
}

void sub_100004544()
{
  qword_10003A898 = 0x312E39322E352E32;
  unk_10003A8A0 = 0xE900000000000035;
}

void sub_10000456C()
{
  qword_10003A8B0 = 0x332E39322E352E32;
  *(_QWORD *)algn_10003A8B8 = 0xE900000000000037;
}

void sub_100004594()
{
  qword_10003A8C8 = 0x312E39322E352E32;
  unk_10003A8D0 = 0xE900000000000037;
}

void sub_1000045BC()
{
  qword_10003A8E0 = 0x332E342E352E32;
  *(_QWORD *)algn_10003A8E8 = 0xE700000000000000;
}

void sub_1000045E0()
{
  qword_10003A8F8 = 0x30312E342E352E32;
  unk_10003A900 = 0xE800000000000000;
}

void sub_100004604()
{
  qword_10003A910 = 0x382E342E352E32;
  *(_QWORD *)algn_10003A918 = 0xE700000000000000;
}

void sub_100004628()
{
  qword_10003A928 = 0x362E342E352E32;
  unk_10003A930 = 0xE700000000000000;
}

void sub_10000464C()
{
  strcpy((char *)&qword_10003A940, "Serial Number");
  *(_WORD *)&algn_10003A948[6] = -4864;
}

void sub_10000467C()
{
  qword_10003A958 = 0x696C615620746F4ELL;
  unk_10003A960 = 0xEF72657466412064;
}

void sub_1000046AC()
{
  qword_10003A970 = 0x6567617355;
  *(_QWORD *)algn_10003A978 = 0xE500000000000000;
}

void sub_1000046CC()
{
  qword_10003A988 = 0x65736F70727550;
  unk_10003A990 = 0xE700000000000000;
}

void sub_1000046F0()
{
  strcpy((char *)&qword_10003A9A0, "Email Address");
  *(_WORD *)&algn_10003A9A8[6] = -4864;
}

void sub_100004720()
{
  qword_10003B2A8 = 0x676E696E676973;
  unk_10003B2B0 = 0xE700000000000000;
}

void sub_100004744()
{
  qword_10003B2B8 = 0x74707972636E65;
  unk_10003B2C0 = 0xE700000000000000;
}

id sub_100004768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithPattern:options:error:", v6, a3, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

uint64_t sub_100004840(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_10002C148, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

void sub_10000488C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100004894(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_10002C148, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_1000048D0(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_10002C148, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100004918(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5);
  WitnessTable = swift_getWitnessTable(&unk_10002C148, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

_QWORD *sub_100004970@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_10000497C@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!__src)
    goto LABEL_7;
  if (!a2)
  {
    __src = 0;
LABEL_7:
    v8 = 0xC000000000000000;
    goto LABEL_10;
  }
  v5 = __src;
  if (a2 <= 14)
  {
    __src = sub_100005684((_BYTE *)__src, (_BYTE *)(__src + a2));
    v8 = v9 & 0xFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = type metadata accessor for __DataStorage(0);
    swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
    v7 = __DataStorage.init(bytes:length:)(v5, a2);
    if ((unint64_t)a2 >= 0x7FFFFFFF)
    {
      v10 = type metadata accessor for Data.RangeReference(0);
      __src = swift_allocObject(v10, 32, 7);
      *(_QWORD *)(__src + 16) = 0;
      *(_QWORD *)(__src + 24) = a2;
      v8 = v7 | 0x8000000000000000;
    }
    else
    {
      __src = a2 << 32;
      v8 = v7 | 0x4000000000000000;
    }
  }
LABEL_10:
  *a3 = __src;
  a3[1] = v8;
  return __src;
}

void sub_100004A44()
{
  __asm { BR              X11 }
}

_QWORD *sub_100004AA8@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(__int128 *__return_ptr, uint64_t *, char *);
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  unsigned int v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;

  v17 = v5;
  LOWORD(v18) = a1;
  BYTE2(v18) = BYTE2(a1);
  HIBYTE(v18) = BYTE3(a1);
  v19 = BYTE4(a1);
  v20 = BYTE5(a1);
  v21 = BYTE6(a1);
  result = v3(&v13, &v17, (char *)&v17 + BYTE6(a1));
  if (v2)
  {
    v7 = v18 | ((unint64_t)v19 << 32) | ((unint64_t)v20 << 40) | ((unint64_t)v21 << 48);
    *v1 = v17;
    v1[1] = v7;
  }
  else
  {
    v8 = v13;
    v9 = v14;
    v10 = v15;
    v11 = v16;
    v12 = v18 | ((unint64_t)v19 << 32) | ((unint64_t)v20 << 40) | ((unint64_t)v21 << 48);
    *v1 = v17;
    v1[1] = v12;
    *(_OWORD *)v4 = v8;
    *(_QWORD *)(v4 + 16) = v9;
    *(_QWORD *)(v4 + 24) = v10;
    *(_OWORD *)(v4 + 32) = v11;
  }
  return result;
}

_BYTE *sub_100004D60@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)sub_100005684(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_1000057E0((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_100005858((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

double sub_100004DD4@<D0>(void (*a1)(__int128 *__return_ptr, uint64_t, uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  double result;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  if (a2)
  {
    a1(&v10, a2, a3 - a2);
    if (v4)
      return result;
LABEL_5:
    v7 = v11;
    v8 = v12;
    result = *(double *)&v10;
    v9 = v13;
    *(_OWORD *)a4 = v10;
    *(_QWORD *)(a4 + 16) = v7;
    *(_QWORD *)(a4 + 24) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    return result;
  }
  a1(&v10, 0, 0);
  if (!v4)
    goto LABEL_5;
  return result;
}

char *sub_100004E4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *(*a3)(__int128 *__return_ptr, char *, char *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  char *result;
  char *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v10 = result;
  result = (char *)__DataStorage._offset.getter();
  v11 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  result = (char *)a3(&v19, &v10[v11], &v10[v11 + v15]);
  if (!v4)
  {
    v16 = v20;
    v17 = v21;
    v18 = v22;
    *(_OWORD *)a4 = v19;
    *(_QWORD *)(a4 + 16) = v16;
    *(_QWORD *)(a4 + 24) = v17;
    *(_OWORD *)(a4 + 32) = v18;
  }
  return result;
}

unint64_t sub_100004F10(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_10002A864(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_10002A864(a2, a3, a4);
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

unint64_t sub_100004FFC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_10002A864(v12, a6, a7);
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
    result = sub_10002A864(v12, a6, a7);
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

uint64_t sub_10000520C@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  unint64_t v9;
  _QWORD *v10;
  _QWORD v11[2];

  if ((a4 & 0x1000000000000000) != 0)
  {
    *(_OWORD *)a5 = xmmword_10002BFE0;
  }
  else
  {
    v9 = result;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v11[0] = a3;
      v11[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      v10 = v11;
    }
    else if ((a3 & 0x1000000000000000) != 0)
    {
      v10 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      v10 = (_QWORD *)_StringObject.sharedUTF8.getter(a3, a4);
    }
    return sub_1000052C4((uint64_t)v10, v9, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_1000052C4@<X0>(uint64_t result@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, unint64_t a4@<X4>, unint64_t a5@<X5>, _QWORD *a6@<X8>)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a2;
  v10 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  v15 = a2;
  if (v14 == 4 << v12)
  {
    result = sub_10002A864(a2, a4, a5);
    v15 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v16 = v15 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v17 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v17 = HIBYTE(a5) & 0xF;
  if (v17 < v15 >> 16)
    goto LABEL_31;
  result = String.UTF8View._foreignDistance(from:to:)(15, v15, a4, a5);
  v16 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_10002A864(v9, a4, a5);
    v9 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_10002A864(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v9 >> 16);
    goto LABEL_21;
  }
  v18 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v18 = a4 & 0xFFFFFFFFFFFFLL;
  if (v18 < v9 >> 16)
    goto LABEL_29;
  if (v18 < a3 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  result = String.UTF8View._foreignDistance(from:to:)(v9, a3, a4, a5);
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }
  v19 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10)
    v20 = v10 + v16;
  else
    v20 = 0;
  return sub_10000497C(v20, v19, a6);
}

double sub_100005474@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *((_QWORD *)a3 + 2);
  v6 = *((_QWORD *)a3 + 3);
  v15 = *a3;
  v16 = v5;
  v17 = v6;
  sub_100004DD4((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))sub_1000091A0, a1, a2, (uint64_t)&v11);
  v7 = v12;
  v8 = v13;
  result = *(double *)&v11;
  v10 = v14;
  *(_OWORD *)a4 = v11;
  *(_QWORD *)(a4 + 16) = v7;
  *(_QWORD *)(a4 + 24) = v8;
  *(_OWORD *)(a4 + 32) = v10;
  return result;
}

uint64_t sub_1000054EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v10[2];
  uint64_t v11;

  v5 = a3[3];
  v6 = sub_100004FFC((unint64_t)v10, a1, a2, *a3, a3[1], a3[2], v5);
  v7 = v11;
  v8 = v10[1];
  *(_OWORD *)a4 = v10[0];
  *(_OWORD *)(a4 + 16) = v8;
  *(_QWORD *)(a4 + 32) = v7;
  *(_QWORD *)(a4 + 40) = v6;
  return swift_bridgeObjectRetain(v5);
}

_QWORD *sub_100005558(_QWORD *result, Swift::String_optional *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String_optional *v8;
  uint64_t v9;
  Swift::String_optional v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v5 = result;
  v6 = HIBYTE(a5) & 0xF;
  v11 = a4;
  v12 = a5;
  if ((a5 & 0x2000000000000000) == 0)
    v6 = a4 & 0xFFFFFFFFFFFFLL;
  v13 = v6;
  if (!a2)
  {
    v7 = 0;
LABEL_14:
    *v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (_QWORD *)v7;
  }
  v7 = a3;
  if (!a3)
    goto LABEL_14;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = a2;
    v9 = 0;
    while (1)
    {
      v10 = String.Iterator.next()();
      if (!v10.value._object)
        break;
      ++v9;
      *v8++ = v10;
      if (v7 == v9)
      {
        a4 = v11;
        a5 = v12;
        goto LABEL_13;
      }
    }
    a4 = v11;
    a5 = v12;
    v7 = v9;
LABEL_13:
    v6 = v13;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

_QWORD *sub_100005610(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return _swiftEmptyArrayStorage;
  v4 = sub_1000073FC(&qword_10003AAE8);
  v5 = (_QWORD *)swift_allocObject(v4, 16 * v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v7 = v6 - 32;
  if (v6 < 32)
    v7 = v6 - 17;
  v5[2] = a1;
  v5[3] = 2 * (v7 >> 4);
  return v5;
}

uint64_t sub_100005684(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_100005744(uint64_t result)
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

uint64_t sub_1000057E0(uint64_t a1, uint64_t a2)
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

uint64_t sub_100005858(uint64_t a1, uint64_t a2)
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

void *sub_1000058D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t countAndFlagsBits;
  void *v14;
  Swift::String v15;
  unint64_t v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  Swift::String v26;
  void *object;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  NSString v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v61;
  unint64_t v62;
  Swift::String v63;
  _QWORD v64[4];

  v64[1] = a2;
  v64[3] = a2;
  v5 = (void *)0xE100000000000000;
  v63._object = (void *)0xE100000000000000;
  v64[0] = a1;
  v61 = 0;
  v62 = 0xE000000000000000;
  v63._countAndFlagsBits = 13;
  v6 = sub_100009098();
  v7 = ((uint64_t (*)(Swift::String *, uint64_t *, _QWORD, _QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, unint64_t, unint64_t))StringProtocol.replacingOccurrences<A, B>(of:with:options:range:))(&v63, &v61, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v6, v6, v6);
  v9 = v8;
  v64[0] = v7;
  v64[1] = v8;
  v63._countAndFlagsBits = 10;
  v63._object = (void *)0xE100000000000000;
  v61 = 0;
  v62 = 0xE000000000000000;
  v10 = ((uint64_t (*)(Swift::String *, uint64_t *, _QWORD, _QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, unint64_t, unint64_t))StringProtocol.replacingOccurrences<A, B>(of:with:options:range:))(&v63, &v61, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v6, v6, v6);
  v12 = v11;
  swift_bridgeObjectRelease(v9);
  v64[0] = 0;
  v64[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(42);
  swift_bridgeObjectRelease(v64[1]);
  strcpy((char *)v64, ".*-----BEGIN ");
  HIWORD(v64[1]) = -4864;
  if (a3 == (void *)2)
  {
    countAndFlagsBits = 0xD000000000000013;
    v14 = (void *)0x800000010002DEE0;
    v17._countAndFlagsBits = 0xD000000000000013;
    v17._object = (void *)0x800000010002DEE0;
    String.append(_:)(v17);
    v16 = 0x800000010002DEE0;
  }
  else
  {
    if (a3 != (void *)1)
    {
      v63._countAndFlagsBits = 0;
      v63._object = (void *)0xE000000000000000;
      v5 = (void *)&kSecAttrKeyTypeECSECPrimeRandom;
      if (!a3)
        goto LABEL_9;
      type metadata accessor for CFString(0);
      v20 = v19;
      sub_100009040(a3);
      v21 = sub_100009054((unint64_t *)&qword_10003AAE0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C148);
      v5 = (void *)&kSecAttrKeyTypeECSECPrimeRandom;
      v22 = (id)kSecAttrKeyTypeECSECPrimeRandom;
      LOBYTE(v20) = static _CFObject.== infix(_:_:)(v22, a3, v20, v21);

      if ((v20 & 1) != 0)
      {
        v23 = 0xE200000000000000;
        v24 = 17221;
      }
      else
      {
LABEL_9:
        v23 = 0xE300000000000000;
        v24 = 4281170;
      }
      v25 = v23;
      String.append(_:)(*(Swift::String *)&v24);
      swift_bridgeObjectRelease(v23);
      v26._countAndFlagsBits = 0x4554415649525020;
      v26._object = (void *)0xEC00000059454B20;
      String.append(_:)(v26);
      sub_100009018(a3);
      object = v63._object;
      String.append(_:)(v63);
      swift_bridgeObjectRelease(object);
      v28._object = (void *)0x800000010002DF00;
      v28._countAndFlagsBits = 0xD000000000000012;
      String.append(_:)(v28);
      v63._countAndFlagsBits = 0;
      v63._object = (void *)0xE000000000000000;
      if (!a3)
        goto LABEL_13;
      v5 = (void *)kSecAttrKeyTypeECSECPrimeRandom;
      type metadata accessor for CFString(0);
      v30 = v29;
      sub_100009040(a3);
      v31 = sub_100009054((unint64_t *)&qword_10003AAE0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C148);
      v32 = (id)kSecAttrKeyTypeECSECPrimeRandom;
      LOBYTE(v30) = static _CFObject.== infix(_:_:)(v32, a3, v30, v31);

      if ((v30 & 1) != 0)
      {
        v33 = 0xE200000000000000;
        v34 = 17221;
      }
      else
      {
LABEL_13:
        v33 = 0xE300000000000000;
        v34 = 4281170;
      }
      v35 = v33;
      String.append(_:)(*(Swift::String *)&v34);
      swift_bridgeObjectRelease(v33);
      v36._countAndFlagsBits = 0x4554415649525020;
      v36._object = (void *)0xEC00000059454B20;
      String.append(_:)(v36);
      sub_100009018(a3);
      countAndFlagsBits = v63._countAndFlagsBits;
      v14 = v63._object;
      goto LABEL_15;
    }
    countAndFlagsBits = 0x4349464954524543;
    v14 = (void *)0xEB00000000455441;
    v15._countAndFlagsBits = 0x4349464954524543;
    v15._object = (void *)0xEB00000000455441;
    String.append(_:)(v15);
    v16 = 0xEB00000000455441;
  }
  swift_bridgeObjectRelease(v16);
  v18._object = (void *)0x800000010002DF00;
  v18._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v18);
LABEL_15:
  v37._countAndFlagsBits = countAndFlagsBits;
  v37._object = v14;
  String.append(_:)(v37);
  swift_bridgeObjectRelease(v14);
  v38._countAndFlagsBits = 0x2A2E2D2D2D2D2DLL;
  v38._object = (void *)0xE700000000000000;
  String.append(_:)(v38);
  v39 = v64[0];
  v40 = v64[1];
  v41 = objc_allocWithZone((Class)NSRegularExpression);
  v42 = sub_100004768(v39, v40, 0);
  if (v3)
  {
    swift_bridgeObjectRelease(v12);
  }
  else
  {
    v43 = v42;
    v44 = String.count.getter(v10, v12);
    v45 = String._bridgeToObjectiveC()();
    v46 = objc_msgSend(v43, "firstMatchInString:options:range:", v45, 0, 0, v44);

    if (v46)
    {
      if ((uint64_t)objc_msgSend(v46, "numberOfRanges") < 2
        || (v47 = Range<>.init(_:in:)(objc_msgSend(v46, "rangeAtIndex:", 1)), (v49 & 1) != 0))
      {
        swift_bridgeObjectRelease(v12);

        v5 = 0;
      }
      else
      {
        v50 = String.subscript.getter(v47, v48, v10, v12);
        v52 = v51;
        v54 = v53;
        v56 = v55;
        swift_bridgeObjectRelease(v12);
        v57 = sub_100003C0C(v50, v52, v54, v56);
        v59 = v58;
        v5 = (void *)Data.init(base64Encoded:options:)();
        sub_100008F94(v57, v59);

      }
    }
    else
    {
      swift_bridgeObjectRelease(v12);
      v5 = 0;
      v46 = v43;
    }

  }
  return v5;
}

uint64_t sub_100005E44(uint64_t a1, uint64_t a2, void *a3)
{
  Swift::String v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String_optional *v7;
  _QWORD *v8;
  uint64_t result;
  uint64_t countAndFlagsBits;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  Swift::String v50;
  unint64_t v51;
  Swift::String v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  Swift::String v58;
  Swift::String v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __CFString *v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  Swift::String v68;
  Swift::String v69;
  Swift::String v70;
  void *v71;
  Swift::String_optional *v72;
  Swift::String_optional *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;

  v4 = Data.base64EncodedString(options:)(0);
  v5 = String.count.getter();
  if (v5)
  {
    v6 = v5;
    v7 = (Swift::String_optional *)sub_100005610(v5, 0);
    swift_bridgeObjectRetain(v4._object);
    v8 = sub_100005558(&v74, v7 + 2, v6, v4._countAndFlagsBits, (unint64_t)v4._object);
    result = swift_bridgeObjectRelease(v75);
    if (v8 != (_QWORD *)v6)
    {
LABEL_75:
      __break(1u);
      return result;
    }
    result = swift_bridgeObjectRelease(v4._object);
  }
  else
  {
    result = swift_bridgeObjectRelease(v4._object);
    v7 = (Swift::String_optional *)_swiftEmptyArrayStorage;
  }
  v71 = a3;
  countAndFlagsBits = v7[1].value._countAndFlagsBits;
  if (countAndFlagsBits)
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = v11 + 1;
      if (__OFADD__(v11, 1))
        break;
      v14 = __OFADD__(v12, 64);
      v12 += 64;
      if (v14)
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      ++v11;
      if (v12 >= countAndFlagsBits)
        goto LABEL_13;
    }
    __break(1u);
    goto LABEL_66;
  }
  v13 = 0;
LABEL_13:
  result = sub_10001EB44(0, v13 & ~(v13 >> 63), 0);
  if (v13 < 0)
    goto LABEL_74;
  if (v13)
  {
    v15 = 0;
    while (v15 < (unint64_t)countAndFlagsBits)
    {
      if (v15 == 0x7FFFFFFFFFFFFFC0)
        goto LABEL_67;
      v16 = v15 + 64;
      if (countAndFlagsBits < v15 + 64)
        v16 = countAndFlagsBits;
      if (v16 < v15)
        goto LABEL_68;
      v17 = v7[1].value._countAndFlagsBits;
      if (v17 < (unint64_t)v15 || v17 < v16)
        goto LABEL_69;
      v74 = (uint64_t)v7;
      v75 = (unint64_t)&v7[2];
      v76 = v15;
      v77 = (2 * v16) | 1;
      swift_retain(v7);
      v19 = sub_1000073FC(&qword_10003AAD0);
      v20 = sub_100008FD8(&qword_10003AAD8, &qword_10003AAD0, (uint64_t)&protocol conformance descriptor for ArraySlice<A>);
      result = String.init<A>(_:)(&v74, v19, v20);
      v21 = result;
      v23 = v22;
      v25 = _swiftEmptyArrayStorage[2];
      v24 = _swiftEmptyArrayStorage[3];
      if (v25 >= v24 >> 1)
        result = sub_10001EB44(v24 > 1, v25 + 1, 1);
      _swiftEmptyArrayStorage[2] = v25 + 1;
      v26 = &_swiftEmptyArrayStorage[2 * v25];
      v26[4] = v21;
      v26[5] = v23;
      v15 += 64;
      if (!--v13)
      {
        if (v15 < countAndFlagsBits)
          goto LABEL_32;
        goto LABEL_46;
      }
    }
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  if (countAndFlagsBits)
  {
    v15 = 0;
LABEL_32:
    v72 = v7;
    v73 = v7 + 2;
    v27 = v15;
    do
    {
      v28 = v27 + 64;
      if (__OFADD__(v27, 64))
        goto LABEL_70;
      if (countAndFlagsBits >= v28)
        v29 = v27 + 64;
      else
        v29 = countAndFlagsBits;
      if (v29 < (uint64_t)v27)
        goto LABEL_71;
      if (v15 < 0)
        goto LABEL_72;
      v30 = v7[1].value._countAndFlagsBits;
      if (v30 < v27 || v30 < v29)
        goto LABEL_73;
      v74 = (uint64_t)v7;
      v75 = (unint64_t)v73;
      v76 = v27;
      v77 = (2 * v29) | 1;
      swift_retain(v7);
      v32 = sub_1000073FC(&qword_10003AAD0);
      v33 = sub_100008FD8(&qword_10003AAD8, &qword_10003AAD0, (uint64_t)&protocol conformance descriptor for ArraySlice<A>);
      result = String.init<A>(_:)(&v74, v32, v33);
      v34 = result;
      v36 = v35;
      v38 = _swiftEmptyArrayStorage[2];
      v37 = _swiftEmptyArrayStorage[3];
      if (v38 >= v37 >> 1)
        result = sub_10001EB44(v37 > 1, v38 + 1, 1);
      _swiftEmptyArrayStorage[2] = v38 + 1;
      v39 = &_swiftEmptyArrayStorage[2 * v38];
      v39[4] = v34;
      v39[5] = v36;
      v27 += 64;
      v7 = v72;
    }
    while (v28 < countAndFlagsBits);
  }
LABEL_46:
  swift_release(v7);
  v40 = 0xD000000000000013;
  v74 = 0;
  v75 = 0xE000000000000000;
  _StringGuts.grow(_:)(38);
  swift_bridgeObjectRelease(v75);
  v74 = 0x4745422D2D2D2D2DLL;
  v75 = 0xEB00000000204E49;
  if (v71 == (void *)1)
  {
    v42 = 0x4349464954524543;
    v41 = 0xEB00000000455441;
  }
  else if (v71 == (void *)2)
  {
    v41 = 0x800000010002DEE0;
    v42 = 0xD000000000000013;
  }
  else
  {
    if (v71
      && (type metadata accessor for CFString(0),
          v44 = v43,
          sub_100009040(v71),
          v45 = sub_100009054((unint64_t *)&qword_10003AAE0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C148), v46 = (id)kSecAttrKeyTypeECSECPrimeRandom, LOBYTE(v44) = static _CFObject.== infix(_:_:)(v46, v71, v44, v45), v46, (v44 & 1) != 0))
    {
      v47 = 0xE200000000000000;
      v48 = 17221;
    }
    else
    {
      v47 = 0xE300000000000000;
      v48 = 4281170;
    }
    v49 = v47;
    String.append(_:)(*(Swift::String *)&v48);
    swift_bridgeObjectRelease(v47);
    v50._countAndFlagsBits = 0x4554415649525020;
    v50._object = (void *)0xEC00000059454B20;
    String.append(_:)(v50);
    sub_100009018(v71);
    v42 = 0;
    v41 = 0xE000000000000000;
  }
  v51 = v41;
  String.append(_:)(*(Swift::String *)&v42);
  swift_bridgeObjectRelease(v41);
  v52._countAndFlagsBits = 0xA2D2D2D2D2DLL;
  v52._object = (void *)0xE600000000000000;
  String.append(_:)(v52);
  v53 = sub_1000073FC(&qword_10003AA88);
  v54 = sub_100008FD8(&qword_10003AA90, &qword_10003AA88, (uint64_t)&protocol conformance descriptor for [A]);
  v55 = BidirectionalCollection<>.joined(separator:)(10, 0xE100000000000000, v53, v54);
  v57 = v56;
  swift_release(_swiftEmptyArrayStorage);
  v58._countAndFlagsBits = v55;
  v58._object = v57;
  String.append(_:)(v58);
  swift_bridgeObjectRelease(v57);
  v59._countAndFlagsBits = 0x4E452D2D2D2D2D0ALL;
  v59._object = (void *)0xEA00000000002044;
  String.append(_:)(v59);
  if (v71 == (void *)1)
  {
    v40 = 0x4349464954524543;
    v60 = (void *)0xEB00000000455441;
  }
  else if (v71 == (void *)2)
  {
    v60 = (void *)0x800000010002DEE0;
  }
  else
  {
    if (v71
      && (type metadata accessor for CFString(0),
          v62 = v61,
          sub_100009040(v71),
          v63 = sub_100009054((unint64_t *)&qword_10003AAE0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C148), v64 = (id)kSecAttrKeyTypeECSECPrimeRandom, LOBYTE(v62) = static _CFObject.== infix(_:_:)(v64, v71, v62, v63), v64, (v62 & 1) != 0))
    {
      v65 = 0xE200000000000000;
      v66 = 17221;
    }
    else
    {
      v65 = 0xE300000000000000;
      v66 = 4281170;
    }
    v67 = v65;
    String.append(_:)(*(Swift::String *)&v66);
    swift_bridgeObjectRelease(v65);
    v68._countAndFlagsBits = 0x4554415649525020;
    v68._object = (void *)0xEC00000059454B20;
    String.append(_:)(v68);
    sub_100009018(v71);
    v40 = 0;
    v60 = (void *)0xE000000000000000;
  }
  v69._countAndFlagsBits = v40;
  v69._object = v60;
  String.append(_:)(v69);
  swift_bridgeObjectRelease(v60);
  v70._countAndFlagsBits = 0x2D2D2D2D2DLL;
  v70._object = (void *)0xE500000000000000;
  String.append(_:)(v70);
  return v74;
}

void sub_1000064F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = __DataStorage._bytes.getter();
  if (v9)
  {
    v10 = __DataStorage._offset.getter();
    if (__OFSUB__(a1, v10))
    {
LABEL_13:
      __break(1u);
      return;
    }
    v9 += a1 - v10;
  }
  v11 = __OFSUB__(a2, a1);
  v12 = a2 - a1;
  if (v11)
  {
    __break(1u);
    goto LABEL_13;
  }
  v13 = __DataStorage._length.getter();
  if (v13 >= v12)
    v14 = v12;
  else
    v14 = v13;
  v15 = v9 + v14;
  if (v9)
    v16 = v15;
  else
    v16 = 0;
  sub_10000405C(v9, v16, a4, a5);
}

void sub_1000065B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = static Array._allocateBufferUninitialized(minimumCapacity:)(20, &type metadata for UInt8);
  *(_QWORD *)(v3 + 16) = 20;
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  *(_DWORD *)(v3 + 48) = 0;
  __asm { BR              X10 }
}

uint64_t sub_100006630()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v19;
  __int16 v20;
  char v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;

  v19 = (unint64_t *)v0;
  v20 = v1;
  v21 = BYTE2(v1);
  v22 = BYTE3(v1);
  v23 = BYTE4(v1);
  v24 = BYTE5(v1);
  sub_10000405C((uint64_t)&v19, (uint64_t)&v19 + BYTE6(v1), v0, v1);
  sub_100008F94(v0, v1);
  v2 = v25;
  v3 = *(_QWORD *)(v25 + 16);
  v4 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v3)
  {
    v19 = (unint64_t *)&_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v25);
    sub_10001EB44(0, v3, 0);
    v5 = 0;
    v4 = v19;
    do
    {
      v6 = *(_BYTE *)(v2 + v5 + 32);
      v7 = sub_1000073FC(&qword_10003AA80);
      v8 = swift_allocObject(v7, 72, 7);
      *(_OWORD *)(v8 + 16) = xmmword_10002BFF0;
      *(_QWORD *)(v8 + 56) = &type metadata for UInt8;
      *(_QWORD *)(v8 + 64) = &protocol witness table for UInt8;
      *(_BYTE *)(v8 + 32) = v6;
      v9 = ((uint64_t (*)(uint64_t, unint64_t, uint64_t))String.init(format:_:))(0x786868323025, 0xE600000000000000, v8);
      v11 = v10;
      v19 = v4;
      v13 = v4[2];
      v12 = v4[3];
      if (v13 >= v12 >> 1)
      {
        sub_10001EB44(v12 > 1, v13 + 1, 1);
        v4 = v19;
      }
      ++v5;
      v4[2] = v13 + 1;
      v14 = &v4[2 * v13];
      v14[4] = v9;
      v14[5] = v11;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease(v2);
  }
  v19 = v4;
  v15 = sub_1000073FC(&qword_10003AA88);
  v16 = sub_100008FD8(&qword_10003AA90, &qword_10003AA88, (uint64_t)&protocol conformance descriptor for [A]);
  v17 = ((uint64_t (*)(_QWORD, unint64_t, uint64_t, uint64_t))BidirectionalCollection<>.joined(separator:))(0, 0xE000000000000000, v15, v16);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v4);
  return v17;
}

unint64_t sub_10000695C(__SecKey *a1)
{
  CFDataRef v1;
  CFDataRef v2;
  unint64_t v3;
  uint64_t v5;
  Swift::String v6;
  void *object;
  __int128 v8;

  v1 = SecKeyCopyExternalRepresentation(a1, 0);
  v2 = v1;
  if (v1
    && (v8 = xmmword_10002BFE0,
        static Data._conditionallyBridgeFromObjectiveC(_:result:)(v1, &v8),
        v3 = *((_QWORD *)&v8 + 1),
        *((_QWORD *)&v8 + 1) >> 60 != 15))
  {
    v5 = v8;
    *(_QWORD *)&v8 = 0x616873203A79654BLL;
    *((_QWORD *)&v8 + 1) = 0xEA00000000003A31;
    sub_1000065B8(v5, v3);
    object = v6._object;
    String.append(_:)(v6);
    swift_bridgeObjectRelease(object);
    sub_100009130(v5, v3);

    return v8;
  }
  else
  {

    return 0xD000000000000015;
  }
}

unint64_t sub_100006A38(__SecCertificate *a1)
{
  CFStringRef v1;
  __CFString *v2;
  uint64_t v4;
  uint64_t v5;

  v1 = SecCertificateCopySubjectSummary(a1);
  if (v1)
  {
    v2 = (__CFString *)v1;
    v4 = 0;
    v5 = 0;
    static String._conditionallyBridgeFromObjectiveC(_:result:)(v1, &v4);

    if (v5)
      return v4;
  }
  swift_bridgeObjectRelease(0);
  return 0xD000000000000010;
}

uint64_t sub_100006AA4(__SecIdentity *a1)
{
  SecKeyRef v2;
  SecCertificateRef v3;
  BOOL v4;
  __SecKey *v5;
  __SecCertificate *v6;
  Swift::String v7;
  void *object;
  Swift::String v9;
  Swift::String v10;
  void *v11;
  Swift::String v12;
  SecCertificateRef certificateRef;
  SecKeyRef privateKeyRef;

  privateKeyRef = 0;
  SecIdentityCopyPrivateKey(a1, &privateKeyRef);
  v2 = privateKeyRef;
  certificateRef = 0;
  SecIdentityCopyCertificate(a1, &certificateRef);
  v3 = certificateRef;
  if (v2)
    v4 = certificateRef == 0;
  else
    v4 = 1;
  if (v4)
  {

    return 0xD00000000000001ALL;
  }
  else
  {
    v5 = v2;
    v6 = v3;
    _StringGuts.grow(_:)(18);
    swift_bridgeObjectRelease(0xE000000000000000);
    v7._countAndFlagsBits = sub_100006A38(v6);
    object = v7._object;
    String.append(_:)(v7);
    swift_bridgeObjectRelease(object);
    v9._countAndFlagsBits = 8236;
    v9._object = (void *)0xE200000000000000;
    String.append(_:)(v9);
    v10._countAndFlagsBits = sub_10000695C(v5);
    v11 = v10._object;
    String.append(_:)(v10);
    swift_bridgeObjectRelease(v11);
    v12._countAndFlagsBits = 62;
    v12._object = (void *)0xE100000000000000;
    String.append(_:)(v12);

    return 0x797469746E656449;
  }
}

BOOL sub_100006C08(void *a1)
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
  SecTrustRef v11;
  id v12;
  SecPolicyRef BasicX509;
  Class isa;
  OSStatus v15;
  __SecTrust *v16;
  _BOOL8 v17;
  __CFError *v18;
  __CFError *v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFError **v29;
  __CFError *v30;
  uint64_t v31;
  uint64_t *v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  void *v39;
  _BOOL8 v40;
  uint8_t *v42;
  uint64_t *v43;
  uint8_t *v44;
  int v45;
  uint64_t v46;
  CFErrorRef error;
  SecTrustRef trust;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v42 - v7;
  v9 = sub_1000073FC(&qword_10003AAB8);
  v10 = swift_allocObject(v9, 40, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10002C000;
  *(_QWORD *)(v10 + 32) = a1;
  trust = (SecTrustRef)v10;
  specialized Array._endMutation()();
  v11 = trust;
  v12 = a1;
  BasicX509 = SecPolicyCreateBasicX509();
  trust = 0;
  type metadata accessor for SecCertificate(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  v15 = SecTrustCreateWithCertificates(isa, BasicX509, &trust);

  if (v15 || !trust)
  {
    v35 = Logger.init()();
    v36 = Logger.logObject.getter(v35);
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v38 = 67109120;
      LODWORD(error) = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&error, (char *)&error + 4);
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Error creating SecTrust from certificates, unable to generate public signing key: %d", v38, 8u);
      swift_slowDealloc(v38, -1, -1);
      v39 = BasicX509;
    }
    else
    {
      v39 = v36;
      v36 = BasicX509;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    goto LABEL_13;
  }
  error = 0;
  v16 = trust;
  v17 = SecTrustEvaluateWithError(v16, &error);
  if (error)
  {
    v18 = error;
    Logger.init()();
    v19 = v18;
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    v22 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      v23 = swift_slowAlloc(12, -1);
      v45 = v22;
      v24 = (uint8_t *)v23;
      v43 = (uint64_t *)swift_slowAlloc(8, -1);
      v44 = v24;
      *(_DWORD *)v24 = 138412290;
      v42 = v24 + 4;
      type metadata accessor for CFError(0);
      v26 = v25;
      v27 = sub_100009054((unint64_t *)&unk_10003AAC0, (uint64_t (*)(uint64_t))type metadata accessor for CFError, (uint64_t)&protocol conformance descriptor for CFErrorRef);
      v28 = swift_allocError(v26, v27, 0, 0);
      *v29 = v19;
      v30 = v19;
      v31 = _swift_stdlib_bridgeErrorToNSError(v28);
      v46 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &error);
      v32 = v43;
      *v43 = v31;

      v33 = v44;
      _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v45, "Error evaluating certificate trust: %@", v44, 0xCu);
      v34 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v32, 1, v34);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v33, -1, -1);
      v19 = BasicX509;
    }
    else
    {

      v30 = v19;
      v20 = v19;
      v16 = BasicX509;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
LABEL_13:

    return 0;
  }
  v40 = v17;

  return v40;
}

void *sub_100007010()
{
  void *result;
  const __CFData *v1;
  const UInt8 *BytePtr;
  CFIndex Length;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = (void *)SecCertificateCopySHA256Digest();
  if (result)
  {
    v1 = result;
    BytePtr = CFDataGetBytePtr(v1);
    Length = CFDataGetLength(v1);

    if (Length)
    {
      sub_10001EB44(0, Length, 0);
      do
      {
        v4 = *BytePtr++;
        v5 = sub_1000073FC(&qword_10003AA80);
        v6 = swift_allocObject(v5, 72, 7);
        *(_OWORD *)(v6 + 16) = xmmword_10002BFF0;
        *(_QWORD *)(v6 + 56) = &type metadata for UInt8;
        *(_QWORD *)(v6 + 64) = &protocol witness table for UInt8;
        *(_BYTE *)(v6 + 32) = v4;
        v7 = String.init(format:_:)(0x786868323025, 0xE600000000000000, v6);
        v9 = v8;
        v11 = _swiftEmptyArrayStorage[2];
        v10 = _swiftEmptyArrayStorage[3];
        if (v11 >= v10 >> 1)
          sub_10001EB44(v10 > 1, v11 + 1, 1);
        _swiftEmptyArrayStorage[2] = v11 + 1;
        v12 = (char *)&_swiftEmptyArrayStorage[2 * v11];
        *((_QWORD *)v12 + 4) = v7;
        *((_QWORD *)v12 + 5) = v9;
        --Length;
      }
      while (Length);
    }
    v13 = sub_1000073FC(&qword_10003AA88);
    v14 = sub_100008FD8(&qword_10003AA90, &qword_10003AA88, (uint64_t)&protocol conformance descriptor for [A]);
    v15 = BidirectionalCollection<>.joined(separator:)(0, 0xE000000000000000, v13, v14);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

    return (void *)v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_1000071C4(__SecIdentity *a1)
{
  OSStatus v2;
  SecCertificateRef v3;
  __SecCertificate *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  OSStatus v15;
  SecCertificateRef certificateRef;

  noErr.getter();
  certificateRef = 0;
  v2 = SecIdentityCopyCertificate(a1, &certificateRef);
  v3 = certificateRef;
  if (noErr.getter() == v2 && v3)
  {
    v4 = v3;
    v5 = sub_100007010();

  }
  else
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v6 = type metadata accessor for Logger(0);
    v7 = sub_1000073A0(v6, (uint64_t)qword_10003B2D0);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.error.getter();
    v5 = (void *)v9;
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v10 = 67109120;
      v15 = v2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &certificateRef);
      _os_log_impl((void *)&_mh_execute_header, v8, (os_log_type_t)v5, "Error copying certificate (status %d)", v10, 8u);
      swift_slowDealloc(v10, -1, -1);
    }

    v11 = sub_1000073B8();
    v12 = swift_allocError(&_s5ErrorON, v11, 0, 0);
    *(_QWORD *)v13 = 9;
    *(_OWORD *)(v13 + 8) = 0u;
    *(_OWORD *)(v13 + 24) = 0u;
    *(_BYTE *)(v13 + 40) = 5;
    swift_willThrow(v12);

  }
  return v5;
}

uint64_t sub_1000073A0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_1000073B8()
{
  unint64_t result;

  result = qword_10003AA78;
  if (!qword_10003AA78)
  {
    result = swift_getWitnessTable(&unk_10002C3A0, &_s5ErrorON);
    atomic_store(result, (unint64_t *)&qword_10003AA78);
  }
  return result;
}

uint64_t sub_1000073FC(uint64_t *a1)
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

uint64_t sub_10000743C(uint64_t *a1)
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

uint64_t sub_100007480(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t *v14;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[2];
  _OWORD v19[2];

  if (qword_10003A890 != -1)
    swift_once(&qword_10003A890, sub_100004544);
  if (qword_10003A968 == -1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  swift_once(&qword_10003A968, sub_1000046AC);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_28;
LABEL_5:
  v5 = sub_100027010(0x312E39322E352E32, 0xEF65676173553A35);
  if ((v6 & 1) != 0)
  {
    sub_100008EDC(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)v18);
    sub_100008F18(v18, v19);
    v3 = (char *)&type metadata for Any;
    swift_dynamicCast(&v16, v19, (char *)&type metadata for Any + 8, &type metadata for String, 7);
    v2 = v16;
    v1 = v17;
    if (qword_10003A8A8 == -1)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  swift_once(&qword_10003A8A8, sub_10000456C);
LABEL_7:
  if (qword_10003A980 == -1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_9;
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  swift_once(&qword_10003A980, sub_1000046CC);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_32;
LABEL_9:
  v7 = sub_100027010(0xD000000000000011, 0x800000010002DDC0);
  if ((v8 & 1) == 0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  sub_100008EDC(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)v18);
  sub_100008F18(v18, v19);
  swift_dynamicCast(&v16, v19, v3 + 8, &type metadata for String, 7);
  v9 = v17;
  if (v16 == 0xD000000000000010 && v17 == 0x800000010002DDE0)
  {
    swift_bridgeObjectRelease(0x800000010002DDE0);
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, 0xD000000000000010, 0x800000010002DDE0, 0);
    swift_bridgeObjectRelease(v9);
    if ((v10 & 1) == 0)
      goto LABEL_18;
  }
  v11 = sub_1000041D4(v2, v1, &off_100034F18);
  swift_arrayDestroy(&unk_100034F38, 2, &type metadata for String);
  if ((v11 & 1) != 0)
  {
    if (v2 == 0xD000000000000010 && v1 == 0x800000010002DB10)
    {
      swift_bridgeObjectRelease(0x800000010002DB10);
    }
    else
    {
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v1, 0xD000000000000010, 0x800000010002DB10, 0);
      swift_bridgeObjectRelease(v1);
      if ((v13 & 1) == 0)
      {
        if (qword_10003A9B0 != -1)
          swift_once(&qword_10003A9B0, sub_100004720);
        v14 = &qword_10003B2A8;
        goto LABEL_25;
      }
    }
    if (qword_10003A9B8 == -1)
    {
LABEL_21:
      v14 = &qword_10003B2B8;
LABEL_25:
      v12 = *v14;
      swift_bridgeObjectRetain(v14[1]);
      return v12;
    }
LABEL_34:
    swift_once(&qword_10003A9B8, sub_100004744);
    goto LABEL_21;
  }
LABEL_18:
  swift_bridgeObjectRelease(v1);
  return 0;
}

uint64_t sub_1000077B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
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
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t i;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  _QWORD *v51;
  Swift::String v52;
  Swift::String v53;
  uint64_t v54;
  __int128 v55;
  unint64_t v56;
  char v57;
  _QWORD *v58;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v60;
  unint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  char v65;
  unint64_t v66;
  char v67;
  unint64_t v68;
  char v69;
  char v70;
  char v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  unint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  unint64_t v99;
  char v100;
  unint64_t v101;
  char v102;
  unint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  unint64_t v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  unint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char v123;
  unint64_t v124;
  char v125;
  unint64_t v126;
  char v127;
  unint64_t v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  unint64_t v135;
  char v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char v141;
  unint64_t v142;
  char v143;
  unint64_t v144;
  char v145;
  unint64_t v146;
  char v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char v152;
  unint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char v159;
  unint64_t v160;
  char v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char v166;
  unint64_t v167;
  char v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  char v172;
  uint64_t result;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  _OWORD v183[2];
  unint64_t v184;
  __int128 v185;
  __int128 v186;

  v2 = sub_1000073FC(&qword_10003AA98);
  v3 = swift_allocObject(v2, 144, 7);
  *(_OWORD *)(v3 + 16) = xmmword_10002C010;
  if (qword_10003A830 != -1)
LABEL_99:
    swift_once(&qword_10003A830, sub_10000448C);
  v4 = qword_10003A838;
  v5 = unk_10003A840;
  *(_QWORD *)(v3 + 32) = qword_10003A838;
  *(_QWORD *)(v3 + 40) = v5;
  v6 = qword_10003A848;
  swift_bridgeObjectRetain(v5);
  if (v6 != -1)
    swift_once(&qword_10003A848, sub_1000044B8);
  v7 = *(_QWORD *)algn_10003A858;
  v177 = *(_QWORD *)algn_10003A858;
  v178 = qword_10003A850;
  *(_QWORD *)(v3 + 48) = qword_10003A850;
  *(_QWORD *)(v3 + 56) = v7;
  v8 = qword_10003A860;
  swift_bridgeObjectRetain(v7);
  if (v8 != -1)
    swift_once(&qword_10003A860, sub_1000044E4);
  v9 = unk_10003A870;
  *(_QWORD *)(v3 + 64) = qword_10003A868;
  *(_QWORD *)(v3 + 72) = v9;
  v10 = qword_10003A878;
  swift_bridgeObjectRetain(v9);
  if (v10 != -1)
    swift_once(&qword_10003A878, sub_100004514);
  v11 = *(_QWORD *)algn_10003A888;
  *(_QWORD *)(v3 + 80) = qword_10003A880;
  *(_QWORD *)(v3 + 88) = v11;
  v12 = qword_10003A890;
  swift_bridgeObjectRetain(v11);
  if (v12 != -1)
    swift_once(&qword_10003A890, sub_100004544);
  v13 = unk_10003A8A0;
  *(_QWORD *)(v3 + 96) = qword_10003A898;
  *(_QWORD *)(v3 + 104) = v13;
  v14 = qword_10003A8A8;
  swift_bridgeObjectRetain(v13);
  if (v14 != -1)
    swift_once(&qword_10003A8A8, sub_10000456C);
  v15 = *(_QWORD *)algn_10003A8B8;
  *(_QWORD *)(v3 + 112) = qword_10003A8B0;
  *(_QWORD *)(v3 + 120) = v15;
  v16 = qword_10003A8C0;
  swift_bridgeObjectRetain(v15);
  if (v16 != -1)
    swift_once(&qword_10003A8C0, sub_100004594);
  v17 = unk_10003A8D0;
  *(_QWORD *)(v3 + 128) = qword_10003A8C8;
  *(_QWORD *)(v3 + 136) = v17;
  swift_bridgeObjectRetain(v17);
  v18 = sub_100007010();
  v20 = v19;
  v21 = SecCertificateCopyProperties(a1);
  if (!v21)
    goto LABEL_177;
  v22 = (void *)v21;
  *(_QWORD *)&v185 = 0;
  static Array._forceBridgeFromObjectiveC(_:result:)(v21, &v185, (char *)&type metadata for Any + 8);
  v23 = v185;
  if ((_QWORD)v185)
  {
    v180 = v20;

    v24 = (_QWORD *)sub_100024880((uint64_t)_swiftEmptyArrayStorage);
    a1 = *(_QWORD *)(v23 + 16);
    if (a1)
    {
      for (i = 0; i != a1; ++i)
      {
        if (i >= *(_QWORD *)(v23 + 16))
        {
          __break(1u);
          goto LABEL_99;
        }
        sub_100008EDC(v23 + 32 + 32 * i, (uint64_t)&v185);
        v26 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
        if ((swift_dynamicCast(v183, &v185, (char *)&type metadata for Any + 8, v26, 6) & 1) != 0)
        {
          v27 = *(_QWORD *)&v183[0];
          if (!*(_QWORD *)(*(_QWORD *)&v183[0] + 16))
            goto LABEL_80;
          v28 = sub_100027010(0x6C6562616CLL, 0xE500000000000000);
          if ((v29 & 1) == 0)
            goto LABEL_80;
          sub_100008EDC(*(_QWORD *)(v27 + 56) + 32 * v28, (uint64_t)&v185);
          if ((swift_dynamicCast(v183, &v185, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
            goto LABEL_80;
          v30 = v183[0];
          if (__PAIR128__(v5, v4) != v183[0]
            && (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *(_QWORD *)&v183[0], *((_QWORD *)&v183[0] + 1), 0) & 1) == 0)
          {
            v31 = *((_QWORD *)&v30 + 1);
            if (v178 != (_QWORD)v30 || (v31 = *((_QWORD *)&v30 + 1), v177 != *((_QWORD *)&v30 + 1)))
            {
              if ((_stringCompareWithSmolCheck(_:_:expecting:)(v178, v177, v30, v31, 0) & 1) == 0)
              {
                v32 = *(_QWORD *)(v3 + 64);
                v33 = *(_QWORD *)(v3 + 72);
                if (__PAIR128__(v33, v32) != v30
                  && (_stringCompareWithSmolCheck(_:_:expecting:)(v32, v33, v30, *((_QWORD *)&v30 + 1), 0) & 1) == 0)
                {
                  v34 = *(_QWORD *)(v3 + 80);
                  v35 = *(_QWORD *)(v3 + 88);
                  if (__PAIR128__(v35, v34) != v30
                    && (_stringCompareWithSmolCheck(_:_:expecting:)(v34, v35, v30, *((_QWORD *)&v30 + 1), 0) & 1) == 0)
                  {
                    v36 = *(_QWORD *)(v3 + 96);
                    v37 = *(_QWORD *)(v3 + 104);
                    if (__PAIR128__(v37, v36) != v30
                      && (_stringCompareWithSmolCheck(_:_:expecting:)(v36, v37, v30, *((_QWORD *)&v30 + 1), 0) & 1) == 0)
                    {
                      v38 = *(_QWORD *)(v3 + 112);
                      v39 = *(_QWORD *)(v3 + 120);
                      if (__PAIR128__(v39, v38) != v30
                        && (_stringCompareWithSmolCheck(_:_:expecting:)(v38, v39, v30, *((_QWORD *)&v30 + 1), 0) & 1) == 0)
                      {
                        v40 = *(_QWORD *)(v3 + 128);
                        v41 = *(_QWORD *)(v3 + 136);
                        if (__PAIR128__(v41, v40) != v30
                          && (_stringCompareWithSmolCheck(_:_:expecting:)(v40, v41, v30, *((_QWORD *)&v30 + 1), 0) & 1) == 0)
                        {
                          swift_bridgeObjectRelease(*((_QWORD *)&v30 + 1));
LABEL_80:
                          v78 = v27;
LABEL_81:
                          swift_bridgeObjectRelease(v78);
                          continue;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          if (*(_QWORD *)(v27 + 16) && (v42 = sub_100027010(0x65756C6176, 0xE500000000000000), (v43 & 1) != 0))
          {
            sub_100008EDC(*(_QWORD *)(v27 + 56) + 32 * v42, (uint64_t)&v185);
          }
          else
          {
            v185 = 0u;
            v186 = 0u;
          }
          swift_bridgeObjectRelease(v27);
          if (*((_QWORD *)&v186 + 1))
          {
            v44 = sub_1000073FC(&qword_10003AAB0);
            if ((swift_dynamicCast(v183, &v185, (char *)&type metadata for Any + 8, v44, 6) & 1) != 0)
            {
              v175 = v5;
              v176 = v4;
              v45 = *(_QWORD *)&v183[0];
              v182 = *(_QWORD *)(*(_QWORD *)&v183[0] + 16);
              if (v182)
              {
                v174 = v3;
                v46 = 0;
                v179 = v18;
                v181 = *(_QWORD *)&v183[0];
                while (1)
                {
                  v47 = a1;
                  v48 = *(_QWORD *)(v45 + 8 * v46 + 32);
                  if (*(_QWORD *)(v48 + 16))
                  {
                    swift_bridgeObjectRetain(*(_QWORD *)(v45 + 8 * v46 + 32));
                    v49 = sub_100027010(0x6C6562616CLL, 0xE500000000000000);
                    if ((v50 & 1) != 0
                      && (sub_100008EDC(*(_QWORD *)(v48 + 56) + 32 * v49, (uint64_t)&v185),
                          (swift_dynamicCast(v183, &v185, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0))
                    {
                      v51 = v24;
                      v52 = (Swift::String)v183[0];
                      v185 = v30;
                      swift_bridgeObjectRetain(*((_QWORD *)&v30 + 1));
                      v53._countAndFlagsBits = 58;
                      v53._object = (void *)0xE100000000000000;
                      String.append(_:)(v53);
                      v54 = *((_QWORD *)&v185 + 1);
                      swift_bridgeObjectRetain(*((_QWORD *)&v185 + 1));
                      String.append(_:)(v52);
                      swift_bridgeObjectRelease(v52._object);
                      swift_bridgeObjectRelease(v54);
                      v55 = v185;
                      if (*(_QWORD *)(v48 + 16)
                        && (v56 = sub_100027010(0x65756C6176, 0xE500000000000000), (v57 & 1) != 0))
                      {
                        sub_100008EDC(*(_QWORD *)(v48 + 56) + 32 * v56, (uint64_t)&v185);
                      }
                      else
                      {
                        v185 = 0u;
                        v186 = 0u;
                      }
                      v45 = v181;
                      swift_bridgeObjectRelease(v48);
                      if (*((_QWORD *)&v186 + 1))
                      {
                        v18 = v179;
                        sub_100008F18(&v185, v183);
                        v58 = v51;
                        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v51);
                        v184 = (unint64_t)v51;
                        v61 = sub_100027010(v55, *((uint64_t *)&v55 + 1));
                        v62 = v51[2];
                        v63 = (v60 & 1) == 0;
                        v64 = v62 + v63;
                        if (__OFADD__(v62, v63))
                        {
                          __break(1u);
LABEL_176:
                          __break(1u);
LABEL_177:
                          __break(1u);
                          goto LABEL_178;
                        }
                        v65 = v60;
                        if (v58[3] >= v64)
                        {
                          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                            sub_100028A90();
                        }
                        else
                        {
                          sub_1000273FC(v64, isUniquelyReferenced_nonNull_native);
                          v66 = sub_100027010(v55, *((uint64_t *)&v55 + 1));
                          if ((v65 & 1) != (v67 & 1))
                            goto LABEL_179;
                          v61 = v66;
                        }
                        v45 = v181;
                        v72 = (_QWORD *)v184;
                        if ((v65 & 1) != 0)
                        {
                          v73 = (_QWORD *)(*(_QWORD *)(v184 + 56) + 32 * v61);
                          sub_100009180(v73);
                          sub_100008F18(v183, v73);
                          v24 = v72;
                          v74 = *((_QWORD *)&v55 + 1);
                        }
                        else
                        {
                          *(_QWORD *)(v184 + 8 * (v61 >> 6) + 64) |= 1 << v61;
                          v74 = *((_QWORD *)&v55 + 1);
                          *(_OWORD *)(v72[6] + 16 * v61) = v55;
                          sub_100008F18(v183, (_OWORD *)(v72[7] + 32 * v61));
                          v75 = v72[2];
                          v76 = __OFADD__(v75, 1);
                          v77 = v75 + 1;
                          if (v76)
                            goto LABEL_176;
                          v24 = v72;
                          v72[2] = v77;
                          swift_bridgeObjectRetain(*((_QWORD *)&v55 + 1));
                        }
                        swift_bridgeObjectRelease(v74);
                        swift_bridgeObjectRelease(0x8000000000000000);
                      }
                      else
                      {
                        sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
                        swift_bridgeObjectRetain(v51);
                        v24 = v51;
                        v68 = sub_100027010(v55, *((uint64_t *)&v55 + 1));
                        v70 = v69;
                        swift_bridgeObjectRelease(v51);
                        if ((v70 & 1) != 0)
                        {
                          v71 = swift_isUniquelyReferenced_nonNull_native(v51);
                          v184 = (unint64_t)v51;
                          v18 = v179;
                          if ((v71 & 1) == 0)
                          {
                            sub_100028A90();
                            v24 = (_QWORD *)v184;
                          }
                          swift_bridgeObjectRelease(*(_QWORD *)(v24[6] + 16 * v68 + 8));
                          sub_100008F18((_OWORD *)(v24[7] + 32 * v68), v183);
                          sub_100027CD4(v68, (uint64_t)v24);
                          swift_bridgeObjectRelease(0x8000000000000000);
                        }
                        else
                        {
                          memset(v183, 0, sizeof(v183));
                          v18 = v179;
                        }
                        swift_bridgeObjectRelease(*((_QWORD *)&v55 + 1));
                        sub_1000090DC((uint64_t)v183, &qword_10003B1E0);
                      }
                    }
                    else
                    {
                      swift_bridgeObjectRelease(v48);
                    }
                  }
                  a1 = v47;
                  if (v182 == ++v46)
                  {
                    swift_bridgeObjectRelease(*((_QWORD *)&v30 + 1));
                    swift_bridgeObjectRelease(v45);
                    v3 = v174;
                    goto LABEL_78;
                  }
                }
              }
              swift_bridgeObjectRelease(*((_QWORD *)&v30 + 1));
              swift_bridgeObjectRelease(v45);
LABEL_78:
              v5 = v175;
              v4 = v176;
              continue;
            }
            v78 = *((_QWORD *)&v30 + 1);
            goto LABEL_81;
          }
          swift_bridgeObjectRelease(*((_QWORD *)&v30 + 1));
          sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
        }
      }
    }
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v23);
    v184 = sub_100024880((uint64_t)_swiftEmptyArrayStorage);
    if (qword_10003A7D0 != -1)
      swift_once(&qword_10003A7D0, sub_100004298);
    v79 = qword_10003B1E8;
    v80 = unk_10003B1F0;
    swift_bridgeObjectRetain(unk_10003B1F0);
    v81 = swift_bridgeObjectRetain(v24);
    v82 = sub_100007480(v81);
    v84 = v83;
    swift_bridgeObjectRelease(v24);
    *((_QWORD *)&v186 + 1) = &type metadata for String;
    *(_QWORD *)&v185 = v82;
    *((_QWORD *)&v185 + 1) = v84;
    sub_100008F18(&v185, v183);
    v85 = v184;
    v86 = swift_isUniquelyReferenced_nonNull_native(v184);
    sub_10002822C(v183, v79, v80, v86);
    v184 = v85;
    swift_bridgeObjectRelease(v80);
    swift_bridgeObjectRelease(0x8000000000000000);
    if (qword_10003A7D8 != -1)
      swift_once(&qword_10003A7D8, sub_1000042C0);
    v88 = qword_10003B1F8;
    v87 = unk_10003B200;
    v89 = qword_10003A8D8;
    swift_bridgeObjectRetain(unk_10003B200);
    if (v89 != -1)
      swift_once(&qword_10003A8D8, sub_1000045BC);
    if (v24[2] && (v90 = sub_100027010(0xD000000000000014, 0x800000010002DBD0), (v91 & 1) != 0))
    {
      sub_100008EDC(v24[7] + 32 * v90, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v92 = v184;
      v93 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, v88, v87, v93);
      v184 = v92;
      swift_bridgeObjectRelease(v87);
      swift_bridgeObjectRelease(0x8000000000000000);
    }
    else
    {
      sub_100027144(v88, v87, &v185);
      swift_bridgeObjectRelease(v87);
      sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
    }
    if (qword_10003A7E0 != -1)
      swift_once(&qword_10003A7E0, sub_1000042F0);
    v95 = qword_10003B208;
    v94 = unk_10003B210;
    v96 = qword_10003A8F0;
    swift_bridgeObjectRetain(unk_10003B210);
    if (v96 == -1)
    {
      if (!v24[2])
        goto LABEL_101;
    }
    else
    {
      swift_once(&qword_10003A8F0, sub_1000045E0);
      if (!v24[2])
        goto LABEL_101;
    }
    v97 = sub_100027010(0xD000000000000015, 0x800000010002DBF0);
    if ((v98 & 1) != 0)
    {
      sub_100008EDC(v24[7] + 32 * v97, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v99 = v184;
      v100 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, v95, v94, v100);
      v184 = v99;
      swift_bridgeObjectRelease(v94);
      swift_bridgeObjectRelease(0x8000000000000000);
      goto LABEL_102;
    }
LABEL_101:
    sub_100027144(v95, v94, &v185);
    swift_bridgeObjectRelease(v94);
    sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
LABEL_102:
    if (qword_10003A908 != -1)
      swift_once(&qword_10003A908, sub_100004604);
    if (v24[2] && (v101 = sub_100027010(0xD000000000000014, 0x800000010002DC30), (v102 & 1) != 0))
    {
      sub_100008EDC(v24[7] + 32 * v101, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v103 = v184;
      v104 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, 0xD000000000000012, 0x800000010002DC10, v104);
      v184 = v103;
      swift_bridgeObjectRelease(0x8000000000000000);
    }
    else
    {
      sub_100027144(0xD000000000000012, 0x800000010002DC10, &v185);
      sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
    }
    if (qword_10003A7E8 != -1)
      swift_once(&qword_10003A7E8, sub_100004314);
    v106 = qword_10003B218;
    v105 = unk_10003B220;
    v107 = qword_10003A920;
    swift_bridgeObjectRetain(unk_10003B220);
    if (v107 == -1)
    {
      if (!v24[2])
        goto LABEL_115;
    }
    else
    {
      swift_once(&qword_10003A920, sub_100004628);
      if (!v24[2])
        goto LABEL_115;
    }
    v108 = sub_100027010(0xD000000000000014, 0x800000010002DC50);
    if ((v109 & 1) != 0)
    {
      sub_100008EDC(v24[7] + 32 * v108, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v110 = v184;
      v111 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, v106, v105, v111);
      v184 = v110;
      swift_bridgeObjectRelease(v105);
      swift_bridgeObjectRelease(0x8000000000000000);
      goto LABEL_116;
    }
LABEL_115:
    sub_100027144(v106, v105, &v185);
    swift_bridgeObjectRelease(v105);
    sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
LABEL_116:
    if (qword_10003A7F0 != -1)
      swift_once(&qword_10003A7F0, sub_100004340);
    v113 = qword_10003B228;
    v112 = unk_10003B230;
    v114 = v24[2];
    swift_bridgeObjectRetain(unk_10003B230);
    if (v114 && (v115 = sub_100027010(0xD000000000000013, 0x800000010002DC70), (v116 & 1) != 0))
    {
      sub_100008EDC(v24[7] + 32 * v115, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v117 = v184;
      v118 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, v113, v112, v118);
      v184 = v117;
      swift_bridgeObjectRelease(v112);
      swift_bridgeObjectRelease(0x8000000000000000);
    }
    else
    {
      sub_100027144(v113, v112, &v185);
      swift_bridgeObjectRelease(v112);
      sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
    }
    if (qword_10003A7F8 != -1)
      swift_once(&qword_10003A7F8, sub_100004370);
    v120 = qword_10003B238;
    v119 = unk_10003B240;
    v121 = v24[2];
    swift_bridgeObjectRetain(unk_10003B240);
    if (v121 && (v122 = sub_100027010(0xD000000000000014, 0x800000010002DC90), (v123 & 1) != 0))
    {
      sub_100008EDC(v24[7] + 32 * v122, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v124 = v184;
      v125 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, v120, v119, v125);
      v184 = v124;
      swift_bridgeObjectRelease(v119);
      swift_bridgeObjectRelease(0x8000000000000000);
    }
    else
    {
      sub_100027144(v120, v119, &v185);
      swift_bridgeObjectRelease(v119);
      sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
    }
    if (v24[2] && (v126 = sub_100027010(0xD000000000000013, 0x800000010002DCD0), (v127 & 1) != 0))
    {
      sub_100008EDC(v24[7] + 32 * v126, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v128 = v184;
      v129 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, 0xD000000000000012, 0x800000010002DCB0, v129);
      v184 = v128;
      swift_bridgeObjectRelease(0x8000000000000000);
    }
    else
    {
      sub_100027144(0xD000000000000012, 0x800000010002DCB0, &v185);
      sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
    }
    if (qword_10003A800 != -1)
      swift_once(&qword_10003A800, sub_100004394);
    v131 = qword_10003B248;
    v130 = unk_10003B250;
    v132 = v24[2];
    swift_bridgeObjectRetain(unk_10003B250);
    if (v132 && (v133 = sub_100027010(0xD000000000000013, 0x800000010002DCF0), (v134 & 1) != 0))
    {
      sub_100008EDC(v24[7] + 32 * v133, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v135 = v184;
      v136 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, v131, v130, v136);
      v184 = v135;
      swift_bridgeObjectRelease(v130);
      swift_bridgeObjectRelease(0x8000000000000000);
    }
    else
    {
      sub_100027144(v131, v130, &v185);
      swift_bridgeObjectRelease(v130);
      sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
    }
    if (qword_10003A808 != -1)
      swift_once(&qword_10003A808, sub_1000043C0);
    v138 = qword_10003B258;
    v137 = unk_10003B260;
    v139 = qword_10003A938;
    swift_bridgeObjectRetain(unk_10003B260);
    if (v139 == -1)
    {
      if (!v24[2])
        goto LABEL_146;
    }
    else
    {
      swift_once(&qword_10003A938, sub_10000464C);
      if (!v24[2])
        goto LABEL_146;
    }
    v140 = sub_100027010(0xD00000000000001BLL, 0x800000010002DD10);
    if ((v141 & 1) != 0)
    {
      sub_100008EDC(v24[7] + 32 * v140, (uint64_t)&v185);
      sub_100008F18(&v185, v183);
      v142 = v184;
      v143 = swift_isUniquelyReferenced_nonNull_native(v184);
      sub_10002822C(v183, v138, v137, v143);
      v184 = v142;
      swift_bridgeObjectRelease(v137);
      swift_bridgeObjectRelease(0x8000000000000000);
      if (!v24[2])
        goto LABEL_149;
LABEL_147:
      v144 = sub_100027010(0xD000000000000020, 0x800000010002DD50);
      if ((v145 & 1) != 0)
      {
        sub_100008EDC(v24[7] + 32 * v144, (uint64_t)&v185);
        sub_100008F18(&v185, v183);
        v146 = v184;
        v147 = swift_isUniquelyReferenced_nonNull_native(v184);
        sub_10002822C(v183, 0xD000000000000010, 0x800000010002DD30, v147);
        v184 = v146;
        swift_bridgeObjectRelease(0x8000000000000000);
        goto LABEL_150;
      }
LABEL_149:
      sub_100027144(0xD000000000000010, 0x800000010002DD30, &v185);
      sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
LABEL_150:
      if (qword_10003A810 != -1)
        swift_once(&qword_10003A810, sub_1000043E0);
      v149 = qword_10003B268;
      v148 = unk_10003B270;
      v150 = qword_10003A950;
      swift_bridgeObjectRetain(unk_10003B270);
      if (v150 != -1)
        swift_once(&qword_10003A950, sub_10000467C);
      if (v24[2] && (v151 = sub_100027010(0xD00000000000001FLL, 0x800000010002DD80), (v152 & 1) != 0))
      {
        sub_100008EDC(v24[7] + 32 * v151, (uint64_t)&v185);
        sub_100008F18(&v185, v183);
        v153 = v184;
        v154 = swift_isUniquelyReferenced_nonNull_native(v184);
        sub_10002822C(v183, v149, v148, v154);
        v184 = v153;
        swift_bridgeObjectRelease(v148);
        swift_bridgeObjectRelease(0x8000000000000000);
      }
      else
      {
        sub_100027144(v149, v148, &v185);
        swift_bridgeObjectRelease(v148);
        sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
      }
      if (qword_10003A818 != -1)
        swift_once(&qword_10003A818, sub_100004410);
      v156 = qword_10003B278;
      v155 = unk_10003B280;
      v157 = v24[2];
      swift_bridgeObjectRetain(unk_10003B280);
      if (v157 && (v158 = sub_100027010(0xD00000000000001FLL, 0x800000010002DD80), (v159 & 1) != 0))
      {
        sub_100008EDC(v24[7] + 32 * v158, (uint64_t)&v185);
        sub_100008F18(&v185, v183);
        v160 = v184;
        v161 = swift_isUniquelyReferenced_nonNull_native(v184);
        sub_10002822C(v183, v156, v155, v161);
        v184 = v160;
        swift_bridgeObjectRelease(v155);
        swift_bridgeObjectRelease(0x8000000000000000);
      }
      else
      {
        sub_100027144(v156, v155, &v185);
        swift_bridgeObjectRelease(v155);
        sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
      }
      if (qword_10003A820 != -1)
        swift_once(&qword_10003A820, sub_100004438);
      v163 = qword_10003B288;
      v162 = unk_10003B290;
      v164 = qword_10003A998;
      swift_bridgeObjectRetain(unk_10003B290);
      if (v164 == -1)
      {
        if (!v24[2])
          goto LABEL_171;
      }
      else
      {
        swift_once(&qword_10003A998, sub_1000046F0);
        if (!v24[2])
          goto LABEL_171;
      }
      v165 = sub_100027010(0xD000000000000017, 0x800000010002DDA0);
      if ((v166 & 1) != 0)
      {
        sub_100008EDC(v24[7] + 32 * v165, (uint64_t)&v185);
        sub_100008F18(&v185, v183);
        v167 = v184;
        v168 = swift_isUniquelyReferenced_nonNull_native(v184);
        sub_10002822C(v183, v163, v162, v168);
        v184 = v167;
        swift_bridgeObjectRelease(v162);
        swift_bridgeObjectRelease(0x8000000000000000);
LABEL_172:
        if (qword_10003A828 != -1)
          swift_once(&qword_10003A828, sub_100004468);
        v169 = qword_10003B298;
        v170 = unk_10003B2A0;
        *((_QWORD *)&v186 + 1) = &type metadata for String;
        *(_QWORD *)&v185 = v18;
        *((_QWORD *)&v185 + 1) = v180;
        sub_100008F18(&v185, v183);
        swift_bridgeObjectRetain(v170);
        v171 = v184;
        v172 = swift_isUniquelyReferenced_nonNull_native(v184);
        sub_10002822C(v183, v169, v170, v172);
        swift_bridgeObjectRelease(v170);
        swift_bridgeObjectRelease(0x8000000000000000);
        swift_bridgeObjectRelease(v24);
        return v171;
      }
LABEL_171:
      sub_100027144(v163, v162, &v185);
      swift_bridgeObjectRelease(v162);
      sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
      goto LABEL_172;
    }
LABEL_146:
    sub_100027144(v138, v137, &v185);
    swift_bridgeObjectRelease(v137);
    sub_1000090DC((uint64_t)&v185, &qword_10003B1E0);
    if (!v24[2])
      goto LABEL_149;
    goto LABEL_147;
  }
LABEL_178:
  __break(1u);
LABEL_179:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100008EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100008F18(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
  sub_1000091F8(a1, &qword_10003AB18, (uint64_t)&unk_100035200);
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_1000091F8(a1, &qword_10003AB10, (uint64_t)&unk_1000351D0);
}

uint64_t sub_100008F50(uint64_t a1, unint64_t a2)
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

uint64_t sub_100008F94(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_release)();
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100008FD8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000743C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_100009018(id a1)
{
  if ((char *)a1 - 1 >= (char *)2)

}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_1000091F8(a1, &qword_10003AB30, (uint64_t)&unk_100035290);
}

id sub_100009040(id result)
{
  if ((char *)result - 1 >= (char *)2)
    return result;
  return result;
}

uint64_t sub_100009054(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_100009098()
{
  unint64_t result;

  result = qword_10003AAF0;
  if (!qword_10003AAF0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10003AAF0);
  }
  return result;
}

uint64_t sub_1000090DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000073FC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_100009118@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_100005474(a1, a2, *(__int128 **)(v3 + 16), a3);
}

uint64_t sub_100009130(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100008F94(a1, a2);
  return a1;
}

uint64_t sub_100009144(__int128 *a1, uint64_t a2)
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

_QWORD *sub_10000915C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100009180(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000091A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1000054EC(a1, a2, *(unint64_t **)(v3 + 16), a3);
}

void type metadata accessor for SecKey(uint64_t a1)
{
  sub_1000091F8(a1, &qword_10003AB08, (uint64_t)&unk_1000351A0);
}

void type metadata accessor for SecIdentity(uint64_t a1)
{
  sub_1000091F8(a1, &qword_10003AB20, (uint64_t)&unk_100035230);
}

void type metadata accessor for CFArray(uint64_t a1)
{
  sub_1000091F8(a1, &qword_10003AB28, (uint64_t)&unk_100035260);
}

void sub_1000091F8(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_10000923C()
{
  return sub_100009054((unint64_t *)&qword_10003AB38, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C174);
}

uint64_t sub_100009268()
{
  return sub_100009054((unint64_t *)&unk_10003AB40, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C11C);
}

uint64_t sub_100009390(void *a1, int a2, uint64_t a3, void *aBlock, void (*a5)(uint64_t, uint64_t, id, void *))
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v8 = _Block_copy(aBlock);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  _Block_copy(v8);
  v12 = a1;
  a5(v9, v11, v12, v8);
  _Block_release(v8);
  _Block_release(v8);

  return swift_bridgeObjectRelease(v11);
}

uint64_t sub_100009440(void *a1, int a2, char a3, uint64_t a4, void *aBlock, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;

  v14 = _Block_copy(aBlock);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = v16;
  _Block_copy(v14);
  v18 = a1;
  sub_10000BA48(a3, v15, v17, (uint64_t)v18, (uint64_t)v14, a6, a7, a8);
  _Block_release(v14);
  _Block_release(v14);

  return swift_bridgeObjectRelease(v17);
}

void *sub_100009514()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + OBJC_IVAR___CloudKitKVSManager_keyValueStore);
  if (!v1)
    return &_swiftEmptyDictionarySingleton;
  v2 = objc_msgSend(v1, "dictionaryRepresentation");
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (qword_10003A9D0 != -1)
    swift_once(&qword_10003A9D0, sub_100016B30);
  v4 = type metadata accessor for Logger(0);
  sub_1000073A0(v4, (uint64_t)qword_10003B2E8);
  v5 = swift_bridgeObjectRetain_n(v3, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = swift_bridgeObjectRetain(v3);
    v11 = Dictionary.description.getter(v10, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v13 = v12;
    swift_bridgeObjectRelease(v3);
    v15 = sub_10002A370(v11, v13, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16);
    swift_bridgeObjectRelease_n(v3, 2);
    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "KVS store: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v3, 2);
  }
  return (void *)v3;
}

void sub_100009750(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  NSString v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = OBJC_IVAR___CloudKitKVSManager_keyValueStore;
  v5 = *(void **)(v3 + OBJC_IVAR___CloudKitKVSManager_keyValueStore);
  if (!v5)
    goto LABEL_10;
  v8 = a1[3];
  v9 = sub_10000915C(a1, v8);
  v10 = v5;
  v11 = _bridgeAnythingToObjectiveC<A>(_:)(v9, v8);
  v12 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setObject:forKey:", v11, v12);

  swift_unknownObjectRelease(v11);
  v13 = *(void **)(v3 + v4);
  if (v13)
  {
    if ((objc_msgSend(v13, "synchronize") & 1) == 0)
    {
      if (qword_10003A9D0 != -1)
        swift_once(&qword_10003A9D0, sub_100016B30);
      v14 = type metadata accessor for Logger(0);
      sub_1000073A0(v14, (uint64_t)qword_10003B2E8);
      v15 = swift_bridgeObjectRetain_n(a3, 2);
      v16 = Logger.logObject.getter(v15);
      v17 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc(12, -1);
        v19 = swift_slowAlloc(32, -1);
        v22 = v19;
        *(_DWORD *)v18 = 136315138;
        swift_bridgeObjectRetain(a3);
        v20 = sub_10002A370(a2, a3, &v22);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
        swift_bridgeObjectRelease_n(a3, 3);
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Store failed to synchronize key %s", v18, 0xCu);
        swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v19, -1, -1);
        swift_slowDealloc(v18, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a3, 2);
      }
    }
  }
  else
  {
LABEL_10:
    __break(1u);
  }
}

uint64_t sub_100009988(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  unint64_t v13;
  _BYTE *v14;
  _QWORD *v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  void *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  void *v56;

  v56 = &_swiftEmptyDictionarySingleton;
  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v3)
  {
    if (qword_10003A9D0 != -1)
      swift_once(&qword_10003A9D0, sub_100016B30);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_1000073A0(v8, (uint64_t)qword_10003B2E8);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Invalid agrument. emailAddress can't be empty", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    v13 = sub_10000B528();
    swift_allocError(&_s5ErrorON_0, v13, 0, 0);
    *v14 = 5;
    swift_willThrow();
    v7 = v56;
    return swift_bridgeObjectRelease(v7);
  }
  v6 = sub_100009514();
  if (v2)
  {
    v7 = &_swiftEmptyDictionarySingleton;
    return swift_bridgeObjectRelease(v7);
  }
  v16 = v6;
  if (!v6[2])
  {
    v54 = 0u;
    v55 = 0u;
LABEL_25:
    swift_bridgeObjectRelease(v16);
    goto LABEL_26;
  }
  swift_bridgeObjectRetain(a2);
  v17 = sub_100027010(a1, a2);
  if ((v18 & 1) == 0)
  {
    v54 = 0u;
    v55 = 0u;
    swift_bridgeObjectRelease(a2);
    goto LABEL_25;
  }
  sub_100008EDC(v16[7] + 32 * v17, (uint64_t)&v54);
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(v16);
  if (!*((_QWORD *)&v55 + 1))
  {
LABEL_26:
    sub_10000B4E8((uint64_t)&v54);
    goto LABEL_27;
  }
  v19 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
  if ((swift_dynamicCast(&v52, &v54, (char *)&type metadata for Any + 8, v19, 6) & 1) != 0)
  {
    v20 = v52;
    if (*(_QWORD *)(v52 + 16))
    {
      v21 = sub_100027010(0xD000000000000014, 0x800000010002E7D0);
      if ((v22 & 1) != 0)
      {
        sub_100008EDC(*(_QWORD *)(v20 + 56) + 32 * v21, (uint64_t)&v54);
        if ((swift_dynamicCast(&v52, &v54, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
        {
          v23 = v52;
          v24 = v53;
          v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentEncryptionCertIdKey);
          v27 = v26;
          sub_100008F50(v23, v24);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
          *(_QWORD *)&v54 = &_swiftEmptyDictionarySingleton;
          v56 = (void *)0x8000000000000000;
          sub_10002835C(v23, v24, v25, v27, isUniquelyReferenced_nonNull_native);
          v29 = v56;
          v56 = (void *)v54;
          swift_bridgeObjectRelease(v27);
          swift_bridgeObjectRelease(v29);
          sub_100008F94(v23, v24);
        }
      }
    }
    if (*(_QWORD *)(v20 + 16) && (v30 = sub_100027010(0xD000000000000011, 0x800000010002E7F0), (v31 & 1) != 0))
    {
      sub_100008EDC(*(_QWORD *)(v20 + 56) + 32 * v30, (uint64_t)&v54);
    }
    else
    {
      v54 = 0u;
      v55 = 0u;
    }
    swift_bridgeObjectRelease(v20);
    if (*((_QWORD *)&v55 + 1))
    {
      if ((swift_dynamicCast(&v52, &v54, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
      {
        v43 = v52;
        v44 = v53;
        v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentSigningCertIdKey);
        v47 = v46;
        sub_100008F50(v43, v44);
        v48 = v56;
        v49 = swift_isUniquelyReferenced_nonNull_native(v56);
        *(_QWORD *)&v54 = v48;
        v56 = (void *)0x8000000000000000;
        sub_10002835C(v43, v44, v45, v47, v49);
        v50 = v56;
        v56 = (void *)v54;
        swift_bridgeObjectRelease(v47);
        swift_bridgeObjectRelease(v50);
        sub_100008F94(v43, v44);
      }
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_27:
  if (qword_10003A9D0 != -1)
    swift_once(&qword_10003A9D0, sub_100016B30);
  v32 = type metadata accessor for Logger(0);
  v33 = sub_1000073A0(v32, (uint64_t)qword_10003B2E8);
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc(12, -1);
    v37 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v54 = v37;
    *(_DWORD *)v36 = 136315138;
    swift_beginAccess(&v56, &v52, 0, 0);
    v38 = v56;
    v39 = swift_bridgeObjectRetain(v56);
    v40 = Dictionary.description.getter(v39, &type metadata for String, &type metadata for Data, &protocol witness table for String);
    v42 = v41;
    swift_bridgeObjectRelease(v38);
    v51 = sub_10002A370(v40, v42, (uint64_t *)&v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52);
    swift_bridgeObjectRelease(v42);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Found default certificates: %s", v36, 0xCu);
    swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v36, -1, -1);
  }

  swift_beginAccess(&v56, &v54, 0, 0);
  return (uint64_t)v56;
}

_QWORD *sub_100009FFC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  unint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  NSString v47;
  Class isa;
  unsigned __int8 v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  unint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;

  v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v6 = v3;
    result = sub_100009514();
    if (!v4)
    {
      v11 = result;
      if (result[2])
      {
        swift_bridgeObjectRetain(a2);
        v12 = sub_100027010(a1, a2);
        if ((v13 & 1) != 0)
        {
          sub_100008EDC(v11[7] + 32 * v12, (uint64_t)&v60);
        }
        else
        {
          v60 = 0u;
          v61 = 0u;
        }
      }
      else
      {
        v60 = 0u;
        v61 = 0u;
        swift_bridgeObjectRetain(a2);
      }
      sub_10000B4A0((uint64_t)&v60, (uint64_t)&v58);
      if (v59)
      {
        sub_100008F18(&v58, &v62);
      }
      else
      {
        v63 = (void *)sub_1000073FC((uint64_t *)&unk_10003AAA0);
        *(_QWORD *)&v62 = &_swiftEmptyDictionarySingleton;
        sub_10000B4E8((uint64_t)&v58);
      }
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(a2);
      v21 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
      swift_dynamicCast(&v57, &v62, (char *)&type metadata for Any + 8, v21, 7);
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentEncryptionCertIdKey);
      v24 = v23;
      if (*(_QWORD *)(a3 + 16) && (v25 = sub_100027010(v22, v23), (v26 & 1) != 0))
      {
        v27 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v25);
        v55 = v21;
        v28 = *v27;
        v29 = v27[1];
        sub_100008F50(*v27, v29);
        swift_bridgeObjectRelease(v24);
        v63 = &type metadata for Data;
        *(_QWORD *)&v62 = v28;
        *((_QWORD *)&v62 + 1) = v29;
        sub_100008F18(&v62, &v60);
        sub_100008F50(v28, v29);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v57);
        v31 = v57;
        v57 = 0x8000000000000000;
        *(_QWORD *)&v58 = v31;
        sub_10002822C(&v60, 0xD000000000000014, 0x800000010002E7D0, isUniquelyReferenced_nonNull_native);
        v32 = v57;
        v57 = v58;
        swift_bridgeObjectRelease(v32);
        v33 = v28;
        v21 = v55;
        sub_100008F94(v33, v29);
      }
      else
      {
        swift_bridgeObjectRelease(v24);
      }
      v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentSigningCertIdKey);
      v36 = v35;
      if (*(_QWORD *)(a3 + 16) && (v37 = sub_100027010(v34, v35), (v38 & 1) != 0))
      {
        v39 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v37);
        v56 = v21;
        v40 = *v39;
        v41 = v39[1];
        sub_100008F50(*v39, v41);
        swift_bridgeObjectRelease(v36);
        v63 = &type metadata for Data;
        *(_QWORD *)&v62 = v40;
        *((_QWORD *)&v62 + 1) = v41;
        sub_100008F18(&v62, &v60);
        sub_100008F50(v40, v41);
        v42 = swift_isUniquelyReferenced_nonNull_native(v57);
        v43 = v57;
        v57 = 0x8000000000000000;
        *(_QWORD *)&v58 = v43;
        sub_10002822C(&v60, 0xD000000000000011, 0x800000010002E7F0, v42);
        v44 = v57;
        v57 = v58;
        swift_bridgeObjectRelease(v44);
        v45 = v40;
        v21 = v56;
        sub_100008F94(v45, v41);
      }
      else
      {
        swift_bridgeObjectRelease(v36);
      }
      v63 = (void *)v21;
      *(_QWORD *)&v62 = v57;
      swift_bridgeObjectRetain(v57);
      sub_100009750(&v62, a1, a2);
      sub_100009180(&v62);
      v46 = *(void **)(v6 + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager);
      swift_unknownObjectRetain(v46);
      v47 = String._bridgeToObjectiveC()();
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      *(_QWORD *)&v62 = 0;
      v49 = objc_msgSend(v46, "updateCertificateDefaultsWithEmailAddress:identityPersistentRefs:error:", v47, isa, &v62);
      swift_unknownObjectRelease(v46);

      v50 = v62;
      if ((v49 & 1) != 0)
      {
        v51 = v57;
        v52 = (id)v62;
        v53 = v51;
      }
      else
      {
        v54 = (id)v62;
        _convertNSErrorToError(_:)(v50);

        swift_willThrow();
        v53 = v57;
      }
      return (_QWORD *)swift_bridgeObjectRelease(v53);
    }
  }
  else
  {
    if (qword_10003A9D0 != -1)
      swift_once(&qword_10003A9D0, sub_100016B30);
    v14 = type metadata accessor for Logger(0);
    v15 = sub_1000073A0(v14, (uint64_t)qword_10003B2E8);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Invalid agrument. emailAddress can't be empty", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    v19 = sub_10000B528();
    swift_allocError(&_s5ErrorON_0, v19, 0, 0);
    *v20 = 5;
    return (_QWORD *)swift_willThrow();
  }
  return result;
}

id sub_10000A5E0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  unint64_t v24;
  _BYTE *v25;
  _QWORD *v26;
  _QWORD *v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  NSString v36;
  NSString v37;
  unsigned int v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;

  v6 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
    if (qword_10003A9D0 != -1)
      swift_once(&qword_10003A9D0, sub_100016B30);
    v19 = type metadata accessor for Logger(0);
    v20 = sub_1000073A0(v19, (uint64_t)qword_10003B2E8);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Invalid agrument. emailAddress can't be empty", v23, 2u);
      swift_slowDealloc(v23, -1, -1);
    }

    v24 = sub_10000B528();
    swift_allocError(&_s5ErrorON_0, v24, 0, 0);
    *v25 = 5;
    return (id)swift_willThrow();
  }
  v7 = v4;
  v12 = 0xD000000000000011;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentSigningCertIdKey);
  if (v13 == a3 && v14 == a4)
  {
    swift_bridgeObjectRelease(a4);
    v18 = 0x800000010002E7F0;
  }
  else
  {
    v16 = v14;
    v17 = _stringCompareWithSmolCheck(_:_:expecting:)(a3, a4, v13, v14, 0);
    swift_bridgeObjectRelease(v16);
    if ((v17 & 1) != 0)
    {
      v18 = 0x800000010002E7F0;
    }
    else
    {
      v12 = 0xD000000000000014;
      v18 = 0x800000010002E7D0;
    }
  }
  v26 = sub_100009514();
  if (v5)
    return (id)swift_bridgeObjectRelease(v18);
  v28 = v26;
  if (!v26[2])
  {
    v43 = 0u;
    v44 = 0u;
LABEL_28:
    swift_bridgeObjectRelease(v28);
    goto LABEL_29;
  }
  swift_bridgeObjectRetain(a2);
  v29 = sub_100027010(a1, a2);
  if ((v30 & 1) == 0)
  {
    v43 = 0u;
    v44 = 0u;
    swift_bridgeObjectRelease(a2);
    goto LABEL_28;
  }
  sub_100008EDC(v28[7] + 32 * v29, (uint64_t)&v43);
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(v28);
  if (!*((_QWORD *)&v44 + 1))
  {
LABEL_29:
    swift_bridgeObjectRelease(v18);
    sub_10000B4E8((uint64_t)&v43);
    goto LABEL_30;
  }
  v31 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
  if ((swift_dynamicCast(&v42, &v43, (char *)&type metadata for Any + 8, v31, 6) & 1) != 0)
  {
    v41 = v31;
    v32 = v42;
    if (*(_QWORD *)(v42 + 16))
    {
      swift_bridgeObjectRetain(v42);
      swift_bridgeObjectRetain(v18);
      v33 = sub_100027010(v12, v18);
      if ((v34 & 1) != 0)
      {
        sub_100008EDC(*(_QWORD *)(v32 + 56) + 32 * v33, (uint64_t)&v43);
      }
      else
      {
        v43 = 0u;
        v44 = 0u;
      }
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v32);
      if (*((_QWORD *)&v44 + 1))
      {
        sub_10000B4E8((uint64_t)&v43);
        sub_100027144(v12, v18, &v43);
        sub_10000B4E8((uint64_t)&v43);
        swift_bridgeObjectRelease(v18);
        *((_QWORD *)&v44 + 1) = v41;
        *(_QWORD *)&v43 = v42;
        sub_100009750(&v43, a1, a2);
        sub_100009180(&v43);
        goto LABEL_30;
      }
    }
    else
    {
      v43 = 0u;
      v44 = 0u;
    }
    swift_bridgeObjectRelease(v18);
    sub_10000B4E8((uint64_t)&v43);
    swift_bridgeObjectRelease(v32);
    goto LABEL_30;
  }
  swift_bridgeObjectRelease(v18);
LABEL_30:
  v35 = *(void **)(v7 + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager);
  swift_unknownObjectRetain(v35);
  v36 = String._bridgeToObjectiveC()();
  v37 = String._bridgeToObjectiveC()();
  *(_QWORD *)&v43 = 0;
  v38 = objc_msgSend(v35, "removeCertificateDefaultsWithEmailAddress:certTypeKey:error:", v36, v37, &v43);
  swift_unknownObjectRelease(v35);

  v39 = v43;
  if (v38)
    return (id)v43;
  v40 = (id)v43;
  _convertNSErrorToError(_:)(v39);

  return (id)swift_willThrow();
}

id sub_10000ABB0()
{
  char *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v1, "removeObserver:name:object:", v0, NSUbiquitousKeyValueStoreDidChangeExternallyNotification, *(_QWORD *)&v0[OBJC_IVAR___CloudKitKVSManager_keyValueStore]);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CloudKitKVSManager();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for CloudKitKVSManager()
{
  return objc_opt_self(CloudKitKVSManager);
}

uint64_t sub_10000AD6C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  void *v18;
  __int128 v20;
  uint64_t v21;
  _OWORD v22[2];
  __int128 v23;
  void *v24;

  v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v6 = sub_100009514();
  }
  else
  {
    if (qword_10003A9D0 != -1)
      swift_once(&qword_10003A9D0, sub_100016B30);
    v10 = type metadata accessor for Logger(0);
    v11 = sub_1000073A0(v10, (uint64_t)qword_10003B2E8);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Invalid agrument. emailAddress can't be empty", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    v15 = sub_10000B528();
    v16 = swift_allocError(&_s5ErrorON_0, v15, 0, 0);
    *v17 = 5;
    v18 = (void *)_convertErrorToNSError(_:)(v16);
    (*(void (**)(uint64_t, _QWORD, void *))(a4 + 16))(a4, 0, v18);

    swift_errorRelease(v16);
    v6 = sub_100009514();
  }
  v7 = v6;
  if (v6[2] && (v8 = sub_100027010(0xD00000000000001BLL, 0x800000010002E7B0), (v9 & 1) != 0))
    sub_100008EDC(v7[7] + 32 * v8, (uint64_t)v22);
  else
    memset(v22, 0, sizeof(v22));
  sub_10000B4A0((uint64_t)v22, (uint64_t)&v20);
  if (v21)
  {
    sub_100008F18(&v20, &v23);
  }
  else
  {
    v24 = &type metadata for Bool;
    LOBYTE(v23) = 0;
    sub_10000B4E8((uint64_t)&v20);
  }
  swift_bridgeObjectRelease(v7);
  swift_dynamicCast(v22, &v23, (char *)&type metadata for Any + 8, &type metadata for Bool, 7);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a4 + 16))(a4, LOBYTE(v22[0]), 0);
}

uint64_t sub_10000AFE4(char a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  void *v19;
  void *v20;
  NSString v21;
  Class isa;
  char v23;
  unsigned int v24;
  void *v25;
  id v26;
  _QWORD *v27;
  unint64_t v28;
  char v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;

  v10 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v10 = a2 & 0xFFFFFFFFFFFFLL;
  if (!v10)
  {
    if (qword_10003A9D0 != -1)
      swift_once(&qword_10003A9D0, sub_100016B30);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_1000073A0(v11, (uint64_t)qword_10003B2E8);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Invalid agrument. emailAddress can't be empty", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

    v16 = sub_10000B528();
    v17 = swift_allocError(&_s5ErrorON_0, v16, 0, 0);
    *v18 = 5;
    v19 = (void *)_convertErrorToNSError(_:)(v17);
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v19);

    swift_errorRelease(v17);
  }
  v20 = *(void **)(a4 + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager);
  swift_unknownObjectRetain(v20);
  v21 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)&v45 = 0;
  v23 = a1 & 1;
  v24 = objc_msgSend(v20, "setFlagsToAccountWithEmailAddress:keys:value:error:", v21, isa, a1 & 1, &v45);
  swift_unknownObjectRelease(v20);

  v25 = (void *)v45;
  if (v24)
  {
    v46 = &type metadata for Bool;
    LOBYTE(v45) = v23;
    v26 = v25;
    sub_100009750(&v45, 0xD00000000000001BLL, 0x800000010002E7B0);
    sub_100009180(&v45);
    v27 = sub_100009514();
    if (v27[2])
    {
      swift_bridgeObjectRetain(a3);
      v28 = sub_100027010(a2, a3);
      if ((v29 & 1) != 0)
      {
        sub_100008EDC(v27[7] + 32 * v28, (uint64_t)&v43);
      }
      else
      {
        v43 = 0u;
        v44 = 0u;
      }
    }
    else
    {
      v43 = 0u;
      v44 = 0u;
      swift_bridgeObjectRetain(a3);
    }
    sub_10000B4A0((uint64_t)&v43, (uint64_t)&v41);
    if (v42)
    {
      sub_100008F18(&v41, &v45);
    }
    else
    {
      v46 = (void *)sub_1000073FC((uint64_t *)&unk_10003AAA0);
      *(_QWORD *)&v45 = &_swiftEmptyDictionarySingleton;
      sub_10000B4E8((uint64_t)&v41);
    }
    swift_bridgeObjectRelease(v27);
    swift_bridgeObjectRelease(a3);
    v34 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
    swift_dynamicCast(&v41, &v45, (char *)&type metadata for Any + 8, v34, 7);
    v46 = &type metadata for Bool;
    LOBYTE(v45) = v23;
    sub_100008F18(&v45, &v43);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v41);
    v39 = v41;
    *(_QWORD *)&v41 = 0x8000000000000000;
    sub_10002822C(&v43, 0xD000000000000013, 0x800000010002DB50, isUniquelyReferenced_nonNull_native);
    v36 = v41;
    *(_QWORD *)&v41 = v39;
    swift_bridgeObjectRelease(v36);
    v46 = &type metadata for Bool;
    LOBYTE(v45) = v23;
    sub_100008F18(&v45, &v43);
    v37 = swift_isUniquelyReferenced_nonNull_native(v41);
    v40 = v41;
    *(_QWORD *)&v41 = 0x8000000000000000;
    sub_10002822C(&v43, 0xD000000000000016, 0x800000010002DB70, v37);
    v38 = v41;
    *(_QWORD *)&v41 = v40;
    swift_bridgeObjectRelease(v38);
    v46 = (void *)v34;
    *(_QWORD *)&v45 = v41;
    swift_bridgeObjectRetain(v41);
    sub_100009750(&v45, a2, a3);
    sub_100009180(&v45);
    (*(void (**)(uint64_t, _QWORD))(a5 + 16))(a5, 0);
    return swift_bridgeObjectRelease(v41);
  }
  else
  {
    v30 = (id)v45;
    v31 = _convertNSErrorToError(_:)(v25);

    swift_willThrow();
    swift_errorRetain(v31);
    v32 = (void *)_convertErrorToNSError(_:)(v31);
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v32);

    swift_errorRelease(v31);
    return swift_errorRelease(v31);
  }
}

uint64_t sub_10000B4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000073FC(&qword_10003B1E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B4E8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000073FC(&qword_10003B1E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000B528()
{
  unint64_t result;

  result = qword_10003ABF0;
  if (!qword_10003ABF0)
  {
    result = swift_getWitnessTable(&unk_10002C538, &_s5ErrorON_0);
    atomic_store(result, (unint64_t *)&qword_10003ABF0);
  }
  return result;
}

void sub_10000B56C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  void *v25;
  unint64_t v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (v7)
  {
    v8 = sub_100009514();
  }
  else
  {
    if (qword_10003A9D0 != -1)
      swift_once(&qword_10003A9D0, sub_100016B30);
    v17 = type metadata accessor for Logger(0);
    v18 = sub_1000073A0(v17, (uint64_t)qword_10003B2E8);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Invalid agrument. emailAddress can't be empty", v21, 2u);
      swift_slowDealloc(v21, -1, -1);
    }

    v22 = sub_10000B528();
    v23 = swift_allocError(&_s5ErrorON_0, v22, 0, 0);
    *v24 = 5;
    v25 = (void *)_convertErrorToNSError(_:)(v23);
    (*(void (**)(uint64_t, _QWORD, void *))(a4 + 16))(a4, 0, v25);

    swift_errorRelease(v23);
    v8 = sub_100009514();
  }
  v9 = v8;
  v10 = objc_msgSend(objc_allocWithZone((Class)MCCSigningAndEncryptionMessagesStatus), "init");
  if (!v9[2])
  {
    v32 = 0u;
    v33 = 0u;
LABEL_19:
    swift_bridgeObjectRelease(v9);
    goto LABEL_20;
  }
  swift_bridgeObjectRetain(a2);
  v11 = sub_100027010(a1, a2);
  if ((v12 & 1) == 0)
  {
    v32 = 0u;
    v33 = 0u;
    swift_bridgeObjectRelease(a2);
    goto LABEL_19;
  }
  sub_100008EDC(v9[7] + 32 * v11, (uint64_t)&v32);
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(v9);
  if (!*((_QWORD *)&v33 + 1))
  {
LABEL_20:
    sub_10000B4E8((uint64_t)&v32);
    goto LABEL_21;
  }
  v13 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
  if ((swift_dynamicCast(&v30, &v32, (char *)&type metadata for Any + 8, v13, 6) & 1) != 0)
  {
    v14 = v30;
    if (*(_QWORD *)(v30 + 16) && (v15 = sub_100027010(0xD000000000000013, 0x800000010002DB50), (v16 & 1) != 0))
    {
      sub_100008EDC(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)&v30);
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
    }
    sub_10000B4A0((uint64_t)&v30, (uint64_t)&v28);
    if (v29)
    {
      sub_100008F18(&v28, &v32);
    }
    else
    {
      *((_QWORD *)&v33 + 1) = &type metadata for Bool;
      LOBYTE(v32) = 0;
      sub_10000B4E8((uint64_t)&v28);
    }
    swift_dynamicCast(&v30, &v32, (char *)&type metadata for Any + 8, &type metadata for Bool, 7);
    objc_msgSend(v10, "setSignMessagesIsEnabled:", v30);
    if (*(_QWORD *)(v14 + 16) && (v26 = sub_100027010(0xD000000000000016, 0x800000010002DB70), (v27 & 1) != 0))
    {
      sub_100008EDC(*(_QWORD *)(v14 + 56) + 32 * v26, (uint64_t)&v30);
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
    }
    sub_10000B4A0((uint64_t)&v30, (uint64_t)&v28);
    if (v29)
    {
      sub_100008F18(&v28, &v32);
    }
    else
    {
      *((_QWORD *)&v33 + 1) = &type metadata for Bool;
      LOBYTE(v32) = 0;
      sub_10000B4E8((uint64_t)&v28);
    }
    swift_bridgeObjectRelease(v14);
    swift_dynamicCast(&v30, &v32, (char *)&type metadata for Any + 8, &type metadata for Bool, 7);
    objc_msgSend(v10, "setEncryptMessagesIsEnabled:", v30);
  }
LABEL_21:
  (*(void (**)(uint64_t, id, _QWORD))(a4 + 16))(a4, v10, 0);

}

uint64_t sub_10000B980(char a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000BA48(a1, a2, a3, a4, a5, (uint64_t)&off_100034F98, 0xD000000000000013, 0x800000010002DB50);
}

uint64_t sub_10000B9E4(char a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000BA48(a1, a2, a3, a4, a5, (uint64_t)&off_100034FC8, 0xD000000000000016, 0x800000010002DB70);
}

uint64_t sub_10000BA48(char a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  unint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  void *v23;
  void *v24;
  NSString v25;
  Class isa;
  unsigned int v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v39;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;

  v14 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v14 = a2 & 0xFFFFFFFFFFFFLL;
  if (!v14)
  {
    if (qword_10003A9D0 != -1)
      swift_once(&qword_10003A9D0, sub_100016B30);
    v15 = type metadata accessor for Logger(0);
    v16 = sub_1000073A0(v15, (uint64_t)qword_10003B2E8);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Invalid agrument. emailAddress can't be empty", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    v20 = sub_10000B528();
    v21 = swift_allocError(&_s5ErrorON_0, v20, 0, 0);
    *v22 = 5;
    v23 = (void *)_convertErrorToNSError(_:)(v21);
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v23);

    swift_errorRelease(v21);
  }
  v24 = *(void **)(a4 + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager);
  swift_unknownObjectRetain(v24);
  v25 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)&v46 = 0;
  v27 = objc_msgSend(v24, "setFlagsToAccountWithEmailAddress:keys:value:error:", v25, isa, a1 & 1, &v46);
  swift_unknownObjectRelease(v24);

  v28 = v46;
  if (v27)
  {
    v29 = (id)v46;
    v30 = sub_100009514();
    if (v30[2])
    {
      swift_bridgeObjectRetain(a3);
      v31 = sub_100027010(a2, a3);
      if ((v32 & 1) != 0)
      {
        sub_100008EDC(v30[7] + 32 * v31, (uint64_t)&v44);
      }
      else
      {
        v44 = 0u;
        v45 = 0u;
      }
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
      swift_bridgeObjectRetain(a3);
    }
    sub_10000B4A0((uint64_t)&v44, (uint64_t)&v42);
    if (v43)
    {
      sub_100008F18(&v42, &v46);
    }
    else
    {
      v47 = (void *)sub_1000073FC((uint64_t *)&unk_10003AAA0);
      *(_QWORD *)&v46 = &_swiftEmptyDictionarySingleton;
      sub_10000B4E8((uint64_t)&v42);
    }
    swift_bridgeObjectRelease(v30);
    swift_bridgeObjectRelease(a3);
    v37 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
    swift_dynamicCast(&v42, &v46, (char *)&type metadata for Any + 8, v37, 7);
    v47 = &type metadata for Bool;
    LOBYTE(v46) = a1 & 1;
    sub_100008F18(&v46, &v44);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v42);
    v41 = v42;
    *(_QWORD *)&v42 = 0x8000000000000000;
    sub_10002822C(&v44, a7, a8, isUniquelyReferenced_nonNull_native);
    v39 = v42;
    *(_QWORD *)&v42 = v41;
    swift_bridgeObjectRelease(v39);
    v47 = (void *)v37;
    *(_QWORD *)&v46 = v42;
    swift_bridgeObjectRetain(v42);
    sub_100009750(&v46, a2, a3);
    sub_100009180(&v46);
    (*(void (**)(uint64_t, _QWORD))(a5 + 16))(a5, 0);
    return swift_bridgeObjectRelease(v42);
  }
  else
  {
    v33 = (id)v46;
    v34 = _convertNSErrorToError(_:)(v28);

    swift_willThrow();
    swift_errorRetain(v34);
    v35 = (void *)_convertErrorToNSError(_:)(v34);
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v35);

    swift_errorRelease(v34);
    return swift_errorRelease(v34);
  }
}

void sub_10000BE50(uint64_t a1)
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
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  os_log_type_t v58;
  const char *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint32_t v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t (*v66)(char *, uint64_t, uint64_t);
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;

  v2 = type metadata accessor for Notification(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v65 - v7;
  if (qword_10003A9D0 != -1)
    swift_once(&qword_10003A9D0, sub_100016B30);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_1000073A0(v9, (uint64_t)qword_10003B2E8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v12 = v11(v8, a1, v2);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc(12, -1);
    v68 = v10;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc(32, -1);
    v67 = v6;
    v18 = v17;
    v72 = v17;
    v66 = v11;
    *(_DWORD *)v16 = 136315138;
    v69 = a1;
    v19 = sub_10000C5C8();
    v20 = dispatch thunk of CustomStringConvertible.description.getter(v2, v19);
    v22 = v21;
    *(_QWORD *)&v74 = sub_10002A370(v20, v21, &v72);
    a1 = v69;
    v11 = v66;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, (char *)&v74 + 8);
    swift_bridgeObjectRelease(v22);
    v23 = *(void (**)(char *, uint64_t))(v3 + 8);
    v23(v8, v2);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Received NSUbiquitousKeyValueStoreDidChangeExternallyNotification {notification: %s}", v16, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    v24 = v18;
    v6 = v67;
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v16, -1, -1);
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t))(v3 + 8);
    v23(v8, v2);
  }

  v25 = ((uint64_t (*)(void))Notification.userInfo.getter)();
  if (!v25)
  {
    v74 = 0u;
    v75 = 0u;
LABEL_17:
    sub_10000B4E8((uint64_t)&v74);
    goto LABEL_18;
  }
  v26 = v25;
  v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUbiquitousKeyValueStoreChangedKeysKey);
  v71 = v27;
  AnyHashable.init<A>(_:)(&v72, &v70, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v26 + 16) && (v28 = sub_100027074((uint64_t)&v72), (v29 & 1) != 0))
  {
    sub_100008EDC(*(_QWORD *)(v26 + 56) + 32 * v28, (uint64_t)&v74);
  }
  else
  {
    v74 = 0u;
    v75 = 0u;
  }
  swift_bridgeObjectRelease(v26);
  sub_10000C594((uint64_t)&v72);
  if (!*((_QWORD *)&v75 + 1))
    goto LABEL_17;
  v30 = sub_1000073FC(&qword_10003AA88);
  if ((swift_dynamicCast(&v72, &v74, (char *)&type metadata for Any + 8, v30, 6) & 1) != 0)
  {
    v31 = v72;
    if (*(_QWORD *)(v72 + 16))
    {
      v32 = swift_bridgeObjectRetain(v72);
      v33 = Logger.logObject.getter(v32);
      v34 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v33, v34))
      {
        v69 = a1;
        v35 = (uint8_t *)swift_slowAlloc(12, -1);
        v36 = swift_slowAlloc(32, -1);
        v72 = v36;
        *(_DWORD *)v35 = 136315138;
        v37 = swift_bridgeObjectRetain(v31);
        v38 = Array.description.getter(v37, &type metadata for String);
        v40 = v39;
        swift_bridgeObjectRelease(v31);
        *(_QWORD *)&v74 = sub_10002A370(v38, v40, &v72);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, (char *)&v74 + 8);
        swift_bridgeObjectRelease_n(v31, 2);
        swift_bridgeObjectRelease(v40);
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification changed keys: %s", v35, 0xCu);
        swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v36, -1, -1);
        swift_slowDealloc(v35, -1, -1);

      }
      else
      {

        v41 = swift_bridgeObjectRelease_n(v31, 2);
      }
      v51 = Notification.userInfo.getter(v41);
      if (v51)
      {
        v52 = v51;
        v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUbiquitousKeyValueStoreChangeReasonKey);
        v71 = v53;
        AnyHashable.init<A>(_:)(&v72, &v70, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(v52 + 16) && (v54 = sub_100027074((uint64_t)&v72), (v55 & 1) != 0))
        {
          sub_100008EDC(*(_QWORD *)(v52 + 56) + 32 * v54, (uint64_t)&v74);
        }
        else
        {
          v74 = 0u;
          v75 = 0u;
        }
        swift_bridgeObjectRelease(v52);
        sub_10000C594((uint64_t)&v72);
        if (*((_QWORD *)&v75 + 1))
        {
          v56 = swift_dynamicCast(&v72, &v74, (char *)&type metadata for Any + 8, &type metadata for Int, 6);
          if ((v56 & 1) != 0)
          {
            v57 = v72;
            v43 = Logger.logObject.getter(v56);
            v58 = static os_log_type_t.debug.getter();
            if (!os_log_type_enabled(v43, v58))
              goto LABEL_22;
            v45 = (uint8_t *)swift_slowAlloc(12, -1);
            *(_DWORD *)v45 = 134217984;
            v72 = v57;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);
            v59 = "handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification change reason is %ld";
            v60 = v43;
            v61 = v58;
            v62 = v45;
            v63 = 12;
            goto LABEL_38;
          }
LABEL_36:
          v43 = Logger.logObject.getter(v56);
          v64 = static os_log_type_t.error.getter();
          if (!os_log_type_enabled(v43, v64))
            goto LABEL_22;
          v45 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v45 = 0;
          v59 = "NSUbiquitousKeyValueStoreDidChangeExternallyNotification missing reason.";
          v60 = v43;
          v61 = v64;
          v62 = v45;
          v63 = 2;
LABEL_38:
          _os_log_impl((void *)&_mh_execute_header, v60, v61, v59, v62, v63);
          goto LABEL_20;
        }
      }
      else
      {
        v74 = 0u;
        v75 = 0u;
      }
      v56 = sub_10000B4E8((uint64_t)&v74);
      goto LABEL_36;
    }
    swift_bridgeObjectRelease(v72);
  }
LABEL_18:
  v42 = v11(v6, a1, v2);
  v43 = Logger.logObject.getter(v42);
  v44 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v43, v44))
  {
    v23(v6, v2);
    goto LABEL_22;
  }
  v45 = (uint8_t *)swift_slowAlloc(12, -1);
  v46 = swift_slowAlloc(32, -1);
  v72 = v46;
  *(_DWORD *)v45 = 136315138;
  *(_QWORD *)&v74 = ((uint64_t (*)(void))Notification.userInfo.getter)();
  v47 = sub_1000073FC(&qword_10003ABF8);
  v48 = String.init<A>(describing:)(&v74, v47);
  v50 = v49;
  *(_QWORD *)&v74 = sub_10002A370(v48, v49, &v72);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, (char *)&v74 + 8);
  swift_bridgeObjectRelease(v50);
  v23(v6, v2);
  _os_log_impl((void *)&_mh_execute_header, v43, v44, "Could not find changed keys on notification or changed keys was empty: %s", v45, 0xCu);
  swift_arrayDestroy(v46, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v46, -1, -1);
LABEL_20:
  swift_slowDealloc(v45, -1, -1);
LABEL_22:

}

uint64_t sub_10000C594(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

unint64_t sub_10000C5C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003AC00;
  if (!qword_10003AC00)
  {
    v1 = type metadata accessor for Notification(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Notification, v1);
    atomic_store(result, (unint64_t *)&qword_10003AC00);
  }
  return result;
}

void sub_10000C610(uint64_t a1@<X8>)
{
  uint64_t v1;
  Class isa;
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  NSString v13;
  NSString v14;
  NSString v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSString v20;
  id v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  NSString v25;
  NSString v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];

  isa = URLRequest._bridgeToObjectiveC()().super.isa;
  v4 = -[objc_class mutableCopy](isa, "mutableCopy");

  _bridgeAnyObjectToAny(_:)(v29, v4);
  swift_unknownObjectRelease(v4);
  v5 = sub_10000C99C();
  if (swift_dynamicCast(&v28, v29, (char *)&type metadata for Any + 8, v5, 6))
  {
    v6 = v28;
    v7 = objc_msgSend(objc_allocWithZone((Class)ACAccountStore), "init");
    v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
    if (v8)
    {
      v9 = v8;

      sub_10000CA08(v9);
      v11 = v10;

      if (v11)
      {
        v12 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v11);
        v13 = String._bridgeToObjectiveC()();
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", v12, v13);

      }
      v14 = String._bridgeToObjectiveC()();
      v15 = String._bridgeToObjectiveC()();
      objc_msgSend(v6, "setValue:forHTTPHeaderField:", v14, v15);

      objc_msgSend(v6, "ak_addDeviceUDIDHeader");
      objc_msgSend(v6, "ak_addClientInfoHeader");
      v16 = sub_10000CBF0();
      if (v1)
      {

      }
      else
      {
        v18 = v16;
        v19 = objc_msgSend(v16, "machineID");
        v20 = String._bridgeToObjectiveC()();
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", v19, v20);

        v21 = objc_msgSend(v18, "oneTimePassword");
        v22 = String._bridgeToObjectiveC()();
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", v21, v22);

        v29[0] = objc_msgSend(v18, "routingInfo");
        dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
        v24 = v23;
        v25 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v24);
        v26 = String._bridgeToObjectiveC()();
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", v25, v26);

        static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(v6);
        v27 = type metadata accessor for URLRequest(0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(a1, 0, 1, v27);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v17 = type metadata accessor for URLRequest(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a1, 1, 1, v17);
  }
}

unint64_t sub_10000C99C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003AC08;
  if (!qword_10003AC08)
  {
    v1 = objc_opt_self(NSMutableURLRequest);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003AC08);
  }
  return result;
}

id sub_10000C9D8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)AKAnisetteProvisioningController), "init");
  qword_10003B2C8 = (uint64_t)result;
  return result;
}

id sub_10000CA08(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id result;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  Swift::String v24;
  unint64_t v25;
  unint64_t v26;

  v2 = type metadata accessor for String.Encoding(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, "aa_personID");
  if (result)
  {
    v7 = result;
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v10 = v9;

    v11 = objc_msgSend(a1, "aa_authToken");
    if (v11)
    {
      v12 = v11;
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      v15 = v14;

      v25 = v8;
      v26 = v10;
      v16._countAndFlagsBits = 58;
      v16._object = (void *)0xE100000000000000;
      String.append(_:)(v16);
      v17._countAndFlagsBits = v13;
      v17._object = v15;
      String.append(_:)(v17);
      v18 = swift_bridgeObjectRelease(v15);
      v19 = v25;
      v20 = v26;
      static String.Encoding.ascii.getter(v18);
      v21 = String.data(using:allowLossyConversion:)(v5, 0, v19, v20);
      v23 = v22;
      swift_bridgeObjectRelease(v20);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      if (v23 >> 60 != 15)
      {
        sub_100008F50(v21, v23);
        v24 = Data.base64EncodedString(options:)(0);
        sub_100009130(v21, v23);
        v25 = 0;
        v26 = 0xE000000000000000;
        _StringGuts.grow(_:)(23);
        swift_bridgeObjectRelease(v26);
        v25 = 0xD000000000000015;
        v26 = 0x800000010002E880;
        String.append(_:)(v24);
        swift_bridgeObjectRelease(v24._object);
        sub_100009130(v21, v23);
        return (id)v25;
      }
    }
    else
    {
      swift_bridgeObjectRelease(v10);
    }
    return 0;
  }
  return result;
}

id sub_10000CBF0()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v5;

  if (qword_10003A9C0 != -1)
    swift_once(&qword_10003A9C0, sub_10000C9D8);
  v5 = 0;
  v0 = objc_msgSend((id)qword_10003B2C8, "anisetteDataWithError:", &v5);
  v1 = v5;
  if (v0)
  {
    v2 = v5;
  }
  else
  {
    v3 = v5;
    _convertNSErrorToError(_:)(v1);

    swift_willThrow();
  }
  return v0;
}

void sub_10000CCD0(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000CD98(char a1)
{
  if ((a1 & 1) != 0)
    return 0x74707972636E65;
  else
    return 0x676E696E676973;
}

_QWORD *sub_10000CDD4(uint64_t a1)
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
    sub_10001EB60(0, v1, 0);
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
        sub_10001EB60(0, v2[2] + 1, 1);
        v2 = v11;
      }
      v7 = v2[2];
      v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_10001EB60(v6 > 1, v7 + 1, 1);
        v2 = v11;
      }
      v4 += 2;
      v2[2] = v7 + 1;
      sub_100008F18(v10, &v2[4 * v7 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

_QWORD *sub_10000CEF8(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  _OWORD v10[2];
  _QWORD *v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    v11 = _swiftEmptyArrayStorage;
    sub_10001EB60(0, v1, 0);
    v4 = (uint64_t *)(a1 + 32);
    v2 = _swiftEmptyArrayStorage;
    do
    {
      v9 = *v4;
      swift_bridgeObjectRetain(v9);
      v5 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
      swift_dynamicCast(v10, &v9, v5, (char *)&type metadata for Any + 8, 7);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_10001EB60(0, v2[2] + 1, 1);
        v2 = v11;
      }
      v7 = v2[2];
      v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_10001EB60(v6 > 1, v7 + 1, 1);
        v2 = v11;
      }
      v2[2] = v7 + 1;
      sub_100008F18(v10, &v2[4 * v7 + 4]);
      ++v4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_10000D07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSArray v5;
  uint64_t v6;
  id v7;

  if (!a1)
  {
    v5.super.isa = 0;
    if (a2)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  if (!a2)
    goto LABEL_5;
LABEL_3:
  v6 = _convertErrorToNSError(_:)(a2);
LABEL_6:
  v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);

}

void sub_10000D100(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, void *a8, uint64_t a9)
{
  uint64_t v11;
  id v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSString v34;
  unsigned int v35;
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  os_log_type_t v51;
  uint64_t v52;
  _QWORD *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  os_log_type_t v57;
  void *v58;
  NSObject *log;
  os_log_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66[3];

  v11 = a6;
  if (!a2 && a1)
  {
    v17 = a1;
    if (sub_100006C08(v17))
    {
      swift_beginAccess(a3 + 16, v66, 33, 0);
      v18 = v17;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v20 = *(_QWORD *)((*(_QWORD *)(a3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10);
      v19 = *(_QWORD *)((*(_QWORD *)(a3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v20 >= v19 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1);
      v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v18);
      specialized Array._endMutation()(v21);
      swift_endAccess(v66);
LABEL_23:

      return;
    }

    v11 = a6;
  }
  if (qword_10003A9C8 != -1)
    swift_once(&qword_10003A9C8, sub_100016B08);
  v22 = type metadata accessor for Logger(0);
  sub_1000073A0(v22, (uint64_t)qword_10003B2D0);
  swift_bridgeObjectRetain(a5);
  sub_100008F50(v11, a7);
  v23 = a8;
  swift_errorRetain(a2);
  swift_bridgeObjectRetain(a5);
  sub_100008F50(v11, a7);
  v24 = v23;
  v25 = swift_errorRetain(a2);
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.error.getter();
  v63 = a4;
  if (os_log_type_enabled(v26, v27))
  {
    v57 = v27;
    log = v26;
    v28 = swift_slowAlloc(32, -1);
    v29 = (_QWORD *)swift_slowAlloc(16, -1);
    v58 = (void *)swift_slowAlloc(32, -1);
    v66[0] = v58;
    *(_DWORD *)v28 = 136315650;
    swift_bridgeObjectRetain(a5);
    v64 = sub_10002A370(a4, a5, (uint64_t *)v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
    swift_bridgeObjectRelease_n(a5, 2);
    sub_100008F94(v11, a7);
    swift_bridgeObjectRelease(a5);
    v60 = (os_log_t)a7;
    sub_100008F94(v11, a7);
    *(_WORD *)(v28 + 12) = 2112;
    v64 = (uint64_t)v24;
    v30 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
    *v29 = v24;

    *(_WORD *)(v28 + 22) = 2112;
    if (a2)
    {
      swift_errorRetain(a2);
      v31 = _swift_stdlib_bridgeErrorToNSError(a2);
      v64 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
    }
    else
    {
      v64 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
      v31 = 0;
    }
    v29[1] = v31;
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    _os_log_impl((void *)&_mh_execute_header, log, v57, "Default certificate %s for %@ was not found or invalid. Error: %@", (uint8_t *)v28, 0x20u);
    v32 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v29, 2, v32);
    swift_slowDealloc(v29, -1, -1);
    swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v58, -1, -1);
    swift_slowDealloc(v28, -1, -1);

    a7 = (unint64_t)v60;
  }
  else
  {
    swift_bridgeObjectRelease(a5);
    sub_100008F94(v11, a7);
    swift_bridgeObjectRelease(a5);
    sub_100008F94(v11, a7);

    swift_errorRelease(a2);
    swift_errorRelease(a2);

  }
  v33 = *(void **)(a9 + OBJC_IVAR___CertificateManager_cloudKVSManager);
  swift_unknownObjectRetain(v33);
  v34 = String._bridgeToObjectiveC()();
  v66[0] = 0;
  v35 = objc_msgSend(v33, "removeCertificateSettingsWithEmailAddress:certTypeKey:error:", v24, v34, v66);
  swift_unknownObjectRelease(v33);

  v36 = v66[0];
  if (!v35)
  {
    v46 = v66[0];
    v47 = _convertNSErrorToError(_:)(v36);

    swift_willThrow();
    swift_bridgeObjectRetain(a5);
    sub_100008F50(v11, a7);
    v48 = v24;
    swift_errorRetain(v47);
    swift_bridgeObjectRetain(a5);
    sub_100008F50(v11, a7);
    v49 = v48;
    v50 = swift_errorRetain(v47);
    v18 = Logger.logObject.getter(v50);
    v51 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v51))
    {
      v52 = swift_slowAlloc(32, -1);
      v53 = (_QWORD *)swift_slowAlloc(16, -1);
      v62 = (void *)swift_slowAlloc(32, -1);
      v66[0] = v62;
      *(_DWORD *)v52 = 136315650;
      swift_bridgeObjectRetain(a5);
      v64 = sub_10002A370(v63, a5, (uint64_t *)v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
      swift_bridgeObjectRelease_n(a5, 2);
      sub_100008F94(v11, a7);
      swift_bridgeObjectRelease(a5);
      sub_100008F94(v11, a7);
      *(_WORD *)(v52 + 12) = 2112;
      v64 = (uint64_t)v49;
      v54 = v49;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
      *v53 = v49;

      *(_WORD *)(v52 + 22) = 2112;
      swift_errorRetain(v47);
      v55 = _swift_stdlib_bridgeErrorToNSError(v47);
      v64 = v55;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
      v53[1] = v55;
      swift_errorRelease(v47);
      swift_errorRelease(v47);
      _os_log_impl((void *)&_mh_execute_header, v18, v51, "Default certificate %s for %@ failed to remove. Error: %@", (uint8_t *)v52, 0x20u);
      v56 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v53, 2, v56);
      swift_slowDealloc(v53, -1, -1);
      swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v52, -1, -1);

      swift_errorRelease(v47);
      return;
    }
    swift_errorRelease(v47);
    swift_bridgeObjectRelease(a5);
    sub_100008F94(v11, a7);
    swift_bridgeObjectRelease(a5);
    sub_100008F94(v11, a7);

    swift_errorRelease(v47);
    swift_errorRelease(v47);
    goto LABEL_23;
  }
  swift_bridgeObjectRetain(a5);
  sub_100008F50(v11, a7);
  v37 = v24;
  swift_bridgeObjectRetain(a5);
  sub_100008F50(v11, a7);
  v38 = v37;
  v39 = Logger.logObject.getter(v36);
  v40 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = v11;
    v42 = swift_slowAlloc(22, -1);
    v43 = (_QWORD *)swift_slowAlloc(8, -1);
    v61 = (void *)swift_slowAlloc(32, -1);
    v66[0] = v61;
    *(_DWORD *)v42 = 136315394;
    swift_bridgeObjectRetain(a5);
    v64 = sub_10002A370(v63, a5, (uint64_t *)v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
    swift_bridgeObjectRelease_n(a5, 2);
    sub_100008F94(v41, a7);
    swift_bridgeObjectRelease(a5);
    sub_100008F94(v41, a7);
    *(_WORD *)(v42 + 12) = 2112;
    v64 = (uint64_t)v38;
    v44 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
    *v43 = v38;

    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Default certificate %s for %@ was removed", (uint8_t *)v42, 0x16u);
    v45 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v43, 1, v45);
    swift_slowDealloc(v43, -1, -1);
    swift_arrayDestroy(v61, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v61, -1, -1);
    swift_slowDealloc(v42, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease(a5);
    sub_100008F94(v11, a7);
    swift_bridgeObjectRelease(a5);
    sub_100008F94(v11, a7);

  }
}

void sub_10000DA38(uint64_t a1, void *a2, void *a3)
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

void sub_10000DAB8(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a3;
  v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);

}

uint64_t sub_10000DB34(uint64_t a1, void *a2, void *a3)
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

  sub_100009130((uint64_t)v4, v9);
  return swift_release(v5);
}

void sub_10000DBC8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, const char *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *oslog;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[16];

  if (a3 || a2 >> 60 == 15)
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v17 = type metadata accessor for Logger(0);
    sub_1000073A0(v17, (uint64_t)qword_10003B2D0);
    swift_errorRetain(a3);
    v18 = swift_errorRetain(a3);
    oslog = Logger.logObject.getter(v18);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v20 = 138412290;
      if (a3)
      {
        swift_errorRetain(a3);
        v22 = _swift_stdlib_bridgeErrorToNSError(a3);
        v26 = v22;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, v27);
      }
      else
      {
        v26 = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, v27);
        v22 = 0;
      }
      *v21 = v22;
      swift_errorRelease(a3);
      swift_errorRelease(a3);
      _os_log_impl((void *)&_mh_execute_header, oslog, v19, a6, v20, 0xCu);
      v23 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v21, 1, v23);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v20, -1, -1);

    }
    else
    {
      swift_errorRelease(a3);
      swift_errorRelease(a3);

    }
  }
  else
  {
    v11 = a4 + 16;
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a5);
    v14 = v13;
    swift_beginAccess(v11, &v26, 33, 0);
    sub_100008F50(a1, a2);
    sub_100008F50(a1, a2);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(a4 + 16));
    v25 = *(_QWORD *)(a4 + 16);
    *(_QWORD *)(a4 + 16) = 0x8000000000000000;
    sub_10002835C(a1, a2, v12, v14, isUniquelyReferenced_nonNull_native);
    v16 = *(_QWORD *)(a4 + 16);
    *(_QWORD *)(a4 + 16) = v25;
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v16);
    swift_endAccess(&v26);
    sub_100009130(a1, a2);
  }
}

uint64_t sub_10000DF70(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  void *v13;
  NSString v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  Swift::String v19;
  Swift::Int v20;
  id v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  Swift::String v28;
  Swift::Int v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  Class isa;
  id v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  _QWORD *v47;
  void *v48;
  uint64_t v49;
  uint64_t result;
  Swift::String string;
  uint64_t v52;
  id v53;
  uint64_t v54;

  v5 = v4;
  string._countAndFlagsBits = a3;
  if (qword_10003A9C8 != -1)
    swift_once(&qword_10003A9C8, sub_100016B08);
  v7 = type metadata accessor for Logger(0);
  sub_1000073A0(v7, (uint64_t)qword_10003B2D0);
  v8 = swift_bridgeObjectRetain_n(a4, 2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = (void *)swift_slowAlloc(32, -1);
    v53 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain(a4);
    string._object = (void *)sub_10002A370(string._countAndFlagsBits, (unint64_t)a4, (uint64_t *)&v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&string._object, &v52);
    swift_bridgeObjectRelease_n(a4, 3);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "RefreshCertificate getDefaultIdentity for cert type : %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a4, 2);
  }
  v13 = *(void **)(v5 + OBJC_IVAR___CertificateManager_cloudKVSManager);
  swift_unknownObjectRetain(v13);
  v14 = String._bridgeToObjectiveC()();
  v53 = 0;
  v15 = objc_msgSend(v13, "fetchCertificatesSettingsWithEmailAddress:error:", v14, &v53);
  swift_unknownObjectRelease(v13);

  v16 = v53;
  if (!v15)
  {
    v21 = v53;
    v22 = _convertNSErrorToError(_:)(v16);

    swift_willThrow();
LABEL_24:
    swift_errorRetain(v22);
    v43 = swift_errorRetain(v22);
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc(12, -1);
      v47 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v46 = 138412290;
      swift_errorRetain(v22);
      v48 = (void *)_swift_stdlib_bridgeErrorToNSError(v22);
      v53 = v48;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54);
      *v47 = v48;
      swift_errorRelease(v22);
      swift_errorRelease(v22);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "RefreshCertificate error in getDefaultIdentity catch block : %@", v46, 0xCu);
      v49 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v47, 1, v49);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v46, -1, -1);

      swift_errorRelease(v22);
    }
    else
    {
      swift_errorRelease(v22);
      swift_errorRelease(v22);
      swift_errorRelease(v22);

    }
    return 0;
  }
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v15, &type metadata for String, &type metadata for Data, &protocol witness table for String);
  v18 = v16;

  swift_bridgeObjectRetain(a4);
  v19._countAndFlagsBits = string._countAndFlagsBits;
  v19._object = a4;
  v20 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100034FF8, v19);
  swift_bridgeObjectRelease(a4);
  if (v20 == 1)
  {
    v23 = _stringCompareWithSmolCheck(_:_:expecting:)(0x74707972636E65, 0xE700000000000000, 0x676E696E676973, 0xE700000000000000, 0);
    swift_bridgeObjectRelease(0xE700000000000000);
    if ((v23 & 1) == 0)
      goto LABEL_15;
  }
  else
  {
    if (v20)
      goto LABEL_15;
    swift_bridgeObjectRelease(0xE700000000000000);
  }
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentSigningCertIdKey);
  a4 = (void *)v25;
  if (*(_QWORD *)(v17 + 16))
  {
    v26 = sub_100027010(v24, v25);
    if ((v27 & 1) != 0)
      goto LABEL_21;
  }
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(v17);
  __break(1u);
LABEL_15:
  swift_bridgeObjectRetain(a4);
  v28._countAndFlagsBits = string._countAndFlagsBits;
  v28._object = a4;
  v29 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100034FF8, v28);
  swift_bridgeObjectRelease(a4);
  if (!v29)
  {
    v30 = _stringCompareWithSmolCheck(_:_:expecting:)(0x676E696E676973, 0xE700000000000000, 0x74707972636E65, 0xE700000000000000, 0);
    swift_bridgeObjectRelease(0xE700000000000000);
    if ((v30 & 1) != 0)
      goto LABEL_19;
LABEL_27:
    swift_bridgeObjectRelease(v17);
    return 0;
  }
  if (v29 != 1)
    goto LABEL_27;
  swift_bridgeObjectRelease(0xE700000000000000);
LABEL_19:
  v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentEncryptionCertIdKey);
  a4 = (void *)v32;
  if (*(_QWORD *)(v17 + 16))
  {
    v26 = sub_100027010(v31, v32);
    if ((v33 & 1) != 0)
    {
LABEL_21:
      v34 = (uint64_t *)(*(_QWORD *)(v17 + 56) + 16 * v26);
      v35 = *v34;
      v36 = v34[1];
      sub_100008F50(*v34, v36);
      swift_bridgeObjectRelease(a4);
      swift_bridgeObjectRelease(v17);
      v37 = *(void **)(v5 + OBJC_IVAR___CertificateManager_keychainManager);
      swift_unknownObjectRetain(v37);
      sub_100014A48(v35, v36);
      isa = Data._bridgeToObjectiveC()().super.isa;
      v53 = 0;
      v39 = objc_msgSend(v37, "getIdentityByRef:error:", isa, &v53);
      swift_unknownObjectRelease(v37);

      v40 = v53;
      if (v39)
      {
        v41 = v39;
        sub_100009130(v35, v36);
        sub_100009130(v35, v36);

        return (uint64_t)v39;
      }
      v42 = v40;
      v22 = _convertNSErrorToError(_:)(v40);

      swift_willThrow();
      sub_100009130(v35, v36);
      sub_100009130(v35, v36);
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease(a4);
  result = swift_bridgeObjectRelease(v17);
  __break(1u);
  return result;
}

void sub_10000E5D0(uint64_t a1, void (*a2)(_QWORD *, uint64_t), void *a3, void *a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  if (a1)
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v8 = type metadata accessor for Logger(0);
    sub_1000073A0(v8, (uint64_t)qword_10003B2D0);
    swift_errorRetain(a1);
    v9 = swift_errorRetain(a1);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v12 = 138412290;
      swift_errorRetain(a1);
      v14 = _swift_stdlib_bridgeErrorToNSError(a1);
      v20 = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
      *v13 = v14;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "RefreshCertificate error in generatePayloadAndRevoke: %@", v12, 0xCu);
      v15 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v13, 1, v15);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }

    a2(0, a1);
  }
  else
  {
    swift_retain(a3);
    v18 = a5;
    v19 = a4;
    sub_10001124C(v18, v19, a2, a3, v18, v19);
    swift_release(a3);

  }
}

void sub_10000E800(uint64_t a1, void (*a2)(_QWORD *, uint64_t), int a3, id a4)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  __SecCertificate **v11;
  __SecCertificate *v12;
  uint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __SecIdentity *v25;
  OSStatus v26;
  OSStatus v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  unint64_t v53;
  SecCertificateRef v54;
  uint64_t v55;
  uint64_t inited;
  uint64_t v57;
  uint64_t *v58;
  __SecCertificate *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  OSStatus v69;
  _BYTE v70[40];
  SecCertificateRef certificateRef;
  uint64_t v72;

  if (!a1)
  {
    v15 = objc_msgSend(a4, "commonName");
    if (v15)
    {
      v16 = v15;
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v19 = v18;

      v20 = objc_msgSend(a4, "certType");
      if (v20)
      {
        v21 = v20;
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
        v24 = v23;

        v25 = (__SecIdentity *)sub_10000DF70(v17, v19, v22, v24);
        swift_bridgeObjectRelease(v19);
        swift_bridgeObjectRelease(v24);
        if (v25)
        {
          certificateRef = 0;
          v26 = SecIdentityCopyCertificate(v25, &certificateRef);
          if (v26)
          {
            v27 = v26;
            if (qword_10003A9C8 != -1)
              swift_once(&qword_10003A9C8, sub_100016B08);
            v28 = type metadata accessor for Logger(0);
            v29 = sub_1000073A0(v28, (uint64_t)qword_10003B2D0);
            v30 = Logger.logObject.getter(v29);
            v31 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v30, v31))
            {
              v32 = (uint8_t *)swift_slowAlloc(8, -1);
              *(_DWORD *)v32 = 67109120;
              v69 = v27;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, v70);
              _os_log_impl((void *)&_mh_execute_header, v30, v31, "RefreshCertificate error: Failed to copy cert from identity: %d", v32, 8u);
              swift_slowDealloc(v32, -1, -1);
            }

            v33 = sub_1000073B8();
            v34 = swift_allocError(&_s5ErrorON, v33, 0, 0);
            *(_QWORD *)v35 = 9;
            *(_OWORD *)(v35 + 8) = 0u;
            *(_OWORD *)(v35 + 24) = 0u;
            *(_BYTE *)(v35 + 40) = 5;
            a2(0, v34);

            swift_errorRelease(v34);
          }
          else
          {
            v54 = certificateRef;
            v55 = sub_1000073FC(&qword_10003ACB0);
            inited = swift_initStackObject(v55, v70);
            *(_OWORD *)(inited + 16) = xmmword_10002BFF0;
            if (!v54)
            {
              __break(1u);
              return;
            }
            v57 = inited;
            v58 = (uint64_t *)(inited + 32);
            v59 = v54;
            v60 = sub_1000077B8((uint64_t)v59);

            *v58 = v60;
            if (qword_10003A9C8 != -1)
              swift_once(&qword_10003A9C8, sub_100016B08);
            v61 = type metadata accessor for Logger(0);
            v62 = sub_1000073A0(v61, (uint64_t)qword_10003B2D0);
            v63 = Logger.logObject.getter(v62);
            v64 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v63, v64))
            {
              v65 = (uint8_t *)swift_slowAlloc(2, -1);
              *(_WORD *)v65 = 0;
              _os_log_impl((void *)&_mh_execute_header, v63, v64, "RefreshCertificate: Successful results", v65, 2u);
              swift_slowDealloc(v65, -1, -1);
            }

            v66 = sub_10000CEF8(v57);
            swift_setDeallocating(v57);
            v67 = *(_QWORD *)(v57 + 16);
            v68 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
            swift_arrayDestroy(v58, v67, v68);
            a2(v66, 0);
            swift_bridgeObjectRelease(v66);

          }
          return;
        }
        if (qword_10003A9C8 != -1)
          swift_once(&qword_10003A9C8, sub_100016B08);
        v48 = type metadata accessor for Logger(0);
        v49 = sub_1000073A0(v48, (uint64_t)qword_10003B2D0);
        v50 = Logger.logObject.getter(v49);
        v51 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v52 = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "RefreshCertificate error: Failed to copy identity in getCertProperties", v52, 2u);
          swift_slowDealloc(v52, -1, -1);
        }

        v53 = sub_1000073B8();
        v46 = swift_allocError(&_s5ErrorON, v53, 0, 0);
        v47 = 14;
LABEL_23:
        *(_QWORD *)v45 = v47;
        *(_OWORD *)(v45 + 8) = 0u;
        *(_OWORD *)(v45 + 24) = 0u;
        *(_BYTE *)(v45 + 40) = 5;
        a2(0, v46);
        swift_errorRelease(v46);
        return;
      }
      swift_bridgeObjectRelease(v19);
    }
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v39 = type metadata accessor for Logger(0);
    v40 = sub_1000073A0(v39, (uint64_t)qword_10003B2D0);
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "RefreshCertificate error: Missing email id or certType from context", v43, 2u);
      swift_slowDealloc(v43, -1, -1);
    }

    v44 = sub_1000073B8();
    v46 = swift_allocError(&_s5ErrorON, v44, 0, 0);
    v47 = 15;
    goto LABEL_23;
  }
  if (qword_10003A9C8 != -1)
    swift_once(&qword_10003A9C8, sub_100016B08);
  v6 = type metadata accessor for Logger(0);
  sub_1000073A0(v6, (uint64_t)qword_10003B2D0);
  swift_errorRetain(a1);
  v7 = swift_errorRetain(a1);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (__SecCertificate **)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    swift_errorRetain(a1);
    v12 = (__SecCertificate *)_swift_stdlib_bridgeErrorToNSError(a1);
    certificateRef = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&certificateRef, &v72);
    *v11 = v12;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "RefreshCertificate error in generateCertificate: %@", v10, 0xCu);
    v13 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v11, 1, v13);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  v36 = sub_1000073B8();
  v37 = swift_allocError(&_s5ErrorON, v36, 0, 0);
  *(_QWORD *)v38 = 6;
  *(_OWORD *)(v38 + 8) = 0u;
  *(_OWORD *)(v38 + 24) = 0u;
  *(_BYTE *)(v38 + 40) = 5;
  a2(0, v37);
  swift_errorRelease(v37);
}

void sub_10000EF74(uint64_t a1, void *a2)
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

id sub_10000F080()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CertificateManager(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000F140()
{
  return type metadata accessor for CertificateManager(0);
}

uint64_t type metadata accessor for CertificateManager(uint64_t a1)
{
  uint64_t result;

  result = qword_10003AC68;
  if (!qword_10003AC68)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CertificateManager);
  return result;
}

void sub_10000F184(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[6];

  sub_10000F200(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = v4[0];
    v4[2] = v4[0];
    v4[3] = "\b";
    v4[4] = "\b";
    v4[5] = "\b";
    swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
  }
}

void sub_10000F200(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10003AC78)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10003AC78);
  }
}

uint64_t sub_10000F254(uint64_t (*a1)(void))
{
  uint64_t result;

  result = a1();
  if (result)
    return _swift_stdlib_bridgeErrorToNSError();
  return result;
}

char *sub_10000F27C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

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
      v10 = sub_1000073FC(&qword_10003ACB8);
      v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * v12 - 64;
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[v8 + 32])
          memmove(v13, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10000F480(0, v8, v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10000F374(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_1000073FC(&qword_10003ACA8);
      v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
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
        if (v11 != a4 || v14 >= &a4[8 * v8 + 32])
          memmove(v14, a4 + 32, 8 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000F564(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10000F480(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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

uint64_t sub_10000F564(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v6 = a4 + 8 * a1 + 32;
    v7 = a3 + 8 * v4;
    if (v6 >= v7 || v6 + 8 * v4 <= a3)
    {
      v8 = sub_1000073FC(&qword_10003AC88);
      swift_arrayInitWithCopy(a3, v6, v4, v8);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

void sub_10000F66C(void *a1, char *a2, void (**a3)(_QWORD, _QWORD))
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  Swift::String v23;
  char v24;
  id *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  SecKeyRef v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  _QWORD *v38;
  id v39;
  uint64_t v40;
  _QWORD *v41;
  char *v42;
  __SecKey *v43;
  id v44;
  void *v45;
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
  unint64_t v56;
  unint64_t v57;
  id v58;
  void *v59;
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
  unint64_t v70;
  unint64_t v71;
  id v72;
  void *v73;
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
  unint64_t v84;
  unint64_t v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  id v100;
  void *v101;
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
  unint64_t v112;
  unint64_t v113;
  id v114;
  char *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  Swift::String v120;
  Swift::Int v121;
  char v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void (**v127)(char *, uint64_t, uint64_t);
  unint64_t v128;
  id v129;
  NSObject *v130;
  os_log_type_t v131;
  __SecKey *v132;
  uint8_t *v133;
  uint64_t v134;
  id v135;
  void *v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  void *v140;
  char *v141;
  uint64_t v142;
  NSArray v143;
  id v144;
  uint64_t v145;
  NSDictionary v146;
  int v147;
  char v148;
  void (**v149)(char *, uint64_t, uint64_t);
  uint64_t v150;
  id v151;
  void *v152;
  id v153;
  unint64_t v154;
  void (**v155)(char *, uint64_t, uint64_t);
  NSObject *v156;
  os_log_type_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  unint64_t v164;
  id v165;
  void (**v166)(char *, uint64_t, uint64_t);
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  unint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  _QWORD *v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  __SecKey *v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  NSObject *v188;
  os_log_type_t v189;
  uint64_t v190;
  uint8_t *v191;
  char **v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  unint64_t v196;
  char *v197;
  char **v198;
  uint8_t *v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  NSURL *v205;
  void *v206;
  void *v207;
  NSString v208;
  id v209;
  id v210;
  char **v211;
  uint64_t v212;
  char **v213;
  uint64_t v214;
  char *v215;
  void *v216;
  NSString v217;
  id v218;
  char **v219;
  void *v220;
  char **v221;
  id v222;
  char **v223;
  uint64_t v224;
  unint64_t v225;
  unint64_t v226;
  void *v227;
  uint64_t v228;
  NSString v229;
  uint64_t v230;
  uint64_t inited;
  id v232;
  unint64_t v233;
  Class isa;
  unsigned __int8 v235;
  char **v236;
  unint64_t v237;
  char **v238;
  unint64_t v239;
  void *v240;
  uint64_t v241;
  NSString v242;
  id v243;
  char **v244;
  char **v245;
  unsigned __int8 v246;
  char **v247;
  char **v249;
  unint64_t v250;
  uint64_t v251;
  char **v252;
  _QWORD *v253;
  uint64_t v254;
  char **v255;
  char **v256;
  uint64_t v257;
  unint64_t v258;
  char **v259;
  char **v260;
  uint64_t v261;
  NSObject *v262;
  os_log_type_t v263;
  _BOOL4 v264;
  __SecKey *v265;
  uint8_t *v266;
  char ***v267;
  char **v268;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  NSObject *v272;
  os_log_type_t v273;
  uint8_t *v274;
  __SecKey *v275;
  uint64_t v276;
  uint64_t v277;
  char *v278;
  id v279;
  __SecKey *v280;
  uint64_t v281;
  char *v282;
  uint64_t v283;
  uint64_t v284;
  char *v285;
  char *v286;
  uint64_t v287;
  id v288;
  void (**v289)(_QWORD, _QWORD);
  void (**v290)(char *, uint64_t, uint64_t);
  uint64_t v291;
  uint64_t v292;
  char *v293;
  id v294;
  uint64_t v295;
  uint64_t v296;
  unsigned __int8 v297;
  char *v298;
  uint64_t v299;
  _BYTE v300[16];
  char v301[56];
  char **v302;
  uint64_t v303;
  char v304[8];

  v289 = a3;
  v5 = sub_1000073FC(&qword_10003AC80);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v276 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v281 = (uint64_t)&v276 - v9;
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v282 = (char *)&v276 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v286 = (char *)&v276 - v14;
  v15 = type metadata accessor for Logger(0);
  v290 = *(void (***)(char *, uint64_t, uint64_t))(v15 - 8);
  v16 = __chkstk_darwin(v15);
  v285 = (char *)&v276 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v287 = (uint64_t)&v276 - v18;
  v294 = a1;
  v19 = objc_msgSend(a1, "keyType");
  v278 = v8;
  if (v19)
  {
    v20 = v19;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v22 = v21;

    v23 = String.lowercased()();
    if (v23._object)
    {
      if (v23._countAndFlagsBits == 25445 && v23._object == (void *)0xE200000000000000)
      {
        swift_bridgeObjectRelease(0xE200000000000000);
LABEL_8:
        v25 = (id *)&kSecAttrKeyTypeECSECPrimeRandom;
        goto LABEL_10;
      }
      v24 = _stringCompareWithSmolCheck(_:_:expecting:)(25445, 0xE200000000000000, v23._countAndFlagsBits, v23._object, 0);
      swift_bridgeObjectRelease(v23._object);
      if ((v24 & 1) != 0)
        goto LABEL_8;
    }
  }
  else
  {
    v22 = 0;
  }
  v25 = (id *)&kSecAttrKeyTypeRSA;
LABEL_10:
  v283 = v11;
  v26 = *v25;
  swift_bridgeObjectRelease(v22);
  type metadata accessor for CFString(0);
  v28 = v27;
  v29 = sub_100009054((unint64_t *)&qword_10003AAE0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C148);
  if ((static _CFObject.== infix(_:_:)(v26, kSecAttrKeyTypeRSA, v28, v29) & 1) != 0)
    v30 = 2048;
  else
    v30 = 256;
  v31 = sub_1000295D8(v26, v30);
  if (qword_10003A9C8 != -1)
    swift_once(&qword_10003A9C8, sub_100016B08);
  v291 = v15;
  v32 = sub_1000073A0(v15, (uint64_t)qword_10003B2D0);
  v33 = v26;
  v292 = v32;
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.debug.getter();
  v36 = os_log_type_enabled(v34, v35);
  v284 = v10;
  v293 = a2;
  v288 = v33;
  if (v36)
  {
    v37 = swift_slowAlloc(22, -1);
    v38 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v37 = 138412546;
    v303 = (uint64_t)v33;
    v280 = v31;
    v39 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v303, v304);
    *v38 = v33;

    *(_WORD *)(v37 + 12) = 2048;
    v303 = v30;
    v31 = v280;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v303, v304);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Generated %@ key of size/curve: %ld", (uint8_t *)v37, 0x16u);
    v40 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v38, 1, v40);
    v41 = v38;
    a2 = v293;
    swift_slowDealloc(v41, -1, -1);
    swift_slowDealloc(v37, -1, -1);

    if (v31)
      goto LABEL_17;
LABEL_50:
    v123 = sub_1000073B8();
    v124 = swift_allocError(&_s5ErrorON, v123, 0, 0);
    *(_OWORD *)v125 = xmmword_10002C240;
    *(_QWORD *)(v125 + 24) = 0;
    *(_QWORD *)(v125 + 32) = 0;
    *(_QWORD *)(v125 + 16) = 0;
    *(_BYTE *)(v125 + 40) = 0;
    v126 = (void *)_convertErrorToNSError(_:)(v124);
    ((void (**)(_QWORD, void *))v289)[2](v289, v126);

    swift_errorRelease(v124);
    return;
  }

  if (!v31)
    goto LABEL_50;
LABEL_17:
  v42 = (char *)&_swiftEmptyArrayStorage;
  v298 = (char *)&_swiftEmptyArrayStorage;
  v43 = v31;
  v44 = objc_msgSend(v294, "commonName");
  if (v44)
  {
    v45 = v44;
    v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
    v48 = v47;

    v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidCommonName);
    v51 = v50;
    v52 = sub_1000073FC(&qword_10003ACA0);
    v53 = swift_allocObject(v52, 40, 7);
    *(_OWORD *)(v53 + 16) = xmmword_10002BFF0;
    v54 = sub_1000073FC(&qword_10003AA98);
    v55 = swift_allocObject(v54, 64, 7);
    *(_OWORD *)(v55 + 16) = xmmword_10002C230;
    *(_QWORD *)(v55 + 32) = v49;
    *(_QWORD *)(v55 + 40) = v51;
    *(_QWORD *)(v55 + 48) = v46;
    *(_QWORD *)(v55 + 56) = v48;
    *(_QWORD *)(v53 + 32) = v55;
    v42 = sub_10000F374(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    v57 = *((_QWORD *)v42 + 2);
    v56 = *((_QWORD *)v42 + 3);
    if (v57 >= v56 >> 1)
      v42 = sub_10000F374((char *)(v56 > 1), v57 + 1, 1, v42);
    *((_QWORD *)v42 + 2) = v57 + 1;
    *(_QWORD *)&v42[8 * v57 + 32] = v53;
    v298 = v42;
  }
  v58 = objc_msgSend(v294, "country");
  if (v58)
  {
    v59 = v58;
    v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
    v62 = v61;

    v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidCountryName);
    v65 = v64;
    v66 = sub_1000073FC(&qword_10003ACA0);
    v67 = swift_allocObject(v66, 40, 7);
    *(_OWORD *)(v67 + 16) = xmmword_10002BFF0;
    v68 = sub_1000073FC(&qword_10003AA98);
    v69 = swift_allocObject(v68, 64, 7);
    *(_OWORD *)(v69 + 16) = xmmword_10002C230;
    *(_QWORD *)(v69 + 32) = v63;
    *(_QWORD *)(v69 + 40) = v65;
    *(_QWORD *)(v69 + 48) = v60;
    *(_QWORD *)(v69 + 56) = v62;
    *(_QWORD *)(v67 + 32) = v69;
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_10000F374(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
    v71 = *((_QWORD *)v42 + 2);
    v70 = *((_QWORD *)v42 + 3);
    if (v71 >= v70 >> 1)
      v42 = sub_10000F374((char *)(v70 > 1), v71 + 1, 1, v42);
    *((_QWORD *)v42 + 2) = v71 + 1;
    *(_QWORD *)&v42[8 * v71 + 32] = v67;
    v298 = v42;
  }
  v72 = objc_msgSend(v294, "state");
  if (v72)
  {
    v73 = v72;
    v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
    v76 = v75;

    v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidStateProvinceName);
    v79 = v78;
    v80 = sub_1000073FC(&qword_10003ACA0);
    v81 = swift_allocObject(v80, 40, 7);
    *(_OWORD *)(v81 + 16) = xmmword_10002BFF0;
    v82 = sub_1000073FC(&qword_10003AA98);
    v83 = swift_allocObject(v82, 64, 7);
    *(_OWORD *)(v83 + 16) = xmmword_10002C230;
    *(_QWORD *)(v83 + 32) = v77;
    *(_QWORD *)(v83 + 40) = v79;
    *(_QWORD *)(v83 + 48) = v74;
    *(_QWORD *)(v83 + 56) = v76;
    *(_QWORD *)(v81 + 32) = v83;
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_10000F374(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
    v85 = *((_QWORD *)v42 + 2);
    v84 = *((_QWORD *)v42 + 3);
    if (v85 >= v84 >> 1)
      v42 = sub_10000F374((char *)(v84 > 1), v85 + 1, 1, v42);
    *((_QWORD *)v42 + 2) = v85 + 1;
    *(_QWORD *)&v42[8 * v85 + 32] = v81;
    v298 = v42;
  }
  v86 = objc_msgSend(v294, "organization");
  if (v86)
  {
    v87 = v86;
    v88 = static String._unconditionallyBridgeFromObjectiveC(_:)(v86);
    v90 = v89;

    v91 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidOrganization);
    v93 = v92;
    v94 = sub_1000073FC(&qword_10003ACA0);
    v95 = swift_allocObject(v94, 40, 7);
    *(_OWORD *)(v95 + 16) = xmmword_10002BFF0;
    v96 = sub_1000073FC(&qword_10003AA98);
    v97 = swift_allocObject(v96, 64, 7);
    *(_OWORD *)(v97 + 16) = xmmword_10002C230;
    *(_QWORD *)(v97 + 32) = v91;
    *(_QWORD *)(v97 + 40) = v93;
    *(_QWORD *)(v97 + 48) = v88;
    *(_QWORD *)(v97 + 56) = v90;
    *(_QWORD *)(v95 + 32) = v97;
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_10000F374(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
    v99 = *((_QWORD *)v42 + 2);
    v98 = *((_QWORD *)v42 + 3);
    if (v99 >= v98 >> 1)
      v42 = sub_10000F374((char *)(v98 > 1), v99 + 1, 1, v42);
    *((_QWORD *)v42 + 2) = v99 + 1;
    *(_QWORD *)&v42[8 * v99 + 32] = v95;
    v298 = v42;
  }
  v100 = objc_msgSend(v294, "organizationUnit");
  if (v100)
  {
    v101 = v100;
    v102 = static String._unconditionallyBridgeFromObjectiveC(_:)(v100);
    v104 = v103;

    v105 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidOrganizationalUnit);
    v107 = v106;
    v108 = sub_1000073FC(&qword_10003ACA0);
    v109 = swift_allocObject(v108, 40, 7);
    *(_OWORD *)(v109 + 16) = xmmword_10002BFF0;
    v110 = sub_1000073FC(&qword_10003AA98);
    v111 = swift_allocObject(v110, 64, 7);
    *(_OWORD *)(v111 + 16) = xmmword_10002C230;
    *(_QWORD *)(v111 + 32) = v105;
    *(_QWORD *)(v111 + 40) = v107;
    *(_QWORD *)(v111 + 48) = v102;
    *(_QWORD *)(v111 + 56) = v104;
    *(_QWORD *)(v109 + 32) = v111;
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_10000F374(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
    v113 = *((_QWORD *)v42 + 2);
    v112 = *((_QWORD *)v42 + 3);
    if (v113 >= v112 >> 1)
      v42 = sub_10000F374((char *)(v112 > 1), v113 + 1, 1, v42);
    *((_QWORD *)v42 + 2) = v113 + 1;
    *(_QWORD *)&v42[8 * v113 + 32] = v109;
    v298 = v42;
  }
  v297 = 0;
  v114 = objc_msgSend(v294, "certType");
  v115 = v285;
  if (v114)
  {
    v116 = v114;
    v117 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
    v119 = v118;

    v120._countAndFlagsBits = v117;
    v120._object = v119;
    v121 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100034FF8, v120);
    swift_bridgeObjectRelease(v119);
    if (!v121)
    {
      v122 = 0;
      goto LABEL_56;
    }
    if (v121 == 1)
    {
      v122 = 1;
LABEL_56:
      v297 = v122;
      goto LABEL_57;
    }
  }
  v127 = v290;
  v128 = v291;
  v290[2](v115, v292, v291);
  v129 = v294;
  v130 = Logger.logObject.getter(v129);
  v131 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v130, v131))
  {
    v132 = v43;
    v133 = (uint8_t *)swift_slowAlloc(12, -1);
    v134 = swift_slowAlloc(32, -1);
    v303 = v134;
    *(_DWORD *)v133 = 136315138;
    v135 = objc_msgSend(v129, "certType");
    if (!v135)
    {
LABEL_119:
      _Block_release(v289);

      __break(1u);
      return;
    }
    v136 = v135;
    v137 = static String._unconditionallyBridgeFromObjectiveC(_:)(v135);
    v139 = v138;

    v299 = sub_10002A370(v137, v139, &v303);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v299, v300);

    swift_bridgeObjectRelease(v139);
    _os_log_impl((void *)&_mh_execute_header, v130, v131, "Certificate type is set to default .signing. Couldn't parse from: '%s'", v133, 0xCu);
    swift_arrayDestroy(v134, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v134, -1, -1);
    swift_slowDealloc(v133, -1, -1);

    ((void (*)(char *, uint64_t))v290[1])(v285, v291);
    v43 = v132;
    a2 = v293;
  }
  else
  {

    ((void (*)(char *, unint64_t))v127[1])(v115, v128);
  }
LABEL_57:
  v285 = (char *)OBJC_IVAR___CertificateManager_certificateRequestManager;
  v140 = *(void **)&a2[OBJC_IVAR___CertificateManager_certificateRequestManager];
  v141 = v298;
  swift_unknownObjectRetain(v140);
  swift_bridgeObjectRetain(v141);
  v142 = sub_1000073FC(&qword_10003AC88);
  v143.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v141);
  v144 = objc_msgSend(v294, "csrAltName");
  v145 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v144, &type metadata for String, &type metadata for String, &protocol witness table for String);

  v146.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v145);
  v147 = v297;
  if (v297 == 1)
    v148 = 1;
  else
    v148 = _stringCompareWithSmolCheck(_:_:expecting:)(0x676E696E676973, 0xE700000000000000, 0x74707972636E65, 0xE700000000000000, 0);
  v149 = v290;
  v150 = v287;
  swift_bridgeObjectRelease(0xE700000000000000);
  v151 = objc_msgSend(v140, "generateCertificateRequestStringWith:subjectAltName:privateKey:encrypt:", v143.super.isa, v146.super.isa, v43, v148 & 1);

  swift_unknownObjectRelease(v140);
  v279 = v151;
  if (v151)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v151);
    v153 = v152;
  }
  else
  {
    v153 = 0;
  }
  v280 = v43;
  v154 = v291;
  v149[2]((char *)v150, v292, v291);
  v155 = (void (**)(char *, uint64_t, uint64_t))v294;
  v156 = Logger.logObject.getter(v155);
  v157 = static os_log_type_t.debug.getter();
  v129 = (id)v157;
  if (os_log_type_enabled(v156, v157))
  {
    v158 = swift_slowAlloc(32, -1);
    v277 = swift_slowAlloc(96, -1);
    v303 = v277;
    *(_DWORD *)v158 = 136315650;
    if (v147)
      v159 = 0x74707972636E65;
    else
      v159 = 0x676E696E676973;
    v299 = sub_10002A370(v159, 0xE700000000000000, &v303);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v299, v300);
    swift_bridgeObjectRelease(0xE700000000000000);
    *(_WORD *)(v158 + 12) = 2080;
    swift_beginAccess(&v298, &v299, 0, 0);
    v160 = v298;
    v161 = swift_bridgeObjectRetain(v298);
    v162 = Array.description.getter(v161, v142);
    v294 = v153;
    v164 = v163;
    swift_bridgeObjectRelease(v160);
    v302 = (char **)sub_10002A370(v162, v164, &v303);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v302, &v303);
    swift_bridgeObjectRelease(v164);
    *(_WORD *)(v158 + 22) = 2080;
    v165 = objc_msgSend(v155, "csrAltName");
    v166 = v155;
    v167 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v165, &type metadata for String, &type metadata for String, &protocol witness table for String);

    v153 = v294;
    v168 = Dictionary.description.getter(v167, &type metadata for String, &type metadata for String, &protocol witness table for String);
    v170 = v169;
    v171 = v167;
    v155 = v166;
    swift_bridgeObjectRelease(v171);
    v302 = (char **)sub_10002A370(v168, v170, &v303);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v302, &v303);

    swift_bridgeObjectRelease(v170);
    _os_log_impl((void *)&_mh_execute_header, v156, (os_log_type_t)v129, "Generated %s CSR with subject: %s, subject alt name: %s", (uint8_t *)v158, 0x20u);
    v172 = v277;
    swift_arrayDestroy(v277, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v172, -1, -1);
    swift_slowDealloc(v158, -1, -1);

    ((void (*)(uint64_t, uint64_t))v290[1])(v287, v291);
  }
  else
  {

    ((void (*)(uint64_t, unint64_t))v149[1])(v150, v154);
  }
  v173 = v284;
  v174 = v286;
  v175 = v283;
  v176 = v282;
  if (!v153)
  {

    v180 = sub_1000073B8();
    v181 = swift_allocError(&_s5ErrorON, v180, 0, 0);
    *(_QWORD *)v182 = 2;
    *(_OWORD *)(v182 + 8) = 0u;
    *(_OWORD *)(v182 + 24) = 0u;
    *(_BYTE *)(v182 + 40) = 5;
    v183 = (void *)_convertErrorToNSError(_:)(v181);
    ((void (**)(_QWORD, void *))v289)[2](v289, v183);
    v184 = v280;

LABEL_111:
    swift_errorRelease(v181);
    goto LABEL_112;
  }
  swift_bridgeObjectRelease(v153);
  swift_beginAccess(&v297, &v303, 0, 0);
  if ((v297 & 1) != 0)
  {
    v177 = (uint64_t)v278;
    sub_1000148C0((uint64_t)&v293[OBJC_IVAR___CertificateManager_encryptEndpoint], (uint64_t)v278);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v175 + 48))(v177, 1, v173) != 1)
    {
      v178 = &MCCSecretAgentEncryptionCertIdKey;
      v179 = v177;
      goto LABEL_76;
    }
    _Block_release(v289);

    __break(1u);
    goto LABEL_118;
  }
  v185 = v281;
  sub_1000148C0((uint64_t)&v293[OBJC_IVAR___CertificateManager_signingEndpoint], v281);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v175 + 48))(v185, 1, v173) == 1)
  {
LABEL_118:
    _Block_release(v289);

    __break(1u);
    goto LABEL_119;
  }
  v178 = &MCCSecretAgentSigningCertIdKey;
  v179 = v281;
LABEL_76:
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v175 + 32))(v174, v179, v173);
  v291 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v178);
  v294 = v186;
  v187 = (*(uint64_t (**)(char *, _QWORD *, uint64_t))(v175 + 16))(v176, v174, v173);
  v188 = Logger.logObject.getter(v187);
  v189 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v188, v189))
  {
    v190 = swift_slowAlloc(12, -1);
    v290 = v155;
    v191 = (uint8_t *)v190;
    v192 = (char **)swift_slowAlloc(32, -1);
    v302 = v192;
    *(_DWORD *)v191 = 136315138;
    v193 = sub_100009054(&qword_10003AC98, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v194 = dispatch thunk of CustomStringConvertible.description.getter(v173, v193);
    v196 = v195;
    v295 = sub_10002A370(v194, v195, (uint64_t *)&v302);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v295, &v296);
    swift_bridgeObjectRelease(v196);
    v197 = *(char **)(v175 + 8);
    ((void (*)(char *, uint64_t))v197)(v176, v173);
    _os_log_impl((void *)&_mh_execute_header, v188, v189, "Requesting certificate from: %s", v191, 0xCu);
    swift_arrayDestroy(v192, 1, (char *)&type metadata for Any + 8);
    v198 = v192;
    v174 = v286;
    swift_slowDealloc(v198, -1, -1);
    v199 = v191;
    v155 = v290;
    swift_slowDealloc(v199, -1, -1);
  }
  else
  {
    v197 = *(char **)(v175 + 8);
    ((void (*)(char *, uint64_t))v197)(v176, v173);
  }

  v200 = objc_msgSend(v155, "commonName");
  if (v200)
  {
    v201 = v200;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v200);
    v203 = v202;

  }
  else
  {
    v203 = (void *)0xE000000000000000;
  }
  v204 = *(void **)&v285[(_QWORD)v293];
  swift_unknownObjectRetain(v204);
  URL._bridgeToObjectiveC()(v205);
  v207 = v206;
  v208 = String._bridgeToObjectiveC()();
  v302 = 0;
  v209 = v279;
  v210 = objc_msgSend(v204, "resultFromServerFor:endpoint:email:error:", v279, v207, v208, &v302);
  swift_unknownObjectRelease(v204);

  v211 = v302;
  if (!v210)
  {
LABEL_95:
    v249 = v211;
    swift_bridgeObjectRelease(v203);
    swift_bridgeObjectRelease(v294);
    v181 = _convertNSErrorToError(_:)(v211);

LABEL_97:
    swift_willThrow();
    ((void (*)(_QWORD *, uint64_t))v197)(v174, v173);
LABEL_107:
    swift_errorRetain(v181);
    v261 = swift_errorRetain(v181);
    v262 = Logger.logObject.getter(v261);
    v263 = static os_log_type_t.error.getter();
    v264 = os_log_type_enabled(v262, v263);
    v265 = v280;
    if (v264)
    {
      v266 = (uint8_t *)swift_slowAlloc(12, -1);
      v267 = (char ***)swift_slowAlloc(8, -1);
      *(_DWORD *)v266 = 138412290;
      swift_errorRetain(v181);
      v268 = (char **)_swift_stdlib_bridgeErrorToNSError(v181);
      v302 = v268;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v302, &v303);
      *v267 = v268;
      swift_errorRelease(v181);
      swift_errorRelease(v181);
      _os_log_impl((void *)&_mh_execute_header, v262, v263, "Certificate request failed with error %@", v266, 0xCu);
      v269 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v267, 1, v269);
      swift_slowDealloc(v267, -1, -1);
      swift_slowDealloc(v266, -1, -1);
    }
    else
    {
      swift_errorRelease(v181);
      swift_errorRelease(v181);
    }

    swift_errorRetain(v181);
    v270 = (void *)_convertErrorToNSError(_:)(v181);
    ((void (**)(_QWORD, void *))v289)[2](v289, v270);

    swift_errorRelease(v181);
    goto LABEL_111;
  }
  v212 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v210, &type metadata for String);
  v213 = v211;

  if (!*(_QWORD *)(v212 + 16))
  {
    swift_bridgeObjectRelease(v212);
    swift_bridgeObjectRelease(v203);
    swift_bridgeObjectRelease(v294);
    v250 = sub_1000073B8();
    v181 = swift_allocError(&_s5ErrorON, v250, 0, 0);
    *(_QWORD *)v251 = 9;
    *(_OWORD *)(v251 + 8) = 0u;
    *(_OWORD *)(v251 + 24) = 0u;
    *(_BYTE *)(v251 + 40) = 5;
    goto LABEL_97;
  }
  v290 = (void (**)(char *, uint64_t, uint64_t))v197;
  v214 = *(_QWORD *)(v212 + 40);
  v215 = v293;
  v216 = *(void **)&v285[(_QWORD)v293];
  swift_bridgeObjectRetain(v214);
  swift_unknownObjectRetain(v216);
  v217 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v214);
  v302 = 0;
  v218 = objc_msgSend(v216, "certificateFor:error:", v217, &v302);
  swift_unknownObjectRelease(v216);

  v219 = v302;
  if (!v218)
  {
    v252 = v302;
    swift_bridgeObjectRelease(v212);
    swift_bridgeObjectRelease(v203);
    swift_bridgeObjectRelease(v294);
    v181 = _convertNSErrorToError(_:)(v219);

    swift_willThrow();
    v253 = v174;
    v254 = v173;
LABEL_106:
    ((void (*)(_QWORD *, uint64_t))v290)(v253, v254);
    goto LABEL_107;
  }
  v173 = OBJC_IVAR___CertificateManager_keychainManager;
  v220 = *(void **)&v215[OBJC_IVAR___CertificateManager_keychainManager];
  v302 = 0;
  v221 = v219;
  v222 = objc_msgSend(v220, "saveIdentityToKeychain:privateKey:error:", v218, v280, &v302);
  v223 = v302;
  if (!v222)
  {
    v255 = v223;
    swift_bridgeObjectRelease(v212);
    swift_bridgeObjectRelease(v203);
    swift_bridgeObjectRelease(v294);
    v181 = _convertNSErrorToError(_:)(v255);

    swift_willThrow();
LABEL_105:
    v253 = v286;
    v254 = v284;
    goto LABEL_106;
  }
  v224 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v222);
  v226 = v225;

  v227 = *(void **)&v215[OBJC_IVAR___CertificateManager_cloudKVSManager];
  v228 = v224;
  swift_unknownObjectRetain(v227);
  v229 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v203);
  v230 = sub_1000073FC(&qword_10003AC90);
  inited = swift_initStackObject(v230, v301);
  *(_OWORD *)(inited + 16) = xmmword_10002BFF0;
  v232 = v294;
  *(_QWORD *)(inited + 32) = v291;
  *(_QWORD *)(inited + 40) = v232;
  *(_QWORD *)(inited + 48) = v224;
  *(_QWORD *)(inited + 56) = v226;
  sub_100008F50(v224, v226);
  v233 = sub_100024BE8(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v233);
  v302 = 0;
  v235 = objc_msgSend(v227, "updateCertificateSettingsWithEmailAddress:identityPersistentRefs:error:", v229, isa, &v302);
  swift_unknownObjectRelease(v227);

  v236 = v302;
  if ((v235 & 1) == 0)
  {
    v256 = v302;
    swift_bridgeObjectRelease(v212);
    v181 = _convertNSErrorToError(_:)(v236);

    swift_willThrow();
    v257 = v228;
    v258 = v226;
LABEL_104:
    sub_100008F94(v257, v258);
    goto LABEL_105;
  }
  v287 = v228;
  v291 = v226;
  v294 = v218;
  v237 = *(_QWORD *)(v212 + 16);
  if (v237 < 2)
    __break(1u);
  v238 = v302;
  v174 = (_QWORD *)(v212 + 56);
  v239 = 2;
  v211 = &off_100039000;
  v197 = v293;
  while (1)
  {
    v240 = *(void **)&v285[(_QWORD)v197];
    v241 = *v174;
    swift_unknownObjectRetain(v240);
    swift_bridgeObjectRetain(v241);
    v242 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v241);
    v302 = 0;
    v243 = objc_msgSend(v240, "certificateFor:error:", v242, &v302);
    swift_unknownObjectRelease(v240);

    v244 = v302;
    if (!v243)
    {
      v259 = v302;
      swift_bridgeObjectRelease(v212);
      v181 = _convertNSErrorToError(_:)(v244);

      swift_willThrow();
LABEL_103:
      v257 = v287;
      v258 = v291;
      goto LABEL_104;
    }
    v203 = *(void **)&v197[v173];
    v302 = 0;
    v245 = v244;
    v246 = objc_msgSend(v203, "saveCertificateToKeychain:error:", v243, &v302);
    v247 = v302;
    if ((v246 & 1) == 0)
    {
      v260 = v247;
      swift_bridgeObjectRelease(v212);
      v181 = _convertNSErrorToError(_:)(v260);

      swift_willThrow();
      goto LABEL_103;
    }

    if (v237 == v239)
      break;
    v174 += 2;
    if (v239++ >= *(_QWORD *)(v212 + 16))
    {
      __break(1u);
      goto LABEL_95;
    }
  }
  v271 = swift_bridgeObjectRelease(v212);
  v272 = Logger.logObject.getter(v271);
  v273 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v272, v273))
  {
    v274 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v274 = 0;
    _os_log_impl((void *)&_mh_execute_header, v272, v273, "Saved to iCloud keychain", v274, 2u);
    swift_slowDealloc(v274, -1, -1);
  }

  v289[2](v289, 0);
  v275 = v280;

  sub_100008F94(v287, v291);
  ((void (*)(char *, uint64_t))v290)(v286, v284);
LABEL_112:
  swift_bridgeObjectRelease(v298);
}

void sub_10001124C(void *a1, void *a2, void (*a3)(_QWORD *, uint64_t), void *a4, void *a5, void *a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  id *v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  SecKeyRef v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  uint64_t v45;
  char *v46;
  __SecKey *v47;
  id v48;
  void *v49;
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
  unint64_t v60;
  unint64_t v61;
  id v62;
  void *v63;
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
  unint64_t v74;
  unint64_t v75;
  id v76;
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
  unint64_t v88;
  unint64_t v89;
  id v90;
  void *v91;
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
  unint64_t v102;
  unint64_t v103;
  id v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  id v118;
  char *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  Swift::String v124;
  Swift::Int v125;
  char v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  id v132;
  NSObject *v133;
  os_log_type_t v134;
  uint8_t *v135;
  uint64_t v136;
  id v137;
  void *v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  void *v142;
  char *v143;
  uint64_t v144;
  NSArray v145;
  id v146;
  uint64_t v147;
  NSDictionary v148;
  int v149;
  char v150;
  uint64_t v151;
  __SecKey *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  id v156;
  NSObject *v157;
  os_log_type_t v158;
  _BOOL4 v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  unint64_t v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  uint64_t v179;
  _QWORD *v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char *v185;
  unint64_t v186;
  uint64_t v187;
  NSObject *v188;
  os_log_type_t v189;
  uint8_t *v190;
  uint64_t *v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  unint64_t v195;
  uint64_t *v196;
  uint8_t *v197;
  id v198;
  void *v199;
  uint64_t *v200;
  uint64_t *v201;
  void *v202;
  unint64_t v203;
  void *v204;
  void *v205;
  NSString v206;
  __SecKey *v207;
  id v208;
  uint64_t *v209;
  uint64_t v210;
  uint64_t *v211;
  uint64_t v212;
  char *v213;
  void *v214;
  NSString v215;
  id v216;
  uint64_t *v217;
  __SecKey *v218;
  void *v219;
  uint64_t *v220;
  id v221;
  uint64_t *v222;
  uint64_t v223;
  unint64_t v224;
  unint64_t v225;
  void *v226;
  uint64_t v227;
  NSString v228;
  uint64_t v229;
  uint64_t inited;
  unint64_t v231;
  unint64_t v232;
  Class isa;
  uint64_t *v234;
  uint64_t *v235;
  unint64_t v236;
  void *v237;
  uint64_t v238;
  NSString v239;
  id v240;
  void *v241;
  uint64_t *v242;
  uint64_t *v243;
  uint64_t *v245;
  uint64_t v246;
  unint64_t v247;
  unint64_t v248;
  uint64_t v249;
  uint64_t *v250;
  uint64_t *v251;
  uint64_t *v252;
  uint64_t v253;
  NSObject *v254;
  os_log_type_t v255;
  uint8_t *v256;
  uint64_t **v257;
  uint64_t *v258;
  uint64_t v259;
  uint64_t *v260;
  uint64_t *v261;
  uint64_t v262;
  NSObject *v263;
  os_log_type_t v264;
  uint8_t *v265;
  __SecKey *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  uint64_t v271;
  uint64_t v272;
  __SecKey *v273;
  __SecKey *v274;
  char *v275;
  uint64_t v276;
  char *v277;
  id v278;
  void (*v279)(_QWORD *, uint64_t);
  id v280;
  id v281;
  char *v282;
  char *v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  uint64_t v287;
  unint64_t v288;
  id v289;
  uint64_t v290;
  uint64_t v291;
  unsigned __int8 v292;
  char *v293;
  uint64_t v294;
  _BYTE v295[16];
  char v296[24];
  uint64_t *v297;
  uint64_t v298;
  char v299[8];
  NSURL v300;

  v280 = a6;
  v281 = a5;
  v279 = a3;
  v9 = sub_1000073FC(&qword_10003AC80);
  v10 = __chkstk_darwin(v9);
  v271 = (uint64_t)&v267 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v272 = (uint64_t)&v267 - v12;
  v13 = type metadata accessor for URL(0);
  v276 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v267 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v267 - v17;
  v19 = type metadata accessor for Logger(0);
  v285 = *(_QWORD *)(v19 - 8);
  v20 = __chkstk_darwin(v19);
  v277 = (char *)&v267 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v23 = (char *)&v267 - v22;
  v289 = a1;
  v24 = objc_msgSend(a1, "keyType");
  v288 = v19;
  v275 = v16;
  if (v24)
  {
    v25 = v24;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v27 = v26;

    v28 = String.lowercased()();
    if (v28._object)
    {
      if (v28._countAndFlagsBits == 25445 && v28._object == (void *)0xE200000000000000)
      {
        swift_bridgeObjectRelease(0xE200000000000000);
        v29 = (id *)&kSecAttrKeyTypeECSECPrimeRandom;
        goto LABEL_11;
      }
      v30 = _stringCompareWithSmolCheck(_:_:expecting:)(25445, 0xE200000000000000, v28._countAndFlagsBits, v28._object, 0);
      swift_bridgeObjectRelease(v28._object);
      if ((v30 & 1) != 0)
      {
        v29 = (id *)&kSecAttrKeyTypeECSECPrimeRandom;
        v19 = v288;
        goto LABEL_11;
      }
      v19 = v288;
    }
  }
  else
  {
    v27 = 0;
  }
  v29 = (id *)&kSecAttrKeyTypeRSA;
LABEL_11:
  v283 = v23;
  v31 = *v29;
  swift_bridgeObjectRelease(v27);
  type metadata accessor for CFString(0);
  v33 = v32;
  v34 = sub_100009054((unint64_t *)&qword_10003AAE0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C148);
  if ((static _CFObject.== infix(_:_:)(v31, kSecAttrKeyTypeRSA, v33, v34) & 1) != 0)
    v35 = 2048;
  else
    v35 = 256;
  v274 = (__SecKey *)v35;
  v36 = sub_1000295D8(v31, v35);
  if (qword_10003A9C8 != -1)
    swift_once(&qword_10003A9C8, sub_100016B08);
  v37 = sub_1000073A0(v19, (uint64_t)qword_10003B2D0);
  v38 = v31;
  v287 = v37;
  v39 = Logger.logObject.getter(v38);
  v40 = static os_log_type_t.debug.getter();
  v41 = os_log_type_enabled(v39, v40);
  v284 = v13;
  v282 = v18;
  v286 = a2;
  v278 = v38;
  if (v41)
  {
    v42 = swift_slowAlloc(22, -1);
    v43 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v42 = 138412546;
    v298 = (uint64_t)v38;
    v273 = v36;
    v44 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, v299);
    *v43 = v38;

    *(_WORD *)(v42 + 12) = 2048;
    v298 = (uint64_t)v274;
    v36 = v273;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v298, v299);
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Generated %@ key of size/curve: %ld", (uint8_t *)v42, 0x16u);
    v45 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v43, 1, v45);
    swift_slowDealloc(v43, -1, -1);
    swift_slowDealloc(v42, -1, -1);

    if (v36)
      goto LABEL_18;
LABEL_51:
    v127 = sub_1000073B8();
    v128 = swift_allocError(&_s5ErrorON, v127, 0, 0);
    *(_OWORD *)v129 = xmmword_10002C240;
    *(_QWORD *)(v129 + 24) = 0;
    *(_QWORD *)(v129 + 32) = 0;
    *(_QWORD *)(v129 + 16) = 0;
    *(_BYTE *)(v129 + 40) = 0;
    sub_10000E800(v128, v279, (int)a4, v281);
    swift_errorRelease(v128);

    return;
  }

  if (!v36)
    goto LABEL_51;
LABEL_18:
  v46 = (char *)_swiftEmptyArrayStorage;
  v293 = (char *)_swiftEmptyArrayStorage;
  v47 = v36;
  v48 = objc_msgSend(v289, "commonName");
  if (v48)
  {
    v49 = v48;
    v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
    v52 = v51;

    v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidCommonName);
    v55 = v54;
    v56 = sub_1000073FC(&qword_10003ACA0);
    v57 = swift_allocObject(v56, 40, 7);
    *(_OWORD *)(v57 + 16) = xmmword_10002BFF0;
    v58 = sub_1000073FC(&qword_10003AA98);
    v59 = swift_allocObject(v58, 64, 7);
    *(_OWORD *)(v59 + 16) = xmmword_10002C230;
    *(_QWORD *)(v59 + 32) = v53;
    *(_QWORD *)(v59 + 40) = v55;
    *(_QWORD *)(v59 + 48) = v50;
    *(_QWORD *)(v59 + 56) = v52;
    *(_QWORD *)(v57 + 32) = v59;
    v46 = sub_10000F374(0, 1, 1, (char *)_swiftEmptyArrayStorage);
    v61 = *((_QWORD *)v46 + 2);
    v60 = *((_QWORD *)v46 + 3);
    if (v61 >= v60 >> 1)
      v46 = sub_10000F374((char *)(v60 > 1), v61 + 1, 1, v46);
    *((_QWORD *)v46 + 2) = v61 + 1;
    *(_QWORD *)&v46[8 * v61 + 32] = v57;
    v293 = v46;
  }
  v62 = objc_msgSend(v289, "country");
  if (v62)
  {
    v63 = v62;
    v64 = static String._unconditionallyBridgeFromObjectiveC(_:)(v62);
    v66 = v65;

    v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidCountryName);
    v69 = v68;
    v70 = sub_1000073FC(&qword_10003ACA0);
    v71 = swift_allocObject(v70, 40, 7);
    *(_OWORD *)(v71 + 16) = xmmword_10002BFF0;
    v72 = sub_1000073FC(&qword_10003AA98);
    v73 = swift_allocObject(v72, 64, 7);
    *(_OWORD *)(v73 + 16) = xmmword_10002C230;
    *(_QWORD *)(v73 + 32) = v67;
    *(_QWORD *)(v73 + 40) = v69;
    *(_QWORD *)(v73 + 48) = v64;
    *(_QWORD *)(v73 + 56) = v66;
    *(_QWORD *)(v71 + 32) = v73;
    if ((swift_isUniquelyReferenced_nonNull_native(v46) & 1) == 0)
      v46 = sub_10000F374(0, *((_QWORD *)v46 + 2) + 1, 1, v46);
    v75 = *((_QWORD *)v46 + 2);
    v74 = *((_QWORD *)v46 + 3);
    if (v75 >= v74 >> 1)
      v46 = sub_10000F374((char *)(v74 > 1), v75 + 1, 1, v46);
    *((_QWORD *)v46 + 2) = v75 + 1;
    *(_QWORD *)&v46[8 * v75 + 32] = v71;
    v293 = v46;
  }
  v76 = objc_msgSend(v289, "state");
  if (v76)
  {
    v77 = v76;
    v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(v76);
    v80 = v79;

    v81 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidStateProvinceName);
    v83 = v82;
    v84 = sub_1000073FC(&qword_10003ACA0);
    v85 = swift_allocObject(v84, 40, 7);
    *(_OWORD *)(v85 + 16) = xmmword_10002BFF0;
    v86 = sub_1000073FC(&qword_10003AA98);
    v87 = swift_allocObject(v86, 64, 7);
    *(_OWORD *)(v87 + 16) = xmmword_10002C230;
    *(_QWORD *)(v87 + 32) = v81;
    *(_QWORD *)(v87 + 40) = v83;
    *(_QWORD *)(v87 + 48) = v78;
    *(_QWORD *)(v87 + 56) = v80;
    *(_QWORD *)(v85 + 32) = v87;
    if ((swift_isUniquelyReferenced_nonNull_native(v46) & 1) == 0)
      v46 = sub_10000F374(0, *((_QWORD *)v46 + 2) + 1, 1, v46);
    v89 = *((_QWORD *)v46 + 2);
    v88 = *((_QWORD *)v46 + 3);
    if (v89 >= v88 >> 1)
      v46 = sub_10000F374((char *)(v88 > 1), v89 + 1, 1, v46);
    *((_QWORD *)v46 + 2) = v89 + 1;
    *(_QWORD *)&v46[8 * v89 + 32] = v85;
    v293 = v46;
  }
  v90 = objc_msgSend(v289, "organization");
  if (v90)
  {
    v91 = v90;
    v92 = static String._unconditionallyBridgeFromObjectiveC(_:)(v90);
    v94 = v93;

    v95 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidOrganization);
    v97 = v96;
    v98 = sub_1000073FC(&qword_10003ACA0);
    v99 = swift_allocObject(v98, 40, 7);
    *(_OWORD *)(v99 + 16) = xmmword_10002BFF0;
    v100 = sub_1000073FC(&qword_10003AA98);
    v101 = swift_allocObject(v100, 64, 7);
    *(_OWORD *)(v101 + 16) = xmmword_10002C230;
    *(_QWORD *)(v101 + 32) = v95;
    *(_QWORD *)(v101 + 40) = v97;
    *(_QWORD *)(v101 + 48) = v92;
    *(_QWORD *)(v101 + 56) = v94;
    *(_QWORD *)(v99 + 32) = v101;
    if ((swift_isUniquelyReferenced_nonNull_native(v46) & 1) == 0)
      v46 = sub_10000F374(0, *((_QWORD *)v46 + 2) + 1, 1, v46);
    v103 = *((_QWORD *)v46 + 2);
    v102 = *((_QWORD *)v46 + 3);
    if (v103 >= v102 >> 1)
      v46 = sub_10000F374((char *)(v102 > 1), v103 + 1, 1, v46);
    *((_QWORD *)v46 + 2) = v103 + 1;
    *(_QWORD *)&v46[8 * v103 + 32] = v99;
    v293 = v46;
  }
  v104 = objc_msgSend(v289, "organizationUnit");
  if (v104)
  {
    v105 = v104;
    v106 = static String._unconditionallyBridgeFromObjectiveC(_:)(v104);
    v108 = v107;

    v109 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSecOidOrganizationalUnit);
    v111 = v110;
    v112 = sub_1000073FC(&qword_10003ACA0);
    v113 = swift_allocObject(v112, 40, 7);
    *(_OWORD *)(v113 + 16) = xmmword_10002BFF0;
    v114 = sub_1000073FC(&qword_10003AA98);
    v115 = swift_allocObject(v114, 64, 7);
    *(_OWORD *)(v115 + 16) = xmmword_10002C230;
    *(_QWORD *)(v115 + 32) = v109;
    *(_QWORD *)(v115 + 40) = v111;
    *(_QWORD *)(v115 + 48) = v106;
    *(_QWORD *)(v115 + 56) = v108;
    *(_QWORD *)(v113 + 32) = v115;
    if ((swift_isUniquelyReferenced_nonNull_native(v46) & 1) == 0)
      v46 = sub_10000F374(0, *((_QWORD *)v46 + 2) + 1, 1, v46);
    v117 = *((_QWORD *)v46 + 2);
    v116 = *((_QWORD *)v46 + 3);
    if (v117 >= v116 >> 1)
      v46 = sub_10000F374((char *)(v116 > 1), v117 + 1, 1, v46);
    *((_QWORD *)v46 + 2) = v117 + 1;
    *(_QWORD *)&v46[8 * v117 + 32] = v113;
    v293 = v46;
  }
  v292 = 0;
  v118 = objc_msgSend(v289, "certType");
  v274 = v47;
  v119 = v277;
  if (v118)
  {
    v120 = v118;
    v121 = static String._unconditionallyBridgeFromObjectiveC(_:)(v118);
    v123 = v122;

    v124._countAndFlagsBits = v121;
    v124._object = v123;
    v125 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100034FF8, v124);
    swift_bridgeObjectRelease(v123);
    if (!v125)
    {
      v126 = 0;
      goto LABEL_57;
    }
    if (v125 == 1)
    {
      v126 = 1;
LABEL_57:
      v292 = v126;
      goto LABEL_58;
    }
  }
  v130 = v285;
  v131 = v288;
  (*(void (**)(char *, uint64_t, unint64_t))(v285 + 16))(v119, v287, v288);
  v132 = v289;
  v133 = Logger.logObject.getter(v132);
  v134 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v133, v134))
  {
    v135 = (uint8_t *)swift_slowAlloc(12, -1);
    v136 = swift_slowAlloc(32, -1);
    v298 = v136;
    *(_DWORD *)v135 = 136315138;
    v137 = objc_msgSend(v132, "certType");
    if (!v137)
    {
LABEL_119:

      swift_release(a4);
      __break(1u);
      return;
    }
    v138 = v137;
    v139 = static String._unconditionallyBridgeFromObjectiveC(_:)(v137);
    v141 = v140;

    v294 = sub_10002A370(v139, v141, &v298);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v294, v295);

    swift_bridgeObjectRelease(v141);
    _os_log_impl((void *)&_mh_execute_header, v133, v134, "Certificate type is set to default .signing. Couldn't parse from: '%s'", v135, 0xCu);
    swift_arrayDestroy(v136, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v136, -1, -1);
    swift_slowDealloc(v135, -1, -1);

    (*(void (**)(char *, unint64_t))(v285 + 8))(v277, v288);
    v47 = v274;
  }
  else
  {

    (*(void (**)(char *, unint64_t))(v130 + 8))(v119, v131);
  }
LABEL_58:
  v277 = (char *)OBJC_IVAR___CertificateManager_certificateRequestManager;
  v142 = *(void **)((char *)v286 + OBJC_IVAR___CertificateManager_certificateRequestManager);
  v143 = v293;
  swift_unknownObjectRetain(v142);
  swift_bridgeObjectRetain(v143);
  v144 = sub_1000073FC(&qword_10003AC88);
  v145.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v143);
  v146 = objc_msgSend(v289, "csrAltName");
  v147 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v146, &type metadata for String, &type metadata for String, &protocol witness table for String);

  v148.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v147);
  v149 = v292;
  if (v292 == 1)
    v150 = 1;
  else
    v150 = _stringCompareWithSmolCheck(_:_:expecting:)(0x676E696E676973, 0xE700000000000000, 0x74707972636E65, 0xE700000000000000, 0);
  v151 = (uint64_t)v283;
  swift_bridgeObjectRelease(0xE700000000000000);
  v152 = (__SecKey *)objc_msgSend(v142, "generateCertificateRequestStringWith:subjectAltName:privateKey:encrypt:", v145.super.isa, v148.super.isa, v47, v150 & 1);

  swift_unknownObjectRelease(v142);
  v273 = v152;
  if (v152)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v152);
    v154 = v153;
  }
  else
  {
    v154 = 0;
  }
  v155 = v285;
  (*(void (**)(uint64_t, uint64_t, unint64_t))(v285 + 16))(v151, v287, v288);
  v156 = v289;
  v157 = Logger.logObject.getter(v156);
  v158 = static os_log_type_t.debug.getter();
  v159 = os_log_type_enabled(v157, v158);
  v289 = v156;
  if (v159)
  {
    v160 = swift_slowAlloc(32, -1);
    v269 = v154;
    v161 = v160;
    v268 = swift_slowAlloc(96, -1);
    v298 = v268;
    *(_DWORD *)v161 = 136315650;
    if (v149)
      v162 = 0x74707972636E65;
    else
      v162 = 0x676E696E676973;
    v294 = sub_10002A370(v162, 0xE700000000000000, &v298);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v294, v295);
    swift_bridgeObjectRelease(0xE700000000000000);
    *(_WORD *)(v161 + 12) = 2080;
    swift_beginAccess(&v293, &v294, 0, 0);
    v270 = a4;
    v163 = v293;
    v164 = swift_bridgeObjectRetain(v293);
    v165 = Array.description.getter(v164, v144);
    v167 = v166;
    swift_bridgeObjectRelease(v163);
    v297 = (uint64_t *)sub_10002A370(v165, v167, &v298);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v297, &v298);
    swift_bridgeObjectRelease(v167);
    *(_WORD *)(v161 + 22) = 2080;
    v168 = objc_msgSend(v156, "csrAltName");
    v169 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v168, &type metadata for String, &type metadata for String, &protocol witness table for String);

    a4 = v270;
    v170 = Dictionary.description.getter(v169, &type metadata for String, &type metadata for String, &protocol witness table for String);
    v172 = v171;
    swift_bridgeObjectRelease(v169);
    v297 = (uint64_t *)sub_10002A370(v170, v172, &v298);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v297, &v298);

    v173 = v172;
    v47 = v274;
    swift_bridgeObjectRelease(v173);
    _os_log_impl((void *)&_mh_execute_header, v157, v158, "Generated %s CSR with subject: %s, subject alt name: %s", (uint8_t *)v161, 0x20u);
    v174 = v268;
    swift_arrayDestroy(v268, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v174, -1, -1);
    v175 = v161;
    v154 = v269;
    swift_slowDealloc(v175, -1, -1);

    (*(void (**)(char *, unint64_t))(v285 + 8))(v283, v288);
  }
  else
  {

    (*(void (**)(char *, unint64_t))(v155 + 8))(v283, v288);
  }
  v176 = v284;
  v177 = v276;
  v178 = v275;
  if (!v154)
  {

    v181 = sub_1000073B8();
    v182 = swift_allocError(&_s5ErrorON, v181, 0, 0);
    *(_QWORD *)v183 = 2;
    *(_OWORD *)(v183 + 8) = 0u;
    *(_OWORD *)(v183 + 24) = 0u;
    *(_BYTE *)(v183 + 40) = 5;
    sub_10000E800(v182, v279, (int)a4, v281);

    v184 = v182;
LABEL_108:
    swift_errorRelease(v184);
    goto LABEL_109;
  }
  swift_bridgeObjectRelease(v154);
  swift_beginAccess(&v292, &v298, 0, 0);
  if ((v292 & 1) != 0)
  {
    v132 = v286;
    v179 = v271;
    sub_1000148C0((uint64_t)v286 + OBJC_IVAR___CertificateManager_encryptEndpoint, v271);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v177 + 48))(v179, 1, v176) != 1)
    {
      v180 = &MCCSecretAgentEncryptionCertIdKey;
      goto LABEL_77;
    }

    swift_release(a4);
    __break(1u);
    goto LABEL_118;
  }
  v132 = v286;
  v179 = v272;
  sub_1000148C0((uint64_t)v286 + OBJC_IVAR___CertificateManager_signingEndpoint, v272);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v177 + 48))(v179, 1, v176) == 1)
  {
LABEL_118:

    swift_release(a4);
    __break(1u);
    goto LABEL_119;
  }
  v180 = &MCCSecretAgentSigningCertIdKey;
LABEL_77:
  v185 = v282;
  (*(void (**)(char *, uint64_t, uint64_t))(v177 + 32))(v282, v179, v176);
  v283 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)(*v180);
  v288 = v186;
  v187 = (*(uint64_t (**)(char *, char *, uint64_t))(v177 + 16))(v178, v185, v176);
  v188 = Logger.logObject.getter(v187);
  v189 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v188, v189))
  {
    v190 = (uint8_t *)swift_slowAlloc(12, -1);
    v191 = (uint64_t *)swift_slowAlloc(32, -1);
    v297 = v191;
    *(_DWORD *)v190 = 136315138;
    v192 = sub_100009054(&qword_10003AC98, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v193 = dispatch thunk of CustomStringConvertible.description.getter(v284, v192);
    v195 = v194;
    v290 = sub_10002A370(v193, v194, (uint64_t *)&v297);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v290, &v291);
    swift_bridgeObjectRelease(v195);
    v285 = *(_QWORD *)(v177 + 8);
    ((void (*)(char *, uint64_t))v285)(v178, v284);
    _os_log_impl((void *)&_mh_execute_header, v188, v189, "Requesting certificate from: %s", v190, 0xCu);
    swift_arrayDestroy(v191, 1, (char *)&type metadata for Any + 8);
    v196 = v191;
    v176 = v284;
    swift_slowDealloc(v196, -1, -1);
    v197 = v190;
    v132 = v286;
    swift_slowDealloc(v197, -1, -1);
  }
  else
  {
    v285 = *(_QWORD *)(v177 + 8);
    ((void (*)(char *, uint64_t))v285)(v178, v176);
  }

  v198 = objc_msgSend(v289, "commonName");
  if (v198)
  {
    v199 = v198;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v198);
    v201 = v200;

  }
  else
  {
    v201 = (uint64_t *)0xE000000000000000;
  }
  v202 = *(void **)&v277[(_QWORD)v132];
  swift_unknownObjectRetain(v202);
  v203 = (unint64_t)v282;
  URL._bridgeToObjectiveC()(&v300);
  v205 = v204;
  v206 = String._bridgeToObjectiveC()();
  v297 = 0;
  v207 = v273;
  v208 = objc_msgSend(v202, "resultFromServerFor:endpoint:email:error:", v273, v205, v206, &v297);
  swift_unknownObjectRelease(v202);

  v209 = v297;
  if (!v208)
  {
LABEL_96:
    v245 = v209;
    swift_bridgeObjectRelease(v201);
    swift_bridgeObjectRelease(v288);
    v246 = _convertNSErrorToError(_:)(v209);

    swift_willThrow();
    v247 = v203;
    goto LABEL_98;
  }
  v210 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v208, &type metadata for String);
  v211 = v209;

  if (!*(_QWORD *)(v210 + 16))
  {
    swift_bridgeObjectRelease(v210);
    swift_bridgeObjectRelease(v201);
    swift_bridgeObjectRelease(v288);
    v248 = sub_1000073B8();
    v246 = swift_allocError(&_s5ErrorON, v248, 0, 0);
    *(_QWORD *)v249 = 9;
    *(_OWORD *)(v249 + 8) = 0u;
    *(_OWORD *)(v249 + 24) = 0u;
    *(_BYTE *)(v249 + 40) = 5;
    swift_willThrow();
    v247 = (unint64_t)v282;
LABEL_98:
    ((void (*)(unint64_t, uint64_t))v285)(v247, v176);
LABEL_99:
    v218 = v274;
    goto LABEL_104;
  }
  v270 = a4;
  v212 = *(_QWORD *)(v210 + 40);
  v213 = (char *)v286;
  v214 = *(void **)&v277[(_QWORD)v286];
  swift_bridgeObjectRetain(v212);
  swift_unknownObjectRetain(v214);
  v215 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v212);
  v297 = 0;
  v216 = objc_msgSend(v214, "certificateFor:error:", v215, &v297);
  swift_unknownObjectRelease(v214);

  v217 = v297;
  v218 = v274;
  if (!v216)
  {
    v250 = v297;
    swift_bridgeObjectRelease(v210);
    swift_bridgeObjectRelease(v201);
    swift_bridgeObjectRelease(v288);
    v246 = _convertNSErrorToError(_:)(v217);

    swift_willThrow();
LABEL_103:
    ((void (*)(char *, uint64_t))v285)(v282, v284);
    LODWORD(a4) = (_DWORD)v270;
LABEL_104:
    swift_errorRetain(v246);
    v253 = swift_errorRetain(v246);
    v254 = Logger.logObject.getter(v253);
    v255 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v254, v255))
    {
      v256 = (uint8_t *)swift_slowAlloc(12, -1);
      v257 = (uint64_t **)swift_slowAlloc(8, -1);
      *(_DWORD *)v256 = 138412290;
      swift_errorRetain(v246);
      v258 = (uint64_t *)_swift_stdlib_bridgeErrorToNSError(v246);
      v297 = v258;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v297, &v298);
      *v257 = v258;
      swift_errorRelease(v246);
      swift_errorRelease(v246);
      _os_log_impl((void *)&_mh_execute_header, v254, v255, "Certificate request failed with error %@", v256, 0xCu);
      v259 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v257, 1, v259);
      swift_slowDealloc(v257, -1, -1);
      swift_slowDealloc(v256, -1, -1);
    }
    else
    {
      swift_errorRelease(v246);
      swift_errorRelease(v246);
    }

    swift_errorRetain(v246);
    sub_10000E800(v246, v279, (int)a4, v281);

    swift_errorRelease(v246);
    v184 = v246;
    goto LABEL_108;
  }
  v176 = OBJC_IVAR___CertificateManager_keychainManager;
  v219 = *(void **)&v213[OBJC_IVAR___CertificateManager_keychainManager];
  v297 = 0;
  v220 = v217;
  v221 = objc_msgSend(v219, "saveIdentityToKeychain:privateKey:error:", v216, v218, &v297);
  v222 = v297;
  if (!v221)
  {
    v251 = v222;
    swift_bridgeObjectRelease(v210);
    swift_bridgeObjectRelease(v201);
    swift_bridgeObjectRelease(v288);
    v246 = _convertNSErrorToError(_:)(v251);

    swift_willThrow();
    goto LABEL_103;
  }
  v223 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v221);
  v225 = v224;

  v226 = *(void **)&v213[OBJC_IVAR___CertificateManager_cloudKVSManager];
  v227 = v223;
  swift_unknownObjectRetain(v226);
  v228 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v201);
  v229 = sub_1000073FC(&qword_10003AC90);
  inited = swift_initStackObject(v229, v296);
  *(_OWORD *)(inited + 16) = xmmword_10002BFF0;
  v231 = v288;
  *(_QWORD *)(inited + 32) = v283;
  *(_QWORD *)(inited + 40) = v231;
  *(_QWORD *)(inited + 48) = v223;
  *(_QWORD *)(inited + 56) = v225;
  sub_100008F50(v223, v225);
  v232 = sub_100024BE8(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v232);
  v297 = 0;
  LOBYTE(v232) = objc_msgSend(v226, "updateCertificateSettingsWithEmailAddress:identityPersistentRefs:error:", v228, isa, &v297);
  swift_unknownObjectRelease(v226);

  v234 = v297;
  if ((v232 & 1) == 0)
  {
    v252 = v297;
    swift_bridgeObjectRelease(v210);
    v246 = _convertNSErrorToError(_:)(v234);

    swift_willThrow();
    sub_100008F94(v227, v225);
    goto LABEL_103;
  }
  v283 = (char *)v227;
  v288 = v225;
  v289 = v216;
  v203 = *(_QWORD *)(v210 + 16);
  if (v203 < 2)
    __break(1u);
  v235 = v297;
  v209 = (uint64_t *)(v210 + 56);
  v236 = 2;
  a4 = v286;
  while (1)
  {
    v237 = *(void **)&v277[(_QWORD)a4];
    v238 = *v209;
    swift_unknownObjectRetain(v237);
    swift_bridgeObjectRetain(v238);
    v239 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v238);
    v297 = 0;
    v240 = objc_msgSend(v237, "certificateFor:error:", v239, &v297);
    swift_unknownObjectRelease(v237);

    v201 = v297;
    if (!v240)
    {
      v260 = v297;
      swift_bridgeObjectRelease(v210);
      v246 = _convertNSErrorToError(_:)(v201);

      swift_willThrow();
LABEL_112:
      sub_100008F94((uint64_t)v283, v288);
      ((void (*)(char *, uint64_t))v285)(v282, v284);
      LODWORD(a4) = (_DWORD)v270;
      goto LABEL_99;
    }
    v241 = *(void **)((char *)a4 + v176);
    v297 = 0;
    v242 = v201;
    LOBYTE(v241) = objc_msgSend(v241, "saveCertificateToKeychain:error:", v240, &v297);
    v243 = v297;
    if ((v241 & 1) == 0)
    {
      v261 = v243;
      swift_bridgeObjectRelease(v210);
      v246 = _convertNSErrorToError(_:)(v261);

      swift_willThrow();
      goto LABEL_112;
    }

    if (v203 == v236)
      break;
    v209 += 2;
    if (v236++ >= *(_QWORD *)(v210 + 16))
    {
      __break(1u);
      goto LABEL_96;
    }
  }
  v262 = swift_bridgeObjectRelease(v210);
  v263 = Logger.logObject.getter(v262);
  v264 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v263, v264))
  {
    v265 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v265 = 0;
    _os_log_impl((void *)&_mh_execute_header, v263, v264, "Saved to iCloud keychain", v265, 2u);
    swift_slowDealloc(v265, -1, -1);
  }

  sub_10000E800(0, v279, (int)v270, v281);
  v266 = v274;

  sub_100008F94((uint64_t)v283, v288);
  ((void (*)(char *, uint64_t))v285)(v282, v284);
LABEL_109:
  swift_bridgeObjectRelease(v293);
}

void sub_100012F24(uint64_t a1, uint64_t a2)
{
  void *v3;
  CFStringRef v4;
  id v5;
  id v6;
  void *v7;
  char *v8;
  uint64_t v9;
  id v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  SecKeyRef v18;
  CFDataRef v19;
  CFDataRef v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  SecKeyRef v24;
  CFStringRef v25;
  __CFString *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  char *v34;
  Swift::String v35;
  void *object;
  void *v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  _QWORD *v49;
  void *v50;
  uint64_t v51;
  _QWORD *v52;
  Class isa;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  SecKeyRef key;
  _QWORD *v59;
  __int128 v60;
  _BYTE v61[32];
  id v62;
  uint64_t v63;

  v3 = *(void **)(a1 + OBJC_IVAR___CertificateManager_keychainManager);
  v4 = kSecClassCertificate;
  v62 = 0;
  v5 = objc_msgSend(v3, "find:error:", kSecClassCertificate, &v62);
  v6 = v62;
  if (v5)
  {
    v7 = v5;
    v8 = (char *)&type metadata for Any;
    v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, (char *)&type metadata for Any + 8);
    v10 = v6;

    v11 = *(_QWORD *)(v9 + 16);
    if (v11)
    {
      v56 = a2;
      v59 = &_swiftEmptyArrayStorage;
      sub_10001EB44(0, v11, 0);
      type metadata accessor for CFString(0);
      v13 = v12;
      v55 = v9;
      v14 = v9 + 32;
      v15 = (char *)&type metadata for Any + 8;
      v57 = v12;
      while (1)
      {
        sub_100008EDC(v14, (uint64_t)&v62);
        v16 = sub_100009054((unint64_t *)&qword_10003AAE0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C148);
        if ((static _CFObject.== infix(_:_:)(kSecClassKey, v4, v13, v16) & 1) != 0)
        {
          sub_100008EDC((uint64_t)&v62, (uint64_t)v61);
          type metadata accessor for SecKey(0);
          swift_dynamicCast(&key, v61, v15, v17, 7);
          v18 = key;
          v19 = SecKeyCopyExternalRepresentation(key, 0);
          v20 = v19;
          if (!v19
            || (v60 = xmmword_10002BFE0,
                static Data._conditionallyBridgeFromObjectiveC(_:result:)(v19, &v60),
                v21 = *((_QWORD *)&v60 + 1),
                *((_QWORD *)&v60 + 1) >> 60 == 15))
          {

            v22 = "Identity: <No description>";
LABEL_17:
            v27 = (unint64_t)v22 | 0x8000000000000000;
            v28 = 0xD000000000000015;
            goto LABEL_18;
          }
          v32 = v60;
          *(_QWORD *)&v60 = 0x616873203A79654BLL;
          *((_QWORD *)&v60 + 1) = 0xEA00000000003A31;
          sub_1000065B8(v32, v21);
          v33 = v4;
          v34 = v8;
          object = v35._object;
          String.append(_:)(v35);
          v37 = object;
          v8 = v34;
          v4 = v33;
          v15 = (char *)&type metadata for Any + 8;
          swift_bridgeObjectRelease(v37);
          sub_100009130(v32, v21);

          v27 = *((_QWORD *)&v60 + 1);
          v28 = v60;
        }
        else
        {
          if ((static _CFObject.== infix(_:_:)(v4, v4, v13, v16) & 1) != 0)
          {
            sub_100008EDC((uint64_t)&v62, (uint64_t)v61);
            type metadata accessor for SecCertificate(0);
            swift_dynamicCast(&key, v61, v8 + 8, v23, 7);
            v24 = key;
            v25 = SecCertificateCopySubjectSummary(key);
            if (v25
              && (v26 = (__CFString *)v25,
                  v60 = 0uLL,
                  static String._conditionallyBridgeFromObjectiveC(_:result:)(v25, &v60),
                  v26,
                  (v27 = *((_QWORD *)&v60 + 1)) != 0))
            {
              v28 = v60;

            }
            else
            {

              swift_bridgeObjectRelease(0);
              v28 = 0xD000000000000010;
              v27 = 0x800000010002DEC0;
            }
            goto LABEL_18;
          }
          if ((static _CFObject.== infix(_:_:)(kSecClassIdentity, v4, v13, v16) & 1) == 0)
          {
            v22 = "tificate=}8@\"NSError\"16";
            goto LABEL_17;
          }
          sub_100008EDC((uint64_t)&v62, (uint64_t)v61);
          type metadata accessor for SecIdentity(0);
          swift_dynamicCast(&v60, v61, v8 + 8, v29, 7);
          v30 = (void *)v60;
          v28 = sub_100006AA4((__SecIdentity *)v60);
          v27 = v31;

        }
LABEL_18:
        sub_100009180(&v62);
        v38 = v59;
        if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0)
        {
          sub_10001EB44(0, v38[2] + 1, 1);
          v38 = v59;
        }
        v40 = v38[2];
        v39 = v38[3];
        if (v40 >= v39 >> 1)
        {
          sub_10001EB44(v39 > 1, v40 + 1, 1);
          v38 = v59;
        }
        v38[2] = v40 + 1;
        v41 = (char *)&v38[2 * v40];
        *((_QWORD *)v41 + 4) = v28;
        *((_QWORD *)v41 + 5) = v27;
        v14 += 32;
        --v11;
        v13 = v57;
        if (!v11)
        {
          swift_bridgeObjectRelease(v55);
          a2 = v56;
          goto LABEL_29;
        }
      }
    }
    swift_bridgeObjectRelease(v9);
    v38 = &_swiftEmptyArrayStorage;
LABEL_29:
    v52 = sub_10000CDD4((uint64_t)v38);
    swift_bridgeObjectRelease(v38);
    isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, Class, _QWORD))(a2 + 16))(a2, isa, 0);
    swift_bridgeObjectRelease(v52);

  }
  else
  {
    v42 = v62;
    v43 = _convertNSErrorToError(_:)(v6);

    swift_willThrow();
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v44 = type metadata accessor for Logger(0);
    sub_1000073A0(v44, (uint64_t)qword_10003B2D0);
    swift_errorRetain(v43);
    v45 = swift_errorRetain(v43);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(12, -1);
      v49 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v48 = 138412290;
      swift_errorRetain(v43);
      v50 = (void *)_swift_stdlib_bridgeErrorToNSError(v43);
      v62 = v50;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63);
      *v49 = v50;
      swift_errorRelease(v43);
      swift_errorRelease(v43);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "No certificate available: %@", v48, 0xCu);
      v51 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v49, 1, v51);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v48, -1, -1);
    }
    else
    {
      swift_errorRelease(v43);
      swift_errorRelease(v43);
    }

    swift_errorRetain(v43);
    v54 = (void *)_convertErrorToNSError(_:)(v43);
    (*(void (**)(uint64_t, _QWORD, void *))(a2 + 16))(a2, 0, v54);

    swift_errorRelease(v43);
    swift_errorRelease(v43);
  }
}

void sub_100013598(void *a1, char *a2, uint8_t *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  void ***v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  void *v42;
  Class isa;
  uint8_t *v44;
  void *v45;
  id v46;
  char *v47;
  int64_t v48;
  unint64_t v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  id v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  _QWORD *v62;
  Class v63;
  uint8_t *v64;
  uint64_t *v65;
  uint64_t v66;
  int64_t v67;
  uint64_t v68;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int64_t v74;
  _QWORD *v75;
  uint64_t v76;
  void **aBlock;
  _QWORD v78[4];
  uint8_t *v79;

  v5 = *(void **)&a2[OBJC_IVAR___CertificateManager_cloudKVSManager];
  aBlock = 0;
  v6 = objc_msgSend(v5, "fetchCertificatesSettingsWithEmailAddress:error:");
  if (!v6)
  {
    v3 = (uint64_t)a3;
    v19 = aBlock;
    v20 = _convertNSErrorToError(_:)(0);

    swift_willThrow();
    if (qword_10003A9C8 == -1)
    {
LABEL_6:
      v21 = type metadata accessor for Logger(0);
      sub_1000073A0(v21, (uint64_t)qword_10003B2D0);
      swift_errorRetain(v20);
      v22 = swift_errorRetain(v20);
      v23 = Logger.logObject.getter(v22);
      v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc(12, -1);
        v26 = (void ***)swift_slowAlloc(8, -1);
        *(_DWORD *)v25 = 138412290;
        swift_errorRetain(v20);
        v27 = (void **)_swift_stdlib_bridgeErrorToNSError(v20);
        aBlock = v27;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v78);
        *v26 = v27;
        swift_errorRelease(v20);
        swift_errorRelease(v20);
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "No certificate available: %@", v25, 0xCu);
        v28 = sub_1000073FC(&qword_10003B060);
        swift_arrayDestroy(v26, 1, v28);
        swift_slowDealloc(v26, -1, -1);
        swift_slowDealloc(v25, -1, -1);
      }
      else
      {
        swift_errorRelease(v20);
        swift_errorRelease(v20);
      }

      swift_errorRetain(v20);
      v60 = (void *)_convertErrorToNSError(_:)(v20);
      (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v60);

      swift_errorRelease(v20);
      swift_errorRelease(v20);
      return;
    }
LABEL_52:
    swift_once(&qword_10003A9C8, sub_100016B08);
    goto LABEL_6;
  }
  v7 = v6;
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for String, &type metadata for Data, &protocol witness table for String);
  v9 = 0;

  if (qword_10003A9C8 != -1)
LABEL_44:
    swift_once(&qword_10003A9C8, sub_100016B08);
  v10 = type metadata accessor for Logger(0);
  sub_1000073A0(v10, (uint64_t)qword_10003B2D0);
  v11 = swift_bridgeObjectRetain_n(v8, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.debug.getter();
  v64 = a3;
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = (void **)swift_slowAlloc(32, -1);
    aBlock = v15;
    *(_DWORD *)v14 = 136315138;
    a3 = v14 + 4;
    v16 = swift_bridgeObjectRetain(v8);
    v17 = Dictionary.description.getter(v16, &type metadata for String, &type metadata for Data, &protocol witness table for String);
    v3 = v18;
    swift_bridgeObjectRelease(v8);
    v75 = (_QWORD *)sub_10002A370(v17, v3, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76);
    swift_bridgeObjectRelease_n(v8, 2);
    swift_bridgeObjectRelease(v3);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Found saved identityRefs %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v8, 2);
  }
  v29 = swift_allocObject(&unk_1000353F8, 24, 7);
  v30 = 0;
  v71 = v29;
  v72 = v8;
  *(_QWORD *)(v29 + 16) = _swiftEmptyArrayStorage;
  v65 = (uint64_t *)(v29 + 16);
  v66 = v8 + 64;
  v31 = 1 << *(_BYTE *)(v8 + 32);
  v32 = -1;
  if (v31 < 64)
    v32 = ~(-1 << v31);
  v33 = v32 & *(_QWORD *)(v8 + 64);
  v67 = (unint64_t)(v31 + 63) >> 6;
  v68 = OBJC_IVAR___CertificateManager_keychainManager;
  v8 = (uint64_t)a1;
  while (1)
  {
    if (v33)
    {
      v73 = (v33 - 1) & v33;
      v74 = v30;
      v34 = __clz(__rbit64(v33)) | (v30 << 6);
      v35 = v72;
      goto LABEL_13;
    }
    v48 = v30 + 1;
    v35 = v72;
    if (__OFADD__(v30, 1))
    {
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v48 >= v67)
      goto LABEL_29;
    v49 = *(_QWORD *)(v66 + 8 * v48);
    v50 = v30 + 1;
    if (!v49)
    {
      v50 = v30 + 2;
      if (v30 + 2 >= v67)
        goto LABEL_29;
      v49 = *(_QWORD *)(v66 + 8 * v50);
      if (!v49)
      {
        v50 = v30 + 3;
        if (v30 + 3 >= v67)
          goto LABEL_29;
        v49 = *(_QWORD *)(v66 + 8 * v50);
        if (!v49)
          break;
      }
    }
LABEL_28:
    v73 = (v49 - 1) & v49;
    v74 = v50;
    v34 = __clz(__rbit64(v49)) + (v50 << 6);
LABEL_13:
    v36 = 16 * v34;
    v37 = (uint64_t *)(*(_QWORD *)(v35 + 48) + v36);
    v39 = *v37;
    v38 = v37[1];
    v40 = (uint64_t *)(*(_QWORD *)(v35 + 56) + v36);
    v3 = *v40;
    v41 = v40[1];
    v42 = *(void **)&a2[v68];
    sub_100008F50(*v40, v41);
    swift_unknownObjectRetain(v42);
    swift_bridgeObjectRetain(v38);
    sub_100008F50(v3, v41);
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100008F94(v3, v41);
    v44 = (uint8_t *)swift_allocObject(&unk_100035420, 72, 7);
    *((_QWORD *)v44 + 2) = v71;
    *((_QWORD *)v44 + 3) = v39;
    *((_QWORD *)v44 + 4) = v38;
    *((_QWORD *)v44 + 5) = v3;
    *((_QWORD *)v44 + 6) = v41;
    *((_QWORD *)v44 + 7) = a1;
    *((_QWORD *)v44 + 8) = a2;
    v78[3] = sub_100014A18;
    v79 = v44;
    aBlock = _NSConcreteStackBlock;
    v78[0] = 1107296256;
    v78[1] = sub_10000DA38;
    v78[2] = &unk_100035438;
    v45 = _Block_copy(&aBlock);
    a3 = v79;
    swift_bridgeObjectRetain(v38);
    sub_100008F50(v3, v41);
    swift_retain(v71);
    v46 = a1;
    v47 = a2;
    swift_release(a3);
    objc_msgSend(v42, "getCertificateByIdentityRef:completion:", isa, v45);
    _Block_release(v45);
    swift_bridgeObjectRelease(v38);
    swift_unknownObjectRelease(v42);

    sub_100008F94(v3, v41);
    v33 = v73;
    v30 = v74;
  }
  v51 = v30 + 4;
  if (v30 + 4 < v67)
  {
    v49 = *(_QWORD *)(v66 + 8 * v51);
    if (!v49)
    {
      while (1)
      {
        v50 = v51 + 1;
        if (__OFADD__(v51, 1))
          goto LABEL_43;
        if (v50 >= v67)
          goto LABEL_29;
        v49 = *(_QWORD *)(v66 + 8 * v50);
        ++v51;
        if (v49)
          goto LABEL_28;
      }
    }
    v50 = v30 + 4;
    goto LABEL_28;
  }
LABEL_29:
  swift_release(v72);
  swift_beginAccess(v65, &aBlock, 0, 0);
  v52 = *v65;
  if ((unint64_t)*v65 >> 62)
  {
    if (v52 < 0)
      v61 = *v65;
    else
      v61 = v52 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v52);
    v20 = _CocoaArrayWrapper.endIndex.getter(v61);
    if (!v20)
      goto LABEL_49;
LABEL_31:
    v75 = _swiftEmptyArrayStorage;
    sub_10001EB7C(0, v20 & ~(v20 >> 63), 0);
    if ((v20 & 0x8000000000000000) == 0)
    {
      v53 = 0;
      v54 = v75;
      do
      {
        if ((v52 & 0xC000000000000001) != 0)
          v55 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v53, v52);
        else
          v55 = *(id *)(v52 + 8 * v53 + 32);
        v56 = v55;
        v57 = sub_1000077B8((uint64_t)v55);

        v75 = v54;
        v59 = v54[2];
        v58 = v54[3];
        if (v59 >= v58 >> 1)
        {
          sub_10001EB7C(v58 > 1, v59 + 1, 1);
          v54 = v75;
        }
        ++v53;
        v54[2] = v59 + 1;
        v54[v59 + 4] = v57;
      }
      while (v20 != v53);
      swift_bridgeObjectRelease(v52);
      goto LABEL_50;
    }
    __break(1u);
    goto LABEL_52;
  }
  v20 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(*v65);
  if (v20)
    goto LABEL_31;
LABEL_49:
  swift_bridgeObjectRelease(v52);
  v54 = _swiftEmptyArrayStorage;
LABEL_50:
  v62 = sub_10000CEF8((uint64_t)v54);
  swift_bridgeObjectRelease(v54);
  v63 = Array._bridgeToObjectiveC()().super.isa;
  (*((void (**)(uint8_t *, Class, _QWORD))v64 + 2))(v64, v63, 0);
  swift_release(v71);
  swift_bridgeObjectRelease(v62);

}

uint64_t sub_100013DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  NSString v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  void *v25;
  uint64_t v26;
  NSString v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSString v31;
  uint64_t v32;
  Class isa;
  uint64_t v34;
  void (*v35)(uint64_t, _QWORD);
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  __int128 aBlock;
  __int128 v44;
  void (*v45)(uint64_t, unint64_t, uint64_t);
  uint64_t v46;
  _OWORD v47[2];

  v8 = swift_allocObject(&unk_100035380, 24, 7);
  *(_QWORD *)(v8 + 16) = &_swiftEmptyDictionarySingleton;
  v9 = (_QWORD *)(v8 + 16);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentEncryptionCertIdKey);
  v12 = v11;
  if (!*(_QWORD *)(a3 + 16) || (v13 = sub_100027010(v10, v11), (v14 & 1) == 0))
  {
    aBlock = 0u;
    v44 = 0u;
    swift_bridgeObjectRelease(v12);
    goto LABEL_6;
  }
  sub_100008EDC(*(_QWORD *)(a3 + 56) + 32 * v13, (uint64_t)&aBlock);
  swift_bridgeObjectRelease(v12);
  if (!*((_QWORD *)&v44 + 1))
  {
LABEL_6:
    sub_1000090DC((uint64_t)&aBlock, &qword_10003B1E0);
    goto LABEL_7;
  }
  sub_100008F18(&aBlock, v47);
  v15 = *(void **)(a4 + OBJC_IVAR___CertificateManager_keychainManager);
  sub_100008EDC((uint64_t)v47, (uint64_t)&aBlock);
  swift_unknownObjectRetain(v15);
  swift_dynamicCast(&v41, &aBlock, (char *)&type metadata for Any + 8, &type metadata for String, 7);
  v16 = v42;
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  v45 = sub_100014988;
  v46 = v8;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v44 = sub_10000DB34;
  *((_QWORD *)&v44 + 1) = &unk_1000353C0;
  v18 = _Block_copy(&aBlock);
  v19 = v46;
  swift_retain(v8);
  swift_release(v19);
  objc_msgSend(v15, "findSecIdentityRefForCertId:completion:", v17, v18);
  _Block_release(v18);
  swift_unknownObjectRelease(v15);

  sub_100009180(v47);
LABEL_7:
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentSigningCertIdKey);
  v22 = v21;
  if (*(_QWORD *)(a3 + 16) && (v23 = sub_100027010(v20, v21), (v24 & 1) != 0))
  {
    sub_100008EDC(*(_QWORD *)(a3 + 56) + 32 * v23, (uint64_t)&aBlock);
  }
  else
  {
    aBlock = 0u;
    v44 = 0u;
  }
  swift_bridgeObjectRelease(v22);
  if (*((_QWORD *)&v44 + 1))
  {
    sub_100008F18(&aBlock, v47);
    v25 = *(void **)(a4 + OBJC_IVAR___CertificateManager_keychainManager);
    sub_100008EDC((uint64_t)v47, (uint64_t)&aBlock);
    swift_unknownObjectRetain(v25);
    swift_dynamicCast(&v41, &aBlock, (char *)&type metadata for Any + 8, &type metadata for String, 7);
    v26 = v42;
    v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v26);
    v45 = sub_100014960;
    v46 = v8;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v44 = sub_10000DB34;
    *((_QWORD *)&v44 + 1) = &unk_100035398;
    v28 = _Block_copy(&aBlock);
    v29 = v46;
    swift_retain(v8);
    swift_release(v29);
    objc_msgSend(v25, "findSecIdentityRefForCertId:completion:", v27, v28);
    _Block_release(v28);
    swift_unknownObjectRelease(v25);

    sub_100009180(v47);
  }
  else
  {
    sub_1000090DC((uint64_t)&aBlock, &qword_10003B1E0);
  }
  v30 = *(void **)(a4 + OBJC_IVAR___CertificateManager_cloudKVSManager);
  swift_unknownObjectRetain(v30);
  v31 = String._bridgeToObjectiveC()();
  swift_beginAccess(v9, &aBlock, 0, 0);
  v32 = *v9;
  swift_bridgeObjectRetain(*v9);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v32);
  *(_QWORD *)&v47[0] = 0;
  LODWORD(v32) = objc_msgSend(v30, "updateCertificateSettingsWithEmailAddress:identityPersistentRefs:error:", v31, isa, v47);
  swift_unknownObjectRelease(v30);

  v34 = *(_QWORD *)&v47[0];
  if ((_DWORD)v32)
  {
    v35 = *(void (**)(uint64_t, _QWORD))(a5 + 16);
    v36 = *(id *)&v47[0];
    v35(a5, 0);
  }
  else
  {
    v37 = *(id *)&v47[0];
    v38 = _convertNSErrorToError(_:)(v34);

    swift_willThrow();
    swift_errorRetain(v38);
    v39 = (void *)_convertErrorToNSError(_:)(v38);
    (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v39);

    swift_errorRelease(v38);
    swift_errorRelease(v38);
  }
  return swift_release(v8);
}

void sub_100014278(void *a1, uint64_t a2, char *a3, const void *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  __SecIdentity *v13;
  void **v14;
  __SecIdentity *v15;
  void **v16;
  OSStatus v17;
  SecCertificateRef v18;
  BOOL v19;
  OSStatus v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void **v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  __SecCertificate *v36;
  NSURL *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  _QWORD *v42;
  char *v43;
  id v44;
  unsigned __int8 v45;
  void **v46;
  SecCertificateRef v47;
  void **v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  void ***v54;
  void **v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const void *v61;
  void **aBlock;
  _QWORD v63[4];
  _QWORD *v64;
  SecCertificateRef certificateRef;

  v8 = sub_1000073FC(&qword_10003AC80);
  __chkstk_darwin(v8);
  v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject(&unk_100035308, 24, 7);
  *(_QWORD *)(v11 + 16) = a4;
  v12 = *(void **)&a3[OBJC_IVAR___CertificateManager_keychainManager];
  aBlock = 0;
  _Block_copy(a4);
  v13 = (__SecIdentity *)objc_msgSend(v12, "findSecIdentityForCertId:error:", a2, &aBlock);
  v14 = aBlock;
  if (v13)
  {
    v15 = v13;
    certificateRef = 0;
    v16 = aBlock;
    v17 = SecIdentityCopyCertificate(v15, &certificateRef);
    v18 = certificateRef;
    if (v17)
      v19 = 1;
    else
      v19 = certificateRef == 0;
    if (v19)
    {
      v20 = v17;
      if (qword_10003A9C8 != -1)
        swift_once(&qword_10003A9C8, sub_100016B08);
      v21 = type metadata accessor for Logger(0);
      v22 = sub_1000073A0(v21, (uint64_t)qword_10003B2D0);
      v23 = Logger.logObject.getter(v22);
      v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v25 = 67109120;
        LODWORD(aBlock) = v20;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4);
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "RefreshCertificate error: Failed to copy Signing Certificate from Signing Identity: %d", v25, 8u);
        swift_slowDealloc(v25, -1, -1);
      }

      v26 = sub_1000073B8();
      v27 = swift_allocError(&_s5ErrorON, v26, 0, 0);
      *(_QWORD *)v28 = 9;
      *(_OWORD *)(v28 + 8) = 0u;
      *(_OWORD *)(v28 + 24) = 0u;
      *(_BYTE *)(v28 + 40) = 5;
      v29 = (void *)_convertErrorToNSError(_:)(v27);
      (*((void (**)(const void *, _QWORD, void *))a4 + 2))(a4, 0, v29);

      swift_errorRelease(v27);
      goto LABEL_16;
    }
    v61 = a4;
    v32 = *(void **)&a3[OBJC_IVAR___CertificateManager_certificateRequestManager];
    sub_1000148C0((uint64_t)&a3[OBJC_IVAR___CertificateManager_revokeEndpoint], (uint64_t)v10);
    v33 = type metadata accessor for URL(0);
    v34 = *(_QWORD *)(v33 - 8);
    v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v10, 1, v33);
    if (v35 == 1)
    {
      _Block_release(v61);
      __break(1u);
      return;
    }
    v36 = v18;
    swift_unknownObjectRetain(v32);
    URL._bridgeToObjectiveC()(v37);
    v39 = v38;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v33);
    v40 = (_QWORD *)swift_allocObject(&unk_100035330, 48, 7);
    v40[2] = sub_1000148B8;
    v40[3] = v11;
    v40[4] = a3;
    v40[5] = a1;
    v63[3] = sub_10001493C;
    v64 = v40;
    aBlock = _NSConcreteStackBlock;
    v63[0] = 1107296256;
    v63[1] = sub_10000EF74;
    v63[2] = &unk_100035348;
    v41 = _Block_copy(&aBlock);
    v42 = v64;
    swift_retain(v11);
    v43 = a3;
    v44 = a1;
    swift_release(v42);
    aBlock = 0;
    v45 = objc_msgSend(v32, "generatePayloadAndRevokeFor:signingIdentity:endpoint:error:errCompletion:", v36, v15, v39, &aBlock, v41);
    _Block_release(v41);
    swift_unknownObjectRelease(v32);

    v46 = aBlock;
    if ((v45 & 1) != 0)
    {

LABEL_16:
      v47 = certificateRef;
      swift_release(v11);

      return;
    }
    v48 = v46;
    v31 = _convertNSErrorToError(_:)(v46);

    swift_willThrow();
    a4 = v61;
  }
  else
  {
    v30 = aBlock;
    v31 = _convertNSErrorToError(_:)(v14);

    swift_willThrow();
  }
  if (qword_10003A9C8 != -1)
    swift_once(&qword_10003A9C8, sub_100016B08);
  v49 = type metadata accessor for Logger(0);
  sub_1000073A0(v49, (uint64_t)qword_10003B2D0);
  swift_errorRetain(v31);
  v50 = swift_errorRetain(v31);
  v51 = Logger.logObject.getter(v50);
  v52 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc(12, -1);
    v54 = (void ***)swift_slowAlloc(8, -1);
    *(_DWORD *)v53 = 138412290;
    swift_errorRetain(v31);
    v55 = (void **)_swift_stdlib_bridgeErrorToNSError(v31);
    aBlock = v55;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v63);
    *v54 = v55;
    swift_errorRelease(v31);
    swift_errorRelease(v31);
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "RefreshCertificate error in Catch block %@", v53, 0xCu);
    v56 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v54, 1, v56);
    swift_slowDealloc(v54, -1, -1);
    swift_slowDealloc(v53, -1, -1);
  }
  else
  {
    swift_errorRelease(v31);
    swift_errorRelease(v31);
  }

  v57 = sub_1000073B8();
  v58 = swift_allocError(&_s5ErrorON, v57, 0, 0);
  *(_QWORD *)v59 = 15;
  *(_OWORD *)(v59 + 8) = 0u;
  *(_OWORD *)(v59 + 24) = 0u;
  *(_BYTE *)(v59 + 40) = 5;
  v60 = (void *)_convertErrorToNSError(_:)(v58);
  (*((void (**)(const void *, _QWORD, void *))a4 + 2))(a4, 0, v60);

  swift_errorRelease(v58);
  swift_errorRelease(v31);
  swift_release(v11);
}

uint64_t sub_100014894()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000148B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000D07C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1000148C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000073FC(&qword_10003AC80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014908()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 48, 7);
}

void sub_10001493C(uint64_t a1)
{
  uint64_t v1;

  sub_10000E5D0(a1, *(void (**)(_QWORD *, uint64_t))(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_100014948(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100014958(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100014960(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_10000DBC8(a1, a2, a3, v3, &MCCSecretAgentSigningCertIdKey, "UpdateUserDefaults. identityPresistentRef for signing not found. error: %@");
}

void sub_100014988(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_10000DBC8(a1, a2, a3, v3, &MCCSecretAgentEncryptionCertIdKey, "UpdateUserDefaults. identityPresistentRef for encryption not found. error: %@");
}

uint64_t sub_1000149B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000149D4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  sub_100008F94(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));

  return swift_deallocObject(v0, 72, 7);
}

void sub_100014A18(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000D100(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(void **)(v2 + 56), *(_QWORD *)(v2 + 64));
}

uint64_t sub_100014A48(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100008F50(a1, a2);
  return a1;
}

id EFFuture.isFinished.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "isFinished");
}

id EFFuture.isCancelled.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "isCancelled");
}

uint64_t EFFuture.__allocating_init<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = swift_allocObject(v1, 24, 7);
  EFFuture.init<A>(_:)(a1);
  return v3;
}

uint64_t EFFuture.init<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = objc_opt_self(EFFuture);
  result = swift_dynamicCastObjCClass(a1, v3);
  if (result)
  {
    *(_QWORD *)(v1 + 16) = result;
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t EFFuture.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  id v5;
  uint64_t v6;

  result = static EFFuture.asAnyObject(_:)(a1);
  if (result)
  {
    v4 = result;
    v5 = objc_msgSend((id)objc_opt_self(EFFuture), "futureWithResult:", result);
    swift_unknownObjectRelease(v4);
    (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))(a1);
    v6 = swift_allocObject(v1, 24, 7);
    EFFuture.init<A>(_:)((uint64_t)v5);
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;

  v3 = (void *)_convertErrorToNSError(_:)(a1);
  v4 = objc_msgSend((id)objc_opt_self(EFFuture), "futureWithError:", v3);
  swift_errorRelease(a1);

  v5 = swift_allocObject(v1, 24, 7);
  EFFuture.init<A>(_:)((uint64_t)v4);
  return v5;
}

uint64_t static EFFuture.asAnyObject(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t result;
  uint64_t v11;

  v3 = *(_QWORD *)(v1 + 80);
  v4 = type metadata accessor for Optional(0, v3);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - v6;
  v8 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - v6, a1, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  v9 = sub_10001623C((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  result = 0;
  if (!v9)
    return _bridgeAnythingToObjectiveC<A>(_:)(a1, v3);
  return result;
}

uint64_t EFFuture.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[5];
  _QWORD *v13;

  v5 = (_QWORD *)swift_allocObject(&unk_100035470, 40, 7);
  v5[2] = *(_QWORD *)(v2 + 80);
  v5[3] = a1;
  v5[4] = a2;
  v12[4] = sub_1000163F0;
  v13 = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100014EFC;
  v12[3] = &unk_100035488;
  v6 = _Block_copy(v12);
  v7 = (void *)objc_opt_self(EFFuture);
  swift_retain(a2);
  v8 = objc_msgSend(v7, "futureWithBlock:", v6);
  _Block_release(v6);
  v9 = v13;
  swift_release(a2);
  swift_release(v9);
  v10 = swift_allocObject(v2, 24, 7);
  EFFuture.init<A>(_:)((uint64_t)v8);
  return v10;
}

uint64_t sub_100014E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a4 - 8);
  v6 = __chkstk_darwin(a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9(v6);
  type metadata accessor for EFFuture(0, a4, v10, v11);
  v12 = static EFFuture.asAnyObject(_:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a4);
  return v12;
}

id sub_100014EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  void *v5;

  v4 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = (void *)v4(a2);
  swift_release(v3);
  return v5;
}

uint64_t EFFuture.result()@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v3 = *((_QWORD *)*v1 + 10);
  v4 = type metadata accessor for Optional(0, v3);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - v6;
  v8 = objc_msgSend(v1[2], "result");
  v9 = swift_unknownObjectRetain(v8);
  static EFFuture.asValue(_:)(v9, v7);
  swift_unknownObjectRelease(v8);
  v10 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v3) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __break(1u);
  }
  else
  {
    swift_unknownObjectRelease(v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v7, v3);
  }
  return result;
}

uint64_t static EFFuture.asValue(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void (*v13)(char *, _QWORD, uint64_t, uint64_t);
  int v15;
  id v16;
  uint64_t v17;

  v5 = *(_QWORD *)(v2 + 80);
  v6 = type metadata accessor for Optional(0, v5);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - v8;
  v17 = a1;
  swift_unknownObjectRetain(a1);
  v10 = sub_1000073FC(qword_10003ACC0);
  v11 = swift_dynamicCast(v9, &v17, v10, v5, 6);
  v12 = *(_QWORD *)(v5 - 8);
  v13 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56);
  if (v11)
  {
    v13(v9, 0, 1, v5);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(a2, v9, v5);
    return ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v13)(a2, 0, 1, v5);
  }
  else
  {
    v13(v9, 1, 1, v5);
    v16 = objc_msgSend(objc_allocWithZone((Class)NSNull), "init");
    v15 = swift_dynamicCast(a2, &v16, (char *)&type metadata for Swift.AnyObject + 8, v5, 6);
    v13(a2, v15 ^ 1u, 1, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t EFFuture.result(withTimeout:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  void *v16;
  id v17;

  v5 = *(_QWORD *)(*v2 + 80);
  v6 = type metadata accessor for Optional(0, v5);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - v8;
  v10 = (void *)v2[2];
  v17 = 0;
  v11 = objc_msgSend(v10, "resultWithTimeout:error:", &v17, a2);
  v12 = v17;
  if (v11)
  {
    v13 = swift_unknownObjectRetain(v11);
    static EFFuture.asValue(_:)(v13, v9);
    swift_unknownObjectRelease(v11);
    v14 = *(_QWORD *)(v5 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v5) == 1)
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease(v11);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a1, v9, v5);
    }
  }
  else
  {
    v16 = v12;
    _convertNSErrorToError(_:)(v12);

    return swift_willThrow();
  }
  return result;
}

uint64_t EFFuture.result(beforeDate:)@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  Class isa;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v16 = a1;
  v2 = *(_QWORD *)(*v1 + 80);
  v3 = type metadata accessor for Optional(0, v2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v15 - v5;
  v7 = (void *)v1[2];
  isa = Date._bridgeToObjectiveC()().super.isa;
  v17 = 0;
  v9 = objc_msgSend(v7, "resultBeforeDate:error:", isa, &v17);

  v10 = v17;
  if (v9)
  {
    v11 = swift_unknownObjectRetain(v9);
    static EFFuture.asValue(_:)(v11, v6);
    swift_unknownObjectRelease(v9);
    v12 = *(_QWORD *)(v2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v2) == 1)
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      __break(1u);
    }
    else
    {
      swift_unknownObjectRelease(v9);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(v16, v6, v2);
    }
  }
  else
  {
    v14 = v10;
    _convertNSErrorToError(_:)(v10);

    return swift_willThrow();
  }
  return result;
}

uint64_t EFFuture.onSuccess(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD v13[5];
  _QWORD *v14;

  v7 = *v3;
  v8 = (void *)v3[2];
  v9 = (_QWORD *)swift_allocObject(&unk_1000354C0, 40, 7);
  v9[2] = *(_QWORD *)(v7 + 80);
  v9[3] = a2;
  v9[4] = a3;
  v13[4] = sub_100016414;
  v14 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_1000156DC;
  v13[3] = &unk_1000354D8;
  v10 = _Block_copy(v13);
  v11 = v14;
  swift_retain(a3);
  swift_release(v11);
  objc_msgSend(v8, "onScheduler:addSuccessBlock:", a1, v10);
  _Block_release(v10);
  return swift_retain(v3);
}

uint64_t sub_1000155AC(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4)
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
  uint64_t result;
  uint64_t v18;

  v7 = type metadata accessor for Optional(0, a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v18 - v10;
  v12 = *(_QWORD *)(a4 - 8);
  __chkstk_darwin(v9);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture(0, a4, v15, v16);
  static EFFuture.asValue(_:)(a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a4) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a4);
    a2(v14);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a4);
  }
  return result;
}

uint64_t sub_1000156DC(uint64_t a1, uint64_t a2)
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

uint64_t EFFuture.onError(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;

  v7 = *(void **)(v3 + 16);
  v8 = swift_allocObject(&unk_100035510, 32, 7);
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v12[4] = sub_100016420;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100015800;
  v12[3] = &unk_100035528;
  v9 = _Block_copy(v12);
  v10 = v13;
  swift_retain(a3);
  swift_release(v10);
  objc_msgSend(v7, "onScheduler:addFailureBlock:", a1, v9);
  _Block_release(v9);
  return swift_retain(v3);
}

void sub_100015800(uint64_t a1, void *a2)
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

uint64_t EFFuture.always(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;

  v7 = *(void **)(v3 + 16);
  v8 = swift_allocObject(&unk_100035560, 32, 7);
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v12[4] = sub_100016420;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100015928;
  v12[3] = &unk_100035578;
  v9 = _Block_copy(v12);
  v10 = v13;
  swift_retain(a3);
  swift_release(v10);
  objc_msgSend(v7, "onScheduler:always:", a1, v9);
  _Block_release(v9);
  return swift_retain(v3);
}

uint64_t sub_100015928(uint64_t a1)
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

uint64_t EFFuture.then<A>(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  _QWORD v18[5];
  _QWORD *v19;

  v9 = *v4;
  v10 = type metadata accessor for EFFuture(0, a4, a3, a4);
  v11 = (void *)v4[2];
  v12 = (_QWORD *)swift_allocObject(&unk_1000355B0, 48, 7);
  v12[2] = *(_QWORD *)(v9 + 80);
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  v18[4] = sub_100016494;
  v19 = v12;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_100015BC8;
  v18[3] = &unk_1000355C8;
  v13 = _Block_copy(v18);
  v14 = v19;
  swift_retain(a3);
  swift_release(v14);
  v15 = objc_msgSend(v11, "onScheduler:then:", a1, v13);
  _Block_release(v13);
  v16 = swift_allocObject(v10, 24, 7);
  EFFuture.init<A>(_:)((uint64_t)v15);
  return v16;
}

uint64_t sub_100015A7C(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4)
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
  uint64_t v17;
  id v18;
  uint64_t result;
  uint64_t v20;

  v7 = type metadata accessor for Optional(0, a4);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v20 - v10;
  v12 = *(_QWORD *)(a4 - 8);
  __chkstk_darwin(v9);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture(0, a4, v15, v16);
  static EFFuture.asValue(_:)(a1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a4) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, a4);
    v17 = a2(v14);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, a4);
    v18 = *(id *)(v17 + 16);
    swift_release(v17);
    return (uint64_t)v18;
  }
  return result;
}

id sub_100015BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  void *v6;

  v4 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v6 = (void *)v4(v5);
  swift_release(v3);
  swift_unknownObjectRelease(a2);
  return v6;
}

uint64_t EFFuture.recover<A>(on:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  _QWORD v18[5];
  _QWORD *v19;

  v9 = *v4;
  v10 = type metadata accessor for EFFuture(0, a4, a3, a4);
  v11 = (void *)v4[2];
  v12 = (_QWORD *)swift_allocObject(&unk_100035600, 48, 7);
  v12[2] = *(_QWORD *)(v9 + 80);
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  v18[4] = sub_1000164A0;
  v19 = v12;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_100015D44;
  v18[3] = &unk_100035618;
  v13 = _Block_copy(v18);
  v14 = v19;
  swift_retain(a3);
  swift_release(v14);
  v15 = objc_msgSend(v11, "onScheduler:recover:", a1, v13);
  _Block_release(v13);
  v16 = swift_allocObject(v10, 24, 7);
  EFFuture.init<A>(_:)((uint64_t)v15);
  return v16;
}

id sub_100015D44(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t (*v4)(void);
  id v5;
  void *v6;

  v4 = *(uint64_t (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v6 = (void *)v4();
  swift_release(v3);

  return v6;
}

uint64_t EFFuture.map<A>(on:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD *v21;

  v9 = *v4;
  v10 = type metadata accessor for EFFuture(0, a4, a3, a4);
  v11 = (void *)v4[2];
  v12 = (_QWORD *)swift_allocObject(&unk_100035650, 48, 7);
  v13 = *(_QWORD *)(v9 + 80);
  v12[2] = v13;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  v14 = (_QWORD *)swift_allocObject(&unk_100035678, 48, 7);
  v14[2] = v13;
  v14[3] = a4;
  v14[4] = sub_1000164DC;
  v14[5] = v12;
  v20[4] = sub_1000164E8;
  v21 = v14;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_10001610C;
  v20[3] = &unk_100035690;
  v15 = _Block_copy(v20);
  v16 = v21;
  swift_retain(a3);
  swift_release(v16);
  v17 = objc_msgSend(v11, "onScheduler:map:", a1, v15);
  _Block_release(v15);
  v18 = swift_allocObject(v10, 24, 7);
  EFFuture.init<A>(_:)((uint64_t)v17);
  return v18;
}

uint64_t sub_100015EE0@<X0>(uint64_t a1@<X0>, void (*a2)(char *)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  void (*v22)(char *);

  v22 = a2;
  v9 = type metadata accessor for Optional(0, a3);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v21 - v12;
  v14 = *(_QWORD *)(a3 - 8);
  __chkstk_darwin(v11);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EFFuture(0, a3, v17, v18);
  static EFFuture.asValue(_:)(a1, v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    v19 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, a3);
    v22(v16);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, a3);
    v19 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(a5, v19, 1, a4);
}

uint64_t sub_100016044@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  uint64_t v14;

  v8 = type metadata accessor for Optional(0, a3);
  __chkstk_darwin(v8);
  v10 = (char *)&v14 - v9;
  a2(a1);
  v11 = *(_QWORD *)(a3 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a3);
  if ((_DWORD)result == 1)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  else
  {
    *(_QWORD *)(a4 + 24) = a3;
    v13 = sub_10001653C((_QWORD *)a4);
    return (*(uint64_t (**)(_QWORD *, char *, uint64_t))(v11 + 32))(v13, v10, a3);
  }
  return result;
}

id sub_10001610C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(_QWORD *__return_ptr, uint64_t);
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v4 = *(void (**)(_QWORD *__return_ptr, uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v13, v5);
  swift_release(v3);
  swift_unknownObjectRelease(a2);
  v6 = v14;
  if (!v14)
    return 0;
  v7 = sub_10000915C(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v10, v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  sub_100009180(v13);
  return v11;
}

uint64_t EFPromise.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t EFPromise.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 24, 7);
}

BOOL sub_10001623C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  unint64_t v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;

  v3 = *(_QWORD *)(v1 + 80);
  v4 = type metadata accessor for Optional(0, v3);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v18 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v18 - v9, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v10, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_6:
    v11(v8, a1, v4);
    goto LABEL_7;
  }
  v12 = sub_100016578();
  if ((swift_dynamicCast(&v19, v10, v3, v12, 6) & 1) == 0)
    goto LABEL_6;
  v13 = v19;
  v11(v8, a1, v4);
  if (!v13)
  {
LABEL_7:
    v15 = Optional._bridgeToObjectiveC()(v4);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v16 = objc_opt_self(NSNull);
    v14 = swift_dynamicCastObjCClass(v15, v16) != 0;
    swift_unknownObjectRelease(v15);
    return v14;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return 0;
}

uint64_t sub_1000163CC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000163F0(uint64_t a1)
{
  uint64_t *v1;

  return sub_100014E2C(a1, v1[3], v1[4], v1[2]);
}

uint64_t sub_1000163FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001640C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100016414(uint64_t a1)
{
  uint64_t v1;

  return sub_1000155AC(a1, *(void (**)(char *))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16));
}

uint64_t sub_100016420()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100016440()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t type metadata accessor for EFFuture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000165B4(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EFFuture);
}

uint64_t sub_100016470()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100016494(uint64_t a1)
{
  uint64_t v1;

  return sub_100015A7C(a1, *(uint64_t (**)(char *))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16));
}

id sub_1000164A0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = (*(uint64_t (**)(void))(v0 + 32))();
  v2 = *(id *)(v1 + 16);
  swift_release(v1);
  return v2;
}

uint64_t sub_1000164DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100015EE0(a1, *(void (**)(char *))(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1000164E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100016044(a1, *(void (**)(uint64_t))(v2 + 32), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_1000164F8(uint64_t a1)
{
  char *v2;

  v2 = (char *)&value witness table for Builtin.UnknownObject + 64;
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + 88);
}

_QWORD *sub_10001653C(_QWORD *a1)
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

unint64_t sub_100016578()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003AD48[0];
  if (!qword_10003AD48[0])
  {
    v1 = objc_opt_self(NSNull);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, qword_10003AD48);
  }
  return result;
}

uint64_t sub_1000165B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t EFPromise.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_allocObject(v0, 24, 7);
  *(_QWORD *)(v1 + 16) = objc_msgSend(objc_allocWithZone((Class)EFPromise), "init");
  return v1;
}

uint64_t EFPromise.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)EFPromise), "init");
  return v0;
}

uint64_t EFPromise.future.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id *v4;

  type metadata accessor for EFFuture(0, *((_QWORD *)*v4 + 10), a3, a4);
  return EFFuture.__allocating_init<A>(_:)((uint64_t)objc_msgSend(v4[2], "future"));
}

uint64_t EFPromise.finish(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = type metadata accessor for Optional(0, v3);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - v6;
  v8 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v10 - v6, a1, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, v3);
  LOBYTE(a1) = EFPromise.finish(with:error:)(v7, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t EFPromise.finish(with:error:)(char *a1, void *a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v5 = *(_QWORD *)(*v2 + 80);
  v6 = type metadata accessor for Optional(0, v5);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v18 - v8;
  v10 = (void *)v2[2];
  v11 = *(_QWORD *)(v5 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = 0;
  if (v12(a1, 1, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, a1, v6);
    result = v12(v9, 1, v5);
    if ((_DWORD)result == 1)
    {
      __break(1u);
      return result;
    }
    type metadata accessor for EFFuture(0, v5, v15, v16);
    v13 = static EFFuture.asAnyObject(_:)((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v5);
  }
  if (a2)
    a2 = (void *)_convertErrorToNSError(_:)(a2);
  v17 = objc_msgSend(v10, "finishWithResult:error:", v13, a2);
  swift_unknownObjectRelease(v13);

  return (uint64_t)v17;
}

uint64_t EFPromise.finish(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = type metadata accessor for Optional(0, v3);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - v6;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))((char *)&v9 - v6, 1, 1, v3);
  LOBYTE(a1) = EFPromise.finish(with:error:)(v7, a1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a1 & 1;
}

uint64_t EFPromise.finish(_:)(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = type metadata accessor for Optional(0, v3);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v11 - v8;
  a1(v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v9, 0, 1, v3);
  EFPromise.finish(with:error:)(v9, 0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
}

uint64_t type metadata accessor for EFPromise(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000165B4(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EFPromise);
}

uint64_t sub_100016B08(uint64_t a1)
{
  return sub_100016C70(a1, qword_10003B2D0, 0x6369666974726563, 0xEB00000000657461);
}

uint64_t sub_100016B30(uint64_t a1)
{
  return sub_100016B90(a1, qword_10003B2E8, 7566955, 0xE300000000000000);
}

uint64_t sub_100016B48(uint64_t a1)
{
  return sub_100016B90(a1, qword_10003B300, 0xD000000000000014, 0x800000010002EC40);
}

uint64_t sub_100016B6C(uint64_t a1)
{
  return sub_100016B90(a1, qword_10003B318, 0xD000000000000018, 0x800000010002EC20);
}

uint64_t sub_100016B90(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v7 = type metadata accessor for Logger(0);
  sub_100016C14(v7, a2);
  sub_1000073A0(v7, (uint64_t)a2);
  v8 = qword_10003ADD0;
  v9 = off_10003ADD8;
  swift_bridgeObjectRetain(off_10003ADD8);
  return Logger.init(subsystem:category:)(v8, v9, a3, a4);
}

uint64_t *sub_100016C14(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100016C54(uint64_t a1)
{
  return sub_100016C70(a1, qword_10003B330, 0x73656C7572, 0xE500000000000000);
}

uint64_t sub_100016C70(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v7 = type metadata accessor for Logger(0);
  sub_100016C14(v7, a2);
  sub_1000073A0(v7, (uint64_t)a2);
  v9 = qword_10003ADD0;
  v8 = off_10003ADD8;
  swift_bridgeObjectRetain(off_10003ADD8);
  return Logger.init(subsystem:category:)(v9, v8, a3, a4);
}

uint64_t sub_100016CF4(uint64_t a1, uint64_t a2)
{
  return sub_100016D94(a1, a2, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_10001E48C);
}

uint64_t sub_100016D44(uint64_t a1, uint64_t a2)
{
  return sub_100016D94(a1, a2, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_10001E244);
}

uint64_t sub_100016D94(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, uint64_t, uint64_t))
{
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  uint64_t v10;

  v10 = 0;
  result = a3(&v10, a1, a2);
  v4 = v10;
  if ((_DWORD)result)
  {
    v5 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)(NSOSStatusErrorDomain);
    v7 = v6;
    v8 = objc_allocWithZone((Class)NSError);
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, v5, 0);

    swift_willThrow();
    swift_unknownObjectRelease(v4);
    return v4;
  }
  if (v10)
    return v4;
  __break(1u);
  return result;
}

_OWORD *sub_100016EA4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  id v5;
  _OWORD v6[2];
  uint64_t v7;

  v7 = a1;
  swift_unknownObjectRetain(a1);
  v3 = sub_1000073FC(qword_10003ACC0);
  if (swift_dynamicCast(v6, &v7, v3, (char *)&type metadata for Any + 8, 6))
    return sub_100008F18(v6, a2);
  memset(v6, 0, sizeof(v6));
  v5 = objc_msgSend(objc_allocWithZone((Class)NSNull), "init");
  if ((swift_dynamicCast(a2, &v5, (char *)&type metadata for Swift.AnyObject + 8, (char *)&type metadata for Any + 8, 6) & 1) == 0)
  {
    *a2 = 0u;
    a2[1] = 0u;
  }
  return (_OWORD *)sub_1000090DC((uint64_t)v6, &qword_10003B1E0);
}

BOOL sub_100016F74(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  _BYTE v10[24];
  uint64_t v11;

  sub_10001B75C(a1, (uint64_t)v10, &qword_10003B1E0);
  if (!v11)
  {
    sub_1000090DC((uint64_t)v10, &qword_10003B1E0);
    goto LABEL_6;
  }
  v2 = sub_100016578();
  if ((swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, v2, 6) & 1) == 0)
  {
LABEL_6:
    sub_10001B75C(a1, (uint64_t)v10, &qword_10003B1E0);
    goto LABEL_7;
  }
  v3 = v9;
  sub_10001B75C(a1, (uint64_t)v10, &qword_10003B1E0);
  if (!v3)
  {
LABEL_7:
    v5 = sub_1000073FC(&qword_10003B1E0);
    v6 = Optional._bridgeToObjectiveC()(v5);
    sub_1000090DC((uint64_t)v10, &qword_10003B1E0);
    v7 = objc_opt_self(NSNull);
    v4 = swift_dynamicCastObjCClass(v6, v7) != 0;
    swift_unknownObjectRelease(v6);
    return v4;
  }

  sub_1000090DC((uint64_t)v10, &qword_10003B1E0);
  return 0;
}

uint64_t sub_10001708C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  void *v8;
  id v9;
  _BYTE v10[32];
  _QWORD v11[4];

  v4 = *(void **)(v2 + 16);
  if (!*(_QWORD *)(a1 + 24))
  {
    v7 = 0;
    if (a2)
    {
LABEL_9:
      v8 = (void *)_convertErrorToNSError(_:)(a2);
      goto LABEL_10;
    }
LABEL_6:
    v8 = 0;
LABEL_10:
    v9 = objc_msgSend(v4, "finishWithResult:error:", v7, v8);
    swift_unknownObjectRelease(v7);

    return (uint64_t)v9;
  }
  result = sub_10001B75C(a1, (uint64_t)v11, &qword_10003B1E0);
  if (v11[3])
  {
    sub_100008EDC((uint64_t)v11, (uint64_t)v10);
    v6 = sub_100016F74((uint64_t)v10);
    sub_1000090DC((uint64_t)v10, &qword_10003B1E0);
    if (v6)
    {
      v7 = 0;
    }
    else
    {
      sub_100008EDC((uint64_t)v11, (uint64_t)v10);
      v7 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v10, (char *)&type metadata for Any + 8);
    }
    sub_100009180(v11);
    if (a2)
      goto LABEL_9;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001718C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v6;
  __int128 v7;

  if (a2 >> 60 == 15)
  {
    v6 = 0u;
    v7 = 0u;
  }
  else
  {
    *((_QWORD *)&v7 + 1) = &type metadata for Data;
    *(_QWORD *)&v6 = a1;
    *((_QWORD *)&v6 + 1) = a2;
  }
  sub_100014A48(a1, a2);
  sub_10001708C((uint64_t)&v6, a4);
  return sub_1000090DC((uint64_t)&v6, &qword_10003B1E0);
}

uint64_t sub_1000171FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  uint64_t v7;
  void (*v8)(void *, unint64_t, void *, void *);
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;

  v6 = a2;
  v8 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    swift_retain(v7);
    v9 = v6;
    v6 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v11 = v10;

  }
  else
  {
    swift_retain(v7);
    v11 = 0xF000000000000000;
  }
  v12 = a3;
  v13 = a4;
  v8(v6, v11, a3, a4);

  sub_100009130((uint64_t)v6, v11);
  return swift_release(v7);
}

void sub_1000172AC(uint64_t a1)
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

  if (qword_10003A9C8 != -1)
    swift_once(&qword_10003A9C8, sub_100016B08);
  v2 = type metadata accessor for Logger(0);
  sub_1000073A0(v2, (uint64_t)qword_10003B2D0);
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
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
    *v6 = v7;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Serverside error: %@", v5, 0xCu);
    v8 = sub_1000073FC(&qword_10003B060);
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

uint64_t sub_10001746C(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(result, a2);
      v7 = (uint64_t)sub_1000184F0(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_10001840C(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease(a2);
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

uint64_t sub_1000179D4(uint64_t a1, uint64_t (*a2)(uint64_t))
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
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  if (a1)
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v4 = type metadata accessor for Logger(0);
    sub_1000073A0(v4, (uint64_t)qword_10003B2D0);
    swift_errorRetain(a1);
    v5 = swift_errorRetain(a1);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v8 = 138412290;
      swift_errorRetain(a1);
      v10 = _swift_stdlib_bridgeErrorToNSError(a1);
      v19 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20);
      *v9 = v10;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "RefreshCertificate error in revokeResultFromServer: %@", v8, 0xCu);
      v11 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v9, 1, v11);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }

    v17 = a1;
  }
  else
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_1000073A0(v12, (uint64_t)qword_10003B2D0);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "RefreshCertificate success from revokeResultFromServer", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    v17 = 0;
  }
  return a2(v17);
}

#error "100017CFC: call analysis failed (funcsize=92)"

void sub_100017DB0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *oslog;
  id v29;
  uint64_t v30;

  if (a3 && (v8 = objc_opt_self(NSHTTPURLResponse), (v9 = swift_dynamicCastObjCClass(a3, v8)) != 0))
  {
    v10 = (void *)v9;
    v11 = qword_10003A9C8;
    v12 = a3;
    if (v11 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v13 = type metadata accessor for Logger(0);
    sub_1000073A0(v13, (uint64_t)qword_10003B2D0);
    v14 = v12;
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v17 = 134217984;
      v29 = objc_msgSend(v10, "statusCode");
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30);

      _os_log_impl((void *)&_mh_execute_header, v15, v16, "RefreshCertificate Revoke API HTTPS response code: %ld", v17, 0xCu);
      swift_slowDealloc(v17, -1, -1);

    }
    else
    {

    }
    if (objc_msgSend(v10, "statusCode") == (id)200)
      ((void (*)(_QWORD))a5)(0);

  }
  else
  {
    v18 = sub_1000073B8();
    v19 = swift_allocError(&_s5ErrorON, v18, 0, 0);
    *(_QWORD *)v20 = 15;
    *(_OWORD *)(v20 + 8) = 0u;
    *(_OWORD *)(v20 + 24) = 0u;
    *(_BYTE *)(v20 + 40) = 5;
    a5();
    swift_errorRelease(v19);
    if (a4)
    {
      swift_errorRetain(a4);
      if (qword_10003A9C8 != -1)
        swift_once(&qword_10003A9C8, sub_100016B08);
      v21 = type metadata accessor for Logger(0);
      sub_1000073A0(v21, (uint64_t)qword_10003B2D0);
      swift_errorRetain(a4);
      v22 = swift_errorRetain(a4);
      oslog = Logger.logObject.getter(v22);
      v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc(12, -1);
        v25 = (uint64_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v24 = 138412290;
        swift_errorRetain(a4);
        v26 = _swift_stdlib_bridgeErrorToNSError(a4);
        v29 = (id)v26;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30);
        *v25 = v26;
        swift_errorRelease(a4);
        swift_errorRelease(a4);
        _os_log_impl((void *)&_mh_execute_header, oslog, v23, "RefreshCertificate Revoke API Error: %@", v24, 0xCu);
        v27 = sub_1000073FC(&qword_10003B060);
        swift_arrayDestroy(v25, 1, v27);
        swift_slowDealloc(v25, -1, -1);
        swift_slowDealloc(v24, -1, -1);

        swift_errorRelease(a4);
      }
      else
      {
        swift_errorRelease(a4);
        swift_errorRelease(a4);
        swift_errorRelease(a4);

      }
    }
  }
}

id sub_100018310()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CertificateRequestManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CertificateRequestManager()
{
  return objc_opt_self(CertificateRequestManager);
}

_QWORD *sub_100018360(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = (_QWORD *)__DataStorage._bytes.getter();
  v9 = (uint64_t)result;
  if (result)
  {
    result = (_QWORD *)__DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - (_QWORD)result;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  v14 = v9 + v13;
  if (v9)
    v15 = v14;
  else
    v15 = 0;
  result = sub_1000189D8(v9, v15, a4);
  if (v4)
    return (_QWORD *)v16;
  return result;
}

unsigned __int8 *sub_10001840C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v6 = sub_10001876C(v4, v5);
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
  v12 = sub_1000184F0(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12;
}

unsigned __int8 *sub_1000184F0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_10001876C(uint64_t a1, unint64_t a2)
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
  v9 = sub_1000187E8(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_1000187E8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
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
    v12 = sub_100004F10(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_10002A800(v12, 0);
      v5 = sub_100004FFC((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
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
      v8 = (unint64_t)_swiftEmptyArrayStorage;
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

uint64_t sub_10001892C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100008F50(a1, a2);
  sub_100018A24(a1, a2);
  v5 = v4;
  sub_100008F94(a1, a2);
  v6 = static String._fromUTF8Repairing(_:)(v5 + 32, *(_QWORD *)(v5 + 16));
  swift_release(v5);
  return v6;
}

uint64_t sub_1000189A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (a1)
    v4 = a2 - a1;
  else
    v4 = 0;
  result = static String._fromUTF8Repairing(_:)(a1, v4);
  *a3 = result;
  a3[1] = v6;
  return result;
}

_QWORD *sub_1000189D8(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a1)
    v4 = a2 - a1;
  else
    v4 = 0;
  result = a3(&v6, a1, v4);
  if (!v3)
    return (_QWORD *)v6;
  return result;
}

void sub_100018A24(uint64_t a1, uint64_t a2)
{
  type metadata accessor for Data.Iterator(0);
  __chkstk_darwin();
  __asm { BR              X10 }
}

_QWORD *sub_100018AA0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;

  if (BYTE6(v0))
  {
    v6 = sub_1000073FC(&qword_10003ACB8);
    v4 = (_QWORD *)swift_allocObject(v6, BYTE6(v0) + 32, 7);
    v7 = j__malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v7 - 64;
    sub_100008F50(v2, v0);
    v8 = ((uint64_t (*)(uint64_t, _QWORD *, _QWORD, uint64_t, unint64_t))Data._copyContents(initializing:))(v3, v4 + 4, BYTE6(v0), v2, v0);
    sub_100008F94(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v8 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x100018B74);
    }
  }
  return v4;
}

uint64_t sub_100018B8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  if (!a1)
    a2 = 0;
  result = static String._fromUTF8Repairing(_:)(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_100018BC0(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t inited;
  void *v21;
  unint64_t v22;
  Class isa;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  Class v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  Class v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  unint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  unint64_t v68;
  char v69;
  unint64_t v70;
  unint64_t v71;
  char v72;
  __int128 v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  char *v79;
  uint64_t v80;
  _QWORD *v81;
  void (*v82)(char *, uint64_t);
  unint64_t v83;
  uint64_t v84;
  uint64_t v85[4];
  __int128 aBlock;
  __int128 v87;
  void *v88;
  uint64_t v89;
  char v90[96];

  v82 = a3;
  v81 = (_QWORD *)type metadata accessor for URL(0);
  v80 = *(v81 - 1);
  __chkstk_darwin(v81);
  v10 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000073FC(&qword_10003AE08);
  __chkstk_darwin(v11);
  v13 = (char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = type metadata accessor for URLRequest(0);
  v14 = *(_QWORD *)(v84 - 8);
  v15 = __chkstk_darwin(v84);
  v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v79 = (char *)&v77 - v18;
  v19 = sub_1000073FC(&qword_10003AE38);
  inited = swift_initStackObject(v19, v90);
  *(_OWORD *)(inited + 16) = xmmword_10002C230;
  *(_QWORD *)(inited + 32) = 7500643;
  *(_QWORD *)(inited + 40) = 0xE300000000000000;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  v21 = (void *)objc_opt_self(NSJSONSerialization);
  *(_QWORD *)(inited + 64) = 0x6C69616D65;
  *(_QWORD *)(inited + 72) = 0xE500000000000000;
  *(_QWORD *)(inited + 80) = a4;
  *(_QWORD *)(inited + 88) = a5;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a5);
  v22 = sub_100024D0C(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v22);
  *(_QWORD *)&aBlock = 0;
  v24 = objc_msgSend(v21, "dataWithJSONObject:options:error:", isa, 0, &aBlock);

  v25 = (id)aBlock;
  if (!v24)
  {
    v30 = v25;
    _convertNSErrorToError(_:)(v25);

    swift_willThrow();
    return (uint64_t)v24;
  }
  v78 = v21;
  v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v24);
  v28 = v27;

  type metadata accessor for CertificateManager(0);
  (*(void (**)(char *, void (*)(char *, uint64_t), _QWORD *))(v80 + 16))(v10, v82, v81);
  URLRequest.init(url:cachePolicy:timeoutInterval:)(v10, 0, 60.0);
  v29 = v83;
  sub_10000C610((uint64_t)v13);
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v84);
LABEL_7:
    sub_100008F94(v26, v28);
    return (uint64_t)v24;
  }
  v24 = *(_QWORD **)(v14 + 8);
  v31 = v17;
  v32 = v84;
  ((void (*)(char *, uint64_t))v24)(v31, v84);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v32) == 1)
  {
    sub_1000090DC((uint64_t)v13, &qword_10003AE08);
    v33 = sub_1000073B8();
    swift_allocError(&_s5ErrorON, v33, 0, 0);
    *(_QWORD *)v34 = 3;
    *(_OWORD *)(v34 + 8) = 0u;
    *(_OWORD *)(v34 + 24) = 0u;
    *(_BYTE *)(v34 + 40) = 5;
    swift_willThrow();
    goto LABEL_7;
  }
  v82 = (void (*)(char *, uint64_t))v24;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v79, v13, v32);
  sub_100008F50(v26, v28);
  v83 = v28;
  URLRequest.httpBody.setter(v26, v28);
  URLRequest.httpMethod.setter(1414745936, 0xE400000000000000);
  v36 = sub_1000073FC(&qword_10003AE40);
  v37 = swift_allocObject(v36, 24, 7);
  *(_QWORD *)(v37 + 16) = objc_msgSend(objc_allocWithZone((Class)EFPromise), "init");
  v38 = objc_msgSend((id)objc_opt_self(NSURLSessionConfiguration), "ephemeralSessionConfiguration");
  v39 = objc_msgSend((id)objc_opt_self(NSURLSession), "sessionWithConfiguration:", v38);

  v40 = URLRequest._bridgeToObjectiveC()().super.isa;
  v88 = sub_10001B754;
  v89 = v37;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v87 = sub_1000171FC;
  *((_QWORD *)&v87 + 1) = &unk_100035990;
  v41 = _Block_copy(&aBlock);
  v42 = v89;
  swift_retain(v37);
  swift_release(v42);
  v43 = objc_msgSend(v39, "dataTaskWithRequest:completionHandler:", v40, v41);
  _Block_release(v41);

  objc_msgSend(v43, "resume");
  v44 = objc_msgSend(*(id *)(v37 + 16), "future");
  v45 = objc_msgSend((id)objc_opt_self(EFScheduler), "immediateScheduler");
  v88 = sub_1000157FC;
  v89 = 0;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v87 = sub_100015800;
  *((_QWORD *)&v87 + 1) = &unk_1000359B8;
  v46 = _Block_copy(&aBlock);
  swift_release(v89);
  objc_msgSend(v44, "onScheduler:addFailureBlock:", v45, v46);
  _Block_release(v46);
  swift_unknownObjectRelease(v45);
  v47 = objc_msgSend(v44, "result");
  v48 = swift_unknownObjectRetain(v47);
  sub_100016EA4(v48, &aBlock);
  swift_unknownObjectRelease(v47);
  if (*((_QWORD *)&v87 + 1))
  {
    v81 = v39;
    swift_unknownObjectRelease(v47);
    sub_100008F18(&aBlock, v85);

    if ((swift_dynamicCast(&aBlock, v85, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
    {
      v49 = *((_QWORD *)&aBlock + 1);
      v50 = aBlock;
      sub_100008F50(aBlock, *((unint64_t *)&aBlock + 1));
      v51 = Data._bridgeToObjectiveC()().super.isa;
      *(_QWORD *)&aBlock = 0;
      v24 = objc_msgSend(v78, "JSONObjectWithData:options:error:", v51, 0, &aBlock);

      v52 = aBlock;
      if (v24)
      {
        v53 = (id)aBlock;
        _bridgeAnyObjectToAny(_:)(&aBlock, v24);
        swift_unknownObjectRelease(v24);
        v54 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
        if (swift_dynamicCast(v85, &aBlock, (char *)&type metadata for Any + 8, v54, 6))
        {
          v55 = v85[0];
          if (*(_QWORD *)(v85[0] + 16))
          {
            v56 = sub_100027010(0x6E69616863, 0xE500000000000000);
            if ((v57 & 1) != 0)
            {
              sub_100008EDC(*(_QWORD *)(v55 + 56) + 32 * v56, (uint64_t)&aBlock);
              v58 = sub_1000073FC(&qword_10003AA88);
              if ((swift_dynamicCast(v85, &aBlock, (char *)&type metadata for Any + 8, v58, 6) & 1) != 0)
              {
                sub_100008F94(v50, v49);
                swift_bridgeObjectRelease(v55);

                sub_100008F94(v50, v49);
                swift_release(v37);
                sub_100008F94(v26, v83);
                v24 = (_QWORD *)v85[0];
                v82(v79, v32);
                return (uint64_t)v24;
              }
            }
          }
          if (*(_QWORD *)(v55 + 16)
            && (v64 = sub_100027010(0x646F43726F727265, 0xE900000000000065), (v65 & 1) != 0)
            && (sub_100008EDC(*(_QWORD *)(v55 + 56) + 32 * v64, (uint64_t)&aBlock),
                (swift_dynamicCast(v85, &aBlock, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
            && (v66 = sub_10001746C(v85[0], v85[1]), (v67 & 1) == 0))
          {
            v24 = (_QWORD *)v66;
            if (*(_QWORD *)(v55 + 16)
              && (v68 = sub_100027010(0x746954726F727265, 0xEA0000000000656CLL), (v69 & 1) != 0)
              && (sub_100008EDC(*(_QWORD *)(v55 + 56) + 32 * v68, (uint64_t)&aBlock),
                  swift_dynamicCast(v85, &aBlock, (char *)&type metadata for Any + 8, &type metadata for String, 6)))
            {
              v70 = v85[1];
              v80 = v85[0];
            }
            else
            {
              v80 = 0;
              v70 = 0xE000000000000000;
            }
            if (*(_QWORD *)(v55 + 16)
              && (v71 = sub_100027010(0x73654D726F727265, 0xEC00000065676173), (v72 & 1) != 0))
            {
              sub_100008EDC(*(_QWORD *)(v55 + 56) + 32 * v71, (uint64_t)&aBlock);
            }
            else
            {
              aBlock = 0u;
              v87 = 0u;
            }
            swift_bridgeObjectRelease(v55);
            if (*((_QWORD *)&v87 + 1))
            {
              if ((swift_dynamicCast(v85, &aBlock, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
              {
                v73 = *(_OWORD *)v85;
                v74 = sub_1000073B8();
                swift_allocError(&_s5ErrorON, v74, 0, 0);
                v75 = v80;
                *(_QWORD *)v76 = v24;
                *(_QWORD *)(v76 + 8) = v75;
                *(_QWORD *)(v76 + 16) = v70;
                *(_OWORD *)(v76 + 24) = v73;
                *(_BYTE *)(v76 + 40) = 1;
                swift_willThrow();
                sub_100008F94(v50, v49);

                sub_100008F94(v50, v49);
                swift_release(v37);
                sub_100008F94(v26, v83);
                v62 = v79;
                v63 = v84;
                goto LABEL_23;
              }
              sub_100008F94(v50, v49);
              swift_bridgeObjectRelease(v70);
            }
            else
            {
              sub_100008F94(v50, v49);
              swift_bridgeObjectRelease(v70);
              sub_1000090DC((uint64_t)&aBlock, &qword_10003B1E0);
            }
            v32 = v84;
          }
          else
          {
            sub_100008F94(v50, v49);
            swift_bridgeObjectRelease(v55);
          }
LABEL_18:
          v59 = v82;

          sub_100009130(v50, v49);
          swift_release(v37);
          sub_100008F94(v26, v83);
          v24 = _swiftEmptyArrayStorage;
          v59(v79, v32);
          return (uint64_t)v24;
        }
        v60 = sub_1000073B8();
        swift_allocError(&_s5ErrorON, v60, 0, 0);
        *(_QWORD *)v61 = 7;
        *(_OWORD *)(v61 + 8) = 0u;
        *(_OWORD *)(v61 + 24) = 0u;
        *(_BYTE *)(v61 + 40) = 5;
      }
      else
      {
        v24 = (id)aBlock;
        _convertNSErrorToError(_:)(v52);

      }
      swift_willThrow();
      sub_100008F94(v50, v49);

      sub_100008F94(v50, v49);
      swift_release(v37);
      sub_100008F94(v26, v83);
      v62 = v79;
      v63 = v32;
LABEL_23:
      v82(v62, v63);
      return (uint64_t)v24;
    }
    v50 = 0;
    v49 = 0xF000000000000000;
    goto LABEL_18;
  }
  result = sub_1000090DC((uint64_t)&aBlock, &qword_10003B1E0);
  __break(1u);
  return result;
}

void *sub_1000196F4(int a1, uint64_t a2, SecKeyRef key, char a4)
{
  uint64_t v6;
  SecKeyRef v7;
  uint64_t v8;
  uint64_t inited;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSString v14;
  unint64_t v15;
  Class isa;
  Class v17;
  void *CertificateRequest;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE v24[152];

  if ((a4 & 1) != 0)
    v6 = 4;
  else
    v6 = 1;
  v7 = SecKeyCopyPublicKey(key);
  v8 = sub_1000073FC(&qword_10003AE28);
  inited = swift_initStackObject(v8, v24);
  *(_OWORD *)(inited + 16) = xmmword_10002C310;
  v10 = (void *)kSecCertificateKeyUsage;
  *(_QWORD *)(inited + 32) = kSecCertificateKeyUsage;
  *(_QWORD *)(inited + 40) = v6;
  v11 = (void *)kSecSubjectAltName;
  *(_QWORD *)(inited + 64) = &type metadata for Int;
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 104) = sub_1000073FC(&qword_10003AE30);
  *(_QWORD *)(inited + 80) = a2;
  v12 = v10;
  v13 = v11;
  swift_bridgeObjectRetain(a2);
  v14 = String._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 144) = &type metadata for String;
  *(_QWORD *)(inited + 112) = v14;
  *(_QWORD *)(inited + 120) = 0xD00000000000001DLL;
  *(_QWORD *)(inited + 128) = 0x800000010002ECD0;
  v15 = sub_100024ABC(inited);
  sub_1000073FC(&qword_10003AC88);
  isa = Array._bridgeToObjectiveC()().super.isa;
  type metadata accessor for CFString(0);
  sub_100009054((unint64_t *)&qword_10003AB38, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10002C174);
  v17 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  CertificateRequest = (void *)SecGenerateCertificateRequest(isa, v17, v7, key);

  if (CertificateRequest)
  {
    v19 = CertificateRequest;
    v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(CertificateRequest);
    v22 = v21;

    CertificateRequest = (void *)sub_100005E44(v20, v22, (void *)2);
    sub_100008F94(v20, v22);

  }
  else
  {

  }
  return CertificateRequest;
}

SecCertificateRef sub_100019908(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  SecCertificateRef v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFData *isa;
  unint64_t v11;
  uint64_t v12;

  v4 = sub_1000058D8(a1, a2, (void *)1);
  if (!v2)
  {
    v6 = v5;
    if (v5 >> 60 == 15)
    {
      v7 = sub_1000073B8();
      swift_allocError(&_s5ErrorON, v7, 0, 0);
      *(_QWORD *)v8 = 10;
      *(_OWORD *)(v8 + 8) = 0u;
      *(_OWORD *)(v8 + 24) = 0u;
      *(_BYTE *)(v8 + 40) = 5;
      swift_willThrow();
    }
    else
    {
      v9 = (uint64_t)v4;
      isa = Data._bridgeToObjectiveC()().super.isa;
      v3 = SecCertificateCreateWithData(kCFAllocatorDefault, isa);

      if (!v3)
      {
        v11 = sub_1000073B8();
        swift_allocError(&_s5ErrorON, v11, 0, 0);
        *(_QWORD *)v12 = 10;
        *(_OWORD *)(v12 + 8) = 0u;
        *(_OWORD *)(v12 + 24) = 0u;
        *(_BYTE *)(v12 + 40) = 5;
        swift_willThrow();
      }
      sub_100009130(v9, v6);
    }
  }
  return v3;
}

void sub_100019A34(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  if (a1)
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v4 = type metadata accessor for Logger(0);
    sub_1000073A0(v4, (uint64_t)qword_10003B2D0);
    swift_errorRetain(a1);
    v5 = swift_errorRetain(a1);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v8 = 138412290;
      swift_errorRetain(a1);
      v10 = _swift_stdlib_bridgeErrorToNSError(a1);
      v18 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19);
      *v9 = v10;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "RefreshCertificate error in revokeResultFromServer: %@", v8, 0xCu);
      v11 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v9, 1, v11);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }

    v17 = (void *)_convertErrorToNSError(_:)(a1);
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v17);

  }
  else
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_1000073A0(v12, (uint64_t)qword_10003B2D0);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "RefreshCertificate success from revokeResultFromServer", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, 0);
  }
}

void sub_100019CD4(uint64_t a1, unint64_t a2, void (*a3)(_QWORD, _QWORD), const void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  Class isa;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, NSObject *);
  void (*v27)(char *, void (*)(_QWORD, _QWORD), uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(_QWORD, _QWORD);
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  os_log_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const void *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  Class v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  os_log_t v79;
  const void *v80;
  uint64_t v81;
  void (*v82)(_QWORD, _QWORD);
  uint64_t aBlock[5];
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v82 = a3;
  v69 = a1;
  v70 = a2;
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v71 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v75 = (char *)&v68 - v9;
  v10 = type metadata accessor for URLRequest(0);
  isa = v10[-1].isa;
  v12 = __chkstk_darwin(v10);
  v68 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v68 - v14;
  v16 = sub_1000073FC(&qword_10003AE08);
  v17 = __chkstk_darwin(v16);
  v74 = (uint64_t)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v68 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v68 - v22;
  v24 = swift_allocObject(&unk_100035900, 24, 7);
  *(_QWORD *)(v24 + 16) = a4;
  v25 = swift_allocObject(&unk_100035928, 32, 7);
  *(_QWORD *)(v25 + 16) = sub_10001B7A4;
  *(_QWORD *)(v25 + 24) = v24;
  v77 = v25;
  v81 = (uint64_t)isa;
  v26 = (void (*)(char *, uint64_t, uint64_t, NSObject *))*((_QWORD *)isa + 7);
  v79 = v10;
  v26(v23, 1, 1, v10);
  type metadata accessor for CertificateManager(0);
  v72 = v6;
  v73 = v5;
  v27 = *(void (**)(char *, void (*)(_QWORD, _QWORD), uint64_t))(v6 + 16);
  v28 = v75;
  v27(v75, v82, v5);
  _Block_copy(a4);
  v80 = a4;
  _Block_copy(a4);
  v78 = v24;
  swift_retain(v24);
  URLRequest.init(url:cachePolicy:timeoutInterval:)(v28, 0, 60.0);
  v29 = v76;
  sub_10000C610((uint64_t)v21);
  if (v29)
  {
    v76 = v23;
    (*(void (**)(char *, os_log_t))(v81 + 8))(v15, v79);
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v30 = type metadata accessor for Logger(0);
    sub_1000073A0(v30, (uint64_t)qword_10003B2D0);
    v31 = v71;
    v32 = v73;
    v27(v71, v82, v73);
    swift_errorRetain(v29);
    v33 = swift_errorRetain(v29);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.error.getter();
    v36 = os_log_type_enabled(v34, v35);
    v37 = v77;
    if (v36)
    {
      v38 = swift_slowAlloc(22, -1);
      v81 = swift_slowAlloc(8, -1);
      v82 = (void (*)(_QWORD, _QWORD))swift_slowAlloc(32, -1);
      aBlock[0] = (uint64_t)v82;
      *(_DWORD *)v38 = 136315394;
      v79 = v34;
      v39 = sub_100009054(&qword_10003AC98, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v40 = dispatch thunk of CustomStringConvertible.description.getter(v32, v39);
      v42 = v41;
      v85 = sub_10002A370(v40, v41, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86);
      swift_bridgeObjectRelease(v42);
      (*(void (**)(char *, uint64_t))(v72 + 8))(v31, v32);
      *(_WORD *)(v38 + 12) = 2112;
      swift_errorRetain(v29);
      v43 = _swift_stdlib_bridgeErrorToNSError(v29);
      v85 = v43;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86);
      v44 = v81;
      *(_QWORD *)v81 = v43;
      swift_errorRelease(v29);
      swift_errorRelease(v29);
      v34 = v79;
      _os_log_impl((void *)&_mh_execute_header, v79, v35, "RefreshCertificate error: Failed to add Authorization Headers for endpoint %s error: %@", (uint8_t *)v38, 0x16u);
      v45 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v44, 1, v45);
      swift_slowDealloc(v44, -1, -1);
      v46 = v82;
      swift_arrayDestroy(v82, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1, -1);
      swift_slowDealloc(v38, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v72 + 8))(v31, v32);
      swift_errorRelease(v29);
      swift_errorRelease(v29);
    }

    v57 = v80;
    v23 = v76;
    v58 = sub_1000073B8();
    v59 = swift_allocError(&_s5ErrorON, v58, 0, 0);
    *(_QWORD *)v60 = 3;
    *(_OWORD *)(v60 + 8) = 0u;
    *(_OWORD *)(v60 + 24) = 0u;
    *(_BYTE *)(v60 + 40) = 5;
    _Block_copy(v57);
    sub_100019A34(v59, (uint64_t)v57);
    _Block_release(v57);
    swift_errorRelease(v59);
    swift_errorRelease(v29);
  }
  else
  {
    v48 = v69;
    v47 = v70;
    v49 = v68;
    v50 = v81;
    v51 = v15;
    v52 = v79;
    v82 = *(void (**)(_QWORD, _QWORD))(v81 + 8);
    v82(v51, v79);
    sub_1000090DC((uint64_t)v23, &qword_10003AE08);
    sub_10001B6C0((uint64_t)v21, (uint64_t)v23);
    v53 = v74;
    sub_10001B75C((uint64_t)v23, v74, &qword_10003AE08);
    if ((*(unsigned int (**)(uint64_t, uint64_t, os_log_t))(v50 + 48))(v53, 1, v52) == 1)
    {
      sub_1000090DC(v74, &qword_10003AE08);
      v54 = sub_1000073B8();
      v55 = swift_allocError(&_s5ErrorON, v54, 0, 0);
      *(_QWORD *)v56 = 3;
      *(_OWORD *)(v56 + 8) = 0u;
      *(_OWORD *)(v56 + 24) = 0u;
      *(_BYTE *)(v56 + 40) = 5;
      v57 = v80;
      _Block_copy(v80);
      sub_100019A34(v55, (uint64_t)v57);
      _Block_release(v57);
      swift_errorRelease(v55);
      v37 = v77;
    }
    else
    {
      (*(void (**)(char *, uint64_t, os_log_t))(v81 + 32))(v49, v74, v52);
      sub_100008F50(v48, v47);
      URLRequest.httpBody.setter(v48, v47);
      URLRequest.httpMethod.setter(1414745936, 0xE400000000000000);
      v61 = objc_msgSend((id)objc_opt_self(NSURLSessionConfiguration), "ephemeralSessionConfiguration");
      v62 = objc_msgSend((id)objc_opt_self(NSURLSession), "sessionWithConfiguration:", v61);

      v63 = URLRequest._bridgeToObjectiveC()().super.isa;
      v64 = swift_allocObject(&unk_100035950, 32, 7);
      v37 = v77;
      *(_QWORD *)(v64 + 16) = sub_10001B74C;
      *(_QWORD *)(v64 + 24) = v37;
      aBlock[4] = (uint64_t)sub_10001B7A0;
      v84 = v64;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000171FC;
      aBlock[3] = (uint64_t)&unk_100035968;
      v65 = _Block_copy(aBlock);
      v66 = v84;
      swift_retain(v37);
      swift_release(v66);
      v67 = objc_msgSend(v62, "dataTaskWithRequest:completionHandler:", v63, v65);
      _Block_release(v65);

      objc_msgSend(v67, "resume");
      v82(v49, v52);
      v57 = v80;
    }
  }
  sub_1000090DC((uint64_t)v23, &qword_10003AE08);
  swift_release(v78);
  swift_release(v37);
  _Block_release(v57);
}

void sub_10001A4B0(__SecCertificate *a1, __SecIdentity *a2, int a3, void *aBlock, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  OSStatus v35;
  __SecKey *v36;
  CFDataRef v37;
  const __CFData *v38;
  CFDataRef v39;
  CFDataRef v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  unint64_t v64;
  uint64_t v65;
  OSStatus v66;
  int v67;
  CFErrorRef error;
  SecKeyRef privateKeyRef;

  privateKeyRef = 0;
  _Block_copy(aBlock);
  v35 = SecIdentityCopyPrivateKey(a2, &privateKeyRef);
  if (v35 || !privateKeyRef)
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v43 = type metadata accessor for Logger(0);
    v44 = sub_1000073A0(v43, (uint64_t)qword_10003B2D0);
    v45 = Logger.logObject.getter(v44);
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v47 = 67109120;
      v66 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67);
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "RefreshCertificate error: Failed to copy Private Key from Signing Identity: %d", v47, 8u);
      swift_slowDealloc(v47, -1, -1);
    }

    v48 = sub_1000073B8();
    v49 = swift_allocError(&_s5ErrorON, v48, 0, 0);
    *(_QWORD *)v50 = 15;
    *(_OWORD *)(v50 + 8) = 0u;
    *(_OWORD *)(v50 + 24) = 0u;
    *(_BYTE *)(v50 + 40) = 5;
    v51 = (void *)_convertErrorToNSError(_:)(v49);
    (*((void (**)(void *, void *))aBlock + 2))(aBlock, v51);
  }
  else
  {
    v36 = privateKeyRef;
    v37 = SecCertificateCopyData(a1);
    if (v37)
    {
      error = 0;
      v38 = v37;
      v39 = SecKeyCreateSignature(v36, kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512, v38, &error);
      if (v39)
      {
        v40 = v39;
        static Data._unconditionallyBridgeFromObjectiveC(_:)(v39);
        v42 = v41;

        __asm { BR              X10 }
      }
      if (qword_10003A9C8 != -1)
        swift_once(&qword_10003A9C8, sub_100016B08);
      v59 = type metadata accessor for Logger(0);
      v60 = sub_1000073A0(v59, (uint64_t)qword_10003B2D0);
      v61 = Logger.logObject.getter(v60);
      v62 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v61, v62))
      {
        v63 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v63 = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "RefreshCertificate error: Failed to sign the certificate", v63, 2u);
        swift_slowDealloc(v63, -1, -1);
      }

      v64 = sub_1000073B8();
      v49 = swift_allocError(&_s5ErrorON, v64, 0, 0);
      *(_QWORD *)v65 = 15;
      *(_OWORD *)(v65 + 8) = 0u;
      *(_OWORD *)(v65 + 24) = 0u;
      *(_BYTE *)(v65 + 40) = 5;
      v51 = (void *)_convertErrorToNSError(_:)(v49);
      (*((void (**)(void *, void *))aBlock + 2))(aBlock, v51);

    }
    else
    {
      if (qword_10003A9C8 != -1)
        swift_once(&qword_10003A9C8, sub_100016B08);
      v52 = type metadata accessor for Logger(0);
      v53 = sub_1000073A0(v52, (uint64_t)qword_10003B2D0);
      v54 = Logger.logObject.getter(v53);
      v55 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v56 = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "RefreshCertificate error: Failed to copy data from revoking certificate", v56, 2u);
        swift_slowDealloc(v56, -1, -1);
      }

      v57 = sub_1000073B8();
      v49 = swift_allocError(&_s5ErrorON, v57, 0, 0);
      *(_QWORD *)v58 = 10;
      *(_OWORD *)(v58 + 8) = 0u;
      *(_OWORD *)(v58 + 24) = 0u;
      *(_BYTE *)(v58 + 40) = 5;
      v51 = (void *)_convertErrorToNSError(_:)(v49);
      (*((void (**)(void *, void *))aBlock + 2))(aBlock, v51);

    }
  }

  swift_errorRelease(v49);
  _Block_release(aBlock);
}

uint64_t sub_10001AF3C(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(const void *, void *))
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  _QWORD *v46;
  void (*v47)(char *, _QWORD *);
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void (*v57)(char *, uint64_t, _QWORD *);
  char *v58;
  char *v59;
  _QWORD *v60;
  unint64_t v61;
  id v62;
  void (*v63)(char *, _QWORD *);
  id v64;
  Class isa;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  void (**v79)(const void *, void *);
  char *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t aBlock[5];
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v83 = a3;
  v72 = a2;
  v75 = a1;
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v76 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v72 - v9;
  v11 = type metadata accessor for URLRequest(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v73 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v72 - v15;
  v17 = sub_1000073FC(&qword_10003AE08);
  v18 = __chkstk_darwin(v17);
  v74 = (uint64_t)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v72 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v72 - v23;
  v25 = swift_allocObject(&unk_100035888, 24, 7);
  v81 = (_QWORD *)v11;
  v82 = v25;
  *(_QWORD *)(v25 + 16) = a4;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v24, 1, 1, v11);
  type metadata accessor for CertificateManager(0);
  v77 = v6;
  v78 = v5;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v26(v10, v83, v5);
  v79 = a4;
  _Block_copy(a4);
  URLRequest.init(url:cachePolicy:timeoutInterval:)(v10, 0, 60.0);
  v27 = v80;
  sub_10000C610((uint64_t)v22);
  if (v27)
  {
    v80 = v24;
    (*(void (**)(char *, _QWORD *))(v12 + 8))(v16, v81);
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v28 = type metadata accessor for Logger(0);
    sub_1000073A0(v28, (uint64_t)qword_10003B2D0);
    v29 = v76;
    v30 = v78;
    v26(v76, v83, v78);
    swift_errorRetain(v27);
    v31 = swift_errorRetain(v27);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = swift_slowAlloc(22, -1);
      v81 = (_QWORD *)swift_slowAlloc(8, -1);
      v83 = swift_slowAlloc(32, -1);
      aBlock[0] = v83;
      *(_DWORD *)v34 = 136315394;
      v35 = sub_100009054(&qword_10003AC98, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v36 = dispatch thunk of CustomStringConvertible.description.getter(v30, v35);
      v38 = v37;
      v86 = sub_10002A370(v36, v37, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87);
      swift_bridgeObjectRelease(v38);
      (*(void (**)(char *, uint64_t))(v77 + 8))(v29, v30);
      *(_WORD *)(v34 + 12) = 2112;
      swift_errorRetain(v27);
      v39 = _swift_stdlib_bridgeErrorToNSError(v27);
      v86 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87);
      v40 = v81;
      *v81 = v39;
      swift_errorRelease(v27);
      swift_errorRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "RefreshCertificate error: Failed to add Authorization Headers for endpoint %s error: %@", (uint8_t *)v34, 0x16u);
      v41 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v40, 1, v41);
      swift_slowDealloc(v40, -1, -1);
      v42 = v83;
      swift_arrayDestroy(v83, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v42, -1, -1);
      swift_slowDealloc(v34, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v77 + 8))(v29, v30);
      swift_errorRelease(v27);
      swift_errorRelease(v27);
    }

    v24 = v80;
    v53 = sub_1000073B8();
    v54 = swift_allocError(&_s5ErrorON, v53, 0, 0);
    *(_QWORD *)v55 = 3;
    *(_OWORD *)(v55 + 8) = 0u;
    *(_OWORD *)(v55 + 24) = 0u;
    *(_BYTE *)(v55 + 40) = 5;
    v56 = (void *)_convertErrorToNSError(_:)(v54);
    v79[2](v79, v56);

    swift_errorRelease(v54);
    swift_errorRelease(v27);
  }
  else
  {
    v43 = v75;
    v44 = v73;
    v45 = v16;
    v46 = v81;
    v47 = *(void (**)(char *, _QWORD *))(v12 + 8);
    v47(v45, v81);
    sub_1000090DC((uint64_t)v24, &qword_10003AE08);
    sub_10001B6C0((uint64_t)v22, (uint64_t)v24);
    v48 = v74;
    sub_10001B75C((uint64_t)v24, v74, &qword_10003AE08);
    if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v12 + 48))(v48, 1, v46) == 1)
    {
      sub_1000090DC(v48, &qword_10003AE08);
      v49 = sub_1000073B8();
      v50 = swift_allocError(&_s5ErrorON, v49, 0, 0);
      *(_QWORD *)v51 = 3;
      *(_OWORD *)(v51 + 8) = 0u;
      *(_OWORD *)(v51 + 24) = 0u;
      *(_BYTE *)(v51 + 40) = 5;
      v52 = (void *)_convertErrorToNSError(_:)(v50);
      v79[2](v79, v52);

      swift_errorRelease(v50);
    }
    else
    {
      v57 = *(void (**)(char *, uint64_t, _QWORD *))(v12 + 32);
      v58 = v44;
      v59 = v44;
      v60 = v81;
      v57(v59, v48, v81);
      v61 = v72;
      sub_100008F50(v43, v72);
      URLRequest.httpBody.setter(v43, v61);
      URLRequest.httpMethod.setter(1414745936, 0xE400000000000000);
      v62 = objc_msgSend((id)objc_opt_self(NSURLSessionConfiguration), "ephemeralSessionConfiguration");
      v63 = v47;
      v64 = objc_msgSend((id)objc_opt_self(NSURLSession), "sessionWithConfiguration:", v62);

      isa = URLRequest._bridgeToObjectiveC()().super.isa;
      v66 = swift_allocObject(&unk_1000358B0, 32, 7);
      v67 = v82;
      *(_QWORD *)(v66 + 16) = sub_10001B6B8;
      *(_QWORD *)(v66 + 24) = v67;
      aBlock[4] = (uint64_t)sub_10001B708;
      v85 = v66;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000171FC;
      aBlock[3] = (uint64_t)&unk_1000358C8;
      v68 = _Block_copy(aBlock);
      v69 = v85;
      swift_retain(v67);
      swift_release(v69);
      v70 = objc_msgSend(v64, "dataTaskWithRequest:completionHandler:", isa, v68);
      _Block_release(v68);

      objc_msgSend(v70, "resume");
      v63(v58, v60);
    }
  }
  sub_1000090DC((uint64_t)v24, &qword_10003AE08);
  return swift_release(v82);
}

uint64_t sub_10001B694()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10001B6B8(uint64_t a1)
{
  uint64_t v1;

  sub_10000CCD0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10001B6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000073FC(&qword_10003AE08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10001B708(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;

  sub_100017DB0(a1, a2, a3, a4, *(void (**)(void))(v4 + 16));
}

uint64_t sub_10001B710(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001B720(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001B728()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B74C(uint64_t a1)
{
  uint64_t v1;

  return sub_1000179D4(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_10001B754(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001718C(a1, a2, a3, a4);
}

uint64_t sub_10001B75C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000073FC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t _s5ErrorOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void sub_10001B7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 - 2 < 3 || a6 == 0)
  {
    swift_bridgeObjectRetain(a2);
  }
  else if (a6 == 1)
  {
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRetain(a5);
  }
}

void _s5ErrorOwxx(uint64_t a1)
{
  sub_10001B868(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

void sub_10001B868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 - 2 < 3 || a6 == 0)
  {
    swift_bridgeObjectRelease(a2);
  }
  else if (a6 == 1)
  {
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a5);
  }
}

uint64_t _s5ErrorOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_10001B7FC(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t _s5ErrorOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_10001B7FC(*(_QWORD *)a2, v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_10001B868(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 _s5ErrorOwtk(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s5ErrorOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  unsigned __int8 v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v3;
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_10001B868(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t _s5ErrorOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s5ErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_10001BAB4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) <= 4u)
    return *(unsigned __int8 *)(a1 + 40);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_10001BAD0(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(_QWORD *)result = a2 - 5;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    LOBYTE(a2) = 5;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *_s5ErrorOMa()
{
  return &_s5ErrorON;
}

void sub_10001BB08()
{
  __int128 *v0;
  __int128 v1;

  sub_10001C068(v0, &v1);
  __asm { BR              X10 }
}

uint64_t sub_10001BB4C()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;
  void *v4;

  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease(0xE000000000000000);
  v1._countAndFlagsBits = v0;
  v1._object = v4;
  String.append(_:)(v1);
  v2._countAndFlagsBits = 0x656C696620;
  v2._object = (void *)0xE500000000000000;
  String.append(_:)(v2);
  return 0x7420656C62616E55;
}

void sub_10001BD98()
{
  JUMPOUT(0x10001BD80);
}

void sub_10001C018()
{
  __int128 *v0;
  _OWORD v1[3];

  sub_10001C068(v0, v1);
  sub_10001BB08();
}

_OWORD *sub_10001C068(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

char *sub_10001C080()
{
  void *v0;
  id v1;
  char *v2;
  id v3;
  id v4;
  id v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  NSObject *v10;
  id v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v1 = objc_allocWithZone((Class)type metadata accessor for KeychainManager());
  v2 = v0;
  v3 = objc_msgSend(v1, "init");
  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CertificateRequestManager()), "init");
  v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CloudAccountManager()), "init");
  v6 = (char *)objc_allocWithZone((Class)type metadata accessor for CloudKitKVSManager());
  v7 = (char *)v5;
  v8 = sub_10001CA5C(0xD000000000000019, 0x800000010002F090, v7, v6);
  *(_QWORD *)&v2[OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_cloudKitKVSManager] = v8;
  v9 = objc_allocWithZone((Class)type metadata accessor for CertificateManager(0));
  v10 = v3;
  v11 = v4;
  v12 = v8;
  v13 = sub_10001CCA4(v10, v11, v12, v9);

  *(_QWORD *)&v2[OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_certificateManager] = v13;
  if (qword_10003A9F0 != -1)
    swift_once(&qword_10003A9F0, sub_10001FC78);
  v14 = (void *)qword_10003B348;
  *(_QWORD *)&v2[OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager] = qword_10003B348;
  v15 = v14;

  v27.receiver = v2;
  v27.super_class = (Class)type metadata accessor for MCCSecretAgentService();
  v16 = objc_msgSendSuper2(&v27, "init");
  v17 = qword_10003A9D8;
  v18 = (char *)v16;
  if (v17 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v19 = type metadata accessor for Logger(0);
  v20 = sub_1000073A0(v19, (uint64_t)qword_10003B300);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "MCCSecretAgentService is initialized", v23, 2u);
    swift_slowDealloc(v23, -1, -1);
    v24 = v7;
    v25 = v10;
    v7 = v18;
  }
  else
  {
    v24 = v21;
    v25 = v18;
    v21 = v10;
  }

  return v18;
}

uint64_t sub_10001C4F0(void *a1, int a2, uint64_t a3, void *aBlock, const char *a5, _QWORD *a6, void (*a7)(uint64_t, uint64_t, uint64_t, void *))
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v12 = _Block_copy(aBlock);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  _Block_copy(v12);
  v16 = a1;
  sub_10001D63C(v13, v15, (uint64_t)v16, v12, a5, a6, a7);
  _Block_release(v12);
  _Block_release(v12);

  return swift_bridgeObjectRelease(v15);
}

uint64_t sub_10001C5DC(void *a1, int a2, char a3, uint64_t a4, void *aBlock, const char *a6, void (*a7)(_QWORD, uint64_t, uint64_t, uint64_t, void *))
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v12 = _Block_copy(aBlock);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  _Block_copy(v12);
  v16 = a1;
  sub_10001D0C8(a3, v13, v15, (uint64_t)v16, v12, a6, a7);
  _Block_release(v12);
  _Block_release(v12);

  return swift_bridgeObjectRelease(v15);
}

void sub_10001C81C(void *a1, int a2, void *aBlock, const char *a4, _QWORD *a5, void (*a6)(uint64_t, void *))
{
  void *v10;
  id v11;

  v10 = _Block_copy(aBlock);
  _Block_copy(v10);
  v11 = a1;
  sub_10001D770((uint64_t)v11, v10, a4, a5, a6);
  _Block_release(v10);
  _Block_release(v10);

}

id sub_10001C9C4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCCSecretAgentService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MCCSecretAgentService()
{
  return objc_opt_self(_TtC15icloudmailagent21MCCSecretAgentService);
}

char *sub_10001CA5C(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  uint64_t v7;
  char *v8;
  id v9;
  char *v10;
  NSString v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char *v16;
  id v17;
  uint64_t v18;
  char *result;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  objc_super v25;

  v7 = OBJC_IVAR___CloudKitKVSManager_keyValueStore;
  *(_QWORD *)&a4[OBJC_IVAR___CloudKitKVSManager_keyValueStore] = 0;
  v8 = &a4[OBJC_IVAR___CloudKitKVSManager_storeIdentifier];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  v9 = objc_allocWithZone((Class)NSUbiquitousKeyValueStore);
  v10 = a4;
  swift_bridgeObjectRetain(a2);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = objc_msgSend(v9, "initWithStoreIdentifier:type:", v11, 2);

  v13 = *(void **)&a4[v7];
  *(_QWORD *)&a4[v7] = v12;

  *(_QWORD *)&v10[OBJC_IVAR___CloudKitKVSManager_cloudAccountManager] = a3;
  swift_unknownObjectRetain(a3);

  v25.receiver = v10;
  v25.super_class = (Class)type metadata accessor for CloudKitKVSManager();
  v14 = objc_msgSendSuper2(&v25, "init");
  v15 = (void *)objc_opt_self(NSNotificationCenter);
  v16 = (char *)v14;
  v17 = objc_msgSend(v15, "defaultCenter");
  v18 = OBJC_IVAR___CloudKitKVSManager_keyValueStore;
  objc_msgSend(v17, "addObserver:selector:name:object:", v16, "handleStoreDidChangeExternally:", NSUbiquitousKeyValueStoreDidChangeExternallyNotification, *(_QWORD *)&v16[OBJC_IVAR___CloudKitKVSManager_keyValueStore]);

  result = *(char **)&v16[v18];
  if (result)
  {
    if ((objc_msgSend(result, "synchronize") & 1) != 0)
    {
      v20 = v16;
    }
    else
    {
      if (qword_10003A9D0 != -1)
        swift_once(&qword_10003A9D0, sub_100016B30);
      v21 = type metadata accessor for Logger(0);
      sub_1000073A0(v21, (uint64_t)qword_10003B2E8);
      v22 = Logger.logObject.getter();
      v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "KVS failed to synchronize", v24, 2u);
        swift_slowDealloc(v24, -1, -1);
      }

      v20 = a3;
      a3 = v16;
    }

    return v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10001CCA4(void *a1, void *a2, void *a3, void *a4)
{
  char *v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v7 = a4;
  URL.init(string:)(0xD00000000000003ALL, 0x800000010002F0B0);
  URL.init(string:)(0xD00000000000003DLL, 0x800000010002F0F0);
  URL.init(string:)(0xD000000000000031, 0x800000010002F130);
  *(_QWORD *)&v7[OBJC_IVAR___CertificateManager_keychainManager] = a1;
  *(_QWORD *)&v7[OBJC_IVAR___CertificateManager_certificateRequestManager] = a2;
  *(_QWORD *)&v7[OBJC_IVAR___CertificateManager_cloudKVSManager] = a3;
  v8 = a1;
  v9 = a2;
  v10 = a3;

  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for CertificateManager(0);
  return objc_msgSendSuper2(&v12, "init");
}

void sub_10001CDB4(void *a1, uint64_t a2, void *aBlock)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  char *v11;

  _Block_copy(aBlock);
  if (qword_10003A9D8 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_1000073A0(v6, (uint64_t)qword_10003B300);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "MCCSecretAgentService generateCertificateWithContext is called", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = *(char **)(a2 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_certificateManager);
  _Block_copy(aBlock);
  sub_10000F66C(a1, v11, (void (**)(_QWORD, _QWORD))aBlock);
  _Block_release(aBlock);
  _Block_release(aBlock);
}

void sub_10001CECC(uint64_t a1, unint64_t a2, uint64_t a3, void *aBlock)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  char *v14;
  NSString v15;
  uint64_t v16;
  uint64_t v17;

  _Block_copy(aBlock);
  if (qword_10003A9D8 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v8 = type metadata accessor for Logger(0);
  sub_1000073A0(v8, (uint64_t)qword_10003B300);
  v9 = swift_bridgeObjectRetain_n(a2, 2);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v17 = v13;
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain(a2);
    v16 = sub_10002A370(a1, a2, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "MCCSecretAgentService listCertificatesWithEmail is called for email: %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  v14 = *(char **)(a3 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_certificateManager);
  v15 = String._bridgeToObjectiveC()();
  _Block_copy(aBlock);
  sub_100013598(v15, v14, (uint8_t *)aBlock);
  _Block_release(aBlock);

  _Block_release(aBlock);
}

void sub_10001D0C8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, void *aBlock, const char *a6, void (*a7)(_QWORD, uint64_t, uint64_t, uint64_t, void *))
{
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;

  _Block_copy(aBlock);
  if (qword_10003A9D8 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v14 = type metadata accessor for Logger(0);
  v15 = sub_1000073A0(v14, (uint64_t)qword_10003B300);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, a6, v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  v19 = *(_QWORD *)(a4 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_cloudKitKVSManager);
  _Block_copy(aBlock);
  a7(a1 & 1, a2, a3, v19, aBlock);
  _Block_release(aBlock);
  _Block_release(aBlock);
}

void sub_10001D204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *aBlock)
{
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  _Block_copy(aBlock);
  if (qword_10003A9D8 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_1000073A0(v10, (uint64_t)qword_10003B300);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "MCCSecretAgentService updateCertificateDefaultsForEmailAddress is called", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = *(_QWORD *)(a4 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_certificateManager);
  _Block_copy(aBlock);
  sub_100013DEC(a1, a2, a3, v15, (uint64_t)aBlock);
  _Block_release(aBlock);
  _Block_release(aBlock);
}

void sub_10001D334(void *a1, int a2, int a3, uint64_t a4, void *aBlock)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  char *v13;
  NSString v14;

  _Block_copy(aBlock);
  if (qword_10003A9D8 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_1000073A0(v8, (uint64_t)qword_10003B300);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "RefreshCertificate MCCSecretAgentService refreshCertificateWithContext is called", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  v13 = *(char **)(a4 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_certificateManager);
  v14 = String._bridgeToObjectiveC()();
  _Block_copy(aBlock);
  sub_100014278(a1, (uint64_t)v14, v13, aBlock);
  _Block_release(aBlock);

  _Block_release(aBlock);
}

void sub_10001D474(void *a1, uint64_t a2, void *aBlock)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  Class isa;
  void *v17;

  _Block_copy(aBlock);
  if (qword_10003A9D8 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_1000073A0(v6, (uint64_t)qword_10003B300);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "predictCommerceEmail MCCSecretAgentService predictCommerceEmailWithContext called", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = *(_QWORD *)(a2 + OBJC_IVAR____TtC15icloudmailagent21MCCSecretAgentService_categorizationManager);
  v17 = &_swiftEmptyDictionarySingleton;
  v12 = objc_autoreleasePoolPush();
  _Block_copy(aBlock);
  sub_1000215FC(v11, a1, (uint64_t)&v17, (void (**)(_QWORD, _QWORD, _QWORD))aBlock);
  objc_autoreleasePoolPop(v12);
  v13 = v17;
  v14 = swift_bridgeObjectRetain(v17);
  v15 = sub_10002283C(v14);
  swift_bridgeObjectRelease(v13);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*((void (**)(void *, Class, _QWORD))aBlock + 2))(aBlock, isa, 0);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v15);

  _Block_release(aBlock);
}

void sub_10001D63C(uint64_t a1, uint64_t a2, uint64_t a3, void *aBlock, const char *a5, _QWORD *a6, void (*a7)(uint64_t, uint64_t, uint64_t, void *))
{
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;

  _Block_copy(aBlock);
  if (qword_10003A9D8 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v14 = type metadata accessor for Logger(0);
  v15 = sub_1000073A0(v14, (uint64_t)qword_10003B300);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, a5, v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  v19 = *(_QWORD *)(a3 + *a6);
  _Block_copy(aBlock);
  a7(a1, a2, v19, aBlock);
  _Block_release(aBlock);
  _Block_release(aBlock);
}

void sub_10001D770(uint64_t a1, void *aBlock, const char *a3, _QWORD *a4, void (*a5)(uint64_t, void *))
{
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  _Block_copy(aBlock);
  if (qword_10003A9D8 != -1)
    swift_once(&qword_10003A9D8, sub_100016B48);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_1000073A0(v10, (uint64_t)qword_10003B300);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, a3, v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = *(_QWORD *)(a1 + *a4);
  _Block_copy(aBlock);
  a5(v15, aBlock);
  _Block_release(aBlock);
  _Block_release(aBlock);
}

uint64_t sub_10001D890(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  CFTypeRef v12;
  CFTypeRef v13;
  _QWORD v14[4];
  CFTypeRef v15;

  v3 = SecIdentityCreate(kCFAllocatorDefault, a1, a2);
  if (!v3)
  {
    v10 = sub_1000073B8();
    swift_allocError(&_s5ErrorON, v10, 0, 0);
    *(_QWORD *)v11 = 0xD000000000000011;
    *(_QWORD *)(v11 + 8) = 0x800000010002F1F0;
    *(_QWORD *)(v11 + 24) = 0;
    *(_QWORD *)(v11 + 32) = 0;
    *(_QWORD *)(v11 + 16) = &_mh_execute_header;
    *(_BYTE *)(v11 + 40) = 2;
    swift_willThrow();
    return v2;
  }
  v4 = (void *)v3;
  v15 = 0;
  type metadata accessor for SecIdentity(0);
  v14[3] = v5;
  v14[0] = v4;
  v6 = v4;
  LODWORD(v2) = sub_10001F030((uint64_t)v14, &v15);
  result = sub_100009180(v14);
  if ((_DWORD)v2)
  {
    v2 = v2;
    v8 = sub_1000073B8();
    swift_allocError(&_s5ErrorON, v8, 0, 0);
    *(_OWORD *)v9 = xmmword_10002C410;
    *(_QWORD *)(v9 + 24) = 0;
    *(_QWORD *)(v9 + 32) = 0;
    *(_QWORD *)(v9 + 16) = v2;
    *(_BYTE *)(v9 + 40) = 2;
    swift_willThrow();

    swift_unknownObjectRelease(v15);
    return v2;
  }
  v12 = v15;
  if (v15)
  {
    swift_unknownObjectRetain(v15);

    v13 = v12;
    swift_dynamicCast(v14, &v13, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for Data, 7);
    v2 = v14[0];
    swift_unknownObjectRelease(v15);
    return v2;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001DB30(void *a1)
{
  uint64_t v2;
  id v3;
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];

  type metadata accessor for SecCertificate(0);
  v9[3] = v2;
  v9[0] = a1;
  v3 = a1;
  v4 = sub_10001F030((uint64_t)v9, 0);
  result = sub_100009180(v9);
  if (v4)
  {
    if (v4 != -25299)
    {
      v6 = sub_1000073B8();
      v7 = swift_allocError(&_s5ErrorON, v6, 0, 0);
      *(_QWORD *)v8 = 0xD000000000000023;
      *(_QWORD *)(v8 + 8) = 0x800000010002F1C0;
      *(_QWORD *)(v8 + 24) = 0;
      *(_QWORD *)(v8 + 32) = 0;
      *(_QWORD *)(v8 + 16) = v4;
      *(_BYTE *)(v8 + 40) = 2;
      return swift_willThrow(v7);
    }
  }
  return result;
}

Class sub_10001DD9C(void *a1, _QWORD *a2)
{
  uint64_t v2;
  Class result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];

  result = sub_10001E688((void *)kSecClassIdentity);
  if (!v2)
  {
    v6 = (uint64_t)result;
    if (*((_QWORD *)result + 2))
    {
      swift_bridgeObjectRetain(a2);
      v7 = sub_10001F42C(v6, a1, a2);
      swift_bridgeObjectRelease(a2);
      if (*(_QWORD *)(v7 + 16))
      {
        sub_100008EDC(v7 + 32, (uint64_t)&v21);
        swift_bridgeObjectRelease(v7);
        if (*((_QWORD *)&v22 + 1))
        {
          sub_100008F18(&v21, v23);
          sub_100008F18(v23, &v21);
          type metadata accessor for SecIdentity(0);
          swift_dynamicCast(&v20, &v21, (char *)&type metadata for Any + 8, v8, 7);
          return (Class)v20;
        }
      }
      else
      {
        v21 = 0u;
        v22 = 0u;
        swift_bridgeObjectRelease(v7);
      }
      sub_10000B4E8((uint64_t)&v21);
      if (qword_10003A9C8 != -1)
        swift_once(&qword_10003A9C8, sub_100016B08);
      v15 = type metadata accessor for Logger(0);
      v16 = sub_1000073A0(v15, (uint64_t)qword_10003B2D0);
      v11 = Logger.logObject.getter(v16);
      v12 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v11, v12))
        goto LABEL_16;
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      v14 = "RefreshCertificate findSecIdentity error on filtering by certId";
    }
    else
    {
      swift_bridgeObjectRelease(result);
      if (qword_10003A9C8 != -1)
        swift_once(&qword_10003A9C8, sub_100016B08);
      v9 = type metadata accessor for Logger(0);
      v10 = sub_1000073A0(v9, (uint64_t)qword_10003B2D0);
      v11 = Logger.logObject.getter(v10);
      v12 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v11, v12))
        goto LABEL_16;
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      v14 = "RefreshCertificate No certificate available";
    }
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v14, v13, 2u);
    swift_slowDealloc(v13, -1, -1);
LABEL_16:

    v17 = sub_1000073B8();
    v18 = swift_allocError(&_s5ErrorON, v17, 0, 0);
    *(_QWORD *)v19 = 14;
    *(_OWORD *)(v19 + 8) = 0u;
    *(_OWORD *)(v19 + 24) = 0u;
    *(_BYTE *)(v19 + 40) = 5;
    return (Class)swift_willThrow(v18);
  }
  return result;
}

void sub_10001E0DC(void *a1)
{
  void *v1;
  uint64_t v2;
  CFTypeID v4;
  id v5;
  id v6;
  uint64_t v7;
  Swift::String v8;
  void *object;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = CFGetTypeID(a1);
  if (v4 == SecIdentityGetTypeID())
  {
    v5 = v1;
    v6 = a1;
    v7 = sub_100016D44((uint64_t)v5, (uint64_t)v6);

    if (!v2)
    {
      v14 = v7;
      swift_dynamicCast(&v13, &v14, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for Data, 7);
    }
  }
  else
  {
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease(0xE000000000000000);
    CFGetTypeID(a1);
    v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt, &protocol witness table for UInt);
    object = v8._object;
    String.append(_:)(v8);
    swift_bridgeObjectRelease(object);
    v10 = sub_1000073B8();
    v11 = swift_allocError(&_s5ErrorON, v10, 0, 0);
    *(_QWORD *)v12 = 0xD00000000000002FLL;
    *(_QWORD *)(v12 + 8) = 0x800000010002F190;
    *(_QWORD *)(v12 + 24) = 0;
    *(_QWORD *)(v12 + 32) = 0;
    *(_QWORD *)(v12 + 16) = &_mh_execute_header;
    *(_BYTE *)(v12 + 40) = 2;
    swift_willThrow(v11);
  }
}

uint64_t sub_10001E244(CFTypeRef *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  const __CFDictionary *v18;
  uint64_t v19;

  v5 = sub_1000073FC(&qword_10003AF18);
  v6 = swift_allocObject(v5, 352, 7);
  *(_OWORD *)(v6 + 16) = xmmword_10002C420;
  type metadata accessor for CFString(0);
  v8 = v7;
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 32) = kSecUseDataProtectionKeychain;
  *(_BYTE *)(v6 + 64) = 1;
  *(_QWORD *)(v6 + 120) = v7;
  *(_QWORD *)(v6 + 88) = &type metadata for Bool;
  *(_QWORD *)(v6 + 96) = kSecAttrSynchronizable;
  *(_BYTE *)(v6 + 128) = 1;
  *(_QWORD *)(v6 + 152) = &type metadata for Bool;
  *(_QWORD *)(v6 + 160) = kSecAttrAccessGroup;
  v9 = *(_QWORD *)(a2 + OBJC_IVAR___KeychainManager_keychainAccessGroup);
  v10 = *(_QWORD *)(a2 + OBJC_IVAR___KeychainManager_keychainAccessGroup + 8);
  *(_QWORD *)(v6 + 184) = v7;
  *(_QWORD *)(v6 + 192) = v9;
  *(_QWORD *)(v6 + 200) = v10;
  *(_QWORD *)(v6 + 248) = v7;
  *(_QWORD *)(v6 + 216) = &type metadata for String;
  *(_QWORD *)(v6 + 224) = kSecValueRef;
  type metadata accessor for SecIdentity(0);
  *(_QWORD *)(v6 + 256) = a3;
  *(_QWORD *)(v6 + 312) = v8;
  *(_QWORD *)(v6 + 280) = v11;
  *(_QWORD *)(v6 + 288) = kSecReturnPersistentRef;
  *(_QWORD *)(v6 + 344) = &type metadata for Bool;
  *(_BYTE *)(v6 + 320) = 1;
  sub_10001EFF4();
  v12 = (id)kSecUseDataProtectionKeychain;
  v13 = (id)kSecAttrSynchronizable;
  v14 = (id)kSecAttrAccessGroup;
  swift_bridgeObjectRetain(v10);
  v15 = (id)kSecValueRef;
  v16 = a3;
  v17 = (id)kSecReturnPersistentRef;
  v18 = (const __CFDictionary *)NSDictionary.init(dictionaryLiteral:)(v6);
  v19 = SecItemCopyMatching(v18, a1);

  return v19;
}

uint64_t sub_10001E48C(CFTypeRef *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFDictionary *v11;
  uint64_t v12;

  v6 = sub_1000073FC(&qword_10003AF18);
  v7 = swift_allocObject(v6, 160, 7);
  *(_OWORD *)(v7 + 16) = xmmword_10002C230;
  type metadata accessor for CFString(0);
  *(_QWORD *)(v7 + 32) = kSecValuePersistentRef;
  *(_QWORD *)(v7 + 56) = v8;
  *(_QWORD *)(v7 + 64) = a2;
  *(_QWORD *)(v7 + 72) = a3;
  *(_QWORD *)(v7 + 120) = v8;
  *(_QWORD *)(v7 + 88) = &type metadata for Data;
  *(_QWORD *)(v7 + 96) = kSecReturnRef;
  *(_QWORD *)(v7 + 152) = &type metadata for Bool;
  *(_BYTE *)(v7 + 128) = 1;
  sub_10001EFF4();
  v9 = (id)kSecValuePersistentRef;
  sub_100008F50(a2, a3);
  v10 = (id)kSecReturnRef;
  v11 = (const __CFDictionary *)NSDictionary.init(dictionaryLiteral:)(v7);
  v12 = SecItemCopyMatching(v11, a1);

  return v12;
}

Class sub_10001E688(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  unint64_t v16;
  NSDictionary v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFTypeRef v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  Class v28;
  objc_class *v30;
  CFTypeRef result;
  _BYTE v32[272];

  v3 = sub_1000073FC(&qword_10003AE28);
  inited = swift_initStackObject(v3, v32);
  *(_OWORD *)(inited + 16) = xmmword_10002C430;
  *(_QWORD *)(inited + 32) = kSecClass;
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 40) = a1;
  *(_QWORD *)(inited + 64) = v5;
  *(_QWORD *)(inited + 72) = kSecUseDataProtectionKeychain;
  *(_BYTE *)(inited + 80) = 1;
  *(_QWORD *)(inited + 104) = &type metadata for Bool;
  *(_QWORD *)(inited + 112) = kSecAttrSynchronizable;
  *(_BYTE *)(inited + 120) = 1;
  *(_QWORD *)(inited + 144) = &type metadata for Bool;
  *(_QWORD *)(inited + 152) = kSecAttrAccessGroup;
  v6 = *(_QWORD *)(v1 + OBJC_IVAR___KeychainManager_keychainAccessGroup);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___KeychainManager_keychainAccessGroup + 8);
  *(_QWORD *)(inited + 160) = v6;
  *(_QWORD *)(inited + 168) = v7;
  *(_QWORD *)(inited + 184) = &type metadata for String;
  *(_QWORD *)(inited + 192) = kSecMatchLimit;
  *(_QWORD *)(inited + 200) = kSecMatchLimitAll;
  *(_QWORD *)(inited + 224) = v5;
  *(_QWORD *)(inited + 232) = kSecReturnRef;
  *(_QWORD *)(inited + 264) = &type metadata for Bool;
  *(_BYTE *)(inited + 240) = 1;
  v8 = (id)kSecClass;
  v9 = a1;
  v10 = (id)kSecUseDataProtectionKeychain;
  v11 = (id)kSecAttrSynchronizable;
  v12 = (id)kSecAttrAccessGroup;
  swift_bridgeObjectRetain(v7);
  v13 = (id)kSecMatchLimit;
  v14 = (id)kSecMatchLimitAll;
  v15 = (id)kSecReturnRef;
  v16 = sub_100024ABC(inited);
  result = 0;
  sub_10001EABC();
  v17.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  v18 = SecItemCopyMatching(v17.super.isa, &result);

  if (v18)
  {
    v19 = v18;
    v20 = sub_1000073B8();
    v21 = swift_allocError(&_s5ErrorON, v20, 0, 0);
    *(_OWORD *)v22 = xmmword_10002C440;
    *(_QWORD *)(v22 + 24) = 0;
    *(_QWORD *)(v22 + 32) = 0;
    *(_QWORD *)(v22 + 16) = v19;
    *(_BYTE *)(v22 + 40) = 2;
    swift_willThrow(v21);
    swift_unknownObjectRelease(result);
    return v17.super.isa;
  }
  v23 = result;
  if (!result)
    return (Class)_swiftEmptyArrayStorage;
  type metadata accessor for CFArray(0);
  v25 = v24;
  v26 = swift_unknownObjectRetain(v23);
  v30 = 0;
  v27 = (id)swift_dynamicCastUnknownClassUnconditional(v26, v25, 0, 0, 0);
  v28 = (Class)static Array._forceBridgeFromObjectiveC(_:result:)(v27, &v30, (char *)&type metadata for Any + 8);
  v17.super.isa = v30;
  if (v30)
  {
    swift_unknownObjectRelease(v23);

    return v17.super.isa;
  }
  __break(1u);
  return v28;
}

id sub_10001EA58()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KeychainManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for KeychainManager()
{
  return objc_opt_self(KeychainManager);
}

unint64_t sub_10001EABC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003AB38;
  if (!qword_10003AB38)
  {
    type metadata accessor for CFString(255);
    result = swift_getWitnessTable(&unk_10002C174, v1);
    atomic_store(result, (unint64_t *)&qword_10003AB38);
  }
  return result;
}

uint64_t sub_10001EB04(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_10001EB24(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001EB44(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10001EB98(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10001EB60(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10001ED00(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10001EB7C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10001EE6C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_10001EB98(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000073FC(&qword_10003AA98);
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
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001ED00(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000073FC(&qword_10003AF28);
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
    swift_arrayInitWithCopy(v14, v15, v8, (char *)&type metadata for Any + 8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001EE6C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v18;
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
    v10 = sub_1000073FC(&qword_10003ACB0);
    v11 = (_QWORD *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 8 * v8)
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 8 * v8 || v14 >= v15 + 8 * v8)
  {
    v18 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v18);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

unint64_t sub_10001EFF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003AF20;
  if (!qword_10003AF20)
  {
    v1 = objc_opt_self(NSDictionary);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003AF20);
  }
  return result;
}

uint64_t sub_10001F030(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  unint64_t v14;
  const __CFDictionary *isa;
  uint64_t v16;
  _BYTE v18[232];

  v5 = sub_1000073FC(&qword_10003AE28);
  inited = swift_initStackObject(v5, v18);
  *(_OWORD *)(inited + 16) = xmmword_10002C420;
  *(_QWORD *)(inited + 32) = kSecValueRef;
  sub_100008EDC(a1, inited + 40);
  *(_QWORD *)(inited + 72) = kSecUseDataProtectionKeychain;
  *(_BYTE *)(inited + 80) = 1;
  *(_QWORD *)(inited + 104) = &type metadata for Bool;
  *(_QWORD *)(inited + 112) = kSecAttrSynchronizable;
  *(_BYTE *)(inited + 120) = 1;
  *(_QWORD *)(inited + 144) = &type metadata for Bool;
  *(_QWORD *)(inited + 152) = kSecAttrAccessGroup;
  v7 = *(_QWORD *)(v2 + OBJC_IVAR___KeychainManager_keychainAccessGroup);
  v8 = *(_QWORD *)(v2 + OBJC_IVAR___KeychainManager_keychainAccessGroup + 8);
  *(_QWORD *)(inited + 160) = v7;
  *(_QWORD *)(inited + 168) = v8;
  *(_QWORD *)(inited + 184) = &type metadata for String;
  *(_QWORD *)(inited + 192) = kSecReturnPersistentRef;
  *(_QWORD *)(inited + 224) = &type metadata for Bool;
  *(_BYTE *)(inited + 200) = 1;
  v9 = (id)kSecValueRef;
  v10 = (id)kSecUseDataProtectionKeychain;
  v11 = (id)kSecAttrSynchronizable;
  v12 = (id)kSecAttrAccessGroup;
  swift_bridgeObjectRetain(v8);
  v13 = (id)kSecReturnPersistentRef;
  v14 = sub_100024ABC(inited);
  type metadata accessor for CFString(0);
  sub_10001EABC();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  v16 = SecItemAdd(isa, a2);

  return v16;
}

void sub_10001F1A8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __SecIdentity *v8;
  OSStatus v9;
  SecCertificateRef v10;
  void (*v11)(uint64_t, __SecCertificate *, _QWORD);
  __SecCertificate *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  OSStatus v22;
  uint64_t v23;
  SecCertificateRef certificateRef;

  sub_100008F50(a1, a2);
  v6 = sub_100016CF4(a1, a2);
  sub_100008F94(a1, a2);
  type metadata accessor for SecIdentity(0);
  v8 = (__SecIdentity *)swift_dynamicCastUnknownClassUnconditional(v6, v7, 0, 0, 0);
  noErr.getter();
  certificateRef = 0;
  v9 = SecIdentityCopyCertificate(v8, &certificateRef);
  v10 = certificateRef;
  if (noErr.getter() == v9)
  {
    v11 = *(void (**)(uint64_t, __SecCertificate *, _QWORD))(a3 + 16);
    v12 = v10;
    v11(a3, v12, 0);

  }
  else
  {
    if (qword_10003A9C8 != -1)
      swift_once(&qword_10003A9C8, sub_100016B08);
    v13 = type metadata accessor for Logger(0);
    v14 = sub_1000073A0(v13, (uint64_t)qword_10003B2D0);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v17 = 67109120;
      v22 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Error copying certificate (status %d)", v17, 8u);
      swift_slowDealloc(v17, -1, -1);
    }

    v18 = sub_1000073B8();
    v19 = swift_allocError(&_s5ErrorON, v18, 0, 0);
    *(_QWORD *)v20 = 9;
    *(_OWORD *)(v20 + 8) = 0u;
    *(_OWORD *)(v20 + 24) = 0u;
    *(_BYTE *)(v20 + 40) = 5;
    swift_willThrow(v19);

    swift_errorRetain(v19);
    v21 = (void *)_convertErrorToNSError(_:)(v19);
    (*(void (**)(uint64_t, _QWORD, void *))(a3 + 16))(a3, 0, v21);

    swift_errorRelease(v19);
    swift_errorRelease(v19);
  }
}

uint64_t sub_10001F42C(uint64_t result, void *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __SecIdentity *v11;
  void *v12;
  _QWORD *v13;
  char v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __SecIdentity *v19;
  _OWORD v20[2];
  _OWORD v21[2];
  _QWORD *v22;

  v4 = result;
  v5 = _swiftEmptyArrayStorage;
  v22 = _swiftEmptyArrayStorage;
  v18 = *(_QWORD *)(result + 16);
  if (v18)
  {
    v8 = 0;
    v9 = result + 32;
    while (1)
    {
      if (v8 >= *(_QWORD *)(v4 + 16))
      {
        __break(1u);
        return result;
      }
      sub_100008EDC(v9, (uint64_t)v21);
      sub_100008EDC((uint64_t)v21, (uint64_t)v20);
      type metadata accessor for SecIdentity(0);
      swift_dynamicCast(&v19, v20, (char *)&type metadata for Any + 8, v10, 7);
      v11 = v19;
      v12 = sub_1000071C4(v19);
      v5 = v13;

      if (v3)
      {
        sub_100009180(v21);
        swift_bridgeObjectRelease(v4);
        swift_release(v22);
        return (uint64_t)v5;
      }
      if (v12 == a2 && v5 == a3)
        break;
      v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v5, a2, a3, 0);
      swift_bridgeObjectRelease(v5);
      if ((v14 & 1) != 0)
        goto LABEL_11;
      result = sub_100009180(v21);
LABEL_4:
      ++v8;
      v9 += 32;
      if (v18 == v8)
      {
        v5 = v22;
        goto LABEL_18;
      }
    }
    swift_bridgeObjectRelease(a3);
LABEL_11:
    sub_100008F18(v21, v20);
    v15 = v22;
    if ((swift_isUniquelyReferenced_nonNull_native(v22) & 1) == 0)
    {
      sub_10001EB60(0, v15[2] + 1, 1);
      v15 = v22;
    }
    v17 = v15[2];
    v16 = v15[3];
    if (v17 >= v16 >> 1)
    {
      sub_10001EB60(v16 > 1, v17 + 1, 1);
      v15 = v22;
    }
    v15[2] = v17 + 1;
    result = (uint64_t)sub_100008F18(v20, &v15[4 * v17 + 4]);
    goto LABEL_4;
  }
LABEL_18:
  swift_bridgeObjectRelease(v4);
  return (uint64_t)v5;
}

void sub_10001F62C(void *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  Class isa;
  Class v10;

  v10 = sub_10001DD9C(a1, a2);
  sub_10001E0DC(v10);
  v6 = v5;
  v8 = v7;
  sub_100008F50(v5, v7);
  isa = Data._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class, _QWORD))(a4 + 16))(a4, isa, 0);

  sub_100008F94(v6, v8);
  sub_100008F94(v6, v8);

}

_BYTE *_s5ErrorOwCP_0(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s5ErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s5ErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001F990 + 4 * byte_10002C475[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10001F9C4 + 4 * asc_10002C470[v4]))();
}

uint64_t sub_10001F9C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001F9CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001F9D4);
  return result;
}

uint64_t sub_10001F9E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001F9E8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_10001F9EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001F9F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001FA00(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10001FA08(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *_s5ErrorOMa_0()
{
  return &_s5ErrorON_0;
}

uint64_t sub_10001FA24(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10001FA5C + 4 * byte_10002C47A[a1]))(0xD000000000000018, 0x800000010002F2F0);
}

uint64_t sub_10001FA5C(uint64_t a1)
{
  return a1 + 4;
}

BOOL sub_10001FAB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10001FAC4()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10001FB08()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10001FB30()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10001FB70()
{
  unsigned __int8 *v0;

  return sub_10001FA24(*v0);
}

unint64_t sub_10001FB7C()
{
  unint64_t result;

  result = qword_10003AF30;
  if (!qword_10003AF30)
  {
    result = swift_getWitnessTable(&unk_10002C510, &_s5ErrorON_0);
    atomic_store(result, (unint64_t *)&qword_10003AF30);
  }
  return result;
}

uint64_t sub_10001FBC0(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;
  _OWORD v9[2];

  v3 = v2;
  if (*(_QWORD *)(a1 + 24))
  {
    sub_100008F18((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
    v8 = *v2;
    *v2 = 0x8000000000000000;
    sub_1000284D0(v9, a2, isUniquelyReferenced_nonNull_native);
    v6 = *v2;
    *v3 = v8;

    return swift_bridgeObjectRelease(v6);
  }
  else
  {
    sub_1000090DC(a1, &qword_10003B1E0);
    sub_100027318((uint64_t)a2, v9);

    return sub_1000090DC((uint64_t)v9, &qword_10003B1E0);
  }
}

id sub_10001FC78()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CategorizationManager()), "init");
  qword_10003B348 = (uint64_t)result;
  return result;
}

id sub_10001FCE4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)NSLock), "init");
  qword_10003AF58 = (uint64_t)result;
  return result;
}

uint64_t sub_10001FD14()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for DispatchTime(0);
  sub_100016C14(v0, qword_10003AF60);
  v1 = sub_1000073A0(v0, (uint64_t)qword_10003AF60);
  return static DispatchTime.now()(v1);
}

uint64_t sub_10001FD5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100024830(0, &qword_10003B028, OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter();
  v15 = _swiftEmptyArrayStorage;
  v10 = sub_100009054(&qword_10003B030, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v11 = sub_1000073FC(&qword_10003B038);
  v12 = sub_100023894(&qword_10003B040, &qword_10003B038);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v15, v11, v12, v4, v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002ELL, 0x800000010002F3F0, v9, v6, v3, 0);
  qword_10003AF78 = result;
  return result;
}

NSObject *sub_10001FF28()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  uint64_t (**v4)();
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject **v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v19;
  objc_super v20;

  *(_QWORD *)&v0[OBJC_IVAR___CategorizationManager_transactionId] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CategorizationManager_clientConnections] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v0[OBJC_IVAR___CategorizationManager_pendingRules] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v0[OBJC_IVAR___CategorizationManager_pingTimer] = 0;
  v1 = OBJC_IVAR___CategorizationManager_closureLock;
  v2 = objc_allocWithZone((Class)NSLock);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, "init");
  v4 = (uint64_t (**)())&v3[OBJC_IVAR___CategorizationManager_nextNlpTimeout];
  *v4 = sub_1000208AC;
  v4[1] = 0;

  v5 = qword_10003AF40;
  qword_10003AF40 = 0;
  swift_release(v5);
  v6 = qword_10003AF48;
  qword_10003AF48 = 0;
  swift_unknownObjectRelease(v6);
  v20.receiver = v3;
  v20.super_class = (Class)type metadata accessor for CategorizationManager();
  v7 = objc_msgSendSuper2(&v20, "init");
  v8 = qword_10003A9E8;
  v9 = v7;
  if (v8 != -1)
    swift_once(&qword_10003A9E8, sub_100016C54);
  v10 = type metadata accessor for Logger(0);
  sub_1000073A0(v10, (uint64_t)qword_10003B330);
  v11 = v9;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412290;
    v19 = v11;
    v16 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20);
    *v15 = v11;

    _os_log_impl((void *)&_mh_execute_header, v12, v13, "CategorizationManager %@ initialised", v14, 0xCu);
    v17 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v15, 1, v17);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {

    v12 = v11;
  }

  return v11;
}

void sub_1000201A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;

  v1 = OBJC_IVAR___CategorizationManager_pingTimer;
  if (!*(_QWORD *)(v0 + OBJC_IVAR___CategorizationManager_pingTimer))
  {
    v2 = v0;
    if (qword_10003A9E8 != -1)
      swift_once(&qword_10003A9E8, sub_100016C54);
    v3 = type metadata accessor for Logger(0);
    v4 = sub_1000073A0(v3, (uint64_t)qword_10003B330);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "creating client-notification timer", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    v8 = (void *)objc_opt_self(NSTimer);
    v9 = swift_allocObject(&unk_100035C08, 24, 7);
    swift_unknownObjectWeakInit(v9 + 16, v2);
    v13[4] = sub_1000238D4;
    v14 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_100015800;
    v13[3] = &unk_100035C48;
    v10 = _Block_copy(v13);
    swift_release(v14);
    v11 = objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 1, v10, 300.0);
    _Block_release(v10);
    v12 = *(void **)(v2 + v1);
    *(_QWORD *)(v2 + v1) = v11;

  }
}

void sub_100020354(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char v28[24];
  char v29[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v29, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (char *)Strong;
    v23 = OBJC_IVAR___CategorizationManager_closureLock;
    objc_msgSend(*(id *)(Strong + OBJC_IVAR___CategorizationManager_closureLock), "lock");
    v24 = v4;
    v5 = (uint64_t *)&v4[OBJC_IVAR___CategorizationManager_clientConnections];
    swift_beginAccess(&v4[OBJC_IVAR___CategorizationManager_clientConnections], v28, 0, 0);
    v6 = *v5;
    if (!((unint64_t)*v5 >> 62))
    {
      v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
    while (1)
    {
      if (v6 < 0)
        v21 = v6;
      else
        v21 = v6 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v6);
      v7 = _CocoaArrayWrapper.endIndex.getter(v21);
      swift_bridgeObjectRelease(v6);
LABEL_4:
      if (qword_10003A9E8 != -1)
        swift_once(&qword_10003A9E8, sub_100016C54);
      v8 = type metadata accessor for Logger(0);
      v9 = sub_1000073A0(v8, (uint64_t)qword_10003B330);
      v10 = Logger.logObject.getter(v9);
      v11 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v12 = 134217984;
        v26 = v7;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "notify [%ld clients]", v12, 0xCu);
        swift_slowDealloc(v12, -1, -1);
      }

      v6 = *v5;
      if ((unint64_t)*v5 >> 62)
      {
        if (v6 < 0)
          v22 = *v5;
        else
          v22 = v6 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain_n(v6, 2);
        v5 = (uint64_t *)_CocoaArrayWrapper.endIndex.getter(v22);
        if (!v5)
        {
LABEL_29:
          swift_bridgeObjectRelease_n(v6, 2);
          objc_msgSend(*(id *)&v24[v23], "unlock");

          return;
        }
      }
      else
      {
        v5 = *(uint64_t **)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n(v6, 2);
        if (!v5)
          goto LABEL_29;
      }
      v13 = 4;
      v14 = 0;
      if ((v6 & 0xC000000000000001) != 0)
      {
LABEL_11:
        v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, v6);
        goto LABEL_13;
      }
      while (1)
      {
        v15 = *(id *)(v6 + 8 * v13);
LABEL_13:
        v16 = v15;
        v17 = (uint64_t *)(v14 + 1);
        if (__OFADD__(v14, 1))
          break;
        v18 = objc_msgSend(v15, "remoteObjectProxy");
        _bridgeAnyObjectToAny(_:)(&v26, v18);
        swift_unknownObjectRelease(v18);
        v19 = sub_1000073FC(&qword_10003AFD8);
        if (swift_dynamicCast(&v25, &v26, (char *)&type metadata for Any + 8, v19, 6))
        {
          v20 = v25;
          objc_msgSend(v25, "agentIsAlive");

          swift_unknownObjectRelease(v20);
          if (v17 == v5)
            goto LABEL_29;
        }
        else
        {

          if (v17 == v5)
            goto LABEL_29;
        }
        v14 = ++v13 - 4;
        if ((v6 & 0xC000000000000001) != 0)
          goto LABEL_11;
      }
      __break(1u);
    }
  }
}

uint64_t sub_100020698()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (qword_10003A9F8 != -1)
    swift_once(&qword_10003A9F8, sub_10001FCE4);
  objc_msgSend((id)qword_10003AF58, "lock");
  sub_1000209AC();
  if (qword_10003AF40)
  {
    if (qword_10003A9E8 != -1)
      swift_once(&qword_10003A9E8, sub_100016C54);
    v0 = type metadata accessor for Logger(0);
    v1 = sub_1000073A0(v0, (uint64_t)qword_10003B330);
    v2 = Logger.logObject.getter(v1);
    v3 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "CategorizationManager NLP not nil, returning it", v4, 2u);
      swift_slowDealloc(v4, -1, -1);
    }

  }
  else
  {
    if (qword_10003A9E8 != -1)
      swift_once(&qword_10003A9E8, sub_100016C54);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_1000073A0(v5, (uint64_t)qword_10003B330);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "CategorizationManager NLP nil, creating it", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    v10 = type metadata accessor for MCCNLP(0);
    swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
    v11 = MCCNLP.init()();
    v12 = qword_10003AF40;
    qword_10003AF40 = v11;
    swift_release(v12);
  }
  v13 = qword_10003AF40;
  v14 = (void *)qword_10003AF58;
  swift_retain(qword_10003AF40);
  objc_msgSend(v14, "unlock");
  return v13;
}

uint64_t sub_1000208AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v0 = type metadata accessor for DispatchTimeInterval(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (uint64_t *)((char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for DispatchTime(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DispatchTime.now()(v6);
  *v3 = 30;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for DispatchTimeInterval.seconds(_:), v0);
  DispatchTime.advanced(by:)(v3);
  (*(void (**)(_QWORD *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

void sub_1000209AC()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, _QWORD, uint64_t);
  char *v57;
  char *v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD aBlock[5];
  uint64_t v81;

  v1 = v0;
  v2 = type metadata accessor for DispatchTimeInterval(0);
  v68 = *(_QWORD *)(v2 - 8);
  v69 = v2;
  v3 = __chkstk_darwin(v2);
  v67 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v66 = (char *)&v65 - v5;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v74 = *(_QWORD *)(v6 - 8);
  v75 = v6;
  __chkstk_darwin(v6);
  v73 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v71 = *(_QWORD *)(v8 - 8);
  v72 = v8;
  __chkstk_darwin(v8);
  v70 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for OS_dispatch_source.TimerFlags(0);
  v77 = *(_QWORD *)(v10 - 8);
  v78 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchTime(0);
  v79 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = qword_10003AF50;
  if (qword_10003AF50)
  {
    ObjectType = swift_getObjectType(qword_10003AF50);
    swift_unknownObjectRetain(v16);
    if ((OS_dispatch_source.isCancelled.getter(ObjectType) & 1) == 0)
    {
      if (qword_10003A9E8 != -1)
        swift_once(&qword_10003A9E8, sub_100016C54);
      v18 = type metadata accessor for Logger(0);
      v19 = sub_1000073A0(v18, (uint64_t)qword_10003B330);
      v20 = Logger.logObject.getter(v19);
      v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "CategorizationManager NLP timer cancelled (old)", v22, 2u);
        swift_slowDealloc(v22, -1, -1);
      }

      OS_dispatch_source.cancel()();
    }
    swift_unknownObjectRelease(v16);
  }
  if (qword_10003A9E8 != -1)
    swift_once(&qword_10003A9E8, sub_100016C54);
  v23 = type metadata accessor for Logger(0);
  v65 = sub_1000073A0(v23, (uint64_t)qword_10003B330);
  v24 = Logger.logObject.getter(v65);
  v25 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "CategorizationManager NLP timer being created", v26, 2u);
    swift_slowDealloc(v26, -1, -1);
  }

  if (qword_10003AA00 != -1)
    swift_once(&qword_10003AA00, sub_10001FD14);
  v27 = sub_1000073A0(v13, (uint64_t)qword_10003AF60);
  v28 = *(void (**)(uint64_t))(v1 + OBJC_IVAR___CategorizationManager_nextNlpTimeout);
  v29 = *(_QWORD *)(v1 + OBJC_IVAR___CategorizationManager_nextNlpTimeout + 8);
  v30 = swift_retain(v29);
  v28(v30);
  swift_release(v29);
  swift_beginAccess(v27, aBlock, 33, 0);
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 40))(v27, v15, v13);
  swift_endAccess(aBlock);
  if (!qword_10003AF48)
  {
    v31 = sub_100023588();
    v32 = qword_10003AF48;
    qword_10003AF48 = v31;
    swift_unknownObjectRelease(v32);
  }
  v76 = v13;
  sub_100024830(0, &qword_10003AFF0, OS_dispatch_source_ptr);
  if (qword_10003AA08 != -1)
    swift_once(&qword_10003AA08, sub_10001FD5C);
  v33 = (void *)qword_10003AF78;
  aBlock[0] = _swiftEmptyArrayStorage;
  v34 = sub_100009054(&qword_10003AFF8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_source.TimerFlags, (uint64_t)&protocol conformance descriptor for OS_dispatch_source.TimerFlags);
  v35 = v33;
  v36 = sub_1000073FC(&qword_10003B000);
  v37 = sub_100023894(&qword_10003B008, &qword_10003B000);
  v38 = v36;
  v39 = v78;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v38, v37, v78, v34);
  v40 = static OS_dispatch_source.makeTimerSource(flags:queue:)(v12, v33);

  (*(void (**)(char *, uint64_t))(v77 + 8))(v12, v39);
  v41 = qword_10003AF50;
  qword_10003AF50 = v40;
  swift_unknownObjectRelease(v41);
  v42 = qword_10003AF50;
  if (!qword_10003AF50)
  {
    __break(1u);
    goto LABEL_26;
  }
  v43 = swift_getObjectType(qword_10003AF50);
  v44 = swift_allocObject(&unk_100035C08, 24, 7);
  swift_unknownObjectWeakInit(v44 + 16, v1);
  aBlock[4] = sub_100023874;
  v81 = v44;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015928;
  aBlock[3] = &unk_100035C20;
  v45 = _Block_copy(aBlock);
  swift_retain(v44);
  v46 = swift_unknownObjectRetain(v42);
  v47 = v70;
  static DispatchQoS.unspecified.getter(v46);
  v48 = v73;
  sub_100021210();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v47, v48, v45, v43);
  _Block_release(v45);
  swift_unknownObjectRelease(v42);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v48, v75);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v47, v72);
  v49 = v81;
  swift_release(v44);
  swift_release(v49);
  v50 = qword_10003AF50;
  v51 = v76;
  if (!qword_10003AF50)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v52 = swift_getObjectType(qword_10003AF50);
  v53 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v15, v27, v51);
  v55 = v68;
  v54 = v69;
  v56 = *(void (**)(char *, _QWORD, uint64_t))(v68 + 104);
  v57 = v66;
  v56(v66, enum case for DispatchTimeInterval.never(_:), v69);
  v58 = v67;
  *(_QWORD *)v67 = 5;
  v56(v58, enum case for DispatchTimeInterval.seconds(_:), v54);
  swift_unknownObjectRetain(v50);
  OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)(v15, v57, v58, v52);
  swift_unknownObjectRelease(v50);
  v59 = *(void (**)(char *, uint64_t))(v55 + 8);
  v59(v58, v54);
  v59(v57, v54);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v15, v51);
  v60 = qword_10003AF50;
  if (!qword_10003AF50)
  {
LABEL_27:
    __break(1u);
    return;
  }
  swift_getObjectType(qword_10003AF50);
  swift_unknownObjectRetain(v60);
  OS_dispatch_source.resume()();
  v61 = swift_unknownObjectRelease(v60);
  v62 = Logger.logObject.getter(v61);
  v63 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v64 = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "CategorizationManager NLP timer created", v64, 2u);
    swift_slowDealloc(v64, -1, -1);
  }

}

void sub_10002110C(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  _BYTE v8[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    sub_1000212BC();
  }
  else
  {
    if (qword_10003A9E8 != -1)
      swift_once(&qword_10003A9E8, sub_100016C54);
    v4 = type metadata accessor for Logger(0);
    v5 = sub_1000073A0(v4, (uint64_t)qword_10003B330);
    v3 = Logger.logObject.getter(v5);
    v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v6, "CategorizationManager NLP timer failure to create", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }
  }

}

uint64_t sub_100021210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  v0 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = _swiftEmptyArrayStorage;
  v1 = sub_100009054(&qword_10003B010, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v2 = sub_1000073FC(&qword_10003B018);
  v3 = sub_100023894(&qword_10003B020, &qword_10003B018);
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

id sub_1000212BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v27[24];

  v0 = type metadata accessor for DispatchTime(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = &v27[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v2);
  v6 = &v27[-v5 - 8];
  if (qword_10003A9E8 != -1)
    swift_once(&qword_10003A9E8, sub_100016C54);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_1000073A0(v7, (uint64_t)qword_10003B330);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "CategorizationManager NLP timer triggered", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  if (qword_10003A9F8 != -1)
    swift_once(&qword_10003A9F8, sub_10001FCE4);
  objc_msgSend((id)qword_10003AF58, "lock");
  if (qword_10003AA00 != -1)
    swift_once(&qword_10003AA00, sub_10001FD14);
  v12 = sub_1000073A0(v0, (uint64_t)qword_10003AF60);
  swift_beginAccess(v12, v27, 0, 0);
  v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v12, v0);
  static DispatchTime.now()(v13);
  v14 = sub_100009054(&qword_10003AFE8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchTime, (uint64_t)&protocol conformance descriptor for DispatchTime);
  v15 = dispatch thunk of static Comparable.< infix(_:_:)(v4, v6, v0, v14);
  v16 = *(void (**)(char *, uint64_t))(v1 + 8);
  v16(v4, v0);
  v17 = ((uint64_t (*)(char *, uint64_t))v16)(v6, v0);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.debug.getter();
  v20 = os_log_type_enabled(v18, v19);
  if ((v15 & 1) != 0)
  {
    if (v20)
    {
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "CategorizationManager NLP timer extended", v21, 2u);
      swift_slowDealloc(v21, -1, -1);
    }

    sub_1000209AC();
  }
  else
  {
    if (v20)
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "CategorizationManager NLP timer expired", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    v23 = qword_10003AF40;
    qword_10003AF40 = 0;
    swift_release(v23);
    v24 = qword_10003AF48;
    qword_10003AF48 = 0;
    swift_unknownObjectRelease(v24);
  }
  return objc_msgSend((id)qword_10003AF58, "unlock");
}

void sub_1000215FC(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  unint64_t v26;
  id v27;
  NSString v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  unint64_t v34;
  id v35;
  void *v36;
  unint64_t v37;
  id v38;
  void *v39;
  unint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  char *v46;
  uint64_t v47;
  id v48;
  _QWORD *v49;
  uint64_t v50;
  id v51;
  _QWORD *v52;
  id v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  id v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  id v63;
  _QWORD *v64;
  id v65;
  _QWORD *v66;
  id v67;
  _QWORD *v68;
  id v69;
  double v70;
  id v71;
  char *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(char *, unint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSString v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  void *v90;
  id v91;
  id v92;
  char *v93;
  void *object;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  id v99;
  void *v100;
  _QWORD *v101;
  id v102;
  void *v103;
  _QWORD *v104;
  id v105;
  void *v106;
  _QWORD *v107;
  id v108;
  void *v109;
  _QWORD *v110;
  uint64_t v111;
  void *v112;
  id v113;
  void *v114;
  _QWORD *v115;
  uint64_t v116;
  id v117;
  Swift::Int v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  uint64_t v122;
  void *v123;
  id v124;
  void *v125;
  _QWORD *v126;
  uint64_t v127;
  id v128;
  Swift::Int v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  void *v134;
  id v135;
  void *v136;
  _QWORD *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  id v141;
  void *v142;
  _QWORD *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t, uint64_t);
  int v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  uint64_t v158;
  char *v159;
  void *v160;
  _QWORD *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  const void *v166;
  unint64_t v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  char *v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  char *v191;
  uint64_t v192;
  unint64_t v193;
  _QWORD *v194;
  uint64_t v195;

  v8 = sub_1000073FC(&qword_10003B090);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v163 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v178 = (char *)&v163 - v12;
  v186 = type metadata accessor for BlackPearlVersion(0);
  v184 = *(_QWORD *)(v186 - 8);
  __chkstk_darwin(v186);
  v185 = (char *)&v163 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ReasonCode(0);
  v192 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v16 = (char *)&v163 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for CategoryTS(0);
  v182 = *(_QWORD *)(v17 - 8);
  v183 = v17;
  __chkstk_darwin(v17);
  v181 = (char *)&v163 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v188 = type metadata accessor for Category(0);
  v180 = *(_QWORD *)(v188 - 8);
  __chkstk_darwin(v188);
  v179 = (char *)&v163 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for DecisionRequest(0);
  v176 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v190 = (char *)&v163 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v177 = type metadata accessor for DecisionResult(0);
  v175 = *(_QWORD *)(v177 - 8);
  __chkstk_darwin(v177);
  v191 = (char *)&v163 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100020698();
  if (!v23)
  {
    v27 = objc_allocWithZone((Class)NSError);
    v28 = String._bridgeToObjectiveC()();
    v29 = objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, -1, 0);

    v30 = v29;
    v31 = (void *)_convertErrorToNSError(_:)(v30);
    ((void (**)(_QWORD, _QWORD, void *))a4)[2](a4, 0, v31);

    _Block_release(a4);
    return;
  }
  v189 = v23;
  if ((((uint64_t (*)(void))dispatch thunk of MCCNLP.isModelPresetLoaded.getter)() & 1) == 0)
    dispatch thunk of MCCNLP.scheduleImmediateDownload()();
  v24 = objc_msgSend(a2, "senderName");
  if (v24)
  {
    v25 = v24;
    v174 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v173 = v26;

  }
  else
  {
    v174 = 0;
    v173 = 0xE000000000000000;
  }
  v32 = objc_msgSend(a2, "senderEmail");
  if (v32)
  {
    v33 = v32;
    v172 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    v171 = v34;

  }
  else
  {
    v172 = 0;
    v171 = 0xE000000000000000;
  }
  v35 = objc_msgSend(a2, "emailSubject");
  v165 = v4;
  if (v35)
  {
    v36 = v35;
    v170 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
    v169 = v37;

  }
  else
  {
    v170 = 0;
    v169 = 0xE000000000000000;
  }
  v38 = objc_msgSend(a2, "receiverEmail");
  v166 = a4;
  v163 = v11;
  v164 = v20;
  if (v38)
  {
    v39 = v38;
    v168 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
    v167 = v40;

  }
  else
  {
    v168 = 0;
    v167 = 0xE000000000000000;
  }
  v41 = objc_msgSend(a2, "isUnsubscribeHeaderPresent", v163);
  v42 = objc_msgSend(a2, "isSenderVIP");
  v43 = objc_msgSend(a2, "isSenderInAddressBook");
  v44 = objc_msgSend(a2, "isSenderRecentContact");
  v45 = objc_msgSend(a2, "isSenderPrimary");
  BYTE5(v162) = objc_msgSend(a2, "isNonPersonalAccount");
  BYTE4(v162) = v45;
  BYTE3(v162) = v44;
  BYTE2(v162) = v43;
  BYTE1(v162) = v42;
  LOBYTE(v162) = v41;
  v46 = v190;
  v47 = DecisionRequest.init(senderName:senderEmail:emailSubject:receiverEmail:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:isNonPersonalAccount:)(v174, v173, v172, v171, v170, v169, v168, v167, v162);
  if ((dispatch thunk of MCCNLP.isModelPresetLoaded.getter(v47) & 1) != 0)
  {
    dispatch thunk of MCCNLP.predictCommerceEmail(decisionRequest:)(v46);
  }
  else
  {
    type metadata accessor for DecisionResultBuilder(0);
    static DecisionResultBuilder.buildCategorizationNotReadyResult()();
  }
  v48 = kDecisionCommerceKey;
  v49 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", DecisionResult.commerce.getter() & 1);
  v50 = sub_100024830(0, &qword_10003B098, NSNumber_ptr);
  v195 = v50;
  v194 = v49;
  sub_10001FBC0((uint64_t)&v194, v48);
  v51 = kDecisionTimeSensitiveKey;
  v52 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", DecisionResult.timesensitive.getter() & 1);
  v195 = v50;
  v194 = v52;
  sub_10001FBC0((uint64_t)&v194, v51);
  v53 = kDecisionSubCategoryKey;
  v54 = v179;
  DecisionResult.subCategory.getter();
  static Category.getCategoryText(for:)(v54);
  v56 = v55;
  (*(void (**)(char *, uint64_t))(v180 + 8))(v54, v188);
  v57 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v56);
  v188 = sub_100024830(0, (unint64_t *)&qword_10003B080, NSString_ptr);
  v195 = v188;
  v194 = v57;
  sub_10001FBC0((uint64_t)&v194, v53);
  v58 = kDecisionSubCategoryTSKey;
  v59 = v181;
  v60 = DecisionResult.subCategoryTS.getter();
  v61 = CategoryTS.rawValue.getter(v60);
  (*(void (**)(char *, uint64_t))(v182 + 8))(v59, v183);
  v62 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v61);
  v195 = v50;
  v194 = v62;
  sub_10001FBC0((uint64_t)&v194, v58);
  v63 = kDecisionScoreKey;
  v64 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", DecisionResult.score.getter());
  v195 = v50;
  v194 = v64;
  sub_10001FBC0((uint64_t)&v194, v63);
  v65 = kDecisionSenderScoreKey;
  v66 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", DecisionResult.senderScore.getter());
  v195 = v50;
  v194 = v66;
  sub_10001FBC0((uint64_t)&v194, v65);
  v67 = kDecisionTSScoreKey;
  v68 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", DecisionResult.tsScore.getter());
  v195 = v50;
  v194 = v68;
  sub_10001FBC0((uint64_t)&v194, v67);
  v69 = kDecisionTSCategoryScoreKey;
  v70 = DecisionResult.tsCategoryScore.getter();
  v71 = objc_allocWithZone((Class)NSNumber);
  v72 = v191;
  v73 = objc_msgSend(v71, "initWithDouble:", v70);
  v195 = v50;
  v194 = v73;
  v74 = sub_10001FBC0((uint64_t)&v194, v69);
  v193 = (unint64_t)_swiftEmptyArrayStorage;
  v75 = DecisionResult.reasonCodes.getter(v74);
  v76 = *(_QWORD *)(v75 + 16);
  v187 = a3;
  if (v76)
  {
    v77 = (*(unsigned __int8 *)(v192 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v192 + 80);
    v183 = v75;
    v78 = v75 + v77;
    v79 = *(_QWORD *)(v192 + 72);
    v80 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v192 + 16);
    do
    {
      v81 = v80(v16, v78, v14);
      ReasonCode.rawValue.getter(v81);
      v83 = v82;
      v84 = String._bridgeToObjectiveC()();
      v85 = swift_bridgeObjectRelease(v83);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v85);
      v87 = *(_QWORD *)((v193 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v86 = *(_QWORD *)((v193 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v87 >= v86 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v86 > 1, v87 + 1, 1);
      v88 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v87, v84);
      specialized Array._endMutation()(v88);
      (*(void (**)(char *, uint64_t))(v192 + 8))(v16, v14);
      v78 += v79;
      --v76;
    }
    while (v76);
    swift_bridgeObjectRelease(v183);
    v89 = (_QWORD *)v193;
    v72 = v191;
  }
  else
  {
    swift_bridgeObjectRelease(v75);
    v89 = _swiftEmptyArrayStorage;
  }
  v90 = (void *)kDecisionReasonCodesKey;
  v195 = sub_1000073FC((uint64_t *)&unk_10003B0A0);
  v194 = v89;
  v91 = v90;
  swift_bridgeObjectRetain(v89);
  sub_10001FBC0((uint64_t)&v194, v91);
  v92 = kDecisionBPModelVersionKey;
  v93 = v185;
  ((void (*)(void))DecisionResult.blackPearlVersion.getter)();
  object = BlackPearlVersion.getBlackPearlModelVersion()()._object;
  v95 = *(void (**)(char *, uint64_t))(v184 + 8);
  v96 = v186;
  v95(v93, v186);
  v97 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v98 = v188;
  v195 = v188;
  v194 = v97;
  sub_10001FBC0((uint64_t)&v194, v92);
  v99 = kDecisionBPSenderModelVersionKey;
  ((void (*)(void))DecisionResult.blackPearlVersion.getter)();
  v100 = BlackPearlVersion.getBlackPearlSenderModelVersion()()._object;
  v95(v93, v96);
  v101 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v100);
  v195 = v98;
  v194 = v101;
  sub_10001FBC0((uint64_t)&v194, v99);
  v102 = kDecisionBPTSModelVersionKey;
  ((void (*)(void))DecisionResult.blackPearlVersion.getter)();
  v103 = BlackPearlVersion.getBlackPearlTSModelVersion()()._object;
  v95(v93, v96);
  v104 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v103);
  v195 = v98;
  v194 = v104;
  sub_10001FBC0((uint64_t)&v194, v102);
  v105 = kDecisionBPFinalRuleModelVersionKey;
  ((void (*)(void))DecisionResult.blackPearlVersion.getter)();
  v106 = BlackPearlVersion.getBlackPearlFinalRuleVersion()()._object;
  v95(v93, v96);
  v107 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v106);
  v195 = v98;
  v194 = v107;
  sub_10001FBC0((uint64_t)&v194, v105);
  v108 = kDecisionBPBreakthroughModelVersionKey;
  ((void (*)(void))DecisionResult.blackPearlVersion.getter)();
  v109 = BlackPearlVersion.getBlackPearlBreakthroughVersion()()._object;
  v95(v93, v96);
  v110 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v109);
  v195 = v98;
  v194 = v110;
  v111 = sub_10001FBC0((uint64_t)&v194, v108);
  DecisionResult.blackPearlVersion.getter(v111);
  v112 = BlackPearlVersion.getBlackPearlExperimentId()().value._object;
  v95(v93, v96);
  swift_bridgeObjectRelease(v112);
  if (v112)
  {
    v113 = kDecisionBPExperimentIdKey;
    DecisionResult.blackPearlVersion.getter(v113);
    v114 = BlackPearlVersion.getBlackPearlExperimentId()().value._object;
    v95(v93, v96);
    if (!v114)
    {
      _Block_release(v166);
      __break(1u);
      goto LABEL_49;
    }
    v115 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v114);
    v195 = v98;
    v194 = v115;
  }
  else
  {
    v113 = kDecisionBPExperimentIdKey;
    v116 = NSString.init(stringLiteral:)("", 0, 2);
    v195 = v98;
    v194 = (_QWORD *)v116;
  }
  sub_10001FBC0((uint64_t)&v194, v113);
  v117 = kDecisionBPExperimentDeploymentIdKey;
  DecisionResult.blackPearlVersion.getter(v117);
  v118 = BlackPearlVersion.getBlackPearlDeploymentId()();
  v95(v93, v96);
  v194 = (_QWORD *)v118;
  dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v120 = v119;
  v121 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v120);
  v195 = v98;
  v194 = v121;
  v122 = sub_10001FBC0((uint64_t)&v194, v117);
  DecisionResult.blackPearlVersion.getter(v122);
  v123 = BlackPearlVersion.getBlackPearlTreatmentId()().value._object;
  v95(v93, v96);
  swift_bridgeObjectRelease(v123);
  if (v123)
  {
    v124 = kDecisionBPTreatmentIdKey;
    DecisionResult.blackPearlVersion.getter(v124);
    v125 = BlackPearlVersion.getBlackPearlTreatmentId()().value._object;
    v95(v93, v96);
    if (v125)
    {
      v126 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v125);
      v195 = v98;
      v194 = v126;
      goto LABEL_35;
    }
LABEL_49:
    _Block_release(v166);
    __break(1u);
    goto LABEL_50;
  }
  v124 = kDecisionBPTreatmentIdKey;
  v127 = NSString.init(stringLiteral:)("", 0, 2);
  v195 = v98;
  v194 = (_QWORD *)v127;
LABEL_35:
  sub_10001FBC0((uint64_t)&v194, v124);
  v128 = kDecisionBPRolloutDeploymentIdKey;
  DecisionResult.blackPearlVersion.getter(v128);
  v129 = BlackPearlVersion.getBlackPearlRolloutDeploymentId()();
  v95(v93, v96);
  v194 = (_QWORD *)v129;
  dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v131 = v130;
  v132 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v131);
  v195 = v98;
  v194 = v132;
  v133 = sub_10001FBC0((uint64_t)&v194, v128);
  DecisionResult.blackPearlVersion.getter(v133);
  v134 = BlackPearlVersion.getBlackPearlRolloutFactorPackId()().value._object;
  v95(v93, v96);
  swift_bridgeObjectRelease(v134);
  if (v134)
  {
    v135 = kDecisionBPRolloutFactorPackIdKey;
    DecisionResult.blackPearlVersion.getter(v135);
    v136 = BlackPearlVersion.getBlackPearlRolloutFactorPackId()().value._object;
    v95(v93, v96);
    if (v136)
    {
      v137 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v136);
      v195 = v98;
      v194 = v137;
      goto LABEL_39;
    }
LABEL_50:
    _Block_release(v166);
    __break(1u);
    goto LABEL_51;
  }
  v135 = kDecisionBPRolloutFactorPackIdKey;
  v138 = NSString.init(stringLiteral:)("", 0, 2);
  v195 = v98;
  v194 = (_QWORD *)v138;
LABEL_39:
  v139 = sub_10001FBC0((uint64_t)&v194, v135);
  DecisionResult.blackPearlVersion.getter(v139);
  v140 = BlackPearlVersion.getBlackPearlRolloutId()().value._object;
  v95(v93, v96);
  swift_bridgeObjectRelease(v140);
  if (!v140)
  {
    v141 = kDecisionBPRolloutIdKey;
    v144 = NSString.init(stringLiteral:)("", 0, 2);
    v195 = v98;
    v194 = (_QWORD *)v144;
    goto LABEL_43;
  }
  v141 = kDecisionBPRolloutIdKey;
  DecisionResult.blackPearlVersion.getter(v141);
  v142 = BlackPearlVersion.getBlackPearlRolloutId()().value._object;
  v95(v93, v96);
  if (!v142)
  {
LABEL_51:
    _Block_release(v166);
    __break(1u);
    goto LABEL_52;
  }
  v143 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v142);
  v195 = v98;
  v194 = v143;
LABEL_43:
  v145 = sub_10001FBC0((uint64_t)&v194, v141);
  v146 = DecisionResult.blackPearlVersion.getter(v145);
  v147 = (uint64_t)v178;
  BlackPearlVersion.getBlackPearlCategorizationVersion()(v146);
  v95(v93, v96);
  v148 = type metadata accessor for BlackPearlCategorizationVersion(0);
  v149 = v93;
  v150 = v72;
  v151 = *(_QWORD *)(v148 - 8);
  v152 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v151 + 48);
  v153 = v152(v147, 1, v148);
  sub_1000090DC(v147, &qword_10003B090);
  if (v153 == 1)
  {
    swift_bridgeObjectRelease(v193);
    v154 = kDecisionBPVersionKey;
    v155 = v188;
    v156 = NSString.init(stringLiteral:)("", 0, 2);
    v195 = v155;
    v194 = (_QWORD *)v156;
    sub_10001FBC0((uint64_t)&v194, v154);
    swift_release(v189);
    (*(void (**)(char *, uint64_t))(v176 + 8))(v190, v164);
    (*(void (**)(char *, uint64_t))(v175 + 8))(v150, v177);
LABEL_47:
    _Block_release(v166);
    return;
  }
  v157 = kDecisionBPVersionKey;
  v158 = DecisionResult.blackPearlVersion.getter(v157);
  v159 = v163;
  BlackPearlVersion.getBlackPearlCategorizationVersion()(v158);
  v95(v149, v96);
  if (v152((uint64_t)v159, 1, v148) != 1)
  {
    swift_bridgeObjectRelease(v193);
    v160 = BlackPearlCategorizationVersion.getVersionString()()._object;
    (*(void (**)(char *, uint64_t))(v151 + 8))(v159, v148);
    v161 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v160);
    v195 = v188;
    v194 = v161;
    sub_10001FBC0((uint64_t)&v194, v157);
    swift_release(v189);
    (*(void (**)(char *, uint64_t))(v176 + 8))(v190, v164);
    (*(void (**)(char *, uint64_t))(v175 + 8))(v191, v177);
    goto LABEL_47;
  }
LABEL_52:
  _Block_release(v166);
  __break(1u);
}

uint64_t sub_10002283C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
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
  void *v18;
  uint64_t v19;
  id v20;
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
  _OWORD v38[2];
  _OWORD v39[2];
  uint64_t v40;
  _OWORD v41[2];
  uint64_t v42;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_1000073FC(&qword_10003B078);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
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
    v18 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * v13);
    sub_100008EDC(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v41 + 8);
    *(_QWORD *)&v41[0] = v18;
    v39[0] = v41[0];
    v39[1] = v41[1];
    v40 = v42;
    *(_QWORD *)&v38[0] = v18;
    v19 = sub_100024830(0, (unint64_t *)&qword_10003B080, NSString_ptr);
    v20 = v18;
    swift_dynamicCast(&v30, v38, v19, &type metadata for AnyHashable, 7);
    sub_100008F18((_OWORD *)((char *)v39 + 8), v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_100008F18(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_100008F18(v37, v38);
    sub_100008F18(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
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
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(_QWORD *)(v11 + 32) = v32;
    result = (uint64_t)sub_100008F18(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_100024734(a1);
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

void sub_100022C58(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  void *v6;
  id v7;

  v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);

}

void sub_100022CBC(void *a1)
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

  if (qword_10003A9E8 != -1)
    swift_once(&qword_10003A9E8, sub_100016C54);
  v2 = type metadata accessor for Logger(0);
  sub_1000073A0(v2, (uint64_t)qword_10003B330);
  v9 = a1;
  v3 = Logger.logObject.getter(v9);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v10 = v9;
    v7 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
    *v6 = v9;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Callback connection %@ interrupted", v5, 0xCu);
    v8 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v6, 1, v8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
}

id sub_100022E6C(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  void *v18;
  _BYTE v20[24];
  id v21;
  uint64_t v22;

  if (qword_10003A9E8 != -1)
    swift_once(&qword_10003A9E8, sub_100016C54);
  v4 = type metadata accessor for Logger(0);
  sub_1000073A0(v4, (uint64_t)qword_10003B330);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v21 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Callback connection %@ invalidated", v8, 0xCu);
    v11 = sub_1000073FC(&qword_10003B060);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v12 = *(void **)(a2 + OBJC_IVAR___CategorizationManager_closureLock);
  objc_msgSend(v12, "lock");
  v13 = (uint64_t *)(a2 + OBJC_IVAR___CategorizationManager_clientConnections);
  swift_beginAccess(a2 + OBJC_IVAR___CategorizationManager_clientConnections, &v21, 0, 0);
  v14 = *v13;
  swift_bridgeObjectRetain(*v13);
  v15 = sub_1000230A8((uint64_t)v5, v14);
  v17 = v16;
  swift_bridgeObjectRelease(v14);
  if ((v17 & 1) == 0)
  {
    swift_beginAccess(v13, v20, 33, 0);
    v18 = (void *)sub_100023240(v15);
    swift_endAccess(v20);

  }
  return objc_msgSend(v12, "unlock");
}

uint64_t sub_1000230A8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  char v7;
  unint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;

  v3 = result;
  if ((unint64_t)a2 >> 62)
    goto LABEL_21;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
    }
    else
    {
      if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return result;
      }
      v5 = *(id *)(a2 + 32);
    }
    v6 = v5;
    sub_100024830(0, &qword_10003B068, NSXPCConnection_ptr);
    v7 = static NSObject.== infix(_:_:)(v6, v3);

    if ((v7 & 1) != 0)
      return 0;
    for (i = 0; ; ++i)
    {
      v8 = i + 1;
      if (__OFADD__(i, 1))
        break;
      if (v8 == v4)
        return 0;
      if ((a2 & 0xC000000000000001) != 0)
      {
        v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i + 1, a2);
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0)
          goto LABEL_19;
        if (v8 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_20;
        v10 = *(id *)(a2 + 32 + 8 * v8);
      }
      v11 = v10;
      v12 = static NSObject.== infix(_:_:)(v10, v3);

      if ((v12 & 1) != 0)
        return v8;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    if (a2 < 0)
      v13 = a2;
    else
      v13 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v4 = _CocoaArrayWrapper.endIndex.getter(v13);
    result = swift_bridgeObjectRelease(a2);
  }
  return 0;
}

uint64_t sub_100023240(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  char v13;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    v3 = sub_1000238DC(v3);
    *v1 = v3;
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
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
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      v11 = memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      specialized Array._endMutation()(v11);
      return v10;
    }
  }
  v13 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v13, 1046, 0);
  __break(1u);
  return result;
}

id sub_10002332C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  Class isa;
  uint64_t v13;
  id v15;
  void *v16;
  _QWORD v17[4];
  _BYTE v18[24];

  v15 = *(id *)(v0 + OBJC_IVAR___CategorizationManager_closureLock);
  objc_msgSend(v15, "lock");
  v1 = (uint64_t *)(v0 + OBJC_IVAR___CategorizationManager_clientConnections);
  swift_beginAccess(v1, v18, 0, 0);
  v2 = *v1;
  if ((unint64_t)*v1 >> 62)
    goto LABEL_14;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n(*v1, 2);
  for (; v3; v3 = _CocoaArrayWrapper.endIndex.getter(v13))
  {
    v4 = 4;
    v5 = 0;
    if ((v2 & 0xC000000000000001) != 0)
    {
LABEL_4:
      v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
      goto LABEL_6;
    }
    while (1)
    {
      v6 = *(id *)(v2 + 8 * v4);
LABEL_6:
      v7 = v6;
      v8 = v5 + 1;
      if (__OFADD__(v5, 1))
        break;
      v9 = objc_msgSend(v6, "remoteObjectProxy");
      _bridgeAnyObjectToAny(_:)(v17, v9);
      swift_unknownObjectRelease(v9);
      v10 = sub_1000073FC(&qword_10003AFD8);
      if (swift_dynamicCast(&v16, v17, (char *)&type metadata for Any + 8, v10, 6))
      {
        v11 = v16;
        sub_100024830(0, &qword_10003AFE0, RCWebRule_ptr);
        isa = Array._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v11, "rulesChanged:", isa);

        swift_unknownObjectRelease(v11);
        if (v8 == v3)
          goto LABEL_18;
      }
      else
      {

        if (v8 == v3)
          goto LABEL_18;
      }
      v5 = ++v4 - 4;
      if ((v2 & 0xC000000000000001) != 0)
        goto LABEL_4;
    }
    __break(1u);
LABEL_14:
    if (v2 < 0)
      v13 = v2;
    else
      v13 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(v2, 2);
  }
LABEL_18:
  swift_bridgeObjectRelease_n(v2, 2);
  return objc_msgSend(v15, "unlock");
}

uint64_t sub_100023588()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  Swift::String v11;
  void *object;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;

  v2 = OBJC_IVAR___CategorizationManager_transactionId;
  v3 = *(_QWORD *)&v1[OBJC_IVAR___CategorizationManager_transactionId];
  v4 = __CFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    v0 = v1;
    *(_QWORD *)&v1[OBJC_IVAR___CategorizationManager_transactionId] = v5;
    if (qword_10003A9E8 == -1)
      goto LABEL_3;
  }
  swift_once(&qword_10003A9E8, sub_100016C54);
LABEL_3:
  v6 = type metadata accessor for Logger(0);
  sub_1000073A0(v6, (uint64_t)qword_10003B330);
  v7 = v0;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v10 = 134217984;
    v17 = *(_QWORD *)&v0[v2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18);

    _os_log_impl((void *)&_mh_execute_header, v8, v9, "CategorizationManager transaction being created as %llu", v10, 0xCu);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

  }
  v17 = 0;
  v18 = 0xE000000000000000;
  _StringGuts.grow(_:)(39);
  swift_bridgeObjectRelease(v18);
  v17 = 0xD000000000000025;
  v18 = 0x800000010002F3C0;
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
  object = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(object);
  v13 = v18;
  v14 = String.utf8CString.getter(v17, v18);
  swift_bridgeObjectRelease(v13);
  v15 = os_transaction_create(v14 + 32);
  swift_release(v14);
  return v15;
}

id sub_10002376C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CategorizationManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CategorizationManager()
{
  return objc_opt_self(CategorizationManager);
}

uint64_t sub_100023828@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100023850()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100023874()
{
  uint64_t v0;

  sub_10002110C(v0);
}

uint64_t sub_10002387C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002388C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100023894(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000743C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000238D4(uint64_t a1)
{
  uint64_t v1;

  sub_100020354(a1, v1);
}

uint64_t sub_1000238DC(uint64_t a1)
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

void sub_100023944(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  NSString v7;
  id v8;
  id v9;
  id v10;

  v3 = sub_100020698();
  if (v3)
  {
    v4 = v3;
    v5 = dispatch thunk of MCCNLP.isModelPresetLoaded.getter(v3);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, v5 & 1, 0);
    swift_release(v4);
  }
  else
  {
    v6 = objc_allocWithZone((Class)NSError);
    v7 = String._bridgeToObjectiveC()();
    v8 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, -1, 0);

    v9 = v8;
    v10 = (id)_convertErrorToNSError(_:)(v9);
    (*(void (**)(uint64_t, _QWORD, id))(a2 + 16))(a2, 0, v10);

  }
}

void sub_100023A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  NSString v8;
  id v9;
  id v10;
  id v11;

  v3 = sub_100020698();
  if (v3)
  {
    v4 = v3;
    v5 = dispatch thunk of MCCNLP.scheduleImmediateDownload()();
    v6 = dispatch thunk of MCCNLP.isModelPresetLoaded.getter(v5);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, v6 & 1, 0);
    swift_release(v4);
  }
  else
  {
    v7 = objc_allocWithZone((Class)NSError);
    v8 = String._bridgeToObjectiveC()();
    v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, -1, 0);

    v10 = v9;
    v11 = (id)_convertErrorToNSError(_:)(v10);
    (*(void (**)(uint64_t, _QWORD, id))(a2 + 16))(a2, 0, v11);

  }
}

Swift::Int sub_100023B38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int result;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _BYTE v20[40];
  _OWORD v21[2];
  uint64_t v22;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_1000073FC(&qword_10003B070);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      sub_100024198(v6 + 40 * v4, (uint64_t)v21);
      result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v3 + 40));
      v8 = ~(-1 << *(_BYTE *)(v3 + 32));
      v9 = result & v8;
      v10 = (result & (unint64_t)v8) >> 6;
      v11 = *(_QWORD *)(v5 + 8 * v10);
      v12 = 1 << (result & v8);
      if ((v12 & v11) != 0)
      {
        while (1)
        {
          sub_100024198(*(_QWORD *)(v3 + 48) + 40 * v9, (uint64_t)v20);
          v13 = static AnyHashable.== infix(_:_:)(v20, v21);
          result = sub_10000C594((uint64_t)v20);
          if ((v13 & 1) != 0)
            break;
          v9 = (v9 + 1) & v8;
          v10 = v9 >> 6;
          v11 = *(_QWORD *)(v5 + 8 * (v9 >> 6));
          v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0)
            goto LABEL_8;
        }
        sub_10000C594((uint64_t)v21);
      }
      else
      {
LABEL_8:
        *(_QWORD *)(v5 + 8 * v10) = v12 | v11;
        v14 = *(_QWORD *)(v3 + 48) + 40 * v9;
        v15 = v21[0];
        v16 = v21[1];
        *(_QWORD *)(v14 + 32) = v22;
        *(_OWORD *)v14 = v15;
        *(_OWORD *)(v14 + 16) = v16;
        v17 = *(_QWORD *)(v3 + 16);
        v18 = __OFADD__(v17, 1);
        v19 = v17 + 1;
        if (v18)
        {
          __break(1u);
          return result;
        }
        *(_QWORD *)(v3 + 16) = v19;
      }
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

void sub_100023C9C(uint64_t a1, char *a2, uint64_t a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::Int v14;
  Class isa;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  char *v33;
  void **aBlock;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char v42[120];

  v4 = objc_msgSend(objc_allocWithZone((Class)NSXPCConnection), "initWithListenerEndpoint:", a1);
  v5 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL___MCCCategoryRulesClientProtocol);
  v6 = sub_1000073FC(&qword_10003B048);
  inited = swift_initStackObject(v6, v42);
  *(_OWORD *)(inited + 16) = xmmword_10002C230;
  v8 = objc_opt_self(RCWebRule);
  v9 = objc_opt_self(NSObject);
  aBlock = (void **)swift_dynamicCastObjCClassUnconditional(v8, v9, 0, 0, 0);
  v10 = sub_100024830(0, &qword_10003B050, NSObject_ptr);
  v11 = sub_1000240E0();
  AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), &aBlock, v10, v11);
  v12 = objc_opt_self(NSArray);
  v13 = objc_opt_self(NSObject);
  aBlock = (void **)swift_dynamicCastObjCClassUnconditional(v12, v13, 0, 0, 0);
  AnyHashable.init<A>(_:)((_QWORD *)(inited + 72), &aBlock, v10, v11);
  v14 = sub_100023B38(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 2, &type metadata for AnyHashable);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", isa, "rulesChanged:", 0, 0);

  objc_msgSend(v4, "setRemoteObjectInterface:", v5);
  objc_msgSend(v4, "resume");
  v16 = objc_msgSend(v4, "remoteObjectProxy");
  _bridgeAnyObjectToAny(_:)(&aBlock, v16);
  swift_unknownObjectRelease(v16);
  v17 = sub_1000073FC(&qword_10003AFD8);
  v18 = swift_dynamicCast(&v41, &aBlock, (char *)&type metadata for Any + 8, v17, 6);
  if ((_DWORD)v18)
  {
    swift_unknownObjectRelease(v41);
    v19 = *(void **)&a2[OBJC_IVAR___CategorizationManager_closureLock];
    objc_msgSend(v19, "lock");
    v20 = &a2[OBJC_IVAR___CategorizationManager_clientConnections];
    swift_beginAccess(&a2[OBJC_IVAR___CategorizationManager_clientConnections], &aBlock, 33, 0);
    v21 = v4;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v21);
    v23 = *(_QWORD *)((*(_QWORD *)v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v22 = *(_QWORD *)((*(_QWORD *)v20 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v23 >= v22 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1);
    v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v21);
    specialized Array._endMutation()(v24);
    swift_endAccess(&aBlock);
    v25 = swift_allocObject(&unk_100035C80, 24, 7);
    *(_QWORD *)(v25 + 16) = v21;
    v39 = sub_10002415C;
    v40 = v25;
    aBlock = _NSConcreteStackBlock;
    v36 = 1107296256;
    v37 = sub_100015928;
    v38 = &unk_100035C98;
    v26 = _Block_copy(&aBlock);
    v27 = v40;
    v28 = v21;
    swift_release(v27);
    objc_msgSend(v28, "setInterruptionHandler:", v26);
    _Block_release(v26);
    v29 = swift_allocObject(&unk_100035CD0, 32, 7);
    *(_QWORD *)(v29 + 16) = v28;
    *(_QWORD *)(v29 + 24) = a2;
    v39 = sub_100024190;
    v40 = v29;
    aBlock = _NSConcreteStackBlock;
    v36 = 1107296256;
    v37 = sub_100015928;
    v38 = &unk_100035CE8;
    v30 = _Block_copy(&aBlock);
    v31 = v40;
    v32 = v28;
    v33 = a2;
    swift_release(v31);
    objc_msgSend(v32, "setInvalidationHandler:", v30);
    _Block_release(v30);
    objc_msgSend(v19, "unlock");
  }
  (*(void (**)(uint64_t, uint64_t, _QWORD))(a3 + 16))(a3, v18, 0);

}

unint64_t sub_1000240E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003B058;
  if (!qword_10003B058)
  {
    v1 = sub_100024830(255, &qword_10003B050, NSObject_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10003B058);
  }
  return result;
}

uint64_t sub_100024138()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10002415C()
{
  uint64_t v0;

  sub_100022CBC(*(void **)(v0 + 16));
}

uint64_t sub_100024164()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id sub_100024190()
{
  uint64_t v0;

  return sub_100022E6C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100024198(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

void sub_1000241D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSString v11;
  id v12;
  id v13;
  id v14;

  v7 = sub_100020698();
  if (v7)
  {
    v8 = v7;
    v9 = dispatch thunk of MCCNLP.getIABCategoryID(domain:)(a1, a2);
    (*(void (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, v9, 0);
    swift_release(v8);
  }
  else
  {
    v10 = objc_allocWithZone((Class)NSError);
    v11 = String._bridgeToObjectiveC()();
    v12 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, -1, 0);

    v13 = v12;
    v14 = (id)_convertErrorToNSError(_:)(v13);
    (*(void (**)(uint64_t, _QWORD, id))(a4 + 16))(a4, 0, v14);

  }
}

void sub_1000242DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  NSString v11;
  id v12;
  id v13;
  id v14;

  v7 = sub_100020698();
  if (v7)
  {
    v8 = v7;
    v9 = dispatch thunk of MCCNLP.isPersonalEmail(domain:)(a1, a2);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a4 + 16))(a4, v9 & 1, 0);
    swift_release(v8);
  }
  else
  {
    v10 = objc_allocWithZone((Class)NSError);
    v11 = String._bridgeToObjectiveC()();
    v12 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, -1, 0);

    v13 = v12;
    v14 = (id)_convertErrorToNSError(_:)(v13);
    (*(void (**)(uint64_t, _QWORD, id))(a4 + 16))(a4, 0, v14);

  }
}

void sub_1000243E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSString v10;
  id v11;
  id v12;
  id v13;
  Swift::Int v14;
  char isUniquelyReferenced_nonNull_native;
  void *v16;
  id v17;
  Swift::Int v18;
  char v19;
  void *v20;
  id v21;
  Swift::Int v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  Class isa;
  uint64_t v27;
  id v28;
  void *v29;
  _OWORD v30[2];
  __int128 v31;
  void *v32;

  v3 = type metadata accessor for BlackPearlCategorizationVersion(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100020698();
  if (v7)
  {
    v8 = v7;
    dispatch thunk of MCCNLP.getBlackPearlCatVersion()();
    v13 = kBPCategorizationMajorVersionKey;
    v14 = BlackPearlCategorizationVersion.getMajorVersion()();
    v32 = &type metadata for Int;
    *(_QWORD *)&v31 = v14;
    sub_100008F18(&v31, v30);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
    v29 = &_swiftEmptyDictionarySingleton;
    sub_1000284D0(v30, v13, isUniquelyReferenced_nonNull_native);
    v16 = v29;

    swift_bridgeObjectRelease(0x8000000000000000);
    v17 = kBPCategorizationMinorVersionKey;
    v18 = BlackPearlCategorizationVersion.getMinorVersion()();
    v32 = &type metadata for Int;
    *(_QWORD *)&v31 = v18;
    sub_100008F18(&v31, v30);
    v19 = swift_isUniquelyReferenced_nonNull_native(v16);
    v29 = v16;
    sub_1000284D0(v30, v17, v19);
    v20 = v29;

    swift_bridgeObjectRelease(0x8000000000000000);
    v21 = kBPCategorizationPatchVersionKey;
    v22 = BlackPearlCategorizationVersion.getPatchVersion()();
    v32 = &type metadata for Int;
    *(_QWORD *)&v31 = v22;
    sub_100008F18(&v31, v30);
    v23 = swift_isUniquelyReferenced_nonNull_native(v20);
    v29 = v20;
    sub_1000284D0(v30, v21, v23);
    v24 = (uint64_t)v29;

    swift_bridgeObjectRelease(0x8000000000000000);
    v25 = sub_10002283C(v24);
    swift_bridgeObjectRelease(v24);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, Class, _QWORD))(a2 + 16))(a2, isa, 0);
    swift_release(v8);
    swift_bridgeObjectRelease(v25);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    swift_bridgeObjectRelease(&_swiftEmptyDictionarySingleton);
    v9 = objc_allocWithZone((Class)NSError);
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, -1, 0);

    v12 = v11;
    v28 = (id)_convertErrorToNSError(_:)(v12);
    (*(void (**)(uint64_t, _QWORD, id))(a2 + 16))(a2, 0, v28);

  }
}

uint64_t sub_100024734(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_10002473C(void *a1, uint64_t a2, void *aBlock)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class isa;
  void *v11;

  v11 = &_swiftEmptyDictionarySingleton;
  _Block_copy(aBlock);
  v6 = objc_autoreleasePoolPush();
  sub_1000215FC(a2, a1, (uint64_t)&v11, (void (**)(_QWORD, _QWORD, _QWORD))aBlock);
  objc_autoreleasePoolPop(v6);
  v7 = v11;
  v8 = swift_bridgeObjectRetain(v11);
  v9 = sub_10002283C(v8);
  swift_bridgeObjectRelease(v7);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*((void (**)(void *, Class, _QWORD))aBlock + 2))(aBlock, isa, 0);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v9);

}

uint64_t sub_100024830(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_100024880(uint64_t a1)
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
  sub_1000073FC(&qword_10003B0E8);
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
    sub_10001B75C(v7, (uint64_t)&v16, &qword_10003B118);
    v8 = v16;
    v9 = v17;
    result = sub_100027010(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100008F18(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_1000249B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000073FC(&qword_10003B120);
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
  v6 = (void **)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = *(v6 - 1);
    v9 = v7;
    result = sub_1000270A4((uint64_t)v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = 8 * result;
    *(_QWORD *)(v4[6] + v12) = v8;
    *(_QWORD *)(v4[7] + v12) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
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

unint64_t sub_100024ABC(uint64_t a1)
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
  sub_1000073FC(&qword_10003B108);
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
    sub_10001B75C(v7, (uint64_t)&v14, &qword_10003B110);
    v8 = v14;
    result = sub_1000270A4(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_100008F18(&v15, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_100024BE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000073FC(&qword_10003B0F8);
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
  v6 = (unint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v9 = *(v6 - 1);
    v10 = *v6;
    swift_bridgeObjectRetain(v8);
    sub_100008F50(v9, v10);
    result = sub_100027010(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (uint64_t *)(v4[7] + 16 * result);
    *v14 = v9;
    v14[1] = v10;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
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

unint64_t sub_100024D0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000073FC(&qword_10003B128);
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
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v10 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_100027010(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (_QWORD *)(v4[7] + 16 * result);
    *v14 = v10;
    v14[1] = v9;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
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

id sub_100024FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  NSString v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  id v15;
  NSString v16;
  id v17;
  _QWORD *v18;
  id v19;
  void *v20;
  id v21;
  NSString v22;
  id v23;
  id result;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint8_t *v41;
  uint8_t *v42;
  uint8_t *v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  void *v47;
  char isUniquelyReferenced_nonNull_native;
  void *v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  char v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t *v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  void *v84;

  v78 = a1;
  v4 = sub_1000073FC(&qword_10003AC80);
  __chkstk_darwin(v4);
  v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = &_swiftEmptyDictionarySingleton;
  v7 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v8 = *(_QWORD *)(v2 + OBJC_IVAR___CloudAccountManager_userDefaultsMailAppGroup + 8);
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(v7, "containerURLForSecurityApplicationGroupIdentifier:", v9);

  if (v10)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v10);

    v11 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v6, 1, 1, v12);
  }
  sub_1000090DC((uint64_t)v6, &qword_10003AC80);
  v13 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain(v8);
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  v15 = objc_msgSend(v13, "initWithSuiteName:", v14);

  if (!v15)
    return v84;
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v15, "dictionaryForKey:", v16);

  if (v17)
  {
    v18 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v17, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

  }
  else
  {
    v18 = &_swiftEmptyDictionarySingleton;
  }
  v19 = objc_msgSend((id)objc_opt_self(ACAccountStore), "defaultStore");
  v20 = v19;
  if (!v19
    || (v21 = v19,
        v22 = String._bridgeToObjectiveC()(),
        v23 = objc_msgSend(v21, "aa_appleAccountWithUsername:", v22),
        v22,
        v21,
        !v23))
  {
    v31 = sub_1000073B8();
    v32 = swift_allocError(&_s5ErrorON, v31, 0, 0);
    *(_QWORD *)v33 = 13;
    *(_OWORD *)(v33 + 8) = 0u;
    *(_OWORD *)(v33 + 24) = 0u;
    *(_BYTE *)(v33 + 40) = 5;
    swift_willThrow(v32);

    swift_bridgeObjectRelease(v18);
    return (id)swift_bridgeObjectRelease(v84);
  }

  result = objc_msgSend(v23, "identifier");
  if (result)
  {
    v25 = result;
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v28 = v27;

    if (v18[2] && (v29 = sub_100027010(v26, v28), (v30 & 1) != 0))
    {
      sub_100008EDC(v18[7] + 32 * v29, (uint64_t)&v82);
    }
    else
    {
      v82 = 0u;
      v83 = 0u;
    }
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease(v18);
    if (*((_QWORD *)&v83 + 1))
    {
      v34 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
      if ((swift_dynamicCast(&v80, &v82, (char *)&type metadata for Any + 8, v34, 6) & 1) != 0)
      {
        v35 = v80;
        if (*(_QWORD *)(v80 + 16))
        {
          v36 = sub_100027010(0xD000000000000014, 0x800000010002E7D0);
          if ((v37 & 1) != 0)
          {
            sub_100008EDC(*(_QWORD *)(v35 + 56) + 32 * v36, (uint64_t)&v82);
            if ((swift_dynamicCast(&v80, &v82, (char *)&type metadata for Any + 8, v34, 6) & 1) != 0)
            {
              v38 = v80;
              v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentEncryptionCertIdKey);
              v41 = (uint8_t *)v39;
              v42 = v40;
              if (*(_QWORD *)(v38 + 16))
              {
                v77 = v40;
                v43 = (uint8_t *)v39;
                swift_bridgeObjectRetain(a2);
                v44 = sub_100027010(v78, a2);
                if ((v45 & 1) != 0)
                {
                  sub_100008EDC(*(_QWORD *)(v38 + 56) + 32 * v44, (uint64_t)&v82);
                }
                else
                {
                  v82 = 0u;
                  v83 = 0u;
                }
                swift_bridgeObjectRelease(a2);
                v41 = v43;
                v42 = v77;
              }
              else
              {
                v82 = 0u;
                v83 = 0u;
              }
              swift_bridgeObjectRelease(v38);
              if (*((_QWORD *)&v83 + 1))
              {
                if ((swift_dynamicCast(&v80, &v82, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
                {
                  v76 = (uint8_t *)v80;
                  v77 = v41;
                  v46 = v81;
                  v47 = v84;
                  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v84);
                  *(_QWORD *)&v82 = v47;
                  v84 = (void *)0x8000000000000000;
                  sub_10002835C((uint64_t)v76, v46, (uint64_t)v77, (uint64_t)v42, isUniquelyReferenced_nonNull_native);
                  v49 = v84;
                  v84 = (void *)v82;
                  swift_bridgeObjectRelease(v42);
                  swift_bridgeObjectRelease(v49);
                  goto LABEL_34;
                }
              }
              else
              {
                sub_1000090DC((uint64_t)&v82, &qword_10003B1E0);
              }
              sub_100027234((uint64_t)v41, (uint64_t)v42, &v82);
              swift_bridgeObjectRelease(v42);
              sub_100009130(v82, *((unint64_t *)&v82 + 1));
            }
          }
        }
LABEL_34:
        if (*(_QWORD *)(v35 + 16) && (v50 = sub_100027010(0xD000000000000011, 0x800000010002E7F0), (v51 & 1) != 0))
        {
          sub_100008EDC(*(_QWORD *)(v35 + 56) + 32 * v50, (uint64_t)&v82);
        }
        else
        {
          v82 = 0u;
          v83 = 0u;
        }
        swift_bridgeObjectRelease(v35);
        if (*((_QWORD *)&v83 + 1))
        {
          if ((swift_dynamicCast(&v80, &v82, (char *)&type metadata for Any + 8, v34, 6) & 1) != 0)
          {
            v52 = v80;
            v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentSigningCertIdKey);
            v55 = v54;
            if (*(_QWORD *)(v52 + 16))
            {
              swift_bridgeObjectRetain(a2);
              v56 = sub_100027010(v78, a2);
              if ((v57 & 1) != 0)
              {
                sub_100008EDC(*(_QWORD *)(v52 + 56) + 32 * v56, (uint64_t)&v82);
              }
              else
              {
                v82 = 0u;
                v83 = 0u;
              }
              swift_bridgeObjectRelease(a2);
            }
            else
            {
              v82 = 0u;
              v83 = 0u;
            }
            swift_bridgeObjectRelease(v52);
            if (*((_QWORD *)&v83 + 1))
            {
              if ((swift_dynamicCast(&v80, &v82, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
              {
                v58 = v80;
                v59 = v81;
                v60 = v84;
                v61 = swift_isUniquelyReferenced_nonNull_native(v84);
                *(_QWORD *)&v82 = v60;
                v84 = (void *)0x8000000000000000;
                sub_10002835C(v58, v59, v53, v55, v61);
                v62 = v84;
                v84 = (void *)v82;
                swift_bridgeObjectRelease(v55);
                swift_bridgeObjectRelease(v62);
                goto LABEL_52;
              }
            }
            else
            {
              sub_1000090DC((uint64_t)&v82, &qword_10003B1E0);
            }
            sub_100027234(v53, v55, &v82);
            swift_bridgeObjectRelease(v55);
            sub_100009130(v82, *((unint64_t *)&v82 + 1));
          }
        }
        else
        {
          sub_1000090DC((uint64_t)&v82, &qword_10003B1E0);
        }
LABEL_52:
        if (qword_10003A9C8 != -1)
          swift_once(&qword_10003A9C8, sub_100016B08);
        v63 = type metadata accessor for Logger(0);
        v64 = sub_1000073A0(v63, (uint64_t)qword_10003B2D0);
        v65 = Logger.logObject.getter(v64);
        v66 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v65, v66))
        {
          v67 = (uint8_t *)swift_slowAlloc(12, -1);
          v78 = swift_slowAlloc(32, -1);
          *(_QWORD *)&v82 = v78;
          *(_DWORD *)v67 = 136315138;
          v76 = v67 + 4;
          v77 = v67;
          swift_beginAccess(&v84, &v80, 0, 0);
          v68 = v84;
          swift_bridgeObjectRetain(v84);
          v70 = Dictionary.description.getter(v69, &type metadata for String, &type metadata for Data, &protocol witness table for String);
          v72 = v71;
          swift_bridgeObjectRelease(v68);
          v79 = sub_10002A370(v70, v72, (uint64_t *)&v82);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80);
          swift_bridgeObjectRelease(v72);
          v73 = v77;
          _os_log_impl((void *)&_mh_execute_header, v65, v66, "Found default certificates: %s", v77, 0xCu);
          v74 = v78;
          swift_arrayDestroy(v78, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v74, -1, -1);
          swift_slowDealloc(v73, -1, -1);
        }

        swift_beginAccess(&v84, &v82, 0, 0);
        return v84;
      }

    }
    else
    {

      sub_1000090DC((uint64_t)&v82, &qword_10003B1E0);
    }
    return v84;
  }
  __break(1u);
  return result;
}

void sub_10002597C(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  NSString v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSString v19;
  id v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  NSString v28;
  id v29;
  id v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint8_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  char v49;
  id v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t inited;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  char isUniquelyReferenced_nonNull_native;
  char v68;
  Class isa;
  NSString v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  uint64_t *v79;
  _QWORD *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  char v87;
  void *v88;
  char v89;
  _QWORD *v90;
  Class v91;
  _QWORD *v92;
  NSString v93;
  NSObject *v94;
  os_log_type_t v95;
  uint8_t *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  char v108[64];
  _QWORD *v109;
  _OWORD v110[2];
  char v111[64];
  __int128 v112;
  __int128 v113;
  unint64_t v114;

  v106 = a3;
  v114 = a2;
  v107 = a1;
  v4 = sub_1000073FC(&qword_10003AC80);
  __chkstk_darwin(v4);
  v6 = (char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v8 = *(_QWORD *)(v3 + OBJC_IVAR___CloudAccountManager_userDefaultsMailAppGroup + 8);
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(v7, "containerURLForSecurityApplicationGroupIdentifier:", v9);

  if (v10)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v10);

    v11 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v6, 1, 1, v12);
  }
  sub_1000090DC((uint64_t)v6, &qword_10003AC80);
  v13 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain(v8);
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  v15 = objc_msgSend(v13, "initWithSuiteName:", v14);

  if (!v15)
  {
    v22 = sub_1000073B8();
    v23 = swift_allocError(&_s5ErrorON, v22, 0, 0);
    *(_QWORD *)v24 = 0xD00000000000001BLL;
    *(_QWORD *)(v24 + 8) = 0x800000010002F4B0;
    *(_QWORD *)(v24 + 24) = 0;
    *(_QWORD *)(v24 + 32) = 0;
    *(_QWORD *)(v24 + 16) = 0;
    *(_BYTE *)(v24 + 40) = 0;
    swift_willThrow(v23);
    return;
  }
  v17 = *(_QWORD *)(v3 + OBJC_IVAR___CloudAccountManager_mailPropertyKey);
  v16 = *(_QWORD *)(v3 + OBJC_IVAR___CloudAccountManager_mailPropertyKey + 8);
  v18 = v15;
  v19 = String._bridgeToObjectiveC()();
  v20 = objc_msgSend(v18, "dictionaryForKey:", v19);

  if (v20)
  {
    v21 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v20, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

  }
  else
  {
    v21 = &_swiftEmptyDictionarySingleton;
  }
  v25 = objc_msgSend((id)objc_opt_self(ACAccountStore), "defaultStore");
  v26 = v25;
  if (!v25
    || (v27 = v25,
        v28 = String._bridgeToObjectiveC()(),
        v29 = objc_msgSend(v27, "aa_appleAccountWithUsername:", v28),
        v28,
        v27,
        !v29))
  {
    v44 = sub_1000073B8();
    v45 = swift_allocError(&_s5ErrorON, v44, 0, 0);
    *(_QWORD *)v46 = 13;
    *(_OWORD *)(v46 + 8) = 0u;
    *(_OWORD *)(v46 + 24) = 0u;
    *(_BYTE *)(v46 + 40) = 5;
    swift_willThrow(v45);
    swift_bridgeObjectRelease(v21);

    return;
  }
  v103 = v16;

  v30 = objc_msgSend(v29, "identifier");
  if (!v30)
  {
    __break(1u);
    return;
  }
  v31 = v30;
  v105 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
  v33 = v32;

  if (qword_10003A9C8 != -1)
    swift_once(&qword_10003A9C8, sub_100016B08);
  v34 = type metadata accessor for Logger(0);
  v35 = sub_1000073A0(v34, (uint64_t)qword_10003B2D0);
  v36 = swift_bridgeObjectRetain_n(v33, 2);
  v101 = v35;
  v37 = Logger.logObject.getter(v36);
  v38 = static os_log_type_t.debug.getter();
  v39 = os_log_type_enabled(v37, v38);
  v104 = v29;
  v102 = v17;
  if (v39)
  {
    v40 = swift_slowAlloc(12, -1);
    v100 = v21;
    v41 = (uint8_t *)v40;
    v42 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v112 = v42;
    *(_DWORD *)v41 = 136315138;
    swift_bridgeObjectRetain(v33);
    *(_QWORD *)&v110[0] = sub_10002A370(v105, v33, (uint64_t *)&v112);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v110, (char *)v110 + 8);
    swift_bridgeObjectRelease_n(v33, 3);
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Updating refs for accountId: %s", v41, 0xCu);
    swift_arrayDestroy(v42, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1, -1);
    v43 = v41;
    v21 = v100;
    swift_slowDealloc(v43, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v33, 2);
  }
  v47 = v106;
  if (!v21[2])
  {
    v112 = 0u;
    v113 = 0u;
    v50 = v104;
LABEL_26:
    sub_1000090DC((uint64_t)&v112, &qword_10003B1E0);
    goto LABEL_27;
  }
  swift_bridgeObjectRetain(v33);
  v48 = sub_100027010(v105, v33);
  if ((v49 & 1) != 0)
  {
    sub_100008EDC(v21[7] + 32 * v48, (uint64_t)&v112);
  }
  else
  {
    v112 = 0u;
    v113 = 0u;
  }
  v50 = v104;
  swift_bridgeObjectRelease(v33);
  if (!*((_QWORD *)&v113 + 1))
    goto LABEL_26;
  v51 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
  if (swift_dynamicCast(v110, &v112, (char *)&type metadata for Any + 8, v51, 6))
  {
    v52 = *(_QWORD **)&v110[0];
    goto LABEL_28;
  }
LABEL_27:
  v52 = &_swiftEmptyDictionarySingleton;
LABEL_28:
  v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentEncryptionCertIdKey);
  v55 = v54;
  if (v47[2] && (v56 = sub_100027010(v53, v54), (v57 & 1) != 0))
  {
    v58 = (uint64_t *)(v47[7] + 16 * v56);
    v100 = v52;
    v106 = v18;
    v60 = *v58;
    v59 = v58[1];
    sub_100008F50(*v58, v59);
    swift_bridgeObjectRelease(v55);
    v61 = sub_1000073FC(&qword_10003AC90);
    inited = swift_initStackObject(v61, v108);
    *(_OWORD *)(inited + 16) = xmmword_10002BFF0;
    v63 = v114;
    *(_QWORD *)(inited + 32) = v107;
    *(_QWORD *)(inited + 40) = v63;
    *(_QWORD *)(inited + 48) = v60;
    *(_QWORD *)(inited + 56) = v59;
    v99 = v60;
    v98 = v59;
    v64 = v59;
    v18 = v106;
    sub_100008F50(v60, v64);
    swift_bridgeObjectRetain(v63);
    v65 = sub_100024BE8(inited);
    *((_QWORD *)&v113 + 1) = sub_1000073FC(&qword_10003B0F0);
    *(_QWORD *)&v112 = v65;
    sub_100008F18(&v112, v110);
    v66 = v100;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v100);
    v109 = v66;
    sub_10002822C(v110, 0xD000000000000014, 0x800000010002E7D0, isUniquelyReferenced_nonNull_native);
    v52 = v109;
    swift_bridgeObjectRelease(0x8000000000000000);
    *((_QWORD *)&v113 + 1) = sub_1000073FC((uint64_t *)&unk_10003AAA0);
    *(_QWORD *)&v112 = v52;
    sub_100008F18(&v112, v110);
    swift_bridgeObjectRetain(v33);
    swift_bridgeObjectRetain(v52);
    v68 = swift_isUniquelyReferenced_nonNull_native(v21);
    v109 = v21;
    sub_10002822C(v110, v105, v33, v68);
    v21 = v109;
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(0x8000000000000000);
    swift_bridgeObjectRetain(v21);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    v70 = String._bridgeToObjectiveC()();
    objc_msgSend(v18, "setObject:forKey:", isa, v70);

    v71 = Logger.logObject.getter(objc_msgSend(v18, "synchronize"));
    v72 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v73 = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "UpdateUserDefaults. encryption certificate updated successfully", v73, 2u);
      swift_slowDealloc(v73, -1, -1);

      sub_100008F94(v99, v98);
    }
    else
    {
      sub_100008F94(v99, v98);

    }
    v50 = v104;
  }
  else
  {
    swift_bridgeObjectRelease(v55);
  }
  v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentSigningCertIdKey);
  v76 = v75;
  if (v47[2] && (v77 = sub_100027010(v74, v75), (v78 & 1) != 0))
  {
    v79 = (uint64_t *)(v47[7] + 16 * v77);
    v80 = v21;
    v82 = *v79;
    v81 = v79[1];
    sub_100008F50(*v79, v81);
    swift_bridgeObjectRelease(v76);
    v83 = sub_1000073FC(&qword_10003AC90);
    v84 = swift_initStackObject(v83, v111);
    *(_OWORD *)(v84 + 16) = xmmword_10002BFF0;
    *(_QWORD *)(v84 + 32) = v107;
    v85 = v114;
    *(_QWORD *)(v84 + 40) = v114;
    *(_QWORD *)(v84 + 48) = v82;
    *(_QWORD *)(v84 + 56) = v81;
    swift_bridgeObjectRetain(v85);
    v114 = v81;
    sub_100008F50(v82, v81);
    v86 = sub_100024BE8(v84);
    *((_QWORD *)&v113 + 1) = sub_1000073FC(&qword_10003B0F0);
    *(_QWORD *)&v112 = v86;
    sub_100008F18(&v112, v110);
    v87 = swift_isUniquelyReferenced_nonNull_native(v52);
    v109 = v52;
    sub_10002822C(v110, 0xD000000000000011, 0x800000010002E7F0, v87);
    v88 = v109;
    swift_bridgeObjectRelease(0x8000000000000000);
    *((_QWORD *)&v113 + 1) = sub_1000073FC((uint64_t *)&unk_10003AAA0);
    *(_QWORD *)&v112 = v88;
    sub_100008F18(&v112, v110);
    v89 = swift_isUniquelyReferenced_nonNull_native(v80);
    v109 = v80;
    sub_10002822C(v110, v105, v33, v89);
    v90 = v109;
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(0x8000000000000000);
    swift_bridgeObjectRetain(v90);
    v91 = Dictionary._bridgeToObjectiveC()().super.isa;
    v92 = v90;
    swift_bridgeObjectRelease(v90);
    v93 = String._bridgeToObjectiveC()();
    objc_msgSend(v18, "setObject:forKey:", v91, v93);

    v94 = Logger.logObject.getter(objc_msgSend(v18, "synchronize"));
    v95 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v94, v95))
    {
      v96 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v96 = 0;
      _os_log_impl((void *)&_mh_execute_header, v94, v95, "UpdateUserDefaults. signing certificate updated successfully", v96, 2u);
      swift_slowDealloc(v96, -1, -1);

      sub_100008F94(v82, v114);
    }
    else
    {

      sub_100008F94(v82, v114);
    }
    v21 = v92;
  }
  else
  {
    swift_bridgeObjectRelease(v76);
    swift_bridgeObjectRelease(v33);

    swift_bridgeObjectRelease(v52);
  }
  swift_bridgeObjectRelease(v21);
}

void sub_100026600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  NSString v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSString v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSString v21;
  id v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  NSString v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v56;
  char v57;
  Class isa;
  NSString v59;
  uint64_t v60[3];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _OWORD v65[2];
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  _QWORD *v69;

  v61 = a3;
  v62 = a1;
  v63 = a2;
  v6 = sub_1000073FC(&qword_10003AC80);
  __chkstk_darwin(v6);
  v8 = (char *)v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v10 = *(_QWORD *)(v4 + OBJC_IVAR___CloudAccountManager_userDefaultsMailAppGroup + 8);
  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend(v9, "containerURLForSecurityApplicationGroupIdentifier:", v11);

  if (v12)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v12);

    v13 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 0, 1, v13);
  }
  else
  {
    v14 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  }
  sub_1000090DC((uint64_t)v8, &qword_10003AC80);
  v15 = objc_allocWithZone((Class)NSUserDefaults);
  swift_bridgeObjectRetain(v10);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  v17 = objc_msgSend(v15, "initWithSuiteName:", v16);

  if (!v17)
  {
    v24 = sub_1000073B8();
    v25 = swift_allocError(&_s5ErrorON, v24, 0, 0);
    *(_QWORD *)v26 = 0xD00000000000001BLL;
    *(_QWORD *)(v26 + 8) = 0x800000010002F4B0;
    *(_QWORD *)(v26 + 24) = 0;
    *(_QWORD *)(v26 + 32) = 0;
    *(_QWORD *)(v26 + 16) = 0;
    *(_BYTE *)(v26 + 40) = 0;
    swift_willThrow(v25);
    return;
  }
  v18 = *(_QWORD *)(v4 + OBJC_IVAR___CloudAccountManager_mailPropertyKey);
  v19 = *(_QWORD *)(v4 + OBJC_IVAR___CloudAccountManager_mailPropertyKey + 8);
  v20 = v17;
  v21 = String._bridgeToObjectiveC()();
  v22 = objc_msgSend(v20, "dictionaryForKey:", v21);

  v60[2] = v18;
  if (v22)
  {
    v23 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v22, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

  }
  else
  {
    v23 = &_swiftEmptyDictionarySingleton;
  }
  v27 = objc_msgSend((id)objc_opt_self(ACAccountStore), "defaultStore");
  v28 = v27;
  if (!v27
    || (v29 = v27,
        v30 = String._bridgeToObjectiveC()(),
        v31 = objc_msgSend(v29, "aa_appleAccountWithUsername:", v30),
        v30,
        v29,
        !v31))
  {
    v40 = sub_1000073B8();
    v41 = swift_allocError(&_s5ErrorON, v40, 0, 0);
    *(_QWORD *)v42 = 13;
    *(_OWORD *)(v42 + 8) = 0u;
    *(_OWORD *)(v42 + 24) = 0u;
    *(_BYTE *)(v42 + 40) = 5;
    swift_willThrow(v41);
    swift_bridgeObjectRelease(v23);

    return;
  }

  v32 = objc_msgSend(v31, "identifier");
  if (!v32)
  {
    __break(1u);
    goto LABEL_47;
  }
  v33 = v32;
  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
  v36 = v35;

  v37 = v23[2];
  v60[0] = v34;
  v60[1] = v19;
  if (!v37)
  {
    v67 = 0u;
    v68 = 0u;
LABEL_21:
    sub_1000090DC((uint64_t)&v67, &qword_10003B1E0);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain(v36);
  v38 = sub_100027010(v34, v36);
  if ((v39 & 1) != 0)
  {
    sub_100008EDC(v23[7] + 32 * v38, (uint64_t)&v67);
  }
  else
  {
    v67 = 0u;
    v68 = 0u;
  }
  swift_bridgeObjectRelease(v36);
  if (!*((_QWORD *)&v68 + 1))
    goto LABEL_21;
  v43 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
  if (!swift_dynamicCast(v65, &v67, (char *)&type metadata for Any + 8, v43, 6))
  {
LABEL_22:
    v44 = &_swiftEmptyDictionarySingleton;
    goto LABEL_23;
  }
  v44 = *(_QWORD **)&v65[0];
LABEL_23:
  v45 = 0xD000000000000011;
  v69 = v44;
  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentSigningCertIdKey);
  v48 = v46;
  if (v47 == v61 && v46 == a4)
  {
    swift_bridgeObjectRelease(a4);
    v49 = 0x800000010002E7F0;
    if (v44[2])
      goto LABEL_26;
LABEL_32:
    v67 = 0u;
    v68 = 0u;
LABEL_40:
    sub_1000090DC((uint64_t)&v67, &qword_10003B1E0);
    goto LABEL_41;
  }
  v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v61, a4, v47, v46, 0);
  swift_bridgeObjectRelease(v48);
  if ((v52 & 1) != 0)
  {
    v49 = 0x800000010002E7F0;
  }
  else
  {
    v45 = 0xD000000000000014;
    v49 = 0x800000010002E7D0;
  }
  v44 = v69;
  if (!v69[2])
    goto LABEL_32;
LABEL_26:
  swift_bridgeObjectRetain(v49);
  v50 = sub_100027010(v45, v49);
  if ((v51 & 1) != 0)
  {
    sub_100008EDC(v44[7] + 32 * v50, (uint64_t)&v67);
  }
  else
  {
    v67 = 0u;
    v68 = 0u;
  }
  swift_bridgeObjectRelease(v49);
  if (!*((_QWORD *)&v68 + 1))
    goto LABEL_40;
  v53 = sub_1000073FC((uint64_t *)&unk_10003AAA0);
  if ((swift_dynamicCast(&v66, &v67, (char *)&type metadata for Any + 8, v53, 6) & 1) == 0)
  {
LABEL_41:
    v66 = 0;
    goto LABEL_42;
  }
  if (!v66)
  {
LABEL_42:
    swift_bridgeObjectRelease(v49);
    swift_bridgeObjectRelease(v36);
LABEL_43:

    swift_bridgeObjectRelease(v66);
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v23);
    return;
  }
  sub_100027144(v62, v63, &v67);
  sub_1000090DC((uint64_t)&v67, &qword_10003B1E0);
  v54 = v66;
  if (v66)
  {
    if (*(_QWORD *)(v66 + 16))
    {
      *((_QWORD *)&v68 + 1) = sub_1000073FC((uint64_t *)&unk_10003AAA0);
      *(_QWORD *)&v67 = v54;
      sub_100008F18(&v67, v65);
      swift_bridgeObjectRetain(v54);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v44);
      v64 = v44;
      sub_10002822C(v65, v45, v49, isUniquelyReferenced_nonNull_native);
      v56 = v64;
      v69 = v64;
      swift_bridgeObjectRelease(v49);
      swift_bridgeObjectRelease(0x8000000000000000);
    }
    else
    {
      sub_100027144(v45, v49, &v67);
      swift_bridgeObjectRelease(v49);
      sub_1000090DC((uint64_t)&v67, &qword_10003B1E0);
      v56 = v69;
    }
    *((_QWORD *)&v68 + 1) = sub_1000073FC((uint64_t *)&unk_10003AAA0);
    *(_QWORD *)&v67 = v56;
    sub_100008F18(&v67, v65);
    swift_bridgeObjectRetain(v56);
    v57 = swift_isUniquelyReferenced_nonNull_native(v23);
    v64 = v23;
    sub_10002822C(v65, v60[0], v36, v57);
    v23 = v64;
    swift_bridgeObjectRelease(v36);
    swift_bridgeObjectRelease(0x8000000000000000);
    swift_bridgeObjectRetain(v23);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v23);
    v59 = String._bridgeToObjectiveC()();
    objc_msgSend(v20, "setObject:forKey:", isa, v59);

    objc_msgSend(v20, "synchronize");
    goto LABEL_43;
  }
LABEL_47:
  __break(1u);
}

id sub_100026EC4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloudAccountManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CloudAccountManager()
{
  return objc_opt_self(CloudAccountManager);
}

uint64_t sub_100026F54@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void *sub_100026F7C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

unint64_t sub_100027010(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6);
  String.hash(into:)(v6, a1, a2);
  v4 = Hasher._finalize()();
  return sub_1000286BC(a1, a2, v4);
}

unint64_t sub_100027074(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10002879C(a1, v4);
}

unint64_t sub_1000270A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7);
  type metadata accessor for CFString(0);
  v3 = v2;
  v4 = sub_1000294A0();
  _CFObject.hash(into:)(v7, v3, v4);
  v5 = Hasher._finalize()();
  return sub_100028860(a1, v5);
}

unint64_t sub_100027114(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100028988(a1, v4);
}

double sub_100027144@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
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
  v9 = sub_100027010(a1, a2);
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
      sub_100028A90();
      v12 = v15;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    sub_100008F18((_OWORD *)(*(_QWORD *)(v12 + 56) + 32 * v9), a3);
    sub_100027CD4(v9, v12);
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

double sub_100027234@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
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
  v9 = sub_100027010(a1, a2);
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
      sub_100028C74();
      v12 = v15;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    *a3 = *(_OWORD *)(*(_QWORD *)(v12 + 56) + 16 * v9);
    sub_100027EA8(v9, v12);
    v13 = *v4;
    *v4 = v12;
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    result = 0.0;
    *a3 = xmmword_10002BFE0;
  }
  return result;
}

double sub_100027318@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100027114(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    v13 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100028E38();
      v10 = v13;
    }

    sub_100008F18((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v7), a2);
    sub_10002807C(v7, v10);
    v11 = *v3;
    *v3 = v10;
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_1000273FC(uint64_t a1, uint64_t a2)
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
  sub_1000073FC(&qword_10003B0E8);
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
        sub_100008F18(v25, v38);
      }
      else
      {
        sub_100008EDC((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }
      Hasher.init(_seed:)(v37);
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
      result = (uint64_t)sub_100008F18(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v15));
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_1000276F8(uint64_t a1, uint64_t a2)
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
  sub_1000073FC(&qword_10003B0F8);
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
        sub_100008F50(v39, *((unint64_t *)&v39 + 1));
      }
      Hasher.init(_seed:)(v40);
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

uint64_t sub_100027A04(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  void *v23;
  _OWORD *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000073FC(&qword_10003B100);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v10 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v11 = ~(-1 << v9);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v9 + 63) >> 6;
    v14 = v7 + 64;
    result = swift_retain(v5);
    v16 = 0;
    while (1)
    {
      if (v12)
      {
        v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v19 = v18 | (v16 << 6);
      }
      else
      {
        v20 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          return result;
        }
        if (v20 >= v13)
          goto LABEL_37;
        v21 = v10[v20];
        ++v16;
        if (!v21)
        {
          v16 = v20 + 1;
          if (v20 + 1 >= v13)
            goto LABEL_37;
          v21 = v10[v16];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v13)
            {
LABEL_37:
              swift_release(v5);
              if ((a2 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v34;
                goto LABEL_44;
              }
              v33 = 1 << *(_BYTE *)(v5 + 32);
              if (v33 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v10 = -1 << v33;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v10[v22];
            if (!v21)
            {
              while (1)
              {
                v16 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_46;
                if (v16 >= v13)
                  goto LABEL_37;
                v21 = v10[v16];
                ++v22;
                if (v21)
                  goto LABEL_24;
              }
            }
            v16 = v22;
          }
        }
LABEL_24:
        v12 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v16 << 6);
      }
      v23 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v19);
      if ((a2 & 1) != 0)
      {
        sub_100008F18(v24, v35);
      }
      else
      {
        sub_100008EDC((uint64_t)v24, (uint64_t)v35);
        v25 = v23;
      }
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v14 + 8 * (v27 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v14 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_45;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v14 + 8 * v28);
        }
        while (v32 == -1);
        v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v17) = v23;
      result = (uint64_t)sub_100008F18(v35, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v17));
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_44:
  *v3 = v8;
  return result;
}

unint64_t sub_100027CD4(unint64_t result, uint64_t a2)
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
        Hasher.init(_seed:)(v27);
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

unint64_t sub_100027EA8(unint64_t result, uint64_t a2)
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
        Hasher.init(_seed:)(v26);
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

void sub_10002807C(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  Swift::Int v11;
  id v12;
  Swift::Int v13;
  Swift::Int v14;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _OWORD *v21;
  _OWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = _HashTable.previousHole(before:)(a1, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v11 = *(_QWORD *)(a2 + 40);
        v12 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v13 = NSObject._rawHashValue(seed:)(v11);

        v14 = v13 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v14 >= v9 && v3 >= v14)
          {
LABEL_16:
            v17 = *(_QWORD *)(a2 + 48);
            v18 = (_QWORD *)(v17 + 8 * v3);
            v19 = (_QWORD *)(v17 + 8 * v6);
            if (v3 != v6 || v18 >= v19 + 1)
              *v18 = *v19;
            v20 = *(_QWORD *)(a2 + 56);
            v21 = (_OWORD *)(v20 + 32 * v3);
            v22 = (_OWORD *)(v20 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v21 >= v22 + 2))
            {
              v10 = v22[1];
              *v21 = *v22;
              v21[1] = v10;
              v3 = v6;
            }
          }
        }
        else if (v14 >= v9 || v3 >= v14)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v24 = *v23;
    v25 = (-1 << v3) - 1;
  }
  else
  {
    v23 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v25 = *v23;
    v24 = (-1 << a1) - 1;
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
}

_OWORD *sub_10002822C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_100027010(a2, a3);
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
        sub_100009180(v19);
        return sub_100008F18(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100028A90();
      goto LABEL_7;
    }
    sub_1000273FC(v15, a4 & 1);
    v21 = sub_100027010(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1000285F0(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_10002835C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
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
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_100027010(a3, a4);
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
    sub_100028C74();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7] + 16 * v14;
      result = sub_100008F94(*(_QWORD *)v21, *(_QWORD *)(v21 + 8));
      *(_QWORD *)v21 = a1;
      *(_QWORD *)(v21 + 8) = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain(a4);
    }
    goto LABEL_14;
  }
  sub_1000276F8(v17, a5 & 1);
  v23 = sub_100027010(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *sub_1000284D0(_OWORD *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _OWORD *result;
  unint64_t v18;
  char v19;
  unint64_t v20;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v9 = sub_100027114((uint64_t)a2);
  v10 = v7[2];
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }
  else
  {
    v13 = v8;
    v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        v16 = (_QWORD *)(v15[7] + 32 * v9);
        sub_100009180(v16);
        return sub_100008F18(a1, v16);
      }
      goto LABEL_11;
    }
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_100028E38();
      goto LABEL_7;
    }
    sub_100027A04(v12, a3 & 1);
    v18 = sub_100027114((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      v9 = v18;
      v15 = *v4;
      if ((v13 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_100028658(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }
  v20 = sub_100029464();
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v20);
  __break(1u);
  return result;
}

_OWORD *sub_1000285F0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_100008F18(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

_OWORD *sub_100028658(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_100008F18(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

unint64_t sub_1000286BC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002879C(uint64_t a1, uint64_t a2)
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
      sub_100024198(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000C594((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100028860(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v6 = v2;
    type metadata accessor for CFString(0);
    v9 = v8;
    v10 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * i);
    v11 = sub_1000294A0();
    v12 = v10;
    v13 = static _CFObject.== infix(_:_:)(v12, a1, v9, v11);

    if ((v13 & 1) == 0)
    {
      v14 = ~v4;
      for (i = (i + 1) & v14; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v14)
      {
        v15 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * i);
        v16 = static _CFObject.== infix(_:_:)(v15, a1, v9, v11);

        if ((v16 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_100028988(uint64_t a1, uint64_t a2)
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
    sub_100029464();
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

void *sub_100028A90()
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
  sub_1000073FC(&qword_10003B0E8);
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
    sub_100008EDC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_100008F18(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_100028C74()
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
  sub_1000073FC(&qword_10003B0F8);
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
    result = (void *)sub_100008F50(v24, *((unint64_t *)&v24 + 1));
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

id sub_100028E38()
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
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  sub_1000073FC(&qword_10003B100);
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_100008EDC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    sub_100008F18(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_100028FFC(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  void *v8;
  NSString v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t *v14;
  char **v15;
  uint64_t v16;
  unint64_t v17;
  Class isa;
  NSString v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;

  v8 = (void *)objc_opt_self(MailAccount);
  objc_msgSend(v8, "reloadAccounts");
  swift_bridgeObjectRetain(a2);
  v33 = a1;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = objc_msgSend(v8, "accountContainingEmailAddress:", v9);

  if (v10 && (v11 = objc_msgSend(v10, "systemAccount")) != 0)
  {
    v12 = v11;

    v13 = *(_QWORD *)(a3 + 16);
    if (v13)
    {
      v34 = a4 & 1;
      swift_bridgeObjectRetain(a3);
      v31 = a3;
      v14 = (unint64_t *)(a3 + 40);
      v15 = &off_100039000;
      v32 = v12;
      do
      {
        v16 = *(v14 - 1);
        v17 = *v14;
        swift_bridgeObjectRetain(*v14);
        isa = Bool._bridgeToObjectiveC()().super.super.isa;
        v19 = String._bridgeToObjectiveC()();
        objc_msgSend(v12, v15[346], isa, v19);

        if (qword_10003A9C8 != -1)
          swift_once(&qword_10003A9C8, sub_100016B08);
        v20 = type metadata accessor for Logger(0);
        sub_1000073A0(v20, (uint64_t)qword_10003B2D0);
        swift_bridgeObjectRetain_n(a2, 2);
        swift_bridgeObjectRetain(v17);
        v22 = Logger.logObject.getter(v21);
        v23 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = swift_slowAlloc(28, -1);
          v25 = swift_slowAlloc(64, -1);
          v35 = v25;
          *(_DWORD *)v24 = 136315650;
          swift_bridgeObjectRetain(v17);
          *(_QWORD *)(v24 + 4) = sub_10002A370(v16, v17, &v35);
          swift_bridgeObjectRelease_n(v17, 3);
          *(_WORD *)(v24 + 12) = 1024;
          *(_DWORD *)(v24 + 14) = v34;
          *(_WORD *)(v24 + 18) = 2080;
          swift_bridgeObjectRetain(a2);
          *(_QWORD *)(v24 + 20) = sub_10002A370(v33, a2, &v35);
          swift_bridgeObjectRelease_n(a2, 3);
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "Set %s property to %{BOOL}d for account %s", (uint8_t *)v24, 0x1Cu);
          swift_arrayDestroy(v25, 2, (char *)&type metadata for Any + 8);
          v26 = v25;
          v12 = v32;
          swift_slowDealloc(v26, -1, -1);
          v27 = v24;
          v15 = &off_100039000;
          swift_slowDealloc(v27, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n(a2, 2);
          swift_bridgeObjectRelease_n(v17, 2);
        }
        v14 += 2;
        --v13;
      }
      while (v13);

      swift_bridgeObjectRelease(v31);
    }
    else
    {

    }
  }
  else
  {
    v28 = sub_1000073B8();
    v29 = swift_allocError(&_s5ErrorON, v28, 0, 0);
    *(_QWORD *)v30 = 13;
    *(_OWORD *)(v30 + 8) = 0u;
    *(_OWORD *)(v30 + 24) = 0u;
    *(_BYTE *)(v30 + 40) = 5;
    swift_willThrow(v29);

  }
}

id sub_10002936C(uint64_t a1, id a2)
{
  id v3;
  void *v4;
  id v5;
  NSString v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = objc_msgSend((id)objc_opt_self(ACAccountStore), "defaultStore");
  v4 = v3;
  if (v3
    && (v5 = v3,
        v6 = String._bridgeToObjectiveC()(),
        a2 = objc_msgSend(v5, "aa_appleAccountWithUsername:", v6),
        v6,
        v5,
        a2))
  {

  }
  else
  {
    v7 = sub_1000073B8();
    v8 = swift_allocError(&_s5ErrorON, v7, 0, 0);
    *(_QWORD *)v9 = 13;
    *(_OWORD *)(v9 + 8) = 0u;
    *(_OWORD *)(v9 + 24) = 0u;
    *(_BYTE *)(v9 + 40) = 5;
    swift_willThrow(v8);

  }
  return a2;
}

unint64_t sub_100029464()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003B080;
  if (!qword_10003B080)
  {
    v1 = objc_opt_self(NSString);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003B080);
  }
  return result;
}

unint64_t sub_1000294A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003AAE0;
  if (!qword_10003AAE0)
  {
    type metadata accessor for CFString(255);
    result = swift_getWitnessTable(&unk_10002C148, v1);
    atomic_store(result, (unint64_t *)&qword_10003AAE0);
  }
  return result;
}

SecKeyRef sub_1000294E8(const __CFData *a1, void *a2)
{
  uint64_t v4;
  uint64_t inited;
  const __CFString *v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  unint64_t v10;
  const __CFDictionary *isa;
  SecKeyRef v12;
  uint64_t v14;

  v4 = sub_1000073FC((uint64_t *)&unk_10003B130);
  inited = swift_initStackObject(v4, &v14);
  *(_OWORD *)(inited + 16) = xmmword_10002C230;
  *(_QWORD *)(inited + 32) = kSecAttrKeyType;
  *(_QWORD *)(inited + 40) = a2;
  *(_QWORD *)(inited + 48) = kSecAttrKeyClass;
  *(_QWORD *)(inited + 56) = kSecAttrKeyClassPrivate;
  v6 = (id)kSecAttrKeyType;
  v7 = a2;
  v8 = (id)kSecAttrKeyClass;
  v9 = (id)kSecAttrKeyClassPrivate;
  v10 = sub_1000249B4(inited);
  type metadata accessor for CFString(0);
  sub_10001EABC();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  v12 = SecKeyCreateWithData(a1, isa, 0);

  return v12;
}

SecKeyRef sub_1000295D8(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  const __CFString *v7;
  id v8;
  const __CFString *v9;
  unint64_t v10;
  const __CFDictionary *isa;
  __SecKey *RandomKey;
  const __CFData *v13;
  __SecKey *v14;
  SecKeyRef v15;
  uint64_t v17;

  v4 = sub_1000073FC(&qword_10003AE28);
  inited = swift_initStackObject(v4, &v17);
  *(_OWORD *)(inited + 16) = xmmword_10002C230;
  *(_QWORD *)(inited + 32) = kSecAttrKeyType;
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 40) = a1;
  *(_QWORD *)(inited + 64) = v6;
  *(_QWORD *)(inited + 72) = kSecAttrKeySizeInBits;
  *(_QWORD *)(inited + 104) = &type metadata for Int;
  *(_QWORD *)(inited + 80) = a2;
  v7 = (id)kSecAttrKeyType;
  v8 = a1;
  v9 = (id)kSecAttrKeySizeInBits;
  v10 = sub_100024ABC(inited);
  sub_10001EABC();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  RandomKey = SecKeyCreateRandomKey(isa, 0);

  if (!RandomKey)
    return 0;
  v13 = SecKeyCopyExternalRepresentation(RandomKey, 0);
  if (v13)
  {
    v14 = v13;
    v15 = sub_1000294E8(v13, v8);

    RandomKey = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id sub_100029758()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MCCAgentConnectionManager()), "init");
  qword_10003B350 = (uint64_t)result;
  return result;
}

id sub_1000297C4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  char *v5;
  NSString v6;
  id v7;
  void *v8;
  objc_super v10;

  v1 = OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener] = 0;
  static String._unconditionallyBridgeFromObjectiveC(_:)(MCCSecretAgentMachService);
  v3 = v2;
  v4 = objc_allocWithZone((Class)NSXPCListener);
  v5 = v0;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v7 = objc_msgSend(v4, "initWithMachServiceName:", v6);

  v8 = *(void **)&v0[v1];
  *(_QWORD *)&v0[v1] = v7;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for MCCAgentConnectionManager();
  return objc_msgSendSuper2(&v10, "init");
}

id sub_1000298AC()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  objc_super v6;

  v1 = OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener;
  v2 = *(void **)&v0[OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener];
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v3, "invalidate");
    objc_msgSend(v3, "setDelegate:", 0);

    v4 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = 0;

  }
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for MCCAgentConnectionManager();
  return objc_msgSendSuper2(&v6, "dealloc");
}

id sub_1000299D4()
{
  uint64_t v0;
  uint64_t v1;
  id result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v1 = OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener;
  result = *(id *)(v0 + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener);
  if (result)
  {
    v3 = v0;
    result = objc_msgSend(result, "serviceName");
    if (result)
    {
      v4 = result;
      v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
      v7 = v6;

      if (qword_10003A9E0 != -1)
        swift_once(&qword_10003A9E0, sub_100016B6C);
      v8 = type metadata accessor for Logger(0);
      sub_1000073A0(v8, (uint64_t)qword_10003B318);
      swift_bridgeObjectRetain(v7);
      v10 = Logger.logObject.getter(v9);
      v11 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc(12, -1);
        v13 = swift_slowAlloc(32, -1);
        v16 = v13;
        *(_DWORD *)v12 = 136315138;
        swift_bridgeObjectRetain(v7);
        v15 = sub_10002A370(v5, v7, &v16);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16);
        swift_bridgeObjectRelease_n(v7, 3);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Resuming XPC listener for Mach service %s...", v12, 0xCu);
        swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v13, -1, -1);
        swift_slowDealloc(v12, -1, -1);

        v14 = *(void **)(v3 + v1);
        if (!v14)
          return objc_msgSend(v14, "resume");
      }
      else
      {

        swift_bridgeObjectRelease_n(v7, 2);
        v14 = *(void **)(v3 + v1);
        if (!v14)
          return objc_msgSend(v14, "resume");
      }
      objc_msgSend(v14, "setDelegate:", v3);
      v14 = *(void **)(v3 + v1);
      return objc_msgSend(v14, "resume");
    }
  }
  return result;
}

uint64_t sub_100029BDC(void *a1, void *a2)
{
  uint64_t v2;
  char v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void **v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void ***v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  void **v29;
  uint64_t v30;
  void ***v32;
  void **aBlock;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  void (*v37)();
  uint64_t v38;

  v5 = sub_10002AA28(a2);
  if ((v5 & 1) != 0)
  {
    v6 = *(void **)(v2 + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener);
    if (v6
      && (sub_10002AB30(),
          v7 = a1,
          v8 = v6,
          v9 = static NSObject.== infix(_:_:)(v7, v8),
          v7,
          v8,
          (v9 & 1) != 0))
    {
      v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MCCSecretAgentService()), "init");
      objc_msgSend(a2, "setExportedObject:", v10);
      v11 = (void *)objc_opt_self(MCCSecretAgentInterface);
      v12 = objc_msgSend(v11, "XPCInterface");
      objc_msgSend(a2, "setExportedInterface:", v12);

      v13 = objc_msgSend(v11, "XPCInterface");
      objc_msgSend(a2, "setRemoteObjectInterface:", v13);

      v37 = sub_10002A090;
      v38 = 0;
      aBlock = _NSConcreteStackBlock;
      v34 = 1107296256;
      v35 = sub_100015928;
      v36 = &unk_100035D10;
      v14 = _Block_copy(&aBlock);
      objc_msgSend(a2, "setInterruptionHandler:", v14);
      _Block_release(v14);
      v37 = sub_10002A09C;
      v38 = 0;
      aBlock = _NSConcreteStackBlock;
      v34 = 1107296256;
      v35 = sub_100015928;
      v36 = &unk_100035D38;
      v15 = _Block_copy(&aBlock);
      objc_msgSend(a2, "setInvalidationHandler:", v15);
      _Block_release(v15);

    }
    else
    {
      if (qword_10003A9E0 != -1)
        swift_once(&qword_10003A9E0, sub_100016B6C);
      v24 = type metadata accessor for Logger(0);
      sub_1000073A0(v24, (uint64_t)qword_10003B318);
      v25 = a1;
      v26 = Logger.logObject.getter(v25);
      v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc(12, -1);
        v32 = (void ***)swift_slowAlloc(8, -1);
        aBlock = v25;
        *(_DWORD *)v28 = 138412290;
        v29 = v25;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v34);
        *v32 = v25;

        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Fatal error! Unknown XPC listener: %@", v28, 0xCu);
        v30 = sub_1000073FC(&qword_10003B060);
        swift_arrayDestroy(v32, 1, v30);
        swift_slowDealloc(v32, -1, -1);
        swift_slowDealloc(v28, -1, -1);

      }
      else
      {

      }
    }
    objc_msgSend(a2, "resume");
  }
  else
  {
    if (qword_10003A9E0 != -1)
      swift_once(&qword_10003A9E0, sub_100016B6C);
    v16 = type metadata accessor for Logger(0);
    sub_1000073A0(v16, (uint64_t)qword_10003B318);
    v17 = a2;
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = (void ***)swift_slowAlloc(8, -1);
      *(_DWORD *)v20 = 138412290;
      aBlock = v17;
      v22 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v34);
      *v21 = v17;

      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Invalid entitlement on connection %@", v20, 0xCu);
      v23 = sub_1000073FC(&qword_10003B060);
      swift_arrayDestroy(v21, 1, v23);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v20, -1, -1);

    }
    else
    {

    }
  }
  return v5 & 1;
}

void sub_10002A090()
{
  sub_10002A0A8("Connection interrupted [remote exited/crashed ?]");
}

void sub_10002A09C()
{
  sub_10002A0A8("Connection invalidated [connection terminated ?]");
}

void sub_10002A0A8(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  if (qword_10003A9E0 != -1)
    swift_once(&qword_10003A9E0, sub_100016B6C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_1000073A0(v2, (uint64_t)qword_10003B318);
  oslog = Logger.logObject.getter(v3);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, a1, v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

}

uint64_t type metadata accessor for MCCAgentConnectionManager()
{
  return objc_opt_self(_TtC15icloudmailagent25MCCAgentConnectionManager);
}

uint64_t sub_10002A1FC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10002A20C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_10002A240(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_10002A250(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

uint64_t sub_10002A300(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = sub_10002A370(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_10002A370(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10002A440(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100008EDC((uint64_t)v12, *a3);
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
      sub_100008EDC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100009180(v12);
  return v7;
}

uint64_t sub_10002A440(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10002A5F8(a5, a6);
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

uint64_t sub_10002A5F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10002A68C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10002A8DC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10002A8DC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10002A68C(uint64_t a1, unint64_t a2)
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
      v5 = sub_10002A800(v4, 0);
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

_QWORD *sub_10002A800(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000073FC(&qword_10003ACB8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10002A864(unint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_10002A8DC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000073FC(&qword_10003ACB8);
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

uint64_t sub_10002AA28(void *a1)
{
  NSString v2;
  id v3;
  char v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  swift_bridgeObjectRetain("nabled");
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease("nabled");
  v3 = objc_msgSend(a1, "valueForEntitlement:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v6, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10000B4A0((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if ((swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0
      && (v5 & 1) != 0)
    {
      return 1;
    }
  }
  else
  {
    sub_10000B4E8((uint64_t)v7);
  }
  return 0;
}

unint64_t sub_10002AB30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003B1D8;
  if (!qword_10003B1D8)
  {
    v1 = objc_opt_self(NSXPCListener);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003B1D8);
  }
  return result;
}

uint64_t sub_10002AB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002AB7C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}


uint64_t sub_100004848(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t OpaqueTypeConformance2;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;

  v2 = sub_100004A10(&qword_100055B10);
  v3 = sub_100004A50(&qword_100055B18);
  v4 = sub_100004A50(&qword_100055B20);
  v5 = sub_100004A50(&qword_100055B28);
  v11 = sub_100004A50(&qword_100055B30);
  v12 = sub_100004A94();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v11 = v5;
  v12 = OpaqueTypeConformance2;
  v7 = swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v11 = v4;
  v12 = v7;
  v8 = swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v11 = v3;
  v12 = v8;
  v9 = swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.visibilityConfigurableByInternalSettings(visibleByDefault:)>>, 1);
  return WidgetConfiguration._containerBackgroundRemovable(_:)(a1, v2, v9);
}

uint64_t sub_100004950(__int128 *a1)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  if (!sub_10003F988(2, 17, 0, 0))
    return v2;
  v3 = v2;
  return swift_getOpaqueTypeMetadata2(0, &v3, &opaque type descriptor for <<opaque return type of WidgetConfiguration._containerBackgroundRemovable(_:)>>, 0);
}

uint64_t sub_1000049B4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v2 = *a1;
  v1 = a1[1];
  if (sub_10003F988(2, 17, 0, 0))
  {
    v4[0] = v2;
    v4[1] = v1;
    return swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of WidgetConfiguration._containerBackgroundRemovable(_:)>>, 1);
  }
  return v1;
}

uint64_t sub_100004A10(uint64_t *a1)
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

uint64_t sub_100004A50(uint64_t *a1)
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

unint64_t sub_100004A94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100055B38;
  if (!qword_100055B38)
  {
    v1 = sub_100004A50(&qword_100055B30);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentConfiguration<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100055B38);
  }
  return result;
}

uint64_t variable initialization expression of FriendSelectorIntentResponse.code()
{
  return 0;
}

void sub_100004AE8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_100004AF0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100004B04(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_100004B34(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_100004B48(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_100004B5C(uint64_t a1, uint64_t a2)
{
  return sub_100004F08(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004B68(uint64_t a1, id *a2)
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

uint64_t sub_100004BDC(uint64_t a1, id *a2)
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

uint64_t sub_100004C58@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

void sub_100004C98(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_100004CA4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

__n128 sub_100004CB0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004CC0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100004CE0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
  sub_100004D58(a1, &qword_100055BA0, (uint64_t)&unk_100051A00);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100004D58(a1, &qword_100055BA8, (uint64_t)&unk_100051A80);
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_100004D58(a1, &qword_100055BB0, (uint64_t)&unk_100051B00);
}

void type metadata accessor for TextStyle(uint64_t a1)
{
  sub_100004D58(a1, &qword_100055BB8, (uint64_t)&unk_100051B28);
}

void sub_100004D58(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100004D9C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100004DE0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004E08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100004EBC(&qword_100055BD8, (uint64_t)&unk_1000426B4);
  v3 = sub_100004EBC((unint64_t *)&unk_100055BE0, (uint64_t)&unk_100042654);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004E74()
{
  return sub_100004EBC(&qword_100055BC0, (uint64_t)&unk_100042618);
}

uint64_t sub_100004E98()
{
  return sub_100004EBC(&qword_100055BC8, (uint64_t)&unk_1000425EC);
}

uint64_t sub_100004EBC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for TextStyle(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004EFC(uint64_t a1, uint64_t a2)
{
  return sub_100004F08(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004F08(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100004F44(uint64_t a1)
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

Swift::Int sub_100004F84(uint64_t a1)
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

uint64_t sub_100004FF4(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_10000507C()
{
  return sub_100004EBC(&qword_100055BD0, (uint64_t)&unk_100042688);
}

double sub_1000050AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v0 = type metadata accessor for Color.RGBColorSpace(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static Color.white.getter(v2);
  v6 = enum case for Color.RGBColorSpace.sRGB(_:);
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v7(v4, enum case for Color.RGBColorSpace.sRGB(_:), v0);
  v8 = Color.init(_:red:green:blue:opacity:)(v4, 1.0, 1.0, 1.0, 1.0);
  v7(v4, v6, v0);
  v9 = Color.init(_:red:green:blue:opacity:)(v4, 0.0, 0.0, 0.0, 0.15);
  v7(v4, v6, v0);
  v10 = Color.init(_:red:green:blue:opacity:)(v4, 0.56, 0.56, 0.58, 1.0);
  v7(v4, v6, v0);
  v11 = Color.init(_:red:green:blue:opacity:)(v4, 0.0, 0.0, 0.0, 0.4);
  xmmword_100058FD0 = xmmword_100042760;
  qword_100058FE0 = 0x4024000000000000;
  qword_100058FE8 = v5;
  qword_100058FF0 = v8;
  qword_100058FF8 = v9;
  result = 0.0;
  xmmword_100059000 = xmmword_100042770;
  qword_100059010 = 0x4000000000000000;
  qword_100059018 = v10;
  qword_100059020 = v11;
  unk_100059028 = xmmword_100042770;
  qword_100059038 = 0x4000000000000000;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for BadgeViewStyle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for BadgeViewStyle(_QWORD *a1)
{
  swift_release(a1[3]);
  swift_release(a1[4]);
  swift_release(a1[5]);
  swift_release(a1[9]);
  return swift_release(a1[10]);
}

uint64_t initializeWithCopy for BadgeViewStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  return a1;
}

_QWORD *assignWithCopy for BadgeViewStyle(_QWORD *a1, _QWORD *a2)
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

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = a2[3];
  v5 = a1[3];
  a1[3] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[4];
  v7 = a1[4];
  a1[4] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_retain(v8);
  swift_release(v9);
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  v10 = a2[9];
  v11 = a1[9];
  a1[9] = v10;
  swift_retain(v10);
  swift_release(v11);
  v12 = a2[10];
  v13 = a1[10];
  a1[10] = v12;
  swift_retain(v12);
  swift_release(v13);
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  return a1;
}

__n128 initializeWithTake for BadgeViewStyle(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for BadgeViewStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release(*(_QWORD *)(a1 + 24));
  v4 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v4);
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v5);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release(*(_QWORD *)(a1 + 72));
  v6 = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release(v6);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for BadgeViewStyle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BadgeViewStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
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
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BadgeViewStyle()
{
  return &type metadata for BadgeViewStyle;
}

uint64_t sub_10000558C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  void (*v37)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;

  v3 = v2;
  v48 = a2;
  v5 = type metadata accessor for WidgetRenderingMode(0);
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v39 - v9;
  v11 = type metadata accessor for ColorScheme(0);
  v42 = *(_QWORD *)(v11 - 8);
  v43 = v11;
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a1 + 16);
  v44 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v12);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100004A50(&qword_100055F40);
  v45 = v15;
  v19 = type metadata accessor for ModifiedContent(0, v15, v18);
  v46 = *(_QWORD *)(v19 - 8);
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v20);
  v25 = (char *)&v39 - v24;
  (*(void (**)(uint64_t))(v3 + *(int *)(a1 + 40)))(v23);
  v47 = a1;
  v39 = v3;
  v26 = sub_100007AA4(&qword_100055E30, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x80000001000418E0, (uint64_t)v10);
  static WidgetRenderingMode.accented.getter(v26);
  LOBYTE(v15) = static WidgetRenderingMode.== infix(_:_:)(v10, v8);
  v27 = *(void (**)(char *, uint64_t))(v40 + 8);
  v28 = v8;
  v29 = v41;
  v27(v28, v41);
  v27(v10, v29);
  if ((v15 & 1) != 0)
  {
    v31 = v42;
    v30 = v43;
    (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v14, enum case for ColorScheme.dark(_:), v43);
  }
  else
  {
    sub_100007AA4(&qword_100055E28, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v14);
    v31 = v42;
    v30 = v43;
  }
  v32 = *(_QWORD *)(v47 + 24);
  v33 = v45;
  View.colorScheme(_:)(v14, v45, v32);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v30);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v17, v33);
  v34 = sub_100008D24(&qword_100055F48, &qword_100055F40, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
  v49 = v32;
  v50 = v34;
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v19);
  v35 = v46;
  v36 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v36(v25, v22, v19);
  v37 = *(void (**)(char *, uint64_t))(v35 + 8);
  v37(v22, v19);
  v36(v48, v25, v19);
  return ((uint64_t (*)(char *, uint64_t))v37)(v25, v19);
}

uint64_t sub_1000058C4()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000058E0()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100008C44(v0, qword_100059040);
  sub_100007E94(v0, (uint64_t)qword_100059040);
  return Logger.init(subsystem:category:)(0xD000000000000010, 0x80000001000418C0, 0xD000000000000012, 0x80000001000427A0);
}

uint64_t sub_10000595C@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t, _QWORD, uint64_t);
  uint64_t v71;
  uint64_t OpaqueTypeConformance2;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;

  v2 = v1;
  v120 = a1;
  v105 = sub_100004A10(&qword_100055B30);
  v103 = *(_QWORD *)(v105 - 8);
  __chkstk_darwin(v105);
  v102 = (char *)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004A10(&qword_100055B28);
  v107 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v106 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = sub_100004A10(&qword_100055B20);
  v109 = *(_QWORD *)(v111 - 8);
  __chkstk_darwin(v111);
  v108 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = sub_100004A10(&qword_100055B18);
  v112 = *(_QWORD *)(v114 - 8);
  __chkstk_darwin(v114);
  v110 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = sub_100004A10(&qword_100055B10);
  v115 = *(_QWORD *)(v117 - 8);
  __chkstk_darwin(v117);
  v113 = (char *)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004A10(&qword_100055ED8);
  v118 = *(_QWORD *)(v9 - 8);
  v119 = v9;
  __chkstk_darwin(v9);
  v116 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for WidgetFamily(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for FMWidget(0);
  v99 = *(_QWORD *)(v15 - 8);
  v16 = *(_QWORD *)(v99 + 64);
  v17 = __chkstk_darwin(v15);
  v100 = (uint64_t)&v94 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v94 - v19;
  v104 = v18;
  v21 = (uint64_t *)(v1 + *(int *)(v18 + 24));
  v22 = *v21;
  v23 = v21[1];
  v101 = type metadata accessor for FriendProvider();
  swift_allocObject(v101, 48, 7);
  swift_bridgeObjectRetain(v23);
  v123 = sub_100008F54(v22, v23);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v121 = v12;
  v122 = v11;
  v24 = type metadata accessor for Logger(0);
  sub_100007E94(v24, (uint64_t)qword_100059040);
  v25 = sub_100007EAC(v2, (uint64_t)v20);
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = swift_slowAlloc(12, -1);
    v98 = v2;
    v29 = (uint8_t *)v28;
    v96 = swift_slowAlloc(32, -1);
    v126 = (_QWORD *)v96;
    *(_DWORD *)v29 = 136315138;
    v95 = v29 + 4;
    v97 = v4;
    sub_100007AA4(&qword_100055D78, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v14);
    v30 = sub_1000086D4(&qword_100055F00, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    v31 = v16;
    v32 = v14;
    v33 = v122;
    v34 = dispatch thunk of CustomStringConvertible.description.getter(v122, v30);
    v36 = v35;
    v37 = v32;
    v16 = v31;
    (*(void (**)(char *, uint64_t))(v121 + 8))(v37, v33);
    v124 = sub_100008084(v34, v36, (uint64_t *)&v126);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v124, &v125, v95, v29 + 12);
    v38 = v36;
    v4 = v97;
    swift_bridgeObjectRelease(v38);
    sub_100007EF0((uint64_t)v20);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "🥑 Avocado called (w/intents) Widget.body(%s)", v29, 0xCu);
    v39 = v96;
    swift_arrayDestroy(v96, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v39, -1, -1);
    v40 = v29;
    v2 = v98;
    swift_slowDealloc(v40, -1, -1);
  }
  else
  {
    sub_100007EF0((uint64_t)v20);
  }

  v41 = type metadata accessor for FriendSelectorIntent();
  v42 = v123;
  v126 = v123;
  v43 = v100;
  sub_100007EAC(v2, v100);
  v44 = *(unsigned __int8 *)(v99 + 80);
  v45 = (v44 + 16) & ~v44;
  v46 = swift_allocObject(&unk_100051D08, v45 + v16, v44 | 7);
  sub_100007FE4(v43, v46 + v45);
  swift_retain(v42);
  v47 = sub_100004A10(&qword_100055EE0);
  v48 = sub_100008D24(&qword_100055EE8, &qword_100055EE0, (uint64_t)&unk_100042838);
  v49 = sub_1000086D4(&qword_100055EF0, (uint64_t (*)(uint64_t))type metadata accessor for FriendProvider, (uint64_t)&unk_100042A04);
  v50 = v102;
  IntentConfiguration.init<A>(kind:intent:provider:content:)(0xD000000000000023, 0x8000000100041620, v41, &v126, sub_100008028, v46, v41, v47, v101, v48, v49);
  v51 = LocalizedStringKey.init(stringLiteral:)(0x20794D20646E6946, 0xEF73646E65697246);
  v52 = Text.init(_:tableName:bundle:comment:)(v51);
  v54 = v53;
  v56 = v55;
  v57 = v2;
  v59 = v58 & 1;
  v60 = sub_100008D24((unint64_t *)&qword_100055B38, &qword_100055B30, (uint64_t)&protocol conformance descriptor for IntentConfiguration<A, B>);
  v61 = v106;
  v62 = v105;
  WidgetConfiguration.configurationDisplayName(_:)(v52, v54, v59, v56, v105, v60);
  sub_100008074(v52, v54, v59);
  swift_bridgeObjectRelease(v56);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v50, v62);
  v63 = sub_100004A10(&qword_100055EF8);
  v64 = v121;
  v65 = *(_QWORD *)(v121 + 72);
  v66 = *(unsigned __int8 *)(v121 + 80);
  v67 = (v66 + 32) & ~v66;
  v68 = swift_allocObject(v63, v67 + 2 * v65, v66 | 7);
  *(_OWORD *)(v68 + 16) = xmmword_1000427B0;
  v69 = v68 + v67;
  v70 = *(void (**)(uint64_t, _QWORD, uint64_t))(v64 + 104);
  v71 = v122;
  v70(v69, enum case for WidgetFamily.systemSmall(_:), v122);
  v70(v69 + v65, enum case for WidgetFamily.systemMedium(_:), v71);
  v126 = (_QWORD *)v62;
  v127 = v60;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v73 = v108;
  WidgetConfiguration.supportedFamilies(_:)(v68, v4, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v68);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v61, v4);
  v74 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100041650);
  v75 = Text.init(_:tableName:bundle:comment:)(v74);
  v77 = v76;
  v79 = v78;
  v81 = v80 & 1;
  v126 = (_QWORD *)v4;
  v127 = OpaqueTypeConformance2;
  v82 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v84 = v110;
  v83 = v111;
  WidgetConfiguration.description(_:)(v75, v77, v81, v79, v111, v82);
  sub_100008074(v75, v77, v81);
  swift_bridgeObjectRelease(v79);
  (*(void (**)(char *, uint64_t))(v109 + 8))(v73, v83);
  LOBYTE(v69) = *(_BYTE *)(v57 + *(int *)(v104 + 20));
  v126 = (_QWORD *)v83;
  v127 = v82;
  v85 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v87 = v113;
  v86 = v114;
  WidgetConfiguration.visibilityConfigurableByInternalSettings(visibleByDefault:)((v69 & 1) == 0, v114, v85);
  (*(void (**)(char *, uint64_t))(v112 + 8))(v84, v86);
  v126 = (_QWORD *)v86;
  v127 = v85;
  v88 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of WidgetConfiguration.visibilityConfigurableByInternalSettings(visibleByDefault:)>>, 1);
  v90 = v116;
  v89 = v117;
  WidgetConfiguration._containerBackgroundRemovable(_:)(0, v117, v88);
  (*(void (**)(char *, uint64_t))(v115 + 8))(v87, v89);
  v126 = (_QWORD *)v89;
  v127 = v88;
  v91 = swift_getOpaqueTypeConformance2(&v126, &unk_1000442F4, 1);
  v92 = v119;
  WidgetConfiguration.supportsAccentedContent()(v119, v91);
  swift_release(v123);
  return (*(uint64_t (**)(char *, uint64_t))(v118 + 8))(v90, v92);
}

uint64_t sub_1000062E4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  uint64_t v16;

  v4 = sub_100004A10(&qword_100055F10);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin(v4);
  sub_100008CE0(a1, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100055F10);
  v7 = *(unsigned __int8 *)(v5 + 80);
  v8 = (v7 + 16) & ~v7;
  v9 = swift_allocObject(&unk_100051D30, v8 + v6, v7 | 7);
  sub_100008994((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  *a2 = swift_getKeyPath(&unk_1000428C8);
  v10 = sub_100004A10(&qword_100055E28);
  swift_storeEnumTagMultiPayload(a2, v10, 0);
  v11 = sub_100004A10(&qword_100055EE0);
  v12 = (_QWORD *)((char *)a2 + *(int *)(v11 + 36));
  *v12 = swift_getKeyPath(&unk_1000428F8);
  v13 = sub_100004A10(&qword_100055E30);
  result = swift_storeEnumTagMultiPayload(v12, v13, 0);
  v15 = (_QWORD *)((char *)a2 + *(int *)(v11 + 40));
  *v15 = sub_1000089DC;
  v15[1] = v9;
  return result;
}

uint64_t sub_100006418@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = sub_100004A10(&qword_100055F10);
  __chkstk_darwin(v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008CE0(a1, (uint64_t)v6, &qword_100055F10);
  return sub_10000649C((uint64_t)v6, a2);
}

uint64_t sub_10000649C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  Swift::String v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t result;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  _OWORD v50[14];
  uint64_t v51;

  *a2 = swift_getKeyPath(&unk_1000428C8);
  v4 = sub_100004A10(&qword_100055E28);
  swift_storeEnumTagMultiPayload(a2, v4, 0);
  v5 = (int *)sub_100004A10(&qword_100055F18);
  v6 = (_QWORD *)((char *)a2 + v5[9]);
  *v6 = swift_getKeyPath(&unk_100042928);
  v7 = sub_100004A10((uint64_t *)&unk_100056FC0);
  swift_storeEnumTagMultiPayload(v6, v7, 0);
  v8 = (_QWORD *)((char *)a2 + v5[10]);
  *v8 = swift_getKeyPath(&unk_1000428F8);
  v9 = sub_100004A10(&qword_100055E30);
  swift_storeEnumTagMultiPayload(v8, v9, 0);
  v10 = (_QWORD *)((char *)a2 + v5[12]);
  *v10 = 0;
  v10[1] = 0;
  v11 = v5[13];
  if (qword_100055AF8 != -1)
    swift_once(&qword_100055AF8, sub_10003DC34);
  v12 = (char *)a2 + v11;
  v13 = xmmword_100059228;
  v50[12] = xmmword_100059238;
  v50[13] = xmmword_100059248;
  v14 = xmmword_1000591E8;
  v15 = xmmword_1000591F8;
  v50[8] = xmmword_1000591F8;
  v50[9] = xmmword_100059208;
  v16 = xmmword_100059208;
  v17 = xmmword_100059218;
  v50[10] = xmmword_100059218;
  v50[11] = xmmword_100059228;
  v18 = xmmword_1000591A8;
  v19 = xmmword_1000591B8;
  v50[4] = xmmword_1000591B8;
  v50[5] = xmmword_1000591C8;
  v20 = xmmword_1000591C8;
  v21 = xmmword_1000591D8;
  v50[6] = xmmword_1000591D8;
  v50[7] = xmmword_1000591E8;
  v22 = xmmword_100059188;
  v23 = xmmword_100059198;
  v50[2] = xmmword_100059198;
  v50[3] = xmmword_1000591A8;
  v24 = xmmword_100059248;
  *((_OWORD *)v12 + 12) = xmmword_100059238;
  *((_OWORD *)v12 + 13) = v24;
  *((_OWORD *)v12 + 8) = v15;
  *((_OWORD *)v12 + 9) = v16;
  *((_OWORD *)v12 + 10) = v17;
  *((_OWORD *)v12 + 11) = v13;
  *((_OWORD *)v12 + 4) = v19;
  *((_OWORD *)v12 + 5) = v20;
  *((_OWORD *)v12 + 6) = v21;
  *((_OWORD *)v12 + 7) = v14;
  v25 = xmmword_100059188;
  *(_OWORD *)v12 = xmmword_100059178;
  *((_OWORD *)v12 + 1) = v22;
  v51 = qword_100059258;
  *((_OWORD *)v12 + 2) = v23;
  *((_OWORD *)v12 + 3) = v18;
  v26 = xmmword_100059178;
  *((_QWORD *)v12 + 28) = qword_100059258;
  v27 = (uint64_t)a2 + v5[11];
  v50[0] = v26;
  v50[1] = v25;
  sub_100008CE0(a1, v27, &qword_100055F10);
  sub_100008AE8(v50);
  v28 = sub_100004A10(&qword_100055F20);
  v29 = sub_100008D24(&qword_100055F28, &qword_100055F20, (uint64_t)&protocol conformance descriptor for UnsafePointer<A>);
  v30 = _Pointer.debugDescription.getter(v28, v29);
  v32 = v31;
  v33 = sub_100008B1C(9uLL, v30, v31);
  v35 = v34;
  v48 = 7876668;
  v49 = 0xE300000000000000;
  v44 = v33;
  v45 = v36;
  v46 = v37;
  v47 = v34;
  v38 = sub_100008BC4();
  String.append<A>(contentsOf:)(&v44, &type metadata for Substring, v38);
  swift_bridgeObjectRelease(v35);
  v39 = v49;
  v44 = v48;
  v45 = v49;
  swift_bridgeObjectRetain(v49);
  v40._countAndFlagsBits = 15987;
  v40._object = (void *)0xE200000000000000;
  String.append(_:)(v40);
  swift_bridgeObjectRelease(v32);
  swift_bridgeObjectRelease(v39);
  v41 = v44;
  v42 = v45;
  sub_100008C08(a1, &qword_100055F10);
  result = swift_bridgeObjectRelease(v10[1]);
  *v10 = v41;
  v10[1] = v42;
  return result;
}

uint64_t sub_100006750@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  unint64_t v17;
  Swift::String v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = swift_getKeyPath(&unk_100042958);
  v6 = sub_100004A10(&qword_100055D78);
  swift_storeEnumTagMultiPayload(a1, v6, 0);
  v7 = type metadata accessor for FMWidget(0);
  v8 = *(int *)(v7 + 20);
  sub_100008CA4();
  *((_BYTE *)a1 + v8) = static FMSystemInfo.isKoreaSKU()() & 1;
  v9 = (_QWORD *)((char *)a1 + *(int *)(v7 + 24));
  v10 = UUID.init()();
  v11 = UUID.uuidString.getter(v10);
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_100008B1C(8uLL, v11, v13);
  v15 = v14;
  swift_bridgeObjectRelease(v13);
  v16 = Substring.lowercased()();
  swift_bridgeObjectRelease(v15);
  v21 = 60;
  v22 = 0xE100000000000000;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v16._object);
  v17 = v22;
  swift_bridgeObjectRetain(v22);
  v18._countAndFlagsBits = 62;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  result = swift_bridgeObjectRelease(v17);
  v20 = v22;
  *v9 = v21;
  v9[1] = v20;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for FMWidget(0);
  v4 = sub_1000086D4(&qword_100055D70, type metadata accessor for FMWidget, (uint64_t)&unk_100042888);
  static Widget.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for FMWidget(uint64_t a1)
{
  uint64_t result;

  result = qword_100055DE0;
  if (!qword_100055DE0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FMWidget);
  return result;
}

_QWORD *sub_100006978(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_100004A10(&qword_100055D78);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v15 = (_QWORD *)((char *)a1 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain(v17);
  }
  return a1;
}

uint64_t sub_100006A64(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100004A10(&qword_100055D78);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  return swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + *(int *)(a2 + 24) + 8));
}

_QWORD *sub_100006AD8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = sub_100004A10(&qword_100055D78);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  return a1;
}

_QWORD *sub_100006B98(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055D78);
    v6 = sub_100004A10(&qword_100055D78);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  *v13 = *v14;
  v15 = v14[1];
  v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  return a1;
}

char *sub_100006C88(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_100004A10(&qword_100055D78);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  return a1;
}

char *sub_100006D38(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055D78);
    v6 = sub_100004A10(&qword_100055D78);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  v13 = *((_QWORD *)v9 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_bridgeObjectRelease(v13);
  return a1;
}

uint64_t sub_100006E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006E1C);
}

uint64_t sub_100006E1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100004A10(&qword_100055D80);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_100006EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006EAC);
}

uint64_t sub_100006EAC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100004A10(&qword_100055D80);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

void sub_100006F2C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_100007950(319, (unint64_t *)&unk_100055DF0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_1000427E0;
    v4[2] = &unk_1000427F8;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

uint64_t sub_100006FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_100006FC0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  sub_100007950(319, (unint64_t *)&qword_100055EC8, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100007950(319, &qword_100055ED0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = (char *)&value witness table for () + 64;
      swift_initStructMetadata(a1, 0, 3, v6, a1 + 32);
    }
  }
}

uint64_t *sub_100007070(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 36);
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = *(int *)(a3 + 40);
    v24 = (uint64_t *)((char *)a1 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    v12 = v25[1];
    *v24 = *v25;
    v24[1] = v12;
  }
  swift_retain(v12);
  return a1;
}

uint64_t sub_1000071D4(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 36));
  v7 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  return swift_release(*(_QWORD *)((char *)a1 + *(int *)(a2 + 40) + 8));
}

uint64_t *sub_1000072A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 36);
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = *(int *)(a3 + 40);
  v22 = (uint64_t *)((char *)a1 + v21);
  v23 = (uint64_t *)((char *)a2 + v21);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  swift_retain(v24);
  return a1;
}

uint64_t *sub_1000073DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = *(int *)(a3 + 36);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_100008C08((uint64_t)a1 + v12, &qword_100055E30);
    v15 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = *(int *)(a3 + 40);
  v22 = (uint64_t *)((char *)a1 + v21);
  v23 = (uint64_t *)((char *)a2 + v21);
  v24 = v23[1];
  v25 = v22[1];
  *v22 = *v23;
  v22[1] = v24;
  swift_retain(v24);
  swift_release(v25);
  return a1;
}

char *sub_10000754C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 36);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 40)] = *(_OWORD *)&a2[*(int *)(a3 + 40)];
  return a1;
}

char *sub_100007674(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 36);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_100008C08((uint64_t)&a1[v8], &qword_100055E30);
    v11 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = *(int *)(a3 + 40);
  v14 = *(_QWORD *)&a1[v13 + 8];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  swift_release(v14);
  return a1;
}

uint64_t sub_1000077D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000077DC);
}

uint64_t sub_1000077DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_100004A10(&qword_100055E38);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_100004A10(qword_100055E40);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 36);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 40));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_10000788C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007898);
}

uint64_t sub_100007898(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_100004A10(&qword_100055E38);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_100004A10(qword_100055E40);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 36);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for ContentViewWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008D64(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ContentViewWrapper);
}

void sub_100007950(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Environment.Content(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_10000799C(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &unk_100044474, 1);
}

uint64_t sub_1000079D0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004444C, 1);
}

uint64_t sub_1000079E0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100007A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007D44(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100007A14()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100007A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007D44(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_100007A48@<X0>(uint64_t a1@<X8>)
{
  return sub_100007AA4(&qword_100055E30, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x80000001000418E0, a1);
}

uint64_t sub_100007A74@<X0>(uint64_t a1@<X8>)
{
  return sub_100007AA4(&qword_100055E28, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_100007AA4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a3;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100004A10(a1);
  __chkstk_darwin();
  v17 = (uint64_t *)((char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100008CE0(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload(v17, v15) == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = *v17;
    v21 = static os_log_type_t.fault.getter();
    v22 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v22, v21))
    {
      v27 = a4;
      v23 = swift_slowAlloc(12, -1);
      v28 = a5;
      v24 = (uint8_t *)v23;
      v25 = swift_slowAlloc(32, -1);
      v31 = v25;
      *(_DWORD *)v24 = 136315138;
      v30 = sub_100008084(v29, v27, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v24 + 4, v24 + 12);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v24, 0xCu);
      swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v14, v20);
    swift_release(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_100007CDC@<X0>(uint64_t a1@<X8>)
{
  return sub_100007AA4((uint64_t *)&unk_100056FC0, (uint64_t (*)(_QWORD))&type metadata accessor for LayoutDirection, 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t sub_100007D10()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100007D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007D44(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

uint64_t sub_100007D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  __chkstk_darwin();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_100007DC0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100007DD0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100007E04(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100007E24(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_100008084(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_100007E94(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100007EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FMWidget(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007EF0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FMWidget(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for FMWidget(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_100004A10(&qword_100055D78);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v6 + *(int *)(v1 + 24) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100007FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FMWidget(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008028@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  type metadata accessor for FMWidget(0);
  return sub_1000062E4(a1, a2);
}

uint64_t sub_100008074(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100008084(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100008154(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100008734((uint64_t)v12, *a3);
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
      sub_100008734((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100008714(v12);
  return v7;
}

uint64_t sub_100008154(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000830C(a5, a6);
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

uint64_t sub_10000830C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000083A0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100008578(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100008578(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000083A0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100008514(v4, 0);
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

_QWORD *sub_100008514(uint64_t a1, uint64_t a2)
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
  v4 = sub_100004A10(&qword_100055F08);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100008578(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004A10(&qword_100055F08);
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

_BYTE **sub_1000086C4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1000086D4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100008714(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100008734(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int *v13;
  char *v14;
  void **v15;
  int v16;
  void **v17;
  int v18;
  uint64_t v19;

  v1 = sub_100004A10(&qword_100055F10);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v8(v0 + v4, v6);
  v9 = v0 + v4 + *(int *)(v1 + 36);
  v10 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = type metadata accessor for ViewContext(0);
  swift_release(*(_QWORD *)(v9 + *(int *)(v11 + 24)));
  v12 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 40));
  swift_bridgeObjectRelease(v12[1]);
  swift_bridgeObjectRelease(v12[3]);
  swift_bridgeObjectRelease(v12[5]);
  v13 = (int *)type metadata accessor for FriendModel(0);
  v14 = (char *)v12 + v13[13];
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1, v6))
    v8((uint64_t)v14, v6);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v12 + v13[14] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v12 + v13[16] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v12 + v13[17] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v12 + v13[18] + 8));
  v15 = (void **)((char *)v12 + v13[21]);
  v16 = *((unsigned __int8 *)v15 + 16);
  if (v16 != 255)
    sub_100008950(*v15, v15[1], v16 & 1);
  v17 = (void **)((char *)v12 + v13[25]);
  v18 = *((unsigned __int8 *)v17 + 16);
  if (v18 != 255)
    sub_100008950(*v17, v17[1], v18 & 1);
  v19 = *(_QWORD *)((char *)v12 + v13[28] + 16);
  if (v19 != 1)
    swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v12 + v13[29] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v12 + v13[30] + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

void sub_100008950(void *a1, void *a2, char a3)
{

  if ((a3 & 1) != 0)
}

uint64_t sub_100008994(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004A10(&qword_100055F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000089DC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_100004A10(&qword_100055F10) - 8) + 80);
  return sub_100006418(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_100008A1C()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100008A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007D44(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100008A60()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100008A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007D44(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_100008AA4()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100008AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007D44(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

_QWORD *sub_100008AE8(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[1];
  swift_retain(*a1);
  swift_retain(v2);
  return a1;
}

unint64_t sub_100008B1C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    result = String.index(_:offsetBy:limitedBy:)(v4 | (v3 << 16), -(uint64_t)result, 15, a2, a3);
    if ((v5 & 1) != 0)
      result = 15;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

unint64_t sub_100008BC4()
{
  unint64_t result;

  result = qword_100055F30;
  if (!qword_100055F30)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Substring, &type metadata for Substring);
    atomic_store(result, (unint64_t *)&qword_100055F30);
  }
  return result;
}

uint64_t sub_100008C08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004A10(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_100008C44(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100008C84()
{
  return EnvironmentValues.widgetFamily.getter();
}

unint64_t sub_100008CA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100055F38;
  if (!qword_100055F38)
  {
    v1 = objc_opt_self(FMSystemInfo);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100055F38);
  }
  return result;
}

uint64_t sub_100008CE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004A10(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008D24(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004A50(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_100008D90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t OpaqueTypeConformance2;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_100004A50(&qword_100055ED8);
  v1 = sub_100004A50(&qword_100055B10);
  v2 = sub_100004A50(&qword_100055B18);
  v3 = sub_100004A50(&qword_100055B20);
  v4 = sub_100004A50(&qword_100055B28);
  v11 = sub_100004A50(&qword_100055B30);
  v12 = sub_100008D24((unint64_t *)&qword_100055B38, &qword_100055B30, (uint64_t)&protocol conformance descriptor for IntentConfiguration<A, B>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v11 = v4;
  v12 = OpaqueTypeConformance2;
  v6 = swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v11 = v3;
  v12 = v6;
  v7 = swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v11 = v2;
  v12 = v7;
  v8 = swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.visibilityConfigurableByInternalSettings(visibleByDefault:)>>, 1);
  v11 = v1;
  v12 = v8;
  v9 = swift_getOpaqueTypeConformance2(&v11, &unk_1000442F4, 1);
  v11 = v0;
  v12 = v9;
  return swift_getOpaqueTypeConformance2(&v11, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportsAccentedContent()>>, 1);
}

uint64_t sub_100008ED4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = sub_100004A50(&qword_100055F40);
  v3 = type metadata accessor for ModifiedContent(255, v1, v2);
  sub_100008D24(&qword_100055F48, &qword_100055F40, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
  return swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v3);
}

_QWORD *sub_100008F54(uint64_t a1, unint64_t a2)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;

  v32 = a2;
  v30 = a1;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B9B8();
  static DispatchQoS.userInitiated.getter();
  v34 = &_swiftEmptyArrayStorage;
  v12 = sub_1000086D4(&qword_100056020, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v13 = sub_100004A10(&qword_100056028);
  v14 = sub_100008D24((unint64_t *)&qword_100056030, &qword_100056028, (uint64_t)&protocol conformance descriptor for [A]);
  v15 = v12;
  v16 = v30;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v34, v13, v14, v6, v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  v17 = v11;
  v18 = v31;
  v19 = v32;
  v18[4] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000018, 0x8000000100041960, v17, v8, v5, 0);
  v20 = sub_100004A10(&qword_100056038);
  v18[5] = swift_allocObject(v20, 16, 7);
  v18[2] = v16;
  v18[3] = v19;
  v21 = qword_100055AC8;
  swift_bridgeObjectRetain(v19);
  if (v21 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v22 = type metadata accessor for Logger(0);
  sub_100007E94(v22, (uint64_t)qword_100059040);
  v23 = swift_bridgeObjectRetain(v19);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(12, -1);
    v27 = (void *)swift_slowAlloc(32, -1);
    v34 = v27;
    *(_DWORD *)v26 = 136315138;
    swift_bridgeObjectRetain(v19);
    v33 = sub_100008084(v16, v19, (uint64_t *)&v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease_n(v19, 3);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "🥑 FriendProvider%s: init", v26, 0xCu);
    swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v26, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v19, 2);
  }
  return v18;
}

uint64_t sub_1000092A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v2 = type metadata accessor for Logger(0);
  sub_100007E94(v2, (uint64_t)qword_100059040);
  v3 = swift_retain(v0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = *(_QWORD *)(v1 + 16);
    v9 = *(_QWORD *)(v1 + 24);
    swift_bridgeObjectRetain(v9);
    v11 = sub_100008084(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    swift_release(v1);
    swift_bridgeObjectRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "🥑 FriendProvider%s: deinit", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_release(v1);
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 24));

  swift_release(*(_QWORD *)(v1 + 40));
  return v1;
}

uint64_t sub_100009464()
{
  uint64_t v0;

  sub_1000092A8();
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for FriendProvider()
{
  return objc_opt_self(_TtC18FindMyWidgetPeople14FriendProvider);
}

uint64_t sub_1000094A4()
{
  return sub_100008D24(qword_100056000, &qword_100055F10, (uint64_t)&unk_100042AF0);
}

uint64_t sub_1000094D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[48];
  _OWORD v57[2];

  v3 = v2;
  v51 = a1;
  v54 = a2;
  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for WidgetFamily(0);
  v53 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v52 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = type metadata accessor for ViewContext(0);
  __chkstk_darwin(v50);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for FriendModel(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v15 = type metadata accessor for Logger(0);
  sub_100007E94(v15, (uint64_t)qword_100059040);
  v16 = swift_retain(v2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc(12, -1);
    v49 = v4;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc(32, -1);
    v48 = v5;
    v22 = v21;
    *(_QWORD *)&v57[0] = v21;
    *(_DWORD *)v20 = 136315138;
    v46 = v11;
    v45 = v8;
    v47 = v7;
    v23 = *(_QWORD *)(v3 + 16);
    v24 = *(_QWORD *)(v3 + 24);
    swift_bridgeObjectRetain(v24);
    v55 = sub_100008084(v23, v24, (uint64_t *)v57);
    v8 = v45;
    v11 = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, v56, v20 + 4, v20 + 12);
    swift_release(v3);
    v25 = v24;
    v7 = v47;
    swift_bridgeObjectRelease(v25);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "🥑🥑 FriendProvider%s: asked and delivered placeholder", v20, 0xCu);
    swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
    v26 = v22;
    v5 = v48;
    swift_slowDealloc(v26, -1, -1);
    v27 = v20;
    v4 = v49;
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

    v28 = swift_release(v3);
  }
  v29 = TimelineProviderContext.displaySize.getter(v28);
  v31 = v30;
  sub_10000ECC8(2u, 1, 0, 0, 0, 0, (unint64_t)v14);
  memset(v57, 0, sizeof(v57));
  v32 = sub_100004A10(qword_100056078);
  inited = swift_initStackObject(v32, v56);
  v34 = sub_10000BCDC((uint64_t)v57, inited + 16);
  v35 = v52;
  TimelineProviderContext.family.getter(v34);
  v36 = v53;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v11, v35, v8);
  if (qword_100055AD0 != -1)
    swift_once(&qword_100055AD0, sub_10000D670);
  v37 = qword_100056220;
  v38 = v50;
  v39 = (double *)&v11[*(int *)(v50 + 20)];
  *v39 = v29;
  *((_QWORD *)v39 + 1) = v31;
  *(_QWORD *)&v11[*(int *)(v38 + 24)] = v37;
  swift_retain(v37);
  swift_release(inited);
  v40 = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v35, v8);
  Date.init()(v40);
  v41 = v54;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v54, v7, v4);
  v42 = sub_100004A10(&qword_100055F10);
  sub_10000BD24((uint64_t)v11, v41 + *(int *)(v42 + 36), type metadata accessor for ViewContext);
  sub_10000BD24((uint64_t)v14, v41 + *(int *)(v42 + 40), type metadata accessor for FriendModel);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_10000BD68((uint64_t)v11, type metadata accessor for ViewContext);
  return sub_10000BD68((uint64_t)v14, type metadata accessor for FriendModel);
}

uint64_t sub_10000994C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v5 = v4;
  v10 = type metadata accessor for WidgetFamily(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = a2;
  v15 = TimelineProviderContext.displaySize.getter(v12);
  v17 = v16;
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v18 = type metadata accessor for Logger(0);
  sub_100007E94(v18, (uint64_t)qword_100059040);
  v19 = a1;
  swift_retain(v5);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v41 = v11;
    v42 = v10;
    v43 = a3;
    v39 = a4;
    v23 = swift_slowAlloc(22, -1);
    v24 = swift_slowAlloc(64, -1);
    v46 = v24;
    *(_DWORD *)v23 = 136315394;
    v25 = *(_QWORD *)(v5 + 16);
    v26 = *(_QWORD *)(v5 + 24);
    swift_bridgeObjectRetain(v26);
    v45 = sub_100008084(v25, v26, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v23 + 4, v23 + 12);
    swift_release(v5);
    *(_QWORD *)&v27 = swift_bridgeObjectRelease(v26).n128_u64[0];
    *(_WORD *)(v23 + 12) = 2080;
    v28 = objc_msgSend(v19, "contact", v27);
    v40 = v24;
    if (v28
      && (v29 = v28, v30 = objc_msgSend(v28, "handle"), v29, v30))
    {
      v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      v33 = v32;

      v34 = v31;
      v35 = v33;
      a4 = v39;
    }
    else
    {
      a4 = v39;
      v35 = 0xA90000000000008FLL;
      v34 = 0xB8EF8981E26C696ELL;
    }
    v45 = sub_100008084(v34, v35, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v23 + 14, v23 + 22);

    swift_bridgeObjectRelease(v35);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "🥑 FriendProvider%s: asking snapshot for %s…", (uint8_t *)v23, 0x16u);
    v37 = v40;
    swift_arrayDestroy(v40, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v23, -1, -1);

    v10 = v42;
    a3 = v43;
    v11 = v41;
  }
  else
  {

    v36 = swift_release(v5);
  }
  TimelineProviderContext.family.getter(v36);
  sub_100009C74(v19, (uint64_t)v14, a3, a4, v15, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

void sub_100009C74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  double v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  double v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  os_log_type_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void (*v51)(_QWORD, _QWORD, _QWORD);
  uint64_t v52;
  double v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  double *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  _QWORD *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  char *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  void (*v94)(char *, uint64_t);
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  double *v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  _QWORD *v109;
  id v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  void (*v117)(_QWORD, _QWORD, _QWORD);
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  char *v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  id v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _QWORD *v137;
  uint64_t aBlock[5];
  uint64_t v139;

  v7 = v6;
  v133 = a3;
  v134 = a4;
  v136 = a2;
  v127 = type metadata accessor for DispatchTimeInterval(0);
  v126 = *(_QWORD *)(v127 - 8);
  __chkstk_darwin(v127);
  v125 = (uint64_t *)((char *)&v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v128 = type metadata accessor for DispatchTime(0);
  v123 = *(_QWORD *)(v128 - 8);
  v12 = __chkstk_darwin(v128);
  v122 = (char *)&v113 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v124 = (char *)&v113 - v14;
  v120 = type metadata accessor for DispatchWorkItemFlags(0);
  __chkstk_darwin(v120);
  v121 = (char *)&v113 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = type metadata accessor for WidgetFamily(0);
  v119 = *(_QWORD *)(v132 - 8);
  __chkstk_darwin(v132);
  v118 = v16;
  v131 = (char *)&v113 - ((unint64_t)(v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Date(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v113 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v21 = type metadata accessor for Logger(0);
  sub_100007E94(v21, (uint64_t)qword_100059040);
  v22 = a1;
  swift_retain(v6);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  v26 = os_log_type_enabled(v24, (os_log_type_t)v25);
  v129 = v22;
  v135 = v7;
  if (v26)
  {
    LODWORD(v115) = v25;
    v130 = v18;
    v116 = (char *)v17;
    v27 = swift_slowAlloc(42, -1);
    v117 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc(128, -1);
    aBlock[0] = (uint64_t)v117;
    *(_DWORD *)v27 = 136315906;
    v28 = *(_QWORD *)(v7 + 16);
    v29 = *(_QWORD *)(v7 + 24);
    swift_bridgeObjectRetain(v29);
    v137 = (_QWORD *)sub_100008084(v28, v29, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, aBlock, v27 + 4, v27 + 12);
    swift_release(v7);
    swift_bridgeObjectRelease(v29);
    *(_WORD *)(v27 + 12) = 2080;
    v30 = CGSize.debugDescription.getter(a5, a6);
    v32 = v31;
    v137 = (_QWORD *)sub_100008084(v30, v31, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, aBlock, v27 + 14, v27 + 22);
    *(_QWORD *)&v33 = swift_bridgeObjectRelease(v32).n128_u64[0];
    *(_WORD *)(v27 + 22) = 2080;
    v34 = objc_msgSend(v22, "contact", v33);
    if (v34
      && (v35 = v34, v36 = objc_msgSend(v34, "identifier"), v35, v36))
    {
      v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
      v39 = v38;

    }
    else
    {
      v39 = 0xE300000000000000;
      v37 = 7104878;
    }
    v137 = (_QWORD *)sub_100008084(v37, v39, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, aBlock, v27 + 24, v27 + 32);
    v41 = v129;

    *(_QWORD *)&v42 = swift_bridgeObjectRelease(v39).n128_u64[0];
    *(_WORD *)(v27 + 32) = 2080;
    v43 = v41;
    v44 = objc_msgSend(v41, "contact", v42);
    if (v44)
    {
      v45 = v44;
      v46 = objc_msgSend(v44, "handle");

      v17 = (uint64_t)v116;
      v47 = v115;
      if (v46)
      {
        v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
        v50 = v49;

      }
      else
      {
        v48 = 0;
        v50 = 0xE000000000000000;
      }
    }
    else
    {
      v48 = 0;
      v50 = 0xE000000000000000;
      v17 = (uint64_t)v116;
      v47 = v115;
    }
    v137 = (_QWORD *)sub_100008084(v48, v50, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, aBlock, v27 + 34, v27 + 42);

    swift_bridgeObjectRelease(v50);
    _os_log_impl((void *)&_mh_execute_header, v24, v47, "🥑🥑 FriendProvider%s: asking current entry %s for %s (%s)…", (uint8_t *)v27, 0x2Au);
    v51 = v117;
    swift_arrayDestroy(v117, 4, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v27, -1, -1);

    v7 = v135;
    v18 = v130;
  }
  else
  {

    v40 = swift_release(v7);
  }
  v52 = Date.init()(v40);
  v53 = Date.timeIntervalSinceReferenceDate.getter(v52);
  v54 = *(void (**)(char *, uint64_t))(v18 + 8);
  v54(v20, v17);
  v55 = type metadata accessor for UserDefaultsManager();
  v56 = swift_allocObject(v55, 16, 7);
  v57 = *(_QWORD *)(v7 + 16);
  v58 = *(_QWORD *)(v7 + 24);
  objc_allocWithZone((Class)type metadata accessor for DataManager());
  swift_bridgeObjectRetain(v58);
  v59 = (char *)sub_10002B4BC(v56, v57, v58, v53);
  v60 = swift_allocObject(&unk_100051E08, 17, 7);
  *(_BYTE *)(v60 + 16) = 0;
  v61 = Date.init()(v60);
  v62 = Date.timeIntervalSinceReferenceDate.getter(v61);
  v54(v20, v17);
  v63 = fmax(v53 - v62 + 28.0, 1.0);
  if ((~*(_QWORD *)&v63 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v63 <= -9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v63 < 9.22337204e18)
  {
    v113 = (uint64_t)v63;
    v64 = v119;
    v117 = *(void (**)(_QWORD, _QWORD, _QWORD))(v119 + 16);
    v65 = v131;
    v130 = v60;
    v117(v131, v136, v132);
    v115 = *(unsigned __int8 *)(v64 + 80);
    v66 = (v115 + 24) & ~v115;
    v114 = v115 | 7;
    v116 = v118 + 7;
    v118 = v59;
    v67 = (unint64_t)&v116[v66] & 0xFFFFFFFFFFFFFFF8;
    v68 = (v67 + 23) & 0xFFFFFFFFFFFFFFF8;
    v69 = (v68 + 15) & 0xFFFFFFFFFFFFFFF8;
    v70 = (v69 + 15) & 0xFFFFFFFFFFFFFFF8;
    v71 = (v70 + 15) & 0xFFFFFFFFFFFFFFF8;
    v72 = swift_allocObject(&unk_100051E30, v71 + 16, v115 | 7);
    *(_QWORD *)(v72 + 16) = v60;
    v119 = *(_QWORD *)(v64 + 32);
    v73 = v65;
    v74 = v132;
    ((void (*)(uint64_t, char *, uint64_t))v119)(v72 + v66, v73, v132);
    v75 = (double *)(v72 + v67);
    *v75 = a5;
    v75[1] = a6;
    v76 = v135;
    *(_QWORD *)(v72 + v68) = v135;
    v77 = v113;
    *(_QWORD *)(v72 + v69) = v113;
    v78 = v129;
    *(_QWORD *)(v72 + v70) = v129;
    v79 = (_QWORD *)(v72 + v71);
    v80 = v134;
    *v79 = v133;
    v79[1] = v80;
    aBlock[4] = (uint64_t)sub_10000BAFC;
    v139 = v72;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000B164;
    aBlock[3] = (uint64_t)&unk_100051E48;
    v81 = _Block_copy(aBlock);
    v137 = _swiftEmptyArrayStorage;
    v82 = sub_1000086D4(&qword_100056040, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v129 = v78;
    swift_retain(v76);
    swift_retain(v130);
    swift_retain(v80);
    v83 = sub_100004A10(&qword_100056048);
    v84 = sub_100008D24((unint64_t *)&qword_100056050, &qword_100056048, (uint64_t)&protocol conformance descriptor for [A]);
    v85 = v121;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v137, v83, v84, v120, v82);
    v86 = type metadata accessor for DispatchWorkItem(0);
    swift_allocObject(v86, *(unsigned int *)(v86 + 48), *(unsigned __int16 *)(v86 + 52));
    v87 = DispatchWorkItem.init(flags:block:)(v85, v81);
    swift_release(v139);
    sub_10000B9B8();
    v88 = (void *)static OS_dispatch_queue.main.getter();
    v89 = v122;
    static DispatchTime.now()(v88);
    v90 = v125;
    *v125 = v77;
    v91 = v126;
    v92 = v127;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v126 + 104))(v90, enum case for DispatchTimeInterval.seconds(_:), v127);
    v93 = v124;
    + infix(_:_:)(v89, v90);
    (*(void (**)(uint64_t *, uint64_t))(v91 + 8))(v90, v92);
    v94 = *(void (**)(char *, uint64_t))(v123 + 8);
    v95 = v128;
    v94(v89, v128);
    OS_dispatch_queue.asyncAfter(deadline:execute:)(v93, v87);

    v94(v93, v95);
    v96 = v131;
    v97 = v74;
    v117(v131, v136, v74);
    v98 = (v115 + 32) & ~v115;
    v99 = (unint64_t)&v116[v98] & 0xFFFFFFFFFFFFFFF8;
    v100 = (v99 + 23) & 0xFFFFFFFFFFFFFFF8;
    v101 = (v100 + 15) & 0xFFFFFFFFFFFFFFF8;
    v102 = (v101 + 15) & 0xFFFFFFFFFFFFFFF8;
    v103 = swift_allocObject(&unk_100051E80, v102 + 16, v114);
    v104 = v130;
    *(_QWORD *)(v103 + 16) = v130;
    *(_QWORD *)(v103 + 24) = v87;
    ((void (*)(uint64_t, char *, uint64_t))v119)(v103 + v98, v96, v97);
    v105 = (double *)(v103 + v99);
    *v105 = a5;
    v105[1] = a6;
    v107 = v134;
    v106 = v135;
    *(_QWORD *)(v103 + v100) = v135;
    v108 = v129;
    *(_QWORD *)(v103 + v101) = v129;
    v109 = (_QWORD *)(v103 + v102);
    *v109 = v133;
    v109[1] = v107;
    v110 = v108;
    swift_retain(v106);
    v111 = v104;
    swift_retain(v104);
    swift_retain(v107);
    swift_retain(v87);
    v112 = v118;
    sub_10002BB30(v112, v110, v136, (uint64_t)sub_10000BC5C, v103, a5, a6);
    swift_release(v111);
    swift_release(v103);
    swift_release(v87);

    return;
  }
LABEL_21:
  __break(1u);
}

uint64_t sub_10000A6CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v5 = v4;
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v10 = type metadata accessor for Logger(0);
  sub_100007E94(v10, (uint64_t)qword_100059040);
  v11 = a1;
  swift_retain(v5);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v30 = a4;
    v31 = a2;
    v15 = swift_slowAlloc(22, -1);
    v16 = swift_slowAlloc(64, -1);
    v34 = v16;
    *(_DWORD *)v15 = 136315394;
    v17 = *(_QWORD *)(v5 + 16);
    v18 = *(_QWORD *)(v5 + 24);
    swift_bridgeObjectRetain(v18);
    v33 = sub_100008084(v17, v18, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v15 + 4, v15 + 12);
    swift_release(v5);
    *(_QWORD *)&v19 = swift_bridgeObjectRelease(v18).n128_u64[0];
    *(_WORD *)(v15 + 12) = 2080;
    v20 = objc_msgSend(v11, "contact", v19);
    v32 = v16;
    if (v20
      && (v21 = v20, v22 = objc_msgSend(v20, "handle"), v21, v22))
    {
      v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
      v25 = v24;

      v26 = v23;
      v27 = v25;
      a4 = v30;
      a2 = v31;
    }
    else
    {
      a4 = v30;
      a2 = v31;
      v27 = 0xA90000000000008FLL;
      v26 = 0xB8EF8981E26C696ELL;
    }
    v33 = sub_100008084(v26, v27, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v15 + 14, v15 + 22);

    swift_bridgeObjectRelease(v27);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "🥑 FriendProvider%s: asking timeline for %s…", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v15, -1, -1);

  }
  else
  {

    swift_release(v5);
  }
  v28 = swift_allocObject(&unk_100051DE0, 32, 7);
  *(_QWORD *)(v28 + 16) = a3;
  *(_QWORD *)(v28 + 24) = a4;
  swift_retain(a4);
  sub_10000994C(v11, a2, (uint64_t)sub_10000BA18, v28);
  return swift_release(v28);
}

uint64_t sub_10000A9AC(uint64_t a1, void (*a2)(char *))
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void (*v21)(char *);

  v21 = a2;
  v3 = type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100004A10(&qword_100056068);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004A10(&qword_100056070);
  v11 = sub_100004A10(&qword_100055F10);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 72);
  v14 = *(unsigned __int8 *)(v12 + 80);
  v15 = (v14 + 32) & ~v14;
  v16 = swift_allocObject(v10, v15 + v13, v14 | 7);
  *(_OWORD *)(v16 + 16) = xmmword_1000429B0;
  v17 = sub_100008CE0(a1, v16 + v15, &qword_100055F10);
  static TimelineReloadPolicy.atEnd.getter(v17);
  v18 = sub_100008D24(qword_100056000, &qword_100055F10, (uint64_t)&unk_100042AF0);
  Timeline.init(entries:policy:)(v16, v5, v11, v18);
  v21(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_10000AB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, void (*a6)(char *), uint64_t a7, double a8, double a9)
{
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t inited;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *);
  uint64_t v64;
  uint64_t v65;
  _BYTE v66[16];
  _BYTE v67[32];
  uint64_t v68[4];
  char v69[24];

  v62 = a7;
  v63 = a6;
  v60 = a5;
  v58 = a4;
  v61 = a3;
  v64 = a2;
  v12 = type metadata accessor for Date(0);
  v59 = *(_QWORD *)(v12 - 8);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v57 - v16;
  v18 = sub_100004A10(&qword_100055F10);
  __chkstk_darwin(v18);
  v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for ViewContext(0);
  __chkstk_darwin(v21);
  v23 = (char *)&v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for FriendModel(0);
  __chkstk_darwin(v24);
  v26 = (char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess(a1 + 16, v69, 1, 0);
  *(_BYTE *)(a1 + 16) = 1;
  sub_10000ECC8(2u, 0, 0, 0, 0, 1, (unint64_t)v26);
  v27 = type metadata accessor for UserDefaultsManager();
  inited = swift_initStackObject(v27, v66);
  v68[3] = v27;
  v68[0] = inited;
  sub_10000BCDC((uint64_t)v68, (uint64_t)v67);
  v29 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v23, v64, v29);
  if (qword_100055AD0 != -1)
    swift_once(&qword_100055AD0, sub_10000D670);
  v30 = qword_100056220;
  v31 = (double *)&v23[*(int *)(v21 + 20)];
  *v31 = a8;
  v31[1] = a9;
  *(_QWORD *)&v23[*(int *)(v21 + 24)] = v30;
  swift_retain(v30);
  v32 = sub_100008C08((uint64_t)v67, &qword_100056060);
  v33 = Date.init()(v32);
  Date.advanced(by:)(v33, 900.0);
  v34 = v59;
  v35 = *(void (**)(char *, uint64_t))(v59 + 8);
  v35(v15, v12);
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v20, v17, v12);
  sub_10000BD24((uint64_t)v23, (uint64_t)&v20[*(int *)(v18 + 36)], type metadata accessor for ViewContext);
  sub_10000BD24((uint64_t)v26, (uint64_t)&v20[*(int *)(v18 + 40)], type metadata accessor for FriendModel);
  v35(v17, v12);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v36 = type metadata accessor for Logger(0);
  sub_100007E94(v36, (uint64_t)qword_100059040);
  v37 = v60;
  v38 = v61;
  v39 = swift_retain(v61);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v60 = v26;
    v42 = swift_slowAlloc(42, -1);
    v59 = swift_slowAlloc(96, -1);
    v68[0] = v59;
    *(_DWORD *)v42 = 136315906;
    v43 = v38;
    v44 = *(_QWORD *)(v38 + 16);
    v45 = *(_QWORD *)(v43 + 24);
    swift_bridgeObjectRetain(v45);
    v65 = sub_100008084(v44, v45, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v42 + 4, v42 + 12);
    swift_release(v43);
    swift_bridgeObjectRelease(v45);
    *(_WORD *)(v42 + 12) = 2048;
    v65 = v58;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v42 + 14, v42 + 22);
    *(_WORD *)(v42 + 22) = 2080;
    v46 = CGSize.debugDescription.getter(a8, a9);
    v48 = v47;
    v65 = sub_100008084(v46, v47, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v42 + 24, v42 + 32);
    swift_bridgeObjectRelease(v48);
    *(_WORD *)(v42 + 32) = 2080;
    v49 = objc_msgSend(v37, "contact");
    v57 = v23;
    if (v49
      && (v50 = v49, v51 = objc_msgSend(v49, "handle"), v50, v51))
    {
      v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v51);
      v54 = v53;

    }
    else
    {
      v54 = 0xE300000000000000;
      v52 = 7104878;
    }
    v65 = sub_100008084(v52, v54, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, v66, v42 + 34, v42 + 42);

    swift_bridgeObjectRelease(v54);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "🥑🥑 FriendProvider%s: friend entry defaulted after timeout (%ld-s) %s for %s", (uint8_t *)v42, 0x2Au);
    v55 = v59;
    swift_arrayDestroy(v59, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v55, -1, -1);
    swift_slowDealloc(v42, -1, -1);

    v26 = v60;
    v23 = v57;
  }
  else
  {

    swift_release(v38);
  }
  v63(v20);
  sub_100030F1C(0xD000000000000023, 0x8000000100041620, v64, 0, 1);
  sub_100008C08((uint64_t)v20, &qword_100055F10);
  sub_10000BD68((uint64_t)v23, type metadata accessor for ViewContext);
  return sub_10000BD68((uint64_t)v26, type metadata accessor for FriendModel);
}

uint64_t sub_10000B164(uint64_t a1)
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

uint64_t sub_10000B190(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void (*a9)(char *), uint64_t a10)
{
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
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  double v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *);
  unint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  _BYTE v75[16];
  _BYTE v76[32];
  uint64_t v77[4];
  char v78[24];

  v69 = a10;
  v70 = a9;
  v67 = a8;
  v68 = a7;
  v65 = a6;
  v64 = a1;
  v13 = type metadata accessor for Date(0);
  v66 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v64 - v17;
  v19 = sub_100004A10(&qword_100055F10);
  __chkstk_darwin(v19);
  v73 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for ViewContext(0);
  __chkstk_darwin(v21);
  v72 = (char *)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100004A10(&qword_100056058);
  __chkstk_darwin(v23);
  v25 = (char *)&v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for FriendModel(0);
  v27 = *(_QWORD *)(v26 - 8);
  __chkstk_darwin(v26);
  v71 = (unint64_t)&v64 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = swift_beginAccess(a2 + 16, v78, 0, 0);
  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
  {
    dispatch thunk of DispatchWorkItem.cancel()(result);
    sub_100008CE0(v64, (uint64_t)v25, &qword_100056058);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
    {
      v30 = v71;
      sub_10000ECC8(2u, 1, 0, 0, 0, 0, v71);
      sub_100008C08((uint64_t)v25, &qword_100056058);
    }
    else
    {
      v30 = v71;
      sub_10000BDA4((uint64_t)v25, v71);
    }
    v31 = v68;
    v32 = type metadata accessor for UserDefaultsManager();
    inited = swift_initStackObject(v32, v75);
    v77[3] = v32;
    v77[0] = inited;
    sub_10000BCDC((uint64_t)v77, (uint64_t)v76);
    v34 = type metadata accessor for WidgetFamily(0);
    v35 = (uint64_t)v72;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v72, v65, v34);
    if (qword_100055AD0 != -1)
      swift_once(&qword_100055AD0, sub_10000D670);
    v36 = qword_100056220;
    v37 = (double *)(v35 + *(int *)(v21 + 20));
    *v37 = a3;
    v37[1] = a4;
    *(_QWORD *)(v35 + *(int *)(v21 + 24)) = v36;
    swift_retain(v36);
    v38 = sub_100008C08((uint64_t)v76, &qword_100056060);
    v39 = Date.init()(v38);
    Date.advanced(by:)(v39, 900.0);
    v40 = v66;
    v41 = *(void (**)(char *, uint64_t))(v66 + 8);
    v41(v16, v13);
    v42 = v73;
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v73, v18, v13);
    sub_10000BD24(v35, (uint64_t)&v42[*(int *)(v19 + 36)], type metadata accessor for ViewContext);
    sub_10000BD24(v30, (uint64_t)&v42[*(int *)(v19 + 40)], type metadata accessor for FriendModel);
    v41(v18, v13);
    if (qword_100055AC8 != -1)
      swift_once(&qword_100055AC8, sub_1000058E0);
    v43 = type metadata accessor for Logger(0);
    sub_100007E94(v43, (uint64_t)qword_100059040);
    v44 = v67;
    v45 = swift_retain(v31);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = swift_slowAlloc(32, -1);
      v49 = swift_slowAlloc(96, -1);
      v77[0] = v49;
      *(_DWORD *)v48 = 136315650;
      v50 = v31;
      v51 = *(_QWORD *)(v31 + 16);
      v52 = *(_QWORD *)(v31 + 24);
      swift_bridgeObjectRetain(v52);
      v74 = sub_100008084(v51, v52, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, v75, v48 + 4, v48 + 12);
      swift_release(v50);
      swift_bridgeObjectRelease(v52);
      *(_WORD *)(v48 + 12) = 2080;
      v53 = CGSize.debugDescription.getter(a3, a4);
      v55 = v54;
      v74 = sub_100008084(v53, v54, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, v75, v48 + 14, v48 + 22);
      *(_QWORD *)&v56 = swift_bridgeObjectRelease(v55).n128_u64[0];
      *(_WORD *)(v48 + 22) = 2080;
      v57 = objc_msgSend(v44, "contact", v56);
      if (v57
        && (v58 = v57, v59 = objc_msgSend(v57, "handle"), v58, v59))
      {
        v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
        v62 = v61;

      }
      else
      {
        v62 = 0xE300000000000000;
        v60 = 7104878;
      }
      v74 = sub_100008084(v60, v62, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, v75, v48 + 24, v48 + 32);

      swift_bridgeObjectRelease(v62);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "🥑🥑 FriendProvider%s: friend entry provided %s for %s", (uint8_t *)v48, 0x20u);
      swift_arrayDestroy(v49, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v48, -1, -1);

      v35 = (uint64_t)v72;
      v30 = v71;
    }
    else
    {

      swift_release(v31);
    }
    v63 = (uint64_t)v73;
    v70(v73);
    sub_100008C08(v63, &qword_100055F10);
    sub_10000BD68(v35, type metadata accessor for ViewContext);
    return sub_10000BD68(v30, type metadata accessor for FriendModel);
  }
  return result;
}

uint64_t sub_10000B838@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000094D0(a1, a2);
}

uint64_t sub_10000B858(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000994C(a1, a2, a3, a4);
}

uint64_t sub_10000B878(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000A6CC(a1, a2, a3, a4);
}

uint64_t sub_10000B898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to IntentTimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000B904;
  return IntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000B904()
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

uint64_t sub_10000B94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to IntentTimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000BEA4;
  return IntentTimelineProvider.relevance()(a1, a2, a3);
}

unint64_t sub_10000B9B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056018;
  if (!qword_100056018)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100056018);
  }
  return result;
}

uint64_t sub_10000B9F4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BA18(uint64_t a1)
{
  uint64_t v1;

  return sub_10000A9AC(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_10000BA20()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000BA30()
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

  v1 = type metadata accessor for WidgetFamily(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v3 | 7;
  v6 = (((*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v7 = (((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));

  swift_release(*(_QWORD *)(v0 + v8 + 8));
  return swift_deallocObject(v0, v8 + 16, v5);
}

uint64_t sub_10000BAFC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_10000AB24(*(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v5), *(char **)(v0 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(char *))(v0 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(double *)(v0 + v3), *(double *)(v0 + v3 + 8));
}

uint64_t sub_10000BB78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000BB88(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000BB90()
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

  v1 = type metadata accessor for WidgetFamily(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (((*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));

  swift_release(*(_QWORD *)(v0 + v8 + 8));
  return swift_deallocObject(v0, v8 + 16, v5);
}

uint64_t sub_10000BC5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  return sub_10000B190(a1, *(_QWORD *)(v1 + 16), *(double *)(v1 + v5), *(double *)(v1 + v5 + 8), *(_QWORD *)(v1 + 24), v1 + v4, *(_QWORD *)(v1 + v6), *(void **)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(char *))(v1 + ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10000BCDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004A10(&qword_100056060);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BD24(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000BD68(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000BDA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FriendModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_10000BDE8(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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

uint64_t sub_10000BE7C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

id sub_10000BEAC(void *a1, void *a2, char a3)
{
  id v3;
  id v5;

  if ((a3 & 1) != 0)
  {
    v5 = a1;
    v3 = a2;
    a1 = v5;
  }
  return a1;
}

void destroy for ColorSchemeImageSet(uint64_t a1)
{
  sub_100008950(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s18FindMyWidgetPeople19ColorSchemeImageSetOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10000BEAC(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ColorSchemeImageSet(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10000BEAC(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_100008950(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ColorSchemeImageSet(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ColorSchemeImageSet(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_100008950(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSchemeImageSet(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ColorSchemeImageSet(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_10000C064(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_10000C070(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ColorSchemeImageSet()
{
  return &type metadata for ColorSchemeImageSet;
}

void *sub_10000C08C(uint64_t a1, void *a2, void *a3, char a4)
{
  void *v4;
  id v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = a2;
  if ((a4 & 1) == 0)
    goto LABEL_2;
  if (!a2)
  {
    v12 = a3;
    return a3;
  }
  if (a3)
  {
    v7 = a2;
    v8 = a3;
    v9 = objc_msgSend(v7, "imageAsset");
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithUserInterfaceStyle:", 2);
      objc_msgSend(v10, "registerImage:withTraitCollection:", v8, v11);

    }
  }
  else
  {
LABEL_2:
    v5 = a2;
  }
  return v4;
}

uint64_t sub_10000C164(double a1, double a2)
{
  void *v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t result;
  _QWORD v13[5];
  uint64_t v14;

  v5 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", a1, a2);
  v6 = swift_allocObject(&unk_100051F88, 40, 7);
  *(_QWORD *)(v6 + 16) = v2;
  *(double *)(v6 + 24) = a1;
  *(double *)(v6 + 32) = a2;
  v7 = swift_allocObject(&unk_100051FB0, 32, 7);
  *(_QWORD *)(v7 + 16) = sub_10000C2F8;
  *(_QWORD *)(v7 + 24) = v6;
  v13[4] = sub_10000C324;
  v14 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10000C344;
  v13[3] = &unk_100051FC8;
  v8 = _Block_copy(v13);
  v9 = v14;
  v10 = v2;
  swift_retain(v7);
  swift_release(v9);
  v11 = objc_msgSend(v5, "imageWithActions:", v8);

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation(v7, "", 101, 55, 58, 1);
  swift_release(v6);
  result = swift_release(v7);
  if ((v5 & 1) == 0)
    return (uint64_t)v11;
  __break(1u);
  return result;
}

uint64_t sub_10000C2D4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

id sub_10000C2F8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "drawInRect:", 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_10000C314()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C324()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_10000C344(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_10000C378(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C388(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000C390(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for ViewContext(319);
    if (v4 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(result - 8) + 64;
      result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
      if (v5 <= 0x3F)
      {
        v6[2] = *(_QWORD *)(result - 8) + 64;
        swift_initStructMetadata(a1, 0, 3, v6, a1 + 32);
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_10000C434(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
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
  unint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  void (*v30)(unint64_t, unint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;

  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10 & 0xF8 | 7;
  v12 = v7 + v11;
  v13 = *(_QWORD *)(v9 + 64) + 7;
  v14 = *(_QWORD *)(a3 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_DWORD *)(v15 + 80);
  v17 = (((v13 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v16 + 8;
  v18 = v11 | *(_DWORD *)(v6 + 80) | v16;
  v19 = (*(_DWORD *)(v15 + 80) | v10 | *(_DWORD *)(v6 + 80)) & 0x100000;
  if ((_DWORD)v18 != 7 || v19 != 0 || ((v17 + (v12 & ~v11)) & ~v16) + *(_QWORD *)(v15 + 64) > 0x18)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v18 + 16) & ~v18));
    swift_retain(v22);
  }
  else
  {
    v23 = v8;
    v24 = ~v11;
    v32 = ~v16;
    v33 = v14;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v25 = ((unint64_t)a1 + v12) & v24;
    v26 = ((unint64_t)a2 + v12) & v24;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(v25, v26, v23);
    v27 = (_OWORD *)((v13 + v25) & 0xFFFFFFFFFFFFFFF8);
    v28 = (_OWORD *)((v13 + v26) & 0xFFFFFFFFFFFFFFF8);
    *v27 = *v28;
    v29 = *(_QWORD *)(((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFF8) = v29;
    v30 = *(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 16);
    swift_retain(v29);
    v30((v17 + v25) & v32, (v17 + v26) & v32, v33);
  }
  return a1;
}

uint64_t sub_10000C5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = *(_QWORD *)(v5 + 64) + a1;
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  v10 = (v6 + v9) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  v11 = *(_QWORD *)(v8 + 64) + 7;
  swift_release(*(_QWORD *)((((v11 + v10) & 0xFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8));
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v10 + (((v11 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

uint64_t sub_10000C6A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(unint64_t, unint64_t, uint64_t);

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  v12 = v8 + v11;
  v13 = (v8 + v11 + a1) & ~v11;
  v14 = (v12 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13, v14, v9);
  v15 = *(_QWORD *)(v10 + 64) + 7;
  v16 = (_OWORD *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_OWORD *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v18 = *(_QWORD *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFF8);
  *(_QWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFF8) = v18;
  v19 = *(_QWORD *)(a3 + 16);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned __int8 *)(v20 + 80);
  v22 = (((v15 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v21 + 8;
  v23 = (v22 + v13) & ~v21;
  v24 = (v22 + v14) & ~v21;
  v25 = *(void (**)(unint64_t, unint64_t, uint64_t))(v20 + 16);
  swift_retain(v18);
  v25(v23, v24, v19);
  return a1;
}

uint64_t sub_10000C7BC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  v12 = v8 + v11;
  v13 = (v8 + v11 + a1) & ~v11;
  v14 = (v12 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v13, v14, v9);
  v15 = *(_QWORD *)(v10 + 64) + 7;
  v16 = (_QWORD *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v16[1] = v17[1];
  v18 = (uint64_t *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  v19 = (uint64_t *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFF8);
  v20 = *v19;
  v21 = *v18;
  *v18 = *v19;
  swift_retain(v20);
  swift_release(v21);
  v22 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v23 = *(unsigned __int8 *)(v22 + 80);
  v24 = (((v15 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v23 + 8;
  (*(void (**)(unint64_t, unint64_t))(v22 + 24))((v24 + v13) & ~v23, (v24 + v14) & ~v23);
  return a1;
}

uint64_t sub_10000C8E0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  v12 = v8 + v11;
  v13 = (v8 + v11 + a1) & ~v11;
  v14 = (v12 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v13, v14, v9);
  v15 = *(_QWORD *)(v10 + 64) + 7;
  v16 = (_OWORD *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_OWORD *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  *(_QWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFF8);
  v18 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v19 = *(unsigned __int8 *)(v18 + 80);
  v20 = (((v15 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v19 + 8;
  (*(void (**)(unint64_t, unint64_t))(v18 + 32))((v20 + v13) & ~v19, (v20 + v14) & ~v19);
  return a1;
}

uint64_t sub_10000C9E4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  v12 = v8 + v11;
  v13 = (v8 + v11 + a1) & ~v11;
  v14 = (v12 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v13, v14, v9);
  v15 = *(_QWORD *)(v10 + 64) + 7;
  v16 = (_QWORD *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v16[1] = v17[1];
  v18 = (uint64_t *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  v19 = *v18;
  *v18 = *(_QWORD *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFF8);
  swift_release(v19);
  v20 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v21 = *(unsigned __int8 *)(v20 + 80);
  v22 = (((v15 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v21 + 8;
  (*(void (**)(unint64_t, unint64_t))(v20 + 40))((v22 + v13) & ~v21, (v22 + v14) & ~v21);
  return a1;
}

uint64_t sub_10000CB00(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  unsigned int v26;
  int v27;
  int v28;
  uint64_t (*v29)(unint64_t, uint64_t, uint64_t);
  unint64_t v30;
  unint64_t v31;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= 0x7FFFFFFF)
    v12 = 0x7FFFFFFF;
  else
    v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= v8)
    v13 = v8;
  else
    v13 = v12;
  v14 = *(_QWORD *)(a3 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v15 + 84) > v13)
    v13 = *(_DWORD *)(v15 + 84);
  if (!a2)
    return 0;
  v16 = v9;
  v17 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  v18 = *(_QWORD *)(v7 + 64) + v17;
  v19 = *(_QWORD *)(v10 + 64) + 7;
  v20 = (((v19 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  v21 = *(unsigned __int8 *)(v15 + 80);
  if (a2 <= v13)
    goto LABEL_29;
  v22 = ((v20 + v21 + (v18 & ~v17)) & ~v21) + *(_QWORD *)(v15 + 64);
  v23 = 8 * v22;
  if (v22 > 3)
    goto LABEL_12;
  v26 = ((a2 - v13 + ~(-1 << v23)) >> v23) + 1;
  if (HIWORD(v26))
  {
    v24 = *(_DWORD *)(a1 + v22);
    if (v24)
      goto LABEL_20;
  }
  else
  {
    if (v26 <= 0xFF)
    {
      if (v26 < 2)
        goto LABEL_29;
LABEL_12:
      v24 = *(unsigned __int8 *)(a1 + v22);
      if (!*(_BYTE *)(a1 + v22))
        goto LABEL_29;
LABEL_20:
      v27 = (v24 - 1) << v23;
      if (v22 > 3)
        v27 = 0;
      if ((_DWORD)v22)
      {
        if (v22 <= 3)
          v28 = ((v20 + v21 + (v18 & ~(*(_DWORD *)(v10 + 80) & 0xF8 | 7))) & ~(_DWORD)v21) + *(_DWORD *)(v15 + 64);
        else
          v28 = 4;
        __asm { BR              X12 }
      }
      return v13 + v27 + 1;
    }
    v24 = *(unsigned __int16 *)(a1 + v22);
    if (*(_WORD *)(a1 + v22))
      goto LABEL_20;
  }
LABEL_29:
  if ((_DWORD)v8 == v13)
  {
    v29 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48);
    v30 = a1;
    v11 = v8;
    v14 = v6;
    return v29(v30, v11, v14);
  }
  v30 = (v18 + a1) & ~v17;
  if (v12 != v13)
  {
    v30 = (v30 + v21 + v20) & ~v21;
    v29 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v15 + 48);
    v11 = *(unsigned int *)(v15 + 84);
    return v29(v30, v11, v14);
  }
  if (v11 >= 0x7FFFFFFF)
  {
    v29 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v10 + 48);
    v14 = v16;
    return v29(v30, v11, v14);
  }
  v31 = *(_QWORD *)((((v19 + v30) & 0xFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8);
  if (v31 >= 0xFFFFFFFF)
    LODWORD(v31) = -1;
  return (v31 + 1);
}

void sub_10000CD4C(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  size_t v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;

  v8 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  if (*(_DWORD *)(v10 + 84) <= 0x7FFFFFFFu)
    v11 = 0x7FFFFFFF;
  else
    v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v9)
    v12 = v9;
  else
    v12 = v11;
  v13 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v13 + 84) > v12)
    v12 = *(_DWORD *)(v13 + 84);
  v14 = ((((((*(_QWORD *)(v10 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 8
        + *(unsigned __int8 *)(v13 + 80)
        + ((*(_QWORD *)(v8 + 64) + (*(_DWORD *)(v10 + 80) & 0xF8 | 7)) & ~(*(_DWORD *)(v10 + 80) & 0xF8 | 7))) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))
      + *(_QWORD *)(v13 + 64);
  if (a3 <= v12)
  {
    v15 = 0;
  }
  else if (v14 <= 3)
  {
    v17 = ((a3 - v12 + ~(-1 << (8 * v14))) >> (8 * v14)) + 1;
    if (HIWORD(v17))
    {
      v15 = &dword_100000004;
    }
    else if (v17 >= 0x100)
    {
      v15 = 2;
    }
    else
    {
      v15 = v17 > 1;
    }
  }
  else
  {
    v15 = &_mh_execute_header.magic + 1;
  }
  if (v12 < a2)
  {
    v16 = ~v12 + a2;
    if (v14 < 4)
    {
      if ((_DWORD)v14)
      {
        v18 = v16 & ~(-1 << (8 * v14));
        bzero(a1, v14);
        if ((_DWORD)v14 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if ((_DWORD)v14 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v14);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X6 }
}

uint64_t type metadata accessor for ModelEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008D64(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ModelEntry);
}

uint64_t sub_10000D02C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_10000D06C(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 0, 0, v2, a1 + 96);
}

uint64_t sub_10000D0A0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000D0A8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ModelEntryFactory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008D64(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ModelEntryFactory);
}

uint64_t *sub_10000D0C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
    v9 = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = v9;
  }
  swift_retain(v9);
  return a1;
}

uint64_t sub_10000D154(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return swift_release(*(_QWORD *)(a1 + *(int *)(a2 + 24)));
}

uint64_t sub_10000D198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  swift_retain(v8);
  return a1;
}

uint64_t sub_10000D200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v10 = *(int *)(a3 + 24);
  v11 = *(_QWORD *)(a2 + v10);
  v12 = *(_QWORD *)(a1 + v10);
  *(_QWORD *)(a1 + v10) = v11;
  swift_retain(v11);
  swift_release(v12);
  return a1;
}

uint64_t sub_10000D288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_10000D2EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = *(_QWORD *)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_release(v8);
  return a1;
}

uint64_t sub_10000D358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D364);
}

uint64_t sub_10000D364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for WidgetFamily(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10000D3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000D3EC);
}

uint64_t sub_10000D3EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for ViewContext(uint64_t a1)
{
  uint64_t result;

  result = qword_1000561D8;
  if (!qword_1000561D8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ViewContext);
  return result;
}

uint64_t sub_10000D4A0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for WidgetFamily(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_100042BB0;
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10000D524(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double *v10;
  BOOL v11;
  char v12;
  uint64_t v14;
  uint64_t v15;

  v4 = type metadata accessor for WidgetFamily(0);
  v5 = sub_10000D5E8();
  dispatch thunk of RawRepresentable.rawValue.getter(&v15, v4, v5);
  dispatch thunk of RawRepresentable.rawValue.getter(&v14, v4, v5);
  if (v15 == v14
    && ((v6 = type metadata accessor for ViewContext(0),
         v7 = *(int *)(v6 + 20),
         v8 = *(double *)(a1 + v7),
         v9 = *(double *)(a1 + v7 + 8),
         v10 = (double *)(a2 + v7),
         v8 == *v10)
      ? (v11 = v9 == v10[1])
      : (v11 = 0),
        v11))
  {
    v12 = static Color.== infix(_:_:)(*(_QWORD *)(a1 + *(int *)(v6 + 24)), *(_QWORD *)(a2 + *(int *)(v6 + 24)));
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

unint64_t sub_10000D5E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056218;
  if (!qword_100056218)
  {
    v1 = type metadata accessor for WidgetFamily(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for WidgetFamily, v1);
    atomic_store(result, (unint64_t *)&qword_100056218);
  }
  return result;
}

uint64_t sub_10000D630(uint64_t a1)
{
  const char *v2;

  v2 = " ";
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + 96);
}

uint64_t sub_10000D670()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  type metadata accessor for Color.RGBColorSpace(0);
  __chkstk_darwin();
  v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v2 + 104))(v1, enum case for Color.RGBColorSpace.sRGB(_:));
  result = Color.init(_:red:green:blue:opacity:)(v1, 1.0, 0.670588235, 0.141176471, 1.0);
  qword_100056220 = result;
  return result;
}

uint64_t sub_10000D704()
{
  uint64_t v0;

  sub_10000D750(v0 + 16);
  return v0;
}

uint64_t sub_10000D720()
{
  uint64_t v0;

  sub_10000D750(v0 + 16);
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for ViewContextFactory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008D64(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ViewContextFactory);
}

uint64_t sub_10000D750(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004A10(&qword_100056060);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_10000D790(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t *v43;
  int v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  int v51;
  char v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  void *__dst;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v16);
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v9;
    *(_DWORD *)(a1 + 48) = *((_DWORD *)a2 + 12);
    *(_WORD *)(a1 + 52) = *((_WORD *)a2 + 26);
    v10 = a3[13];
    __dst = (void *)(a1 + v10);
    v11 = (char *)a2 + v10;
    v12 = type metadata accessor for Date(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    if (v14(v11, 1, v12))
    {
      v15 = sub_100004A10(&qword_1000562A8);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v17 = a3[14];
    v18 = a3[15];
    v19 = (_QWORD *)((char *)v4 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v22 = *v20;
    v21 = v20[1];
    LOBYTE(v20) = *((_BYTE *)a2 + v18);
    *v19 = v22;
    v19[1] = v21;
    *((_BYTE *)v4 + v18) = (_BYTE)v20;
    v23 = a3[16];
    v24 = a3[17];
    v25 = (_QWORD *)((char *)v4 + v23);
    v26 = (uint64_t *)((char *)a2 + v23);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = (_QWORD *)((char *)v4 + v24);
    v29 = (uint64_t *)((char *)a2 + v24);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = a3[18];
    v32 = a3[19];
    v33 = (_QWORD *)((char *)v4 + v31);
    v34 = (uint64_t *)((char *)a2 + v31);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
    v36 = (char *)v4 + v32;
    v37 = (uint64_t)a2 + v32;
    *(_QWORD *)v36 = *(_QWORD *)v37;
    v36[8] = *(_BYTE *)(v37 + 8);
    v38 = a3[20];
    v39 = a3[21];
    v40 = (char *)v4 + v38;
    v41 = (uint64_t)a2 + v38;
    *(_OWORD *)v40 = *(_OWORD *)v41;
    v40[16] = *(_BYTE *)(v41 + 16);
    v42 = (char *)v4 + v39;
    v43 = (uint64_t *)((char *)a2 + v39);
    v44 = *((unsigned __int8 *)a2 + v39 + 16);
    swift_bridgeObjectRetain(v21);
    swift_bridgeObjectRetain(v27);
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRetain(v35);
    if (v44 == 255)
    {
      *(_OWORD *)v42 = *(_OWORD *)v43;
      v42[16] = *((_BYTE *)v43 + 16);
    }
    else
    {
      v45 = *v43;
      v46 = (void *)v43[1];
      sub_10000BEAC((void *)*v43, v46, v44 & 1);
      *(_QWORD *)v42 = v45;
      *((_QWORD *)v42 + 1) = v46;
      v42[16] = v44 & 1;
    }
    v47 = a3[23];
    *((_BYTE *)v4 + a3[22]) = *((_BYTE *)a2 + a3[22]);
    *((_BYTE *)v4 + v47) = *((_BYTE *)a2 + v47);
    v48 = a3[25];
    *(_QWORD *)((char *)v4 + a3[24]) = *(uint64_t *)((char *)a2 + a3[24]);
    v49 = (char *)v4 + v48;
    v50 = (uint64_t *)((char *)a2 + v48);
    v51 = *((unsigned __int8 *)a2 + v48 + 16);
    if (v51 == 255)
    {
      *(_OWORD *)v49 = *(_OWORD *)v50;
      v49[16] = *((_BYTE *)v50 + 16);
    }
    else
    {
      v52 = v51 & 1;
      v53 = *v50;
      v54 = (void *)v50[1];
      sub_10000BEAC((void *)*v50, v54, v51 & 1);
      *(_QWORD *)v49 = v53;
      *((_QWORD *)v49 + 1) = v54;
      v49[16] = v52;
    }
    v55 = a3[27];
    *((_BYTE *)v4 + a3[26]) = *((_BYTE *)a2 + a3[26]);
    *((_BYTE *)v4 + v55) = *((_BYTE *)a2 + v55);
    v56 = a3[28];
    v57 = (char *)v4 + v56;
    v58 = (uint64_t)a2 + v56;
    v59 = *(_QWORD *)(v58 + 16);
    if (v59 == 1)
    {
      *(_OWORD *)v57 = *(_OWORD *)v58;
      *((_QWORD *)v57 + 2) = *(_QWORD *)(v58 + 16);
    }
    else
    {
      *(_DWORD *)v57 = *(_DWORD *)v58;
      v57[4] = *(_BYTE *)(v58 + 4);
      *(_WORD *)(v57 + 5) = *(_WORD *)(v58 + 5);
      *((_QWORD *)v57 + 1) = *(_QWORD *)(v58 + 8);
      *((_QWORD *)v57 + 2) = v59;
      swift_bridgeObjectRetain(v59);
    }
    v60 = a3[29];
    v61 = a3[30];
    v62 = (_QWORD *)((char *)v4 + v60);
    v63 = (uint64_t *)((char *)a2 + v60);
    v64 = v63[1];
    *v62 = *v63;
    v62[1] = v64;
    v65 = (_QWORD *)((char *)v4 + v61);
    v66 = (uint64_t *)((char *)a2 + v61);
    v67 = v66[1];
    *v65 = *v66;
    v65[1] = v67;
    swift_bridgeObjectRetain(v64);
    swift_bridgeObjectRetain(v67);
  }
  return v4;
}

double sub_10000DAC0(_QWORD *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  int v8;
  void **v9;
  int v10;
  uint64_t v11;
  double result;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  v4 = (char *)a1 + a2[13];
  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[14] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[16] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[17] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[18] + 8));
  v7 = (void **)((char *)a1 + a2[21]);
  v8 = *((unsigned __int8 *)v7 + 16);
  if (v8 != 255)
    sub_100008950(*v7, v7[1], v8 & 1);
  v9 = (void **)((char *)a1 + a2[25]);
  v10 = *((unsigned __int8 *)v9 + 16);
  if (v10 != 255)
    sub_100008950(*v9, v9[1], v10 & 1);
  v11 = *(_QWORD *)((char *)a1 + a2[28] + 16);
  if (v11 != 1)
    swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[29] + 8));
  *(_QWORD *)&result = swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[30] + 8)).n128_u64[0];
  return result;
}

uint64_t sub_10000DBFC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  int v49;
  char v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  void *__dst;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_WORD *)(a1 + 52) = *(_WORD *)(a2 + 52);
  v9 = a3[13];
  __dst = (void *)(a1 + v9);
  v10 = (const void *)(a2 + v9);
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  if (v13(v10, 1, v11))
  {
    v14 = sub_100004A10(&qword_1000562A8);
    memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  v15 = a3[14];
  v16 = a3[15];
  v17 = (_QWORD *)(a1 + v15);
  v18 = (uint64_t *)(a2 + v15);
  v20 = *v18;
  v19 = v18[1];
  LOBYTE(v18) = *(_BYTE *)(a2 + v16);
  *v17 = v20;
  v17[1] = v19;
  *(_BYTE *)(a1 + v16) = (_BYTE)v18;
  v21 = a3[16];
  v22 = a3[17];
  v23 = (_QWORD *)(a1 + v21);
  v24 = (_QWORD *)(a2 + v21);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  v26 = (_QWORD *)(a1 + v22);
  v27 = (_QWORD *)(a2 + v22);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = a3[18];
  v30 = a3[19];
  v31 = (_QWORD *)(a1 + v29);
  v32 = (_QWORD *)(a2 + v29);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  v34 = a1 + v30;
  v35 = a2 + v30;
  *(_QWORD *)v34 = *(_QWORD *)v35;
  *(_BYTE *)(v34 + 8) = *(_BYTE *)(v35 + 8);
  v36 = a3[20];
  v37 = a3[21];
  v38 = a1 + v36;
  v39 = a2 + v36;
  *(_OWORD *)v38 = *(_OWORD *)v39;
  *(_BYTE *)(v38 + 16) = *(_BYTE *)(v39 + 16);
  v40 = a1 + v37;
  v41 = (uint64_t *)(a2 + v37);
  v42 = *(unsigned __int8 *)(a2 + v37 + 16);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRetain(v33);
  if (v42 == 255)
  {
    *(_OWORD *)v40 = *(_OWORD *)v41;
    *(_BYTE *)(v40 + 16) = *((_BYTE *)v41 + 16);
  }
  else
  {
    v43 = *v41;
    v44 = (void *)v41[1];
    sub_10000BEAC((void *)*v41, v44, v42 & 1);
    *(_QWORD *)v40 = v43;
    *(_QWORD *)(v40 + 8) = v44;
    *(_BYTE *)(v40 + 16) = v42 & 1;
  }
  v45 = a3[23];
  *(_BYTE *)(a1 + a3[22]) = *(_BYTE *)(a2 + a3[22]);
  *(_BYTE *)(a1 + v45) = *(_BYTE *)(a2 + v45);
  v46 = a3[25];
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v47 = a1 + v46;
  v48 = (uint64_t *)(a2 + v46);
  v49 = *(unsigned __int8 *)(a2 + v46 + 16);
  if (v49 == 255)
  {
    *(_OWORD *)v47 = *(_OWORD *)v48;
    *(_BYTE *)(v47 + 16) = *((_BYTE *)v48 + 16);
  }
  else
  {
    v50 = v49 & 1;
    v51 = *v48;
    v52 = (void *)v48[1];
    sub_10000BEAC((void *)*v48, v52, v49 & 1);
    *(_QWORD *)v47 = v51;
    *(_QWORD *)(v47 + 8) = v52;
    *(_BYTE *)(v47 + 16) = v50;
  }
  v53 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_BYTE *)(a1 + v53) = *(_BYTE *)(a2 + v53);
  v54 = a3[28];
  v55 = a1 + v54;
  v56 = a2 + v54;
  v57 = *(_QWORD *)(v56 + 16);
  if (v57 == 1)
  {
    *(_OWORD *)v55 = *(_OWORD *)v56;
    *(_QWORD *)(v55 + 16) = *(_QWORD *)(v56 + 16);
  }
  else
  {
    *(_DWORD *)v55 = *(_DWORD *)v56;
    *(_BYTE *)(v55 + 4) = *(_BYTE *)(v56 + 4);
    *(_WORD *)(v55 + 5) = *(_WORD *)(v56 + 5);
    *(_QWORD *)(v55 + 8) = *(_QWORD *)(v56 + 8);
    *(_QWORD *)(v55 + 16) = v57;
    swift_bridgeObjectRetain(v57);
  }
  v58 = a3[29];
  v59 = a3[30];
  v60 = (_QWORD *)(a1 + v58);
  v61 = (_QWORD *)(a2 + v58);
  v62 = v61[1];
  *v60 = *v61;
  v60[1] = v62;
  v63 = (_QWORD *)(a1 + v59);
  v64 = (_QWORD *)(a2 + v59);
  v65 = v64[1];
  *v63 = *v64;
  v63[1] = v65;
  swift_bridgeObjectRetain(v62);
  swift_bridgeObjectRetain(v65);
  return a1;
}

uint64_t sub_10000DF00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 *v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 *v51;
  int v52;
  char v53;
  __int128 v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  char v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 *v66;
  int v67;
  int v68;
  char v69;
  __int128 v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  char v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 *v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  *(_BYTE *)(a1 + 51) = *(_BYTE *)(a2 + 51);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_BYTE *)(a1 + 53) = *(_BYTE *)(a2 + 53);
  v12 = a3[13];
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = sub_100004A10(&qword_1000562A8);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_7:
  v21 = a3[14];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v24 = v23[1];
  v25 = v22[1];
  v22[1] = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v26 = a3[16];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  *v27 = *v28;
  v29 = v28[1];
  v30 = v27[1];
  v27[1] = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  v31 = a3[17];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)(a2 + v31);
  *v32 = *v33;
  v34 = v33[1];
  v35 = v32[1];
  v32[1] = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v35);
  v36 = a3[18];
  v37 = (_QWORD *)(a1 + v36);
  v38 = (_QWORD *)(a2 + v36);
  *v37 = *v38;
  v39 = v38[1];
  v40 = v37[1];
  v37[1] = v39;
  swift_bridgeObjectRetain(v39);
  swift_bridgeObjectRelease(v40);
  v41 = a3[19];
  v42 = a1 + v41;
  v43 = (uint64_t *)(a2 + v41);
  v44 = *v43;
  *(_BYTE *)(v42 + 8) = *((_BYTE *)v43 + 8);
  *(_QWORD *)v42 = v44;
  v45 = a3[20];
  v46 = a1 + v45;
  v47 = (__int128 *)(a2 + v45);
  v48 = *v47;
  *(_BYTE *)(v46 + 16) = *((_BYTE *)v47 + 16);
  *(_OWORD *)v46 = v48;
  v49 = a3[21];
  v50 = a1 + v49;
  v51 = (__int128 *)(a2 + v49);
  LODWORD(v46) = *(unsigned __int8 *)(a1 + v49 + 16);
  v52 = *(unsigned __int8 *)(a2 + v49 + 16);
  if ((_DWORD)v46 == 255)
  {
    if (v52 == 255)
    {
      v54 = *v51;
      *(_BYTE *)(v50 + 16) = *((_BYTE *)v51 + 16);
      *(_OWORD *)v50 = v54;
    }
    else
    {
      v61 = v52 & 1;
      v62 = *(void **)v51;
      v63 = (void *)*((_QWORD *)v51 + 1);
      sub_10000BEAC(v62, v63, v52 & 1);
      *(_QWORD *)v50 = v62;
      *(_QWORD *)(v50 + 8) = v63;
      *(_BYTE *)(v50 + 16) = v61;
    }
  }
  else if (v52 == 255)
  {
    sub_10000E450(v50);
    v53 = *((_BYTE *)v51 + 16);
    *(_OWORD *)v50 = *v51;
    *(_BYTE *)(v50 + 16) = v53;
  }
  else
  {
    v55 = v52 & 1;
    v56 = *(void **)v51;
    v57 = (void *)*((_QWORD *)v51 + 1);
    sub_10000BEAC(v56, v57, v52 & 1);
    v58 = *(void **)v50;
    v59 = *(void **)(v50 + 8);
    v60 = *(_BYTE *)(v50 + 16);
    *(_QWORD *)v50 = v56;
    *(_QWORD *)(v50 + 8) = v57;
    *(_BYTE *)(v50 + 16) = v55;
    sub_100008950(v58, v59, v60);
  }
  *(_BYTE *)(a1 + a3[22]) = *(_BYTE *)(a2 + a3[22]);
  *(_BYTE *)(a1 + a3[23]) = *(_BYTE *)(a2 + a3[23]);
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v64 = a3[25];
  v65 = a1 + v64;
  v66 = (__int128 *)(a2 + v64);
  v67 = *(unsigned __int8 *)(a1 + v64 + 16);
  v68 = *(unsigned __int8 *)(a2 + v64 + 16);
  if (v67 == 255)
  {
    if (v68 == 255)
    {
      v70 = *v66;
      *(_BYTE *)(v65 + 16) = *((_BYTE *)v66 + 16);
      *(_OWORD *)v65 = v70;
    }
    else
    {
      v77 = v68 & 1;
      v78 = *(void **)v66;
      v79 = (void *)*((_QWORD *)v66 + 1);
      sub_10000BEAC(v78, v79, v68 & 1);
      *(_QWORD *)v65 = v78;
      *(_QWORD *)(v65 + 8) = v79;
      *(_BYTE *)(v65 + 16) = v77;
    }
  }
  else if (v68 == 255)
  {
    sub_10000E450(v65);
    v69 = *((_BYTE *)v66 + 16);
    *(_OWORD *)v65 = *v66;
    *(_BYTE *)(v65 + 16) = v69;
  }
  else
  {
    v71 = v68 & 1;
    v72 = *(void **)v66;
    v73 = (void *)*((_QWORD *)v66 + 1);
    sub_10000BEAC(v72, v73, v68 & 1);
    v74 = *(void **)v65;
    v75 = *(void **)(v65 + 8);
    v76 = *(_BYTE *)(v65 + 16);
    *(_QWORD *)v65 = v72;
    *(_QWORD *)(v65 + 8) = v73;
    *(_BYTE *)(v65 + 16) = v71;
    sub_100008950(v74, v75, v76);
  }
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  v80 = a3[28];
  v81 = a1 + v80;
  v82 = (__int128 *)(a2 + v80);
  v83 = *(_QWORD *)(a1 + v80 + 16);
  v84 = *(_QWORD *)(a2 + v80 + 16);
  if (v83 == 1)
  {
    if (v84 == 1)
    {
      v85 = *v82;
      *(_QWORD *)(v81 + 16) = *((_QWORD *)v82 + 2);
      *(_OWORD *)v81 = v85;
    }
    else
    {
      *(_DWORD *)v81 = *(_DWORD *)v82;
      *(_BYTE *)(v81 + 4) = *((_BYTE *)v82 + 4);
      *(_BYTE *)(v81 + 5) = *((_BYTE *)v82 + 5);
      *(_BYTE *)(v81 + 6) = *((_BYTE *)v82 + 6);
      *(_QWORD *)(v81 + 8) = *((_QWORD *)v82 + 1);
      v87 = *((_QWORD *)v82 + 2);
      *(_QWORD *)(v81 + 16) = v87;
      swift_bridgeObjectRetain(v87);
    }
  }
  else if (v84 == 1)
  {
    sub_10000E484(v81);
    v86 = *((_QWORD *)v82 + 2);
    *(_OWORD *)v81 = *v82;
    *(_QWORD *)(v81 + 16) = v86;
  }
  else
  {
    *(_DWORD *)v81 = *(_DWORD *)v82;
    *(_BYTE *)(v81 + 4) = *((_BYTE *)v82 + 4);
    *(_BYTE *)(v81 + 5) = *((_BYTE *)v82 + 5);
    *(_BYTE *)(v81 + 6) = *((_BYTE *)v82 + 6);
    *(_QWORD *)(v81 + 8) = *((_QWORD *)v82 + 1);
    v88 = *((_QWORD *)v82 + 2);
    *(_QWORD *)(v81 + 16) = v88;
    swift_bridgeObjectRetain(v88);
    swift_bridgeObjectRelease(v83);
  }
  v89 = a3[29];
  v90 = (_QWORD *)(a1 + v89);
  v91 = (_QWORD *)(a2 + v89);
  *v90 = *v91;
  v92 = v91[1];
  v93 = v90[1];
  v90[1] = v92;
  swift_bridgeObjectRetain(v92);
  swift_bridgeObjectRelease(v93);
  v94 = a3[30];
  v95 = (_QWORD *)(a1 + v94);
  v96 = (_QWORD *)(a2 + v94);
  *v95 = *v96;
  v97 = v96[1];
  v98 = v95[1];
  v95[1] = v97;
  swift_bridgeObjectRetain(v97);
  swift_bridgeObjectRelease(v98);
  return a1;
}

uint64_t sub_10000E450(uint64_t a1)
{
  destroy for ColorSchemeImageSet(a1);
  return a1;
}

uint64_t sub_10000E484(uint64_t a1)
{
  destroy for BatteryInfo(a1);
  return a1;
}

uint64_t sub_10000E4B8(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
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
  __int128 *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_WORD *)(a1 + 52) = *(_WORD *)(a2 + 52);
  v7 = a3[13];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_100004A10(&qword_1000562A8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(a2 + v13);
  v14 = a3[17];
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  v15 = a3[19];
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  v18 = a3[20];
  v19 = a3[21];
  v20 = a1 + v18;
  v21 = a2 + v18;
  *(_BYTE *)(v20 + 16) = *(_BYTE *)(v21 + 16);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  v22 = a1 + v19;
  v23 = (__int128 *)(a2 + v19);
  v24 = *v23;
  *(_BYTE *)(v22 + 16) = *((_BYTE *)v23 + 16);
  *(_OWORD *)v22 = v24;
  v25 = a3[23];
  *(_BYTE *)(a1 + a3[22]) = *(_BYTE *)(a2 + a3[22]);
  *(_BYTE *)(a1 + v25) = *(_BYTE *)(a2 + v25);
  v26 = a3[25];
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v27 = a1 + v26;
  v28 = a2 + v26;
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *(_BYTE *)(v27 + 16) = *(_BYTE *)(v28 + 16);
  v29 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_BYTE *)(a1 + v29) = *(_BYTE *)(a2 + v29);
  v30 = a3[28];
  v31 = a3[29];
  v32 = a1 + v30;
  v33 = a2 + v30;
  *(_OWORD *)v32 = *(_OWORD *)v33;
  *(_QWORD *)(v32 + 16) = *(_QWORD *)(v33 + 16);
  *(_OWORD *)(a1 + v31) = *(_OWORD *)(a2 + v31);
  *(_OWORD *)(a1 + a3[30]) = *(_OWORD *)(a2 + a3[30]);
  return a1;
}

uint64_t sub_10000E698(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
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
  int v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  *(_BYTE *)(a1 + 51) = *(_BYTE *)(a2 + 51);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_BYTE *)(a1 + 53) = *(_BYTE *)(a2 + 53);
  v12 = a3[13];
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = sub_100004A10(&qword_1000562A8);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  v21 = a3[14];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  v26 = v22[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease(v26);
  v27 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v28 = (_QWORD *)(a1 + v27);
  v29 = (uint64_t *)(a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  v32 = v28[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease(v32);
  v33 = a3[17];
  v34 = (_QWORD *)(a1 + v33);
  v35 = (uint64_t *)(a2 + v33);
  v37 = *v35;
  v36 = v35[1];
  v38 = v34[1];
  *v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease(v38);
  v39 = a3[18];
  v40 = (_QWORD *)(a1 + v39);
  v41 = (uint64_t *)(a2 + v39);
  v43 = *v41;
  v42 = v41[1];
  v44 = v40[1];
  *v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease(v44);
  v45 = a3[19];
  v46 = a3[20];
  v47 = a1 + v45;
  v48 = a2 + v45;
  *(_BYTE *)(v47 + 8) = *(_BYTE *)(v48 + 8);
  *(_QWORD *)v47 = *(_QWORD *)v48;
  v49 = a1 + v46;
  v50 = a2 + v46;
  *(_BYTE *)(v49 + 16) = *(_BYTE *)(v50 + 16);
  *(_OWORD *)v49 = *(_OWORD *)v50;
  v51 = a3[21];
  v52 = a1 + v51;
  v53 = a2 + v51;
  v54 = *(unsigned __int8 *)(a1 + v51 + 16);
  if (v54 == 255)
  {
LABEL_10:
    *(_OWORD *)v52 = *(_OWORD *)v53;
    *(_BYTE *)(v52 + 16) = *(_BYTE *)(v53 + 16);
    goto LABEL_12;
  }
  v55 = *(unsigned __int8 *)(v53 + 16);
  if (v55 == 255)
  {
    sub_10000E450(v52);
    goto LABEL_10;
  }
  v56 = *(void **)v52;
  v57 = *(void **)(v52 + 8);
  *(_OWORD *)v52 = *(_OWORD *)v53;
  *(_BYTE *)(v52 + 16) = v55 & 1;
  sub_100008950(v56, v57, v54 & 1);
LABEL_12:
  v58 = a3[23];
  *(_BYTE *)(a1 + a3[22]) = *(_BYTE *)(a2 + a3[22]);
  *(_BYTE *)(a1 + v58) = *(_BYTE *)(a2 + v58);
  v59 = a3[25];
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v60 = a1 + v59;
  v61 = a2 + v59;
  v62 = *(unsigned __int8 *)(a1 + v59 + 16);
  if (v62 == 255)
  {
LABEL_15:
    *(_OWORD *)v60 = *(_OWORD *)v61;
    *(_BYTE *)(v60 + 16) = *(_BYTE *)(v61 + 16);
    goto LABEL_17;
  }
  v63 = *(unsigned __int8 *)(v61 + 16);
  if (v63 == 255)
  {
    sub_10000E450(v60);
    goto LABEL_15;
  }
  v64 = *(void **)v60;
  v65 = *(void **)(v60 + 8);
  *(_OWORD *)v60 = *(_OWORD *)v61;
  *(_BYTE *)(v60 + 16) = v63 & 1;
  sub_100008950(v64, v65, v62 & 1);
LABEL_17:
  v66 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_BYTE *)(a1 + v66) = *(_BYTE *)(a2 + v66);
  v67 = a3[28];
  v68 = a1 + v67;
  v69 = a2 + v67;
  v70 = *(_QWORD *)(a1 + v67 + 16);
  if (v70 != 1)
  {
    v71 = *(_QWORD *)(v69 + 16);
    if (v71 != 1)
    {
      *(_DWORD *)v68 = *(_DWORD *)v69;
      *(_BYTE *)(v68 + 4) = *(_BYTE *)(v69 + 4);
      *(_BYTE *)(v68 + 5) = *(_BYTE *)(v69 + 5);
      *(_BYTE *)(v68 + 6) = *(_BYTE *)(v69 + 6);
      *(_QWORD *)(v68 + 8) = *(_QWORD *)(v69 + 8);
      *(_QWORD *)(v68 + 16) = v71;
      swift_bridgeObjectRelease(v70);
      goto LABEL_22;
    }
    sub_10000E484(v68);
  }
  *(_OWORD *)v68 = *(_OWORD *)v69;
  *(_QWORD *)(v68 + 16) = *(_QWORD *)(v69 + 16);
LABEL_22:
  v72 = a3[29];
  v73 = (_QWORD *)(a1 + v72);
  v74 = (uint64_t *)(a2 + v72);
  v76 = *v74;
  v75 = v74[1];
  v77 = v73[1];
  *v73 = v76;
  v73[1] = v75;
  swift_bridgeObjectRelease(v77);
  v78 = a3[30];
  v79 = (_QWORD *)(a1 + v78);
  v80 = (uint64_t *)(a2 + v78);
  v82 = *v80;
  v81 = v80[1];
  v83 = v79[1];
  *v79 = v82;
  v79[1] = v81;
  swift_bridgeObjectRelease(v83);
  return a1;
}

uint64_t sub_10000EA40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000EA4C);
}

uint64_t sub_10000EA4C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_100004A10(&qword_1000562A8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 52), a2, v8);
  }
}

uint64_t sub_10000EACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000EAD8);
}

uint64_t sub_10000EAD8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_100004A10(&qword_1000562A8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 52), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for FriendModel(uint64_t a1)
{
  uint64_t result;

  result = qword_100056308;
  if (!qword_100056308)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FriendModel);
  return result;
}

void sub_10000EB8C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[27];

  v4[0] = &unk_100042D20;
  v4[1] = &unk_100042D20;
  v4[2] = &unk_100042D20;
  v4[3] = &unk_100042D38;
  v4[4] = &unk_100042D38;
  v4[5] = &unk_100042D38;
  v4[6] = &unk_100042D38;
  v4[7] = &unk_100042D38;
  v4[8] = &unk_100042D38;
  sub_10000EC74(319);
  if (v3 <= 0x3F)
  {
    v4[9] = *(_QWORD *)(v2 - 8) + 64;
    v4[10] = &unk_100042D50;
    v4[11] = &unk_100042D38;
    v4[12] = &unk_100042D50;
    v4[13] = &unk_100042D50;
    v4[14] = &unk_100042D50;
    v4[15] = &unk_100042D68;
    v4[16] = &unk_100042D80;
    v4[17] = &unk_100042D98;
    v4[18] = &unk_100042D38;
    v4[19] = &unk_100042D38;
    v4[20] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[21] = &unk_100042D98;
    v4[22] = &unk_100042D38;
    v4[23] = &unk_100042D38;
    v4[24] = &unk_100042DB0;
    v4[25] = &unk_100042D50;
    v4[26] = &unk_100042D50;
    swift_initStructMetadata(a1, 256, 27, v4, a1 + 16);
  }
}

void sub_10000EC74(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100056318)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100056318);
  }
}

uint64_t sub_10000ECC8@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, int a6@<W5>, unint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  _QWORD *v16;
  unint64_t *v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  char v35;
  id v36;
  Swift::String v37;
  Swift::String v38;
  Swift::String v39;
  unint64_t *v40;
  char v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  Swift::String v60;
  unint64_t v61;
  unint64_t v62;
  char v64;
  unint64_t *v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  Swift::String v76;

  v69 = a5;
  v67 = a3;
  v68 = a2;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (int *)type metadata accessor for FriendModel(0);
  *(_BYTE *)(a7 + v15[27]) = 0;
  v16 = (_QWORD *)(a7 + v15[28]);
  *v16 = 0;
  v16[1] = 0;
  v16[2] = 1;
  *(_OWORD *)(a7 + v15[29]) = xmmword_100042CB0;
  v17 = (unint64_t *)(a7 + v15[30]);
  v18 = (a1 >> 8) & 1;
  if (a1 == 2)
    v18 = 0;
  v66 = v18;
  v19 = (a1 == 2) | a1;
  *v17 = 0;
  v17[1] = 0;
  v65 = v17;
  v20 = UUID.init()();
  v21 = UUID.uuidString.getter(v20);
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  *(_QWORD *)a7 = v21;
  *(_QWORD *)(a7 + 8) = v23;
  *(_QWORD *)(a7 + 16) = 0;
  *(_QWORD *)(a7 + 24) = 0xE000000000000000;
  *(_QWORD *)(a7 + 32) = 0;
  *(_QWORD *)(a7 + 40) = 0xE000000000000000;
  *(_BYTE *)(a7 + 48) = v68;
  *(_BYTE *)(a7 + 49) = v19 & 1;
  *(_BYTE *)(a7 + 50) = a4;
  v24 = v69 != 0;
  *(_BYTE *)(a7 + 51) = v69 != 0;
  *(_BYTE *)(a7 + 53) = 0;
  v25 = a7 + v15[13];
  v26 = type metadata accessor for Date(0);
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 1, 1, v26);
  *(_BYTE *)(a7 + 52) = a6;
  v27 = (_QWORD *)(a7 + v15[14]);
  *v27 = 0;
  v27[1] = 0;
  *(_BYTE *)(a7 + v15[15]) = 0;
  v28 = v66;
  v68 = a6;
  v29 = v67;
  v30 = sub_10001356C(v19 & 1, v66, v24, a6, v67, a4);
  v31 = (uint64_t *)(a7 + v15[16]);
  *v31 = v30;
  v31[1] = v32;
  if ((v19 & 1) == 0)
  {
    v36 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v76._object = (void *)0xE000000000000000;
    v37._object = (void *)0x8000000100041A50;
    v37._countAndFlagsBits = 0xD000000000000013;
    v38._countAndFlagsBits = 0;
    v38._object = (void *)0xE000000000000000;
    v76._countAndFlagsBits = 0;
    v39 = NSLocalizedString(_:tableName:bundle:value:comment:)(v37, (Swift::String_optional)0, (NSBundle)v36, v38, v76);

    *(Swift::String *)(a7 + v15[17]) = v39;
    *(_BYTE *)(a7 + v15[22]) = 0;
    v35 = 1;
    goto LABEL_7;
  }
  v33 = (_QWORD *)(a7 + v15[17]);
  *v33 = 0;
  v33[1] = 0;
  v34 = v15[22];
  if ((v28 & 1) != 0)
  {
    v35 = 0;
    *(_BYTE *)(a7 + v34) = 1;
LABEL_7:
    v40 = v65;
    v41 = v29;
    goto LABEL_8;
  }
  v40 = v65;
  v41 = v29;
  if (v69)
  {
    *(_BYTE *)(a7 + v34) = 0;
    v35 = 1;
  }
  else
  {
    v64 = v68;
    *(_BYTE *)(a7 + v34) = v68 & 1;
    v35 = (v64 ^ 1) & (v29 | a4);
  }
LABEL_8:
  v42 = v69;
  *(_BYTE *)(a7 + v15[23]) = v35 & 1;
  v43 = (_QWORD *)(a7 + v15[18]);
  *v43 = 0;
  v43[1] = 0;
  v44 = a7 + v15[19];
  *(_QWORD *)v44 = 0;
  *(_BYTE *)(v44 + 8) = 1;
  v45 = a7 + v15[20];
  *(_QWORD *)v45 = 0;
  *(_QWORD *)(v45 + 8) = 0;
  *(_BYTE *)(v45 + 16) = 1;
  v46 = a7 + v15[21];
  *(_QWORD *)v46 = 0;
  *(_QWORD *)(v46 + 8) = 0;
  *(_BYTE *)(v46 + 16) = -1;
  *(_QWORD *)(a7 + v15[24]) = 0;
  v47 = a7 + v15[25];
  *(_QWORD *)v47 = 0;
  *(_QWORD *)(v47 + 8) = 0;
  *(_BYTE *)(v47 + 16) = -1;
  *(_BYTE *)(a7 + v15[26]) = (v42 != 0) | (v68 | v41) & 1;
  v70 = a7;
  v48 = sub_100004A10(&qword_1000563B0);
  v49 = sub_1000137BC();
  v50 = _Pointer.debugDescription.getter(v48, v49);
  v52 = v51;
  v53 = sub_100008B1C(9uLL, v50, v51);
  v55 = v54;
  v74 = 7876668;
  v75 = 0xE300000000000000;
  v70 = v53;
  v71 = v56;
  v72 = v57;
  v73 = v54;
  v58 = sub_100008BC4();
  String.append<A>(contentsOf:)(&v70, &type metadata for Substring, v58);
  swift_bridgeObjectRelease(v55);
  v59 = v75;
  v70 = v74;
  v71 = v75;
  swift_bridgeObjectRetain(v75);
  v60._countAndFlagsBits = 15987;
  v60._object = (void *)0xE200000000000000;
  String.append(_:)(v60);
  swift_bridgeObjectRelease(v59);
  swift_errorRelease(v42);
  swift_bridgeObjectRelease(v52);
  v61 = v71;
  v62 = v40[1];
  *v40 = v70;
  v40[1] = v61;
  return swift_bridgeObjectRelease(v62);
}

uint64_t sub_10000F0CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
    return String.subscript.getter(15, a1, a2);
  else
    return 0;
}

uint64_t sub_10000F10C(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_1000134CC(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = sub_100013CFC(result, v3, 0, a1);
  swift_bridgeObjectRetain(v6);
  return v5;
}

uint64_t sub_10000F188(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000F1C4 + 4 * byte_100042CD0[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_10000F1C4()
{
  return 1701667182;
}

uint64_t sub_10000F1D4()
{
  return 0x656C646E6168;
}

uint64_t sub_10000F1E8()
{
  return 0x686563616C507369;
}

uint64_t sub_10000F20C()
{
  return 0x64656E6769537369;
}

uint64_t sub_10000F228()
{
  return 0x4C7974706D457369;
}

uint64_t sub_10000F248()
{
  return 0x6576726553736168;
}

uint64_t sub_10000F26C()
{
  return 0x64656D6954736168;
}

uint64_t sub_10000F290()
{
  return 0x7461636F4C736168;
}

unint64_t sub_10000F2B0()
{
  return 0xD000000000000010;
}

uint64_t sub_10000F474(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = sub_10000F188(*a1);
  v5 = v4;
  v6 = sub_10000F188(v2);
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

Swift::Int sub_10000F4FC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_10000F188(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

double sub_10000F55C(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  v3 = sub_10000F188(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v5).n128_u64[0];
  return result;
}

Swift::Int sub_10000F59C(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_10000F188(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_10000F5F8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_100013FA4(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_10000F624@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10000F188(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000F64C()
{
  unsigned __int8 *v0;

  return sub_10000F188(*v0);
}

uint64_t sub_10000F654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100013FA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000F678()
{
  return 0;
}

void sub_10000F684(_BYTE *a1@<X8>)
{
  *a1 = 25;
}

uint64_t sub_10000F690(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001382C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000F6B8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001382C();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_10000F6E0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, unsigned int a6@<W5>, void *a7@<X6>, void *a8@<X7>, unint64_t a9@<X8>, unsigned __int8 a10, double a11, char a12, uint64_t a13)
{
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
  char *v58;
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
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  int *v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t (*v90)(char *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  unsigned __int8 v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  int *v116;
  char *v117;
  int v118;
  int v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  unint64_t v130;
  unint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  char v134;
  int v135;
  void *v136;
  id v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  char v142;
  char v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  char v148;
  _QWORD *v149;
  uint64_t v150;
  void (*v151)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v152;
  id v153;
  char *v154;
  void (*v155)(char *, char *, uint64_t);
  uint64_t v156;
  uint64_t v157;
  void *v158;
  Swift::String v159;
  uint64_t v160;
  Swift::String v161;
  uint64_t *v162;
  uint64_t v163;
  void *v164;
  id v165;
  Swift::String v166;
  Swift::String v167;
  Swift::String v168;
  uint64_t *v169;
  _QWORD *v170;
  uint64_t v171;
  uint64_t v172;
  char v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  _QWORD *v177;
  unint64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  _QWORD *v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  void *v188;
  void *v189;
  char v190;
  unsigned __int8 v191;
  unint64_t v192;
  uint64_t KeyPath;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  id v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  char v207;
  unint64_t v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  unint64_t v219;
  unint64_t v220;
  Swift::String v221;
  unint64_t v222;
  unint64_t v223;
  unint64_t *v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  Swift::String v228;
  Swift::String v229;
  Swift::String v230;
  id v231;
  Swift::String v232;
  Swift::String v233;
  Swift::String v234;
  uint64_t v235;
  uint64_t v236;
  int v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  void *v246;
  void *v247;
  uint64_t v248;
  int v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  unint64_t v272;
  unint64_t v273;
  uint64_t v274;
  uint64_t *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  unint64_t v279;
  unint64_t v280;
  Swift::String v281;
  Swift::String v282;
  Swift::String v283;
  uint64_t countAndFlagsBits;
  void *object;
  _QWORD *v286;
  unint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t *v295;
  id v296;
  Swift::String v297;
  Swift::String v298;
  Swift::String v299;
  uint64_t v300;
  char v301;
  uint64_t v302;
  void *v303;
  void *v304;
  void *v305;
  uint64_t *v306;
  Swift::String v307;
  uint64_t v308;
  Swift::String v309;
  uint64_t *v310;
  _QWORD *v311;
  id v312;
  id v313;
  Swift::String v314;
  Swift::String v315;
  Swift::String v316;
  uint64_t v317;
  uint64_t v318;
  unint64_t v319;
  void *v320;
  void *v321;
  unint64_t v322;
  unint64_t v323;
  uint64_t v324;
  uint64_t v325;
  int v326;
  uint64_t v327;
  char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  int v333;
  char *v334;
  char *v335;
  char *v336;
  char *v337;
  char *v338;
  char *v339;
  char *v340;
  char *v341;
  char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  uint64_t (*v347)(uint64_t, uint64_t, uint64_t);
  uint64_t v348;
  char *v349;
  uint64_t v350;
  uint64_t v351;
  void (*v352)(uint64_t, uint64_t);
  uint64_t v353;
  void *v354;
  void *v355;
  unint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  unint64_t *v360;
  uint64_t v361;
  uint64_t *v362;
  uint64_t v363;
  uint64_t v364;
  char *v365;
  char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  int *v370;
  uint64_t v371;
  uint64_t v372;
  unint64_t v373;
  _BOOL4 v374;
  uint64_t v375;
  id v376;
  int v377;
  uint64_t v378;
  unsigned int v379;
  uint64_t v380;
  unint64_t v381;
  unint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  unint64_t v386;
  Swift::String v387;
  Swift::String v388;
  Swift::String v389;
  Swift::String v390;
  Swift::String v391;
  Swift::String v392;

  v355 = a8;
  v354 = a7;
  v333 = a5;
  LODWORD(v380) = a4;
  v359 = a3;
  v351 = a2;
  v361 = type metadata accessor for ContactsUtilities(0);
  v16 = __chkstk_darwin(v361);
  v362 = (uint64_t *)((char *)&v324 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v16);
  v363 = (uint64_t)&v324 - v18;
  v19 = sub_100004A10(&qword_100056460);
  __chkstk_darwin(v19);
  v334 = (char *)&v324 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100004A10(&qword_100056468);
  v22 = __chkstk_darwin(v21);
  v336 = (char *)&v324 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v332 = (uint64_t)&v324 - v25;
  v26 = __chkstk_darwin(v24);
  v344 = (uint64_t)&v324 - v27;
  v28 = __chkstk_darwin(v26);
  v325 = (uint64_t)&v324 - v29;
  v30 = __chkstk_darwin(v28);
  v327 = (uint64_t)&v324 - v31;
  v32 = __chkstk_darwin(v30);
  v328 = (char *)&v324 - v33;
  v34 = __chkstk_darwin(v32);
  v335 = (char *)&v324 - v35;
  v36 = __chkstk_darwin(v34);
  v329 = (uint64_t)&v324 - v37;
  v38 = __chkstk_darwin(v36);
  v331 = (uint64_t)&v324 - v39;
  v40 = __chkstk_darwin(v38);
  v330 = (uint64_t)&v324 - v41;
  v42 = __chkstk_darwin(v40);
  v343 = (uint64_t)&v324 - v43;
  v44 = __chkstk_darwin(v42);
  v342 = (char *)&v324 - v45;
  __chkstk_darwin(v44);
  v350 = (uint64_t)&v324 - v46;
  v367 = type metadata accessor for Date(0);
  v372 = *(_QWORD *)(v367 - 8);
  v47 = __chkstk_darwin(v367);
  v338 = (char *)&v324 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v47);
  v365 = (char *)&v324 - v49;
  v50 = sub_100004A10(&qword_1000562A8);
  v51 = __chkstk_darwin(v50);
  v349 = (char *)&v324 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __chkstk_darwin(v51);
  v339 = (char *)&v324 - v54;
  __chkstk_darwin(v53);
  v348 = (uint64_t)&v324 - v55;
  v357 = type metadata accessor for FMFRelationshipType(0);
  v358 = *(_QWORD *)(v357 - 8);
  v56 = __chkstk_darwin(v357);
  v58 = (char *)&v324 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v56);
  v60 = (char *)&v324 - v59;
  v61 = sub_100004A10(&qword_100056470);
  v62 = __chkstk_darwin(v61);
  v341 = (char *)&v324 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __chkstk_darwin(v62);
  v340 = (char *)&v324 - v65;
  v66 = __chkstk_darwin(v64);
  v337 = (char *)&v324 - v67;
  __chkstk_darwin(v66);
  v366 = (char *)&v324 - v68;
  v69 = type metadata accessor for FMFFriend(0);
  v70 = *(_QWORD *)(v69 - 8);
  __chkstk_darwin(v69);
  v72 = (char *)&v324 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_100004A10(&qword_100056478);
  __chkstk_darwin(v73);
  v75 = (char *)&v324 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = (int *)type metadata accessor for FriendModel(0);
  *(_BYTE *)(a9 + v76[27]) = 0;
  v77 = (_QWORD *)(a9 + v76[28]);
  *v77 = 0;
  v77[1] = 0;
  v77[2] = 1;
  *(_OWORD *)(a9 + v76[29]) = xmmword_100042CB0;
  v370 = v76;
  v78 = v76[30];
  v356 = a9;
  v79 = (unint64_t *)(a9 + v78);
  v374 = a6 != 2;
  LODWORD(v378) = a6 == 2;
  v379 = a6;
  v80 = (a6 >> 8) & 1;
  LODWORD(v364) = v80;
  if (a6 == 2)
    v80 = 0;
  v377 = v80;
  v375 = a13;
  LODWORD(v346) = a13 != 0;
  *v79 = 0;
  v79[1] = 0;
  v360 = v79;
  FMFFriend.contact.getter();
  v81 = type metadata accessor for FMFContact(0);
  v82 = *(_QWORD *)(v81 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v75, 1, v81) == 1)
  {
    sub_100008C08((uint64_t)v75, &qword_100056478);
    v83 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 16))(v72, a1, v69);
    v84 = a1;
  }
  else
  {
    v369 = FMFContact.displayName.getter();
    v86 = v85;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v75, v81);
    v83 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 16))(v72, a1, v69);
    v84 = a1;
    v368 = v86;
    if (v86)
      goto LABEL_7;
  }
  v87 = FMFFriend.contactHandles.getter(v83);
  v369 = sub_10000F10C(v87);
  v89 = v88;
  swift_bridgeObjectRelease(v87);
  v368 = v89;
  if (!v89)
  {
LABEL_151:
    __break(1u);
    return;
  }
LABEL_7:
  v90 = *(uint64_t (**)(char *, uint64_t))(v70 + 8);
  v353 = v69;
  v91 = v90(v72, v69);
  v92 = FMFFriend.contactHandles.getter(v91);
  v371 = sub_10000F10C(v92);
  v94 = v93;
  swift_bridgeObjectRelease(v92);
  v373 = v94;
  if (!v94)
  {
    __break(1u);
    goto LABEL_151;
  }
  v96 = v380;
  LODWORD(v378) = v378 | v379;
  v97 = (uint64_t)v366;
  FMFFriend.location.getter(v95);
  v98 = type metadata accessor for FMFLocation(0);
  v99 = *(_QWORD *)(v98 - 8);
  v347 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v99 + 48);
  v100 = v347(v97, 1, v98);
  v380 = v84;
  v352 = (void (*)(uint64_t, uint64_t))v90;
  v345 = v99;
  if (v100 == 1)
  {
    v101 = sub_100008C08(v97, &qword_100056470);
    v376 = 0;
  }
  else
  {
    v376 = (id)FMFLocation.location.getter();
    v101 = (*(uint64_t (**)(uint64_t, uint64_t))(v99 + 8))(v97, v98);
  }
  LODWORD(v366) = a10;
  v102 = FMFFriend.relationshipType.getter(v101);
  static FMFRelationshipType.willShareLocationWithMe.getter(v102);
  v103 = sub_1000086D4(&qword_100056480, (uint64_t (*)(uint64_t))&type metadata accessor for FMFRelationshipType, (uint64_t)&protocol conformance descriptor for FMFRelationshipType);
  v104 = v357;
  v326 = dispatch thunk of SetAlgebra.isSuperset(of:)(v58, v357, v103);
  v105 = *(void (**)(char *, uint64_t))(v358 + 8);
  v105(v58, v104);
  v106 = ((uint64_t (*)(char *, uint64_t))v105)(v60, v104);
  v107 = FMFFriend.relationshipType.getter(v106);
  static FMFRelationshipType.sharesLocationWithMe.getter(v107);
  v108 = dispatch thunk of SetAlgebra.isSuperset(of:)(v58, v104, v103);
  v105(v58, v104);
  v109 = ((uint64_t (*)(char *, uint64_t))v105)(v60, v104);
  v110 = FMFFriend.relationshipType.getter(v109);
  static FMFRelationshipType.followsMyLocation.getter(v110);
  v111 = dispatch thunk of SetAlgebra.isSuperset(of:)(v58, v104, v103);
  v105(v58, v104);
  v112 = ((uint64_t (*)(char *, uint64_t))v105)(v60, v104);
  if (v96 == 2)
  {
    v113 = v364;
    if ((v379 & 1) == 0)
      v113 = 1;
    v114 = v375;
    v116 = v370;
    v115 = v371;
    v117 = v365;
    if ((v374 & v113 & 1) != 0)
      goto LABEL_25;
    v118 = 0;
    if (v375)
      goto LABEL_25;
LABEL_21:
    if (!v376)
      goto LABEL_25;
    if ((v108 & 1) == 0)
    {
      v120 = v356;
      *(_BYTE *)(v356 + 53) = 0;
      if ((v111 & 1) != 0)
      {
        v132 = (_QWORD *)(v120 + v116[14]);
        *v132 = 0;
        v132[1] = 0;
        *(_BYTE *)(v120 + v116[15]) = 0;
        v133 = v367;
        (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v372 + 56))(v120 + v116[13], 1, 1, v367);
        v134 = v333;
        v135 = v333;
        v136 = (void *)objc_opt_self(NSBundle);
        v137 = objc_msgSend(v136, "mainBundle");
        if (v135 == 2 || (v134 & 1) != 0)
        {
          v388._object = (void *)0xE000000000000000;
          v228._object = (void *)0x8000000100041AB0;
          v228._countAndFlagsBits = 0xD000000000000012;
          v229._countAndFlagsBits = 0;
          v229._object = (void *)0xE000000000000000;
          v388._countAndFlagsBits = 0;
          v230 = NSLocalizedString(_:tableName:bundle:value:comment:)(v228, (Swift::String_optional)0, (NSBundle)v137, v229, v388);

          *(Swift::String *)(v120 + v116[16]) = v230;
          v138 = v373;
          if ((v326 & 1) != 0)
          {
            v231 = objc_msgSend(v136, "mainBundle");
            v232._countAndFlagsBits = 0xD000000000000020;
            v389._object = (void *)0xE000000000000000;
            v232._object = (void *)0x8000000100041AD0;
            v233._countAndFlagsBits = 0;
            v233._object = (void *)0xE000000000000000;
            v389._countAndFlagsBits = 0;
            v234 = NSLocalizedString(_:tableName:bundle:value:comment:)(v232, (Swift::String_optional)0, (NSBundle)v231, v233, v389);

            *(Swift::String *)(v120 + v116[17]) = v234;
          }
          else
          {
            v286 = (_QWORD *)(v120 + v116[17]);
            *v286 = 0;
            v286[1] = 0;
          }
          v127 = v355;
          v128 = v354;
          v115 = v371;
          v114 = v375;
          *(_BYTE *)(v120 + v116[22]) = 0;
          *(_BYTE *)(v120 + v116[23]) = 0;
          v133 = v367;
        }
        else
        {
          v127 = v355;
          v128 = v354;
          v138 = v373;
          if ((v378 & 1) != 0)
          {
            v115 = v371;
            v323 = 0xE000000000000000;
            if ((v377 & 1) != 0)
            {
              v139 = 0x656E616C70726941;
              v140 = 0xEE006E4F65646F4DLL;
            }
            else
            {
              v139 = 0x697461636F4C6F4ELL;
              v140 = 0xEF646E756F466E6FLL;
            }
            v307._countAndFlagsBits = 0;
            v307._object = (void *)0xE000000000000000;
            v308 = 0;
            v309 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v139, (Swift::String_optional)0, (NSBundle)v137, v307, *(Swift::String *)(&v323 - 1));
            countAndFlagsBits = v309._countAndFlagsBits;
            object = v309._object;
          }
          else
          {
            v390._object = (void *)0xE000000000000000;
            v281._countAndFlagsBits = 0x4C746F4E72657355;
            v281._object = (void *)0xEF6E49646567676FLL;
            v282._countAndFlagsBits = 0;
            v282._object = (void *)0xE000000000000000;
            v390._countAndFlagsBits = 0;
            v283 = NSLocalizedString(_:tableName:bundle:value:comment:)(v281, (Swift::String_optional)0, (NSBundle)v137, v282, v390);
            countAndFlagsBits = v283._countAndFlagsBits;
            object = v283._object;
            v115 = v371;
          }

          v310 = (uint64_t *)(v120 + v116[16]);
          *v310 = countAndFlagsBits;
          v310[1] = (uint64_t)object;
          v311 = (_QWORD *)(v120 + v116[17]);
          *v311 = 0;
          v311[1] = 0;
          *(_BYTE *)(v120 + v116[22]) = 1;
          *(_BYTE *)(v120 + v116[23]) = 0;
          v114 = v375;
        }
        goto LABEL_58;
      }
      v157 = sub_10001356C(v378 & 1, v377, 0, 0, 0, 0);
      v127 = v355;
      v128 = v354;
      if (v158)
      {
        v125 = v157;
        v126 = v158;
        goto LABEL_45;
      }
      goto LABEL_43;
    }
    LODWORD(v357) = v118;
    v120 = v356;
    *(_BYTE *)(v356 + 53) = 1;
    v121 = (uint64_t)v337;
    FMFFriend.location.getter(v112);
    if (v347(v121, 1, v98) == 1)
    {
      sub_100008C08(v121, &qword_100056470);
      v122 = v348;
    }
    else
    {
      v141 = FMFLocation.motionActivityState.getter();
      v143 = v142;
      (*(void (**)(uint64_t, uint64_t))(v345 + 8))(v121, v98);
      v122 = v348;
      if ((v143 & 1) == 0 && (unint64_t)(v141 - 3) <= 2)
      {
        v144 = 8 * (v141 - 3);
        v145 = *(_QWORD *)&aFigureRbicycle[v144];
        v146 = *(_QWORD *)&aCarFillun[v144 + 8];
        v147 = (_QWORD *)(v120 + v116[14]);
        *v147 = v145;
        v147[1] = v146;
        v148 = 1;
        goto LABEL_39;
      }
    }
    v148 = 0;
    v149 = (_QWORD *)(v120 + v116[14]);
    *v149 = 0;
    v149[1] = 0;
LABEL_39:
    *(_BYTE *)(v120 + v116[15]) = v148;
    v150 = v372;
    v151 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v372 + 56);
    v152 = v367;
    v151(v122, 1, 1, v367);
    v153 = objc_msgSend(v376, "timestamp");
    v154 = v338;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v155 = *(void (**)(char *, char *, uint64_t))(v150 + 32);
    v156 = (uint64_t)v339;
    v155(v339, v154, v152);
    v151(v156, 0, 1, v152);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v156, 1, v152) == 1)
    {
      sub_100008C08(v156, &qword_1000562A8);
    }
    else
    {
      v226 = ((uint64_t (*)(char *, uint64_t, uint64_t))v155)(v117, v156, v152);
      if (fabs(Date.timeIntervalSinceNow.getter(v226)) < 7200.0)
      {
        v227 = v348;
        sub_100008C08(v348, &qword_1000562A8);
        v155((char *)v227, v117, v152);
        v151(v227, 0, 1, v152);
        v138 = v373;
        goto LABEL_76;
      }
      (*(void (**)(char *, uint64_t))(v372 + 8))(v117, v152);
    }
    v138 = v373;
    v227 = v348;
LABEL_76:
    v235 = sub_100008CE0(v227, v120 + v116[13], &qword_1000562A8);
    v236 = (uint64_t)v340;
    FMFFriend.location.getter(v235);
    v237 = v347(v236, 1, v98);
    v115 = v371;
    v238 = v350;
    v239 = (uint64_t)v342;
    if (v237 == 1)
    {
      sub_100008C08(v236, &qword_100056470);
      v240 = type metadata accessor for FMFAddress(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v240 - 8) + 56))(v238, 1, 1, v240);
    }
    else
    {
      FMFLocation.address.getter();
      (*(void (**)(uint64_t, uint64_t))(v345 + 8))(v236, v98);
    }
    v241 = v238;
    sub_100008CE0(v238, v239, &qword_100056468);
    v242 = type metadata accessor for FMFAddress(0);
    v243 = *(_QWORD *)(v242 - 8);
    v244 = *(char **)(v243 + 48);
    v378 = v242;
    v365 = v244;
    if (((unsigned int (*)(uint64_t, uint64_t))v244)(v239, 1) == 1)
    {
      v245 = sub_100008C08(v239, &qword_100056468);
      v364 = 0;
      v246 = 0;
    }
    else
    {
      v364 = FMFAddress.locality.getter();
      v246 = v247;
      v245 = (*(uint64_t (**)(uint64_t, uint64_t))(v243 + 8))(v239, v378);
    }
    v248 = (uint64_t)v341;
    FMFFriend.location.getter(v245);
    v249 = v347(v248, 1, v98);
    v358 = v243;
    if (v249 == 1)
    {
      v250 = v243;
      sub_100008C08(v248, &qword_100056470);
      v251 = (uint64_t)v336;
    }
    else
    {
      v252 = v246;
      v253 = v248;
      v254 = (uint64_t)v334;
      FMFLocation.label.getter();
      v255 = v98;
      v256 = v254;
      (*(void (**)(uint64_t, uint64_t))(v345 + 8))(v253, v255);
      v257 = type metadata accessor for FMFLabel(0);
      v258 = *(_QWORD *)(v257 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v258 + 48))(v254, 1, v257) != 1)
      {
        v267 = FMFLabel.localizedValue.getter();
        v269 = v268;
        (*(void (**)(uint64_t, uint64_t))(v258 + 8))(v256, v257);
        v241 = v350;
        v270 = v343;
        sub_100008CE0(v350, v343, &qword_100056468);
        v115 = v371;
        v251 = (uint64_t)v336;
        v246 = v252;
        v259 = v270;
        v250 = v358;
        if (v269)
        {
          sub_100008C08(v259, &qword_100056468);
          v263 = v250;
          goto LABEL_99;
        }
LABEL_87:
        v346 = v246;
        if ((v357 & 1) != 0)
        {
          sub_100008C08(v259, &qword_100056468);
          v260 = v331;
          sub_100008CE0(v241, v331, &qword_100056468);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v260, 1, v378) == 1)
          {
            sub_100008C08(v260, &qword_100056468);
            v261 = v329;
            sub_100008CE0(v241, v329, &qword_100056468);
            v262 = (uint64_t)v335;
            v263 = v250;
            v264 = v261;
LABEL_95:
            sub_100008CE0(v264, v262, &qword_100056468);
            if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v262, 1, v378) == 1)
            {
              sub_100008C08(v264, &qword_100056468);
              sub_100008C08(v262, &qword_100056468);
LABEL_124:
              v291 = v344;
              sub_100008CE0(v241, v344, &qword_100056468);
              v292 = v291;
              v293 = v332;
              sub_100008CE0(v292, v332, &qword_100056468);
              if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v293, 1, v378) == 1)
              {
                sub_100008C08(v293, &qword_100056468);
LABEL_129:
                v296 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
                v391._object = (void *)0xE000000000000000;
                v297._countAndFlagsBits = 0x7365726464416F4ELL;
                v297._object = (void *)0xEE00646E756F4673;
                v298._countAndFlagsBits = 0;
                v298._object = (void *)0xE000000000000000;
                v391._countAndFlagsBits = 0;
                v299 = NSLocalizedString(_:tableName:bundle:value:comment:)(v297, (Swift::String_optional)0, (NSBundle)v296, v298, v391);

                sub_100008C08(v344, &qword_100056468);
                swift_bridgeObjectRelease(0);
                *(Swift::String *)(v120 + v370[16]) = v299;
                v241 = v350;
                v246 = v346;
                goto LABEL_130;
              }
              v271 = FMFAddress.landmark.getter();
              v290 = v294;
              (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v293, v378);
              if (!v290)
                goto LABEL_129;
              v273 = 0;
              v289 = v344;
LABEL_128:
              swift_bridgeObjectRetain(v273);
              sub_100008C08(v289, &qword_100056468);
              v295 = (uint64_t *)(v120 + v370[16]);
              *v295 = v271;
              v295[1] = v290;
              swift_bridgeObjectRelease(v273);
              v241 = v350;
              v246 = v346;
              v263 = v358;
              goto LABEL_130;
            }
            v277 = FMFAddress.streetAddress.getter();
            v278 = (uint64_t)v335;
            v271 = v277;
            v273 = v279;
LABEL_117:
            sub_100008C08(v264, &qword_100056468);
            (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v278, v378);
            if (!v273)
              goto LABEL_124;
            goto LABEL_118;
          }
          v271 = FMFAddress.streetName.getter();
          v273 = v272;
          v263 = v250;
          (*(void (**)(uint64_t, uint64_t))(v250 + 8))(v260, v378);
          v264 = v329;
          sub_100008CE0(v241, v329, &qword_100056468);
          v262 = (uint64_t)v335;
          if (!v273)
            goto LABEL_95;
LABEL_110:
          sub_100008C08(v264, &qword_100056468);
LABEL_118:
          v288 = HIBYTE(v273) & 0xF;
          if ((v273 & 0x2000000000000000) == 0)
            v288 = v271 & 0xFFFFFFFFFFFFLL;
          v289 = v344;
          if (v288)
          {
            sub_100008CE0(v241, v344, &qword_100056468);
            v290 = v273;
            goto LABEL_128;
          }
          swift_bridgeObjectRelease(v273);
          goto LABEL_123;
        }
        v265 = v330;
        sub_100008CE0(v259, v330, &qword_100056468);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v265, 1, v378) == 1)
        {
          sub_100008C08(v259, &qword_100056468);
          sub_100008C08(v265, &qword_100056468);
          v266 = (uint64_t)v328;
          goto LABEL_105;
        }
        v267 = FMFAddress.landmark.getter();
        v269 = v274;
        sub_100008C08(v259, &qword_100056468);
        (*(void (**)(uint64_t, uint64_t))(v250 + 8))(v265, v378);
        v266 = (uint64_t)v328;
        if (!v269)
        {
LABEL_105:
          sub_100008CE0(v241, v266, &qword_100056468);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v266, 1, v378) == 1)
          {
            sub_100008C08(v266, &qword_100056468);
            v276 = v327;
            sub_100008CE0(v241, v327, &qword_100056468);
          }
          else
          {
            v271 = FMFAddress.streetAddress.getter();
            v273 = v280;
            (*(void (**)(uint64_t, uint64_t))(v358 + 8))(v266, v378);
            v276 = v327;
            sub_100008CE0(v241, v327, &qword_100056468);
            if (v273)
            {
              v264 = v276;
              goto LABEL_110;
            }
          }
          v278 = v325;
          sub_100008CE0(v276, v325, &qword_100056468);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v278, 1, v378) == 1)
          {
            sub_100008C08(v276, &qword_100056468);
            sub_100008C08(v278, &qword_100056468);
LABEL_123:
            v263 = v358;
            goto LABEL_124;
          }
          v271 = FMFAddress.streetName.getter();
          v273 = v287;
          v264 = v276;
          v263 = v358;
          goto LABEL_117;
        }
        v246 = v346;
        v263 = v358;
LABEL_99:
        if (v246
          && (v364 == v267 && v246 == (void *)v269
           || (_stringCompareWithSmolCheck(_:_:expecting:)(v364, v246, v267, v269, 0) & 1) != 0))
        {
          swift_bridgeObjectRelease(v269);
          v267 = 0;
          v269 = 0;
        }
        v275 = (uint64_t *)(v120 + v370[16]);
        *v275 = v267;
        v275[1] = v269;
LABEL_130:
        sub_100008CE0(v241, v251, &qword_100056468);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v251, 1, v378) == 1)
        {
          sub_100008C08(v251, &qword_100056468);
          v300 = v375;
          v301 = (char)v366;
          if (v246)
          {
            v127 = v355;
            v128 = v354;
            v116 = v370;
            v133 = v367;
LABEL_145:
            sub_100008C08(v350, &qword_100056468);
            v171 = sub_100008C08(v348, &qword_1000562A8);
            v306 = (uint64_t *)(v120 + v116[17]);
            *v306 = v364;
            v306[1] = (uint64_t)v246;
            *(_BYTE *)(v120 + v116[22]) = 0;
            *(_BYTE *)(v120 + v116[23]) = v301 == -1;
            v114 = v300;
            goto LABEL_58;
          }
          v304 = 0;
        }
        else
        {
          v302 = FMFAddress.country.getter();
          v304 = v303;
          (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v251, v378);
          v300 = v375;
          if (v246)
          {
            v116 = v370;
            v133 = v367;
            if (v304)
            {
              if (v302 == v364 && v304 == v246
                || (_stringCompareWithSmolCheck(_:_:expecting:)(v302, v304, v364, v246, 0) & 1) != 0
                || (_DWORD)v357)
              {
                v305 = v304;
              }
              else
              {
                v312 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
                v346 = v246;
                v313 = v312;
                v392._object = (void *)0xEE007972746E756FLL;
                v314._countAndFlagsBits = 0x43646E4179746943;
                v314._object = (void *)0xEE007972746E756FLL;
                v315._countAndFlagsBits = 0;
                v315._object = (void *)0xE000000000000000;
                v392._countAndFlagsBits = 0x43646E4179746943;
                v316 = NSLocalizedString(_:tableName:bundle:value:comment:)(v314, (Swift::String_optional)0, (NSBundle)v313, v315, v392);

                v317 = sub_100004A10((uint64_t *)&unk_100056F90);
                v318 = swift_allocObject(v317, 112, 7);
                *(_OWORD *)(v318 + 16) = xmmword_1000427B0;
                *(_QWORD *)(v318 + 56) = &type metadata for String;
                v319 = sub_100013CB8();
                v320 = v346;
                *(_QWORD *)(v318 + 32) = v364;
                *(_QWORD *)(v318 + 40) = v320;
                *(_QWORD *)(v318 + 96) = &type metadata for String;
                *(_QWORD *)(v318 + 104) = v319;
                v115 = v371;
                *(_QWORD *)(v318 + 64) = v319;
                *(_QWORD *)(v318 + 72) = v302;
                *(_QWORD *)(v318 + 80) = v304;
                v133 = v367;
                v364 = String.init(format:_:)(v316._countAndFlagsBits, v316._object, v318);
                v246 = v321;
                v305 = v316._object;
              }
              swift_bridgeObjectRelease(v305);
            }
            v127 = v355;
            v128 = v354;
            goto LABEL_144;
          }
        }
        v127 = v355;
        v128 = v354;
        v116 = v370;
        v133 = v367;
        swift_bridgeObjectRelease(v304);
LABEL_144:
        v301 = (char)v366;
        goto LABEL_145;
      }
      sub_100008C08(v254, &qword_100056460);
      v115 = v371;
      v241 = v350;
      v251 = (uint64_t)v336;
      v246 = v252;
      v250 = v358;
    }
    v259 = v343;
    sub_100008CE0(v241, v343, &qword_100056468);
    goto LABEL_87;
  }
  v119 = v364;
  if ((v379 & 1) == 0)
    v119 = 1;
  v114 = v375;
  v116 = v370;
  v115 = v371;
  v117 = v365;
  if ((v374 & v119 & 1) == 0)
  {
    v118 = v96 & 1;
    if (!v375)
      goto LABEL_21;
  }
LABEL_25:
  v120 = v356;
  *(_BYTE *)(v356 + 53) = 0;
  v123 = sub_10001356C(v378 & 1, v377, v114 != 0, 0, 0, 0);
  if (v124)
  {
    v125 = v123;
    v126 = v124;
    v127 = v355;
    v128 = v354;
    goto LABEL_45;
  }
  v127 = v355;
  v128 = v354;
  if ((v108 & 1) == 0)
  {
LABEL_43:
    v129 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v322 = 0xE000000000000000;
    v131 = 0x8000000100041AB0;
    v130 = 0xD000000000000012;
    goto LABEL_44;
  }
  v129 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v322 = 0xE000000000000000;
  v130 = 0x697461636F4C6F4ELL;
  v131 = 0xEF646E756F466E6FLL;
LABEL_44:
  v159._countAndFlagsBits = 0;
  v159._object = (void *)0xE000000000000000;
  v160 = 0;
  v161 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v130, (Swift::String_optional)0, (NSBundle)v129, v159, *(Swift::String *)(&v322 - 1));
  v125 = v161._countAndFlagsBits;
  v126 = v161._object;

LABEL_45:
  v162 = (uint64_t *)(v120 + v116[16]);
  *v162 = v125;
  v162[1] = (uint64_t)v126;
  if ((v378 & 1) != 0)
  {
    v163 = 0;
    v164 = 0;
  }
  else
  {
    v165 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v166._countAndFlagsBits = 0xD000000000000013;
    v387._object = (void *)0xE000000000000000;
    v166._object = (void *)0x8000000100041A50;
    v167._countAndFlagsBits = 0;
    v167._object = (void *)0xE000000000000000;
    v387._countAndFlagsBits = 0;
    v168 = NSLocalizedString(_:tableName:bundle:value:comment:)(v166, (Swift::String_optional)0, (NSBundle)v165, v167, v387);
    v163 = v168._countAndFlagsBits;
    v164 = v168._object;

  }
  v133 = v367;
  v169 = (uint64_t *)(v120 + v116[17]);
  *v169 = v163;
  v169[1] = (uint64_t)v164;
  v170 = (_QWORD *)(v120 + v116[14]);
  *v170 = 0;
  v170[1] = 0;
  *(_BYTE *)(v120 + v116[15]) = 0;
  v171 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v372 + 56))(v120 + v116[13], 1, 1, v133);
  v172 = v116[22];
  if (((v376 == 0) & v108) != 0)
  {
    *(_BYTE *)(v120 + v172) = 1;
    v173 = v378 ^ 1;
    if (((v378 ^ 1 | v377) & 1) != 0)
      goto LABEL_57;
LABEL_56:
    v173 = (char)v346;
    goto LABEL_57;
  }
  if ((v378 & 1) != 0)
  {
    if ((v377 & 1) == 0)
    {
      *(_BYTE *)(v120 + v172) = 0;
      if ((v108 & 1) == 0)
      {
        v173 = 1;
        goto LABEL_57;
      }
      goto LABEL_56;
    }
    v173 = v108 ^ 1;
    *(_BYTE *)(v120 + v172) = 1;
  }
  else
  {
    *(_BYTE *)(v120 + v172) = 0;
    v173 = 1;
  }
LABEL_57:
  *(_BYTE *)(v120 + v116[23]) = v173 & 1;
  v138 = v373;
LABEL_58:
  *(_QWORD *)v120 = FMFFriend.identifier.getter(v171);
  *(_QWORD *)(v120 + 8) = v174;
  v175 = v368;
  *(_QWORD *)(v120 + 16) = v369;
  *(_QWORD *)(v120 + 24) = v175;
  *(_QWORD *)(v120 + 32) = v115;
  *(_QWORD *)(v120 + 40) = v138;
  *(_BYTE *)(v120 + 48) = 0;
  *(_BYTE *)(v120 + 49) = v374 & v379;
  *(_BYTE *)(v120 + 50) = 0;
  *(_BYTE *)(v120 + 51) = v114 != 0;
  *(_BYTE *)(v120 + 52) = 0;
  v176 = v359;
  if (v359)
  {
    v177 = (_QWORD *)(v120 + v116[18]);
    *v177 = v351;
    v177[1] = v176;
    v178 = v120 + v116[19];
    *(_QWORD *)v178 = 0;
    *(_BYTE *)(v178 + 8) = 0;
    v179 = v120 + v116[20];
    *(_QWORD *)v179 = 0;
    *(_QWORD *)(v179 + 8) = 0;
    *(_BYTE *)(v179 + 16) = 0;
    swift_bridgeObjectRetain(v138);
  }
  else
  {
    v180 = swift_bridgeObjectRetain(v138);
    v181 = v133;
    v182 = (uint64_t)v349;
    FMFFriend.shareExpires.getter(v180);
    LODWORD(v181) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v372 + 48))(v182, 1, v181);
    sub_100008C08(v182, &qword_1000562A8);
    v183 = (_QWORD *)(v120 + v116[18]);
    if ((_DWORD)v181 == 1)
    {
      *v183 = 0;
      v183[1] = 0;
      v184 = v120 + v116[19];
      *(_QWORD *)v184 = 0;
      *(_BYTE *)(v184 + 8) = 1;
      v185 = v120 + v116[20];
      *(_QWORD *)v185 = 0;
      *(_QWORD *)(v185 + 8) = 0;
      *(_BYTE *)(v185 + 16) = 1;
    }
    else
    {
      *(_OWORD *)v183 = xmmword_100042CC0;
      v186 = v120 + v116[19];
      *(_QWORD *)v186 = 16409600;
      *(_BYTE *)(v186 + 8) = 0;
      v187 = v120 + v116[20];
      *(_QWORD *)v187 = 0;
      *(_QWORD *)(v187 + 8) = 0;
      *(_BYTE *)(v187 + 16) = 0;
    }
  }
  if ((v377 & 1) != 0)
  {
    v188 = 0;
    v189 = 0;
    v190 = -1;
    v191 = v366;
  }
  else
  {
    v191 = v366;
    sub_100013C54(v128, v127, v366);
    v188 = v128;
    v189 = v127;
    v190 = v191;
  }
  v192 = v120 + v116[21];
  *(_QWORD *)v192 = v188;
  *(_QWORD *)(v192 + 8) = v189;
  *(_BYTE *)(v192 + 16) = v190;
  if ((a12 & 1) != 0)
    a11 = 0.0;
  *(double *)(v120 + v116[24]) = a11;
  KeyPath = swift_getKeyPath(&unk_100042E50);
  v195 = v362;
  *v362 = KeyPath;
  v196 = sub_100004A10((uint64_t *)&unk_100056FC0);
  swift_storeEnumTagMultiPayload(v195, v196, 0);
  v197 = *(int *)(v361 + 20);
  v198 = objc_msgSend((id)objc_opt_self(CNAvatarImageRendererSettings), "defaultSettings");
  v199 = objc_msgSend(objc_allocWithZone((Class)CNAvatarImageRenderer), "initWithSettings:", v198);

  *(uint64_t *)((char *)v195 + v197) = (uint64_t)v199;
  v200 = (uint64_t)v195;
  v201 = v363;
  sub_100013C74(v200, v363);
  v202 = v115;
  v203 = v373;
  v204 = sub_100029B9C(v202, v373);
  v206 = v205;
  LOBYTE(v197) = v207;
  swift_bridgeObjectRelease(v203);
  sub_10000BD68(v201, type metadata accessor for ContactsUtilities);
  v208 = v120 + v116[25];
  *(_QWORD *)v208 = v204;
  *(_QWORD *)(v208 + 8) = v206;
  *(_BYTE *)(v208 + 16) = v197;
  *(_BYTE *)(v120 + v116[26]) = 0;
  v381 = v120;
  v209 = sub_100004A10(&qword_1000563B0);
  v210 = sub_1000137BC();
  v211 = _Pointer.debugDescription.getter(v209, v210);
  v213 = v212;
  v214 = sub_100008B1C(9uLL, v211, v212);
  v216 = v215;
  v385 = 7876668;
  v386 = 0xE300000000000000;
  v381 = v214;
  v382 = v217;
  v383 = v218;
  v384 = v215;
  v219 = sub_100008BC4();
  String.append<A>(contentsOf:)(&v381, &type metadata for Substring, v219);
  swift_bridgeObjectRelease(v216);
  v220 = v386;
  v381 = v385;
  v382 = v386;
  swift_bridgeObjectRetain(v386);
  v221._countAndFlagsBits = 15987;
  v221._object = (void *)0xE200000000000000;
  String.append(_:)(v221);
  swift_bridgeObjectRelease(v213);
  swift_bridgeObjectRelease(v220);
  swift_errorRelease(v375);
  sub_100013884(v128, v127, v191);

  v222 = v381;
  v223 = v382;
  v352(v380, v353);
  v224 = v360;
  v225 = v360[1];
  *v360 = v222;
  v224[1] = v223;
  swift_bridgeObjectRelease(v225);
}

void sub_1000116CC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  __int128 v55;
  id v56;
  Class isa;
  id v58;
  __int128 v59;
  id v60;
  Class v61;
  id v62;
  char *v63;
  char v64;
  char v65;
  unint64_t v66;
  __int128 v67;
  id v68;
  Class v69;
  id v70;
  __int128 v71;
  id v72;
  Class v73;
  id v74;
  char *v75;
  id v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  Swift::String v91;
  __int128 v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  _QWORD *v98;
  char *v99;
  char *v100;
  uint64_t *v101;
  int *v102;
  uint64_t *v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;

  v5 = sub_100004A10(&qword_1000562A8);
  __chkstk_darwin(v5);
  v7 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004A10(&qword_1000563C0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for FriendModel(0);
  v13 = (int *)__chkstk_darwin(v12);
  v15 = (uint64_t *)((char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *((_BYTE *)v15 + v13[27]) = 0;
  v16 = (uint64_t *)((char *)v15 + v13[28]);
  *v16 = 0;
  v16[1] = 0;
  v101 = v16;
  v16[2] = 1;
  v17 = (char *)v15 + v13[29];
  *(_OWORD *)v17 = xmmword_100042CB0;
  v102 = v13;
  v103 = v15;
  v18 = (char *)v15 + v13[30];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v99 = v17;
  v100 = v18;
  v20 = a1[3];
  v19 = a1[4];
  v98 = a1;
  sub_100013808(a1, v20);
  v21 = sub_10001382C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for FriendModel.CodingKeys, &type metadata for FriendModel.CodingKeys, v21, v20, v19);
  if (v2)
  {
    sub_100008714(v98);
    v25 = v99;
    v26 = v100;
    sub_100013870(*v101, v101[1], v101[2]);
    swift_bridgeObjectRelease(*((_QWORD *)v25 + 1));
    swift_bridgeObjectRelease(*((_QWORD *)v26 + 1));
  }
  else
  {
    v22 = (uint64_t)v7;
    v97 = a2;
    LOBYTE(v105) = 0;
    v23 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8);
    v24 = v8;
    v27 = v103;
    *v103 = v23;
    v27[1] = v28;
    LOBYTE(v105) = 1;
    v27[2] = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8);
    v27[3] = v29;
    LOBYTE(v105) = 2;
    v27[4] = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8);
    v27[5] = v30;
    LOBYTE(v105) = 3;
    *((_BYTE *)v27 + 48) = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8) & 1;
    LOBYTE(v105) = 4;
    *((_BYTE *)v27 + 49) = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8) & 1;
    LOBYTE(v105) = 5;
    *((_BYTE *)v27 + 50) = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8) & 1;
    LOBYTE(v105) = 6;
    *((_BYTE *)v27 + 51) = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8) & 1;
    LOBYTE(v105) = 7;
    *((_BYTE *)v27 + 52) = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8) & 1;
    LOBYTE(v105) = 8;
    *((_BYTE *)v27 + 53) = KeyedDecodingContainer.decode(_:forKey:)(&v105, v8) & 1;
    v31 = type metadata accessor for Date(0);
    LOBYTE(v105) = 9;
    v32 = sub_1000086D4(&qword_1000563D0, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    v33 = v11;
    v34 = v8;
    v35 = v33;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v31, &v105, v34, v31, v32);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v22, 0, 1, v31);
    sub_10001389C(v22, (uint64_t)v103 + v102[13]);
    LOBYTE(v105) = 10;
    v36 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v24);
    v37 = (uint64_t *)((char *)v103 + v102[14]);
    *v37 = v36;
    v37[1] = v38;
    LOBYTE(v105) = 11;
    v39 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v24);
    *((_BYTE *)v103 + v102[15]) = v39 & 1;
    LOBYTE(v105) = 12;
    v40 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v24);
    v41 = (uint64_t *)((char *)v103 + v102[16]);
    *v41 = v40;
    v41[1] = v42;
    LOBYTE(v105) = 13;
    v43 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v24);
    v44 = (uint64_t *)((char *)v103 + v102[17]);
    *v44 = v43;
    v44[1] = v45;
    LOBYTE(v105) = 14;
    v46 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v24);
    v47 = (uint64_t *)((char *)v103 + v102[18]);
    *v47 = v46;
    v47[1] = v48;
    LOBYTE(v105) = 15;
    v49 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v24);
    v50 = (char *)v103 + v102[19];
    *(_QWORD *)v50 = v49;
    v50[8] = 0;
    type metadata accessor for CGPoint(0);
    v52 = v51;
    LOBYTE(v104) = 16;
    v53 = sub_1000086D4(&qword_1000563D8, (uint64_t (*)(uint64_t))type metadata accessor for CGPoint, (uint64_t)&protocol conformance descriptor for CGPoint);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v52, &v104, v24, v52, v53);
    v54 = (char *)v103 + v102[20];
    *(_OWORD *)v54 = v105;
    v54[16] = 0;
    LOBYTE(v104) = 17;
    v96 = (id)sub_1000138E4();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v104, v24, &type metadata for Data, v96);
    v55 = v105;
    v56 = objc_allocWithZone((Class)UIImage);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v58 = objc_msgSend(v56, "initWithData:", isa);
    sub_1000139B0(v55, *((unint64_t *)&v55 + 1));

    LOBYTE(v104) = 18;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v104, v34, &type metadata for Data, v96);
    v59 = v105;
    v60 = objc_allocWithZone((Class)UIImage);
    v61 = Data._bridgeToObjectiveC()().super.isa;
    v62 = objc_msgSend(v60, "initWithData:", v61);
    sub_1000139B0(v59, *((unint64_t *)&v59 + 1));

    v63 = (char *)v103 + v102[21];
    *(_QWORD *)v63 = v58;
    *((_QWORD *)v63 + 1) = v62;
    v63[16] = 1;
    LOBYTE(v105) = 19;
    v95 = v62;
    v94 = v58;
    v64 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v34);
    *((_BYTE *)v103 + v102[22]) = v64 & 1;
    LOBYTE(v105) = 20;
    v65 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v34);
    *((_BYTE *)v103 + v102[23]) = v65 & 1;
    LOBYTE(v104) = 21;
    v66 = sub_100013928();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for CGFloat, &v104, v34, &type metadata for CGFloat, v66);
    *(uint64_t *)((char *)v103 + v102[24]) = v105;
    LOBYTE(v104) = 22;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v104, v34, &type metadata for Data, v96);
    v67 = v105;
    v68 = objc_allocWithZone((Class)UIImage);
    v69 = Data._bridgeToObjectiveC()().super.isa;
    v70 = objc_msgSend(v68, "initWithData:", v69);
    sub_1000139B0(v67, *((unint64_t *)&v67 + 1));

    LOBYTE(v104) = 23;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v104, v34, &type metadata for Data, v96);
    v71 = v105;
    v72 = objc_allocWithZone((Class)UIImage);
    v73 = Data._bridgeToObjectiveC()().super.isa;
    v74 = objc_msgSend(v72, "initWithData:", v73);
    sub_1000139B0(v71, *((unint64_t *)&v71 + 1));

    v75 = (char *)v103 + v102[25];
    *(_QWORD *)v75 = v70;
    *((_QWORD *)v75 + 1) = v74;
    v75[16] = 1;
    LOBYTE(v105) = 24;
    v96 = v74;
    v76 = v70;
    v77 = KeyedDecodingContainer.decode(_:forKey:)(&v105, v34);
    v78 = (uint64_t)v103;
    *((_BYTE *)v103 + v102[26]) = v77 & 1;
    *(_QWORD *)&v105 = v78;
    v79 = sub_100004A10(&qword_1000563B0);
    v80 = sub_1000137BC();
    v81 = _Pointer.debugDescription.getter(v79, v80);
    v83 = v82;
    v84 = sub_100008B1C(9uLL, v81, v82);
    v86 = v85;
    *(_QWORD *)&v104 = 7876668;
    *((_QWORD *)&v104 + 1) = 0xE300000000000000;
    *(_QWORD *)&v105 = v84;
    *((_QWORD *)&v105 + 1) = v87;
    v106 = v88;
    v107 = v85;
    v89 = sub_100008BC4();
    String.append<A>(contentsOf:)(&v105, &type metadata for Substring, v89);
    swift_bridgeObjectRelease(v86);
    v90 = *((_QWORD *)&v104 + 1);
    v105 = v104;
    swift_bridgeObjectRetain(*((_QWORD *)&v104 + 1));
    v91._countAndFlagsBits = 15987;
    v91._object = (void *)0xE200000000000000;
    String.append(_:)(v91);

    swift_bridgeObjectRelease(v83);
    swift_bridgeObjectRelease(v90);
    v92 = v105;

    (*(void (**)(char *, uint64_t))(v9 + 8))(v35, v34);
    v93 = *((_QWORD *)v100 + 1);
    *(_OWORD *)v100 = v92;
    swift_bridgeObjectRelease(v93);
    sub_10001396C(v78, v97);
    sub_100008714(v98);
    sub_10000BD68(v78, type metadata accessor for FriendModel);
  }
}

uint64_t sub_100012408(_QWORD *a1)
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
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 *v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  void *v50;
  uint64_t v51;
  UIImage *v52;
  void (*v53)(char *, uint64_t);
  NSData *v54;
  NSData *v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  void *v61;
  UIImage *v62;
  NSData *v63;
  NSData *v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  int v73;
  void *v74;
  uint64_t v75;
  UIImage *v76;
  void (*v77)(char *, uint64_t);
  NSData *v78;
  NSData *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  int v84;
  void *v85;
  void *v86;
  char *v87;
  UIImage *v88;
  NSData *v89;
  NSData *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  void (*v97)(char *, _QWORD, uint64_t);
  void *v98;
  void *v99;
  uint64_t v100;
  int *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  __int128 v105;
  char v106;
  char v107;

  v2 = type metadata accessor for ColorScheme(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100004A10(&qword_1000563F0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[3];
  v11 = a1[4];
  sub_100013808(a1, v10);
  v12 = sub_10001382C();
  v13 = v10;
  v14 = v6;
  v15 = v104;
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for FriendModel.CodingKeys, &type metadata for FriendModel.CodingKeys, v12, v13, v11);
  v16 = *v15;
  v17 = v15[1];
  LOBYTE(v105) = 0;
  v18 = v103;
  KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v105, v14);
  if (v18)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v14);
  v103 = v3;
  v19 = v7;
  v20 = v15[2];
  v21 = v15[3];
  LOBYTE(v105) = 1;
  KeyedEncodingContainer.encode(_:forKey:)(v20, v21, &v105, v14);
  v23 = v15[4];
  v24 = v15[5];
  LOBYTE(v105) = 2;
  KeyedEncodingContainer.encode(_:forKey:)(v23, v24, &v105, v14);
  v25 = v14;
  v26 = *((unsigned __int8 *)v15 + 48);
  LOBYTE(v105) = 3;
  KeyedEncodingContainer.encode(_:forKey:)(v26, &v105, v14);
  v27 = *((unsigned __int8 *)v15 + 49);
  LOBYTE(v105) = 4;
  KeyedEncodingContainer.encode(_:forKey:)(v27, &v105, v14);
  v28 = *((unsigned __int8 *)v15 + 50);
  LOBYTE(v105) = 5;
  KeyedEncodingContainer.encode(_:forKey:)(v28, &v105, v14);
  v29 = *((unsigned __int8 *)v15 + 51);
  LOBYTE(v105) = 6;
  KeyedEncodingContainer.encode(_:forKey:)(v29, &v105, v14);
  v30 = *((unsigned __int8 *)v15 + 52);
  LOBYTE(v105) = 7;
  KeyedEncodingContainer.encode(_:forKey:)(v30, &v105, v14);
  v31 = *((unsigned __int8 *)v15 + 53);
  LOBYTE(v105) = 8;
  KeyedEncodingContainer.encode(_:forKey:)(v31, &v105, v14);
  v32 = type metadata accessor for FriendModel(0);
  v33 = (uint64_t)v15 + *(int *)(v32 + 52);
  v101 = (int *)v32;
  v102 = v33;
  LOBYTE(v105) = 9;
  v34 = sub_100004A10(&qword_1000562A8);
  v35 = sub_1000139F4();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v102, &v105, v14, v34, v35);
  v105 = *(_OWORD *)((char *)v15 + v101[14]);
  v107 = 10;
  v36 = sub_100004A10(&qword_100056408);
  v37 = sub_100013A70(&qword_100056410, &qword_100056408);
  v102 = v25;
  v38 = v25;
  v39 = v9;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v38, v36, v37);
  v40 = *((unsigned __int8 *)v104 + v101[15]);
  LOBYTE(v105) = 11;
  KeyedEncodingContainer.encode(_:forKey:)(v40, &v105, v102);
  v105 = *(_OWORD *)((char *)v104 + v101[16]);
  v107 = 12;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v36, v37);
  v105 = *(_OWORD *)((char *)v104 + v101[17]);
  v107 = 13;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v36, v37);
  v105 = *(_OWORD *)((char *)v104 + v101[18]);
  v107 = 14;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v36, v37);
  v41 = (uint64_t *)((char *)v104 + v101[19]);
  v42 = *v41;
  LOBYTE(v41) = *((_BYTE *)v41 + 8);
  *(_QWORD *)&v105 = v42;
  BYTE8(v105) = (_BYTE)v41;
  v107 = 15;
  v43 = sub_100004A10(&qword_100056418);
  v44 = sub_100013A70(&qword_100056420, &qword_100056418);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v43, v44);
  v45 = (__int128 *)((char *)v104 + v101[20]);
  v46 = *((_BYTE *)v45 + 16);
  v105 = *v45;
  v106 = v46;
  v107 = 16;
  v47 = sub_100004A10(&qword_100056428);
  v48 = sub_100013AC4();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v47, v48);
  v100 = (uint64_t)v104 + v101[21];
  v49 = *(unsigned __int8 *)(v100 + 16);
  if (v49 != 255)
  {
    v50 = *(void **)(v100 + 8);
    v98 = *(void **)v100;
    LODWORD(v99) = v49 & 1;
    v51 = v103;
    v97 = *(void (**)(char *, _QWORD, uint64_t))(v103 + 104);
    v97(v5, enum case for ColorScheme.light(_:), v2);
    v52 = (UIImage *)sub_10000C08C((uint64_t)v5, v98, v50, (char)v99);
    v53 = *(void (**)(char *, uint64_t))(v51 + 8);
    v53(v5, v2);
    if (v52)
    {
      v54 = UIImagePNGRepresentation(v52);
      if (v54)
      {
        v55 = v54;
        v99 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v57 = v56;

      }
      else
      {
        v99 = 0;
        v57 = 0xF000000000000000;
      }
      *(_QWORD *)&v105 = v99;
      *((_QWORD *)&v105 + 1) = v57;
      v107 = 17;
      v58 = sub_100004A10(&qword_100056448);
      v59 = sub_100013B84();
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v58, v59);
      sub_100013C2C((uint64_t)v99, v57);

    }
    v60 = *(unsigned __int8 *)(v100 + 16);
    if (v60 != 255)
    {
      v61 = *(void **)(v100 + 8);
      v99 = *(void **)v100;
      LODWORD(v100) = v60 & 1;
      v97(v5, enum case for ColorScheme.dark(_:), v2);
      v62 = (UIImage *)sub_10000C08C((uint64_t)v5, v99, v61, v100);
      v53(v5, v2);
      if (v62)
      {
        v63 = UIImagePNGRepresentation(v62);
        if (v63)
        {
          v64 = v63;
          v65 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v67 = v66;

        }
        else
        {
          v65 = 0;
          v67 = 0xF000000000000000;
        }
        *(_QWORD *)&v105 = v65;
        *((_QWORD *)&v105 + 1) = v67;
        v107 = 18;
        v68 = sub_100004A10(&qword_100056448);
        v69 = sub_100013B84();
        KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v68, v69);
        sub_100013C2C(v65, v67);

      }
    }
  }
  v70 = *((unsigned __int8 *)v104 + v101[22]);
  LOBYTE(v105) = 19;
  KeyedEncodingContainer.encode(_:forKey:)(v70, &v105, v102);
  v71 = *((unsigned __int8 *)v104 + v101[23]);
  LOBYTE(v105) = 20;
  KeyedEncodingContainer.encode(_:forKey:)(v71, &v105, v102);
  *(_QWORD *)&v105 = *(uint64_t *)((char *)v104 + v101[24]);
  v107 = 21;
  v72 = sub_100013B40();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, &type metadata for CGFloat, v72);
  v100 = (uint64_t)v104 + v101[25];
  v73 = *(unsigned __int8 *)(v100 + 16);
  if (v73 != 255)
  {
    v74 = *(void **)(v100 + 8);
    v98 = *(void **)v100;
    LODWORD(v99) = v73 & 1;
    v75 = v103;
    v97 = *(void (**)(char *, _QWORD, uint64_t))(v103 + 104);
    v97(v5, enum case for ColorScheme.light(_:), v2);
    v76 = (UIImage *)sub_10000C08C((uint64_t)v5, v98, v74, (char)v99);
    v77 = *(void (**)(char *, uint64_t))(v75 + 8);
    v77(v5, v2);
    if (v76)
    {
      v78 = UIImagePNGRepresentation(v76);
      if (v78)
      {
        v79 = v78;
        v103 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v81 = v80;

      }
      else
      {
        v103 = 0;
        v81 = 0xF000000000000000;
      }
      *(_QWORD *)&v105 = v103;
      *((_QWORD *)&v105 + 1) = v81;
      v107 = 22;
      v82 = sub_100004A10(&qword_100056448);
      v83 = sub_100013B84();
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v82, v83);
      sub_100013C2C(v103, v81);

    }
    v84 = *(unsigned __int8 *)(v100 + 16);
    if (v84 != 255)
    {
      v86 = *(void **)v100;
      v85 = *(void **)(v100 + 8);
      LODWORD(v103) = v84 & 1;
      v87 = v5;
      v97(v5, enum case for ColorScheme.dark(_:), v2);
      v88 = (UIImage *)sub_10000C08C((uint64_t)v5, v86, v85, v103);
      v77(v87, v2);
      if (v88)
      {
        v89 = UIImagePNGRepresentation(v88);
        if (v89)
        {
          v90 = v89;
          v91 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v93 = v92;

        }
        else
        {
          v91 = 0;
          v93 = 0xF000000000000000;
        }
        *(_QWORD *)&v105 = v91;
        *((_QWORD *)&v105 + 1) = v93;
        v107 = 23;
        v94 = sub_100004A10(&qword_100056448);
        v95 = sub_100013B84();
        KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v94, v95);
        sub_100013C2C(v91, v93);

      }
    }
  }
  v96 = *((unsigned __int8 *)v104 + v101[26]);
  LOBYTE(v105) = 24;
  KeyedEncodingContainer.encode(_:forKey:)(v96, &v105, v102);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v39, v102);
}

uint64_t sub_100012E9C()
{
  uint64_t *v0;
  Swift::String v1;
  int *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  void *v14;
  Swift::String v15;
  Swift::String v16;
  uint64_t v17;
  void *v18;
  Swift::String v19;
  Swift::String v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  Swift::String v31;
  Swift::String v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  Swift::String v37;
  Swift::String v38;

  _StringGuts.grow(_:)(88);
  v1._countAndFlagsBits = 0x6F4D646E65697246;
  v1._object = (void *)0xEB000000006C6564;
  String.append(_:)(v1);
  v2 = (int *)type metadata accessor for FriendModel(0);
  v3 = (uint64_t *)((char *)v0 + v2[30]);
  v4 = v3[1];
  if (v4)
    v5 = *v3;
  else
    v5 = 0;
  if (v4)
    v6 = (void *)v3[1];
  else
    v6 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain(v4);
  v7._countAndFlagsBits = v5;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v6);
  v8._countAndFlagsBits = 8250;
  v8._object = (void *)0xE200000000000000;
  String.append(_:)(v8);
  v9 = *v0;
  v10 = (void *)v0[1];
  swift_bridgeObjectRetain(v10);
  v11._countAndFlagsBits = v9;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v10);
  v12._countAndFlagsBits = 2236460;
  v12._object = (void *)0xE300000000000000;
  String.append(_:)(v12);
  v13 = v0[2];
  v14 = (void *)v0[3];
  swift_bridgeObjectRetain(v14);
  v15._countAndFlagsBits = v13;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v14);
  v16._countAndFlagsBits = 2108450;
  v16._object = (void *)0xE300000000000000;
  String.append(_:)(v16);
  v17 = v0[4];
  v18 = (void *)v0[5];
  swift_bridgeObjectRetain(v18);
  v19._countAndFlagsBits = v17;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v18);
  v20._countAndFlagsBits = 0xD000000000000012;
  v20._object = (void *)0x8000000100041B00;
  String.append(_:)(v20);
  v21 = (uint64_t *)((char *)v0 + v2[14]);
  v22 = v21[1];
  if (v22)
    v23 = *v21;
  else
    v23 = 0;
  if (v22)
    v24 = (void *)v21[1];
  else
    v24 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain(v22);
  v25._countAndFlagsBits = v23;
  v25._object = v24;
  String.append(_:)(v25);
  swift_bridgeObjectRelease(v24);
  v26._object = (void *)0x8000000100041B20;
  v26._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v26);
  v27 = (uint64_t *)((char *)v0 + v2[16]);
  v28 = v27[1];
  if (v28)
    v29 = *v27;
  else
    v29 = 0;
  if (v28)
    v30 = (void *)v27[1];
  else
    v30 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain(v28);
  v31._countAndFlagsBits = v29;
  v31._object = v30;
  String.append(_:)(v31);
  swift_bridgeObjectRelease(v30);
  v32._countAndFlagsBits = 0xD000000000000013;
  v32._object = (void *)0x8000000100041B40;
  String.append(_:)(v32);
  v33 = (uint64_t *)((char *)v0 + v2[17]);
  v34 = v33[1];
  if (v34)
    v35 = *v33;
  else
    v35 = 0;
  if (v34)
    v36 = (void *)v33[1];
  else
    v36 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain(v34);
  v37._countAndFlagsBits = v35;
  v37._object = v36;
  String.append(_:)(v37);
  swift_bridgeObjectRelease(v36);
  v38._countAndFlagsBits = 34;
  v38._object = (void *)0xE100000000000000;
  String.append(_:)(v38);
  return 0;
}

uint64_t sub_10001310C()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 49) != 1)
    return URL.init(string:)(0xD000000000000018, 0x8000000100041A70);
  String.append(_:)(*(Swift::String *)v0);
  URL.init(string:)(0xD000000000000010, 0x8000000100041A90);
  return swift_bridgeObjectRelease(0x8000000100041A90);
}

uint64_t sub_1000131A0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  v5 = a1[1];
  v6 = a2[1];
  if (v4 == *a2 && v5 == v6)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v6, 0);
}

void sub_1000131D0(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000116CC(a1, a2);
}

uint64_t sub_1000131E4(_QWORD *a1)
{
  return sub_100012408(a1);
}

uint64_t sub_1000131F8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t sub_100013224()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_10001322C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t sub_100013234()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t sub_10001323C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 51);
}

uint64_t sub_100013244()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 52);
}

uint64_t sub_10001324C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 53);
}

uint64_t sub_100013254(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 56));
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_100013288(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 60));
}

uint64_t sub_100013294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100008CE0(v2 + *(int *)(a1 + 52), a2, &qword_1000562A8);
}

uint64_t sub_1000132BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 64));
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_1000132F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 68));
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_100013324(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 72));
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_100013358(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 76));
}

uint64_t sub_10001336C(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 80));
}

id sub_100013380(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = v1 + *(int *)(a1 + 84);
  v3 = *(id *)v2;
  sub_100013C54(*(id *)v2, *(void **)(v2 + 8), *(_BYTE *)(v2 + 16));
  return v3;
}

uint64_t sub_1000133CC(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 88));
}

uint64_t sub_1000133D8(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 92));
}

double sub_1000133E4(uint64_t a1)
{
  uint64_t v1;

  return *(double *)(v1 + *(int *)(a1 + 96));
}

id sub_1000133F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = v1 + *(int *)(a1 + 100);
  v3 = *(id *)v2;
  sub_100013C54(*(id *)v2, *(void **)(v2 + 8), *(_BYTE *)(v2 + 16));
  return v3;
}

uint64_t sub_10001343C(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 104));
}

uint64_t sub_100013448(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 112));
  v3 = *v2;
  sub_100013C40(*v2, v2[1], v2[2]);
  return v3;
}

uint64_t sub_100013494(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *(int *)(a1 + 116));
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_1000134CC(uint64_t a1)
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

uint64_t sub_10001356C(char a1, char a2, char a3, char a4, char a5, char a6)
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t countAndFlagsBits;
  unint64_t v13;

  if ((a1 & 1) != 0)
  {
    if ((a2 & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x656E616C70726941;
      v8 = 0xEE006E4F65646F4DLL;
    }
    else if ((a3 & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x6576726553796E41;
      v8 = 0xEE00726F72724572;
    }
    else if ((a4 & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x74754F64656D6954;
      v8 = 0xED0000726F727245;
    }
    else if ((a5 & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x65526E6F73726550;
      v8 = 0xED00006465766F6DLL;
    }
    else
    {
      if ((a6 & 1) == 0)
        return 0;
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x646E656972466F4ELL;
      v8 = 0xE900000000000073;
    }
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v13 = 0xE000000000000000;
    v7 = 0x4C746F4E72657355;
    v8 = 0xEF6E49646567676FLL;
  }
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v10 = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v7, (Swift::String_optional)0, (NSBundle)v6, v9, *(Swift::String *)(&v13 - 1))._countAndFlagsBits;

  return countAndFlagsBits;
}

unint64_t sub_1000137BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000563B8;
  if (!qword_1000563B8)
  {
    v1 = sub_100004A50(&qword_1000563B0);
    result = swift_getWitnessTable(&protocol conformance descriptor for UnsafePointer<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000563B8);
  }
  return result;
}

_QWORD *sub_100013808(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10001382C()
{
  unint64_t result;

  result = qword_1000563C8;
  if (!qword_1000563C8)
  {
    result = swift_getWitnessTable(&unk_100042F7C, &type metadata for FriendModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000563C8);
  }
  return result;
}

uint64_t sub_100013870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRelease(a3);
  return result;
}

void sub_100013884(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 255)
    sub_100008950(a1, a2, a3 & 1);
}

uint64_t sub_10001389C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004A10(&qword_1000562A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000138E4()
{
  unint64_t result;

  result = qword_1000563E0;
  if (!qword_1000563E0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1000563E0);
  }
  return result;
}

unint64_t sub_100013928()
{
  unint64_t result;

  result = qword_1000563E8;
  if (!qword_1000563E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_1000563E8);
  }
  return result;
}

uint64_t sub_10001396C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FriendModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000139B0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_1000139F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000563F8;
  if (!qword_1000563F8)
  {
    v1 = sub_100004A50(&qword_1000562A8);
    sub_1000086D4(&qword_100056400, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_1000563F8);
  }
  return result;
}

uint64_t sub_100013A70(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100004A50(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013AC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056430;
  if (!qword_100056430)
  {
    v1 = sub_100004A50(&qword_100056428);
    sub_1000086D4(&qword_100056438, (uint64_t (*)(uint64_t))type metadata accessor for CGPoint, (uint64_t)&protocol conformance descriptor for CGPoint);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100056430);
  }
  return result;
}

unint64_t sub_100013B40()
{
  unint64_t result;

  result = qword_100056440;
  if (!qword_100056440)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100056440);
  }
  return result;
}

unint64_t sub_100013B84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056450;
  if (!qword_100056450)
  {
    v1 = sub_100004A50(&qword_100056448);
    sub_100013BE8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100056450);
  }
  return result;
}

unint64_t sub_100013BE8()
{
  unint64_t result;

  result = qword_100056458;
  if (!qword_100056458)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100056458);
  }
  return result;
}

uint64_t sub_100013C2C(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1000139B0(result, a2);
  return result;
}

uint64_t sub_100013C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRetain(a3);
  return result;
}

id sub_100013C54(id result, void *a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_10000BEAC(result, a2, a3 & 1);
  return result;
}

uint64_t sub_100013C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ContactsUtilities(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100013CB8()
{
  unint64_t result;

  result = qword_100056488;
  if (!qword_100056488)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100056488);
  }
  return result;
}

uint64_t sub_100013CFC(uint64_t result, int a2, uint64_t a3, uint64_t a4)
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

_BYTE *initializeBufferWithCopyOfBuffer for FriendModel.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FriendModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE8)
    goto LABEL_17;
  if (a2 + 24 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 24) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 24;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 24;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 24;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x19;
  v8 = v6 - 25;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 24 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 24) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE7)
    return ((uint64_t (*)(void))((char *)&loc_100013E3C + 4 * byte_100042CEE[v4]))();
  *a1 = a2 + 24;
  return ((uint64_t (*)(void))((char *)sub_100013E70 + 4 * byte_100042CE9[v4]))();
}

uint64_t sub_100013E70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013E78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100013E80);
  return result;
}

uint64_t sub_100013E8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100013E94);
  *(_BYTE *)result = a2 + 24;
  return result;
}

uint64_t sub_100013E98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013EA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013EAC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100013EB4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FriendModel.CodingKeys()
{
  return &type metadata for FriendModel.CodingKeys;
}

unint64_t sub_100013ED0()
{
  unint64_t result;

  result = qword_100056490;
  if (!qword_100056490)
  {
    result = swift_getWitnessTable(&unk_100042F54, &type metadata for FriendModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100056490);
  }
  return result;
}

unint64_t sub_100013F18()
{
  unint64_t result;

  result = qword_100056498;
  if (!qword_100056498)
  {
    result = swift_getWitnessTable(&unk_100042E8C, &type metadata for FriendModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100056498);
  }
  return result;
}

unint64_t sub_100013F60()
{
  unint64_t result;

  result = qword_1000564A0;
  if (!qword_1000564A0)
  {
    result = swift_getWitnessTable(&unk_100042EB4, &type metadata for FriendModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000564A0);
  }
  return result;
}

uint64_t sub_100013FA4(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_100051610, a1, a2, &unk_100055B00);
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x19)
    return 25;
  else
    return v3;
}

_QWORD *sub_100013FF4(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4, a2, v8);
      v9 = v4;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *v4 = *a2;
      swift_retain(v13);
      v9 = v4;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (_QWORD *)((char *)v4 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[7];
    *(_OWORD *)((char *)v4 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
    v24 = *(void **)((char *)a2 + v23);
    *(_QWORD *)((char *)v4 + v23) = v24;
    v25 = a3[9];
    *((_BYTE *)v4 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    *((_BYTE *)v4 + v25) = *((_BYTE *)a2 + v25);
    v26 = a3[10];
    v27 = (char *)v4 + v26;
    v28 = (char *)a2 + v26;
    *(_OWORD *)v27 = *(_OWORD *)v28;
    v29 = *((_QWORD *)v28 + 3);
    *((_QWORD *)v27 + 2) = *((_QWORD *)v28 + 2);
    *((_QWORD *)v27 + 3) = v29;
    v30 = *((_QWORD *)v28 + 4);
    v31 = *((_QWORD *)v28 + 5);
    *((_QWORD *)v27 + 4) = v30;
    *((_QWORD *)v27 + 5) = v31;
    *((_OWORD *)v27 + 3) = *((_OWORD *)v28 + 3);
    v32 = *((_QWORD *)v28 + 9);
    *((_QWORD *)v27 + 8) = *((_QWORD *)v28 + 8);
    *((_QWORD *)v27 + 9) = v32;
    *((_OWORD *)v27 + 5) = *((_OWORD *)v28 + 5);
    v33 = *((_QWORD *)v28 + 13);
    *((_QWORD *)v27 + 12) = *((_QWORD *)v28 + 12);
    *((_QWORD *)v27 + 13) = v33;
    *((_OWORD *)v27 + 7) = *((_OWORD *)v28 + 7);
    v34 = *((_QWORD *)v28 + 17);
    *((_QWORD *)v27 + 16) = *((_QWORD *)v28 + 16);
    *((_QWORD *)v27 + 17) = v34;
    v35 = *((_QWORD *)v28 + 18);
    v36 = *((_QWORD *)v28 + 19);
    *((_QWORD *)v27 + 18) = v35;
    *((_QWORD *)v27 + 19) = v36;
    *((_OWORD *)v27 + 10) = *((_OWORD *)v28 + 10);
    v12 = *((_QWORD *)v28 + 23);
    *((_QWORD *)v27 + 22) = *((_QWORD *)v28 + 22);
    *((_QWORD *)v27 + 23) = v12;
    *((_OWORD *)v27 + 12) = *((_OWORD *)v28 + 12);
    *((_QWORD *)v27 + 26) = *((_QWORD *)v28 + 26);
    v37 = v24;
    swift_retain(v29);
    swift_retain(v30);
    swift_retain(v31);
    swift_retain(v32);
    swift_retain(v33);
    swift_retain(v34);
    swift_retain(v35);
    swift_retain(v36);
  }
  swift_retain(v12);
  return v4;
}

uint64_t sub_100014240(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }

  v9 = (_QWORD *)((char *)a1 + a2[10]);
  swift_release(v9[3]);
  swift_release(v9[4]);
  swift_release(v9[5]);
  swift_release(v9[9]);
  swift_release(v9[13]);
  swift_release(v9[17]);
  swift_release(v9[18]);
  swift_release(v9[19]);
  return swift_release(v9[23]);
}

_QWORD *sub_100014358(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  v22 = *(void **)((char *)a2 + v21);
  *(_QWORD *)((char *)a1 + v21) = v22;
  v23 = a3[9];
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  *((_BYTE *)a1 + v23) = *((_BYTE *)a2 + v23);
  v24 = a3[10];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  *(_OWORD *)v25 = *(_OWORD *)v26;
  v27 = *((_QWORD *)v26 + 3);
  *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
  *((_QWORD *)v25 + 3) = v27;
  v28 = *((_QWORD *)v26 + 4);
  v29 = *((_QWORD *)v26 + 5);
  *((_QWORD *)v25 + 4) = v28;
  *((_QWORD *)v25 + 5) = v29;
  *((_OWORD *)v25 + 3) = *((_OWORD *)v26 + 3);
  v30 = *((_QWORD *)v26 + 9);
  *((_QWORD *)v25 + 8) = *((_QWORD *)v26 + 8);
  *((_QWORD *)v25 + 9) = v30;
  *((_OWORD *)v25 + 5) = *((_OWORD *)v26 + 5);
  v31 = *((_QWORD *)v26 + 13);
  *((_QWORD *)v25 + 12) = *((_QWORD *)v26 + 12);
  *((_QWORD *)v25 + 13) = v31;
  *((_OWORD *)v25 + 7) = *((_OWORD *)v26 + 7);
  v32 = *((_QWORD *)v26 + 17);
  *((_QWORD *)v25 + 16) = *((_QWORD *)v26 + 16);
  *((_QWORD *)v25 + 17) = v32;
  v33 = *((_QWORD *)v26 + 18);
  v34 = *((_QWORD *)v26 + 19);
  *((_QWORD *)v25 + 18) = v33;
  *((_QWORD *)v25 + 19) = v34;
  *((_OWORD *)v25 + 10) = *((_OWORD *)v26 + 10);
  v35 = *((_QWORD *)v26 + 23);
  *((_QWORD *)v25 + 22) = *((_QWORD *)v26 + 22);
  *((_QWORD *)v25 + 23) = v35;
  *((_OWORD *)v25 + 12) = *((_OWORD *)v26 + 12);
  *((_QWORD *)v25 + 26) = *((_QWORD *)v26 + 26);
  v36 = v22;
  swift_retain(v27);
  swift_retain(v28);
  swift_retain(v29);
  swift_retain(v30);
  swift_retain(v31);
  swift_retain(v32);
  swift_retain(v33);
  swift_retain(v34);
  swift_retain(v35);
  return a1;
}

_QWORD *sub_10001457C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
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

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    sub_100008C08((uint64_t)a1 + v12, &qword_100055E30);
    v15 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = a3[6];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  v24 = a3[7];
  v25 = *(void **)((char *)a1 + v24);
  v26 = *(void **)((char *)a2 + v24);
  *(_QWORD *)((char *)a1 + v24) = v26;
  v27 = v26;

  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  v28 = a3[10];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *(_QWORD *)((char *)a2 + v28);
  v29[1] = *(_QWORD *)((char *)a2 + v28 + 8);
  v29[2] = *(_QWORD *)((char *)a2 + v28 + 16);
  v31 = *(_QWORD *)((char *)a2 + v28 + 24);
  v32 = *(_QWORD *)((char *)a1 + v28 + 24);
  v29[3] = v31;
  swift_retain(v31);
  swift_release(v32);
  v33 = v30[4];
  v34 = v29[4];
  v29[4] = v33;
  swift_retain(v33);
  swift_release(v34);
  v35 = v30[5];
  v36 = v29[5];
  v29[5] = v35;
  swift_retain(v35);
  swift_release(v36);
  v29[6] = v30[6];
  v29[7] = v30[7];
  v29[8] = v30[8];
  v37 = v30[9];
  v38 = v29[9];
  v29[9] = v37;
  swift_retain(v37);
  swift_release(v38);
  v29[10] = v30[10];
  v29[11] = v30[11];
  v29[12] = v30[12];
  v39 = v30[13];
  v40 = v29[13];
  v29[13] = v39;
  swift_retain(v39);
  swift_release(v40);
  v29[14] = v30[14];
  v29[15] = v30[15];
  v29[16] = v30[16];
  v41 = v30[17];
  v42 = v29[17];
  v29[17] = v41;
  swift_retain(v41);
  swift_release(v42);
  v43 = v30[18];
  v44 = v29[18];
  v29[18] = v43;
  swift_retain(v43);
  swift_release(v44);
  v45 = v30[19];
  v46 = v29[19];
  v29[19] = v45;
  swift_retain(v45);
  swift_release(v46);
  v29[20] = v30[20];
  v29[21] = v30[21];
  v29[22] = v30[22];
  v47 = v30[23];
  v48 = v29[23];
  v29[23] = v47;
  swift_retain(v47);
  swift_release(v48);
  v29[24] = v30[24];
  v29[25] = v30[25];
  v29[26] = v30[26];
  return a1;
}

char *sub_100014888(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];
  v14 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v14] = a2[v14];
  v15 = a3[10];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = *((_OWORD *)v17 + 11);
  *((_OWORD *)v16 + 10) = *((_OWORD *)v17 + 10);
  *((_OWORD *)v16 + 11) = v18;
  *((_OWORD *)v16 + 12) = *((_OWORD *)v17 + 12);
  *((_QWORD *)v16 + 26) = *((_QWORD *)v17 + 26);
  v19 = *((_OWORD *)v17 + 7);
  *((_OWORD *)v16 + 6) = *((_OWORD *)v17 + 6);
  *((_OWORD *)v16 + 7) = v19;
  v20 = *((_OWORD *)v17 + 9);
  *((_OWORD *)v16 + 8) = *((_OWORD *)v17 + 8);
  *((_OWORD *)v16 + 9) = v20;
  v21 = *((_OWORD *)v17 + 3);
  *((_OWORD *)v16 + 2) = *((_OWORD *)v17 + 2);
  *((_OWORD *)v16 + 3) = v21;
  v22 = *((_OWORD *)v17 + 5);
  *((_OWORD *)v16 + 4) = *((_OWORD *)v17 + 4);
  *((_OWORD *)v16 + 5) = v22;
  v23 = *((_OWORD *)v17 + 1);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v23;
  return a1;
}

char *sub_100014A18(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_100008C08((uint64_t)&a1[v8], &qword_100055E30);
    v11 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  v15 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v15] = a2[v15];
  v16 = a3[10];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
  v19 = *(_QWORD *)&a1[v16 + 24];
  *((_QWORD *)v17 + 3) = *((_QWORD *)v18 + 3);
  swift_release(v19);
  v20 = *((_QWORD *)v17 + 4);
  *((_QWORD *)v17 + 4) = *((_QWORD *)v18 + 4);
  swift_release(v20);
  v21 = *((_QWORD *)v17 + 5);
  *((_QWORD *)v17 + 5) = *((_QWORD *)v18 + 5);
  swift_release(v21);
  *((_OWORD *)v17 + 3) = *((_OWORD *)v18 + 3);
  *((_QWORD *)v17 + 8) = *((_QWORD *)v18 + 8);
  v22 = *((_QWORD *)v17 + 9);
  *((_QWORD *)v17 + 9) = *((_QWORD *)v18 + 9);
  swift_release(v22);
  *((_OWORD *)v17 + 5) = *((_OWORD *)v18 + 5);
  *((_QWORD *)v17 + 12) = *((_QWORD *)v18 + 12);
  v23 = *((_QWORD *)v17 + 13);
  *((_QWORD *)v17 + 13) = *((_QWORD *)v18 + 13);
  swift_release(v23);
  *((_OWORD *)v17 + 7) = *((_OWORD *)v18 + 7);
  *((_QWORD *)v17 + 16) = *((_QWORD *)v18 + 16);
  v24 = *((_QWORD *)v17 + 17);
  *((_QWORD *)v17 + 17) = *((_QWORD *)v18 + 17);
  swift_release(v24);
  v25 = *((_QWORD *)v17 + 18);
  *((_QWORD *)v17 + 18) = *((_QWORD *)v18 + 18);
  swift_release(v25);
  v26 = *((_QWORD *)v17 + 19);
  *((_QWORD *)v17 + 19) = *((_QWORD *)v18 + 19);
  swift_release(v26);
  *((_OWORD *)v17 + 10) = *((_OWORD *)v18 + 10);
  *((_QWORD *)v17 + 22) = *((_QWORD *)v18 + 22);
  v27 = *((_QWORD *)v17 + 23);
  *((_QWORD *)v17 + 23) = *((_QWORD *)v18 + 23);
  swift_release(v27);
  *((_OWORD *)v17 + 12) = *((_OWORD *)v18 + 12);
  *((_QWORD *)v17 + 26) = *((_QWORD *)v18 + 26);
  return a1;
}

uint64_t sub_100014C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100014C94);
}

uint64_t sub_100014C94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_100004A10(&qword_100055E38);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_100004A10(qword_100055E40);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 40) + 24);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_100014D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014D54);
}

uint64_t sub_100014D54(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_100004A10(&qword_100055E38);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_100004A10(qword_100055E40);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 40) + 24) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for AvatarView(uint64_t a1)
{
  uint64_t result;

  result = qword_100056500;
  if (!qword_100056500)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AvatarView);
  return result;
}

void sub_100014E40(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[7];

  sub_100007950(319, (unint64_t *)&qword_100055EC8, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100007950(319, &qword_100055ED0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = &unk_100043030;
      v6[3] = &unk_100043048;
      v6[4] = &unk_100043060;
      v6[5] = &unk_100043060;
      v6[6] = &unk_100043078;
      swift_initStructMetadata(a1, 256, 7, v6, a1 + 16);
    }
  }
}

uint64_t sub_100014F0C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100044788, 1);
}

uint64_t sub_100014F1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, _QWORD, uint64_t);
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _OWORD *v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  char *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _OWORD v85[3];

  v83 = a2;
  v5 = type metadata accessor for WidgetRenderingMode(0);
  v80 = *(_QWORD *)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v64 - v9;
  v11 = sub_100004A10(&qword_100056650);
  __chkstk_darwin(v11);
  v13 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = type metadata accessor for Image.ResizingMode(0);
  v14 = *(_QWORD *)(v68 - 8);
  __chkstk_darwin(v68);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_100004A10(&qword_100056658);
  v71 = *(_QWORD *)(v72 - 8);
  __chkstk_darwin(v72);
  v70 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_100004A10(&qword_1000566F8);
  __chkstk_darwin(v69);
  v75 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_100004A10(&qword_100056700);
  __chkstk_darwin(v74);
  v20 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_100004A10(&qword_100056708);
  __chkstk_darwin(v73);
  v81 = (uint64_t)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_100004A10(&qword_100056710);
  __chkstk_darwin(v76);
  v82 = (uint64_t)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100004A10(&qword_100056718);
  v84 = *(_QWORD *)(v23 - 8);
  v24 = __chkstk_darwin(v23);
  v79 = (uint64_t)&v64 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v78 = (uint64_t)&v64 - v26;
  v27 = *(int *)(type metadata accessor for AvatarView(0) + 28);
  v77 = a1;
  v28 = *(void **)(a1 + v27);
  if (!v28)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56))(v83, 1, 1, v23);
  v66 = v28;
  v29 = Image.init(uiImage:)();
  v67 = v23;
  v30 = v5;
  v31 = v29;
  v65 = v20;
  v32 = v8;
  v33 = v14;
  v34 = *(void (**)(char *, _QWORD, uint64_t))(v14 + 104);
  v35 = v68;
  v34(v16, enum case for Image.ResizingMode.stretch(_:), v68);
  v36 = 0.0;
  v37 = Image.resizable(capInsets:resizingMode:)(v16, v31, 0.0, 0.0, 0.0, 0.0);
  swift_release(v31);
  v38 = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v35);
  static WidgetAccentedRenderingMode.fullColor.getter(v38);
  v39 = type metadata accessor for WidgetAccentedRenderingMode(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v13, 0, 1, v39);
  v40 = v70;
  Image.widgetAccentedRenderingMode(_:)(v13, v37);
  swift_release(v37);
  sub_100008C08((uint64_t)v13, &qword_100056650);
  v41 = sub_100007A48((uint64_t)v10);
  static WidgetRenderingMode.accented.getter(v41);
  LOBYTE(v35) = static WidgetRenderingMode.== infix(_:_:)(v10, v32);
  v42 = *(void (**)(char *, uint64_t))(v80 + 8);
  v42(v32, v30);
  v42(v10, v30);
  if ((v35 & 1) != 0)
    v36 = 1.0;
  v43 = v71;
  v44 = (uint64_t)v75;
  v45 = v72;
  (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v75, v40, v72);
  *(double *)(v44 + *(int *)(v69 + 36)) = v36;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v40, v45);
  v46 = sub_100007A48((uint64_t)v10);
  static WidgetRenderingMode.accented.getter(v46);
  v47 = static WidgetRenderingMode.== infix(_:_:)(v10, v32);
  v42(v32, v30);
  v42(v10, v30);
  if ((v47 & 1) != 0)
    v48 = 0.9;
  else
    v48 = 1.0;
  v49 = (uint64_t)v65;
  sub_100008CE0(v44, (uint64_t)v65, &qword_1000566F8);
  *(double *)(v49 + *(int *)(v74 + 36)) = v48;
  sub_100008C08(v44, &qword_1000566F8);
  v50 = v81;
  sub_100008CE0(v49, v81, &qword_100056700);
  v51 = v50 + *(int *)(v73 + 36);
  *(_QWORD *)v51 = 0;
  *(_WORD *)(v51 + 8) = 257;
  v52 = sub_100008C08(v49, &qword_100056700);
  v53 = static Alignment.center.getter(v52);
  _FrameLayout.init(width:height:alignment:)(v85, *(_QWORD *)&a3, 0, *(_QWORD *)&a3, 0, v53, v54);
  v55 = v82;
  sub_100008CE0(v50, v82, &qword_100056708);
  v56 = (_OWORD *)(v55 + *(int *)(v76 + 36));
  v57 = v85[1];
  *v56 = v85[0];
  v56[1] = v57;
  v56[2] = v85[2];
  sub_100008C08(v50, &qword_100056708);

  v58 = v79;
  sub_100008CE0(v55, v79, &qword_100056710);
  v59 = v67;
  *(_WORD *)(v58 + *(int *)(v67 + 36)) = 256;
  sub_100008C08(v55, &qword_100056710);
  v60 = v78;
  sub_100017510(v58, v78, &qword_100056718);
  v61 = v60;
  v62 = v83;
  sub_100017510(v61, v83, &qword_100056718);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v84 + 56))(v62, 0, 1, v59);
}

uint64_t sub_1000155B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  int v20;
  char v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = a1;
  v2 = sub_100004A10(&qword_1000565E0);
  __chkstk_darwin(v2);
  v4 = (uint64_t *)((char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_100004A10(&qword_1000565D0);
  __chkstk_darwin(v5);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004A10(&qword_1000565C0);
  __chkstk_darwin(v8);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004A10(&qword_100056560);
  v52 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (int *)type metadata accessor for AvatarView(0);
  v15 = v1 + v14[10];
  v16 = *(double *)(v1 + v14[6] + 8);
  if (*(double *)(v15 + 8) >= *(double *)v15 * v16)
    v17 = *(double *)v15 * v16;
  else
    v17 = *(double *)(v15 + 8);
  v18 = (v17 - (*(double *)(v15 + 16) + v17)) * 0.5;
  v19 = *(_QWORD *)(v15 + 24);
  v20 = *(unsigned __int8 *)(v1 + v14[9]);
  v21 = (v20 == 2) | v20;
  v22 = *(_QWORD *)(v15 + 56);
  v23 = v16 * *(double *)(v15 + 64);
  v24 = *(_QWORD *)(v15 + 48);
  v25 = v16 * *(double *)(v15 + 96);
  v26 = *(_QWORD *)(v15 + 88);
  v50 = *(_QWORD *)(v15 + 80);
  v51 = v26;
  v27 = *(_QWORD *)(v15 + 112);
  v47 = *(double *)(v15 + 128);
  v48 = v27;
  v49 = *(_QWORD *)(v15 + 120);
  *v4 = static Alignment.center.getter(v14);
  v4[1] = v28;
  v29 = sub_100004A10(&qword_100056608);
  sub_100015C04(v21 & 1, v19, (uint64_t)v4 + *(int *)(v29 + 44), v17, v18, v17 - v18);
  sub_100008CE0((uint64_t)v4, (uint64_t)v7, &qword_1000565E0);
  sub_100008C08((uint64_t)v4, &qword_1000565E0);
  v30 = *(_QWORD *)(v15 + 40);
  sub_100008CE0((uint64_t)v7, (uint64_t)v10, &qword_1000565D0);
  v31 = &v10[*(int *)(v8 + 36)];
  *(_QWORD *)v31 = v30;
  *((double *)v31 + 1) = v23;
  *((_QWORD *)v31 + 2) = v24;
  *((_QWORD *)v31 + 3) = v22;
  swift_retain(v30);
  sub_100008C08((uint64_t)v7, &qword_1000565D0);
  v32 = *(_QWORD *)(v15 + 72);
  sub_100008CE0((uint64_t)v10, (uint64_t)v13, &qword_1000565C0);
  v33 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v33 = v32;
  v34 = v50;
  *((double *)v33 + 1) = v25;
  *((_QWORD *)v33 + 2) = v34;
  *((_QWORD *)v33 + 3) = v51;
  swift_retain(v32);
  sub_100008C08((uint64_t)v10, &qword_1000565C0);
  if ((v21 & 1) != 0)
  {
    v35 = v16 * v47;
    v36 = v53;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56))(v53, 1, 1, v11);
    v37 = v36 + *(int *)(sub_100004A10(&qword_1000566E8) + 48);
    v38 = *(_QWORD *)(v15 + 104);
    sub_100008CE0((uint64_t)v13, v37, &qword_100056560);
    v39 = sub_100004A10(&qword_1000566F0);
    v40 = v37 + *(int *)(v39 + 36);
    *(_QWORD *)v40 = v38;
    v41 = v48;
    *(double *)(v40 + 8) = v35;
    *(_QWORD *)(v40 + 16) = v41;
    *(_QWORD *)(v40 + 24) = v49;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v37, 0, 1, v39);
    swift_retain(v38);
  }
  else
  {
    v42 = v53;
    sub_100008CE0((uint64_t)v13, v53, &qword_100056560);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v52 + 56))(v42, 0, 1, v11);
    v43 = v42 + *(int *)(sub_100004A10(&qword_1000566E8) + 48);
    v44 = sub_100004A10(&qword_1000566F0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v43, 1, 1, v44);
  }
  return sub_100008C08((uint64_t)v13, &qword_100056560);
}

uint64_t sub_100015998@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  int v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  v3 = sub_100004A10(&qword_1000565E0);
  __chkstk_darwin(v3);
  v5 = (uint64_t *)((char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_100004A10(&qword_1000565D0);
  __chkstk_darwin(v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004A10(&qword_1000565C0);
  __chkstk_darwin(v9);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for AvatarView(0);
  v13 = v1 + v12[10];
  v14 = *(double *)(v1 + v12[6] + 8);
  if (*(double *)(v13 + 8) >= *(double *)v13 * v14)
    v15 = *(double *)v13 * v14;
  else
    v15 = *(double *)(v13 + 8);
  v16 = (v15 - (*(double *)(v13 + 16) + v15)) * 0.5;
  v17 = *(unsigned __int8 *)(v1 + v12[9]);
  v18 = *(_QWORD *)(v13 + 136);
  v19 = (v17 == 2) | v17;
  v20 = *(_QWORD *)(v13 + 168);
  v21 = v14 * *(double *)(v13 + 176);
  v22 = *(_QWORD *)(v13 + 160);
  v23 = v14 * *(double *)(v13 + 208);
  v24 = *(_QWORD *)(v13 + 192);
  v33 = *(_QWORD *)(v13 + 200);
  *v5 = static Alignment.center.getter(v12);
  v5[1] = v25;
  v26 = sub_100004A10(&qword_100056608);
  sub_100015C04(v19 & 1, v18, (uint64_t)v5 + *(int *)(v26 + 44), v15, v16, v15 - v16);
  sub_100008CE0((uint64_t)v5, (uint64_t)v8, &qword_1000565E0);
  sub_100008C08((uint64_t)v5, &qword_1000565E0);
  v27 = *(_QWORD *)(v13 + 152);
  sub_100008CE0((uint64_t)v8, (uint64_t)v11, &qword_1000565D0);
  v28 = &v11[*(int *)(v9 + 36)];
  *(_QWORD *)v28 = v27;
  *((double *)v28 + 1) = v21;
  *((_QWORD *)v28 + 2) = v22;
  *((_QWORD *)v28 + 3) = v20;
  swift_retain(v27);
  sub_100008C08((uint64_t)v8, &qword_1000565D0);
  v29 = *(_QWORD *)(v13 + 184);
  sub_100008CE0((uint64_t)v11, a1, &qword_1000565C0);
  v30 = a1 + *(int *)(sub_100004A10(&qword_100056560) + 36);
  *(_QWORD *)v30 = v29;
  *(double *)(v30 + 8) = v23;
  *(_QWORD *)(v30 + 16) = v24;
  *(_QWORD *)(v30 + 24) = v33;
  swift_retain(v29);
  return sub_100008C08((uint64_t)v11, &qword_1000565C0);
}

uint64_t sub_100015C04@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
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
  char *v24;
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
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char v40;
  __n128 v41;
  void *v42;
  NSString v43;
  id v44;
  id v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t KeyPath;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t (*v64)(char *, uint64_t, __n128);
  __n128 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _OWORD *v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  char v80;
  void *v81;
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
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  __int128 v97;
  __int128 v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _OWORD *v109;
  __int128 v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _OWORD *v122;
  __int128 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  uint64_t v167;
  __int16 v168;
  uint64_t v169;
  uint64_t v170;
  _QWORD v171[5];
  _OWORD v172[3];
  _OWORD v173[3];

  v160 = a3;
  v161 = sub_100004A10(&qword_100056610);
  __chkstk_darwin(v161);
  v142 = (uint64_t)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v154 = sub_100004A10(&qword_100056618);
  v153 = *(_QWORD *)(v154 - 8);
  __chkstk_darwin(v154);
  v152 = (char *)&v132 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = sub_100004A10(&qword_100056620);
  v13 = __chkstk_darwin(v151);
  v155 = (char *)&v132 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v156 = (uint64_t)&v132 - v15;
  v150 = sub_100004A10(&qword_100056628);
  v149 = *(_QWORD *)(v150 - 8);
  __chkstk_darwin(v150);
  v146 = (char *)&v132 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v147 = sub_100004A10(&qword_100056630);
  v17 = __chkstk_darwin(v147);
  v148 = (char *)&v132 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v163 = (uint64_t)&v132 - v19;
  v145 = sub_100004A10(&qword_100056638);
  v144 = *(_QWORD *)(v145 - 8);
  __chkstk_darwin(v145);
  v21 = (char *)&v132 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v143 = sub_100004A10(&qword_100056640);
  v22 = __chkstk_darwin(v143);
  v24 = (char *)&v132 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v162 = (uint64_t)&v132 - v25;
  v158 = sub_100004A10(&qword_100056648);
  __chkstk_darwin(v158);
  v159 = (uint64_t)&v132 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100004A10(&qword_100056650);
  __chkstk_darwin(v27);
  v137 = (char *)&v132 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for Image.ResizingMode(0);
  v30 = *(_QWORD *)(v29 - 8);
  __chkstk_darwin(v29);
  v32 = (char *)&v132 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = sub_100004A10(&qword_100056658);
  v135 = *(_QWORD *)(v138 - 8);
  __chkstk_darwin(v138);
  v134 = (char *)&v132 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = sub_100004A10(&qword_100056660);
  __chkstk_darwin(v133);
  v140 = (char *)&v132 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = sub_100004A10(&qword_100056668);
  __chkstk_darwin(v136);
  v141 = (uint64_t)&v132 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = sub_100004A10(&qword_100056670);
  v36 = __chkstk_darwin(v157);
  v139 = (uint64_t)&v132 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  v39 = (char *)&v132 - v38;
  if ((a1 & 1) == 0)
    goto LABEL_6;
  v132 = v29;
  v40 = a1;
  sub_1000174CC();
  v41 = swift_retain(a2);
  v42 = (void *)UIColor.init(_:)(v41);
  v43 = String._bridgeToObjectiveC()();
  v44 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v43);

  if (!v44)
  {

    a1 = v40;
    goto LABEL_6;
  }
  v45 = objc_msgSend(v44, "imageWithTintColor:renderingMode:", v42, 2);

  a1 = v40;
  v46 = v132;
  if (!v45)
  {
LABEL_6:
    v80 = a1 & 1;
    v81 = sub_100027D30(a1 & 1);
    StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v171, 0, 0, _swiftEmptyArrayStorage, a5, 10.0, 0.0);
    v82 = v171[0];
    v83 = v171[2];
    v84 = v171[3];
    v85 = v171[4];
    swift_retain(a2);
    v87 = static Alignment.center.getter(v86);
    *(_QWORD *)&v164 = v81;
    *((_QWORD *)&v164 + 1) = v82;
    *(_QWORD *)&v165 = v171[1];
    *((_QWORD *)&v165 + 1) = v83;
    *(_QWORD *)&v166 = v84;
    *((_QWORD *)&v166 + 1) = v85;
    v167 = a2;
    v168 = 256;
    v169 = v87;
    v170 = v88;
    v89 = sub_100004A10(&qword_100056678);
    v90 = sub_100008D24(&qword_100056680, &qword_100056678, (uint64_t)&protocol conformance descriptor for StrokeShapeView<A, B, C>);
    View.widgetAccentable(_:)(1, v89, v90);
    swift_release(a2);
    swift_bridgeObjectRelease(v84);

    v92 = static Alignment.center.getter(v91);
    _FrameLayout.init(width:height:alignment:)(v172, *(_QWORD *)&a6, 0, *(_QWORD *)&a6, 0, v92, v93);
    v94 = v144;
    v95 = v145;
    (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v24, v21, v145);
    v96 = &v24[*(int *)(v143 + 36)];
    v97 = v172[1];
    v98 = v172[2];
    *(_OWORD *)v96 = v172[0];
    *((_OWORD *)v96 + 1) = v97;
    *((_OWORD *)v96 + 2) = v98;
    (*(void (**)(char *, uint64_t))(v94 + 8))(v21, v95);
    sub_100017510((uint64_t)v24, v162, &qword_100056640);
    v99 = sub_100027D30(a1 & 1);
    *(_QWORD *)&v164 = v99;
    *((_QWORD *)&v164 + 1) = a2;
    LOWORD(v165) = 256;
    swift_retain(a2);
    v100 = sub_100004A10(&qword_100056688);
    v101 = sub_100008D24(&qword_100056690, &qword_100056688, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    v102 = v146;
    View.widgetAccentable(_:)(1, v100, v101);
    swift_release(a2);

    v104 = static Alignment.center.getter(v103);
    _FrameLayout.init(width:height:alignment:)(v173, *(_QWORD *)&a6, 0, *(_QWORD *)&a6, 0, v104, v105);
    v106 = v149;
    v107 = (uint64_t)v148;
    v108 = v150;
    (*(void (**)(char *, char *, uint64_t))(v149 + 16))(v148, v102, v150);
    v109 = (_OWORD *)(v107 + *(int *)(v147 + 36));
    v110 = v173[1];
    *v109 = v173[0];
    v109[1] = v110;
    v109[2] = v173[2];
    (*(void (**)(char *, uint64_t))(v106 + 8))(v102, v108);
    v111 = v163;
    sub_100017510(v107, v163, &qword_100056630);
    v112 = sub_100027DF8(v80);
    *(_QWORD *)&v164 = v112;
    *((_QWORD *)&v164 + 1) = a2;
    LOWORD(v165) = 256;
    swift_retain(a2);
    v113 = sub_100004A10(&qword_100056698);
    v114 = sub_100008D24(&qword_1000566A0, &qword_100056698, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    v115 = v152;
    View.widgetAccentable(_:)(1, v113, v114);
    swift_release(a2);

    v117 = static Alignment.center.getter(v116);
    _FrameLayout.init(width:height:alignment:)(&v164, *(_QWORD *)&a6, 0, *(_QWORD *)&a6, 0, v117, v118);
    v119 = v153;
    v120 = (uint64_t)v155;
    v121 = v154;
    (*(void (**)(char *, char *, uint64_t))(v153 + 16))(v155, v115, v154);
    v122 = (_OWORD *)(v120 + *(int *)(v151 + 36));
    v123 = v165;
    *v122 = v164;
    v122[1] = v123;
    v122[2] = v166;
    (*(void (**)(char *, uint64_t))(v119 + 8))(v115, v121);
    v124 = v156;
    sub_100017510(v120, v156, &qword_100056620);
    v125 = v162;
    sub_100008CE0(v162, (uint64_t)v24, &qword_100056640);
    sub_100008CE0(v111, v107, &qword_100056630);
    sub_100008CE0(v124, v120, &qword_100056620);
    v126 = v142;
    sub_100008CE0((uint64_t)v24, v142, &qword_100056640);
    v127 = sub_100004A10(&qword_1000566A8);
    sub_100008CE0(v107, v126 + *(int *)(v127 + 48), &qword_100056630);
    sub_100008CE0(v120, v126 + *(int *)(v127 + 64), &qword_100056620);
    sub_100008C08(v120, &qword_100056620);
    sub_100008C08(v107, &qword_100056630);
    sub_100008C08((uint64_t)v24, &qword_100056640);
    v128 = v159;
    sub_100008CE0(v126, v159, &qword_100056610);
    swift_storeEnumTagMultiPayload(v128, v158, 1);
    v129 = sub_1000173D4(&qword_1000566B0, &qword_100056670, (void (*)(void))sub_1000173B0);
    v130 = sub_100008D24(&qword_1000566D8, &qword_100056610, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    _ConditionalContent<>.init(storage:)(v128, v157, v161, v129, v130);
    sub_100008C08(v126, &qword_100056610);
    sub_100008C08(v124, &qword_100056620);
    sub_100008C08(v163, &qword_100056630);
    v78 = v125;
    v79 = &qword_100056640;
    return sub_100008C08(v78, v79);
  }
  objc_msgSend(v45, "size");
  v48 = v47;
  objc_msgSend(v45, "size");
  v50 = v48 / v49;
  v51 = v45;
  v52 = Image.init(uiImage:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v32, enum case for Image.ResizingMode.stretch(_:), v46);
  v53 = v46;
  v54 = Image.resizable(capInsets:resizingMode:)(v32, v52, 0.0, 0.0, 0.0, 0.0);
  swift_release(v52);
  v55 = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v32, v53);
  v56 = (uint64_t)v137;
  static WidgetAccentedRenderingMode.accented.getter(v55);
  v57 = type metadata accessor for WidgetAccentedRenderingMode(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v56, 0, 1, v57);
  v58 = v134;
  Image.widgetAccentedRenderingMode(_:)(v56, v54);
  swift_release(v54);
  sub_100008C08(v56, &qword_100056650);
  KeyPath = swift_getKeyPath(&unk_1000430E0);
  v60 = v135;
  v61 = (uint64_t)v140;
  v62 = v138;
  (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v140, v58, v138);
  v63 = (uint64_t *)(v61 + *(int *)(v133 + 36));
  *v63 = KeyPath;
  v63[1] = a2;
  v64 = *(uint64_t (**)(char *, uint64_t, __n128))(v60 + 8);
  v65 = swift_retain(a2);
  v66 = v64(v58, v62, v65);
  v67 = static Alignment.center.getter(v66);
  ((void (*)(_QWORD *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))_FrameLayout.init(width:height:alignment:))(&v164, *(_QWORD *)&a4, 0, a4 / v50, 0, v67, v68);
  v69 = v141;
  sub_100008CE0(v61, v141, &qword_100056660);
  v70 = (_OWORD *)(v69 + *(int *)(v136 + 36));
  v71 = v165;
  *v70 = v164;
  v70[1] = v71;
  v70[2] = v166;
  sub_100008C08(v61, &qword_100056660);
  v72 = v139;
  sub_100008CE0(v69, v139, &qword_100056668);
  v73 = v157;
  v74 = v72 + *(int *)(v157 + 36);
  *(_QWORD *)v74 = 0;
  *(double *)(v74 + 8) = (1.0 / v50 + -1.0) * a4 * 0.5;
  sub_100008C08(v69, &qword_100056668);
  sub_100017510(v72, (uint64_t)v39, &qword_100056670);
  v75 = v159;
  sub_100008CE0((uint64_t)v39, v159, &qword_100056670);
  swift_storeEnumTagMultiPayload(v75, v158, 0);
  v76 = sub_1000173D4(&qword_1000566B0, &qword_100056670, (void (*)(void))sub_1000173B0);
  v77 = sub_100008D24(&qword_1000566D8, &qword_100056610, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  _ConditionalContent<>.init(storage:)(v75, v73, v161, v76, v77);

  v78 = (uint64_t)v39;
  v79 = &qword_100056670;
  return sub_100008C08(v78, v79);
}

uint64_t sub_100016A28@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(char *, uint64_t);
  int *v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v3 = type metadata accessor for ColorScheme(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v25 - v8;
  sub_100007A74((uint64_t)&v25 - v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, enum case for ColorScheme.dark(_:), v3);
  v10 = static ColorScheme.== infix(_:_:)(v9, v7);
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  v11(v9, v3);
  v12 = (int *)type metadata accessor for AvatarView(0);
  v13 = (double *)(v1 + v12[10]);
  v14 = *(double *)(v1 + v12[6] + 8);
  v15 = *v13;
  v16 = v13[1];
  v17 = 4;
  if ((v10 & 1) != 0)
    v17 = 18;
  v18 = *(_QWORD *)&v13[v17];
  swift_retain(v18);
  if (v16 >= v15 * v14)
    v20 = v15 * v14;
  else
    v20 = v16;
  v21 = *(_QWORD *)(v1 + v12[7]) != 0;
  *a1 = static Alignment.center.getter(v19);
  a1[1] = v22;
  v23 = sub_100004A10(&qword_100056550);
  sub_100016BAC(v1, v18, v21, v10 & 1, (uint64_t)a1 + *(int *)(v23 + 44), v20);
  return swift_release(v18);
}

uint64_t sub_100016BAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  int *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double *v56;
  double v57;
  double v58;
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
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  char *v76;
  uint64_t v77;
  int v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  char v92;
  __int128 v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  char v97;
  __int128 v98;

  v75 = a4;
  v78 = a3;
  v73 = a2;
  v85 = a5;
  v8 = sub_100004A10(&qword_100056558);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (uint64_t *)((char *)&v70 - v13);
  __chkstk_darwin(v12);
  v84 = (uint64_t)&v70 - v15;
  v16 = sub_100004A10(&qword_100056560);
  __chkstk_darwin(v16);
  v72 = (uint64_t)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_100004A10(&qword_100056568);
  __chkstk_darwin(v74);
  v19 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100004A10(&qword_100056570);
  __chkstk_darwin(v20);
  v71 = (uint64_t)&v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100004A10(&qword_100056578);
  v80 = *(_QWORD *)(v81 - 8);
  __chkstk_darwin(v81);
  v23 = (char *)&v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_100004A10(&qword_100056580);
  v25 = __chkstk_darwin(v24);
  v83 = (uint64_t)&v70 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v28 = (char *)&v70 - v27;
  v29 = sub_100004A10(&qword_100056588);
  v30 = __chkstk_darwin(v29);
  v82 = (uint64_t)&v70 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v33 = (char *)&v70 - v32;
  v34 = (int *)type metadata accessor for AvatarView(0);
  v35 = *(_BYTE *)(a1 + v34[8]);
  v86 = v11;
  v77 = v20;
  v76 = v23;
  v79 = v28;
  if ((v35 & 1) != 0)
  {
    v37 = v73;
    swift_retain(v73);
    v39 = static Alignment.center.getter(v38);
    ((void (*)(_QWORD *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))_FrameLayout.init(width:height:alignment:))(&v94, a6 + -0.5, 0, a6 + -0.5, 0, v39, v40);
    v87 = v37;
    v88 = 256;
    v89 = v94;
    v90 = v95;
    v91 = v96;
    v92 = v97;
    v93 = v98;
    v41 = v16;
    v42 = sub_100004A10(&qword_1000565E8);
    v43 = sub_10001732C();
    v44 = v42;
    v16 = v41;
    View.widgetAccentable(_:)(1, v44, v43);
    swift_release(v37);
    v45 = sub_100004A10(&qword_100056590);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v33, 0, 1, v45);
  }
  else
  {
    v36 = sub_100004A10(&qword_100056590);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v33, 1, 1, v36);
  }
  if ((v78 & 1) != 0)
  {
    v46 = (uint64_t)v33;
    v47 = v74;
    if ((v75 & 1) != 0)
    {
      v48 = v72;
      sub_100015998(v72);
      v49 = &qword_100056560;
      sub_100008CE0(v48, (uint64_t)v19, &qword_100056560);
      swift_storeEnumTagMultiPayload(v19, v47, 1);
    }
    else
    {
      v48 = v71;
      sub_1000155B0(v71);
      v49 = &qword_100056570;
      sub_100008CE0(v48, (uint64_t)v19, &qword_100056570);
      swift_storeEnumTagMultiPayload(v19, v47, 0);
    }
    v50 = sub_100008D24(&qword_1000565A8, &qword_100056570, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v53 = sub_1000173D4(&qword_1000565B0, &qword_100056560, (void (*)(void))sub_100017284);
    v54 = (uint64_t)v76;
    _ConditionalContent<>.init(storage:)(v19, v77, v16, v50, v53);
    sub_100008C08(v48, v49);
    v52 = (uint64_t)v79;
    sub_100017510(v54, (uint64_t)v79, &qword_100056578);
    v51 = 0;
  }
  else
  {
    v46 = (uint64_t)v33;
    v51 = 1;
    v52 = (uint64_t)v79;
  }
  v55 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 56))(v52, v51, 1, v81);
  v56 = (double *)(a1 + v34[10]);
  v57 = *v56 * *(double *)(a1 + v34[6] + 8);
  if (v56[1] < v57)
    v57 = v56[1];
  v58 = v56[2] + v57;
  *v14 = static Alignment.center.getter(v55);
  v14[1] = v59;
  v60 = sub_100004A10(&qword_100056598);
  sub_100014F1C(a1, (uint64_t)v14 + *(int *)(v60 + 44), v58);
  v61 = v84;
  sub_100017510((uint64_t)v14, v84, &qword_100056558);
  v62 = v46;
  v63 = v82;
  sub_100008CE0(v46, v82, &qword_100056588);
  v64 = v83;
  sub_100008CE0(v52, v83, &qword_100056580);
  v65 = (uint64_t)v86;
  sub_100008CE0(v61, (uint64_t)v86, &qword_100056558);
  v66 = v85;
  sub_100008CE0(v63, v85, &qword_100056588);
  v67 = v52;
  v68 = sub_100004A10(&qword_1000565A0);
  sub_100008CE0(v64, v66 + *(int *)(v68 + 48), &qword_100056580);
  sub_100008CE0(v65, v66 + *(int *)(v68 + 64), &qword_100056558);
  sub_100008C08(v61, &qword_100056558);
  sub_100008C08(v67, &qword_100056580);
  sub_100008C08(v62, &qword_100056588);
  sub_100008C08(v65, &qword_100056558);
  sub_100008C08(v64, &qword_100056580);
  return sub_100008C08(v63, &qword_100056588);
}

uint64_t sub_100017284()
{
  return sub_1000173D4(&qword_1000565B8, &qword_1000565C0, (void (*)(void))sub_1000172A8);
}

unint64_t sub_1000172A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000565C8;
  if (!qword_1000565C8)
  {
    v1 = sub_100004A50(&qword_1000565D0);
    sub_100008D24(&qword_1000565D8, &qword_1000565E0, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000565C8);
  }
  return result;
}

unint64_t sub_10001732C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000565F0;
  if (!qword_1000565F0)
  {
    v1 = sub_100004A50(&qword_1000565E8);
    sub_100008D24(&qword_1000565F8, &qword_100056600, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000565F0);
  }
  return result;
}

uint64_t sub_1000173B0()
{
  return sub_1000173D4(&qword_1000566B8, &qword_100056668, (void (*)(void))sub_10001743C);
}

uint64_t sub_1000173D4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004A50(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001743C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000566C0;
  if (!qword_1000566C0)
  {
    v1 = sub_100004A50(&qword_100056660);
    swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of Image.widgetAccentedRenderingMode(_:)>>, 1);
    sub_100008D24(&qword_1000566C8, &qword_1000566D0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000566C0);
  }
  return result;
}

unint64_t sub_1000174CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000566E0;
  if (!qword_1000566E0)
  {
    v1 = objc_opt_self(UIColor);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000566E0);
  }
  return result;
}

uint64_t sub_100017510(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004A10(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100017554()
{
  return sub_100008D24(&qword_100056720, qword_100056728, (uint64_t)&protocol conformance descriptor for ZStack<A>);
}

uint64_t sub_100017580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

void sub_100017588(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v11[6];

  sub_100007950(319, (unint64_t *)&qword_100055EC8, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v3 <= 0x3F)
  {
    v11[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100007950(319, (unint64_t *)&qword_1000567B0, (uint64_t (*)(uint64_t))&type metadata accessor for LayoutDirection);
    if (v5 <= 0x3F)
    {
      v11[1] = *(_QWORD *)(v4 - 8) + 64;
      sub_100007950(319, &qword_100055ED0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
      if (v8 <= 0x3F)
      {
        v11[2] = *(_QWORD *)(v6 - 8) + 64;
        v9 = type metadata accessor for ModelEntry(319, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v7);
        if (v10 <= 0x3F)
        {
          v11[3] = *(_QWORD *)(v9 - 8) + 64;
          v11[4] = &unk_1000431C0;
          v11[5] = &unk_1000431D8;
          swift_initStructMetadata(a1, 0, 6, v11, a1 + 32);
        }
      }
    }
  }
}

uint64_t *sub_10001768C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t *, uint64_t *, uint64_t);
  uint64_t *v36;
  char v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t *v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t *v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _OWORD *v59;
  _OWORD *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void (*v64)(unint64_t, unint64_t, uint64_t);
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
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
  unint64_t v92;

  v86 = type metadata accessor for ColorScheme(0);
  v5 = *(_QWORD *)(v86 - 8);
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(v5 + 64);
  v87 = type metadata accessor for LayoutDirection(0);
  v7 = *(_QWORD *)(v87 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v9 = 8;
  else
    v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for WidgetRenderingMode(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v88 = v11;
  v89 = v10;
  v13 = *(_QWORD *)(v11 + 64);
  if (v13 <= 8)
    v13 = 8;
  v92 = v13;
  v90 = type metadata accessor for Date(0);
  v91 = *(_QWORD *)(v90 - 8);
  v14 = *(_DWORD *)(v91 + 80);
  v15 = type metadata accessor for WidgetFamily(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_DWORD *)(v16 + 80);
  v18 = v17 & 0xF8 | 7;
  v19 = *(_QWORD *)(a3 + 16);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_DWORD *)(v20 + 80);
  v22 = v18 | v14 | v21;
  v23 = *(_DWORD *)(v5 + 80);
  v24 = ((v12 | v8) | v23) & 0xF8 | v22;
  if ((_DWORD)v24 != 7
    || ((v12 | v8 | v14 | v17 | v23 | *(_DWORD *)(v20 + 80)) & 0x100000) != 0
    || (v25 = v8 & 0xF8 | 7,
        v26 = v6 + v25 + 1,
        v27 = v12 & 0xF8 | 7,
        v28 = *(_QWORD *)(v91 + 64) + v18,
        v29 = *(_QWORD *)(v16 + 64) + 7,
        (((((((((v29 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v21 + 8 + (v28 & ~v18)) & ~v21)
          + *(_QWORD *)(v20 + 64)
          + ((v92 + 1 + v22 + ((v9 + 1 + v27 + (v26 & ~v25)) & ~v27)) & ~v22)
          + 7) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 232 > 0x18))
  {
    v32 = *a2;
    *a1 = *a2;
    v33 = (uint64_t *)(v32 + ((v24 + 16) & ~v24));
  }
  else
  {
    v30 = *((unsigned __int8 *)a2 + v6);
    v84 = *(_QWORD *)(v19 - 8);
    if (v30 >= 2)
    {
      if (v6 <= 3)
        v31 = v6;
      else
        v31 = 4;
      __asm { BR              X13 }
    }
    v74 = v9 + 1;
    v75 = *(_DWORD *)(v20 + 80);
    v76 = v92 + 1;
    v77 = v18;
    v78 = *(_QWORD *)(v91 + 64) + v18;
    v79 = *(_QWORD *)(v16 + 64) + 7;
    v80 = (((v29 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v21 + 8;
    v81 = ((v80 + (v28 & ~v18)) & ~v21) + *(_QWORD *)(v20 + 64);
    v82 = *(_QWORD *)(v15 - 8);
    v83 = v15;
    v85 = v19;
    v34 = ~v25;
    if (v30 == 1)
    {
      v35 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16);
      v36 = a1;
      v35(a1, a2, v86);
      v37 = 1;
    }
    else
    {
      v38 = *a2;
      v36 = a1;
      *a1 = *a2;
      swift_retain(v38);
      v37 = 0;
    }
    *((_BYTE *)v36 + v6) = v37;
    v39 = (_QWORD *)(((unint64_t)v36 + v26) & v34);
    v40 = (uint64_t *)(((unint64_t)a2 + v26) & v34);
    v41 = *((unsigned __int8 *)v40 + v9);
    if (v41 >= 2)
    {
      if (v9 <= 3)
        v42 = v9;
      else
        v42 = 4;
      __asm { BR              X12 }
    }
    v43 = ~v27;
    if (v41 == 1)
    {
      (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v7 + 16))(v39, v40, v87);
      v44 = 1;
    }
    else
    {
      v45 = *v40;
      *v39 = *v40;
      swift_retain(v45);
      v44 = 0;
    }
    *((_BYTE *)v39 + v9) = v44;
    v46 = (_QWORD *)(((unint64_t)v39 + v74 + v27) & v43);
    v47 = (uint64_t *)(((unint64_t)v40 + v74 + v27) & v43);
    v48 = *((unsigned __int8 *)v47 + v92);
    if (v48 >= 2)
    {
      if (v92 <= 3)
        v49 = v92;
      else
        v49 = 4;
      __asm { BR              X12 }
    }
    v50 = ~v22;
    v51 = ~v77;
    v52 = ~v75;
    if (v48 == 1)
    {
      (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v88 + 16))(v46, v47, v89);
      v53 = 1;
    }
    else
    {
      v54 = *v47;
      *v46 = *v47;
      swift_retain(v54);
      v53 = 0;
    }
    *((_BYTE *)v46 + v92) = v53;
    v55 = ((unint64_t)v46 + v76 + v22) & v50;
    v56 = ((unint64_t)v47 + v76 + v22) & v50;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v91 + 16))(v55, v56, v90);
    v57 = (v78 + v55) & v51;
    v58 = (v78 + v56) & v51;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v82 + 16))(v57, v58, v83);
    v59 = (_OWORD *)((v79 + v57) & 0xFFFFFFFFFFFFFFF8);
    v60 = (_OWORD *)((v79 + v58) & 0xFFFFFFFFFFFFFFF8);
    *v59 = *v60;
    v61 = *(_QWORD *)(((unint64_t)v60 + 23) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)v59 + 23) & 0xFFFFFFFFFFFFF8) = v61;
    v62 = (v80 + v57) & v52;
    v63 = (v80 + v58) & v52;
    v64 = *(void (**)(unint64_t, unint64_t, uint64_t))(v84 + 16);
    swift_retain(v61);
    v64(v62, v63, v85);
    v65 = (_QWORD *)(((v55 | 7) + v81) & 0xFFFFFFFFFFFFFFF8);
    v66 = (_QWORD *)(((v56 | 7) + v81) & 0xFFFFFFFFFFFFFFF8);
    *v65 = *v66;
    v67 = v66[1];
    v65[1] = v67;
    v68 = ((unint64_t)v65 + 23) & 0xFFFFFFFFFFFFFFF8;
    v69 = ((unint64_t)v66 + 23) & 0xFFFFFFFFFFFFFFF8;
    v70 = *(_QWORD *)v69;
    *(_QWORD *)v68 = *(_QWORD *)v69;
    v32 = *(_QWORD *)(v69 + 8);
    *(_QWORD *)(v68 + 8) = v32;
    *(_QWORD *)(v68 + 16) = *(_QWORD *)(v69 + 16);
    *(_QWORD *)(v68 + 24) = *(_QWORD *)(v69 + 24);
    *(_QWORD *)(v68 + 32) = *(_QWORD *)(v69 + 32);
    *(_QWORD *)(v68 + 40) = *(_QWORD *)(v69 + 40);
    v71 = *(_OWORD *)(v69 + 64);
    *(_OWORD *)(v68 + 48) = *(_OWORD *)(v69 + 48);
    *(_OWORD *)(v68 + 64) = v71;
    *(_QWORD *)(v68 + 80) = *(_QWORD *)(v69 + 80);
    *(_QWORD *)(v68 + 88) = *(_QWORD *)(v69 + 88);
    *(_QWORD *)(v68 + 96) = *(_QWORD *)(v69 + 96);
    *(_QWORD *)(v68 + 104) = *(_QWORD *)(v69 + 104);
    *(_QWORD *)(v68 + 112) = *(_QWORD *)(v69 + 112);
    *(_QWORD *)(v68 + 120) = *(_QWORD *)(v69 + 120);
    *(_QWORD *)(v68 + 128) = *(_QWORD *)(v69 + 128);
    *(_QWORD *)(v68 + 136) = *(_QWORD *)(v69 + 136);
    v72 = *(_OWORD *)(v69 + 160);
    *(_OWORD *)(v68 + 144) = *(_OWORD *)(v69 + 144);
    *(_OWORD *)(v68 + 160) = v72;
    *(_QWORD *)(v68 + 176) = *(_QWORD *)(v69 + 176);
    *(_QWORD *)(v68 + 184) = *(_QWORD *)(v69 + 184);
    *(_QWORD *)(v68 + 192) = *(_QWORD *)(v69 + 192);
    *(_QWORD *)(v68 + 200) = *(_QWORD *)(v69 + 200);
    *(_OWORD *)(v68 + 208) = *(_OWORD *)(v69 + 208);
    *(_QWORD *)(v68 + 224) = *(_QWORD *)(v69 + 224);
    swift_bridgeObjectRetain(v67);
    swift_retain(v70);
    v33 = a1;
  }
  swift_retain(v32);
  return v33;
}

uint64_t sub_100017CDC(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;

  v4 = type metadata accessor for ColorScheme(0);
  v5 = *(_QWORD *)(v4 - 8);
  if (*(_QWORD *)(v5 + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(v5 + 64);
  v7 = *((unsigned __int8 *)a1 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v7 == 1)
    (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(a1, v4);
  else
    swift_release(*a1);
  v9 = type metadata accessor for LayoutDirection(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  v12 = (_QWORD *)(((unint64_t)a1 + v6 + v11 + 1) & ~v11);
  if (*(_QWORD *)(v10 + 64) <= 8uLL)
    v13 = 8;
  else
    v13 = *(_QWORD *)(v10 + 64);
  v14 = *((unsigned __int8 *)v12 + v13);
  if (v14 >= 2)
  {
    if (v13 <= 3)
      v15 = v13;
    else
      v15 = 4;
    __asm { BR              X13 }
  }
  if (v14 == 1)
    (*(void (**)(_QWORD *, uint64_t))(v10 + 8))(v12, v9);
  else
    swift_release(*v12);
  v16 = type metadata accessor for WidgetRenderingMode(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_DWORD *)(v17 + 80) & 0xF8 | 7;
  v19 = (_QWORD *)(((unint64_t)v12 + v13 + v18 + 1) & ~v18);
  if (*(_QWORD *)(v17 + 64) <= 8uLL)
    v20 = 8;
  else
    v20 = *(_QWORD *)(v17 + 64);
  v21 = *((unsigned __int8 *)v19 + v20);
  if (v21 >= 2)
  {
    if (v20 <= 3)
      v22 = v20;
    else
      v22 = 4;
    __asm { BR              X13 }
  }
  if (v21 == 1)
    (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v19, v16);
  else
    swift_release(*v19);
  v23 = (char *)v19 + v20;
  v24 = type metadata accessor for Date(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = type metadata accessor for WidgetFamily(0);
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(_DWORD *)(v28 + 80) & 0xF8 | 7;
  v30 = *(_DWORD *)(v28 + 80) & 0xF8 | 7 | v26;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(unsigned __int8 *)(v32 + 80);
  v34 = (unint64_t)&v23[(v30 | v33) + 1] & ~(unint64_t)(v30 | v33);
  (*(void (**)(unint64_t, uint64_t))(v25 + 8))(v34, v24);
  v35 = *(_QWORD *)(v25 + 64) + v29;
  v36 = (v35 + v34) & ~v29;
  (*(void (**)(unint64_t, uint64_t))(v28 + 8))(v36, v27);
  v37 = *(_QWORD *)(v28 + 64) + 7;
  swift_release(*(_QWORD *)((((v37 + v36) & 0xFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8));
  v38 = (((v37 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v33 + 8;
  (*(void (**)(unint64_t, uint64_t))(v32 + 8))((v38 + v36) & ~v33, v31);
  v39 = ((v34 | 7) + *(_QWORD *)(v32 + 64) + ((v38 + (v35 & ~v29)) & ~v33)) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease(*(_QWORD *)(v39 + 8));
  v40 = (_QWORD *)((v39 + 23) & 0xFFFFFFFFFFFFFFF8);
  swift_release(*v40);
  return swift_release(v40[1]);
}

uint64_t *sub_100018088(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD *v53;
  _OWORD *v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void (*v59)(unint64_t, unint64_t, uint64_t);
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  uint64_t v71;
  uint64_t *v72;

  v6 = type metadata accessor for ColorScheme(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v7 + 64);
  v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2)
  {
    if (v8 <= 3)
      v10 = v8;
    else
      v10 = 4;
    __asm { BR              X13 }
  }
  if (v9 == 1)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    v11 = 1;
  }
  else
  {
    v12 = *a2;
    *a1 = *a2;
    swift_retain(v12);
    v11 = 0;
  }
  *((_BYTE *)a1 + v8) = v11;
  v13 = type metadata accessor for LayoutDirection(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_DWORD *)(v14 + 80) & 0xF8 | 7;
  v16 = v8 + v15 + 1;
  v17 = (_QWORD *)(((unint64_t)a1 + v16) & ~v15);
  v18 = (uint64_t *)(((unint64_t)a2 + v16) & ~v15);
  if (*(_QWORD *)(v14 + 64) <= 8uLL)
    v19 = 8;
  else
    v19 = *(_QWORD *)(v14 + 64);
  v20 = *((unsigned __int8 *)v18 + v19);
  if (v20 >= 2)
  {
    if (v19 <= 3)
      v21 = v19;
    else
      v21 = 4;
    __asm { BR              X13 }
  }
  if (v20 == 1)
  {
    (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v14 + 16))(v17, v18, v13);
    v22 = 1;
  }
  else
  {
    v23 = *v18;
    *v17 = *v18;
    swift_retain(v23);
    v22 = 0;
  }
  *((_BYTE *)v17 + v19) = v22;
  v24 = v19 + 1;
  v25 = type metadata accessor for WidgetRenderingMode(0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(_DWORD *)(v26 + 80) & 0xF8 | 7;
  v28 = v24 + v27;
  v29 = (_QWORD *)(((unint64_t)v17 + v24 + v27) & ~v27);
  v30 = (uint64_t *)(((unint64_t)v18 + v28) & ~v27);
  if (*(_QWORD *)(v26 + 64) <= 8uLL)
    v31 = 8;
  else
    v31 = *(_QWORD *)(v26 + 64);
  v32 = *((unsigned __int8 *)v30 + v31);
  if (v32 >= 2)
  {
    if (v31 <= 3)
      v33 = v31;
    else
      v33 = 4;
    __asm { BR              X13 }
  }
  v72 = a1;
  if (v32 == 1)
  {
    (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v26 + 16))(v29, v30, v25);
    v34 = 1;
  }
  else
  {
    v35 = *v30;
    *v29 = *v30;
    swift_retain(v35);
    v34 = 0;
  }
  *((_BYTE *)v29 + v31) = v34;
  v36 = v31 + 1;
  v37 = type metadata accessor for Date(0);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(unsigned __int8 *)(v38 + 80);
  v40 = type metadata accessor for WidgetFamily(0);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(_DWORD *)(v41 + 80) & 0xF8 | 7;
  v43 = *(_DWORD *)(v41 + 80) & 0xF8 | 7 | v39;
  v71 = *(_QWORD *)(a3 + 16);
  v44 = *(_QWORD *)(v71 - 8);
  v45 = *(unsigned __int8 *)(v44 + 80);
  v46 = v43 | v45;
  v47 = ((unint64_t)v29 + v36 + v46) & ~v46;
  v48 = ((unint64_t)v30 + v36 + v46) & ~v46;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v38 + 16))(v47, v48, v37);
  v49 = *(_QWORD *)(v38 + 64) + v42;
  v50 = (v49 + v47) & ~v42;
  v51 = (v49 + v48) & ~v42;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v50, v51, v40);
  v52 = *(_QWORD *)(v41 + 64) + 7;
  v53 = (_OWORD *)((v52 + v50) & 0xFFFFFFFFFFFFFFF8);
  v54 = (_OWORD *)((v52 + v51) & 0xFFFFFFFFFFFFFFF8);
  *v53 = *v54;
  v55 = (uint64_t *)(((unint64_t)v54 + 23) & 0xFFFFFFFFFFFFF8);
  v56 = *v55;
  *(_QWORD *)(((unint64_t)v53 + 23) & 0xFFFFFFFFFFFFF8) = *v55;
  v57 = (((v52 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v45 + 8;
  v58 = (v57 + v51) & ~v45;
  v59 = *(void (**)(unint64_t, unint64_t, uint64_t))(v44 + 16);
  swift_retain(v56);
  v59((v57 + v50) & ~v45, v58, v71);
  v60 = ((v57 + (v49 & ~v42)) & ~v45) + *(_QWORD *)(v44 + 64) + 7;
  v61 = (_QWORD *)((v60 + v47) & 0xFFFFFFFFFFFFFFF8);
  v62 = (_QWORD *)((v60 + v48) & 0xFFFFFFFFFFFFFFF8);
  *v61 = *v62;
  v63 = v62[1];
  v61[1] = v63;
  v64 = ((unint64_t)v61 + 23) & 0xFFFFFFFFFFFFFFF8;
  v65 = ((unint64_t)v62 + 23) & 0xFFFFFFFFFFFFFFF8;
  v66 = *(_QWORD *)v65;
  *(_QWORD *)v64 = *(_QWORD *)v65;
  v67 = *(_QWORD *)(v65 + 8);
  *(_QWORD *)(v64 + 8) = v67;
  *(_QWORD *)(v64 + 16) = *(_QWORD *)(v65 + 16);
  *(_QWORD *)(v64 + 24) = *(_QWORD *)(v65 + 24);
  *(_QWORD *)(v64 + 32) = *(_QWORD *)(v65 + 32);
  *(_QWORD *)(v64 + 40) = *(_QWORD *)(v65 + 40);
  v68 = *(_OWORD *)(v65 + 64);
  *(_OWORD *)(v64 + 48) = *(_OWORD *)(v65 + 48);
  *(_OWORD *)(v64 + 64) = v68;
  *(_QWORD *)(v64 + 80) = *(_QWORD *)(v65 + 80);
  *(_QWORD *)(v64 + 88) = *(_QWORD *)(v65 + 88);
  *(_QWORD *)(v64 + 96) = *(_QWORD *)(v65 + 96);
  *(_QWORD *)(v64 + 104) = *(_QWORD *)(v65 + 104);
  *(_QWORD *)(v64 + 112) = *(_QWORD *)(v65 + 112);
  *(_QWORD *)(v64 + 120) = *(_QWORD *)(v65 + 120);
  *(_QWORD *)(v64 + 128) = *(_QWORD *)(v65 + 128);
  *(_QWORD *)(v64 + 136) = *(_QWORD *)(v65 + 136);
  v69 = *(_OWORD *)(v65 + 160);
  *(_OWORD *)(v64 + 144) = *(_OWORD *)(v65 + 144);
  *(_OWORD *)(v64 + 160) = v69;
  *(_QWORD *)(v64 + 176) = *(_QWORD *)(v65 + 176);
  *(_QWORD *)(v64 + 184) = *(_QWORD *)(v65 + 184);
  *(_QWORD *)(v64 + 192) = *(_QWORD *)(v65 + 192);
  *(_QWORD *)(v64 + 200) = *(_QWORD *)(v65 + 200);
  *(_OWORD *)(v64 + 208) = *(_OWORD *)(v65 + 208);
  *(_QWORD *)(v64 + 224) = *(_QWORD *)(v65 + 224);
  swift_bridgeObjectRetain(v63);
  swift_retain(v66);
  swift_retain(v67);
  return v72;
}

uint64_t *sub_1000185D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v78;
  uint64_t *v79;

  if (a1 != a2)
  {
    v6 = type metadata accessor for ColorScheme(0);
    v7 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v7 + 64) <= 8uLL)
      v8 = 8;
    else
      v8 = *(_QWORD *)(v7 + 64);
    v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2)
    {
      if (v8 <= 3)
        v10 = v8;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    if (v9 == 1)
      (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(a1, v6);
    else
      swift_release(*a1);
    v11 = *((unsigned __int8 *)a2 + v8);
    if (v11 >= 2)
    {
      if (v8 <= 3)
        v12 = v8;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    if (v11 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      *((_BYTE *)a1 + v8) = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      *((_BYTE *)a1 + v8) = 0;
      swift_retain(v13);
    }
  }
  v14 = type metadata accessor for ColorScheme(0);
  if (*(_QWORD *)(*(_QWORD *)(v14 - 8) + 64) <= 8uLL)
    v15 = 8;
  else
    v15 = *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64);
  v16 = type metadata accessor for LayoutDirection(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_DWORD *)(v17 + 80) & 0xF8 | 7;
  v19 = v15 + v18 + 1;
  v20 = (uint64_t *)(((unint64_t)a1 + v19) & ~v18);
  v21 = (uint64_t *)(((unint64_t)a2 + v19) & ~v18);
  if (*(_QWORD *)(v17 + 64) <= 8uLL)
    v22 = 8;
  else
    v22 = *(_QWORD *)(v17 + 64);
  if (v20 != v21)
  {
    v23 = v16;
    v24 = *((unsigned __int8 *)v20 + v22);
    if (v24 >= 2)
    {
      if (v22 <= 3)
        v25 = v22;
      else
        v25 = 4;
      __asm { BR              X12 }
    }
    if (v24 == 1)
      (*(void (**)(uint64_t *, uint64_t))(v17 + 8))(v20, v16);
    else
      swift_release(*v20);
    v26 = *((unsigned __int8 *)v21 + v22);
    if (v26 >= 2)
    {
      if (v22 <= 3)
        v27 = v22;
      else
        v27 = 4;
      __asm { BR              X12 }
    }
    if (v26 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v17 + 16))(v20, v21, v23);
      *((_BYTE *)v20 + v22) = 1;
    }
    else
    {
      v28 = *v21;
      *v20 = *v21;
      *((_BYTE *)v20 + v22) = 0;
      swift_retain(v28);
    }
  }
  v79 = a1;
  v29 = type metadata accessor for WidgetRenderingMode(0);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(_DWORD *)(v30 + 80) & 0xF8 | 7;
  v32 = v22 + v31 + 1;
  v33 = (uint64_t *)(((unint64_t)v20 + v32) & ~v31);
  v34 = (uint64_t *)(((unint64_t)v21 + v32) & ~v31);
  if (*(_QWORD *)(v30 + 64) <= 8uLL)
    v35 = 8;
  else
    v35 = *(_QWORD *)(v30 + 64);
  if (v33 != v34)
  {
    v36 = v29;
    v37 = *((unsigned __int8 *)v33 + v35);
    if (v37 >= 2)
    {
      if (v35 <= 3)
        v38 = v35;
      else
        v38 = 4;
      __asm { BR              X12 }
    }
    if (v37 == 1)
      (*(void (**)(uint64_t *, uint64_t))(v30 + 8))(v33, v29);
    else
      swift_release(*v33);
    v39 = *((unsigned __int8 *)v34 + v35);
    if (v39 >= 2)
    {
      if (v35 <= 3)
        v40 = v35;
      else
        v40 = 4;
      __asm { BR              X12 }
    }
    if (v39 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v30 + 16))(v33, v34, v36);
      *((_BYTE *)v33 + v35) = 1;
    }
    else
    {
      v41 = *v34;
      *v33 = *v34;
      *((_BYTE *)v33 + v35) = 0;
      swift_retain(v41);
    }
  }
  v42 = type metadata accessor for Date(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = *(unsigned __int8 *)(v43 + 80);
  v45 = type metadata accessor for WidgetFamily(0);
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(_DWORD *)(v46 + 80) & 0xF8 | 7;
  v48 = *(_DWORD *)(v46 + 80) & 0xF8 | 7 | v44;
  v78 = *(_QWORD *)(a3 + 16);
  v49 = *(_QWORD *)(v78 - 8);
  v50 = *(unsigned __int8 *)(v49 + 80);
  v51 = v48 | v50;
  v52 = v35 + v51 + 1;
  v53 = ((unint64_t)v33 + v52) & ~v51;
  v54 = ((unint64_t)v34 + v52) & ~v51;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v43 + 24))(v53, v54, v42);
  v55 = *(_QWORD *)(v43 + 64) + v47;
  v56 = (v55 + v53) & ~v47;
  v57 = (v55 + v54) & ~v47;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 24))(v56, v57, v45);
  v58 = *(_QWORD *)(v46 + 64) + 7;
  v59 = (_QWORD *)((v58 + v56) & 0xFFFFFFFFFFFFFFF8);
  v60 = (_QWORD *)((v58 + v57) & 0xFFFFFFFFFFFFFFF8);
  *v59 = *v60;
  v59[1] = v60[1];
  v61 = (uint64_t *)(((unint64_t)v59 + 23) & 0xFFFFFFFFFFFFFFF8);
  v62 = (uint64_t *)(((unint64_t)v60 + 23) & 0xFFFFFFFFFFFFF8);
  v63 = *v62;
  v64 = *v61;
  *v61 = *v62;
  swift_retain(v63);
  swift_release(v64);
  v65 = (((v58 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v50 + 8;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v49 + 24))((v65 + v56) & ~v50, (v65 + v57) & ~v50, v78);
  v66 = *(_QWORD *)(v49 + 64) + ((v65 + (v55 & ~v47)) & ~v50) + 7;
  v67 = (_QWORD *)((v66 + v53) & 0xFFFFFFFFFFFFFFF8);
  v68 = (_QWORD *)((v66 + v54) & 0xFFFFFFFFFFFFFFF8);
  *v67 = *v68;
  v69 = v68[1];
  v70 = v67[1];
  v67[1] = v69;
  swift_bridgeObjectRetain(v69);
  swift_bridgeObjectRelease(v70);
  v71 = (uint64_t *)(((unint64_t)v67 + 23) & 0xFFFFFFFFFFFFFFF8);
  v72 = (uint64_t *)(((unint64_t)v68 + 23) & 0xFFFFFFFFFFFFFFF8);
  v73 = *v72;
  v74 = *v71;
  *v71 = *v72;
  swift_retain(v73);
  swift_release(v74);
  v75 = v72[1];
  v76 = v71[1];
  v71[1] = v75;
  swift_retain(v75);
  swift_release(v76);
  v71[2] = v72[2];
  v71[3] = v72[3];
  v71[4] = v72[4];
  v71[5] = v72[5];
  v71[6] = v72[6];
  v71[7] = v72[7];
  v71[8] = v72[8];
  v71[9] = v72[9];
  v71[10] = v72[10];
  v71[11] = v72[11];
  v71[12] = v72[12];
  v71[13] = v72[13];
  v71[14] = v72[14];
  v71[15] = v72[15];
  v71[16] = v72[16];
  v71[17] = v72[17];
  v71[18] = v72[18];
  v71[19] = v72[19];
  v71[20] = v72[20];
  v71[21] = v72[21];
  v71[22] = v72[22];
  v71[23] = v72[23];
  v71[24] = v72[24];
  v71[25] = v72[25];
  v71[26] = v72[26];
  v71[27] = v72[27];
  v71[28] = v72[28];
  return v79;
}

_QWORD *sub_100018DE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD *v50;
  _OWORD *v51;
  unint64_t v52;
  uint64_t v53;
  _OWORD *v54;
  _OWORD *v55;
  unint64_t v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v70;
  _QWORD *v71;

  v6 = type metadata accessor for ColorScheme(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v7 + 64);
  v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2)
  {
    if (v8 <= 3)
      v10 = v8;
    else
      v10 = 4;
    __asm { BR              X13 }
  }
  if (v9 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 32))(a1, a2, v6);
    v11 = 1;
  }
  else
  {
    v11 = 0;
    *a1 = *a2;
  }
  *((_BYTE *)a1 + v8) = v11;
  v12 = type metadata accessor for LayoutDirection(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_DWORD *)(v13 + 80) & 0xF8 | 7;
  v15 = v8 + v14 + 1;
  v16 = (_QWORD *)(((unint64_t)a1 + v15) & ~v14);
  v17 = (_QWORD *)(((unint64_t)a2 + v15) & ~v14);
  if (*(_QWORD *)(v13 + 64) <= 8uLL)
    v18 = 8;
  else
    v18 = *(_QWORD *)(v13 + 64);
  v19 = *((unsigned __int8 *)v17 + v18);
  if (v19 >= 2)
  {
    if (v18 <= 3)
      v20 = v18;
    else
      v20 = 4;
    __asm { BR              X13 }
  }
  if (v19 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v13 + 32))(v16, v17, v12);
    v21 = 1;
  }
  else
  {
    v21 = 0;
    *v16 = *v17;
  }
  *((_BYTE *)v16 + v18) = v21;
  v22 = v18 + 1;
  v23 = type metadata accessor for WidgetRenderingMode(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(_DWORD *)(v24 + 80) & 0xF8 | 7;
  v26 = v22 + v25;
  v27 = (_QWORD *)(((unint64_t)v16 + v22 + v25) & ~v25);
  v28 = (_QWORD *)(((unint64_t)v17 + v26) & ~v25);
  if (*(_QWORD *)(v24 + 64) <= 8uLL)
    v29 = 8;
  else
    v29 = *(_QWORD *)(v24 + 64);
  v30 = *((unsigned __int8 *)v28 + v29);
  if (v30 >= 2)
  {
    if (v29 <= 3)
      v31 = v29;
    else
      v31 = 4;
    __asm { BR              X13 }
  }
  v71 = a1;
  if (v30 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v24 + 32))(v27, v28, v23);
    v32 = 1;
  }
  else
  {
    v32 = 0;
    *v27 = *v28;
  }
  *((_BYTE *)v27 + v29) = v32;
  v33 = v29 + 1;
  v34 = type metadata accessor for Date(0);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(unsigned __int8 *)(v35 + 80);
  v37 = type metadata accessor for WidgetFamily(0);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(_DWORD *)(v38 + 80) & 0xF8 | 7;
  v40 = *(_DWORD *)(v38 + 80) & 0xF8 | 7 | v36;
  v70 = *(_QWORD *)(a3 + 16);
  v41 = *(_QWORD *)(v70 - 8);
  v42 = *(unsigned __int8 *)(v41 + 80);
  v43 = v40 | v42;
  v44 = ((unint64_t)v27 + v33 + v43) & ~v43;
  v45 = ((unint64_t)v28 + v33 + v43) & ~v43;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v35 + 32))(v44, v45, v34);
  v46 = *(_QWORD *)(v35 + 64) + v39;
  v47 = (v46 + v44) & ~v39;
  v48 = (v46 + v45) & ~v39;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v47, v48, v37);
  v49 = *(_QWORD *)(v38 + 64) + 7;
  v50 = (_OWORD *)((v49 + v47) & 0xFFFFFFFFFFFFFFF8);
  v51 = (_OWORD *)((v49 + v48) & 0xFFFFFFFFFFFFFFF8);
  *v50 = *v51;
  *(_QWORD *)(((unint64_t)v50 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v51 + 23) & 0xFFFFFFFFFFFFF8);
  v52 = (((v49 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v42 + 8;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v41 + 32))((v52 + v47) & ~v42, (v52 + v48) & ~v42, v70);
  v53 = ((v52 + (v46 & ~v39)) & ~v42) + *(_QWORD *)(v41 + 64) + 7;
  v54 = (_OWORD *)((v53 + v44) & 0xFFFFFFFFFFFFFFF8);
  v55 = (_OWORD *)((v53 + v45) & 0xFFFFFFFFFFFFFFF8);
  *v54 = *v55;
  v56 = ((unint64_t)v54 + 23) & 0xFFFFFFFFFFFFFFF8;
  v57 = ((unint64_t)v55 + 23) & 0xFFFFFFFFFFFFFFF8;
  v59 = *(_OWORD *)(v57 + 192);
  v58 = *(_OWORD *)(v57 + 208);
  v60 = *(_OWORD *)(v57 + 176);
  *(_QWORD *)(v56 + 224) = *(_QWORD *)(v57 + 224);
  *(_OWORD *)(v56 + 192) = v59;
  *(_OWORD *)(v56 + 208) = v58;
  *(_OWORD *)(v56 + 176) = v60;
  v62 = *(_OWORD *)(v57 + 112);
  v61 = *(_OWORD *)(v57 + 128);
  v63 = *(_OWORD *)(v57 + 160);
  *(_OWORD *)(v56 + 144) = *(_OWORD *)(v57 + 144);
  *(_OWORD *)(v56 + 160) = v63;
  *(_OWORD *)(v56 + 112) = v62;
  *(_OWORD *)(v56 + 128) = v61;
  v65 = *(_OWORD *)(v57 + 48);
  v64 = *(_OWORD *)(v57 + 64);
  v66 = *(_OWORD *)(v57 + 96);
  *(_OWORD *)(v56 + 80) = *(_OWORD *)(v57 + 80);
  *(_OWORD *)(v56 + 96) = v66;
  *(_OWORD *)(v56 + 48) = v65;
  *(_OWORD *)(v56 + 64) = v64;
  v67 = *(_OWORD *)v57;
  v68 = *(_OWORD *)(v57 + 32);
  *(_OWORD *)(v56 + 16) = *(_OWORD *)(v57 + 16);
  *(_OWORD *)(v56 + 32) = v68;
  *(_OWORD *)v56 = v67;
  return v71;
}

_QWORD *sub_10001928C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  _QWORD *v74;

  if (a1 != a2)
  {
    v6 = type metadata accessor for ColorScheme(0);
    v7 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v7 + 64) <= 8uLL)
      v8 = 8;
    else
      v8 = *(_QWORD *)(v7 + 64);
    v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2)
    {
      if (v8 <= 3)
        v10 = v8;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    if (v9 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(a1, v6);
    else
      swift_release(*a1);
    v11 = *((unsigned __int8 *)a2 + v8);
    if (v11 >= 2)
    {
      if (v8 <= 3)
        v12 = v8;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    if (v11 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 32))(a1, a2, v6);
      v13 = 1;
    }
    else
    {
      v13 = 0;
      *a1 = *a2;
    }
    *((_BYTE *)a1 + v8) = v13;
  }
  v14 = type metadata accessor for ColorScheme(0);
  if (*(_QWORD *)(*(_QWORD *)(v14 - 8) + 64) <= 8uLL)
    v15 = 8;
  else
    v15 = *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64);
  v16 = type metadata accessor for LayoutDirection(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_DWORD *)(v17 + 80) & 0xF8 | 7;
  v19 = v15 + v18 + 1;
  v20 = (_QWORD *)(((unint64_t)a1 + v19) & ~v18);
  v21 = (_QWORD *)(((unint64_t)a2 + v19) & ~v18);
  if (*(_QWORD *)(v17 + 64) <= 8uLL)
    v22 = 8;
  else
    v22 = *(_QWORD *)(v17 + 64);
  if (v20 != v21)
  {
    v23 = v16;
    v24 = *((unsigned __int8 *)v20 + v22);
    if (v24 >= 2)
    {
      if (v22 <= 3)
        v25 = v22;
      else
        v25 = 4;
      __asm { BR              X12 }
    }
    if (v24 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v17 + 8))(v20, v16);
    else
      swift_release(*v20);
    v26 = *((unsigned __int8 *)v21 + v22);
    if (v26 >= 2)
    {
      if (v22 <= 3)
        v27 = v22;
      else
        v27 = 4;
      __asm { BR              X12 }
    }
    if (v26 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v17 + 32))(v20, v21, v23);
      v28 = 1;
    }
    else
    {
      v28 = 0;
      *v20 = *v21;
    }
    *((_BYTE *)v20 + v22) = v28;
  }
  v74 = a1;
  v29 = type metadata accessor for WidgetRenderingMode(0);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(_DWORD *)(v30 + 80) & 0xF8 | 7;
  v32 = v22 + v31 + 1;
  v33 = (_QWORD *)(((unint64_t)v20 + v32) & ~v31);
  v34 = (_QWORD *)(((unint64_t)v21 + v32) & ~v31);
  if (*(_QWORD *)(v30 + 64) <= 8uLL)
    v35 = 8;
  else
    v35 = *(_QWORD *)(v30 + 64);
  if (v33 != v34)
  {
    v36 = v29;
    v37 = *((unsigned __int8 *)v33 + v35);
    if (v37 >= 2)
    {
      if (v35 <= 3)
        v38 = v35;
      else
        v38 = 4;
      __asm { BR              X12 }
    }
    if (v37 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v30 + 8))(v33, v29);
    else
      swift_release(*v33);
    v39 = *((unsigned __int8 *)v34 + v35);
    if (v39 >= 2)
    {
      if (v35 <= 3)
        v40 = v35;
      else
        v40 = 4;
      __asm { BR              X12 }
    }
    if (v39 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v30 + 32))(v33, v34, v36);
      v41 = 1;
    }
    else
    {
      v41 = 0;
      *v33 = *v34;
    }
    *((_BYTE *)v33 + v35) = v41;
  }
  v42 = type metadata accessor for Date(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = *(unsigned __int8 *)(v43 + 80);
  v45 = type metadata accessor for WidgetFamily(0);
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(_DWORD *)(v46 + 80) & 0xF8 | 7;
  v48 = *(_DWORD *)(v46 + 80) & 0xF8 | 7 | v44;
  v73 = *(_QWORD *)(a3 + 16);
  v49 = *(_QWORD *)(v73 - 8);
  v50 = *(unsigned __int8 *)(v49 + 80);
  v51 = v48 | v50;
  v52 = v35 + v51 + 1;
  v53 = ((unint64_t)v33 + v52) & ~v51;
  v54 = ((unint64_t)v34 + v52) & ~v51;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v43 + 40))(v53, v54, v42);
  v55 = *(_QWORD *)(v43 + 64) + v47;
  v56 = (v55 + v53) & ~v47;
  v57 = (v55 + v54) & ~v47;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 40))(v56, v57, v45);
  v58 = *(_QWORD *)(v46 + 64) + 7;
  v59 = (_QWORD *)((v58 + v56) & 0xFFFFFFFFFFFFFFF8);
  v60 = (_QWORD *)((v58 + v57) & 0xFFFFFFFFFFFFFFF8);
  *v59 = *v60;
  v59[1] = v60[1];
  v61 = (uint64_t *)(((unint64_t)v59 + 23) & 0xFFFFFFFFFFFFFFF8);
  v62 = *v61;
  *v61 = *(_QWORD *)(((unint64_t)v60 + 23) & 0xFFFFFFFFFFFFF8);
  swift_release(v62);
  v63 = (((v58 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v50 + 8;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v49 + 40))((v63 + v56) & ~v50, (v63 + v57) & ~v50, v73);
  v64 = *(_QWORD *)(v49 + 64) + ((v63 + (v55 & ~v47)) & ~v50) + 7;
  v65 = (_QWORD *)((v64 + v53) & 0xFFFFFFFFFFFFFFF8);
  v66 = (_QWORD *)((v64 + v54) & 0xFFFFFFFFFFFFFFF8);
  *v65 = *v66;
  v67 = v65[1];
  v65[1] = v66[1];
  swift_bridgeObjectRelease(v67);
  v68 = (uint64_t *)(((unint64_t)v65 + 23) & 0xFFFFFFFFFFFFFFF8);
  v69 = (uint64_t *)(((unint64_t)v66 + 23) & 0xFFFFFFFFFFFFFFF8);
  v70 = *v68;
  *v68 = *v69;
  swift_release(v70);
  v71 = v68[1];
  v68[1] = v69[1];
  swift_release(v71);
  v68[2] = v69[2];
  v68[3] = v69[3];
  v68[4] = v69[4];
  v68[5] = v69[5];
  v68[6] = v69[6];
  v68[7] = v69[7];
  v68[8] = v69[8];
  v68[9] = v69[9];
  v68[10] = v69[10];
  v68[11] = v69[11];
  v68[12] = v69[12];
  v68[13] = v69[13];
  v68[14] = v69[14];
  v68[15] = v69[15];
  v68[16] = v69[16];
  v68[17] = v69[17];
  v68[18] = v69[18];
  v68[19] = v69[19];
  v68[20] = v69[20];
  v68[21] = v69[21];
  v68[22] = v69[22];
  v68[23] = v69[23];
  v68[24] = v69[24];
  v68[25] = v69[25];
  v68[26] = v69[26];
  v68[27] = v69[27];
  v68[28] = v69[28];
  return v74;
}

uint64_t sub_100019A68(uint64_t a1, unsigned int a2, uint64_t a3)
{
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
  unsigned int v17;
  unsigned int v18;
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
  unint64_t v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v37;
  uint64_t (*v38)(unint64_t, uint64_t, uint64_t);
  unint64_t v39;

  v5 = type metadata accessor for ColorScheme(0);
  if (*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) <= 8uLL)
    v6 = 8;
  else
    v6 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  v7 = *(_QWORD *)(type metadata accessor for LayoutDirection(0) - 8);
  if (*(_QWORD *)(v7 + 64) <= 8uLL)
    v8 = 8;
  else
    v8 = *(_QWORD *)(v7 + 64);
  v9 = *(_QWORD *)(type metadata accessor for WidgetRenderingMode(0) - 8);
  if (*(_QWORD *)(v9 + 64) <= 8uLL)
    v10 = 8;
  else
    v10 = *(_QWORD *)(v9 + 64);
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int *)(v12 + 84);
  v14 = type metadata accessor for WidgetFamily(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int *)(v15 + 84);
  if (v16 <= 0x7FFFFFFF)
    v17 = 0x7FFFFFFF;
  else
    v17 = *(_DWORD *)(v15 + 84);
  if (v17 <= v13)
    v18 = v13;
  else
    v18 = v17;
  v19 = *(_QWORD *)(a3 + 16);
  v20 = *(_QWORD *)(v19 - 8);
  if (*(_DWORD *)(v20 + 84) > v18)
    v18 = *(_DWORD *)(v20 + 84);
  if (!a2)
    return 0;
  v21 = v14;
  v22 = *(_DWORD *)(v7 + 80) & 0xF8 | 7;
  v23 = v6 + v22 + 1;
  v24 = v8 + 1;
  v25 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  v26 = v10 + 1;
  v27 = *(_DWORD *)(v15 + 80) & 0xF8 | 7;
  v28 = *(unsigned __int8 *)(v20 + 80);
  v29 = *(_DWORD *)(v15 + 80) & 0xF8 | 7 | *(unsigned __int8 *)(v12 + 80) | v28;
  v30 = *(_QWORD *)(v12 + 64) + v27;
  v31 = *(_QWORD *)(v15 + 64) + 7;
  v32 = (((v31 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + v28 + 8;
  if (v18 < a2)
  {
    if (((((((*(_QWORD *)(v20 + 64)
             + ((v32 + (v30 & ~v27)) & ~v28)
             + ((v26 + v29 + ((v24 + v25 + (v23 & ~v22)) & ~v25)) & ~v29)
             + 7) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 232) & 0xFFFFFFF8) != 0)
      v33 = 2;
    else
      v33 = a2 - v18 + 1;
    if (v33 >= 0x10000)
      v34 = 4;
    else
      v34 = 2;
    if (v33 < 0x100)
      v34 = 1;
    if (v33 >= 2)
      v35 = v34;
    else
      v35 = 0;
    __asm { BR              X27 }
  }
  v37 = (((((v23 + a1) & ~v22) + v24 + v25) & ~v25) + v26 + v29) & ~v29;
  if ((_DWORD)v13 == v18)
  {
    v38 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v12 + 48);
    v16 = v13;
    v19 = v11;
    return v38(v37, v16, v19);
  }
  v37 = (v30 + v37) & ~v27;
  if (v17 != v18)
  {
    v37 = (v32 + v37) & ~v28;
    v38 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v20 + 48);
    v16 = *(unsigned int *)(v20 + 84);
    return v38(v37, v16, v19);
  }
  if (v16 >= 0x7FFFFFFF)
  {
    v38 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v15 + 48);
    v19 = v21;
    return v38(v37, v16, v19);
  }
  v39 = *(_QWORD *)((((v31 + v37) & 0xFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8);
  if (v39 >= 0xFFFFFFFF)
    LODWORD(v39) = -1;
  return (v39 + 1);
}

void sub_100019D70(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  unsigned int v26;
  int v27;
  int v28;
  unsigned int v29;

  v7 = type metadata accessor for ColorScheme(0);
  v8 = 8;
  if (*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) <= 8uLL)
    v9 = 8;
  else
    v9 = *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
  v10 = *(_QWORD *)(type metadata accessor for LayoutDirection(0) - 8);
  if (*(_QWORD *)(v10 + 64) <= 8uLL)
    v11 = 8;
  else
    v11 = *(_QWORD *)(v10 + 64);
  v12 = *(_QWORD *)(type metadata accessor for WidgetRenderingMode(0) - 8);
  if (*(_QWORD *)(v12 + 64) > 8uLL)
    v8 = *(_QWORD *)(v12 + 64);
  v13 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
  v14 = *(_DWORD *)(v13 + 84);
  v15 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  if (*(_DWORD *)(v15 + 84) <= 0x7FFFFFFFu)
    v16 = 0x7FFFFFFF;
  else
    v16 = *(_DWORD *)(v15 + 84);
  if (v16 <= v14)
    v17 = v14;
  else
    v17 = v16;
  v18 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v18 + 84) > v17)
    v17 = *(_DWORD *)(v18 + 84);
  v19 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  v20 = v9 + v19 + 1;
  v21 = *(_DWORD *)(v12 + 80) & 0xF8 | 7;
  v22 = *(_DWORD *)(v15 + 80) & 0xF8 | 7;
  v23 = *(unsigned __int8 *)(v18 + 80);
  v24 = v22 | *(unsigned __int8 *)(v13 + 80) | v23;
  v25 = ((((*(_QWORD *)(v18 + 64)
          + ((((((*(_QWORD *)(v15 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
            + v23
            + 8
            + ((*(_QWORD *)(v13 + 64) + v22) & ~v22)) & ~v23)
          + ((v8 + 1 + v24 + ((v11 + 1 + v21 + (v20 & ~v19)) & ~v21)) & ~v24)
          + 7) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 232;
  if (v17 >= a3)
  {
    v28 = 0;
    if (a2 <= v17)
      goto LABEL_30;
  }
  else
  {
    if (((((*(_DWORD *)(v18 + 64)
           + ((((((*(_DWORD *)(v15 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
             + (_DWORD)v23
             + 8
             + ((*(_DWORD *)(v13 + 64) + (_DWORD)v22) & ~(_DWORD)v22)) & ~(_DWORD)v23)
           + (((_DWORD)v8
             + 1
             + (_DWORD)v24
             + (((_DWORD)v11 + 1 + (_DWORD)v21 + (v20 & ~(*(_DWORD *)(v10 + 80) & 0xF8 | 7))) & ~(_DWORD)v21)) & ~(_DWORD)v24)
           + 7) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFF18)
      v26 = a3 - v17 + 1;
    else
      v26 = 2;
    if (v26 >= 0x10000)
      v27 = 4;
    else
      v27 = 2;
    if (v26 < 0x100)
      v27 = 1;
    if (v26 >= 2)
      v28 = v27;
    else
      v28 = 0;
    if (a2 <= v17)
LABEL_30:
      __asm { BR              X21 }
  }
  if ((_DWORD)v25)
  {
    v29 = ~v17 + a2;
    bzero(a1, v25);
    *a1 = v29;
  }
  __asm { BR              X10 }
}

void sub_100019FB4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  *(_BYTE *)(v0 + v2) = v1;
  JUMPOUT(0x10001A0A0);
}

void sub_100019FBC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v1 + v2) = 0;
  if (v0)
    JUMPOUT(0x100019FC4);
  JUMPOUT(0x10001A0A0);
}

void sub_10001A02C()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;

  *(_WORD *)(v0 + v2) = v1;
  JUMPOUT(0x10001A0A0);
}

void sub_10001A034()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  *(_DWORD *)(v0 + v2) = v1;
  JUMPOUT(0x10001A0A0);
}

void sub_10001A03C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  *(_WORD *)(v6 + v8) = 0;
  if (v5)
  {
    if (v7 != v3)
    {
      if (v4 != v3)
        JUMPOUT(0x10001A048);
      if (a3 < 0x7FFFFFFF)
        JUMPOUT(0x10001A07CLL);
    }
    JUMPOUT(0x10001A05CLL);
  }
  JUMPOUT(0x10001A0A0);
}

uint64_t type metadata accessor for ContentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008D64(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ContentView);
}

uint64_t sub_10001A0D0(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &unk_1000447EC, 1);
}

uint64_t sub_10001A108@<X0>(uint64_t a1@<X8>)
{
  return sub_100007CDC(a1);
}

uint64_t sub_10001A12C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v4 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = 0;
  v19 = 0xE000000000000000;
  type metadata accessor for ModelEntry(0, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for WidgetFamily.systemSmall(_:), v4);
  v9 = sub_10002498C((unint64_t *)&qword_100056218, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v17, v4, v9);
  dispatch thunk of RawRepresentable.rawValue.getter(&v16, v4, v9);
  v11 = v16;
  v10 = v17;
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v13 = 1;
  if (v10 != v11)
    v13 = 2;
  v14 = a1 * v13;
  if ((unsigned __int128)(a1 * (__int128)v13) >> 64 == (a1 * v13) >> 63)
  {
    if (v14 >= 1)
    {
      do
      {
        v15._countAndFlagsBits = 32;
        v15._object = (void *)0xE100000000000000;
        String.append(_:)(v15);
        --v14;
      }
      while (v14);
    }
    return v18;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v5 = v4 + *(int *)(a1 + 44);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = v5 + *(int *)(type metadata accessor for ModelEntry(0, v6, v7, a4) + 36);
  type metadata accessor for ViewContext(0);
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);
  return sub_100026154(v8, v5 & 1, v9 & 1);
}

double sub_10001A338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_100055AF8 != -1)
    swift_once(&qword_100055AF8, sub_10003DC34);
  if (qword_100055AF0 != -1)
    swift_once(&qword_100055AF0, sub_10002CBD4);
  type metadata accessor for ModelEntry(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  type metadata accessor for ViewContext(0);
  return 0.0;
}

uint64_t sub_10001A420(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char v23;
  char v24;
  char v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  char *v30;
  char v31;
  void (*v32)(char *, uint64_t);
  void (*v33)(char *, uint64_t);
  char *v34;
  _QWORD v36[2];
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;

  v2 = v1;
  v4 = *(_QWORD *)(a1 - 8);
  v5 = __chkstk_darwin(a1);
  v40 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)v36 - v8;
  v10 = __chkstk_darwin(v7);
  v12 = (char *)v36 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)v36 - v14;
  v16 = *(_QWORD *)(v13 + 16);
  v17 = *(uint64_t (***)(_QWORD, _QWORD))(v13 + 24);
  v19 = type metadata accessor for ModelEntry(0, v16, (uint64_t)v17, v18);
  v20 = v17[3](v16, v17);
  v21 = v2;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v22(v15, v21, a1);
  if ((v20 & 1) != 0)
  {
    v23 = 0;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v15, a1);
  }
  else
  {
    v24 = v17[4](v16, v17);
    v22(v12, (uint64_t)v15, a1);
    if ((v24 & 1) != 0)
    {
      v38 = v15;
      v25 = v17[5](v16, v17);
      v26 = v22;
      v27 = v16;
      v39 = v12;
      v28 = (void (*)(char *, char *, uint64_t))v26;
      v26(v9, (uint64_t)v12, a1);
      v29 = v40;
      v30 = v9;
      v36[1] = v19;
      v37 = v27;
      if ((v25 & 1) != 0)
        v31 = v17[6](v27, v17) ^ 1;
      else
        v31 = 0;
      v33 = *(void (**)(char *, uint64_t))(v4 + 8);
      v33(v30, a1);
      v28(v29, v39, a1);
      v34 = v38;
      if ((v31 & 1) != 0)
        v23 = v17[7](v37, v17) ^ 1;
      else
        v23 = 0;
      v33(v29, a1);
      v33(v39, a1);
      v33(v34, a1);
    }
    else
    {
      v32 = *(void (**)(char *, uint64_t))(v4 + 8);
      v32(v12, a1);
      v23 = 1;
      v32(v15, a1);
    }
  }
  return v23 & 1;
}

uint64_t sub_10001A6A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = static HorizontalAlignment.leading.getter();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = sub_100004A10(&qword_100056CC8);
  return sub_10001A6F8(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2 + *(int *)(v4 + 44));
}

uint64_t sub_10001A6F8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v6 = sub_100004A10(&qword_100056CD0);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v16 - v11;
  *(_QWORD *)v12 = static VerticalAlignment.top.getter(v10);
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 1;
  v13 = sub_100004A10(&qword_100056CD8);
  sub_10001A81C(a1, a2, (uint64_t)&v12[*(int *)(v13 + 44)]);
  sub_100008CE0((uint64_t)v12, (uint64_t)v9, &qword_100056CD0);
  sub_100008CE0((uint64_t)v9, a3, &qword_100056CD0);
  v14 = a3 + *(int *)(sub_100004A10(&qword_100056CE0) + 48);
  *(_QWORD *)v14 = 0;
  *(_BYTE *)(v14 + 8) = 1;
  sub_100008C08((uint64_t)v12, &qword_100056CD0);
  return sub_100008C08((uint64_t)v9, &qword_100056CD0);
}

uint64_t sub_10001A81C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v6 = sub_100004A10(&qword_100056CE8);
  __chkstk_darwin(v6);
  v8 = (uint64_t *)((char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_100004A10(&qword_100056CF0);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v29 - v13;
  type metadata accessor for ContentView(0, a1, a2, v15);
  type metadata accessor for ModelEntry(0, a1, a2, v16);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 192))(a1, a2);
  if (v19 == 1)
  {
    v20 = type metadata accessor for BatteryView(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v14, 1, 1, v20);
  }
  else
  {
    v21 = HIDWORD(v17);
    v22 = v18;
    v23 = v19;
    v24 = *(float *)&v17;
    *v8 = swift_getKeyPath(&unk_100043400);
    v25 = sub_100004A10((uint64_t *)&unk_100056FC0);
    swift_storeEnumTagMultiPayload(v8, v25, 0);
    sub_100028180((uint64_t)v8, v21 & 0x10101, v22, v23, (uint64_t)v14, v24);
    v26 = type metadata accessor for BatteryView(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v14, 0, 1, v26);
  }
  sub_100008CE0((uint64_t)v14, (uint64_t)v12, &qword_100056CF0);
  sub_100008CE0((uint64_t)v12, a3, &qword_100056CF0);
  v27 = a3 + *(int *)(sub_100004A10(&qword_100056CF8) + 48);
  *(_QWORD *)v27 = 0;
  *(_BYTE *)(v27 + 8) = 1;
  sub_100008C08((uint64_t)v14, &qword_100056CF0);
  return sub_100008C08((uint64_t)v12, &qword_100056CF0);
}

uint64_t sub_10001AA44@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  id v22;
  id v23;
  id v24;
  void *v25;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  long double v46;
  long double v47;
  long double v48;
  CGFloat v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _OWORD *v69;
  _QWORD *v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[23];
  __int128 v83;
  _BYTE v84[184];
  _OWORD v85[12];
  __int128 v86;
  uint64_t v87;
  char v88;

  v3 = v2;
  v67 = a1;
  v69 = a2;
  v4 = type metadata accessor for WidgetRenderingMode(0);
  v70 = *(_QWORD **)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v66 - v8;
  v10 = type metadata accessor for ColorScheme(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v66 - v15;
  sub_100007A74((uint64_t)&v66 - v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v14, enum case for ColorScheme.dark(_:), v10);
  LODWORD(v68) = static ColorScheme.== infix(_:_:)(v16, v14);
  v17 = *(void (**)(char *, uint64_t))(v11 + 8);
  v17(v14, v10);
  v18 = v16;
  v19 = v67;
  v17(v18, v10);
  v71 = v3;
  v20 = sub_100007A48((uint64_t)v9);
  static WidgetRenderingMode.accented.getter(v20);
  LOBYTE(v17) = static WidgetRenderingMode.== infix(_:_:)(v9, v7);
  v21 = (void (*)(char *, uint64_t))v70[1];
  v21(v7, v4);
  v21(v9, v4);
  v22 = objc_allocWithZone((Class)UIColor);
  if ((v17 & 1) != 0)
  {
    v23 = objc_msgSend(v22, "initWithRed:green:blue:alpha:", 0.254901961, 0.254901961, 0.254901961, 0.0);
    v24 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.254901961, 0.254901961, 0.254901961, 0.93);
  }
  else if ((v68 & 1) != 0)
  {
    v23 = objc_msgSend(v22, "initWithRed:green:blue:alpha:", 0.180392157, 0.243137255, 0.325490196, 0.0);
    v24 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.180392157, 0.243137255, 0.325490196, 0.93);
  }
  else
  {
    v23 = objc_msgSend(v22, "initWithRed:green:blue:alpha:", 0.97254902, 0.97254902, 0.960784314, 0.0);
    v24 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.97254902, 0.97254902, 0.960784314, 0.93);
  }
  v25 = v24;
  v26 = v69;
  v27 = sub_100004A10(&qword_1000568E8);
  v28 = swift_allocObject(v27, 56, 7);
  *(_OWORD *)(v28 + 16) = xmmword_100043480;
  v70 = v23;
  *(_QWORD *)(v28 + 32) = Color.init(_:)(v70);
  v29 = v25;
  *(_QWORD *)(v28 + 40) = Color.init(_:)(v29);
  v69 = v29;
  v30 = Color.init(_:)(v69);
  *(_QWORD *)(v28 + 48) = v30;
  *(_QWORD *)&v85[0] = v28;
  specialized Array._endMutation()(v30);
  v68 = *(_QWORD *)&v85[0];
  v31 = v71 + *(int *)(v19 + 44);
  v33 = *(_QWORD *)(v19 + 16);
  v32 = *(_QWORD *)(v19 + 24);
  v35 = type metadata accessor for ModelEntry(0, v33, v32, v34);
  v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 72))(v33, v32);
  if (!v37)
  {
    v41 = *(int *)(v35 + 36);
    v42 = *(double *)(v31 + *(int *)(type metadata accessor for ViewContext(0) + 20) + v41 + 8);
    v43 = v42 * 0.54;
LABEL_13:
    v44 = 0.3;
    goto LABEL_14;
  }
  v38 = v36;
  v39 = v37;
  swift_bridgeObjectRelease(v37);
  if ((v39 & 0x2000000000000000) != 0)
    v40 = HIBYTE(v39) & 0xF;
  else
    v40 = v38 & 0xFFFFFFFFFFFFLL;
  v41 = *(int *)(v35 + 36);
  v42 = *(double *)(v31 + *(int *)(type metadata accessor for ViewContext(0) + 20) + v41 + 8);
  v43 = v42 * 0.54;
  if (!v40)
    goto LABEL_13;
  v44 = 0.38;
LABEL_14:
  v45 = v44 * v42;
  v46 = v43 - v44 * v42;
  v47 = *(double *)(v31 + v41 + *(int *)(type metadata accessor for ViewContext(0) + 20));
  v48 = atan2(v46, v47);
  v49 = (v45 * (v46 / v47) + v45 * (v46 / v47)) / cos(v48);
  v67 = static Alignment.center.getter(v50);
  v52 = v51;
  v53 = static HorizontalAlignment.center.getter(v67);
  v54 = v68;
  sub_10001B638(v68, v71, v33, v32, (uint64_t)&v83, v49, v43, v48);
  v88 = 0;
  *(_OWORD *)((char *)&v85[4] + 7) = *(_OWORD *)&v84[48];
  *(_OWORD *)((char *)&v85[3] + 7) = *(_OWORD *)&v84[32];
  *(_OWORD *)((char *)&v85[7] + 7) = *(_OWORD *)&v84[96];
  *(_OWORD *)((char *)&v85[8] + 7) = *(_OWORD *)&v84[112];
  *(_OWORD *)((char *)&v85[9] + 7) = *(_OWORD *)&v84[128];
  *(_OWORD *)((char *)&v85[10] + 7) = *(_OWORD *)&v84[144];
  *(_OWORD *)((char *)&v85[5] + 7) = *(_OWORD *)&v84[64];
  *(_OWORD *)((char *)&v85[6] + 7) = *(_OWORD *)&v84[80];
  *(_OWORD *)((char *)v85 + 7) = v83;
  *(_OWORD *)((char *)&v85[1] + 7) = *(_OWORD *)v84;
  *(_OWORD *)((char *)&v85[2] + 7) = *(_OWORD *)&v84[16];
  v80 = v85[8];
  v81 = v85[9];
  *(_OWORD *)v82 = v85[10];
  *(_QWORD *)&v82[15] = *(_QWORD *)&v84[152];
  v76 = v85[4];
  v77 = v85[5];
  v78 = v85[6];
  v79 = v85[7];
  v72 = v85[0];
  v73 = v85[1];
  v74 = v85[2];
  v75 = v85[3];
  swift_bridgeObjectRelease(v54);
  v83 = (unint64_t)v53;
  v84[0] = 0;
  *(_OWORD *)&v84[129] = v80;
  *(_OWORD *)&v84[145] = v81;
  *(_OWORD *)&v84[161] = *(_OWORD *)v82;
  *(_QWORD *)&v84[176] = *(_QWORD *)&v82[15];
  *(_OWORD *)&v84[65] = v76;
  *(_OWORD *)&v84[81] = v77;
  *(_OWORD *)&v84[97] = v78;
  *(_OWORD *)&v84[113] = v79;
  *(_OWORD *)&v84[1] = v72;
  *(_OWORD *)&v84[17] = v73;
  *(_OWORD *)&v84[33] = v74;
  *(_OWORD *)&v84[49] = v75;
  v85[11] = *(_OWORD *)&v84[144];
  v86 = *(_OWORD *)&v84[160];
  v87 = *(_QWORD *)&v82[15];
  v85[7] = *(_OWORD *)&v84[80];
  v85[8] = *(_OWORD *)&v84[96];
  v85[9] = *(_OWORD *)&v84[112];
  v85[10] = *(_OWORD *)&v84[128];
  v85[3] = *(_OWORD *)&v84[16];
  v85[4] = *(_OWORD *)&v84[32];
  v85[5] = *(_OWORD *)&v84[48];
  v85[6] = *(_OWORD *)&v84[64];
  v85[1] = (unint64_t)v53;
  v85[2] = *(_OWORD *)v84;
  *(_QWORD *)&v85[0] = v67;
  *((_QWORD *)&v85[0] + 1) = v52;
  v56 = static Alignment.center.getter(v55);
  _FrameLayout.init(width:height:alignment:)(&v72, *(_QWORD *)&v47, 0, *(_QWORD *)&v42, 0, v56, v57);
  v58 = v85[11];
  v26[10] = v85[10];
  v26[11] = v58;
  v26[12] = v86;
  v59 = v85[7];
  v26[6] = v85[6];
  v26[7] = v59;
  v60 = v85[9];
  v26[8] = v85[8];
  v26[9] = v60;
  v61 = v85[3];
  v26[2] = v85[2];
  v26[3] = v61;
  v62 = v85[5];
  v26[4] = v85[4];
  v26[5] = v62;
  v63 = v85[1];
  *v26 = v85[0];
  v26[1] = v63;
  v64 = v73;
  *(_OWORD *)((char *)v26 + 216) = v72;
  *((_QWORD *)v26 + 26) = v87;
  *(_OWORD *)((char *)v26 + 232) = v64;
  *(_OWORD *)((char *)v26 + 248) = v74;
  sub_100024A50((uint64_t)v85);

  return sub_100024A78((uint64_t)&v83);
}

uint64_t sub_10001B094@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  void (*v17)(_BYTE *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  id v20;
  void (*v21)(_BYTE *, id);
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  double v38;
  double v39;
  long double v40;
  CGFloat v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v59[12];
  int v60;
  _QWORD *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[23];
  __int128 v76;
  _BYTE v77[184];
  _OWORD v78[12];
  __int128 v79;
  uint64_t v80;
  char v81;

  v3 = v2;
  v63 = a2;
  v64 = a1;
  v4 = (_QWORD *)type metadata accessor for WidgetRenderingMode(0);
  v61 = (_QWORD *)*(v4 - 1);
  v62 = v4;
  v5 = __chkstk_darwin(v4);
  v7 = &v59[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v9 = &v59[-v8];
  v10 = type metadata accessor for ColorScheme(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = &v59[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  v16 = &v59[-v15];
  sub_100007A74((uint64_t)&v59[-v15]);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v11 + 104))(v14, enum case for ColorScheme.dark(_:), v10);
  v60 = static ColorScheme.== infix(_:_:)(v16, v14);
  v17 = *(void (**)(_BYTE *, uint64_t))(v11 + 8);
  v17(v14, v10);
  v17(v16, v10);
  v18 = v3;
  v19 = sub_100007A48((uint64_t)v9);
  static WidgetRenderingMode.accented.getter(v19);
  LOBYTE(v17) = static WidgetRenderingMode.== infix(_:_:)(v9, v7);
  v20 = v62;
  v21 = (void (*)(_BYTE *, id))v61[1];
  v21(v7, v62);
  v21(v9, v20);
  v22 = objc_allocWithZone((Class)UIColor);
  if ((v17 & 1) != 0)
  {
    v23 = objc_msgSend(v22, "initWithRed:green:blue:alpha:", 0.254901961, 0.254901961, 0.254901961, 0.0);
    v24 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.254901961, 0.254901961, 0.254901961, 0.93);
  }
  else if ((v60 & 1) != 0)
  {
    v23 = objc_msgSend(v22, "initWithRed:green:blue:alpha:", 0.180392157, 0.243137255, 0.325490196, 0.0);
    v24 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.180392157, 0.243137255, 0.325490196, 0.93);
  }
  else
  {
    v23 = objc_msgSend(v22, "initWithRed:green:blue:alpha:", 0.97254902, 0.97254902, 0.960784314, 0.0);
    v24 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.97254902, 0.97254902, 0.960784314, 0.93);
  }
  v25 = v24;
  v26 = sub_100004A10(&qword_1000568E8);
  v27 = swift_allocObject(v26, 56, 7);
  *(_OWORD *)(v27 + 16) = xmmword_100043480;
  v62 = v23;
  *(_QWORD *)(v27 + 32) = Color.init(_:)(v62);
  v28 = v25;
  *(_QWORD *)(v27 + 40) = Color.init(_:)(v28);
  v61 = v28;
  v29 = Color.init(_:)(v61);
  *(_QWORD *)(v27 + 48) = v29;
  *(_QWORD *)&v78[0] = v27;
  specialized Array._endMutation()(v29);
  v30 = *(_QWORD *)&v78[0];
  v31 = v18;
  v32 = v18 + *(int *)(v64 + 44);
  v34 = *(_QWORD *)(v64 + 16);
  v33 = *(_QWORD *)(v64 + 24);
  v36 = *(int *)(type metadata accessor for ModelEntry(0, v34, v33, v35) + 36);
  v37 = (double *)(v32 + *(int *)(type metadata accessor for ViewContext(0) + 20) + v36);
  v38 = *v37;
  v39 = v37[1];
  v40 = atan2(v39 * 0.51, *v37);
  v41 = (v39 * 0.51 / v38 * 0.0 + v39 * 0.51 / v38 * 0.0) / cos(v40);
  v43 = static Alignment.center.getter(v42);
  v45 = v44;
  v46 = static HorizontalAlignment.center.getter(v43);
  sub_10001B638(v30, v31, v34, v33, (uint64_t)&v76, v41, v39 * 0.51, v40);
  v81 = 0;
  *(_OWORD *)((char *)&v78[4] + 7) = *(_OWORD *)&v77[48];
  *(_OWORD *)((char *)&v78[3] + 7) = *(_OWORD *)&v77[32];
  *(_OWORD *)((char *)&v78[7] + 7) = *(_OWORD *)&v77[96];
  *(_OWORD *)((char *)&v78[8] + 7) = *(_OWORD *)&v77[112];
  *(_OWORD *)((char *)&v78[9] + 7) = *(_OWORD *)&v77[128];
  *(_OWORD *)((char *)&v78[10] + 7) = *(_OWORD *)&v77[144];
  *(_OWORD *)((char *)&v78[5] + 7) = *(_OWORD *)&v77[64];
  *(_OWORD *)((char *)&v78[6] + 7) = *(_OWORD *)&v77[80];
  *(_OWORD *)((char *)v78 + 7) = v76;
  *(_OWORD *)((char *)&v78[1] + 7) = *(_OWORD *)v77;
  *(_OWORD *)((char *)&v78[2] + 7) = *(_OWORD *)&v77[16];
  v73 = v78[8];
  v74 = v78[9];
  *(_OWORD *)v75 = v78[10];
  *(_QWORD *)&v75[15] = *(_QWORD *)&v77[152];
  v69 = v78[4];
  v70 = v78[5];
  v71 = v78[6];
  v72 = v78[7];
  v65 = v78[0];
  v66 = v78[1];
  v67 = v78[2];
  v68 = v78[3];
  swift_bridgeObjectRelease(v30);
  v76 = (unint64_t)v46;
  v77[0] = 0;
  *(_OWORD *)&v77[129] = v73;
  *(_OWORD *)&v77[145] = v74;
  *(_OWORD *)&v77[161] = *(_OWORD *)v75;
  *(_QWORD *)&v77[176] = *(_QWORD *)&v75[15];
  *(_OWORD *)&v77[65] = v69;
  *(_OWORD *)&v77[81] = v70;
  *(_OWORD *)&v77[97] = v71;
  *(_OWORD *)&v77[113] = v72;
  *(_OWORD *)&v77[1] = v65;
  *(_OWORD *)&v77[17] = v66;
  *(_OWORD *)&v77[33] = v67;
  *(_OWORD *)&v77[49] = v68;
  v78[11] = *(_OWORD *)&v77[144];
  v79 = *(_OWORD *)&v77[160];
  v80 = *(_QWORD *)&v75[15];
  v78[7] = *(_OWORD *)&v77[80];
  v78[8] = *(_OWORD *)&v77[96];
  v78[9] = *(_OWORD *)&v77[112];
  v78[10] = *(_OWORD *)&v77[128];
  v78[3] = *(_OWORD *)&v77[16];
  v78[4] = *(_OWORD *)&v77[32];
  v78[5] = *(_OWORD *)&v77[48];
  v78[6] = *(_OWORD *)&v77[64];
  v78[1] = (unint64_t)v46;
  v78[2] = *(_OWORD *)v77;
  *(_QWORD *)&v78[0] = v43;
  *((_QWORD *)&v78[0] + 1) = v45;
  v48 = static Alignment.center.getter(v47);
  _FrameLayout.init(width:height:alignment:)(&v65, *(_QWORD *)&v38, 0, *(_QWORD *)&v39, 0, v48, v49);
  v50 = v78[11];
  v51 = v63;
  *(_OWORD *)(v63 + 160) = v78[10];
  *(_OWORD *)(v51 + 176) = v50;
  *(_OWORD *)(v51 + 192) = v79;
  v52 = v78[7];
  *(_OWORD *)(v51 + 96) = v78[6];
  *(_OWORD *)(v51 + 112) = v52;
  v53 = v78[9];
  *(_OWORD *)(v51 + 128) = v78[8];
  *(_OWORD *)(v51 + 144) = v53;
  v54 = v78[3];
  *(_OWORD *)(v51 + 32) = v78[2];
  *(_OWORD *)(v51 + 48) = v54;
  v55 = v78[5];
  *(_OWORD *)(v51 + 64) = v78[4];
  *(_OWORD *)(v51 + 80) = v55;
  v56 = v78[1];
  *(_OWORD *)v51 = v78[0];
  *(_OWORD *)(v51 + 16) = v56;
  v57 = v66;
  *(_OWORD *)(v51 + 216) = v65;
  *(_QWORD *)(v51 + 208) = v80;
  *(_OWORD *)(v51 + 232) = v57;
  *(_OWORD *)(v51 + 248) = v67;
  sub_100024A50((uint64_t)v78);

  return sub_100024A78((uint64_t)&v76);
}

_QWORD *sub_10001B638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, CGFloat a6@<D0>, double a7@<D1>, double a8@<D2>)
{
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  CGAffineTransform *Translation;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  char v46;
  char v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v55;
  uint64_t v56;
  _QWORD v58[5];
  uint64_t v59;
  char v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[167];
  char v78;
  _QWORD v79[6];
  char v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  uint64_t v93;

  v14 = swift_bridgeObjectRetain(a1);
  v15 = Gradient.init(colors:)(v14);
  v16 = static UnitPoint.top.getter();
  v18 = v17;
  v19 = static UnitPoint.bottom.getter();
  LinearGradient.init(gradient:startPoint:endPoint:)(v58, v15, v16, v18, v19, v20);
  v21 = v58[0];
  v22 = v58[1];
  v23 = v58[2];
  v55 = v58[4];
  v56 = v58[3];
  v25 = a2 + *(int *)(type metadata accessor for ContentView(0, a3, a4, v24) + 44);
  v27 = v25 + *(int *)(type metadata accessor for ModelEntry(0, a3, a4, v26) + 36);
  v28 = type metadata accessor for ViewContext(0);
  v29 = a6 + a6 + *(double *)(v27 + *(int *)(v28 + 20));
  v30 = static Alignment.center.getter(v28);
  _FrameLayout.init(width:height:alignment:)(&v59, *(_QWORD *)&v29, 0, *(_QWORD *)&a7, 0, v30, v31);
  v32 = v59;
  v33 = v60;
  v34 = v61;
  v35 = v62;
  v36 = v63;
  v37 = v64;
  Translation = CGAffineTransformMakeTranslation((CGAffineTransform *)v77, a6, 0.0);
  v39 = *(_QWORD *)v77;
  v40 = *(_QWORD *)&v77[8];
  v42 = *(_QWORD *)&v77[16];
  v41 = *(_QWORD *)&v77[24];
  v43 = *(_QWORD *)&v77[32];
  v44 = *(_QWORD *)&v77[40];
  v66 = v33;
  v65 = v35;
  v45 = static UnitPoint.topLeading.getter(Translation);
  v46 = v66;
  v47 = v65;
  *(_QWORD *)&v67 = v21;
  *((_QWORD *)&v67 + 1) = v22;
  *(_QWORD *)&v68 = v23;
  *((_QWORD *)&v68 + 1) = v56;
  *(_QWORD *)&v69 = v55;
  *((_QWORD *)&v69 + 1) = v32;
  LOBYTE(v70) = v66;
  *((_QWORD *)&v70 + 1) = v34;
  LOBYTE(v71) = v65;
  *((_QWORD *)&v71 + 1) = v36;
  *(_QWORD *)&v72 = v37;
  *((_QWORD *)&v72 + 1) = v39;
  *(_QWORD *)&v73 = v40;
  *((_QWORD *)&v73 + 1) = v42;
  *(_QWORD *)&v74 = v41;
  *((_QWORD *)&v74 + 1) = v43;
  *(_QWORD *)&v75 = v44;
  *((double *)&v75 + 1) = a8;
  *(double *)&v76 = v45;
  *((_QWORD *)&v76 + 1) = v48;
  v78 = 1;
  *(_OWORD *)&v77[87] = v72;
  *(_OWORD *)&v77[71] = v71;
  *(_OWORD *)&v77[55] = v70;
  *(_OWORD *)&v77[39] = v69;
  *(_OWORD *)&v77[151] = v76;
  *(_OWORD *)&v77[135] = v75;
  *(_OWORD *)&v77[119] = v74;
  *(_OWORD *)&v77[103] = v73;
  *(_OWORD *)&v77[23] = v68;
  *(_OWORD *)&v77[7] = v67;
  *(_QWORD *)a5 = 0;
  *(_BYTE *)(a5 + 8) = 1;
  v49 = *(_OWORD *)&v77[96];
  *(_OWORD *)(a5 + 121) = *(_OWORD *)&v77[112];
  v50 = *(_OWORD *)&v77[144];
  *(_OWORD *)(a5 + 137) = *(_OWORD *)&v77[128];
  *(_OWORD *)(a5 + 153) = v50;
  *(_QWORD *)(a5 + 168) = *(_QWORD *)&v77[159];
  v51 = *(_OWORD *)&v77[32];
  *(_OWORD *)(a5 + 57) = *(_OWORD *)&v77[48];
  v52 = *(_OWORD *)&v77[80];
  *(_OWORD *)(a5 + 73) = *(_OWORD *)&v77[64];
  *(_OWORD *)(a5 + 89) = v52;
  *(_OWORD *)(a5 + 105) = v49;
  v53 = *(_OWORD *)&v77[16];
  *(_OWORD *)(a5 + 9) = *(_OWORD *)v77;
  *(_OWORD *)(a5 + 25) = v53;
  *(_OWORD *)(a5 + 41) = v51;
  v79[0] = v21;
  v79[1] = v22;
  v79[2] = v23;
  v79[3] = v56;
  v79[4] = v55;
  v79[5] = v32;
  v80 = v46;
  v81 = v34;
  v82 = v47;
  v83 = v36;
  v84 = v37;
  v85 = v39;
  v86 = v40;
  v87 = v42;
  v88 = v41;
  v89 = v43;
  v90 = v44;
  v91 = a8;
  v92 = v45;
  v93 = v48;
  sub_100024AA0(&v67);
  return sub_100024AC8(v79);
}

void sub_10001B8EC(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  char v21;
  char *v22;
  uint64_t v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;

  v33 = a2;
  v4 = type metadata accessor for ColorScheme(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v31 - v9;
  v34 = v2;
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  type metadata accessor for ModelEntry(0, v11, v12, v13);
  v14 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 136);
  v32 = v11;
  v15 = v14(v11, v12);
  if (v17 == 0xFF)
  {
    v22 = 0;
  }
  else
  {
    v18 = (void *)v15;
    v19 = v16;
    v20 = v17;
    v21 = v17 & 1;
    sub_100007A74((uint64_t)v10);
    v22 = (char *)sub_10000C08C((uint64_t)v10, v18, v19, v21);
    sub_100013884(v18, v19, v20);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  v23 = v34;
  sub_100007A74((uint64_t)v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, enum case for ColorScheme.dark(_:), v4);
  v24 = static ColorScheme.== infix(_:_:)(v10, v8);
  v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v8, v4);
  v26 = ((uint64_t (*)(char *, uint64_t))v25)(v10, v4);
  v27 = static Alignment.center.getter(v26);
  v28 = v33;
  *v33 = v27;
  v28[1] = v29;
  v30 = sub_100004A10(&qword_100056808);
  sub_10001BAC0(v22, v23, v24 & 1, v32, v12, (uint64_t)v28 + *(int *)(v30 + 44));

}

uint64_t sub_10001BAC0@<X0>(char *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  _BYTE *v29;
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
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;
  void *v82;
  _BYTE *v83;
  _BYTE *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  _BYTE *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  void *v108;
  _BYTE *v109;
  _BYTE *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _BYTE *v117;
  uint64_t v118;
  uint64_t v119;
  _BYTE *v120;
  uint64_t v121;
  uint64_t v122;
  _BYTE *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v130;
  char v131;
  uint64_t v132;
  _BYTE *v133;
  uint64_t v134;
  char v135;
  void (*v136)(_BYTE *, _BYTE *);
  char v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _BYTE *v144;
  uint64_t v145;
  double v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _BYTE *v151;
  _BYTE *v152;
  uint64_t v153;
  _BYTE *v154;
  void (*v155)(_BYTE *, uint64_t);
  uint64_t v156;
  double v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char v162;
  _BYTE *v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  _BYTE *v170;
  _OWORD *v171;
  __int128 v172;
  _BYTE *v173;
  uint64_t v174;
  _BYTE *v175;
  uint64_t *v176;
  _BYTE *v177;
  _BYTE *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  _BYTE *v182;
  unint64_t v183;
  uint64_t v184;
  uint64_t v185;
  _QWORD *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  _BYTE *v196;
  uint64_t v197;
  _BYTE *v198;
  void (*v199)(_BYTE *, uint64_t);
  _BYTE *v200;
  uint64_t v201;
  unsigned int *v202;
  uint64_t v203;
  _BYTE *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  char *v209;
  _BYTE *v210;
  _BYTE *v211;
  unint64_t v212;
  uint64_t v213;
  _BYTE v214[4];
  int v215;
  _BYTE *v216;
  _BYTE *v217;
  uint64_t v218;
  uint64_t v219;
  _BYTE *v220;
  _BYTE *v221;
  uint64_t v222;
  _BYTE *v223;
  uint64_t v224;
  _BYTE *v225;
  uint64_t v226;
  _BYTE *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  _BYTE *v231;
  uint64_t v232;
  _BYTE *v233;
  _BYTE *v234;
  _BYTE *v235;
  uint64_t v236;
  _BYTE *v237;
  _BYTE *v238;
  uint64_t v239;
  _BYTE *v240;
  _BYTE *v241;
  _BYTE *v242;
  uint64_t v243;
  uint64_t v244;
  _BYTE *v245;
  _BYTE *v246;
  uint64_t v247;
  uint64_t v248;
  char *v249;
  uint64_t (*v250)(uint64_t, uint64_t);
  _BYTE *v251;
  _BYTE *v252;
  uint64_t v253;
  uint64_t v254;
  _BYTE *v255;
  uint64_t v256;
  _BYTE *v257;
  _BYTE *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  char *v267;
  _BYTE v268[264];
  _OWORD v269[17];

  v215 = a3;
  v266 = a2;
  v267 = a1;
  v263 = a6;
  v8 = type metadata accessor for _BlendModeEffect(0);
  __chkstk_darwin(v8);
  v220 = &v214[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for BlendMode(0);
  v218 = *(_QWORD *)(v10 - 8);
  v219 = v10;
  __chkstk_darwin(v10);
  v217 = &v214[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v262 = sub_100004A10(&qword_100056810);
  v12 = __chkstk_darwin(v262);
  v216 = &v214[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  v221 = &v214[-v14];
  v239 = type metadata accessor for WidgetRenderingMode(0);
  v236 = *(_QWORD *)(v239 - 8);
  v15 = __chkstk_darwin(v239);
  v237 = &v214[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  v238 = &v214[-v17];
  v18 = sub_100004A10(&qword_100056650);
  __chkstk_darwin(v18);
  v225 = &v214[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v224 = type metadata accessor for Image.ResizingMode(0);
  v222 = *(_QWORD *)(v224 - 8);
  __chkstk_darwin(v224);
  v223 = &v214[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = sub_100004A10(&qword_100056658);
  v228 = *(_QWORD *)(v21 - 8);
  v229 = v21;
  __chkstk_darwin(v21);
  v227 = &v214[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v226 = sub_100004A10(&qword_1000566F8);
  __chkstk_darwin(v226);
  v231 = &v214[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v230 = sub_100004A10(&qword_100056818);
  __chkstk_darwin(v230);
  v235 = &v214[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v232 = sub_100004A10(&qword_100056820);
  __chkstk_darwin(v232);
  v234 = &v214[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v256 = sub_100004A10(&qword_100056828);
  v26 = __chkstk_darwin(v256);
  v233 = &v214[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v26);
  v29 = &v214[-v28];
  v260 = sub_100004A10(&qword_100056830);
  __chkstk_darwin(v260);
  v258 = &v214[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v253 = sub_100004A10(&qword_100056838);
  __chkstk_darwin(v253);
  v255 = &v214[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v254 = sub_100004A10(&qword_100056840);
  __chkstk_darwin(v254);
  v252 = &v214[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v261 = sub_100004A10(&qword_100056848);
  __chkstk_darwin(v261);
  v257 = &v214[-((v33 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v248 = sub_100004A10(&qword_100056850);
  __chkstk_darwin(v248);
  v249 = &v214[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v35 = type metadata accessor for _ForegroundLayerLevel(0);
  __chkstk_darwin(v35);
  v240 = &v214[-((v36 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v37 = type metadata accessor for _ForegroundLayerLevelViewModifier(0);
  v243 = *(_QWORD *)(v37 - 8);
  v244 = v37;
  __chkstk_darwin(v37);
  v242 = &v214[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v247 = sub_100004A10(&qword_100056858);
  v39 = __chkstk_darwin(v247);
  v241 = &v214[-((v40 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v39);
  v245 = &v214[-v41];
  v42 = (_BYTE *)type metadata accessor for WidgetFamily(0);
  v259 = *((_QWORD *)v42 - 1);
  v43 = __chkstk_darwin(v42);
  v45 = &v214[-((v44 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v43);
  v47 = &v214[-v46];
  v48 = sub_100004A10(&qword_100056860);
  v49 = __chkstk_darwin(v48);
  v246 = &v214[-((v50 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v49);
  v250 = &v214[-v51];
  v52 = (int *)type metadata accessor for MapView(0);
  v53 = __chkstk_darwin(v52);
  v55 = &v214[-((v54 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v53);
  v251 = &v214[-v56];
  v265 = a4;
  v57 = a5;
  v59 = type metadata accessor for ContentView(0, a4, a5, v58);
  v60 = *(_QWORD *)(v59 - 8);
  v61 = __chkstk_darwin(v59);
  v64 = &v214[-v63];
  v264 = v61;
  if (!v267)
  {
    v251 = v42;
    v252 = v29;
    v248 = (uint64_t)v47;
    v96 = v265;
    v95 = v266;
    v97 = (char *)(v266 + *(int *)(v61 + 44));
    v98 = v61;
    v99 = type metadata accessor for ModelEntry(0, v265, v57, v62);
    v100 = *(int *)(v99 + 40);
    v267 = v97;
    v101 = &v97[v100];
    v102 = *(_BYTE **)(v57 + 144);
    v249 = v101;
    v250 = v102;
    LOBYTE(v101) = ((uint64_t (*)(uint64_t, uint64_t))v102)(v96, v57);
    v103 = v95;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v60 + 16))(v64, v95, v98);
    if ((v101 & 1) != 0)
    {
      (*(void (**)(_BYTE *, uint64_t))(v60 + 8))(v64, v264);
      v104 = v57;
      v105 = v259;
      v106 = v267;
      v107 = v99;
    }
    else
    {
      v130 = v264;
      v131 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 152))(v265, v57);
      (*(void (**)(_BYTE *, uint64_t))(v60 + 8))(v64, v130);
      v104 = v57;
      v105 = v259;
      v106 = v267;
      v107 = v99;
      if ((v131 & 1) == 0)
      {
        v186 = (_QWORD *)(v103 + *(int *)(v264 + 52));
        if ((v215 & 1) != 0)
          ++v186;
        v187 = *v186;
        swift_retain(*v186);
        v188 = *(int *)(v107 + 36);
        v189 = type metadata accessor for ViewContext(0);
        v190 = &v106[v188 + *(int *)(v189 + 20)];
        v191 = *(_QWORD *)v190;
        v192 = *((_QWORD *)v190 + 1);
        v193 = static Alignment.center.getter(v189);
        _FrameLayout.init(width:height:alignment:)(v269, v191, 0, v192, 0, v193, v194);
        v267 = *(char **)&v269[0];
        LODWORD(v265) = BYTE8(v269[0]);
        v259 = *(_QWORD *)&v269[1];
        LODWORD(v257) = BYTE8(v269[1]);
        v195 = *((_QWORD *)&v269[2] + 1);
        v256 = *(_QWORD *)&v269[2];
        swift_retain(v187);
        v196 = v238;
        v197 = sub_100007A48((uint64_t)v238);
        v198 = v237;
        static WidgetRenderingMode.accented.getter(v197);
        LOBYTE(v191) = static WidgetRenderingMode.== infix(_:_:)(v196, v198);
        v199 = *(void (**)(_QWORD, _QWORD))(v236 + 8);
        v200 = v198;
        v201 = v239;
        v199(v200, v239);
        v199(v196, v201);
        v202 = (unsigned int *)&enum case for BlendMode.destinationOut(_:);
        if ((v191 & 1) == 0)
          v202 = (unsigned int *)&enum case for BlendMode.normal(_:);
        v204 = v217;
        v203 = v218;
        v205 = v219;
        (*(void (**)(_BYTE *, _QWORD, uint64_t))(v218 + 104))(v217, *v202, v219);
        v206 = (uint64_t)v220;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v203 + 16))(v220, v204, v205);
        v207 = v262;
        v208 = (uint64_t)v216;
        sub_10000BD24(v206, (uint64_t)&v216[*(int *)(v262 + 36)], (uint64_t (*)(_QWORD))&type metadata accessor for _BlendModeEffect);
        v209 = v267;
        *(_QWORD *)v208 = v187;
        *(_QWORD *)(v208 + 8) = v209;
        *(_BYTE *)(v208 + 16) = v265;
        *(_QWORD *)(v208 + 24) = v259;
        *(_BYTE *)(v208 + 32) = (_BYTE)v257;
        *(_QWORD *)(v208 + 40) = v256;
        *(_QWORD *)(v208 + 48) = v195;
        swift_retain(v187);
        sub_10000BD68(v206, (uint64_t (*)(_QWORD))&type metadata accessor for _BlendModeEffect);
        (*(void (**)(_BYTE *, uint64_t))(v203 + 8))(v204, v205);
        swift_release(v187);
        v176 = &qword_100056810;
        v210 = v221;
        sub_100017510(v208, (uint64_t)v221, &qword_100056810);
        v211 = v258;
        sub_100008CE0((uint64_t)v210, (uint64_t)v258, &qword_100056810);
        swift_storeEnumTagMultiPayload(v211, v260, 1);
        v212 = sub_100024770();
        v213 = sub_1000173D4(&qword_100056898, &qword_100056810, (void (*)(void))sub_1000248D4);
        _ConditionalContent<>.init(storage:)(v211, v261, v207, v212, v213);
        swift_release(v187);
        v185 = (uint64_t)v210;
        return sub_100008C08(v185, v176);
      }
    }
    v267 = &v106[*(int *)(v107 + 36)];
    v132 = v248;
    v133 = v251;
    (*(void (**)(uint64_t))(v105 + 16))(v248);
    (*(void (**)(_BYTE *, _QWORD, _BYTE *))(v105 + 104))(v45, enum case for WidgetFamily.systemMedium(_:), v133);
    v134 = sub_10002498C(&qword_1000568B0, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    v135 = dispatch thunk of static Equatable.== infix(_:_:)(v132, v45, v133, v134);
    v136 = *(void (**)(_QWORD, _QWORD))(v105 + 8);
    v136(v45, v133);
    v136(v132, v133);
    v137 = ((uint64_t (*)(uint64_t, uint64_t))v250)(v265, v104);
    v138 = 0xEC00000032657261;
    if ((v137 & 1) != 0)
      v138 = 0xEC00000031657261;
    v139 = 0x8000000100041B80;
    if ((v137 & 1) == 0)
      v139 = 0x8000000100041B60;
    if ((v135 & 1) != 0)
      v140 = 0xD000000000000011;
    else
      v140 = 0x75715370614D6F4ELL;
    if ((v135 & 1) != 0)
      v141 = v139;
    else
      v141 = v138;
    v142 = Image.init(_:bundle:)(v140, v141, 0);
    v143 = v222;
    v144 = v223;
    v145 = v224;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v222 + 104))(v223, enum case for Image.ResizingMode.stretch(_:), v224);
    v146 = 0.0;
    v147 = Image.resizable(capInsets:resizingMode:)(v144, v142, 0.0, 0.0, 0.0, 0.0);
    swift_release(v142);
    v148 = (*(uint64_t (**)(_BYTE *, uint64_t))(v143 + 8))(v144, v145);
    v149 = (uint64_t)v225;
    static WidgetAccentedRenderingMode.fullColor.getter(v148);
    v150 = type metadata accessor for WidgetAccentedRenderingMode(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v150 - 8) + 56))(v149, 0, 1, v150);
    v151 = v227;
    Image.widgetAccentedRenderingMode(_:)(v149, v147);
    swift_release(v147);
    sub_100008C08(v149, &qword_100056650);
    v152 = v238;
    v153 = sub_100007A48((uint64_t)v238);
    v154 = v237;
    static WidgetRenderingMode.accented.getter(v153);
    LOBYTE(v147) = static WidgetRenderingMode.== infix(_:_:)(v152, v154);
    v155 = *(void (**)(_QWORD, _QWORD))(v236 + 8);
    v156 = v239;
    v155(v154, v239);
    v155(v152, v156);
    if ((v147 & 1) != 0)
      v157 = 1.0;
    else
      v157 = 0.0;
    v159 = v228;
    v158 = v229;
    v160 = (uint64_t)v231;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v228 + 16))(v231, v151, v229);
    *(double *)(v160 + *(int *)(v226 + 36)) = v157;
    (*(void (**)(_BYTE *, uint64_t))(v159 + 8))(v151, v158);
    v161 = sub_100007A48((uint64_t)v152);
    static WidgetRenderingMode.accented.getter(v161);
    v162 = static WidgetRenderingMode.== infix(_:_:)(v152, v154);
    v155(v154, v156);
    v155(v152, v156);
    if ((v162 & 1) != 0)
      v146 = -0.1;
    v163 = v235;
    sub_100008CE0(v160, (uint64_t)v235, &qword_1000566F8);
    *(double *)&v163[*(int *)(v230 + 36)] = v146;
    sub_100008C08(v160, &qword_1000566F8);
    v164 = type metadata accessor for ViewContext(0);
    v165 = &v267[*(int *)(v164 + 20)];
    v166 = *(_QWORD *)v165;
    v167 = *((_QWORD *)v165 + 1);
    v168 = static Alignment.center.getter(v164);
    _FrameLayout.init(width:height:alignment:)(v269, v166, 0, v167, 0, v168, v169);
    v170 = v234;
    sub_100008CE0((uint64_t)v163, (uint64_t)v234, &qword_100056818);
    v171 = &v170[*(int *)(v232 + 36)];
    v172 = v269[1];
    *v171 = v269[0];
    v171[1] = v172;
    v171[2] = v269[2];
    sub_100008C08((uint64_t)v163, &qword_100056818);
    v173 = v233;
    sub_100008CE0((uint64_t)v170, (uint64_t)v233, &qword_100056820);
    v174 = v256;
    v175 = &v173[*(int *)(v256 + 36)];
    *(_QWORD *)v175 = 0;
    *((_WORD *)v175 + 4) = 257;
    sub_100008C08((uint64_t)v170, &qword_100056820);
    v176 = &qword_100056828;
    v177 = v252;
    sub_100017510((uint64_t)v173, (uint64_t)v252, &qword_100056828);
    v178 = v255;
    sub_100008CE0((uint64_t)v177, (uint64_t)v255, &qword_100056828);
    swift_storeEnumTagMultiPayload(v178, v253, 1);
    v179 = sub_100008D24(&qword_100056870, &qword_100056840, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v180 = sub_1000173D4(&qword_100056878, &qword_100056828, (void (*)(void))sub_100024814);
    v181 = (uint64_t)v257;
    _ConditionalContent<>.init(storage:)(v178, v254, v174, v179, v180);
    v182 = v258;
    sub_100008CE0(v181, (uint64_t)v258, &qword_100056848);
    swift_storeEnumTagMultiPayload(v182, v260, 0);
    v183 = sub_100024770();
    v184 = sub_1000173D4(&qword_100056898, &qword_100056810, (void (*)(void))sub_1000248D4);
    _ConditionalContent<>.init(storage:)(v182, v261, v262, v183, v184);
    sub_100008C08(v181, &qword_100056848);
    v185 = (uint64_t)v177;
    return sub_100008C08(v185, v176);
  }
  v65 = v266 + *(int *)(v61 + 44);
  v66 = v65 + *(int *)(type metadata accessor for ModelEntry(0, v265, v57, v62) + 36);
  v67 = (uint64_t *)(v66 + *(int *)(type metadata accessor for ViewContext(0) + 20));
  v68 = *v67;
  v69 = v67[1];
  *v55 = swift_getKeyPath(&unk_100043280);
  v70 = sub_100004A10(&qword_100055E28);
  swift_storeEnumTagMultiPayload(v55, v70, 0);
  v71 = (_QWORD *)((char *)v55 + v52[5]);
  *v71 = swift_getKeyPath(&unk_1000432B0);
  v72 = sub_100004A10(&qword_100055E30);
  swift_storeEnumTagMultiPayload(v71, v72, 0);
  v73 = v267;
  *(_QWORD *)((char *)v55 + v52[6]) = v267;
  v74 = (char *)v55 + v52[7];
  *(_QWORD *)v74 = v68;
  *((_QWORD *)v74 + 1) = v69;
  v74[16] = 0;
  *(_QWORD *)((char *)v55 + v52[8]) = 0x3FF0000000000000;
  v75 = v251;
  sub_100024948((uint64_t)v55, (uint64_t)v251);
  v76 = v259;
  (*(void (**)(_BYTE *, _QWORD, _BYTE *))(v259 + 104))(v47, enum case for WidgetFamily.systemSmall(_:), v42);
  v77 = sub_10002498C((unint64_t *)&qword_100056218, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  v78 = v73;
  dispatch thunk of RawRepresentable.rawValue.getter(v269, v42, v77);
  dispatch thunk of RawRepresentable.rawValue.getter(v268, v42, v77);
  v79 = *(_QWORD *)&v269[0];
  v80 = *(_QWORD *)v268;
  (*(void (**)(_BYTE *, _BYTE *))(v76 + 8))(v47, v42);
  v81 = v75;
  if (v79 == v80)
  {
    sub_10001AA44(v264, v268);
    v82 = memcpy(v269, v268, 0x108uLL);
    v83 = v240;
    static _ForegroundLayerLevel.secondary.getter(v82);
    v84 = v242;
    _ForegroundLayerLevelViewModifier.init(level:)(v83);
    v85 = v247;
    v86 = v241;
    v88 = v243;
    v87 = v244;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v243 + 16))(&v241[*(int *)(v247 + 36)], v84, v244);
    memcpy(v86, v269, 0x108uLL);
    (*(void (**)(_BYTE *, uint64_t))(v88 + 8))(v84, v87);
    v89 = (uint64_t)v86;
    v90 = v245;
    sub_100017510(v89, (uint64_t)v245, &qword_100056858);
    v91 = v249;
    sub_100008CE0((uint64_t)v90, (uint64_t)v249, &qword_100056858);
    v92 = v91;
    v93 = v248;
    v94 = 0;
  }
  else
  {
    sub_10001B094(v264, (uint64_t)v268);
    v108 = memcpy(v269, v268, 0x108uLL);
    v109 = v240;
    static _ForegroundLayerLevel.secondary.getter(v108);
    v110 = v242;
    _ForegroundLayerLevelViewModifier.init(level:)(v109);
    v85 = v247;
    v111 = v241;
    v113 = v243;
    v112 = v244;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v243 + 16))(&v241[*(int *)(v247 + 36)], v110, v244);
    memcpy(v111, v269, 0x108uLL);
    (*(void (**)(_BYTE *, uint64_t))(v113 + 8))(v110, v112);
    v114 = (uint64_t)v111;
    v90 = v245;
    sub_100017510(v114, (uint64_t)v245, &qword_100056858);
    v91 = v249;
    sub_100008CE0((uint64_t)v90, (uint64_t)v249, &qword_100056858);
    v92 = v91;
    v93 = v248;
    v94 = 1;
  }
  swift_storeEnumTagMultiPayload(v92, v93, v94);
  v115 = sub_1000173D4(&qword_1000568B8, &qword_100056858, (void (*)(void))sub_1000249CC);
  v116 = (uint64_t)v250;
  _ConditionalContent<>.init(storage:)(v91, v85, v85, v115, v115);
  sub_100008C08((uint64_t)v90, &qword_100056858);
  v117 = v258;
  v118 = v253;
  v119 = (uint64_t)v246;
  sub_10000BD24((uint64_t)v75, (uint64_t)v55, type metadata accessor for MapView);
  sub_100008CE0(v116, v119, &qword_100056860);
  v120 = v252;
  sub_10000BD24((uint64_t)v55, (uint64_t)v252, type metadata accessor for MapView);
  v121 = sub_100004A10(&qword_1000568E0);
  sub_100008CE0(v119, (uint64_t)&v120[*(int *)(v121 + 48)], &qword_100056860);
  sub_100008C08(v119, &qword_100056860);
  sub_10000BD68((uint64_t)v55, type metadata accessor for MapView);
  v122 = (uint64_t)v81;
  v123 = v255;
  sub_100008CE0((uint64_t)v120, (uint64_t)v255, &qword_100056840);
  swift_storeEnumTagMultiPayload(v123, v118, 0);
  v124 = sub_100008D24(&qword_100056870, &qword_100056840, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v125 = sub_1000173D4(&qword_100056878, &qword_100056828, (void (*)(void))sub_100024814);
  v126 = (uint64_t)v257;
  _ConditionalContent<>.init(storage:)(v123, v254, v256, v124, v125);
  sub_100008C08((uint64_t)v120, &qword_100056840);
  sub_100008CE0(v126, (uint64_t)v117, &qword_100056848);
  swift_storeEnumTagMultiPayload(v117, v260, 0);
  v127 = sub_100024770();
  v128 = sub_1000173D4(&qword_100056898, &qword_100056810, (void (*)(void))sub_1000248D4);
  _ConditionalContent<>.init(storage:)(v117, v261, v262, v127, v128);
  sub_100008C08(v126, &qword_100056848);
  sub_100008C08(v116, &qword_100056860);
  return sub_10000BD68(v122, type metadata accessor for MapView);
}

uint64_t sub_10001CE68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  double v32;
  double v33;
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
  double v44;
  double v45;
  double *v46;
  uint64_t v48;
  uint64_t v49;

  v49 = a2;
  v4 = (int *)type metadata accessor for BadgeView(0);
  __chkstk_darwin(v4);
  v7 = (uint64_t *)((char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_100055AF0 != -1)
    swift_once(&qword_100055AF0, sub_10002CBD4);
  v8 = *(double *)&xmmword_1000590A0;
  v9 = v2 + *(int *)(a1 + 44);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = type metadata accessor for ModelEntry(0, v10, v11, v5);
  v48 = v2;
  v13 = *(int *)(v12 + 36);
  v14 = *(double *)(v9 + *(int *)(type metadata accessor for ViewContext(0) + 20) + v13 + 8);
  v15 = *((double *)&xmmword_1000590A0 + 1);
  v16 = *(double *)&xmmword_1000590B0;
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 112))(v10, v11);
  v19 = v18;
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 120))(v10, v11);
  LOBYTE(v9) = v21;
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 128))(v10, v11);
  v24 = v23;
  LOBYTE(v11) = v25;
  *v7 = swift_getKeyPath(&unk_100043280);
  v26 = sub_100004A10(&qword_100055E28);
  swift_storeEnumTagMultiPayload(v7, v26, 0);
  v27 = (_QWORD *)((char *)v7 + v4[5]);
  *v27 = v17;
  v27[1] = v19;
  v28 = (char *)v7 + v4[6];
  *(_QWORD *)v28 = v20;
  v28[8] = v9 & 1;
  v29 = (char *)v7 + v4[7];
  *(_QWORD *)v29 = v22;
  *((_QWORD *)v29 + 1) = v24;
  v29[16] = v11 & 1;
  v30 = v4[8];
  if (qword_100055AC0 != -1)
    swift_once(&qword_100055AC0, sub_1000050AC);
  v31 = (char *)v7 + v30;
  v32 = v8 * v14;
  if (v15 < v8 * v14)
    v32 = v15;
  v33 = (v16 + v32) * 0.5;
  v34 = qword_100058FE0;
  v35 = qword_100058FE8;
  v36 = qword_100058FF0;
  v37 = qword_100058FF8;
  v38 = qword_100059010;
  v39 = qword_100059018;
  v40 = qword_100059020;
  v41 = qword_100059038;
  *(_OWORD *)v31 = xmmword_100058FD0;
  *((_QWORD *)v31 + 2) = v34;
  *((_QWORD *)v31 + 3) = v35;
  *((_QWORD *)v31 + 4) = v36;
  *((_QWORD *)v31 + 5) = v37;
  *((_OWORD *)v31 + 3) = xmmword_100059000;
  *((_QWORD *)v31 + 8) = v38;
  *((_QWORD *)v31 + 9) = v39;
  *((_QWORD *)v31 + 10) = v40;
  *(_OWORD *)(v31 + 88) = unk_100059028;
  *((_QWORD *)v31 + 13) = v41;
  v42 = v49;
  v43 = v48 + *(int *)(a1 + 52);
  v44 = v33 + *(double *)(v43 + 208);
  v45 = v33 + *(double *)(v43 + 216);
  sub_10000BD24((uint64_t)v7, v49, type metadata accessor for BadgeView);
  v46 = (double *)(v42 + *(int *)(sub_100004A10(&qword_100056C88) + 36));
  *v46 = v44;
  v46[1] = v45;
  swift_retain(v35);
  swift_retain(v36);
  swift_retain(v37);
  swift_retain(v39);
  swift_retain(v40);
  return sub_10000BD68((uint64_t)v7, type metadata accessor for BadgeView);
}

uint64_t sub_10001D138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t (**v15)(_QWORD, _QWORD);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  char v23;
  char v24;
  char v25;
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  char *v29;
  char v30;
  char v31;
  _QWORD *v32;
  void (*v33)(char *, uint64_t);
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  void *v40;
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
  _QWORD *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  void *v59;
  char *v60;
  uint64_t v61;
  char *v62;

  v58 = a2;
  v4 = sub_100004A10(&qword_100056C60);
  v5 = __chkstk_darwin(v4);
  v57 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 - 8);
  v8 = __chkstk_darwin(v5);
  v60 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v62 = (char *)&v53 - v10;
  v11 = type metadata accessor for ColorScheme(0);
  v54 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = v2;
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(uint64_t (***)(_QWORD, _QWORD))(a1 + 24);
  v56 = type metadata accessor for ModelEntry(0, v14, (uint64_t)v15, v16);
  v17 = v15[21](v14, v15);
  if (v19 == 0xFF)
  {
    v59 = 0;
  }
  else
  {
    v20 = (void *)v17;
    v21 = v18;
    v22 = v19;
    v53 = v7;
    v23 = v19 & 1;
    sub_100007A74((uint64_t)v13);
    v24 = v23;
    v7 = v53;
    v59 = sub_10000C08C((uint64_t)v13, v20, v21, v24);
    sub_100013884(v20, v21, v22);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v55);
  }
  v25 = v15[22](v14, v15);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v28 = v61;
  v27 = v62;
  v26(v62, v61, a1);
  v29 = v60;
  if ((v25 & 1) != 0)
  {
    v30 = 1;
  }
  else
  {
    v31 = v15[4](v14, v15);
    v27 = v62;
    v30 = v31 ^ 1;
  }
  v32 = v57;
  v33 = *(void (**)(char *, uint64_t))(v7 + 8);
  v33(v27, a1);
  v26(v29, v28, a1);
  if ((v30 & 1) != 0)
    v34 = 1;
  else
    v34 = v15[3](v14, v15);
  v35 = v58;
  v36 = ((uint64_t (*)(char *, uint64_t))v33)(v29, a1);
  *v32 = static Alignment.center.getter(v36);
  v32[1] = v37;
  v38 = sub_100004A10(&qword_100056C68);
  v39 = v34 & 1;
  v40 = v59;
  sub_10001D468(v28, v59, v39, v14, (uint64_t)v15, (uint64_t)v32 + *(int *)(v38 + 44));
  sub_10001A270(a1, v41, v42, v43);
  v45 = v44;
  sub_10001A270(a1, v46, v47, v48);
  v50 = v49;

  sub_100008CE0((uint64_t)v32, v35, &qword_100056C60);
  v51 = (_QWORD *)(v35 + *(int *)(sub_100004A10(&qword_100056908) + 36));
  *v51 = v45;
  v51[1] = v50;
  return sub_100008C08((uint64_t)v32, &qword_100056C60);
}

uint64_t sub_10001D468@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  void *v54;
  char *v55;
  uint64_t v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double *v93;
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
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  _QWORD *v114;
  void *v115;
  char *v116;
  uint64_t v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  double *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  double v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  double *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  int v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
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
  uint64_t v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  uint64_t v194;
  _OWORD v195[3];

  v164 = a3;
  v166 = a2;
  v176 = a6;
  v177 = sub_100004A10(&qword_100056C70);
  __chkstk_darwin(v177);
  v162 = (uint64_t)&v161 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v172 = sub_100004A10(&qword_100056C78);
  __chkstk_darwin(v172);
  v175 = (uint64_t)&v161 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v174 = sub_100004A10(&qword_100056C80);
  __chkstk_darwin(v174);
  v163 = (uint64_t)&v161 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100004A10(&qword_100056C88);
  __chkstk_darwin(v12);
  v169 = (uint64_t)&v161 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v168 = sub_100004A10(&qword_100056C90);
  v14 = __chkstk_darwin(v168);
  v171 = (uint64_t)&v161 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v173 = (uint64_t)&v161 - v16;
  v17 = (int *)type metadata accessor for AvatarView(0);
  __chkstk_darwin(v17);
  v19 = (uint64_t *)((char *)&v161 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v167 = sub_100004A10(&qword_100056C98);
  v20 = __chkstk_darwin(v167);
  v170 = (uint64_t)&v161 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v180 = (uint64_t)&v161 - v22;
  v23 = type metadata accessor for LocationCircle(0);
  __chkstk_darwin(v23);
  v25 = (uint64_t *)((char *)&v161 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = sub_100004A10(&qword_100056CA0);
  v27 = __chkstk_darwin(v26);
  v165 = (uint64_t)&v161 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v161 = (uint64_t)&v161 - v29;
  v178 = type metadata accessor for ContentView(0, a4, a5, v30);
  v179 = a1;
  v31 = a1 + *(int *)(v178 + 44);
  v33 = type metadata accessor for ModelEntry(0, a4, a5, v32);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a5 + 64))(a4, a5) & 1) != 0)
  {
    v34 = *(double *)(v179 + *(int *)(v178 + 52) + 224);
    v35 = (*(double (**)(uint64_t, uint64_t))(a5 + 160))(a4, a5);
    v36 = v35 + v35;
    if (v34 > v36)
      v36 = v34;
    sub_10002E81C(v25, v36);
    v37 = *(int *)(v33 + 36);
    v38 = type metadata accessor for ViewContext(0);
    v39 = (uint64_t *)(v31 + v37 + *(int *)(v38 + 20));
    v40 = *v39;
    v41 = v39[1];
    v42 = static Alignment.center.getter(v38);
    _FrameLayout.init(width:height:alignment:)(v195, v40, 0, v41, 0, v42, v43);
    v44 = v165;
    sub_10000BD24((uint64_t)v25, v165, type metadata accessor for LocationCircle);
    v45 = (_OWORD *)(v44 + *(int *)(v26 + 36));
    v46 = v195[1];
    *v45 = v195[0];
    v45[1] = v46;
    v45[2] = v195[2];
    sub_10000BD68((uint64_t)v25, type metadata accessor for LocationCircle);
    v47 = v161;
    sub_100017510(v44, v161, &qword_100056CA0);
    v48 = *v39;
    v49 = v39[1];
    LOBYTE(v44) = v164 & 1;
    *v19 = swift_getKeyPath(&unk_100043280);
    v50 = sub_100004A10(&qword_100055E28);
    swift_storeEnumTagMultiPayload(v19, v50, 0);
    v51 = (_QWORD *)((char *)v19 + v17[5]);
    *v51 = swift_getKeyPath(&unk_1000432B0);
    v52 = sub_100004A10(&qword_100055E30);
    swift_storeEnumTagMultiPayload(v51, v52, 0);
    v53 = (_QWORD *)((char *)v19 + v17[6]);
    *v53 = v48;
    v53[1] = v49;
    v54 = v166;
    *(_QWORD *)((char *)v19 + v17[7]) = v166;
    *((_BYTE *)v19 + v17[8]) = v44;
    *((_BYTE *)v19 + v17[9]) = 1;
    v55 = (char *)v19 + v17[10];
    v56 = qword_100055AF0;
    v57 = v54;
    if (v56 != -1)
      swift_once(&qword_100055AF0, sub_10002CBD4);
    v58 = xmmword_100059130;
    v191 = xmmword_100059140;
    v192 = xmmword_100059150;
    v59 = xmmword_100059150;
    v193 = xmmword_100059160;
    v60 = xmmword_100059100;
    v61 = xmmword_1000590F0;
    v187 = xmmword_100059100;
    v188 = xmmword_100059110;
    v62 = xmmword_100059110;
    v63 = xmmword_100059120;
    v189 = xmmword_100059120;
    v190 = xmmword_100059130;
    v64 = xmmword_1000590C0;
    v65 = xmmword_1000590B0;
    v183 = xmmword_1000590C0;
    v184 = xmmword_1000590D0;
    v66 = xmmword_1000590D0;
    v67 = xmmword_1000590E0;
    v185 = xmmword_1000590E0;
    v186 = xmmword_1000590F0;
    v68 = xmmword_1000590A0;
    v181 = xmmword_1000590A0;
    v182 = xmmword_1000590B0;
    *((_OWORD *)v55 + 10) = xmmword_100059140;
    *((_OWORD *)v55 + 11) = v59;
    *((_OWORD *)v55 + 12) = xmmword_100059160;
    *((_OWORD *)v55 + 6) = v60;
    *((_OWORD *)v55 + 7) = v62;
    *((_OWORD *)v55 + 8) = v63;
    *((_OWORD *)v55 + 9) = v58;
    *((_OWORD *)v55 + 2) = v64;
    *((_OWORD *)v55 + 3) = v66;
    *((_OWORD *)v55 + 4) = v67;
    *((_OWORD *)v55 + 5) = v61;
    v194 = qword_100059170;
    *((_QWORD *)v55 + 26) = qword_100059170;
    *(_OWORD *)v55 = v68;
    *((_OWORD *)v55 + 1) = v65;
    sub_100026338(&v181);
    v69 = v178;
    v73 = sub_10001A338(v178, v70, v71, v72);
    sub_10001A338(v69, v74, v75, v76);
    v78 = v77;
    v79 = v170;
    sub_10000BD24((uint64_t)v19, v170, type metadata accessor for AvatarView);
    v80 = (double *)(v79 + *(int *)(v167 + 36));
    *v80 = v73;
    *((_QWORD *)v80 + 1) = v78;
    sub_10000BD68((uint64_t)v19, type metadata accessor for AvatarView);
    v81 = v180;
    sub_100017510(v79, v180, &qword_100056C98);
    v82 = v169;
    sub_10001CE68(v69, v169);
    v86 = sub_10001A338(v69, v83, v84, v85);
    sub_10001A338(v69, v87, v88, v89);
    v91 = v90;
    v92 = v171;
    sub_100008CE0(v82, v171, &qword_100056C88);
    v93 = (double *)(v92 + *(int *)(v168 + 36));
    *v93 = v86;
    *((_QWORD *)v93 + 1) = v91;
    sub_100008C08(v82, &qword_100056C88);
    v94 = v173;
    sub_100017510(v92, v173, &qword_100056C90);
    v95 = v165;
    sub_100008CE0(v47, v165, &qword_100056CA0);
    v96 = v81;
    v97 = v47;
    sub_100008CE0(v96, v79, &qword_100056C98);
    sub_100008CE0(v94, v92, &qword_100056C90);
    v98 = v163;
    sub_100008CE0(v95, v163, &qword_100056CA0);
    v99 = sub_100004A10(&qword_100056CC0);
    sub_100008CE0(v79, v98 + *(int *)(v99 + 48), &qword_100056C98);
    sub_100008CE0(v92, v98 + *(int *)(v99 + 64), &qword_100056C90);
    sub_100008C08(v92, &qword_100056C90);
    sub_100008C08(v79, &qword_100056C98);
    sub_100008C08(v95, &qword_100056CA0);
    v100 = v175;
    sub_100008CE0(v98, v175, &qword_100056C80);
    swift_storeEnumTagMultiPayload(v100, v172, 0);
    v101 = sub_100008D24(&qword_100056CB0, &qword_100056C80, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v102 = sub_100008D24(&qword_100056CB8, &qword_100056C70, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    _ConditionalContent<>.init(storage:)(v100, v174, v177, v101, v102);
    sub_100008C08(v98, &qword_100056C80);
    sub_100008C08(v94, &qword_100056C90);
    sub_100008C08(v180, &qword_100056C98);
    v103 = v97;
    v104 = &qword_100056CA0;
  }
  else
  {
    v105 = v178;
    v106 = *(int *)(v33 + 36);
    v107 = (uint64_t *)(v31 + v106 + *(int *)(type metadata accessor for ViewContext(0) + 20));
    v108 = *v107;
    v109 = v107[1];
    v110 = v164 & 1;
    *v19 = swift_getKeyPath(&unk_100043280);
    v111 = sub_100004A10(&qword_100055E28);
    swift_storeEnumTagMultiPayload(v19, v111, 0);
    v112 = (_QWORD *)((char *)v19 + v17[5]);
    *v112 = swift_getKeyPath(&unk_1000432B0);
    v113 = sub_100004A10(&qword_100055E30);
    swift_storeEnumTagMultiPayload(v112, v113, 0);
    v114 = (_QWORD *)((char *)v19 + v17[6]);
    *v114 = v108;
    v114[1] = v109;
    v115 = v166;
    *(_QWORD *)((char *)v19 + v17[7]) = v166;
    *((_BYTE *)v19 + v17[8]) = v110;
    *((_BYTE *)v19 + v17[9]) = 0;
    v116 = (char *)v19 + v17[10];
    v117 = qword_100055AF0;
    v118 = v115;
    if (v117 != -1)
      swift_once(&qword_100055AF0, sub_10002CBD4);
    v119 = xmmword_100059130;
    v191 = xmmword_100059140;
    v192 = xmmword_100059150;
    v120 = xmmword_100059150;
    v193 = xmmword_100059160;
    v121 = xmmword_100059100;
    v122 = xmmword_1000590F0;
    v187 = xmmword_100059100;
    v188 = xmmword_100059110;
    v123 = xmmword_100059110;
    v124 = xmmword_100059120;
    v189 = xmmword_100059120;
    v190 = xmmword_100059130;
    v125 = xmmword_1000590C0;
    v126 = xmmword_1000590B0;
    v183 = xmmword_1000590C0;
    v184 = xmmword_1000590D0;
    v127 = xmmword_1000590D0;
    v128 = xmmword_1000590E0;
    v185 = xmmword_1000590E0;
    v186 = xmmword_1000590F0;
    v129 = xmmword_1000590A0;
    v181 = xmmword_1000590A0;
    v182 = xmmword_1000590B0;
    *((_OWORD *)v116 + 10) = xmmword_100059140;
    *((_OWORD *)v116 + 11) = v120;
    *((_OWORD *)v116 + 12) = xmmword_100059160;
    *((_OWORD *)v116 + 6) = v121;
    *((_OWORD *)v116 + 7) = v123;
    *((_OWORD *)v116 + 8) = v124;
    *((_OWORD *)v116 + 9) = v119;
    *((_OWORD *)v116 + 2) = v125;
    *((_OWORD *)v116 + 3) = v127;
    *((_OWORD *)v116 + 4) = v128;
    *((_OWORD *)v116 + 5) = v122;
    v194 = qword_100059170;
    *((_QWORD *)v116 + 26) = qword_100059170;
    *(_OWORD *)v116 = v129;
    *((_OWORD *)v116 + 1) = v126;
    sub_100026338(&v181);
    v133 = sub_10001A338(v105, v130, v131, v132);
    sub_10001A338(v105, v134, v135, v136);
    v138 = v137;
    v139 = v170;
    sub_10000BD24((uint64_t)v19, v170, type metadata accessor for AvatarView);
    v140 = (double *)(v139 + *(int *)(v167 + 36));
    *v140 = v133;
    *((_QWORD *)v140 + 1) = v138;
    sub_10000BD68((uint64_t)v19, type metadata accessor for AvatarView);
    v141 = v180;
    sub_100017510(v139, v180, &qword_100056C98);
    v142 = v169;
    sub_10001CE68(v105, v169);
    v146 = sub_10001A338(v105, v143, v144, v145);
    sub_10001A338(v105, v147, v148, v149);
    v151 = v150;
    v152 = v171;
    sub_100008CE0(v142, v171, &qword_100056C88);
    v153 = (double *)(v152 + *(int *)(v168 + 36));
    *v153 = v146;
    *((_QWORD *)v153 + 1) = v151;
    sub_100008C08(v142, &qword_100056C88);
    v154 = v173;
    sub_100017510(v152, v173, &qword_100056C90);
    sub_100008CE0(v141, v139, &qword_100056C98);
    sub_100008CE0(v154, v152, &qword_100056C90);
    v155 = v162;
    sub_100008CE0(v139, v162, &qword_100056C98);
    v156 = sub_100004A10(&qword_100056CA8);
    sub_100008CE0(v152, v155 + *(int *)(v156 + 48), &qword_100056C90);
    sub_100008C08(v152, &qword_100056C90);
    sub_100008C08(v139, &qword_100056C98);
    v157 = v175;
    sub_100008CE0(v155, v175, &qword_100056C70);
    swift_storeEnumTagMultiPayload(v157, v172, 1);
    v158 = sub_100008D24(&qword_100056CB0, &qword_100056C80, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v159 = sub_100008D24(&qword_100056CB8, &qword_100056C70, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    _ConditionalContent<>.init(storage:)(v157, v174, v177, v158, v159);
    sub_100008C08(v155, &qword_100056C70);
    sub_100008C08(v154, &qword_100056C90);
    v103 = v141;
    v104 = &qword_100056C98;
  }
  return sub_100008C08(v103, v104);
}

uint64_t sub_10001DF98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  Swift::String v11;
  Swift::String v12;
  void *object;
  Swift::String v14;
  Swift::Bool v15;
  id v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int16 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD v47[5];
  uint64_t v48;
  __int16 v49;
  _QWORD v50[3];
  Swift::String v51;
  Swift::String v52;

  v43 = a1;
  v3 = type metadata accessor for Text.DateStyle.UnitsConfiguration.Style(0);
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Text.DateStyle.UnitsConfiguration(0);
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)objc_opt_self(NSBundle);
  v10 = objc_msgSend(v9, "mainBundle");
  v51._object = (void *)0xE000000000000000;
  v11._countAndFlagsBits = 0x6F6741656D6954;
  v11._object = (void *)0xE700000000000000;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  v51._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v10, v12, v51)._object;

  v14._countAndFlagsBits = 1076113701;
  v14._object = (void *)0xE400000000000000;
  v15 = String.hasPrefix(_:)(v14);
  v16 = objc_msgSend(v9, "mainBundle", swift_bridgeObjectRelease(object).n128_f64[0]);
  v52._object = (void *)0xE000000000000000;
  v17._countAndFlagsBits = 0x6F6741656D6954;
  v17._object = (void *)0xE700000000000000;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v52._countAndFlagsBits = 0;
  v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v52);

  v47[0] = v19;
  v50[0] = 1076113701;
  v50[1] = 0xE400000000000000;
  v20 = sub_100024AF0();
  v21 = StringProtocol.components<A>(separatedBy:)(v50, &type metadata for String, &type metadata for String, v20, v20);
  swift_bridgeObjectRelease(v19._object);
  v22 = *(_QWORD *)(v21 + 16);
  if (!v15)
  {
    if (v22)
    {
      v24 = (uint64_t *)(v21 + 32);
      v25 = (_QWORD *)(v21 + 40);
      goto LABEL_6;
    }
LABEL_7:
    v26 = 0;
    v27 = (void *)0xE000000000000000;
    goto LABEL_8;
  }
  if (!v22)
    goto LABEL_7;
  v23 = v21 + 16 * v22;
  v24 = (uint64_t *)(v23 + 16);
  v25 = (_QWORD *)(v23 + 24);
LABEL_6:
  v26 = *v24;
  v27 = (void *)*v25;
  swift_bridgeObjectRetain(*v25);
LABEL_8:
  v28 = swift_bridgeObjectRelease(v21);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v41 + 104))(v5, enum case for Text.DateStyle.UnitsConfiguration.Style.brief(_:), v42, v28);
  v29 = Text.DateStyle.UnitsConfiguration.init(units:style:)(96, v5);
  v30 = static Alignment.center.getter(v29);
  v32 = v31;
  sub_10001E26C(v44, v15, (uint64_t)v8, v26, v27, *(_QWORD *)(v43 + 16), *(_QWORD *)(v43 + 24), v47);
  swift_bridgeObjectRelease(v27);
  v33 = v48;
  v34 = v49;
  v35 = v47[0];
  v36 = v47[1];
  v37 = v47[2];
  v38 = v47[3];
  v39 = v47[4];
  *(_QWORD *)a2 = v30;
  *(_QWORD *)(a2 + 8) = v32;
  *(_OWORD *)(a2 + 16) = v35;
  *(_OWORD *)(a2 + 32) = v36;
  *(_OWORD *)(a2 + 48) = v37;
  *(_OWORD *)(a2 + 64) = v38;
  *(_OWORD *)(a2 + 80) = v39;
  *(_QWORD *)(a2 + 96) = v33;
  *(_WORD *)(a2 + 104) = v34;
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v8, v46);
}

uint64_t sub_10001E26C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t (*v45)(char *, uint64_t);
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  void (*v69)(char *, uint64_t);
  char *v70;
  uint64_t v71;
  void *v72;
  char **v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  Swift::String v77;
  char *v78;
  Swift::String v79;
  Swift::String v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  void (*v97)(char *, uint64_t);
  char *v98;
  uint64_t v99;
  void *v100;
  char **v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  __n128 v106;
  Swift::String v107;
  char *v108;
  Swift::String v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  char v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t KeyPath;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  void (*v131)(char *, uint64_t);
  char *v132;
  uint64_t v133;
  void *v134;
  char **v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  __int16 v142;
  _QWORD *v143;
  char *v144;
  void (*v145)(char *, uint64_t, __n128);
  uint64_t v146;
  int v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  Swift::String v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  _QWORD *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint64_t v165;
  unsigned __int8 v166;
  __int128 v167;
  __int128 v168;
  _OWORD v169[2];
  __int128 v170;
  uint64_t v171;
  __int16 v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  __int128 v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unsigned __int8 v183;
  char v184;

  v151._countAndFlagsBits = a4;
  v151._object = a5;
  v148 = a3;
  v147 = a2;
  v159 = a8;
  v152 = type metadata accessor for Text.DateStyle(0);
  v150 = *(_QWORD *)(v152 - 8);
  __chkstk_darwin(v152);
  v149 = (char *)&v144 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringKey.StringInterpolation(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v144 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v158 = type metadata accessor for WidgetRenderingMode(0);
  v156 = *(_QWORD *)(v158 - 8);
  v15 = __chkstk_darwin(v158);
  v155 = (char *)&v144 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v157 = (uint64_t)&v144 - v17;
  v18 = sub_100004A10(&qword_1000562A8);
  __chkstk_darwin(v18);
  v20 = (char *)&v144 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for Date(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v144 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v27 = (char *)&v144 - v26;
  v153 = type metadata accessor for ContentView(0, a6, a7, v28);
  v154 = a1;
  type metadata accessor for ModelEntry(0, a6, a7, v29);
  (*(void (**)(uint64_t, uint64_t))(a7 + 88))(a6, a7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_100008C08((uint64_t)v20, &qword_1000562A8);
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    result = 0;
    v41 = -256;
    goto LABEL_19;
  }
  v42 = (*(uint64_t (**)(char *, char *, uint64_t))(v22 + 32))(v27, v20, v21);
  v43 = Date.init()(v42);
  v44 = Date.timeIntervalSinceReferenceDate.getter(v43);
  v45 = *(uint64_t (**)(char *, uint64_t))(v22 + 8);
  v46 = v45(v25, v21);
  v47 = Date.timeIntervalSinceReferenceDate.getter(v46);
  v145 = (void (*)(char *, uint64_t, __n128))v45;
  v146 = v21;
  v144 = v27;
  if (v44 - v47 >= 60.0)
  {
    LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 2);
    v77._countAndFlagsBits = 0;
    v77._object = (void *)0xE000000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v77);
    if ((v147 & 1) == 0)
    {
      LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v151);
      v107._countAndFlagsBits = 0;
      v107._object = (void *)0xE000000000000000;
      LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v107);
      v108 = v149;
      static Text.DateStyle.relative(unitConfiguration:)(v148);
      LocalizedStringKey.StringInterpolation.appendInterpolation(_:style:)(v27, v108);
      (*(void (**)(char *, uint64_t))(v150 + 8))(v108, v152);
      v109._countAndFlagsBits = 0;
      v109._object = (void *)0xE000000000000000;
      LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v109);
      v110 = LocalizedStringKey.init(stringInterpolation:)(v14);
      v111 = Text.init(_:tableName:bundle:comment:)(v110);
      v113 = v112;
      v115 = v114;
      v117 = v116 & 1;
      v118 = static Font.caption2.getter();
      v152 = Text.font(_:)(v118, v111, v113, v117, v115);
      v120 = v119;
      v122 = v121;
      v124 = v123;
      swift_release(v118);
      v125 = v122 & 1;
      sub_100008074(v111, v113, v117);
      swift_bridgeObjectRelease(v115);
      KeyPath = swift_getKeyPath(&unk_100043370);
      v127 = swift_getKeyPath(&unk_1000433A0);
      v128 = v157;
      v129 = sub_100007A48(v157);
      v130 = v155;
      static WidgetRenderingMode.accented.getter(v129);
      LOBYTE(v111) = static WidgetRenderingMode.== infix(_:_:)(v128, v130);
      v131 = *(void (**)(char *, uint64_t))(v156 + 8);
      v132 = v130;
      v133 = v158;
      v131(v132, v158);
      v131((char *)v128, v133);
      v134 = (void *)objc_opt_self(UIColor);
      v135 = &selRef_labelColor;
      if ((v111 & 1) == 0)
        v135 = &selRef_secondaryLabelColor;
      v136 = Color.init(_:)(objc_msgSend(v134, *v135, v144, v145, v146));
      v137 = swift_getKeyPath(&unk_100043340);
      *(_QWORD *)&v167 = v152;
      *((_QWORD *)&v167 + 1) = v120;
      *(_QWORD *)&v168 = v125;
      *((_QWORD *)&v168 + 1) = v124;
      *(_OWORD *)((char *)v169 + 8) = xmmword_100043490;
      *(_QWORD *)&v169[0] = KeyPath;
      *((_QWORD *)&v169[1] + 1) = v127;
      *(_QWORD *)&v170 = 0x3FE0000000000000;
      *((_QWORD *)&v170 + 1) = v137;
      v171 = v136;
      v172 = 256;
      v138 = sub_100004A10(&qword_100056C50);
      v139 = sub_100004A10(&qword_100056BE8);
      v140 = sub_1000260F0();
      v141 = sub_100025714();
      _ConditionalContent<>.init(storage:)(&v167, v138, v139, v140, v141);
      goto LABEL_15;
    }
    v78 = v149;
    static Text.DateStyle.relative(unitConfiguration:)(v148);
    LocalizedStringKey.StringInterpolation.appendInterpolation(_:style:)(v27, v78);
    (*(void (**)(char *, uint64_t))(v150 + 8))(v78, v152);
    v79._countAndFlagsBits = 0;
    v79._object = (void *)0xE000000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v79);
    LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v151);
    v80._countAndFlagsBits = 0;
    v80._object = (void *)0xE000000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v80);
    v81 = LocalizedStringKey.init(stringInterpolation:)(v14);
    v82 = Text.init(_:tableName:bundle:comment:)(v81);
    v84 = v83;
    v86 = v85;
    v88 = v87 & 1;
    v89 = static Font.caption2.getter();
    v57 = (void *)Text.font(_:)(v89, v82, v84, v88, v86);
    v152 = v90;
    v92 = v91;
    v62 = v93;
    swift_release(v89);
    v63 = v92 & 1;
    sub_100008074(v82, v84, v88);
    swift_bridgeObjectRelease(v86);
    v64 = swift_getKeyPath(&unk_100043370);
    v65 = swift_getKeyPath(&unk_1000433A0);
    v94 = v157;
    v95 = sub_100007A48(v157);
    v96 = v155;
    static WidgetRenderingMode.accented.getter(v95);
    LOBYTE(v82) = static WidgetRenderingMode.== infix(_:_:)(v94, v96);
    v97 = *(void (**)(char *, uint64_t))(v156 + 8);
    v98 = v96;
    v99 = v158;
    v97(v98, v158);
    v97((char *)v94, v99);
    v100 = (void *)objc_opt_self(UIColor);
    v101 = &selRef_labelColor;
    if ((v82 & 1) == 0)
      v101 = &selRef_secondaryLabelColor;
    v74 = Color.init(_:)(objc_msgSend(v100, *v101, v144, v145, v146));
    v75 = swift_getKeyPath(&unk_100043340);
    v151._object = v57;
    v76 = v152;
    v173 = v57;
    v174 = v152;
    v175 = v63;
    v176 = v62;
    v178 = xmmword_100043490;
    v177 = v64;
    v179 = v65;
    v180 = 0x3FE0000000000000;
    v181 = v75;
    v182 = v74;
    v183 = 1;
  }
  else
  {
    v48 = LocalizedStringKey.init(stringLiteral:)(0x73656D6954776F4ELL, 0xEC000000706D6174);
    v49 = Text.init(_:tableName:bundle:comment:)(v48);
    v51 = v50;
    v53 = v52;
    v55 = v54 & 1;
    v56 = static Font.caption2.getter();
    v57 = (void *)Text.font(_:)(v56, v49, v51, v55, v53);
    v152 = v58;
    v60 = v59;
    v62 = v61;
    swift_release(v56);
    v63 = v60 & 1;
    sub_100008074(v49, v51, v55);
    swift_bridgeObjectRelease(v53);
    v64 = swift_getKeyPath(&unk_100043370);
    v65 = swift_getKeyPath(&unk_1000433A0);
    v66 = v157;
    v67 = sub_100007A48(v157);
    v68 = v155;
    static WidgetRenderingMode.accented.getter(v67);
    LOBYTE(v49) = static WidgetRenderingMode.== infix(_:_:)(v66, v68);
    v69 = *(void (**)(char *, uint64_t))(v156 + 8);
    v70 = v68;
    v71 = v158;
    v69(v70, v158);
    v69((char *)v66, v71);
    v72 = (void *)objc_opt_self(UIColor);
    v73 = &selRef_labelColor;
    if ((v49 & 1) == 0)
      v73 = &selRef_secondaryLabelColor;
    v74 = Color.init(_:)(objc_msgSend(v72, *v73, v144, v145, v146));
    v75 = swift_getKeyPath(&unk_100043340);
    v151._object = v57;
    v76 = v152;
    v173 = v57;
    v174 = v152;
    v175 = v63;
    v176 = v62;
    v178 = xmmword_100043490;
    v177 = v64;
    v179 = v65;
    v180 = 0x3FE0000000000000;
    v181 = v75;
    v182 = v74;
    v183 = 0;
  }
  sub_1000259E8((uint64_t)v57, v76, v63);
  swift_bridgeObjectRetain(v62);
  swift_retain(v64);
  swift_retain(v65);
  swift_retain(v75);
  swift_retain(v74);
  v102 = sub_100004A10(&qword_100056BE8);
  v103 = sub_100025714();
  _ConditionalContent<>.init(storage:)(&v173, v102, v102, v103, v103);
  v167 = v160;
  v168 = v161;
  v169[0] = v162;
  v169[1] = v163;
  v170 = v164;
  v171 = v165;
  v172 = v166;
  v104 = sub_100004A10(&qword_100056C50);
  v105 = sub_1000260F0();
  _ConditionalContent<>.init(storage:)(&v167, v104, v102, v105, v103);
  sub_100008074((uint64_t)v151._object, v152, v63);
  swift_release(v74);
  swift_release(v75);
  swift_release(v65);
  swift_release(v64);
  v106 = swift_bridgeObjectRelease(v62);
LABEL_15:
  v145(v144, v146, v106);
  v30 = v173;
  v31 = v174;
  v32 = v175;
  v33 = v176;
  v34 = v177;
  v36 = *((_QWORD *)&v178 + 1);
  v35 = v178;
  v37 = v179;
  v38 = v180;
  v39 = v181;
  result = v182;
  if (v184)
    v142 = 256;
  else
    v142 = 0;
  v41 = v142 | v183;
LABEL_19:
  v143 = v159;
  *v159 = v30;
  v143[1] = v31;
  v143[2] = v32;
  v143[3] = v33;
  v143[4] = v34;
  v143[5] = v35;
  v143[6] = v36;
  v143[7] = v37;
  v143[8] = v38;
  v143[9] = v39;
  v143[10] = result;
  *((_WORD *)v143 + 44) = v41;
  return result;
}

double sub_10001EC64@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double result;
  __int128 v24;
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[2];

  v3 = v2;
  v6 = type metadata accessor for LayoutDirection(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)v25 - v11;
  sub_100007CDC((uint64_t)v25 - v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, enum case for LayoutDirection.rightToLeft(_:), v6);
  v13 = static LayoutDirection.== infix(_:_:)(v12, v10);
  v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  v15 = ((uint64_t (*)(char *, uint64_t))v14)(v12, v6);
  v16 = static Alignment.center.getter(v15);
  v18 = v17;
  sub_10001EDC0(v3, v13 & 1, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v25);
  *(_QWORD *)a2 = v16;
  *(_QWORD *)(a2 + 8) = v18;
  v19 = v33;
  *(_OWORD *)(a2 + 144) = v32;
  *(_OWORD *)(a2 + 160) = v19;
  *(_OWORD *)(a2 + 176) = v34[0];
  *(_OWORD *)(a2 + 190) = *(_OWORD *)((char *)v34 + 14);
  v20 = v29;
  *(_OWORD *)(a2 + 80) = v28;
  *(_OWORD *)(a2 + 96) = v20;
  v21 = v31;
  *(_OWORD *)(a2 + 112) = v30;
  *(_OWORD *)(a2 + 128) = v21;
  v22 = v25[1];
  *(_OWORD *)(a2 + 16) = v25[0];
  *(_OWORD *)(a2 + 32) = v22;
  result = *(double *)&v26;
  v24 = v27;
  *(_OWORD *)(a2 + 48) = v26;
  *(_OWORD *)(a2 + 64) = v24;
  return result;
}

double sub_10001EDC0@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  __n128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _OWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  unsigned __int16 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  _BYTE *v82;
  void (*v83)(_BYTE *, uint64_t);
  _BYTE *v84;
  uint64_t v85;
  void *v86;
  char **v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  double result;
  __int128 v124;
  _BYTE v125[12];
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _BYTE *v130;
  _BYTE *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _OWORD *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _OWORD v146[2];
  _OWORD v147[10];
  _OWORD v148[2];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _OWORD v159[2];
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _OWORD v170[2];
  _BYTE v171[190];
  __int128 v172;
  __int128 v173;
  _OWORD v174[2];
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _OWORD v181[2];
  __int128 v182;
  _OWORD v183[12];

  LODWORD(v129) = a2;
  v135 = a5;
  v8 = type metadata accessor for WidgetRenderingMode(0);
  v132 = *(_QWORD *)(v8 - 8);
  v133 = v8;
  v9 = __chkstk_darwin(v8);
  v131 = &v125[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  v130 = &v125[-v11];
  v12 = sub_100004A10(&qword_1000562A8);
  v13 = __chkstk_darwin(v12);
  v15 = &v125[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = __chkstk_darwin(v13);
  v18 = &v125[-v17];
  __chkstk_darwin(v16);
  v20 = &v125[-v19];
  v22 = type metadata accessor for ContentView(0, a3, a4, v21);
  v134 = a1;
  type metadata accessor for ModelEntry(0, a3, a4, v23);
  v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 72))(a3, a4);
  if (!v25)
  {
LABEL_9:
    (*(void (**)(uint64_t, uint64_t, __n128))(a4 + 88))(a3, a4, v26);
    v42 = type metadata accessor for Date(0);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 48))(v15, 1, v42) == 1)
    {
      sub_100008C08((uint64_t)v15, &qword_1000562A8);
      v43 = LocalizedStringKey.init(stringLiteral:)(0, 0xE000000000000000);
      *(_QWORD *)&v172 = Text.init(_:tableName:bundle:comment:)(v43);
      *((_QWORD *)&v172 + 1) = v44;
      LOBYTE(v173) = v45 & 1;
      *((_QWORD *)&v173 + 1) = v46;
      sub_1000253A0((uint64_t)&v172);
      sub_100017510((uint64_t)&v172, (uint64_t)v171, &qword_100056B28);
      v47 = sub_100004A10(&qword_100056B30);
      v48 = sub_1000253AC();
      _ConditionalContent<>.init(storage:)(v171, v47, &type metadata for Text, v48, &protocol witness table for Text);
    }
    else
    {
      sub_100008C08((uint64_t)v15, &qword_1000562A8);
      sub_10001DF98(v22, (uint64_t)&v182);
      v133 = *((_QWORD *)&v183[0] + 1);
      v134 = *(_QWORD *)&v183[0];
      v49 = *((_QWORD *)&v183[1] + 1);
      v50 = v183[2];
      v51 = v183[3];
      v52 = v183[4];
      v53 = *(_QWORD *)&v183[5];
      v54 = WORD4(v183[5]);
      v160 = v182;
      v161 = v183[0];
      v162 = v183[1];
      v131 = (_BYTE *)*((_QWORD *)&v183[1] + 1);
      v132 = *(_QWORD *)&v183[1];
      v163 = v183[2];
      v129 = *(_QWORD *)&v183[4];
      v130 = *(_BYTE **)&v183[2];
      v164 = v183[3];
      v165 = v183[4];
      v127 = *(_QWORD *)&v183[5];
      v128 = *((_QWORD *)&v183[4] + 1);
      *(_QWORD *)&v166 = *(_QWORD *)&v183[5];
      WORD4(v166) = WORD4(v183[5]);
      v126 = WORD4(v183[5]);
      sub_1000258A0((uint64_t)&v160);
      sub_100017510((uint64_t)&v160, (uint64_t)&v182, &qword_100056C30);
      sub_1000258AC(v134, v133, v132, v49, v50, *((uint64_t *)&v50 + 1), v51, *((uint64_t *)&v51 + 1), v52, *((uint64_t *)&v52 + 1), v53, v54);
      v55 = sub_100004A10(&qword_100056B48);
      v56 = sub_100004A10(&qword_100056BD8);
      v57 = sub_100025450(&qword_100056B40, &qword_100056B48, (void (*)(void))sub_1000254C0, (void (*)(void))sub_100025690);
      v58 = sub_100008D24(&qword_100056BD0, &qword_100056BD8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
      _ConditionalContent<>.init(storage:)(&v182, v55, v56, v57, v58);
      v179 = v157;
      v180 = v158;
      v181[0] = v159[0];
      *(_OWORD *)((char *)v181 + 13) = *(_OWORD *)((char *)v159 + 13);
      v175 = v153;
      v176 = v154;
      v177 = v155;
      v178 = v156;
      v172 = v149;
      v173 = v150;
      v174[0] = v151;
      v174[1] = v152;
      sub_1000259F8((uint64_t)&v172);
      sub_100017510((uint64_t)&v172, (uint64_t)&v182, &qword_100056B28);
      v59 = sub_100004A10(&qword_100056B30);
      v60 = sub_1000253AC();
      _ConditionalContent<>.init(storage:)(&v182, v59, &type metadata for Text, v60, &protocol witness table for Text);
      sub_1000251AC(v134, v133, v132, (uint64_t)v131, (uint64_t)v130, *((uint64_t *)&v50 + 1), v51, *((uint64_t *)&v51 + 1), v129, v128, v127, v126);
      v183[7] = *(_OWORD *)&v171[128];
      v183[8] = *(_OWORD *)&v171[144];
      v183[9] = *(_OWORD *)&v171[160];
      *(_OWORD *)((char *)&v183[9] + 14) = *(_OWORD *)&v171[174];
      v183[3] = *(_OWORD *)&v171[64];
      v183[4] = *(_OWORD *)&v171[80];
      v183[5] = *(_OWORD *)&v171[96];
      v183[6] = *(_OWORD *)&v171[112];
      v182 = *(_OWORD *)v171;
      v183[0] = *(_OWORD *)&v171[16];
      v183[1] = *(_OWORD *)&v171[32];
      v183[2] = *(_OWORD *)&v171[48];
    }
    v41 = v135;
    goto LABEL_25;
  }
  v27 = v24;
  v28 = v25;
  v29 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0)
    v29 = v24 & 0xFFFFFFFFFFFFLL;
  if (!v29)
  {
    v26 = swift_bridgeObjectRelease(v25);
    goto LABEL_9;
  }
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 80))(a3, a4) & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 88))(a3, a4);
    v30 = type metadata accessor for Date(0);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48))(v20, 1, v30) == 1)
    {
      sub_100008C08((uint64_t)v20, &qword_1000562A8);
      v31 = Image.init(_internalSystemName:)(v27, v28);
      v32 = static Font.caption2.getter();
      KeyPath = swift_getKeyPath(&unk_1000433D0);
      v34 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
      v35 = Color.init(_:)(v34);
      v36 = swift_getKeyPath(&unk_100043340);
      *(_QWORD *)&v182 = v31;
      *((_QWORD *)&v182 + 1) = KeyPath;
      *(_QWORD *)&v183[0] = v32;
      *((_QWORD *)&v183[0] + 1) = v36;
      *(_QWORD *)&v183[1] = v35;
      sub_1000260C0((uint64_t)&v182);
      sub_100017510((uint64_t)&v182, (uint64_t)&v172, &qword_100056C40);
      v37 = sub_100004A10(&qword_100056B68);
      v38 = sub_100004A10(&qword_100056B98);
      v39 = sub_1000254E4();
      v40 = sub_1000255EC();
      _ConditionalContent<>.init(storage:)(&v172, v37, v38, v39, v40);
      v41 = v135;
    }
    else
    {
      sub_100008C08((uint64_t)v20, &qword_1000562A8);
      v41 = v135;
      if ((v129 & 1) != 0)
      {
        v95 = static VerticalAlignment.center.getter(v94);
        sub_10001FDC0(v27, v28, a3, a4, (uint64_t)&v149);
        swift_bridgeObjectRelease(v28);
        *(_OWORD *)&v171[71] = v153;
        *(_OWORD *)&v171[55] = v152;
        *(_OWORD *)&v171[119] = v156;
        *(_OWORD *)&v171[135] = v157;
        *(_OWORD *)&v171[151] = v158;
        v171[167] = v159[0];
        *(_OWORD *)&v171[87] = v154;
        *(_OWORD *)&v171[103] = v155;
        *(_OWORD *)&v171[7] = v149;
        *(_OWORD *)&v171[23] = v150;
        *(_OWORD *)&v171[39] = v151;
        *(_OWORD *)((char *)&v183[7] + 1) = *(_OWORD *)&v171[112];
        *(_OWORD *)((char *)&v183[8] + 1) = *(_OWORD *)&v171[128];
        *(_OWORD *)((char *)&v183[9] + 1) = *(_OWORD *)&v171[144];
        *(_OWORD *)((char *)&v183[3] + 1) = *(_OWORD *)&v171[48];
        *(_OWORD *)((char *)&v183[4] + 1) = *(_OWORD *)&v171[64];
        *(_OWORD *)((char *)&v183[5] + 1) = *(_OWORD *)&v171[80];
        *(_OWORD *)((char *)&v183[6] + 1) = *(_OWORD *)&v171[96];
        *(_OWORD *)((char *)v183 + 1) = *(_OWORD *)v171;
        *(_OWORD *)((char *)&v183[1] + 1) = *(_OWORD *)&v171[16];
        LOBYTE(v136) = 1;
        v182 = (unint64_t)v95;
        LOBYTE(v183[0]) = 1;
        *(_QWORD *)((char *)&v183[10] + 1) = *(_QWORD *)&v171[160];
        *(_OWORD *)((char *)&v183[2] + 1) = *(_OWORD *)&v171[32];
        sub_1000260E8((uint64_t)&v182);
      }
      else
      {
        v100 = static VerticalAlignment.center.getter(v94);
        sub_10001FFA0(v27, v28, a3, a4, (uint64_t)&v149);
        swift_bridgeObjectRelease(v28);
        *(_OWORD *)&v171[71] = v153;
        *(_OWORD *)&v171[55] = v152;
        *(_OWORD *)&v171[119] = v156;
        *(_OWORD *)&v171[135] = v157;
        *(_OWORD *)&v171[151] = v158;
        v171[167] = v159[0];
        *(_OWORD *)&v171[87] = v154;
        *(_OWORD *)&v171[103] = v155;
        *(_OWORD *)&v171[7] = v149;
        *(_OWORD *)&v171[23] = v150;
        *(_OWORD *)&v171[39] = v151;
        *(_OWORD *)((char *)&v183[7] + 1) = *(_OWORD *)&v171[112];
        *(_OWORD *)((char *)&v183[8] + 1) = *(_OWORD *)&v171[128];
        *(_OWORD *)((char *)&v183[9] + 1) = *(_OWORD *)&v171[144];
        *(_OWORD *)((char *)&v183[3] + 1) = *(_OWORD *)&v171[48];
        *(_OWORD *)((char *)&v183[4] + 1) = *(_OWORD *)&v171[64];
        *(_OWORD *)((char *)&v183[5] + 1) = *(_OWORD *)&v171[80];
        *(_OWORD *)((char *)&v183[6] + 1) = *(_OWORD *)&v171[96];
        *(_OWORD *)((char *)v183 + 1) = *(_OWORD *)v171;
        *(_OWORD *)((char *)&v183[1] + 1) = *(_OWORD *)&v171[16];
        LOBYTE(v136) = 1;
        v182 = (unint64_t)v100;
        LOBYTE(v183[0]) = 1;
        *(_QWORD *)((char *)&v183[10] + 1) = *(_QWORD *)&v171[160];
        *(_OWORD *)((char *)&v183[2] + 1) = *(_OWORD *)&v171[32];
        sub_1000260D0((uint64_t)&v182);
      }
      sub_100017510((uint64_t)&v182, (uint64_t)&v172, &qword_100056C48);
      v101 = sub_100004A10(&qword_100056BA8);
      v102 = sub_100004A10(&qword_100056BB8);
      v103 = sub_100008D24(&qword_100056BA0, &qword_100056BA8, (uint64_t)&protocol conformance descriptor for HStack<A>);
      v104 = sub_100008D24(&qword_100056BB0, &qword_100056BB8, (uint64_t)&protocol conformance descriptor for HStack<A>);
      _ConditionalContent<>.init(storage:)(&v172, v101, v102, v103, v104);
      v183[7] = v168;
      v183[8] = v169;
      v183[9] = v170[0];
      *(_OWORD *)((char *)&v183[9] + 10) = *(_OWORD *)((char *)v170 + 10);
      v183[3] = v164;
      v183[4] = v165;
      v183[5] = v166;
      v183[6] = v167;
      v182 = v160;
      v183[0] = v161;
      v183[1] = v162;
      v183[2] = v163;
      sub_1000260DC((uint64_t)&v182);
      sub_100017510((uint64_t)&v182, (uint64_t)&v172, &qword_100056C40);
      v105 = sub_100004A10(&qword_100056B68);
      v106 = sub_100004A10(&qword_100056B98);
      v107 = sub_1000254E4();
      v108 = sub_1000255EC();
      _ConditionalContent<>.init(storage:)(&v172, v105, v106, v107, v108);
    }
    v183[7] = *(_OWORD *)&v171[128];
    v183[8] = *(_OWORD *)&v171[144];
    v183[9] = *(_OWORD *)&v171[160];
    *(_OWORD *)((char *)&v183[9] + 11) = *(_OWORD *)&v171[171];
    v183[3] = *(_OWORD *)&v171[64];
    v183[4] = *(_OWORD *)&v171[80];
    v183[5] = *(_OWORD *)&v171[96];
    v183[6] = *(_OWORD *)&v171[112];
    v182 = *(_OWORD *)v171;
    v183[0] = *(_OWORD *)&v171[16];
    v183[1] = *(_OWORD *)&v171[32];
    v183[2] = *(_OWORD *)&v171[48];
    sub_1000260C8((uint64_t)&v182);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a4 + 88))(a3, a4);
    v61 = type metadata accessor for Date(0);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 48))(v18, 1, v61) == 1)
    {
      sub_100008C08((uint64_t)v18, &qword_1000562A8);
      *(_QWORD *)&v182 = v27;
      *((_QWORD *)&v182 + 1) = v28;
      v62 = sub_100024AF0();
      v63 = Text.init<A>(_:)(&v182, &type metadata for String, v62);
      v65 = v64;
      v67 = v66;
      v69 = v68 & 1;
      v70 = static Font.caption2.getter();
      v129 = Text.font(_:)(v70, v63, v65, v69, v67);
      v72 = v71;
      v74 = v73;
      v76 = v75;
      swift_release(v70);
      v77 = v74 & 1;
      sub_100008074(v63, v65, v69);
      swift_bridgeObjectRelease(v67);
      v78 = swift_getKeyPath(&unk_100043370);
      v79 = swift_getKeyPath(&unk_1000433A0);
      v80 = v130;
      v81 = sub_100007A48((uint64_t)v130);
      v82 = v131;
      static WidgetRenderingMode.accented.getter(v81);
      LOBYTE(v63) = static WidgetRenderingMode.== infix(_:_:)(v80, v82);
      v83 = *(void (**)(_BYTE *, uint64_t))(v132 + 8);
      v84 = v82;
      v85 = v133;
      v83(v84, v133);
      v83(v80, v85);
      v86 = (void *)objc_opt_self(UIColor);
      v87 = &selRef_labelColor;
      if ((v63 & 1) == 0)
        v87 = &selRef_secondaryLabelColor;
      v88 = Color.init(_:)(objc_msgSend(v86, *v87));
      v89 = swift_getKeyPath(&unk_100043340);
      *(_QWORD *)&v172 = v129;
      *((_QWORD *)&v172 + 1) = v72;
      *(_QWORD *)&v173 = v77;
      *((_QWORD *)&v173 + 1) = v76;
      *(_OWORD *)((char *)v174 + 8) = xmmword_100043490;
      *(_QWORD *)&v174[0] = v78;
      *((_QWORD *)&v174[1] + 1) = v79;
      *(_QWORD *)&v175 = 0x3FE0000000000000;
      *((_QWORD *)&v175 + 1) = v89;
      *(_QWORD *)&v177 = 0;
      v176 = (unint64_t)v88;
      WORD4(v177) = 0;
      BYTE10(v177) = 1;
      v90 = sub_100004A10(&qword_100056BD8);
      v91 = sub_100004A10(&qword_100056BE8);
      v92 = sub_100008D24(&qword_100056BD0, &qword_100056BD8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
      v93 = sub_100025714();
      _ConditionalContent<>.init(storage:)(&v172, v90, v91, v92, v93);
    }
    else
    {
      swift_bridgeObjectRelease(v28);
      sub_100008C08((uint64_t)v18, &qword_1000562A8);
      sub_10001DF98(v22, (uint64_t)&v182);
      v172 = v182;
      v173 = v183[0];
      v174[0] = v183[1];
      v174[1] = v183[2];
      v175 = v183[3];
      v176 = v183[4];
      *(_QWORD *)&v177 = *(_QWORD *)&v183[5];
      WORD4(v177) = WORD4(v183[5]);
      BYTE10(v177) = 0;
      v96 = sub_100004A10(&qword_100056BD8);
      v97 = sub_100004A10(&qword_100056BE8);
      v98 = sub_100008D24(&qword_100056BD0, &qword_100056BD8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
      v99 = sub_100025714();
      _ConditionalContent<>.init(storage:)(&v172, v96, v97, v98, v99);
    }
    v41 = v135;
    sub_100025AA8((uint64_t)&v182);
  }
  sub_100017510((uint64_t)&v182, (uint64_t)&v172, &qword_100056C38);
  v109 = sub_100004A10(&qword_100056B58);
  v110 = sub_100004A10(&qword_100056BC8);
  v111 = sub_1000254C0();
  v112 = sub_100025690();
  _ConditionalContent<>.init(storage:)(&v172, v109, v110, v111, v112);
  v157 = v147[8];
  v158 = v147[9];
  v159[0] = v148[0];
  *(_OWORD *)((char *)v159 + 12) = *(_OWORD *)((char *)v148 + 12);
  v153 = v147[4];
  v154 = v147[5];
  v155 = v147[6];
  v156 = v147[7];
  v149 = v147[0];
  v150 = v147[1];
  v151 = v147[2];
  v152 = v147[3];
  sub_100025AB4((uint64_t)&v149);
  sub_100017510((uint64_t)&v149, (uint64_t)&v182, &qword_100056C30);
  sub_100025F58((uint64_t)v147, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100025B5C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100025DAC);
  v113 = sub_100004A10(&qword_100056B48);
  v114 = sub_100004A10(&qword_100056BD8);
  v115 = sub_100025450(&qword_100056B40, &qword_100056B48, (void (*)(void))sub_1000254C0, (void (*)(void))sub_100025690);
  v116 = sub_100008D24(&qword_100056BD0, &qword_100056BD8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  _ConditionalContent<>.init(storage:)(&v182, v113, v114, v115, v116);
  v168 = v144;
  v169 = v145;
  v170[0] = v146[0];
  *(_OWORD *)((char *)v170 + 13) = *(_OWORD *)((char *)v146 + 13);
  v164 = v140;
  v165 = v141;
  v166 = v142;
  v167 = v143;
  v160 = v136;
  v161 = v137;
  v162 = v138;
  v163 = v139;
  v179 = v144;
  v180 = v145;
  v181[0] = v146[0];
  *(_OWORD *)((char *)v181 + 13) = *(_OWORD *)((char *)v146 + 13);
  v175 = v140;
  v176 = v141;
  v177 = v142;
  v178 = v143;
  v172 = v136;
  v173 = v137;
  v174[0] = v138;
  v174[1] = v139;
  sub_1000259F8((uint64_t)&v172);
  sub_100017510((uint64_t)&v172, (uint64_t)&v182, &qword_100056B28);
  sub_100025FE4((uint64_t)&v160, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100025B5C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100025DAC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000258AC);
  v117 = sub_100004A10(&qword_100056B30);
  v118 = sub_1000253AC();
  _ConditionalContent<>.init(storage:)(&v182, v117, &type metadata for Text, v118, &protocol witness table for Text);
  sub_100025F58((uint64_t)v147, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100024F60, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000252E8);
  sub_100025FE4((uint64_t)&v160, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100024F60, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000252E8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000251AC);
  v183[7] = *(_OWORD *)&v171[128];
  v183[8] = *(_OWORD *)&v171[144];
  v183[9] = *(_OWORD *)&v171[160];
  *(_OWORD *)((char *)&v183[9] + 14) = *(_OWORD *)&v171[174];
  v183[3] = *(_OWORD *)&v171[64];
  v183[4] = *(_OWORD *)&v171[80];
  v183[5] = *(_OWORD *)&v171[96];
  v183[6] = *(_OWORD *)&v171[112];
  v182 = *(_OWORD *)v171;
  v183[0] = *(_OWORD *)&v171[16];
  v183[1] = *(_OWORD *)&v171[32];
  v183[2] = *(_OWORD *)&v171[48];
LABEL_25:
  v119 = v183[8];
  v41[8] = v183[7];
  v41[9] = v119;
  v41[10] = v183[9];
  *(_OWORD *)((char *)v41 + 174) = *(_OWORD *)((char *)&v183[9] + 14);
  v120 = v183[4];
  v41[4] = v183[3];
  v41[5] = v120;
  v121 = v183[6];
  v41[6] = v183[5];
  v41[7] = v121;
  v122 = v183[0];
  *v41 = v182;
  v41[1] = v122;
  result = *(double *)&v183[1];
  v124 = v183[2];
  v41[2] = v183[1];
  v41[3] = v124;
  return result;
}

uint64_t sub_10001FDC0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int16 v29;
  _QWORD v30[13];
  unsigned __int16 v31;
  char v32;

  v8 = type metadata accessor for ContentView(0, a3, a4, a3);
  sub_10001DF98(v8, (uint64_t)v30);
  v27 = v30[1];
  v28 = v30[0];
  v25 = v30[3];
  v26 = v30[2];
  v9 = v30[5];
  v10 = v30[6];
  v11 = v30[7];
  v12 = v30[8];
  v13 = v30[9];
  v14 = v30[11];
  v23 = v30[10];
  v24 = v30[4];
  v15 = v30[12];
  v29 = v31;
  swift_bridgeObjectRetain(a2);
  v22 = Image.init(_internalSystemName:)(a1, a2);
  v21 = static Font.caption2.getter();
  KeyPath = swift_getKeyPath(&unk_1000433D0);
  v17 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
  v18 = Color.init(_:)(v17);
  v19 = swift_getKeyPath(&unk_100043340);
  v32 = 1;
  *(_DWORD *)(a5 + 106) = v30[0];
  *(_WORD *)(a5 + 110) = WORD2(v30[0]);
  *(_QWORD *)a5 = v28;
  *(_QWORD *)(a5 + 8) = v27;
  *(_QWORD *)(a5 + 16) = v26;
  *(_QWORD *)(a5 + 24) = v25;
  *(_QWORD *)(a5 + 32) = v24;
  *(_QWORD *)(a5 + 40) = v9;
  *(_QWORD *)(a5 + 48) = v10;
  *(_QWORD *)(a5 + 56) = v11;
  *(_QWORD *)(a5 + 64) = v12;
  *(_QWORD *)(a5 + 72) = v13;
  *(_QWORD *)(a5 + 80) = v23;
  *(_QWORD *)(a5 + 88) = v14;
  *(_QWORD *)(a5 + 96) = v15;
  *(_WORD *)(a5 + 104) = v29;
  *(_QWORD *)(a5 + 112) = v22;
  *(_QWORD *)(a5 + 120) = KeyPath;
  *(_QWORD *)(a5 + 128) = v21;
  *(_QWORD *)(a5 + 136) = v19;
  *(_QWORD *)(a5 + 144) = v18;
  *(_QWORD *)(a5 + 152) = 0;
  *(_BYTE *)(a5 + 160) = 1;
  sub_1000258AC(v26, v25, v24, v9, v10, v11, v12, v13, v23, v14, v15, v29);
  return sub_1000251AC(v26, v25, v24, v9, v10, v11, v12, v13, v23, v14, v15, v29);
}

uint64_t sub_10001FFA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t KeyPath;
  id v12;
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
  unsigned __int16 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  __int128 v41;
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
  unsigned __int16 v53;
  char v54;

  swift_bridgeObjectRetain(a2);
  v10 = Image.init(_internalSystemName:)(a1, a2);
  v40 = static Font.caption2.getter();
  KeyPath = swift_getKeyPath(&unk_1000433D0);
  v12 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
  v13 = Color.init(_:)(v12);
  v14 = swift_getKeyPath(&unk_100043340);
  v16 = type metadata accessor for ContentView(0, a3, a4, v15);
  sub_10001DF98(v16, (uint64_t)&v41);
  v17 = v42;
  v18 = v43;
  v37 = v43;
  v38 = v42;
  v19 = v44;
  v20 = v45;
  v39 = v44;
  v21 = v46;
  v22 = v47;
  v23 = v48;
  v24 = v49;
  v35 = v48;
  v36 = v46;
  v33 = v45;
  v34 = v49;
  v26 = v50;
  v25 = v51;
  v27 = v52;
  v28 = v53;
  v29 = v41;
  v54 = 1;
  *(_DWORD *)(a5 + 146) = v41;
  *(_WORD *)(a5 + 150) = WORD2(v41);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = KeyPath;
  *(_QWORD *)(a5 + 16) = v40;
  *(_QWORD *)(a5 + 24) = v14;
  *(_QWORD *)(a5 + 32) = v13;
  *(_OWORD *)(a5 + 40) = v29;
  *(_QWORD *)(a5 + 56) = v17;
  *(_QWORD *)(a5 + 64) = v18;
  *(_QWORD *)(a5 + 72) = v19;
  *(_QWORD *)(a5 + 80) = v20;
  *(_QWORD *)(a5 + 88) = v21;
  *(_QWORD *)(a5 + 96) = v22;
  *(_QWORD *)(a5 + 104) = v23;
  *(_QWORD *)(a5 + 112) = v24;
  *(_QWORD *)(a5 + 120) = v26;
  *(_QWORD *)(a5 + 128) = v25;
  v30 = v25;
  v32 = v25;
  *(_QWORD *)(a5 + 136) = v27;
  *(_WORD *)(a5 + 144) = v28;
  *(_QWORD *)(a5 + 152) = 0;
  *(_BYTE *)(a5 + 160) = 1;
  swift_retain(v10);
  swift_retain(KeyPath);
  swift_retain(v40);
  swift_retain(v14);
  swift_retain(v13);
  sub_1000258AC(v38, v37, v39, v33, v36, v22, v35, v34, v26, v30, v27, v28);
  sub_1000251AC(v38, v37, v39, v33, v36, v22, v35, v34, v26, v32, v27, v28);
  swift_release(v13);
  swift_release(v14);
  swift_release(v40);
  swift_release(KeyPath);
  return swift_release(v10);
}

double sub_1000201E0@<D0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __n128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double result;

  v5 = sub_10001A420(a1);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  type metadata accessor for ModelEntry(0, v6, v7, v8);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 72))(v6, v7);
  if (!v10)
    goto LABEL_6;
  v12 = v9;
  v13 = v10;
  v11 = swift_bridgeObjectRelease(v10);
  v14 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0)
    v14 = v12 & 0xFFFFFFFFFFFFLL;
  if (v14)
    v15 = 1;
  else
LABEL_6:
    v15 = 3;
  if (((*(uint64_t (**)(uint64_t, uint64_t, __n128))(v7 + 24))(v6, v7, v11) & 1) != 0)
    v16 = sub_10001A12C(*(_QWORD *)(v2 + *(int *)(a1 + 52) + 120), a1);
  else
    v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 96))(v6, v7);
  v18 = v16;
  v19 = v17;
  *a2 = static Alignment.center.getter(v16);
  a2[1] = v20;
  v21 = sub_100004A10(&qword_100056A20);
  sub_100020310(v18, v19, v15, v5 & 1, (uint64_t)a2 + *(int *)(v21 + 44));
  *(_QWORD *)&result = swift_bridgeObjectRelease(v19).n128_u64[0];
  return result;
}

uint64_t sub_100020310@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  int *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  NSString *v46;
  NSString *v47;
  uint64_t KeyPath;
  _BYTE *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  _BYTE v62[4];
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE *v70;
  _BYTE *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];

  v10 = sub_100004A10(&qword_100056A28);
  __chkstk_darwin(v10);
  v12 = &v62[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = (int *)type metadata accessor for SizeCategoryAwareMinimumScaleFactor(0);
  __chkstk_darwin(v13);
  v15 = &v62[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v74 = sub_100004A10(&qword_1000569D8);
  __chkstk_darwin(v74);
  v17 = &v62[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v75 = sub_100004A10(&qword_1000569E0);
  __chkstk_darwin(v75);
  v19 = &v62[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = sub_100004A10(&qword_1000569E8);
  v21 = __chkstk_darwin(v20);
  v22 = __chkstk_darwin(v21);
  v23 = __chkstk_darwin(v22);
  if (!a2)
    goto LABEL_6;
  v27 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v27 = a1 & 0xFFFFFFFFFFFFLL;
  if (v27)
  {
    v76[0] = a1;
    v76[1] = a2;
    v71 = &v62[-v24];
    v72 = v25;
    v68 = v26;
    v69 = v23;
    v28 = sub_100024AF0();
    swift_bridgeObjectRetain(a2);
    v29 = Text.init<A>(_:)(v76, &type metadata for String, v28);
    v31 = v30;
    v70 = v12;
    v33 = v32;
    v67 = a4;
    v35 = v34 & 1;
    v36 = static Font.footnote.getter();
    v73 = a5;
    v37 = v36;
    v38 = Font.bold()();
    v66 = a3;
    v39 = v38;
    swift_release(v37);
    v40 = Text.font(_:)(v39, v29, v31, v35, v33);
    v64 = v41;
    v65 = v42;
    v63 = v43;
    swift_release(v39);
    sub_100008074(v29, v31, v35);
    swift_bridgeObjectRelease(v33);
    *v15 = swift_getKeyPath(&unk_1000432E0);
    v44 = sub_100004A10(&qword_100056A00);
    swift_storeEnumTagMultiPayload(v15, v44, 0);
    *(_QWORD *)((char *)v15 + v13[5]) = UIFontTextStyleFootnote;
    *(_QWORD *)((char *)v15 + v13[6]) = UIFontTextStyleSubheadline;
    *(_QWORD *)((char *)v15 + v13[7]) = v66;
    sub_10000BD24((uint64_t)v15, (uint64_t)&v17[*(int *)(v74 + 36)], type metadata accessor for SizeCategoryAwareMinimumScaleFactor);
    v45 = v64;
    *(_QWORD *)v17 = v40;
    *((_QWORD *)v17 + 1) = v45;
    v17[16] = v63 & 1;
    *((_QWORD *)v17 + 3) = v65;
    v46 = UIFontTextStyleFootnote;
    v47 = UIFontTextStyleSubheadline;
    sub_10000BD68((uint64_t)v15, type metadata accessor for SizeCategoryAwareMinimumScaleFactor);
    LOBYTE(v31) = v67;
    LOBYTE(v33) = v67 & 1;
    KeyPath = swift_getKeyPath(&unk_100043310);
    sub_100008CE0((uint64_t)v17, (uint64_t)v19, &qword_1000569D8);
    v49 = &v19[*(int *)(v75 + 36)];
    *(_QWORD *)v49 = KeyPath;
    v49[8] = v33;
    sub_100008C08((uint64_t)v17, &qword_1000569D8);
    v50 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
    v51 = Color.init(_:)(v50);
    v52 = swift_getKeyPath(&unk_100043340);
    v53 = v68;
    sub_100008CE0((uint64_t)v19, v68, &qword_1000569E0);
    v54 = (uint64_t *)(v53 + *(int *)(v69 + 36));
    *v54 = v52;
    v54[1] = v51;
    sub_100008C08((uint64_t)v19, &qword_1000569E0);
    v55 = v71;
    sub_100017510(v53, (uint64_t)v71, &qword_1000569E8);
    v56 = v72;
    sub_100008CE0((uint64_t)v55, v72, &qword_1000569E8);
    v57 = (uint64_t)v70;
    sub_100008CE0(v56, (uint64_t)v70, &qword_1000569E8);
    v58 = v57 + *(int *)(sub_100004A10(&qword_100056A38) + 48);
    *(_QWORD *)v58 = 0;
    *(_BYTE *)(v58 + 8) = (v31 & 1) == 0;
    *(_BYTE *)(v58 + 9) = v33;
    sub_100008C08((uint64_t)v55, &qword_1000569E8);
    sub_100008C08(v56, &qword_1000569E8);
    v59 = sub_100004A10(&qword_100056A30);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v57, 0, 1, v59);
    return sub_100017510(v57, v73, &qword_100056A28);
  }
  else
  {
LABEL_6:
    v61 = sub_100004A10(&qword_100056A30);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(a5, 1, 1, v61);
  }
}

double sub_1000207F4@<D0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double result;

  v5 = sub_10001A420(a1);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  type metadata accessor for ModelEntry(0, v6, v7, v8);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7) & 1) != 0)
    v9 = sub_10001A12C(*(_QWORD *)(v2 + *(int *)(a1 + 52) + 128), a1);
  else
    v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 104))(v6, v7);
  v11 = v9;
  v12 = v10;
  *a2 = static Alignment.center.getter(v9);
  a2[1] = v13;
  v14 = sub_100004A10(&qword_1000569C8);
  sub_1000208D4(v11, v12, v5 & 1, (uint64_t)a2 + *(int *)(v14 + 44));
  *(_QWORD *)&result = swift_bridgeObjectRelease(v12).n128_u64[0];
  return result;
}

uint64_t sub_1000208D4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  char v43;
  uint64_t v44;
  char **v45;
  uint64_t v46;
  NSString *v47;
  uint64_t KeyPath;
  char *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[2];

  v8 = sub_100004A10(&qword_1000569D0);
  __chkstk_darwin(v8);
  v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for SizeCategoryAwareMinimumScaleFactor(0);
  __chkstk_darwin(v11);
  v13 = (_QWORD *)((char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v71 = sub_100004A10(&qword_1000569D8);
  __chkstk_darwin(v71);
  v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_100004A10(&qword_1000569E0);
  __chkstk_darwin(v72);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100004A10(&qword_1000569E8);
  v19 = __chkstk_darwin(v18);
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v61 - v21;
  v23 = __chkstk_darwin(v20);
  if (!a2)
    goto LABEL_12;
  v26 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v26 = a1 & 0xFFFFFFFFFFFFLL;
  if (v26)
  {
    v73[0] = a1;
    v73[1] = a2;
    v68 = (uint64_t)&v61 - v24;
    v69 = v25;
    v66 = v23;
    v27 = sub_100024AF0();
    swift_bridgeObjectRetain(a2);
    v28 = Text.init<A>(_:)(v73, &type metadata for String, v27);
    v30 = v29;
    v67 = v10;
    v32 = v31;
    v61 = a3;
    v34 = v33 & 1;
    v35 = static Font.caption2.getter();
    v70 = a4;
    v36 = v35;
    v37 = Text.font(_:)(v35, v28, v30, v34, v32);
    v63 = v38;
    v64 = v37;
    v62 = v39;
    v65 = v40;
    swift_release(v36);
    sub_100008074(v28, v30, v34);
    swift_bridgeObjectRelease(v32);
    *v13 = swift_getKeyPath(&unk_1000432E0);
    v41 = sub_100004A10(&qword_100056A00);
    swift_storeEnumTagMultiPayload(v13, v41, 0);
    v43 = v61 & 1;
    v42 = (v61 & 1) == 0;
    v44 = 4;
    *(_QWORD *)((char *)v13 + v11[5]) = UIFontTextStyleCaption2;
    *(_QWORD *)((char *)v13 + v11[6]) = UIFontTextStyleCaption2;
    if (v42)
      v44 = 1;
    *(_QWORD *)((char *)v13 + v11[7]) = v44;
    if (v42)
      v45 = &selRef_labelColor;
    else
      v45 = &selRef_secondaryLabelColor;
    sub_10000BD24((uint64_t)v13, (uint64_t)&v15[*(int *)(v71 + 36)], type metadata accessor for SizeCategoryAwareMinimumScaleFactor);
    v46 = v63;
    *(_QWORD *)v15 = v64;
    *((_QWORD *)v15 + 1) = v46;
    v15[16] = v62 & 1;
    *((_QWORD *)v15 + 3) = v65;
    v47 = UIFontTextStyleCaption2;
    sub_10000BD68((uint64_t)v13, type metadata accessor for SizeCategoryAwareMinimumScaleFactor);
    KeyPath = swift_getKeyPath(&unk_100043310);
    sub_100008CE0((uint64_t)v15, (uint64_t)v17, &qword_1000569D8);
    v49 = &v17[*(int *)(v72 + 36)];
    *(_QWORD *)v49 = KeyPath;
    v49[8] = v43;
    sub_100008C08((uint64_t)v15, &qword_1000569D8);
    v50 = objc_msgSend((id)objc_opt_self(UIColor), *v45);
    v51 = Color.init(_:)(v50);
    v52 = swift_getKeyPath(&unk_100043340);
    sub_100008CE0((uint64_t)v17, (uint64_t)v22, &qword_1000569E0);
    v53 = (uint64_t *)&v22[*(int *)(v66 + 36)];
    *v53 = v52;
    v53[1] = v51;
    sub_100008C08((uint64_t)v17, &qword_1000569E0);
    v54 = v68;
    sub_100017510((uint64_t)v22, v68, &qword_1000569E8);
    v55 = v69;
    sub_100008CE0(v54, v69, &qword_1000569E8);
    v56 = (uint64_t)v67;
    sub_100008CE0(v55, (uint64_t)v67, &qword_1000569E8);
    v57 = v56 + *(int *)(sub_100004A10(&qword_100056A08) + 48);
    *(_QWORD *)v57 = 0;
    *(_BYTE *)(v57 + 8) = 1;
    sub_100008C08(v54, &qword_1000569E8);
    sub_100008C08(v55, &qword_1000569E8);
    v58 = sub_100004A10(&qword_1000569F0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v56, 0, 1, v58);
    return sub_100017510(v56, v70, &qword_1000569D0);
  }
  else
  {
LABEL_12:
    v60 = sub_100004A10(&qword_1000569F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(a4, 1, 1, v60);
  }
}

double sub_100020D9C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double result;

  v4 = v3;
  v7 = v3 + *(int *)(a1 + 44);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = type metadata accessor for ModelEntry(0, v8, v9, a2);
  v11 = 0;
  v12 = 0;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9) & 1) != 0)
  {
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 200))(v8, v9);
    v12 = v13;
  }
  v14 = *(double *)(v3 + *(int *)(a1 + 52) + 16);
  v15 = *(int *)(v10 + 36);
  v16 = v14 * *(double *)(v7 + *(int *)(type metadata accessor for ViewContext(0) + 20) + v15 + 8);
  *(_QWORD *)a3 = static VerticalAlignment.center.getter();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v17 = sub_100004A10(&qword_100056A40);
  sub_100020EB4(v11, v12, v4, v8, v9, (_QWORD *)(a3 + *(int *)(v17 + 44)), v16);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v12).n128_u64[0];
  return result;
}

uint64_t sub_100020EB4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>, double a7@<D0>)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  char *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _OWORD v51[3];

  v47 = a4;
  v48 = a5;
  v45 = a1;
  v46 = a3;
  v50 = a6;
  v9 = sub_100004A10(&qword_100056A48);
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_100004A10(&qword_100056A50);
  __chkstk_darwin(v12);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_100004A10(&qword_100056A58);
  v15 = __chkstk_darwin(v49);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v45 - v18;
  v20 = sub_100004A10(&qword_100056A60);
  __chkstk_darwin(v20);
  v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100004A10(&qword_100056A68);
  v24 = __chkstk_darwin(v23);
  v26 = (char *)&v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __chkstk_darwin(v24);
  v29 = (char *)&v45 - v28;
  if (a2)
  {
    *v11 = static Alignment.center.getter(v27);
    v11[1] = v30;
    v31 = sub_100004A10(&qword_100056A90);
    sub_100021294(v46, v45, a2, v47, v48, (uint64_t)v11 + *(int *)(v31 + 44));
    sub_100008CE0((uint64_t)v11, (uint64_t)v14, &qword_100056A48);
    v32 = &v14[*(int *)(v12 + 36)];
    *(_QWORD *)v32 = 0;
    *((_WORD *)v32 + 4) = 1;
    v33 = sub_100008C08((uint64_t)v11, &qword_100056A48);
    v34 = static Alignment.center.getter(v33);
    _FrameLayout.init(width:height:alignment:)(v51, 0, 1, *(_QWORD *)&a7, 0, v34, v35);
    sub_100008CE0((uint64_t)v14, (uint64_t)v17, &qword_100056A50);
    v36 = v49;
    v37 = &v17[*(int *)(v49 + 36)];
    v38 = v51[1];
    *(_OWORD *)v37 = v51[0];
    *((_OWORD *)v37 + 1) = v38;
    *((_OWORD *)v37 + 2) = v51[2];
    sub_100008C08((uint64_t)v14, &qword_100056A50);
    sub_100017510((uint64_t)v17, (uint64_t)v19, &qword_100056A58);
    sub_100008CE0((uint64_t)v19, (uint64_t)v22, &qword_100056A58);
    swift_storeEnumTagMultiPayload(v22, v20, 0);
    v39 = sub_1000173D4(&qword_100056A70, &qword_100056A58, (void (*)(void))sub_100024D5C);
    _ConditionalContent<>.init(storage:)(v22, v36, &type metadata for EmptyView, v39, &protocol witness table for EmptyView);
    sub_100008C08((uint64_t)v19, &qword_100056A58);
  }
  else
  {
    swift_storeEnumTagMultiPayload(v22, v20, 1);
    v40 = sub_1000173D4(&qword_100056A70, &qword_100056A58, (void (*)(void))sub_100024D5C);
    _ConditionalContent<>.init(storage:)(v22, v49, &type metadata for EmptyView, v40, &protocol witness table for EmptyView);
  }
  sub_100008CE0((uint64_t)v29, (uint64_t)v26, &qword_100056A68);
  v41 = v50;
  *v50 = 0;
  *((_BYTE *)v41 + 8) = 1;
  v42 = sub_100004A10(&qword_100056A88);
  sub_100008CE0((uint64_t)v26, (uint64_t)v41 + *(int *)(v42 + 48), &qword_100056A68);
  v43 = (char *)v41 + *(int *)(v42 + 64);
  *(_QWORD *)v43 = 0;
  v43[8] = 1;
  sub_100008C08((uint64_t)v29, &qword_100056A68);
  return sub_100008C08((uint64_t)v26, &qword_100056A68);
}

uint64_t sub_100021294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  uint64_t v26;
  char *v27;
  uint64_t v28;
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
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_QWORD, _QWORD, _QWORD);
  char *v54;
  char v55;
  void (*v56)(_QWORD, _QWORD);
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  char *v66;
  void (*v67)(char *, char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  Swift::String v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char v96;
  void (*v97)(char *, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t, char *, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int *v111;
  void (*v112)(char *, uint64_t);
  char *v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  Swift::String v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t (*v138)(char *, uint64_t);
  void (*v139)(char *);
  unsigned int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void (*v145)(char *, _QWORD, uint64_t, uint64_t);
  void (*v146)(_QWORD, _QWORD, _QWORD);
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t aBlock;
  unint64_t v151;
  id (*v152)(uint64_t, void *);
  void *v153;
  id (*v154)(void *);
  uint64_t v155;

  v120 = a5;
  v119 = a4;
  v122._object = a3;
  v122._countAndFlagsBits = a2;
  v142 = a1;
  v133 = a6;
  v130 = type metadata accessor for WidgetRenderingMode(0);
  v124 = *(_QWORD *)(v130 - 8);
  v6 = __chkstk_darwin(v130);
  v129 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v128 = (uint64_t)&v114 - v8;
  v123 = sub_100004A10(&qword_1000566F8);
  __chkstk_darwin(v123);
  v127 = (char *)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_100004A10(&qword_100056700);
  v10 = __chkstk_darwin(v126);
  v132 = (uint64_t)&v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v125 = (uint64_t)&v114 - v13;
  __chkstk_darwin(v12);
  v131 = (uint64_t)&v114 - v14;
  v15 = sub_100004A10(&qword_100056A98);
  __chkstk_darwin(v15);
  v117 = (char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_100004A10(&qword_100056AA0);
  v17 = __chkstk_darwin(v118);
  v144 = (uint64_t)&v114 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v143 = (uint64_t)&v114 - v19;
  v20 = type metadata accessor for ColorScheme(0);
  v21 = *(_QWORD *)(v20 - 8);
  v146 = (void (*)(_QWORD, _QWORD, _QWORD))v20;
  v147 = v21;
  v22 = __chkstk_darwin(v20);
  v114 = (char *)&v114 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v116 = (char *)&v114 - v24;
  v25 = sub_100004A10(&qword_100056650);
  __chkstk_darwin(v25);
  v27 = (char *)&v114 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for Image.ResizingMode(0);
  v29 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v31 = (char *)&v114 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_100004A10(&qword_100056658);
  v134 = *(_QWORD *)(v32 - 8);
  v33 = __chkstk_darwin(v32);
  v121 = (char *)&v114 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __chkstk_darwin(v33);
  v136 = (char *)&v114 - v36;
  v37 = __chkstk_darwin(v35);
  v149 = (char *)&v114 - v38;
  __chkstk_darwin(v37);
  v40 = (char *)&v114 - v39;
  v115 = sub_100004A10(&qword_100056AA8);
  v41 = __chkstk_darwin(v115);
  v141 = (uint64_t)&v114 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __chkstk_darwin(v41);
  v45 = (char *)&v114 - v44;
  __chkstk_darwin(v43);
  v148 = (uint64_t)&v114 - v46;
  v47 = Image.init(_:bundle:)(0xD00000000000001ALL, 0x8000000100041BA0, 0);
  v140 = enum case for Image.ResizingMode.stretch(_:);
  v139 = *(void (**)(char *))(v29 + 104);
  v137 = v28;
  v139(v31);
  v48 = 0.0;
  v49 = Image.resizable(capInsets:resizingMode:)(v31, v47, 0.0, 0.0, 0.0, 0.0);
  swift_release(v47);
  v138 = *(uint64_t (**)(char *, uint64_t))(v29 + 8);
  v50 = v138(v31, v28);
  static WidgetAccentedRenderingMode.fullColor.getter(v50);
  v135 = type metadata accessor for WidgetAccentedRenderingMode(0);
  v145 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v135 - 8) + 56);
  v145(v27, 0, 1, v135);
  Image.widgetAccentedRenderingMode(_:)(v27, v49);
  swift_release(v49);
  sub_100008C08((uint64_t)v27, &qword_100056650);
  v51 = (uint64_t)v116;
  sub_100007A74((uint64_t)v116);
  v53 = v146;
  v52 = v147;
  v54 = v114;
  (*(void (**)(char *, _QWORD, _QWORD))(v147 + 104))(v114, enum case for ColorScheme.light(_:), v146);
  v55 = static ColorScheme.== infix(_:_:)(v51, v54);
  v56 = *(void (**)(_QWORD, _QWORD))(v52 + 8);
  v56(v54, v53);
  v56(v51, v53);
  if ((v55 & 1) != 0)
    v57 = 0.3;
  else
    v57 = 1.0;
  v58 = v134;
  v146 = *(void (**)(_QWORD, _QWORD, _QWORD))(v134 + 16);
  v146(v45, v40, v32);
  *(double *)&v45[*(int *)(v115 + 36)] = v57;
  v147 = *(_QWORD *)(v58 + 8);
  ((void (*)(char *, uint64_t))v147)(v40, v32);
  v59 = v137;
  sub_100017510((uint64_t)v45, v148, &qword_100056AA8);
  v60 = Image.init(_:bundle:)(0xD000000000000023, 0x8000000100041BC0, 0);
  v61 = v140;
  v62 = (void (*)(char *, uint64_t, uint64_t))v139;
  ((void (*)(char *, _QWORD, uint64_t))v139)(v31, v140, v59);
  v63 = Image.resizable(capInsets:resizingMode:)(v31, v60, 0.0, 0.0, 0.0, 0.0);
  swift_release(v60);
  v64 = (void (*)(char *, uint64_t))v138;
  v65 = v138(v31, v59);
  static WidgetAccentedRenderingMode.fullColor.getter(v65);
  v145(v27, 0, 1, v135);
  v66 = v136;
  Image.widgetAccentedRenderingMode(_:)(v27, v63);
  swift_release(v63);
  sub_100008C08((uint64_t)v27, &qword_100056650);
  v67 = *(void (**)(char *, char *, uint64_t))(v134 + 32);
  v134 = v32;
  v67(v149, v66, v32);
  v68 = Image.init(_:bundle:)(0xD00000000000001BLL, 0x8000000100041BF0, 0);
  v62(v31, v61, v59);
  v69 = Image.resizable(capInsets:resizingMode:)(v31, v68, 0.0, 0.0, 0.0, 0.0);
  swift_release(v68);
  v116 = v31;
  v64(v31, v59);
  v70 = enum case for Image.TemplateRenderingMode.template(_:);
  v71 = type metadata accessor for Image.TemplateRenderingMode(0);
  v72 = *(_QWORD *)(v71 - 8);
  v73 = (uint64_t)v117;
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 104))(v117, v70, v71);
  v74 = v136;
  v75 = v71;
  v76 = v135;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v72 + 56))(v73, 0, 1, v75);
  v77 = Image.renderingMode(_:)(v73, v69);
  swift_release(v69);
  v78 = sub_100008C08(v73, &qword_100056A98);
  static WidgetAccentedRenderingMode.accented.getter(v78);
  v145(v27, 0, 1, v76);
  Image.widgetAccentedRenderingMode(_:)(v27, v77);
  swift_release(v77);
  sub_100008C08((uint64_t)v27, &qword_100056650);
  if (qword_100055AF0 != -1)
    swift_once(&qword_100055AF0, sub_10002CBD4);
  type metadata accessor for ContentView(0, v119, v120, v79);
  v80 = objc_allocWithZone((Class)UIColor);
  v154 = sub_10002CB64;
  v155 = 0;
  aBlock = (uint64_t)_NSConcreteStackBlock;
  v151 = 1107296256;
  v152 = sub_100024334;
  v153 = &unk_100052500;
  v81 = _Block_copy(&aBlock);
  v82 = objc_msgSend(v80, "initWithDynamicProvider:", v81);
  _Block_release(v81);
  swift_release(v155);
  v83 = Color.init(uiColor:)(v82);
  v84 = v144;
  v85 = v134;
  v146(v144, v74, v134);
  *(_QWORD *)(v84 + *(int *)(v118 + 36)) = v83;
  ((void (*)(char *, uint64_t))v147)(v74, v85);
  sub_100017510(v84, v143, &qword_100056AA0);
  aBlock = 0;
  v151 = 0xE000000000000000;
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease(v151);
  aBlock = 0x6174537974706D45;
  v151 = 0xEB000000005F6574;
  String.append(_:)(v122);
  v86._countAndFlagsBits = 0x6F726765726F465FLL;
  v86._object = (void *)0xEB00000000646E75;
  String.append(_:)(v86);
  v87 = Image.init(_:bundle:)(aBlock, v151, 0);
  v88 = (uint64_t)v116;
  v89 = v137;
  ((void (*)(char *, _QWORD, uint64_t))v139)(v116, v140, v137);
  v90 = Image.resizable(capInsets:resizingMode:)(v88, v87, 0.0, 0.0, 0.0, 0.0);
  swift_release(v87);
  v91 = v138((char *)v88, v89);
  static WidgetAccentedRenderingMode.fullColor.getter(v91);
  v145(v27, 0, 1, v76);
  v92 = v121;
  Image.widgetAccentedRenderingMode(_:)(v27, v90);
  swift_release(v90);
  sub_100008C08((uint64_t)v27, &qword_100056650);
  v93 = v128;
  v94 = sub_100007A48(v128);
  v95 = v129;
  static WidgetRenderingMode.accented.getter(v94);
  v96 = static WidgetRenderingMode.== infix(_:_:)(v93, v95);
  v97 = *(void (**)(char *, uint64_t))(v124 + 8);
  v98 = v130;
  v97(v95, v130);
  v97((char *)v93, v98);
  if ((v96 & 1) != 0)
    v48 = 1.0;
  v99 = (uint64_t)v127;
  v146(v127, v92, v85);
  *(double *)(v99 + *(int *)(v123 + 36)) = v48;
  ((void (*)(char *, uint64_t))v147)(v92, v85);
  v100 = sub_100007A48(v93);
  static WidgetRenderingMode.accented.getter(v100);
  v101 = static WidgetRenderingMode.== infix(_:_:)(v93, v95);
  v97(v95, v98);
  v97((char *)v93, v98);
  if ((v101 & 1) != 0)
    v102 = 0.9;
  else
    v102 = 1.0;
  v103 = v125;
  sub_100008CE0(v99, v125, &qword_1000566F8);
  *(double *)(v103 + *(int *)(v126 + 36)) = v102;
  sub_100008C08(v99, &qword_1000566F8);
  v104 = v131;
  sub_100017510(v103, v131, &qword_100056700);
  v105 = v141;
  sub_100008CE0(v148, v141, &qword_100056AA8);
  v106 = (void (*)(uint64_t, char *, uint64_t))v146;
  v146(v74, v149, v85);
  v107 = v143;
  v108 = v144;
  sub_100008CE0(v143, v144, &qword_100056AA0);
  v109 = v132;
  sub_100008CE0(v104, v132, &qword_100056700);
  v110 = v133;
  sub_100008CE0(v105, v133, &qword_100056AA8);
  v111 = (int *)sub_100004A10(&qword_100056AB0);
  v106(v110 + v111[12], v74, v85);
  sub_100008CE0(v108, v110 + v111[16], &qword_100056AA0);
  sub_100008CE0(v109, v110 + v111[20], &qword_100056700);
  sub_100008C08(v104, &qword_100056700);
  sub_100008C08(v107, &qword_100056AA0);
  v112 = (void (*)(char *, uint64_t))v147;
  ((void (*)(char *, uint64_t))v147)(v149, v85);
  sub_100008C08(v148, &qword_100056AA8);
  sub_100008C08(v109, &qword_100056700);
  sub_100008C08(v108, &qword_100056AA0);
  v112(v74, v85);
  return sub_100008C08(v141, &qword_100056AA8);
}

uint64_t sub_100021FE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  NSObject *v35;
  int v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __n128 v49;
  void (*v50)(char *, uint64_t, __n128);
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  __n128 v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  __n128 v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v97;
  int v98;
  os_log_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t OpaqueTypeConformance2;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;

  v3 = v2;
  v120 = a2;
  OpaqueTypeConformance2 = type metadata accessor for ContainerBackgroundPlacement(0);
  v112 = *(_QWORD *)(OpaqueTypeConformance2 - 8);
  __chkstk_darwin(OpaqueTypeConformance2);
  v108 = (char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_100004A10(&qword_1000567B8);
  __chkstk_darwin(v110);
  v106 = (uint64_t *)((char *)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v116 = sub_100004A10(&qword_1000567C0);
  v111 = *(_QWORD *)(v116 - 8);
  __chkstk_darwin(v116);
  v107 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004A10(&qword_1000567C8);
  v118 = *(_QWORD *)(v8 - 8);
  v119 = v8;
  v9 = __chkstk_darwin(v8);
  v117 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = *(_QWORD *)(a1 - 8);
  v11 = __chkstk_darwin(v9);
  v115 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v97 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v97 - v17;
  v109 = v19;
  __chkstk_darwin(v16);
  v21 = (char *)&v97 - v20;
  v22 = sub_100004A10(&qword_1000567D0);
  v103 = *(_QWORD *)(v22 - 8);
  v23 = __chkstk_darwin(v22);
  v105 = (uint64_t)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = v24;
  __chkstk_darwin(v23);
  v26 = (char *)&v97 - v25;
  v27 = *(_QWORD *)(a1 + 16);
  v28 = *(_QWORD *)(a1 + 24);
  v100 = type metadata accessor for ModelEntry(0, v27, v28, v29);
  v30 = *(void (**)(uint64_t, uint64_t))(v28 + 208);
  v113 = v26;
  v123 = v28;
  v124 = v27;
  v30(v27, v28);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v31 = type metadata accessor for Logger(0);
  sub_100007E94(v31, (uint64_t)qword_100059040);
  v32 = v122;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v122 + 16);
  v33(v21, v2, a1);
  v33(v18, v2, a1);
  v34 = ((uint64_t (*)(char *, uint64_t, uint64_t))v33)(v15, v2, a1);
  v35 = Logger.logObject.getter(v34);
  v36 = static os_log_type_t.default.getter();
  v37 = os_log_type_enabled(v35, (os_log_type_t)v36);
  v38 = a1;
  v121 = v3;
  v102 = v33;
  v101 = a1;
  if (v37)
  {
    v39 = swift_slowAlloc(32, -1);
    v40 = swift_slowAlloc(96, -1);
    v126 = v40;
    *(_DWORD *)v39 = 136315650;
    v41 = (uint64_t *)&v21[*(int *)(a1 + 48)];
    v42 = v41[1];
    v99 = v35;
    v98 = v36;
    v97 = v40;
    if (v42)
    {
      v43 = *v41;
      v44 = v42;
    }
    else
    {
      v43 = 0;
      v44 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain(v42);
    v125 = sub_100008084(v43, v44, &v126);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v39 + 4, v39 + 12);
    v49 = swift_bridgeObjectRelease(v44);
    v50 = *(void (**)(char *, uint64_t, __n128))(v32 + 8);
    v50(v21, a1, v49);
    *(_WORD *)(v39 + 12) = 2080;
    v51 = v18;
    v52 = type metadata accessor for WidgetFamily(0);
    v53 = sub_10002498C(&qword_100055F00, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    v54 = dispatch thunk of CustomStringConvertible.description.getter(v52, v53);
    v56 = v55;
    v125 = sub_100008084(v54, v55, &v126);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v39 + 14, v39 + 22);
    v57 = swift_bridgeObjectRelease(v56);
    v50(v51, a1, v57);
    *(_WORD *)(v39 + 22) = 2080;
    v48 = v123;
    v47 = v124;
    v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v123 + 8))(v124, v123);
    v60 = v59;
    v125 = sub_100008084(v58, v59, &v126);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v39 + 24, v39 + 32);
    v61 = swift_bridgeObjectRelease(v60);
    v50(v15, v38, v61);
    v62 = v99;
    _os_log_impl((void *)&_mh_execute_header, v99, (os_log_type_t)v98, "🥑 ContentView%s: body(%s) for %s", (uint8_t *)v39, 0x20u);
    v63 = v97;
    swift_arrayDestroy(v97, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v63, -1, -1);
    swift_slowDealloc(v39, -1, -1);

    v3 = v121;
  }
  else
  {
    v45 = *(void (**)(char *, uint64_t))(v32 + 8);
    v45(v21, a1);
    v45(v18, a1);
    v45(v15, a1);

    v48 = v123;
    v47 = v124;
  }
  v64 = static Alignment.center.getter(v46);
  v65 = (uint64_t)v106;
  *v106 = v64;
  *(_QWORD *)(v65 + 8) = v66;
  v67 = sub_100004A10(&qword_1000567D8);
  v68 = sub_10002283C(v3, v47, v48, v65 + *(int *)(v67 + 44));
  v69 = v48;
  v70 = v108;
  v71 = static ContainerBackgroundPlacement.widget.getter(v68);
  v72 = __chkstk_darwin(v71);
  *(&v97 - 4) = v47;
  *(&v97 - 3) = v69;
  v73 = static Alignment.center.getter(v72);
  v75 = v74;
  v76 = sub_100004A10(&qword_1000567E0);
  v77 = sub_100008D24(&qword_1000567E8, &qword_1000567B8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  v78 = sub_100024390();
  v79 = v107;
  v80 = v110;
  View.containerBackground<A>(for:alignment:content:)(v70, v73, v75, sub_100024384, &v97 - 6, v110, v76, v77, v78);
  (*(void (**)(char *, uint64_t))(v112 + 8))(v70, OpaqueTypeConformance2);
  sub_100008C08(v65, &qword_1000567B8);
  v126 = v80;
  v127 = v76;
  v128 = v77;
  v129 = v78;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
  v82 = v116;
  v81 = v117;
  v83 = (uint64_t)v113;
  View.widgetURL(_:)(v113, v116, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v111 + 8))(v79, v82);
  v84 = v115;
  v85 = v101;
  v102(v115, v121, v101);
  v86 = v105;
  sub_100008CE0(v83, v105, &qword_1000567D0);
  v87 = v122;
  v88 = *(unsigned __int8 *)(v122 + 80);
  v89 = (v88 + 32) & ~v88;
  v90 = *(unsigned __int8 *)(v103 + 80);
  v91 = (v109 + v89 + v90) & ~v90;
  v92 = swift_allocObject(&unk_1000524E8, v91 + v104, v88 | v90 | 7);
  v93 = v123;
  *(_QWORD *)(v92 + 16) = v124;
  *(_QWORD *)(v92 + 24) = v93;
  (*(void (**)(uint64_t, char *, uint64_t))(v87 + 32))(v92 + v89, v84, v85);
  sub_100017510(v86, v92 + v91, &qword_1000567D0);
  v126 = v82;
  v127 = OpaqueTypeConformance2;
  v94 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
  v95 = v119;
  View.onTapGesture(count:perform:)(1, sub_1000246AC, v92, v119, v94);
  swift_release(v92);
  (*(void (**)(char *, uint64_t))(v118 + 8))(v81, v95);
  return sub_100008C08(v83, &qword_1000567D0);
}

uint64_t sub_10002283C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
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
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;

  v106 = a4;
  v105 = sub_100004A10(&qword_1000568F0);
  __chkstk_darwin(v105);
  v95 = (uint64_t)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004A10(&qword_1000568F8);
  __chkstk_darwin(v8);
  v90 = (uint64_t *)((char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v88 = sub_100004A10(&qword_100056900);
  v10 = __chkstk_darwin(v88);
  v92 = (uint64_t)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v94 = (uint64_t)&v85 - v12;
  v13 = sub_100004A10(&qword_100056908);
  v14 = __chkstk_darwin(v13);
  v91 = (uint64_t)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v93 = (uint64_t)&v85 - v16;
  v100 = sub_100004A10(&qword_100056910);
  __chkstk_darwin(v100);
  v102 = (uint64_t)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_100004A10(&qword_100056918);
  __chkstk_darwin(v101);
  v89 = (uint64_t *)((char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v87 = type metadata accessor for WidgetFamily(0);
  v86 = *(_QWORD *)(v87 - 8);
  __chkstk_darwin(v87);
  v85 = (char *)&v85 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100004A10(&qword_100056920);
  v21 = __chkstk_darwin(v20);
  v104 = (uint64_t)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v103 = (char *)&v85 - v23;
  v24 = sub_100004A10(&qword_100056928);
  __chkstk_darwin(v24);
  v26 = (char *)&v85 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100004A10(&qword_100056930);
  v28 = __chkstk_darwin(v27);
  v30 = (char *)&v85 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v32 = (char *)&v85 - v31;
  v98 = a2;
  *(_QWORD *)&v99 = a3;
  v34 = type metadata accessor for ContentView(0, a2, a3, v33);
  v35 = sub_10001A6A0(v34, (uint64_t)v26);
  v36 = a1 + *(int *)(v34 + 52);
  v97 = *(_OWORD *)(v36 + 48);
  v37 = *(_QWORD *)(v36 + 64);
  v38 = *(_QWORD *)(v36 + 72);
  v96 = v36;
  LOBYTE(a2) = static Edge.Set.all.getter(v35);
  sub_100008CE0((uint64_t)v26, (uint64_t)v30, &qword_100056928);
  v39 = &v30[*(int *)(v27 + 36)];
  *v39 = a2;
  *(_OWORD *)(v39 + 8) = v97;
  *((_QWORD *)v39 + 3) = v37;
  *((_QWORD *)v39 + 4) = v38;
  v39[40] = 0;
  sub_100008C08((uint64_t)v26, &qword_100056928);
  *(_QWORD *)&v97 = v32;
  sub_100017510((uint64_t)v30, (uint64_t)v32, &qword_100056930);
  if ((sub_10001A420(v34) & 1) != 0)
  {
    v42 = v98;
    v41 = v99;
    type metadata accessor for ModelEntry(0, v98, v99, v40);
    v43 = v86;
    v44 = v85;
    v45 = v87;
    (*(void (**)(char *, _QWORD, uint64_t))(v86 + 104))(v85, enum case for WidgetFamily.systemSmall(_:), v87);
    v46 = sub_10002498C((unint64_t *)&qword_100056218, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v108, v45, v46);
    dispatch thunk of RawRepresentable.rawValue.getter(&v107, v45, v46);
    v48 = v107;
    v47 = v108;
    v49 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v44, v45);
    v50 = 40;
    if (v47 == v48)
      v50 = 32;
    v51 = *(double *)(v96 + v50);
    v52 = static HorizontalAlignment.center.getter(v49);
    v53 = (uint64_t)v89;
    *v89 = v52;
    *(_QWORD *)(v53 + 8) = 0;
    *(_BYTE *)(v53 + 16) = 0;
    v54 = sub_100004A10(&qword_100056960);
    sub_10002305C(a1, v42, v41, (_QWORD *)(v53 + *(int *)(v54 + 44)), v51);
    v55 = v102;
    sub_100008CE0(v53, v102, &qword_100056918);
    swift_storeEnumTagMultiPayload(v55, v100, 0);
    v56 = sub_100008D24(&qword_100056948, &qword_100056918, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v57 = sub_100008D24(&qword_100056950, &qword_1000568F0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v58 = (uint64_t)v103;
    _ConditionalContent<>.init(storage:)(v55, v101, v105, v56, v57);
    v59 = v53;
    v60 = &qword_100056918;
  }
  else
  {
    v61 = v93;
    v62 = sub_10001D138(v34, v93);
    v63 = static HorizontalAlignment.leading.getter(v62);
    v64 = v96;
    v65 = *(_QWORD *)(v96 + 112);
    v66 = (uint64_t)v90;
    *v90 = v63;
    *(_QWORD *)(v66 + 8) = v65;
    *(_BYTE *)(v66 + 16) = 0;
    v67 = sub_100004A10(&qword_100056938);
    v68 = sub_100023798(a1, v98, v99, (_QWORD *)(v66 + *(int *)(v67 + 44)));
    v99 = *(_OWORD *)(v64 + 48);
    v69 = *(_QWORD *)(v64 + 64);
    v70 = *(_QWORD *)(v64 + 72);
    LOBYTE(v64) = static Edge.Set.all.getter(v68);
    v71 = v92;
    sub_100008CE0(v66, v92, &qword_1000568F8);
    v72 = v71 + *(int *)(v88 + 36);
    *(_BYTE *)v72 = v64;
    *(_OWORD *)(v72 + 8) = v99;
    *(_QWORD *)(v72 + 24) = v69;
    *(_QWORD *)(v72 + 32) = v70;
    *(_BYTE *)(v72 + 40) = 0;
    sub_100008C08(v66, &qword_1000568F8);
    v73 = v94;
    sub_100017510(v71, v94, &qword_100056900);
    v74 = v91;
    sub_100008CE0(v61, v91, &qword_100056908);
    sub_100008CE0(v73, v71, &qword_100056900);
    v75 = v95;
    sub_100008CE0(v74, v95, &qword_100056908);
    v76 = sub_100004A10(&qword_100056940);
    sub_100008CE0(v71, v75 + *(int *)(v76 + 48), &qword_100056900);
    sub_100008C08(v71, &qword_100056900);
    sub_100008C08(v74, &qword_100056908);
    v77 = v102;
    sub_100008CE0(v75, v102, &qword_1000568F0);
    swift_storeEnumTagMultiPayload(v77, v100, 1);
    v78 = sub_100008D24(&qword_100056948, &qword_100056918, (uint64_t)&protocol conformance descriptor for VStack<A>);
    v79 = sub_100008D24(&qword_100056950, &qword_1000568F0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v58 = (uint64_t)v103;
    _ConditionalContent<>.init(storage:)(v77, v101, v105, v78, v79);
    sub_100008C08(v75, &qword_1000568F0);
    sub_100008C08(v73, &qword_100056900);
    v59 = v61;
    v60 = &qword_100056908;
  }
  sub_100008C08(v59, v60);
  v80 = v97;
  sub_100008CE0(v97, (uint64_t)v30, &qword_100056930);
  v81 = v104;
  sub_100008CE0(v58, v104, &qword_100056920);
  v82 = v106;
  sub_100008CE0((uint64_t)v30, v106, &qword_100056930);
  v83 = sub_100004A10(&qword_100056958);
  sub_100008CE0(v81, v82 + *(int *)(v83 + 48), &qword_100056920);
  sub_100008C08(v58, &qword_100056920);
  sub_100008C08(v80, &qword_100056930);
  sub_100008C08(v81, &qword_100056920);
  return sub_100008C08((uint64_t)v30, &qword_100056930);
}

uint64_t sub_10002305C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>, double a5@<D0>)
{
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  int *v49;
  char *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;

  v58 = a4;
  v9 = sub_100004A10(&qword_100056968);
  __chkstk_darwin(v9);
  v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_100004A10(&qword_100056970);
  v12 = __chkstk_darwin(v57);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v56 = (uint64_t)&v52 - v15;
  v16 = sub_100004A10(&qword_100056978);
  __chkstk_darwin(v16);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100004A10(&qword_100056980);
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v59 = (uint64_t)&v52 - v23;
  v24 = sub_100004A10(&qword_100056988);
  v25 = __chkstk_darwin(v24);
  v55 = (uint64_t)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v28 = (char *)&v52 - v27;
  v53 = a3;
  v54 = (uint64_t)&v52 - v27;
  v52 = a2;
  v29 = a3;
  v31 = type metadata accessor for ContentView(0, a2, a3, v30);
  v33 = sub_100020D9C(v31, v32, (uint64_t)v28);
  *(_QWORD *)v18 = static VerticalAlignment.center.getter(v33);
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 1;
  v34 = sub_100004A10(&qword_100056990);
  v35 = sub_1000234B4(a2, v29, (uint64_t)&v18[*(int *)(v34 + 44)]);
  v36 = a1 + *(int *)(v31 + 52);
  v37 = *(_QWORD *)(v36 + 24);
  LOBYTE(v31) = static Edge.Set.all.getter(v35);
  sub_100008CE0((uint64_t)v18, (uint64_t)v22, &qword_100056978);
  v38 = &v22[*(int *)(v19 + 36)];
  *v38 = v31;
  *((_QWORD *)v38 + 1) = v37;
  *((double *)v38 + 2) = a5;
  *((_QWORD *)v38 + 3) = 0;
  *((double *)v38 + 4) = a5;
  v38[40] = 0;
  sub_100008C08((uint64_t)v18, &qword_100056978);
  v39 = v59;
  sub_100017510((uint64_t)v22, v59, &qword_100056980);
  *(_QWORD *)v11 = static VerticalAlignment.center.getter(v40);
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v41 = sub_100004A10(&qword_100056998);
  v42 = sub_1000235D4(v52, v53, (uint64_t)&v11[*(int *)(v41 + 44)]);
  v43 = *(_QWORD *)(v36 + 24);
  LOBYTE(v37) = static Edge.Set.all.getter(v42);
  sub_100008CE0((uint64_t)v11, (uint64_t)v14, &qword_100056968);
  v44 = &v14[*(int *)(v57 + 36)];
  *v44 = v37;
  *((_QWORD *)v44 + 1) = v43;
  *((double *)v44 + 2) = a5;
  *((_QWORD *)v44 + 3) = 0;
  *((double *)v44 + 4) = a5;
  v44[40] = 0;
  sub_100008C08((uint64_t)v11, &qword_100056968);
  v45 = v56;
  sub_100017510((uint64_t)v14, v56, &qword_100056970);
  v46 = v54;
  v47 = v55;
  sub_100008CE0(v54, v55, &qword_100056988);
  sub_100008CE0(v39, (uint64_t)v22, &qword_100056980);
  sub_100008CE0(v45, (uint64_t)v14, &qword_100056970);
  v48 = v58;
  *v58 = 0;
  *((_BYTE *)v48 + 8) = 1;
  v49 = (int *)sub_100004A10(&qword_1000569A0);
  sub_100008CE0(v47, (uint64_t)v48 + v49[12], &qword_100056988);
  sub_100008CE0((uint64_t)v22, (uint64_t)v48 + v49[16], &qword_100056980);
  sub_100008CE0((uint64_t)v14, (uint64_t)v48 + v49[20], &qword_100056970);
  v50 = (char *)v48 + v49[24];
  *(_QWORD *)v50 = 0;
  v50[8] = 1;
  sub_100008C08(v45, &qword_100056970);
  sub_100008C08(v59, &qword_100056980);
  sub_100008C08(v46, &qword_100056988);
  sub_100008C08((uint64_t)v14, &qword_100056970);
  sub_100008C08((uint64_t)v22, &qword_100056980);
  return sub_100008C08(v47, &qword_100056988);
}

uint64_t sub_1000234B4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v6 = sub_100004A10(&qword_100056A10);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (uint64_t *)((char *)&v17 - v10);
  v13 = type metadata accessor for ContentView(0, a1, a2, v12);
  sub_1000201E0(v13, v11);
  sub_100008CE0((uint64_t)v11, (uint64_t)v9, &qword_100056A10);
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  v14 = sub_100004A10(&qword_100056A18);
  sub_100008CE0((uint64_t)v9, a3 + *(int *)(v14 + 48), &qword_100056A10);
  v15 = a3 + *(int *)(v14 + 64);
  *(_QWORD *)v15 = 0;
  *(_BYTE *)(v15 + 8) = 1;
  sub_100008C08((uint64_t)v11, &qword_100056A10);
  return sub_100008C08((uint64_t)v9, &qword_100056A10);
}

uint64_t sub_1000235D4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;

  v6 = sub_100004A10(&qword_1000569A8);
  __chkstk_darwin(v6);
  v8 = (uint64_t *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_100004A10(&qword_1000569B0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v24 - v14;
  v17 = type metadata accessor for ContentView(0, a1, a2, v16);
  sub_1000207F4(v17, v8);
  v18 = sub_100008D24(&qword_1000569B8, &qword_1000569A8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  View.widgetAccentable(_:)(1, v6, v18);
  sub_100008C08((uint64_t)v8, &qword_1000569A8);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v13, v9);
  v19 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v19(v13, v15, v9);
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  v20 = sub_100004A10(&qword_1000569C0);
  v19((char *)(a3 + *(int *)(v20 + 48)), v13, v9);
  v21 = a3 + *(int *)(v20 + 64);
  *(_QWORD *)v21 = 0;
  *(_BYTE *)(v21 + 8) = 1;
  v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v22(v15, v9);
  return ((uint64_t (*)(char *, uint64_t))v22)(v13, v9);
}

uint64_t sub_100023798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  _QWORD *v31;
  int *v32;
  char *v34;
  _QWORD *v35;

  v35 = a4;
  v7 = sub_100004A10(&qword_100056AB8);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v34 - v11;
  v13 = sub_100004A10(&qword_100056AC0);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v34 - v17;
  v19 = sub_100004A10(&qword_100056AC8);
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v24 = (char *)&v34 - v23;
  *(_QWORD *)v24 = static VerticalAlignment.center.getter(v25);
  *((_QWORD *)v24 + 1) = 0;
  v24[16] = 1;
  v26 = sub_100004A10(&qword_100056AD0);
  sub_100023AA0(a1, a2, a3, (uint64_t)&v24[*(int *)(v26 + 44)]);
  *(_QWORD *)v18 = static VerticalAlignment.center.getter(v27);
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 1;
  v28 = sub_100004A10(&qword_100056AD8);
  sub_100023D54(a2, a3, &qword_100056A10, (void (*)(uint64_t))sub_1000201E0, &qword_100056AF8, (uint64_t)&v18[*(int *)(v28 + 44)]);
  *(_QWORD *)v12 = static VerticalAlignment.center.getter(v29);
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 1;
  v30 = sub_100004A10(&qword_100056AE0);
  sub_100023D54(a2, a3, &qword_1000569A8, (void (*)(uint64_t))sub_1000207F4, &qword_100056AF0, (uint64_t)&v12[*(int *)(v30 + 44)]);
  v34 = v22;
  sub_100008CE0((uint64_t)v24, (uint64_t)v22, &qword_100056AC8);
  sub_100008CE0((uint64_t)v18, (uint64_t)v16, &qword_100056AC0);
  sub_100008CE0((uint64_t)v12, (uint64_t)v10, &qword_100056AB8);
  v31 = v35;
  *v35 = 0;
  *((_BYTE *)v31 + 8) = 1;
  v32 = (int *)sub_100004A10(&qword_100056AE8);
  sub_100008CE0((uint64_t)v22, (uint64_t)v31 + v32[12], &qword_100056AC8);
  sub_100008CE0((uint64_t)v16, (uint64_t)v31 + v32[16], &qword_100056AC0);
  sub_100008CE0((uint64_t)v10, (uint64_t)v31 + v32[20], &qword_100056AB8);
  sub_100008C08((uint64_t)v12, &qword_100056AB8);
  sub_100008C08((uint64_t)v18, &qword_100056AC0);
  sub_100008C08((uint64_t)v24, &qword_100056AC8);
  sub_100008C08((uint64_t)v10, &qword_100056AB8);
  sub_100008C08((uint64_t)v16, &qword_100056AC0);
  return sub_100008C08((uint64_t)v34, &qword_100056AC8);
}

uint64_t sub_100023AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[2];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[2];
  _OWORD v59[11];
  _OWORD v60[3];

  v33 = a1;
  v34 = a4;
  v6 = sub_100004A10(&qword_100056B00);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004A10(&qword_100056B08);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v33 - v14;
  v17 = type metadata accessor for ContentView(0, a2, a3, v16);
  sub_10001EC64(v17, (uint64_t)&v47);
  v59[10] = v57;
  v60[0] = v58[0];
  *(_OWORD *)((char *)v60 + 14) = *(_OWORD *)((char *)v58 + 14);
  v59[6] = v53;
  v59[7] = v54;
  v59[8] = v55;
  v59[9] = v56;
  v59[2] = v49;
  v59[3] = v50;
  v59[4] = v51;
  v59[5] = v52;
  v59[0] = v47;
  v59[1] = v48;
  v45 = v57;
  v46[0] = v58[0];
  *(_OWORD *)((char *)v46 + 14) = *(_OWORD *)((char *)v58 + 14);
  v41 = v53;
  v42 = v54;
  v43 = v55;
  v44 = v56;
  v37 = v49;
  v38 = v50;
  v39 = v51;
  v40 = v52;
  v35 = v47;
  v36 = v48;
  v18 = sub_100004A10(&qword_100056B10);
  v19 = sub_100008D24(&qword_100056B18, &qword_100056B10, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  View.widgetAccentable(_:)(1, v18, v19);
  v20 = sub_100024DF8((uint64_t)v59);
  v21 = static Edge.Set.bottom.getter(v20);
  v22 = EdgeInsets.init(_all:)(*(double *)(v33 + *(int *)(v17 + 52) + 80));
  v24 = v23;
  v26 = v25;
  v28 = v27;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
  v29 = &v13[*(int *)(v10 + 36)];
  *v29 = v21;
  *((double *)v29 + 1) = v22;
  *((_QWORD *)v29 + 2) = v24;
  *((_QWORD *)v29 + 3) = v26;
  *((_QWORD *)v29 + 4) = v28;
  v29[40] = 0;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100017510((uint64_t)v13, (uint64_t)v15, &qword_100056B08);
  sub_100008CE0((uint64_t)v15, (uint64_t)v13, &qword_100056B08);
  v30 = v34;
  sub_100008CE0((uint64_t)v13, v34, &qword_100056B08);
  v31 = v30 + *(int *)(sub_100004A10(&qword_100056B20) + 48);
  *(_QWORD *)v31 = 0;
  *(_BYTE *)(v31 + 8) = 1;
  sub_100008C08((uint64_t)v15, &qword_100056B08);
  return sub_100008C08((uint64_t)v13, &qword_100056B08);
}

uint64_t sub_100023D54@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X3>, void (*a4)(uint64_t)@<X4>, uint64_t *a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v12 = sub_100004A10(a3);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v22 - v16;
  v19 = type metadata accessor for ContentView(0, a1, a2, v18);
  a4(v19);
  sub_100008CE0((uint64_t)v17, (uint64_t)v15, a3);
  sub_100008CE0((uint64_t)v15, a6, a3);
  v20 = a6 + *(int *)(sub_100004A10(a5) + 48);
  *(_QWORD *)v20 = 0;
  *(_BYTE *)(v20 + 8) = 1;
  sub_100008C08((uint64_t)v17, a3);
  return sub_100008C08((uint64_t)v15, a3);
}

uint64_t sub_100023E6C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v19;

  v6 = type metadata accessor for ColorScheme(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004A10(&qword_100056800);
  __chkstk_darwin(v10);
  v12 = (uint64_t *)((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = type metadata accessor for ContentView(0, a1, a2, v13);
  sub_10001B8EC(v14, v12);
  sub_100007A74((uint64_t)v9);
  KeyPath = swift_getKeyPath(&unk_100043250);
  v16 = (uint64_t *)(a3 + *(int *)(sub_100004A10(&qword_1000567E0) + 36));
  v17 = sub_100004A10(&qword_100055F40);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v16 + *(int *)(v17 + 28), v9, v6);
  *v16 = KeyPath;
  sub_100008CE0((uint64_t)v12, a3, &qword_100056800);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return sub_100008C08((uint64_t)v12, &qword_100056800);
}

void sub_100023FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  __n128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;

  v8 = sub_100004A10(&qword_1000567D0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v37 - v12;
  v15 = type metadata accessor for ContentView(0, a3, a4, v14);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v37 - v17;
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v19 = type metadata accessor for Logger(0);
  sub_100007E94(v19, (uint64_t)qword_100059040);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v15);
  v20 = sub_100008CE0(a2, (uint64_t)v13, &qword_1000567D0);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, (os_log_type_t)v22))
  {
    v23 = swift_slowAlloc(22, -1);
    v24 = swift_slowAlloc(64, -1);
    v40 = v24;
    *(_DWORD *)v23 = 136315394;
    v25 = (uint64_t *)&v18[*(int *)(v15 + 48)];
    v26 = v25[1];
    v38 = v22;
    v37 = v24;
    if (v26)
    {
      v27 = *v25;
      v28 = v26;
    }
    else
    {
      v27 = 0;
      v28 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain(v26);
    v39 = sub_100008084(v27, v28, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v23 + 4, v23 + 12);
    v29 = swift_bridgeObjectRelease(v28);
    (*(void (**)(char *, uint64_t, __n128))(v16 + 8))(v18, v15, v29);
    *(_WORD *)(v23 + 12) = 2080;
    sub_100008CE0((uint64_t)v13, (uint64_t)v11, &qword_1000567D0);
    v30 = type metadata accessor for URL(0);
    v31 = *(_QWORD *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v11, 1, v30) == 1)
    {
      sub_100008C08((uint64_t)v11, &qword_1000567D0);
      v32 = 0;
      v33 = 0xE000000000000000;
    }
    else
    {
      v32 = URL.description.getter();
      v33 = v34;
      (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v30);
    }
    v35 = v38;
    v39 = sub_100008084(v32, v33, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v23 + 14, v23 + 22);
    swift_bridgeObjectRelease(v33);
    sub_100008C08((uint64_t)v13, &qword_1000567D0);
    _os_log_impl((void *)&_mh_execute_header, v21, v35, "🥑 ContentView%s: open '%s'", (uint8_t *)v23, 0x16u);
    v36 = v37;
    swift_arrayDestroy(v37, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v23, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    sub_100008C08((uint64_t)v13, &qword_1000567D0);
  }

}

id sub_100024334(uint64_t a1, void *a2)
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

uint64_t sub_100024384@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100023E6C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_100024390()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000567F0;
  if (!qword_1000567F0)
  {
    v1 = sub_100004A50(&qword_1000567E0);
    sub_100008D24(&qword_1000567F8, &qword_100056800, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    sub_100008D24(&qword_100055F48, &qword_100055F40, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000567F0);
  }
  return result;
}

uint64_t sub_10002442C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
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
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = (int *)type metadata accessor for ContentView(0, v5, v6, a4);
  v8 = *((_QWORD *)v7 - 1);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = *(_QWORD *)(v8 + 64);
  v12 = *(_QWORD *)(sub_100004A10(&qword_1000567D0) - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = v11 + v13;
  v15 = *(_QWORD *)(v12 + 64);
  v16 = (_QWORD *)(v4 + v10);
  v17 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(v4 + v10, v17) == 1)
  {
    v18 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v4 + v10, v18);
  }
  else
  {
    swift_release(*v16);
  }
  v19 = v10 + v14;
  v20 = (_QWORD *)((char *)v16 + v7[9]);
  v21 = sub_100004A10((uint64_t *)&unk_100056FC0);
  v38 = v15;
  if (swift_getEnumCaseMultiPayload(v20, v21) == 1)
  {
    v22 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v20, v22);
  }
  else
  {
    swift_release(*v20);
  }
  v23 = v19 & ~v13;
  v24 = (_QWORD *)((char *)v16 + v7[10]);
  v25 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v24, v25) == 1)
  {
    v26 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v24, v26);
  }
  else
  {
    swift_release(*v24);
  }
  v27 = (char *)v16 + v7[11];
  v28 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v27, v28);
  v30 = type metadata accessor for ModelEntry(0, v5, v6, v29);
  v31 = &v27[*(int *)(v30 + 36)];
  v32 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(v31, v32);
  v33 = type metadata accessor for ViewContext(0);
  swift_release(*(_QWORD *)&v31[*(int *)(v33 + 24)]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(&v27[*(int *)(v30 + 40)], v5);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v16 + v7[12] + 8));
  v34 = (_QWORD *)((char *)v16 + v7[13]);
  swift_release(*v34);
  swift_release(v34[1]);
  v35 = type metadata accessor for URL(0);
  v36 = *(_QWORD *)(v35 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v4 + v23, 1, v35))
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v4 + v23, v35);
  return swift_deallocObject(v4, v23 + v38, v9 | v13 | 7);
}

void sub_1000246AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(_QWORD *)(type metadata accessor for ContentView(0, v5, v6, a4) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(*(_QWORD *)(sub_100004A10(&qword_1000567D0) - 8) + 80);
  sub_100023FC4(v4 + v8, v4 + ((v8 + v9 + v10) & ~v10), v5, v6);
}

uint64_t sub_10002472C()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10002474C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007D44(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

unint64_t sub_100024770()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056868;
  if (!qword_100056868)
  {
    v1 = sub_100004A50(&qword_100056848);
    sub_100008D24(&qword_100056870, &qword_100056840, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    sub_1000173D4(&qword_100056878, &qword_100056828, (void (*)(void))sub_100024814);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056868);
  }
  return result;
}

uint64_t sub_100024814()
{
  return sub_1000173D4(&qword_100056880, &qword_100056820, (void (*)(void))sub_100024838);
}

uint64_t sub_100024838()
{
  return sub_1000173D4(&qword_100056888, &qword_100056818, (void (*)(void))sub_10002485C);
}

unint64_t sub_10002485C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056890;
  if (!qword_100056890)
  {
    v1 = sub_100004A50(&qword_1000566F8);
    swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of Image.widgetAccentedRenderingMode(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056890);
  }
  return result;
}

unint64_t sub_1000248D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000568A0;
  if (!qword_1000568A0)
  {
    v1 = sub_100004A50(&qword_1000568A8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000568A0);
  }
  return result;
}

uint64_t sub_100024948(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MapView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002498C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for WidgetFamily(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000249CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000568C0;
  if (!qword_1000568C0)
  {
    v1 = sub_100004A50(&qword_1000568C8);
    sub_100008D24(&qword_1000568D0, &qword_1000568D8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000568C0);
  }
  return result;
}

uint64_t sub_100024A50(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 56));
  return a1;
}

uint64_t sub_100024A78(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  return a1;
}

_QWORD *sub_100024AA0(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_100024AC8(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

unint64_t sub_100024AF0()
{
  unint64_t result;

  result = qword_1000569F8;
  if (!qword_1000569F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000569F8);
  }
  return result;
}

uint64_t sub_100024B34()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_100024B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100007D44(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ContentSizeCategory, (uint64_t (*)(char *))&EnvironmentValues.sizeCategory.setter);
}

uint64_t sub_100024B78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100024BA0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100024BC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100024BF8(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

void sub_100024C24(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100024C4C(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

uint64_t sub_100024C70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100024C98(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100024CC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100024CE8(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_100024D0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100024D34(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

unint64_t sub_100024D5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056A78;
  if (!qword_100056A78)
  {
    v1 = sub_100004A50(&qword_100056A50);
    sub_100008D24(&qword_100056A80, &qword_100056A48, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056A78);
  }
  return result;
}

uint64_t sub_100024DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100024DF0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100024DF8(uint64_t a1)
{
  unint64_t v3;

  v3 = *(unsigned int *)(a1 + 200) | ((unint64_t)*(unsigned __int8 *)(a1 + 204) << 32);
  sub_100024E74(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    v3,
    SBYTE4(v3),
    SHIWORD(v3),
    *(_BYTE *)(a1 + 205));
  return a1;
}

void sub_100024E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25,__int16 a26,char a27)
{
  if ((a27 & 1) != 0)
  {
    sub_100008074(a1, a2, a3 & 1);
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    sub_100025E64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
      a20,
      a21,
      a22,
      a23,
      a24,
      a25 & 1,
      (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100024F60,
      (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000252E8,
      (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000251AC);
  }
}

uint64_t sub_100024F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,__int16 a24,char a25)
{
  if ((a25 & 1) != 0)
    return sub_100025040(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             (unsigned __int16)(a24 & 0x1FF) >> 8);
  swift_release(a1);
  swift_release(a2);
  swift_release(a4);
  swift_release(a3);
  return swift_release(a5);
}

uint64_t sub_100025040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,char a25)
{
  if ((a25 & 1) != 0)
  {
    swift_release(a4);
    swift_release(a5);
    swift_release(a7);
    swift_release(a6);
    swift_release(a8);
    return sub_1000251AC(a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22);
  }
  else
  {
    sub_1000251AC(a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
    swift_release(a21);
    swift_release(a19);
    swift_release(a18);
    swift_release(a20);
    return swift_release(a22);
  }
}

uint64_t sub_1000251AC(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int16 a12)
{
  if (HIBYTE(a12) <= 0xFEu)
    return sub_1000251E0(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, (unsigned __int16)(a12 & 0x1FF) >> 8);
  return result;
}

uint64_t sub_1000251E0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, char a13)
{
  if ((a13 & 1) == 0)
    return sub_100025284(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  sub_100008074(a1, a2, a3 & 1);
  swift_release(a10);
  swift_release(a8);
  swift_release(a5);
  swift_bridgeObjectRelease(a4);
  return swift_release(a11);
}

uint64_t sub_100025284(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_100008074(a1, a2, a3 & 1);
  swift_release(a10);
  swift_release(a8);
  swift_release(a5);
  swift_bridgeObjectRelease(a4);
  return swift_release(a11);
}

uint64_t sub_1000252E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int16 a14, char a15)
{
  if ((a15 & 1) == 0)
    return sub_1000251AC(a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
  sub_100008074(a1, a2, a3 & 1);
  swift_release(a10);
  swift_release(a8);
  swift_release(a5);
  swift_bridgeObjectRelease(a4);
  return swift_release(a11);
}

uint64_t sub_1000253A0(uint64_t result)
{
  *(_BYTE *)(result + 189) = 1;
  return result;
}

unint64_t sub_1000253AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056B38;
  if (!qword_100056B38)
  {
    v1 = sub_100004A50(&qword_100056B30);
    sub_100025450(&qword_100056B40, &qword_100056B48, (void (*)(void))sub_1000254C0, (void (*)(void))sub_100025690);
    sub_100008D24(&qword_100056BD0, &qword_100056BD8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056B38);
  }
  return result;
}

uint64_t sub_100025450(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_100004A50(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000254C0()
{
  return sub_100025450(&qword_100056B50, &qword_100056B58, (void (*)(void))sub_1000254E4, (void (*)(void))sub_1000255EC);
}

unint64_t sub_1000254E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056B60;
  if (!qword_100056B60)
  {
    v1 = sub_100004A50(&qword_100056B68);
    sub_100025568();
    sub_100008D24(&qword_1000566C8, &qword_1000566D0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056B60);
  }
  return result;
}

unint64_t sub_100025568()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056B70;
  if (!qword_100056B70)
  {
    v1 = sub_100004A50(&qword_100056B78);
    sub_100008D24(&qword_100056B80, &qword_100056B88, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056B70);
  }
  return result;
}

unint64_t sub_1000255EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056B90;
  if (!qword_100056B90)
  {
    v1 = sub_100004A50(&qword_100056B98);
    sub_100008D24(&qword_100056BA0, &qword_100056BA8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    sub_100008D24(&qword_100056BB0, &qword_100056BB8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056B90);
  }
  return result;
}

unint64_t sub_100025690()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056BC0;
  if (!qword_100056BC0)
  {
    v1 = sub_100004A50(&qword_100056BC8);
    sub_100008D24(&qword_100056BD0, &qword_100056BD8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    sub_100025714();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056BC0);
  }
  return result;
}

unint64_t sub_100025714()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056BE0;
  if (!qword_100056BE0)
  {
    v1 = sub_100004A50(&qword_100056BE8);
    sub_100025798();
    sub_100008D24(&qword_1000566C8, &qword_1000566D0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056BE0);
  }
  return result;
}

unint64_t sub_100025798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056BF0;
  if (!qword_100056BF0)
  {
    v1 = sub_100004A50(&qword_100056BF8);
    sub_10002581C();
    sub_100008D24(&qword_100056C20, &qword_100056C28, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056BF0);
  }
  return result;
}

unint64_t sub_10002581C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056C00;
  if (!qword_100056C00)
  {
    v1 = sub_100004A50(&qword_100056C08);
    sub_100008D24(&qword_100056C10, &qword_100056C18, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056C00);
  }
  return result;
}

uint64_t sub_1000258A0(uint64_t result)
{
  *(_BYTE *)(result + 188) = 1;
  return result;
}

double sub_1000258AC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int16 a12)
{
  double result;

  if (HIBYTE(a12) <= 0xFEu)
    return sub_1000258E0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, (unsigned __int16)(a12 & 0x1FF) >> 8);
  return result;
}

double sub_1000258E0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, char a13)
{
  double result;

  if ((a13 & 1) == 0)
    return sub_100025984(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  sub_1000259E8(a1, a2, a3 & 1);
  swift_retain(a11);
  swift_bridgeObjectRetain(a4);
  swift_retain(a5);
  swift_retain(a8);
  *(_QWORD *)&result = swift_retain(a10).n128_u64[0];
  return result;
}

double sub_100025984(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  double result;

  sub_1000259E8(a1, a2, a3 & 1);
  swift_retain(a11);
  swift_bridgeObjectRetain(a4);
  swift_retain(a5);
  swift_retain(a8);
  *(_QWORD *)&result = swift_retain(a10).n128_u64[0];
  return result;
}

uint64_t sub_1000259E8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_1000259F8(uint64_t result)
{
  *(_BYTE *)(result + 189) = 0;
  return result;
}

uint64_t sub_100025A00@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100025A30(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

void sub_100025A5C(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100025A84(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

uint64_t sub_100025AA8(uint64_t result)
{
  *(_BYTE *)(result + 187) = 1;
  return result;
}

uint64_t sub_100025AB4(uint64_t result)
{
  *(_BYTE *)(result + 188) = 0;
  return result;
}

uint64_t sub_100025ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25,uint64_t (*a26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t),uint64_t (*a27)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if ((a25 & 1) != 0)
    BYTE2(a14) &= 1u;
  else
    a27 = a26;
  return a27(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

double sub_100025B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,__int16 a24,char a25)
{
  double result;

  if ((a25 & 1) != 0)
    return sub_100025C40(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             (unsigned __int16)(a24 & 0x1FF) >> 8);
  swift_retain(a5);
  swift_retain(a1);
  swift_retain(a2);
  swift_retain(a3);
  *(_QWORD *)&result = swift_retain(a4).n128_u64[0];
  return result;
}

double sub_100025C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,char a25)
{
  double result;

  if ((a25 & 1) != 0)
  {
    swift_retain(a8);
    swift_retain(a4);
    swift_retain(a5);
    swift_retain(a6);
    swift_retain(a7);
    return sub_1000258AC(a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22);
  }
  else
  {
    sub_1000258AC(a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
    swift_retain(a22);
    swift_retain(a18);
    swift_retain(a19);
    swift_retain(a20);
    *(_QWORD *)&result = swift_retain(a21).n128_u64[0];
  }
  return result;
}

double sub_100025DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int16 a14, char a15)
{
  double result;

  if ((a15 & 1) == 0)
    return sub_1000258AC(a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
  sub_1000259E8(a1, a2, a3 & 1);
  swift_retain(a11);
  swift_bridgeObjectRetain(a4);
  swift_retain(a5);
  swift_retain(a8);
  *(_QWORD *)&result = swift_retain(a10).n128_u64[0];
  return result;
}

uint64_t sub_100025E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25,uint64_t (*a26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t),uint64_t (*a27)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t),uint64_t (*a28)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if ((a25 & 1) != 0)
    return a28(a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
  else
    return sub_100025ABC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             HIBYTE(a24) & 1,
             a26,
             a27);
}

uint64_t sub_100025F58(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_100025ABC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(unsigned __int16 *)(a1 + 184) | (*(unsigned __int8 *)(a1 + 186) << 16),
    *(_BYTE *)(a1 + 187),
    a2,
    a3);
  return a1;
}

uint64_t sub_100025FE4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_100025E64(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_DWORD *)(a1 + 184),
    *(_BYTE *)(a1 + 188),
    a2,
    a3,
    a4);
  return a1;
}

uint64_t sub_100026070@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100026098(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_1000260C0(uint64_t result)
{
  *(_BYTE *)(result + 186) = 0;
  return result;
}

uint64_t sub_1000260C8(uint64_t result)
{
  *(_BYTE *)(result + 187) = 0;
  return result;
}

uint64_t sub_1000260D0(uint64_t result)
{
  *(_BYTE *)(result + 185) = 1;
  return result;
}

uint64_t sub_1000260DC(uint64_t result)
{
  *(_BYTE *)(result + 186) = 1;
  return result;
}

uint64_t sub_1000260E8(uint64_t result)
{
  *(_BYTE *)(result + 185) = 0;
  return result;
}

unint64_t sub_1000260F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056C58;
  if (!qword_100056C58)
  {
    v1 = sub_100004A50(&qword_100056C50);
    sub_100025714();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056C58);
  }
  return result;
}

uint64_t sub_100026154(uint64_t a1, char a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = type metadata accessor for WidgetFamily(0);
  v6 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100055AF8 != -1)
    result = swift_once(&qword_100055AF8, sub_10003DC34);
  if (qword_100055AF0 != -1)
    result = swift_once(&qword_100055AF0, sub_10002CBD4);
  if ((a3 & 1) != 0 || (a2 & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, enum case for WidgetFamily.systemSmall(_:), v5);
    v10 = sub_10002498C((unint64_t *)&qword_100056218, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v12, v5, v10);
    dispatch thunk of RawRepresentable.rawValue.getter(&v11, v5, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

_QWORD *sub_100026338(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[9];
  v5 = a1[13];
  v6 = a1[17];
  v7 = a1[18];
  v8 = a1[19];
  v9 = a1[23];
  swift_retain(a1[3]);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_retain(v9);
  return a1;
}

uint64_t sub_1000263E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_100004A50(&qword_1000567C8);
  v1 = sub_100004A50(&qword_1000567C0);
  v5 = sub_100004A50(&qword_1000567B8);
  v6 = sub_100004A50(&qword_1000567E0);
  v7 = sub_100008D24(&qword_1000567E8, &qword_1000567B8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  v8 = sub_100024390();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>, 1);
}

uint64_t *sub_1000264C0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  char *v27;
  id v28;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[6];
    v24 = a3[7];
    v25 = *(void **)((char *)a2 + v23);
    *(uint64_t *)((char *)a1 + v23) = (uint64_t)v25;
    v26 = (char *)a1 + v24;
    v27 = (char *)a2 + v24;
    *(_OWORD *)v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
    *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    v28 = v25;
  }
  return a1;
}

void sub_100026644(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  v7 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }

}

uint64_t *sub_10002670C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  id v26;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[6];
  v22 = a3[7];
  v23 = *(void **)((char *)a2 + v21);
  *(uint64_t *)((char *)a1 + v21) = (uint64_t)v23;
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  *(_OWORD *)v24 = *(_OWORD *)v25;
  v24[16] = v25[16];
  *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  v26 = v23;
  return a1;
}

uint64_t *sub_100026864(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_100008C08((uint64_t)a1 + v12, &qword_100055E30);
    v15 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = a3[6];
  v22 = *(void **)((char *)a2 + v21);
  v23 = *(void **)((char *)a1 + v21);
  *(uint64_t *)((char *)a1 + v21) = (uint64_t)v22;
  v24 = v22;

  v25 = a3[7];
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  v28 = *(_OWORD *)v27;
  v26[16] = v27[16];
  *(_OWORD *)v26 = v28;
  *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  return a1;
}

char *sub_1000269F0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  v14 = &a1[v13];
  v15 = &a2[v13];
  *(_OWORD *)v14 = *(_OWORD *)v15;
  v14[16] = v15[16];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  return a1;
}

char *sub_100026B3C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_100008C08((uint64_t)&a1[v8], &qword_100055E30);
    v11 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[6];
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  v15 = a3[7];
  v16 = a3[8];
  v17 = &a1[v15];
  v18 = &a2[v15];
  *(_OWORD *)v17 = *(_OWORD *)v18;
  v17[16] = v18[16];
  *(_QWORD *)&a1[v16] = *(_QWORD *)&a2[v16];
  return a1;
}

uint64_t sub_100026CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100026CC4);
}

uint64_t sub_100026CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_100004A10(&qword_100055E38);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_100004A10(qword_100055E40);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_100026D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100026D80);
}

uint64_t sub_100026D80(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_100004A10(&qword_100055E38);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_100004A10(qword_100055E40);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for MapView(uint64_t a1)
{
  uint64_t result;

  result = qword_100056D58;
  if (!qword_100056D58)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MapView);
  return result;
}

void sub_100026E68(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[5];

  sub_100007950(319, (unint64_t *)&qword_100055EC8, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100007950(319, &qword_100055ED0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
      v6[3] = &unk_1000434C0;
      v6[4] = (char *)&value witness table for Builtin.Int64 + 64;
      swift_initStructMetadata(a1, 256, 5, v6, a1 + 16);
    }
  }
}

uint64_t sub_100026F30(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004486C, 1);
}

uint64_t sub_100026F40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char v37;
  void (*v38)(char *, uint64_t);
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _OWORD *v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t);
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
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
  uint64_t *v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;

  v103 = a1;
  v101 = sub_100004A10(&qword_100056DA0);
  __chkstk_darwin(v101);
  v102 = (uint64_t *)((char *)&v81 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = sub_100004A10(&qword_100056650);
  __chkstk_darwin(v3);
  v83 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Image.ResizingMode(0);
  v96 = *(_QWORD *)(v5 - 8);
  v97 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = sub_100004A10(&qword_100056658);
  v85 = *(_QWORD *)(v86 - 8);
  __chkstk_darwin(v86);
  v84 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_100004A10(&qword_1000566F8);
  __chkstk_darwin(v82);
  v91 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = sub_100004A10(&qword_100056818);
  __chkstk_darwin(v88);
  v90 = (uint64_t)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_100004A10(&qword_100056DA8);
  __chkstk_darwin(v87);
  v89 = (uint64_t)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_100004A10(&qword_100056DB0);
  __chkstk_darwin(v92);
  v94 = (uint64_t)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = sub_100004A10(&qword_100056DB8);
  v13 = __chkstk_darwin(v100);
  v93 = (uint64_t)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v95 = (uint64_t)&v81 - v15;
  v16 = type metadata accessor for WidgetRenderingMode(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v81 - v21;
  v23 = type metadata accessor for MapView(0);
  v24 = sub_100007A48((uint64_t)v22);
  static WidgetRenderingMode.accented.getter(v24);
  v25 = static WidgetRenderingMode.== infix(_:_:)(v22, v20);
  v26 = *(void (**)(char *, uint64_t))(v17 + 8);
  v26(v20, v16);
  v81 = v26;
  v26(v22, v16);
  v98 = v23;
  v99 = v1;
  v27 = Image.init(uiImage:)(*(id *)(v1 + *(int *)(v23 + 24)));
  v29 = v96;
  v28 = v97;
  (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v97);
  v30 = 0.0;
  v31 = Image.resizable(capInsets:resizingMode:)(v7, v27, 0.0, 0.0, 0.0, 0.0);
  swift_release(v27);
  v32 = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v7, v28);
  if ((v25 & 1) != 0)
  {
    v33 = (uint64_t)v83;
    static WidgetAccentedRenderingMode.fullColor.getter(v32);
    v34 = type metadata accessor for WidgetAccentedRenderingMode(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v33, 0, 1, v34);
    v35 = v84;
    Image.widgetAccentedRenderingMode(_:)(v33, v31);
    swift_release(v31);
    sub_100008C08(v33, &qword_100056650);
    v36 = sub_100007A48((uint64_t)v22);
    static WidgetRenderingMode.accented.getter(v36);
    v37 = static WidgetRenderingMode.== infix(_:_:)(v22, v20);
    v38 = v81;
    v81(v20, v16);
    v38(v22, v16);
    if ((v37 & 1) != 0)
      v39 = 1.0;
    else
      v39 = 0.0;
    v40 = v85;
    v41 = (uint64_t)v91;
    v42 = v86;
    (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v91, v35, v86);
    *(double *)(v41 + *(int *)(v82 + 36)) = v39;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v42);
    v43 = sub_100007A48((uint64_t)v22);
    static WidgetRenderingMode.accented.getter(v43);
    v44 = static WidgetRenderingMode.== infix(_:_:)(v22, v20);
    v38(v20, v16);
    v38(v22, v16);
    if ((v44 & 1) != 0)
      v30 = -0.1;
    v45 = v90;
    sub_100008CE0(v41, v90, &qword_1000566F8);
    *(double *)(v45 + *(int *)(v88 + 36)) = v30;
    sub_100008C08(v41, &qword_1000566F8);
    v46 = v89;
    sub_100008CE0(v45, v89, &qword_100056818);
    v47 = v46 + *(int *)(v87 + 36);
    *(_QWORD *)v47 = 0;
    *(_WORD *)(v47 + 8) = 257;
    v48 = sub_100008C08(v45, &qword_100056818);
    v49 = 0;
    v50 = 0;
    v51 = (uint64_t *)(v99 + *(int *)(v98 + 28));
    v52 = *((unsigned __int8 *)v51 + 16);
    if ((v52 & 1) == 0)
    {
      v50 = *v51;
      v49 = v51[1];
    }
    v53 = static Alignment.center.getter(v48);
    _FrameLayout.init(width:height:alignment:)(&v104, v50, v52, v49, v52, v53, v54);
    v55 = v94;
    sub_100008CE0(v46, v94, &qword_100056DA8);
    v56 = (_OWORD *)(v55 + *(int *)(v92 + 36));
    v57 = v105;
    *v56 = v104;
    v56[1] = v57;
    v56[2] = v106;
    sub_100008C08(v46, &qword_100056DA8);
    v58 = v93;
    sub_100008CE0(v55, v93, &qword_100056DB0);
    v59 = v100;
    *(_WORD *)(v58 + *(int *)(v100 + 36)) = 0;
    sub_100008C08(v55, &qword_100056DB0);
    v60 = v95;
    sub_1000278E8(v58, v95);
    v61 = v102;
    sub_100008CE0(v60, (uint64_t)v102, &qword_100056DB8);
    swift_storeEnumTagMultiPayload(v61, v101, 0);
    v62 = sub_100004A10(&qword_100056DC0);
    v63 = sub_1000277F4(&qword_100056DC8, &qword_100056DB8, (void (*)(void))sub_100027760);
    v64 = sub_1000277F4(&qword_100056DF0, &qword_100056DC0, (void (*)(void))sub_100027860);
    _ConditionalContent<>.init(storage:)(v61, v59, v62, v63, v64);
    return sub_100008C08(v60, &qword_100056DB8);
  }
  else
  {
    v66 = (uint64_t *)(v99 + *(int *)(v98 + 28));
    v67 = *((unsigned __int8 *)v66 + 16);
    if ((v67 & 1) != 0)
    {
      v68 = 0;
      v69 = 0;
    }
    else
    {
      v69 = *v66;
      v68 = v66[1];
    }
    v70 = static Alignment.center.getter(v32);
    _FrameLayout.init(width:height:alignment:)(&v104, v69, v67, v68, v67, v70, v71);
    v72 = v104;
    v73 = BYTE8(v104);
    v74 = v105;
    v75 = BYTE8(v105);
    v76 = v101;
    v77 = v102;
    *v102 = v31;
    v77[1] = 0;
    *((_WORD *)v77 + 8) = 257;
    v77[3] = v72;
    *((_BYTE *)v77 + 32) = v73;
    v77[5] = v74;
    *((_BYTE *)v77 + 48) = v75;
    *(_OWORD *)(v77 + 7) = v106;
    *((_WORD *)v77 + 36) = 0;
    swift_storeEnumTagMultiPayload(v77, v76, 1);
    v78 = sub_100004A10(&qword_100056DC0);
    v79 = sub_1000277F4(&qword_100056DC8, &qword_100056DB8, (void (*)(void))sub_100027760);
    v80 = sub_1000277F4(&qword_100056DF0, &qword_100056DC0, (void (*)(void))sub_100027860);
    return _ConditionalContent<>.init(storage:)(v77, v100, v78, v79, v80);
  }
}

uint64_t sub_100027760()
{
  return sub_1000173D4(&qword_100056DD0, &qword_100056DB0, (void (*)(void))sub_100027784);
}

uint64_t sub_100027784()
{
  return sub_1000173D4(&qword_100056DD8, &qword_100056DA8, (void (*)(void))sub_100024838);
}

unint64_t sub_1000277A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056DE0;
  if (!qword_100056DE0)
  {
    v1 = sub_100004A50(&qword_100056DE8);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ClipEffect<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100056DE0);
  }
  return result;
}

uint64_t sub_1000277F4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004A50(a2);
    a3();
    sub_1000277A8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100027860()
{
  return sub_1000173D4(&qword_100056DF8, &qword_100056E00, (void (*)(void))sub_100027884);
}

unint64_t sub_100027884()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056E08;
  if (!qword_100056E08)
  {
    v1 = sub_100004A50(&qword_100056E10);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056E08);
  }
  return result;
}

uint64_t sub_1000278E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004A10(&qword_100056DB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for MapViewStyle()
{
  return &type metadata for MapViewStyle;
}

unint64_t sub_100027944()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056E18;
  if (!qword_100056E18)
  {
    v1 = sub_100004A50(&qword_100056E20);
    sub_1000277F4(&qword_100056DC8, &qword_100056DB8, (void (*)(void))sub_100027760);
    sub_1000277F4(&qword_100056DF0, &qword_100056DC0, (void (*)(void))sub_100027860);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100056E18);
  }
  return result;
}

uint64_t (*sub_1000279F0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_100027A4C;
}

uint64_t sub_100027A54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100028138();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100027AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100028138();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100027AF4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100028138();
  return Shape.body.getter(a1, v2);
}

double sub_100027B2C@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  id *v5;
  double Width;
  double Height;
  double result;
  __int128 v14;
  _QWORD v15[5];
  _OWORD v16[2];
  char v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;

  Path.init(_:)(v15, objc_msgSend(*v5, "CGPath"));
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  Width = CGRectGetWidth(v19);
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  Height = CGRectGetHeight(v20);
  if (Height >= Width)
    Height = Width;
  CGAffineTransformMakeScale(&v18, Height, Height);
  Path.applying(_:)(v16, &v18);
  sub_1000280A8((uint64_t)v15);
  result = *(double *)v16;
  v14 = v16[1];
  *(_OWORD *)a1 = v16[0];
  *(_OWORD *)(a1 + 16) = v14;
  *(_BYTE *)(a1 + 32) = v17;
  return result;
}

uint64_t sub_100027C14()
{
  return Shape.sizeThatFits(_:)();
}

void sub_100027C2C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_100027C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000280F4();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100027CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000280F4();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100027CF8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000280F4();
  return Shape.body.getter(a1, v2);
}

void *sub_100027D30(char a1)
{
  id v2;
  void *v3;
  double v4;
  double v5;

  v2 = objc_msgSend(objc_allocWithZone((Class)UIBezierPath), "init");
  v3 = v2;
  v4 = 1.0;
  if ((a1 & 1) != 0)
  {
    v4 = 1.08333333;
    v5 = 0.148889948;
  }
  else
  {
    v5 = 0.0;
  }
  objc_msgSend(v2, "moveToPoint:", 0.5, v4);
  objc_msgSend(v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 0.5, 0.5, 0.5, v5 + 1.57079633, 1.57079633 - v5 + -2.22044605e-16);
  objc_msgSend(v3, "closePath");
  return v3;
}

void *sub_100027DF8(char a1)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_allocWithZone((Class)UIBezierPath), "init");
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "moveToPoint:", 0.5, 1.08333333);
    objc_msgSend(v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, 0.5, 0.5, 0.5, 1.71968627, 1.42190638);
    objc_msgSend(v3, "closePath");
  }
  return v3;
}

ValueMetadata *type metadata accessor for BubbleTipShape()
{
  return &type metadata for BubbleTipShape;
}

ValueMetadata *type metadata accessor for BubbleShape()
{
  return &type metadata for BubbleShape;
}

uint64_t sub_100027EB8()
{
  return sub_100027FD8(&qword_100056E28, &qword_100056E30);
}

unint64_t sub_100027EE0()
{
  unint64_t result;

  result = qword_100056E38;
  if (!qword_100056E38)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyAnimatableData, &type metadata for EmptyAnimatableData);
    atomic_store(result, (unint64_t *)&qword_100056E38);
  }
  return result;
}

unint64_t sub_100027F28()
{
  unint64_t result;

  result = qword_100056E40;
  if (!qword_100056E40)
  {
    result = swift_getWitnessTable(&unk_1000435E0, &type metadata for BubbleShape);
    atomic_store(result, (unint64_t *)&qword_100056E40);
  }
  return result;
}

unint64_t sub_100027F70()
{
  unint64_t result;

  result = qword_100056E48;
  if (!qword_100056E48)
  {
    result = swift_getWitnessTable(&unk_100043590, &type metadata for BubbleShape);
    atomic_store(result, (unint64_t *)&qword_100056E48);
  }
  return result;
}

uint64_t sub_100027FB4()
{
  return sub_100027FD8(&qword_100056E50, &qword_100056E58);
}

uint64_t sub_100027FD8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100004A50(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ShapeView<A, B>, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002801C()
{
  unint64_t result;

  result = qword_100056E60;
  if (!qword_100056E60)
  {
    result = swift_getWitnessTable(&unk_1000436D0, &type metadata for BubbleTipShape);
    atomic_store(result, (unint64_t *)&qword_100056E60);
  }
  return result;
}

unint64_t sub_100028064()
{
  unint64_t result;

  result = qword_100056E68;
  if (!qword_100056E68)
  {
    result = swift_getWitnessTable(&unk_100043680, &type metadata for BubbleTipShape);
    atomic_store(result, (unint64_t *)&qword_100056E68);
  }
  return result;
}

uint64_t sub_1000280A8(uint64_t a1)
{
  sub_1000280DC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

uint64_t sub_1000280DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3)
    return swift_release(result);
  return result;
}

unint64_t sub_1000280F4()
{
  unint64_t result;

  result = qword_100056E70;
  if (!qword_100056E70)
  {
    result = swift_getWitnessTable(&unk_100043720, &type metadata for BubbleTipShape);
    atomic_store(result, (unint64_t *)&qword_100056E70);
  }
  return result;
}

unint64_t sub_100028138()
{
  unint64_t result;

  result = qword_100056E78;
  if (!qword_100056E78)
  {
    result = swift_getWitnessTable(&unk_100043630, &type metadata for BubbleShape);
    atomic_store(result, (unint64_t *)&qword_100056E78);
  }
  return result;
}

void sub_100028180(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, float a6@<S0>)
{
  int *v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  NSString v15;
  void *v16;
  id v17;
  NSString v18;
  id v19;
  NSString v20;
  id v21;
  uint64_t v22;
  id v23;
  NSString v24;
  void *v25;
  id v26;
  NSString v27;
  id v28;
  NSString v29;
  id v30;

  sub_100017510(a1, a5, &qword_100056CE8);
  v11 = (int *)type metadata accessor for BatteryView(0);
  v12 = a5 + v11[5];
  *(float *)v12 = a6;
  *(_BYTE *)(v12 + 4) = a2 & 1;
  *(_BYTE *)(v12 + 5) = BYTE1(a2) & 1;
  *(_BYTE *)(v12 + 6) = BYTE2(a2) & 1;
  *(_QWORD *)(v12 + 8) = a3;
  *(_QWORD *)(v12 + 16) = a4;
  v13 = (_OWORD *)(a5 + v11[6]);
  if (qword_100055AD8 != -1)
    swift_once(&qword_100055AD8, sub_1000284CC);
  v14 = *(_OWORD *)algn_100059070;
  *v13 = xmmword_100059060;
  v13[1] = v14;
  v13[2] = xmmword_100059080;
  v15 = String._bridgeToObjectiveC()();
  v16 = (void *)objc_opt_self(UIImage);
  v17 = objc_msgSend(v16, "imageNamed:", v15);

  if (!v17)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(_QWORD *)(a5 + v11[7]) = v17;
  v18 = String._bridgeToObjectiveC()();
  v19 = objc_msgSend(v16, "imageNamed:", v18);

  if (!v19)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  *(_QWORD *)(a5 + v11[8]) = v19;
  v20 = String._bridgeToObjectiveC()();
  v21 = objc_msgSend(v16, "imageNamed:", v20);

  if (!v21)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v22 = v11[9];
  v23 = objc_msgSend(v21, "imageWithRenderingMode:", 2);

  *(_QWORD *)(a5 + v22) = v23;
  v24 = String._bridgeToObjectiveC()();
  v25 = (void *)objc_opt_self(UIColor);
  v26 = objc_msgSend(v25, "colorNamed:", v24);

  if (!v26)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  *(_QWORD *)(a5 + v11[10]) = v26;
  v27 = String._bridgeToObjectiveC()();
  v28 = objc_msgSend(v25, "colorNamed:", v27);

  if (!v28)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(_QWORD *)(a5 + v11[11]) = v28;
  v29 = String._bridgeToObjectiveC()();
  v30 = objc_msgSend(v25, "colorNamed:", v29);

  if (v30)
  {
    *(_QWORD *)(a5 + v11[12]) = v30;
    return;
  }
LABEL_15:
  __break(1u);
}

uint64_t type metadata accessor for BatteryView(uint64_t a1)
{
  uint64_t result;

  result = qword_100056ED8;
  if (!qword_100056ED8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BatteryView);
  return result;
}

double sub_1000284CC()
{
  double result;

  __asm { FMOV            V0.2D, #2.0 }
  xmmword_100059060 = _Q0;
  *(_OWORD *)algn_100059070 = xmmword_100043770;
  result = 4.0;
  xmmword_100059080 = xmmword_100043780;
  return result;
}

uint64_t *sub_1000284F4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_100004A10((uint64_t *)&unk_100056FC0);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = a3[6];
    v16 = (char *)a1 + v14;
    v17 = (char *)a2 + v14;
    *(_DWORD *)v16 = *(_DWORD *)v17;
    v16[4] = v17[4];
    *(_WORD *)(v16 + 5) = *(_WORD *)(v17 + 5);
    v18 = *((_QWORD *)v17 + 2);
    *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
    *((_QWORD *)v16 + 2) = v18;
    v19 = (_OWORD *)((char *)a1 + v15);
    v20 = (_OWORD *)((char *)a2 + v15);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v19[2] = v20[2];
    v22 = a3[7];
    v23 = a3[8];
    v24 = *(void **)((char *)a2 + v22);
    *(uint64_t *)((char *)a1 + v22) = (uint64_t)v24;
    v25 = *(void **)((char *)a2 + v23);
    *(uint64_t *)((char *)a1 + v23) = (uint64_t)v25;
    v26 = a3[9];
    v27 = a3[10];
    v28 = *(void **)((char *)a2 + v26);
    *(uint64_t *)((char *)a1 + v26) = (uint64_t)v28;
    v29 = *(void **)((char *)a2 + v27);
    *(uint64_t *)((char *)a1 + v27) = (uint64_t)v29;
    v30 = a3[11];
    v31 = a3[12];
    v32 = *(void **)((char *)a2 + v30);
    *(uint64_t *)((char *)a1 + v30) = (uint64_t)v32;
    v33 = *(void **)((char *)a2 + v31);
    *(uint64_t *)((char *)a1 + v31) = (uint64_t)v33;
    swift_bridgeObjectRetain(v18);
    v34 = v24;
    v35 = v25;
    v36 = v28;
    v37 = v29;
    v38 = v32;
    v39 = v33;
  }
  return a1;
}

void sub_10002866C(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100004A10((uint64_t *)&unk_100056FC0);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[5] + 16));

}

uint64_t *sub_100028728(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v6 = sub_100004A10((uint64_t *)&unk_100056FC0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = a3[6];
  v14 = (char *)a1 + v12;
  v15 = (char *)a2 + v12;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  *(_WORD *)(v14 + 5) = *(_WORD *)(v15 + 5);
  v16 = *((_QWORD *)v15 + 2);
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  *((_QWORD *)v14 + 2) = v16;
  v17 = (_OWORD *)((char *)a1 + v13);
  v18 = (_OWORD *)((char *)a2 + v13);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v17[2] = v18[2];
  v20 = a3[7];
  v21 = a3[8];
  v22 = *(void **)((char *)a2 + v20);
  *(uint64_t *)((char *)a1 + v20) = (uint64_t)v22;
  v23 = *(void **)((char *)a2 + v21);
  *(uint64_t *)((char *)a1 + v21) = (uint64_t)v23;
  v24 = a3[9];
  v25 = a3[10];
  v26 = *(void **)((char *)a2 + v24);
  *(uint64_t *)((char *)a1 + v24) = (uint64_t)v26;
  v27 = *(void **)((char *)a2 + v25);
  *(uint64_t *)((char *)a1 + v25) = (uint64_t)v27;
  v28 = a3[11];
  v29 = a3[12];
  v30 = *(void **)((char *)a2 + v28);
  *(uint64_t *)((char *)a1 + v28) = (uint64_t)v30;
  v31 = *(void **)((char *)a2 + v29);
  *(uint64_t *)((char *)a1 + v29) = (uint64_t)v31;
  swift_bridgeObjectRetain(v16);
  v32 = v22;
  v33 = v23;
  v34 = v26;
  v35 = v27;
  v36 = v30;
  v37 = v31;
  return a1;
}

uint64_t *sub_100028874(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, (uint64_t *)&unk_100056FC0);
    v6 = sub_100004A10((uint64_t *)&unk_100056FC0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = a3[5];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_DWORD *)v13 = *(_DWORD *)v14;
  v13[4] = v14[4];
  v13[5] = v14[5];
  v13[6] = v14[6];
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  v15 = *((_QWORD *)v14 + 2);
  v16 = *((_QWORD *)v13 + 2);
  *((_QWORD *)v13 + 2) = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  v17 = a3[6];
  v18 = (uint64_t *)((char *)a1 + v17);
  v19 = (uint64_t *)((char *)a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  v18[2] = v19[2];
  v18[3] = v19[3];
  v18[4] = v19[4];
  v18[5] = v19[5];
  v20 = a3[7];
  v21 = *(void **)((char *)a2 + v20);
  v22 = *(void **)((char *)a1 + v20);
  *(uint64_t *)((char *)a1 + v20) = (uint64_t)v21;
  v23 = v21;

  v24 = a3[8];
  v25 = *(void **)((char *)a2 + v24);
  v26 = *(void **)((char *)a1 + v24);
  *(uint64_t *)((char *)a1 + v24) = (uint64_t)v25;
  v27 = v25;

  v28 = a3[9];
  v29 = *(void **)((char *)a2 + v28);
  v30 = *(void **)((char *)a1 + v28);
  *(uint64_t *)((char *)a1 + v28) = (uint64_t)v29;
  v31 = v29;

  v32 = a3[10];
  v33 = *(void **)((char *)a2 + v32);
  v34 = *(void **)((char *)a1 + v32);
  *(uint64_t *)((char *)a1 + v32) = (uint64_t)v33;
  v35 = v33;

  v36 = a3[11];
  v37 = *(void **)((char *)a2 + v36);
  v38 = *(void **)((char *)a1 + v36);
  *(uint64_t *)((char *)a1 + v36) = (uint64_t)v37;
  v39 = v37;

  v40 = a3[12];
  v41 = *(void **)((char *)a2 + v40);
  v42 = *(void **)((char *)a1 + v40);
  *(uint64_t *)((char *)a1 + v40) = (uint64_t)v41;
  v43 = v41;

  return a1;
}

char *sub_100028A44(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_100004A10((uint64_t *)&unk_100056FC0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  *(_OWORD *)v10 = *(_OWORD *)v11;
  *((_QWORD *)v10 + 2) = *((_QWORD *)v11 + 2);
  v12 = &a1[v9];
  v13 = &a2[v9];
  v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((_OWORD *)v12 + 2) = *((_OWORD *)v13 + 2);
  v15 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v15] = *(_QWORD *)&a2[v15];
  v16 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v16] = *(_QWORD *)&a2[v16];
  v17 = a3[12];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  return a1;
}

char *sub_100028B50(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, (uint64_t *)&unk_100056FC0);
    v6 = sub_100004A10((uint64_t *)&unk_100056FC0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  *(_DWORD *)v9 = *(_DWORD *)v10;
  v9[4] = v10[4];
  v9[5] = v10[5];
  v9[6] = v10[6];
  v12 = *((_QWORD *)v10 + 1);
  v11 = *((_QWORD *)v10 + 2);
  v13 = *((_QWORD *)v9 + 2);
  *((_QWORD *)v9 + 1) = v12;
  *((_QWORD *)v9 + 2) = v11;
  swift_bridgeObjectRelease(v13);
  v14 = a3[6];
  v15 = a3[7];
  v16 = &a1[v14];
  v17 = &a2[v14];
  v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((_OWORD *)v16 + 2) = *((_OWORD *)v17 + 2);
  v19 = *(void **)&a1[v15];
  *(_QWORD *)&a1[v15] = *(_QWORD *)&a2[v15];

  v20 = a3[8];
  v21 = *(void **)&a1[v20];
  *(_QWORD *)&a1[v20] = *(_QWORD *)&a2[v20];

  v22 = a3[9];
  v23 = *(void **)&a1[v22];
  *(_QWORD *)&a1[v22] = *(_QWORD *)&a2[v22];

  v24 = a3[10];
  v25 = *(void **)&a1[v24];
  *(_QWORD *)&a1[v24] = *(_QWORD *)&a2[v24];

  v26 = a3[11];
  v27 = *(void **)&a1[v26];
  *(_QWORD *)&a1[v26] = *(_QWORD *)&a2[v26];

  v28 = a3[12];
  v29 = *(void **)&a1[v28];
  *(_QWORD *)&a1[v28] = *(_QWORD *)&a2[v28];

  return a1;
}

uint64_t sub_100028CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100028CDC);
}

uint64_t sub_100028CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100004A10(&qword_100056CE8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_100028D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100028D68);
}

uint64_t sub_100028D68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100004A10(&qword_100056CE8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

void sub_100028DE4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[9];

  sub_100028E78(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_1000437B0;
    v4[2] = &unk_1000437C8;
    v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[7] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[8] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_initStructMetadata(a1, 256, 9, v4, a1 + 16);
  }
}

void sub_100028E78(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000567B0)
  {
    v2 = type metadata accessor for LayoutDirection(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000567B0);
  }
}

uint64_t sub_100028ECC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100044910, 1);
}

void sub_100028EDC(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(char *, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = type metadata accessor for LayoutDirection(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v28 - v8;
  sub_100007CDC((uint64_t)&v28 - v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, enum case for LayoutDirection.leftToRight(_:), v3);
  v10 = static LayoutDirection.== infix(_:_:)(v9, v7);
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  v11(v9, v3);
  v12 = (int *)type metadata accessor for BatteryView(0);
  v13 = v1 + v12[5];
  if ((*(_BYTE *)(v13 + 5) & 1) != 0)
  {
    v14 = 12;
  }
  else
  {
    v14 = 10;
    if (*(_BYTE *)(v13 + 6))
      v14 = 11;
  }
  v15 = *(void **)(v1 + v12[v14]);
  v16 = (double *)(v1 + v12[6]);
  v17 = v16[5];
  if (v17 * *(float *)v13 > v16[4])
    v18 = v17 * *(float *)v13;
  else
    v18 = v16[4];
  v19 = *(void **)(v1 + v12[7]);
  v20 = v15;
  v21 = objc_msgSend(v19, "size");
  v23 = v16[1];
  if ((v10 & 1) != 0)
  {
    v24 = v17 - v18 + v16[2];
  }
  else
  {
    v23 = v17 + v23 - v18;
    v24 = v16[2];
  }
  v25 = v22 - (*v16 + *v16);
  *(_QWORD *)a1 = static Alignment.center.getter(v21);
  *((_QWORD *)a1 + 1) = v26;
  v27 = sub_100004A10(&qword_100056F30);
  sub_1000290A4(v1, v20, &a1[*(int *)(v27 + 44)], v23, v18, v25, v24);

}

uint64_t sub_1000290A4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
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
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  double (*v39)(char *, char *, uint64_t);
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  void (*v64)(char *, _QWORD, uint64_t, uint64_t);
  char *v65;
  uint64_t v66;
  void *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;

  v66 = a1;
  v67 = a2;
  v73 = a3;
  v12 = sub_100004A10(&qword_100056F38);
  v69 = *(_QWORD *)(v12 - 8);
  v70 = v12;
  __chkstk_darwin(v12);
  v65 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100004A10(&qword_100056F40);
  v15 = __chkstk_darwin(v14);
  v72 = (uint64_t)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v75 = (uint64_t)&v64 - v17;
  v18 = sub_100004A10(&qword_100056F48);
  v19 = __chkstk_darwin(v18);
  v71 = (uint64_t)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v64 - v22;
  __chkstk_darwin(v21);
  v25 = (char *)&v64 - v24;
  v26 = sub_100004A10(&qword_100056650);
  __chkstk_darwin(v26);
  v28 = (char *)&v64 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_100004A10(&qword_100056658);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = __chkstk_darwin(v29);
  v33 = (char *)&v64 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  v35 = (char *)&v64 - v34;
  v36 = (int *)type metadata accessor for BatteryView(0);
  v37 = Image.init(uiImage:)(*(id *)(a1 + v36[7]));
  static WidgetAccentedRenderingMode.desaturated.getter(v37);
  v38 = type metadata accessor for WidgetAccentedRenderingMode(0);
  v64 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56);
  v64(v28, 0, 1, v38);
  Image.widgetAccentedRenderingMode(_:)(v28, v37);
  swift_release(v37);
  sub_100008C08((uint64_t)v28, &qword_100056650);
  v74 = v30;
  v39 = *(double (**)(char *, char *, uint64_t))(v30 + 32);
  v68 = v35;
  v40 = v39(v35, v33, v29);
  *(_QWORD *)v23 = static VerticalAlignment.center.getter(v40);
  *((_QWORD *)v23 + 1) = 0;
  v23[16] = 1;
  v41 = sub_100004A10(&qword_100056F50);
  v42 = v66;
  sub_1000295B0(v66, v67, &v23[*(int *)(v41 + 44)], a4, a5, a6, a7);
  v43 = (uint64_t)v25;
  v44 = (uint64_t)v25;
  v45 = v42;
  sub_100017510((uint64_t)v23, v44, &qword_100056F48);
  if (*(_BYTE *)(v42 + v36[5] + 4) == 1)
  {
    v46 = Image.init(uiImage:)(*(id *)(v42 + v36[8]));
    static WidgetAccentedRenderingMode.desaturated.getter(v46);
    v64(v28, 0, 1, v38);
    Image.widgetAccentedRenderingMode(_:)(v28, v46);
    swift_release(v46);
    sub_100008C08((uint64_t)v28, &qword_100056650);
    v47 = *(_QWORD *)(v45 + v36[6] + 24);
    v48 = v74;
    v49 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
    v50 = (uint64_t)v65;
    v49(v65, v33, v29);
    v51 = v70;
    v52 = (_QWORD *)(v50 + *(int *)(v70 + 36));
    *v52 = v47;
    v52[1] = 0;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v29);
    v53 = v75;
    sub_100017510(v50, v75, &qword_100056F38);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v69 + 56))(v53, 0, 1, v51);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v75, 1, 1, v70);
    v49 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  }
  v54 = v33;
  v55 = v33;
  v56 = v68;
  v49(v54, v68, v29);
  v57 = v71;
  sub_100008CE0(v43, v71, &qword_100056F48);
  v58 = v75;
  v59 = v72;
  sub_100008CE0(v75, v72, &qword_100056F40);
  v60 = v73;
  v49(v73, v55, v29);
  v61 = sub_100004A10(&qword_100056F58);
  sub_100008CE0(v57, (uint64_t)&v60[*(int *)(v61 + 48)], &qword_100056F48);
  sub_100008CE0(v59, (uint64_t)&v60[*(int *)(v61 + 64)], &qword_100056F40);
  sub_100008C08(v58, &qword_100056F40);
  sub_100008C08(v43, &qword_100056F48);
  v62 = *(void (**)(char *, uint64_t))(v74 + 8);
  v62(v56, v29);
  sub_100008C08(v59, &qword_100056F40);
  sub_100008C08(v57, &qword_100056F48);
  return ((uint64_t (*)(char *, uint64_t))v62)(v55, v29);
}

uint64_t sub_1000295B0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t KeyPath;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  id v70;
  _QWORD *v71;
  uint64_t v72;
  unsigned __int8 v73;
  uint64_t v74;
  unsigned __int8 v75;
  uint64_t v76;
  uint64_t v77;
  _OWORD v78[3];
  void *v79;
  char v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;

  v70 = a2;
  v71 = a3;
  v12 = sub_100004A10(&qword_100056650);
  __chkstk_darwin(v12);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Image.ResizingMode(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_100004A10(&qword_100056658);
  v19 = *(_QWORD *)(v61 - 8);
  __chkstk_darwin(v61);
  v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_100004A10(&qword_100056660);
  __chkstk_darwin(v60);
  v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_100004A10(&qword_100056668);
  v24 = __chkstk_darwin(v63);
  v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __chkstk_darwin(v24);
  v62 = (uint64_t)&v59 - v28;
  v29 = static Alignment.center.getter(v27);
  _FrameLayout.init(width:height:alignment:)(&v72, *(_QWORD *)&a4, 0, 0, 1, v29, v30);
  v69 = v72;
  v68 = v73;
  v67 = v74;
  v66 = v75;
  v65 = v76;
  v64 = v77;
  v31 = *(id *)(a1 + *(int *)(type metadata accessor for BatteryView(0) + 36));
  v32 = Image.init(uiImage:)(v31);
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, enum case for Image.ResizingMode.stretch(_:), v15);
  v33 = Image.resizable(capInsets:resizingMode:)(v18, v32, 0.0, 0.0, 0.0, 0.0);
  swift_release(v32);
  v34 = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  static WidgetAccentedRenderingMode.desaturated.getter(v34);
  v35 = type metadata accessor for WidgetAccentedRenderingMode(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v14, 0, 1, v35);
  Image.widgetAccentedRenderingMode(_:)(v14, v33);
  swift_release(v33);
  sub_100008C08((uint64_t)v14, &qword_100056650);
  v36 = Color.init(_:)(v70);
  KeyPath = swift_getKeyPath(&unk_100043830);
  v38 = v61;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v23, v21, v61);
  v39 = (uint64_t *)&v23[*(int *)(v60 + 36)];
  *v39 = KeyPath;
  v39[1] = v36;
  v40 = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v38);
  v41 = static Alignment.center.getter(v40);
  _FrameLayout.init(width:height:alignment:)(v78, *(_QWORD *)&a5, 0, *(_QWORD *)&a6, 0, v41, v42);
  v43 = (uint64_t)v26;
  sub_100008CE0((uint64_t)v23, (uint64_t)v26, &qword_100056660);
  v44 = &v26[*(int *)(v63 + 36)];
  v45 = v78[1];
  *(_OWORD *)v44 = v78[0];
  *((_OWORD *)v44 + 1) = v45;
  *((_OWORD *)v44 + 2) = v78[2];
  sub_100008C08((uint64_t)v23, &qword_100056660);
  v46 = (uint64_t)v26;
  v47 = v62;
  v48 = sub_100017510(v46, v62, &qword_100056668);
  v49 = static Alignment.center.getter(v48);
  _FrameLayout.init(width:height:alignment:)(&v79, *(_QWORD *)&a7, 0, 0, 1, v49, v50);
  v70 = v79;
  LOBYTE(v21) = v80;
  v51 = v81;
  LOBYTE(v23) = v82;
  v52 = v83;
  v53 = v84;
  sub_100008CE0(v47, v43, &qword_100056668);
  v54 = v71;
  *v71 = 0;
  *((_BYTE *)v54 + 8) = 1;
  v54[2] = v69;
  *((_BYTE *)v54 + 24) = v68;
  v54[4] = v67;
  *((_BYTE *)v54 + 40) = v66;
  v55 = v64;
  v54[6] = v65;
  v54[7] = v55;
  v56 = sub_100004A10(&qword_100056F60);
  sub_100008CE0(v43, (uint64_t)v54 + *(int *)(v56 + 48), &qword_100056668);
  v57 = (char *)v54 + *(int *)(v56 + 64);
  *(_QWORD *)v57 = 0;
  v57[8] = 1;
  *((_QWORD *)v57 + 2) = v70;
  v57[24] = (char)v21;
  *((_QWORD *)v57 + 4) = v51;
  v57[40] = (char)v23;
  *((_QWORD *)v57 + 6) = v52;
  *((_QWORD *)v57 + 7) = v53;
  sub_100008C08(v47, &qword_100056668);
  return sub_100008C08(v43, &qword_100056668);
}

__n128 initializeWithCopy for BatteryViewStyle(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BatteryViewStyle(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BatteryViewStyle(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BatteryViewStyle()
{
  return &type metadata for BatteryViewStyle;
}

unint64_t sub_100029B50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056F68;
  if (!qword_100056F68)
  {
    v1 = sub_100004A50((uint64_t *)&unk_100056F70);
    result = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100056F68);
  }
  return result;
}

id sub_100029B9C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char v16;
  void (*v17)(char *, uint64_t);
  double v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  Class isa;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSString v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *object;
  NSString v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  id v57;
  uint64_t v58;
  char *v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  Class v68;
  id v69;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  _QWORD aBlock[5];
  uint64_t v78;

  v76 = type metadata accessor for DispatchTime(0);
  v74 = *(_QWORD *)(v76 - 8);
  v5 = __chkstk_darwin(v76);
  v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v75 = (char *)&v71 - v8;
  v9 = type metadata accessor for LayoutDirection(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v71 - v14;
  sub_100007CDC((uint64_t)&v71 - v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v13, enum case for LayoutDirection.rightToLeft(_:), v9);
  v16 = static LayoutDirection.== infix(_:_:)(v15, v13);
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v17(v15, v9);
  if (qword_100055AE0 != -1)
    swift_once(&qword_100055AE0, sub_10002A270);
  v18 = *(double *)&qword_100059090;
  v19 = (void *)objc_opt_self(CNAvatarImageRenderingScope);
  v20 = (void *)objc_opt_self(UIScreen);
  v21 = objc_msgSend(v20, "mainScreen");
  objc_msgSend(v21, "scale");
  v23 = v22;

  v24 = objc_msgSend(v19, "scopeWithPointSize:scale:rightToLeft:style:", v16 & 1, 0, v18, v18, v23);
  v25 = (void *)sub_10002A8A0(a1, a2);
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, "thumbnailImageData");
    if (v27)
    {
      v28 = v27;
      v29 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v31 = v30;

      v32 = objc_allocWithZone((Class)UIImage);
      sub_10002ADA0(v29, v31);
      isa = Data._bridgeToObjectiveC()().super.isa;
      v34 = objc_msgSend(v32, "initWithData:", isa);
      sub_1000139B0(v29, v31);

      if (v34)
      {
        v35 = (id)sub_10000C164(v18, v18);

        sub_1000139B0(v29, v31);
        swift_unknownObjectRelease(v24);
      }
      else
      {

        sub_1000139B0(v29, v31);
        swift_unknownObjectRelease(v24);
        v35 = 0;
      }
    }
    else
    {
      v63 = *(void **)(v2 + *(int *)(type metadata accessor for ContactsUtilities(0) + 20));
      v64 = sub_100004A10(&qword_100056FA0);
      v65 = swift_allocObject(v64, 40, 7);
      *(_OWORD *)(v65 + 16) = xmmword_100043880;
      *(_QWORD *)(v65 + 32) = v26;
      aBlock[0] = v65;
      specialized Array._endMutation()(v65);
      v66 = aBlock[0];
      sub_10002AD68(0, &qword_100056FA8, CNContact_ptr);
      v67 = v26;
      v68 = Array._bridgeToObjectiveC()().super.isa;
      v35 = objc_msgSend(v63, "avatarImageForContacts:scope:", v68, v24, swift_bridgeObjectRelease(v66).n128_f64[0]);

      swift_unknownObjectRelease(v24);
    }
    v69 = v35;
  }
  else
  {
    v73 = v24;
    v36 = swift_allocObject(&unk_1000527E8, 24, 7);
    v72 = *(id *)(v2 + *(int *)(type metadata accessor for ContactsUtilities(0) + 20));
    v37 = objc_msgSend(v72, "placeholderImageProvider");
    v38 = objc_msgSend(v20, "mainScreen");
    objc_msgSend(v38, "scale");
    v40 = v39;

    v41 = objc_msgSend(v37, "imageForSize:scale:", v18, v18, v40);
    swift_unknownObjectRelease(v37);
    *(_QWORD *)(v36 + 16) = v41;
    sub_10002AD68(0, &qword_100056F88, NSPredicate_ptr);
    v42 = sub_100004A10((uint64_t *)&unk_100056F90);
    v43 = swift_allocObject(v42, 72, 7);
    *(_OWORD *)(v43 + 16) = xmmword_1000429B0;
    *(_QWORD *)(v43 + 56) = &type metadata for String;
    *(_QWORD *)(v43 + 64) = sub_100013CB8();
    *(_QWORD *)(v43 + 32) = 0xD000000000000029;
    *(_QWORD *)(v43 + 40) = 0x8000000100041CA0;
    v44 = (void *)NSPredicate.init(format:_:)(0x54414D20464C4553, 0xEF40252053454843, v43);
    v45 = String._bridgeToObjectiveC()();
    v46 = objc_msgSend(v44, "evaluateWithObject:", v45);

    if (v46 && (swift_bridgeObjectRetain(a2), sub_10000F0CC(a1, a2), v48 = v47, swift_bridgeObjectRelease(a2), v48))
    {
      v49 = dispatch_group_create();
      dispatch_group_enter(v49);
      object = String.uppercased()()._object;
      swift_bridgeObjectRelease(v48);
      v51 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      v52 = swift_allocObject(&unk_100052810, 32, 7);
      *(_QWORD *)(v52 + 16) = v36;
      *(_QWORD *)(v52 + 24) = v49;
      aBlock[4] = sub_10002AD48;
      v78 = v52;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10002A49C;
      aBlock[3] = &unk_100052828;
      v53 = _Block_copy(aBlock);
      v54 = v78;
      swift_retain(v36);
      v55 = v49;
      swift_release(v54);
      v56 = v73;
      v57 = objc_msgSend(v72, "renderMonogramForString:scope:imageHandler:", v51, v73, v53);
      _Block_release(v53);
      swift_unknownObjectRelease(v57);

      static DispatchTime.now()(v58);
      v59 = v75;
      + infix(_:_:)(v7, 0.5);
      v60 = *(void (**)(char *, uint64_t))(v74 + 8);
      v61 = v76;
      v60(v7, v76);
      OS_dispatch_group.wait(timeout:)(v59);

      swift_unknownObjectRelease(v56);
      v60(v59, v61);
    }
    else
    {
      swift_unknownObjectRelease(v73);
    }
    swift_beginAccess(v36 + 16, aBlock, 0, 0);
    v35 = *(id *)(v36 + 16);
    v62 = v35;
    swift_release(v36);
  }
  return v35;
}

void sub_10002A270()
{
  qword_100059090 = 0x405E000000000000;
}

uint64_t sub_10002A280()
{
  uint64_t result;

  result = sub_10002A29C();
  qword_100056F80 = result;
  return result;
}

uint64_t sub_10002A29C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v0 = sub_100004A10(&qword_100056FA0);
  v1 = swift_allocObject(v0, 104, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100043890;
  *(_QWORD *)(v1 + 32) = CNContactTypeKey;
  *(_QWORD *)(v1 + 40) = CNContactIdentifierKey;
  *(_QWORD *)(v1 + 48) = CNContactGivenNameKey;
  *(_QWORD *)(v1 + 56) = CNContactFamilyNameKey;
  *(_QWORD *)(v1 + 64) = CNContactMiddleNameKey;
  *(_QWORD *)(v1 + 72) = CNContactNicknameKey;
  *(_QWORD *)(v1 + 80) = CNContactEmailAddressesKey;
  *(_QWORD *)(v1 + 88) = CNContactPhoneNumbersKey;
  *(_QWORD *)(v1 + 96) = CNContactThumbnailImageDataKey;
  v17 = v1;
  specialized Array._endMutation()(v1);
  v2 = (void *)objc_opt_self(CNContactFormatter);
  v3 = CNContactTypeKey;
  v4 = CNContactIdentifierKey;
  v5 = CNContactGivenNameKey;
  v6 = CNContactFamilyNameKey;
  v7 = CNContactMiddleNameKey;
  v8 = CNContactNicknameKey;
  v9 = CNContactEmailAddressesKey;
  v10 = CNContactPhoneNumbersKey;
  v11 = CNContactThumbnailImageDataKey;
  v12 = objc_msgSend(v2, "descriptorForRequiredKeysForStyle:", 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v12);
  v14 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v14 >= v13 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
  v15 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
  specialized Array._endMutation()(v15);
  return v17;
}

void sub_10002A43C(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  id v7;
  _BYTE v8[24];

  swift_beginAccess(a2 + 16, v8, 1, 0);
  v6 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;
  v7 = a1;

  dispatch_group_leave(a3);
}

void sub_10002A49C(uint64_t a1, void *a2)
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

uint64_t sub_10002A4EC(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  int v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;

  v50 = a3;
  v5 = type metadata accessor for CharacterSet(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v47 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v47 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v47 - v17;
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v47 - v20;
  v22 = __chkstk_darwin(v19);
  v24 = (char *)&v47 - v23;
  v25 = __chkstk_darwin(v22);
  if (!a2)
    goto LABEL_7;
  v27 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v27 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v27)
    goto LABEL_7;
  v49 = (char *)&v47 - v26;
  v28 = static CharacterSet.decimalDigits.getter(v25);
  static CharacterSet.whitespacesAndNewlines.getter(v28);
  v48 = a1;
  CharacterSet.union(_:)(v12);
  v29 = *(void (**)(char *, uint64_t))(v6 + 8);
  v29(v12, v5);
  v30 = ((uint64_t (*)(char *, uint64_t))v29)(v15, v5);
  static CharacterSet.controlCharacters.getter(v30);
  CharacterSet.union(_:)(v15);
  v29(v15, v5);
  v29(v18, v5);
  CharacterSet.init(charactersIn:)(757671979, 0xE400000000000000);
  CharacterSet.union(_:)(v18);
  v29(v18, v5);
  v31 = ((uint64_t (*)(char *, uint64_t))v29)(v21, v5);
  v32 = v49;
  CharacterSet.inverted.getter(v31);
  v29(v24, v5);
  v53 = v48;
  v54 = a2;
  v33 = sub_100024AF0();
  v34 = StringProtocol.rangeOfCharacter(from:options:range:)(v32, 0, 0, 0, 1, &type metadata for String, v33);
  if ((v35 & 1) == 0)
  {
    v29(v32, v5);
LABEL_7:
    v36 = 0;
    return v36 & 1;
  }
  static CharacterSet.decimalDigits.getter(v34);
  CharacterSet.init(charactersIn:)(43, 0xE100000000000000);
  CharacterSet.union(_:)(v18);
  v29(v18, v5);
  v38 = ((uint64_t (*)(char *, uint64_t))v29)(v21, v5);
  CharacterSet.inverted.getter(v38);
  v29(v24, v5);
  v39 = v48;
  v53 = v48;
  v54 = a2;
  swift_bridgeObjectRetain(a2);
  v51 = v39;
  v52 = a2;
  v40 = StringProtocol.rangeOfCharacter(from:options:range:)(v9, 0, 0, 0, 1, &type metadata for String, v33);
  v41 = v39;
  v42 = a2;
  v43 = v39;
  if ((v44 & 1) == 0)
  {
    do
    {
      String.removeSubrange(_:)(v40);
      v41 = v53;
      v42 = v54;
      v51 = v53;
      v52 = v54;
      v40 = StringProtocol.rangeOfCharacter(from:options:range:)(v9, 0, 0, 0, 1, &type metadata for String, v33);
    }
    while ((v45 & 1) == 0);
    v43 = v39;
  }
  if ((v50 & 1) != 0)
  {
    if (v41 == v43 && v42 == a2)
      v36 = 0;
    else
      v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, a2, v41, v42, 0) ^ 1;
  }
  else
  {
    v36 = 1;
  }
  v29(v9, v5);
  v29(v49, v5);
  return v36 & 1;
}

uint64_t sub_10002A8A0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSString v7;
  unsigned int v8;
  void *v9;
  NSString v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  NSString v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  Class isa;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v33;
  id v34;

  sub_10002AD68(0, &qword_100056F88, NSPredicate_ptr);
  v4 = sub_100004A10((uint64_t *)&unk_100056F90);
  v5 = swift_allocObject(v4, 72, 7);
  *(_OWORD *)(v5 + 16) = xmmword_1000429B0;
  *(_QWORD *)(v5 + 56) = &type metadata for String;
  *(_QWORD *)(v5 + 64) = sub_100013CB8();
  *(_QWORD *)(v5 + 32) = 0xD000000000000029;
  *(_QWORD *)(v5 + 40) = 0x8000000100041CA0;
  v6 = (void *)NSPredicate.init(format:_:)(0x54414D20464C4553, 0xEF40252053454843, v5);
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v6, "evaluateWithObject:", v7);

  if (v8)
  {
    v9 = (void *)objc_opt_self(CNContact);
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend(v9, "predicateForContactsMatchingEmailAddress:", v10);
LABEL_5:
    v16 = v11;

    goto LABEL_7;
  }
  v12 = sub_10002A4EC(a1, a2, 0);
  swift_bridgeObjectRelease(v13);
  if ((v12 & 1) != 0)
  {
    v14 = objc_allocWithZone((Class)CNPhoneNumber);
    swift_bridgeObjectRetain(a2);
    v15 = String._bridgeToObjectiveC()();
    v10 = objc_msgSend(v14, "initWithStringValue:", v15, swift_bridgeObjectRelease(a2).n128_f64[0]);

    v11 = objc_msgSend((id)objc_opt_self(CNContact), "predicateForContactsMatchingPhoneNumber:", v10);
    goto LABEL_5;
  }
  v16 = 0;
LABEL_7:
  if (objc_msgSend((id)objc_opt_self(CNContactStore), "authorizationStatusForEntityType:", 0) != (id)3)
  {

    return 0;
  }
  v17 = objc_msgSend(objc_allocWithZone((Class)CNContactStore), "init");
  v18 = v17;
  if (!v16)
  {

    return 0;
  }
  v19 = qword_100055AE8;
  v20 = v16;
  if (v19 != -1)
    swift_once(&qword_100055AE8, sub_10002A280);
  v21 = qword_100056F80;
  swift_bridgeObjectRetain(qword_100056F80);
  sub_100004A10((uint64_t *)&unk_100056FB0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v34 = 0;
  v23 = objc_msgSend(v18, "unifiedContactsMatchingPredicate:keysToFetch:error:", v20, isa, &v34, swift_bridgeObjectRelease(v21).n128_f64[0]);

  v24 = v34;
  if (!v23)
  {
    v30 = v34;
    v31 = _convertNSErrorToError(_:)(v24);

    swift_willThrow();
    swift_errorRelease(v31);
    return 0;
  }
  v25 = sub_10002AD68(0, &qword_100056FA8, CNContact_ptr);
  v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v25);
  v27 = v24;

  if ((unint64_t)v26 >> 62)
  {
    if (v26 < 0)
      v33 = v26;
    else
      v33 = v26 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v26);
    v28 = _CocoaArrayWrapper.endIndex.getter(v33);
    swift_bridgeObjectRelease(v26);
    if (v28)
      goto LABEL_14;
LABEL_27:
    swift_bridgeObjectRelease(v26);

    return v28;
  }
  v28 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v28)
    goto LABEL_27;
LABEL_14:
  if ((v26 & 0xC000000000000001) != 0)
  {
    v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v26);
  }
  else
  {
    if (!*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v29 = *(id *)(v26 + 32);
  }
  v28 = (uint64_t)v29;
  swift_bridgeObjectRelease(v26);

  return v28;
}

uint64_t sub_10002ACBC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t type metadata accessor for ContactsUtilities(uint64_t a1)
{
  uint64_t result;

  result = qword_100057028;
  if (!qword_100057028)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContactsUtilities);
  return result;
}

uint64_t sub_10002AD1C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_10002AD48(void *a1)
{
  uint64_t v1;

  sub_10002A43C(a1, *(_QWORD *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_10002AD50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002AD60(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002AD68(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10002ADA0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t *sub_10002ADE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_100004A10((uint64_t *)&unk_100056FC0);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)a1 + v14) = (uint64_t)v15;
    v16 = v15;
  }
  return a1;
}

void sub_10002AEC0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100004A10((uint64_t *)&unk_100056FC0);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }

}

uint64_t *sub_10002AF30(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = sub_100004A10((uint64_t *)&unk_100056FC0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = *(void **)((char *)a2 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
  v14 = v13;
  return a1;
}

uint64_t *sub_10002AFE0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  if (a1 != a2)
  {
    sub_10002B0A8((uint64_t)a1);
    v6 = sub_100004A10((uint64_t *)&unk_100056FC0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = *(int *)(a3 + 20);
  v13 = *(void **)((char *)a2 + v12);
  v14 = *(void **)((char *)a1 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
  v15 = v13;

  return a1;
}

uint64_t sub_10002B0A8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004A10((uint64_t *)&unk_100056FC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_10002B0E8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_100004A10((uint64_t *)&unk_100056FC0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_10002B190(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a1 != a2)
  {
    sub_10002B0A8((uint64_t)a1);
    v6 = sub_100004A10((uint64_t *)&unk_100056FC0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = *(void **)&a1[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];

  return a1;
}

uint64_t sub_10002B250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002B25C);
}

uint64_t sub_10002B25C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100004A10(&qword_100056CE8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10002B2DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002B2E8);
}

uint64_t sub_10002B2E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100004A10(&qword_100056CE8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

void sub_10002B364(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  sub_100028E78(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

uint64_t sub_10002B3D8(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = sub_100004A10((uint64_t *)&unk_100056F90);
  v5 = swift_allocObject(v4, 152, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100043480;
  objc_msgSend(a1, "coordinate");
  *(_QWORD *)(v5 + 56) = &type metadata for Double;
  *(_QWORD *)(v5 + 64) = &protocol witness table for Double;
  *(_QWORD *)(v5 + 32) = v6;
  objc_msgSend(a1, "coordinate");
  *(_QWORD *)(v5 + 96) = &type metadata for Double;
  *(_QWORD *)(v5 + 104) = &protocol witness table for Double;
  *(_QWORD *)(v5 + 72) = v7;
  v8 = sub_100013CB8();
  v9 = 0x80919FF020;
  v10 = 0xE000000000000000;
  if ((a2 & 1) != 0)
    v10 = 0xA500000000000000;
  else
    v9 = 0;
  *(_QWORD *)(v5 + 136) = &type metadata for String;
  *(_QWORD *)(v5 + 144) = v8;
  *(_QWORD *)(v5 + 112) = v9;
  *(_QWORD *)(v5 + 120) = v10;
  return String.init(format:_:)(0x1000000000000017, 0x8000000100041CF0, v5);
}

id sub_10002B4BC(uint64_t a1, uint64_t a2, unint64_t a3, double a4)
{
  char *v4;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;

  v9 = OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_geoTraits;
  v10 = (void *)objc_opt_self(GEOMapService);
  v11 = v4;
  v12 = objc_msgSend(v10, "sharedService");
  v13 = objc_msgSend(v12, "defaultTraits");

  *(_QWORD *)&v4[v9] = v13;
  v14 = OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_geoService;
  *(_QWORD *)&v11[v14] = objc_msgSend(v10, "sharedService");
  *(_QWORD *)&v11[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_currentLocation] = 0;
  v11[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_deinited] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_userDefaultsManager] = a1;
  v15 = (uint64_t *)&v11[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_instanceId];
  v45 = a2;
  *v15 = a2;
  v15[1] = a3;
  swift_bridgeObjectRetain_n(a3, 2);
  v46 = a1;
  swift_retain(a1);
  v16 = sub_1000335AC(a2, a3, a4);
  v18 = v17;
  v20 = v19;
  v21 = v16;
  v23 = v22;
  v24 = &v11[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_mapGenerator];
  *(_QWORD *)v24 = v17;
  *((_QWORD *)v24 + 1) = v19;
  *((double *)v24 + 2) = v16;
  *((_QWORD *)v24 + 3) = v22;
  v25 = type metadata accessor for PeopleDataService();
  v26 = swift_allocObject(v25, 129, 7);
  *(_OWORD *)(v26 + 72) = 0u;
  *(_OWORD *)(v26 + 88) = 0u;
  v27 = objc_allocWithZone((Class)CLGeocoder);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(v20);
  v28 = v23;
  swift_retain(v26);
  *(_QWORD *)(v26 + 104) = objc_msgSend(v27, "init");
  *(_QWORD *)(v26 + 112) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(v26 + 120) = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  *(_BYTE *)(v26 + 128) = 2;
  v29 = *(_QWORD *)(v26 + 72);
  v30 = *(_QWORD *)(v26 + 80);
  v31 = *(_QWORD *)(v26 + 88);
  v32 = *(void **)(v26 + 96);
  *(_QWORD *)(v26 + 72) = v18;
  *(_QWORD *)(v26 + 80) = v20;
  *(double *)(v26 + 88) = v21;
  *(_QWORD *)(v26 + 96) = v28;
  swift_bridgeObjectRetain(v20);
  v33 = v28;
  sub_10002C0F0(v29, v30, v31, v32);
  swift_release(v26);
  v34 = sub_1000301CC(v45, a3, a4);

  swift_bridgeObjectRelease(v20);
  *(_QWORD *)&v11[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_peopleDataService] = v34;

  v49.receiver = v11;
  v49.super_class = (Class)type metadata accessor for DataManager();
  v35 = objc_msgSendSuper2(&v49, "init");
  v36 = qword_100055AC8;
  v37 = v35;
  if (v36 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v38 = type metadata accessor for Logger(0);
  sub_100007E94(v38, (uint64_t)qword_100059040);
  v39 = swift_bridgeObjectRetain(a3);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc(12, -1);
    v43 = swift_slowAlloc(32, -1);
    v48 = v43;
    *(_DWORD *)v42 = 136315138;
    swift_bridgeObjectRetain(a3);
    v47 = sub_100008084(v45, a3, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v42 + 4, v42 + 12);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "🥑 DataManager%s: init", v42, 0xCu);
    swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1, -1);
    swift_slowDealloc(v42, -1, -1);

    swift_release(v46);
  }
  else
  {

    swift_release(v46);
    swift_bridgeObjectRelease_n(a3, 2);
  }
  return v37;
}

id sub_10002B8B4()
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
  objc_class *v9;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v1 = type metadata accessor for Logger(0);
  sub_100007E94(v1, (uint64_t)qword_100059040);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v12 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = *(_QWORD *)&v2[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_instanceId];
    v8 = *(_QWORD *)&v2[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_instanceId + 8];
    swift_bridgeObjectRetain(v8);
    v11 = sub_100008084(v7, v8, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v5 + 4, v5 + 12);

    swift_bridgeObjectRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "🥑 DataManager%s: deinit", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  v9 = (objc_class *)type metadata accessor for DataManager();
  v13.receiver = v2;
  v13.super_class = v9;
  return objc_msgSendSuper2(&v13, "dealloc");
}

uint64_t sub_10002BB30(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v14 = type metadata accessor for Logger(0);
  sub_100007E94(v14, (uint64_t)qword_100059040);
  v15 = a1;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(22, -1);
    v34 = a3;
    v19 = swift_slowAlloc(64, -1);
    v36 = v19;
    *(_DWORD *)v18 = 136315394;
    v33 = a4;
    v20 = a2;
    v21 = *(_QWORD *)&v15[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_instanceId];
    v22 = *(_QWORD *)&v15[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_instanceId + 8];
    swift_bridgeObjectRetain(v22);
    v35 = sub_100008084(v21, v22, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v18 + 4, v18 + 12);

    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v18 + 12) = 2080;
    v23 = CGSize.debugDescription.getter(a6, a7);
    v25 = v24;
    v35 = sub_100008084(v23, v24, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v18 + 14, v18 + 22);
    v26 = v25;
    a2 = v20;
    a4 = v33;
    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "🥑 DataManager%s: create data for %s…", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy(v19, 2, (char *)&type metadata for Any + 8);
    v27 = v19;
    a3 = v34;
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v18, -1, -1);

  }
  else
  {

  }
  v28 = *(void **)&v15[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_currentLocation];
  v29 = swift_allocObject(&unk_100052860, 64, 7);
  *(_QWORD *)(v29 + 16) = v15;
  *(_BYTE *)(v29 + 24) = v28 != 0;
  *(double *)(v29 + 32) = a6;
  *(double *)(v29 + 40) = a7;
  *(_QWORD *)(v29 + 48) = a4;
  *(_QWORD *)(v29 + 56) = a5;
  v30 = v28;
  swift_retain(a5);
  v31 = v15;
  sub_1000366C0(a2, a3, (uint64_t)v28, (void (*)(_QWORD))sub_10002C0DC, v29, a6, a7);

  return swift_release(v29);
}

uint64_t sub_10002BDDC(uint64_t a1, void *a2, char a3, uint64_t (*a4)(_QWORD), double a5, double a6)
{
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD);
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v12 = type metadata accessor for Logger(0);
  sub_100007E94(v12, (uint64_t)qword_100059040);
  v13 = a2;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc(32, -1);
    v17 = swift_slowAlloc(96, -1);
    v29 = v17;
    *(_DWORD *)v16 = 136315650;
    v27 = a1;
    v18 = a4;
    v20 = *(_QWORD *)&v13[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_instanceId];
    v19 = *(_QWORD *)&v13[OBJC_IVAR____TtC18FindMyWidgetPeople11DataManager_instanceId + 8];
    swift_bridgeObjectRetain(v19);
    v28 = sub_100008084(v20, v19, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v16 + 4, v16 + 12);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v16 + 12) = 2080;
    if ((a3 & 1) != 0)
      v21 = 1752459639;
    else
      v21 = 0x74756F68746977;
    if ((a3 & 1) != 0)
      v22 = 0xE400000000000000;
    else
      v22 = 0xE700000000000000;
    v28 = sub_100008084(v21, v22, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v16 + 14, v16 + 22);
    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v16 + 22) = 2080;
    v23 = CGSize.debugDescription.getter(a5, a6);
    v25 = v24;
    v28 = sub_100008084(v23, v24, &v29);
    a4 = v18;
    a1 = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v16 + 24, v16 + 32);
    swift_bridgeObjectRelease(v25);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "🥑 DataManager%s: created data (%s own location) for %s", (uint8_t *)v16, 0x20u);
    swift_arrayDestroy(v17, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);

  }
  else
  {

  }
  return a4(a1);
}

uint64_t type metadata accessor for DataManager()
{
  return objc_opt_self(_TtC18FindMyWidgetPeople11DataManager);
}

uint64_t sub_10002C0B0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002C0DC(uint64_t a1)
{
  uint64_t v1;

  return sub_10002BDDC(a1, *(void **)(v1 + 16), *(_BYTE *)(v1 + 24), *(uint64_t (**)(_QWORD))(v1 + 48), *(double *)(v1 + 32), *(double *)(v1 + 40));
}

void sub_10002C0F0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    swift_bridgeObjectRelease(a2);

  }
}

uint64_t *sub_10002C120(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_100004A10(&qword_100056A00);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = a3[6];
    v16 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)a1 + v14) = (uint64_t)v16;
    v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)a1 + v15) = (uint64_t)v17;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    v18 = v16;
    v19 = v17;
  }
  return a1;
}

void sub_10002C214(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100004A10(&qword_100056A00);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }

}

uint64_t *sub_10002C290(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v6 = sub_100004A10(&qword_100056A00);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = a3[6];
  v14 = *(void **)((char *)a2 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v14;
  v15 = *(void **)((char *)a2 + v13);
  *(uint64_t *)((char *)a1 + v13) = (uint64_t)v15;
  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  v16 = v14;
  v17 = v15;
  return a1;
}

uint64_t *sub_10002C358(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100056A00);
    v6 = sub_100004A10(&qword_100056A00);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = a3[5];
  v13 = *(void **)((char *)a2 + v12);
  v14 = *(void **)((char *)a1 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
  v15 = v13;

  v16 = a3[6];
  v17 = *(void **)((char *)a2 + v16);
  v18 = *(void **)((char *)a1 + v16);
  *(uint64_t *)((char *)a1 + v16) = (uint64_t)v17;
  v19 = v17;

  *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  return a1;
}

char *sub_10002C44C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_100004A10(&qword_100056A00);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  return a1;
}

char *sub_10002C508(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100056A00);
    v6 = sub_100004A10(&qword_100056A00);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = *(void **)&a1[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];

  v10 = a3[6];
  v11 = *(void **)&a1[v10];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];

  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  return a1;
}

uint64_t sub_10002C5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002C5FC);
}

uint64_t sub_10002C5FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100004A10(&qword_1000570D8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10002C67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002C688);
}

uint64_t sub_10002C688(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100004A10(&qword_1000570D8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SizeCategoryAwareMinimumScaleFactor(uint64_t a1)
{
  uint64_t result;

  result = qword_100057138;
  if (!qword_100057138)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SizeCategoryAwareMinimumScaleFactor);
  return result;
}

void sub_10002C740(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  sub_10002C7C0(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = "\b";
    v4[2] = "\b";
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

void sub_10002C7C0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100057148)
  {
    v2 = type metadata accessor for ContentSizeCategory(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100057148);
  }
}

uint64_t sub_10002C814(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100044A04, 1);
}

uint64_t sub_10002C824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v5 = sub_100004A10(&qword_100057180);
  __chkstk_darwin(v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for SizeCategoryAwareMinimumScaleFactor(0);
  v9 = *(_QWORD *)(v2 + v8[7]);
  KeyPath = swift_getKeyPath(&unk_1000439C0);
  v11 = sub_100004A10(&qword_100057188);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v7, a1, v11);
  v12 = &v7[*(int *)(v5 + 36)];
  *(_QWORD *)v12 = KeyPath;
  *((_QWORD *)v12 + 1) = v9;
  v12[16] = 0;
  v13 = (void *)objc_opt_self(UIFont);
  v14 = objc_msgSend(v13, "preferredFontForTextStyle:", *(_QWORD *)(v2 + v8[5]));
  objc_msgSend(v14, "pointSize");
  v16 = v15;

  v17 = objc_msgSend(v13, "preferredFontForTextStyle:", *(_QWORD *)(v2 + v8[6]));
  objc_msgSend(v17, "pointSize");
  v19 = v18;

  v20 = swift_getKeyPath(&unk_1000439F0);
  sub_10002C9F8((uint64_t)v7, a2);
  v21 = a2 + *(int *)(sub_100004A10(&qword_100057190) + 36);
  *(_QWORD *)v21 = v20;
  *(double *)(v21 + 8) = v16 / v19;
  return sub_100008C08((uint64_t)v7, &qword_100057180);
}

uint64_t sub_10002C9CC()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_10002C9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004A10(&qword_100057180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10002CA44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100057198;
  if (!qword_100057198)
  {
    v1 = sub_100004A50(&qword_100057190);
    sub_10002CAC8();
    sub_100008D24(&qword_100056C20, &qword_100056C28, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100057198);
  }
  return result;
}

unint64_t sub_10002CAC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000571A0;
  if (!qword_1000571A0)
  {
    v1 = sub_100004A50(&qword_100057180);
    sub_100008D24(&qword_1000571A8, &qword_100057188, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    sub_100008D24(&qword_100056C10, &qword_100056C18, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000571A0);
  }
  return result;
}

id sub_10002CB64(void *a1)
{
  id v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v1 = objc_msgSend(a1, "userInterfaceStyle");
  v2 = objc_allocWithZone((Class)UIColor);
  if (v1 == (id)2)
  {
    v3 = 0.556862745;
    v4 = 0.576470588;
    v5 = 1.0;
    v6 = 0.556862745;
  }
  else
  {
    v3 = 1.0;
    v6 = 1.0;
    v4 = 1.0;
    v5 = 1.0;
  }
  return objc_msgSend(v2, "initWithRed:green:blue:alpha:", v3, v6, v4, v5);
}

double sub_10002CBD4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  uint64_t v14;
  uint64_t v15;

  v0 = type metadata accessor for Color.RGBColorSpace(0);
  __chkstk_darwin();
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = enum case for Color.RGBColorSpace.sRGB(_:);
  v5 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v5(v2, enum case for Color.RGBColorSpace.sRGB(_:), v0);
  v15 = Color.init(_:red:green:blue:opacity:)(v2, 1.0, 1.0, 1.0, 1.0);
  v5(v2, v3, v0);
  v14 = Color.init(_:red:green:blue:opacity:)(v2, 0.0, 0.0, 0.0, 0.06);
  v5(v2, v3, v0);
  v6 = Color.init(_:red:green:blue:opacity:)(v2, 0.0, 0.0, 0.0, 0.08);
  v5(v2, v3, v0);
  v7 = Color.init(_:red:green:blue:opacity:)(v2, 0.0, 0.0, 0.0, 0.1);
  v5(v2, v3, v0);
  v8 = Color.init(_:red:green:blue:opacity:)(v2, 0.0, 0.0, 0.0, 0.06);
  v5(v2, v3, v0);
  v9 = Color.init(_:red:green:blue:opacity:)(v2, 0.56, 0.56, 0.58, 1.0);
  v5(v2, v3, v0);
  v10 = Color.init(_:red:green:blue:opacity:)(v2, 1.0, 1.0, 1.0, 0.2);
  v5(v2, v3, v0);
  v11 = Color.init(_:red:green:blue:opacity:)(v2, 0.0, 0.0, 0.0, 0.45);
  v5(v2, v3, v0);
  v12 = Color.init(_:red:green:blue:opacity:)(v2, 0.0, 0.0, 0.0, 0.06);
  xmmword_1000590A0 = xmmword_100043A60;
  *(_QWORD *)&xmmword_1000590B0 = 0xC018000000000000;
  *((_QWORD *)&xmmword_1000590B0 + 1) = v15;
  *(_QWORD *)&xmmword_1000590C0 = v14;
  *((_QWORD *)&xmmword_1000590C0 + 1) = v6;
  result = 0.0;
  xmmword_1000590D0 = xmmword_100043A70;
  *(_QWORD *)&xmmword_1000590E0 = 0x3FA0842108421084;
  *((_QWORD *)&xmmword_1000590E0 + 1) = v7;
  xmmword_1000590F0 = xmmword_100043A80;
  *(_QWORD *)&xmmword_100059100 = 0x3FB71F6171F6171FLL;
  *((_QWORD *)&xmmword_100059100 + 1) = v8;
  xmmword_100059110 = xmmword_100043A90;
  *(_QWORD *)&xmmword_100059120 = 0x3FA3D1C13D1C13D2;
  *((_QWORD *)&xmmword_100059120 + 1) = v9;
  *(_QWORD *)&xmmword_100059130 = v10;
  *((_QWORD *)&xmmword_100059130 + 1) = v11;
  xmmword_100059140 = xmmword_100043AA0;
  *(_QWORD *)&xmmword_100059150 = 0x3FC0842108421084;
  *((_QWORD *)&xmmword_100059150 + 1) = v12;
  xmmword_100059160 = xmmword_100043A70;
  qword_100059170 = 0x3FA0842108421084;
  return result;
}

uint64_t destroy for AvatarViewStyle(_QWORD *a1)
{
  swift_release(a1[3]);
  swift_release(a1[4]);
  swift_release(a1[5]);
  swift_release(a1[9]);
  swift_release(a1[13]);
  swift_release(a1[17]);
  swift_release(a1[18]);
  swift_release(a1[19]);
  return swift_release(a1[23]);
}

uint64_t initializeWithCopy for AvatarViewStyle(uint64_t a1, uint64_t a2)
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

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  v8 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v8;
  v9 = *(_QWORD *)(a2 + 144);
  v10 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = v9;
  *(_QWORD *)(a1 + 152) = v10;
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  v11 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v11;
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_retain(v9);
  swift_retain(v10);
  swift_retain(v11);
  return a1;
}

_QWORD *assignWithCopy for AvatarViewStyle(_QWORD *a1, _QWORD *a2)
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
  uint64_t v21;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = a2[3];
  v5 = a1[3];
  a1[3] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[4];
  v7 = a1[4];
  a1[4] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_retain(v8);
  swift_release(v9);
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  v10 = a2[9];
  v11 = a1[9];
  a1[9] = v10;
  swift_retain(v10);
  swift_release(v11);
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  v12 = a2[13];
  v13 = a1[13];
  a1[13] = v12;
  swift_retain(v12);
  swift_release(v13);
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  v14 = a2[17];
  v15 = a1[17];
  a1[17] = v14;
  swift_retain(v14);
  swift_release(v15);
  v16 = a2[18];
  v17 = a1[18];
  a1[18] = v16;
  swift_retain(v16);
  swift_release(v17);
  v18 = a2[19];
  v19 = a1[19];
  a1[19] = v18;
  swift_retain(v18);
  swift_release(v19);
  a1[20] = a2[20];
  a1[21] = a2[21];
  a1[22] = a2[22];
  v20 = a2[23];
  v21 = a1[23];
  a1[23] = v20;
  swift_retain(v20);
  swift_release(v21);
  a1[24] = a2[24];
  a1[25] = a2[25];
  a1[26] = a2[26];
  return a1;
}

__n128 initializeWithTake for AvatarViewStyle(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t assignWithTake for AvatarViewStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release(*(_QWORD *)(a1 + 24));
  v4 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v4);
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v5);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release(v6);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v7 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release(v7);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_release(*(_QWORD *)(a1 + 136));
  v8 = *(_QWORD *)(a1 + 144);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release(v8);
  v9 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_release(v9);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  v10 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_release(v10);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarViewStyle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 216))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarViewStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 216) = 1;
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
    *(_BYTE *)(result + 216) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarViewStyle()
{
  return &type metadata for AvatarViewStyle;
}

uint64_t *sub_10002D3BC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4, a2, v8);
      v9 = v4;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *v4 = *a2;
      swift_retain(v13);
      v9 = v4;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = a3[6];
    v16 = (uint64_t *)((char *)v4 + v14);
    v17 = (uint64_t *)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = (char *)v4 + v15;
    v20 = (char *)a2 + v15;
    *(_QWORD *)v19 = *(_QWORD *)v20;
    v19[8] = v20[8];
    v21 = a3[7];
    v22 = a3[8];
    v23 = (char *)v4 + v21;
    v24 = (char *)a2 + v21;
    *(_OWORD *)v23 = *(_OWORD *)v24;
    v23[16] = v24[16];
    v25 = (char *)v4 + v22;
    v26 = (char *)a2 + v22;
    *(_OWORD *)v25 = *(_OWORD *)v26;
    v27 = *((_QWORD *)v26 + 3);
    *((_QWORD *)v25 + 2) = *((_QWORD *)v26 + 2);
    *((_QWORD *)v25 + 3) = v27;
    v28 = *((_QWORD *)v26 + 4);
    v29 = *((_QWORD *)v26 + 5);
    *((_QWORD *)v25 + 4) = v28;
    *((_QWORD *)v25 + 5) = v29;
    *((_OWORD *)v25 + 3) = *((_OWORD *)v26 + 3);
    v30 = *((_QWORD *)v26 + 9);
    *((_QWORD *)v25 + 8) = *((_QWORD *)v26 + 8);
    *((_QWORD *)v25 + 9) = v30;
    v12 = *((_QWORD *)v26 + 10);
    *((_QWORD *)v25 + 10) = v12;
    *(_OWORD *)(v25 + 88) = *(_OWORD *)(v26 + 88);
    *((_QWORD *)v25 + 13) = *((_QWORD *)v26 + 13);
    swift_bridgeObjectRetain(v18);
    swift_retain(v27);
    swift_retain(v28);
    swift_retain(v29);
    swift_retain(v30);
  }
  swift_retain(v12);
  return v4;
}

uint64_t sub_10002D548(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + *(int *)(a2 + 20) + 8));
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 32));
  swift_release(v6[3]);
  swift_release(v6[4]);
  swift_release(v6[5]);
  swift_release(v6[9]);
  return swift_release(v6[10]);
}

uint64_t *sub_10002D5EC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = a3[6];
  v14 = (uint64_t *)((char *)a1 + v12);
  v15 = (uint64_t *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (char *)a1 + v13;
  v18 = (char *)a2 + v13;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  v19 = a3[7];
  v20 = a3[8];
  v21 = (char *)a1 + v19;
  v22 = (char *)a2 + v19;
  *(_OWORD *)v21 = *(_OWORD *)v22;
  v21[16] = v22[16];
  v23 = (char *)a1 + v20;
  v24 = (char *)a2 + v20;
  *(_OWORD *)v23 = *(_OWORD *)v24;
  v25 = *((_QWORD *)v24 + 3);
  *((_QWORD *)v23 + 2) = *((_QWORD *)v24 + 2);
  *((_QWORD *)v23 + 3) = v25;
  v26 = *((_QWORD *)v24 + 4);
  v27 = *((_QWORD *)v24 + 5);
  *((_QWORD *)v23 + 4) = v26;
  *((_QWORD *)v23 + 5) = v27;
  *((_OWORD *)v23 + 3) = *((_OWORD *)v24 + 3);
  v28 = *((_QWORD *)v24 + 9);
  *((_QWORD *)v23 + 8) = *((_QWORD *)v24 + 8);
  *((_QWORD *)v23 + 9) = v28;
  v29 = *((_QWORD *)v24 + 10);
  *((_QWORD *)v23 + 10) = v29;
  *(_OWORD *)(v23 + 88) = *(_OWORD *)(v24 + 88);
  *((_QWORD *)v23 + 13) = *((_QWORD *)v24 + 13);
  swift_bridgeObjectRetain(v16);
  swift_retain(v25);
  swift_retain(v26);
  swift_retain(v27);
  swift_retain(v28);
  swift_retain(v29);
  return a1;
}

uint64_t *sub_10002D750(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
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

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = a3[5];
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  *v13 = *v14;
  v15 = v14[1];
  v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  v17 = a3[6];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = *(_QWORD *)v19;
  v18[8] = v19[8];
  *(_QWORD *)v18 = v20;
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_OWORD *)v23;
  v22[16] = v23[16];
  *(_OWORD *)v22 = v24;
  v25 = a3[8];
  v26 = (uint64_t *)((char *)a1 + v25);
  v27 = (uint64_t *)((char *)a2 + v25);
  *v26 = *(uint64_t *)((char *)a2 + v25);
  v26[1] = *(uint64_t *)((char *)a2 + v25 + 8);
  v26[2] = *(uint64_t *)((char *)a2 + v25 + 16);
  v28 = *(uint64_t *)((char *)a2 + v25 + 24);
  v29 = *(uint64_t *)((char *)a1 + v25 + 24);
  v26[3] = v28;
  swift_retain(v28);
  swift_release(v29);
  v30 = v27[4];
  v31 = v26[4];
  v26[4] = v30;
  swift_retain(v30);
  swift_release(v31);
  v32 = v27[5];
  v33 = v26[5];
  v26[5] = v32;
  swift_retain(v32);
  swift_release(v33);
  v26[6] = v27[6];
  v26[7] = v27[7];
  v26[8] = v27[8];
  v34 = v27[9];
  v35 = v26[9];
  v26[9] = v34;
  swift_retain(v34);
  swift_release(v35);
  v36 = v27[10];
  v37 = v26[10];
  v26[10] = v36;
  swift_retain(v36);
  swift_release(v37);
  v26[11] = v27[11];
  v26[12] = v27[12];
  v26[13] = v27[13];
  return a1;
}

char *sub_10002D938(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v9[8] = v10[8];
  *(_QWORD *)v9 = *(_QWORD *)v10;
  v11 = a3[7];
  v12 = a3[8];
  v13 = &a1[v11];
  v14 = &a2[v11];
  v13[16] = v14[16];
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v15 = &a1[v12];
  v16 = &a2[v12];
  v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  v18 = *((_OWORD *)v16 + 3);
  *((_OWORD *)v15 + 2) = *((_OWORD *)v16 + 2);
  *((_OWORD *)v15 + 3) = v18;
  v19 = *((_OWORD *)v16 + 5);
  *((_OWORD *)v15 + 4) = *((_OWORD *)v16 + 4);
  *((_OWORD *)v15 + 5) = v19;
  *((_OWORD *)v15 + 6) = *((_OWORD *)v16 + 6);
  return a1;
}

char *sub_10002DA3C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  v13 = *((_QWORD *)v9 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_bridgeObjectRelease(v13);
  v14 = a3[6];
  v15 = a3[7];
  v16 = &a1[v14];
  v17 = &a2[v14];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  v16[8] = v17[8];
  v18 = &a1[v15];
  v19 = &a2[v15];
  *(_OWORD *)v18 = *(_OWORD *)v19;
  v18[16] = v19[16];
  v20 = a3[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
  v23 = *(_QWORD *)&a1[v20 + 24];
  *((_QWORD *)v21 + 3) = *((_QWORD *)v22 + 3);
  swift_release(v23);
  v24 = *((_QWORD *)v21 + 4);
  *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
  swift_release(v24);
  v25 = *((_QWORD *)v21 + 5);
  *((_QWORD *)v21 + 5) = *((_QWORD *)v22 + 5);
  swift_release(v25);
  *((_OWORD *)v21 + 3) = *((_OWORD *)v22 + 3);
  *((_QWORD *)v21 + 8) = *((_QWORD *)v22 + 8);
  v26 = *((_QWORD *)v21 + 9);
  *((_QWORD *)v21 + 9) = *((_QWORD *)v22 + 9);
  swift_release(v26);
  v27 = *((_QWORD *)v21 + 10);
  *((_QWORD *)v21 + 10) = *((_QWORD *)v22 + 10);
  swift_release(v27);
  *(_OWORD *)(v21 + 88) = *(_OWORD *)(v22 + 88);
  *((_QWORD *)v21 + 13) = *((_QWORD *)v22 + 13);
  return a1;
}

uint64_t sub_10002DBCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002DBD8);
}

uint64_t sub_10002DBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100004A10(&qword_100055E38);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10002DC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002DC68);
}

uint64_t sub_10002DC68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100004A10(&qword_100055E38);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32) + 24) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for BadgeView(uint64_t a1)
{
  uint64_t result;

  result = qword_100057208;
  if (!qword_100057208)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BadgeView);
  return result;
}

void sub_10002DD24(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  sub_10002DDB4(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_100043B00;
    v4[2] = &unk_100043B18;
    v4[3] = &unk_100043B30;
    v4[4] = &unk_100043B48;
    swift_initStructMetadata(a1, 256, 5, v4, a1 + 16);
  }
}

void sub_10002DDB4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100055EC8)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100055EC8);
  }
}

uint64_t sub_10002DE08(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100044A70, 1);
}

double sub_10002DE18@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(char *, uint64_t);
  _QWORD *v12;
  uint64_t *v13;
  double *v14;
  double *v15;
  double *v16;
  uint64_t *v17;
  double *v18;
  double *v19;
  double *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double result;
  __int128 v35;
  _OWORD v36[12];
  _OWORD v37[2];

  v3 = type metadata accessor for ColorScheme(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)v36 - v8;
  sub_100007A74((uint64_t)v36 - v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, enum case for ColorScheme.dark(_:), v3);
  v10 = static ColorScheme.== infix(_:_:)(v9, v7);
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  v11(v9, v3);
  v12 = (_QWORD *)(v1 + *(int *)(type metadata accessor for BadgeView(0) + 32));
  v13 = v12 + 4;
  v14 = (double *)(v12 + 8);
  v15 = (double *)(v12 + 6);
  v16 = (double *)(v12 + 7);
  v17 = v12 + 9;
  v18 = (double *)(v12 + 13);
  v19 = (double *)(v12 + 11);
  v20 = (double *)(v12 + 12);
  if ((v10 & 1) != 0)
    v13 = v17;
  else
    v20 = v16;
  if ((v10 & 1) != 0)
  {
    v15 = v19;
    v14 = v18;
  }
  v21 = *v13;
  v22 = *v14;
  v23 = *v15;
  v24 = *v20;
  swift_retain(*v13);
  v26 = static Alignment.center.getter(v25);
  v28 = v27;
  sub_10002DFF0(v1, v21, v36, v22, v23, v24);
  swift_release(v21);
  *(_QWORD *)a1 = v26;
  *(_QWORD *)(a1 + 8) = v28;
  v29 = v36[11];
  *(_OWORD *)(a1 + 176) = v36[10];
  *(_OWORD *)(a1 + 192) = v29;
  *(_OWORD *)(a1 + 208) = v37[0];
  *(_OWORD *)(a1 + 217) = *(_OWORD *)((char *)v37 + 9);
  v30 = v36[7];
  *(_OWORD *)(a1 + 112) = v36[6];
  *(_OWORD *)(a1 + 128) = v30;
  v31 = v36[9];
  *(_OWORD *)(a1 + 144) = v36[8];
  *(_OWORD *)(a1 + 160) = v31;
  v32 = v36[3];
  *(_OWORD *)(a1 + 48) = v36[2];
  *(_OWORD *)(a1 + 64) = v32;
  v33 = v36[5];
  *(_OWORD *)(a1 + 80) = v36[4];
  *(_OWORD *)(a1 + 96) = v33;
  result = *(double *)v36;
  v35 = v36[1];
  *(_OWORD *)(a1 + 16) = v36[0];
  *(_OWORD *)(a1 + 32) = v35;
  return result;
}

double sub_10002DFF0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double result;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
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
  int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t KeyPath;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  int v77;
  _BYTE v78[7];
  char v79;
  _BYTE v80[7];
  char v81;
  int v82;
  __int16 v83;
  _BYTE v84[7];
  char v85;
  _BYTE v86[7];
  char v87;
  int v88;
  __int16 v89;
  _OWORD v90[12];
  _OWORD v91[2];
  uint64_t v92;
  __int16 v93;
  int v94;
  __int16 v95;
  uint64_t v96;
  char v97;
  _BYTE v98[7];
  uint64_t v99;
  char v100;
  _BYTE v101[7];
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  uint64_t v108;
  __int16 v109;
  int v110;
  __int16 v111;
  uint64_t v112;
  char v113;
  _BYTE v114[7];
  uint64_t v115;
  char v116;
  _BYTE v117[7];
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unsigned __int8 v128;
  uint64_t v129;
  unsigned __int8 v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unsigned __int8 v134;
  uint64_t v135;
  unsigned __int8 v136;
  uint64_t v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _OWORD v151[3];

  v12 = sub_100004A10(&qword_100057250);
  __chkstk_darwin(v12);
  v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (int *)type metadata accessor for BadgeView(0);
  v16 = (uint64_t *)(a1 + v15[5]);
  v17 = v16[1];
  if (!v17
    || (v18 = (uint64_t *)(a1 + v15[6]), (v18[1] & 1) != 0)
    || (v19 = (uint64_t *)(a1 + v15[7]), (v19[2] & 1) != 0))
  {
    v92 = static Color.clear.getter();
    sub_10002E5CC((uint64_t)&v92);
    sub_10002E5D8((uint64_t)&v92, (uint64_t)v90);
    v20 = sub_100004A10(&qword_100057260);
    v21 = sub_100008D24(&qword_100057268, &qword_100057260, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    _ConditionalContent<>.init(storage:)(v90, v20, &type metadata for Color, v21, &protocol witness table for Color);
  }
  else
  {
    v73 = *v16;
    v29 = *v18;
    v31 = *v19;
    v30 = v19[1];
    v32 = (double *)(a1 + v15[8]);
    v33 = *((_QWORD *)v32 + 1);
    swift_bridgeObjectRetain(v17);
    swift_retain(a2);
    v35 = static Alignment.center.getter(v34);
    _FrameLayout.init(width:height:alignment:)(&v127, v33, 0, v33, 0, v35, v36);
    v67 = v127;
    v68 = v129;
    v76 = v128;
    v77 = v130;
    v69 = v132;
    v70 = v131;
    v74 = *((_QWORD *)v32 + 5);
    v37 = v74;
    v38 = objc_allocWithZone((Class)UIColor);
    v75 = a2;
    v39 = v38;
    swift_retain(v37);
    v72 = Color.init(_:)(objc_msgSend(v39, "initWithRed:green:blue:alpha:", (double)BYTE2(v29) / 255.0, (double)BYTE1(v29) / 255.0, (double)v29 / 255.0, 1.0));
    v40 = *v32;
    v41 = static Alignment.center.getter(v72);
    _FrameLayout.init(width:height:alignment:)(&v133, *(_QWORD *)&v40, 0, *(_QWORD *)&v40, 0, v41, v42);
    LOBYTE(v39) = v134;
    v63 = v133;
    v64 = v135;
    LOBYTE(v40) = v136;
    v60 = v134;
    v61 = v136;
    v65 = v138;
    v66 = v137;
    v43 = Image.init(_internalSystemName:)(v73, v17);
    v44 = *((_QWORD *)v32 + 3);
    KeyPath = swift_getKeyPath(&unk_100043BB0);
    v45 = v32[2];
    v46 = type metadata accessor for Font.Design(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v14, 1, 1, v46);
    v62 = v44;
    swift_retain(v44);
    v73 = static Font.system(size:weight:design:)(0, 1, v14, v45);
    sub_100008C08((uint64_t)v14, &qword_100057250);
    v47 = swift_getKeyPath(&unk_100043BE0);
    v87 = v76;
    v85 = v77;
    v81 = (char)v39;
    v79 = LOBYTE(v40);
    swift_retain(v44);
    v48 = v75;
    swift_retain_n(v75, 2);
    v49 = v74;
    swift_retain_n(v74, 2);
    v50 = v72;
    swift_retain(v72);
    v51 = v43;
    v59 = v43;
    swift_retain(v43);
    v52 = KeyPath;
    swift_retain(KeyPath);
    swift_retain(v47);
    swift_retain(v73);
    swift_release(v49);
    swift_release(v48);
    v92 = v48;
    v93 = 256;
    v94 = v88;
    v95 = v89;
    v96 = v67;
    v97 = v76;
    *(_DWORD *)v98 = *(_DWORD *)v86;
    *(_DWORD *)&v98[3] = *(_DWORD *)&v86[3];
    v99 = v68;
    v100 = v77;
    *(_DWORD *)v101 = *(_DWORD *)v84;
    *(_DWORD *)&v101[3] = *(_DWORD *)&v84[3];
    v102 = v70;
    v103 = v69;
    v104 = v49;
    v105 = a4;
    v106 = a5;
    v107 = a6;
    v108 = v50;
    v109 = 256;
    v111 = v83;
    v110 = v82;
    v112 = v63;
    v113 = v60;
    *(_DWORD *)v114 = *(_DWORD *)v80;
    *(_DWORD *)&v114[3] = *(_DWORD *)&v80[3];
    v115 = v64;
    v116 = v61;
    *(_DWORD *)&v117[3] = *(_DWORD *)&v78[3];
    *(_DWORD *)v117 = *(_DWORD *)v78;
    v118 = v66;
    v119 = v65;
    v120 = v51;
    v121 = v52;
    v53 = v62;
    v122 = v62;
    v123 = v47;
    v54 = v47;
    v55 = v73;
    v124 = v73;
    v125 = v31;
    v126 = v30;
    sub_10002E630((uint64_t)&v92);
    sub_10002E5D8((uint64_t)&v92, (uint64_t)&v139);
    v56 = sub_100004A10(&qword_100057260);
    v57 = sub_100008D24(&qword_100057268, &qword_100057260, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    _ConditionalContent<>.init(storage:)(&v139, v56, &type metadata for Color, v57, &protocol witness table for Color);
    swift_release(v74);
    swift_release(v75);
    swift_release(v72);
    swift_release(v55);
    swift_release(v54);
    swift_release(v53);
    swift_release(KeyPath);
    swift_release(v59);
    v149 = v90[10];
    v150 = v90[11];
    v151[0] = v91[0];
    *(_OWORD *)((char *)v151 + 9) = *(_OWORD *)((char *)v91 + 9);
    v145 = v90[6];
    v146 = v90[7];
    v147 = v90[8];
    v148 = v90[9];
    v141 = v90[2];
    v142 = v90[3];
    v143 = v90[4];
    v144 = v90[5];
    v139 = v90[0];
    v140 = v90[1];
  }
  v22 = v150;
  a3[10] = v149;
  a3[11] = v22;
  a3[12] = v151[0];
  *(_OWORD *)((char *)a3 + 201) = *(_OWORD *)((char *)v151 + 9);
  v23 = v146;
  a3[6] = v145;
  a3[7] = v23;
  v24 = v148;
  a3[8] = v147;
  a3[9] = v24;
  v25 = v142;
  a3[2] = v141;
  a3[3] = v25;
  v26 = v144;
  a3[4] = v143;
  a3[5] = v26;
  result = *(double *)&v139;
  v28 = v140;
  *a3 = v139;
  a3[1] = v28;
  return result;
}

uint64_t sub_10002E5CC(uint64_t result)
{
  *(_BYTE *)(result + 216) = 1;
  return result;
}

uint64_t sub_10002E5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004A10(&qword_100057258);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002E630(uint64_t result)
{
  *(_BYTE *)(result + 216) = 0;
  return result;
}

uint64_t sub_10002E638()
{
  return sub_100008D24(&qword_100057270, &qword_100057278, (uint64_t)&protocol conformance descriptor for ZStack<A>);
}

Swift::String __swiftcall String.deletingPrefix(_:)(Swift::String a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *object;
  uint64_t countAndFlagsBits;
  Swift::Bool v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  Swift::String result;

  v3 = v2;
  v4 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v7 = String.hasPrefix(_:)(a1);
  swift_bridgeObjectRetain(v3);
  if (v7)
  {
    v8 = String.count.getter(countAndFlagsBits, object);
    v9 = sub_10002E780(v8, v4, v3);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = swift_bridgeObjectRelease(v3);
    v4 = static String._fromSubstring(_:)(v9, v11, v13, v15, v16);
    v3 = v17;
    swift_bridgeObjectRelease(v15);
  }
  v18 = v4;
  v19 = (void *)v3;
  result._object = v19;
  result._countAndFlagsBits = v18;
  return result;
}

uint64_t String.nonBreaking.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  _QWORD v4[2];
  _QWORD v5[4];

  v5[2] = a1;
  v5[3] = a2;
  v5[0] = 32;
  v5[1] = 0xE100000000000000;
  v4[0] = 41154;
  v4[1] = 0xA200000000000000;
  v2 = sub_100024AF0();
  return ((uint64_t (*)(_QWORD *, _QWORD *, _QWORD, _QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, unint64_t, unint64_t))StringProtocol.replacingOccurrences<A, B>(of:with:options:range:))(v5, v4, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v2, v2, v2);
}

unint64_t sub_10002E780(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = String.index(_:offsetBy:limitedBy:)(15, result, v5, a2, a3);
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

uint64_t sub_10002E81C@<X0>(_QWORD *a1@<X8>, double a2@<D0>)
{
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __n128 v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  void *v18;
  id v19;
  uint64_t result;

  *a1 = swift_getKeyPath(&unk_100043C40);
  v4 = sub_100004A10(&qword_100055E28);
  swift_storeEnumTagMultiPayload(a1, v4, 0);
  v5 = (int *)type metadata accessor for LocationCircle(0);
  v6 = (_QWORD *)((char *)a1 + v5[5]);
  *v6 = swift_getKeyPath(&unk_100043C70);
  v7 = sub_100004A10(&qword_100055E30);
  swift_storeEnumTagMultiPayload(v6, v7, 0);
  *(double *)((char *)a1 + v5[6]) = a2;
  v8 = v5[7];
  *(_QWORD *)((char *)a1 + v8) = Color.init(_:)(objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.541176471, 1.0, 0.858823529, 0.45));
  v9 = v5[8];
  v10 = sub_1000174CC();
  static Color.white.getter(v10);
  v12 = (void *)UIColor.init(_:)(v11);
  v13 = objc_msgSend(v12, "colorWithAlphaComponent:", 0.5);

  *(_QWORD *)((char *)a1 + v9) = Color.init(_:)(v13);
  v14 = v5[9];
  v15 = Color.init(_:)(objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.541176471, 1.0, 0.858823529, 0.45));
  *(_QWORD *)((char *)a1 + v14) = v15;
  v16 = v5[10];
  static Color.white.getter(v15);
  v18 = (void *)UIColor.init(_:)(v17);
  v19 = objc_msgSend(v18, "colorWithAlphaComponent:", 0.35);

  result = Color.init(_:)(v19);
  *(_QWORD *)((char *)a1 + v16) = result;
  return result;
}

uint64_t type metadata accessor for LocationCircle(uint64_t a1)
{
  uint64_t result;

  result = qword_1000572D8;
  if (!qword_1000572D8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LocationCircle);
  return result;
}

uint64_t *sub_10002EA2C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
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

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4, a2, v8);
      v9 = v4;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *v4 = *a2;
      swift_retain(v13);
      v9 = v4;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (uint64_t *)((char *)v4 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    v24 = *(uint64_t *)((char *)a2 + v23);
    *(uint64_t *)((char *)v4 + v23) = v24;
    v25 = a3[8];
    v26 = a3[9];
    v27 = *(uint64_t *)((char *)a2 + v25);
    *(uint64_t *)((char *)v4 + v25) = v27;
    v28 = *(uint64_t *)((char *)a2 + v26);
    *(uint64_t *)((char *)v4 + v26) = v28;
    v29 = a3[10];
    v12 = *(uint64_t *)((char *)a2 + v29);
    *(uint64_t *)((char *)v4 + v29) = v12;
    swift_retain(v24);
    swift_retain(v27);
    swift_retain(v28);
  }
  swift_retain(v12);
  return v4;
}

uint64_t sub_10002EBC8(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)((char *)a1 + a2[7]));
  swift_release(*(_QWORD *)((char *)a1 + a2[8]));
  swift_release(*(_QWORD *)((char *)a1 + a2[9]));
  return swift_release(*(_QWORD *)((char *)a1 + a2[10]));
}

uint64_t *sub_10002ECB4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
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

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[7];
  *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
  v22 = *(uint64_t *)((char *)a2 + v21);
  *(uint64_t *)((char *)a1 + v21) = v22;
  v23 = a3[8];
  v24 = a3[9];
  v25 = *(uint64_t *)((char *)a2 + v23);
  *(uint64_t *)((char *)a1 + v23) = v25;
  v26 = *(uint64_t *)((char *)a2 + v24);
  *(uint64_t *)((char *)a1 + v24) = v26;
  v27 = a3[10];
  v28 = *(uint64_t *)((char *)a2 + v27);
  *(uint64_t *)((char *)a1 + v27) = v28;
  swift_retain(v22);
  swift_retain(v25);
  swift_retain(v26);
  swift_retain(v28);
  return a1;
}

uint64_t *sub_10002EE28(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
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

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_100008C08((uint64_t)a1 + v12, &qword_100055E30);
    v15 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
  v21 = a3[7];
  v22 = *(uint64_t *)((char *)a2 + v21);
  v23 = *(uint64_t *)((char *)a1 + v21);
  *(uint64_t *)((char *)a1 + v21) = v22;
  swift_retain(v22);
  swift_release(v23);
  v24 = a3[8];
  v25 = *(uint64_t *)((char *)a2 + v24);
  v26 = *(uint64_t *)((char *)a1 + v24);
  *(uint64_t *)((char *)a1 + v24) = v25;
  swift_retain(v25);
  swift_release(v26);
  v27 = a3[9];
  v28 = *(uint64_t *)((char *)a2 + v27);
  v29 = *(uint64_t *)((char *)a1 + v27);
  *(uint64_t *)((char *)a1 + v27) = v28;
  swift_retain(v28);
  swift_release(v29);
  v30 = a3[10];
  v31 = *(uint64_t *)((char *)a2 + v30);
  v32 = *(uint64_t *)((char *)a1 + v30);
  *(uint64_t *)((char *)a1 + v30) = v31;
  swift_retain(v31);
  swift_release(v32);
  return a1;
}

char *sub_10002EFF0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_100004A10(&qword_100055E28);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100004A10(&qword_100055E30);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];
  v14 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  return a1;
}

char *sub_10002F140(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
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

  if (a1 != a2)
  {
    sub_100008C08((uint64_t)a1, &qword_100055E28);
    v6 = sub_100004A10(&qword_100055E28);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_100008C08((uint64_t)&a1[v8], &qword_100055E30);
    v11 = sub_100004A10(&qword_100055E30);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  v14 = *(_QWORD *)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];
  swift_release(v14);
  v15 = a3[8];
  v16 = *(_QWORD *)&a1[v15];
  *(_QWORD *)&a1[v15] = *(_QWORD *)&a2[v15];
  swift_release(v16);
  v17 = a3[9];
  v18 = *(_QWORD *)&a1[v17];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  swift_release(v18);
  v19 = a3[10];
  v20 = *(_QWORD *)&a1[v19];
  *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];
  swift_release(v20);
  return a1;
}

uint64_t sub_10002F2DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002F2E8);
}

uint64_t sub_10002F2E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_100004A10(&qword_100055E38);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_100004A10(qword_100055E40);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_10002F398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002F3A4);
}

uint64_t sub_10002F3A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_100004A10(&qword_100055E38);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_100004A10(qword_100055E40);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

void sub_10002F450(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[7];

  sub_100007950(319, (unint64_t *)&qword_100055EC8, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100007950(319, &qword_100055ED0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = (char *)&value witness table for Builtin.Int64 + 64;
      v6[3] = (char *)&value witness table for Builtin.NativeObject + 64;
      v6[4] = (char *)&value witness table for Builtin.NativeObject + 64;
      v6[5] = (char *)&value witness table for Builtin.NativeObject + 64;
      v6[6] = (char *)&value witness table for Builtin.NativeObject + 64;
      swift_initStructMetadata(a1, 256, 7, v6, a1 + 16);
    }
  }
}

uint64_t sub_10002F514(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100044AC0, 1);
}

uint64_t sub_10002F524@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v21;
  uint64_t v22;
  char *v23;
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
  void (*v34)(char *, uint64_t, uint64_t);
  char v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  void (*v41)(char *, uint64_t);
  unsigned int *v42;
  uint64_t v43;
  void (*v44)(char *, _QWORD, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD *v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  void (*v58)(char *, uint64_t);
  char *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t);
  char v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _OWORD *v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(char *, char *, uint64_t);
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  char *v103;
  void (*v104)(char *, uint64_t, uint64_t);
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  void (*v111)(char *, char *, uint64_t);
  void (*v112)(char *, _QWORD, uint64_t);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  _OWORD v135[3];
  _QWORD v136[5];
  _OWORD v137[3];

  v127 = a2;
  v122 = sub_100004A10(&qword_100057330);
  __chkstk_darwin(v122);
  v121 = (char *)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = sub_100004A10(&qword_100057338);
  v4 = __chkstk_darwin(v125);
  v126 = (uint64_t)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v123 = (uint64_t)&v103 - v7;
  __chkstk_darwin(v6);
  v124 = (uint64_t)&v103 - v8;
  v118 = type metadata accessor for WidgetRenderingMode(0);
  v117 = *(_QWORD *)(v118 - 8);
  v9 = __chkstk_darwin(v118);
  v116 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v115 = (uint64_t)&v103 - v11;
  v12 = type metadata accessor for _BlendModeEffect(0);
  __chkstk_darwin(v12);
  v131 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = type metadata accessor for BlendMode(0);
  v114 = *(_QWORD *)(v130 - 8);
  v14 = __chkstk_darwin(v130);
  v120 = (char *)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v103 = (char *)&v103 - v16;
  v17 = type metadata accessor for ColorScheme(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v23 = (char *)&v103 - v22;
  v113 = sub_100004A10(&qword_100057340);
  __chkstk_darwin(v113);
  v25 = (char *)&v103 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_100004A10(&qword_100057348);
  __chkstk_darwin(v107);
  v106 = (uint64_t)&v103 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_100004A10(&qword_100057350);
  __chkstk_darwin(v110);
  v108 = (uint64_t)&v103 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = sub_100004A10(&qword_100057358);
  v133 = *(_QWORD *)(v134 - 8);
  v28 = __chkstk_darwin(v134);
  v119 = (char *)&v103 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __chkstk_darwin(v28);
  v109 = (char *)&v103 - v31;
  __chkstk_darwin(v30);
  v132 = (char *)&v103 - v32;
  v128 = a1;
  sub_100007A74((uint64_t)v23);
  v33 = enum case for ColorScheme.dark(_:);
  v34 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 104);
  v105 = enum case for ColorScheme.dark(_:);
  v34(v21, enum case for ColorScheme.dark(_:), v17);
  v104 = v34;
  v35 = static ColorScheme.== infix(_:_:)(v23, v21);
  v36 = *(void (**)(char *, uint64_t))(v18 + 8);
  v36(v21, v17);
  v36(v23, v17);
  v37 = type metadata accessor for LocationCircle(0);
  v129 = v37;
  v38 = 28;
  if ((v35 & 1) != 0)
    v38 = 36;
  v39 = *(_QWORD *)(a1 + *(int *)(v37 + v38));
  swift_retain(v39);
  sub_100007A74((uint64_t)v23);
  v34(v21, v33, v17);
  v40 = static ColorScheme.== infix(_:_:)(v23, v21);
  v36(v21, v17);
  v36(v23, v17);
  v41 = v36;
  v42 = (unsigned int *)&enum case for BlendMode.overlay(_:);
  v43 = v114;
  v44 = *(void (**)(char *, _QWORD, uint64_t))(v114 + 104);
  v112 = v44;
  if ((v40 & 1) == 0)
    v42 = (unsigned int *)&enum case for BlendMode.plusDarker(_:);
  v45 = v103;
  v46 = v130;
  v44(v103, *v42, v130);
  v111 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v47 = (uint64_t)v131;
  v111(v131, v45, v46);
  sub_100030030(v47, (uint64_t)&v25[*(int *)(v113 + 36)]);
  *(_QWORD *)v25 = v39;
  *((_WORD *)v25 + 4) = 256;
  swift_retain(v39);
  sub_100030074(v47);
  v113 = *(_QWORD *)(v43 + 8);
  ((void (*)(char *, uint64_t))v113)(v45, v46);
  v48 = swift_release(v39);
  v114 = *(int *)(v129 + 24);
  v49 = *(double *)(v128 + v114) + -0.8;
  v50 = static Alignment.center.getter(v48);
  _FrameLayout.init(width:height:alignment:)(v135, *(_QWORD *)&v49, 0, *(_QWORD *)&v49, 0, v50, v51);
  v52 = v106;
  sub_100008CE0((uint64_t)v25, v106, &qword_100057340);
  v53 = (_OWORD *)(v52 + *(int *)(v107 + 36));
  v54 = v135[1];
  *v53 = v135[0];
  v53[1] = v54;
  v53[2] = v135[2];
  sub_100008C08((uint64_t)v25, &qword_100057340);
  v55 = v115;
  v56 = sub_100007A48(v115);
  v57 = v116;
  static WidgetRenderingMode.accented.getter(v56);
  LOBYTE(v49) = static WidgetRenderingMode.== infix(_:_:)(v55, v57);
  v58 = *(void (**)(char *, uint64_t))(v117 + 8);
  v59 = v57;
  v60 = v118;
  v58(v59, v118);
  v58((char *)v55, v60);
  if ((LOBYTE(v49) & 1) != 0)
    v61 = 0.3;
  else
    v61 = 1.0;
  v62 = v108;
  sub_100008CE0(v52, v108, &qword_100057348);
  v63 = v110;
  *(double *)(v62 + *(int *)(v110 + 36)) = v61;
  sub_100008C08(v52, &qword_100057348);
  v64 = sub_1000173D4(&qword_100057360, &qword_100057350, (void (*)(void))sub_1000300B0);
  v65 = v109;
  View.widgetAccentable(_:)(1, v63, v64);
  sub_100008C08(v62, &qword_100057350);
  (*(void (**)(char *, char *, uint64_t))(v133 + 32))(v132, v65, v134);
  v66 = v128;
  sub_100007A74((uint64_t)v23);
  v67 = v105;
  v68 = v104;
  v104(v21, v105, v17);
  v69 = static ColorScheme.== infix(_:_:)(v23, v21);
  v41(v21, v17);
  v41(v23, v17);
  v70 = 32;
  if ((v69 & 1) != 0)
    v70 = 40;
  v71 = *(_QWORD *)(v66 + *(int *)(v129 + v70));
  swift_retain(v71);
  v72 = StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v136, 0, 0, _swiftEmptyArrayStorage, 0.8, 10.0, 0.0);
  v73 = *(double *)v136;
  v74 = v136[2];
  v75 = v136[3];
  v76 = v136[4];
  v129 = static Alignment.center.getter(v72);
  v78 = v77;
  sub_100007A74((uint64_t)v23);
  v79 = v136[1];
  v68(v21, v67, v17);
  static ColorScheme.== infix(_:_:)(v23, v21);
  v41(v21, v17);
  v41(v23, v17);
  v80 = v120;
  v81 = v130;
  v112(v120, enum case for BlendMode.plusLighter(_:), v130);
  v82 = (uint64_t)v131;
  v83 = v81;
  v111(v131, v80, v81);
  v84 = (uint64_t)v121;
  sub_100030030(v82, (uint64_t)&v121[*(int *)(v122 + 36)]);
  *(double *)v84 = v73 * 0.5;
  *(double *)(v84 + 8) = v73;
  *(_QWORD *)(v84 + 16) = v79;
  *(_QWORD *)(v84 + 24) = v74;
  *(_QWORD *)(v84 + 32) = v75;
  *(_QWORD *)(v84 + 40) = v76;
  *(_QWORD *)(v84 + 48) = v71;
  *(_WORD *)(v84 + 56) = 256;
  *(_QWORD *)(v84 + 64) = v129;
  *(_QWORD *)(v84 + 72) = v78;
  swift_bridgeObjectRetain(v75);
  swift_retain(v71);
  sub_100030074(v82);
  ((void (*)(char *, uint64_t))v113)(v80, v83);
  swift_release(v71);
  swift_bridgeObjectRelease(v75);
  v85 = *(_QWORD *)(v66 + v114);
  v87 = static Alignment.center.getter(v86);
  _FrameLayout.init(width:height:alignment:)(v137, v85, 0, v85, 0, v87, v88);
  v89 = v123;
  sub_100008CE0(v84, v123, &qword_100057330);
  v90 = (_OWORD *)(v89 + *(int *)(v125 + 36));
  v91 = v137[1];
  *v90 = v137[0];
  v90[1] = v91;
  v90[2] = v137[2];
  sub_100008C08(v84, &qword_100057330);
  v92 = v124;
  sub_100030158(v89, v124);
  v93 = v133;
  v94 = *(void (**)(char *, char *, uint64_t))(v133 + 16);
  v95 = v119;
  v96 = v132;
  v97 = v134;
  v94(v119, v132, v134);
  v98 = v126;
  sub_100008CE0(v92, v126, &qword_100057338);
  v99 = v127;
  v94(v127, v95, v97);
  v100 = sub_100004A10(&qword_100057378);
  sub_100008CE0(v98, (uint64_t)&v99[*(int *)(v100 + 48)], &qword_100057338);
  sub_100008C08(v92, &qword_100057338);
  v101 = *(void (**)(char *, uint64_t))(v93 + 8);
  v101(v96, v97);
  sub_100008C08(v98, &qword_100057338);
  return ((uint64_t (*)(char *, uint64_t))v101)(v95, v97);
}

uint64_t sub_10002FFF0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a2 = static Alignment.center.getter(a1);
  *((_QWORD *)a2 + 1) = v4;
  v5 = sub_100004A10(&qword_100057328);
  return sub_10002F524(v2, &a2[*(int *)(v5 + 44)]);
}

uint64_t sub_100030030(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _BlendModeEffect(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100030074(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for _BlendModeEffect(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000300B0()
{
  return sub_1000173D4(&qword_100057368, &qword_100057348, (void (*)(void))sub_1000300D4);
}

unint64_t sub_1000300D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100057370;
  if (!qword_100057370)
  {
    v1 = sub_100004A50(&qword_100057340);
    sub_100008D24(&qword_1000565F8, &qword_100056600, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100057370);
  }
  return result;
}

uint64_t sub_100030158(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004A10(&qword_100057338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000301A0()
{
  return sub_100008D24(&qword_100057380, &qword_100057388, (uint64_t)&protocol conformance descriptor for ZStack<A>);
}

uint64_t sub_1000301CC(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
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
  unint64_t v18;
  void (*v19)(char *, _QWORD, uint64_t);
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v4 = v3;
  v33 = a2;
  v34 = a1;
  v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002AD68(0, (unint64_t *)&qword_100056018, OS_dispatch_queue_ptr);
  static DispatchQoS.userInitiated.getter();
  v36 = &_swiftEmptyArrayStorage;
  v16 = sub_1000086D4(&qword_100056020, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v17 = sub_100004A10(&qword_100056028);
  v18 = sub_100031230();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v36, v17, v18, v10, v16);
  v19 = *(void (**)(char *, _QWORD, uint64_t))(v7 + 104);
  v20 = v33;
  v19(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v6);
  v21 = v34;
  *(_QWORD *)(v4 + 40) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000015, 0x8000000100041EC0, v15, v12, v9, 0);
  *(_QWORD *)(v4 + 48) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(v4 + 56) = objc_msgSend(objc_allocWithZone((Class)RadiosPreferences), "init");
  *(_QWORD *)(v4 + 64) = objc_msgSend(objc_allocWithZone((Class)ACAccountStore), "init");
  *(_QWORD *)(v4 + 16) = v21;
  *(_QWORD *)(v4 + 24) = v20;
  *(double *)(v4 + 32) = a3;
  v22 = qword_100055AC8;
  swift_bridgeObjectRetain(v20);
  if (v22 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v23 = type metadata accessor for Logger(0);
  sub_100007E94(v23, (uint64_t)qword_100059040);
  swift_retain_n(v4, 2);
  v24 = swift_bridgeObjectRetain(v20);
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc(22, -1);
    v28 = (void *)swift_slowAlloc(64, -1);
    v36 = v28;
    *(_DWORD *)v27 = 136315394;
    v29 = (*(uint64_t (**)(void))(*(_QWORD *)v4 + 160))();
    v31 = v30;
    v35 = sub_100008084(v29, v30, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v27 + 4, v27 + 12);
    swift_release_n(v4, 2);
    swift_bridgeObjectRelease(v31);
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain(v20);
    v35 = sub_100008084(v21, v20, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v27 + 14, v27 + 22);
    swift_bridgeObjectRelease_n(v20, 3);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "🥑 %sDataService%s: init (v6)", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v20, 2);
    swift_release_n(v4, 2);
  }
  return v4;
}

uint64_t sub_1000305B4()
{
  return 0;
}

unint64_t sub_1000305C0(uint64_t a1)
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
  sub_100004A10(&qword_1000574A0);
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
    result = sub_1000307C0(v7, v8);
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

Class sub_1000306D8(uint64_t a1)
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
    sub_10002AD68(0, &qword_100057498, NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

uint64_t sub_10003075C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for DataService()
{
  return objc_opt_self(_TtC18FindMyWidgetPeople11DataService);
}

unint64_t sub_1000307C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100030C8C(a1, a2, v5);
}

Swift::Int sub_100030824(uint64_t a1, uint64_t a2)
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
  sub_100004A10(&qword_1000574A0);
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

void sub_100030B30(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1000307C0(a2, a3);
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
    sub_100030D6C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain(a3);
      return;
    }
    goto LABEL_14;
  }
  sub_100030824(v15, a4 & 1);
  v20 = sub_1000307C0(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

unint64_t sub_100030C8C(uint64_t a1, uint64_t a2, uint64_t a3)
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

id sub_100030D6C()
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
  sub_100004A10(&qword_1000574A0);
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

void sub_100030F1C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  unint64_t v8;
  id v9;
  NSString v10;
  id v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSString v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  NSString v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  uint64_t v29;

  v8 = sub_1000305C0((uint64_t)&_swiftEmptyArrayStorage);
  v9 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v11 = objc_msgSend(v9, "initWithString:", v10);

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
  sub_100030B30((uint64_t)v11, 0xD000000000000010, 0x8000000100041E50, isUniquelyReferenced_nonNull_native);
  v13 = v8;
  v14 = swift_bridgeObjectRelease(0x8000000000000000);
  WidgetFamily.description.getter(v14);
  v16 = v15;
  v17 = objc_allocWithZone((Class)NSString);
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  v19 = objc_msgSend(v17, "initWithString:", v18);

  v20 = swift_isUniquelyReferenced_nonNull_native(v13);
  sub_100030B30((uint64_t)v19, 0x796C696D6166, 0xE600000000000000, v20);
  swift_bridgeObjectRelease(0x8000000000000000);
  v21 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", a4 & 1);
  v22 = swift_isUniquelyReferenced_nonNull_native(v13);
  sub_100030B30((uint64_t)v21, 0x7461636F4C736168, 0xEB000000006E6F69, v22);
  swift_bridgeObjectRelease(0x8000000000000000);
  v23 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", a5 & 1);
  v24 = swift_isUniquelyReferenced_nonNull_native(v13);
  sub_100030B30((uint64_t)v23, 0x6F656D6954736168, 0xEA00000000007475, v24);
  swift_bridgeObjectRelease(0x8000000000000000);
  v25 = String._bridgeToObjectiveC()();
  v26 = swift_allocObject(&unk_100052A38, 24, 7);
  *(_QWORD *)(v26 + 16) = v13;
  v28[4] = sub_100031210;
  v29 = v26;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 1107296256;
  v28[2] = sub_1000306D8;
  v28[3] = &unk_100052A50;
  v27 = _Block_copy(v28);
  swift_release(v29);
  AnalyticsSendEventLazy(v25, v27);
  _Block_release(v27);

}

uint64_t sub_1000311EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100031210()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100031218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100031228(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100031230()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056030;
  if (!qword_100056030)
  {
    v1 = sub_100004A50(&qword_100056028);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100056030);
  }
  return result;
}

id sub_10003127C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id result;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = type metadata accessor for WidgetFamily(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for FMFConfigValue(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a2, "horizontalAccuracy");
  if ((~*(_QWORD *)&v12 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v12 < 9.22337204e18)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for FMFConfigValue.inaccuracyRadiusThreshold(_:), v7);
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    FMFGlobalConfig<A>(_:fallback:)(&v15, v10, &v14, &type metadata for Int);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for WidgetFamily.systemLarge(_:), v3);
    v13 = sub_1000086D4((unint64_t *)&qword_100056218, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v15, v3, v13);
    dispatch thunk of RawRepresentable.rawValue.getter(&v14, v3, v13);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for UserDefaultsManager()
{
  return objc_opt_self(_TtC18FindMyWidgetPeople19UserDefaultsManager);
}

void destroy for MapGenerator(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));

}

_QWORD *initializeWithCopy for MapGenerator(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for MapGenerator(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = (void *)a2[3];
  v7 = (void *)a1[3];
  a1[3] = v6;
  v8 = v6;

  return a1;
}

__n128 initializeWithTake for MapGenerator(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for MapGenerator(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = (void *)a1[3];
  a1[3] = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for MapGenerator(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MapGenerator(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MapGenerator()
{
  return &type metadata for MapGenerator;
}

void sub_100031650(uint64_t a1, uint64_t a2, char a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, CLLocationDegrees a9, CLLocationDegrees a10, CLLocationDistance a11, double a12, double a13, double a14, void *a15)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  double v38;
  double v39;
  double v40;
  CLLocationDistance v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  NSObject *v58;
  os_log_type_t v59;
  _BOOL4 v60;
  uint64_t v61;
  double v62;
  double v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  CLLocationDegrees v69;
  CLLocationDegrees v70;
  CLLocationDistance v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void **v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  double v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  void (*v107)(char *, uint64_t);
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  id v114;
  id v115;
  void **v116;
  unint64_t v117;
  double v118;
  uint64_t v119;
  char *v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  CLLocationDegrees v131;
  CLLocationDegrees v132;
  CLLocationDistance v133;
  uint64_t v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void **aBlock;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  CLLocationCoordinate2D v145;
  MKCoordinateRegion v146;
  MKMapRect v147;
  MKMapRect v148;

  v136 = a5;
  v137 = a7;
  v130 = a14;
  v126 = type metadata accessor for DispatchTimeInterval(0);
  v125 = *(_QWORD *)(v126 - 8);
  __chkstk_darwin(v126);
  v124 = (uint64_t *)((char *)&v116 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  v127 = type metadata accessor for DispatchTime(0);
  v123 = *(_QWORD *)(v127 - 8);
  v27 = __chkstk_darwin(v127);
  v121 = (char *)&v116 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v122 = (char *)&v116 - v29;
  v119 = type metadata accessor for DispatchWorkItemFlags(0);
  __chkstk_darwin(v119);
  v120 = (char *)&v116 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = type metadata accessor for Date(0);
  v128 = *(_QWORD *)(v129 - 8);
  __chkstk_darwin(v129);
  v32 = (char *)&v116 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = objc_msgSend(objc_allocWithZone((Class)MKMapSnapshotOptions), "init");
  v34 = v33;
  v135 = a4;
  v35 = a4 & 1;
  if ((a4 & 1) != 0)
    v36 = 2;
  else
    v36 = 1;
  objc_msgSend(v33, "_setShowsNightMode:", v35);
  v37 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithUserInterfaceStyle:", v36);
  objc_msgSend(v34, "setTraitCollection:", v37);

  objc_msgSend(v34, "setSize:", a12, a13);
  if ((a3 & 1) != 0)
    v38 = 0.0;
  else
    v38 = *(double *)&a2;
  if ((a3 & 1) != 0)
    v39 = 0.0;
  else
    v39 = *(double *)&a1;
  v118 = a12;
  v40 = a12 / a13;
  if (a13 <= 0.0)
    v40 = 1.0;
  v41 = v40 * a11;
  v131 = a9;
  v145.latitude = a9;
  v132 = a10;
  v133 = a11;
  v145.longitude = a10;
  v146 = MKCoordinateRegionMakeWithDistance(v145, a11, v41);
  v42 = MKMapRectForCoordinateRegion((__n128)v146.center, *(__n128 *)&v146.center.longitude, (__n128)v146.span, *(__n128 *)&v146.span.longitudeDelta);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  objc_msgSend(v34, "size");
  v50 = v49;
  objc_msgSend(v34, "size");
  v52 = v48 * (-v38 / v51);
  v147.origin.x = v42;
  v147.origin.y = v44;
  v147.size.width = v46;
  v147.size.height = v48;
  v148 = MKMapRectOffset(v147, v46 * (-v39 / v50), v52);
  objc_msgSend(v34, "setMapRect:", v148.origin.x, v148.origin.y, v148.size.width, v148.size.height);
  objc_msgSend(v34, "_setUseSnapshotService:", 1);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v53 = type metadata accessor for Logger(0);
  sub_100007E94(v53, (uint64_t)qword_100059040);
  v54 = v34;
  swift_bridgeObjectRetain_n(a8, 2);
  v55 = a15;
  v56 = v54;
  v57 = v55;
  v58 = Logger.logObject.getter(v57);
  v59 = static os_log_type_t.default.getter();
  v60 = os_log_type_enabled(v58, v59);
  v134 = a6;
  if (!v60)
  {

    swift_bridgeObjectRelease_n(a8, 2);
    v82 = v130;
    v70 = v132;
    v71 = v133;
    v69 = v131;
LABEL_35:
    v83 = swift_allocObject(&unk_100052BD8, 17, 7);
    *(_BYTE *)(v83 + 16) = 0;
    v84 = Date.init()(v83);
    v85 = Date.timeIntervalSinceReferenceDate.getter(v84);
    (*(void (**)(char *, uint64_t))(v128 + 8))(v32, v129);
    v86 = fmax(v82 - v85 + 28.0 + -3.0, 1.0);
    if ((~*(_QWORD *)&v86 & 0x7FF0000000000000) != 0)
    {
      if (v86 > -9.22337204e18)
      {
        if (v86 < 9.22337204e18)
        {
          v87 = a8;
          v88 = (uint64_t)v86;
          v89 = swift_allocObject(&unk_100052C00, 136, 7);
          v90 = v137;
          *(_QWORD *)(v89 + 16) = v83;
          *(_QWORD *)(v89 + 24) = v90;
          *(_QWORD *)(v89 + 32) = v87;
          *(double *)(v89 + 40) = v82;
          *(_QWORD *)(v89 + 48) = v57;
          *(_QWORD *)(v89 + 56) = v88;
          *(_QWORD *)(v89 + 64) = v56;
          v135 &= 1u;
          *(_BYTE *)(v89 + 72) = v135;
          *(CLLocationDegrees *)(v89 + 80) = v69;
          *(CLLocationDegrees *)(v89 + 88) = v70;
          v91 = v118;
          *(CLLocationDistance *)(v89 + 96) = v71;
          *(double *)(v89 + 104) = v91;
          *(double *)(v89 + 112) = a13;
          *(_QWORD *)(v89 + 120) = v136;
          *(_QWORD *)(v89 + 128) = a6;
          v143 = sub_100033A4C;
          v144 = v89;
          aBlock = _NSConcreteStackBlock;
          v140 = 1107296256;
          v141 = sub_10000B164;
          v142 = &unk_100052C18;
          v92 = _Block_copy(&aBlock);
          v138 = (uint64_t)_swiftEmptyArrayStorage;
          v93 = sub_1000086D4(&qword_100056040, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
          v94 = v56;
          swift_bridgeObjectRetain(v87);
          v95 = v57;
          swift_retain(v83);
          swift_retain(a6);
          v96 = sub_100004A10(&qword_100056048);
          v97 = sub_1000339B8((unint64_t *)&qword_100056050, &qword_100056048);
          v98 = v120;
          dispatch thunk of SetAlgebra.init<A>(_:)(&v138, v96, v97, v119, v93);
          v99 = type metadata accessor for DispatchWorkItem(0);
          swift_allocObject(v99, *(unsigned int *)(v99 + 48), *(unsigned __int16 *)(v99 + 52));
          v100 = DispatchWorkItem.init(flags:block:)(v98, v92);
          v101 = swift_release(v144);
          v102 = v121;
          static DispatchTime.now()(v101);
          v103 = v124;
          *v124 = v88;
          v104 = v125;
          v105 = v126;
          (*(void (**)(uint64_t *, _QWORD, uint64_t))(v125 + 104))(v103, enum case for DispatchTimeInterval.seconds(_:), v126);
          v106 = v122;
          + infix(_:_:)(v102, v103);
          (*(void (**)(uint64_t *, uint64_t))(v104 + 8))(v103, v105);
          v107 = *(void (**)(char *, uint64_t))(v123 + 8);
          v108 = v127;
          v107(v102, v127);
          OS_dispatch_queue.asyncAfter(deadline:execute:)(v106, v100);
          v107(v106, v108);
          v109 = objc_msgSend(objc_allocWithZone((Class)MKMapSnapshotter), "initWithOptions:", v94);
          v110 = swift_allocObject(&unk_100052C50, 120, 7);
          *(_QWORD *)(v110 + 16) = v100;
          *(_QWORD *)(v110 + 24) = v83;
          *(_QWORD *)(v110 + 32) = v137;
          *(_QWORD *)(v110 + 40) = v87;
          *(double *)(v110 + 48) = v82;
          *(_QWORD *)(v110 + 56) = v95;
          *(_QWORD *)(v110 + 64) = v94;
          *(_BYTE *)(v110 + 72) = v135;
          *(CLLocationDegrees *)(v110 + 80) = v69;
          *(CLLocationDegrees *)(v110 + 88) = v70;
          *(CLLocationDistance *)(v110 + 96) = v71;
          v111 = v134;
          *(_QWORD *)(v110 + 104) = v136;
          *(_QWORD *)(v110 + 112) = v111;
          v143 = sub_100033AE0;
          v144 = v110;
          aBlock = _NSConcreteStackBlock;
          v140 = 1107296256;
          v141 = sub_1000330C0;
          v142 = &unk_100052C68;
          v112 = _Block_copy(&aBlock);
          v113 = v144;
          v114 = v94;
          swift_bridgeObjectRetain(v87);
          v115 = v95;
          swift_retain(v83);
          swift_retain(v111);
          swift_retain(v100);
          swift_release(v113);
          objc_msgSend(v109, "startWithQueue:completionHandler:", v115, v112);
          _Block_release(v112);

          swift_release(v83);
          swift_release(v100);

          return;
        }
        goto LABEL_41;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v61 = swift_slowAlloc(102, -1);
  v116 = (void **)swift_slowAlloc(96, -1);
  aBlock = v116;
  *(_DWORD *)v61 = 136317443;
  swift_bridgeObjectRetain(a8);
  v138 = sub_100008084(v137, a8, (uint64_t *)&aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 4, v61 + 12);

  v117 = a8;
  swift_bridgeObjectRelease_n(a8, 3);
  *(_WORD *)(v61 + 12) = 2080;
  objc_msgSend(v56, "size");
  v64 = CGSize.debugDescription.getter(v62, v63);
  v66 = v65;
  v138 = sub_100008084(v64, v65, (uint64_t *)&aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 14, v61 + 22);

  swift_bridgeObjectRelease(v66);
  *(_WORD *)(v61 + 22) = 2080;
  if ((v135 & 1) != 0)
    v67 = 1802658148;
  else
    v67 = 0x746867696CLL;
  if ((v135 & 1) != 0)
    v68 = 0xE400000000000000;
  else
    v68 = 0xE500000000000000;
  v138 = sub_100008084(v67, v68, (uint64_t *)&aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 24, v61 + 32);
  swift_bridgeObjectRelease(v68);
  *(_WORD *)(v61 + 32) = 2049;
  v69 = v131;
  v138 = *(_QWORD *)&v131;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 34, v61 + 42);
  *(_WORD *)(v61 + 42) = 2049;
  v70 = v132;
  v138 = *(_QWORD *)&v132;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 44, v61 + 52);
  *(_WORD *)(v61 + 52) = 2049;
  v71 = v133;
  v138 = *(_QWORD *)&v133;
  *(_QWORD *)&v72 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 54, v61 + 62).n128_u64[0];
  *(_WORD *)(v61 + 62) = 2048;
  objc_msgSend(v56, "mapRect", v72);
  v74 = v73;

  if ((~*(_QWORD *)&v74 & 0x7FF0000000000000) == 0)
    goto LABEL_42;
  if (v74 <= -9.22337204e18)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v74 >= 9.22337204e18)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v138 = (uint64_t)v74;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 64, v61 + 72);

  *(_WORD *)(v61 + 72) = 2049;
  objc_msgSend(v56, "mapRect");
  v76 = v75;

  if ((~*(_QWORD *)&v76 & 0x7FF0000000000000) == 0)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (v76 <= -9.22337204e18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (v76 >= 9.22337204e18)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v138 = (uint64_t)v76;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 74, v61 + 82);

  *(_WORD *)(v61 + 82) = 2049;
  objc_msgSend(v56, "mapRect");
  v78 = v77;

  if ((~*(_QWORD *)&v78 & 0x7FF0000000000000) == 0)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (v78 <= -9.22337204e18)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (v78 >= 9.22337204e18)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v138 = (uint64_t)v78;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 84, v61 + 92);

  *(_WORD *)(v61 + 92) = 2049;
  objc_msgSend(v56, "mapRect");
  v80 = v79;

  if ((~*(_QWORD *)&v80 & 0x7FF0000000000000) == 0)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v80 <= -9.22337204e18)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v80 < 9.22337204e18)
  {
    v138 = (uint64_t)v80;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v138, &aBlock, v61 + 94, v61 + 102);

    _os_log_impl((void *)&_mh_execute_header, v58, v59, "🥑 MapGenerator%s: making %s %s map for {%{private}f°,%{private}f°}, span: %{private}fm, mapRect: {%ld, %{private}ld, %{private}ldx%{private}ld}", (uint8_t *)v61, 0x66u);
    v81 = v116;
    swift_arrayDestroy(v116, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v81, -1, -1);
    swift_slowDealloc(v61, -1, -1);

    a6 = v134;
    a8 = v117;
    v82 = v130;
    goto LABEL_35;
  }
LABEL_53:
  __break(1u);
}

void sub_1000322A0(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, void *a6, char a7, void (*a8)(_QWORD), double a9, double a10, double a11, double a12, double a13, double a14)
{
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  id v47;
  NSString v48;
  id v49;
  void (*v50)(_QWORD);
  double v52;
  uint64_t v53;
  _BYTE v54[24];

  swift_beginAccess(a1 + 16, v54, 1, 0);
  *(_BYTE *)(a1 + 16) = 1;
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v26 = type metadata accessor for Logger(0);
  sub_100007E94(v26, (uint64_t)qword_100059040);
  swift_bridgeObjectRetain_n(a3, 2);
  v27 = a4;
  v28 = a6;
  v29 = v27;
  v30 = v28;
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = swift_slowAlloc(72, -1);
    v50 = a8;
    v34 = swift_slowAlloc(96, -1);
    v53 = v34;
    *(_DWORD *)v33 = 136316675;
    swift_bridgeObjectRetain(a3);
    v52 = COERCE_DOUBLE(sub_100008084(a2, a3, &v53));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 4, v33 + 12);

    swift_bridgeObjectRelease_n(a3, 3);
    *(_WORD *)(v33 + 12) = 2048;
    v52 = *(double *)&a5;
    *(_QWORD *)&v35 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 14, v33 + 22).n128_u64[0];
    *(_WORD *)(v33 + 22) = 2080;
    objc_msgSend(v30, "size", v35);
    v38 = CGSize.debugDescription.getter(v36, v37);
    v40 = v39;
    v52 = COERCE_DOUBLE(sub_100008084(v38, v39, &v53));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 24, v33 + 32);

    swift_bridgeObjectRelease(v40);
    *(_WORD *)(v33 + 32) = 2080;
    v41 = a7;
    if ((a7 & 1) != 0)
      v42 = 1802658148;
    else
      v42 = 0x746867696CLL;
    if ((a7 & 1) != 0)
      v43 = 0xE400000000000000;
    else
      v43 = 0xE500000000000000;
    v52 = COERCE_DOUBLE(sub_100008084(v42, v43, &v53));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 34, v33 + 42);
    swift_bridgeObjectRelease(v43);
    *(_WORD *)(v33 + 42) = 2049;
    v52 = a10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 44, v33 + 52);
    *(_WORD *)(v33 + 52) = 2049;
    v52 = a11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 54, v33 + 62);
    *(_WORD *)(v33 + 62) = 2049;
    v52 = a12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v33 + 64, v33 + 72);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "🥑 MapGenerator%s: timed out (%ld-s) making %s %s map for {%{private}f°,%{private}f°}, vspan: %{private}fm", (uint8_t *)v33, 0x48u);
    swift_arrayDestroy(v34, 3, (char *)&type metadata for Any + 8);
    v44 = v34;
    a8 = v50;
    swift_slowDealloc(v44, -1, -1);
    swift_slowDealloc(v33, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    v41 = a7;
  }
  if (a13 == a14)
    v45 = 0xEC00000032657261;
  else
    v45 = 0x8000000100041B60;
  if ((v41 & 1) != 0)
    v46 = 2;
  else
    v46 = 1;
  v47 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithUserInterfaceStyle:", v46);
  v48 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v45);
  v49 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:inBundle:compatibleWithTraitCollection:", v48, 0, v47);

  a8(v49);
}

void sub_1000326F8(void *a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, void *a11, void *a12, char a13, void (*a14)(id), uint64_t a15)
{
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  __n128 v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  double v56;
  double v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  _QWORD v81[3];
  _BYTE v82[8];
  double v83;
  uint64_t v84;
  _BYTE v85[32];

  v25 = a8 + 16;
  dispatch thunk of DispatchWorkItem.cancel()(a1);
  swift_beginAccess(v25, v85, 0, 0);
  if ((*(_BYTE *)(a8 + 16) & 1) == 0)
  {
    v80 = a1;
    if (a2)
    {
      swift_errorRetain(a2);
      if (qword_100055AC8 != -1)
        swift_once(&qword_100055AC8, sub_1000058E0);
      v26 = type metadata accessor for Logger(0);
      sub_100007E94(v26, (uint64_t)qword_100059040);
      swift_errorRetain(a2);
      swift_bridgeObjectRetain(a10);
      v27 = a11;
      v28 = a12;
      swift_errorRetain(a2);
      swift_bridgeObjectRetain(a10);
      v29 = v27;
      v30 = v28;
      v31 = Logger.logObject.getter(v30);
      v32 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = swift_slowAlloc(72, -1);
        v79 = a15;
        v34 = swift_slowAlloc(128, -1);
        v84 = v34;
        *(_DWORD *)v33 = 136316675;
        swift_bridgeObjectRetain(a10);
        v83 = COERCE_DOUBLE(sub_100008084(a9, a10, &v84));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v33 + 4, v33 + 12);

        swift_bridgeObjectRelease_n(a10, 3);
        *(_WORD *)(v33 + 12) = 2080;
        objc_msgSend(v30, "size");
        v37 = CGSize.debugDescription.getter(v35, v36);
        v39 = v38;
        v83 = COERCE_DOUBLE(sub_100008084(v37, v38, &v84));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v33 + 14, v33 + 22);

        swift_bridgeObjectRelease(v39);
        *(_WORD *)(v33 + 22) = 2080;
        if ((a13 & 1) != 0)
          v40 = 1802658148;
        else
          v40 = 0x746867696CLL;
        if ((a13 & 1) != 0)
          v41 = 0xE400000000000000;
        else
          v41 = 0xE500000000000000;
        v83 = COERCE_DOUBLE(sub_100008084(v40, v41, &v84));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v33 + 24, v33 + 32);
        swift_bridgeObjectRelease(v41);
        *(_WORD *)(v33 + 32) = 2049;
        v83 = a4;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v33 + 34, v33 + 42);
        *(_WORD *)(v33 + 42) = 2049;
        v83 = a5;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v33 + 44, v33 + 52);
        *(_WORD *)(v33 + 52) = 2049;
        v83 = a6;
        v42 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v33 + 54, v33 + 62);
        *(_WORD *)(v33 + 62) = 2080;
        swift_getErrorValue(a2, v82, v81, v42);
        v43 = Error.localizedDescription.getter(v81[1], v81[2]);
        v45 = v44;
        v83 = COERCE_DOUBLE(sub_100008084(v43, v44, &v84));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v33 + 64, v33 + 72);
        swift_bridgeObjectRelease(v45);
        swift_errorRelease(a2);
        swift_errorRelease(a2);
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "🥑 MapGenerator%s: failed making %s %s map for {%{private}f°,%{private}f°}, vspan: %{private}fm (%s)", (uint8_t *)v33, 0x48u);
        swift_arrayDestroy(v34, 4, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v34, -1, -1);
        swift_slowDealloc(v33, -1, -1);

        swift_errorRelease(a2);
        v46 = v80;
        if (!v80)
          goto LABEL_40;
LABEL_43:
        v78 = objc_msgSend(v46, "image", v79);
        goto LABEL_44;
      }
      swift_errorRelease(a2);

      swift_bridgeObjectRelease_n(a10, 2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);

      v46 = v80;
      if (v80)
        goto LABEL_43;
    }
    else
    {
      if (a1)
      {
        v47 = objc_msgSend(a1, "image");

        if (v47)
        {
          if (qword_100055AC8 != -1)
            swift_once(&qword_100055AC8, sub_1000058E0);
          v48 = type metadata accessor for Logger(0);
          sub_100007E94(v48, (uint64_t)qword_100059040);
          v49 = a12;
          swift_bridgeObjectRetain_n(a10, 2);
          v50 = a11;
          v51 = v49;
          v52 = v50;
          v53 = Logger.logObject.getter(v52);
          v54 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v53, v54))
          {
            v55 = swift_slowAlloc(62, -1);
            v79 = swift_slowAlloc(96, -1);
            v84 = v79;
            *(_DWORD *)v55 = 136316419;
            swift_bridgeObjectRetain(a10);
            v83 = COERCE_DOUBLE(sub_100008084(a9, a10, &v84));
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v55 + 4, v55 + 12);

            swift_bridgeObjectRelease_n(a10, 3);
            *(_WORD *)(v55 + 12) = 2080;
            objc_msgSend(v51, "size");
            v58 = CGSize.debugDescription.getter(v56, v57);
            v60 = v59;
            v83 = COERCE_DOUBLE(sub_100008084(v58, v59, &v84));
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v55 + 14, v55 + 22);

            swift_bridgeObjectRelease(v60);
            *(_WORD *)(v55 + 22) = 2080;
            if ((a13 & 1) != 0)
              v61 = 1802658148;
            else
              v61 = 0x746867696CLL;
            if ((a13 & 1) != 0)
              v62 = 0xE400000000000000;
            else
              v62 = 0xE500000000000000;
            v83 = COERCE_DOUBLE(sub_100008084(v61, v62, &v84));
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v55 + 24, v55 + 32);
            swift_bridgeObjectRelease(v62);
            *(_WORD *)(v55 + 32) = 2049;
            v83 = a4;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v55 + 34, v55 + 42);
            *(_WORD *)(v55 + 42) = 2049;
            v83 = a5;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v55 + 44, v55 + 52);
            *(_WORD *)(v55 + 52) = 2049;
            v83 = a6;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v55 + 54, v55 + 62);
            _os_log_impl((void *)&_mh_execute_header, v53, v54, "🥑 MapGenerator%s: made %s %s map for {%{private}f°,%{private}f°}, span: %{private}fm", (uint8_t *)v55, 0x3Eu);
            swift_arrayDestroy(v79, 3, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v79, -1, -1);
            swift_slowDealloc(v55, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n(a10, 2);
          }
          v46 = v80;
          goto LABEL_43;
        }
      }
      if (qword_100055AC8 != -1)
        swift_once(&qword_100055AC8, sub_1000058E0);
      v63 = type metadata accessor for Logger(0);
      sub_100007E94(v63, (uint64_t)qword_100059040);
      v64 = a12;
      swift_bridgeObjectRetain_n(a10, 2);
      v65 = a11;
      v66 = v64;
      v67 = v65;
      v68 = Logger.logObject.getter(v67);
      v69 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v68, v69))
      {
        v70 = swift_slowAlloc(62, -1);
        v79 = swift_slowAlloc(96, -1);
        v84 = v79;
        *(_DWORD *)v70 = 136316419;
        swift_bridgeObjectRetain(a10);
        v83 = COERCE_DOUBLE(sub_100008084(a9, a10, &v84));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v70 + 4, v70 + 12);

        swift_bridgeObjectRelease_n(a10, 3);
        *(_WORD *)(v70 + 12) = 2080;
        objc_msgSend(v66, "size");
        v73 = CGSize.debugDescription.getter(v71, v72);
        v75 = v74;
        v83 = COERCE_DOUBLE(sub_100008084(v73, v74, &v84));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v70 + 14, v70 + 22);

        swift_bridgeObjectRelease(v75);
        *(_WORD *)(v70 + 22) = 2080;
        if ((a13 & 1) != 0)
          v76 = 1802658148;
        else
          v76 = 0x746867696CLL;
        if ((a13 & 1) != 0)
          v77 = 0xE400000000000000;
        else
          v77 = 0xE500000000000000;
        v83 = COERCE_DOUBLE(sub_100008084(v76, v77, &v84));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v70 + 24, v70 + 32);
        swift_bridgeObjectRelease(v77);
        *(_WORD *)(v70 + 32) = 2049;
        v83 = a4;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v70 + 34, v70 + 42);
        *(_WORD *)(v70 + 42) = 2049;
        v83 = a5;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v70 + 44, v70 + 52);
        *(_WORD *)(v70 + 52) = 2049;
        v83 = a6;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v70 + 54, v70 + 62);
        _os_log_impl((void *)&_mh_execute_header, v68, v69, "🥑 MapGenerator%s: could not make %s %s map for {%{private}f°,%{private}f°}, span: %{private}fm", (uint8_t *)v70, 0x3Eu);
        swift_arrayDestroy(v79, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v79, -1, -1);
        swift_slowDealloc(v70, -1, -1);

        v46 = v80;
        if (!v80)
          goto LABEL_40;
        goto LABEL_43;
      }

      swift_bridgeObjectRelease_n(a10, 2);
      v46 = v80;
      if (v80)
        goto LABEL_43;
    }
LABEL_40:
    v78 = 0;
LABEL_44:
    a14(v78);

  }
}

void sub_1000330C0(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_100033134(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, void *a8, CLLocationDegrees a9, CLLocationDegrees a10, CLLocationDistance a11, double a12, double a13, double a14)
{
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  _QWORD *v41;
  uint64_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD aBlock[5];
  _QWORD *v66;

  v55 = a7;
  v58 = a5;
  v59 = a4;
  v24 = a3 & 1;
  v60 = type metadata accessor for DispatchWorkItemFlags(0);
  v63 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v57 = (char *)&v54 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for DispatchQoS(0);
  v61 = *(_QWORD *)(v26 - 8);
  v62 = v26;
  __chkstk_darwin(v26);
  v56 = (char *)&v54 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = swift_allocObject(&unk_100052B10, 24, 7);
  *(_QWORD *)(v28 + 16) = 0;
  v29 = swift_allocObject(&unk_100052B10, 24, 7);
  *(_QWORD *)(v29 + 16) = 0;
  v30 = dispatch_group_create();
  dispatch_group_enter(v30);
  v31 = swift_allocObject(&unk_100052B38, 32, 7);
  *(_QWORD *)(v31 + 16) = v28;
  *(_QWORD *)(v31 + 24) = v30;
  swift_retain(v28);
  v32 = v30;
  v33 = a2;
  v34 = a2;
  v35 = a6;
  v36 = a6;
  v37 = v55;
  sub_100031650(a1, v33, v24, 0, (uint64_t)sub_100033B34, v31, v36, v55, a9, a10, a11, a12, a13, a14, a8);
  swift_release(v31);
  dispatch_group_enter(v32);
  v38 = swift_allocObject(&unk_100052B60, 32, 7);
  *(_QWORD *)(v38 + 16) = v29;
  *(_QWORD *)(v38 + 24) = v32;
  v39 = v32;
  swift_retain(v29);
  sub_100031650(a1, v34, v24, 1, (uint64_t)sub_100033948, v38, v35, v37, a9, a10, a11, a12, a13, a14, a8);
  swift_release(v38);
  sub_10000B9B8();
  v40 = (void *)static OS_dispatch_queue.main.getter();
  v41 = (_QWORD *)swift_allocObject(&unk_100052B88, 48, 7);
  v41[2] = v28;
  v41[3] = v29;
  v42 = v58;
  v41[4] = v59;
  v41[5] = v42;
  aBlock[4] = sub_100033994;
  v66 = v41;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B164;
  aBlock[3] = &unk_100052BA0;
  v43 = _Block_copy(aBlock);
  swift_retain(v28);
  swift_retain(v29);
  swift_retain(v42);
  v44 = v56;
  static DispatchQoS.unspecified.getter(v45);
  v64 = _swiftEmptyArrayStorage;
  v46 = sub_1000086D4(&qword_100056040, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v47 = sub_100004A10(&qword_100056048);
  v48 = sub_1000339B8((unint64_t *)&qword_100056050, &qword_100056048);
  v49 = v57;
  v50 = v47;
  v51 = v60;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v64, v50, v48, v60, v46);
  OS_dispatch_group.notify(qos:flags:queue:execute:)(v44, v49, v40, v43);
  _Block_release(v43);

  (*(void (**)(char *, uint64_t))(v63 + 8))(v49, v51);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v44, v62);
  v52 = v66;
  swift_release(v28);
  swift_release(v29);
  return swift_release(v52);
}

void sub_100033510(uint64_t a1, uint64_t a2, void (*a3)(void *, void *, uint64_t))
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _BYTE v12[24];

  v6 = a2 + 16;
  swift_beginAccess(a1 + 16, v12, 0, 0);
  v7 = *(void **)(a1 + 16);
  swift_beginAccess(v6, &v11, 0, 0);
  v8 = *(void **)(a2 + 16);
  v9 = v8;
  v10 = v7;
  a3(v7, v8, 1);

}

double sub_1000335AC(uint64_t a1, unint64_t a2, double a3)
{
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
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void *v25;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v27 = a2;
  v28 = a1;
  v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B9B8();
  static DispatchQoS.userInitiated.getter();
  v30 = &_swiftEmptyArrayStorage;
  v14 = sub_1000086D4(&qword_100056020, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v15 = sub_100004A10(&qword_100056028);
  v16 = sub_1000339B8((unint64_t *)&qword_100056030, &qword_100056028);
  v17 = v14;
  v18 = v27;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v15, v16, v8, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v4);
  OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000013, 0x8000000100041F10, v13, v10, v7, 0);
  v19 = qword_100055AC8;
  swift_bridgeObjectRetain(v18);
  if (v19 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v20 = type metadata accessor for Logger(0);
  sub_100007E94(v20, (uint64_t)qword_100059040);
  v21 = swift_bridgeObjectRetain(v18);
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc(12, -1);
    v25 = (void *)swift_slowAlloc(32, -1);
    v30 = v25;
    *(_DWORD *)v24 = 136315138;
    swift_bridgeObjectRetain(v18);
    v29 = sub_100008084(v28, v18, (uint64_t *)&v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease_n(v18, 3);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "🥑 MapGenerator%s: init", v24, 0xCu);
    swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v18, 2);
  }
  return a3;
}

uint64_t sub_1000338F0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003391C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_100033948(void *a1)
{
  uint64_t v1;

  sub_10002A43C(a1, *(_QWORD *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_100033960()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

void sub_100033994()
{
  uint64_t v0;

  sub_100033510(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(void *, void *, uint64_t))(v0 + 32));
}

uint64_t sub_1000339A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000339B0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000339B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100004A50(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000339F8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100033A08()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

  swift_release(*(_QWORD *)(v0 + 128));
  return swift_deallocObject(v0, 136, 7);
}

void sub_100033A4C()
{
  uint64_t v0;

  sub_1000322A0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(void **)(v0 + 64), *(_BYTE *)(v0 + 72), *(void (**)(_QWORD))(v0 + 120), *(double *)(v0 + 40), *(double *)(v0 + 80), *(double *)(v0 + 88), *(double *)(v0 + 96), *(double *)(v0 + 104), *(double *)(v0 + 112));
}

uint64_t sub_100033A94()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));

  swift_release(*(_QWORD *)(v0 + 112));
  return swift_deallocObject(v0, 120, 7);
}

void sub_100033AE0(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000326F8(a1, a2, *(double *)(v2 + 48), *(double *)(v2 + 80), *(double *)(v2 + 88), *(double *)(v2 + 96), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(void **)(v2 + 56), *(void **)(v2 + 64), *(_BYTE *)(v2 + 72), *(void (**)(id))(v2 + 104), *(_QWORD *)(v2 + 112));
}

uint64_t sub_100033B38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  if (!((unint64_t)a2 >> 62))
  {
    v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
    return 0;
  }
LABEL_13:
  if (a2 < 0)
    v10 = a2;
  else
    v10 = a2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a2);
  v3 = _CocoaArrayWrapper.endIndex.getter(v10);
  swift_bridgeObjectRelease(a2);
  if (!v3)
    return 0;
LABEL_3:
  v4 = type metadata accessor for FMFManager(0);
  for (i = 0; ; ++i)
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a2);
    }
    else
    {
      v6 = *(_QWORD *)(a2 + 8 * i + 32);
      swift_retain(v6);
    }
    v12 = v6;
    v7 = sub_1000086D4(&qword_100057730, (uint64_t (*)(uint64_t))&type metadata accessor for FMFManager, (uint64_t)&protocol conformance descriptor for FMFManager);
    v8 = dispatch thunk of static Equatable.== infix(_:_:)(&v12, &v13, v4, v7);
    swift_release(v6);
    if ((v8 & 1) != 0)
      break;
    v9 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    if (v9 == v3)
      return 0;
  }
  return i;
}

uint64_t sub_100033C80(unint64_t a1)
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
    v3 = sub_100038F44(v3);
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

Swift::String *peopleWidgetBundleId.unsafeMutableAddressor()
{
  return &peopleWidgetBundleId;
}

uint64_t sub_100033D6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_100033D8C()
{
  uint64_t v0;

  sub_10002C0F0(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), *(void **)(v0 + 96));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
}

uint64_t sub_100033DBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v2 = type metadata accessor for Logger(0);
  sub_100007E94(v2, (uint64_t)qword_100059040);
  swift_retain(v0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = *(_QWORD *)(v1 + 16);
    v9 = *(_QWORD *)(v1 + 24);
    swift_bridgeObjectRetain(v9);
    v11 = sub_100008084(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    swift_release(v1);
    swift_bridgeObjectRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "🥑 PeopleDataService%s: deinit", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_release(v1);
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 48));
  sub_10002C0F0(*(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(void **)(v1 + 96));

  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 112));
  return v1;
}

uint64_t sub_100033FAC()
{
  uint64_t v0;

  sub_100033DBC();
  return swift_deallocClassInstance(v0, 129, 7);
}

uint64_t type metadata accessor for PeopleDataService()
{
  return objc_opt_self(_TtC18FindMyWidgetPeople17PeopleDataService);
}

uint64_t sub_100033FEC()
{
  return 0x656C706F6550;
}

uint64_t sub_100034000()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  char v17;
  Swift::String v18;
  uint64_t v19;
  __n128 v20;
  void *v21;
  uint64_t (*v22)(char *, uint64_t);
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSString v28;
  id v29;
  Class isa;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  void *v38;
  Swift::String v39;
  void *object;
  Swift::String v41;
  void *v42;
  Swift::String v43;
  void *v44;
  void *v45;
  Swift::String v46;
  void *v47;
  uint64_t countAndFlagsBits;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  Swift::String v55;
  uint64_t v57;
  uint64_t v58;
  Swift::String v59;
  uint64_t v60;
  unint64_t v61;

  v58 = type metadata accessor for Date(0);
  v0 = *(_QWORD *)(v58 - 8);
  __chkstk_darwin(v58);
  v2 = (char *)&v57 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100004A10(&qword_100056470);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v57 - v8;
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v57 - v11;
  v60 = 0;
  v61 = 0xE000000000000000;
  FMFFriend.location.getter(v10);
  v13 = type metadata accessor for FMFLocation(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13) == 1)
  {
    v16 = sub_100008C08((uint64_t)v12, &qword_100056470);
  }
  else
  {
    v17 = FMFLocation.locateInProgress.getter();
    v16 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    if ((v17 & 1) != 0)
    {
      v18._countAndFlagsBits = 0x7461636F6C207369;
      v18._object = (void *)0xEB00000000676E69;
      String.append(_:)(v18);
    }
  }
  FMFFriend.location.getter(v16);
  if (v15(v9, 1, v13) == 1)
  {
    v19 = sub_100008C08((uint64_t)v9, &qword_100056470);
  }
  else
  {
    v21 = (void *)FMFLocation.location.getter();
    v22 = *(uint64_t (**)(char *, uint64_t))(v14 + 8);
    v19 = v22(v9, v13);
    if (v21)
    {
      FMFFriend.location.getter(v19);
      if (v15(v6, 1, v13) == 1)
      {
        sub_100008C08((uint64_t)v6, &qword_100056470);
        v23 = 0;
      }
      else
      {
        v23 = FMFLocation.isSecureLocation.getter();
        v22(v6, v13);
      }
      v24 = sub_10002B3D8(v21, v23 & 1);
      v26 = v25;
      v27 = *(void **)(v57 + 120);
      v28 = String._bridgeToObjectiveC()();
      objc_msgSend(v27, "setDateFormat:", v28);

      v29 = objc_msgSend(v21, "timestamp");
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      isa = Date._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v58);
      v31 = objc_msgSend(v27, "stringFromDate:", isa);

      v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
      v34 = v33;

      v35 = v60 & 0xFFFFFFFFFFFFLL;
      if ((v61 & 0x2000000000000000) != 0)
        v35 = HIBYTE(v61) & 0xF;
      v36 = v35 == 0;
      v37 = 8236;
      if (v36)
      {
        v37 = 0;
        v38 = (void *)0xE000000000000000;
      }
      else
      {
        v38 = (void *)0xE200000000000000;
      }
      v59._countAndFlagsBits = v37;
      v59._object = v38;
      swift_bridgeObjectRetain(v38);
      v39._countAndFlagsBits = v24;
      v39._object = v26;
      String.append(_:)(v39);
      swift_bridgeObjectRelease(v38);
      swift_bridgeObjectRelease(v26);
      object = v59._object;
      swift_bridgeObjectRetain(v59._object);
      v41._countAndFlagsBits = v32;
      v41._object = v34;
      String.append(_:)(v41);
      swift_bridgeObjectRelease(object);
      swift_bridgeObjectRelease(v34);
      v42 = v59._object;
      String.append(_:)(v59);

      v20 = swift_bridgeObjectRelease(v42);
    }
  }
  v43._countAndFlagsBits = FMFFriend.name.getter(v19, v20);
  v44 = v43._object;
  v59._countAndFlagsBits = 34;
  v59._object = (void *)0xE100000000000000;
  String.append(_:)(v43);
  swift_bridgeObjectRelease(v44);
  v45 = v59._object;
  swift_bridgeObjectRetain(v59._object);
  v46._countAndFlagsBits = 34;
  v46._object = (void *)0xE100000000000000;
  String.append(_:)(v46);
  swift_bridgeObjectRelease(v45);
  countAndFlagsBits = v59._countAndFlagsBits;
  v47 = v59._object;
  v49 = v60;
  v50 = v61;
  v51 = HIBYTE(v61) & 0xF;
  if ((v61 & 0x2000000000000000) == 0)
    v51 = v60 & 0xFFFFFFFFFFFFLL;
  if (v51)
  {
    v59._countAndFlagsBits = 8236;
    v59._object = (void *)0xE200000000000000;
    v52 = v61;
    String.append(_:)(*(Swift::String *)&v49);
    swift_bridgeObjectRelease(v50);
    v54 = v59._countAndFlagsBits;
    v53 = v59._object;
  }
  else
  {
    swift_bridgeObjectRelease(v61);
    v54 = 0;
    v53 = (void *)0xE000000000000000;
  }
  v59._countAndFlagsBits = countAndFlagsBits;
  v59._object = v47;
  swift_bridgeObjectRetain(v47);
  v55._countAndFlagsBits = v54;
  v55._object = v53;
  String.append(_:)(v55);
  swift_bridgeObjectRelease(v47);
  swift_bridgeObjectRelease(v53);
  return v59._countAndFlagsBits;
}

uint64_t sub_10003446C(void **a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  int v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void **v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t result;
  double v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  dispatch_queue_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  _BYTE *v63;
  void (*v64)(_BYTE *, uint64_t);
  uint64_t v65;
  _QWORD *v66;
  void **v67;
  _QWORD *v68;
  _BYTE *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  _QWORD *v97;
  _BYTE v98[12];
  int v99;
  uint64_t v100;
  void **v101;
  uint64_t v102;
  dispatch_queue_t v103;
  uint64_t v104;
  _BYTE *v105;
  _BYTE *v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE *v112;
  _BYTE *v113;
  _BYTE *v114;
  uint64_t v115;
  _BYTE *v116;
  uint64_t v117;
  _QWORD *v118;
  void **aBlock;
  uint64_t v120;
  uint64_t (*v121)(uint64_t);
  void *v122;
  uint64_t (*v123)();
  _QWORD *v124;

  v5 = v4;
  v104 = a4;
  v9 = type metadata accessor for InitialTabInfo(0);
  __chkstk_darwin(v9);
  v114 = &v98[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v113 = &v98[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for FMFManagerSubsystem(0);
  __chkstk_darwin(v13);
  v112 = &v98[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = type metadata accessor for DispatchTimeInterval(0);
  v109 = *(_QWORD *)(v15 - 8);
  v110 = v15;
  __chkstk_darwin(v15);
  v108 = (uint64_t *)&v98[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v111 = type metadata accessor for DispatchTime(0);
  v107 = *(_QWORD *)(v111 - 8);
  v17 = __chkstk_darwin(v111);
  v105 = &v98[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v17);
  v106 = &v98[-v19];
  v102 = type metadata accessor for DispatchWorkItemFlags(0);
  __chkstk_darwin(v102);
  v103 = (dispatch_queue_t)&v98[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = type metadata accessor for Date(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = &v98[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v25 = type metadata accessor for Logger(0);
  sub_100007E94(v25, (uint64_t)qword_100059040);
  swift_bridgeObjectRetain_n(a2, 2);
  v26 = swift_retain_n(v4, 2);
  v27 = Logger.logObject.getter(v26);
  v28 = static os_log_type_t.default.getter();
  v29 = v28;
  v30 = os_log_type_enabled(v27, v28);
  v115 = a3;
  if (v30)
  {
    v31 = swift_slowAlloc(22, -1);
    v101 = (void **)swift_slowAlloc(64, -1);
    aBlock = v101;
    *(_DWORD *)v31 = 136315394;
    v99 = v29;
    v32 = v5;
    v33 = *(_QWORD *)(v5 + 16);
    v117 = v21;
    v34 = *(_QWORD *)(v32 + 24);
    swift_bridgeObjectRetain(v34);
    v118 = (_QWORD *)sub_100008084(v33, v34, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &aBlock, v31 + 4, v31 + 12);
    swift_release_n(v32, 2);
    swift_bridgeObjectRelease(v34);
    *(_WORD *)(v31 + 12) = 2080;
    v116 = v24;
    if (a2)
      v35 = (uint64_t)a1;
    else
      v35 = 7104878;
    if (a2)
      v36 = a2;
    else
      v36 = 0xE300000000000000;
    swift_bridgeObjectRetain(a2);
    v37 = v35;
    v21 = v117;
    v118 = (_QWORD *)sub_100008084(v37, v36, (uint64_t *)&aBlock);
    v5 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v118, &aBlock, v31 + 14, v31 + 22);
    v24 = v116;
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v36);
    _os_log_impl((void *)&_mh_execute_header, v27, (os_log_type_t)v99, "🥑 PeopleDataService%s: fetching w/proactive location for %s…", (uint8_t *)v31, 0x16u);
    v38 = v101;
    swift_arrayDestroy(v101, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    v39 = v31;
    a3 = v115;
    swift_slowDealloc(v39, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    swift_release_n(v5, 2);
  }
  v40 = swift_allocObject(&unk_100052EB8, 17, 7);
  *(_BYTE *)(v40 + 16) = 1;
  v41 = swift_allocObject(&unk_100052EB8, 17, 7);
  *(_BYTE *)(v41 + 16) = 0;
  v42 = Date.init()(v41);
  v43 = Date.timeIntervalSinceReferenceDate.getter(v42);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v22 + 8))(v24, v21);
  v45 = fmax(*(double *)(v5 + 32) - v43 + 28.0 + -1.0, 1.0);
  if ((~*(_QWORD *)&v45 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (v45 <= -9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v45 >= 9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v46 = (uint64_t)v45;
  v47 = (_QWORD *)swift_allocObject(&unk_100052EE0, 72, 7);
  v47[2] = v41;
  v47[3] = v5;
  v117 = v41;
  v100 = v5;
  v47[4] = v46;
  v47[5] = a1;
  v47[6] = a2;
  v47[7] = a3;
  v48 = v104;
  v47[8] = v104;
  v123 = sub_10003CC00;
  v124 = v47;
  aBlock = _NSConcreteStackBlock;
  v120 = 1107296256;
  v121 = sub_10000B164;
  v122 = &unk_100052EF8;
  v49 = _Block_copy(&aBlock);
  v101 = a1;
  v50 = v49;
  v118 = _swiftEmptyArrayStorage;
  v51 = sub_1000086D4(&qword_100056040, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v116 = (_BYTE *)v40;
  v52 = v51;
  swift_retain(v5);
  swift_bridgeObjectRetain(a2);
  swift_retain(v41);
  swift_retain(v48);
  v53 = sub_100004A10(&qword_100056048);
  v54 = sub_10003AE6C();
  v55 = v103;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v118, v53, v54, v102, v52);
  v56 = type metadata accessor for DispatchWorkItem(0);
  swift_allocObject(v56, *(unsigned int *)(v56 + 48), *(unsigned __int16 *)(v56 + 52));
  v57 = DispatchWorkItem.init(flags:block:)(v55, v50);
  v58 = swift_release(v124);
  v103 = *(dispatch_queue_t *)(v5 + 40);
  v59 = v105;
  static DispatchTime.now()(v58);
  v61 = v108;
  v60 = v109;
  *v108 = v46;
  v62 = v110;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v60 + 104))(v61, enum case for DispatchTimeInterval.seconds(_:), v110);
  v63 = v106;
  + infix(_:_:)(v59, v61);
  (*(void (**)(uint64_t *, uint64_t))(v60 + 8))(v61, v62);
  v64 = *(void (**)(_BYTE *, uint64_t))(v107 + 8);
  v65 = v111;
  v64(v59, v111);
  OS_dispatch_queue.asyncAfter(deadline:execute:)(v63, v57);
  v64(v63, v65);
  v66 = (_QWORD *)swift_allocObject(&unk_100052F30, 40, 7);
  v67 = v101;
  v66[2] = v5;
  v66[3] = v67;
  v66[4] = a2;
  v68 = (_QWORD *)swift_allocObject(&unk_100052F58, 80, 7);
  v69 = v116;
  v70 = v117;
  v71 = v68;
  v68[2] = v116;
  v68[3] = v5;
  v68[4] = v57;
  v68[5] = v70;
  v102 = v57;
  v68[6] = v67;
  v68[7] = a2;
  v68[8] = v115;
  v68[9] = v48;
  v72 = type metadata accessor for FMFSnapshotHandlers(0);
  swift_allocObject(v72, *(unsigned int *)(v72 + 48), *(unsigned __int16 *)(v72 + 52));
  swift_retain_n(v5, 2);
  swift_bridgeObjectRetain_n(a2, 2);
  swift_retain(v70);
  swift_retain(v48);
  swift_retain(v69);
  swift_retain(v57);
  swift_retain(v66);
  swift_retain(v71);
  v73 = FMFSnapshotHandlers.init(responseFilter:responseHandler:)(sub_10003CC40, v66, sub_10003CC98, v71);
  type metadata accessor for FMFManagerConfiguration(0);
  v74 = swift_retain(v73);
  v75 = static FMFManagerConfiguration.default.getter(v74);
  v76 = v112;
  FMFManagerConfiguration.enabledSubsystems.getter();
  v77 = swift_release(v75);
  v78 = static FMFManagerConfiguration.default.getter(v77);
  v79 = v113;
  FMFManagerConfiguration.preferredLocale.getter();
  v80 = swift_release(v78);
  v81 = static FMFManagerConfiguration.default.getter(v80);
  v82 = FMFManagerConfiguration.cacheDirectory.getter();
  v84 = v83;
  v85 = swift_release(v81);
  v86 = static FMFManagerConfiguration.default.getter(v85);
  LOBYTE(v59) = FMFManagerConfiguration.useCache.getter();
  swift_release(v86);
  v87 = FMFManagerConfiguration.__allocating_init(enabledSubsystems:preferredLocale:cacheDirectory:useCache:snapshotHandlers:useOptimizedFetch:disableContactMatching:)(v76, v79, v82, v84, v59 & 1, v73, 1, 0);
  v88 = swift_retain(v87);
  v89 = v114;
  InitialTabInfo.init()(v88);
  v90 = type metadata accessor for FMFManager(0);
  swift_allocObject(v90, *(unsigned int *)(v90 + 48), *(unsigned __int16 *)(v90 + 52));
  v91 = FMFManager.init(configuration:tabInfo:)(v87, v89);
  v92 = dispatch thunk of FMFManager.initialize()();
  dispatch thunk of FMFManager.startRefreshing()(v92);
  v93 = swift_allocObject(&unk_100052F80, 32, 7);
  v94 = v100;
  *(_QWORD *)(v93 + 16) = v100;
  *(_QWORD *)(v93 + 24) = v91;
  v95 = swift_allocObject(&unk_100052FA8, 32, 7);
  *(_QWORD *)(v95 + 16) = sub_10003CCFC;
  *(_QWORD *)(v95 + 24) = v93;
  v123 = sub_10000C324;
  v124 = (_QWORD *)v95;
  aBlock = _NSConcreteStackBlock;
  v120 = 1107296256;
  v121 = sub_100033D6C;
  v122 = &unk_100052FC0;
  v96 = _Block_copy(&aBlock);
  v97 = v124;
  swift_retain(v94);
  swift_retain(v91);
  swift_retain(v95);
  swift_release(v97);
  dispatch_sync(v103, v96);
  swift_release(v91);
  swift_release(v87);
  swift_release(v73);
  swift_release(v71);
  swift_release(v66);
  swift_release(v102);
  _Block_release(v96);
  LOBYTE(v94) = swift_isEscapingClosureAtFileLocation(v95, "", 103, 183, 34, 1);
  swift_release(v93);
  swift_release(v116);
  swift_release(v117);
  result = swift_release(v95);
  if ((v94 & 1) != 0)
LABEL_20:
    __break(1u);
  return result;
}

uint64_t sub_100034E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, void (*a6)(_QWORD, _QWORD, _QWORD), uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSString v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(_QWORD, _QWORD, _QWORD);
  uint64_t v41;
  uint64_t v42;
  char v43[24];

  v14 = sub_100004A10(&qword_100057710);
  __chkstk_darwin(v14);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess(a1 + 16, v43, 1, 0);
  *(_BYTE *)(a1 + 16) = 1;
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v17 = type metadata accessor for Logger(0);
  sub_100007E94(v17, (uint64_t)qword_100059040);
  swift_bridgeObjectRetain_n(a5, 2);
  v18 = swift_retain_n(a2, 2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(32, -1);
    v38 = a3;
    v22 = v21;
    v23 = swift_slowAlloc(64, -1);
    v42 = v23;
    *(_DWORD *)v22 = 136315650;
    v37 = a4;
    v39 = a7;
    v40 = a6;
    v24 = *(_QWORD *)(a2 + 16);
    v25 = *(_QWORD *)(a2 + 24);
    swift_bridgeObjectRetain(v25);
    v41 = sub_100008084(v24, v25, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v22 + 4, v22 + 12);
    swift_release_n(a2, 2);
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v22 + 12) = 2048;
    v41 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v22 + 14, v22 + 22);
    *(_WORD *)(v22 + 22) = 2080;
    if (a5)
      v26 = v37;
    else
      v26 = 7104878;
    if (a5)
      v27 = a5;
    else
      v27 = 0xE300000000000000;
    swift_bridgeObjectRetain(a5);
    v41 = sub_100008084(v26, v27, &v42);
    a6 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v22 + 24, v22 + 32);
    swift_bridgeObjectRelease_n(a5, 2);
    swift_bridgeObjectRelease(v27);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "🥑 PeopleDataService%s: timed out (%ld-s) fetching proactive location for %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy(v23, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a5, 2);
    swift_release_n(a2, 2);
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)(NSURLErrorDomain);
  v29 = v28;
  v30 = objc_allocWithZone((Class)NSError);
  v31 = String._bridgeToObjectiveC()();
  v32 = objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 1001, 0, swift_bridgeObjectRelease(v29).n128_f64[0]);

  v33 = type metadata accessor for FMFFriend(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v16, 1, 1, v33);
  v34 = v32;
  a6(v16, 0, v32);

  return sub_100008C08((uint64_t)v16, &qword_100057710);
}

uint64_t sub_10003520C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, unint64_t, uint64_t);
  __n128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  __n128 v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t, __n128);
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t, uint64_t);
  int v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t result;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75[4];

  v71 = a5;
  v9 = type metadata accessor for FMFFriend(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v65 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v64 - v13;
  v15 = sub_100004A10(&qword_100057710);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v16);
  v68 = (uint64_t)&v64 - v20;
  __chkstk_darwin(v19);
  v22 = (char *)&v64 - v21;
  v75[0] = a3;
  swift_bridgeObjectRetain(a3);
  sub_100038FAC(v75);
  v23 = v75[0];
  v24 = *(_QWORD *)(v75[0] + 16);
  v69 = v18;
  v70 = v22;
  if (!v24)
  {
    v37 = 1;
    goto LABEL_14;
  }
  v66 = a4;
  v67 = v75[0];
  v25 = v75[0] + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  v26 = *(_QWORD *)(v10 + 72);
  v27 = v10;
  v28 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v10 + 16);
  swift_retain(v75[0]);
  while (1)
  {
    v30 = v9;
    v31 = v28(v14, v25, v9);
    v32 = FMFFriend.identifier.getter(v31);
    v34 = v33;
    if (!a6)
    {
      v29 = swift_bridgeObjectRelease(v33);
      goto LABEL_4;
    }
    if (v32 == v71 && v33 == a6)
      break;
    v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v33, v71, a6, 0);
    v29 = swift_bridgeObjectRelease(v34);
    if ((v35 & 1) != 0)
    {
      swift_release(v67);
      goto LABEL_13;
    }
LABEL_4:
    v9 = v30;
    (*(void (**)(char *, uint64_t, __n128))(v27 + 8))(v14, v30, v29);
    v25 += v26;
    if (!--v24)
    {
      v23 = v67;
      swift_release(v67);
      v37 = 1;
      v10 = v27;
      v18 = v69;
      v22 = v70;
      a4 = v66;
      goto LABEL_14;
    }
  }
  swift_release(v67);
  v36 = swift_bridgeObjectRelease(v34);
LABEL_13:
  v9 = v30;
  v10 = v27;
  v38 = *(void (**)(char *, char *, uint64_t, __n128))(v27 + 32);
  v22 = v70;
  v38(v70, v14, v30, v36);
  v37 = 0;
  v18 = v69;
  a4 = v66;
  v23 = v67;
LABEL_14:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v22, v37, 1, v9);
  swift_release(v23);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v39 = type metadata accessor for Logger(0);
  sub_100007E94(v39, (uint64_t)qword_100059040);
  v40 = swift_retain(a4);
  v41 = Logger.logObject.getter(v40);
  v42 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v41, (os_log_type_t)v42))
  {
    v43 = swift_slowAlloc(22, -1);
    v44 = swift_slowAlloc(64, -1);
    v75[0] = v44;
    *(_DWORD *)v43 = 136315394;
    v45 = a4;
    v46 = *(_QWORD *)(a4 + 16);
    v71 = v9;
    v47 = *(_QWORD *)(v45 + 24);
    swift_bridgeObjectRetain(v47);
    v48 = v46;
    v49 = v70;
    v73 = sub_100008084(v48, v47, v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, &v74, v43 + 4, v43 + 12);
    swift_release(v45);
    v50 = v71;
    swift_bridgeObjectRelease(v47);
    *(_WORD *)(v43 + 12) = 2080;
    swift_beginAccess(v49, &v73, 0, 0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v49, 1, v50))
    {
      v51 = 0xE300000000000000;
      v52 = 7104878;
    }
    else
    {
      v53 = v65;
      v54 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 16))(v65, v49, v50);
      v52 = FMFFriend.identifier.getter(v54);
      v51 = v55;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v53, v50);
    }
    v72 = sub_100008084(v52, v51, v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v43 + 14, v43 + 22);
    swift_bridgeObjectRelease(v51);
    _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)v42, "🥑 PeopleDataService%s: selected friend: %s", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy(v44, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1, -1);
    swift_slowDealloc(v43, -1, -1);

    v22 = v70;
    v9 = v71;
    v18 = v69;
  }
  else
  {

    swift_release(a4);
  }
  swift_beginAccess(v22, v75, 0, 0);
  v56 = v68;
  sub_100008CE0((uint64_t)v22, v68, &qword_100057710);
  v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  v58 = v57(v56, 1, v9);
  sub_100008C08(v56, &qword_100057710);
  if (v58 == 1)
  {
    v59 = _swiftEmptyArrayStorage;
    goto LABEL_26;
  }
  v60 = sub_100004A10(&qword_100057738);
  v61 = *(unsigned __int8 *)(v10 + 80);
  v62 = (v61 + 32) & ~v61;
  v59 = (_QWORD *)swift_allocObject(v60, v62 + *(_QWORD *)(v10 + 72), v61 | 7);
  *((_OWORD *)v59 + 1) = xmmword_1000429B0;
  sub_100008CE0((uint64_t)v22, (uint64_t)v18, &qword_100057710);
  if (v57((uint64_t)v18, 1, v9) == 1)
  {
    __break(1u);
    result = swift_release(v42);
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))((char *)v59 + v62, v18, v9);
LABEL_26:
    sub_100008C08((uint64_t)v22, &qword_100057710);
    return (uint64_t)v59;
  }
  return result;
}

uint64_t sub_1000357B4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7, uint64_t a8, uint64_t a9, char *a10, unint64_t a11, NSObject *a12, unint64_t a13)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t isEscapingClosureAtFileLocation;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  __n128 v48;
  void (*v49)(char *, uint64_t, __n128);
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  unsigned __int8 *v56;
  void (*v58)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int8 *v73;
  os_log_t v74;
  int v75;
  uint64_t v76;
  NSObject *v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  unsigned __int8 *v83;
  char *v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t aBlock[5];
  unint64_t v90;
  char v91;
  char v92[32];

  v85 = a5;
  v81 = a4;
  v79 = a3;
  v18 = sub_100004A10(&qword_100057710);
  v19 = __chkstk_darwin(v18);
  v84 = (char *)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v22 = (char *)&v74 - v21;
  v87 = type metadata accessor for FMFFriend(0);
  v23 = *(_QWORD *)(v87 - 8);
  v24 = __chkstk_darwin(v87);
  v82 = (char *)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v86 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)&v74 - v26);
  LOBYTE(a2) = *(_QWORD *)(a2 + 16) == 0;
  v83 = (unsigned __int8 *)(a6 + 16);
  swift_beginAccess(a6 + 16, v92, 1, 0);
  *(_BYTE *)(a6 + 16) = a2;
  v91 = 0;
  v27 = a7[5];
  v28 = (_QWORD *)swift_allocObject(&unk_100052FF8, 56, 7);
  v28[2] = a7;
  v28[3] = a1;
  v28[4] = a8;
  v28[5] = &v91;
  v28[6] = a9 + 16;
  v29 = swift_allocObject(&unk_100053020, 32, 7);
  *(_QWORD *)(v29 + 16) = sub_10003CD48;
  *(_QWORD *)(v29 + 24) = v28;
  aBlock[4] = (uint64_t)sub_10003CD68;
  v90 = v29;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100033D6C;
  aBlock[3] = (uint64_t)&unk_100053038;
  v30 = _Block_copy(aBlock);
  v31 = v90;
  swift_retain(a7);
  v80 = a1;
  swift_retain(a1);
  swift_retain(a8);
  swift_retain(v29);
  swift_release(v31);
  dispatch_sync(v27, v30);
  _Block_release(v30);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v29, "", 103, 148, 42, 1);
  swift_release(v29);
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if ((v91 & 1) != 0)
    return swift_release(v28);
  v27 = a12;
  v31 = a13;
  if (*(_QWORD *)(v81 + 16))
  {
    v33 = v81 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    isEscapingClosureAtFileLocation = v87;
    v81 = *(_QWORD *)(v23 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v81)(v22, v33, v87);
    v30 = v86;
    a1 = v82;
    goto LABEL_7;
  }
  v30 = v86;
  isEscapingClosureAtFileLocation = v87;
  a1 = v82;
  if (*(_QWORD *)(v79 + 16))
  {
    v34 = v79 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v81 = *(_QWORD *)(v23 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v81)(v22, v34, v87);
LABEL_7:
    v82 = *(char **)(v23 + 56);
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v82)(v22, 0, 1, isEscapingClosureAtFileLocation);
    (*(void (**)(void *, char *, uint64_t))(v23 + 32))(v30, v22, isEscapingClosureAtFileLocation);
    v79 = sub_100034000();
    v29 = v35;
    if (qword_100055AC8 == -1)
    {
LABEL_8:
      v36 = type metadata accessor for Logger(0);
      sub_100007E94(v36, (uint64_t)qword_100059040);
      ((void (*)(char *, void *, uint64_t))v81)(a1, v30, isEscapingClosureAtFileLocation);
      swift_retain_n(a7, 2);
      v37 = swift_bridgeObjectRetain(v29);
      v38 = Logger.logObject.getter(v37);
      v39 = static os_log_type_t.default.getter();
      v40 = v39;
      if (os_log_type_enabled(v38, v39))
      {
        v41 = swift_slowAlloc(32, -1);
        v76 = swift_slowAlloc(96, -1);
        aBlock[0] = v76;
        *(_DWORD *)v41 = 136315650;
        v74 = v38;
        v75 = v40;
        v78 = v31;
        v42 = a7[2];
        v43 = a7[3];
        swift_bridgeObjectRetain(v43);
        v88 = sub_100008084(v42, v43, aBlock);
        v77 = v27;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, aBlock, v41 + 4, v41 + 12);
        swift_release_n(a7, 2);
        swift_bridgeObjectRelease(v43);
        *(_WORD *)(v41 + 12) = 2080;
        v45 = FMFFriend.identifier.getter(v44);
        v47 = v46;
        v88 = sub_100008084(v45, v46, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, aBlock, v41 + 14, v41 + 22);
        v48 = swift_bridgeObjectRelease(v47);
        v49 = *(void (**)(char *, uint64_t, __n128))(v23 + 8);
        v49(a1, v87, v48);
        *(_WORD *)(v41 + 22) = 2080;
        swift_bridgeObjectRetain(v29);
        v88 = sub_100008084(v79, v29, aBlock);
        v27 = v77;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, aBlock, v41 + 24, v41 + 32);
        swift_bridgeObjectRelease_n(v29, 3);
        v50 = v74;
        _os_log_impl((void *)&_mh_execute_header, v74, (os_log_type_t)v75, "🥑 PeopleDataService%s: provided %s: %s", (uint8_t *)v41, 0x20u);
        v51 = v76;
        swift_arrayDestroy(v76, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v51, -1, -1);
        v52 = v41;
        isEscapingClosureAtFileLocation = v87;
        swift_slowDealloc(v52, -1, -1);

      }
      else
      {
        swift_release_n(a7, 2);
        v49 = *(void (**)(char *, uint64_t, __n128))(v23 + 8);
        ((void (*)(char *, uint64_t))v49)(a1, isEscapingClosureAtFileLocation);

        v53 = swift_bridgeObjectRelease_n(v29, 2);
      }
      dispatch thunk of FMFManager.stopRefreshing()(v53);
      v54 = (uint64_t)v84;
      v55 = v86;
      ((void (*)(char *, void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t))v81)(v84, v86, isEscapingClosureAtFileLocation);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v82)(v54, 0, 1, isEscapingClosureAtFileLocation);
      v56 = v83;
      swift_beginAccess(v83, aBlock, 0, 0);
      ((void (*)(uint64_t, _QWORD, uint64_t))v27)(v54, *v56, v85);
      sub_100008C08(v54, &qword_100057710);
      ((void (*)(void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t))v49)(v55, isEscapingClosureAtFileLocation);
      return swift_release(v28);
    }
LABEL_26:
    swift_once(&qword_100055AC8, sub_1000058E0);
    goto LABEL_8;
  }
  v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  v58(v22, 1, 1, v87);
  sub_100008C08((uint64_t)v22, &qword_100057710);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v59 = type metadata accessor for Logger(0);
  sub_100007E94(v59, (uint64_t)qword_100059040);
  swift_bridgeObjectRetain_n(a11, 2);
  v60 = swift_retain_n(a7, 2);
  v61 = Logger.logObject.getter(v60);
  v62 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v61, v62))
  {
    v82 = a10;
    v63 = swift_slowAlloc(22, -1);
    v64 = swift_slowAlloc(64, -1);
    v78 = a13;
    v65 = v64;
    aBlock[0] = v64;
    *(_DWORD *)v63 = 136315394;
    v86 = v58;
    v77 = a12;
    v66 = a7[2];
    v67 = a7[3];
    swift_bridgeObjectRetain(v67);
    v88 = sub_100008084(v66, v67, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, aBlock, v63 + 4, v63 + 12);
    swift_release_n(a7, 2);
    swift_bridgeObjectRelease(v67);
    *(_WORD *)(v63 + 12) = 2080;
    if (a11)
      v68 = (uint64_t)v82;
    else
      v68 = 7104878;
    if (a11)
      v69 = a11;
    else
      v69 = 0xE300000000000000;
    swift_bridgeObjectRetain(a11);
    v70 = v68;
    v58 = v86;
    v88 = sub_100008084(v70, v69, aBlock);
    v27 = v77;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, aBlock, v63 + 14, v63 + 22);
    swift_bridgeObjectRelease_n(a11, 2);
    swift_bridgeObjectRelease(v69);
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "🥑 PeopleDataService%s: provided no model for %s", (uint8_t *)v63, 0x16u);
    swift_arrayDestroy(v65, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v65, -1, -1);
    v71 = v63;
    isEscapingClosureAtFileLocation = v87;
    swift_slowDealloc(v71, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a11, 2);
    swift_release_n(a7, 2);
  }
  v72 = (uint64_t)v84;
  v58(v84, 1, 1, isEscapingClosureAtFileLocation);
  v73 = v83;
  swift_beginAccess(v83, aBlock, 0, 0);
  ((void (*)(uint64_t, _QWORD, uint64_t))v27)(v72, *v73, v85);
  sub_100008C08(v72, &qword_100057710);
  return swift_release(v28);
}

uint64_t sub_100036068(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, _BYTE *a5)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _BYTE v17[24];
  _BYTE v18[24];

  v9 = a1 + 112;
  swift_beginAccess(a1 + 112, v18, 0, 0);
  v10 = *(_QWORD *)(a1 + 112);
  swift_bridgeObjectRetain(v10);
  v11 = sub_100033B38(a2, v10);
  v13 = v12;
  swift_bridgeObjectRelease(v10);
  if ((v13 & 1) == 0)
  {
    swift_beginAccess(v9, v17, 33, 0);
    v15 = sub_100033C80(v11);
    swift_endAccess(v17);
    v14 = swift_release(v15);
  }
  dispatch thunk of DispatchWorkItem.cancel()(v14);
  result = swift_beginAccess(a5, v17, 0, 0);
  *a4 = *a5;
  return result;
}

uint64_t sub_10003614C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE v10[24];

  swift_beginAccess(a1 + 112, v10, 33, 0);
  v4 = swift_retain(a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v4);
  v5 = *(_QWORD *)(a1 + 112) & 0xFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v5 + 0x10);
  v6 = *(_QWORD *)(v5 + 24);
  if (v7 >= v6 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v6 > 1, v7 + 1, 1);
  v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, a2);
  specialized Array._endMutation()(v8);
  return swift_endAccess(v10);
}

uint64_t sub_1000361E4(void *a1, void *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, double a9, uint64_t a10, void *a11, unint64_t a12, void (*a13)(unint64_t), uint64_t a14)
{
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  int v35;
  void *v36;
  unsigned int v37;
  id v38;
  id v39;
  int v40;
  unsigned int v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v59;
  int v60;
  uint64_t v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v64 = a8;
  v65 = a6;
  v60 = a7;
  v61 = a5;
  v59 = a4;
  v18 = ~a3;
  v19 = type metadata accessor for FMFFriend(0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v22 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for FriendModel(0);
  __chkstk_darwin(v23);
  v66 = (unint64_t)&v59 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for ColorScheme(0);
  v26 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v28 = (char *)&v59 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = 0.0;
  v62 = a1;
  v63 = a2;
  if (v18)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v28, enum case for ColorScheme.light(_:), v25);
    v30 = sub_10000C08C((uint64_t)v28, a1, a2, a3 & 1);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
    v31 = 0.0;
    if (v30)
    {
      objc_msgSend(v30, "size");
      v31 = v32;
      v29 = v33;

    }
  }
  else
  {
    v31 = 0.0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v59, v19);
  v34 = v64;
  v35 = *(unsigned __int8 *)(v64 + 128);
  v36 = *(void **)(v64 + 56);
  swift_bridgeObjectRetain(v65);
  v37 = objc_msgSend(v36, "airplaneMode");
  v38 = objc_msgSend(*(id *)(v34 + 64), "aa_primaryAppleAccount");
  v39 = v38;
  if (v38)

  if (v37)
    v40 = 256;
  else
    v40 = 0;
  v41 = v40 | (v39 != 0);
  v43 = v62;
  v42 = v63;
  sub_100013C54(v62, v63, a3);
  swift_errorRetain(a10);
  sub_10000F6E0((uint64_t)v22, v61, v65, v60 & 1, v35, v41, v43, v42, v66, a3, a9, 0, a10);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v44 = type metadata accessor for Logger(0);
  sub_100007E94(v44, (uint64_t)qword_100059040);
  v45 = v64;
  swift_retain_n(v64, 2);
  v46 = swift_bridgeObjectRetain_n(a12, 2);
  v47 = Logger.logObject.getter(v46);
  v48 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v47, v48))
  {
    v63 = a11;
    v49 = swift_slowAlloc(32, -1);
    v50 = swift_slowAlloc(96, -1);
    v65 = a14;
    v51 = v50;
    v68 = v50;
    *(_DWORD *)v49 = 136315650;
    v52 = *(_QWORD *)(v45 + 16);
    v53 = *(_QWORD *)(v45 + 24);
    swift_bridgeObjectRetain(v53);
    v67 = sub_100008084(v52, v53, &v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v49 + 4, v49 + 12);
    swift_release_n(v45, 2);
    swift_bridgeObjectRelease(v53);
    *(_WORD *)(v49 + 12) = 2080;
    v54 = CGSize.debugDescription.getter(v31, v29);
    v56 = v55;
    v67 = sub_100008084(v54, v55, &v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v49 + 14, v49 + 22);
    swift_bridgeObjectRelease(v56);
    *(_WORD *)(v49 + 22) = 2080;
    swift_bridgeObjectRetain(a12);
    v67 = sub_100008084((uint64_t)v63, a12, &v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v49 + 24, v49 + 32);
    swift_bridgeObjectRelease_n(a12, 3);
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "🥑 PeopleDataService%s: generated %s map for \"%s\"", (uint8_t *)v49, 0x20u);
    swift_arrayDestroy(v51, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v49, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a12, 2);
    swift_release_n(v45, 2);
  }
  v57 = v66;
  a13(v66);
  return sub_10003AC7C(v57);
}

void sub_1000366C0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), uint64_t a5, double a6, double a7)
{
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  unint64_t v24;
  unsigned int v25;
  id v26;
  void (*v27)(char *, void *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  double *v37;
  void *v38;
  uint64_t *v39;
  void (*v40)(_QWORD);
  void **v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(_QWORD);
  uint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;

  v68 = a4;
  v69 = a5;
  v71 = (void *)a2;
  v66 = *(_QWORD *)v7;
  v12 = sub_100004A10(&qword_100056058);
  __chkstk_darwin(v12);
  v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for FriendModel(0);
  v64 = *(_QWORD *)(v15 - 8);
  v65 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for WidgetFamily(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  __chkstk_darwin(v18);
  v21 = objc_msgSend(a1, "contact");
  if (v21
    && (v22 = v21, v23 = objc_msgSend(v21, "identifier"), v22, v23))
  {
    v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
    v70 = v24;

  }
  else
  {
    v67 = 0;
    v70 = 0;
  }
  v25 = objc_msgSend(*(id *)(v7 + 56), "airplaneMode");
  v26 = objc_msgSend(*(id *)(v7 + 64), "aa_primaryAppleAccount");
  if (v26)
  {

    v27 = *(void (**)(char *, void *, uint64_t))(v19 + 16);
    v63 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    v28 = v18;
    v27(v63, v71, v18);
    v29 = *(unsigned __int8 *)(v19 + 80);
    v30 = (v29 + 24) & ~v29;
    v31 = (v20 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
    v71 = (void *)a3;
    v32 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
    v62 = v7;
    v33 = (v32 + 15) & 0xFFFFFFFFFFFFFFF8;
    v34 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
    v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
    v36 = swift_allocObject(&unk_100052CB0, v35 + 8, v29 | 7);
    *(_QWORD *)(v36 + 16) = v7;
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v36 + v30, v63, v28);
    v37 = (double *)(v36 + v31);
    *v37 = a6;
    v37[1] = a7;
    v38 = v71;
    *(_QWORD *)(v36 + v32) = v71;
    v39 = (uint64_t *)(v36 + v33);
    v41 = (void **)v67;
    v40 = v68;
    v42 = v69;
    v43 = v70;
    *v39 = v67;
    v39[1] = v43;
    v44 = (_QWORD *)(v36 + v34);
    *v44 = v40;
    v44[1] = v42;
    *(_QWORD *)(v36 + v35) = v66;
    swift_bridgeObjectRetain(v43);
    swift_retain(v42);
    swift_retain(v62);
    v45 = v38;
    sub_10003446C(v41, v43, (uint64_t)sub_10003AD88, v36);
    swift_release(v36);
    swift_bridgeObjectRelease(v43);
  }
  else
  {
    v46 = v7;
    if (v25)
      v47 = 256;
    else
      v47 = 0;
    sub_10000ECC8(v47, 0, 0, 0, 0, 0, (unint64_t)v17);
    if (qword_100055AC8 != -1)
      swift_once(&qword_100055AC8, sub_1000058E0);
    v48 = type metadata accessor for Logger(0);
    sub_100007E94(v48, (uint64_t)qword_100059040);
    v49 = v70;
    swift_bridgeObjectRetain(v70);
    v50 = swift_retain_n(v7, 2);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = swift_slowAlloc(22, -1);
      v66 = swift_slowAlloc(64, -1);
      v73 = v66;
      *(_DWORD *)v53 = 136315394;
      v55 = *(_QWORD *)(v46 + 16);
      v54 = *(_QWORD *)(v46 + 24);
      swift_bridgeObjectRetain(v54);
      v72 = sub_100008084(v55, v54, &v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v53 + 4, v53 + 12);
      swift_release_n(v46, 2);
      swift_bridgeObjectRelease(v54);
      *(_WORD *)(v53 + 12) = 2080;
      if (v49)
        v56 = v67;
      else
        v56 = 7104878;
      v57 = v17;
      if (v49)
        v58 = v49;
      else
        v58 = 0xE300000000000000;
      swift_bridgeObjectRetain(v49);
      v72 = sub_100008084(v56, v58, &v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73, v53 + 14, v53 + 22);
      swift_bridgeObjectRelease_n(v49, 2);
      v59 = v58;
      v17 = v57;
      swift_bridgeObjectRelease(v59);
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "🥑 PeopleDataService%s: delivered partial model (user not logged in) for %s", (uint8_t *)v53, 0x16u);
      v60 = v66;
      swift_arrayDestroy(v66, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v60, -1, -1);
      swift_slowDealloc(v53, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v49, 2);
      swift_release_n(v46, 2);
    }
    sub_10001396C((uint64_t)v17, (uint64_t)v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v64 + 56))(v14, 0, 1, v65);
    v68(v14);
    sub_100008C08((uint64_t)v14, &qword_100056058);
    sub_100030F1C(0xD000000000000023, 0x8000000100041620, (uint64_t)v71, 0, 0);
    sub_10003AC7C((uint64_t)v17);
  }
}

uint64_t sub_100036C34(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unsigned int v46;
  id v47;
  id v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  unsigned int v85;
  id v86;
  id v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  unint64_t v116;
  uint64_t v117;
  int v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void **aBlock;
  uint64_t v129;
  uint64_t (*v130)(uint64_t);
  void *v131;
  uint64_t (*v132)();
  char *v133;

  v121 = a10;
  v122 = a4;
  v127 = a5;
  v118 = a2;
  v125 = a9;
  v126 = a13;
  v120 = a12;
  v123 = (void *)a3;
  v124 = a11;
  v114 = type metadata accessor for DispatchWorkItemFlags(0);
  v112 = *(_QWORD *)(v114 - 8);
  __chkstk_darwin(v114);
  v111 = (char *)&v106 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = type metadata accessor for DispatchQoS(0);
  v110 = *(_QWORD *)(v113 - 8);
  __chkstk_darwin(v113);
  v109 = (char *)&v106 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for FriendModel(0);
  v19 = __chkstk_darwin(v18);
  v108 = (unint64_t)&v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v116 = (unint64_t)&v106 - v21;
  v22 = type metadata accessor for WidgetFamily(0);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(_QWORD *)(v23 + 64);
  v25 = __chkstk_darwin(v22);
  v107 = (char *)&v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __chkstk_darwin(v25);
  v115 = (char *)&v106 - v27;
  __chkstk_darwin(v26);
  v29 = (char *)&v106 - v28;
  v30 = sub_100004A10(&qword_100057710);
  __chkstk_darwin(v30);
  v32 = (char *)&v106 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = type metadata accessor for FMFFriend(0);
  v34 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v36 = (char *)&v106 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008CE0(a1, (uint64_t)v32, &qword_100057710);
  v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33);
  v119 = v29;
  if (v37 != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v36, v32, v33);
    v54 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
    v106 = v22;
    v54(v29, v127, v22);
    v55 = *(unsigned __int8 *)(v23 + 80);
    v56 = (v55 + 56) & ~v55;
    v57 = (v24 + v56 + 7) & 0xFFFFFFFFFFFFFFF8;
    v58 = swift_allocObject(&unk_100052D78, v57 + 8, v55 | 7);
    v60 = v121;
    v59 = v122;
    v61 = v125;
    *(_QWORD *)(v58 + 16) = v122;
    *(_QWORD *)(v58 + 24) = v61;
    v62 = v124;
    *(_QWORD *)(v58 + 32) = v60;
    *(_QWORD *)(v58 + 40) = v62;
    v63 = v119;
    v64 = v120;
    *(_QWORD *)(v58 + 48) = v120;
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v58 + v56, v63, v106);
    *(_QWORD *)(v58 + v57) = v126;
    swift_bridgeObjectRetain(v60);
    swift_retain(v64);
    swift_retain(v59);
    sub_10003B200((unint64_t)v36, v127, (uint64_t)v123, (void (*)(_QWORD, __n128))sub_10003AFB8, (void (*)(uint64_t, __n128))v58, a6, a7);
    swift_release(v58);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v36, v33);
  }
  v39 = v126;
  v38 = v127;
  v117 = v23;
  v40 = v120;
  v41 = v121;
  v42 = v122;
  sub_100008C08((uint64_t)v32, &qword_100057710);
  if ((v118 & 1) != 0)
  {
    v43 = (uint64_t)v115;
    v44 = v22;
    (*(void (**)(char *, uint64_t, uint64_t))(v117 + 16))(v115, v38, v22);
    v45 = *(void **)(v42 + 56);
    swift_bridgeObjectRetain(v41);
    swift_retain(v40);
    v46 = objc_msgSend(v45, "airplaneMode", swift_retain(v42).n128_f64[0]);
    v47 = objc_msgSend(*(id *)(v42 + 64), "aa_primaryAppleAccount");
    v48 = v47;
    if (v47)

    if (v46)
      v49 = 256;
    else
      v49 = 0;
    v50 = v49 | (v48 != 0);
    v51 = (uint64_t)v123;
    swift_errorRetain(v123);
    v52 = v116;
    sub_10000ECC8(v50, 0, 0, 1, v51, 0, v116);
    sub_100037BE8(v52, v42, v125, v41, v124, v40, v43, v39);
    sub_10003AC7C(v52);
    swift_release(v40);
    swift_bridgeObjectRelease(v41);
    swift_release(v42);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v117 + 8))(v43, v44);
  }
  v65 = v38;
  if (v123)
  {
    v66 = (void *)_convertErrorToNSError(_:)();
    v67 = objc_msgSend(v66, "code");

    if (v67 == (id)1001)
    {
      sub_10000B9B8();
      v123 = (void *)static OS_dispatch_queue.main.getter();
      v68 = v117;
      v69 = v119;
      v70 = v22;
      (*(void (**)(char *, uint64_t, uint64_t))(v117 + 16))(v119, v65, v22);
      v71 = *(unsigned __int8 *)(v68 + 80);
      v72 = (v71 + 56) & ~v71;
      v73 = (v24 + v72 + 7) & 0xFFFFFFFFFFFFFFF8;
      v74 = (char *)swift_allocObject(&unk_100052D28, v73 + 8, v71 | 7);
      v75 = v125;
      *((_QWORD *)v74 + 2) = v42;
      *((_QWORD *)v74 + 3) = v75;
      v76 = v124;
      *((_QWORD *)v74 + 4) = v41;
      *((_QWORD *)v74 + 5) = v76;
      *((_QWORD *)v74 + 6) = v40;
      (*(void (**)(char *, char *, uint64_t))(v68 + 32))(&v74[v72], v69, v70);
      *(_QWORD *)&v74[v73] = v126;
      v132 = sub_10003AEBC;
      v133 = v74;
      aBlock = _NSConcreteStackBlock;
      v129 = 1107296256;
      v130 = sub_10000B164;
      v131 = &unk_100052D40;
      v77 = _Block_copy(&aBlock);
      v78 = v133;
      swift_bridgeObjectRetain(v41);
      swift_retain(v40);
      v79 = v42;
LABEL_21:
      swift_retain(v79);
      v98 = swift_release(v78);
      v99 = v109;
      static DispatchQoS.unspecified.getter(v98);
      aBlock = (void **)_swiftEmptyArrayStorage;
      v100 = sub_1000086D4(&qword_100056040, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v101 = sub_100004A10(&qword_100056048);
      v102 = sub_10003AE6C();
      v103 = v111;
      v104 = v114;
      dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v101, v102, v114, v100);
      v105 = v123;
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v99, v103, v77);
      _Block_release(v77);

      (*(void (**)(char *, uint64_t))(v112 + 8))(v103, v104);
      return (*(uint64_t (**)(char *, uint64_t))(v110 + 8))(v99, v113);
    }
  }
  v80 = v119;
  if (!v41)
  {
    sub_10000B9B8();
    v123 = (void *)static OS_dispatch_queue.main.getter();
    v90 = v117;
    v91 = v22;
    (*(void (**)(char *, uint64_t, uint64_t))(v117 + 16))(v80, v65, v22);
    v92 = *(unsigned __int8 *)(v90 + 80);
    v93 = (v92 + 56) & ~v92;
    v94 = (v24 + v93 + 7) & 0xFFFFFFFFFFFFFFF8;
    v95 = (char *)swift_allocObject(&unk_100052CD8, v94 + 8, v92 | 7);
    v96 = v125;
    *((_QWORD *)v95 + 2) = v42;
    *((_QWORD *)v95 + 3) = v96;
    v97 = v124;
    *((_QWORD *)v95 + 4) = 0;
    *((_QWORD *)v95 + 5) = v97;
    *((_QWORD *)v95 + 6) = v40;
    (*(void (**)(char *, char *, uint64_t))(v90 + 32))(&v95[v93], v80, v91);
    *(_QWORD *)&v95[v94] = v39;
    v132 = sub_10003AE48;
    v133 = v95;
    aBlock = _NSConcreteStackBlock;
    v129 = 1107296256;
    v130 = sub_10000B164;
    v131 = &unk_100052CF0;
    v77 = _Block_copy(&aBlock);
    v78 = v133;
    swift_retain(v42);
    v79 = v40;
    goto LABEL_21;
  }
  v81 = v39;
  v82 = v117;
  v83 = (uint64_t)v107;
  (*(void (**)(char *, uint64_t, uint64_t))(v117 + 16))(v107, v65, v22);
  v84 = *(void **)(v42 + 56);
  swift_retain(v42);
  swift_bridgeObjectRetain(v41);
  v85 = objc_msgSend(v84, "airplaneMode", swift_retain(v40).n128_f64[0]);
  v86 = objc_msgSend(*(id *)(v42 + 64), "aa_primaryAppleAccount");
  v87 = v86;
  if (v86)

  if (v85)
    v88 = 256;
  else
    v88 = 0;
  v89 = v108;
  sub_10000ECC8(v88 | (v87 != 0), 0, 1, 0, 0, 0, v108);
  sub_1000385A4(v89, v42, v125, v41, v124, v40, v83, v81);
  sub_10003AC7C(v89);
  swift_release(v40);
  swift_bridgeObjectRelease(v41);
  swift_release(v42);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v82 + 8))(v83, v22);
}

uint64_t sub_100037524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD aBlock[5];
  uint64_t v60;

  v53 = a8;
  v49 = a5;
  v50 = a6;
  v47 = a3;
  v48 = a4;
  v46 = a1;
  v55 = type metadata accessor for DispatchWorkItemFlags(0);
  v58 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin(v55);
  v54 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v56 = *(_QWORD *)(v11 - 8);
  v57 = v11;
  __chkstk_darwin(v11);
  v52 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for WidgetFamily(0);
  v14 = *(_QWORD *)(v13 - 8);
  v45 = v13;
  v15 = *(_QWORD *)(v14 + 64);
  __chkstk_darwin(v13);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for FriendModel(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  __chkstk_darwin(v17);
  v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B9B8();
  v51 = static OS_dispatch_queue.main.getter();
  sub_10001396C(v46, (uint64_t)v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a7, v13);
  v21 = *(unsigned __int8 *)(v18 + 80);
  v22 = (v21 + 24) & ~v21;
  v23 = (v19 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  v25 = *(unsigned __int8 *)(v14 + 80);
  v26 = (v25 + v24 + 16) & ~v25;
  v27 = (v15 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  v28 = swift_allocObject(&unk_100052DC8, v27 + 8, v21 | v25 | 7);
  *(_QWORD *)(v28 + 16) = a2;
  sub_10000BDA4((uint64_t)v20, v28 + v22);
  v29 = (_QWORD *)(v28 + v23);
  v30 = v48;
  *v29 = v47;
  v29[1] = v30;
  v31 = (_QWORD *)(v28 + v24);
  v32 = v50;
  *v31 = v49;
  v31[1] = v32;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v28 + v26, v16, v45);
  *(_QWORD *)(v28 + v27) = v53;
  aBlock[4] = sub_10003C874;
  v60 = v28;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B164;
  aBlock[3] = &unk_100052DE0;
  v33 = _Block_copy(aBlock);
  v34 = v60;
  swift_bridgeObjectRetain(v30);
  swift_retain(v32);
  swift_retain(a2);
  v35 = swift_release(v34);
  v36 = v52;
  static DispatchQoS.unspecified.getter(v35);
  aBlock[0] = _swiftEmptyArrayStorage;
  v37 = sub_1000086D4(&qword_100056040, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v38 = sub_100004A10(&qword_100056048);
  v39 = sub_10003AE6C();
  v41 = v54;
  v40 = v55;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v38, v39, v55, v37);
  v42 = (void *)v51;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v36, v41, v33);
  _Block_release(v33);

  (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v36, v57);
}

void sub_100037858(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(_QWORD), uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v40 = a6;
  v37 = a3;
  v12 = sub_100004A10(&qword_100056058);
  __chkstk_darwin(v12);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for FriendModel(0);
  v38 = *(_QWORD *)(v15 - 8);
  v39 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v18 = type metadata accessor for Logger(0);
  sub_100007E94(v18, (uint64_t)qword_100059040);
  sub_10001396C(a2, (uint64_t)v17);
  swift_bridgeObjectRetain_n(a4, 2);
  v19 = swift_retain_n(a1, 2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc(32, -1);
    v35 = a2;
    v23 = v22;
    v33 = swift_slowAlloc(96, -1);
    v42 = v33;
    *(_DWORD *)v23 = 136315650;
    v36 = a7;
    v34 = a5;
    v24 = *(_QWORD *)(a1 + 16);
    v25 = *(_QWORD *)(a1 + 24);
    swift_bridgeObjectRetain(v25);
    v41 = sub_100008084(v24, v25, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v23 + 4, v23 + 12);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v23 + 12) = 2080;
    v26 = sub_100012E9C();
    v28 = v27;
    v41 = sub_100008084(v26, v27, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v23 + 14, v23 + 22);
    swift_bridgeObjectRelease(v28);
    sub_10003AC7C((uint64_t)v17);
    *(_WORD *)(v23 + 22) = 2080;
    a5 = v34;
    if (a4)
      v29 = v37;
    else
      v29 = 7104878;
    if (a4)
      v30 = a4;
    else
      v30 = 0xE300000000000000;
    swift_bridgeObjectRetain(a4);
    v41 = sub_100008084(v29, v30, &v42);
    a7 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v23 + 24, v23 + 32);
    swift_bridgeObjectRelease_n(a4, 2);
    swift_bridgeObjectRelease(v30);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "🥑 PeopleDataService%s: delivered %s for %s", (uint8_t *)v23, 0x20u);
    v31 = v33;
    swift_arrayDestroy(v33, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1, -1);
    v32 = v23;
    a2 = v35;
    swift_slowDealloc(v32, -1, -1);

  }
  else
  {
    swift_release_n(a1, 2);
    sub_10003AC7C((uint64_t)v17);

    swift_bridgeObjectRelease_n(a4, 2);
  }
  sub_10001396C(a2, (uint64_t)v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v14, 0, 1, v39);
  a5(v14);
  sub_100008C08((uint64_t)v14, &qword_100056058);
  sub_100030F1C(0xD000000000000023, 0x8000000100041620, a7, *(_BYTE *)(a2 + 53), 0);
}

uint64_t sub_100037BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD aBlock[5];
  char *v56;

  v49 = a8;
  v43 = a7;
  v44 = a3;
  v45 = a5;
  v46 = a6;
  v42 = a1;
  v51 = type metadata accessor for DispatchWorkItemFlags(0);
  v54 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v50 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v52 = *(_QWORD *)(v11 - 8);
  v53 = v11;
  __chkstk_darwin(v11);
  v48 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for WidgetFamily(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  __chkstk_darwin(v13);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for FriendModel(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  __chkstk_darwin(v17);
  v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B9B8();
  v47 = static OS_dispatch_queue.main.getter();
  sub_10001396C(v42, (uint64_t)v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v43, v13);
  v21 = *(unsigned __int8 *)(v18 + 80);
  v22 = (v21 + 56) & ~v21;
  v23 = *(unsigned __int8 *)(v14 + 80);
  v24 = (v19 + v23 + v22) & ~v23;
  v25 = (v15 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject(&unk_100052E18, v25 + 8, v21 | v23 | 7);
  v27 = v44;
  *((_QWORD *)v26 + 2) = a2;
  *((_QWORD *)v26 + 3) = v27;
  v28 = v45;
  *((_QWORD *)v26 + 4) = a4;
  *((_QWORD *)v26 + 5) = v28;
  v29 = (uint64_t)&v26[v22];
  v30 = v46;
  *((_QWORD *)v26 + 6) = v46;
  sub_10000BDA4((uint64_t)v20, v29);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v26[v24], v16, v13);
  *(_QWORD *)&v26[v25] = v49;
  aBlock[4] = sub_10003C914;
  v56 = v26;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B164;
  aBlock[3] = &unk_100052E30;
  v31 = _Block_copy(aBlock);
  v32 = v56;
  swift_bridgeObjectRetain(a4);
  swift_retain(v30);
  swift_retain(a2);
  v33 = swift_release(v32);
  v34 = v48;
  static DispatchQoS.unspecified.getter(v33);
  aBlock[0] = _swiftEmptyArrayStorage;
  v35 = sub_1000086D4(&qword_100056040, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v36 = sub_100004A10(&qword_100056048);
  v37 = sub_10003AE6C();
  v39 = v50;
  v38 = v51;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v36, v37, v51, v35);
  v40 = (void *)v47;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v34, v39, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v54 + 8))(v39, v38);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v34, v53);
}

void sub_100037F00(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(_QWORD);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v14 = sub_100004A10(&qword_100056058);
  __chkstk_darwin(v14);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v17 = type metadata accessor for Logger(0);
  sub_100007E94(v17, (uint64_t)qword_100059040);
  swift_bridgeObjectRetain_n(a3, 2);
  v18 = swift_retain_n(a1, 2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(22, -1);
    v34 = a2;
    v22 = v21;
    v23 = swift_slowAlloc(64, -1);
    v37 = a6;
    v24 = v23;
    v40 = v23;
    *(_DWORD *)v22 = 136315394;
    v35 = a5;
    v36 = a4;
    v38 = a7;
    v26 = *(_QWORD *)(a1 + 16);
    v25 = *(_QWORD *)(a1 + 24);
    swift_bridgeObjectRetain(v25);
    v39 = sub_100008084(v26, v25, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v22 + 4, v22 + 12);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v22 + 12) = 2080;
    if (a3)
      v27 = v34;
    else
      v27 = 7104878;
    if (a3)
      v28 = a3;
    else
      v28 = 0xE300000000000000;
    swift_bridgeObjectRetain(a3);
    v29 = v27;
    a7 = v38;
    v39 = sub_100008084(v29, v28, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease_n(a3, 2);
    v30 = v28;
    a4 = v36;
    swift_bridgeObjectRelease(v30);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "🥑 PeopleDataService%s: delivered empty list model for %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy(v24, 2, (char *)&type metadata for Any + 8);
    v31 = v24;
    a6 = v37;
    swift_slowDealloc(v31, -1, -1);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    swift_release_n(a1, 2);
  }
  sub_10001396C(a6, (uint64_t)v16);
  v32 = type metadata accessor for FriendModel(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v16, 0, 1, v32);
  a4(v16);
  sub_100008C08((uint64_t)v16, &qword_100056058);
  sub_100030F1C(0xD000000000000023, 0x8000000100041620, a7, *(_BYTE *)(a6 + 53), 0);
}

uint64_t sub_100038210(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD), uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(_QWORD);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v37 = a2;
  v11 = sub_100004A10(&qword_100056058);
  __chkstk_darwin(v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for FriendModel(0);
  v38 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000ECC8(2u, 0, 0, 0, 0, 1, (unint64_t)v16);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v17 = type metadata accessor for Logger(0);
  sub_100007E94(v17, (uint64_t)qword_100059040);
  swift_bridgeObjectRetain_n(a3, 2);
  v18 = swift_retain_n(a1, 2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(22, -1);
    v36 = a6;
    v22 = v21;
    v32 = swift_slowAlloc(64, -1);
    v40 = v32;
    *(_DWORD *)v22 = 136315394;
    v33 = v14;
    v34 = a5;
    v35 = a4;
    v24 = *(_QWORD *)(a1 + 16);
    v23 = *(_QWORD *)(a1 + 24);
    swift_bridgeObjectRetain(v23);
    v39 = sub_100008084(v24, v23, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v22 + 4, v22 + 12);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v22 + 12) = 2080;
    if (a3)
      v25 = v37;
    else
      v25 = 7104878;
    if (a3)
      v26 = a3;
    else
      v26 = 0xE300000000000000;
    swift_bridgeObjectRetain(a3);
    v27 = v25;
    a4 = v35;
    v39 = sub_100008084(v27, v26, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease_n(a3, 2);
    v28 = v26;
    v14 = v33;
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "🥑 PeopleDataService%s: delivered no model (internal timeout) for %s", (uint8_t *)v22, 0x16u);
    v29 = v32;
    swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    v30 = v22;
    a6 = v36;
    swift_slowDealloc(v30, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    swift_release_n(a1, 2);
  }
  sub_10001396C((uint64_t)v16, (uint64_t)v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v13, 0, 1, v14);
  a4(v13);
  sub_100008C08((uint64_t)v13, &qword_100056058);
  sub_100030F1C(0xD000000000000023, 0x8000000100041620, a6, 0, 1);
  return sub_10003AC7C((uint64_t)v16);
}

uint64_t sub_1000385A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD aBlock[5];
  char *v56;

  v49 = a8;
  v43 = a7;
  v44 = a3;
  v45 = a5;
  v46 = a6;
  v42 = a1;
  v51 = type metadata accessor for DispatchWorkItemFlags(0);
  v54 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v50 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v52 = *(_QWORD *)(v11 - 8);
  v53 = v11;
  __chkstk_darwin(v11);
  v48 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for WidgetFamily(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  __chkstk_darwin(v13);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for FriendModel(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  __chkstk_darwin(v17);
  v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B9B8();
  v47 = static OS_dispatch_queue.main.getter();
  sub_10001396C(v42, (uint64_t)v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v43, v13);
  v21 = *(unsigned __int8 *)(v18 + 80);
  v22 = (v21 + 56) & ~v21;
  v23 = *(unsigned __int8 *)(v14 + 80);
  v24 = (v19 + v23 + v22) & ~v23;
  v25 = (v15 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject(&unk_100052E68, v25 + 8, v21 | v23 | 7);
  v27 = v44;
  *((_QWORD *)v26 + 2) = a2;
  *((_QWORD *)v26 + 3) = v27;
  v28 = v45;
  *((_QWORD *)v26 + 4) = a4;
  *((_QWORD *)v26 + 5) = v28;
  v29 = (uint64_t)&v26[v22];
  v30 = v46;
  *((_QWORD *)v26 + 6) = v46;
  sub_10000BDA4((uint64_t)v20, v29);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v26[v24], v16, v13);
  *(_QWORD *)&v26[v25] = v49;
  aBlock[4] = sub_10003CB18;
  v56 = v26;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B164;
  aBlock[3] = &unk_100052E80;
  v31 = _Block_copy(aBlock);
  v32 = v56;
  swift_retain(a2);
  swift_bridgeObjectRetain(a4);
  swift_retain(v30);
  v33 = swift_release(v32);
  v34 = v48;
  static DispatchQoS.unspecified.getter(v33);
  aBlock[0] = _swiftEmptyArrayStorage;
  v35 = sub_1000086D4(&qword_100056040, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v36 = sub_100004A10(&qword_100056048);
  v37 = sub_10003AE6C();
  v39 = v50;
  v38 = v51;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v36, v37, v51, v35);
  v40 = (void *)v47;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v34, v39, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v54 + 8))(v39, v38);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v34, v53);
}

void sub_1000388BC(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(char *), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
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

  v14 = sub_100004A10(&qword_100056058);
  __chkstk_darwin(v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v17 = type metadata accessor for Logger(0);
  sub_100007E94(v17, (uint64_t)qword_100059040);
  swift_retain_n(a1, 2);
  v18 = swift_bridgeObjectRetain_n(a3, 2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(22, -1);
    v29 = a2;
    v22 = v21;
    v23 = swift_slowAlloc(64, -1);
    v32 = a6;
    v30 = v23;
    v35 = v23;
    *(_DWORD *)v22 = 136315394;
    v31 = a5;
    v33 = a7;
    v25 = *(_QWORD *)(a1 + 16);
    v24 = *(_QWORD *)(a1 + 24);
    swift_bridgeObjectRetain(v24);
    v34 = sub_100008084(v25, v24, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v22 + 4, v22 + 12);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease(v24);
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain(a3);
    v34 = sub_100008084(v29, a3, &v35);
    a7 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "🥑 PeopleDataService%s: delivered removed model for (%s)", (uint8_t *)v22, 0x16u);
    v26 = v30;
    swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
    a6 = v32;
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    swift_release_n(a1, 2);
  }
  sub_10001396C(a6, (uint64_t)v16);
  v27 = type metadata accessor for FriendModel(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v16, 0, 1, v27);
  a4(v16);
  sub_100008C08((uint64_t)v16, &qword_100056058);
  sub_100030F1C(0xD000000000000023, 0x8000000100041620, a7, *(_BYTE *)(a6 + 53), 0);
}

uint64_t sub_100038BB0(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD), uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(_QWORD);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v37 = a2;
  v11 = sub_100004A10(&qword_100056058);
  __chkstk_darwin(v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for FriendModel(0);
  v38 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v17 = type metadata accessor for Logger(0);
  sub_100007E94(v17, (uint64_t)qword_100059040);
  swift_bridgeObjectRetain_n(a3, 2);
  v18 = swift_retain_n(a1, 2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(22, -1);
    v36 = a6;
    v22 = v21;
    v32 = swift_slowAlloc(64, -1);
    v40 = v32;
    *(_DWORD *)v22 = 136315394;
    v33 = v14;
    v34 = a5;
    v35 = a4;
    v24 = *(_QWORD *)(a1 + 16);
    v23 = *(_QWORD *)(a1 + 24);
    swift_bridgeObjectRetain(v23);
    v39 = sub_100008084(v24, v23, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v22 + 4, v22 + 12);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v22 + 12) = 2080;
    if (a3)
      v25 = v37;
    else
      v25 = 7104878;
    if (a3)
      v26 = a3;
    else
      v26 = 0xE300000000000000;
    swift_bridgeObjectRetain(a3);
    v27 = v25;
    a4 = v35;
    v39 = sub_100008084(v27, v26, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease_n(a3, 2);
    v28 = v26;
    v14 = v33;
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "🥑 PeopleDataService%s: delivered no model (not found or none or error) for %s", (uint8_t *)v22, 0x16u);
    v29 = v32;
    swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    v30 = v22;
    a6 = v36;
    swift_slowDealloc(v30, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    swift_release_n(a1, 2);
  }
  sub_10000ECC8(2u, 1, 0, 0, 0, 0, (unint64_t)v16);
  sub_10001396C((uint64_t)v16, (uint64_t)v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v13, 0, 1, v14);
  a4(v13);
  sub_100008C08((uint64_t)v13, &qword_100056058);
  sub_100030F1C(0xD000000000000023, 0x8000000100041620, a6, 0, 0);
  return sub_10003AC7C((uint64_t)v16);
}

uint64_t sub_100038F44(uint64_t a1)
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

void sub_100038FAC(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *(_QWORD *)(type metadata accessor for FMFFriend(0) - 8);
  v3 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v3 = (_QWORD *)sub_10003AC68(v3);
  v4 = v3[2];
  v5[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v5[1] = v4;
  sub_10003902C(v5);
  *a1 = v3;
}

void sub_10003902C(uint64_t *a1)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  Swift::Int v23;
  Swift::Int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, char *);
  char *v30;
  unint64_t v31;
  Swift::Int v32;
  char *v33;
  uint64_t v34;
  Swift::Int v35;
  void (*v36)(char *, uint64_t, uint64_t);
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL4 v49;
  Swift::Int v50;
  uint64_t v51;
  char *v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  Swift::Int v55;
  Swift::Int v56;
  uint64_t (*v57)(char *, uint64_t, uint64_t);
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  Swift::Int v74;
  Swift::Int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  Swift::Int v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  Swift::Int v84;
  Swift::Int v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t, char *);
  uint64_t v88;
  void (*v89)(char *, uint64_t, uint64_t, char *);
  uint64_t v90;
  uint64_t (*v91)(char *, uint64_t, uint64_t);
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  _BOOL4 v104;
  uint64_t v105;
  void (*v106)(char *, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  void (*v111)(char *, uint64_t, uint64_t);
  char *v112;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v114;
  unint64_t v115;
  char *v116;
  char *v117;
  void (*v118)(char *, uint64_t, uint64_t, char *);
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  BOOL v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  BOOL v140;
  uint64_t v141;
  char v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  BOOL v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  unint64_t v173;
  _QWORD *v174;
  _QWORD *v175;
  char *v176;
  Swift::Int v177;
  char *v178;
  char *v179;
  char *v180;
  uint64_t v181;
  char *v182;
  char *v183;
  Swift::Int v184;
  unint64_t v185;
  uint64_t v186;
  char *v187;
  Swift::Int v188;
  char *v189;
  char *v190;
  Swift::Int v191;
  uint64_t (*v192)(char *, uint64_t, uint64_t);
  void (*v193)(char *, uint64_t, uint64_t, char *);
  char *v194;
  Swift::Int v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;

  v2 = sub_100004A10(&qword_100057740);
  __chkstk_darwin(v2);
  v187 = (char *)&v175 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for FMFFriend(0);
  v202 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v183 = (char *)&v175 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v194 = (char *)&v175 - v8;
  v9 = __chkstk_darwin(v7);
  v189 = (char *)&v175 - v10;
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v175 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v175 - v15;
  v17 = __chkstk_darwin(v14);
  v178 = (char *)&v175 - v18;
  v19 = __chkstk_darwin(v17);
  v179 = (char *)&v175 - v20;
  __chkstk_darwin(v19);
  v22 = (char *)&v175 - v21;
  v197 = a1;
  v23 = a1[1];
  v24 = _minimumMergeRunLength(_:)(v23);
  if (v24 >= v23)
  {
    if (v23 < 0)
      goto LABEL_151;
    if (v23)
      sub_100039DCC(0, v23, 1, v197);
    return;
  }
  if (v23 >= 0)
    v25 = v23;
  else
    v25 = v23 + 1;
  if (v23 < -1)
    goto LABEL_159;
  v177 = v24;
  if (v23 < 2)
  {
    v185 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v202 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v202 + 80));
    v175 = _swiftEmptyArrayStorage;
    if (v23 != 1)
    {
      v31 = _swiftEmptyArrayStorage[2];
      v30 = (char *)_swiftEmptyArrayStorage;
LABEL_117:
      v167 = v186;
      if (v31 >= 2)
      {
        v168 = *v197;
        do
        {
          v169 = v31 - 2;
          if (v31 < 2)
            goto LABEL_146;
          if (!v168)
            goto LABEL_158;
          v159 = v30;
          v170 = *(_QWORD *)&v30[16 * v169 + 32];
          v171 = *(_QWORD *)&v30[16 * v31 + 24];
          sub_10003A130(v168 + *(_QWORD *)(v202 + 72) * v170, v168 + *(_QWORD *)(v202 + 72) * *(_QWORD *)&v30[16 * v31 + 16], v168 + *(_QWORD *)(v202 + 72) * v171, v185);
          if (v167)
            goto LABEL_114;
          if (v171 < v170)
            goto LABEL_147;
          if ((swift_isUniquelyReferenced_nonNull_native(v159) & 1) == 0)
            v159 = sub_10003AA74((uint64_t)v159);
          if (v169 >= *((_QWORD *)v159 + 2))
            goto LABEL_148;
          v172 = &v159[16 * v169 + 32];
          *(_QWORD *)v172 = v170;
          *((_QWORD *)v172 + 1) = v171;
          v173 = *((_QWORD *)v159 + 2);
          if (v31 > v173)
            goto LABEL_149;
          memmove(&v159[16 * v31 + 16], &v159[16 * v31 + 32], 16 * (v173 - v31));
          v30 = v159;
          *((_QWORD *)v159 + 2) = v173 - 1;
          v31 = v173 - 1;
        }
        while (v173 > 2);
      }
      v166 = v30;
LABEL_129:
      swift_bridgeObjectRelease(v166);
      v174 = v175;
      v175[2] = 0;
      swift_bridgeObjectRelease(v174);
      return;
    }
    v176 = v22;
    v182 = v16;
  }
  else
  {
    v176 = v22;
    v182 = v16;
    v26 = v25 >> 1;
    v27 = static Array._allocateBufferUninitialized(minimumCapacity:)(v25 >> 1, v4);
    *(_QWORD *)(v27 + 16) = v26;
    v28 = *(unsigned __int8 *)(v202 + 80);
    v175 = (_QWORD *)v27;
    v185 = v27 + ((v28 + 32) & ~v28);
  }
  v29 = 0;
  v30 = (char *)_swiftEmptyArrayStorage;
  v196 = v4;
  v190 = v13;
  while (1)
  {
    v32 = (Swift::Int)v29;
    v33 = (char *)v29 + 1;
    v180 = v30;
    v184 = (Swift::Int)v29;
    if ((uint64_t)v29 + 1 >= v23)
    {
      v50 = (Swift::Int)v29 + 1;
      goto LABEL_66;
    }
    v34 = *v197;
    v35 = *(_QWORD *)(v202 + 72);
    v36 = *(void (**)(char *, uint64_t, uint64_t))(v202 + 16);
    v37 = v176;
    v36(v176, *v197 + v35 * (_QWORD)v33, v4);
    v181 = v34;
    v195 = v35;
    v38 = v179;
    v192 = (uint64_t (*)(char *, uint64_t, uint64_t))v36;
    v39 = ((uint64_t (*)(char *, uint64_t, uint64_t))v36)(v179, v34 + v35 * v32, v4);
    v40 = FMFFriend.favoriteOrder.getter(v39);
    v41 = FMFFriend.favoriteOrder.getter(v40);
    if (v40 == v41)
    {
      v200 = FMFFriend.name.getter();
      v201 = v42;
      v198 = FMFFriend.name.getter();
      v199 = v43;
      v44 = type metadata accessor for Locale(0);
      v45 = v187;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v187, 1, 1, v44);
      v46 = sub_100024AF0();
      v47 = StringProtocol.compare<A>(_:options:range:locale:)(&v198, 1, 0, 0, 1, v45, &type metadata for String, &type metadata for String, v46, v46);
      v48 = (uint64_t)v45;
      v38 = v179;
      sub_100008C08(v48, &qword_100057740);
      swift_bridgeObjectRelease(v199);
      swift_bridgeObjectRelease(v201);
      v49 = v47 == -1;
    }
    else
    {
      v51 = FMFFriend.favoriteOrder.getter(v41);
      v49 = v51 < FMFFriend.favoriteOrder.getter(v51);
    }
    LODWORD(v193) = v49;
    v52 = v178;
    v53 = *(void (**)(char *, uint64_t))(v202 + 8);
    v53(v38, v4);
    v53(v37, v4);
    v50 = v184 + 2;
    if (v184 + 2 < v23)
    {
      v191 = v195 * (_QWORD)v33;
      v54 = v181;
      v188 = v195 * v50;
      while (1)
      {
        v55 = v23;
        v56 = v50;
        v57 = v192;
        v192(v52, v54 + v188, v4);
        v58 = v52;
        v59 = v182;
        v60 = v57(v182, v54 + v191, v4);
        v61 = FMFFriend.favoriteOrder.getter(v60);
        v62 = FMFFriend.favoriteOrder.getter(v61);
        if (v61 == v62)
        {
          v200 = FMFFriend.name.getter();
          v201 = v63;
          v198 = FMFFriend.name.getter();
          v199 = v64;
          v65 = type metadata accessor for Locale(0);
          v66 = v187;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v187, 1, 1, v65);
          v67 = sub_100024AF0();
          v68 = StringProtocol.compare<A>(_:options:range:locale:)(&v198, 1, 0, 0, 1, v66, &type metadata for String, &type metadata for String, v67, v67);
          v69 = (uint64_t)v66;
          v4 = v196;
          sub_100008C08(v69, &qword_100057740);
          swift_bridgeObjectRelease(v199);
          swift_bridgeObjectRelease(v201);
          v70 = v68 == -1;
        }
        else
        {
          v71 = FMFFriend.favoriteOrder.getter(v62);
          v70 = v71 < FMFFriend.favoriteOrder.getter(v71);
        }
        v53(v59, v4);
        v53(v58, v4);
        v50 = v56;
        if ((_DWORD)v193 != v70)
          break;
        v52 = v58;
        v50 = v56 + 1;
        v54 += v195;
        v23 = v55;
        if (v55 == v50)
        {
          v50 = v55;
          goto LABEL_30;
        }
      }
      v23 = v55;
    }
LABEL_30:
    v30 = v180;
    v32 = v184;
    if (!(_DWORD)v193)
      break;
    if (v50 < v184)
      goto LABEL_152;
    if (v184 >= v50)
      break;
    v192 = (uint64_t (*)(char *, uint64_t, uint64_t))v23;
    v72 = 0;
    v73 = v195 * (v50 - 1);
    v74 = v50 * v195;
    v75 = v184;
    v76 = v184 * v195;
    do
    {
      if (v75 != v50 + v72 - 1)
      {
        v79 = v181;
        if (!v181)
          goto LABEL_157;
        v80 = v50;
        v81 = v181 + v76;
        v82 = v181 + v73;
        v193 = *(void (**)(char *, uint64_t, uint64_t, char *))(v202 + 32);
        v193(v183, v181 + v76, v196, v30);
        if (v76 < v73 || v81 >= v79 + v74)
        {
          v77 = v79 + v76;
          v78 = v79 + v73;
          v4 = v196;
          swift_arrayInitWithTakeFrontToBack(v77, v78);
        }
        else
        {
          v4 = v196;
          if (v76 != v73)
            swift_arrayInitWithTakeBackToFront(v81, v82);
        }
        ((void (*)(uint64_t, char *, uint64_t))v193)(v82, v183, v4);
        v30 = v180;
        v50 = v80;
      }
      ++v75;
      --v72;
      v73 -= v195;
      v74 -= v195;
      v76 += v195;
    }
    while (v75 < v50 + v72);
    v83 = v190;
    v32 = v184;
    v23 = (Swift::Int)v192;
    if (v50 < (uint64_t)v192)
      goto LABEL_46;
LABEL_66:
    if (v50 < v32)
      goto LABEL_145;
    v112 = v30;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v30);
    v193 = (void (*)(char *, uint64_t, uint64_t, char *))v50;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      v30 = v112;
    else
      v30 = sub_10003A870(0, *((_QWORD *)v112 + 2) + 1, 1, v112);
    v115 = *((_QWORD *)v30 + 2);
    v114 = *((_QWORD *)v30 + 3);
    v31 = v115 + 1;
    if (v115 >= v114 >> 1)
      v30 = sub_10003A870((char *)(v114 > 1), v115 + 1, 1, v30);
    *((_QWORD *)v30 + 2) = v31;
    v116 = v30 + 32;
    v117 = &v30[16 * v115 + 32];
    v118 = v193;
    *(_QWORD *)v117 = v32;
    *((_QWORD *)v117 + 1) = v118;
    if (v115)
    {
      while (1)
      {
        v119 = v31 - 1;
        if (v31 >= 4)
        {
          v124 = &v116[16 * v31];
          v125 = *((_QWORD *)v124 - 8);
          v126 = *((_QWORD *)v124 - 7);
          v130 = __OFSUB__(v126, v125);
          v127 = v126 - v125;
          if (v130)
            goto LABEL_134;
          v129 = *((_QWORD *)v124 - 6);
          v128 = *((_QWORD *)v124 - 5);
          v130 = __OFSUB__(v128, v129);
          v122 = v128 - v129;
          v123 = v130;
          if (v130)
            goto LABEL_135;
          v131 = v31 - 2;
          v132 = &v116[16 * v31 - 32];
          v134 = *(_QWORD *)v132;
          v133 = *((_QWORD *)v132 + 1);
          v130 = __OFSUB__(v133, v134);
          v135 = v133 - v134;
          if (v130)
            goto LABEL_137;
          v130 = __OFADD__(v122, v135);
          v136 = v122 + v135;
          if (v130)
            goto LABEL_140;
          if (v136 >= v127)
          {
            v154 = &v116[16 * v119];
            v156 = *(_QWORD *)v154;
            v155 = *((_QWORD *)v154 + 1);
            v130 = __OFSUB__(v155, v156);
            v157 = v155 - v156;
            if (v130)
              goto LABEL_144;
            v147 = v122 < v157;
            goto LABEL_103;
          }
        }
        else
        {
          if (v31 != 3)
          {
            v148 = *((_QWORD *)v30 + 4);
            v149 = *((_QWORD *)v30 + 5);
            v130 = __OFSUB__(v149, v148);
            v141 = v149 - v148;
            v142 = v130;
            goto LABEL_97;
          }
          v121 = *((_QWORD *)v30 + 4);
          v120 = *((_QWORD *)v30 + 5);
          v130 = __OFSUB__(v120, v121);
          v122 = v120 - v121;
          v123 = v130;
        }
        if ((v123 & 1) != 0)
          goto LABEL_136;
        v131 = v31 - 2;
        v137 = &v116[16 * v31 - 32];
        v139 = *(_QWORD *)v137;
        v138 = *((_QWORD *)v137 + 1);
        v140 = __OFSUB__(v138, v139);
        v141 = v138 - v139;
        v142 = v140;
        if (v140)
          goto LABEL_139;
        v143 = &v116[16 * v119];
        v145 = *(_QWORD *)v143;
        v144 = *((_QWORD *)v143 + 1);
        v130 = __OFSUB__(v144, v145);
        v146 = v144 - v145;
        if (v130)
          goto LABEL_142;
        if (__OFADD__(v141, v146))
          goto LABEL_143;
        if (v141 + v146 >= v122)
        {
          v147 = v122 < v146;
LABEL_103:
          if (v147)
            v119 = v131;
          goto LABEL_105;
        }
LABEL_97:
        if ((v142 & 1) != 0)
          goto LABEL_138;
        v150 = &v116[16 * v119];
        v152 = *(_QWORD *)v150;
        v151 = *((_QWORD *)v150 + 1);
        v130 = __OFSUB__(v151, v152);
        v153 = v151 - v152;
        if (v130)
          goto LABEL_141;
        if (v153 < v141)
          goto LABEL_15;
LABEL_105:
        v158 = v119 - 1;
        if (v119 - 1 >= v31)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!*v197)
          goto LABEL_156;
        v159 = v30;
        v160 = &v116[16 * v158];
        v161 = *(_QWORD *)v160;
        v162 = &v116[16 * v119];
        v163 = *((_QWORD *)v162 + 1);
        v164 = v186;
        sub_10003A130(*v197 + *(_QWORD *)(v202 + 72) * *(_QWORD *)v160, *v197 + *(_QWORD *)(v202 + 72) * *(_QWORD *)v162, *v197 + *(_QWORD *)(v202 + 72) * v163, v185);
        v186 = v164;
        if (v164)
        {
LABEL_114:
          v166 = v159;
          goto LABEL_129;
        }
        if (v163 < v161)
          goto LABEL_131;
        if (v119 > *((_QWORD *)v159 + 2))
          goto LABEL_132;
        *(_QWORD *)v160 = v161;
        *(_QWORD *)&v116[16 * v158 + 8] = v163;
        v165 = *((_QWORD *)v159 + 2);
        if (v119 >= v165)
          goto LABEL_133;
        v31 = v165 - 1;
        memmove(&v116[16 * v119], v162 + 16, 16 * (v165 - 1 - v119));
        v30 = v159;
        *((_QWORD *)v159 + 2) = v165 - 1;
        if (v165 <= 2)
          goto LABEL_15;
      }
    }
    v31 = 1;
LABEL_15:
    v23 = v197[1];
    v29 = v193;
    if ((uint64_t)v193 >= v23)
      goto LABEL_117;
  }
  v83 = v190;
  if (v50 >= v23)
    goto LABEL_66;
LABEL_46:
  if (__OFSUB__(v50, v32))
    goto LABEL_150;
  if (v50 - v32 >= v177)
    goto LABEL_66;
  if (__OFADD__(v32, v177))
    goto LABEL_153;
  if (v32 + v177 >= v23)
    v84 = v23;
  else
    v84 = v32 + v177;
  if (v84 >= v32)
  {
    if (v50 != v84)
    {
      v85 = *(_QWORD *)(v202 + 72);
      v188 = *(_QWORD *)(v202 + 16);
      v86 = v85 * (v50 - 1);
      v191 = v85;
      v195 = v50 * v85;
      v181 = v84;
      do
      {
        v88 = 0;
        v89 = (void (*)(char *, uint64_t, uint64_t, char *))v32;
        v192 = (uint64_t (*)(char *, uint64_t, uint64_t))v86;
        v193 = (void (*)(char *, uint64_t, uint64_t, char *))v50;
        while (1)
        {
          v90 = *v197;
          v91 = (uint64_t (*)(char *, uint64_t, uint64_t))v188;
          ((void (*)(char *, Swift::Int, uint64_t, char *))v188)(v83, v195 + v88 + *v197, v4, v30);
          v92 = v4;
          v93 = v189;
          v94 = v91(v189, v86 + v88 + v90, v92);
          v95 = FMFFriend.favoriteOrder.getter(v94);
          v96 = FMFFriend.favoriteOrder.getter(v95);
          if (v95 == v96)
          {
            v200 = FMFFriend.name.getter();
            v201 = v97;
            v198 = FMFFriend.name.getter();
            v199 = v98;
            v99 = type metadata accessor for Locale(0);
            v100 = v83;
            v101 = (uint64_t)v187;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56))(v187, 1, 1, v99);
            v102 = sub_100024AF0();
            v103 = StringProtocol.compare<A>(_:options:range:locale:)(&v198, 1, 0, 0, 1, v101, &type metadata for String, &type metadata for String, v102, v102);
            sub_100008C08(v101, &qword_100057740);
            swift_bridgeObjectRelease(v199);
            swift_bridgeObjectRelease(v201);
            v104 = v103 == -1;
          }
          else
          {
            v105 = FMFFriend.favoriteOrder.getter(v96);
            v104 = v105 < FMFFriend.favoriteOrder.getter(v105);
            v100 = v83;
          }
          v106 = *(void (**)(char *, uint64_t))(v202 + 8);
          v107 = v196;
          v106(v93, v196);
          v106(v100, v107);
          if (!v104)
            break;
          v108 = *v197;
          v86 = (uint64_t)v192;
          if (!*v197)
            goto LABEL_155;
          v109 = v108 + v195 + v88;
          v110 = (char *)v192 + v108 + v88;
          v111 = *(void (**)(char *, uint64_t, uint64_t))(v202 + 32);
          v4 = v196;
          v111(v194, v109, v196);
          swift_arrayInitWithTakeFrontToBack(v109, v110);
          v111(v110, (uint64_t)v194, v4);
          v83 = v190;
          v88 -= v191;
          v89 = (void (*)(char *, uint64_t, uint64_t, char *))((char *)v89 + 1);
          v87 = v193;
          if (v193 == v89)
            goto LABEL_56;
        }
        v4 = v196;
        v83 = v190;
        v86 = (uint64_t)v192;
        v87 = v193;
LABEL_56:
        v50 = (Swift::Int)v87 + 1;
        v86 += v191;
        v195 += v191;
        v32 = v184;
      }
      while (v50 != v181);
      v50 = v181;
      v30 = v180;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

uint64_t sub_100039DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  BOOL v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t (*v45)(char *, uint64_t, uint64_t);
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v50 = a4;
  v43 = a1;
  v6 = sub_100004A10(&qword_100057740);
  __chkstk_darwin(v6);
  v44 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FMFFriend(0);
  v51 = *(_QWORD **)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v49 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v46 = (char *)&v41 - v12;
  result = __chkstk_darwin(v11);
  v15 = (char *)&v41 - v14;
  v48 = a3;
  v42 = a2;
  if (a3 != a2)
  {
    v16 = v51[9];
    v45 = (uint64_t (*)(char *, uint64_t, uint64_t))v51[2];
    v57 = v16 * (v48 - 1);
    v47 = v16;
    v52 = v16 * v48;
LABEL_5:
    v17 = 0;
    v18 = v43;
    while (1)
    {
      v19 = *v50;
      v20 = v45;
      v45(v15, v52 + v17 + *v50, v8);
      v21 = v57 + v17 + v19;
      v22 = v46;
      v23 = v20(v46, v21, v8);
      v24 = FMFFriend.favoriteOrder.getter(v23);
      v25 = FMFFriend.favoriteOrder.getter(v24);
      if (v24 == v25)
      {
        v55 = FMFFriend.name.getter();
        v56 = v26;
        v53 = FMFFriend.name.getter();
        v54 = v27;
        v28 = type metadata accessor for Locale(0);
        v29 = v22;
        v30 = (uint64_t)v44;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v44, 1, 1, v28);
        v31 = sub_100024AF0();
        v32 = StringProtocol.compare<A>(_:options:range:locale:)(&v53, 1, 0, 0, 1, v30, &type metadata for String, &type metadata for String, v31, v31);
        sub_100008C08(v30, &qword_100057740);
        swift_bridgeObjectRelease(v54);
        swift_bridgeObjectRelease(v56);
        v33 = v32 == -1;
      }
      else
      {
        v34 = FMFFriend.favoriteOrder.getter(v25);
        v35 = v34 < FMFFriend.favoriteOrder.getter(v34);
        v29 = v22;
        v33 = v35;
      }
      v36 = (void (*)(char *, uint64_t))v51[1];
      v36(v29, v8);
      result = ((uint64_t (*)(char *, uint64_t))v36)(v15, v8);
      if (!v33)
      {
LABEL_4:
        v57 += v47;
        v52 += v47;
        if (++v48 == v42)
          return result;
        goto LABEL_5;
      }
      v37 = *v50;
      if (!*v50)
        break;
      v38 = v37 + v52 + v17;
      v39 = v37 + v57 + v17;
      v40 = (void (*)(char *, uint64_t, uint64_t))v51[4];
      v40(v49, v38, v8);
      swift_arrayInitWithTakeFrontToBack(v38, v39);
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v40)(v39, v49, v8);
      v17 -= v47;
      if (v48 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10003A130(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t result;
  uint64_t v49;
  uint64_t (*v50)(char *, unint64_t, uint64_t);
  char *v51;
  uint64_t (*v52)(char *, unint64_t, uint64_t);
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  _BOOL4 v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  unint64_t v67;
  void (*v68)(void);
  char *v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t (*v81)(char *, unint64_t, uint64_t);
  unint64_t v82;
  char *v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;

  v8 = sub_100004A10(&qword_100057740);
  __chkstk_darwin(v8);
  v84 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for FMFFriend(0);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v83 = (char *)&v78 - v15;
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v78 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v78 - v19;
  v22 = *(_QWORD *)(v21 + 72);
  v86 = v21;
  v87 = v22;
  if (!v22)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (a2 - a1 == 0x8000000000000000 && v87 == -1)
    goto LABEL_71;
  v23 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v87 == -1)
    goto LABEL_72;
  v24 = (uint64_t)(a2 - a1) / v87;
  v94 = a1;
  v93 = a4;
  v25 = v23 / v87;
  if (v24 >= v23 / v87)
  {
    if (v25 < 0)
      goto LABEL_73;
    v27 = v25 * v87;
    if (a4 < a2 || a2 + v27 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a2);
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront(a4, a2);
    }
    v46 = a4 + v27;
    v92 = a4 + v27;
    v94 = a2;
    v82 = a1;
    if (v27 < 1 || a1 >= a2)
      goto LABEL_48;
    v49 = -v87;
    v50 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v86 + 16);
    v80 = a4;
    v81 = v50;
    v87 = v10;
    v79 = v49;
    v51 = v83;
    while (1)
    {
      v52 = v81;
      v81(v51, v46 + v49, v10);
      v53 = a2 + v49;
      v54 = v52(v13, a2 + v49, v10);
      v55 = FMFFriend.favoriteOrder.getter(v54);
      v56 = FMFFriend.favoriteOrder.getter(v55);
      v85 = a2;
      if (v55 == v56)
      {
        v90 = FMFFriend.name.getter();
        v91 = v57;
        v88 = FMFFriend.name.getter();
        v89 = v58;
        v59 = type metadata accessor for Locale(0);
        v60 = (uint64_t)v84;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v84, 1, 1, v59);
        v61 = sub_100024AF0();
        v62 = StringProtocol.compare<A>(_:options:range:locale:)(&v88, 1, 0, 0, 1, v60, &type metadata for String, &type metadata for String, v61, v61);
        sub_100008C08(v60, &qword_100057740);
        swift_bridgeObjectRelease(v89);
        swift_bridgeObjectRelease(v91);
        v63 = v62 == -1;
      }
      else
      {
        v64 = FMFFriend.favoriteOrder.getter(v56);
        v63 = v64 < FMFFriend.favoriteOrder.getter(v64);
      }
      v65 = v13;
      v66 = a3;
      v67 = a3 + v49;
      v68 = *(void (**)(void))(v86 + 8);
      v69 = v65;
      v70 = v49;
      v71 = v87;
      v68();
      ((void (*)(char *, uint64_t))v68)(v51, v71);
      if (v63)
        break;
      v73 = v92;
      v74 = v92 + v70;
      v92 += v70;
      if (v66 < v73 || v67 >= v73)
      {
        v75 = v87;
        swift_arrayInitWithTakeFrontToBack(v67, v74);
        v53 = v85;
LABEL_64:
        v13 = v69;
        v10 = v75;
        v49 = v79;
LABEL_65:
        v77 = v80;
        goto LABEL_66;
      }
      v53 = v85;
      if (v66 != v73)
      {
        v75 = v87;
        swift_arrayInitWithTakeBackToFront(v67, v74);
        goto LABEL_64;
      }
      v49 = v70;
      v13 = v69;
      v77 = v80;
      v10 = v87;
LABEL_66:
      v46 = v92;
      if (v92 > v77)
      {
        a2 = v53;
        a3 = v67;
        if (v53 > v82)
          continue;
      }
      goto LABEL_48;
    }
    if (v66 < v85 || v67 >= v85)
    {
      v76 = v87;
      swift_arrayInitWithTakeFrontToBack(v67, v53);
      v13 = v69;
      v10 = v76;
      v49 = v79;
    }
    else
    {
      v72 = v66 == v85;
      v13 = v69;
      v10 = v87;
      v49 = v79;
      if (!v72)
        swift_arrayInitWithTakeBackToFront(v67, v53);
    }
    v94 += v49;
    goto LABEL_65;
  }
  if ((v24 & 0x8000000000000000) == 0)
  {
    v26 = v24 * v87;
    v85 = a3;
    if (a4 < a1 || a1 + v26 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1);
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4, a1);
    }
    v28 = a4 + v26;
    v92 = a4 + v26;
    if (v26 >= 1 && a2 < v85)
    {
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v86 + 16);
      do
      {
        v30(v20, a2, v10);
        v31 = ((uint64_t (*)(char *, unint64_t, uint64_t))v30)(v18, a4, v10);
        v32 = FMFFriend.favoriteOrder.getter(v31);
        v33 = FMFFriend.favoriteOrder.getter(v32);
        if (v32 == v33)
        {
          v90 = FMFFriend.name.getter();
          v91 = v34;
          v88 = FMFFriend.name.getter();
          v89 = v35;
          v36 = type metadata accessor for Locale(0);
          v37 = (uint64_t)v84;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v84, 1, 1, v36);
          v38 = sub_100024AF0();
          v39 = StringProtocol.compare<A>(_:options:range:locale:)(&v88, 1, 0, 0, 1, v37, &type metadata for String, &type metadata for String, v38, v38);
          sub_100008C08(v37, &qword_100057740);
          swift_bridgeObjectRelease(v89);
          swift_bridgeObjectRelease(v91);
          v40 = v39 == -1;
        }
        else
        {
          v41 = FMFFriend.favoriteOrder.getter(v33);
          v40 = v41 < FMFFriend.favoriteOrder.getter(v41);
        }
        v42 = *(void (**)(char *, uint64_t))(v86 + 8);
        v42(v18, v10);
        v42(v20, v10);
        v43 = v94;
        if (v40)
        {
          v44 = a2 + v87;
          if (v94 < a2 || v94 >= v44)
          {
            swift_arrayInitWithTakeFrontToBack(v94, a2);
          }
          else if (v94 == a2)
          {
            v43 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront(v94, a2);
          }
        }
        else
        {
          v45 = v93 + v87;
          if (v94 < v93 || v94 >= v45)
          {
            swift_arrayInitWithTakeFrontToBack(v94, v93);
          }
          else if (v94 != v93)
          {
            swift_arrayInitWithTakeBackToFront(v94, v93);
          }
          v93 = v45;
          v44 = a2;
        }
        v94 = v43 + v87;
        a4 = v93;
        if (v93 >= v28)
          break;
        a2 = v44;
      }
      while (v44 < v85);
    }
LABEL_48:
    sub_10003A968(&v94, &v93, (uint64_t *)&v92);
    return 1;
  }
LABEL_73:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_10003A870(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
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
    v10 = sub_100004A10(&qword_100057748);
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
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_10003A968(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for FMFFriend(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3, v4);
  return result;
}

char *sub_10003AA74(uint64_t a1)
{
  return sub_10003A870(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10003AA88(char a1, int64_t a2, char a3, _QWORD *a4)
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
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100004A10(&qword_100057738);
  v11 = *(_QWORD *)(type metadata accessor for FMFFriend(0) - 8);
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
  v18 = *(_QWORD *)(type metadata accessor for FMFFriend(0) - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v20, v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v22 = *(_QWORD *)(v18 + 72) * v8;
  v23 = &v20[v22];
  v24 = (unint64_t)&v21[v22];
  if (v21 >= v23 || (unint64_t)v20 >= v24)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10003AC68(_QWORD *a1)
{
  return sub_10003AA88(0, a1[2], 0, a1);
}

uint64_t sub_10003AC7C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FriendModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003ACB8()
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

  v1 = type metadata accessor for WidgetFamily(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v3 | 7;
  v6 = (((*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7 + 8));
  swift_release(*(_QWORD *)(v0 + v8 + 8));
  return swift_deallocObject(v0, ((v8 + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_10003AD88(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v7 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_100036C34(a1, a2, a3, *(_QWORD *)(v3 + 16), v3 + v8, *(double *)(v3 + v9), *(double *)(v3 + v9 + 8), *(_QWORD *)(v3 + v10), *(_QWORD *)(v3 + v11), *(_QWORD *)(v3 + v11 + 8), *(_QWORD *)(v3 + ((v11 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v3 + ((v11 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v3 + ((((v11 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10003AE48()
{
  return sub_10003AEC8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char *, _QWORD))sub_100038BB0);
}

uint64_t sub_10003AE54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003AE64(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10003AE6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100056050;
  if (!qword_100056050)
  {
    v1 = sub_100004A50(&qword_100056048);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100056050);
  }
  return result;
}

uint64_t sub_10003AEBC()
{
  return sub_10003AEC8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char *, _QWORD))sub_100038210);
}

uint64_t sub_10003AEC8(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char *, _QWORD))
{
  char *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  return a1(*((_QWORD *)v1 + 2), *((_QWORD *)v1 + 3), *((_QWORD *)v1 + 4), *((_QWORD *)v1 + 5), *((_QWORD *)v1 + 6), &v1[v3], *(_QWORD *)&v1[(*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8]);
}

uint64_t sub_10003AF28()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for WidgetFamily(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v5 = v3 | 7;
  v6 = ((*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release(*((_QWORD *)v0 + 2));
  swift_bridgeObjectRelease(*((_QWORD *)v0 + 4));
  swift_release(*((_QWORD *)v0 + 6));
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v4], v1);
  return swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10003AFB8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_100037524(a1, v1[2], v1[3], v1[4], v1[5], v1[6], (uint64_t)v1 + v4, *(uint64_t *)((char *)v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10003B014(uint64_t a1, char a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = type metadata accessor for WidgetFamily(0);
  v6 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100055AF8 != -1)
    result = swift_once(&qword_100055AF8, sub_10003DC34);
  if (qword_100055AF0 != -1)
    result = swift_once(&qword_100055AF0, sub_10002CBD4);
  if ((a3 & 1) != 0 || (a2 & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, enum case for WidgetFamily.systemSmall(_:), v5);
    v10 = sub_1000086D4((unint64_t *)&qword_100056218, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v12, v5, v10);
    dispatch thunk of RawRepresentable.rawValue.getter(&v11, v5, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

void sub_10003B200(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, __n128), void (*a5)(uint64_t, __n128), double a6, double a7)
{
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  __n128 v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void (*v44)(_QWORD, __n128);
  void (*v45)(uint64_t, __n128);
  uint64_t v46;
  void *v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  int v72;
  char *v73;
  void (*v74)(char *, unint64_t);
  double v75;
  double v76;
  double v77;
  double v78;
  char *v79;
  double v80;
  CLLocationDegrees v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  void (*v93)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  __n128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  unsigned int v112;
  id v113;
  id v114;
  int v115;
  unsigned int v116;
  unint64_t v117;
  uint64_t v118;
  NSObject *v119;
  os_log_type_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  __n128 v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t, uint64_t);
  int v133;
  unint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  void (*v141)(char *, uint64_t);
  uint64_t v142;
  NSObject *v143;
  os_log_type_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  unint64_t v150;
  unint64_t v151;
  double v152;
  double v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unint64_t v161;
  unint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  unint64_t v170;
  void (**v171)(uint64_t, __n128);
  void (*v172)(uint64_t, __n128);
  uint64_t v173;
  unint64_t v174;
  void *v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  char *v187;
  double v188;
  _QWORD *v189;
  uint64_t v190;
  char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void (*v195)(uint64_t, __n128);
  void (*v196)(uint64_t, __n128);
  unint64_t v197;
  uint64_t v198;
  char *v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t (*v202)(char *, uint64_t, uint64_t);
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;

  v198 = a2;
  v13 = type metadata accessor for FriendModel(0);
  __chkstk_darwin(v13);
  v199 = (char *)&v176 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v193 = type metadata accessor for FMFFriend(0);
  v192 = *(_QWORD *)(v193 - 8);
  v15 = __chkstk_darwin(v193);
  v191 = (char *)&v176 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v178 = v16;
  __chkstk_darwin(v15);
  v179 = (char *)&v176 - v17;
  v186 = type metadata accessor for FMFLocationSource(0);
  v189 = *(_QWORD **)(v186 - 8);
  __chkstk_darwin(v186);
  v176 = (char *)&v176 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v184 = sub_100004A10(&qword_100057718);
  __chkstk_darwin(v184);
  v185 = (char *)&v176 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100004A10(&qword_100057720);
  v21 = __chkstk_darwin(v20);
  v177 = (uint64_t)&v176 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v176 - v24;
  __chkstk_darwin(v23);
  *(_QWORD *)&v188 = (char *)&v176 - v26;
  v182 = type metadata accessor for WidgetFamily(0);
  v181 = *(_QWORD *)(v182 - 8);
  __chkstk_darwin(v182);
  v180 = (char *)&v176 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_100004A10(&qword_100056470);
  v29 = __chkstk_darwin(v28);
  v183 = (char *)&v176 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __chkstk_darwin(v29);
  v33 = (char *)&v176 - v32;
  v34 = __chkstk_darwin(v31);
  v36 = (char *)&v176 - v35;
  v38 = FMFFriend.name.getter(v34, v37);
  v204 = a1;
  v205 = v38;
  v40 = v39;
  FMFFriend.location.getter(v38);
  v41 = type metadata accessor for FMFLocation(0);
  v42 = *(_QWORD *)(v41 - 8);
  v202 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48);
  v43 = v202(v36, 1, v41);
  v197 = v41;
  v190 = v42;
  if (v43 == 1)
  {
    sub_100008C08((uint64_t)v36, &qword_100056470);
  }
  else
  {
    v44 = a4;
    v45 = a5;
    v46 = v42;
    v47 = (void *)FMFLocation.location.getter();
    v48 = *(void (**)(char *, uint64_t))(v46 + 8);
    a5 = v45;
    a4 = v44;
    v48(v36, v41);

  }
  v187 = v25;
  if (qword_100055AC8 != -1)
    swift_once(&qword_100055AC8, sub_1000058E0);
  v49 = type metadata accessor for Logger(0);
  v50 = sub_100007E94(v49, (uint64_t)qword_100059040);
  v51 = v200;
  swift_retain_n(v200, 2);
  v52 = swift_bridgeObjectRetain_n(v40, 2);
  v203 = v50;
  v53 = Logger.logObject.getter(v52);
  v54 = static os_log_type_t.default.getter();
  v55 = os_log_type_enabled(v53, v54);
  v196 = a5;
  v195 = a4;
  v194 = a3;
  if (v55)
  {
    v56 = swift_slowAlloc(32, -1);
    v57 = swift_slowAlloc(96, -1);
    v207 = v57;
    *(_DWORD *)v56 = 136315650;
    v58 = *(_QWORD *)(v51 + 16);
    v59 = *(_QWORD *)(v51 + 24);
    swift_bridgeObjectRetain(v59);
    v206 = sub_100008084(v58, v59, &v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v56 + 4, v56 + 12);
    swift_release_n(v51, 2);
    swift_bridgeObjectRelease(v59);
    *(_WORD *)(v56 + 12) = 2080;
    swift_bridgeObjectRetain(v40);
    v206 = sub_100008084(v205, v40, &v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v56 + 14, v56 + 22);
    swift_bridgeObjectRelease_n(v40, 3);
    *(_WORD *)(v56 + 22) = 2080;
    v60 = CGSize.debugDescription.getter(a6, a7);
    v62 = v61;
    v206 = sub_100008084(v60, v61, &v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v56 + 24, v56 + 32);
    swift_bridgeObjectRelease(v62);
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "🥑 PeopleDataService%s: loading \"%s\" for %s…", (uint8_t *)v56, 0x20u);
    swift_arrayDestroy(v57, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v57, -1, -1);
    swift_slowDealloc(v56, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v40, 2);
    swift_release_n(v51, 2);
  }
  v63 = v51;
  v64 = v204;
  v65 = v198;
  v66 = sub_10003B014(v198, 0, 1);
  v68 = v67;
  v70 = v69;
  FMFFriend.location.getter(v66);
  v71 = v197;
  v72 = v202(v33, 1, v197);
  v201 = v40;
  if (v72 != 1)
  {
    v73 = (char *)FMFLocation.location.getter();
    v74 = *(void (**)(char *, unint64_t))(v190 + 8);
    v74(v33, v71);
    if (!v73)
      goto LABEL_14;
    sub_10003127C(v65, v73);
    v76 = v75;
    objc_msgSend(v73, "horizontalAccuracy");
    v78 = v77;
    v199 = v73;
    objc_msgSend(v73, "coordinate");
    v191 = v79;
    v81 = v80;
    v82 = v181;
    v83 = v71;
    v84 = v64;
    v85 = v180;
    v86 = v182;
    (*(void (**)(char *, _QWORD, uint64_t))(v181 + 104))(v180, enum case for WidgetFamily.systemSmall(_:), v182);
    v87 = sub_1000086D4((unint64_t *)&qword_100056218, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v207, v86, v87);
    dispatch thunk of RawRepresentable.rawValue.getter(&v206, v86, v87);
    v198 = v207;
    v190 = v206;
    v88 = v85;
    v89 = v84;
    v90 = (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v88, v86);
    v91 = (uint64_t)v183;
    FMFFriend.location.getter(v90);
    if (v202((char *)v91, 1, v83) == 1)
    {
      sub_100008C08(v91, &qword_100056470);
      v92 = v189;
      v93 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v189[7];
      v94 = *(_QWORD *)&v188;
      v95 = *(_QWORD *)&v188;
      v96 = 1;
    }
    else
    {
      v94 = *(_QWORD *)&v188;
      FMFLocation.locationSource.getter();
      v74((char *)v91, v83);
      v92 = v189;
      v93 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v189[7];
      v95 = v94;
      v96 = 0;
    }
    v127 = v186;
    v93(v95, v96, 1, v186);
    v128 = v184;
    v129 = (uint64_t)v185;
    v130 = (uint64_t)v187;
    ((void (*)(char *, _QWORD, uint64_t))v92[13])(v187, enum case for FMFLocationSource.stewie(_:), v127);
    v93(v130, 0, 1, v127);
    v131 = v129 + *(int *)(v128 + 48);
    sub_100008CE0(v94, v129, &qword_100057720);
    sub_100008CE0(v130, v131, &qword_100057720);
    v132 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v92[6];
    v133 = v132(v129, 1, v127);
    v134 = v201;
    if (v133 == 1)
    {
      sub_100008C08(v130, &qword_100057720);
      sub_100008C08(v94, &qword_100057720);
      if (v132(v131, 1, v127) == 1)
      {
        sub_100008C08(v129, &qword_100057720);
LABEL_35:
        v197 = 0x8000000100041FE0;
        v202 = (uint64_t (*)(char *, uint64_t, uint64_t))0xD000000000000015;
        goto LABEL_36;
      }
    }
    else
    {
      v135 = v177;
      sub_100008CE0(v129, v177, &qword_100057720);
      if (v132(v131, 1, v127) != 1)
      {
        v136 = v189;
        v137 = v176;
        ((void (*)(char *, uint64_t, uint64_t))v189[4])(v176, v131, v127);
        v138 = sub_1000086D4(&qword_100057728, (uint64_t (*)(uint64_t))&type metadata accessor for FMFLocationSource, (uint64_t)&protocol conformance descriptor for FMFLocationSource);
        v139 = v129;
        v140 = dispatch thunk of static Equatable.== infix(_:_:)(v135, v137, v127, v138);
        v141 = (void (*)(char *, uint64_t))v136[1];
        v141(v137, v127);
        sub_100008C08((uint64_t)v187, &qword_100057720);
        sub_100008C08(*(uint64_t *)&v188, &qword_100057720);
        v141((char *)v135, v127);
        v89 = v204;
        sub_100008C08(v139, &qword_100057720);
        if ((v140 & 1) != 0)
          goto LABEL_35;
LABEL_33:
        v202 = 0;
        v197 = 0;
LABEL_36:
        swift_retain_n(v63, 2);
        v142 = swift_bridgeObjectRetain_n(v134, 2);
        v143 = Logger.logObject.getter(v142);
        v144 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v143, v144))
        {
          v145 = swift_slowAlloc(32, -1);
          v146 = swift_slowAlloc(96, -1);
          v207 = v146;
          *(_DWORD *)v145 = 136315650;
          v147 = *(_QWORD *)(v63 + 16);
          v148 = *(_QWORD *)(v63 + 24);
          swift_bridgeObjectRetain(v148);
          v206 = sub_100008084(v147, v148, &v207);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v145 + 4, v145 + 12);
          swift_release_n(v63, 2);
          swift_bridgeObjectRelease(v148);
          *(_WORD *)(v145 + 12) = 2080;
          swift_bridgeObjectRetain(v134);
          v206 = sub_100008084(v205, v134, &v207);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v145 + 14, v145 + 22);
          swift_bridgeObjectRelease_n(v134, 3);
          *(_WORD *)(v145 + 22) = 2080;
          v149 = CGSize.debugDescription.getter(a6, a7);
          v151 = v150;
          v206 = sub_100008084(v149, v150, &v207);
          v89 = v204;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v145 + 24, v145 + 32);
          swift_bridgeObjectRelease(v151);
          _os_log_impl((void *)&_mh_execute_header, v143, v144, "🥑 PeopleDataService%s: parsing \"%s\" for %s…", (uint8_t *)v145, 0x20u);
          swift_arrayDestroy(v146, 3, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v146, -1, -1);
          swift_slowDealloc(v145, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n(v134, 2);
          swift_release_n(v63, 2);
        }
        v203 = *(_QWORD *)(v63 + 80);
        if (v203)
        {
          v152 = v78 / v76 * a7;
          LODWORD(v186) = v198 == v190;
          v189 = *(_QWORD **)(v63 + 96);
          v188 = *(double *)(v63 + 88);
          v187 = *(char **)(v63 + 72);
          v153 = v188;
          v198 = v68;
          v190 = v70;
          v154 = v192;
          v155 = v179;
          v156 = v193;
          (*(void (**)(char *, unint64_t, uint64_t))(v192 + 16))(v179, v89, v193);
          v157 = *(unsigned __int8 *)(v154 + 80);
          v158 = (v157 + 16) & ~v157;
          v204 = (v158 + v178 + 7) & 0xFFFFFFFFFFFFFFF8;
          v159 = (v158 + v178 + 31) & 0xFFFFFFFFFFFFFFF8;
          v160 = (v159 + 15) & 0xFFFFFFFFFFFFFFF8;
          v161 = (v160 + 15) & 0xFFFFFFFFFFFFFFF8;
          v162 = (v161 + 15) & 0xFFFFFFFFFFFFFFF8;
          v163 = (v162 + 23) & 0xFFFFFFFFFFFFFFF8;
          v164 = swift_allocObject(&unk_100052DA0, v163 + 16, v157 | 7);
          (*(void (**)(uint64_t, char *, uint64_t))(v154 + 32))(v164 + v158, v155, v156);
          v165 = v164 + v204;
          v166 = v197;
          *(_QWORD *)v165 = v202;
          *(_QWORD *)(v165 + 8) = v166;
          *(_BYTE *)(v165 + 16) = v186;
          v167 = v200;
          *(_QWORD *)(v164 + v159) = v200;
          *(double *)(v164 + v160) = v152;
          v168 = v194;
          *(_QWORD *)(v164 + v161) = v194;
          v169 = (_QWORD *)(v164 + v162);
          v170 = v201;
          *v169 = v205;
          v169[1] = v170;
          v171 = (void (**)(uint64_t, __n128))(v164 + v163);
          v172 = v196;
          *v171 = v195;
          v171[1] = v172;
          swift_retain(v167);
          v173 = (uint64_t)v187;
          v174 = v203;
          v175 = v189;
          sub_10003C63C((uint64_t)v187, v203, *(uint64_t *)&v188, v189);
          swift_errorRetain(v168);
          swift_retain(v172);
          sub_100033134(v198, v190, 0, (uint64_t)sub_10003C570, v164, v173, v174, v175, *(CLLocationDegrees *)&v191, v81, v76, a6, a7, v153);
          swift_release(v164);

          swift_bridgeObjectRelease(v174);
        }
        else
        {
          __break(1u);
        }
        return;
      }
      sub_100008C08((uint64_t)v187, &qword_100057720);
      sub_100008C08(*(uint64_t *)&v188, &qword_100057720);
      ((void (*)(uint64_t, uint64_t))v189[1])(v135, v127);
    }
    sub_100008C08(v129, &qword_100057718);
    goto LABEL_33;
  }
  sub_100008C08((uint64_t)v33, &qword_100056470);
LABEL_14:
  swift_retain_n(v63, 2);
  v97 = swift_bridgeObjectRetain_n(v40, 2);
  v98 = Logger.logObject.getter(v97);
  v99 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v98, v99))
  {
    v100 = swift_slowAlloc(32, -1);
    v101 = swift_slowAlloc(96, -1);
    v207 = v101;
    *(_DWORD *)v100 = 136315650;
    v102 = *(_QWORD *)(v63 + 16);
    v103 = *(_QWORD *)(v63 + 24);
    swift_bridgeObjectRetain(v103);
    v206 = sub_100008084(v102, v103, &v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v100 + 4, v100 + 12);
    swift_release_n(v63, 2);
    swift_bridgeObjectRelease(v103);
    *(_WORD *)(v100 + 12) = 2080;
    swift_bridgeObjectRetain(v40);
    v206 = sub_100008084(v205, v40, &v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v100 + 14, v100 + 22);
    swift_bridgeObjectRelease_n(v40, 3);
    *(_WORD *)(v100 + 22) = 2080;
    v104 = CGSize.debugDescription.getter(a6, a7);
    v106 = v105;
    v206 = sub_100008084(v104, v105, &v207);
    v64 = v204;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v100 + 24, v100 + 32);
    swift_bridgeObjectRelease(v106);
    _os_log_impl((void *)&_mh_execute_header, v98, v99, "🥑 PeopleDataService%s: parsing \"%s\" for %s (has no location)", (uint8_t *)v100, 0x20u);
    swift_arrayDestroy(v101, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v101, -1, -1);
    swift_slowDealloc(v100, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v40, 2);
    v107 = swift_release_n(v63, 2);
  }
  v108 = v194;
  v109 = (uint64_t)v199;
  v110 = (uint64_t)v191;
  (*(void (**)(char *, unint64_t, uint64_t, __n128))(v192 + 16))(v191, v64, v193, v107);
  v111 = *(unsigned __int8 *)(v63 + 128);
  v112 = objc_msgSend(*(id *)(v63 + 56), "airplaneMode");
  v113 = objc_msgSend(*(id *)(v63 + 64), "aa_primaryAppleAccount");
  v114 = v113;
  if (v113)

  if (v112)
    v115 = 256;
  else
    v115 = 0;
  v116 = v115 | (v114 != 0);
  swift_errorRetain(v108);
  sub_10000F6E0(v110, 0, 0, 2, v111, v116, 0, 0, v109, 0xFFu, 0.0, 1, v108);
  swift_retain_n(v63, 2);
  v117 = v201;
  v118 = swift_bridgeObjectRetain(v201);
  v119 = Logger.logObject.getter(v118);
  v120 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v119, v120))
  {
    v121 = swift_slowAlloc(22, -1);
    v122 = swift_slowAlloc(64, -1);
    v207 = v122;
    *(_DWORD *)v121 = 136315394;
    v123 = *(_QWORD *)(v63 + 16);
    v124 = *(_QWORD *)(v63 + 24);
    swift_bridgeObjectRetain(v124);
    v206 = sub_100008084(v123, v124, &v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v121 + 4, v121 + 12);
    swift_release_n(v63, 2);
    swift_bridgeObjectRelease(v124);
    *(_WORD *)(v121 + 12) = 2080;
    swift_bridgeObjectRetain(v117);
    v206 = sub_100008084(v205, v117, &v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v206, &v207, v121 + 14, v121 + 22);
    swift_bridgeObjectRelease_n(v117, 3);
    _os_log_impl((void *)&_mh_execute_header, v119, v120, "🥑 PeopleDataService%s: generated no map for \"%s\"", (uint8_t *)v121, 0x16u);
    swift_arrayDestroy(v122, 2, (char *)&type metadata for Any + 8);
    v125 = v122;
    v109 = (uint64_t)v199;
    swift_slowDealloc(v125, -1, -1);
    swift_slowDealloc(v121, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v117, 2);
    v126 = swift_release_n(v63, 2);
  }
  v195(v109, v126);
  sub_10003AC7C(v109);
}

uint64_t sub_10003C498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v1 = type metadata accessor for FMFFriend(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = (v5 + 7) & 0xFFFFFFFFFFFFF8;
  v8 = (v5 + 31) & 0xFFFFFFFFFFFFFFF8;
  v9 = (((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7 + 8));
  swift_release(*(_QWORD *)(v0 + v8));
  swift_errorRelease(*(_QWORD *)(v0 + v9));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v10 + 8));
  swift_release(*(_QWORD *)(v0 + v11 + 8));
  return swift_deallocObject(v0, v11 + 16, v6);
}

uint64_t sub_10003C570(void *a1, void *a2, unsigned __int8 a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v7 = *(_QWORD *)(type metadata accessor for FMFFriend(0) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = v8 + *(_QWORD *)(v7 + 64);
  v10 = (v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v9 + 31) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_1000361E4(a1, a2, a3, v3 + v8, *(_QWORD *)(v3 + v10), *(_QWORD *)(v3 + v10 + 8), *(unsigned __int8 *)(v3 + v10 + 16), *(_QWORD *)(v3 + v11), *(double *)(v3 + v12), *(_QWORD *)(v3 + v13), *(void **)(v3 + v14), *(_QWORD *)(v3 + v14 + 8), *(void (**)(unint64_t))(v3 + ((v14 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v3 + ((v14 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

id sub_10003C63C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain(a2);
    return a4;
  }
  return result;
}

uint64_t sub_10003C66C()
{
  uint64_t v0;
  int *v1;
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
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = (int *)type metadata accessor for FriendModel(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for WidgetFamily(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v23 = v7;
  v24 = v6;
  v22 = *(_QWORD *)(v7 + 64);
  swift_release(*(_QWORD *)(v0 + 16));
  v9 = v0 + v4;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v4 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v4 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v4 + 40));
  v10 = v0 + v4 + v1[13];
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  swift_bridgeObjectRelease(*(_QWORD *)(v9 + v1[14] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v9 + v1[16] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v9 + v1[17] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v9 + v1[18] + 8));
  v13 = v9 + v1[21];
  v14 = *(unsigned __int8 *)(v13 + 16);
  if (v14 != 255)
    sub_100008950(*(void **)v13, *(void **)(v13 + 8), v14 & 1);
  v15 = v9 + v1[25];
  v16 = *(unsigned __int8 *)(v15 + 16);
  if (v16 != 255)
    sub_100008950(*(void **)v15, *(void **)(v15 + 8), v16 & 1);
  v17 = *(_QWORD *)(v9 + v1[28] + 16);
  if (v17 != 1)
    swift_bridgeObjectRelease(v17);
  v18 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v8 + v19 + 16) & ~v8;
  swift_bridgeObjectRelease(*(_QWORD *)(v9 + v1[29] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v9 + v1[30] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v18 + 8));
  swift_release(*(_QWORD *)(v0 + v19 + 8));
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v0 + v20, v24);
  return swift_deallocObject(v0, ((v22 + v20 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v8 | 7);
}

void sub_10003C874()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for FriendModel(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = type metadata accessor for WidgetFamily(0);
  sub_100037858(*(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(void (**)(_QWORD))(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80) + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80)));
}

uint64_t sub_10003C914()
{
  return sub_10003CB24((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char *, char *, _QWORD))sub_100037F00);
}

uint64_t sub_10003C924()
{
  char *v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = (int *)type metadata accessor for FriendModel(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v20 = *(_QWORD *)(v2 + 64);
  v21 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v21 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v19 = *(_QWORD *)(v5 + 64);
  swift_release(*((_QWORD *)v0 + 2));
  swift_bridgeObjectRelease(*((_QWORD *)v0 + 4));
  swift_release(*((_QWORD *)v0 + 6));
  v7 = &v0[v4];
  swift_bridgeObjectRelease(*(_QWORD *)&v0[v4 + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&v0[v4 + 24]);
  swift_bridgeObjectRelease(*(_QWORD *)&v0[v4 + 40]);
  v8 = &v0[v4 + v1[13]];
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  swift_bridgeObjectRelease(*(_QWORD *)&v7[v1[14] + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&v7[v1[16] + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&v7[v1[17] + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&v7[v1[18] + 8]);
  v11 = &v7[v1[21]];
  v12 = v11[16];
  if (v12 != 255)
    sub_100008950(*(void **)v11, *((void **)v11 + 1), v12 & 1);
  v13 = &v7[v1[25]];
  v14 = v13[16];
  if (v14 != 255)
    sub_100008950(*(void **)v13, *((void **)v13 + 1), v14 & 1);
  v15 = *(_QWORD *)&v7[v1[28] + 16];
  if (v15 != 1)
    swift_bridgeObjectRelease(v15);
  v16 = (v4 + v20 + v6) & ~v6;
  swift_bridgeObjectRelease(*(_QWORD *)&v7[v1[29] + 8]);
  v17 = swift_bridgeObjectRelease(*(_QWORD *)&v7[v1[30] + 8]);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 8))(&v0[v16], v21, v17);
  return swift_deallocObject(v0, ((v19 + v16 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v6 | 7);
}

uint64_t sub_10003CB18()
{
  return sub_10003CB24((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char *, char *, _QWORD))sub_1000388BC);
}

uint64_t sub_10003CB24(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char *, char *, _QWORD))
{
  char *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *(_QWORD *)(type metadata accessor for FriendModel(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return a1(*((_QWORD *)v1 + 2), *((_QWORD *)v1 + 3), *((_QWORD *)v1 + 4), *((_QWORD *)v1 + 5), *((_QWORD *)v1 + 6), &v1[v3], &v1[v6], *(_QWORD *)&v1[(*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8]);
}

uint64_t sub_10003CBB4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003CBC4()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[6]);
  swift_release(v0[8]);
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10003CC00()
{
  uint64_t v0;

  return sub_100034E80(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 56), *(_QWORD *)(v0 + 64));
}

uint64_t sub_10003CC14()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003CC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_10003520C(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t sub_10003CC4C()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  swift_bridgeObjectRelease(v0[7]);
  swift_release(v0[9]);
  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10003CC98(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return sub_1000357B4(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16), *(_QWORD **)(v5 + 24), *(_QWORD *)(v5 + 32), *(_QWORD *)(v5 + 40), *(char **)(v5 + 48), *(_QWORD *)(v5 + 56), *(NSObject **)(v5 + 64), *(_QWORD *)(v5 + 72));
}

uint64_t sub_10003CCD0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003CCFC()
{
  uint64_t v0;

  return sub_10003614C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10003CD04()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003CD14()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003CD48()
{
  uint64_t v0;

  return sub_100036068(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE **)(v0 + 40), *(_BYTE **)(v0 + 48));
}

uint64_t sub_10003CD58()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t destroy for BatteryInfo(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

uint64_t _s18FindMyWidgetPeople11BatteryInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_WORD *)(a1 + 5) = *(_WORD *)(a2 + 5);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for BatteryInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_BYTE *)(a1 + 6) = *(_BYTE *)(a2 + 6);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for BatteryInfo(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BatteryInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_BYTE *)(a1 + 6) = *(_BYTE *)(a2 + 6);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteryInfo(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteryInfo()
{
  return &type metadata for BatteryInfo;
}

uint64_t sub_10003CF78(int a1, uint64_t a2, void *a3, float a4)
{
  void *v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  Swift::String v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  Swift::String v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];

  v8 = (void *)0xE000000000000000;
  v25[0] = 0;
  v25[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(90);
  v9._countAndFlagsBits = 0x4979726574746142;
  v9._object = (void *)0xEB000000006F666ELL;
  String.append(_:)(v9);
  if (a3)
    v8 = a3;
  else
    a2 = 0;
  swift_bridgeObjectRetain(a3);
  v10._countAndFlagsBits = a2;
  v10._object = v8;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v8);
  v11._countAndFlagsBits = 0x3D6C6576656C203ALL;
  v11._object = (void *)0xE800000000000000;
  String.append(_:)(v11);
  Float.write<A>(to:)(v25, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, a4);
  v12._countAndFlagsBits = 0x726168437369202CLL;
  v12._object = (void *)0xED00003D676E6967;
  String.append(_:)(v12);
  if ((a1 & 1) != 0)
    v13 = 1702195828;
  else
    v13 = 0x65736C6166;
  if ((a1 & 1) != 0)
    v14 = 0xE400000000000000;
  else
    v14 = 0xE500000000000000;
  v15 = v14;
  String.append(_:)(*(Swift::String *)&v13);
  swift_bridgeObjectRelease(v14);
  v16._object = (void *)0x80000001000420B0;
  v16._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v16);
  if ((a1 & 0x100) != 0)
    v17 = 1702195828;
  else
    v17 = 0x65736C6166;
  if ((a1 & 0x100) != 0)
    v18 = 0xE400000000000000;
  else
    v18 = 0xE500000000000000;
  v19 = v18;
  String.append(_:)(*(Swift::String *)&v17);
  swift_bridgeObjectRelease(v18);
  v20._countAndFlagsBits = 0xD00000000000001CLL;
  v20._object = (void *)0x80000001000420D0;
  String.append(_:)(v20);
  if ((a1 & 0x10000) != 0)
    v21 = 1702195828;
  else
    v21 = 0x65736C6166;
  if ((a1 & 0x10000) != 0)
    v22 = 0xE400000000000000;
  else
    v22 = 0xE500000000000000;
  v23 = v22;
  String.append(_:)(*(Swift::String *)&v21);
  swift_bridgeObjectRelease(v22);
  return v25[0];
}

uint64_t sub_10003D158(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10003D188
                                                            + 4 * asc_100043E50[a1]))(0x6C6576656CLL, 0xE500000000000000);
}

uint64_t sub_10003D188()
{
  return 0x6967726168437369;
}

unint64_t sub_10003D1A4()
{
  return 0xD000000000000011;
}

unint64_t sub_10003D1C0()
{
  return 0xD000000000000019;
}

uint64_t sub_10003D1F8(_QWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v19 = a4;
  v10 = sub_100004A10(&qword_100057760);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v15 = a1[4];
  sub_100013808(a1, v14);
  v16 = sub_10003D9BC();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BatteryInfo.CodingKeys, &type metadata for BatteryInfo.CodingKeys, v16, v14, v15);
  v24 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(&v24, v10, a5);
  if (!v5)
  {
    v17 = v19;
    v23 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(a2 & 1, &v23, v10);
    v22 = 2;
    KeyedEncodingContainer.encode(_:forKey:)((a2 >> 8) & 1, &v22, v10);
    v21 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(HIWORD(a2) & 1, &v21, v10);
    v20 = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a3, v17, &v20, v10);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

BOOL sub_10003D3A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10003D3BC()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10003D400()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10003D428(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10003D468()
{
  unsigned __int8 *v0;

  return sub_10003D158(*v0);
}

uint64_t sub_10003D470@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10003D5B4(a1, a2);
  *a3 = result;
  return result;
}

void sub_10003D494(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10003D4A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10003D9BC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10003D4C8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10003D9BC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10003D4F0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  if (*(_BYTE *)(v0 + 5))
    v1 = 256;
  else
    v1 = 0;
  v2 = v1 | *(unsigned __int8 *)(v0 + 4);
  if (*(_BYTE *)(v0 + 6))
    v3 = 0x10000;
  else
    v3 = 0;
  return sub_10003CF78(v2 | v3, *(_QWORD *)(v0 + 8), *(void **)(v0 + 16), *(float *)v0);
}

void sub_10003D528(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  float v7;

  v7 = sub_10003D7BC(a1);
  if (!v2)
  {
    *(float *)a2 = v7;
    *(_BYTE *)(a2 + 4) = v4 & 1;
    *(_BYTE *)(a2 + 5) = BYTE1(v4) & 1;
    *(_BYTE *)(a2 + 6) = BYTE2(v4) & 1;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
}

uint64_t sub_10003D56C(_QWORD *a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  if (*(_BYTE *)(v1 + 5))
    v2 = 256;
  else
    v2 = 0;
  v3 = v2 | *(unsigned __int8 *)(v1 + 4);
  if (*(_BYTE *)(v1 + 6))
    v4 = 0x10000;
  else
    v4 = 0;
  return sub_10003D1F8(a1, v3 | v4, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(float *)v1);
}

uint64_t sub_10003D5B4(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;

  if (a1 == 0x6C6576656CLL && a2 == 0xE500000000000000)
  {
    v5 = 0xE500000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C6576656CLL, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6967726168437369 && a2 == 0xEA0000000000676ELL)
  {
    v7 = 0xEA0000000000676ELL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6967726168437369, 0xEA0000000000676ELL, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0xD000000000000011)
  {
    v8 = 0x80000001000420F0;
    if (a2 == 0x80000001000420F0)
      goto LABEL_19;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x80000001000420F0, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
LABEL_19:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if (a1 == 0xD000000000000019 && a2 == 0x8000000100042110)
  {
    v9 = 0x8000000100042110;
LABEL_25:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000019, 0x8000000100042110, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_25;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x8000000100042130)
  {
    swift_bridgeObjectRelease(0x8000000100042130);
    return 4;
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012, 0x8000000100042130, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

float sub_10003D7BC(_QWORD *a1)
{
  uint64_t v1;
  float v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  float v11;
  _DWORD v13[2];
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v4 = sub_100004A10(&qword_100057750);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100013808(a1, v8);
  v10 = sub_10003D9BC();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for BatteryInfo.CodingKeys, &type metadata for BatteryInfo.CodingKeys, v10, v8, v9);
  if (!v1)
  {
    v18 = 0;
    KeyedDecodingContainer.decode(_:forKey:)(&v18, v4);
    v2 = v11;
    v17 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v17, v4);
    v16 = 2;
    KeyedDecodingContainer.decode(_:forKey:)(&v16, v4);
    v15 = 3;
    v13[1] = KeyedDecodingContainer.decode(_:forKey:)(&v15, v4);
    v14 = 4;
    KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v14, v4);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100008714(a1);
  return v2;
}

unint64_t sub_10003D9BC()
{
  unint64_t result;

  result = qword_100057758;
  if (!qword_100057758)
  {
    result = swift_getWitnessTable(&unk_100043FBC, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100057758);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BatteryInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BatteryInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10003DADC + 4 * byte_100043E5A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10003DB10 + 4 * byte_100043E55[v4]))();
}

uint64_t sub_10003DB10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10003DB18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10003DB20);
  return result;
}

uint64_t sub_10003DB2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10003DB34);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10003DB38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10003DB40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BatteryInfo.CodingKeys()
{
  return &type metadata for BatteryInfo.CodingKeys;
}

unint64_t sub_10003DB60()
{
  unint64_t result;

  result = qword_100057768;
  if (!qword_100057768)
  {
    result = swift_getWitnessTable(&unk_100043F94, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100057768);
  }
  return result;
}

unint64_t sub_10003DBA8()
{
  unint64_t result;

  result = qword_100057770;
  if (!qword_100057770)
  {
    result = swift_getWitnessTable(&unk_100043F04, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100057770);
  }
  return result;
}

unint64_t sub_10003DBF0()
{
  unint64_t result;

  result = qword_100057778;
  if (!qword_100057778)
  {
    result = swift_getWitnessTable(&unk_100043F2C, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100057778);
  }
  return result;
}

double sub_10003DC34()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  double result;

  v0 = (void *)objc_opt_self(UIColor);
  v1 = Color.init(_:)(objc_msgSend(v0, "systemBackgroundColor"));
  v2 = Color.init(_:)(objc_msgSend(v0, "tertiarySystemBackgroundColor"));
  *(_QWORD *)&xmmword_100059178 = v1;
  *((_QWORD *)&xmmword_100059178 + 1) = v2;
  xmmword_100059188 = xmmword_100044010;
  xmmword_100059198 = xmmword_100044020;
  __asm { FMOV            V0.2D, #16.0 }
  xmmword_1000591A8 = _Q0;
  xmmword_1000591B8 = _Q0;
  xmmword_1000591C8 = xmmword_100044030;
  xmmword_1000591D8 = xmmword_100044040;
  *(_QWORD *)&xmmword_1000591E8 = 0x4004000000000000;
  *(__int128 *)((char *)&xmmword_1000591E8 + 8) = xmmword_100044050;
  *(__int128 *)((char *)&xmmword_1000591F8 + 8) = xmmword_100044060;
  *(__int128 *)((char *)&xmmword_100059208 + 8) = xmmword_100042770;
  *(__int128 *)((char *)&xmmword_100059218 + 8) = xmmword_100044070;
  *(__int128 *)((char *)&xmmword_100059228 + 8) = _Q0;
  *(__int128 *)((char *)&xmmword_100059238 + 8) = xmmword_100044080;
  result = -4.0;
  *(__int128 *)((char *)&xmmword_100059248 + 8) = xmmword_100044090;
  return result;
}

uint64_t destroy for ContentViewStyle(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t initializeWithCopy for ContentViewStyle(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 32) = v5;
  v6 = *((_OWORD *)a2 + 4);
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 64) = v6;
  v7 = *((_OWORD *)a2 + 6);
  *(_OWORD *)(a1 + 80) = *((_OWORD *)a2 + 5);
  *(_OWORD *)(a1 + 96) = v7;
  v8 = *((_OWORD *)a2 + 8);
  *(_OWORD *)(a1 + 112) = *((_OWORD *)a2 + 7);
  *(_OWORD *)(a1 + 128) = v8;
  v9 = *((_OWORD *)a2 + 10);
  *(_OWORD *)(a1 + 144) = *((_OWORD *)a2 + 9);
  *(_OWORD *)(a1 + 160) = v9;
  v10 = *((_OWORD *)a2 + 12);
  *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
  *(_OWORD *)(a1 + 192) = v10;
  *(_OWORD *)(a1 + 208) = *((_OWORD *)a2 + 13);
  *(_QWORD *)(a1 + 224) = a2[28];
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for ContentViewStyle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  a1[17] = a2[17];
  a1[18] = a2[18];
  a1[19] = a2[19];
  a1[20] = a2[20];
  a1[21] = a2[21];
  a1[22] = a2[22];
  a1[23] = a2[23];
  a1[24] = a2[24];
  a1[25] = a2[25];
  a1[26] = a2[26];
  a1[27] = a2[27];
  a1[28] = a2[28];
  return a1;
}

__n128 initializeWithTake for ContentViewStyle(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  __int128 v11;
  __int128 v12;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  v7 = a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  result = (__n128)a2[11];
  v11 = a2[12];
  v12 = a2[13];
  *(_QWORD *)(a1 + 224) = *((_QWORD *)a2 + 28);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

uint64_t assignWithTake for ContentViewStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  swift_release(*(_QWORD *)a1);
  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContentViewStyle(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 232))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentViewStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 232) = 1;
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
    *(_BYTE *)(result + 232) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentViewStyle()
{
  return &type metadata for ContentViewStyle;
}

id FriendSelectorIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id FriendSelectorIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FriendSelectorIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for FriendSelectorIntent()
{
  return objc_opt_self(FriendSelectorIntent);
}

id Contact.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id FriendSelectorIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for FriendSelectorIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id FriendSelectorIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithIdentifier:backingStore:", v7, a3);

  return v8;
}

id FriendSelectorIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for FriendSelectorIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id FriendSelectorIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(v5), "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id FriendSelectorIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;
  objc_super v14;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for FriendSelectorIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id FriendSelectorIntent.__deallocating_deinit()
{
  return sub_10003ED88(type metadata accessor for FriendSelectorIntent);
}

unint64_t FriendSelectorIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_10003EDB8(a1);
}

BOOL sub_10003E6A8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10003E6BC()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10003E700()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10003E728(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_10003E768@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_10003EDB8(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t FriendSelectorIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___FriendSelectorIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___FriendSelectorIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *FriendSelectorIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___FriendSelectorIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___FriendSelectorIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

char *FriendSelectorIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___FriendSelectorIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___FriendSelectorIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id FriendSelectorIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id FriendSelectorIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id FriendSelectorIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithBackingStore:", a1);

  return v3;
}

id FriendSelectorIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_10003EBAC(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id FriendSelectorIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  NSDictionary v3;
  id v4;

  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v4 = objc_msgSend(objc_allocWithZone(v1), "initWithPropertiesByName:", v3.super.isa);

  return v4;
}

id FriendSelectorIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id FriendSelectorIntentResponse.__deallocating_deinit()
{
  return sub_10003ED88(type metadata accessor for FriendSelectorIntentResponse);
}

id sub_10003ED88(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_10003EDB8(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for FriendSelectorIntentResponse()
{
  return objc_opt_self(FriendSelectorIntentResponse);
}

unint64_t sub_10003EDEC()
{
  unint64_t result;

  result = qword_100057788;
  if (!qword_100057788)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for FriendSelectorIntentResponseCode, &type metadata for FriendSelectorIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_100057788);
  }
  return result;
}

uint64_t sub_10003EE30@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___FriendSelectorIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_10003EE80(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___FriendSelectorIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for FriendSelectorIntentResponseCode()
{
  return &type metadata for FriendSelectorIntentResponseCode;
}

uint64_t static Contact.supportsSecureCoding.getter()
{
  return 1;
}

id Contact.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v6), "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

id Contact.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  objc_super v15;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for Contact();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for Contact()
{
  return objc_opt_self(Contact);
}

id Contact.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Contact();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id Contact.__deallocating_deinit()
{
  return sub_10003ED88(type metadata accessor for Contact);
}

id static ContactResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___ContactResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static ContactResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  double v7;
  id v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  objc_super v13;

  v2 = v1;
  v3 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v10 = a1;
    else
      v10 = a1 & 0xFFFFFFFFFFFFFF8;
    v11 = sub_10003F374();
    swift_bridgeObjectRetain(v3);
    v12 = _bridgeCocoaArray<A>(_:)(v10, v11);
    swift_bridgeObjectRelease(v3);
    v3 = v12;
  }
  else
  {
    v4 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_10003F374();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_10003F374();
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)&v7 = swift_bridgeObjectRelease(v3).n128_u64[0];
  v13.receiver = ObjCClassFromMetadata;
  v13.super_class = (Class)&OBJC_METACLASS___ContactResolutionResult;
  v8 = objc_msgSendSuper2(&v13, "disambiguationWithObjectsToDisambiguate:", isa, v7);

  return v8;
}

unint64_t sub_10003F374()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100057808;
  if (!qword_100057808)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100057808);
  }
  return result;
}

id static ContactResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___ContactResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static ContactResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetPeople/Contact.swift", 32, 2, 47, 0);
  __break(1u);
}

void static ContactResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetPeople/Contact.swift", 32, 2, 52, 0);
  __break(1u);
}

void static ContactResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetPeople/Contact.swift", 32, 2, 57, 0);
  __break(1u);
}

id ContactResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  Class isa;
  id v7;

  v5 = objc_allocWithZone(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v7 = objc_msgSend(v5, "initWithJSONDictionary:forIntent:", isa, a2);

  return v7;
}

id ContactResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  Class isa;
  id v6;
  id v7;
  objc_super v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for ContactResolutionResult();
  v6 = objc_msgSendSuper2(&v9, "initWithJSONDictionary:forIntent:", isa, a2);

  v7 = v6;
  if (v7)

  return v7;
}

uint64_t type metadata accessor for ContactResolutionResult()
{
  return objc_opt_self(ContactResolutionResult);
}

id ContactResolutionResult.__deallocating_deinit()
{
  return sub_10003ED88(type metadata accessor for ContactResolutionResult);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC18FindMyWidgetPeopleP33_39A87EB2CBA6C83F37D208FD872194A919ResourceBundleClass);
}

BOOL sub_10003F898(int a1, int a2, int a3)
{
  BOOL v6;

  if (qword_100058FB0 == -1)
  {
    v6 = dword_100058FA0 < a1;
    if (dword_100058FA0 > a1)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_100058FB0, 0, (dispatch_function_t)sub_10003F980);
    v6 = dword_100058FA0 < a1;
    if (dword_100058FA0 > a1)
      return 1;
  }
  if (v6)
    return 0;
  if (dword_100058FA4 > a2)
    return 1;
  return dword_100058FA4 >= a2 && dword_100058FA8 >= a3;
}

uint64_t sub_10003F980()
{
  return sub_10003FB18(1);
}

uint64_t sub_10003F988(int a1, int a2, int a3, int a4)
{
  BOOL v9;
  _DWORD v10[2];

  if (qword_100058FB8 == -1)
  {
    if (qword_100058FC0)
    {
LABEL_3:
      v10[0] = a1;
      v10[1] = (a2 << 16) | (a3 << 8) | a4;
      return _availability_version_check(1, v10);
    }
  }
  else
  {
    dispatch_once_f(&qword_100058FB8, 0, (dispatch_function_t)sub_10003FB10);
    if (qword_100058FC0)
      goto LABEL_3;
  }
  if (qword_100058FB0 == -1)
  {
    v9 = dword_100058FA0 < a2;
    if (dword_100058FA0 > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_100058FB0, 0, (dispatch_function_t)sub_10003F980);
    v9 = dword_100058FA0 < a2;
    if (dword_100058FA0 > a2)
      return 1;
  }
  if (v9)
    return 0;
  if (dword_100058FA4 > a3)
    return 1;
  return dword_100058FA4 >= a3 && dword_100058FA8 >= a4;
}

uint64_t sub_10003FB10()
{
  return sub_10003FB18(0);
}

uint64_t sub_10003FB18(uint64_t result)
{
  void *v1;
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];

  v1 = (void *)qword_100058FC0;
  if (qword_100058FC0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (&__availability_version_check)
    {
      qword_100058FC0 = (uint64_t)&__availability_version_check;
      v1 = &__availability_version_check;
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &dword_100058FA0, &dword_100058FA4, &dword_100058FA8);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

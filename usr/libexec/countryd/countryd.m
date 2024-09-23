BOOL sub_10000472C()
{
  BOOL v0;
  uint64_t v4;
  void *v5;
  BOOL v6;

  if (&class metadata base offset for LSKLocalStatusClient)
    v0 = &type metadata accessor for LSKLocalStatusClient == 0;
  else
    v0 = 1;
  if (v0
    || &type metadata for LSKLocalStatusClient == 0
    || &nominal type descriptor for LSKLocalStatusClient == 0
    || &metaclass for LSKLocalStatusClient == 0)
  {
    v4 = static os_log_type_t.info.getter();
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v5 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, v5, "This platform does not have LocalStatusKit", 42, 2, &_swiftEmptyArrayStorage);

  }
  if (&metaclass for LSKLocalStatusClient)
    v6 = &nominal type descriptor for LSKLocalStatusClient == 0;
  else
    v6 = 1;
  return !v6
      && &type metadata for LSKLocalStatusClient != 0
      && &type metadata accessor for LSKLocalStatusClient != 0
      && &class metadata base offset for LSKLocalStatusClient != 0;
}

id sub_1000048F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RDSharerAvailability();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for RDSharerAvailability()
{
  return objc_opt_self(_TtC8countryd20RDSharerAvailability);
}

id sub_100004980(uint64_t a1)
{
  return sub_1000089E8(a1, type metadata accessor for RDSharerAvailability);
}

void *sub_10000498C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  char *v24;
  char *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  Class isa;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  double v41;
  char v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  char *v52;
  void (*v53)(uint64_t, char *, uint64_t);
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  double v77;
  char *v78;
  double v79;
  unsigned __int8 v80;
  char v81[8];
  double __src;
  uint64_t v83;

  v2 = sub_100005084(&qword_100019198);
  __chkstk_darwin(v2);
  v78 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v72 - v9;
  if (!((unint64_t)a1 >> 62))
  {
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (v11)
      goto LABEL_3;
LABEL_41:
    swift_bridgeObjectRelease(a1);
    v65 = COERCE_DOUBLE(&_swiftEmptyDictionarySingleton);
    return *(void **)&v65;
  }
  if (a1 < 0)
    v70 = a1;
  else
    v70 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v11 = _CocoaArrayWrapper.endIndex.getter(v70);
  if (!v11)
    goto LABEL_41;
LABEL_3:
  v72 = v10;
  v73 = v8;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v12 = *(id *)(a1 + 32);
  }
  v13 = v12;
  swift_bridgeObjectRelease(a1);
  v14 = objc_msgSend(v13, "countryCode");
  if (!v14)
  {
    v77 = COERCE_DOUBLE(&_swiftEmptyDictionarySingleton);
    if (v11 >= 1)
      goto LABEL_8;
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;

  v19 = sub_1000050C4(v16, v18);
  v21 = v20;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
  __src = COERCE_DOUBLE(&_swiftEmptyDictionarySingleton);
  sub_100009BC8(v19, v21, 0xD000000000000032, 0x80000001000108E0, isUniquelyReferenced_nonNull_native);
  v77 = __src;
  v14 = (id)swift_bridgeObjectRelease(0x8000000000000000);
  if (v11 < 1)
    goto LABEL_22;
LABEL_8:
  v74 = v5;
  v75 = v4;
  v76 = v13;
  swift_bridgeObjectRetain(a1);
  v23 = 0;
  v24 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v23, a1);
    else
      v26 = *(id *)(a1 + 8 * v23 + 32);
    v27 = v26;
    v28 = objc_msgSend(v26, "countryCode", v72);
    if (v28)
    {
      v29 = v28;
      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v32 = v31;

      if ((swift_isUniquelyReferenced_nonNull_native(v24) & 1) == 0)
        v24 = sub_100008D30(0, *((_QWORD *)v24 + 2) + 1, 1, v24);
      v34 = *((_QWORD *)v24 + 2);
      v33 = *((_QWORD *)v24 + 3);
      if (v34 >= v33 >> 1)
        v24 = sub_100008D30((char *)(v33 > 1), v34 + 1, 1, v24);
      *((_QWORD *)v24 + 2) = v34 + 1;
      v25 = &v24[16 * v34];
      *((_QWORD *)v25 + 4) = v30;
      *((_QWORD *)v25 + 5) = v32;
    }
    ++v23;

  }
  while (v11 != v23);
  swift_bridgeObjectRelease(a1);
  v35 = (void *)objc_opt_self(NSJSONSerialization);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v24);
  __src = 0.0;
  v37 = objc_msgSend(v35, "dataWithJSONObject:options:error:", isa, 0, &__src);

  v14 = *(id *)&__src;
  if (v37)
  {
    v38 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v37);
    v40 = v39;

    sub_10000A520(v38, v40);
    v41 = v77;
    v42 = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)&v77);
    __src = v41;
    sub_100009BC8(v38, v40, 0xD000000000000033, 0x80000001000108A0, v42);
    v43 = __src;
    swift_bridgeObjectRelease(0x8000000000000000);
    sub_10000A564(v38, v40);
    v45 = v75;
    v44 = v76;
    v46 = v74;
    v47 = (uint64_t)v78;
    goto LABEL_24;
  }
LABEL_23:
  v48 = v14;
  v49 = _convertNSErrorToError(_:)();

  swift_willThrow();
  swift_errorRelease(v49);
  v45 = v75;
  v44 = v76;
  v46 = v74;
  v43 = v77;
  v47 = (uint64_t)v78;
LABEL_24:
  v50 = objc_msgSend(v44, "timestamp", v72);
  if (v50)
  {
    v51 = v50;
    v52 = v73;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v53 = *(void (**)(uint64_t, char *, uint64_t))(v46 + 32);
    v53(v47, v52, v45);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v46 + 56))(v47, 0, 1, v45);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v47, 1, v45) != 1)
    {
      v54 = v72;
      v55 = ((uint64_t (*)(char *, uint64_t, uint64_t))v53)(v72, v47, v45);
      __src = Date.timeIntervalSinceReferenceDate.getter(v55);
      v56 = sub_10000A178(&__src, &v83);
      v58 = v57 & 0xFFFFFFFFFFFFFFLL;
      v59 = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)&v43);
      v79 = v43;
      sub_100009BC8(v56, v58, 0xD000000000000030, 0x8000000100010860, v59);
      v43 = v79;
      swift_bridgeObjectRelease(0x8000000000000000);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v54, v45);
      goto LABEL_29;
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56))(v47, 1, 1, v45);
  }
  sub_10000AF90(v47, &qword_100019198);
LABEL_29:
  LODWORD(v79) = 0;
  v60 = kRDPrioritySingleLocation;
  if (objc_msgSend(v44, "priorityIsAtLeast:", kRDPrioritySingleLocation)
    || (v60 = kRDPriorityNearbyCellsMCC, objc_msgSend(v44, "priorityIsAtLeast:", kRDPriorityNearbyCellsMCC))|| (v60 = kRDPriorityServingCellMCC, objc_msgSend(v44, "priorityIsAtLeast:", kRDPriorityServingCellMCC))|| (v60 = kRDPriorityWiFiAP, objc_msgSend(v44, "priorityIsAtLeast:", kRDPriorityWiFiAP)))
  {
    LODWORD(v79) = v60;
  }
  v61 = sub_10000A178(&v79, (_BYTE *)&v79 + 4);
  v63 = v62 & 0xFFFFFFFFFFFFFFLL;
  v64 = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)&v43);
  __src = v43;
  sub_100009BC8(v61, v63, 0xD00000000000002FLL, 0x80000001000107F0, v64);
  v65 = __src;
  swift_bridgeObjectRelease(0x8000000000000000);
  if (objc_msgSend(v44, "isInDisputedArea"))
  {
    v80 = objc_msgSend(v44, "isInDisputedArea");
    v66 = sub_10000A178(&v80, v81);
    v68 = v67 & 0xFFFFFFFFFFFFFFLL;
    v69 = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)&v65);
    __src = v65;
    sub_100009BC8(v66, v68, 0xD000000000000031, 0x8000000100010820, v69);
    v65 = __src;

    swift_bridgeObjectRelease(0x8000000000000000);
  }
  else
  {

  }
  return *(void **)&v65;
}

uint64_t sub_100005084(uint64_t *a1)
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

uint64_t sub_1000050C4(uint64_t a1, unint64_t a2)
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
  v2 = sub_100005084(&qword_100019380);
  if (!swift_dynamicCast(v17, &v19, &type metadata for String.UTF8View, v2, 6))
  {
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    sub_10000AF90((uint64_t)v17, &qword_100019388);
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
        v5 = _StringObject.sharedUTF8.getter();
      }
      if (v5)
        v7 = (_BYTE *)(v5 + v6);
      else
        v7 = 0;
      v8 = (_BYTE *)v5;
    }
    v9 = sub_10000A330(v8, v7);
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
    *(_QWORD *)&v17[0] = sub_10000A394(v12);
    *((_QWORD *)&v17[0] + 1) = v13;
    __chkstk_darwin(*(_QWORD *)&v17[0]);
    sub_1000094F4();
    __asm { BR              X12 }
  }
  sub_10000B03C(v17, (uint64_t)v20);
  v3 = v21;
  v4 = v22;
  sub_10000B054(v20, v21);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)(&v19, sub_1000097E4, 0, &type metadata for Data._Representation, v3, v4);
  swift_bridgeObjectRelease(a2);
  v17[0] = v19;
  sub_10000B078(v20);
  return *(_QWORD *)&v17[0];
}

uint64_t sub_1000055C8()
{
  return 0;
}

uint64_t sub_1000055D0()
{
  uint64_t v0;
  _QWORD *v1;
  _BYTE v3[24];

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient);
  swift_beginAccess(v0 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient, v3, 0, 0);
  return swift_retain(*v1);
}

uint64_t sub_100005618(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_release(v4);
}

void *sub_100005668(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_1000056AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for LSKStatusOptions(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_1000056E8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005774(&OBJC_IVAR____TtC8countryd14RDStatusSharer_options, &qword_1000191A8, a1);
}

uint64_t sub_1000056FC(uint64_t a1)
{
  return sub_1000057E4(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_options, &qword_1000191A8);
}

void *sub_100005710(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8countryd14RDStatusSharer_options, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_100005754@<X0>(uint64_t a1@<X8>)
{
  return sub_100005898(&qword_1000191B0, a1);
}

uint64_t sub_100005760@<X0>(uint64_t a1@<X8>)
{
  return sub_100005774(&OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey, &qword_1000191B8, a1);
}

uint64_t sub_100005774@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  _BYTE v8[24];

  v6 = v3 + *a1;
  swift_beginAccess(v6, v8, 0, 0);
  return sub_10000A918(v6, a3, a2);
}

uint64_t sub_1000057D0(uint64_t a1)
{
  return sub_1000057E4(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey, &qword_1000191B8);
}

uint64_t sub_1000057E4(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  _BYTE v8[24];

  v6 = v3 + *a2;
  swift_beginAccess(v6, v8, 33, 0);
  sub_10000A5A8(a1, v6, a3);
  return swift_endAccess(v8);
}

void *sub_100005848(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000588C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005898(&qword_1000191C0, a1);
}

uint64_t sub_100005898@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = sub_100005084(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 1, 1, v3);
}

uint64_t sub_1000058D0@<X0>(uint64_t a1@<X8>)
{
  return sub_100005774(&OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey, &qword_1000191C8, a1);
}

uint64_t sub_1000058E4(uint64_t a1)
{
  return sub_1000057E4(a1, &OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey, &qword_1000191C8);
}

void *sub_1000058F8(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey, a1, 33, 0);
  return &j__swift_endAccess;
}

id sub_100005940()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id sub_100005960()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void (*v3)(char *, uint64_t, uint64_t, uint64_t);
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t, uint64_t);
  id v9;
  BOOL v10;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v53;
  char *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t, uint64_t, uint64_t);
  id v59;
  void (*v60)(char *, uint64_t, uint64_t, uint64_t);
  _BYTE v61[24];
  char v62[24];
  objc_super v63;

  *(_QWORD *)&v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient] = 0;
  v1 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_options];
  v2 = type metadata accessor for LSKStatusOptions(0);
  v3 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
  v4 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey];
  v5 = sub_100005084(&qword_1000191B0);
  v60 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v60(v4, 1, 1, v5);
  v6 = &v0[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey];
  v7 = sub_100005084(&qword_1000191C0);
  v8 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  v63.receiver = v0;
  v63.super_class = (Class)type metadata accessor for RDStatusSharer(0);
  v9 = objc_msgSendSuper2(&v63, "init");
  if (&class metadata base offset for LSKLocalStatusClient)
    v10 = &type metadata accessor for LSKLocalStatusClient == 0;
  else
    v10 = 1;
  if (!v10
    && &type metadata for LSKLocalStatusClient != 0
    && &nominal type descriptor for LSKLocalStatusClient != 0
    && &metaclass for LSKLocalStatusClient != 0)
  {
    v14 = type metadata accessor for LSKLocalStatusClient(0);
    swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
    v55 = (uint64_t *)v3;
    v15 = (char *)v9;
    v16 = LSKLocalStatusClient.init()();
    v17 = (uint64_t *)&v15[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient];
    v54 = v15;
    swift_beginAccess(&v15[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusClient], v62, 1, 0);
    v18 = *v17;
    *v17 = v16;
    swift_release(v18);
    sub_100005084(&qword_1000191A8);
    v59 = v9;
    ((void (*)(void))__chkstk_darwin)();
    v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    type metadata accessor for LSKStatusOptions.Scope(0);
    ((void (*)(void))__chkstk_darwin)();
    v58 = v8;
    v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, _QWORD))(v23 + 104))(v22, enum case for LSKStatusOptions.Scope.sameAccount(_:));
    v24 = sub_100005084(&qword_1000191D0);
    v25 = type metadata accessor for LSKStatusOptions.DeviceType(0);
    v56 = v5;
    v57 = v7;
    v26 = v25;
    v27 = *(_QWORD *)(v25 - 8);
    v28 = *(unsigned __int8 *)(v27 + 80);
    v29 = (v28 + 32) & ~v28;
    v30 = swift_allocObject(v24, v29 + *(_QWORD *)(v27 + 72), v28 | 7);
    *(_OWORD *)(v30 + 16) = xmmword_1000106D0;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v27 + 104))(v30 + v29, enum case for LSKStatusOptions.DeviceType.n301(_:), v26);
    LSKStatusOptions.init(scope:publishToDeviceTypes:)(v22, v30);
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v55)(v20, 0, 1, v2);
    v31 = (uint64_t)&v15[OBJC_IVAR____TtC8countryd14RDStatusSharer_options];
    swift_beginAccess(&v15[OBJC_IVAR____TtC8countryd14RDStatusSharer_options], v61, 33, 0);
    sub_10000A5A8((uint64_t)v20, v31, &qword_1000191A8);
    swift_endAccess(v61);
    sub_100005084(&qword_1000191B8);
    v55 = &v53;
    ((void (*)(void))__chkstk_darwin)();
    v33 = (char *)&v53 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = type metadata accessor for LSKDomain(0);
    v35 = *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64);
    ((void (*)(void))__chkstk_darwin)();
    v36 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
    v37 = enum case for LSKDomain.regulatory(_:);
    v39 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 104);
    v39((char *)&v53 - v36, enum case for LSKDomain.regulatory(_:), v34);
    v40 = sub_100005084(&qword_1000191D8);
    v41 = sub_10000A6B0(&qword_1000191E0, (void (*)(void))sub_10000A66C, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
    v42 = sub_10000A6B0(&qword_1000191F0, (void (*)(void))sub_10000A724, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
    LSKKey.init(domain:name:)((char *)&v53 - v36, 0xD00000000000002DLL, 0x8000000100010920, v40, v41, v42);
    v60(v33, 0, 1, v56);
    v43 = v54;
    v44 = (uint64_t)&v54[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey];
    swift_beginAccess(&v54[OBJC_IVAR____TtC8countryd14RDStatusSharer_statusKey], v61, 33, 0);
    sub_10000A5A8((uint64_t)v33, v44, &qword_1000191B8);
    swift_endAccess(v61);
    sub_100005084(&qword_1000191C8);
    v45 = ((uint64_t (*)(void))__chkstk_darwin)();
    v47 = (char *)&v53 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
    __chkstk_darwin(v45);
    v39((char *)&v53 - v36, v37, v34);
    v48 = sub_100005084(&qword_100019200);
    v49 = sub_10000A768();
    v50 = sub_10000A7EC();
    v9 = v59;
    LSKKey.init(domain:name:)((char *)&v53 - v36, 0xD00000000000002FLL, 0x8000000100010950, v48, v49, v50);

    v58(v47, 0, 1, v57);
    v51 = (uint64_t)v43 + OBJC_IVAR____TtC8countryd14RDStatusSharer_statusesKey;
    swift_beginAccess(v51, v61, 33, 0);
    sub_10000A5A8((uint64_t)v47, v51, &qword_1000191C8);
    swift_endAccess(v61);
  }
  return v9;
}

uint64_t sub_100005F4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 104) = a1;
  *(_QWORD *)(v2 + 112) = v1;
  return swift_task_switch(sub_100005F64, 0, 0);
}

uint64_t sub_100005F64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t inited;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (&class metadata base offset for LSKLocalStatusClient)
    v3 = &type metadata accessor for LSKLocalStatusClient == 0;
  else
    v3 = 1;
  if (v3
    || &type metadata for LSKLocalStatusClient == 0
    || &nominal type descriptor for LSKLocalStatusClient == 0
    || &metaclass for LSKLocalStatusClient == 0)
  {
    v16 = static os_log_type_t.info.getter(a1, a2);
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v17 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)(v16, &_mh_execute_header, v17, "No LSK available on this platform, exiting", 42, 2, &_swiftEmptyArrayStorage);

    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  v7 = (*(uint64_t (**)(void))((swift_isaMask & **(_QWORD **)(v2 + 112)) + 0x70))();
  *(_QWORD *)(v2 + 120) = v7;
  if (!v7)
    return (*(uint64_t (**)(void))(v2 + 8))();
  v8 = v7;
  v9 = *(_QWORD **)(v2 + 112);
  v10 = sub_100005084(&qword_1000191B0);
  *(_QWORD *)(v2 + 128) = v10;
  v11 = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v2 + 136) = v11;
  v12 = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 144) = v12;
  v13 = sub_100005084(&qword_1000191B8);
  v14 = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))((swift_isaMask & *v9) + 0xA0))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v14, 1, v10) == 1)
  {
    swift_release(v8);
    sub_10000AF90(v14, &qword_1000191B8);
    v15 = v14;
LABEL_20:
    swift_task_dealloc(v15);
    swift_task_dealloc(v12);
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  v18 = *(_QWORD **)(v2 + 112);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12, v14, v10);
  swift_task_dealloc(v14);
  v19 = type metadata accessor for LSKStatusOptions(0);
  *(_QWORD *)(v2 + 152) = v19;
  v20 = *(_QWORD *)(v19 - 8);
  *(_QWORD *)(v2 + 160) = v20;
  v39 = swift_task_alloc((*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 168) = v39;
  v21 = sub_100005084(&qword_1000191A8);
  v22 = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v21 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))((swift_isaMask & *v18) + 0x88))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v22, 1, v19) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    swift_release(v8);
    sub_10000AF90(v22, &qword_1000191A8);
    swift_task_dealloc(v22);
    v15 = v39;
    goto LABEL_20;
  }
  v24 = *(_QWORD *)(v2 + 104);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v39, v22, v19);
  swift_task_dealloc(v22);
  v25 = sub_100005084(&qword_100019220);
  *(_QWORD *)(v2 + 176) = v25;
  v26 = *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64);
  *(_QWORD *)(v2 + 184) = v26;
  v27 = swift_task_alloc((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 192) = v27;
  if (v24)
  {
    v28 = *(void **)(v2 + 104);
    v29 = sub_100005084(&qword_100019288);
    inited = swift_initStackObject(v29, v2 + 16);
    *(_OWORD *)(inited + 16) = xmmword_1000106E0;
    *(_QWORD *)(inited + 32) = v28;
    v40 = inited;
    specialized Array._endMutation()();
    v31 = v28;
    v32 = (unint64_t)sub_10000498C(v40);
    swift_bridgeObjectRelease(v40);
  }
  else
  {
    v32 = sub_1000071B0((uint64_t)&_swiftEmptyArrayStorage);
  }
  *(_QWORD *)(v2 + 200) = v32;
  v33 = *(int *)(v25 + 48);
  *(_DWORD *)(v2 + 336) = v33;
  v34 = v27 + v33;
  *(_QWORD *)(v2 + 72) = v32;
  v35 = (_QWORD *)swift_task_alloc(async function pointer to LSKLocalStatusClient.publish<A>(_:for:options:)[1]);
  *(_QWORD *)(v2 + 208) = v35;
  v36 = sub_100005084(&qword_1000191D8);
  v37 = sub_10000A6B0(&qword_1000191E0, (void (*)(void))sub_10000A66C, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
  v38 = sub_10000A6B0(&qword_1000191F0, (void (*)(void))sub_10000A724, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
  sub_10000A870();
  *v35 = v2;
  v35[1] = sub_1000063C8;
  return LSKLocalStatusClient.publish<A>(_:for:options:)(v27, v34, v2 + 72, v12, v39, v36, v37, v38);
}

uint64_t sub_1000063C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v3);
  if (v0)
    v4 = sub_100007120;
  else
    v4 = sub_100006434;
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100006434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
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
  os_log_type_t type;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  void (*v61)(void);
  uint64_t v62;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = v1 + *(int *)(v0 + 336);
  v4 = (*(_QWORD *)(v0 + 184) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = sub_100005084(&qword_100019238);
  *(_QWORD *)(v0 + 224) = v5;
  v6 = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v0 + 232) = v6;
  v7 = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + 240) = v7;
  v8 = swift_task_alloc(v4);
  v9 = v8 + *(int *)(v2 + 48);
  v10 = sub_100005084(&qword_100019240);
  *(_QWORD *)(v0 + 248) = v10;
  v11 = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v0 + 256) = v11;
  v61 = *(void (**)(void))(v11 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v8, v1, v10);
  sub_10000A918(v3, v9, &qword_100019248);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5) == 1)
  {
    v12 = *(_QWORD *)(v0 + 176);
    v13 = *(_QWORD *)(v0 + 192) + *(int *)(v0 + 336);
    v14 = (*(_QWORD *)(v0 + 184) + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_10000AF90(v9, &qword_100019248);
    v58 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v58(v8, v10);
    swift_task_dealloc(v8);
    v15 = swift_task_dealloc(v7);
    v16 = static os_log_type_t.error.getter(v15);
    v17 = swift_task_alloc(v14);
    v18 = v17 + *(int *)(v12 + 48);
    v61();
    sub_10000A918(v13, v18, &qword_100019248);
    v19 = swift_task_alloc(v14);
    v60 = v17;
    sub_10000A95C(v17, v19);
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v20 = static OS_os_log.default.getter();
    v21 = os_log_type_enabled(v20, v16);
    v59 = *(_QWORD *)(v0 + 192);
    if (v21)
    {
      v22 = *(_QWORD *)(v0 + 176);
      v52 = *(_QWORD *)(v0 + 160);
      v53 = *(_QWORD *)(v0 + 152);
      v54 = *(_QWORD *)(v0 + 136);
      v55 = *(_QWORD *)(v0 + 168);
      v56 = *(_QWORD *)(v0 + 128);
      v57 = *(_QWORD *)(v0 + 144);
      v51 = *(_QWORD *)(v0 + 120);
      type = v16;
      v23 = (*(_QWORD *)(v0 + 184) + 15) & 0xFFFFFFFFFFFFFFF0;
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v49 = swift_slowAlloc(32, -1);
      v62 = v49;
      *(_DWORD *)v24 = 136315138;
      v25 = swift_task_alloc(v23);
      v26 = *(int *)(v22 + 48);
      v27 = v25 + v26;
      v28 = v19 + v26;
      v61();
      sub_10000A918(v28, v27, &qword_100019248);
      v29 = LSKPublishedStatus.debugDescription.getter(v10);
      v31 = v30;
      v58(v25, v10);
      sub_10000AF90(v27, &qword_100019248);
      swift_task_dealloc(v25);
      *(_QWORD *)(v0 + 80) = sub_100008E3C(v29, v31, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v24 + 4, v24 + 12);
      swift_bridgeObjectRelease(v31);
      sub_10000AF90(v19, &qword_100019220);
      _os_log_impl((void *)&_mh_execute_header, v20, type, "Not scanning for deliveries? %s", v24, 0xCu);
      swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v24, -1, -1);
      swift_release(v51);

      sub_10000AF90(v59, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v55, v53);
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v57, v56);
      swift_task_dealloc(v19);
      swift_task_dealloc(v60);
    }
    else
    {
      v41 = *(_QWORD *)(v0 + 160);
      v40 = *(_QWORD *)(v0 + 168);
      v43 = *(_QWORD *)(v0 + 144);
      v42 = *(_QWORD *)(v0 + 152);
      v44 = *(_QWORD *)(v0 + 128);
      v45 = *(_QWORD *)(v0 + 136);
      v46 = *(_QWORD *)(v0 + 120);

      swift_release(v46);
      sub_10000AF90(v19, &qword_100019220);
      swift_task_dealloc(v19);
      swift_task_dealloc(v60);
      sub_10000AF90(v59, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v43, v44);
    }
    v47 = *(_QWORD *)(v0 + 168);
    v48 = *(_QWORD *)(v0 + 144);
    swift_task_dealloc(*(_QWORD *)(v0 + 192));
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v7, v9, v5);
    v32 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    *(_QWORD *)(v0 + 264) = v32;
    v32(v8, v10);
    swift_task_dealloc(v8);
    v33 = sub_100005084(&qword_100019250);
    *(_QWORD *)(v0 + 272) = v33;
    v34 = *(_QWORD *)(v33 - 8);
    *(_QWORD *)(v0 + 280) = v34;
    *(_QWORD *)(v0 + 288) = swift_task_alloc((*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    LSKPublishedStatusSequence.makeAsyncIterator()(v5);
    v35 = sub_100005084(&qword_100019258);
    v36 = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v35 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)(v0 + 296) = v36;
    v37 = sub_10000A9A4();
    *(_QWORD *)(v0 + 304) = v37;
    v38 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(_QWORD *)(v0 + 312) = v38;
    *v38 = v0;
    v38[1] = sub_100006998;
    return dispatch thunk of AsyncIteratorProtocol.next()(v36, v33, v37);
  }
}

uint64_t sub_100006998()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 312));
  if (v0)
  {
    *(_QWORD *)(v2 + 320) = v0;
    v3 = sub_100006F54;
  }
  else
  {
    v3 = sub_1000069FC;
  }
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000069FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
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
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  os_log_type_t type;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;

  v1 = *(_QWORD *)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 256);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = *(_QWORD *)(v0 + 288);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 280) + 8))(v4, *(_QWORD *)(v0 + 272));
    swift_task_dealloc(v1);
    v5 = swift_task_dealloc(v4);
    LOBYTE(v4) = static os_log_type_t.info.getter(v5, v6);
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v7 = static OS_os_log.default.getter();
    type = v4;
    v8 = os_log_type_enabled(v7, (os_log_type_t)v4);
    v9 = *(_QWORD *)(v0 + 240);
    v58 = *(_QWORD *)(v0 + 232);
    v60 = *(_QWORD *)(v0 + 224);
    v10 = *(_QWORD *)(v0 + 192);
    v12 = *(_QWORD *)(v0 + 160);
    v11 = *(_QWORD *)(v0 + 168);
    v13 = *(_QWORD *)(v0 + 144);
    v14 = *(_QWORD *)(v0 + 152);
    v15 = *(_QWORD *)(v0 + 128);
    v16 = *(_QWORD *)(v0 + 136);
    v56 = *(_QWORD *)(v0 + 120);
    if (v8)
    {
      v54 = *(_QWORD *)(v0 + 144);
      v53 = *(_QWORD *)(v0 + 160);
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v48 = swift_slowAlloc(32, -1);
      v62 = v48;
      *(_DWORD *)v17 = 136315138;
      v50 = v9;
      v18 = type metadata accessor for Date(0);
      v52 = v11;
      v19 = *(_QWORD *)(v18 - 8);
      v20 = swift_task_alloc((*(_QWORD *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
      static Date.now.getter();
      v51 = v15;
      v21 = type metadata accessor for Date.ISO8601FormatStyle(0);
      v49 = v14;
      v22 = *(_QWORD *)(v21 - 8);
      v47 = v10;
      v23 = swift_task_alloc((*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
      static FormatStyle<>.iso8601.getter();
      v24 = sub_10000A9F0();
      Date.formatted<A>(_:)(v23, v21, v24);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v21);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
      swift_task_dealloc(v23);
      swift_task_dealloc(v20);
      v25 = *(_QWORD *)(v0 + 64);
      *(_QWORD *)(v0 + 96) = sub_100008E3C(*(_QWORD *)(v0 + 56), v25, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease(v25);
      _os_log_impl((void *)&_mh_execute_header, v7, type, "Deliveries completed at %s", v17, 0xCu);
      swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1, -1);
      swift_slowDealloc(v17, -1, -1);
      swift_release(v56);

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v50, v60);
      sub_10000AF90(v47, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v49);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v54, v51);
    }
    else
    {

      swift_release(v56);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v9, v60);
      sub_10000AF90(v10, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v13, v15);
    }
    swift_task_dealloc(*(_QWORD *)(v0 + 240));
    v43 = *(_QWORD *)(v0 + 168);
    v44 = *(_QWORD *)(v0 + 144);
    swift_task_dealloc(*(_QWORD *)(v0 + 192));
    swift_task_dealloc(v43);
    swift_task_dealloc(v44);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v61 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    v57 = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v57, v1, v2);
    v59 = static os_log_type_t.info.getter(v26, v27);
    v28 = sub_100005084(&qword_100019278);
    v29 = swift_allocObject(v28, 112, 7);
    *(_OWORD *)(v29 + 16) = xmmword_1000106F0;
    v30 = type metadata accessor for Date(0);
    v31 = *(_QWORD *)(v30 - 8);
    v32 = swift_task_alloc((*(_QWORD *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    static Date.now.getter();
    v33 = type metadata accessor for Date.ISO8601FormatStyle(0);
    v34 = *(_QWORD *)(v33 - 8);
    v35 = swift_task_alloc((*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    static FormatStyle<>.iso8601.getter();
    *(_QWORD *)(v29 + 56) = &type metadata for String;
    v36 = sub_10000AA38();
    *(_QWORD *)(v29 + 64) = v36;
    v37 = sub_10000A9F0();
    Date.formatted<A>(_:)(v35, v33, v37);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v30);
    swift_task_dealloc(v35);
    swift_task_dealloc(v32);
    v38 = LSKPublishedStatus.debugDescription.getter(v2);
    *(_QWORD *)(v29 + 96) = &type metadata for String;
    *(_QWORD *)(v29 + 104) = v36;
    *(_QWORD *)(v29 + 72) = v38;
    *(_QWORD *)(v29 + 80) = v39;
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v40 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v40, "Delivered at %s with status %s", v45, v46);

    swift_bridgeObjectRelease(v29);
    v61(v57, v2);
    swift_task_dealloc(v57);
    v41 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(_QWORD *)(v0 + 328) = v41;
    *v41 = v0;
    v41[1] = sub_1000070BC;
    return dispatch thunk of AsyncIteratorProtocol.next()(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 304));
  }
}

uint64_t sub_100006F54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 88) = *(_QWORD *)(v0 + 320);
  v1 = sub_100005084(&qword_100019268);
  swift_willThrowTypedImpl(v0 + 88, v1, &protocol self-conformance witness table for Error);
  return swift_task_switch(sub_100006FB4, 0, 0);
}

uint64_t sub_100006FB4()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 288);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 232);
  v5 = *(_QWORD *)(v0 + 240);
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 192);
  v8 = *(_QWORD *)(v0 + 160);
  v9 = *(_QWORD *)(v0 + 152);
  v16 = *(_QWORD *)(v0 + 144);
  v17 = *(_QWORD *)(v0 + 296);
  v13 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 168);
  v15 = *(_QWORD *)(v0 + 128);
  swift_release(*(_QWORD *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  sub_10000AF90(v7, &qword_100019220);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v14, v9);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v15);
  swift_task_dealloc(v17);
  swift_task_dealloc(v1);
  swift_task_dealloc(v5);
  v10 = *(_QWORD *)(v0 + 168);
  v11 = *(_QWORD *)(v0 + 144);
  swift_task_dealloc(*(_QWORD *)(v0 + 192));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000070BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 328));
  if (v0)
  {
    *(_QWORD *)(v2 + 320) = v0;
    v3 = sub_100006F54;
  }
  else
  {
    v3 = sub_1000069FC;
  }
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100007120()
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

  v2 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 136);
  swift_release(*(_QWORD *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = *(_QWORD *)(v0 + 168);
  v8 = *(_QWORD *)(v0 + 144);
  swift_task_dealloc(*(_QWORD *)(v0 + 192));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1000071B0(uint64_t a1)
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
  sub_100005084(&qword_100019378);
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
    sub_10000A520(v9, v10);
    result = sub_100009858(v7, v8);
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

uint64_t sub_100007404(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = dword_10001921C;
  v7 = a1;
  v8 = a3;
  v9 = (_QWORD *)swift_task_alloc(v6);
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_100007490;
  v9[13] = a1;
  v9[14] = v8;
  return swift_task_switch(sub_100005F64, 0, 0);
}

uint64_t sub_100007490()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(*v1 + 40);
  v4 = *(void **)(*v1 + 16);
  v3 = *(void **)(*v1 + 24);
  v5 = *v1;
  swift_task_dealloc(v2);

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

uint64_t sub_100007534(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = v1;
  return swift_task_switch(sub_10000754C, 0, 0);
}

uint64_t sub_10000754C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (&class metadata base offset for LSKLocalStatusClient)
    v3 = &type metadata accessor for LSKLocalStatusClient == 0;
  else
    v3 = 1;
  if (v3
    || &type metadata for LSKLocalStatusClient == 0
    || &nominal type descriptor for LSKLocalStatusClient == 0
    || &metaclass for LSKLocalStatusClient == 0)
  {
    v16 = static os_log_type_t.info.getter(a1, a2);
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v17 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)(v16, &_mh_execute_header, v17, "No LSK available on this platform, exiting", 42, 2, &_swiftEmptyArrayStorage);

    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  v7 = (*(uint64_t (**)(void))((swift_isaMask & **(_QWORD **)(v2 + 72)) + 0x70))();
  *(_QWORD *)(v2 + 80) = v7;
  if (!v7)
    return (*(uint64_t (**)(void))(v2 + 8))();
  v8 = v7;
  v9 = *(_QWORD **)(v2 + 72);
  v10 = sub_100005084(&qword_1000191B0);
  *(_QWORD *)(v2 + 88) = v10;
  v11 = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v2 + 96) = v11;
  v12 = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 104) = v12;
  v13 = sub_100005084(&qword_1000191B8);
  v14 = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))((swift_isaMask & *v9) + 0xA0))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v14, 1, v10) == 1)
  {
    swift_release(v8);
    sub_10000AF90(v14, &qword_1000191B8);
    v15 = v14;
LABEL_20:
    swift_task_dealloc(v15);
    swift_task_dealloc(v12);
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  v18 = *(_QWORD **)(v2 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12, v14, v10);
  swift_task_dealloc(v14);
  v19 = type metadata accessor for LSKStatusOptions(0);
  *(_QWORD *)(v2 + 112) = v19;
  v20 = *(_QWORD *)(v19 - 8);
  *(_QWORD *)(v2 + 120) = v20;
  v35 = swift_task_alloc((*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 128) = v35;
  v21 = sub_100005084(&qword_1000191A8);
  v22 = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v21 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))((swift_isaMask & *v18) + 0x88))();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v22, 1, v19) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    swift_release(v8);
    sub_10000AF90(v22, &qword_1000191A8);
    swift_task_dealloc(v22);
    v15 = v35;
    goto LABEL_20;
  }
  v24 = *(_QWORD *)(v2 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v35, v22, v19);
  swift_task_dealloc(v22);
  v25 = sub_100005084(&qword_100019220);
  *(_QWORD *)(v2 + 136) = v25;
  v26 = *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64);
  *(_QWORD *)(v2 + 144) = v26;
  v27 = swift_task_alloc((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 152) = v27;
  if (v24)
    v28 = (unint64_t)sub_10000498C(*(_QWORD *)(v2 + 64));
  else
    v28 = sub_1000071B0((uint64_t)&_swiftEmptyArrayStorage);
  *(_QWORD *)(v2 + 160) = v28;
  v29 = *(int *)(v25 + 48);
  *(_DWORD *)(v2 + 296) = v29;
  v30 = v27 + v29;
  *(_QWORD *)(v2 + 32) = v28;
  v31 = (_QWORD *)swift_task_alloc(async function pointer to LSKLocalStatusClient.publish<A>(_:for:options:)[1]);
  *(_QWORD *)(v2 + 168) = v31;
  v32 = sub_100005084(&qword_1000191D8);
  v33 = sub_10000A6B0(&qword_1000191E0, (void (*)(void))sub_10000A66C, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
  v34 = sub_10000A6B0(&qword_1000191F0, (void (*)(void))sub_10000A724, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
  sub_10000A870();
  *v31 = v2;
  v31[1] = sub_100007960;
  return LSKLocalStatusClient.publish<A>(_:for:options:)(v27, v30, v2 + 32, v12, v35, v32, v33, v34);
}

uint64_t sub_100007960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v3);
  if (v0)
    v4 = sub_1000086B8;
  else
    v4 = sub_1000079CC;
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000079CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
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
  os_log_type_t type;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  void (*v61)(void);
  uint64_t v62;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = v1 + *(int *)(v0 + 296);
  v4 = (*(_QWORD *)(v0 + 144) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = sub_100005084(&qword_100019238);
  *(_QWORD *)(v0 + 184) = v5;
  v6 = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v0 + 192) = v6;
  v7 = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + 200) = v7;
  v8 = swift_task_alloc(v4);
  v9 = v8 + *(int *)(v2 + 48);
  v10 = sub_100005084(&qword_100019240);
  *(_QWORD *)(v0 + 208) = v10;
  v11 = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v0 + 216) = v11;
  v61 = *(void (**)(void))(v11 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v61)(v8, v1, v10);
  sub_10000A918(v3, v9, &qword_100019248);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5) == 1)
  {
    v12 = *(_QWORD *)(v0 + 136);
    v13 = *(_QWORD *)(v0 + 152) + *(int *)(v0 + 296);
    v14 = (*(_QWORD *)(v0 + 144) + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_10000AF90(v9, &qword_100019248);
    v58 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v58(v8, v10);
    swift_task_dealloc(v8);
    v15 = swift_task_dealloc(v7);
    v16 = static os_log_type_t.error.getter(v15);
    v17 = swift_task_alloc(v14);
    v18 = v17 + *(int *)(v12 + 48);
    v61();
    sub_10000A918(v13, v18, &qword_100019248);
    v19 = swift_task_alloc(v14);
    v60 = v17;
    sub_10000A95C(v17, v19);
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v20 = static OS_os_log.default.getter();
    v21 = os_log_type_enabled(v20, v16);
    v59 = *(_QWORD *)(v0 + 152);
    if (v21)
    {
      v22 = *(_QWORD *)(v0 + 136);
      v52 = *(_QWORD *)(v0 + 120);
      v53 = *(_QWORD *)(v0 + 112);
      v54 = *(_QWORD *)(v0 + 96);
      v55 = *(_QWORD *)(v0 + 128);
      v56 = *(_QWORD *)(v0 + 88);
      v57 = *(_QWORD *)(v0 + 104);
      v51 = *(_QWORD *)(v0 + 80);
      type = v16;
      v23 = (*(_QWORD *)(v0 + 144) + 15) & 0xFFFFFFFFFFFFFFF0;
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v49 = swift_slowAlloc(32, -1);
      v62 = v49;
      *(_DWORD *)v24 = 136315138;
      v25 = swift_task_alloc(v23);
      v26 = *(int *)(v22 + 48);
      v27 = v25 + v26;
      v28 = v19 + v26;
      v61();
      sub_10000A918(v28, v27, &qword_100019248);
      v29 = LSKPublishedStatus.debugDescription.getter(v10);
      v31 = v30;
      v58(v25, v10);
      sub_10000AF90(v27, &qword_100019248);
      swift_task_dealloc(v25);
      *(_QWORD *)(v0 + 40) = sub_100008E3C(v29, v31, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v24 + 4, v24 + 12);
      swift_bridgeObjectRelease(v31);
      sub_10000AF90(v19, &qword_100019220);
      _os_log_impl((void *)&_mh_execute_header, v20, type, "Not scanning for deliveries? %s", v24, 0xCu);
      swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1, -1);
      swift_slowDealloc(v24, -1, -1);
      swift_release(v51);

      sub_10000AF90(v59, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v55, v53);
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v57, v56);
      swift_task_dealloc(v19);
      swift_task_dealloc(v60);
    }
    else
    {
      v41 = *(_QWORD *)(v0 + 120);
      v40 = *(_QWORD *)(v0 + 128);
      v43 = *(_QWORD *)(v0 + 104);
      v42 = *(_QWORD *)(v0 + 112);
      v44 = *(_QWORD *)(v0 + 88);
      v45 = *(_QWORD *)(v0 + 96);
      v46 = *(_QWORD *)(v0 + 80);

      swift_release(v46);
      sub_10000AF90(v19, &qword_100019220);
      swift_task_dealloc(v19);
      swift_task_dealloc(v60);
      sub_10000AF90(v59, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v43, v44);
    }
    v47 = *(_QWORD *)(v0 + 128);
    v48 = *(_QWORD *)(v0 + 104);
    swift_task_dealloc(*(_QWORD *)(v0 + 152));
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v7, v9, v5);
    v32 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    *(_QWORD *)(v0 + 224) = v32;
    v32(v8, v10);
    swift_task_dealloc(v8);
    v33 = sub_100005084(&qword_100019250);
    *(_QWORD *)(v0 + 232) = v33;
    v34 = *(_QWORD *)(v33 - 8);
    *(_QWORD *)(v0 + 240) = v34;
    *(_QWORD *)(v0 + 248) = swift_task_alloc((*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    LSKPublishedStatusSequence.makeAsyncIterator()(v5);
    v35 = sub_100005084(&qword_100019258);
    v36 = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v35 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)(v0 + 256) = v36;
    v37 = sub_10000A9A4();
    *(_QWORD *)(v0 + 264) = v37;
    v38 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(_QWORD *)(v0 + 272) = v38;
    *v38 = v0;
    v38[1] = sub_100007F30;
    return dispatch thunk of AsyncIteratorProtocol.next()(v36, v33, v37);
  }
}

uint64_t sub_100007F30()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 272));
  if (v0)
  {
    *(_QWORD *)(v2 + 280) = v0;
    v3 = sub_1000084EC;
  }
  else
  {
    v3 = sub_100007F94;
  }
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100007F94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
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
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  os_log_type_t type;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;

  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = *(_QWORD *)(v0 + 248);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(v4, *(_QWORD *)(v0 + 232));
    swift_task_dealloc(v1);
    v5 = swift_task_dealloc(v4);
    LOBYTE(v4) = static os_log_type_t.info.getter(v5, v6);
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v7 = static OS_os_log.default.getter();
    type = v4;
    v8 = os_log_type_enabled(v7, (os_log_type_t)v4);
    v9 = *(_QWORD *)(v0 + 200);
    v58 = *(_QWORD *)(v0 + 192);
    v60 = *(_QWORD *)(v0 + 184);
    v10 = *(_QWORD *)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 120);
    v11 = *(_QWORD *)(v0 + 128);
    v13 = *(_QWORD *)(v0 + 104);
    v14 = *(_QWORD *)(v0 + 112);
    v15 = *(_QWORD *)(v0 + 88);
    v16 = *(_QWORD *)(v0 + 96);
    v56 = *(_QWORD *)(v0 + 80);
    if (v8)
    {
      v54 = *(_QWORD *)(v0 + 104);
      v53 = *(_QWORD *)(v0 + 120);
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v48 = swift_slowAlloc(32, -1);
      v62 = v48;
      *(_DWORD *)v17 = 136315138;
      v50 = v9;
      v18 = type metadata accessor for Date(0);
      v52 = v11;
      v19 = *(_QWORD *)(v18 - 8);
      v20 = swift_task_alloc((*(_QWORD *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
      static Date.now.getter();
      v51 = v15;
      v21 = type metadata accessor for Date.ISO8601FormatStyle(0);
      v49 = v14;
      v22 = *(_QWORD *)(v21 - 8);
      v47 = v10;
      v23 = swift_task_alloc((*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
      static FormatStyle<>.iso8601.getter();
      v24 = sub_10000A9F0();
      Date.formatted<A>(_:)(v23, v21, v24);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v21);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
      swift_task_dealloc(v23);
      swift_task_dealloc(v20);
      v25 = *(_QWORD *)(v0 + 24);
      *(_QWORD *)(v0 + 56) = sub_100008E3C(*(_QWORD *)(v0 + 16), v25, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease(v25);
      _os_log_impl((void *)&_mh_execute_header, v7, type, "Deliveries completed at %s", v17, 0xCu);
      swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1, -1);
      swift_slowDealloc(v17, -1, -1);
      swift_release(v56);

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v50, v60);
      sub_10000AF90(v47, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v49);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v54, v51);
    }
    else
    {

      swift_release(v56);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v9, v60);
      sub_10000AF90(v10, &qword_100019220);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v13, v15);
    }
    swift_task_dealloc(*(_QWORD *)(v0 + 200));
    v43 = *(_QWORD *)(v0 + 128);
    v44 = *(_QWORD *)(v0 + 104);
    swift_task_dealloc(*(_QWORD *)(v0 + 152));
    swift_task_dealloc(v43);
    swift_task_dealloc(v44);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v61 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
    v57 = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v57, v1, v2);
    v59 = static os_log_type_t.info.getter(v26, v27);
    v28 = sub_100005084(&qword_100019278);
    v29 = swift_allocObject(v28, 112, 7);
    *(_OWORD *)(v29 + 16) = xmmword_1000106F0;
    v30 = type metadata accessor for Date(0);
    v31 = *(_QWORD *)(v30 - 8);
    v32 = swift_task_alloc((*(_QWORD *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    static Date.now.getter();
    v33 = type metadata accessor for Date.ISO8601FormatStyle(0);
    v34 = *(_QWORD *)(v33 - 8);
    v35 = swift_task_alloc((*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    static FormatStyle<>.iso8601.getter();
    *(_QWORD *)(v29 + 56) = &type metadata for String;
    v36 = sub_10000AA38();
    *(_QWORD *)(v29 + 64) = v36;
    v37 = sub_10000A9F0();
    Date.formatted<A>(_:)(v35, v33, v37);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v30);
    swift_task_dealloc(v35);
    swift_task_dealloc(v32);
    v38 = LSKPublishedStatus.debugDescription.getter(v2);
    *(_QWORD *)(v29 + 96) = &type metadata for String;
    *(_QWORD *)(v29 + 104) = v36;
    *(_QWORD *)(v29 + 72) = v38;
    *(_QWORD *)(v29 + 80) = v39;
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v40 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)(v59, &_mh_execute_header, v40, "Delivered at %s with status %s", v45, v46);

    swift_bridgeObjectRelease(v29);
    v61(v57, v2);
    swift_task_dealloc(v57);
    v41 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(_QWORD *)(v0 + 288) = v41;
    *v41 = v0;
    v41[1] = sub_100008654;
    return dispatch thunk of AsyncIteratorProtocol.next()(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 264));
  }
}

uint64_t sub_1000084EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v0 + 280);
  v1 = sub_100005084(&qword_100019268);
  swift_willThrowTypedImpl(v0 + 48, v1, &protocol self-conformance witness table for Error);
  return swift_task_switch(sub_10000854C, 0, 0);
}

uint64_t sub_10000854C()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 240);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 152);
  v8 = *(_QWORD *)(v0 + 120);
  v9 = *(_QWORD *)(v0 + 112);
  v16 = *(_QWORD *)(v0 + 104);
  v17 = *(_QWORD *)(v0 + 256);
  v13 = *(_QWORD *)(v0 + 96);
  v14 = *(_QWORD *)(v0 + 128);
  v15 = *(_QWORD *)(v0 + 88);
  swift_release(*(_QWORD *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  sub_10000AF90(v7, &qword_100019220);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v14, v9);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v15);
  swift_task_dealloc(v17);
  swift_task_dealloc(v1);
  swift_task_dealloc(v5);
  v10 = *(_QWORD *)(v0 + 128);
  v11 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008654()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 288));
  if (v0)
  {
    *(_QWORD *)(v2 + 280) = v0;
    v3 = sub_1000084EC;
  }
  else
  {
    v3 = sub_100007F94;
  }
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000086B8()
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

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008878(uint64_t a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  if (a1)
  {
    v6 = sub_10000AE40(0, &qword_100019348, RDEstimate_ptr);
    a1 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a1, v6);
  }
  v3[4] = a1;
  v7 = dword_100019294;
  v8 = a3;
  v9 = (_QWORD *)swift_task_alloc(v7);
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_100008930;
  v9[8] = a1;
  v9[9] = v8;
  return swift_task_switch(sub_10000754C, 0, 0);
}

uint64_t sub_100008930()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)(*v1 + 32);
  v2 = *(_QWORD *)(*v1 + 40);
  v4 = *(void **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc(v2);

  swift_bridgeObjectRelease(v3);
  v6 = *(_QWORD *)(v5 + 24);
  if (v0)
  {
    v7 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(v5 + 24), 0);
  }
  _Block_release(*(const void **)(v5 + 24));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

id sub_1000089D8()
{
  return sub_1000089E8(0, (uint64_t (*)(void))type metadata accessor for RDStatusSharer);
}

id sub_1000089E8(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_100008A8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_10000B0B4;
  return v6();
}

uint64_t sub_100008AE0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_10000B0B4;
  return v7();
}

uint64_t sub_100008B34(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000AF90(a1, &qword_100019300);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_1000148D8, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100019340, v17);
}

uint64_t sub_100008C80(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100008CE4;
  return v6(a1);
}

uint64_t sub_100008CE4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_100008D30(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100005084(&qword_100019390);
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
    sub_10000A430(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008E3C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100008F0C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000AF50((uint64_t)v12, *a3);
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
      sub_10000AF50((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000B078(v12);
  return v7;
}

uint64_t sub_100008F0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000090C4(a5, a6);
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

uint64_t sub_1000090C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100009158(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_1000093A8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000093A8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100009158(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000092CC(v4, 0);
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

_QWORD *sub_1000092CC(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005084(&qword_100019370);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100009330(unint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_1000093A8(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005084(&qword_100019370);
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

void sub_1000094F4()
{
  __asm { BR              X11 }
}

_QWORD *sub_100009554@<X0>(uint64_t a1@<X8>)
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

_BYTE *sub_1000097E4@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)sub_10000A178(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_10000A238((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_10000A2B0((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

unint64_t sub_100009858(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100009D3C(a1, a2, v5);
}

Swift::Int sub_1000098BC(uint64_t a1, uint64_t a2)
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
  sub_100005084(&qword_100019378);
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
        sub_10000A520(v39, *((unint64_t *)&v39 + 1));
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

uint64_t sub_100009BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
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
  v14 = sub_100009858(a3, a4);
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
    sub_100009E1C();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7] + 16 * v14;
      result = sub_10000A564(*(_QWORD *)v21, *(_QWORD *)(v21 + 8));
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
  sub_1000098BC(v17, a5 & 1);
  v23 = sub_100009858(a3, a4);
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

unint64_t sub_100009D3C(uint64_t a1, uint64_t a2, uint64_t a3)
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

void *sub_100009E1C()
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
  sub_100005084(&qword_100019378);
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
    result = (void *)sub_10000A520(v24, *((unint64_t *)&v24 + 1));
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

_QWORD *sub_100009FE0(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
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

char *sub_10000A044(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
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

uint64_t sub_10000A0F0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
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

uint64_t sub_10000A178(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_10000A238(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000A2B0(uint64_t a1, uint64_t a2)
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

_BYTE *sub_10000A330(_BYTE *result, _BYTE *a2)
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
      return (_BYTE *)sub_10000A178(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_10000A238((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_10000A2B0((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_10000A394(uint64_t result)
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

uint64_t sub_10000A430(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10000A520(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A564(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A5A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005084(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for RDStatusSharer(uint64_t a1)
{
  uint64_t result;

  result = qword_100019610;
  if (!qword_100019610)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RDStatusSharer);
  return result;
}

uint64_t sub_10000A628(uint64_t *a1)
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

unint64_t sub_10000A66C()
{
  unint64_t result;

  result = qword_1000191E8;
  if (!qword_1000191E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1000191E8);
  }
  return result;
}

uint64_t sub_10000A6B0(unint64_t *a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000A628(&qword_1000191D8);
    a2();
    result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A724()
{
  unint64_t result;

  result = qword_1000191F8;
  if (!qword_1000191F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1000191F8);
  }
  return result;
}

unint64_t sub_10000A768()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019208;
  if (!qword_100019208)
  {
    v1 = sub_10000A628(&qword_100019200);
    sub_10000A6B0(&qword_1000191E0, (void (*)(void))sub_10000A66C, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100019208);
  }
  return result;
}

unint64_t sub_10000A7EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019210;
  if (!qword_100019210)
  {
    v1 = sub_10000A628(&qword_100019200);
    sub_10000A6B0(&qword_1000191F0, (void (*)(void))sub_10000A724, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100019210);
  }
  return result;
}

unint64_t sub_10000A870()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019228;
  if (!qword_100019228)
  {
    v1 = sub_10000A628(&qword_1000191D8);
    sub_10000A8D4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_100019228);
  }
  return result;
}

unint64_t sub_10000A8D4()
{
  unint64_t result;

  result = qword_100019230;
  if (!qword_100019230)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100019230);
  }
  return result;
}

uint64_t sub_10000A918(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005084(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000A95C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005084(&qword_100019220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000A9A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019260;
  if (!qword_100019260)
  {
    v1 = sub_10000A628(&qword_100019250);
    result = swift_getWitnessTable(&protocol conformance descriptor for LSKPublishedStatusSequence<A, B>.AsyncIterator, v1);
    atomic_store(result, (unint64_t *)&qword_100019260);
  }
  return result;
}

unint64_t sub_10000A9F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019270;
  if (!qword_100019270)
  {
    v1 = type metadata accessor for Date.ISO8601FormatStyle(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Date.ISO8601FormatStyle, v1);
    atomic_store(result, (unint64_t *)&qword_100019270);
  }
  return result;
}

unint64_t sub_10000AA38()
{
  unint64_t result;

  result = qword_100019280;
  if (!qword_100019280)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100019280);
  }
  return result;
}

uint64_t sub_10000AA7C()
{
  return type metadata accessor for RDStatusSharer(0);
}

void sub_10000AA84(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[4];

  v8[0] = "\b";
  sub_10000AB50(319);
  if (v3 <= 0x3F)
  {
    v8[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000ABA4(319, &qword_1000192F0, &qword_1000191B0);
    if (v5 <= 0x3F)
    {
      v8[2] = *(_QWORD *)(v4 - 8) + 64;
      sub_10000ABA4(319, &qword_1000192F8, &qword_1000191C0);
      if (v7 <= 0x3F)
      {
        v8[3] = *(_QWORD *)(v6 - 8) + 64;
        swift_updateClassMetadata2(a1, 256, 4, v8, a1 + 80);
      }
    }
  }
}

void sub_10000AB50(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000192E8)
  {
    v2 = type metadata accessor for LSKStatusOptions(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000192E8);
  }
}

void sub_10000ABA4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = sub_10000A628(a3);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_10000ABF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10001930C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10000B0B4;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100019308 + dword_100019308))(v2, v3, v4);
}

uint64_t sub_10000AC64()
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
  v5 = (_QWORD *)swift_task_alloc(dword_10001931C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10000B0B4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100019318 + dword_100019318))(v2, v3, v4);
}

uint64_t sub_10000ACE0(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10001932C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B0B4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100019328 + dword_100019328))(a1, v4, v5, v6);
}

uint64_t sub_10000AD64()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AD88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10001933C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000ADF8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100019338 + dword_100019338))(a1, v4);
}

uint64_t sub_10000ADF8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000AE40(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000AE7C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000AEB0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100019354);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10000ADF8;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100019350 + dword_100019350))(v2, v3, v4);
}

uint64_t sub_10000AF24()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000AF50(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000AF90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005084(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *sub_10000AFCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
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
  result = sub_100009FE0((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_10000B098, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_10000B028(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000A564(result, a2);
  return result;
}

uint64_t sub_10000B03C(__int128 *a1, uint64_t a2)
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

_QWORD *sub_10000B054(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000B078(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000B098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_10000A0F0(a1, a2, *(uint64_t **)(v3 + 16), a3);
}

void start()
{
  NSObject *v0;
  void *v1;
  RDCommServer *v2;
  void *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_100019398 != -1)
    dispatch_once(&qword_100019398, &stru_1000149C8);
  v0 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Starting countryd\"}", (uint8_t *)v4, 0x12u);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100014988);
  v1 = objc_autoreleasePoolPush();
  v2 = objc_alloc_init(RDCommServer);
  v3 = (void *)qword_100019620;
  qword_100019620 = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
  dispatch_main();
}

void sub_10000B1B8(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  const char *string;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    if (qword_100019398 != -1)
      dispatch_once(&qword_100019398, &stru_1000149C8);
    v4 = qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 68289282;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = string;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Got Darwin notification\", \"notification\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
    }
    if (!strcmp("com.apple.os-eligibility-domain.input-needed", string))
    {
      if (qword_100019398 != -1)
        dispatch_once(&qword_100019398, &stru_1000149C8);
      v5 = qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 68289026;
        v8 = 0;
        v9 = 2082;
        v10 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"eligibility engine wants input\"}", (uint8_t *)&v7, 0x12u);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RDCachedData loadCache](RDCachedData, "loadCache"));
      objc_msgSend(v6, "postResultsToEligibilityEngine");

    }
  }

}

void sub_10000B378(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000B3A0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.countryd", "Daemon");
  v2 = (void *)qword_1000193A0;
  qword_1000193A0 = (uint64_t)v1;

}

uint64_t sub_10000BB68()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  unsigned int v17;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "valueForEntitlement:", CFSTR("com.apple.countryd.contribute")));
  if (v1
    && (v2 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)
    && (objc_msgSend(v1, "BOOLValue") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v4 = (void *)qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
    {
      v5 = v4;
      v10 = 68289538;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "com.apple.countryd.contribute";
      v16 = 1026;
      v17 = objc_msgSend(v0, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"peer process is missing entitlement to contribute data\", \"entitlement\":%{public, location:escape_only}s, \"process\":%{public}d}", (uint8_t *)&v10, 0x22u);

      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
    }
    v6 = (void *)qword_1000193B0;
    if (os_signpost_enabled((os_log_t)qword_1000193B0))
    {
      v7 = v6;
      v8 = objc_msgSend(v0, "processIdentifier");
      v10 = 68289538;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = "com.apple.countryd.contribute";
      v16 = 1026;
      v17 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "peer process is missing entitlement to contribute data", "{\"msg%{public}.0s\":\"peer process is missing entitlement to contribute data\", \"entitlement\":%{public, location:escape_only}s, \"process\":%{public}d}", (uint8_t *)&v10, 0x22u);

    }
    v3 = 0;
  }

  return v3;
}

id sub_10000BD9C()
{
  id v0;
  id v1;

  v0 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.RegulatoryDomain"));
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("UpdatesLocked"));

  return v1;
}

void sub_10000D09C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  id v20;
  int v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dataCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getEstimateForPeerDeviceWithID:", *(_QWORD *)(a1 + 48)));
  v5 = v4;
  if (v2)
  {
    v6 = *(void **)(a1 + 32);

    if (v5 != v6)
    {
      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
      v7 = (void *)qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
      {
        v8 = objc_retainAutorelease(*(id *)(a1 + 48));
        v9 = v7;
        v10 = objc_msgSend(v8, "UTF8String");
        v11 = *(_QWORD *)(a1 + 32);
        v21 = 68289538;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2082;
        v26 = v10;
        v27 = 2114;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"updating estimate for peer\", \"peer\":%{public, location:escape_only}s, \"estimate\":%{public, location:escape_only}@}", (uint8_t *)&v21, 0x26u);

      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dataCache"));
      -[NSObject setEstimate:forPeerDeviceWithID:](v12, "setEstimate:forPeerDeviceWithID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      goto LABEL_23;
    }
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v16 = (void *)qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
    {
      v17 = objc_retainAutorelease(*(id *)(a1 + 48));
      v12 = v16;
      v21 = 68289282;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = objc_msgSend(v17, "UTF8String");
      v18 = "{\"msg%{public}.0s\":\"estimate for peer unchanged, ignoring\", \"peer\":%{public, location:escape_only}s}";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0x1Cu);
LABEL_23:

    }
  }
  else
  {

    if (v5)
    {
      if (qword_1000193A8 != -1)
        dispatch_once(&qword_1000193A8, &stru_100014A70);
      v13 = (void *)qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
      {
        v14 = objc_retainAutorelease(*(id *)(a1 + 48));
        v15 = v13;
        v21 = 68289282;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2082;
        v26 = objc_msgSend(v14, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"peer went away\", \"peer\":%{public, location:escape_only}s}", (uint8_t *)&v21, 0x1Cu);

      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dataCache"));
      -[NSObject removeEstimateForPeerDeviceWithID:](v12, "removeEstimateForPeerDeviceWithID:", *(_QWORD *)(a1 + 48));
      goto LABEL_23;
    }
    if (qword_1000193A8 != -1)
      dispatch_once(&qword_1000193A8, &stru_100014A70);
    v19 = (void *)qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
    {
      v20 = objc_retainAutorelease(*(id *)(a1 + 48));
      v12 = v19;
      v21 = 68289282;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2082;
      v26 = objc_msgSend(v20, "UTF8String");
      v18 = "{\"msg%{public}.0s\":\"peer already not used, nothing to do\", \"peer\":%{public, location:escape_only}s}";
      goto LABEL_22;
    }
  }
}

void sub_10000D4CC(id a1, NSError *a2)
{
  NSError *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v2 = a2;
  if (v2)
  {
    if (qword_100019398 != -1)
      dispatch_once(&qword_100019398, &stru_100014AB0);
    v3 = (void *)qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description"));
      v9 = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2114;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"failed to share status with peers\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);

      if (qword_100019398 != -1)
        dispatch_once(&qword_100019398, &stru_100014AB0);
    }
    v6 = (void *)qword_1000193A0;
    if (os_signpost_enabled((os_log_t)qword_1000193A0))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description"));
      v9 = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2114;
      v14 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to share status with peers", "{\"msg%{public}.0s\":\"failed to share status with peers\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);

    }
  }

}

void sub_10000D6DC(id a1, NSError *a2)
{
  NSError *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v2 = a2;
  if (v2)
  {
    if (qword_100019398 != -1)
      dispatch_once(&qword_100019398, &stru_100014AB0);
    v3 = (void *)qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description"));
      v9 = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2114;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"failed to clear status to peers\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);

      if (qword_100019398 != -1)
        dispatch_once(&qword_100019398, &stru_100014AB0);
    }
    v6 = (void *)qword_1000193A0;
    if (os_signpost_enabled((os_log_t)qword_1000193A0))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](v2, "description"));
      v9 = 68289282;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2114;
      v14 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to clear status to peers", "{\"msg%{public}.0s\":\"failed to clear status to peers\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);

    }
  }

}

void sub_10000E380(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.countryd", "Shared");
  v2 = (void *)qword_1000193B0;
  qword_1000193B0 = (uint64_t)v1;

}

void sub_10000E3B0(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.countryd.serialqueue", v4);
  v3 = (void *)qword_100019628;
  qword_100019628 = (uint64_t)v2;

}

void sub_10000E400(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.countryd", "Daemon");
  v2 = (void *)qword_1000193A0;
  qword_1000193A0 = (uint64_t)v1;

}

void sub_10000F3C0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.countryd", "Daemon");
  v2 = (void *)qword_1000193A0;
  qword_1000193A0 = (uint64_t)v1;

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_BOOLValueSafe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValueSafe");
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cache");
}

id objc_msgSend_clearStatusSharedWithPeers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStatusSharedWithPeers");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_createNewDataCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNewDataCache");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_dataCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataCache");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getCacheDirPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCacheDirPath");
}

id objc_msgSend_getCachePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCachePath");
}

id objc_msgSend_getEstimateForPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEstimateForPeerDeviceWithID:");
}

id objc_msgSend_getLocalOnlyEstimates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocalOnlyEstimates");
}

id objc_msgSend_hasLocalStatusKit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasLocalStatusKit");
}

id objc_msgSend_initWithCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCache:");
}

id objc_msgSend_initWithCountryCode_andDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCountryCode:andDate:");
}

id objc_msgSend_initWithCountryCode_priority_timestamp_inDisputedArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCountryCode:priority:timestamp:inDisputedArea:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_lastShareDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastShareDate");
}

id objc_msgSend_loadCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadCache");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedFailureReason");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_postResultsToEligibilityEngine(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postResultsToEligibilityEngine");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_recompute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recompute");
}

id objc_msgSend_removeEstimateForPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEstimateForPeerDeviceWithID:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCountriesFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromLocation:");
}

id objc_msgSend_setCountriesFromLocation_isInDisputedArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromLocation:isInDisputedArea:");
}

id objc_msgSend_setCountriesFromNearbyCells_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromNearbyCells:");
}

id objc_msgSend_setCountriesFromServingCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromServingCell:");
}

id objc_msgSend_setCountriesFromWiFiAPs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountriesFromWiFiAPs:");
}

id objc_msgSend_setCountryFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountryFromLocation:");
}

id objc_msgSend_setCountryFromMCC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountryFromMCC:");
}

id objc_msgSend_setCountryFromWiFiAPs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountryFromWiFiAPs:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEstimate_forPeerDeviceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimate:forPeerDeviceWithID:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_shareStatusWithEstimate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareStatusWithEstimate:completionHandler:");
}

id objc_msgSend_shareStatusesWithEstimates_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareStatusesWithEstimates:completionHandler:");
}

id objc_msgSend_sharedCountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedCountryCode");
}

id objc_msgSend_sharer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharer");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_updatePeer_withEstimate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePeer:withEstimate:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

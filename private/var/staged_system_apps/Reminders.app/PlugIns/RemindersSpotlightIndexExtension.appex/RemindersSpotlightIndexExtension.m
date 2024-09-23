uint64_t sub_100003C58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100006A68(v0, qword_10000C268);
  v1 = sub_100006944(v0, (uint64_t)qword_10000C268);
  if (qword_10000C280 != -1)
    swift_once(&qword_10000C280, sub_100006C74);
  v2 = sub_100006944(v0, (uint64_t)qword_10000C320);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100003CEC(uint64_t a1, void *a2)
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

uint64_t sub_100003D3C(uint64_t a1)
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

void sub_100003DDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];
  _BYTE v11[8];

  v2 = static os_log_type_t.error.getter();
  v3 = sub_10000695C(&qword_10000C2E8);
  v4 = swift_allocObject(v3, 72, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100007240;
  swift_getErrorValue(a1, v11, v10);
  v5 = Error.localizedDescription.getter(v10[1], v10[2]);
  v7 = v6;
  *(_QWORD *)(v4 + 56) = &type metadata for String;
  *(_QWORD *)(v4 + 64) = sub_100006C10();
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v7;
  v8 = sub_100006BC0(0, &qword_10000C310, OS_os_log_ptr);
  v9 = (void *)static OS_os_log.default.getter(v8);
  os_log(_:dso:log:type:_:)("Error talking to daemon: %@", 27, 2, &_mh_execute_header, v9, v2, v4);
  swift_bridgeObjectRelease(v4);

}

id sub_1000040B4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRISIEIndexRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRISIEIndexRequestHandler()
{
  return objc_opt_self(_TtC32RemindersSpotlightIndexExtension26TTRISIEIndexRequestHandler);
}

uint64_t sub_100004104(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000041D4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006A28((uint64_t)v12, *a3);
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
      sub_100006A28((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006A08(v12);
  return v7;
}

uint64_t sub_1000041D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000438C(a5, a6);
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

uint64_t sub_10000438C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100004420(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000045F8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000045F8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100004420(uint64_t a1, unint64_t a2)
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
      v5 = sub_100004594(v4, 0);
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

_QWORD *sub_100004594(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000695C(&qword_10000C2E0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000045F8(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000695C(&qword_10000C2E0);
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

uint64_t sub_100004744(void *a1, void (**a2)(_QWORD))
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSString v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void **v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t (*v21)();
  uint64_t v22;

  v4 = swift_allocObject(&unk_1000085F8, 24, 7);
  *(_QWORD *)(v4 + 16) = a2;
  v5 = _Block_copy(a2);
  v6 = static os_log_type_t.info.getter(v5);
  v7 = sub_10000695C(&qword_10000C2E8);
  v8 = swift_allocObject(v7, 72, 7);
  *(_OWORD *)(v8 + 16) = xmmword_100007240;
  *(_QWORD *)(v8 + 56) = sub_100006BC0(0, &qword_10000C2F0, CSSearchableIndex_ptr);
  *(_QWORD *)(v8 + 64) = sub_100006AD8();
  *(_QWORD *)(v8 + 32) = a1;
  sub_100006BC0(0, &qword_10000C310, OS_os_log_ptr);
  v9 = (void *)static OS_os_log.default.getter(a1);
  os_log(_:dso:log:type:_:)("Reindex all items; index = %@", 29, 2, &_mh_execute_header, v9, v6, v8);
  swift_bridgeObjectRelease(v8);

  v10 = objc_msgSend((id)objc_opt_self(REMXPCDaemonController), "weakSharedInstance");
  v11 = String._bridgeToObjectiveC()();
  v21 = sub_100003CE8;
  v22 = 0;
  v17 = _NSConcreteStackBlock;
  v18 = 1107296256;
  v19 = sub_100003CEC;
  v20 = &unk_100008610;
  v12 = _Block_copy(&v17);
  v13 = objc_msgSend(v10, "syncIndexingPerformerWithReason:errorHandler:", v11, v12);
  _Block_release(v12);

  if (v13)
  {
    v21 = sub_100006C54;
    v22 = v4;
    v17 = _NSConcreteStackBlock;
    v18 = 1107296256;
    v19 = sub_100003D3C;
    v20 = &unk_100008638;
    v14 = _Block_copy(&v17);
    v15 = v22;
    swift_retain(v4);
    swift_release(v15);
    objc_msgSend(v13, "reindexAllSearchableItemsWithAcknowledgementHandler:", v14);
    _Block_release(v14);
    swift_release(v4);
    return swift_unknownObjectRelease(v13);
  }
  else
  {
    a2[2](a2);
    return swift_release(v4);
  }
}

void sub_1000049B4(void *a1, uint64_t a2, void (**a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSString v14;
  void *v15;
  id v16;
  Class isa;
  void *v18;
  uint64_t v19;
  void **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t (*v24)();
  uint64_t v25;

  v6 = swift_allocObject(&unk_100008580, 24, 7);
  *(_QWORD *)(v6 + 16) = a3;
  v7 = sub_10000695C(&qword_10000C2E8);
  v8 = swift_allocObject(v7, 112, 7);
  *(_OWORD *)(v8 + 16) = xmmword_100007250;
  *(_QWORD *)(v8 + 56) = sub_100006BC0(0, &qword_10000C2F0, CSSearchableIndex_ptr);
  *(_QWORD *)(v8 + 64) = sub_100006AD8();
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 96) = sub_10000695C(&qword_10000C300);
  *(_QWORD *)(v8 + 104) = sub_100006B30();
  *(_QWORD *)(v8 + 72) = a2;
  sub_100006BC0(0, &qword_10000C310, OS_os_log_ptr);
  _Block_copy(a3);
  v9 = a1;
  v10 = swift_bridgeObjectRetain(a2);
  v11 = (void *)static OS_os_log.default.getter(v10);
  v12 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Reindex specific items; index = %@; item identifiers = %@",
    57,
    2,
    &_mh_execute_header,
    v11,
    v12,
    v8);
  swift_bridgeObjectRelease(v8);

  v13 = objc_msgSend((id)objc_opt_self(REMXPCDaemonController), "weakSharedInstance");
  v14 = String._bridgeToObjectiveC()();
  v24 = sub_100003CE8;
  v25 = 0;
  v20 = _NSConcreteStackBlock;
  v21 = 1107296256;
  v22 = sub_100003CEC;
  v23 = &unk_100008598;
  v15 = _Block_copy(&v20);
  v16 = objc_msgSend(v13, "syncIndexingPerformerWithReason:errorHandler:", v14, v15);
  _Block_release(v15);

  if (v16)
  {
    isa = Array._bridgeToObjectiveC()().super.isa;
    v24 = sub_100006ACC;
    v25 = v6;
    v20 = _NSConcreteStackBlock;
    v21 = 1107296256;
    v22 = sub_100003D3C;
    v23 = &unk_1000085C0;
    v18 = _Block_copy(&v20);
    v19 = v25;
    swift_retain(v6);
    swift_release(v19);
    objc_msgSend(v16, "reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", isa, v18);
    _Block_release(v18);
    swift_release(v6);
    swift_unknownObjectRelease(v16);

  }
  else
  {
    a3[2](a3);
    swift_release(v6);
  }
}

uint64_t sub_100004C64(uint64_t a1, void *a2)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, _QWORD *);
  NSObject *v37;
  uint64_t v38;
  char *v39;
  Class v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  void *v52;
  int v53;
  id v54;
  void *v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  NSString v60;
  uint64_t result;
  NSObject *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  _QWORD *v68;
  unint64_t v69;
  void (*v70)(char *, _QWORD *);
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  NSString v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint64_t v82;
  uint64_t *v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  id v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint64_t v98;
  uint64_t *v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t v104;
  _QWORD *v105;
  id v106;
  char *v107;
  id v108;
  id v109;
  char *v110;
  char *v111;
  Class isa;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  id v121;

  v117 = a2;
  v119 = a1;
  v115 = (_QWORD *)type metadata accessor for REMSearchableItemType(0);
  v113 = *(v115 - 1);
  ((void (*)(void))__chkstk_darwin)();
  v110 = (char *)&v107 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = type metadata accessor for Logger(0);
  isa = v116[-1].isa;
  ((void (*)(void))__chkstk_darwin)();
  v111 = (char *)&v107 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = sub_10000695C(&qword_10000C2D0);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v107 - v7;
  v9 = type metadata accessor for REMSearchableItemAttributeName(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TTRSearchResultCollector(0);
  v13 = sub_10000695C(&qword_10000C2D8);
  v14 = swift_allocObject(v13, 48, 7);
  *(_OWORD *)(v14 + 16) = xmmword_100007240;
  v15 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for REMSearchableItemAttributeName.itemType(_:), v9);
  v16 = REMSearchableItemAttributeName.rawValue.getter(v15);
  v18 = v17;
  v19 = v9;
  v20 = (unint64_t)v117;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v19);
  *(_QWORD *)(v14 + 32) = v16;
  *(_QWORD *)(v14 + 40) = v18;
  v21 = v118;
  v22 = static TTRSearchResultCollector.result(spotlightItemIdentifier:attributesToFetch:)(v119, v20, v14);
  v118 = v23;
  if (v21)
  {
    swift_bridgeObjectRelease(v14);
    if (qword_10000C260 != -1)
      swift_once(&qword_10000C260, sub_100003C58);
    sub_100006944((uint64_t)v116, (uint64_t)qword_10000C268);
    v24 = swift_bridgeObjectRetain_n(v20, 2);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = v20;
      v29 = (void *)swift_slowAlloc(32, -1);
      v121 = v29;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain(v28);
      v120 = sub_100004104(v119, v28, (uint64_t *)&v121);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease_n(v28, 3);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Error occured when querying spotlight for item identifier {itemIdentifier: %s}", v27, 0xCu);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v27, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v20, 2);
    }
LABEL_23:
    swift_willThrow();
    return (uint64_t)v25;
  }
  v30 = (void *)v22;
  v31 = v8;
  v33 = v114;
  v32 = v115;
  v107 = v6;
  swift_bridgeObjectRelease(v14);
  if (!v30)
  {
    if (qword_10000C260 != -1)
      swift_once(&qword_10000C260, sub_100003C58);
    sub_100006944((uint64_t)v116, (uint64_t)qword_10000C268);
    v48 = swift_bridgeObjectRetain_n(v20, 2);
    v49 = Logger.logObject.getter(v48);
    v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc(12, -1);
      v52 = (void *)swift_slowAlloc(32, -1);
      v121 = v52;
      *(_DWORD *)v51 = 136315138;
      swift_bridgeObjectRetain(v20);
      v120 = sub_100004104(v119, v20, (uint64_t *)&v121);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v51 + 4, v51 + 12);
      swift_bridgeObjectRelease_n(v20, 3);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Spotlight item identifier does not exist {itemIdentifier: %s}", v51, 0xCu);
      swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1, -1);
      swift_slowDealloc(v51, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v20, 2);
    }
    v25 = objc_opt_self(REMError);
    v60 = String._bridgeToObjectiveC()();
    -[NSObject invalidParameterErrorWithDescription:](v25, "invalidParameterErrorWithDescription:", v60);

    goto LABEL_23;
  }
  v108 = v30;
  v34 = v31;
  v109 = v118;
  CSSearchableItemAttributeSet.rem_itemType.getter();
  v35 = v113;
  v36 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v113 + 48);
  if (v36((uint64_t)v34, 1, v32) == 1)
  {
    if (qword_10000C260 != -1)
      swift_once(&qword_10000C260, sub_100003C58);
    v37 = v116;
    v38 = sub_100006944((uint64_t)v116, (uint64_t)qword_10000C268);
    v39 = v111;
    v40 = isa;
    (*((void (**)(char *, uint64_t, NSObject *))isa + 2))(v111, v38, v37);
    v41 = v109;
    v42 = Logger.logObject.getter(v41);
    LODWORD(v119) = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, (os_log_type_t)v119))
    {
      v114 = (uint64_t)v30;
      v43 = swift_slowAlloc(22, -1);
      v44 = (void *)swift_slowAlloc(64, -1);
      v121 = v44;
      *(_DWORD *)v43 = 136315394;
      v45 = (uint64_t)v107;
      CSSearchableItemAttributeSet.rem_itemType.getter();
      if (v36(v45, 1, v32))
      {
        sub_1000069C8(v45);
        v46 = 0xE300000000000000;
        v47 = 7104878;
      }
      else
      {
        v117 = v44;
        v64 = v113;
        v65 = v45;
        v66 = v110;
        (*(void (**)(char *, uint64_t, _QWORD *))(v113 + 16))(v110, v65, v32);
        v67 = sub_1000069C8(v65);
        v68 = v32;
        v47 = REMSearchableItemType.entityName.getter(v67);
        v46 = v69;
        v70 = *(void (**)(char *, _QWORD *))(v64 + 8);
        v44 = v117;
        v70(v66, v68);
      }
      v120 = sub_100004104(v47, v46, (uint64_t *)&v121);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v43 + 4, v43 + 12);

      swift_bridgeObjectRelease(v46);
      *(_WORD *)(v43 + 12) = 2080;
      v71 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMReminderICSObjectTypeIdentifier);
      v73 = v72;
      v120 = sub_100004104(v71, v72, (uint64_t *)&v121);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v43 + 14, v43 + 22);
      swift_bridgeObjectRelease(v73);
      _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v119, "Item type does not support exporting to data type {itemType: %s, dataTypeIdentifier: %s}", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy(v44, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v43, -1, -1);

      (*((void (**)(char *, NSObject *))isa + 1))(v111, v37);
      v30 = (void *)v114;
    }
    else
    {

      (*((void (**)(char *, NSObject *))v40 + 1))(v39, v37);
    }
    v74 = v108;
    v25 = objc_opt_self(REMError);
    v75 = String._bridgeToObjectiveC()();
    -[NSObject invalidParameterErrorWithDescription:](v25, "invalidParameterErrorWithDescription:", v75);

    swift_willThrow();
    sub_10000699C(v30, v118);

    return (uint64_t)v25;
  }
  v53 = (*(uint64_t (**)(char *, _QWORD *))(v35 + 88))(v34, v32);
  if (v53 == enum case for REMSearchableItemType.reminder(_:))
  {
    v54 = objc_msgSend(objc_allocWithZone((Class)REMStore), "init");
    v121 = 0;
    v55 = v108;
    v56 = objc_msgSend(v54, "fetchReminderWithObjectID:error:", v108, &v121);
    v57 = v121;
    if (!v56)
    {
      v114 = (uint64_t)v30;
      v76 = v121;
      v77 = _convertNSErrorToError(_:)(v57);

      swift_willThrow();
      if (qword_10000C260 != -1)
        swift_once(&qword_10000C260, sub_100003C58);
      sub_100006944((uint64_t)v116, (uint64_t)qword_10000C268);
      swift_bridgeObjectRetain(v20);
      v78 = v55;
      swift_errorRetain(v77);
      swift_bridgeObjectRetain(v20);
      v25 = v78;
      v79 = swift_errorRetain(v77);
      v80 = Logger.logObject.getter(v79);
      v81 = static os_log_type_t.error.getter();
      v116 = v80;
      if (os_log_type_enabled(v80, v81))
      {
        v82 = swift_slowAlloc(32, -1);
        v83 = (uint64_t *)swift_slowAlloc(16, -1);
        v115 = (_QWORD *)swift_slowAlloc(32, -1);
        v121 = v115;
        *(_DWORD *)v82 = 136315650;
        swift_bridgeObjectRetain(v20);
        v120 = sub_100004104(v119, v20, (uint64_t *)&v121);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v82 + 4, v82 + 12);
        swift_bridgeObjectRelease_n(v20, 3);
        *(_WORD *)(v82 + 12) = 2112;
        v120 = (uint64_t)v25;
        v84 = v25;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v82 + 14, v82 + 22);
        v85 = (void *)v114;
        *v83 = v114;

        *(_WORD *)(v82 + 22) = 2112;
        v86 = _convertErrorToNSError(_:)(v77);
        v120 = v86;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v82 + 24, v82 + 32);
        v83[1] = v86;
        swift_errorRelease(v77);
        swift_errorRelease(v77);
        v87 = v116;
        _os_log_impl((void *)&_mh_execute_header, v116, v81, "Error fetching reminder {spotlightItemIdentifier: %s, objectID: %@, error: %@}", (uint8_t *)v82, 0x20u);
        v88 = sub_10000695C(&qword_10000C2B8);
        swift_arrayDestroy(v83, 2, v88);
        swift_slowDealloc(v83, -1, -1);
        v89 = v115;
        swift_arrayDestroy(v115, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v89, -1, -1);
        v90 = v82;
        v91 = v109;
        swift_slowDealloc(v90, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v20, 2);
        swift_errorRelease(v77);
        swift_errorRelease(v77);

        v85 = (void *)v114;
        v91 = v109;
      }
      swift_willThrow();
      sub_10000699C(v85, v118);

      return (uint64_t)v25;
    }
    v25 = v56;
    v58 = v55;
    v59 = v109;
    goto LABEL_29;
  }
  if (v53 == enum case for REMSearchableItemType.list(_:))
  {
    v58 = objc_msgSend(objc_allocWithZone((Class)REMStore), "init");
    v121 = 0;
    v59 = v108;
    v62 = objc_msgSend(v58, "fetchListWithObjectID:error:");
    v57 = v121;
    if (!v62)
    {
      v114 = (uint64_t)v30;
      v92 = v121;
      v93 = _convertNSErrorToError(_:)(v57);

      swift_willThrow();
      if (qword_10000C260 != -1)
        swift_once(&qword_10000C260, sub_100003C58);
      sub_100006944((uint64_t)v116, (uint64_t)qword_10000C268);
      swift_bridgeObjectRetain(v20);
      v94 = v59;
      swift_errorRetain(v93);
      swift_bridgeObjectRetain(v20);
      v25 = v94;
      v95 = swift_errorRetain(v93);
      v96 = Logger.logObject.getter(v95);
      v97 = static os_log_type_t.error.getter();
      v116 = v96;
      if (os_log_type_enabled(v96, v97))
      {
        v98 = swift_slowAlloc(32, -1);
        v99 = (uint64_t *)swift_slowAlloc(16, -1);
        v115 = (_QWORD *)swift_slowAlloc(32, -1);
        v121 = v115;
        *(_DWORD *)v98 = 136315650;
        swift_bridgeObjectRetain(v20);
        v120 = sub_100004104(v119, v20, (uint64_t *)&v121);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v98 + 4, v98 + 12);
        swift_bridgeObjectRelease_n(v20, 3);
        *(_WORD *)(v98 + 12) = 2112;
        v120 = (uint64_t)v25;
        v100 = v25;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v98 + 14, v98 + 22);
        v101 = (void *)v114;
        *v99 = v114;

        *(_WORD *)(v98 + 22) = 2112;
        v102 = _convertErrorToNSError(_:)(v93);
        v120 = v102;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v98 + 24, v98 + 32);
        v99[1] = v102;
        swift_errorRelease(v93);
        swift_errorRelease(v93);
        v103 = v116;
        _os_log_impl((void *)&_mh_execute_header, v116, v97, "Error fetching list {spotlightItemIdentifier: %s, objectID: %@, error: %@}", (uint8_t *)v98, 0x20u);
        v104 = sub_10000695C(&qword_10000C2B8);
        swift_arrayDestroy(v99, 2, v104);
        swift_slowDealloc(v99, -1, -1);
        v105 = v115;
        swift_arrayDestroy(v115, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v105, -1, -1);
        swift_slowDealloc(v98, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v20, 2);
        swift_errorRelease(v93);
        swift_errorRelease(v93);

        v101 = (void *)v114;
      }
      v106 = v109;
      swift_willThrow();
      sub_10000699C(v101, v118);

      return (uint64_t)v25;
    }
    v25 = v62;
    v54 = v109;
LABEL_29:
    v63 = v57;
    sub_10000699C(v30, v118);

    return (uint64_t)v25;
  }
  sub_10000699C(v30, v118);
  result = _diagnoseUnexpectedEnumCase<A>(type:)(v33, v33);
  __break(1u);
  return result;
}

uint64_t sub_100005B8C(void *a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  os_log_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t ObjectType;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _QWORD *v54;
  id v55;
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
  char *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  os_log_type_t v74;
  uint8_t *v75;
  _QWORD *v76;
  id v77;
  uint64_t v78;
  void *v79;
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
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  Class isa;
  id v96;
  id v97;
  uint64_t v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  uint64_t v102;
  unint64_t v103;
  void *v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  os_log_t *v118;
  os_log_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

  v133 = a3;
  v134 = a5;
  v131 = a2;
  v132 = a4;
  v6 = type metadata accessor for String.Encoding(0);
  v127 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v126 = (char *)&v117 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = type metadata accessor for UTType(0);
  v8 = *(_QWORD *)(v130 - 8);
  v9 = __chkstk_darwin(v130);
  v125 = (char *)&v117 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v117 - v11;
  if (qword_10000C260 != -1)
    swift_once(&qword_10000C260, sub_100003C58);
  v13 = type metadata accessor for Logger(0);
  v14 = sub_100006944(v13, (uint64_t)qword_10000C268);
  v15 = a1;
  swift_bridgeObjectRetain_n(v133, 2);
  swift_bridgeObjectRetain_n(v134, 2);
  v16 = (os_log_t)v15;
  v124 = v14;
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  v128 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc(32, -1);
    v123 = v6;
    v20 = v19;
    v118 = (os_log_t *)swift_slowAlloc(8, -1);
    v120 = swift_slowAlloc(64, -1);
    v135 = v120;
    *(_DWORD *)v20 = 138412802;
    v122 = v8;
    v119 = v17;
    v137 = (uint64_t)v16;
    v21 = v16;
    v121 = v12;
    v22 = v21;
    v24 = v132;
    v23 = (unint64_t)v133;
    v25 = v131;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138, v20 + 4, v20 + 12);
    v26 = v118;
    *v118 = v16;

    v27 = v134;
    v12 = v121;
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain(v23);
    v137 = sub_100004104(v25, v23, &v135);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138, v20 + 14, v20 + 22);
    swift_bridgeObjectRelease_n(v23, 3);
    *(_WORD *)(v20 + 22) = 2080;
    v8 = v122;
    swift_bridgeObjectRetain(v27);
    v137 = sub_100004104(v24, v27, &v135);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138, v20 + 24, v20 + 32);
    swift_bridgeObjectRelease_n(v27, 3);
    v16 = v119;
    _os_log_impl((void *)&_mh_execute_header, v119, (os_log_type_t)v128, "Generating data representation of an item {searchableIndex: %@, itemIdentifier: %s, typeIdentifier, %s}", (uint8_t *)v20, 0x20u);
    v28 = sub_10000695C(&qword_10000C2B8);
    swift_arrayDestroy(v26, 1, v28);
    swift_slowDealloc(v26, -1, -1);
    v29 = v120;
    swift_arrayDestroy(v120, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    v30 = v20;
    v6 = v123;
    swift_slowDealloc(v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n(v134, 2);
    swift_bridgeObjectRelease_n(v133, 2);

  }
  v31 = static UTType.utf8PlainText.getter();
  v32 = UTType.identifier.getter(v31);
  v34 = v33;
  v35 = *(void (**)(char *, uint64_t))(v8 + 8);
  v35(v12, v130);
  if (v32 == v132 && v34 == v134)
  {
    swift_bridgeObjectRelease(v134);
    goto LABEL_10;
  }
  v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v34, v132, v134, 0);
  v36 = swift_bridgeObjectRelease(v34);
  if ((v32 & 1) != 0)
  {
LABEL_10:
    v37 = v129;
    v38 = sub_100004C64(v131, v133);
    if (!v37)
    {
      v40 = (void *)v38;
      v41 = v39;
      ObjectType = swift_getObjectType(v38);
      v43 = dispatch thunk of REMSearchableItem.displayString.getter(ObjectType, v41);
      v45 = v44;
      v46 = v126;
      static String.Encoding.utf8.getter();
      v32 = String.data(using:allowLossyConversion:)(v46, 0, v43, v45);
      v48 = v47;
      swift_bridgeObjectRelease(v45);
      (*(void (**)(char *, uint64_t))(v127 + 8))(v46, v6);
      if (v48 >> 60 == 15)
      {
        v50 = swift_unknownObjectRetain(v40, v49);
        v51 = Logger.logObject.getter(v50);
        v52 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = (uint8_t *)swift_slowAlloc(12, -1);
          v54 = (_QWORD *)swift_slowAlloc(8, -1);
          *(_DWORD *)v53 = 138412290;
          v55 = objc_msgSend(v40, "remObjectID");
          v135 = (uint64_t)v55;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, &v136, v53 + 4, v53 + 12);
          *v54 = v55;
          swift_unknownObjectRelease(v40);
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "Couldn't encode description string to UTF-8 {objectID: %@}", v53, 0xCu);
          v56 = sub_10000695C(&qword_10000C2B8);
          swift_arrayDestroy(v54, 1, v56);
          swift_slowDealloc(v54, -1, -1);
          swift_slowDealloc(v53, -1, -1);

LABEL_24:
          v79 = (void *)objc_opt_self(REMError);
          v32 = (uint64_t)String._bridgeToObjectiveC()();
          objc_msgSend(v79, "internalErrorWithDebugDescription:", v32);

          swift_willThrow();
          swift_unknownObjectRelease(v40);
          return v32;
        }
        goto LABEL_23;
      }
LABEL_22:
      swift_unknownObjectRelease(v40);
      return v32;
    }
    return v32;
  }
  v32 = (uint64_t)v125;
  v57 = static UTType.utf16PlainText.getter(v36);
  v58 = UTType.identifier.getter(v57);
  v60 = v59;
  v35((char *)v32, v130);
  if (v58 == v132 && v60 == v134)
  {
    swift_bridgeObjectRelease(v134);
  }
  else
  {
    v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v58, v60, v132, v134, 0);
    swift_bridgeObjectRelease(v60);
    if ((v32 & 1) == 0)
    {
      v81 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMReminderICSObjectTypeIdentifier);
      v83 = v82;
      if (v81 == v132 && v82 == v134)
      {
        swift_bridgeObjectRelease(v134);
      }
      else
      {
        v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v81, v82, v132, v134, 0);
        swift_bridgeObjectRelease(v83);
        if ((v32 & 1) == 0)
        {
          v98 = swift_bridgeObjectRetain_n(v134, 2);
          v99 = Logger.logObject.getter(v98);
          v100 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v99, v100))
          {
            v101 = (uint8_t *)swift_slowAlloc(12, -1);
            v102 = swift_slowAlloc(32, -1);
            v135 = v102;
            *(_DWORD *)v101 = 136315138;
            v103 = v134;
            swift_bridgeObjectRetain(v134);
            v137 = sub_100004104(v132, v103, &v135);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138, v101 + 4, v101 + 12);
            swift_bridgeObjectRelease_n(v103, 3);
            _os_log_impl((void *)&_mh_execute_header, v99, v100, "Unsupported typeIdentifier {typeIdentifier: %s}", v101, 0xCu);
            swift_arrayDestroy(v102, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v102, -1, -1);
            swift_slowDealloc(v101, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n(v134, 2);
          }
          v104 = (void *)objc_opt_self(REMError);
          v32 = (uint64_t)String._bridgeToObjectiveC()();
          objc_msgSend(v104, "invalidParameterErrorWithDescription:", v32);

          swift_willThrow();
          return v32;
        }
      }
      v84 = v129;
      v85 = sub_100004C64(v131, v133);
      if (v84)
        return v32;
      v40 = (void *)v85;
      v87 = v86;
      v88 = objc_opt_self(REMReminder);
      v89 = swift_dynamicCastObjCClass(v40, v88);
      if (v89)
      {
        v90 = v89;
        v91 = (void *)objc_opt_self(REMExporting);
        v92 = sub_10000695C(&qword_10000C2C0);
        v93 = swift_allocObject(v92, 40, 7);
        *(_OWORD *)(v93 + 16) = xmmword_100007260;
        *(_QWORD *)(v93 + 32) = v90;
        v135 = v93;
        specialized Array._endMutation()();
        v94 = v135;
        sub_100006BC0(0, &qword_10000C2C8, REMReminder_ptr);
        swift_unknownObjectRetain_n(v40, 2);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v94);
        v96 = objc_msgSend(v91, "exportICSCalendarFromReminders:", isa);

        v97 = (id)REMiCalendarDataFromICSCalendar(v96);
        v32 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        swift_unknownObjectRelease_n(v40, 2);

        return v32;
      }
      v105 = swift_unknownObjectRetain_n(v40, 2);
      v106 = Logger.logObject.getter(v105);
      v107 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v106, v107))
      {
        v108 = swift_slowAlloc(22, -1);
        v109 = (_QWORD *)swift_slowAlloc(8, -1);
        v110 = swift_slowAlloc(32, -1);
        v137 = v110;
        *(_DWORD *)v108 = 138412546;
        v111 = objc_msgSend(v40, "remObjectID");
        v135 = (uint64_t)v111;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, &v136, v108 + 4, v108 + 12);
        *v109 = v111;
        *(_WORD *)(v108 + 12) = 2080;
        v135 = swift_getObjectType(v40);
        v136 = v87;
        v112 = sub_10000695C(&qword_10000C2B0);
        v113 = String.init<A>(describing:)(&v135, v112);
        v115 = v114;
        v135 = sub_100004104(v113, v114, &v137);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, &v136, v108 + 14, v108 + 22);
        swift_unknownObjectRelease_n(v40, 2);
        swift_bridgeObjectRelease(v115);
        _os_log_impl((void *)&_mh_execute_header, v106, v107, "Unsupported type of REMSearchableItem for exporting to ICS data {objectID: %@, type: %s}", (uint8_t *)v108, 0x16u);
        v116 = sub_10000695C(&qword_10000C2B8);
        swift_arrayDestroy(v109, 1, v116);
        swift_slowDealloc(v109, -1, -1);
        swift_arrayDestroy(v110, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v110, -1, -1);
        swift_slowDealloc(v108, -1, -1);

      }
      else
      {

        swift_unknownObjectRelease_n(v40, 2);
      }
      goto LABEL_24;
    }
  }
  v61 = v129;
  v62 = sub_100004C64(v131, v133);
  if (!v61)
  {
    v40 = (void *)v62;
    v64 = v63;
    v65 = swift_getObjectType(v62);
    v66 = dispatch thunk of REMSearchableItem.displayString.getter(v65, v64);
    v68 = v67;
    v69 = v126;
    static String.Encoding.utf16.getter();
    v32 = String.data(using:allowLossyConversion:)(v69, 0, v66, v68);
    v71 = v70;
    swift_bridgeObjectRelease(v68);
    (*(void (**)(char *, uint64_t))(v127 + 8))(v69, v6);
    if (v71 >> 60 == 15)
    {
      v73 = swift_unknownObjectRetain(v40, v72);
      v51 = Logger.logObject.getter(v73);
      v74 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v51, v74))
      {
        v75 = (uint8_t *)swift_slowAlloc(12, -1);
        v76 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v75 = 138412290;
        v77 = objc_msgSend(v40, "remObjectID");
        v135 = (uint64_t)v77;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, &v136, v75 + 4, v75 + 12);
        *v76 = v77;
        swift_unknownObjectRelease(v40);
        _os_log_impl((void *)&_mh_execute_header, v51, v74, "Couldn't encode description string to UTF-16 {objectID: %@}", v75, 0xCu);
        v78 = sub_10000695C(&qword_10000C2B8);
        swift_arrayDestroy(v76, 1, v78);
        swift_slowDealloc(v76, -1, -1);
        swift_slowDealloc(v75, -1, -1);

        goto LABEL_24;
      }
LABEL_23:

      swift_unknownObjectRelease(v40);
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  return v32;
}

uint64_t sub_100006900(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100006944(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000695C(uint64_t *a1)
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

void sub_10000699C(void *a1, void *a2)
{
  if (a1)
  {

  }
}

uint64_t sub_1000069C8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000695C(&qword_10000C2D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006A08(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006A28(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100006A68(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100006AA8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006ACC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_100006AD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C2F8;
  if (!qword_10000C2F8)
  {
    v1 = sub_100006BC0(255, &qword_10000C2F0, CSSearchableIndex_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10000C2F8);
  }
  return result;
}

unint64_t sub_100006B30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C308;
  if (!qword_10000C308)
  {
    v1 = sub_100006B7C(&qword_10000C300);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C308);
  }
  return result;
}

uint64_t sub_100006B7C(uint64_t *a1)
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

uint64_t sub_100006BC0(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100006BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006C08(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100006C10()
{
  unint64_t result;

  result = qword_10000C318;
  if (!qword_10000C318)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C318);
  }
  return result;
}

uint64_t sub_100006C74()
{
  uint64_t v0;
  id v1;

  v0 = type metadata accessor for Logger(0);
  sub_100006A68(v0, qword_10000C320);
  sub_100006944(v0, (uint64_t)qword_10000C320);
  v1 = objc_msgSend((id)objc_opt_self(REMLogStore), "search");
  return Logger.init(_:)(v1);
}

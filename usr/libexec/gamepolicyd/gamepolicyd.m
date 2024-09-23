uint64_t sub_100001E90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002090(&qword_100037600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t GlobalPreferences.semAllowList.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "objectForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v7, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_100001E90((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    v4 = sub_100002090(&qword_100037608);
    if ((swift_dynamicCast(&v6, v8, (char *)&type metadata for Any + 8, v4, 6) & 1) != 0)
      return v6;
  }
  else
  {
    sub_100004EF8((uint64_t)v8);
  }
  if (qword_100037320 != -1)
    swift_once(&qword_100037320, sub_100007168);
  swift_beginAccess(&static GlobalPreferences.defaultSEMAllowList, v8, 0, 0);
  return swift_bridgeObjectRetain(static GlobalPreferences.defaultSEMAllowList);
}

void sub_100002008(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  void (*v8)(id, id, id);
  id v9;
  id v10;
  id v11;

  v8 = *(void (**)(id, id, id))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  swift_retain(v7);
  v11 = a2;
  v9 = a3;
  v10 = a4;
  v8(v11, v9, v10);
  swift_release(v7);

}

uint64_t sub_100002090(uint64_t *a1)
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

unint64_t sub_1000020D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038160;
  if (!qword_100038160)
  {
    v1 = sub_1000117E0((uint64_t *)&unk_100038B80);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100038160);
  }
  return result;
}

uint64_t sub_10000211C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
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

uint64_t sub_10000215C(uint64_t a1)
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

uint64_t sub_100002188(void *a1, uint64_t a2)
{
  id v4;
  char v5;
  Swift::Int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  id v16;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v4 = a1;
    v5 = __CocoaSet.contains(_:)();

    return v5 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v7 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40)),
        v8 = -1 << *(_BYTE *)(a2 + 32),
        v9 = v7 & ~v8,
        v10 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0))
  {
LABEL_11:
    v13 = 0;
    return v13 & 1;
  }
  sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
  v11 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v9);
  v12 = static NSObject.== infix(_:_:)(v11, a1);

  if ((v12 & 1) == 0)
  {
    v14 = ~v8;
    v15 = (v9 + 1) & v14;
    if (((*(_QWORD *)(v10 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      do
      {
        v16 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v15);
        v13 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v13 & 1) != 0)
          break;
        v15 = (v15 + 1) & v14;
      }
      while (((*(_QWORD *)(v10 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0);
      return v13 & 1;
    }
    goto LABEL_11;
  }
  v13 = 1;
  return v13 & 1;
}

unint64_t sub_1000022E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100004590(a1, v4);
}

void sub_100002314(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  int64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  Swift::String v42;
  uint64_t v43;
  char v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  _BOOL4 v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  _QWORD v57[5];

  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (void **)((char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v2 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
LABEL_48:
    __break(1u);
    return;
  }
  v11 = objc_msgSend(a2, "state");
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v11, "assertions");
    if (!v13)
      goto LABEL_45;
    v14 = v13;
    v15 = sub_1000046A8(0, &qword_100038CE8, RBSProcessAssertionInfo_ptr);
    v16 = sub_100002720();
    v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v14, v15, v16);

    v18 = objc_msgSend(v12, "taskState");
    v47 = a1;
    v48 = v2;
    v46 = v12;
    v50 = (int)v18;
    v53 = v15;
    if ((v17 & 0xC000000000000001) != 0)
    {
      if (v17 < 0)
        v19 = v17;
      else
        v19 = v17 & 0xFFFFFFFFFFFFFF8;
      v20 = __CocoaSet.makeIterator()(v19);
      v18 = Set.Iterator.init(_cocoa:)(v57, v20, v15, v16);
      v17 = v57[0];
      v54 = v57[1];
      v21 = v57[2];
      v22 = v57[3];
      v23 = v57[4];
    }
    else
    {
      v22 = 0;
      v24 = -1 << *(_BYTE *)(v17 + 32);
      v25 = *(_QWORD *)(v17 + 56);
      v54 = v17 + 56;
      v21 = ~v24;
      v26 = -v24;
      if (v26 < 64)
        v27 = ~(-1 << v26);
      else
        v27 = -1;
      v23 = v27 & v25;
    }
    v51 = 0;
    v49 = v21;
    v28 = (unint64_t)(v21 + 64) >> 6;
    v45 = (void *)0x800000010002A890;
    v52 = (char *)&type metadata for Swift.AnyObject + 8;
    while (1)
    {
      v29 = v22;
      if (v17 < 0)
      {
        v32 = __CocoaSet.Iterator.next()(v18);
        if (!v32)
          goto LABEL_41;
        v33 = v32;
        v55 = v32;
        swift_unknownObjectRetain(v32);
        swift_dynamicCast(&v56, &v55, v52, v53, 7);
        v34 = v56;
        swift_unknownObjectRelease(v33);
        if (!v34)
          goto LABEL_41;
      }
      else
      {
        if (v23)
        {
          v30 = __clz(__rbit64(v23));
          v23 &= v23 - 1;
          v31 = v30 | (v22 << 6);
        }
        else
        {
          v35 = v22 + 1;
          if (__OFADD__(v22, 1))
          {
            __break(1u);
            goto LABEL_48;
          }
          if (v35 >= v28)
            goto LABEL_41;
          v36 = *(_QWORD *)(v54 + 8 * v35);
          ++v22;
          if (!v36)
          {
            v22 = v29 + 2;
            if (v29 + 2 >= v28)
              goto LABEL_41;
            v36 = *(_QWORD *)(v54 + 8 * v22);
            if (!v36)
            {
              v22 = v29 + 3;
              if (v29 + 3 >= v28)
                goto LABEL_41;
              v36 = *(_QWORD *)(v54 + 8 * v22);
              if (!v36)
              {
                v22 = v29 + 4;
                if (v29 + 4 >= v28)
                  goto LABEL_41;
                v36 = *(_QWORD *)(v54 + 8 * v22);
                if (!v36)
                {
                  v37 = v29 + 5;
                  while (v28 != v37)
                  {
                    v36 = *(_QWORD *)(v54 + 8 * v37++);
                    if (v36)
                    {
                      v22 = v37 - 1;
                      goto LABEL_33;
                    }
                  }
LABEL_41:
                  sub_1000246F0(v17);
                  if (v50 == 4)
                  {
                    v43 = v47;
                    v44 = (*(_BYTE *)(v47 + 47) ^ 1) & v51;
                  }
                  else
                  {
                    v44 = 0;
                    v43 = v47;
                  }
                  v12 = v46;
                  *(_BYTE *)(v43 + 48) = v44 & 1;
                  sub_100002778();
LABEL_45:

                  return;
                }
              }
            }
          }
LABEL_33:
          v23 = (v36 - 1) & v36;
          v31 = __clz(__rbit64(v36)) + (v22 << 6);
        }
        v34 = *(id *)(*(_QWORD *)(v17 + 48) + 8 * v31);
        if (!v34)
          goto LABEL_41;
      }
      v38 = objc_msgSend(v34, "domain", v45);
      if (v38)
      {
        v39 = v38;
        static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        v41 = v40;

        if (v51)
        {
          v51 = 1;
        }
        else
        {
          v42._countAndFlagsBits = 0xD00000000000002ELL;
          v42._object = v45;
          v51 = String.hasPrefix(_:)(v42);
        }
        swift_bridgeObjectRelease(v41);

      }
      else
      {

      }
    }
  }
}

unint64_t sub_100002720()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038CF0;
  if (!qword_100038CF0)
  {
    v1 = sub_1000046A8(255, &qword_100038CE8, RBSProcessAssertionInfo_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100038CF0);
  }
  return result;
}

uint64_t sub_100002778()
{
  _QWORD *v0;
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
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __n128 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  unsigned __int8 *v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  void *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  void *v71;
  _QWORD *v72;
  _QWORD *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t *v84;
  uint64_t v85;
  void *v86;
  unsigned __int8 *v87;
  char v88;
  __int16 v89;
  __int16 v90;
  char v91[24];

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v78 - v6;
  v8 = type metadata accessor for DispatchPredicate(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char **)((char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)((char *)v0 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  v13 = v12;
  LOBYTE(v12) = _dispatchPreconditionTest(_:)(v11);
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
LABEL_48:
    __break(1u);
LABEL_49:
    swift_once(&qword_100037328, sub_10000764C);
    goto LABEL_44;
  }
  v14 = (_QWORD *)((char *)v0 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses);
  swift_beginAccess((char *)v0 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses, v91, 0, 0);
  v15 = *v14;
  v16 = (*v14 & 0xC000000000000001) == 0;
  v83 = v0;
  v84 = v14;
  v80 = v2;
  v81 = v1;
  v78 = v7;
  v79 = v5;
  if (v16)
  {
    v22 = -1 << *(_BYTE *)(v15 + 32);
    v19 = ~v22;
    v23 = *(_QWORD *)(v15 + 64);
    v85 = v15 + 64;
    v24 = -v22;
    if (v24 < 64)
      v25 = ~(-1 << v24);
    else
      v25 = -1;
    v20 = v25 & v23;
    v21 = v15;
  }
  else
  {
    if (v15 < 0)
      v17 = v15;
    else
      v17 = v15 & 0xFFFFFFFFFFFFFF8;
    v18 = __CocoaDictionary.makeIterator()(v17);
    v85 = 0;
    v19 = 0;
    v20 = 0;
    v21 = v18 | 0x8000000000000000;
  }
  v26 = swift_bridgeObjectRetain(v15);
  v27 = 0;
  v82 = v19;
  v11 = (_QWORD *)((unint64_t)(v19 + 64) >> 6);
  while (1)
  {
    v28 = v27;
    if ((v21 & 0x8000000000000000) == 0)
      break;
    v31 = (void *)__CocoaDictionary.Iterator.next()(v26);
    if (!v31)
      goto LABEL_38;
    v33 = v31;
    v34 = v32;
    v86 = v31;
    v35 = sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
    swift_unknownObjectRetain(v33);
    swift_dynamicCast(&v87, &v86, (char *)&type metadata for Swift.AnyObject + 8, v35, 7);
    v36 = v87;
    swift_unknownObjectRelease(v33);
    v86 = v34;
    v37 = type metadata accessor for EmbeddedGameProcess();
    swift_unknownObjectRetain(v34);
    swift_dynamicCast(&v87, &v86, (char *)&type metadata for Swift.AnyObject + 8, v37, 7);
    v38 = v87;
    swift_unknownObjectRelease(v34);
    v27 = v28;
    if (!v36)
      goto LABEL_38;
LABEL_33:

    v43 = v38[48];
    swift_release(v38);
    if (v43 == 1)
    {
      v44 = sub_1000246F0(v21);
      v45 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction;
      v11 = v83;
      if (*(_QWORD *)((char *)v83 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction))
        goto LABEL_43;
      v46 = Logger.daemon.unsafeMutableAddressor(v44);
      v48 = v80;
      v47 = v81;
      v49 = v78;
      v50 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v80 + 16))(v78, v46, v81);
      v51 = Logger.logObject.getter(v50);
      v52 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v53 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Foreground games identified - holding transaction", v53, 2u);
        swift_slowDealloc(v53, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v47);
      v54 = os_transaction_create("gamepolicyd is actively monitoring an identified foreground game");
      v55 = *(_QWORD *)((char *)v11 + v45);
      *(_QWORD *)((char *)v11 + v45) = v54;
      goto LABEL_42;
    }
  }
  if (v20)
  {
    v29 = __clz(__rbit64(v20));
    v20 &= v20 - 1;
    v30 = v29 | (v27 << 6);
    goto LABEL_32;
  }
  v39 = v27 + 1;
  if (__OFADD__(v27, 1))
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v39 >= (uint64_t)v11)
    goto LABEL_38;
  v40 = *(_QWORD *)(v85 + 8 * v39);
  ++v27;
  if (v40)
    goto LABEL_31;
  v27 = v28 + 2;
  if (v28 + 2 >= (uint64_t)v11)
    goto LABEL_38;
  v40 = *(_QWORD *)(v85 + 8 * v27);
  if (v40)
    goto LABEL_31;
  v27 = v28 + 3;
  if (v28 + 3 >= (uint64_t)v11)
    goto LABEL_38;
  v40 = *(_QWORD *)(v85 + 8 * v27);
  if (v40)
    goto LABEL_31;
  v27 = v28 + 4;
  if (v28 + 4 >= (uint64_t)v11)
    goto LABEL_38;
  v40 = *(_QWORD *)(v85 + 8 * v27);
  if (v40)
  {
LABEL_31:
    v20 = (v40 - 1) & v40;
    v30 = __clz(__rbit64(v40)) + (v27 << 6);
LABEL_32:
    v42 = 8 * v30;
    v38 = *(unsigned __int8 **)(*(_QWORD *)(v21 + 56) + v42);
    v36 = *(id *)(*(_QWORD *)(v21 + 48) + v42);
    swift_retain(v38);
    if (!v36)
      goto LABEL_38;
    goto LABEL_33;
  }
  v41 = (_QWORD *)(v28 + 5);
  while (v11 != v41)
  {
    v40 = *(_QWORD *)(v85 + 8 * (_QWORD)v41);
    v41 = (_QWORD *)((char *)v41 + 1);
    if (v40)
    {
      v27 = (uint64_t)v41 - 1;
      goto LABEL_31;
    }
  }
LABEL_38:
  v11 = v83;
  v56 = sub_1000246F0(v21);
  v57 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction;
  if (!*(_QWORD *)((char *)v11 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction))
    goto LABEL_43;
  v58 = Logger.daemon.unsafeMutableAddressor(v56);
  v60 = v79;
  v59 = v80;
  v61 = v81;
  v62 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v80 + 16))(v79, v58, v81);
  v63 = Logger.logObject.getter(v62);
  v64 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v63, v64))
  {
    v65 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v65 = 0;
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "Foreground games no longer identified - releasing transaction", v65, 2u);
    swift_slowDealloc(v65, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v61);
  v55 = *(_QWORD *)((char *)v11 + v57);
  *(_QWORD *)((char *)v11 + v57) = 0;
LABEL_42:
  swift_unknownObjectRelease(v55);
LABEL_43:
  if (qword_100037328 != -1)
    goto LABEL_49;
LABEL_44:
  v66 = off_1000375F8;
  swift_retain(off_1000375F8);
  v67 = GlobalPreferences.gameModeEnabledList.getter();
  swift_release(v66);
  v90 = 0;
  v89 = 0;
  v88 = 0;
  v86 = &_swiftEmptyArrayStorage;
  v87 = (unsigned __int8 *)&_swiftEmptyArrayStorage;
  v68 = *v84;
  swift_bridgeObjectRetain(*v84);
  v70 = sub_100002E68(v69);
  swift_bridgeObjectRelease(v68);
  if (qword_100037358 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v71 = off_100037F18;
  v72 = v11;
  swift_bridgeObjectRetain(v67);
  v73 = (_QWORD *)swift_retain(v71);
  v74 = sub_100011CEC(v73, (uint64_t)v72, (_BYTE *)&v90 + 1, &v89, (uint64_t *)&v86, v67, (uint64_t *)&v87, (_BYTE *)&v89 + 1, &v90, &v88);
  swift_release(v71);

  swift_bridgeObjectRelease_n(v67, 2);
  v76 = (uint64_t)v86;
  v75 = (uint64_t)v87;
  swift_bridgeObjectRetain(v87);
  swift_bridgeObjectRetain(v76);
  sub_1000192B0(v74 & 1, HIDWORD(v74) & 1, v75, v76, 0);
  swift_bridgeObjectRelease(v75);
  swift_bridgeObjectRelease(v76);
  sub_10001AC08(BYTE3(v74), (uint64_t)v70, 0);
  sub_10001B560((v74 >> 8) & 1, (uint64_t)v70, 0);
  sub_100003220((v74 >> 16) & 1, (uint64_t)v70, 0);
  swift_bridgeObjectRelease(v75);
  swift_bridgeObjectRelease(v76);
  return swift_release(v70);
}

_QWORD *sub_100002E68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;

  v1 = a1;
  if ((a1 & 0xC000000000000001) == 0)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
      goto LABEL_5;
    return &_swiftEmptyArrayStorage;
  }
  if (a1 >= 0)
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  v2 = __CocoaDictionary.count.getter(a1);
  if (!v2)
    return &_swiftEmptyArrayStorage;
LABEL_5:
  if (v2 <= 0)
  {
    v4 = &_swiftEmptyArrayStorage;
  }
  else
  {
    v3 = sub_100002090(&qword_100038688);
    v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
    v5 = j__malloc_size(v4);
    v6 = v5 - 32;
    if (v5 < 32)
      v6 = v5 - 25;
    v4[2] = v2;
    v4[3] = (2 * (v6 >> 3)) | 1;
  }
  swift_bridgeObjectRetain(v1);
  v7 = sub_100002F64((uint64_t)&v9, v4 + 4, v2, v1);
  result = (_QWORD *)sub_1000246F0(v9);
  if (v7 == v2)
    return v4;
  __break(1u);
  return result;
}

uint64_t sub_100002F64(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a4;
  v6 = a2;
  v7 = (_QWORD *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a4 < 0)
      v8 = a4;
    else
      v8 = a4 & 0xFFFFFFFFFFFFFF8;
    result = __CocoaDictionary.makeIterator()(v8);
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v4 = result | 0x8000000000000000;
    if (v6)
      goto LABEL_6;
LABEL_39:
    v12 = 0;
    a3 = 0;
LABEL_48:
    *v7 = v4;
    v7[1] = v9;
    v7[2] = v10;
    v7[3] = v12;
    v7[4] = v11;
    return a3;
  }
  v25 = -1 << *(_BYTE *)(a4 + 32);
  v9 = a4 + 64;
  v26 = ~v25;
  v27 = -v25;
  if (v27 < 64)
    v28 = ~(-1 << v27);
  else
    v28 = -1;
  v11 = v28 & *(_QWORD *)(a4 + 64);
  v10 = v26;
  if (!a2)
    goto LABEL_39;
LABEL_6:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_48;
  }
  if (a3 < 0)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v29 = v10;
  v30 = v7;
  v12 = 0;
  v13 = 0;
  v31 = (unint64_t)(v10 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    v19 = v9;
    v20 = __CocoaDictionary.Iterator.next()();
    if (!v20)
    {
      a3 = v13;
LABEL_47:
      v10 = v29;
      v7 = v30;
      goto LABEL_48;
    }
    v22 = v21;
    swift_unknownObjectRelease(v20);
    v32 = v22;
    v23 = type metadata accessor for EmbeddedGameProcess();
    swift_unknownObjectRetain(v22);
    swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v23, 7);
    v16 = v33;
    result = swift_unknownObjectRelease(v22);
    v9 = v19;
    if (!v16)
      goto LABEL_46;
LABEL_11:
    ++v13;
    *v6++ = v16;
    if (v13 == a3)
      goto LABEL_47;
  }
  if (v11)
  {
    v14 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v15 = v14 | (v12 << 6);
    goto LABEL_10;
  }
  v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_50;
  }
  if (v17 >= v31)
    goto LABEL_42;
  v18 = *(_QWORD *)(v9 + 8 * v17);
  if (v18)
    goto LABEL_26;
  v12 += 2;
  if (v17 + 1 >= v31)
  {
    v11 = 0;
    v12 = v17;
    goto LABEL_46;
  }
  v18 = *(_QWORD *)(v9 + 8 * v12);
  if (v18)
  {
LABEL_19:
    v17 = v12;
LABEL_26:
    v11 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
LABEL_10:
    v16 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15);
    result = swift_retain(v16);
    if (!v16)
      goto LABEL_46;
    goto LABEL_11;
  }
  v24 = v17 + 2;
  if (v17 + 2 >= v31)
    goto LABEL_42;
  v18 = *(_QWORD *)(v9 + 8 * v24);
  if (v18)
  {
LABEL_25:
    v17 = v24;
    goto LABEL_26;
  }
  v12 = v17 + 3;
  if (v17 + 3 >= v31)
  {
    v11 = 0;
    v12 = v17 + 2;
    goto LABEL_46;
  }
  v18 = *(_QWORD *)(v9 + 8 * v12);
  if (v18)
    goto LABEL_19;
  v24 = v17 + 4;
  if (v17 + 4 >= v31)
  {
LABEL_42:
    v11 = 0;
LABEL_46:
    a3 = v13;
    goto LABEL_47;
  }
  v18 = *(_QWORD *)(v9 + 8 * v24);
  if (v18)
    goto LABEL_25;
  while (1)
  {
    v17 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v17 >= v31)
    {
      v11 = 0;
      v12 = v31 - 1;
      goto LABEL_46;
    }
    v18 = *(_QWORD *)(v9 + 8 * v17);
    ++v24;
    if (v18)
      goto LABEL_26;
  }
LABEL_51:
  __break(1u);
  return result;
}

void sub_100003220(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  int v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _UNKNOWN **v57;
  void *v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  unsigned int v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  char v92;
  void *v93;
  int v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t k;
  uint64_t v116;
  uint64_t Strong;
  uint64_t v118;
  id v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  NSObject *v127;
  os_log_type_t v128;
  uint8_t *v129;
  uint8_t *v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  int *v143;
  int v144;
  uint64_t v145;
  char *v146;
  _BYTE *v147;
  uint64_t v148;
  uint64_t v149;
  id v150[2];
  uint64_t v151;
  _BYTE v152[24];
  char v153[24];

  v7 = type metadata accessor for DynamicSplitterStatus.Config(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v133 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v133 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v133 - v15;
  v17 = sub_100002090(&qword_100038128);
  v18 = __chkstk_darwin(v17);
  __chkstk_darwin(v18);
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsDynamicPowerSplitter) == 1)
  {
    v135 = v20;
    v138 = (char *)&v133 - v19;
    v144 = a3;
    v134 = v16;
    v137 = v3;
    v21 = v7;
    v22 = (_BYTE *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig);
    swift_beginAccess(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig, v153, 1, 0);
    v142 = *v22;
    v143 = (int *)v21;
    v23 = *(_QWORD *)&v22[*(int *)(v21 + 32)];
    LODWORD(v148) = a1;
    *v22 = a1 & 1;
    v151 = (uint64_t)&_swiftEmptyArrayStorage;
    v141 = v23;
    if ((unint64_t)a2 >> 62)
    {
      if (a2 < 0)
        v37 = a2;
      else
        v37 = a2 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v23);
      swift_bridgeObjectRetain(a2);
      v24 = _CocoaArrayWrapper.endIndex.getter(v37);
      v149 = v24;
      if (!v24)
        goto LABEL_19;
    }
    else
    {
      v24 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v23);
      swift_bridgeObjectRetain(a2);
      v149 = v24;
      if (!v24)
        goto LABEL_19;
    }
    if (v24 < 1)
    {
      __break(1u);
      goto LABEL_100;
    }
    if ((a2 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v24; ++i)
      {
        v29 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a2);
        v30 = v29;
        if (*(_BYTE *)(v29 + 49) == 1)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v29);
          v26 = *(_QWORD *)(v151 + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v26);
          v27 = v26;
          v24 = v149;
          v28 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v30);
          specialized ContiguousArray._endMutation()(v28);
        }
        else
        {
          swift_unknownObjectRelease(v29);
        }
      }
    }
    else
    {
      for (j = 0; j != v24; ++j)
      {
        v32 = *(_QWORD *)(a2 + 8 * j + 32);
        if (*(_BYTE *)(v32 + 49) == 1)
        {
          v33 = swift_retain(*(_QWORD *)(a2 + 8 * j + 32));
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v33);
          v34 = *(_QWORD *)(v151 + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v34);
          v35 = v34;
          v24 = v149;
          v36 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v35, v32);
          specialized ContiguousArray._endMutation()(v36);
        }
      }
    }
LABEL_19:
    swift_bridgeObjectRelease(a2);
    v38 = v151;
    v147 = v22;
    if (v151 < 0 || (v151 & 0x4000000000000000) != 0)
    {
      v131 = swift_retain(v151);
      v39 = _CocoaArrayWrapper.endIndex.getter(v131);
    }
    else
    {
      v39 = *(_QWORD *)(v151 + 16);
      swift_retain(v151);
    }
    v139 = v9;
    v140 = v10;
    v145 = v11;
    v146 = v14;
    v136 = a2;
    if (!v39)
    {
      v41 = (char *)&_swiftEmptyArrayStorage;
LABEL_38:
      swift_release_n(v38, 2);
      v52 = v142 ^ v148;
      v53 = v143;
      v54 = v143[8];
      v55 = (uint64_t)v147;
      v56 = *(_QWORD *)&v147[v54];
      *(_QWORD *)&v147[v54] = v41;
      swift_bridgeObjectRelease(v56);
      if (qword_100037358 != -1)
        swift_once(&qword_100037358, sub_10000F17C);
      v57 = &off_100037000;
      v58 = off_100037F18;
      v59 = (_QWORD *)swift_retain(off_100037F18);
      v60 = sub_10000E808(v59);
      swift_release(v58);
      *(_QWORD *)(v55 + v53[10]) = v60;
      v61 = v140;
      v62 = v145;
      v63 = v144;
      if ((v52 & 1) != 0)
      {
        if ((v148 & 1) != 0)
        {
          v64 = swift_bridgeObjectRelease(v141);
          v65 = (uint64_t)v138;
          Date.init()(v64);
          v66 = type metadata accessor for Date(0);
          v67 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56);
          v67(v65, 0, 1, v66);
          swift_beginAccess(v55, &v151, 33, 0);
          sub_10002477C(v65, v55 + v53[5]);
          v68 = v55 + v53[6];
          sub_100024740(v68, &qword_100038128);
          v67(v68, 1, 1, v66);
          swift_endAccess(&v151);
        }
        else
        {
          v69 = v135;
          sub_1000246F8(v55 + v53[5], v135);
          v70 = type metadata accessor for Date(0);
          v71 = *(_QWORD *)(v70 - 8);
          v72 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v69, 1, v70);
          v73 = sub_100024740(v69, &qword_100038128);
          if (v72 == 1)
          {
            v74 = v141;
          }
          else
          {
            v75 = (uint64_t)v138;
            Date.init()(v73);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v71 + 56))(v75, 0, 1, v70);
            swift_beginAccess(v55, &v151, 33, 0);
            sub_10002477C(v75, v55 + v53[6]);
            v76 = v53[9];
            v77 = *(_QWORD *)(v55 + v76);
            *(_QWORD *)(v55 + v76) = v141;
            swift_endAccess(&v151);
            v74 = v77;
          }
          swift_bridgeObjectRelease(v74);
          v62 = v145;
        }
      }
      else
      {
        swift_bridgeObjectRelease(v141);
      }
      v78 = (void *)objc_opt_self(CLPCPolicyInterface);
      v151 = 0;
      v79 = objc_msgSend(v78, "createClient:", &v151);
      v80 = (id)v151;
      if (!v79)
      {
        v88 = (id)v151;
        v87 = (id)_convertNSErrorToError(_:)(v80);

        v89 = swift_willThrow();
LABEL_68:
        v97 = Logger.daemon.unsafeMutableAddressor(v89);
        (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v146, v97, v61);
        swift_errorRetain(v87);
        v98 = swift_errorRetain(v87);
        v99 = Logger.logObject.getter(v98);
        v100 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v99, v100))
        {
          v101 = (uint8_t *)swift_slowAlloc(12, -1);
          v102 = swift_slowAlloc(8, -1);
          v149 = 0;
          v103 = (_QWORD *)v102;
          *(_DWORD *)v101 = 138543362;
          swift_errorRetain(v87);
          v104 = v62;
          v105 = v61;
          v106 = _swift_stdlib_bridgeErrorToNSError(v87);
          v151 = v106;
          v57 = &off_100037000;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v151, v152, v101 + 4, v101 + 12);
          *v103 = v106;
          v61 = v105;
          v62 = v104;
          v55 = (uint64_t)v147;
          swift_errorRelease(v87);
          swift_errorRelease(v87);
          _os_log_impl((void *)&_mh_execute_header, v99, v100, "Unable to set DPS: %{public}@", v101, 0xCu);
          v107 = sub_100002090((uint64_t *)&unk_100037CA0);
          swift_arrayDestroy(v103, 1, v107);
          swift_slowDealloc(v103, -1, -1);
          swift_slowDealloc(v101, -1, -1);

          swift_errorRelease(v87);
        }
        else
        {
          swift_errorRelease(v87);
          swift_errorRelease(v87);
          swift_errorRelease(v87);

        }
        (*(void (**)(char *, uint64_t))(v62 + 8))(v146, v61);
        goto LABEL_74;
      }
      v81 = v79;
      if (((v52 | v63) & 1) != 0)
      {
        v151 = 0;
        v82 = v80;
        v83 = objc_msgSend(v81, "setGameMode:options:error:", v148 & 1, 0, &v151);
        v84 = (id)v151;
        if (!v83)
        {
          v96 = (id)v151;
          v87 = (id)_convertNSErrorToError(_:)(v84);

          goto LABEL_67;
        }
        v151 = 0;
        v85 = v84;
        v86 = objc_msgSend(v81, "isInGameMode:", &v151);
        if (v151)
        {
          v87 = (id)v151;
LABEL_67:
          swift_willThrow();
          v89 = swift_unknownObjectRelease(v81);
          goto LABEL_68;
        }
        v123 = (uint64_t)v86;
        v124 = Logger.daemon.unsafeMutableAddressor(v86);
        v125 = v134;
        v126 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v62 + 16))(v134, v124, v61);
        v127 = Logger.logObject.getter(v126);
        v128 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v127, v128))
        {
          v129 = (uint8_t *)swift_slowAlloc(12, -1);
          *(_DWORD *)v129 = 134349056;
          v151 = v123;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v151, v152, v129 + 4, v129 + 12);
          _os_log_impl((void *)&_mh_execute_header, v127, v128, "Set DPS to %{public}lu", v129, 0xCu);
          v130 = v129;
          v125 = v134;
          swift_slowDealloc(v130, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v62 + 8))(v125, v61);
      }
      else
      {
        v90 = (id)v151;
      }
      v91 = v136;
      v92 = v148;
      if (!v149)
      {
        swift_unknownObjectRelease(v81);
LABEL_73:
        v57 = &off_100037000;
LABEL_74:
        v108 = (uint64_t)v139;
        sub_100011868(v55, (uint64_t)v139, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicSplitterStatus.Config);
        v109 = objc_allocWithZone((Class)type metadata accessor for DynamicSplitterStatus(0));
        v110 = (void *)DynamicSplitterStatus.init(config:)(v108);
        v111 = (uint64_t)v57[483];
        v112 = *(void **)(v111 + 16);
        swift_retain(v111);
        objc_msgSend(v112, "lock");
        v149 = (uint64_t)v110;
        sub_100010A24(v111, v110, &v151);
        objc_msgSend(v112, "unlock");
        v113 = v151;
        if ((unint64_t)v151 >> 62)
        {
          if (v151 < 0)
            v132 = v151;
          else
            v132 = v151 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v151);
          v114 = _CocoaArrayWrapper.endIndex.getter(v132);
          swift_bridgeObjectRelease(v113);
          if (v114)
          {
LABEL_76:
            if (v114 >= 1)
            {
              v148 = v111;
              for (k = 0; k != v114; ++k)
              {
                if ((v113 & 0xC000000000000001) != 0)
                {
                  v116 = specialized _ArrayBuffer._getElementSlowPath(_:)(k, v113);
                }
                else
                {
                  v116 = *(_QWORD *)(v113 + 8 * k + 32);
                  swift_retain(v116);
                }
                Strong = swift_unknownObjectWeakLoadStrong(v116 + 16);
                if (Strong)
                {
                  v118 = Strong;
                  v119 = objc_msgSend(*(id *)(Strong + 16), "remoteObjectProxy");
                  _bridgeAnyObjectToAny(_:)(&v151, v119);
                  swift_unknownObjectRelease(v119);
                  v120 = sub_100002090(&qword_100038CE0);
                  if ((swift_dynamicCast(v150, &v151, (char *)&type metadata for Any + 8, v120, 6) & 1) != 0)
                  {
                    v121 = v150[0];
                    objc_msgSend(v150[0], "updateStatus::::", 0, 0, 0, v149);
                    swift_release(v116);
                    swift_unknownObjectRelease(v118);
                    swift_unknownObjectRelease(v121);
                  }
                  else
                  {
                    swift_release(v116);
                    swift_unknownObjectRelease(v118);
                  }
                }
                else
                {
                  swift_release(v116);
                }
              }
              v122 = v148;
              goto LABEL_97;
            }
            goto LABEL_101;
          }
        }
        else
        {
          v114 = *(_QWORD *)((v151 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v114)
            goto LABEL_76;
        }
        v122 = v111;
LABEL_97:
        swift_release(v122);
        swift_bridgeObjectRelease(v113);

        return;
      }
      if (v149 < 1)
        goto LABEL_102;
      swift_bridgeObjectRetain(v136);
      v93 = 0;
      while (1)
      {
        if ((v91 & 0xC000000000000001) != 0)
        {
          v95 = specialized _ArrayBuffer._getElementSlowPath(_:)(v93, v91);
          if ((v92 & 1) == 0)
            goto LABEL_64;
        }
        else
        {
          v95 = *(_QWORD *)(v91 + 8 * (_QWORD)v93 + 32);
          swift_retain(v95);
          if ((v92 & 1) == 0)
          {
LABEL_64:
            v94 = 0;
            goto LABEL_59;
          }
        }
        v94 = *(unsigned __int8 *)(v95 + 49);
LABEL_59:
        v93 = (char *)v93 + 1;
        sub_100003ECC(v94, v95, v81);
        swift_release(v95);
        if ((void *)v149 == v93)
        {
          swift_unknownObjectRelease(v81);
          swift_bridgeObjectRelease(v91);
          goto LABEL_73;
        }
      }
    }
    if (v39 >= 1)
    {
      v40 = 0;
      v41 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        if ((v38 & 0xC000000000000001) != 0)
        {
          v42 = specialized _ArrayBuffer._getElementSlowPath(_:)(v40, v38);
        }
        else
        {
          v42 = *(_QWORD *)(v38 + 8 * v40 + 32);
          swift_retain(v42);
        }
        v43 = objc_msgSend(*(id *)(v42 + 16), "bundle");
        if (v43
          && (v44 = v43,
              v45 = objc_msgSend(v43, "identifier"),
              v44,
              v45))
        {
          v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
          v48 = v47;
          swift_release(v42);

          if ((swift_isUniquelyReferenced_nonNull_native(v41) & 1) == 0)
            v41 = sub_100024F00(0, *((_QWORD *)v41 + 2) + 1, 1, v41);
          v50 = *((_QWORD *)v41 + 2);
          v49 = *((_QWORD *)v41 + 3);
          if (v50 >= v49 >> 1)
            v41 = sub_100024F00((char *)(v49 > 1), v50 + 1, 1, v41);
          *((_QWORD *)v41 + 2) = v50 + 1;
          v51 = &v41[16 * v50];
          *((_QWORD *)v51 + 4) = v46;
          *((_QWORD *)v51 + 5) = v48;
        }
        else
        {
          swift_release(v42);
        }
        ++v40;
      }
      while (v39 != v40);
      goto LABEL_38;
    }
LABEL_100:
    __break(1u);
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
  }
}

uint64_t sub_100003ECC(int a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  char *v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  void *v37;
  char v38;
  unsigned int v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  _QWORD *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  char v77[24];

  v4 = v3;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v10);
  v15 = (char *)&v66 - v14;
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsDynamicPowerSplitter) == 1)
  {
    v16 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeState;
    v17 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeState);
    swift_beginAccess(v17 + 16, v77, 0, 0);
    v18 = *(_QWORD *)(v17 + 16);
    if (*(_QWORD *)(v18 + 16))
    {
      swift_retain(a2);
      swift_bridgeObjectRetain(v18);
      v19 = sub_10000452C(a2);
      if ((v20 & 1) != 0)
      {
        v21 = *(_QWORD *)(v18 + 56);
        v72 = v4;
        v22 = v15;
        v23 = v12;
        v24 = a3;
        v25 = v9;
        v26 = v16;
        v27 = *(unsigned __int8 *)(v21 + v19);
        swift_release(a2);
        result = swift_bridgeObjectRelease(v18);
        v28 = v27 == (a1 & 1);
        v16 = v26;
        v9 = v25;
        a3 = v24;
        v12 = v23;
        v15 = v22;
        v4 = v72;
        if (v28)
          return result;
      }
      else
      {
        swift_release(a2);
        swift_bridgeObjectRelease(v18);
      }
    }
    LODWORD(v72) = a1;
    v29 = *(void **)(a2 + 16);
    v30 = objc_msgSend(v29, "pid");
    if ((_DWORD)v30 == -1)
    {
LABEL_27:
      v63 = *(_QWORD *)(v4 + v16);
      swift_beginAccess(v63 + 16, &v75, 33, 0);
      swift_retain(a2);
      swift_retain(v63);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(v63 + 16));
      v73 = *(_QWORD *)(v63 + 16);
      *(_QWORD *)(v63 + 16) = 0x8000000000000000;
      sub_100004AF8(v72 & 1, a2, isUniquelyReferenced_nonNull_native);
      v65 = *(_QWORD *)(v63 + 16);
      *(_QWORD *)(v63 + 16) = v73;
      swift_release(a2);
      swift_bridgeObjectRelease(v65);
      swift_endAccess(&v75);
      return swift_release(v63);
    }
    v31 = v30;
    v70 = v16;
    v32 = objc_msgSend(v29, "name");
    v71 = v8;
    if (v32
      || (v36 = objc_msgSend(v29, "bundle")) != 0
      && (v37 = v36, v32 = objc_msgSend(v36, "identifier"), v37, v32))
    {
      v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
      v35 = v34;

    }
    else
    {
      v35 = 0xE400000000000000;
      v33 = 1701667175;
    }
    v75 = 0;
    v38 = v72;
    v39 = objc_msgSend(a3, "setGameModeOnProcess:targetProcess:options:error:", v72 & 1, v31, 0, &v75);
    v40 = v75;
    if (v39)
    {
      v41 = Logger.daemon.unsafeMutableAddressor(v75);
      v42 = v71;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v41, v71);
      v43 = swift_bridgeObjectRetain(v35);
      v44 = Logger.logObject.getter(v43);
      v45 = static os_log_type_t.info.getter();
      v46 = v45;
      if (os_log_type_enabled(v44, v45))
      {
        v47 = swift_slowAlloc(22, -1);
        v69 = (void *)swift_slowAlloc(64, -1);
        v75 = v69;
        *(_DWORD *)v47 = 136446466;
        if ((v38 & 1) != 0)
          v48 = 0x64656C62616E45;
        else
          v48 = 0x64656C6261736944;
        if ((v38 & 1) != 0)
          v49 = 0xE700000000000000;
        else
          v49 = 0xE800000000000000;
        v67 = v33;
        v73 = sub_100004814(v48, v49, (uint64_t *)&v75);
        v68 = v46;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, &v74, v47 + 4, v47 + 12);
        swift_bridgeObjectRelease(v49);
        *(_WORD *)(v47 + 12) = 2082;
        swift_bridgeObjectRetain(v35);
        v73 = sub_100004814(v67, v35, (uint64_t *)&v75);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, &v74, v47 + 14, v47 + 22);
        swift_bridgeObjectRelease_n(v35, 3);
        _os_log_impl((void *)&_mh_execute_header, v44, (os_log_type_t)v68, "%{public}s DPS for %{public}s", (uint8_t *)v47, 0x16u);
        v50 = v69;
        swift_arrayDestroy(v69, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v50, -1, -1);
        swift_slowDealloc(v47, -1, -1);

        (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v71);
      }
      else
      {

        swift_bridgeObjectRelease_n(v35, 2);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v42);
      }
      v16 = v70;
      goto LABEL_27;
    }
    v51 = v75;
    swift_bridgeObjectRelease(v35);
    v52 = _convertNSErrorToError(_:)(v40);

    v53 = swift_willThrow();
    v54 = Logger.daemon.unsafeMutableAddressor(v53);
    v55 = v71;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v54, v71);
    swift_errorRetain(v52);
    v56 = swift_errorRetain(v52);
    v57 = Logger.logObject.getter(v56);
    v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc(12, -1);
      v60 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v59 = 138543362;
      swift_errorRetain(v52);
      v61 = (void *)_swift_stdlib_bridgeErrorToNSError(v52);
      v75 = v61;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v59 + 4, v59 + 12);
      *v60 = v61;
      v55 = v71;
      swift_errorRelease(v52);
      swift_errorRelease(v52);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "Unable to set DPS for game: %{public}@", v59, 0xCu);
      v62 = sub_100002090((uint64_t *)&unk_100037CA0);
      swift_arrayDestroy(v60, 1, v62);
      swift_slowDealloc(v60, -1, -1);
      swift_slowDealloc(v59, -1, -1);

      swift_errorRelease(v52);
    }
    else
    {
      swift_errorRelease(v52);
      swift_errorRelease(v52);
      swift_errorRelease(v52);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v55);
  }
  return result;
}

unint64_t sub_10000452C(uint64_t a1)
{
  uint64_t v1;
  id v3;
  Swift::Int v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, *(_QWORD *)(v1 + 40));
  v3 = *(id *)(a1 + 16);
  NSObject.hash(into:)(v6);

  v4 = Hasher._finalize()();
  return sub_1000046E0(a1, v4);
}

unint64_t sub_100004590(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
    v7 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v8 = static NSObject.== infix(_:_:)(v7, a1);

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = static NSObject.== infix(_:_:)(v10, a1);

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_1000046A8(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_1000046E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_1000046A8(0, (unint64_t *)&unk_100038B70, NSObject_ptr);
    v7 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v8 = *(_QWORD *)(v7 + 16);
    v9 = *(_QWORD *)(a1 + 16);
    swift_retain(v7);
    LOBYTE(v8) = static NSObject.== infix(_:_:)(v8, v9);
    swift_release(v7);
    if ((v8 & 1) == 0)
    {
      v10 = ~v4;
      for (i = (i + 1) & v10; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v10)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v12 = *(_QWORD *)(v11 + 16);
        swift_retain(v11);
        LOBYTE(v12) = static NSObject.== infix(_:_:)(v12, v9);
        swift_release(v11);
        if ((v12 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_100004814(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100004940(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100004904((uint64_t)v12, *a3);
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
      sub_100004904((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000048E4(v12);
  return v7;
}

uint64_t sub_1000048E4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100004904(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004940(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100004C40(a5, a6);
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

uint64_t sub_100004AF8(char a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_10000452C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_10000A554();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v16[7] + v10) = a1 & 1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_QWORD *)(v16[6] + 8 * v10) = a2;
    *(_BYTE *)(v16[7] + v10) = a1 & 1;
    v18 = v16[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return swift_retain(a2);
    }
    goto LABEL_14;
  }
  sub_100009824(result, a3 & 1);
  result = sub_10000452C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  v21 = type metadata accessor for EmbeddedGameProcess();
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v21);
  __break(1u);
  return result;
}

uint64_t sub_100004C40(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100004CD4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100020DCC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100020DCC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100004CD4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100004E48(v4, 0);
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

_QWORD *sub_100004E48(uint64_t a1, uint64_t a2)
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
  v4 = sub_100002090((uint64_t *)&unk_100038B90);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100004EAC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100004EB4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100004EBC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100004EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004EF8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002090(&qword_100037600);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004F38(uint64_t a1, uint64_t a2, _QWORD *a3)
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

uint64_t type metadata accessor for EmbeddedGameProcess()
{
  return objc_opt_self(_TtC11gamepolicyd19EmbeddedGameProcess);
}

unint64_t sub_10000501C()
{
  unint64_t result;

  result = qword_100038D00;
  if (!qword_100038D00)
  {
    result = swift_getWitnessTable(&unk_100027370, &type metadata for GamePolicyFF);
    atomic_store(result, (unint64_t *)&qword_100038D00);
  }
  return result;
}

const char *sub_100005060()
{
  _BYTE *v0;

  if (*v0)
    return "universalGamePolicySupport";
  else
    return "gameModeNotifications";
}

const char *sub_100005090()
{
  return "GamePolicy";
}

uint64_t sub_1000050A4()
{
  __int128 v1;
  int v2;

  if ((_os_feature_enabled_impl("GamePolicy", "universalGamePolicySupport") & 1) != 0)
    return 1;
  v2 = 1874287171;
  v1 = xmmword_100026660;
  return MGIsDeviceOneOfType(&v1);
}

uint64_t sub_100005588()
{
  __int128 v1;
  int v2;

  if ((_os_feature_enabled_impl("GamePolicy", "universalGamePolicySupport") & 1) != 0)
    return 1;
  v2 = 1874287171;
  v1 = xmmword_100026660;
  return MGIsDeviceOneOfType(&v1);
}

uint64_t sub_100005ABC()
{
  __int128 v1;
  int v2;

  if ((_os_feature_enabled_impl("GamePolicy", "modelManagerGameAssertion") & 1) != 0)
    return 1;
  v2 = 1874287171;
  v1 = xmmword_100026660;
  return MGIsDeviceOneOfType(&v1);
}

uint64_t sub_100006094()
{
  __int128 v1;
  int v2;

  v2 = 1874287171;
  v1 = xmmword_100026660;
  return MGIsDeviceOneOfType(&v1);
}

uint64_t sub_1000065EC()
{
  __int128 v1;
  int v2;

  v2 = 1874287171;
  v1 = xmmword_100026660;
  return MGIsDeviceOneOfType(&v1);
}

void sub_100006B94(unsigned int a1)
{
  int *v1;
  uint64_t v2;
  size_t v3;
  uint64_t v4;

  v4 = 0;
  v3 = 8;
  v2 = a1;
  if (sysctlbyname("kern.console_mode", &v4, &v3, &v2, 8uLL) == -1)
  {
    v1 = __error();
    NSLog(CFSTR("kern.console_mode failed with error: %d"), *v1);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v3 = type metadata accessor for GamePolicyDaemon();
  swift_allocObject(v3, 56, 7);
  qword_100039180 = sub_100006ECC();
  sub_100006C84(qword_100039180 + 16, (uint64_t)v6);
  v4 = v7;
  if (!v7)
  {
    sub_100006CCC((uint64_t)v6);
    dispatch_main();
  }
  v5 = v8;
  sub_100006D0C(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  sub_1000048E4(v6);
  dispatch_main();
}

uint64_t sub_100006C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002090(&qword_100037360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006CCC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002090(&qword_100037360);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_100006D0C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t variable initialization expression of GlobalPreferences.gameModeEnabledListKey()
{
  return 0xD000000000000013;
}

unint64_t variable initialization expression of GlobalPreferences.gameModeLastBannerDatesKey()
{
  return 0xD000000000000017;
}

void *variable initialization expression of GamePolicyMobileAssetRetriever.completionHandlers()
{
  return &_swiftEmptyArrayStorage;
}

id variable initialization expression of GamePolicyMobileAssetRetriever.lock()
{
  return objc_msgSend(objc_allocWithZone((Class)NSLock), "init");
}

uint64_t GamePolicyMobileAsset.compatibilityVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t GamePolicyMobileAsset.contentVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t GamePolicyMobileAsset.contentRevision.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

id GamePolicyMobileAsset.maAsset.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 72);
}

uint64_t GamePolicyMobileAsset.description.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(v0 + 72), "description");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t GamePolicyMobileAsset.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t GamePolicyMobileAsset.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 80, 7);
}

uint64_t sub_100006E54()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)v0 + 72), "description");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t type metadata accessor for GamePolicyMobileAsset()
{
  return objc_opt_self(_TtC11gamepolicyd21GamePolicyMobileAsset);
}

uint64_t sub_100006ECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  _QWORD v3[5];

  if (_set_user_dir_suffix("com.apple.gamepolicyd"))
  {
    v1 = type metadata accessor for GamePolicyDaemon_iOS();
    swift_allocObject(v1, 49, 7);
    v3[3] = v1;
    v3[4] = &off_100031558;
    v3[0] = sub_1000173E0();
    sub_100007050((uint64_t)v3, v0 + 16);
    return v0;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001ELL, 0x8000000100028A80, "gamepolicyd/Daemon.swift", 24, 2, 75, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_100006F94()
{
  uint64_t v0;

  sub_100006CCC(v0 + 16);
  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for GamePolicyDaemon()
{
  return objc_opt_self(_TtC11gamepolicyd16GamePolicyDaemon);
}

uint64_t sub_100006FD8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  sub_100006C84(*v0 + 16, (uint64_t)v4);
  v1 = v5;
  if (!v5)
    return sub_100006CCC((uint64_t)v4);
  v2 = v6;
  sub_100006D0C(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  return sub_1000048E4(v4);
}

uint64_t sub_100007050(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002090(&qword_100037360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *GlobalPreferences.defaultIgnoreDeviceRestrictions.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultIgnoreDeviceRestrictions;
}

uint64_t static GlobalPreferences.defaultIgnoreDeviceRestrictions.getter()
{
  _BYTE v1[24];

  swift_beginAccess(&static GlobalPreferences.defaultIgnoreDeviceRestrictions, v1, 0, 0);
  return static GlobalPreferences.defaultIgnoreDeviceRestrictions;
}

uint64_t static GlobalPreferences.defaultIgnoreDeviceRestrictions.setter(char a1)
{
  uint64_t result;
  _BYTE v3[24];

  result = swift_beginAccess(&static GlobalPreferences.defaultIgnoreDeviceRestrictions, v3, 1, 0);
  static GlobalPreferences.defaultIgnoreDeviceRestrictions = a1;
  return result;
}

void *static GlobalPreferences.defaultIgnoreDeviceRestrictions.modify(uint64_t a1)
{
  swift_beginAccess(&static GlobalPreferences.defaultIgnoreDeviceRestrictions, a1, 33, 0);
  return &j_j__swift_endAccess;
}

void sub_100007168()
{
  static GlobalPreferences.defaultSEMAllowList = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t *GlobalPreferences.defaultSEMAllowList.unsafeMutableAddressor()
{
  if (qword_100037320 != -1)
    swift_once(&qword_100037320, sub_100007168);
  return &static GlobalPreferences.defaultSEMAllowList;
}

uint64_t static GlobalPreferences.defaultSEMAllowList.getter()
{
  _BYTE v1[24];

  if (qword_100037320 != -1)
    swift_once(&qword_100037320, sub_100007168);
  swift_beginAccess(&static GlobalPreferences.defaultSEMAllowList, v1, 0, 0);
  return swift_bridgeObjectRetain(static GlobalPreferences.defaultSEMAllowList);
}

uint64_t static GlobalPreferences.defaultSEMAllowList.setter(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[24];

  if (qword_100037320 != -1)
    swift_once(&qword_100037320, sub_100007168);
  swift_beginAccess(&static GlobalPreferences.defaultSEMAllowList, v4, 1, 0);
  v2 = static GlobalPreferences.defaultSEMAllowList;
  static GlobalPreferences.defaultSEMAllowList = a1;
  return swift_bridgeObjectRelease(v2);
}

uint64_t (*static GlobalPreferences.defaultSEMAllowList.modify(uint64_t a1))(_QWORD)
{
  if (qword_100037320 != -1)
    swift_once(&qword_100037320, sub_100007168);
  swift_beginAccess(&static GlobalPreferences.defaultSEMAllowList, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t *GlobalPreferences.defaultGameModeEnablementStrategy.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultGameModeEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultGameModeEnablementStrategy.getter()
{
  _BYTE v1[24];

  swift_beginAccess(&static GlobalPreferences.defaultGameModeEnablementStrategy, v1, 0, 0);
  return static GlobalPreferences.defaultGameModeEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultGameModeEnablementStrategy.setter(uint64_t a1)
{
  uint64_t result;
  _BYTE v3[24];

  result = swift_beginAccess(&static GlobalPreferences.defaultGameModeEnablementStrategy, v3, 1, 0);
  static GlobalPreferences.defaultGameModeEnablementStrategy = a1;
  return result;
}

void *static GlobalPreferences.defaultGameModeEnablementStrategy.modify(uint64_t a1)
{
  swift_beginAccess(&static GlobalPreferences.defaultGameModeEnablementStrategy, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t *GlobalPreferences.defaultSEMEnablementStrategy.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultSEMEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultSEMEnablementStrategy.getter()
{
  _BYTE v1[24];

  swift_beginAccess(&static GlobalPreferences.defaultSEMEnablementStrategy, v1, 0, 0);
  return static GlobalPreferences.defaultSEMEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultSEMEnablementStrategy.setter(uint64_t a1)
{
  uint64_t result;
  _BYTE v3[24];

  result = swift_beginAccess(&static GlobalPreferences.defaultSEMEnablementStrategy, v3, 1, 0);
  static GlobalPreferences.defaultSEMEnablementStrategy = a1;
  return result;
}

void *static GlobalPreferences.defaultSEMEnablementStrategy.modify(uint64_t a1)
{
  swift_beginAccess(&static GlobalPreferences.defaultSEMEnablementStrategy, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t *GlobalPreferences.defaultDynamicSplitterEnablementStrategy.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultDynamicSplitterEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultDynamicSplitterEnablementStrategy.getter()
{
  _BYTE v1[24];

  swift_beginAccess(&static GlobalPreferences.defaultDynamicSplitterEnablementStrategy, v1, 0, 0);
  return static GlobalPreferences.defaultDynamicSplitterEnablementStrategy;
}

uint64_t static GlobalPreferences.defaultDynamicSplitterEnablementStrategy.setter(uint64_t a1)
{
  uint64_t result;
  _BYTE v3[24];

  result = swift_beginAccess(&static GlobalPreferences.defaultDynamicSplitterEnablementStrategy, v3, 1, 0);
  static GlobalPreferences.defaultDynamicSplitterEnablementStrategy = a1;
  return result;
}

void *static GlobalPreferences.defaultDynamicSplitterEnablementStrategy.modify(uint64_t a1)
{
  swift_beginAccess(&static GlobalPreferences.defaultDynamicSplitterEnablementStrategy, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t *GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy.unsafeMutableAddressor()
{
  return &static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy;
}

uint64_t static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy.getter()
{
  _BYTE v1[24];

  swift_beginAccess(&static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy, v1, 0, 0);
  return static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy;
}

uint64_t static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy.setter(uint64_t a1)
{
  uint64_t result;
  _BYTE v3[24];

  result = swift_beginAccess(&static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy, v3, 1, 0);
  static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy = a1;
  return result;
}

void *static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy.modify(uint64_t a1)
{
  swift_beginAccess(&static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000764C()
{
  uint64_t v0;
  uint64_t v1;
  id result;

  v0 = type metadata accessor for GlobalPreferences();
  v1 = swift_allocObject(v0, 56, 7);
  *(_QWORD *)(v1 + 24) = 0xD000000000000013;
  *(_QWORD *)(v1 + 32) = 0x8000000100028760;
  *(_QWORD *)(v1 + 40) = 0xD000000000000017;
  *(_QWORD *)(v1 + 48) = 0x8000000100028780;
  result = objc_msgSend(objc_allocWithZone((Class)NSUserDefaults), "init");
  *(_QWORD *)(v1 + 16) = result;
  off_1000375F8 = (_UNKNOWN *)v1;
  return result;
}

id GlobalPreferences.ignoreDeviceRestrictions.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  NSString v4;
  id v5;
  _OWORD v7[2];

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "valueForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v7, v3);
    swift_unknownObjectRelease(v3);
    sub_100004EF8((uint64_t)v7);
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend(v1, "BOOLForKey:", v4);

  }
  else
  {
    memset(v7, 0, sizeof(v7));
    sub_100004EF8((uint64_t)v7);
    swift_beginAccess(&static GlobalPreferences.defaultIgnoreDeviceRestrictions, v7, 0, 0);
    return (id)static GlobalPreferences.defaultIgnoreDeviceRestrictions;
  }
  return v5;
}

void GlobalPreferences.ignoreDeviceRestrictions.setter(char a1)
{
  sub_100007C2C(a1);
}

void (*GlobalPreferences.ignoreDeviceRestrictions.modify(uint64_t a1))(unsigned __int8 *a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = GlobalPreferences.ignoreDeviceRestrictions.getter() & 1;
  return sub_100007820;
}

void sub_100007820(unsigned __int8 *a1)
{
  uint64_t v1;
  void *v2;
  NSString v3;

  v1 = a1[8];
  v2 = *(void **)(*(_QWORD *)a1 + 16);
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setBool:forKey:", v1, v3);

}

void GlobalPreferences.semAllowList.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  Class isa;
  NSString v5;

  v3 = *(void **)(v1 + 16);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setObject:forKey:", isa, v5);

}

void (*GlobalPreferences.semAllowList.modify(uint64_t *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = GlobalPreferences.semAllowList.getter();
  return sub_100007948;
}

void sub_100007948(_QWORD *a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSString v4;
  Class isa;

  v2 = *a1;
  v3 = *(void **)(a1[1] + 16);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain(*a1);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
    v4 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "setObject:forKey:", isa, v4);
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
    v4 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "setObject:forKey:", isa, v4);
  }

}

uint64_t GlobalPreferences.modelManagerGameAssertionPolicyStrategy.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  NSString v4;
  id v5;
  _OWORD v7[2];

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "valueForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v7, v3);
    swift_unknownObjectRelease(v3);
    sub_100004EF8((uint64_t)v7);
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend(v1, "integerForKey:", v4);

    if ((unint64_t)v5 < 4)
      return (uint64_t)v5;
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    sub_100004EF8((uint64_t)v7);
  }
  swift_beginAccess(&static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy, v7, 0, 0);
  return static GlobalPreferences.defaultModelManagerGameAssertionPolicyStrategy;
}

void GlobalPreferences.modelManagerGameAssertionPolicyStrategy.setter(uint64_t a1)
{
  sub_100007FAC(a1);
}

void (*GlobalPreferences.modelManagerGameAssertionPolicyStrategy.modify(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = GlobalPreferences.modelManagerGameAssertionPolicyStrategy.getter();
  return sub_100007B98;
}

void sub_100007B98(uint64_t *a1)
{
  sub_100008050(a1);
}

id GlobalPreferences.firstLanuchBannerShown.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "BOOLForKey:", v2);

  return v3;
}

void GlobalPreferences.firstLanuchBannerShown.setter(char a1)
{
  sub_100007C2C(a1);
}

void sub_100007C2C(char a1)
{
  uint64_t v1;
  void *v3;
  NSString v4;

  v3 = *(void **)(v1 + 16);
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setBool:forKey:", a1 & 1, v4);

}

void (*GlobalPreferences.firstLanuchBannerShown.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSString v4;

  v3 = *(void **)(v1 + 16);
  *(_QWORD *)a1 = v3;
  v4 = String._bridgeToObjectiveC()();
  LOBYTE(v3) = objc_msgSend(v3, "BOOLForKey:", v4);

  *(_BYTE *)(a1 + 8) = (_BYTE)v3;
  return sub_100007CF8;
}

void sub_100007CF8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  NSString v3;

  v1 = *(void **)a1;
  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "setBool:forKey:", v2, v3);

}

id GlobalPreferences.gameModeEnablementStrategy.getter()
{
  return sub_100007EA0(0xD00000000000001ALL, 0x8000000100028B10, (uint64_t)&static GlobalPreferences.defaultGameModeEnablementStrategy);
}

void GlobalPreferences.gameModeEnablementStrategy.setter(uint64_t a1)
{
  sub_100007FAC(a1);
}

void (*GlobalPreferences.gameModeEnablementStrategy.modify(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = GlobalPreferences.gameModeEnablementStrategy.getter();
  return sub_100007DD0;
}

void sub_100007DD0(uint64_t *a1)
{
  sub_100008050(a1);
}

id GlobalPreferences.semEnablementStrategy.getter()
{
  return sub_100007EA0(0xD000000000000015, 0x8000000100028B30, (uint64_t)&static GlobalPreferences.defaultSEMEnablementStrategy);
}

void GlobalPreferences.semEnablementStrategy.setter(uint64_t a1)
{
  sub_100007FAC(a1);
}

void (*GlobalPreferences.semEnablementStrategy.modify(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = GlobalPreferences.semEnablementStrategy.getter();
  return sub_100007E60;
}

void sub_100007E60(uint64_t *a1)
{
  sub_100008050(a1);
}

id GlobalPreferences.dynamicSplitterEnablementStrategy.getter()
{
  return sub_100007EA0(0xD000000000000021, 0x8000000100028B50, (uint64_t)&static GlobalPreferences.defaultDynamicSplitterEnablementStrategy);
}

id sub_100007EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  NSString v6;
  id v7;
  NSString v8;
  id v9;
  _OWORD v11[2];

  v5 = *(void **)(v3 + 16);
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v5, "valueForKey:", v6);

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)(v11, v7);
    swift_unknownObjectRelease(v7);
    sub_100004EF8((uint64_t)v11);
    v8 = String._bridgeToObjectiveC()();
    v9 = objc_msgSend(v5, "integerForKey:", v8);

    if ((unint64_t)v9 < 3)
      return v9;
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    sub_100004EF8((uint64_t)v11);
  }
  swift_beginAccess(a3, v11, 0, 0);
  return *(id *)a3;
}

void GlobalPreferences.dynamicSplitterEnablementStrategy.setter(uint64_t a1)
{
  sub_100007FAC(a1);
}

void sub_100007FAC(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSString v4;

  v3 = *(void **)(v1 + 16);
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setInteger:forKey:", a1, v4);

}

void (*GlobalPreferences.dynamicSplitterEnablementStrategy.modify(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = GlobalPreferences.dynamicSplitterEnablementStrategy.getter();
  return sub_100008034;
}

void sub_100008034(uint64_t *a1)
{
  sub_100008050(a1);
}

void sub_100008050(uint64_t *a1)
{
  uint64_t v1;
  void *v2;
  NSString v3;

  v1 = *a1;
  v2 = *(void **)(a1[1] + 16);
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setInteger:forKey:", v1, v3);

}

unint64_t GlobalPreferences.gameModeEnabledList.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "valueForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v7, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_100001E90((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    v4 = sub_100002090(&qword_100037610);
    if (swift_dynamicCast(&v6, v8, (char *)&type metadata for Any + 8, v4, 6))
      return v6;
  }
  else
  {
    sub_100004EF8((uint64_t)v8);
  }
  return sub_100008380((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t sub_10000817C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002090(&qword_1000377E8);
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
  v6 = (_BYTE *)(a1 + 40);
  while (1)
  {
    v7 = *((_QWORD *)v6 - 1);
    v8 = *v6;
    v9 = swift_retain(v7);
    result = sub_10000452C(v9);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v7;
    *(_BYTE *)(v4[7] + result) = v8;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4[2] = v14;
    v6 += 16;
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

unint64_t sub_100008278(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002090(&qword_1000377F0);
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
  v6 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = (id)*(v6 - 1);
    swift_retain(v7);
    result = sub_1000022E4((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v4[6] + v11) = v8;
    *(_QWORD *)(v4[7] + v11) = v7;
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

unint64_t sub_100008380(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
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
  sub_100002090(&qword_100037800);
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
  v6 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v7 = *((_QWORD *)v6 - 2);
    v8 = *((_QWORD *)v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    result = sub_1000090D4(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_BYTE *)(v4[7] + result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v6 += 24;
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

unint64_t sub_100008490(uint64_t a1)
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
  sub_100002090(&qword_1000377F8);
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
    result = sub_1000090D4(v7, v8);
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

void GlobalPreferences.gameModeEnabledList.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  Class isa;
  NSString v5;

  v3 = *(void **)(v1 + 16);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setValue:forKey:", isa, v5);

}

void (*GlobalPreferences.gameModeEnabledList.modify(unint64_t *a1))(_QWORD *a1, char a2)
{
  unint64_t v1;

  a1[1] = v1;
  *a1 = GlobalPreferences.gameModeEnabledList.getter();
  return sub_100008658;
}

void sub_100008658(_QWORD *a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSString v4;
  Class isa;

  v2 = *a1;
  v3 = *(void **)(a1[1] + 16);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain(*a1);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
    v4 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "setValue:forKey:", isa, v4);
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
    v4 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "setValue:forKey:", isa, v4);
  }

}

Swift::Bool_optional __swiftcall GlobalPreferences.gameModeEnabled(bundleIdentifier:)(Swift::String bundleIdentifier)
{
  void *object;
  uint64_t countAndFlagsBits;
  unint64_t v3;
  unint64_t v4;
  char v5;
  Swift::Bool_optional v6;

  object = bundleIdentifier._object;
  countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  swift_bridgeObjectRetain(bundleIdentifier._object);
  v3 = GlobalPreferences.gameModeEnabledList.getter();
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_1000090D4(countAndFlagsBits, (uint64_t)object), (v5 & 1) != 0))
  {
    v6.value = *(_BYTE *)(*(_QWORD *)(v3 + 56) + v4);
    swift_bridgeObjectRelease(object);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    swift_bridgeObjectRelease(object);
    swift_bridgeObjectRelease(v3);
    return (Swift::Bool_optional)2;
  }
  return v6;
}

Swift::Void __swiftcall GlobalPreferences.setGameModeEnabled(_:bundleIdentifier:)(Swift::Bool _, Swift::String bundleIdentifier)
{
  uint64_t v2;
  uint64_t v3;
  void *object;
  uint64_t countAndFlagsBits;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  void *v9;
  Class isa;
  NSString v11;

  v3 = v2;
  object = bundleIdentifier._object;
  countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  v7 = GlobalPreferences.gameModeEnabledList.getter();
  swift_bridgeObjectRetain(object);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
  sub_100009DF4(_, countAndFlagsBits, (uint64_t)object, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease(object);
  swift_bridgeObjectRelease(0x8000000000000000);
  v9 = *(void **)(v3 + 16);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  v11 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "setValue:forKey:", isa, v11);

}

Swift::Void __swiftcall GlobalPreferences.setGameModeEnabled(_:bundleIdentifiers:)(Swift::Bool _, Swift::OpaquePointer bundleIdentifiers)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  Swift::Bool v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  Class isa;
  void *rawValue;
  NSString v27;

  v5 = (_QWORD *)GlobalPreferences.gameModeEnabledList.getter();
  v6 = *((_QWORD *)bundleIdentifiers._rawValue + 2);
  if (!v6)
  {
LABEL_17:
    v24 = *(void **)(v2 + 16);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
    v27 = String._bridgeToObjectiveC()();
    objc_msgSend(v24, "setValue:forKey:", isa, v27);

    return;
  }
  v7 = _;
  swift_bridgeObjectRetain(bundleIdentifiers._rawValue);
  rawValue = bundleIdentifiers._rawValue;
  v8 = (uint64_t *)((char *)bundleIdentifiers._rawValue + 40);
  while (1)
  {
    v10 = *(v8 - 1);
    v9 = *v8;
    swift_bridgeObjectRetain(*v8);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
    v13 = sub_1000090D4(v10, v9);
    v14 = v5[2];
    v15 = (v12 & 1) == 0;
    v16 = v14 + v15;
    if (__OFADD__(v14, v15))
      break;
    v17 = v12;
    if (v5[3] >= v16)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v12 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_10000A200();
        if ((v17 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_100009218(v16, isUniquelyReferenced_nonNull_native);
      v18 = sub_1000090D4(v10, v9);
      if ((v17 & 1) != (v19 & 1))
        goto LABEL_20;
      v13 = v18;
      if ((v17 & 1) != 0)
      {
LABEL_3:
        *(_BYTE *)(v5[7] + v13) = v7;
        goto LABEL_4;
      }
    }
    v5[(v13 >> 6) + 8] |= 1 << v13;
    v20 = (uint64_t *)(v5[6] + 16 * v13);
    *v20 = v10;
    v20[1] = v9;
    *(_BYTE *)(v5[7] + v13) = v7;
    v21 = v5[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_19;
    v5[2] = v23;
    swift_bridgeObjectRetain(v9);
LABEL_4:
    v8 += 2;
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(0x8000000000000000);
    if (!--v6)
    {
      swift_bridgeObjectRelease(rawValue);
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

double GlobalPreferences.gameModeOnBannerDefaultTime.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  double v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "valueForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v6, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100001E90((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, &type metadata for Double, 6))
      return v5;
  }
  else
  {
    sub_100004EF8((uint64_t)v7);
  }
  return 480.0;
}

double GlobalPreferences.gameModeOffBannerDefaultTime.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  double v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "valueForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v6, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100001E90((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, &type metadata for Double, 6))
      return v5;
  }
  else
  {
    sub_100004EF8((uint64_t)v7);
  }
  return 480.0;
}

unint64_t GlobalPreferences.gameModeLastBannerDates.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "valueForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v7, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_100001E90((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    v4 = sub_100002090(&qword_100037618);
    if (swift_dynamicCast(&v6, v8, (char *)&type metadata for Any + 8, v4, 6))
      return v6;
  }
  else
  {
    sub_100004EF8((uint64_t)v8);
  }
  return sub_100008490((uint64_t)&_swiftEmptyArrayStorage);
}

void GlobalPreferences.gameModeLastBannerDates.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  Class isa;
  NSString v5;

  v3 = *(void **)(v1 + 16);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setValue:forKey:", isa, v5);

}

void (*GlobalPreferences.gameModeLastBannerDates.modify(unint64_t *a1))(_QWORD *a1, char a2)
{
  unint64_t v1;

  a1[1] = v1;
  *a1 = GlobalPreferences.gameModeLastBannerDates.getter();
  return sub_100008E10;
}

void sub_100008E10(_QWORD *a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSString v4;
  Class isa;

  v2 = *a1;
  v3 = *(void **)(a1[1] + 16);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain(*a1);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
    v4 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "setValue:forKey:", isa, v4);
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
    v4 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "setValue:forKey:", isa, v4);
  }

}

uint64_t GlobalPreferences.gameModeLastBannerDate(bundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  unint64_t Banner;
  double v5;
  unint64_t v6;
  char v7;
  uint64_t v8;

  swift_bridgeObjectRetain(a2);
  Banner = GlobalPreferences.gameModeLastBannerDates.getter();
  v5 = 0.0;
  if (*(_QWORD *)(Banner + 16))
  {
    v6 = sub_1000090D4(a1, a2);
    if ((v7 & 1) != 0)
      v5 = *(double *)(*(_QWORD *)(Banner + 56) + 8 * v6);
  }
  swift_bridgeObjectRelease(a2);
  v8 = swift_bridgeObjectRelease(Banner);
  return Date.init(timeIntervalSinceReferenceDate:)(v8, v5);
}

void GlobalPreferences.setGameModeLastBannerDate(_:bundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t Banner;
  uint64_t v7;
  double v8;
  char isUniquelyReferenced_nonNull_native;
  void *v10;
  Class isa;
  NSString v12;

  Banner = GlobalPreferences.gameModeLastBannerDates.getter();
  v7 = swift_bridgeObjectRetain(a3);
  v8 = Date.timeIntervalSinceReferenceDate.getter(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(Banner);
  sub_100009F4C(a2, a3, isUniquelyReferenced_nonNull_native, v8);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(0x8000000000000000);
  v10 = *(void **)(v3 + 16);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(Banner);
  v12 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setValue:forKey:", isa, v12);

}

uint64_t GlobalPreferences.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return v0;
}

uint64_t GlobalPreferences.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocClassInstance(v0, 56, 7);
}

unint64_t sub_1000090D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100009138(a1, a2, v5);
}

unint64_t sub_100009138(uint64_t a1, uint64_t a2, uint64_t a3)
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

Swift::Int sub_100009218(uint64_t a1, uint64_t a2)
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
  char v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100002090(&qword_100037800);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = v3;
  v36 = (unint64_t)(v9 + 63) >> 6;
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
    if (v22 >= v36)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v36)
        goto LABEL_36;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_36:
          swift_release(v5);
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v36)
              goto LABEL_36;
            v24 = *(_QWORD *)(v37 + 8 * v14);
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
    v33 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v21);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain(v30[1]);
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v39, v32, v31);
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
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100009520(uint64_t a1, uint64_t a2)
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
  int64_t v12;
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
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100002090(&qword_1000377F8);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v3;
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
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
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v37 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
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
            if (v15 >= v12)
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
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v22);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain(v31[1]);
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v39, v33, v32);
    result = Hasher._finalize()();
    v16 = -1 << *(_BYTE *)(v8 + 32);
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
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v19);
    *v20 = v33;
    v20[1] = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v19) = v34;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100009824(uint64_t a1, uint64_t a2)
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
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
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
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100002090(&qword_1000377E8);
  v36 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v3;
  v35 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
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
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v35 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v35 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v34;
          if ((v36 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v35 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v12)
              goto LABEL_36;
            v25 = *(_QWORD *)(v35 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v22);
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v22);
    if ((v36 & 1) == 0)
      swift_retain(v31);
    Hasher.init(_seed:)(v37, *(_QWORD *)(v8 + 40));
    v16 = *(id *)(v31 + 16);
    NSObject.hash(into:)(v37);

    result = Hasher._finalize()();
    v17 = -1 << *(_BYTE *)(v8 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v13 + 8 * (v18 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v13 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v19 == v28;
        if (v19 == v28)
          v19 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v19);
      }
      while (v30 == -1);
      v20 = __clz(__rbit64(~v30)) + (v19 << 6);
    }
    *(_QWORD *)(v13 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v20) = v31;
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v20) = v32;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v34;
  v24 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v24, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100009B20(uint64_t a1, uint64_t a2)
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
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
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
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100002090(&qword_1000377F0);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v3;
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
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
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v37 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((a2 & 1) == 0)
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
            if (v15 >= v12)
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
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v5 + 48) + v31);
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      swift_retain(v33);
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v16 = -1 << *(_BYTE *)(v8 + 32);
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
    v20 = 8 * v19;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100009DF4(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1000090D4(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_10000A200();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v18[7] + v12) = a1 & 1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_BYTE *)(v18[7] + v12) = a1 & 1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_100009218(result, a4 & 1);
  result = sub_1000090D4(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100009F4C(uint64_t a1, uint64_t a2, char a3, double a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1000090D4(a1, a2);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_10000A3A8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(double *)(v18[7] + 8 * v12) = a4;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a1;
    v20[1] = a2;
    *(double *)(v18[7] + 8 * v12) = a4;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain(a2);
    }
    goto LABEL_14;
  }
  sub_100009520(result, a3 & 1);
  result = sub_1000090D4(a1, a2);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

id sub_10000A0A0(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  v4 = v3;
  v7 = *v3;
  v9 = sub_1000022E4((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10000A6F4();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_release(*(_QWORD *)(v16 + 8 * v9));
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_100009B20(v12, a3 & 1);
  v18 = sub_1000022E4((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  v24 = sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
  result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v24);
  __break(1u);
  return result;
}

void *sub_10000A200()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100002090(&qword_100037800);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain(v17);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000A3A8()
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
  sub_100002090(&qword_1000377F8);
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
    result = (void *)swift_bridgeObjectRetain(v18);
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

void *sub_10000A554()
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
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100002090(&qword_1000377E8);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v17 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v16;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v17;
    result = (void *)swift_retain(v16);
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000A6F4()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100002090(&qword_1000377F0);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_retain(v18);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for GlobalPreferences()
{
  return objc_opt_self(_TtC11gamepolicyd17GlobalPreferences);
}

uint64_t sub_10000A8C0()
{
  return 1;
}

Swift::Int sub_10000A8C8()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0xD000000000000031, 0x80000001000286A0);
  return Hasher._finalize()();
}

uint64_t sub_10000A91C(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD000000000000031, 0x80000001000286A0);
}

Swift::Int sub_10000A938(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0xD000000000000031, 0x80000001000286A0);
  return Hasher._finalize()();
}

uint64_t sub_10000A988@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030BB0, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_10000A9D8(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000031;
  a1[1] = 0x80000001000286A0;
}

uint64_t sub_10000A9F8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));

  return swift_deallocClassInstance(v0, 88, 7);
}

uint64_t type metadata accessor for ConfigurationBundle()
{
  return objc_opt_self(_TtC11gamepolicyd19ConfigurationBundle);
}

uint64_t getEnumTagSinglePayload for ConfigurationBundleType(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ConfigurationBundleType(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10000AAD8 + 4 * asc_100026990[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000AAF8 + 4 * byte_100026995[v4]))();
}

_BYTE *sub_10000AAD8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000AAF8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000AB00(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000AB08(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000AB10(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000AB18(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10000AB24()
{
  return 0;
}

ValueMetadata *type metadata accessor for ConfigurationBundleType()
{
  return &type metadata for ConfigurationBundleType;
}

unint64_t sub_10000AB44()
{
  unint64_t result;

  result = qword_1000378C8;
  if (!qword_1000378C8)
  {
    result = swift_getWitnessTable(&unk_100026AA0, &type metadata for ConfigurationBundleType);
    atomic_store(result, (unint64_t *)&qword_1000378C8);
  }
  return result;
}

uint64_t sub_10000AB88()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  uint64_t v5;
  Swift::String v6;
  void *v7;
  Swift::String v8;
  uint64_t v9;
  Swift::String v10;
  void *v11;
  Swift::String v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  _StringGuts.grow(_:)(44);
  swift_bridgeObjectRelease(0xE000000000000000);
  v15 = 60;
  v16 = 0xE100000000000000;
  v14 = type metadata accessor for GamingMetadataModel();
  v1 = sub_100002090(&qword_100037BC8);
  v2._countAndFlagsBits = String.init<A>(describing:)(&v14, v1);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._object = (void *)0x8000000100028EB0;
  v4._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v4);
  v14 = *(_QWORD *)(v0 + 24);
  swift_retain(v14);
  v5 = sub_100002090(&qword_100037BD0);
  v6._countAndFlagsBits = String.init<A>(reflecting:)(&v14, v5);
  v7 = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(v7);
  v8._object = (void *)0x8000000100028ED0;
  v8._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v8);
  v14 = *(_QWORD *)(v0 + 16);
  swift_retain(v14);
  v9 = sub_100002090(&qword_100037BD8);
  v10._countAndFlagsBits = String.init<A>(reflecting:)(&v14, v9);
  v11 = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v11);
  v12._countAndFlagsBits = 8194604;
  v12._object = (void *)0xE300000000000000;
  String.append(_:)(v12);
  return v15;
}

uint64_t sub_10000ACD8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for GamingMetadataModel()
{
  return objc_opt_self(_TtC11gamepolicyd19GamingMetadataModel);
}

uint64_t sub_10000AD24()
{
  return 0x6C65646F4DLL;
}

uint64_t sub_10000AD38()
{
  return sub_10000AB88();
}

uint64_t sub_10000AD58()
{
  _QWORD *v0;
  Swift::String v1;
  uint64_t v2;
  Swift::String v3;
  void *object;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  void *v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  void *v14;
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  void *v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  Swift::String v23;
  void *v24;
  Swift::String v25;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v28 = 0;
  v29 = 0xE000000000000000;
  _StringGuts.grow(_:)(123);
  v1._countAndFlagsBits = 60;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  v27 = type metadata accessor for GamingMetadataModel.Policy();
  v2 = sub_100002090(&qword_100037BC0);
  v3._countAndFlagsBits = String.init<A>(describing:)(&v27, v2);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  v5._countAndFlagsBits = 0xD000000000000014;
  v5._object = (void *)0x8000000100028E10;
  String.append(_:)(v5);
  v6 = v0[2];
  swift_bridgeObjectRetain(v6);
  v7 = sub_100002090(&qword_100037608);
  v8._countAndFlagsBits = Dictionary.description.getter(v6, &type metadata for String, v7, &protocol witness table for String);
  v9 = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v9);
  v10._object = (void *)0x8000000100028E30;
  v10._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v10);
  v11 = v0[3];
  v12 = swift_bridgeObjectRetain(v11);
  v13._countAndFlagsBits = Dictionary.description.getter(v12, &type metadata for String, v7, &protocol witness table for String);
  v14 = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  v15._countAndFlagsBits = 0xD000000000000023;
  v15._object = (void *)0x8000000100028E50;
  String.append(_:)(v15);
  v16 = v0[4];
  v17 = swift_bridgeObjectRetain(v16);
  v18._countAndFlagsBits = Array.description.getter(v17, &type metadata for String);
  v19 = v18._object;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);
  v20._countAndFlagsBits = 0xD000000000000024;
  v20._object = (void *)0x8000000100028E80;
  String.append(_:)(v20);
  v21 = v0[5];
  v22 = swift_bridgeObjectRetain(v21);
  v23._countAndFlagsBits = Array.description.getter(v22, &type metadata for String);
  v24 = v23._object;
  String.append(_:)(v23);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  v25._countAndFlagsBits = 8194604;
  v25._object = (void *)0xE300000000000000;
  String.append(_:)(v25);
  return v28;
}

uint64_t sub_10000AF7C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[5]);
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for GamingMetadataModel.Policy()
{
  return objc_opt_self(_TtCC11gamepolicyd19GamingMetadataModel6Policy);
}

uint64_t sub_10000AFD8()
{
  return 0x7963696C6F50;
}

uint64_t sub_10000AFEC()
{
  return sub_10000AD58();
}

uint64_t sub_10000B00C()
{
  _QWORD *v0;
  Swift::String v1;
  uint64_t v2;
  Swift::String v3;
  void *object;
  Swift::String v5;
  uint64_t v6;
  void *v7;
  Swift::String v8;
  Swift::String v9;
  uint64_t v10;
  void *v11;
  Swift::String v12;
  Swift::String v13;
  void *v14;
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v20 = 0;
  v21 = 0xE000000000000000;
  _StringGuts.grow(_:)(70);
  v1._countAndFlagsBits = 60;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  v19 = type metadata accessor for GamingMetadataModel.Launcher();
  v2 = sub_100002090(&qword_100037BB8);
  v3._countAndFlagsBits = String.init<A>(describing:)(&v19, v2);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  v5._countAndFlagsBits = 0x202020200A7B203ELL;
  v5._object = (void *)0xEF203D20656D616ELL;
  String.append(_:)(v5);
  v6 = v0[2];
  v7 = (void *)v0[3];
  swift_bridgeObjectRetain(v7);
  v8._countAndFlagsBits = v6;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v7);
  v9._object = (void *)0x8000000100028DD0;
  v9._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v9);
  v10 = v0[4];
  v11 = (void *)v0[5];
  swift_bridgeObjectRetain(v11);
  v12._countAndFlagsBits = v10;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v11);
  v13._countAndFlagsBits = 0xD000000000000019;
  v13._object = (void *)0x8000000100028DF0;
  String.append(_:)(v13);
  v15 = v0[6];
  v14 = (void *)v0[7];
  swift_bridgeObjectRetain(v14);
  v16._countAndFlagsBits = v15;
  v16._object = v14;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v14);
  v17._countAndFlagsBits = 8194604;
  v17._object = (void *)0xE300000000000000;
  String.append(_:)(v17);
  return v20;
}

uint64_t sub_10000B18C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[7]);
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for GamingMetadataModel.Launcher()
{
  return objc_opt_self(_TtCC11gamepolicyd19GamingMetadataModel8Launcher);
}

uint64_t sub_10000B1E0()
{
  return 0x726568636E75614CLL;
}

uint64_t sub_10000B1F8()
{
  return sub_10000B00C();
}

uint64_t sub_10000B218(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSString v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  void **aBlock;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  void *v58;
  void (*v59)();
  uint64_t v60;
  id v61;
  _OWORD v62[2];

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v54 - v9;
  v11 = *(_QWORD *)(kGamePolicyToolEntitlement.unsafeMutableAddressor(v8) + 8);
  swift_bridgeObjectRetain(v11);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v13 = objc_msgSend(a1, "valueForEntitlement:", v12);

  if (v13)
  {
    _bridgeAnyObjectToAny(_:)(v62, v13);
    swift_unknownObjectRelease(v13);
  }
  else
  {
    memset(v62, 0, sizeof(v62));
  }
  sub_100001E90((uint64_t)v62, (uint64_t)&aBlock);
  if (!v58)
  {
    v15 = sub_100004EF8((uint64_t)&aBlock);
    goto LABEL_11;
  }
  v14 = sub_1000046A8(0, (unint64_t *)&unk_100037C90, NSNumber_ptr);
  v15 = swift_dynamicCast(&v61, &aBlock, (char *)&type metadata for Any + 8, v14, 6);
  if ((v15 & 1) == 0)
  {
LABEL_11:
    v44 = Logger.toolCoordinator.unsafeMutableAddressor(v15);
    v45 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v44, v3);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Unable to accept incoming tool connection for unentitled process.", v48, 2u);
      swift_slowDealloc(v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return 0;
  }
  v16 = v61;
  v17 = objc_msgSend(v61, "BOOLValue");
  if ((v17 & 1) == 0)
  {
    v49 = Logger.toolCoordinator.unsafeMutableAddressor(v17);
    v50 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, v49, v3);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Unable to accept incoming tool connection for unentitled process.", v53, 2u);
      swift_slowDealloc(v53, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
    return 0;
  }
  v18 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_queue);
  v19 = type metadata accessor for GamePolicyToolProxy();
  v20 = (_QWORD *)swift_allocObject(v19, 48, 7);
  v20[5] = 0;
  v21 = swift_unknownObjectWeakInit(v20 + 4, 0);
  v20[2] = a1;
  v20[3] = v18;
  v20[5] = &off_100030EC0;
  swift_unknownObjectWeakAssign(v21, v1);
  v22 = (void *)objc_opt_self(NSXPCInterface);
  v23 = a1;
  v24 = v18;
  v25 = objc_msgSend(v22, "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP10GamePolicy20GamePolicyToolClient_);
  objc_msgSend(v23, "setRemoteObjectInterface:", v25);

  v26 = objc_msgSend(v22, "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP10GamePolicy20GamePolicyToolServer_);
  objc_msgSend(v23, "setExportedInterface:", v26);

  objc_msgSend(v23, "setExportedObject:", v20);
  v27 = swift_allocObject(&unk_100030ED8, 24, 7);
  swift_unknownObjectWeakInit(v27 + 16, v1);
  v28 = swift_allocObject(&unk_100030FA0, 32, 7);
  *(_QWORD *)(v28 + 16) = v27;
  *(_QWORD *)(v28 + 24) = v23;
  v59 = sub_10000C67C;
  v60 = v28;
  aBlock = _NSConcreteStackBlock;
  v56 = 1107296256;
  v57 = sub_10000215C;
  v58 = &unk_100030FB8;
  v29 = _Block_copy(&aBlock);
  v30 = v60;
  v31 = v23;
  swift_release(v30);
  objc_msgSend(v31, "setInvalidationHandler:", v29);
  _Block_release(v29);
  v32 = swift_allocObject(&unk_100030ED8, 24, 7);
  swift_unknownObjectWeakInit(v32 + 16, v1);
  v33 = swift_allocObject(&unk_100030FF0, 32, 7);
  *(_QWORD *)(v33 + 16) = v32;
  *(_QWORD *)(v33 + 24) = v31;
  v59 = sub_10000C6E4;
  v60 = v33;
  aBlock = _NSConcreteStackBlock;
  v56 = 1107296256;
  v57 = sub_10000215C;
  v58 = &unk_100031008;
  v34 = _Block_copy(&aBlock);
  v35 = v60;
  v36 = v31;
  swift_release(v35);
  objc_msgSend(v36, "setInterruptionHandler:", v34);
  _Block_release(v34);
  v37 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock);
  objc_msgSend(v37, "lock");
  v38 = (_QWORD *)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies);
  swift_beginAccess(v38, &aBlock, 33, 0);
  v39 = swift_retain(v20);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v39);
  v40 = *(_QWORD *)((*v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v41 = *(_QWORD *)((*v38 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v40 >= v41 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v41 > 1, v40 + 1, 1);
  v42 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()(v42);
  swift_endAccess(&aBlock);
  objc_msgSend(v37, "unlock");
  objc_msgSend(v36, "resume");
  swift_release(v20);

  return 1;
}

uint64_t sub_10000B7D0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  NSString v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  id v13;
  Class isa;
  Class v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void **aBlock;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  void (*v37)();
  uint64_t v38;
  id v39;
  _OWORD v40[2];

  v3 = *(_QWORD *)(kGamePolicyPrivilegedToolEntitlement.unsafeMutableAddressor() + 8);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v5 = objc_msgSend(a1, "valueForEntitlement:", v4);

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)(v40, v5);
    swift_unknownObjectRelease(v5);
  }
  else
  {
    memset(v40, 0, sizeof(v40));
  }
  sub_100001E90((uint64_t)v40, (uint64_t)&aBlock);
  if (!v36)
  {
    sub_100004EF8((uint64_t)&aBlock);
    return 0;
  }
  v6 = sub_1000046A8(0, (unint64_t *)&unk_100037C90, NSNumber_ptr);
  if ((swift_dynamicCast(&v39, &aBlock, (char *)&type metadata for Any + 8, v6, 6) & 1) == 0)
    return 0;
  v7 = v39;
  if ((objc_msgSend(v39, "BOOLValue") & 1) == 0)
  {

    return 0;
  }
  v8 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_queue);
  v9 = type metadata accessor for GamePolicyPrivilegedToolProxy();
  v10 = (_QWORD *)swift_allocObject(v9, 56, 7);
  v10[5] = 0;
  v11 = swift_unknownObjectWeakInit(v10 + 4, 0);
  v10[2] = a1;
  v10[3] = v8;
  v10[5] = &off_100030EB8;
  v10[6] = 0;
  swift_unknownObjectWeakAssign(v11, v1);
  v12 = a1;
  v13 = v8;
  isa = GamePolicyPrivilegedToolClientInterface()().super.isa;
  objc_msgSend(v12, "setRemoteObjectInterface:", isa);

  v15 = GamePolicyPrivilegedToolServerInterface()().super.isa;
  objc_msgSend(v12, "setExportedInterface:", v15);

  objc_msgSend(v12, "setExportedObject:", v10);
  v16 = swift_allocObject(&unk_100030ED8, 24, 7);
  swift_unknownObjectWeakInit(v16 + 16, v1);
  v17 = swift_allocObject(&unk_100030F00, 32, 7);
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = v12;
  v37 = sub_10000C178;
  v38 = v17;
  aBlock = _NSConcreteStackBlock;
  v34 = 1107296256;
  v35 = sub_10000215C;
  v36 = &unk_100030F18;
  v18 = _Block_copy(&aBlock);
  v19 = v38;
  v20 = v12;
  swift_release(v19);
  objc_msgSend(v20, "setInvalidationHandler:", v18);
  _Block_release(v18);
  v21 = swift_allocObject(&unk_100030ED8, 24, 7);
  swift_unknownObjectWeakInit(v21 + 16, v1);
  v22 = swift_allocObject(&unk_100030F50, 32, 7);
  *(_QWORD *)(v22 + 16) = v21;
  *(_QWORD *)(v22 + 24) = v20;
  v37 = sub_10000C1B4;
  v38 = v22;
  aBlock = _NSConcreteStackBlock;
  v34 = 1107296256;
  v35 = sub_10000215C;
  v36 = &unk_100030F68;
  v23 = _Block_copy(&aBlock);
  v24 = v38;
  v25 = v20;
  swift_release(v24);
  objc_msgSend(v25, "setInterruptionHandler:", v23);
  _Block_release(v23);
  v26 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock);
  objc_msgSend(v26, "lock");
  v27 = (_QWORD *)(v1 + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies);
  swift_beginAccess(v27, &aBlock, 33, 0);
  v28 = swift_retain(v10);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v28);
  v29 = *(_QWORD *)((*v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v30 = *(_QWORD *)((*v27 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v29 >= v30 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v29 + 1, 1);
  v31 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()(v31);
  swift_endAccess(&aBlock);
  objc_msgSend(v26, "unlock");
  objc_msgSend(v25, "resume");
  swift_release(v10);

  return 1;
}

void sub_10000BBC4(uint64_t a1, void *a2, const char *a3, _QWORD *a4, uint64_t (*a5)(uint64_t), void (*a6)(uint64_t, uint64_t))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t Strong;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void (*v32)(uint64_t, uint64_t);
  _BYTE v33[24];
  _BYTE v34[24];

  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v34, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v17 = (char *)Strong;
    v31 = a5;
    v32 = a6;
    v18 = Logger.toolCoordinator.unsafeMutableAddressor();
    v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v18, v12);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, a3, v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v23 = OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock;
    objc_msgSend(*(id *)&v17[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock], "lock");
    v24 = (uint64_t *)&v17[*a4];
    swift_beginAccess(v24, v33, 33, 0);
    v25 = a2;
    v26 = sub_10000C310(v24, (uint64_t)v25, v31);

    v27 = *v24;
    if ((unint64_t)*v24 >> 62)
    {
      if (v27 < 0)
        v29 = *v24;
      else
        v29 = v27 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*v24);
      v28 = _CocoaArrayWrapper.endIndex.getter(v29);
      swift_bridgeObjectRelease(v27);
    }
    else
    {
      v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v28 < v26)
    {
      __break(1u);
    }
    else
    {
      v32(v26, v28);
      swift_endAccess(v33);
      objc_msgSend(*(id *)&v17[v23], "unlock");

    }
  }
}

void sub_10000BDE0(uint64_t a1, void *a2, const char *a3, _QWORD *a4, uint64_t (*a5)(uint64_t), void (*a6)(_QWORD, _QWORD))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t Strong;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  void (*v22)(_QWORD, _QWORD);
  uint8_t *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(_QWORD, _QWORD);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t (*v36)(uint64_t);
  _BYTE v37[24];
  _BYTE v38[24];

  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v38, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v17 = (char *)Strong;
    v35 = a2;
    v36 = a5;
    v18 = Logger.toolCoordinator.unsafeMutableAddressor();
    v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v18, v12);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = a6;
      v23 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, a3, v23, 2u);
      v24 = v23;
      a6 = v22;
      swift_slowDealloc(v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v25 = OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock;
    objc_msgSend(*(id *)&v17[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock], "lock");
    v26 = (uint64_t *)&v17[*a4];
    swift_beginAccess(v26, v37, 33, 0);
    v27 = v35;
    v28 = sub_10000C310(v26, (uint64_t)v27, v36);

    v29 = *v26;
    if ((unint64_t)*v26 >> 62)
    {
      v31 = a6;
      if (v29 < 0)
        v32 = *v26;
      else
        v32 = v29 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*v26);
      v33 = v32;
      a6 = v31;
      v30 = _CocoaArrayWrapper.endIndex.getter(v33);
      swift_bridgeObjectRelease(v29);
      if (v30 >= v28)
        goto LABEL_6;
    }
    else
    {
      v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v30 >= v28)
      {
LABEL_6:
        a6(v28, v30);
        swift_endAccess(v37);
        objc_msgSend(*(id *)&v17[v25], "unlock");
        objc_msgSend(v27, "invalidate");

        return;
      }
    }
    __break(1u);
  }
}

id sub_10000C0A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamePolicyToolCoordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GamePolicyToolCoordinator()
{
  return objc_opt_self(_TtC11gamepolicyd25GamePolicyToolCoordinator);
}

uint64_t sub_10000C150()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000C178()
{
  uint64_t v0;

  sub_10000BBC4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), "Privileged tool connection invalidated.", &OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies, (uint64_t (*)(uint64_t))sub_100015244, (void (*)(uint64_t, uint64_t))sub_100015468);
}

void sub_10000C1B4()
{
  uint64_t v0;

  sub_10000BDE0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), "Privileged tool connection interrupted.", &OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies, (uint64_t (*)(uint64_t))sub_100015244, (void (*)(_QWORD, _QWORD))sub_100015468);
}

uint64_t sub_10000C1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  if (!((unint64_t)a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
    return 0;
  }
LABEL_13:
  if (a1 < 0)
    v9 = a1;
  else
    v9 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v4 = _CocoaArrayWrapper.endIndex.getter(v9);
  swift_bridgeObjectRelease(a1);
  if (!v4)
    return 0;
LABEL_3:
  sub_1000046A8(0, (unint64_t *)&unk_100038B70, NSObject_ptr);
  for (i = 0; ; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 8 * i + 32);
      swift_retain(v6);
    }
    v7 = static NSObject.== infix(_:_:)(*(_QWORD *)(v6 + 16), a2);
    swift_release(v6);
    if ((v7 & 1) != 0)
      break;
    v8 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    if (v8 == v4)
      return 0;
  }
  return i;
}

uint64_t sub_10000C310(uint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = *a1;
  v7 = swift_bridgeObjectRetain(*a1);
  v8 = sub_10000C1EC(v7, a2);
  v10 = v9;
  v11 = v3;
  swift_bridgeObjectRelease(v6);
  if (v3)
    return v8;
  if ((v10 & 1) == 0)
  {
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_57;
    v10 = *a1;
    if ((unint64_t)*a1 >> 62)
    {
LABEL_58:
      if (v10 < 0)
        v30 = v10;
      else
        v30 = v10 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v10);
      v31 = _CocoaArrayWrapper.endIndex.getter(v30);
      swift_bridgeObjectRelease(v10);
      if (v12 != v31)
        goto LABEL_6;
    }
    else if (v12 != *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      sub_1000046A8(0, (unint64_t *)&unk_100038B70, NSObject_ptr);
      v12 = v8 + 5;
      v34 = v11;
      while (1)
      {
        v13 = v12 - 4;
        v14 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          v15 = specialized _ArrayBuffer._getElementSlowPath(_:)(v12 - 4, v14);
        }
        else
        {
          if ((v13 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
            goto LABEL_58;
          }
          if (v13 >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_48;
          v15 = *(_QWORD *)(v14 + 8 * v12);
          swift_retain(v15);
        }
        v10 = static NSObject.== infix(_:_:)(*(_QWORD *)(v15 + 16), a2);
        swift_release(v15);
        if ((v10 & 1) == 0)
          break;
LABEL_32:
        v24 = __OFADD__(v13, 1);
        v25 = v12 - 3;
        if (v24)
          goto LABEL_49;
        v10 = *a1;
        if ((unint64_t)*a1 >> 62)
        {
          if (v10 < 0)
            v27 = *a1;
          else
            v27 = v10 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(*a1);
          v26 = _CocoaArrayWrapper.endIndex.getter(v27);
          swift_bridgeObjectRelease(v10);
        }
        else
        {
          v26 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        ++v12;
        if (v25 == v26)
          return v8;
      }
      if (v13 == v8)
      {
LABEL_31:
        v24 = __OFADD__(v8++, 1);
        if (v24)
          goto LABEL_50;
        goto LABEL_32;
      }
      v10 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, *a1);
        v10 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_17:
          if ((v13 & 0x8000000000000000) != 0)
            goto LABEL_53;
          if (v13 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_54;
          v16 = *(_QWORD *)(v10 + 8 * v12);
          swift_retain(v16);
          goto LABEL_20;
        }
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0)
          goto LABEL_51;
        if (v8 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_52;
        v11 = *(_QWORD *)(v10 + 8 * v8 + 32);
        swift_retain(v11);
        if ((v10 & 0xC000000000000001) == 0)
          goto LABEL_17;
      }
      v16 = specialized _ArrayBuffer._getElementSlowPath(_:)(v12 - 4, v10);
      v10 = *a1;
LABEL_20:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(v10);
      *a1 = v10;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v10 < 0 || (v10 & 0x4000000000000000) != 0)
      {
        v10 = a3(v10);
        *a1 = v10;
      }
      v18 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 8 * v8 + 0x20);
      *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 8 * v8 + 0x20) = v16;
      v19 = swift_release(v18);
      specialized Array._endMutation()(v19);
      v10 = *a1;
      v20 = swift_isUniquelyReferenced_nonNull_bridgeObject(*a1);
      *a1 = v10;
      if (!v20 || v10 < 0 || (v10 & 0x4000000000000000) != 0)
      {
        v10 = a3(v10);
        *a1 = v10;
      }
      if ((v13 & 0x8000000000000000) != 0)
        goto LABEL_55;
      v21 = v10 & 0xFFFFFFFFFFFFFF8;
      if (v13 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_56;
      v22 = *(_QWORD *)(v21 + 8 * v12);
      *(_QWORD *)(v21 + 8 * v12) = v11;
      v23 = swift_release(v22);
      v10 = (uint64_t)a1;
      specialized Array._endMutation()(v23);
      v11 = v34;
      goto LABEL_31;
    }
    return v8;
  }
  v28 = *a1;
  if (!((unint64_t)*a1 >> 62))
    return *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v28 < 0)
    v32 = *a1;
  else
    v32 = v28 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*a1);
  v33 = _CocoaArrayWrapper.endIndex.getter(v32);
  swift_bridgeObjectRelease(v28);
  return v33;
}

void sub_10000C67C()
{
  uint64_t v0;

  sub_10000BBC4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), "Tool connection invalidated.", &OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies, (uint64_t (*)(uint64_t))sub_100015244, (void (*)(uint64_t, uint64_t))sub_100015448);
}

uint64_t sub_10000C6B8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000C6E4()
{
  uint64_t v0;

  sub_10000BDE0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), "Tool connection interrupted.", &OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies, (uint64_t (*)(uint64_t))sub_100015244, (void (*)(_QWORD, _QWORD))sub_100015448);
}

uint64_t sub_10000C71C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  NSObject **v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  NSObject **v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;

  v40 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v40 - 8);
  v3 = __chkstk_darwin(v40);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v38 - v6;
  v8 = objc_msgSend(a1, "serviceName");
  if (v8)
  {
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v12 = v11;

    if (v10 == 0xD00000000000001ALL && v12 == 0x8000000100028FD0)
    {
      swift_bridgeObjectRelease(0x8000000100028FD0);
      goto LABEL_6;
    }
    v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, 0xD00000000000001ALL, 0x8000000100028FD0, 0);
    swift_bridgeObjectRelease(v12);
    if ((v13 & 1) != 0)
    {
LABEL_6:
      v14 = sub_10000B218(a1);
      if ((v14 & 1) == 0)
        goto LABEL_16;
      goto LABEL_14;
    }
  }
  v14 = (uint64_t)objc_msgSend(a1, "serviceName");
  if (!v14)
    goto LABEL_16;
  v15 = (void *)v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v18 = v17;

  if (v16 == 0xD000000000000025 && v18 == 0x8000000100028FA0)
  {
    swift_bridgeObjectRelease(0x8000000100028FA0);
  }
  else
  {
    v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, 0xD000000000000025, 0x8000000100028FA0, 0);
    v14 = swift_bridgeObjectRelease(v18);
    if ((v19 & 1) == 0)
      goto LABEL_16;
  }
  v14 = sub_10000B7D0(a1);
  if ((v14 & 1) == 0)
  {
LABEL_16:
    v29 = Logger.toolCoordinator.unsafeMutableAddressor(v14);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v29, v40);
    v30 = a1;
    v22 = Logger.logObject.getter(v30);
    v31 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v32 = 138412290;
      v41 = v30;
      v38 = v5;
      v34 = v30;
      v39 = v2;
      v35 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v32 + 4, v32 + 12);
      *v33 = v30;

      v2 = v39;
      _os_log_impl((void *)&_mh_execute_header, v22, v31, "GamePolicyToolCoordinator: rejecting incoming connection %@", v32, 0xCu);
      v36 = sub_100002090((uint64_t *)&unk_100037CA0);
      swift_arrayDestroy(v33, 1, v36);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);
      v28 = 0;
      v7 = v38;
    }
    else
    {

      v28 = 0;
      v22 = v30;
      v7 = v5;
    }
    goto LABEL_21;
  }
LABEL_14:
  v20 = Logger.toolCoordinator.unsafeMutableAddressor(v14);
  v39 = v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v20, v40);
  v21 = a1;
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc(12, -1);
    v25 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v24 = 138412290;
    v41 = v21;
    v26 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v24 + 4, v24 + 12);
    *v25 = v21;

    _os_log_impl((void *)&_mh_execute_header, v22, v23, "GamePolicyToolCoordinator: accepting incoming connection %@", v24, 0xCu);
    v27 = sub_100002090((uint64_t *)&unk_100037CA0);
    v28 = 1;
    swift_arrayDestroy(v25, 1, v27);
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v24, -1, -1);
  }
  else
  {

    v28 = 1;
    v22 = v21;
  }
  v2 = v39;
LABEL_21:

  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v40);
  return v28;
}

uint64_t sub_10000CB90()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  uint64_t result;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = Logger.toolCoordinator.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "GamePolicyToolProxy: ping!", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v12 = objc_msgSend(*(id *)(v1 + 16), "remoteObjectProxy");
  _bridgeAnyObjectToAny(_:)(v18, v12);
  swift_unknownObjectRelease(v12);
  v13 = sub_100002090(&qword_100037D88);
  result = swift_dynamicCast(&v17, v18, (char *)&type metadata for Any + 8, v13, 6);
  if ((result & 1) != 0)
  {
    v15 = v17;
    objc_msgSend(v17, "pong");
    return swift_unknownObjectRelease(v15);
  }
  return result;
}

uint64_t sub_10000CD38()
{
  uint64_t v0;

  sub_10000CD8C(v0 + 32);
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for GamePolicyToolProxy()
{
  return objc_opt_self(_TtC11gamepolicyd19GamePolicyToolProxy);
}

uint64_t sub_10000CD8C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

uint64_t sub_10000CDB0()
{
  _QWORD *v0;
  uint64_t v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  Swift::String v5;
  void *v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  void *v11;
  Swift::String v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  _StringGuts.grow(_:)(29);
  swift_bridgeObjectRelease(0xE000000000000000);
  v16 = 60;
  v17 = 0xE100000000000000;
  v15 = type metadata accessor for GamingMetadataDBBundle();
  v1 = sub_100002090(&qword_100037E58);
  v2._countAndFlagsBits = String.init<A>(describing:)(&v15, v1);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._countAndFlagsBits = 30240;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = Version.description.getter(v0[2], v0[3], v0[4]);
  v6 = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v6);
  v7._object = (void *)0x80000001000290C0;
  v7._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v7);
  v8 = v0[7];
  if ((unint64_t)v8 >> 62)
  {
    if (v8 < 0)
      v14 = v0[7];
    else
      v14 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v8);
    v9 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v15 = v9;
  v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v11 = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v11);
  v12._countAndFlagsBits = 62;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  return v16;
}

uint64_t sub_10000CF0C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[6]);
  swift_bridgeObjectRelease(v0[7]);
  swift_bridgeObjectRelease(v0[8]);
  return swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for GamingMetadataDBBundle()
{
  return objc_opt_self(_TtC11gamepolicyd22GamingMetadataDBBundle);
}

uint64_t sub_10000CF60()
{
  return sub_10000CDB0();
}

uint64_t sub_10000CF80()
{
  _QWORD *v0;
  uint64_t v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  uint64_t v5;
  void *v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  void *v12;
  Swift::String v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease(0xE000000000000000);
  v17 = 60;
  v18 = 0xE100000000000000;
  v16 = _s10DescriptorCMa();
  v1 = sub_100002090(&qword_100037F10);
  v2._countAndFlagsBits = String.init<A>(describing:)(&v16, v1);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._countAndFlagsBits = 0x6669746E65646920;
  v4._object = (void *)0xEC0000003D726569;
  String.append(_:)(v4);
  v5 = v0[2];
  v6 = (void *)v0[3];
  swift_bridgeObjectRetain(v6);
  v7._countAndFlagsBits = v5;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(v6);
  v8._object = (void *)0x8000000100029140;
  v8._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v8);
  v9 = v0[4];
  if ((unint64_t)v9 >> 62)
  {
    if (v9 < 0)
      v15 = v0[4];
    else
      v15 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v9);
    v10 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v16 = v10;
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v12 = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v12);
  v13._countAndFlagsBits = 62;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  return v17;
}

uint64_t sub_10000D0F4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t _s10DescriptorCMa()
{
  return objc_opt_self(_TtCC11gamepolicyd22GamingMetadataDBBundle10Descriptor);
}

uint64_t sub_10000D140()
{
  return sub_10000CF80();
}

Swift::Int sub_10000D160()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10000D1A0()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_10000D1C4(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

const char *sub_10000D200()
{
  return "modelManagerGameAssertion";
}

uint64_t sub_10000D214()
{
  uint64_t v0;

  sub_10000CD8C(v0 + 16);
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for GamePolicyCoordinatorObserver()
{
  return objc_opt_self(_TtC11gamepolicyd29GamePolicyCoordinatorObserver);
}

NSString sub_10000D258()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_1000391B8 = (uint64_t)result;
  return result;
}

NSString sub_10000D28C()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_1000391C0 = (uint64_t)result;
  return result;
}

NSString sub_10000D2C0()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_1000391C8 = (uint64_t)result;
  return result;
}

NSString sub_10000D2F4()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_1000391D0 = (uint64_t)result;
  return result;
}

NSString sub_10000D328()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_1000391D8 = (uint64_t)result;
  return result;
}

__n128 sub_10000D360@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __n128 result;
  __n128 v23;
  char v24[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v4 = *(void **)(a1 + 16);
  objc_msgSend(v4, "lock");
  swift_beginAccess(a1 + 40, v24, 1, 0);
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v23 = *(__n128 *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  v10 = *(id *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  objc_msgSend(v4, "unlock");

  a2->n128_u64[0] = (unint64_t)v18;
  a2->n128_u64[1] = (unint64_t)v19;
  a2[1].n128_u64[0] = (unint64_t)v20;
  a2[1].n128_u64[1] = (unint64_t)v21;
  result = v23;
  a2[2] = v23;
  a2[3].n128_u64[0] = v8;
  a2[3].n128_u64[1] = v9;
  return result;
}

id sub_10000D494(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _BYTE v15[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v2 = *(void **)(a1 + 16);
  objc_msgSend(v2, "lock");
  swift_beginAccess(a1 + 40, v15, 1, 0);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v2, "unlock");

  return v10;
}

void sub_10000D580(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  BOOL v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSString v39;
  id v40;
  char *v41;
  id v42;
  Class isa;
  id v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[4];
  char v54[24];

  v4 = type metadata accessor for Notification(0);
  v49 = *(_QWORD *)(v4 - 8);
  v50 = v4;
  __chkstk_darwin(v4);
  v48 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)a1[2];
  objc_msgSend(v9, "lock");
  swift_beginAccess(a1 + 5, v54, 1, 0);
  v10 = (void *)a1[5];
  v11 = (void *)a1[6];
  v12 = (void *)a1[7];
  v13 = (void *)a1[8];
  v14 = a1[9];
  a1[9] = a2;
  v15 = v10;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = objc_msgSend(v9, "unlock");
  if (v14 != a2)
  {
    v24 = Logger.policyCoordinator.unsafeMutableAddressor(v23);
    v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v24, v51);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    v28 = os_log_type_enabled(v26, v27);
    v47 = v19;
    if (v28)
    {
      v45 = v21;
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v46 = v20;
      v31 = v30;
      v52 = a2;
      v53[0] = v30;
      *(_DWORD *)v29 = 136446210;
      v32 = String.init<A>(describing:)(&v52, &type metadata for ModeEnablementStrategy);
      v44 = v22;
      v34 = v33;
      v52 = sub_100004814(v32, v33, v53);
      v21 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v29 + 4, v29 + 12);
      v35 = v34;
      v22 = v44;
      swift_bridgeObjectRelease(v35);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Updating game mode enablement strategy to %{public}s", v29, 0xCu);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      v36 = v31;
      v20 = v46;
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v51);
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v37 = off_1000375F8;
    v38 = (void *)*((_QWORD *)off_1000375F8 + 2);
    swift_retain(off_1000375F8);
    v39 = String._bridgeToObjectiveC()();
    objc_msgSend(v38, "setInteger:forKey:", a2, v39);
    swift_release(v37);

    if (qword_100037330 != -1)
      swift_once(&qword_100037330, sub_10000D258);
    v53[3] = (uint64_t)&type metadata for ModeEnablementStrategy;
    v53[0] = a2;
    v40 = (id)qword_1000391B8;
    v41 = v48;
    Notification.init(name:object:userInfo:)(v40, v53, 0);
    v42 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    isa = Notification._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v42, "postNotification:", isa);

    (*(void (**)(char *, uint64_t))(v49 + 8))(v41, v50);
    v19 = v47;
  }

}

void sub_10000D964(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  BOOL v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSString v39;
  id v40;
  char *v41;
  id v42;
  Class isa;
  id v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[4];
  char v54[24];

  v4 = type metadata accessor for Notification(0);
  v49 = *(_QWORD *)(v4 - 8);
  v50 = v4;
  __chkstk_darwin(v4);
  v48 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)a1[2];
  objc_msgSend(v9, "lock");
  swift_beginAccess(a1 + 5, v54, 1, 0);
  v10 = (void *)a1[5];
  v11 = (void *)a1[6];
  v12 = (void *)a1[7];
  v13 = (void *)a1[8];
  v14 = a1[11];
  a1[11] = a2;
  v15 = v10;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = objc_msgSend(v9, "unlock");
  if (v14 != a2)
  {
    v24 = Logger.policyCoordinator.unsafeMutableAddressor(v23);
    v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v24, v51);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    v28 = os_log_type_enabled(v26, v27);
    v47 = v19;
    if (v28)
    {
      v45 = v21;
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v46 = v20;
      v31 = v30;
      v52 = a2;
      v53[0] = v30;
      *(_DWORD *)v29 = 136446210;
      v32 = String.init<A>(describing:)(&v52, &type metadata for ModeEnablementStrategy);
      v44 = v22;
      v34 = v33;
      v52 = sub_100004814(v32, v33, v53);
      v21 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v29 + 4, v29 + 12);
      v35 = v34;
      v22 = v44;
      swift_bridgeObjectRelease(v35);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Updating dynamic splitter enablement strategy to %{public}s", v29, 0xCu);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      v36 = v31;
      v20 = v46;
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v51);
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v37 = off_1000375F8;
    v38 = (void *)*((_QWORD *)off_1000375F8 + 2);
    swift_retain(off_1000375F8);
    v39 = String._bridgeToObjectiveC()();
    objc_msgSend(v38, "setInteger:forKey:", a2, v39);
    swift_release(v37);

    if (qword_100037348 != -1)
      swift_once(&qword_100037348, sub_10000D2F4);
    v53[3] = (uint64_t)&type metadata for ModeEnablementStrategy;
    v53[0] = a2;
    v40 = (id)qword_1000391D0;
    v41 = v48;
    Notification.init(name:object:userInfo:)(v40, v53, 0);
    v42 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    isa = Notification._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v42, "postNotification:", isa);

    (*(void (**)(char *, uint64_t))(v49 + 8))(v41, v50);
    v19 = v47;
  }

}

void sub_10000DD48(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  BOOL v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSString v39;
  id v40;
  char *v41;
  id v42;
  Class isa;
  id v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[4];
  char v54[24];

  v4 = type metadata accessor for Notification(0);
  v49 = *(_QWORD *)(v4 - 8);
  v50 = v4;
  __chkstk_darwin(v4);
  v48 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)a1[2];
  objc_msgSend(v9, "lock");
  swift_beginAccess(a1 + 5, v54, 1, 0);
  v10 = (void *)a1[5];
  v11 = (void *)a1[6];
  v12 = (void *)a1[7];
  v13 = (void *)a1[8];
  v14 = a1[10];
  a1[10] = a2;
  v15 = v10;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = objc_msgSend(v9, "unlock");
  if (v14 != a2)
  {
    v24 = Logger.policyCoordinator.unsafeMutableAddressor(v23);
    v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v24, v51);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    v28 = os_log_type_enabled(v26, v27);
    v47 = v19;
    if (v28)
    {
      v45 = v21;
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v46 = v20;
      v31 = v30;
      v52 = a2;
      v53[0] = v30;
      *(_DWORD *)v29 = 136446210;
      v32 = String.init<A>(describing:)(&v52, &type metadata for ModeEnablementStrategy);
      v44 = v22;
      v34 = v33;
      v52 = sub_100004814(v32, v33, v53);
      v21 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v29 + 4, v29 + 12);
      v35 = v34;
      v22 = v44;
      swift_bridgeObjectRelease(v35);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Updating sustained execution mode enablement strategy to %{public}s", v29, 0xCu);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      v36 = v31;
      v20 = v46;
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v51);
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v37 = off_1000375F8;
    v38 = (void *)*((_QWORD *)off_1000375F8 + 2);
    swift_retain(off_1000375F8);
    v39 = String._bridgeToObjectiveC()();
    objc_msgSend(v38, "setInteger:forKey:", a2, v39);
    swift_release(v37);

    if (qword_100037340 != -1)
      swift_once(&qword_100037340, sub_10000D2C0);
    v53[3] = (uint64_t)&type metadata for ModeEnablementStrategy;
    v53[0] = a2;
    v40 = (id)qword_1000391C8;
    v41 = v48;
    Notification.init(name:object:userInfo:)(v40, v53, 0);
    v42 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    isa = Notification._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v42, "postNotification:", isa);

    (*(void (**)(char *, uint64_t))(v49 + 8))(v41, v50);
    v19 = v47;
  }

}

void sub_10000E12C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  BOOL v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint8_t *v36;
  void *v37;
  void *v38;
  NSString v39;
  id v40;
  char *v41;
  id v42;
  Class isa;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54[4];
  char v55[24];

  v4 = type metadata accessor for Notification(0);
  v50 = *(_QWORD *)(v4 - 8);
  v51 = v4;
  __chkstk_darwin(v4);
  v49 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52);
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)a1[2];
  objc_msgSend(v9, "lock");
  swift_beginAccess(a1 + 5, v55, 1, 0);
  v10 = (void *)a1[5];
  v11 = (void *)a1[6];
  v12 = (void *)a1[7];
  v13 = (void *)a1[8];
  v14 = a1[12];
  a1[12] = a2;
  v15 = v10;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = objc_msgSend(v9, "unlock");
  if (v14 == a2)
  {

  }
  else
  {
    v24 = Logger.policyCoordinator.unsafeMutableAddressor(v23);
    v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v24, v52);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    v28 = os_log_type_enabled(v26, v27);
    v48 = v20;
    if (v28)
    {
      v46 = v21;
      v29 = swift_slowAlloc(12, -1);
      v47 = v19;
      v30 = (uint8_t *)v29;
      v31 = swift_slowAlloc(32, -1);
      v53 = a2;
      v54[0] = v31;
      *(_DWORD *)v30 = 136446210;
      v32 = String.init<A>(describing:)(&v53, &type metadata for ModelManagerPolicyStrategy);
      v45 = v22;
      v34 = v33;
      v53 = sub_100004814(v32, v33, v54);
      v21 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v30 + 4, v30 + 12);
      v35 = v34;
      v22 = v45;
      swift_bridgeObjectRelease(v35);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Updating game mode ModelManager policy strategy to %{public}s", v30, 0xCu);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      v36 = v30;
      v19 = v47;
      swift_slowDealloc(v36, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v52);
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v37 = off_1000375F8;
    v38 = (void *)*((_QWORD *)off_1000375F8 + 2);
    swift_retain(off_1000375F8);
    v39 = String._bridgeToObjectiveC()();
    objc_msgSend(v38, "setInteger:forKey:", a2, v39);
    swift_release(v37);

    if (qword_100037338 != -1)
      swift_once(&qword_100037338, sub_10000D28C);
    v54[3] = (uint64_t)&type metadata for ModelManagerPolicyStrategy;
    v54[0] = a2;
    v40 = (id)qword_1000391C0;
    v41 = v49;
    Notification.init(name:object:userInfo:)(v40, v54, 0);
    v42 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    isa = Notification._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v42, "postNotification:", isa);

    v44 = v48;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v41, v51);
  }
}

id sub_10000E534(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _BYTE v16[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v2 = *(void **)(a1 + 16);
  objc_msgSend(v2, "lock");
  swift_beginAccess(a1 + 40, v16, 1, 0);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v2, "unlock");

  return v13;
}

id sub_10000E624(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _BYTE v16[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v2 = *(void **)(a1 + 16);
  objc_msgSend(v2, "lock");
  swift_beginAccess(a1 + 40, v16, 1, 0);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v7;
  v11 = v6;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v2, "unlock");

  return v12;
}

id sub_10000E714(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _BYTE v15[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v2 = *(void **)(a1 + 16);
  objc_msgSend(v2, "lock");
  swift_beginAccess(a1 + 40, v15, 1, 0);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v2, "unlock");

  return v13;
}

uint64_t sub_10000E80C(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _BYTE v17[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v2 = (void *)a1[2];
  objc_msgSend(v2, "lock");
  swift_beginAccess(a1 + 5, v17, 1, 0);
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = (void *)a1[7];
  v6 = (void *)a1[8];
  v7 = a1[9];
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v2, "unlock");

  return v7;
}

uint64_t sub_10000E8F8(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _BYTE v17[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v2 = (void *)a1[2];
  objc_msgSend(v2, "lock");
  swift_beginAccess(a1 + 5, v17, 1, 0);
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = (void *)a1[7];
  v6 = (void *)a1[8];
  v7 = a1[10];
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v2, "unlock");

  return v7;
}

uint64_t sub_10000E9E4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _BYTE v17[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v2 = (void *)a1[2];
  objc_msgSend(v2, "lock");
  swift_beginAccess(a1 + 5, v17, 1, 0);
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = (void *)a1[7];
  v6 = (void *)a1[8];
  v7 = a1[11];
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v2, "unlock");

  return v7;
}

uint64_t sub_10000EAD4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _BYTE v17[24];

  type metadata accessor for Notification(0);
  type metadata accessor for Logger(0);
  v2 = (void *)a1[2];
  objc_msgSend(v2, "lock");
  swift_beginAccess(a1 + 5, v17, 1, 0);
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = (void *)a1[7];
  v6 = (void *)a1[8];
  v7 = a1[12];
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v2, "unlock");

  return v7;
}

uint64_t sub_10000EBC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[3];
  _BYTE v35[24];
  uint64_t v36;
  uint64_t v37;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (_QWORD *)(a1 + 32);
  swift_beginAccess(a1 + 32, v35, 0, 0);
  v10 = *(_QWORD *)(a1 + 32);
  swift_retain(a2);
  v11 = swift_bridgeObjectRetain(v10);
  v12 = sub_100012CE0(v11, a2);
  swift_bridgeObjectRelease(v10);
  result = swift_release(a2);
  if ((v12 & 1) == 0)
  {
    v14 = Logger.policyCoordinator.unsafeMutableAddressor(result);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v14, v5);
    v15 = swift_retain_n(a2, 2);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v33 = v2;
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v32 = swift_slowAlloc(32, -1);
      v34[0] = v32;
      v31 = v18;
      *(_DWORD *)v18 = 136446210;
      v30 = v18 + 4;
      v36 = a2;
      v19 = type metadata accessor for GamePolicyCoordinatorObserver();
      swift_retain(a2);
      v20 = String.init<A>(describing:)(&v36, v19);
      v22 = v21;
      v36 = sub_100004814(v20, v21, v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v30, v18 + 12);
      swift_release_n(a2, 2);
      swift_bridgeObjectRelease(v22);
      v23 = v17;
      v24 = v31;
      _os_log_impl((void *)&_mh_execute_header, v16, v23, "registerObserver: %{public}s", v31, 0xCu);
      v25 = v32;
      swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

      swift_release_n(a2, 2);
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_beginAccess(v9, v34, 33, 0);
    v26 = swift_retain(a2);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v26);
    v28 = *(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v27 = *(_QWORD *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v28 >= v27 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1);
    v29 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v28, a2);
    specialized Array._endMutation()(v29);
    return swift_endAccess(v34);
  }
  return result;
}

uint64_t sub_10000EE84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[3];
  _BYTE v34[24];
  uint64_t v35;
  uint64_t v36;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)(a1 + 32);
  swift_beginAccess(a1 + 32, v34, 0, 0);
  v10 = *(_QWORD *)(a1 + 32);
  swift_retain(a2);
  v11 = swift_bridgeObjectRetain(v10);
  v12 = sub_100012CE0(v11, a2);
  swift_bridgeObjectRelease(v10);
  result = swift_release(a2);
  if ((v12 & 1) != 0)
  {
    v14 = Logger.policyCoordinator.unsafeMutableAddressor(result);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v14, v5);
    v15 = swift_retain_n(a2, 2);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v32 = v2;
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v31 = swift_slowAlloc(32, -1);
      v33[0] = v31;
      v30 = v18;
      *(_DWORD *)v18 = 136446210;
      v29 = v18 + 4;
      v35 = a2;
      v19 = type metadata accessor for GamePolicyCoordinatorObserver();
      swift_retain(a2);
      v20 = String.init<A>(describing:)(&v35, v19);
      v22 = v21;
      v35 = sub_100004814(v20, v21, v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v29, v18 + 12);
      swift_release_n(a2, 2);
      swift_bridgeObjectRelease(v22);
      v23 = v30;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "unregisterObserver: %{public}s", v30, 0xCu);
      v24 = v31;
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);

    }
    else
    {

      swift_release_n(a2, 2);
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_beginAccess(v9, v33, 33, 0);
    swift_retain(a2);
    v25 = sub_1000119D4(v9, a2);
    result = swift_release(a2);
    v26 = *v9;
    if ((unint64_t)*v9 >> 62)
    {
      if (v26 < 0)
        v28 = *v9;
      else
        v28 = v26 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*v9);
      v27 = _CocoaArrayWrapper.endIndex.getter(v28);
      result = swift_bridgeObjectRelease(v26);
      if (v27 >= v25)
        goto LABEL_7;
    }
    else
    {
      v27 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v27 >= v25)
      {
LABEL_7:
        sub_100015458(v25, v27);
        return swift_endAccess(v33);
      }
    }
    __break(1u);
  }
  return result;
}

_QWORD *sub_10000F17C()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for GamePolicyCoordinator();
  swift_allocObject(v0, 116, 7);
  result = sub_10000F1B4();
  off_100037F18 = result;
  return result;
}

_QWORD *sub_10000F1B4()
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
  _QWORD *v37;
  _QWORD *v38;
  unint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t, uint64_t);
  char *v46;
  char *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void (**v55)(char *, _QWORD, id);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  _QWORD *result;
  id v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void (**v74)(char *, _QWORD, id);
  id v75;
  uint64_t v76;
  id v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  _QWORD *v88;
  void *v89;
  unint64_t v90;
  int out_token;

  v1 = type metadata accessor for DynamicSplitterStatus.Config(0);
  v2 = __chkstk_darwin(v1);
  v84 = (uint64_t)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v86 = (char *)&v72 - v4;
  v5 = type metadata accessor for SustainedExecutionStatus.Config(0);
  v6 = __chkstk_darwin(v5);
  v81 = (uint64_t)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v85 = (char *)&v72 - v8;
  v9 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  v10 = __chkstk_darwin(v9);
  v82 = (uint64_t)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v83 = (char *)&v72 - v12;
  v13 = sub_100002090(&qword_100038128);
  v14 = __chkstk_darwin(v13);
  v80 = (char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v78 = (char *)&v72 - v16;
  v17 = type metadata accessor for GameModeStatus.Config(0);
  v18 = __chkstk_darwin(v17);
  v79 = (uint64_t)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v87 = (uint64_t)&v72 - v20;
  v21 = type metadata accessor for String.Encoding(0);
  v76 = *(_QWORD *)(v21 - 8);
  v77 = (id)v21;
  __chkstk_darwin(v21);
  v23 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v74 = *(void (***)(char *, _QWORD, id))(v24 - 8);
  v75 = (id)v24;
  __chkstk_darwin(v24);
  v26 = (char *)&v72 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v27);
  v29 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v30);
  v32 = (char *)&v72 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)NSLock), "init");
  v73 = sub_1000117A4();
  static DispatchQoS.unspecified.getter(v73);
  v89 = &_swiftEmptyArrayStorage;
  v33 = sub_100012DE4((unint64_t *)&qword_100038138, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v34 = sub_100002090(&qword_100038140);
  v35 = sub_100012E24((unint64_t *)&qword_100038148, &qword_100038140);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v89, v34, v35, v27, v33);
  v74[13](v26, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v75);
  v36 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000021, 0x8000000100029240, v32, v29, v26, 0);
  v37 = v88;
  v88[3] = v36;
  v37[4] = &_swiftEmptyArrayStorage;
  v37[13] = 0;
  v38 = v37;
  out_token = 0;
  v89 = (void *)0xD00000000000003DLL;
  v90 = 0x8000000100029270;
  static String.Encoding.utf8.getter(v36);
  v39 = sub_100011824();
  v40 = StringProtocol.cString(using:)(v23, &type metadata for String, v39);
  (*(void (**)(char *, id))(v76 + 8))(v23, v77);
  swift_bridgeObjectRelease(v90);
  if (v40)
    v41 = (const char *)(v40 + 32);
  else
    v41 = 0;
  notify_register_check(v41, &out_token);
  swift_bridgeObjectRelease(v40);
  *((_DWORD *)v38 + 28) = out_token;
  if (qword_100037328 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v42 = off_1000375F8;
  swift_retain(off_1000375F8);
  v43 = GlobalPreferences.gameModeEnablementStrategy.getter();
  v77 = v43;
  swift_release(v42);
  v44 = type metadata accessor for Date(0);
  v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56);
  v46 = v78;
  v45(v78, 1, 1, v44);
  v47 = v80;
  v45(v80, 1, 1, v44);
  GameModeStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:jettisonCameraS2R:gameBundleIdentifiers:previousGameBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)(0, v46, v47, 0, 0, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, v43);
  v48 = off_1000375F8;
  swift_retain(off_1000375F8);
  v49 = GlobalPreferences.modelManagerGameAssertionPolicyStrategy.getter();
  v76 = v49;
  swift_release(v48);
  v45(v46, 1, 1, v44);
  v45(v47, 1, 1, v44);
  v50 = (uint64_t)v83;
  ModelManagerGameAssertionStatus.Config.init(policy:enablementDate:disablementDate:deviceSupported:aaaBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:policyStrategy:)(2, v46, v47, 0, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, v49);
  v51 = off_1000375F8;
  swift_retain(off_1000375F8);
  v52 = GlobalPreferences.semEnablementStrategy.getter();
  v75 = v52;
  swift_release(v51);
  v45(v46, 1, 1, v44);
  v45(v47, 1, 1, v44);
  v53 = (uint64_t)v85;
  SustainedExecutionStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)(0, v46, v47, 0, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, v52);
  v54 = off_1000375F8;
  swift_retain(off_1000375F8);
  v55 = (void (**)(char *, _QWORD, id))GlobalPreferences.dynamicSplitterEnablementStrategy.getter();
  v74 = v55;
  swift_release(v54);
  v45(v46, 1, 1, v44);
  v45(v47, 1, 1, v44);
  v56 = (uint64_t)v86;
  DynamicSplitterStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)(0, v46, v47, 0, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, v55);
  v57 = v87;
  v58 = v79;
  sub_100011868(v87, v79, (uint64_t (*)(_QWORD))&type metadata accessor for GameModeStatus.Config);
  v59 = objc_allocWithZone((Class)type metadata accessor for GameModeStatus(0));
  v80 = (char *)GameModeStatus.init(config:)(v58);
  v60 = v81;
  sub_100011868(v53, v81, (uint64_t (*)(_QWORD))&type metadata accessor for SustainedExecutionStatus.Config);
  v61 = objc_allocWithZone((Class)type metadata accessor for SustainedExecutionStatus(0));
  v62 = SustainedExecutionStatus.init(config:)(v60);
  v63 = v84;
  sub_100011868(v56, v84, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicSplitterStatus.Config);
  v64 = objc_allocWithZone((Class)type metadata accessor for DynamicSplitterStatus(0));
  v65 = DynamicSplitterStatus.init(config:)(v63);
  v66 = v82;
  sub_100011868(v50, v82, (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
  v67 = objc_allocWithZone((Class)type metadata accessor for ModelManagerGameAssertionStatus(0));
  v68 = ModelManagerGameAssertionStatus.init(config:)(v66);
  sub_1000118AC(v56, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicSplitterStatus.Config);
  sub_1000118AC(v53, (uint64_t (*)(_QWORD))&type metadata accessor for SustainedExecutionStatus.Config);
  sub_1000118AC(v50, (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
  sub_1000118AC(v57, (uint64_t (*)(_QWORD))&type metadata accessor for GameModeStatus.Config);
  result = v88;
  v88[5] = v80;
  result[6] = v62;
  result[7] = v65;
  result[8] = v68;
  v70 = v75;
  result[9] = v77;
  result[10] = v70;
  v71 = v76;
  result[11] = v74;
  result[12] = v71;
  return result;
}

uint64_t sub_10000F998()
{
  uint64_t v0;
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
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  const char *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v23;
  unint64_t v24;

  v1 = v0;
  v2 = type metadata accessor for String.Encoding(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100002090(&qword_100038168);
  __chkstk_darwin(v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 104);
  if (v9)
  {
    *(_QWORD *)(v1 + 104) = 0;
    v10 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject(&unk_1000312F0, 40, 7);
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    swift_retain(v9);
    v12 = sub_10000FBD4((uint64_t)v8, (uint64_t)&unk_1000381E0, (uint64_t)v11);
    swift_release(v12);
    v13 = *(_DWORD *)(v1 + 112);
    if (v13)
    {
      v14 = notify_set_state(v13, 0);
      v23 = 0xD00000000000003DLL;
      v24 = 0x8000000100029270;
      static String.Encoding.utf8.getter(v14);
      v15 = sub_100011824();
      v16 = StringProtocol.cString(using:)(v5, &type metadata for String, v15);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      swift_bridgeObjectRelease(v24);
      if (v16)
        v17 = (const char *)(v16 + 32);
      else
        v17 = 0;
      notify_post(v17);
      swift_bridgeObjectRelease(v16);
    }
    swift_release(v9);
  }
  v18 = *(_DWORD *)(v1 + 112);
  if (v18)
    notify_cancel(v18);

  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 32));
  v19 = *(void **)(v1 + 40);
  v20 = *(void **)(v1 + 48);
  v21 = *(void **)(v1 + 56);

  swift_release(*(_QWORD *)(v1 + 104));
  return v1;
}

uint64_t sub_10000FB88()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.invalidate()[1]);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100013440;
  return Assertion.invalidate()();
}

uint64_t sub_10000FBD4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1000131EC(a1);
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
  v16 = swift_allocObject(&unk_1000312C8, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000381D0, v16);
}

uint64_t sub_10000FD18()
{
  uint64_t v0;

  sub_10000F998();
  return swift_deallocClassInstance(v0, 116, 7);
}

uint64_t type metadata accessor for GamePolicyCoordinator()
{
  return objc_opt_self(_TtC11gamepolicyd21GamePolicyCoordinator);
}

uint64_t sub_10000FD58@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _BYTE v17[24];
  _BYTE v18[24];

  v6 = type metadata accessor for OSSignpostID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess(a1 + 40, v18, 1, 0);
  v10 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = a2;
  v11 = a2;

  if (v11[direct field offset for GameModeStatus.enabled] == 1)
    v12 = static os_signpost_type_t.begin.getter();
  else
    v12 = static os_signpost_type_t.end.getter();
  v13 = v12;
  v14 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v13, &_mh_execute_header, v14, "GameModeEnabled", 15, 2, v9);

  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  swift_beginAccess(a1 + 32, v17, 0, 0);
  v15 = *(_QWORD *)(a1 + 32);
  *a3 = v15;
  return swift_bridgeObjectRetain(v15);
}

uint64_t sub_10000FEA0(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t Strong;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD aBlock[5];
  _QWORD *v34;
  _BYTE v35[24];
  _BYTE v36[24];

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v30 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v28 = *(_QWORD *)(v6 - 8);
  v29 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)v1[2];
  objc_msgSend(v9, "lock");
  swift_beginAccess(v1 + 5, v36, 1, 0);
  v10 = (void *)v1[8];
  v1[8] = a1;
  v31 = a1;

  swift_beginAccess(v1 + 4, v35, 0, 0);
  v11 = v1[4];
  objc_msgSend(v9, "unlock", swift_bridgeObjectRetain(v11).n128_f64[0]);
  aBlock[4] = sub_100012DE0;
  v34 = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000215C;
  aBlock[3] = &unk_100031100;
  v12 = _Block_copy(aBlock);
  v13 = swift_retain(v1);
  static DispatchQoS.unspecified.getter(v13);
  v32 = &_swiftEmptyArrayStorage;
  v14 = sub_100012DE4(&qword_100038158, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v15 = sub_100002090((uint64_t *)&unk_100038B80);
  v16 = sub_100012E24((unint64_t *)&qword_100038160, (uint64_t *)&unk_100038B80);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v32, v15, v16, v3, v14);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v5, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
  result = swift_release(v34);
  if (!((unint64_t)v11 >> 62))
  {
    v18 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v18)
      goto LABEL_3;
    return swift_bridgeObjectRelease(v11);
  }
  if (v11 < 0)
    v26 = v11;
  else
    v26 = v11 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v11);
  v18 = _CocoaArrayWrapper.endIndex.getter(v26);
  result = swift_bridgeObjectRelease(v11);
  if (!v18)
    return swift_bridgeObjectRelease(v11);
LABEL_3:
  if (v18 >= 1)
  {
    for (i = 0; i != v18; ++i)
    {
      if ((v11 & 0xC000000000000001) != 0)
      {
        v20 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v11);
      }
      else
      {
        v20 = *(_QWORD *)(v11 + 8 * i + 32);
        swift_retain(v20);
      }
      Strong = swift_unknownObjectWeakLoadStrong(v20 + 16);
      if (Strong)
      {
        v22 = Strong;
        v23 = objc_msgSend(*(id *)(Strong + 16), "remoteObjectProxy");
        _bridgeAnyObjectToAny(_:)(aBlock, v23);
        swift_unknownObjectRelease(v23);
        v24 = sub_100002090(&qword_100038CE0);
        if (swift_dynamicCast(&v32, aBlock, (char *)&type metadata for Any + 8, v24, 6))
        {
          v25 = v32;
          objc_msgSend(v32, "updateStatus::::", 0, v31, 0, 0);
          swift_unknownObjectRelease(v25);
        }
        swift_unknownObjectRelease(v22);
      }
      swift_release(v20);
    }
    return swift_bridgeObjectRelease(v11);
  }
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GamePolicyCoordinator.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void destroy for GamePolicyCoordinator.State(id *a1)
{

}

uint64_t initializeWithCopy for GamePolicyCoordinator.State(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  return a1;
}

uint64_t assignWithCopy for GamePolicyCoordinator.State(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 16);
  v11 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v10;

  v13 = *(void **)(a2 + 24);
  v14 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v13;
  v15 = v13;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for GamePolicyCoordinator.State(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for GamePolicyCoordinator.State(uint64_t a1, _OWORD *a2)
{
  void *v4;
  void *v5;
  __int128 v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  v6 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for GamePolicyCoordinator.State(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GamePolicyCoordinator.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyCoordinator.State()
{
  return &type metadata for GamePolicyCoordinator.State;
}

uint64_t sub_100010490()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t result;
  void *v15;
  _QWORD *v16;
  void (*v17)(void);
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  Swift::String v31;
  Swift::Int v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];
  _BYTE v45[24];

  v1 = v0;
  v2 = sub_100002090(&qword_100038168);
  __chkstk_darwin(v2);
  v4 = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  __chkstk_darwin(v5);
  v7 = (unsigned __int8 *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchPredicate(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (_QWORD *)((char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (void *)v1[3];
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  v13 = v12;
  LOBYTE(v12) = _dispatchPreconditionTest(_:)(v11);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) != 0)
  {
    v15 = (void *)v1[2];
    objc_msgSend(v15, "lock");
    swift_beginAccess(v1 + 5, v45, 0, 0);
    v16 = (_QWORD *)v1[8];
    v17 = *(void (**)(void))((swift_isaMask & *v16) + 0xB8);
    v18 = v16;
    v17();

    objc_msgSend(v15, "unlock");
    v44[3] = &type metadata for GamePolicyCoordinatorFF;
    v44[4] = sub_100012E64();
    LOBYTE(v18) = isFeatureEnabled(_:)(v44);
    sub_1000048E4(v44);
    if ((v18 & 1) == 0 || (v19 = *v7, v19 == 2))
    {
      v20 = v1[13];
      if (!v20)
        return sub_1000118AC((uint64_t)v7, (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
      v1[13] = 0;
      v21 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 1, 1, v21);
      v22 = (_QWORD *)swift_allocObject(&unk_100031138, 40, 7);
      v22[2] = 0;
      v22[3] = 0;
      v22[4] = v20;
      swift_retain(v20);
      v23 = sub_10000FBD4((uint64_t)v4, (uint64_t)&unk_100038180, (uint64_t)v22);
      swift_release(v23);
      sub_100010B6C();
      v24 = v20;
LABEL_25:
      swift_release(v24);
      return sub_1000118AC((uint64_t)v7, (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
    }
    v25 = v19 & 1;
    v26 = v1[13];
    if (v26)
    {
      v27 = swift_retain(v1[13]);
      v28 = Assertion.policy.getter(v27);
      v30 = v29;
      v31._countAndFlagsBits = v28;
      v31._object = v30;
      v32 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030BE8, v31);
      swift_bridgeObjectRelease(v30);
      if (v32)
      {
        if (v32 != 1)
        {
          v24 = v26;
          goto LABEL_25;
        }
        v33 = 0x4D656D6147414141;
        v34 = 0xEB0000000065646FLL;
      }
      else
      {
        v33 = 0xD000000000000010;
        v34 = 0x80000001000286E0;
      }
      if (v25)
        v35 = 0x4D656D6147414141;
      else
        v35 = 0xD000000000000010;
      if (v25)
        v36 = 0xEB0000000065646FLL;
      else
        v36 = 0x80000001000286E0;
      if (v33 == v35 && v34 == v36)
      {
        swift_bridgeObjectRelease_n(v34, 2);
LABEL_22:
        sub_1000118AC((uint64_t)v7, (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
        return swift_release(v26);
      }
      v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v33, v34, v35, v36, 0);
      swift_bridgeObjectRelease(v36);
      swift_bridgeObjectRelease(v34);
      if ((v37 & 1) != 0)
        goto LABEL_22;
      v38 = v1[13];
      v1[13] = 0;
      swift_release(v38);
      v39 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v4, 1, 1, v39);
      v40 = (_QWORD *)swift_allocObject(&unk_100031188, 40, 7);
      v40[2] = 0;
      v40[3] = 0;
      v40[4] = v26;
      v41 = sub_10000FBD4((uint64_t)v4, (uint64_t)&unk_1000381A0, (uint64_t)v40);
      swift_release(v41);
    }
    v42 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v4, 1, 1, v42);
    v43 = swift_allocObject(&unk_100031160, 48, 7);
    *(_QWORD *)(v43 + 16) = 0;
    *(_QWORD *)(v43 + 24) = 0;
    *(_BYTE *)(v43 + 32) = v25;
    *(_QWORD *)(v43 + 40) = v1;
    swift_retain(v1);
    v24 = sub_10000FBD4((uint64_t)v4, (uint64_t)&unk_100038190, v43);
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000108DC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _BYTE v17[24];
  _BYTE v18[24];

  v6 = type metadata accessor for OSSignpostID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess(a1 + 40, v18, 1, 0);
  v10 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = a2;
  v11 = a2;

  if (v11[direct field offset for SustainedExecutionStatus.enabled] == 1)
    v12 = static os_signpost_type_t.begin.getter();
  else
    v12 = static os_signpost_type_t.end.getter();
  v13 = v12;
  v14 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v13, &_mh_execute_header, v14, "SemEnabled", 10, 2, v9);

  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  swift_beginAccess(a1 + 32, v17, 0, 0);
  v15 = *(_QWORD *)(a1 + 32);
  *a3 = v15;
  return swift_bridgeObjectRetain(v15);
}

uint64_t sub_100010A24@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _BYTE v17[24];
  _BYTE v18[24];

  v6 = type metadata accessor for OSSignpostID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess(a1 + 40, v18, 1, 0);
  v10 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = a2;
  v11 = a2;

  if (v11[direct field offset for DynamicSplitterStatus.enabled] == 1)
    v12 = static os_signpost_type_t.begin.getter();
  else
    v12 = static os_signpost_type_t.end.getter();
  v13 = v12;
  v14 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v13, &_mh_execute_header, v14, "DpsEnabled", 10, 2, v9);

  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  swift_beginAccess(a1 + 32, v17, 0, 0);
  v15 = *(_QWORD *)(a1 + 32);
  *a3 = v15;
  return swift_bridgeObjectRetain(v15);
}

uint64_t sub_100010B6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  Swift::String v18;
  Swift::Int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  const char *v25;
  unint64_t v26;
  unint64_t v27;

  v1 = type metadata accessor for String.Encoding(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (unint64_t *)((char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v0 + 24);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    return result;
  }
  v12 = *(_DWORD *)(v0 + 112);
  if (v12)
  {
    v13 = *(_QWORD *)(v0 + 104);
    if (v13)
    {
      v14 = swift_retain(v13);
      v15 = Assertion.policy.getter(v14);
      v17 = v16;
      v18._countAndFlagsBits = v15;
      v18._object = v17;
      v19 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030BE8, v18);
      swift_bridgeObjectRelease(v17);
      if (!v19)
      {
        v20 = v12;
        v21 = 1;
        goto LABEL_8;
      }
      if (v19 == 1)
      {
        v20 = v12;
        v21 = 2;
LABEL_8:
        notify_set_state(v20, v21);
        v22 = swift_release(v13);
LABEL_11:
        v26 = 0xD00000000000003DLL;
        v27 = 0x8000000100029270;
        static String.Encoding.utf8.getter(v22);
        v23 = sub_100011824();
        v24 = StringProtocol.cString(using:)(v4, &type metadata for String, v23);
        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
        swift_bridgeObjectRelease(v27);
        if (v24)
          v25 = (const char *)(v24 + 32);
        else
          v25 = 0;
        notify_post(v25);
        return swift_bridgeObjectRelease(v24);
      }
      swift_release(v13);
    }
    v22 = notify_set_state(v12, 0);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_100010D5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;

  *(_QWORD *)(v5 + 128) = a5;
  *(_BYTE *)(v5 + 208) = a4;
  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  *(_QWORD *)(v5 + 136) = v7;
  v8 = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 144) = v8;
  *(_QWORD *)(v5 + 152) = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  *(_QWORD *)(v5 + 160) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v5 + 168) = v10;
  *(_QWORD *)(v5 + 176) = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (a4 & 1) == 0;
  if ((a4 & 1) != 0)
    v12 = 0x4D656D6147414141;
  else
    v12 = 0xD000000000000010;
  if (v11)
    v13 = 0x80000001000286E0;
  else
    v13 = 0xEB0000000065646FLL;
  type metadata accessor for Assertion(0);
  v14 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.__allocating_init(policy:description:)[1]);
  *(_QWORD *)(v5 + 184) = v14;
  *v14 = v5;
  v14[1] = sub_100010E78;
  return Assertion.__allocating_init(policy:description:)(v12, v13, 0xD000000000000015, 0x8000000100028A40);
}

uint64_t sub_100010E78(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 184);
  *(_QWORD *)(*v2 + 192) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_1000110EC;
  }
  else
  {
    *(_QWORD *)(v4 + 200) = a1;
    v6 = sub_100010EEC;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100010EEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 176);
  v18 = *(_QWORD *)(v0 + 168);
  v19 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 136);
  v17 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_BYTE *)(v0 + 208) & 1;
  v16 = *(_QWORD *)(v0 + 152);
  v6 = swift_allocObject(&unk_1000311B0, 24, 7);
  swift_weakInit(v6 + 16, v4);
  v7 = swift_allocObject(&unk_100031228, 33, 7);
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v1;
  *(_BYTE *)(v7 + 32) = v5;
  *(_QWORD *)(v0 + 96) = sub_100013100;
  *(_QWORD *)(v0 + 104) = v7;
  *(_QWORD *)(v0 + 64) = _NSConcreteStackBlock;
  *(_QWORD *)(v0 + 72) = 1107296256;
  *(_QWORD *)(v0 + 80) = sub_10000215C;
  *(_QWORD *)(v0 + 88) = &unk_100031240;
  v8 = _Block_copy((const void *)(v0 + 64));
  swift_retain(v1);
  v9 = swift_retain(v6);
  static DispatchQoS.unspecified.getter(v9);
  *(_QWORD *)(v0 + 120) = &_swiftEmptyArrayStorage;
  v10 = sub_100012DE4(&qword_100038158, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v11 = sub_100002090((uint64_t *)&unk_100038B80);
  v12 = sub_100012E24((unint64_t *)&qword_100038160, (uint64_t *)&unk_100038B80);
  dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 120, v11, v12, v3, v10);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v2, v16, v8);
  swift_release(v1);
  _Block_release(v8);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v3);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v2, v19);
  v13 = *(_QWORD *)(v0 + 104);
  swift_release(v6);
  swift_release(v13);
  v14 = *(_QWORD *)(v0 + 152);
  swift_task_dealloc(*(_QWORD *)(v0 + 176));
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000110EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = v0[24];
  v2 = v0[22];
  v17 = v0[21];
  v18 = v0[20];
  v3 = v0[17];
  v16 = v0[18];
  v4 = v0[16];
  v15 = v0[19];
  v5 = swift_allocObject(&unk_1000311B0, 24, 7);
  swift_weakInit(v5 + 16, v4);
  v6 = swift_allocObject(&unk_1000311D8, 32, 7);
  *(_QWORD *)(v6 + 16) = v1;
  *(_QWORD *)(v6 + 24) = v5;
  v0[6] = sub_1000130AC;
  v0[7] = v6;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10000215C;
  v0[5] = &unk_1000311F0;
  v7 = _Block_copy(v0 + 2);
  swift_errorRetain(v1);
  v8 = swift_retain(v5);
  static DispatchQoS.unspecified.getter(v8);
  v0[14] = &_swiftEmptyArrayStorage;
  v9 = sub_100012DE4(&qword_100038158, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v10 = sub_100002090((uint64_t *)&unk_100038B80);
  v11 = sub_100012E24((unint64_t *)&qword_100038160, (uint64_t *)&unk_100038B80);
  dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 14, v10, v11, v3, v9);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v2, v15, v7);
  _Block_release(v7);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v3);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v18);
  v12 = v0[7];
  swift_release(v5);
  swift_release(v12);
  v13 = v0[19];
  swift_task_dealloc(v0[22]);
  swift_task_dealloc(v13);
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_1000112E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a2 + 16;
  v10 = Logger.daemon.unsafeMutableAddressor(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v10, v4);
  swift_errorRetain(a1);
  v11 = swift_errorRetain(a1);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v9;
    v14 = swift_slowAlloc(12, -1);
    v24 = v4;
    v15 = (uint8_t *)v14;
    v16 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v15 = 138543362;
    swift_errorRetain(a1);
    v17 = _swift_stdlib_bridgeErrorToNSError(a1);
    v25 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v15 + 4, v15 + 12);
    *v16 = v17;
    v9 = v23;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Unable to create ModelManager assertion: %{public}@", v15, 0xCu);
    v18 = sub_100002090((uint64_t *)&unk_100037CA0);
    swift_arrayDestroy(v16, 1, v18);
    swift_slowDealloc(v16, -1, -1);
    v19 = v15;
    v4 = v24;
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  swift_beginAccess(v9, &v25, 0, 0);
  result = swift_weakLoadStrong(v9);
  if (result)
  {
    v21 = result;
    sub_100010B6C();
    return swift_release(v21);
  }
  return result;
}

uint64_t sub_1000114F0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  Swift::Int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _BYTE v26[24];

  v6 = sub_100002090(&qword_100038168);
  __chkstk_darwin(v6);
  v8 = &v26[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a1 += 16;
  swift_beginAccess(a1, v26, 0, 0);
  result = swift_weakLoadStrong(a1);
  if (result)
  {
    v10 = result;
    v11 = *(_QWORD *)(result + 104);
    *(_QWORD *)(result + 104) = a2;
    swift_retain(a2);
    sub_100010B6C();
    sub_100010490();
    if (!v11)
      return swift_release(v10);
    v12 = swift_retain(v11);
    v13 = Assertion.policy.getter(v12);
    v15 = v14;
    v16._countAndFlagsBits = v13;
    v16._object = v15;
    v17 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100030BE8, v16);
    swift_bridgeObjectRelease(v15);
    if (v17)
    {
      if (v17 != 1)
      {
LABEL_7:
        v22 = v11;
LABEL_9:
        swift_release(v22);
        swift_release(v10);
        v10 = v11;
        return swift_release(v10);
      }
      if ((a3 & 1) == 0)
      {
        v18 = *(_QWORD *)(v10 + 104);
        *(_QWORD *)(v10 + 104) = v11;
        swift_retain(v11);
        swift_release(v18);
        v19 = type metadata accessor for TaskPriority(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
        v20 = (_QWORD *)swift_allocObject(&unk_1000312A0, 40, 7);
        v20[2] = 0;
        v20[3] = 0;
        v20[4] = a2;
        swift_retain(a2);
        v21 = sub_10000FBD4((uint64_t)v8, (uint64_t)&unk_1000381C0, (uint64_t)v20);
        swift_release(v21);
        sub_100010B6C();
        goto LABEL_7;
      }
    }
    v23 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v8, 1, 1, v23);
    v24 = (_QWORD *)swift_allocObject(&unk_100031278, 40, 7);
    v24[2] = 0;
    v24[3] = 0;
    v24[4] = v11;
    v22 = sub_10000FBD4((uint64_t)v8, (uint64_t)&unk_1000381B0, (uint64_t)v24);
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_1000116F4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100011758;
  return v6(a1);
}

uint64_t sub_100011758()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_1000117A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038130;
  if (!qword_100038130)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100038130);
  }
  return result;
}

uint64_t sub_1000117E0(uint64_t *a1)
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

unint64_t sub_100011824()
{
  unint64_t result;

  result = qword_100038150;
  if (!qword_100038150)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100038150);
  }
  return result;
}

uint64_t sub_100011868(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000118AC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000118E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  if ((unint64_t)a1 >> 62)
    goto LABEL_13;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2)
          return v5;
      }
      else if (*(_QWORD *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1))
        break;
      if (++v5 == v4)
        return 0;
    }
    __break(1u);
LABEL_13:
    if (a1 < 0)
      v8 = a1;
    else
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v8);
    swift_bridgeObjectRelease(a1);
  }
  return 0;
}

uint64_t sub_1000119D4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t i;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = *a1;
  v6 = swift_bridgeObjectRetain(*a1);
  v7 = sub_1000118E8(v6, a2);
  v9 = v8;
  swift_bridgeObjectRelease(v5);
  if (v2)
    return v7;
  if ((v9 & 1) == 0)
  {
    v10 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_57;
    v9 = *a1;
    if ((unint64_t)*a1 >> 62)
    {
LABEL_58:
      if ((v9 & 0x8000000000000000) != 0)
        v29 = v9;
      else
        v29 = v9 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v9);
      v30 = _CocoaArrayWrapper.endIndex.getter(v29);
      swift_bridgeObjectRelease(v9);
      if (v10 != v30)
        goto LABEL_6;
    }
    else if (v10 != *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (i = v7 + 5; ; ++i)
      {
        v9 = i - 4;
        v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
          break;
        if ((v9 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          goto LABEL_58;
        }
        if (v9 >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_48;
        if (*(_QWORD *)(v12 + 8 * i) != a2)
          goto LABEL_11;
LABEL_31:
        v10 = i - 3;
        if (__OFADD__(v9, 1))
          goto LABEL_49;
        v23 = *a1;
        if ((unint64_t)*a1 >> 62)
        {
          if (v23 < 0)
            v26 = *a1;
          else
            v26 = v23 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(*a1);
          v24 = _CocoaArrayWrapper.endIndex.getter(v26);
          swift_bridgeObjectRelease(v23);
        }
        else
        {
          v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v10 == v24)
          return v7;
      }
      v25 = specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, v12);
      swift_unknownObjectRelease(v25);
      if (v25 == a2)
        goto LABEL_31;
LABEL_11:
      if (v9 == v7)
      {
LABEL_30:
        if (__OFADD__(v7++, 1))
          goto LABEL_50;
        goto LABEL_31;
      }
      v10 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7, *a1);
        v10 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_16:
          if ((v9 & 0x8000000000000000) != 0)
            goto LABEL_53;
          if (v9 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_54;
          v14 = *(_QWORD *)(v10 + 8 * i);
          swift_retain(v14);
          goto LABEL_19;
        }
      }
      else
      {
        if ((v7 & 0x8000000000000000) != 0)
          goto LABEL_51;
        if (v7 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_52;
        v13 = *(_QWORD *)(v10 + 8 * v7 + 32);
        swift_retain(v13);
        if ((v10 & 0xC000000000000001) == 0)
          goto LABEL_16;
      }
      v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, v10);
      v10 = *a1;
LABEL_19:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(v10);
      *a1 = v10;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v10 < 0 || (v10 & 0x4000000000000000) != 0)
      {
        v10 = sub_100015244(v10);
        *a1 = v10;
      }
      v16 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 8 * v7 + 0x20);
      *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 8 * v7 + 0x20) = v14;
      v17 = swift_release(v16);
      specialized Array._endMutation()(v17);
      v10 = *a1;
      v18 = swift_isUniquelyReferenced_nonNull_bridgeObject(*a1);
      *a1 = v10;
      if (!v18 || v10 < 0 || (v10 & 0x4000000000000000) != 0)
      {
        v10 = sub_100015244(v10);
        *a1 = v10;
      }
      if ((v9 & 0x8000000000000000) != 0)
        goto LABEL_55;
      v19 = v10 & 0xFFFFFFFFFFFFFF8;
      if (v9 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_56;
      v20 = *(_QWORD *)(v19 + 8 * i);
      *(_QWORD *)(v19 + 8 * i) = v13;
      v21 = swift_release(v20);
      specialized Array._endMutation()(v21);
      goto LABEL_30;
    }
    return v7;
  }
  v27 = *a1;
  if (!((unint64_t)v27 >> 62))
    return *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v27 < 0)
    v31 = v27;
  else
    v31 = v27 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v27);
  v32 = _CocoaArrayWrapper.endIndex.getter(v31);
  swift_bridgeObjectRelease(v27);
  return v32;
}

uint64_t sub_100011CEC(_QWORD *a1, uint64_t a2, _BYTE *a3, _BYTE *a4, uint64_t *a5, uint64_t a6, uint64_t *a7, _BYTE *a8, _BYTE *a9, char *a10)
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  id v36;
  __objc2_meth *v37;
  __objc2_meth *v38;
  BOOL v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  NSString v53;
  id v54;
  char *v55;
  id v56;
  Class isa;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  __objc2_meth *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSString v75;
  void *v76;
  uint64_t v77;
  id v78;
  char *v79;
  id v80;
  Class v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t *v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  unint64_t v95;
  void *v96;
  void *v97;
  NSString v98;
  void *v99;
  uint64_t *v100;
  id v101;
  char *v102;
  id v103;
  Class v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  void *v115;
  void *v116;
  NSString v117;
  void *v118;
  uint64_t *v119;
  id v120;
  char *v121;
  id v122;
  Class v123;
  const mach_header_64 *v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v129;
  char *v130;
  char *v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t *v134;
  char *v135;
  uint64_t v136;
  id v137;
  id v138;
  id v139;
  int v140;
  char *v141;
  id v142;
  unint64_t v143;
  uint64_t v144;
  _BYTE *v145;
  id v146;
  _BYTE *v147;
  id v148;
  char *v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t *v157;
  _BYTE v158[16];
  char v159[16];
  _QWORD *v160;
  void *v161;

  v152 = a7;
  v151 = a6;
  v150 = a5;
  v147 = a4;
  v145 = a3;
  v144 = a2;
  v143 = (unint64_t)a9;
  v141 = a10;
  v153 = type metadata accessor for Notification(0);
  v155 = *(_QWORD *)(v153 - 8);
  __chkstk_darwin(v153);
  v154 = (char *)&v129 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Logger(0);
  v156 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v135 = (char *)&v129 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v149 = (char *)&v129 - v17;
  v18 = __chkstk_darwin(v16);
  v130 = (char *)&v129 - v19;
  __chkstk_darwin(v18);
  v131 = (char *)&v129 - v20;
  v21 = (void *)a1[2];
  objc_msgSend(v21, "lock");
  swift_beginAccess(a1 + 5, v159, 0, 0);
  v22 = (void *)a1[5];
  v23 = (void *)a1[6];
  v25 = (void *)a1[7];
  v24 = (void *)a1[8];
  v26 = a1[9];
  v132 = a1[10];
  v133 = (uint64_t *)a1[11];
  v134 = (uint64_t *)a1[12];
  swift_beginAccess(a1 + 5, &v157, 33, 0);
  v27 = v22;
  v28 = (uint64_t *)v13;
  v148 = v27;
  v146 = v23;
  v142 = v25;
  v139 = v24;
  sub_10001C5B8(a1 + 5, v144, v145, v147, v150, v151, v152, a8, &v160, (_BYTE *)v143, v141);
  swift_endAccess(&v157);
  v29 = (void *)a1[5];
  v30 = (void *)a1[6];
  v31 = (void *)a1[7];
  v32 = (void *)a1[8];
  v33 = a1[9];
  v151 = a1[10];
  v34 = (uint64_t *)a1[11];
  v35 = (uint64_t *)a1[12];
  v152 = v34;
  v145 = v29;
  v141 = v30;
  v138 = v31;
  v137 = v32;
  v36 = objc_msgSend(v21, "unlock");
  v136 = v160;
  LODWORD(v147) = BYTE1(v160);
  LODWORD(v144) = BYTE2(v160);
  v143 = BYTE3(v160);
  v37 = &stru_100036000;
  v38 = &stru_100036000;
  v140 = BYTE4(v160);
  v39 = v26 == v33;
  v40 = v35;
  v150 = v35;
  if (!v39)
  {
    v41 = Logger.policyCoordinator.unsafeMutableAddressor(v36);
    v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t *))(v156 + 16))(v131, v41, v28);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(12, -1);
      v46 = v28;
      v47 = swift_slowAlloc(32, -1);
      v160 = (_QWORD *)v47;
      *(_DWORD *)v45 = 136446210;
      v157 = (uint64_t *)v33;
      v48 = String.init<A>(describing:)(&v157, &type metadata for ModeEnablementStrategy);
      v50 = v49;
      v157 = (uint64_t *)sub_100004814(v48, v49, (uint64_t *)&v160);
      v37 = &stru_100036000;
      v40 = v150;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v157, v158, v45 + 4, v45 + 12);
      swift_bridgeObjectRelease(v50);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Updating game mode enablement strategy to %{public}s", v45, 0xCu);
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v45, -1, -1);

      v28 = v46;
      (*(void (**)(char *, uint64_t *))(v156 + 8))(v131, v46);
    }
    else
    {

      (*(void (**)(char *, uint64_t *))(v156 + 8))(v131, v28);
    }
    v38 = &stru_100036000;
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v51 = off_1000375F8;
    v52 = (void *)*((_QWORD *)off_1000375F8 + 2);
    swift_retain(off_1000375F8);
    v53 = String._bridgeToObjectiveC()();
    objc_msgSend(v52, "setInteger:forKey:", v33, v53);
    swift_release(v51);

    if (qword_100037330 != -1)
      swift_once(&qword_100037330, sub_10000D258);
    v161 = &type metadata for ModeEnablementStrategy;
    v160 = (_QWORD *)v33;
    v54 = (id)qword_1000391B8;
    v55 = v154;
    Notification.init(name:object:userInfo:)(v54, &v160, 0);
    v56 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), (SEL)v37[84].imp);
    isa = Notification._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v56, "postNotification:", isa);

    v36 = (id)(*(uint64_t (**)(char *, uint64_t))(v155 + 8))(v55, v153);
  }
  v58 = v151;
  if (v132 != v151)
  {
    v59 = Logger.policyCoordinator.unsafeMutableAddressor(v36);
    v60 = v130;
    v61 = (*(uint64_t (**)(char *, uint64_t, uint64_t *))(v156 + 16))(v130, v59, v28);
    v62 = Logger.logObject.getter(v61);
    v63 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc(12, -1);
      v65 = swift_slowAlloc(32, -1);
      v160 = (_QWORD *)v65;
      *(_DWORD *)v64 = 136446210;
      v157 = (uint64_t *)v58;
      v66 = String.init<A>(describing:)(&v157, &type metadata for ModeEnablementStrategy);
      v67 = v37;
      v69 = v68;
      v157 = (uint64_t *)sub_100004814(v66, v68, (uint64_t *)&v160);
      v70 = v156;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v157, v158, v64 + 4, v64 + 12);
      v71 = v69;
      v37 = v67;
      v40 = v150;
      swift_bridgeObjectRelease(v71);
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Updating sustained execution mode enablement strategy to %{public}s", v64, 0xCu);
      swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
      v72 = v65;
      v38 = &stru_100036000;
      swift_slowDealloc(v72, -1, -1);
      swift_slowDealloc(v64, -1, -1);

      (*(void (**)(char *, uint64_t *))(v70 + 8))(v130, v28);
    }
    else
    {

      (*(void (**)(char *, uint64_t *))(v156 + 8))(v60, v28);
    }
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v73 = off_1000375F8;
    v74 = (void *)*((_QWORD *)off_1000375F8 + 2);
    swift_retain(off_1000375F8);
    v75 = String._bridgeToObjectiveC()();
    v76 = v74;
    v77 = v151;
    objc_msgSend(v76, "setInteger:forKey:", v151, v75);
    swift_release(v73);

    if (qword_100037340 != -1)
      swift_once(&qword_100037340, sub_10000D2C0);
    v161 = &type metadata for ModeEnablementStrategy;
    v160 = (_QWORD *)v77;
    v78 = (id)qword_1000391C8;
    v79 = v154;
    Notification.init(name:object:userInfo:)(v78, &v160, 0);
    v80 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), (SEL)v37[84].imp);
    v81 = Notification._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v80, v38[85].name, v81);

    v36 = (id)(*(uint64_t (**)(char *, uint64_t))(v155 + 8))(v79, v153);
  }
  v82 = v149;
  if (v133 != v152)
  {
    v83 = Logger.policyCoordinator.unsafeMutableAddressor(v36);
    v84 = (*(uint64_t (**)(char *, uint64_t, uint64_t *))(v156 + 16))(v82, v83, v28);
    v85 = Logger.logObject.getter(v84);
    v86 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v85, v86))
    {
      v87 = v28;
      v88 = (uint8_t *)swift_slowAlloc(12, -1);
      v89 = swift_slowAlloc(32, -1);
      v160 = (_QWORD *)v89;
      *(_DWORD *)v88 = 136446210;
      v157 = v152;
      v90 = String.init<A>(describing:)(&v157, &type metadata for ModeEnablementStrategy);
      v92 = v91;
      v157 = (uint64_t *)sub_100004814(v90, v91, (uint64_t *)&v160);
      v93 = v150;
      v94 = v156;
      v37 = &stru_100036000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v157, v158, v88 + 4, v88 + 12);
      v95 = v92;
      v40 = v93;
      swift_bridgeObjectRelease(v95);
      _os_log_impl((void *)&_mh_execute_header, v85, v86, "Updating dynamic splitter enablement strategy to %{public}s", v88, 0xCu);
      swift_arrayDestroy(v89, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v89, -1, -1);
      swift_slowDealloc(v88, -1, -1);

      v28 = v87;
      (*(void (**)(char *, uint64_t *))(v94 + 8))(v149, v87);
    }
    else
    {

      (*(void (**)(char *, uint64_t *))(v156 + 8))(v82, v28);
    }
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v96 = off_1000375F8;
    v97 = (void *)*((_QWORD *)off_1000375F8 + 2);
    swift_retain(off_1000375F8);
    v98 = String._bridgeToObjectiveC()();
    v99 = v97;
    v100 = v152;
    objc_msgSend(v99, "setInteger:forKey:", v152, v98);
    swift_release(v96);

    if (qword_100037348 != -1)
      swift_once(&qword_100037348, sub_10000D2F4);
    v161 = &type metadata for ModeEnablementStrategy;
    v160 = v100;
    v101 = (id)qword_1000391D0;
    v102 = v154;
    Notification.init(name:object:userInfo:)(v101, &v160, 0);
    v103 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), (SEL)v37[84].imp);
    v104 = Notification._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v103, v38[85].name, v104);

    v36 = (id)(*(uint64_t (**)(char *, uint64_t))(v155 + 8))(v102, v153);
  }
  v105 = v135;
  if (v134 == v40)
  {

  }
  else
  {
    v106 = Logger.policyCoordinator.unsafeMutableAddressor(v36);
    v107 = (*(uint64_t (**)(char *, uint64_t, uint64_t *))(v156 + 16))(v105, v106, v28);
    v108 = Logger.logObject.getter(v107);
    v109 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v108, v109))
    {
      v152 = v28;
      v110 = (uint8_t *)swift_slowAlloc(12, -1);
      v111 = swift_slowAlloc(32, -1);
      v160 = (_QWORD *)v111;
      *(_DWORD *)v110 = 136446210;
      v157 = v40;
      v112 = String.init<A>(describing:)(&v157, &type metadata for ModelManagerPolicyStrategy);
      v114 = v113;
      v157 = (uint64_t *)sub_100004814(v112, v113, (uint64_t *)&v160);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v157, v158, v110 + 4, v110 + 12);
      swift_bridgeObjectRelease(v114);
      _os_log_impl((void *)&_mh_execute_header, v108, v109, "Updating game mode ModelManager policy strategy to %{public}s", v110, 0xCu);
      swift_arrayDestroy(v111, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v111, -1, -1);
      swift_slowDealloc(v110, -1, -1);

      (*(void (**)(char *, uint64_t *))(v156 + 8))(v105, v152);
    }
    else
    {

      (*(void (**)(char *, uint64_t *))(v156 + 8))(v105, v28);
    }
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v115 = off_1000375F8;
    v116 = (void *)*((_QWORD *)off_1000375F8 + 2);
    swift_retain(off_1000375F8);
    v117 = String._bridgeToObjectiveC()();
    v118 = v116;
    v119 = v150;
    objc_msgSend(v118, "setInteger:forKey:", v150, v117);
    swift_release(v115);

    if (qword_100037338 != -1)
      swift_once(&qword_100037338, sub_10000D28C);
    v161 = &type metadata for ModelManagerPolicyStrategy;
    v160 = v119;
    v120 = (id)qword_1000391C0;
    v121 = v154;
    Notification.init(name:object:userInfo:)(v120, &v160, 0);
    v122 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), (SEL)v37[84].imp);
    v123 = Notification._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v122, v38[85].name, v123);

    (*(void (**)(char *, uint64_t))(v155 + 8))(v121, v153);
  }
  v124 = &_mh_execute_header;
  if (!v140)
    v124 = 0;
  v125 = (unint64_t)v124 | (v143 << 24);
  v126 = 0x10000;
  if (!(_DWORD)v144)
    v126 = 0;
  v127 = 256;
  if (!(_DWORD)v147)
    v127 = 0;
  return v125 | v126 | v127 | v136;
}

uint64_t sub_100012CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (v4)
  {
    while (1)
    {
      v5 = 0;
      while ((a1 & 0xC000000000000001) == 0)
      {
        if (__OFADD__(v5, 1))
          goto LABEL_13;
        v9 = *(_QWORD *)(a1 + 32 + 8 * v5++);
        if (v9 == a2)
        {
LABEL_11:
          swift_bridgeObjectRelease(a1);
          return 1;
        }
LABEL_4:
        if (v5 == v4)
          goto LABEL_18;
      }
      v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
      if (!__OFADD__(v5++, 1))
        break;
      __break(1u);
LABEL_13:
      __break(1u);
LABEL_14:
      if (a1 < 0)
        v11 = a1;
      else
        v11 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v4 = _CocoaArrayWrapper.endIndex.getter(v11);
      if (!v4)
        goto LABEL_18;
    }
    v8 = v6;
    swift_unknownObjectRelease();
    if (v8 == a2)
      goto LABEL_11;
    goto LABEL_4;
  }
LABEL_18:
  swift_bridgeObjectRelease(a1);
  return 0;
}

uint64_t sub_100012DE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100012E24(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1000117E0(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100012E64()
{
  unint64_t result;

  result = qword_100038170;
  if (!qword_100038170)
  {
    result = swift_getWitnessTable(&unk_100026F00, &type metadata for GamePolicyCoordinatorFF);
    atomic_store(result, &qword_100038170);
  }
  return result;
}

uint64_t sub_100012EAC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc(dword_10003817C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100012F18;
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.invalidate()[1]);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_100013440;
  return Assertion.invalidate()();
}

uint64_t sub_100012F18()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100012F60()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100012F8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc(dword_10003818C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100013440;
  return sub_100010D5C(a1, v4, v5, v6, v7);
}

uint64_t sub_10001300C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc(dword_10003819C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100013440;
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.invalidate()[1]);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_100013440;
  return Assertion.invalidate()();
}

uint64_t sub_100013078()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001309C()
{
  return sub_1000130C4((void (*)(_QWORD))&_swift_errorRelease, 32);
}

uint64_t sub_1000130AC()
{
  uint64_t v0;

  return sub_1000112E0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000130B4()
{
  return sub_1000130C4((void (*)(_QWORD))&_swift_release, 33);
}

uint64_t sub_1000130C4(void (*a1)(_QWORD), uint64_t a2)
{
  uint64_t v2;

  a1(*(_QWORD *)(v2 + 16));
  swift_release(*(_QWORD *)(v2 + 24));
  return swift_deallocObject(v2, a2, 7);
}

uint64_t sub_100013100()
{
  uint64_t v0;

  return sub_1000114F0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_100013110()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc(dword_1000381AC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100013440;
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.invalidate()[1]);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_100013440;
  return Assertion.invalidate()();
}

uint64_t sub_100013180()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc(dword_1000381BC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100013440;
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.invalidate()[1]);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_100013440;
  return Assertion.invalidate()();
}

uint64_t sub_1000131EC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002090(&qword_100038168);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001322C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013250(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000381CC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100012F18;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000381C8 + dword_1000381C8))(a1, v4);
}

uint64_t sub_1000132C4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000132F0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc(dword_1000381DC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100013440;
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Assertion.invalidate()[1]);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_100013440;
  return Assertion.invalidate()();
}

uint64_t storeEnumTagSinglePayload for GamePolicyCoordinatorFF(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10001339C + 4 * byte_100026DC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000133BC + 4 * byte_100026DC5[v4]))();
}

_BYTE *sub_10001339C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000133BC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000133C4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000133CC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000133D4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000133DC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyCoordinatorFF()
{
  return &type metadata for GamePolicyCoordinatorFF;
}

unint64_t sub_1000133FC()
{
  unint64_t result;

  result = qword_1000381E8;
  if (!qword_1000381E8)
  {
    result = swift_getWitnessTable(&unk_100026ED8, &type metadata for GamePolicyCoordinatorFF);
    atomic_store(result, (unint64_t *)&qword_1000381E8);
  }
  return result;
}

uint64_t sub_100013454()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 80));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 96));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 104));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
  return v0;
}

uint64_t sub_1000134C8()
{
  uint64_t v0;

  sub_100013454();
  return swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for GamingMetadataOnDiskDB()
{
  return objc_opt_self(_TtC11gamepolicyd22GamingMetadataOnDiskDB);
}

uint64_t sub_100013508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(v0 + 48);
  if (v1)
  {
    v2 = qword_100037358;
    swift_retain(*(_QWORD *)(v0 + 48));
    if (v2 != -1)
      swift_once(&qword_100037358, sub_10000F17C);
    v3 = off_100037F18;
    v4 = (void *)*((_QWORD *)off_100037F18 + 2);
    swift_retain(off_100037F18);
    objc_msgSend(v4, "lock");
    sub_10000EE84((uint64_t)v3, v1);
    objc_msgSend(v4, "unlock");
    swift_release(v1);
    swift_release(v3);
  }

  sub_10000CD8C(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocClassInstance(v0, 56, 7);
}

void sub_1000135F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[9];

  v1 = type metadata accessor for GamePolicyCoordinatorObserver();
  v2 = swift_allocObject(v1, 32, 7);
  *(_QWORD *)(v2 + 24) = 0;
  v3 = swift_unknownObjectWeakInit(v2 + 16, 0);
  *(_QWORD *)(v2 + 24) = &off_100031408;
  swift_unknownObjectWeakAssign(v3, v0);
  v4 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 48) = v2;
  swift_retain(v2);
  swift_release(v4);
  if (qword_100037358 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v5 = off_100037F18;
  v6 = (void *)*((_QWORD *)off_100037F18 + 2);
  swift_retain(off_100037F18);
  objc_msgSend(v6, "lock");
  sub_10000EBC0((uint64_t)v5, v2);
  objc_msgSend(v6, "unlock");
  swift_release(v5);
  v7 = off_100037F18;
  v8 = swift_retain(off_100037F18);
  sub_10000D35C(v21, v8);
  swift_release(v7);
  v9 = (void *)v21[0];
  v10 = (void *)v21[1];
  v12 = (void *)v21[2];
  v11 = (void *)v21[3];
  v13 = objc_msgSend(*(id *)(v0 + 16), "remoteObjectProxy");
  _bridgeAnyObjectToAny(_:)(v21, v13);
  swift_unknownObjectRelease(v13);
  v14 = sub_100002090(&qword_100038CE0);
  if (swift_dynamicCast(&v20, v21, (char *)&type metadata for Any + 8, v14, 6))
  {
    v15 = v20;
    v16 = v9;
    v17 = v11;
    v18 = v10;
    v19 = v12;
    objc_msgSend(v15, "updateStatus::::", v16, v17, v18, v19);

    swift_release(v2);
    swift_unknownObjectRelease(v15);
  }
  else
  {
    swift_release(v2);

  }
}

uint64_t sub_100013AB8(uint64_t a1, int a2, uint64_t a3, void *aBlock, void (*a5)(uint64_t, uint64_t, void *))
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = _Block_copy(aBlock);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  _Block_copy(v8);
  swift_retain(a1);
  a5(v9, v11, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_release(a1);
  return swift_bridgeObjectRelease(v11);
}

id sub_100013B94(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(v3), "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v6, a3 & 1, &v12);

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

uint64_t sub_100013C78(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t result;
  void *v29;
  uint64_t v30[4];
  void *v31;

  v3 = v2;
  if (qword_100037358 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v6 = off_100037F18;
  v7 = swift_retain(off_100037F18);
  sub_10000D35C(v30, v7);
  swift_release(v6);
  v8 = *(_QWORD *)(v30[0] + direct field offset for GameModeStatus.gameBundleIdentifiers);
  v9 = *(_QWORD *)(v8 + 16);
  v10 = *(unsigned __int8 *)(v30[0] + direct field offset for GameModeStatus.enabled);
  v11 = &_swiftEmptyArrayStorage;
  if (a1)
    v12 = a1;
  else
    v12 = &_swiftEmptyArrayStorage;
  if ((a2 & 1) != 0)
    v11 = (void *)swift_bridgeObjectRetain(v8);
  v29 = v12;
  swift_bridgeObjectRetain(a1);
  sub_100014E08((uint64_t)v11);
  v13 = sub_1000160AC((uint64_t)v12);
  swift_bridgeObjectRelease(v12);
  if (v31 == (void *)2)
  {
    if (!*(_QWORD *)(v13 + 16))
    {
      v21 = sub_100002090(&qword_100038688);
      v22 = swift_allocObject(v21, 40, 7);
      *(_OWORD *)(v22 + 16) = xmmword_100026FD0;
      v23 = objc_allocWithZone((Class)type metadata accessor for GameModeCCUIStatusBundleInfo(0));
      v24 = GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)(0x6C6F5020656D6147, 0xEB00000000796369, 0xD00000000000001ALL, 0x8000000100028FD0, 0, 0, 0, 0);
      *(_QWORD *)(v22 + 32) = v24;
      specialized Array._endMutation()(v24);
      v15 = 0;
      v14 = (void *)v22;
      goto LABEL_25;
    }
    v15 = 0;
LABEL_21:
    v14 = &_swiftEmptyArrayStorage;
LABEL_25:
    sub_1000162D4((uint64_t)v30);
    swift_retain(v3);
    v25 = sub_100016140(v13, v30);
    swift_release(v3);
    sub_100016314((uint64_t)v30);
    swift_bridgeObjectRelease(v13);
    sub_100014C50((uint64_t)v25);
    v26 = objc_allocWithZone((Class)type metadata accessor for GameModeCCUIStatusInfo(0));
    v27 = GameModeCCUIStatusInfo.init(state:bundles:)(v15, v14);
    sub_100016314((uint64_t)v30);
    return v27;
  }
  if (v31 == (void *)1)
  {
    if (*(_QWORD *)(v13 + 16))
    {
      v14 = &_swiftEmptyArrayStorage;
    }
    else
    {
      v17 = sub_100002090(&qword_100038688);
      v18 = swift_allocObject(v17, 40, 7);
      *(_OWORD *)(v18 + 16) = xmmword_100026FD0;
      v19 = objc_allocWithZone((Class)type metadata accessor for GameModeCCUIStatusBundleInfo(0));
      v20 = GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)(0x6C6F5020656D6147, 0xEB00000000796369, 0xD00000000000001ALL, 0x8000000100028FD0, 1, 0, 0, 3);
      *(_QWORD *)(v18 + 32) = v20;
      specialized Array._endMutation()(v20);
      v14 = (void *)v18;
    }
    v15 = 4;
    goto LABEL_25;
  }
  if (!v31)
  {
    if (v9)
      v16 = 2;
    else
      v16 = 1;
    if (v10)
      v15 = 3;
    else
      v15 = v16;
    goto LABEL_21;
  }
  v29 = v31;
  result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for ModeEnablementStrategy, &v29, &type metadata for ModeEnablementStrategy, &type metadata for Int);
  __break(1u);
  return result;
}

uint64_t sub_100013FB4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t result;

  v6 = *a1;
  v5 = a1[1];
  v7 = sub_100004F38(*a1, v5, *(_QWORD **)(a2[3] + direct field offset for ModelManagerGameAssertionStatus.aaaBundleIdentifiers));
  if (qword_100037328 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v8 = off_1000375F8;
  swift_retain(off_1000375F8);
  swift_bridgeObjectRetain(v5);
  v9 = GlobalPreferences.gameModeEnabledList.getter();
  if (*(_QWORD *)(v9 + 16) && (v10 = sub_1000090D4(v6, v5), (v11 & 1) != 0))
  {
    v12 = *(_BYTE *)(*(_QWORD *)(v9 + 56) + v10);
    swift_release(v8);
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v9);
    if ((v12 & 1) != 0)
    {
      v13 = 2;
      goto LABEL_11;
    }
  }
  else
  {
    swift_release(v8);
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v9);
  }
  v14 = *a2;
  if ((sub_100004F38(v6, v5, *(_QWORD **)(*a2 + direct field offset for GameModeStatus.gameBundleIdentifiers)) & 1) != 0)
    v13 = 1;
  else
    v13 = sub_100004F38(v6, v5, *(_QWORD **)(v14 + direct field offset for GameModeStatus.previousGameBundleIdentifiers)) & 1;
LABEL_11:
  v15 = sub_100015F7C(v6, v5);
  v17 = v16;
  v18 = objc_allocWithZone((Class)type metadata accessor for GameModeCCUIStatusBundleInfo(0));
  swift_bridgeObjectRetain(v5);
  result = GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)(v15, v17, v6, v5, 0, v7 & 1, 0, v13);
  *a3 = result;
  return result;
}

uint64_t sub_100014450(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *aBlock, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, void *))
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v10 = _Block_copy(aBlock);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  _Block_copy(v10);
  swift_retain(a1);
  a6(a3, v11, v13, a1, v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_release(a1);
  return swift_bridgeObjectRelease(v13);
}

uint64_t sub_100014608(const void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = _Block_copy(a1);
  v4 = (uint64_t (__cdecl *)())((char *)&dword_100038710 + dword_100038710);
  v2 = (_QWORD *)swift_task_alloc(unk_100038714);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_100014668;
  return v4();
}

uint64_t sub_100014668(unsigned int a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;

  v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 24));
  v3[2](v3, a1 & 1, (a1 >> 8) & 1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_10001480C(char a1, void *aBlock)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(char);

  *(_QWORD *)(v2 + 16) = _Block_copy(aBlock);
  v6 = (uint64_t (*)(char))((char *)&dword_1000386E8 + dword_1000386E8);
  v4 = (_QWORD *)swift_task_alloc(unk_1000386EC);
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_100014878;
  return v6(a1);
}

uint64_t sub_100014878(char a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v5;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 24));
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1000148E8(uint64_t a1, int a2, void *aBlock, uint64_t (*a4)(uint64_t))
{
  void (**v6)(void *, void *);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  v7 = qword_100037358;
  swift_retain(a1);
  if (v7 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v8 = off_100037F18;
  v9 = swift_retain(off_100037F18);
  v10 = (void *)a4(v9);
  swift_release(v8);
  v6[2](v6, v10);

  _Block_release(v6);
  return swift_release(a1);
}

uint64_t sub_100014998(uint64_t a1, int a2, uint64_t a3, void *aBlock, void (*a5)(uint64_t, uint64_t))
{
  void (**v8)(void *, uint64_t);
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v9 = qword_100037358;
  swift_retain(a1);
  if (v9 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v10 = off_100037F18;
  v11 = swift_retain(off_100037F18);
  a5(v11, a3);
  swift_release(v10);
  v8[2](v8, 1);
  _Block_release(v8);
  return swift_release(a1);
}

uint64_t type metadata accessor for GamePolicyPrivilegedToolProxy()
{
  return objc_opt_self(_TtC11gamepolicyd29GamePolicyPrivilegedToolProxy);
}

uint64_t sub_100014A64(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_100013440;
  return v6();
}

uint64_t sub_100014AB8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_100013440;
  return v7();
}

uint64_t sub_100014B0C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1000131EC(a1);
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
  v16 = swift_allocObject(&unk_1000314B8, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000386E0, v16);
}

uint64_t sub_100014C50(uint64_t a1)
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
    result = sub_100014F58(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
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

uint64_t sub_100014E08(uint64_t a1)
{
  char **v1;
  uint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;
  char v16;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_100024F00(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[16 * v8 + 32];
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
  v11 = *((_QWORD *)v3 + 2);
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    *((_QWORD *)v3 + 2) = v13;
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

uint64_t sub_100014F58(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_100016354();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100002090(&qword_100038690);
          v13 = sub_100015150(v18, i, a3);
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
    type metadata accessor for GameModeCCUIStatusBundleInfo(0);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_100015150(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1000151D0(v6, a2, a3);
  return sub_1000151A4;
}

void sub_1000151A4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1000151D0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_10001523C;
  }
  __break(1u);
  return result;
}

void sub_10001523C(id *a1)
{

}

uint64_t sub_100015248(uint64_t a1)
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

char *sub_1000152B0(uint64_t a1)
{
  return sub_100024F00(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000152C4(uint64_t a1)
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

int64_t sub_100015364(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_100015448(uint64_t a1, uint64_t a2)
{
  return sub_100015474(a1, a2, 0, (uint64_t (*)(_QWORD))type metadata accessor for GamePolicyToolProxy);
}

uint64_t sub_100015458(uint64_t a1, uint64_t a2)
{
  return sub_100015474(a1, a2, 0, (uint64_t (*)(_QWORD))type metadata accessor for GamePolicyCoordinatorObserver);
}

uint64_t sub_100015468(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return sub_100015474(a1, a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for GamePolicyPrivilegedToolProxy);
}

uint64_t sub_100015474(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v9 = a4;
    v7 = a3;
    v4 = a2;
    v6 = a1;
    v8 = *v5;
    if (!((unint64_t)*v5 >> 62))
    {
      v11 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v11 >= a2)
        goto LABEL_4;
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
  }
  if (v8 < 0)
    v30 = v8;
  else
    v30 = v8 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v8);
  v11 = _CocoaArrayWrapper.endIndex.getter(v30);
  swift_bridgeObjectRelease(v8);
  if (v11 < v4)
    goto LABEL_34;
LABEL_4:
  v8 = v4 - v6;
  if (__OFSUB__(v4, v6))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v10 = v6 - v4;
  if (__OFSUB__(0, v8))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v11 = *v5;
  if (!((unint64_t)*v5 >> 62))
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    v13 = v12 - v8;
    if (!__OFADD__(v12, v10))
      goto LABEL_8;
LABEL_42:
    __break(1u);
LABEL_43:
    if (v11 < 0)
      v32 = v11;
    else
      v32 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v11);
    v16 = _CocoaArrayWrapper.endIndex.getter(v32);
    swift_bridgeObjectRelease(v11);
    v11 = *v5;
    goto LABEL_15;
  }
LABEL_37:
  if (v11 < 0)
    v31 = v11;
  else
    v31 = v11 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v11);
  v12 = _CocoaArrayWrapper.endIndex.getter(v31);
  swift_bridgeObjectRelease(v11);
  v13 = v12 + v10;
  if (__OFADD__(v12, v10))
    goto LABEL_42;
LABEL_8:
  v11 = *v5;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v5);
  *v5 = v11;
  v12 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v11 & 0x8000000000000000) == 0
    && (v11 & 0x4000000000000000) == 0)
  {
    v15 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v13 <= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v12 = 1;
  }
  v38 = v6;
  v6 = v8;
  v8 = v10;
  v10 = (uint64_t)v7;
  v7 = v9;
  if ((unint64_t)v11 >> 62)
    goto LABEL_43;
  v16 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v16 <= v13)
    v16 = v13;
  swift_bridgeObjectRetain(v11);
  v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v12, v16, 1, v11);
  v18 = *v5;
  *v5 = v17;
  swift_bridgeObjectRelease(v18);
  v15 = *v5 & 0xFFFFFFFFFFFFFF8;
  v9 = v7;
  v7 = (uint64_t (*)(_QWORD))v10;
  v10 = v8;
  v8 = v6;
  v6 = v38;
LABEL_18:
  v19 = v15 + 32;
  v20 = (char *)(v15 + 32 + 8 * v6);
  v21 = v9(v7);
  v22 = (void *)swift_arrayDestroy(v20, v8, v21);
  if (!v10)
    return specialized Array._endMutation()(v22);
  v23 = *v5;
  if (!((unint64_t)*v5 >> 62))
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    v25 = v24 - v4;
    if (!__OFSUB__(v24, v4))
      goto LABEL_21;
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v23 < 0)
    v33 = *v5;
  else
    v33 = v23 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v5);
  v34 = _CocoaArrayWrapper.endIndex.getter(v33);
  v22 = (void *)swift_bridgeObjectRelease(v23);
  v25 = v34 - v4;
  if (__OFSUB__(v34, v4))
    goto LABEL_52;
LABEL_21:
  if ((v25 & 0x8000000000000000) == 0)
  {
    v26 = (char *)(v19 + 8 * v4);
    if (v6 != v4 || v20 >= &v26[8 * v25])
      v22 = memmove(v20, v26, 8 * v25);
    v4 = *v5;
    if (!((unint64_t)*v5 >> 62))
    {
      v27 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      v28 = v27 + v10;
      if (!__OFADD__(v27, v10))
      {
LABEL_27:
        *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFF8) + 0x10) = v28;
        return specialized Array._endMutation()(v22);
      }
      goto LABEL_58;
    }
LABEL_53:
    if (v4 < 0)
      v35 = v4;
    else
      v35 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v36 = _CocoaArrayWrapper.endIndex.getter(v35);
    v22 = (void *)swift_bridgeObjectRelease(v4);
    v28 = v36 + v10;
    if (!__OFADD__(v36, v10))
      goto LABEL_27;
LABEL_58:
    __break(1u);
  }
  v37 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v37, 1046, 0);
  __break(1u);
  return result;
}

void sub_10001579C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Class isa;
  NSString v14;
  Class v15;

  if (qword_100037328 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v6 = off_1000375F8;
  swift_retain(off_1000375F8);
  v7 = GlobalPreferences.semAllowList.getter();
  swift_release(v6);
  if ((sub_100004F38(a1, a2, (_QWORD *)v7) & 1) == 0)
  {
    swift_bridgeObjectRetain(a2);
    if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0)
      v7 = (uint64_t)sub_100024F00(0, *(_QWORD *)(v7 + 16) + 1, 1, (char *)v7);
    v9 = *(_QWORD *)(v7 + 16);
    v8 = *(_QWORD *)(v7 + 24);
    if (v9 >= v8 >> 1)
      v7 = (uint64_t)sub_100024F00((char *)(v8 > 1), v9 + 1, 1, (char *)v7);
    *(_QWORD *)(v7 + 16) = v9 + 1;
    v10 = v7 + 16 * v9;
    *(_QWORD *)(v10 + 32) = a1;
    *(_QWORD *)(v10 + 40) = a2;
  }
  v11 = off_1000375F8;
  v12 = (void *)*((_QWORD *)off_1000375F8 + 2);
  swift_retain(off_1000375F8);
  swift_bridgeObjectRetain(v7);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  v14 = String._bridgeToObjectiveC()();
  objc_msgSend(v12, "setObject:forKey:", isa, v14);
  swift_release(v11);

  v15 = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v15);
  swift_bridgeObjectRelease(v7);

}

uint64_t sub_10001595C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *i;
  BOOL v8;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 0;
  v6 = 0;
  for (i = (_QWORD *)(a1 + 40); ; i += 2)
  {
    v8 = *(i - 1) == a2 && *i == a3;
    if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      break;
    if (v3 == ++v6)
      return 0;
  }
  return v6;
}

void *sub_1000159EC(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  void *result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((_QWORD *)v4 + 3) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_100024F00(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  result = (void *)swift_arrayDestroy(&v4[16 * a1 + 32], v7, &type metadata for String);
  if (!v7)
    goto LABEL_20;
  v13 = *((_QWORD *)v4 + 2);
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = &v4[16 * a2 + 32];
    if (a1 != a2 || &v4[16 * a1 + 32] >= &v16[16 * v15])
      result = memmove(&v4[16 * a1 + 32], v16, 16 * v15);
    v17 = *((_QWORD *)v4 + 2);
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      *((_QWORD *)v4 + 2) = v18;
LABEL_20:
      *v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  v19 = 2;
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v19, 1046, 0);
  __break(1u);
  return result;
}

void sub_100015B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _UNKNOWN **v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  void *v16;
  Class isa;
  NSString v18;
  uint64_t v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  id *v25;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  Class v33;
  id v34;
  _QWORD *v35;

  if (qword_100037328 != -1)
LABEL_30:
    swift_once(&qword_100037328, sub_10000764C);
  v6 = &off_100037000;
  v7 = off_1000375F8;
  swift_retain(off_1000375F8);
  v8 = (_QWORD *)GlobalPreferences.semAllowList.getter();
  swift_release(v7);
  v35 = v8;
  if ((sub_100004F38(a1, a2, v8) & 1) == 0)
    goto LABEL_11;
  v9 = sub_10001595C((uint64_t)v8, a1, a2);
  if ((v10 & 1) != 0)
    goto LABEL_9;
  v11 = v9;
  v12 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    v32 = a3;
    v13 = v8[2];
    if (v12 == v13)
    {
      v14 = v9 + 1;
LABEL_7:
      a3 = v32;
      v6 = &off_100037000;
      if ((uint64_t)v14 >= v11)
        goto LABEL_10;
      __break(1u);
LABEL_9:
      v11 = v8[2];
      v14 = v11;
LABEL_10:
      sub_1000159EC(v11, v14);
      v8 = v35;
LABEL_11:
      v15 = v6[191];
      v16 = (void *)v15[2];
      swift_retain(v15);
      swift_bridgeObjectRetain(v8);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v8);
      v18 = String._bridgeToObjectiveC()();
      objc_msgSend(v16, "setObject:forKey:", isa, v18);
      swift_release(v15);

      v33 = Array._bridgeToObjectiveC()().super.isa;
      (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v33);
      swift_bridgeObjectRelease(v8);

      return;
    }
    v19 = 2 * v9;
    v14 = v9 + 1;
    while (1)
    {
      if (v12 < 0)
      {
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      if (v14 >= v13)
        goto LABEL_29;
      v21 = &v8[v19];
      v22 = v8[v19 + 6];
      v23 = v8[v19 + 7];
      v24 = v22 == a1 && v23 == a2;
      if (!v24 && (_stringCompareWithSmolCheck(_:_:expecting:)(v22, v23, a1, a2, 0) & 1) == 0)
      {
        if (v14 != v11)
        {
          if (v11 >= v13)
            goto LABEL_32;
          v25 = (id *)&v8[2 * v11 + 4];
          v26 = v25[1];
          v34 = *v25;
          a3 = v21[6];
          v27 = v21[7];
          swift_bridgeObjectRetain(v26);
          swift_bridgeObjectRetain(v27);
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0)
            v8 = sub_1000152B0((uint64_t)v8);
          v28 = &v8[2 * v11];
          v29 = v28[5];
          v28[4] = a3;
          v28[5] = v27;
          swift_bridgeObjectRelease(v29);
          if (v14 >= v8[2])
            goto LABEL_33;
          v30 = &v8[v19];
          v31 = v8[v19 + 7];
          v30[6] = v34;
          v30[7] = v26;
          swift_bridgeObjectRelease(v31);
          v35 = v8;
        }
        if (__OFADD__(v11++, 1))
          break;
      }
      ++v14;
      v13 = v8[2];
      v19 += 2;
      if (v14 == v13)
        goto LABEL_7;
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  __break(1u);
}

void sub_100015E14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  Class isa;
  NSString v7;
  Class v8;
  _BYTE v9[24];

  if (qword_100037320 != -1)
    swift_once(&qword_100037320, sub_100007168);
  swift_beginAccess(&static GlobalPreferences.defaultSEMAllowList, v9, 0, 0);
  v2 = static GlobalPreferences.defaultSEMAllowList;
  v3 = qword_100037328;
  swift_bridgeObjectRetain(static GlobalPreferences.defaultSEMAllowList);
  if (v3 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v4 = off_1000375F8;
  v5 = (void *)*((_QWORD *)off_1000375F8 + 2);
  swift_bridgeObjectRetain(v2);
  swift_retain(v4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "setObject:forKey:", isa, v7);
  swift_release(v4);

  v8 = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a1 + 16))(a1, v8);
  swift_bridgeObjectRelease(v2);

}

uint64_t sub_100015F7C(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unsigned int v9;
  id v10;
  uint64_t v11;

  sub_1000163AC();
  swift_bridgeObjectRetain(a2);
  v4 = sub_100013B94(a1, a2, 0);
  v5 = objc_opt_self(LSApplicationRecord);
  v6 = swift_dynamicCastObjCClass(v4, v5);
  if (!v6)
  {
    v11 = 9666786;
LABEL_6:

    return v11;
  }
  v7 = (void *)v6;
  v4 = v4;
  v8 = objc_msgSend(v7, "applicationState");
  v9 = objc_msgSend(v8, "isValid");

  if (!v9)
  {
    v11 = 9666786;

    goto LABEL_6;
  }
  v10 = objc_msgSend(v7, "localizedName");
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);

  return v11;
}

uint64_t sub_1000160AC(uint64_t a1)
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
      sub_100021C78(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

_QWORD *sub_100016140(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *result;
  int64_t v6;
  int v7;
  int v8;
  char v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v20[2];
  uint64_t v21;
  _QWORD *v22;

  v4 = *(_QWORD *)(a1 + 16);
  result = &_swiftEmptyArrayStorage;
  if (v4)
  {
    v22 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v4);
    result = (_QWORD *)sub_1000152C4(a1);
    v6 = (int64_t)result;
    v8 = v7;
    v10 = v9 & 1;
    while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
    {
      if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
        goto LABEL_13;
      if (*(_DWORD *)(a1 + 36) != v8)
        goto LABEL_14;
      v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
      v12 = v11[1];
      v20[0] = *v11;
      v20[1] = v12;
      swift_bridgeObjectRetain(v12);
      sub_100013FB4(v20, a2, &v21);
      v13 = swift_bridgeObjectRelease(v12);
      if (v2)
        return (_QWORD *)swift_release(v22);
      v14 = v21;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v13);
      v15 = v22[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
      v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v14);
      specialized ContiguousArray._endMutation()(v16);
      result = (_QWORD *)sub_100015364(v6, v8, v10 & 1, a1);
      v6 = (int64_t)result;
      v8 = v17;
      v10 = v18 & 1;
      if (!--v4)
      {
        sub_1000163A0((uint64_t)result, v17, v18 & 1);
        return v22;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  return result;
}

uint64_t sub_1000162D4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(id *)a1;
  v6 = v2;
  v7 = v3;
  v8 = v4;
  return a1;
}

uint64_t sub_100016314(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 8);
  v4 = *(void **)(a1 + 16);

  return a1;
}

unint64_t sub_100016354()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038698;
  if (!qword_100038698)
  {
    v1 = sub_1000117E0(&qword_100038690);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100038698);
  }
  return result;
}

uint64_t sub_1000163A0(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

unint64_t sub_1000163AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000386A0;
  if (!qword_1000386A0)
  {
    v1 = objc_opt_self(LSBundleRecord);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000386A0);
  }
  return result;
}

uint64_t sub_1000163E8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100016414()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_BYTE *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_1000386AC);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_100012F18;
  return ((uint64_t (*)(char, void *))((char *)&dword_1000386A8 + dword_1000386A8))(v2, v3);
}

uint64_t sub_100016484()
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
  v5 = (_QWORD *)swift_task_alloc(dword_1000386BC);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100013440;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000386B8 + dword_1000386B8))(v2, v3, v4);
}

uint64_t sub_100016500(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_1000386CC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100013440;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000386C8 + dword_1000386C8))(a1, v4, v5, v6);
}

uint64_t sub_100016584()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000165A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000386DC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100012F18;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000386D8 + dword_1000386D8))(a1, v4);
}

void *sub_100016618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;

  if ((unint64_t)a1 >> 62)
    goto LABEL_19;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v15))
  {
    v7 = 4;
    while (1)
    {
      v8 = (a1 & 0xC000000000000001) != 0
         ? (_QWORD *)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, a1)
         : *(id *)(a1 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      if ((*(uint64_t (**)(void))((swift_isaMask & *v8) + 0x80))() == a2 && v11 == a3)
      {
        swift_bridgeObjectRelease(a1);
LABEL_17:
        swift_bridgeObjectRelease(a3);
        return v9;
      }
      v13 = v11;
      v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease(v13);
      if ((v14 & 1) != 0)
      {
        a3 = a1;
        goto LABEL_17;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_23;
    }
    __break(1u);
LABEL_19:
    if (a1 < 0)
      v15 = a1;
    else
      v15 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_23:
  swift_bridgeObjectRelease(a1);
  return 0;
}

void sub_100016790(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void (**aBlock)(_QWORD, _QWORD))
{
  void *v9;
  uint64_t v10;
  Swift::OpaquePointer v11;
  id v12;
  uint64_t v13;
  uint64_t inited;
  void *v15;
  _BYTE v16[48];
  _BYTE v17[48];
  uint64_t v18;

  if ((unint64_t)(a1 - 1) < 2)
  {
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v9 = off_1000375F8;
    v10 = sub_100002090(&qword_100038718);
    v11._rawValue = (void *)swift_initStackObject(v10, v17);
    *((_OWORD *)v11._rawValue + 1) = xmmword_100026FE0;
    *((_QWORD *)v11._rawValue + 4) = a2;
    *((_QWORD *)v11._rawValue + 5) = a3;
    swift_bridgeObjectRetain(a3);
    swift_retain(v9);
    GlobalPreferences.setGameModeEnabled(_:bundleIdentifiers:)(a1 == 2, v11);
    swift_setDeallocating(v11._rawValue);
    swift_arrayDestroy((char *)v11._rawValue + 32, *((_QWORD *)v11._rawValue + 2), &type metadata for String);
    swift_release(v9);
    v12 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_100037350 != -1)
      swift_once(&qword_100037350, sub_10000D328);
    objc_msgSend(v12, "postNotificationName:object:", qword_1000391D8, 0);

    goto LABEL_9;
  }
  if (!a1 || a1 == 3)
  {
LABEL_9:
    v13 = sub_100002090(&qword_100038718);
    inited = swift_initStackObject(v13, v16);
    *(_OWORD *)(inited + 16) = xmmword_100026FE0;
    *(_QWORD *)(inited + 32) = a2;
    *(_QWORD *)(inited + 40) = a3;
    swift_bridgeObjectRetain(a3);
    v15 = (void *)sub_100013C78((void *)inited, 1);
    swift_setDeallocating(inited);
    swift_arrayDestroy(inited + 32, *(_QWORD *)(inited + 16), &type metadata for String);
    ((void (**)(_QWORD, void *))aBlock)[2](aBlock, v15);

    return;
  }
  _Block_release(aBlock);
  v18 = a1;
  _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for GameModeCCUIStatusBundleState, &v18, &type metadata for GameModeCCUIStatusBundleState, &type metadata for Int);
  __break(1u);
}

void sub_1000169BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t inited;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  _BYTE v15[48];

  v7 = sub_100002090(&qword_100038718);
  inited = swift_initStackObject(v7, v15);
  *(_OWORD *)(inited + 16) = xmmword_100026FE0;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = a2;
  swift_bridgeObjectRetain(a2);
  v9 = (_QWORD *)sub_100013C78((void *)inited, 0);
  swift_setDeallocating(inited);
  v10 = swift_arrayDestroy(inited + 32, *(_QWORD *)(inited + 16), &type metadata for String);
  v11 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v9) + 0x60))(v10);

  swift_bridgeObjectRetain(a2);
  v12 = sub_100016618(v11, a1, a2);
  swift_bridgeObjectRelease(v11);
  v13 = swift_bridgeObjectRelease(a2);
  if (v12)
  {
    v14 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v12) + 0x118))(v13);

  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v14);

}

void sub_100016AF0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void (**aBlock)(_QWORD, _QWORD))
{
  void *v9;
  uint64_t v10;
  Swift::OpaquePointer v11;
  id v12;
  uint64_t v13;
  uint64_t inited;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  _BYTE v18[48];
  _BYTE v19[48];
  uint64_t v20;

  if ((unint64_t)(a1 - 1) < 2)
  {
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v9 = off_1000375F8;
    v10 = sub_100002090(&qword_100038718);
    v11._rawValue = (void *)swift_initStackObject(v10, v19);
    *((_OWORD *)v11._rawValue + 1) = xmmword_100026FE0;
    *((_QWORD *)v11._rawValue + 4) = a2;
    *((_QWORD *)v11._rawValue + 5) = a3;
    swift_bridgeObjectRetain(a3);
    swift_retain(v9);
    GlobalPreferences.setGameModeEnabled(_:bundleIdentifiers:)(a1 == 2, v11);
    swift_setDeallocating(v11._rawValue);
    swift_arrayDestroy((char *)v11._rawValue + 32, *((_QWORD *)v11._rawValue + 2), &type metadata for String);
    swift_release(v9);
    v12 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_100037350 != -1)
      swift_once(&qword_100037350, sub_10000D328);
    objc_msgSend(v12, "postNotificationName:object:", qword_1000391D8, 0);

    goto LABEL_9;
  }
  if (!a1 || a1 == 3)
  {
LABEL_9:
    v13 = sub_100002090(&qword_100038718);
    inited = swift_initStackObject(v13, v18);
    *(_OWORD *)(inited + 16) = xmmword_100026FE0;
    *(_QWORD *)(inited + 32) = a2;
    *(_QWORD *)(inited + 40) = a3;
    swift_bridgeObjectRetain(a3);
    v15 = (_QWORD *)sub_100013C78((void *)inited, 1);
    swift_setDeallocating(inited);
    v16 = swift_arrayDestroy(inited + 32, *(_QWORD *)(inited + 16), &type metadata for String);
    v17 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v15) + 0x80))(v16);

    ((void (**)(_QWORD, void *))aBlock)[2](aBlock, v17);
    return;
  }
  _Block_release(aBlock);
  v20 = a1;
  _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for GameModeCCUIStatusBundleState, &v20, &type metadata for GameModeCCUIStatusBundleState, &type metadata for Int);
  __break(1u);
}

uint64_t sub_100016D40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = type metadata accessor for Logger(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100016D9C, 0, 0);
}

uint64_t sub_100016D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;

  if (qword_100037358 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = off_100037F18;
  v5 = swift_retain(off_100037F18);
  v6 = sub_10000D490(v5);
  v7 = swift_release(v4);
  v8 = (*(_QWORD **)((char *)&v6->isa + direct field offset for GameModeStatus.gameBundleIdentifiers))[2];
  v9 = *((unsigned __int8 *)&v6->isa + direct field offset for GameModeStatus.enabled);
  v10 = Logger.daemon.unsafeMutableAddressor(v7);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v10, v3);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(14, -1);
    *(_DWORD *)v14 = 67109376;
    *(_DWORD *)(v0 + 40) = v8 != 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 44, v14 + 4, v14 + 8);
    *(_WORD *)(v14 + 8) = 1024;
    *(_DWORD *)(v0 + 44) = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 44, v0 + 48, v14 + 10, v14 + 14);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "requestGameMode(%{BOOL}d %{BOOL}d)", (uint8_t *)v14, 0xEu);
    swift_slowDealloc(v14, -1, -1);
    v15 = v12;
  }
  else
  {
    v15 = v6;
    v6 = v12;
  }

  v16 = *(_QWORD *)(v0 + 32);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 24) + 8))(v16, *(_QWORD *)(v0 + 16));
  swift_task_dealloc(v16);
  if (v9)
    v17 = 256;
  else
    v17 = 0;
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v17 | (v8 != 0));
}

uint64_t sub_100016F74(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v1 + 52) = a1;
  v2 = type metadata accessor for Logger(0);
  *(_QWORD *)(v1 + 24) = v2;
  v3 = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v1 + 32) = v3;
  *(_QWORD *)(v1 + 40) = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100016FD4, 0, 0);
}

uint64_t sub_100016FD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char *v6;
  Swift::OpaquePointer v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;

  if (qword_100037358 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = off_100037F18;
  v5 = swift_retain(off_100037F18);
  v6 = (char *)sub_10000D490(v5);
  swift_release(v4);
  v7._rawValue = *(void **)&v6[direct field offset for GameModeStatus.gameBundleIdentifiers];
  v8 = swift_bridgeObjectRetain(v7._rawValue);
  v9 = Logger.daemon.unsafeMutableAddressor(v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v9, v1);
  v10 = swift_bridgeObjectRetain_n(v7._rawValue, 2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.info.getter();
  v13 = os_log_type_enabled(v11, v12);
  v15 = *(_QWORD *)(v0 + 32);
  v14 = *(_QWORD *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 24);
  if (v13)
  {
    v31 = *(_QWORD *)(v0 + 24);
    v32 = v6;
    v17 = *(unsigned __int8 *)(v0 + 52);
    v30 = *(_QWORD *)(v0 + 32);
    v18 = swift_slowAlloc(18, -1);
    v19 = swift_slowAlloc(32, -1);
    v33 = v19;
    *(_DWORD *)v18 = 67109378;
    *(_DWORD *)(v0 + 48) = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 52, v18 + 4, v18 + 8);
    *(_WORD *)(v18 + 8) = 2080;
    v20 = swift_bridgeObjectRetain(v7._rawValue);
    v21 = Array.description.getter(v20, &type metadata for String);
    v23 = v22;
    swift_bridgeObjectRelease(v7._rawValue);
    *(_QWORD *)(v0 + 16) = sub_100004814(v21, v23, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v18 + 10, v18 + 18);
    v24 = v23;
    v6 = v32;
    swift_bridgeObjectRelease(v24);
    swift_bridgeObjectRelease_n(v7._rawValue, 2);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "gameModeEnabled:(%{BOOL}d for:%s", (uint8_t *)v18, 0x12u);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v18, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v14, v31);
  }
  else
  {
    swift_bridgeObjectRelease_n(v7._rawValue, 2);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  if (qword_100037328 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v25 = *(_BYTE *)(v0 + 52);
  v26 = off_1000375F8;
  swift_retain(off_1000375F8);
  GlobalPreferences.setGameModeEnabled(_:bundleIdentifiers:)(v25, v7);
  swift_bridgeObjectRelease(v7._rawValue);
  swift_release(v26);
  v27 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  if (qword_100037350 != -1)
    swift_once(&qword_100037350, sub_10000D328);
  v28 = *(_QWORD *)(v0 + 40);
  objc_msgSend(v27, "postNotificationName:object:", qword_1000391D8, 0);

  swift_task_dealloc(v28);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_10001731C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100017348()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  _QWORD *v3;

  v2 = *(const void **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc(dword_1000386F4);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100013440;
  return ((uint64_t (*)(const void *))((char *)&dword_1000386F0 + dword_1000386F0))(v2);
}

uint64_t sub_1000173B4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000173E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  objc_class *v18;
  char *v19;
  uint64_t v20;
  id v21;
  id v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char *v28;
  id v29;
  id v30;
  NSString v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  objc_super v49;
  void *v50;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v46 = *(_QWORD *)(v2 - 8);
  v47 = v2;
  __chkstk_darwin(v2);
  v48 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000117A4();
  static DispatchQoS.unspecified.getter();
  v50 = &_swiftEmptyArrayStorage;
  v14 = sub_1000179DC();
  v15 = sub_100002090(&qword_100038140);
  v16 = sub_100017A24();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v50, v15, v16, v8, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v4);
  v17 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000015, 0x8000000100028A40, v13, v10, v7, 0);
  *(_QWORD *)(v1 + 16) = v17;
  *(_QWORD *)(v1 + 40) = 0;
  *(_BYTE *)(v1 + 48) = 2;
  v18 = (objc_class *)type metadata accessor for GamePolicyToolCoordinator();
  v19 = (char *)objc_allocWithZone(v18);
  v20 = OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_lock;
  v21 = objc_allocWithZone((Class)NSLock);
  v22 = v17;
  v23 = v19;
  v24 = v21;
  v25 = v46;
  *(_QWORD *)&v19[v20] = objc_msgSend(v24, "init");
  v26 = v47;
  *(_QWORD *)&v23[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v23[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v23[OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_queue] = v22;
  v27 = v22;

  v49.receiver = v23;
  v49.super_class = v18;
  v28 = v48;
  v29 = objc_msgSendSuper2(&v49, "init");

  *(_QWORD *)(v1 + 24) = v29;
  v30 = objc_allocWithZone((Class)NSXPCListener);
  v31 = String._bridgeToObjectiveC()();
  v32 = objc_msgSend(v30, "initWithMachServiceName:", v31);

  *(_QWORD *)(v1 + 32) = v32;
  objc_msgSend(v32, "setDelegate:", *(_QWORD *)(v1 + 24));
  v33 = Logger.daemon.unsafeMutableAddressor(objc_msgSend(v32, "resume"));
  v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v33, v26);
  v35 = Logger.logObject.getter(v34);
  v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "GamePolicyDaemon has initialized!", v37, 2u);
    swift_slowDealloc(v37, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v26);
  if ((sub_100017814() & 1) != 0)
    goto LABEL_7;
  if (qword_100037328 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v38 = off_1000375F8;
  swift_retain(off_1000375F8);
  v39 = GlobalPreferences.ignoreDeviceRestrictions.getter();
  swift_release(v38);
  if ((v39 & 1) != 0)
  {
LABEL_7:
    v40 = *(void **)(v1 + 16);
    v41 = objc_allocWithZone((Class)type metadata accessor for EmbeddedGameProcessMonitor(0));
    v42 = v40;
    v43 = sub_100023950(v42);

    v44 = *(void **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = v43;

  }
  return v1;
}

uint64_t sub_100017814()
{
  uint64_t v0;
  int v1;
  uint64_t result;

  v1 = *(unsigned __int8 *)(v0 + 48);
  if (v1 != 2)
    return v1 & 1;
  result = sub_1000050A4();
  *(_BYTE *)(v0 + 48) = result;
  return result;
}

void sub_100017844()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = Logger.daemon.unsafeMutableAddressor(v4);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "startup", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v12 = *(void **)(v1 + 40);
  if (v12)
  {
    v13 = v12;
    sub_10001DD14();

  }
}

uint64_t sub_100017960()
{
  id *v0;

  return swift_deallocClassInstance(v0, 49, 7);
}

uint64_t type metadata accessor for GamePolicyDaemon_iOS()
{
  return objc_opt_self(_TtC11gamepolicyd20GamePolicyDaemon_iOS);
}

void sub_1000179BC()
{
  sub_100017844();
}

unint64_t sub_1000179DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038138;
  if (!qword_100038138)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_100038138);
  }
  return result;
}

unint64_t sub_100017A24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038148;
  if (!qword_100038148)
  {
    v1 = sub_1000117E0(&qword_100038140);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100038148);
  }
  return result;
}

uint64_t sub_100017A70(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  uint64_t v11;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v7 = sub_1000022E4((uint64_t)a1);
      if ((v8 & 1) != 0)
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v7);
        swift_retain(v6);
        return v6;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = __CocoaDictionary.lookup(_:)();

  if (!v4)
    return 0;
  v10 = v4;
  v5 = type metadata accessor for EmbeddedGameProcess();
  swift_unknownObjectRetain(v4);
  swift_dynamicCast(&v11, &v10, (char *)&type metadata for Swift.AnyObject + 8, v5, 7);
  v6 = v11;
  swift_unknownObjectRelease(v4);
  return v6;
}

BOOL sub_100017B34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100017B4C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100017B90()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100017BB8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100017BF8()
{
  void *v0;
  NSString v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v1 = String._bridgeToObjectiveC()();
  v2 = sub_1000046A8(0, (unint64_t *)&unk_100037C90, NSNumber_ptr);
  v3 = objc_msgSend(v0, "objectForKey:ofClass:", v1, swift_getObjCClassFromMetadata(v2));

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v8, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_100001E90((uint64_t)v8, (uint64_t)v9);
  if (!v10)
  {
    sub_100024740((uint64_t)v9, &qword_100037600);
    return 2;
  }
  if ((swift_dynamicCast(&v7, v9, (char *)&type metadata for Any + 8, v2, 6) & 1) == 0)
    return 2;
  v4 = v7;
  v5 = objc_msgSend(v7, "BOOLValue");

  return (uint64_t)v5;
}

uint64_t sub_100017D04(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  Swift::Int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  id v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  id v40;
  char v41;
  void *v42;
  _QWORD *v43;
  id v44;
  id v45;
  char v46;
  _BOOL4 v47;
  _BOOL4 v48;
  int v49;
  uint64_t v50;
  int v51;
  char v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  BOOL v60;
  char v61;
  uint64_t v62;
  id *v63;
  void *v64;
  id v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  char v78;
  char v79;
  char *v80;
  uint64_t result;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  uint64_t v92;
  _QWORD *v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  _BOOL4 v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  char *v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  __int128 v121;
  __int128 v122;

  v2 = v1;
  v4 = type metadata accessor for OSSignpostID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100002090(&qword_100038CA0);
  __chkstk_darwin(v8);
  v10 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_DWORD *)(v2 + 47) = 0;
  v11 = sub_10002436C((uint64_t)&off_100030C38);
  swift_arrayDestroy(&unk_100030C58, 3, &type metadata for String);
  *(_QWORD *)(v2 + 56) = v11;
  *(_QWORD *)(v2 + 16) = a1;
  v12 = a1;
  objc_msgSend(v12, "auditToken");
  v116 = v122;
  v117 = v121;
  v13 = (void *)objc_opt_self(LSBundleRecord);
  v119 = 0;
  v121 = v117;
  v122 = v116;
  v14 = objc_msgSend(v13, "bundleRecordForAuditToken:error:", &v121, &v119);
  v15 = (id)v119;
  if (!v14)
  {
    v33 = (id)v119;
    v34 = _convertNSErrorToError(_:)(v15);

    swift_willThrow();
    swift_errorRelease(v34);
    goto LABEL_10;
  }
  v16 = v14;
  v17 = objc_opt_self(LSApplicationRecord);
  v18 = (void *)swift_dynamicCastObjCClass(v16, v17);
  v19 = v15;
  if (!v18 || (v20 = objc_msgSend(v18, "bundleIdentifier")) == 0)
  {

LABEL_10:
    swift_bridgeObjectRelease(*(_QWORD *)(v2 + 56));
    v35 = type metadata accessor for EmbeddedGameProcess();
    swift_deallocPartialClassInstance(v2, v35, 64, 7);
    return 0;
  }
  v21 = v20;
  v115 = v7;
  v112 = v5;
  v113 = v4;
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v24 = v23;

  v110 = v22;
  *(_QWORD *)(v2 + 24) = v22;
  *(_QWORD *)(v2 + 32) = v24;
  v114 = objc_msgSend(v18, "infoDictionary", swift_bridgeObjectRetain(v24).n128_f64[0]);
  *(_QWORD *)&v117 = objc_msgSend(v18, "entitlements");
  v25 = objc_msgSend(v18, "requiredDeviceCapabilities");
  v26 = sub_1000046A8(0, (unint64_t *)&unk_100037C90, NSNumber_ptr);
  v27 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v25, &type metadata for String, v26, &protocol witness table for String);

  if (*(_QWORD *)(v27 + 16) && (v28 = sub_1000090D4(0xD00000000000001ELL, 0x800000010002A4A0), (v29 & 1) != 0))
  {
    v30 = *(id *)(*(_QWORD *)(v27 + 56) + 8 * v28);
    swift_bridgeObjectRelease(v27);
    v31 = objc_msgSend(v30, "BOOLValue");

    if ((v31 & 1) != 0)
    {
      v32 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    swift_bridgeObjectRelease(v27);
  }
  v36 = objc_msgSend(v18, "requiredDeviceCapabilities");
  v37 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v36, &type metadata for String, v26, &protocol witness table for String);

  if (*(_QWORD *)(v37 + 16) && (v38 = sub_1000090D4(0xD00000000000001FLL, 0x800000010002A4C0), (v39 & 1) != 0))
  {
    v40 = *(id *)(*(_QWORD *)(v37 + 56) + 8 * v38);
    swift_bridgeObjectRelease(v37);
    v32 = objc_msgSend(v40, "BOOLValue");

  }
  else
  {
    swift_bridgeObjectRelease(v37);
    v32 = 0;
  }
LABEL_16:
  *(_BYTE *)(v2 + 40) = v32;
  v41 = 1;
  if ((sub_100017BF8() & 1) == 0)
  {
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v42 = off_1000375F8;
    swift_retain(off_1000375F8);
    v43 = (_QWORD *)GlobalPreferences.semAllowList.getter();
    swift_release(v42);
    v41 = sub_100004F38(v110, v24, v43);
    swift_bridgeObjectRelease(v43);
  }
  *(_BYTE *)(v2 + 42) = v41 & 1;
  *(_BYTE *)(v2 + 46) = 1;
  v44 = objc_msgSend(v18, "iTunesMetadata");
  v45 = objc_msgSend(v44, "genreIdentifier");

  LOBYTE(v116) = sub_100017BF8() & 1;
  LODWORD(v116) = v116;
  v46 = sub_100017BF8();
  if (v46 == 2)
  {
    v47 = 0;
    *(_BYTE *)(v2 + 43) = 1;
    if (v45 != (id)6014)
    {
      v48 = 0;
      if (v45)
        goto LABEL_29;
    }
  }
  else
  {
    v48 = v46 != 0;
    *(_BYTE *)(v2 + 43) = 1;
    if (v45 && v45 != (id)6014)
    {
      LOBYTE(v47) = 0;
      goto LABEL_29;
    }
    v47 = v46 != 0;
  }
  v48 = v47;
  if ((_DWORD)v116)
    LOBYTE(v47) = 1;
LABEL_29:
  *(_BYTE *)(v2 + 44) = v47;
  v49 = *(unsigned __int8 *)(v2 + 42);
  v111 = v12;
  if (v49 == 1)
  {
    v50 = swift_bridgeObjectRelease(v24);
    LOBYTE(v51) = 1;
    *(_BYTE *)(v2 + 41) = 1;
    goto LABEL_45;
  }
  v109 = v48;
  v52 = sub_100018940(v110, v24, *(_QWORD *)(v2 + 56));
  v50 = swift_bridgeObjectRelease(v24);
  if ((v52 & 1) != 0)
    goto LABEL_32;
  if (v45 != (id)6014 && v45)
    goto LABEL_43;
  v50 = sub_100017BF8();
  if (v50 != 2)
  {
    *(_BYTE *)(v2 + 41) = v50;
    LOBYTE(v51) = v50 != 0;
    goto LABEL_44;
  }
  v51 = *(unsigned __int8 *)(v2 + 40);
  if (v51 == 1)
  {
    *(_BYTE *)(v2 + 41) = 1;
    goto LABEL_44;
  }
  if (v45 != (id)6014)
    goto LABEL_43;
  v50 = (uint64_t)objc_msgSend(v18, "SDKVersion");
  if (!v50)
    goto LABEL_43;
  v53 = (void *)v50;
  v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
  v56 = v55;

  *(_QWORD *)&v121 = v54;
  *((_QWORD *)&v121 + 1) = v56;
  v119 = 808335409;
  v120 = 0xE400000000000000;
  v57 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v10, 1, 1, v57);
  v58 = sub_100011824();
  v59 = StringProtocol.compare<A>(_:options:range:locale:)(&v119, 64, 0, 0, 1, v10, &type metadata for String, &type metadata for String, v58, v58);
  sub_100024740((uint64_t)v10, &qword_100038CA0);
  swift_bridgeObjectRelease(v120);
  v50 = swift_bridgeObjectRelease(*((_QWORD *)&v121 + 1));
  if (v59 != -1)
  {
LABEL_43:
    LOBYTE(v51) = 0;
    *(_BYTE *)(v2 + 41) = 0;
    goto LABEL_44;
  }
  v50 = sub_100017BF8();
  if ((v50 & 1) == 0)
  {
    v107 = sub_100024550((uint64_t)&off_100030C88);
    v82 = objc_msgSend(v18, "iTunesMetadata");
    v83 = objc_msgSend(v82, "subgenres");

    v84 = sub_100002090(&qword_100038CC0);
    v85 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v83, v84);

    v86 = v85;
    v87 = *(_QWORD *)(v85 + 16);
    if (!v87)
    {
      swift_bridgeObjectRelease(v85);
      v93 = &_swiftEmptyArrayStorage;
LABEL_74:
      v96 = v93[2];
      v97 = v107;
      if (!v96)
      {
        swift_bridgeObjectRelease(v107);
        v50 = swift_bridgeObjectRelease(v93);
        LOBYTE(v51) = 0;
        *(_BYTE *)(v2 + 41) = 0;
        goto LABEL_44;
      }
      v98 = 0;
      v108 = (char *)(v93 + 4);
      v110 = *(_QWORD *)(v107 + 16);
      v99 = v107 + 56;
      do
      {
        if (v110)
        {
          v100 = *(_QWORD *)&v108[8 * v98];
          v101 = static Hasher._hash(seed:_:)(*(_QWORD *)(v97 + 40), v100);
          v102 = -1 << *(_BYTE *)(v97 + 32);
          v103 = v101 & ~v102;
          if (((*(_QWORD *)(v99 + ((v103 >> 3) & 0xFFFFFFFFFFFFF8)) >> v103) & 1) != 0)
          {
            v104 = *(_QWORD *)(v97 + 48);
            if (*(_QWORD *)(v104 + 8 * v103) == v100)
            {
LABEL_83:
              swift_bridgeObjectRelease(v97);
              v50 = swift_bridgeObjectRelease(v93);
              goto LABEL_32;
            }
            v105 = ~v102;
            while (1)
            {
              v103 = (v103 + 1) & v105;
              if (((*(_QWORD *)(v99 + ((v103 >> 3) & 0xFFFFFFFFFFFFF8)) >> v103) & 1) == 0)
                break;
              if (*(_QWORD *)(v104 + 8 * v103) == v100)
                goto LABEL_83;
            }
          }
        }
        ++v98;
      }
      while (v98 != v96);
      swift_bridgeObjectRelease(v97);
      v50 = swift_bridgeObjectRelease(v93);
      goto LABEL_43;
    }
    v119 = (uint64_t)&_swiftEmptyArrayStorage;
    sub_10002197C(0, v87, 0);
    v88 = 0;
    v110 = (uint64_t)&type metadata for Any + 8;
    while (1)
    {
      v89 = *(_QWORD *)(v86 + 8 * v88 + 32);
      if (!*(_QWORD *)(v89 + 16))
        goto LABEL_66;
      swift_bridgeObjectRetain(*(_QWORD *)(v86 + 8 * v88 + 32));
      v90 = sub_1000090D4(0x644965726E6567, 0xE700000000000000);
      if ((v91 & 1) == 0)
        break;
      sub_100004904(*(_QWORD *)(v89 + 56) + 32 * v90, (uint64_t)&v121);
      if ((swift_dynamicCast(&v118, &v121, v110, &type metadata for UInt, 6) & 1) == 0)
        break;
      v92 = v118;
      swift_bridgeObjectRelease(v89);
LABEL_67:
      v93 = (_QWORD *)v119;
      if ((swift_isUniquelyReferenced_nonNull_native(v119) & 1) == 0)
      {
        sub_10002197C(0, v93[2] + 1, 1);
        v93 = (_QWORD *)v119;
      }
      v95 = v93[2];
      v94 = v93[3];
      if (v95 >= v94 >> 1)
      {
        sub_10002197C(v94 > 1, v95 + 1, 1);
        v93 = (_QWORD *)v119;
      }
      ++v88;
      v93[2] = v95 + 1;
      v93[v95 + 4] = v92;
      if (v87 == v88)
      {
        swift_bridgeObjectRelease(v86);
        goto LABEL_74;
      }
    }
    swift_bridgeObjectRelease(v89);
LABEL_66:
    v92 = 0;
    goto LABEL_67;
  }
LABEL_32:
  LOBYTE(v51) = 1;
  *(_BYTE *)(v2 + 41) = 1;
LABEL_44:
  LOBYTE(v48) = v109;
LABEL_45:
  v60 = v48;
  if ((_DWORD)v116)
    v61 = 1;
  else
    v61 = v48;
  *(_BYTE *)(v2 + 45) = v51 & v61;
  v62 = static os_signpost_type_t.begin.getter(v50);
  v63 = (id *)Logger.stateTracking.unsafeMutableAddressor();
  v64 = *(void **)(v2 + 16);
  v65 = *v63;
  v66 = objc_msgSend(v64, "pid");
  if ((v66 & 0x80000000) == 0)
  {
    OSSignpostID.init(_:)(v66);
    v67 = sub_100002090(&qword_100038CA8);
    v68 = swift_allocObject(v67, 352, 7);
    *(_OWORD *)(v68 + 16) = xmmword_1000270E0;
    v69 = objc_msgSend(v18, "bundleIdentifier");
    if (v69)
    {
      v70 = v69;
      v71 = static String._unconditionallyBridgeFromObjectiveC(_:)(v69);
      v73 = v72;

    }
    else
    {
      v71 = 0;
      v73 = 0;
    }
    *(_QWORD *)(v68 + 56) = &type metadata for String;
    *(_QWORD *)(v68 + 64) = sub_10002450C();
    v74 = 0x6E776F6E6B6E753CLL;
    if (v73)
      v74 = v71;
    v75 = 0xE90000000000003ELL;
    if (v73)
      v75 = v73;
    *(_QWORD *)(v68 + 32) = v74;
    *(_QWORD *)(v68 + 40) = v75;
    v76 = *(_BYTE *)(v2 + 40);
    *(_QWORD *)(v68 + 96) = &type metadata for Bool;
    *(_QWORD *)(v68 + 104) = &protocol witness table for Bool;
    *(_BYTE *)(v68 + 72) = v76;
    *(_QWORD *)(v68 + 136) = &type metadata for Bool;
    *(_QWORD *)(v68 + 144) = &protocol witness table for Bool;
    *(_BYTE *)(v68 + 112) = v116;
    *(_QWORD *)(v68 + 176) = &type metadata for Bool;
    *(_QWORD *)(v68 + 184) = &protocol witness table for Bool;
    *(_BYTE *)(v68 + 152) = v60;
    v77 = *(_BYTE *)(v2 + 42);
    *(_QWORD *)(v68 + 216) = &type metadata for Bool;
    *(_QWORD *)(v68 + 224) = &protocol witness table for Bool;
    *(_BYTE *)(v68 + 192) = v77;
    *(_QWORD *)(v68 + 256) = &type metadata for Bool;
    *(_QWORD *)(v68 + 264) = &protocol witness table for Bool;
    *(_BYTE *)(v68 + 232) = 1;
    v78 = *(_BYTE *)(v2 + 44);
    *(_QWORD *)(v68 + 296) = &type metadata for Bool;
    *(_QWORD *)(v68 + 304) = &protocol witness table for Bool;
    *(_BYTE *)(v68 + 272) = v78;
    v79 = *(_BYTE *)(v2 + 45);
    *(_QWORD *)(v68 + 336) = &type metadata for Bool;
    *(_QWORD *)(v68 + 344) = &protocol witness table for Bool;
    *(_BYTE *)(v68 + 312) = v79;
    v80 = v115;
    os_signpost(_:dso:log:name:signpostID:_:_:)(v62, &_mh_execute_header, v65, "GameSession", 11, 2, v115, "Bundle ID = %{public, name=bundleId}%s\n\nRequires Performance Gaming Tier = %{public, name=requiresPerformanceGamingTier}%d\n\nRequires Increased Memory Limit = %{public, name=requiresIncreasedMemoryLimit}d\n\nRequires Increased Debug Memory Limit = %{public, name=requiresIncreasedDebugMemoryLimit}d\n\nSupports SEM = %{public, name=supportsSEM}d\n\nSupports Model Manager Assertion = %{public, name=supportsModelManagerAssertion}d\n\n"
      "Requires Model Manager Assertion %{public, name=requiresModelManagerAssertion}d\n"
      "\n"
      "Supports Camera Jettison S2R %{public, name=supportsCameraJettisonS2R}d",
      577,
      2,
      v68);

    swift_bridgeObjectRelease(v68);
    (*(void (**)(char *, uint64_t))(v112 + 8))(v80, v113);
    return v2;
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, 2, 3451, 0);
  __break(1u);
  return result;
}

uint64_t sub_100018940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
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
  _QWORD v18[9];

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)(v18, *(_QWORD *)(a3 + 40));
    String.hash(into:)(v18, a1, a2);
    v6 = Hasher._finalize()();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
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

uint64_t sub_100018A74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t result;
  char v12;
  uint64_t v13;

  v1 = type metadata accessor for OSSignpostID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = static os_signpost_type_t.end.getter(v3);
  v7 = (id *)Logger.stateTracking.unsafeMutableAddressor();
  v8 = *(void **)(v0 + 16);
  v9 = *v7;
  v10 = objc_msgSend(v8, "pid");
  if ((v10 & 0x80000000) != 0)
  {
    v12 = 2;
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, v12, 3451, 0);
    __break(1u);
  }
  else
  {
    OSSignpostID.init(_:)(v10);
    os_signpost(_:dso:log:name:signpostID:)(v6, &_mh_execute_header, v9, "GameSession", 11, 2, v5);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
    return v0;
  }
  return result;
}

uint64_t sub_100018BC4()
{
  uint64_t v0;

  sub_100018A74();
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t sub_100018BE4()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  Swift::String v12;
  Swift::String v13;

  _StringGuts.grow(_:)(29);
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(0xE000000000000000);
  v2._countAndFlagsBits = 978143008;
  v2._object = (void *)0xE400000000000000;
  String.append(_:)(v2);
  if (*(_BYTE *)(v0 + 41))
    v3 = 1702195828;
  else
    v3 = 0x65736C6166;
  if (*(_BYTE *)(v0 + 41))
    v4 = 0xE400000000000000;
  else
    v4 = 0xE500000000000000;
  v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  swift_bridgeObjectRelease(v4);
  v6._countAndFlagsBits = 0x3A53504420;
  v6._object = (void *)0xE500000000000000;
  String.append(_:)(v6);
  v7._countAndFlagsBits = 1702195828;
  v7._object = (void *)0xE400000000000000;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0x3A4D455320;
  v8._object = (void *)0xE500000000000000;
  String.append(_:)(v8);
  if (*(_BYTE *)(v0 + 42))
    v9 = 1702195828;
  else
    v9 = 0x65736C6166;
  if (*(_BYTE *)(v0 + 42))
    v10 = 0xE400000000000000;
  else
    v10 = 0xE500000000000000;
  v11 = v10;
  String.append(_:)(*(Swift::String *)&v9);
  swift_bridgeObjectRelease(v10);
  v12._countAndFlagsBits = 0x3A414D4D20;
  v12._object = (void *)0xE500000000000000;
  String.append(_:)(v12);
  v13._countAndFlagsBits = 1702195828;
  v13._object = (void *)0xE400000000000000;
  String.append(_:)(v13);
  return v1;
}

Swift::Int sub_100018D3C()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;
  _QWORD v4[9];

  v1 = *v0;
  Hasher.init(_seed:)(v4, 0);
  v2 = *(id *)(v1 + 16);
  NSObject.hash(into:)(v4);

  return Hasher._finalize()();
}

void sub_100018D8C(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v3 = *(id *)(*(_QWORD *)v1 + 16);
  NSObject.hash(into:)(a1);

}

Swift::Int sub_100018DD4(uint64_t a1)
{
  uint64_t v1;
  id v2;
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  v2 = *(id *)(*(_QWORD *)v1 + 16);
  NSObject.hash(into:)(v4);

  return Hasher._finalize()();
}

uint64_t sub_100018E20()
{
  return sub_100018BE4();
}

uint64_t sub_100018E40(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  sub_1000046A8(0, (unint64_t *)&unk_100038B70, NSObject_ptr);
  return static NSObject.== infix(_:_:)(*(_QWORD *)(v2 + 16), *(_QWORD *)(v3 + 16)) & 1;
}

uint64_t sub_100018E94()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for GameModeState()
{
  return objc_opt_self(_TtC11gamepolicyd13GameModeState);
}

id sub_100018EDC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int *v6;
  int *v7;
  int *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_super v21;
  char v22[24];
  char v23[24];
  char v24[24];
  char v25[24];

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (int *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken];
  swift_beginAccess(&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken], v25, 0, 0);
  if (*v6)
    notify_cancel(*v6);
  v7 = (int *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken];
  swift_beginAccess(&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken], v24, 0, 0);
  if (*v7)
    notify_cancel(*v7);
  v8 = (int *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken];
  swift_beginAccess(&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken], v23, 0, 0);
  if (*v8)
    notify_cancel(*v8);
  v9 = &v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken];
  swift_beginAccess(&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken], v22, 0, 0);
  v10 = *(unsigned int *)v9;
  if ((_DWORD)v10)
    v10 = notify_cancel(v10);
  v11 = Logger.daemon.unsafeMutableAddressor(v10);
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "com.apple.GamePolicyAngel.notification.service Shutdown", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v16 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection;
  v17 = *(void **)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection];
  if (v17)
  {
    objc_msgSend(v17, "invalidate");
    v18 = *(void **)&v1[v16];
  }
  else
  {
    v18 = 0;
  }
  *(_QWORD *)&v1[v16] = 0;

  v19 = (objc_class *)type metadata accessor for EmbeddedGameProcessMonitor(0);
  v21.receiver = v1;
  v21.super_class = v19;
  return objc_msgSendSuper2(&v21, "dealloc");
}

uint64_t sub_10001926C()
{
  return type metadata accessor for EmbeddedGameProcessMonitor(0);
}

uint64_t type metadata accessor for EmbeddedGameProcessMonitor(uint64_t a1)
{
  uint64_t result;

  result = qword_100038B58;
  if (!qword_100038B58)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for EmbeddedGameProcessMonitor);
  return result;
}

void sub_1000192B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  _UNKNOWN **v5;
  _UNKNOWN **v6;
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
  uint64_t v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  void *v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  char v75;
  int *v76;
  uint64_t v77;
  _QWORD *v78;
  int v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t, uint64_t, uint64_t);
  _BYTE *v91;
  int *v92;
  uint64_t v93;
  uint64_t v94;
  int *v95;
  _BYTE *v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t (*v104)(char *, uint64_t, char *);
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  uint8_t *v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  void (*v113)(char *, char *);
  char v114;
  char v115;
  int *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  NSObject *v127;
  os_log_type_t v128;
  uint8_t *v129;
  uint64_t v130;
  id v131;
  char *v132;
  uint64_t v133;
  uint64_t (*v134)(char *, uint64_t, char *);
  char *v135;
  uint64_t v136;
  NSObject *v137;
  os_log_type_t v138;
  uint8_t *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  void (*v145)(char *, char *);
  int *v146;
  char v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  id v156;
  char *v157;
  const char *v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  NSObject *v164;
  os_log_type_t v165;
  uint8_t *v166;
  uint64_t v167;
  uint64_t v168;
  char v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  double v173;
  uint64_t v174;
  double v175;
  void *v176;
  unint64_t Banner;
  double v178;
  unint64_t v179;
  char v180;
  uint64_t v181;
  char *v182;
  char *v183;
  void (*v184)(char *, uint64_t);
  uint64_t v185;
  _QWORD *v186;
  unint64_t v187;
  char *v188;
  uint64_t v189;
  double v190;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v192;
  void *v193;
  Class isa;
  NSString v195;
  id v196;
  void *v197;
  void *v198;
  unint64_t v199;
  uint64_t v200;
  uint64_t i;
  uint64_t v202;
  uint64_t Strong;
  uint64_t v204;
  id v205;
  uint64_t v206;
  id v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  char v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  char v215;
  unsigned int *v216;
  uint64_t v217;
  uint64_t v218;
  char *v219;
  uint64_t v220;
  unint64_t v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  char *v225;
  uint64_t v226;
  NSObject *v227;
  os_log_type_t v228;
  uint8_t *v229;
  char *v230;
  char *v231;
  unint64_t v232;
  uint64_t v233;
  int v234;
  int v235;
  char *v236;
  char *v237;
  char *v238;
  char *v239;
  char *v240;
  char *v241;
  char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  char *v246;
  char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  char *v253;
  _UNKNOWN **v254;
  int *v255;
  uint64_t v256;
  uint64_t v257;
  _BYTE *v258;
  id v259;
  uint64_t v260;
  char v261[16];
  id v262;
  uint64_t v263;
  uint64_t v264;
  char v265[8];
  unint64_t v266;
  uint64_t v267;
  ValueMetadata *v268;
  unint64_t v269;
  char v270[8];

  v6 = v5;
  LODWORD(v259) = a5;
  v11 = type metadata accessor for GameModeStatus.Config(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v230 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v251 = type metadata accessor for Date(0);
  v250 = *(_QWORD *)(v251 - 8);
  v14 = __chkstk_darwin(v251);
  v237 = (char *)&v230 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v238 = (char *)&v230 - v17;
  __chkstk_darwin(v16);
  v246 = (char *)&v230 - v18;
  v244 = type metadata accessor for OSSignpostID(0);
  v243 = *(_QWORD *)(v244 - 8);
  __chkstk_darwin(v244);
  v242 = (char *)&v230 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v249 = type metadata accessor for String.Encoding(0);
  v248 = *(_QWORD *)(v249 - 8);
  __chkstk_darwin(v249);
  v247 = (char *)&v230 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v256 = type metadata accessor for Logger(0);
  v21 = *(_QWORD *)(v256 - 8);
  v22 = __chkstk_darwin(v256);
  v24 = (char *)&v230 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v22);
  v239 = (char *)&v230 - v26;
  v27 = __chkstk_darwin(v25);
  v241 = (char *)&v230 - v28;
  v29 = __chkstk_darwin(v27);
  v236 = (char *)&v230 - v30;
  __chkstk_darwin(v29);
  v253 = (char *)&v230 - v31;
  v32 = sub_100002090(&qword_100038128);
  v33 = __chkstk_darwin(v32);
  v35 = (char *)&v230 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  if (*((_BYTE *)v6 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsGameMode) != 1)
    return;
  v231 = (char *)&v230 - v36;
  v230 = v24;
  v37 = (char *)v6 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig;
  swift_beginAccess((char *)v6 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig, v270, 1, 0);
  v235 = *v37;
  v234 = v37[*(int *)(v11 + 32)];
  v38 = *(_QWORD *)&v37[*(int *)(v11 + 44)];
  *v37 = a1 & 1;
  v39 = *(int *)(v11 + 32);
  v258 = v37;
  v37[v39] = a2 & 1;
  v240 = v13;
  v233 = v38;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v208 = a3;
    else
      v208 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v38);
    swift_bridgeObjectRetain(a3);
    v40 = _CocoaArrayWrapper.endIndex.getter(v208);
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v40 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v38);
  }
  v41 = &_swiftEmptyArrayStorage;
  v254 = v6;
  v257 = a1;
  v252 = v21;
  v260 = a4;
  v255 = (int *)v11;
  v245 = a2;
  if (v40)
  {
    v266 = (unint64_t)&_swiftEmptyArrayStorage;
    sub_100021998(0, v40 & ~(v40 >> 63), 0);
    if (v40 < 0)
    {
      __break(1u);
      goto LABEL_172;
    }
    v41 = (_QWORD *)v266;
    if ((a3 & 0xC000000000000001) != 0)
    {
      v42 = 0;
      do
      {
        v43 = specialized _ArrayBuffer._getElementSlowPath(_:)(v42, a3);
        v44 = *(_QWORD *)(v43 + 24);
        v45 = *(_QWORD *)(v43 + 32);
        swift_bridgeObjectRetain(v45);
        swift_unknownObjectRelease(v43);
        v266 = (unint64_t)v41;
        v47 = v41[2];
        v46 = v41[3];
        if (v47 >= v46 >> 1)
        {
          sub_100021998(v46 > 1, v47 + 1, 1);
          v41 = (_QWORD *)v266;
        }
        ++v42;
        v41[2] = v47 + 1;
        v48 = (char *)&v41[2 * v47];
        *((_QWORD *)v48 + 4) = v44;
        *((_QWORD *)v48 + 5) = v45;
      }
      while (v40 != v42);
    }
    else
    {
      v49 = a3 + 32;
      do
      {
        v51 = *(_QWORD *)(*(_QWORD *)v49 + 24);
        v50 = *(_QWORD *)(*(_QWORD *)v49 + 32);
        v266 = (unint64_t)v41;
        v53 = v41[2];
        v52 = v41[3];
        swift_bridgeObjectRetain(v50);
        if (v53 >= v52 >> 1)
        {
          sub_100021998(v52 > 1, v53 + 1, 1);
          v41 = (_QWORD *)v266;
        }
        v41[2] = v53 + 1;
        v54 = (char *)&v41[2 * v53];
        *((_QWORD *)v54 + 4) = v51;
        *((_QWORD *)v54 + 5) = v50;
        v49 += 8;
        --v40;
      }
      while (v40);
    }
    v6 = v254;
    LOBYTE(a1) = v257;
    a4 = v260;
    v11 = (uint64_t)v255;
    LODWORD(a2) = v245;
  }
  v55 = *(int *)(v11 + 44);
  v56 = v258;
  v57 = *(_QWORD *)&v258[v55];
  *(_QWORD *)&v258[v55] = v41;
  swift_bridgeObjectRelease(v57);
  if (qword_100037358 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v58 = off_100037F18;
  v59 = (_QWORD *)swift_retain(off_100037F18);
  v60 = sub_10000E800(v59);
  swift_release(v58);
  *(_QWORD *)&v56[*(int *)(v11 + 52)] = v60;
  v232 = (unint64_t)a4 >> 62;
  if ((unint64_t)a4 >> 62)
  {
    if (a4 < 0)
      v209 = a4;
    else
      v209 = a4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a4);
    v40 = _CocoaArrayWrapper.endIndex.getter(v209);
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    v40 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v61 = &_swiftEmptyArrayStorage;
  if (v40)
  {
    v266 = (unint64_t)&_swiftEmptyArrayStorage;
    sub_100021998(0, v40 & ~(v40 >> 63), 0);
    if ((v40 & 0x8000000000000000) == 0)
    {
      v61 = (_QWORD *)v266;
      if ((a4 & 0xC000000000000001) != 0)
      {
        v62 = 0;
        do
        {
          v63 = specialized _ArrayBuffer._getElementSlowPath(_:)(v62, v260);
          v64 = *(_QWORD *)(v63 + 24);
          v65 = *(_QWORD *)(v63 + 32);
          swift_bridgeObjectRetain(v65);
          swift_unknownObjectRelease(v63);
          v266 = (unint64_t)v61;
          v67 = v61[2];
          v66 = v61[3];
          if (v67 >= v66 >> 1)
          {
            sub_100021998(v66 > 1, v67 + 1, 1);
            v61 = (_QWORD *)v266;
          }
          ++v62;
          v61[2] = v67 + 1;
          v68 = &v61[2 * v67];
          v68[4] = v64;
          v68[5] = v65;
        }
        while (v40 != v62);
      }
      else
      {
        v69 = a4 + 32;
        do
        {
          v70 = *(_QWORD *)(*(_QWORD *)v69 + 24);
          v71 = *(_QWORD *)(*(_QWORD *)v69 + 32);
          v266 = (unint64_t)v61;
          v73 = v61[2];
          v72 = v61[3];
          swift_bridgeObjectRetain(v71);
          if (v73 >= v72 >> 1)
          {
            sub_100021998(v72 > 1, v73 + 1, 1);
            v61 = (_QWORD *)v266;
          }
          v61[2] = v73 + 1;
          v74 = &v61[2 * v73];
          v74[4] = v70;
          v74[5] = v71;
          v69 += 8;
          --v40;
        }
        while (v40);
      }
      v6 = v254;
      LOBYTE(a1) = v257;
      LODWORD(a2) = v245;
      goto LABEL_34;
    }
LABEL_172:
    __break(1u);
    goto LABEL_173;
  }
LABEL_34:
  v75 = v235 ^ a1;
  v235 = v234 ^ a2;
  v76 = v255;
  v77 = (uint64_t)v258;
  v78 = *(_QWORD **)&v258[v255[9]];
  v79 = sub_100020D08(v78, v61);
  if ((v79 & 1) != 0)
  {
    swift_bridgeObjectRelease(v61);
    v41 = v240;
    if ((v75 & 1) == 0)
    {
      v80 = swift_bridgeObjectRelease(v233);
      v81 = v253;
      if ((v259 & 1) == 0)
      {
        v35 = (char *)v256;
        v11 = v252;
        v94 = (uint64_t)v258;
        if ((v235 & 1) == 0)
          goto LABEL_124;
        v234 = 0;
        goto LABEL_75;
      }
      v234 = 0;
      v35 = (char *)v256;
      v11 = v252;
      goto LABEL_53;
    }
  }
  else
  {
    v82 = v76[10];
    v83 = *(_QWORD *)(v77 + v82);
    *(_QWORD *)(v77 + v82) = v78;
    swift_bridgeObjectRetain(v78);
    swift_bridgeObjectRelease(v83);
    v84 = v76[9];
    v85 = *(_QWORD *)(v77 + v84);
    *(_QWORD *)(v77 + v84) = v61;
    swift_bridgeObjectRelease(v85);
    if ((v75 & 1) == 0)
    {
      v94 = v77;
      v80 = swift_bridgeObjectRelease(v233);
      if ((v259 & 1) == 0)
      {
        v35 = (char *)v256;
        v11 = v252;
        v41 = v240;
        if ((v235 & 1) == 0)
          goto LABEL_96;
        v234 = 1;
        goto LABEL_75;
      }
      v234 = 1;
      v35 = (char *)v256;
      v11 = v252;
      goto LABEL_52;
    }
  }
  v86 = v251;
  v87 = v250;
  if ((a1 & 1) != 0)
  {
    v88 = swift_bridgeObjectRelease(v233);
    v89 = (uint64_t)v231;
    Date.init()(v88);
    v90 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v87 + 56);
    v90(v89, 0, 1, v86);
    v91 = v258;
    swift_beginAccess(v258, &v266, 33, 0);
    v92 = v255;
    sub_10002477C(v89, (uint64_t)&v91[v255[5]]);
    v93 = (uint64_t)&v91[v92[6]];
    sub_100024740(v93, &qword_100038128);
    v90(v93, 1, 1, v86);
    v80 = swift_endAccess(&v266);
    v35 = (char *)v256;
    v11 = v252;
  }
  else
  {
    v95 = v255;
    v96 = v258;
    sub_1000246F8((uint64_t)&v258[v255[5]], (uint64_t)v35);
    v97 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v87 + 48))(v35, 1, v86);
    v98 = sub_100024740((uint64_t)v35, &qword_100038128);
    v11 = v252;
    if (v97 == 1)
    {
      v99 = v233;
    }
    else
    {
      v100 = (uint64_t)v231;
      Date.init()(v98);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v87 + 56))(v100, 0, 1, v86);
      swift_beginAccess(v96, &v266, 33, 0);
      sub_10002477C(v100, (uint64_t)&v96[v95[6]]);
      v101 = v95[12];
      v102 = *(_QWORD *)&v96[v101];
      *(_QWORD *)&v96[v101] = v233;
      swift_endAccess(&v266);
      v99 = v102;
    }
    v80 = swift_bridgeObjectRelease(v99);
    v35 = (char *)v256;
  }
  v234 = v79 ^ 1;
LABEL_52:
  v81 = v253;
LABEL_53:
  v103 = Logger.daemon.unsafeMutableAddressor(v80);
  v104 = *(uint64_t (**)(char *, uint64_t, char *))(v11 + 16);
  v105 = v104(v81, v103, v35);
  v106 = Logger.logObject.getter(v105);
  v107 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v106, v107))
  {
    v108 = (uint8_t *)swift_slowAlloc(12, -1);
    v109 = swift_slowAlloc(32, -1);
    *(_DWORD *)v108 = 136446210;
    v6 = v254;
    v266 = v109;
    if ((v257 & 1) != 0)
      v110 = 0x64656C62616E65;
    else
      v110 = 0x64656C6261736964;
    if ((v257 & 1) != 0)
      v111 = 0xE700000000000000;
    else
      v111 = 0xE800000000000000;
    v264 = sub_100004814(v110, v111, (uint64_t *)&v266);
    v11 = v252;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v264, v265, v108 + 4, v108 + 12);
    v112 = v111;
    v35 = (char *)v256;
    swift_bridgeObjectRelease(v112);
    _os_log_impl((void *)&_mh_execute_header, v106, v107, "Game mode %{public}s.", v108, 0xCu);
    swift_arrayDestroy(v109, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v109, -1, -1);
    swift_slowDealloc(v108, -1, -1);

    v113 = *(void (**)(char *, char *))(v11 + 8);
    v113(v253, v35);
  }
  else
  {

    v113 = *(void (**)(char *, char *))(v11 + 8);
    v113(v81, v35);
  }
  v268 = &type metadata for GamePolicyFF;
  v269 = sub_10000501C();
  LOBYTE(v266) = 0;
  v114 = isFeatureEnabled(_:)(&v266);
  v80 = sub_1000048E4(&v266);
  if ((v114 & 1) != 0)
  {
    v115 = v257;
    sub_100006B94(v257 & 1);
    v116 = (int *)((char *)v6 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken);
    swift_beginAccess((char *)v6 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken, v261, 0, 0);
    if (*v116)
    {
      notify_set_state(*v116, v115 & 1);
      v117 = *(uint64_t *)((char *)v6 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotification
                                     + 8);
      v266 = *(unint64_t *)((char *)v6
                                 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotification);
      v267 = v117;
      swift_bridgeObjectRetain(v117);
      v118 = v247;
      static String.Encoding.utf8.getter(v119);
      v120 = sub_100011824();
      v121 = StringProtocol.cString(using:)(v118, &type metadata for String, v120);
      (*(void (**)(char *, uint64_t))(v248 + 8))(v118, v249);
      swift_bridgeObjectRelease(v267);
      if (v121)
        v122 = (const char *)(v121 + 32);
      else
        v122 = 0;
      notify_post(v122);
      v123 = swift_bridgeObjectRelease(v121);
      if ((v115 & 1) != 0)
        v124 = static os_signpost_type_t.begin.getter(v123);
      else
        v124 = static os_signpost_type_t.end.getter(v123);
      v130 = v124;
      v131 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
      v132 = v242;
      static OSSignpostID.exclusive.getter();
      os_signpost(_:dso:log:name:signpostID:)(v130, &_mh_execute_header, v131, "GameModeEnabled", 15, 2, v132);

      v80 = (*(uint64_t (**)(char *, uint64_t))(v243 + 8))(v132, v244);
    }
    else
    {
      v125 = v236;
      v126 = v104(v236, v103, v35);
      v127 = Logger.logObject.getter(v126);
      v128 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v127, v128))
      {
        v129 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v129 = 0;
        _os_log_impl((void *)&_mh_execute_header, v127, v128, "Unable to post game mode darwin notification - token is invalid!", v129, 2u);
        swift_slowDealloc(v129, -1, -1);
      }

      v80 = ((uint64_t (*)(char *, char *))v113)(v125, v35);
    }
  }
  if (((v235 | v259) & 1) == 0)
    goto LABEL_92;
LABEL_75:
  v133 = Logger.daemon.unsafeMutableAddressor(v80);
  v134 = *(uint64_t (**)(char *, uint64_t, char *))(v11 + 16);
  v135 = v241;
  v136 = v134(v241, v133, v35);
  v137 = Logger.logObject.getter(v136);
  v138 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v137, v138))
  {
    v139 = (uint8_t *)swift_slowAlloc(12, -1);
    v140 = swift_slowAlloc(32, -1);
    *(_DWORD *)v139 = 136446210;
    v266 = v140;
    if ((v257 & 1) != 0)
      v141 = 0x64656C62616E65;
    else
      v141 = 0x64656C6261736964;
    if ((v257 & 1) != 0)
      v142 = 0xE700000000000000;
    else
      v142 = 0xE800000000000000;
    v264 = sub_100004814(v141, v142, (uint64_t *)&v266);
    v35 = (char *)v256;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v264, v265, v139 + 4, v139 + 12);
    v143 = v142;
    v11 = v252;
    swift_bridgeObjectRelease(v143);
    _os_log_impl((void *)&_mh_execute_header, v137, v138, "Jettison Camera S2R %{public}s.", v139, 0xCu);
    swift_arrayDestroy(v140, 1, (char *)&type metadata for Any + 8);
    v144 = v140;
    v6 = v254;
    swift_slowDealloc(v144, -1, -1);
    swift_slowDealloc(v139, -1, -1);
  }

  v145 = *(void (**)(char *, char *))(v11 + 8);
  v145(v135, v35);
  v146 = (int *)((char *)v6
               + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken);
  swift_beginAccess((char *)v6 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken, &v264, 0, 0);
  v147 = v245;
  if (!*v146)
  {
    v162 = v239;
    v163 = v134(v239, v133, v35);
    v164 = Logger.logObject.getter(v163);
    v165 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v164, v165))
    {
      v166 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v166 = 0;
      _os_log_impl((void *)&_mh_execute_header, v164, v165, "Unable to post game mode camera jettison S2R darwin notification - token is invalid!", v166, 2u);
      swift_slowDealloc(v166, -1, -1);
    }

    v145(v162, v35);
LABEL_92:
    v94 = (uint64_t)v258;
    v41 = v240;
    goto LABEL_95;
  }
  notify_set_state(*v146, v245 & 1);
  v148 = *(uint64_t *)((char *)v6
                    + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotification
                    + 8);
  v266 = *(unint64_t *)((char *)v6
                             + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotification);
  v267 = v148;
  swift_bridgeObjectRetain(v148);
  v149 = v247;
  static String.Encoding.utf8.getter(v150);
  v151 = sub_100011824();
  v152 = StringProtocol.cString(using:)(v149, &type metadata for String, v151);
  (*(void (**)(char *, uint64_t))(v248 + 8))(v149, v249);
  swift_bridgeObjectRelease(v267);
  if (v152)
    v153 = (const char *)(v152 + 32);
  else
    v153 = 0;
  notify_post(v153);
  v154 = swift_bridgeObjectRelease(v152);
  v41 = v240;
  if ((v147 & 1) != 0)
  {
    v155 = static os_signpost_type_t.begin.getter(v154);
    v156 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
    v157 = v242;
    static OSSignpostID.exclusive.getter();
    v158 = "JettisonCameraS2R: Enabled";
    v159 = v155;
    v160 = v156;
    v161 = 26;
  }
  else
  {
    v167 = static os_signpost_type_t.end.getter(v154);
    v156 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
    v157 = v242;
    static OSSignpostID.exclusive.getter();
    v158 = "JettisonCameraS2R: Disabled";
    v159 = v167;
    v160 = v156;
    v161 = 27;
  }
  os_signpost(_:dso:log:name:signpostID:)(v159, &_mh_execute_header, v160, v158, v161, 2, v157);

  (*(void (**)(char *, uint64_t))(v243 + 8))(v157, v244);
  v94 = (uint64_t)v258;
LABEL_95:
  if ((v234 & 1) == 0)
    goto LABEL_124;
LABEL_96:
  if (v232)
  {
    if (v260 < 0)
      v174 = v260;
    else
      v174 = v260 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v260);
    if (_CocoaArrayWrapper.endIndex.getter(v174))
      goto LABEL_98;
LABEL_109:
    swift_bridgeObjectRelease(v260);
    goto LABEL_124;
  }
  v168 = *(_QWORD *)((v260 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v260);
  if (!v168)
    goto LABEL_109;
LABEL_98:
  v40 = v260;
  if ((v260 & 0xC000000000000001) != 0)
    goto LABEL_174;
  v169 = v257;
  if (!*(_QWORD *)((v260 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_176;
  }
  v170 = *(_QWORD *)(v260 + 32);
  swift_retain(v170);
  while (1)
  {
    swift_bridgeObjectRelease(v40);
    v94 = *(_QWORD *)(v170 + 24);
    v40 = *(_QWORD *)(v170 + 32);
    swift_bridgeObjectRetain(v40);
    v171 = swift_release(v170);
    Date.init()(v171);
    v6 = &off_100037000;
    if ((v169 & 1) != 0)
    {
      if (qword_100037328 != -1)
        swift_once(&qword_100037328, sub_10000764C);
      v172 = off_1000375F8;
      swift_retain(off_1000375F8);
      v173 = GlobalPreferences.gameModeOnBannerDefaultTime.getter();
    }
    else
    {
      if (qword_100037328 != -1)
        swift_once(&qword_100037328, sub_10000764C);
      v172 = off_1000375F8;
      swift_retain(off_1000375F8);
      v173 = GlobalPreferences.gameModeOffBannerDefaultTime.getter();
    }
    v175 = v173;
    swift_release(v172);
    if (v175 <= 0.0)
      goto LABEL_179;
    if (qword_100037328 != -1)
      swift_once(&qword_100037328, sub_10000764C);
    v176 = off_1000375F8;
    swift_bridgeObjectRetain(v40);
    swift_retain(v176);
    Banner = GlobalPreferences.gameModeLastBannerDates.getter();
    v178 = 0.0;
    if (*(_QWORD *)(Banner + 16))
    {
      v179 = sub_1000090D4(v94, v40);
      if ((v180 & 1) != 0)
        v178 = *(double *)(*(_QWORD *)(Banner + 56) + 8 * v179);
    }
    swift_bridgeObjectRelease(v40);
    v181 = swift_bridgeObjectRelease(Banner);
    v182 = v237;
    Date.init(timeIntervalSinceReferenceDate:)(v181, v178);
    swift_release(v176);
    v183 = v238;
    static Date.+ infix(_:_:)(v182, v175);
    v184 = *(void (**)(char *, uint64_t))(v250 + 8);
    v185 = v251;
    v184(v182, v251);
    LOBYTE(v182) = static Date.< infix(_:_:)(v183, v246);
    v184(v183, v185);
    v6 = &off_100037000;
    if ((v182 & 1) != 0)
    {
LABEL_179:
      if (qword_100037328 != -1)
LABEL_176:
        swift_once(&qword_100037328, sub_10000764C);
      v186 = v6[191];
      swift_retain(v186);
      v187 = GlobalPreferences.gameModeLastBannerDates.getter();
      swift_bridgeObjectRetain(v40);
      v188 = v246;
      v190 = Date.timeIntervalSinceReferenceDate.getter(v189);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v187);
      v266 = v187;
      sub_100009F4C(v94, v40, isUniquelyReferenced_nonNull_native, v190);
      v192 = v266;
      swift_bridgeObjectRelease(v40);
      swift_bridgeObjectRelease(0x8000000000000000);
      v193 = (void *)v186[2];
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v192);
      v195 = String._bridgeToObjectiveC()();
      objc_msgSend(v193, "setValue:forKey:", isa, v195);
      swift_release(v186);

      v6 = v254;
      sub_10001F740(v94, v40, 1, v257 & 1, 0);
      swift_bridgeObjectRelease(v40);
      (*(void (**)(char *, uint64_t))(v250 + 8))(v188, v251);
    }
    else
    {
      v184(v246, v251);
      swift_bridgeObjectRelease(v40);
      v6 = v254;
    }
    v94 = (uint64_t)v258;
LABEL_124:
    sub_100011868(v94, (uint64_t)v41, (uint64_t (*)(_QWORD))&type metadata accessor for GameModeStatus.Config);
    v196 = objc_allocWithZone((Class)type metadata accessor for GameModeStatus(0));
    v197 = (void *)GameModeStatus.init(config:)(v41);
    v40 = (uint64_t)off_100037F18;
    v198 = (void *)*((_QWORD *)off_100037F18 + 2);
    swift_retain(off_100037F18);
    objc_msgSend(v198, "lock");
    v253 = (char *)v40;
    v259 = v197;
    sub_10000FD58(v40, v197, &v266);
    objc_msgSend(v198, "unlock");
    v199 = v266;
    if (v266 >> 62)
    {
      if ((v266 & 0x8000000000000000) != 0)
        v210 = v266;
      else
        v210 = v266 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v266);
      v200 = _CocoaArrayWrapper.endIndex.getter(v210);
      swift_bridgeObjectRelease(v199);
      if (!v200)
      {
LABEL_150:
        swift_release(v253);
        goto LABEL_151;
      }
    }
    else
    {
      v200 = *(_QWORD *)((v266 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v200)
        goto LABEL_150;
    }
    if (v200 >= 1)
      break;
LABEL_173:
    __break(1u);
LABEL_174:
    v170 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v40);
    v169 = v257;
  }
  for (i = 0; i != v200; ++i)
  {
    if ((v199 & 0xC000000000000001) != 0)
    {
      v202 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v199);
    }
    else
    {
      v202 = *(_QWORD *)(v199 + 8 * i + 32);
      swift_retain(v202);
    }
    Strong = swift_unknownObjectWeakLoadStrong(v202 + 16);
    if (Strong)
    {
      v204 = Strong;
      v205 = objc_msgSend(*(id *)(Strong + 16), "remoteObjectProxy");
      _bridgeAnyObjectToAny(_:)(&v266, v205);
      swift_unknownObjectRelease(v205);
      v206 = sub_100002090(&qword_100038CE0);
      if ((swift_dynamicCast(&v262, &v266, (char *)&type metadata for Any + 8, v206, 6) & 1) != 0)
      {
        v207 = v262;
        objc_msgSend(v262, "updateStatus::::", v259, 0, 0, 0);
        swift_release(v202);
        swift_unknownObjectRelease(v204);
        swift_unknownObjectRelease(v207);
      }
      else
      {
        swift_release(v202);
        swift_unknownObjectRelease(v204);
      }
    }
    else
    {
      swift_release(v202);
    }
  }
  swift_release(v253);
  v6 = v254;
  v35 = (char *)v256;
  v11 = v252;
LABEL_151:
  swift_bridgeObjectRelease(v199);
  v211 = v257;
  if ((unint64_t)(*(_QWORD *)&v258[v255[13]] - 1) >= 2)
  {
    if (v232)
    {
      v212 = v260;
      if (v260 < 0)
        v213 = v260;
      else
        v213 = v260 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v260);
      v214 = _CocoaArrayWrapper.endIndex.getter(v213);
      swift_bridgeObjectRelease(v212);
      if (!v214)
        goto LABEL_160;
    }
    else if (!*(_QWORD *)((v260 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_160;
    }
  }
  v211 = 1;
LABEL_160:
  v268 = &type metadata for GamePolicyFF;
  v269 = sub_10000501C();
  LOBYTE(v266) = 0;
  v215 = isFeatureEnabled(_:)(&v266);
  sub_1000048E4(&v266);
  if ((v215 & 1) == 0)
  {
LABEL_166:

    return;
  }
  v216 = (unsigned int *)((char *)v6
                        + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken);
  swift_beginAccess((char *)v6 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken, &v266, 0, 0);
  v217 = *v216;
  if ((_DWORD)v217)
  {
    notify_set_state(v217, v211 & 1);
    v218 = *(uint64_t *)((char *)v6
                      + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotification
                      + 8);
    v262 = *(_UNKNOWN **)((char *)v6
                        + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotification);
    v263 = v218;
    swift_bridgeObjectRetain(v218);
    v219 = v247;
    static String.Encoding.utf8.getter(v220);
    v221 = sub_100011824();
    v222 = StringProtocol.cString(using:)(v219, &type metadata for String, v221);
    (*(void (**)(char *, uint64_t))(v248 + 8))(v219, v249);
    swift_bridgeObjectRelease(v263);
    if (v222)
      v223 = (const char *)(v222 + 32);
    else
      v223 = 0;
    notify_post(v223);
    swift_bridgeObjectRelease(v222);
    goto LABEL_166;
  }
  v224 = Logger.daemon.unsafeMutableAddressor(v217);
  v225 = v230;
  v226 = (*(uint64_t (**)(char *, uint64_t, char *))(v11 + 16))(v230, v224, v35);
  v227 = Logger.logObject.getter(v226);
  v228 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v227, v228))
  {
    v229 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v229 = 0;
    _os_log_impl((void *)&_mh_execute_header, v227, v228, "Unable to post game mode available darwin notification - token is invalid!", v229, 2u);
    swift_slowDealloc(v229, -1, -1);
  }

  (*(void (**)(char *, char *))(v11 + 8))(v225, v35);
}

void sub_10001AC08(unsigned __int8 a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  int v15;
  _BYTE *v16;
  int v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  __objc2_meth *v41;
  uint64_t k;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  id v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  char *v75;
  uint64_t m;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v103;
  id v104;
  void *v105;
  void *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  int v112;
  int v113;
  _BYTE *v114;
  int *v115;
  uint64_t v116;
  _QWORD v117[3];
  char v118[24];

  v116 = a2;
  v6 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100002090(&qword_100038128);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v108 - v13;
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsModelManagerGameAssertion) == 1)
  {
    v15 = a1;
    v16 = (_BYTE *)(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig);
    swift_beginAccess(v3 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig, v118, 1, 0);
    v17 = *v16;
    if (v17 == 2)
    {
      v18 = a1 == 2;
      if (a1 != 2)
        goto LABEL_28;
    }
    else
    {
      if (a1 == 2)
      {
        v18 = 0;
        goto LABEL_28;
      }
      if ((v17 & 1) != 0)
        v19 = 0x4D656D6147414141;
      else
        v19 = 0xD000000000000010;
      if ((v17 & 1) != 0)
        v20 = 0xEB0000000065646FLL;
      else
        v20 = 0x80000001000286E0;
      if ((a1 & 1) != 0)
        v21 = 0x4D656D6147414141;
      else
        v21 = 0xD000000000000010;
      if ((a1 & 1) != 0)
        v22 = 0xEB0000000065646FLL;
      else
        v22 = 0x80000001000286E0;
      if (v19 == v21 && v20 == v22)
      {
        swift_bridgeObjectRelease_n(v20, 2);
        if ((a3 & 1) == 0)
          return;
        v18 = 1;
LABEL_28:
        v112 = v18;
        v113 = v15;
        v24 = *(_QWORD *)&v16[*(int *)(v6 + 36)];
        *v16 = v15;
        v117[0] = &_swiftEmptyArrayStorage;
        v25 = v116;
        v111 = v24;
        if ((unint64_t)v116 >> 62)
        {
          if (v116 < 0)
            v37 = v116;
          else
            v37 = v116 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v24);
          swift_bridgeObjectRetain(v25);
          v26 = _CocoaArrayWrapper.endIndex.getter(v37);
          if (!v26)
            goto LABEL_45;
        }
        else
        {
          v26 = *(_QWORD *)((v116 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain(v24);
          swift_bridgeObjectRetain(v25);
          if (!v26)
            goto LABEL_45;
        }
        if (v26 < 1)
        {
          __break(1u);
          goto LABEL_108;
        }
        if ((v25 & 0xC000000000000001) != 0)
        {
          for (i = 0; i != v26; ++i)
          {
            v30 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v25);
            v31 = v30;
            if (*(_BYTE *)(v30 + 44) == 1)
            {
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v30);
              v28 = *(_QWORD *)(v117[0] + 16);
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v28);
              v29 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v28, v31);
              specialized ContiguousArray._endMutation()(v29);
              v25 = v116;
            }
            else
            {
              swift_unknownObjectRelease(v30);
            }
          }
        }
        else
        {
          for (j = 0; j != v26; ++j)
          {
            v33 = *(_QWORD *)(v25 + 8 * j + 32);
            if (*(_BYTE *)(v33 + 44) == 1)
            {
              v34 = swift_retain(*(_QWORD *)(v25 + 8 * j + 32));
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v34);
              v35 = *(_QWORD *)(v117[0] + 16);
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v35);
              v36 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v35, v33);
              specialized ContiguousArray._endMutation()(v36);
              v25 = v116;
            }
          }
        }
LABEL_45:
        swift_bridgeObjectRelease(v25);
        v109 = v14;
        v114 = v16;
        v115 = (int *)v6;
        v38 = v117[0];
        if ((v117[0] & 0x8000000000000000) != 0 || (v117[0] & 0x4000000000000000) != 0)
        {
          v107 = swift_retain(v117[0]);
          v39 = _CocoaArrayWrapper.endIndex.getter(v107);
        }
        else
        {
          v39 = *(_QWORD *)(v117[0] + 16);
          swift_retain(v117[0]);
        }
        v40 = (char *)&_swiftEmptyArrayStorage;
        v41 = &stru_100036000;
        v110 = v8;
        v108 = v12;
        if (!v39)
          goto LABEL_63;
        if (v39 >= 1)
        {
          for (k = 0; k != v39; ++k)
          {
            if ((v38 & 0xC000000000000001) != 0)
            {
              v43 = specialized _ArrayBuffer._getElementSlowPath(_:)(k, v38);
            }
            else
            {
              v43 = *(_QWORD *)(v38 + 8 * k + 32);
              swift_retain(v43);
            }
            v44 = objc_msgSend(*(id *)(v43 + 16), v41[103].name, v108);
            if (v44
              && (v45 = v44,
                  v46 = objc_msgSend(v44, "identifier"),
                  v45,
                  v46))
            {
              v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
              v49 = v48;
              swift_release(v43);

              if ((swift_isUniquelyReferenced_nonNull_native(v40) & 1) == 0)
                v40 = sub_100024F00(0, *((_QWORD *)v40 + 2) + 1, 1, v40);
              v51 = *((_QWORD *)v40 + 2);
              v50 = *((_QWORD *)v40 + 3);
              if (v51 >= v50 >> 1)
                v40 = sub_100024F00((char *)(v50 > 1), v51 + 1, 1, v40);
              *((_QWORD *)v40 + 2) = v51 + 1;
              v52 = &v40[16 * v51];
              *((_QWORD *)v52 + 4) = v47;
              *((_QWORD *)v52 + 5) = v49;
              v41 = &stru_100036000;
            }
            else
            {
              swift_release(v43);
            }
          }
LABEL_63:
          swift_release_n(v38, 2);
          v53 = v115[8];
          v54 = *(_QWORD *)&v114[v53];
          *(_QWORD *)&v114[v53] = v40;
          swift_bridgeObjectRelease(v54);
          v117[0] = &_swiftEmptyArrayStorage;
          if (v26)
          {
            v55 = v116;
            if ((v116 & 0xC000000000000001) == 0)
            {
              swift_bridgeObjectRetain(v116);
              for (m = 0; m != v26; ++m)
              {
                v77 = *(_QWORD *)(v55 + 8 * m + 32);
                if (*(_BYTE *)(v77 + 50) == 1)
                {
                  v78 = swift_retain(*(_QWORD *)(v55 + 8 * m + 32));
                  specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v78);
                  v79 = *(_QWORD *)(v117[0] + 16);
                  specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v79);
                  v80 = v79;
                  v41 = &stru_100036000;
                  v81 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v80, v77);
                  specialized ContiguousArray._endMutation()(v81);
                  v55 = v116;
                }
              }
              swift_bridgeObjectRelease(v55);
              v61 = v117[0];
              if ((v117[0] & 0x8000000000000000) != 0)
                goto LABEL_93;
              goto LABEL_72;
            }
            swift_bridgeObjectRetain(v116);
            for (n = 0; n != v26; ++n)
            {
              v59 = specialized _ArrayBuffer._getElementSlowPath(_:)(n, v55);
              v60 = v59;
              if (*(_BYTE *)(v59 + 50) == 1)
              {
                specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v59);
                v57 = *(_QWORD *)(v117[0] + 16);
                specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v57);
                v58 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v57, v60);
                specialized ContiguousArray._endMutation()(v58);
                v55 = v116;
              }
              else
              {
                swift_unknownObjectRelease(v59);
              }
            }
            swift_bridgeObjectRelease(v55);
            v41 = &stru_100036000;
          }
          v61 = v117[0];
          if ((v117[0] & 0x8000000000000000) != 0)
            goto LABEL_93;
LABEL_72:
          if ((v61 & 0x4000000000000000) == 0)
          {
            v62 = *(_QWORD *)(v61 + 16);
            swift_retain(v61);
            v63 = v113;
            if (v62)
              goto LABEL_74;
            goto LABEL_94;
          }
LABEL_93:
          v82 = swift_retain(v61);
          v62 = _CocoaArrayWrapper.endIndex.getter(v82);
          v63 = v113;
          if (v62)
          {
LABEL_74:
            if (v62 >= 1)
            {
              v64 = 0;
              v65 = (char *)&_swiftEmptyArrayStorage;
              do
              {
                if ((v61 & 0xC000000000000001) != 0)
                {
                  v66 = specialized _ArrayBuffer._getElementSlowPath(_:)(v64, v61);
                }
                else
                {
                  v66 = *(_QWORD *)(v61 + 8 * v64 + 32);
                  swift_retain(v66);
                }
                v67 = objc_msgSend(*(id *)(v66 + 16), v41[103].name, v108);
                if (v67
                  && (v68 = v67,
                      v69 = objc_msgSend(v67, "identifier"),
                      v68,
                      v69))
                {
                  v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v69);
                  v72 = v71;
                  swift_release(v66);

                  if ((swift_isUniquelyReferenced_nonNull_native(v65) & 1) == 0)
                    v65 = sub_100024F00(0, *((_QWORD *)v65 + 2) + 1, 1, v65);
                  v74 = *((_QWORD *)v65 + 2);
                  v73 = *((_QWORD *)v65 + 3);
                  if (v74 >= v73 >> 1)
                    v65 = sub_100024F00((char *)(v73 > 1), v74 + 1, 1, v65);
                  *((_QWORD *)v65 + 2) = v74 + 1;
                  v75 = &v65[16 * v74];
                  *((_QWORD *)v75 + 4) = v70;
                  *((_QWORD *)v75 + 5) = v72;
                  v41 = &stru_100036000;
                }
                else
                {
                  swift_release(v66);
                }
                ++v64;
              }
              while (v62 != v64);
              goto LABEL_95;
            }
LABEL_109:
            __break(1u);
            return;
          }
LABEL_94:
          v65 = (char *)&_swiftEmptyArrayStorage;
LABEL_95:
          swift_release_n(v61, 2);
          v84 = (uint64_t)v114;
          v83 = v115;
          v85 = v115[9];
          v86 = *(_QWORD *)&v114[v85];
          *(_QWORD *)&v114[v85] = v65;
          swift_bridgeObjectRelease(v86);
          if (qword_100037358 != -1)
            swift_once(&qword_100037358, sub_10000F17C);
          v87 = off_100037F18;
          v88 = swift_retain(off_100037F18);
          v89 = sub_10000EAD0(v88);
          swift_release(v87);
          *(_QWORD *)(v84 + v83[11]) = v89;
          v91 = (uint64_t)v109;
          v90 = (uint64_t)v110;
          v92 = (uint64_t)v108;
          if ((v112 & 1) != 0)
            goto LABEL_98;
          if (v63 != 2)
          {
            v100 = swift_bridgeObjectRelease(v111);
            Date.init()(v100);
            v101 = type metadata accessor for Date(0);
            v102 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v101 - 8) + 56);
            v102(v91, 0, 1, v101);
            swift_beginAccess(v84, v117, 33, 0);
            sub_10002477C(v91, v84 + v83[5]);
            v103 = v84 + v83[6];
            sub_100024740(v103, &qword_100038128);
            v102(v103, 1, 1, v101);
            swift_endAccess(v117);
            goto LABEL_104;
          }
          sub_1000246F8(v84 + v83[5], (uint64_t)v108);
          v94 = type metadata accessor for Date(0);
          v95 = *(_QWORD *)(v94 - 8);
          v96 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v95 + 48))(v92, 1, v94);
          v97 = sub_100024740(v92, &qword_100038128);
          if (v96 == 1)
          {
LABEL_98:
            v93 = v111;
          }
          else
          {
            Date.init()(v97);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v95 + 56))(v91, 0, 1, v94);
            swift_beginAccess(v84, v117, 33, 0);
            sub_10002477C(v91, v84 + v83[6]);
            v98 = v83[10];
            v99 = *(_QWORD *)(v84 + v98);
            *(_QWORD *)(v84 + v98) = v111;
            swift_endAccess(v117);
            v93 = v99;
          }
          swift_bridgeObjectRelease(v93);
LABEL_104:
          sub_100011868(v84, v90, (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
          v104 = objc_allocWithZone((Class)type metadata accessor for ModelManagerGameAssertionStatus(0));
          v105 = (void *)ModelManagerGameAssertionStatus.init(config:)(v90);
          v106 = off_100037F18;
          swift_retain(off_100037F18);
          sub_10000FEA0(v105);

          swift_release(v106);
          return;
        }
LABEL_108:
        __break(1u);
        __break(1u);
        goto LABEL_109;
      }
      v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v20, v21, v22, 0);
      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(v22);
      if ((v18 & 1) == 0)
        goto LABEL_28;
    }
    if ((a3 & 1) == 0)
      return;
    goto LABEL_28;
  }
}

void sub_10001B560(uint64_t a1, uint64_t a2, char a3)
{
  char *v3;
  uint64_t v7;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _UNKNOWN **v58;
  void *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  unsigned int v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  NSObject *v107;
  os_log_type_t v108;
  uint8_t *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint8_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  os_log_type_t v119;
  uint8_t *v120;
  uint8_t *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  id v126;
  char *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t k;
  uint64_t v133;
  uint64_t Strong;
  uint64_t v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  NSObject *v151;
  os_log_type_t v152;
  uint8_t *v153;
  uint8_t *v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  unsigned int v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  char *v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  uint64_t v173;
  char *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  id v179;
  uint64_t v180;
  uint64_t v181;
  _QWORD v182[3];
  char v183[24];
  char v184[8];

  v177 = type metadata accessor for SustainedExecutionStatus.Config(0);
  __chkstk_darwin(v177);
  v174 = (char *)&v157 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for OSSignpostID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v157 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v171 = type metadata accessor for String.Encoding(0);
  v170 = *(_QWORD *)(v171 - 8);
  __chkstk_darwin(v171);
  v169 = (char *)&v157 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v173 = type metadata accessor for Logger(0);
  v176 = *(_QWORD *)(v173 - 8);
  v13 = __chkstk_darwin(v173);
  v175 = (char *)&v157 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v172 = (char *)&v157 - v16;
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v157 - v18;
  __chkstk_darwin(v17);
  v166 = (char *)&v157 - v20;
  v21 = sub_100002090(&qword_100038128);
  v22 = __chkstk_darwin(v21);
  v167 = (uint64_t)&v157 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v168 = (char *)&v157 - v24;
  v178 = v3;
  if (v3[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsSustainedExecutionMode] == 1)
  {
    v25 = &v178[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig];
    swift_beginAccess(&v178[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig], v184, 1, 0);
    if (((*v25 ^ a1) & 1) != 0 || (a3 & 1) != 0)
    {
      v162 = *v25 ^ a1;
      v159 = v19;
      v160 = v11;
      v26 = *(_QWORD *)&v25[*(int *)(v177 + 32)];
      v163 = a1;
      v164 = v25;
      *v25 = a1 & 1;
      v181 = (uint64_t)&_swiftEmptyArrayStorage;
      if ((unint64_t)a2 >> 62)
      {
        if (a2 < 0)
          v38 = a2;
        else
          v38 = a2 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v26);
        swift_bridgeObjectRetain(a2);
        v27 = _CocoaArrayWrapper.endIndex.getter(v38);
        if (!v27)
          goto LABEL_21;
      }
      else
      {
        v27 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v26);
        swift_bridgeObjectRetain(a2);
        if (!v27)
          goto LABEL_21;
      }
      if (v27 < 1)
      {
        __break(1u);
        goto LABEL_109;
      }
      if ((a2 & 0xC000000000000001) != 0)
      {
        for (i = 0; i != v27; ++i)
        {
          v31 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a2);
          v32 = v31;
          if (*(_BYTE *)(v31 + 49) == 1)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v31);
            v29 = *(_QWORD *)(v181 + 16);
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v29);
            v30 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v29, v32);
            specialized ContiguousArray._endMutation()(v30);
          }
          else
          {
            swift_unknownObjectRelease(v31);
          }
        }
      }
      else
      {
        for (j = 0; j != v27; ++j)
        {
          v34 = *(_QWORD *)(a2 + 8 * j + 32);
          if (*(_BYTE *)(v34 + 49) == 1)
          {
            v35 = swift_retain(*(_QWORD *)(a2 + 8 * j + 32));
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v35);
            v36 = *(_QWORD *)(v181 + 16);
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v36);
            v37 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v36, v34);
            specialized ContiguousArray._endMutation()(v37);
          }
        }
      }
LABEL_21:
      swift_bridgeObjectRelease(a2);
      v39 = v181;
      v161 = v26;
      if (v181 < 0 || (v181 & 0x4000000000000000) != 0)
      {
        v155 = swift_retain(v181);
        v40 = _CocoaArrayWrapper.endIndex.getter(v155);
      }
      else
      {
        v40 = *(_QWORD *)(v181 + 16);
        swift_retain(v181);
      }
      v165 = 0;
      v158 = v8;
      v157 = v9;
      if (!v40)
      {
        v42 = (char *)&_swiftEmptyArrayStorage;
        goto LABEL_40;
      }
      if (v40 >= 1)
      {
        v41 = 0;
        v42 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if ((v39 & 0xC000000000000001) != 0)
          {
            v43 = specialized _ArrayBuffer._getElementSlowPath(_:)(v41, v39);
          }
          else
          {
            v43 = *(_QWORD *)(v39 + 8 * v41 + 32);
            swift_retain(v43);
          }
          v44 = objc_msgSend(*(id *)(v43 + 16), "bundle", v157, v158);
          if (v44
            && (v45 = v44,
                v46 = objc_msgSend(v44, "identifier"),
                v45,
                v46))
          {
            v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
            v49 = v48;
            swift_release(v43);

            if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
              v42 = sub_100024F00(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
            v51 = *((_QWORD *)v42 + 2);
            v50 = *((_QWORD *)v42 + 3);
            if (v51 >= v50 >> 1)
              v42 = sub_100024F00((char *)(v50 > 1), v51 + 1, 1, v42);
            *((_QWORD *)v42 + 2) = v51 + 1;
            v52 = &v42[16 * v51];
            *((_QWORD *)v52 + 4) = v47;
            *((_QWORD *)v52 + 5) = v49;
          }
          else
          {
            swift_release(v43);
          }
          ++v41;
        }
        while (v40 != v41);
LABEL_40:
        swift_release_n(v39, 2);
        v53 = (int *)v177;
        v54 = *(int *)(v177 + 32);
        v55 = (uint64_t)v164;
        v56 = *(_QWORD *)&v164[v54];
        *(_QWORD *)&v164[v54] = v42;
        v57 = v55;
        swift_bridgeObjectRelease(v56);
        if (qword_100037358 != -1)
          swift_once(&qword_100037358, sub_10000F17C);
        v58 = &off_100037000;
        v59 = off_100037F18;
        v60 = (_QWORD *)swift_retain(off_100037F18);
        v61 = sub_10000E804(v60);
        swift_release(v59);
        *(_QWORD *)(v57 + v53[10]) = v61;
        v62 = v173;
        v63 = v161;
        if ((v162 & 1) != 0)
        {
          v64 = (uint64_t)v174;
          if ((v163 & 1) != 0)
          {
            v65 = swift_bridgeObjectRelease(v161);
            v66 = (uint64_t)v168;
            Date.init()(v65);
            v67 = type metadata accessor for Date(0);
            v68 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56);
            v68(v66, 0, 1, v67);
            swift_beginAccess(v57, &v181, 33, 0);
            sub_10002477C(v66, v57 + v53[5]);
            v69 = v57 + v53[6];
            sub_100024740(v69, &qword_100038128);
            v68(v69, 1, 1, v67);
            swift_endAccess(&v181);
          }
          else
          {
            v140 = v167;
            sub_1000246F8(v57 + v53[5], v167);
            v141 = type metadata accessor for Date(0);
            v142 = *(_QWORD *)(v141 - 8);
            v143 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v142 + 48))(v140, 1, v141);
            v144 = sub_100024740(v140, &qword_100038128);
            if (v143 == 1)
            {
              swift_bridgeObjectRelease(v63);
            }
            else
            {
              v145 = (uint64_t)v168;
              Date.init()(v144);
              (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v142 + 56))(v145, 0, 1, v141);
              swift_beginAccess(v57, &v181, 33, 0);
              sub_10002477C(v145, v57 + v53[6]);
              v146 = v53[9];
              v147 = *(_QWORD *)(v57 + v146);
              *(_QWORD *)(v57 + v146) = v63;
              swift_endAccess(&v181);
              swift_bridgeObjectRelease(v147);
            }
          }
        }
        else
        {
          swift_bridgeObjectRelease(v161);
          v64 = (uint64_t)v174;
        }
        v70 = (void *)objc_opt_self(CLPCPolicyInterface);
        v181 = 0;
        v71 = objc_msgSend(v70, "createClient:", &v181);
        v72 = (id)v181;
        if (v71)
        {
          v73 = v71;
          v181 = 0;
          v74 = v72;
          v75 = objc_msgSend(v73, "setSustainableMode:options:error:", v163 & 1, 0, &v181);
          v76 = (id)v181;
          if (v75)
          {
            v181 = 0;
            v77 = v76;
            v78 = objc_msgSend(v73, "isInSustainableMode:", &v181);
            if (!v181)
            {
              if ((v162 & 1) != 0)
              {
                v148 = (uint64_t)v78;
                v149 = Logger.daemon.unsafeMutableAddressor(v78);
                v84 = v176;
                v150 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v176 + 16))(v166, v149, v62);
                v151 = Logger.logObject.getter(v150);
                v152 = static os_log_type_t.info.getter();
                if (os_log_type_enabled(v151, v152))
                {
                  v153 = (uint8_t *)swift_slowAlloc(12, -1);
                  *(_DWORD *)v153 = 134349056;
                  v57 = (uint64_t)v164;
                  v181 = v148;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v181, v182, v153 + 4, v153 + 12);
                  _os_log_impl((void *)&_mh_execute_header, v151, v152, "Set sustained execution mode to %{public}lu", v153, 0xCu);
                  v154 = v153;
                  v84 = v176;
                  swift_slowDealloc(v154, -1, -1);
                  swift_unknownObjectRelease(v73);

                }
                else
                {

                  swift_unknownObjectRelease(v73);
                }
                v93 = v178;
                (*(void (**)(char *, uint64_t))(v84 + 8))(v166, v62);
              }
              else
              {
                swift_unknownObjectRelease(v73);
                v84 = v176;
                v93 = v178;
              }
LABEL_57:
              v94 = &v93[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken];
              swift_beginAccess(&v93[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken], v183, 0, 0);
              v95 = *(unsigned int *)v94;
              if ((_DWORD)v95)
              {
                v96 = v163;
                notify_set_state(v95, v163 & 1);
                v97 = *(_QWORD *)&v93[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification + 8];
                v181 = *(_QWORD *)&v93[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification];
                v182[0] = v97;
                swift_bridgeObjectRetain(v97);
                v98 = v169;
                static String.Encoding.utf8.getter(v99);
                v100 = sub_100011824();
                v101 = StringProtocol.cString(using:)(v98, &type metadata for String, v100);
                (*(void (**)(char *, uint64_t))(v170 + 8))(v98, v171);
                swift_bridgeObjectRelease(v182[0]);
                if (v101)
                  v102 = (const char *)(v101 + 32);
                else
                  v102 = 0;
                notify_post(v102);
                v103 = swift_bridgeObjectRelease(v101);
                v104 = Logger.daemon.unsafeMutableAddressor(v103);
                v105 = v159;
                v106 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 16))(v159, v104, v62);
                v107 = Logger.logObject.getter(v106);
                v108 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v107, v108))
                {
                  v109 = (uint8_t *)swift_slowAlloc(12, -1);
                  v110 = swift_slowAlloc(32, -1);
                  *(_DWORD *)v109 = 136446210;
                  v181 = v110;
                  if ((v96 & 1) != 0)
                    v111 = 0x64656C62616E65;
                  else
                    v111 = 0x64656C6261736964;
                  if ((v96 & 1) != 0)
                    v112 = 0xE700000000000000;
                  else
                    v112 = 0xE800000000000000;
                  v179 = (id)sub_100004814(v111, v112, &v181);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v179, &v180, v109 + 4, v109 + 12);
                  v113 = v112;
                  v57 = (uint64_t)v164;
                  swift_bridgeObjectRelease(v113);
                  _os_log_impl((void *)&_mh_execute_header, v107, v108, "Sustained execution mode %{public}s.", v109, 0xCu);
                  swift_arrayDestroy(v110, 1, (char *)&type metadata for Any + 8);
                  swift_slowDealloc(v110, -1, -1);
                  v114 = v109;
                  v58 = &off_100037000;
                  swift_slowDealloc(v114, -1, -1);

                  v115 = (*(uint64_t (**)(char *, uint64_t))(v176 + 8))(v105, v62);
                }
                else
                {

                  v115 = (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v105, v62);
                }
                v122 = v160;
                if ((v96 & 1) != 0)
                  v123 = static os_signpost_type_t.begin.getter(v115);
                else
                  v123 = static os_signpost_type_t.end.getter(v115);
                v124 = v123;
                v125 = *(id *)Logger.stateTracking.unsafeMutableAddressor();
                static OSSignpostID.exclusive.getter();
                os_signpost(_:dso:log:name:signpostID:)(v124, &_mh_execute_header, v125, "SemEnabled", 10, 2, v122);

                (*(void (**)(char *, uint64_t))(v157 + 8))(v122, v158);
                v64 = (uint64_t)v174;
              }
              else
              {
                v116 = Logger.daemon.unsafeMutableAddressor(v95);
                v117 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 16))(v172, v116, v62);
                v118 = Logger.logObject.getter(v117);
                v119 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v118, v119))
                {
                  v120 = (uint8_t *)swift_slowAlloc(2, -1);
                  *(_WORD *)v120 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v118, v119, "Unable to post game mode darwin notification - token is invalid!", v120, 2u);
                  v121 = v120;
                  v84 = v176;
                  swift_slowDealloc(v121, -1, -1);
                }

                (*(void (**)(char *, uint64_t))(v84 + 8))(v172, v62);
              }
              sub_100011868(v57, v64, (uint64_t (*)(_QWORD))&type metadata accessor for SustainedExecutionStatus.Config);
              v126 = objc_allocWithZone((Class)type metadata accessor for SustainedExecutionStatus(0));
              v127 = (char *)SustainedExecutionStatus.init(config:)(v64);
              v128 = (uint64_t)v58[483];
              v129 = *(void **)(v128 + 16);
              swift_retain(v128);
              objc_msgSend(v129, "lock");
              v178 = v127;
              sub_1000108DC(v128, v127, &v181);
              objc_msgSend(v129, "unlock");
              v130 = v181;
              if ((unint64_t)v181 >> 62)
              {
                if (v181 < 0)
                  v156 = v181;
                else
                  v156 = v181 & 0xFFFFFFFFFFFFFF8;
                swift_bridgeObjectRetain(v181);
                v131 = _CocoaArrayWrapper.endIndex.getter(v156);
                swift_bridgeObjectRelease(v130);
                if (v131)
                {
LABEL_79:
                  v177 = v128;
                  if (v131 >= 1)
                  {
                    for (k = 0; k != v131; ++k)
                    {
                      if ((v130 & 0xC000000000000001) != 0)
                      {
                        v133 = specialized _ArrayBuffer._getElementSlowPath(_:)(k, v130);
                      }
                      else
                      {
                        v133 = *(_QWORD *)(v130 + 8 * k + 32);
                        swift_retain(v133);
                      }
                      Strong = swift_unknownObjectWeakLoadStrong(v133 + 16);
                      if (Strong)
                      {
                        v135 = Strong;
                        v136 = objc_msgSend(*(id *)(Strong + 16), "remoteObjectProxy");
                        _bridgeAnyObjectToAny(_:)(&v181, v136);
                        swift_unknownObjectRelease(v136);
                        v137 = sub_100002090(&qword_100038CE0);
                        if ((swift_dynamicCast(&v179, &v181, (char *)&type metadata for Any + 8, v137, 6) & 1) != 0)
                        {
                          v138 = v179;
                          objc_msgSend(v179, "updateStatus::::", 0, 0, v178, 0);
                          swift_release(v133);
                          swift_unknownObjectRelease(v135);
                          swift_unknownObjectRelease(v138);
                        }
                        else
                        {
                          swift_release(v133);
                          swift_unknownObjectRelease(v135);
                        }
                      }
                      else
                      {
                        swift_release(v133);
                      }
                    }
                    v139 = v177;
                    goto LABEL_106;
                  }
LABEL_110:
                  __break(1u);
                }
              }
              else
              {
                v131 = *(_QWORD *)((v181 & 0xFFFFFFFFFFFFF8) + 0x10);
                if (v131)
                  goto LABEL_79;
              }
              v139 = v128;
LABEL_106:
              swift_release(v139);
              swift_bridgeObjectRelease(v130);

              return;
            }
            v79 = (id)v181;
          }
          else
          {
            v82 = (id)v181;
            v79 = (id)_convertNSErrorToError(_:)(v76);

          }
          swift_willThrow();
          v81 = swift_unknownObjectRelease(v73);
        }
        else
        {
          v80 = (id)v181;
          v79 = (id)_convertNSErrorToError(_:)(v72);

          v81 = swift_willThrow();
        }
        v165 = 0;
        v83 = Logger.daemon.unsafeMutableAddressor(v81);
        v84 = v176;
        (*(void (**)(char *, uint64_t, uint64_t))(v176 + 16))(v175, v83, v62);
        swift_errorRetain(v79);
        v85 = swift_errorRetain(v79);
        v86 = Logger.logObject.getter(v85);
        v87 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v86, v87))
        {
          v88 = (uint8_t *)swift_slowAlloc(12, -1);
          v89 = (uint64_t *)swift_slowAlloc(8, -1);
          *(_DWORD *)v88 = 138543362;
          swift_errorRetain(v79);
          v90 = _swift_stdlib_bridgeErrorToNSError(v79);
          v181 = v90;
          v62 = v173;
          v57 = (uint64_t)v164;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v181, v182, v88 + 4, v88 + 12);
          *v89 = v90;
          swift_errorRelease(v79);
          swift_errorRelease(v79);
          _os_log_impl((void *)&_mh_execute_header, v86, v87, "Unable to set sustained execution mode: %{public}@", v88, 0xCu);
          v91 = sub_100002090((uint64_t *)&unk_100037CA0);
          swift_arrayDestroy(v89, 1, v91);
          v92 = v89;
          v84 = v176;
          swift_slowDealloc(v92, -1, -1);
          swift_slowDealloc(v88, -1, -1);

          swift_errorRelease(v79);
        }
        else
        {
          swift_errorRelease(v79);
          swift_errorRelease(v79);
          swift_errorRelease(v79);

        }
        v93 = v178;
        (*(void (**)(char *, uint64_t))(v84 + 8))(v175, v62);
        goto LABEL_57;
      }
LABEL_109:
      __break(1u);
      goto LABEL_110;
    }
  }
}

uint64_t sub_10001C5B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X2>, _BYTE *a4@<X3>, _QWORD *a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, _BYTE *a8@<X7>, _BYTE *a9@<X8>, _BYTE *a10, char *a11)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __n128 v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v90;
  void *v91;
  Class isa;
  NSString v93;
  uint64_t v94;
  uint64_t *v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  int v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t result;
  uint64_t v104;
  BOOL v105;
  int v107;
  char v108;
  uint64_t v109;
  BOOL v110;
  uint64_t v111;
  BOOL v112;
  char v113;
  _BYTE *v114;
  uint64_t v115;
  __n128 v116;
  uint64_t v117;
  _QWORD *v118;
  _BYTE *v119;
  char *v120;
  char *v121;
  __n128 v122;
  uint64_t *v123;
  _BYTE *v124;
  uint64_t v125;
  uint64_t v126;
  _BYTE *v127;
  char *v128;
  _BYTE *v129;
  char *v130;
  _BYTE *v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int64_t v137;
  uint64_t *v138;
  unint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  char v144[24];

  v129 = a8;
  v138 = a7;
  v135 = a6;
  v131 = a3;
  v119 = a9;
  v130 = a11;
  v127 = a10;
  v132 = type metadata accessor for Logger(0);
  v15 = *(_QWORD *)(v132 - 8);
  v16 = __chkstk_darwin(v132);
  v120 = (char *)&v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v128 = (char *)&v116 - v18;
  v118 = a1;
  v136 = a1[4];
  v19 = (uint64_t *)(a2 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses);
  swift_beginAccess(v19, v144, 0, 0);
  v20 = *v19;
  if ((v20 & 0xC000000000000001) != 0)
  {
    if (v20 < 0)
      v21 = v20;
    else
      v21 = v20 & 0xFFFFFFFFFFFFFF8;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = __CocoaDictionary.makeIterator()(v21) | 0x8000000000000000;
  }
  else
  {
    v26 = -1 << *(_BYTE *)(v20 + 32);
    v23 = ~v26;
    v22 = v20 + 64;
    v27 = -v26;
    if (v27 < 64)
      v28 = ~(-1 << v27);
    else
      v28 = -1;
    v24 = v28 & *(_QWORD *)(v20 + 64);
    v25 = v20;
  }
  v29 = swift_bridgeObjectRetain(v20);
  v30 = 0;
  v134 = v25 & 0x7FFFFFFFFFFFFFFFLL;
  v117 = v23;
  v137 = (unint64_t)(v23 + 64) >> 6;
  v123 = (uint64_t *)&v143;
  v29.n128_u64[0] = 136315138;
  v122 = v29;
  v121 = (char *)&type metadata for Any + 8;
  v29.n128_u64[0] = 67109378;
  v116 = v29;
  v133 = (char *)&type metadata for Swift.AnyObject + 8;
  v124 = a4;
  v140 = a5;
  v125 = v15;
  v126 = v22;
  v31 = v25;
  v139 = v25;
  while (1)
  {
    if (v31 < 0)
    {
      v34 = __CocoaDictionary.Iterator.next()();
      if (!v34)
        goto LABEL_66;
      v36 = v34;
      v37 = v35;
      v142 = v34;
      v38 = sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
      swift_unknownObjectRetain(v36);
      v39 = v133;
      swift_dynamicCast(&v143, &v142, v133, v38, 7);
      v40 = v143;
      swift_unknownObjectRelease(v36);
      v142 = v37;
      v41 = type metadata accessor for EmbeddedGameProcess();
      swift_unknownObjectRetain(v37);
      swift_dynamicCast(&v143, &v142, v39, v41, 7);
      v42 = (uint64_t)v143;
      swift_unknownObjectRelease(v37);
      v33 = v30;
      v141 = v24;
      a5 = v140;
      if (!v40)
        goto LABEL_66;
      goto LABEL_33;
    }
    if (v24)
    {
      v141 = (v24 - 1) & v24;
      v32 = __clz(__rbit64(v24)) | (v30 << 6);
      v33 = v30;
      goto LABEL_32;
    }
    v43 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
      __break(1u);
      goto LABEL_96;
    }
    if (v43 >= v137)
      goto LABEL_66;
    v44 = *(_QWORD *)(v22 + 8 * v43);
    v33 = v30 + 1;
    if (!v44)
    {
      v33 = v30 + 2;
      if (v30 + 2 >= v137)
        goto LABEL_66;
      v44 = *(_QWORD *)(v22 + 8 * v33);
      if (!v44)
      {
        v33 = v30 + 3;
        if (v30 + 3 >= v137)
          goto LABEL_66;
        v44 = *(_QWORD *)(v22 + 8 * v33);
        if (!v44)
        {
          v33 = v30 + 4;
          if (v30 + 4 >= v137)
            goto LABEL_66;
          v44 = *(_QWORD *)(v22 + 8 * v33);
          if (!v44)
            break;
        }
      }
    }
LABEL_31:
    v141 = (v44 - 1) & v44;
    v32 = __clz(__rbit64(v44)) + (v33 << 6);
LABEL_32:
    v46 = 8 * v32;
    v42 = *(_QWORD *)(*(_QWORD *)(v31 + 56) + v46);
    v40 = *(id *)(*(_QWORD *)(v31 + 48) + v46);
    swift_retain(v42);
    if (!v40)
      goto LABEL_66;
LABEL_33:

    if ((*(_BYTE *)(v42 + 48) & 1) != 0)
    {
      if (*(_BYTE *)(v42 + 42) == 1)
        *v131 = 1;
      *a4 = 1;
      if (*(_BYTE *)(v42 + 41) == 1)
      {
        v47 = swift_retain(v42);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v47);
        v49 = *(_QWORD *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v48 = *(_QWORD *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v49 >= v48 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v48 > 1, v49 + 1, 1);
        v50 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v49, v42);
        v51 = specialized Array._endMutation()(v50);
        if (!*(_QWORD *)(v135 + 16))
          goto LABEL_44;
        v52 = *(_QWORD *)(v42 + 24);
        v53 = *(_QWORD *)(v42 + 32);
        swift_bridgeObjectRetain(v53);
        v54 = v52;
        v55 = v135;
        v56 = sub_1000090D4(v54, v53);
        if ((v57 & 1) == 0)
        {
          v51 = swift_bridgeObjectRelease(v53);
LABEL_44:
          v74 = Logger.daemon.unsafeMutableAddressor(v51);
          v75 = v128;
          v76 = v132;
          (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v128, v74, v132);
          v77 = swift_retain(v42);
          v78 = Logger.logObject.getter(v77);
          v79 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v78, v79))
          {
            v80 = (uint8_t *)swift_slowAlloc(12, -1);
            v81 = swift_slowAlloc(32, -1);
            v143 = (void *)v81;
            *(_DWORD *)v80 = v122.n128_u32[0];
            v82 = *(_QWORD *)(v42 + 24);
            v83 = *(_QWORD *)(v42 + 32);
            swift_bridgeObjectRetain(v83);
            v142 = sub_100004814(v82, v83, (uint64_t *)&v143);
            a5 = v140;
            a4 = v124;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v142, v123, v80 + 4, v80 + 12);
            swift_release(v42);
            v84 = v83;
            v15 = v125;
            swift_bridgeObjectRelease(v84);
            _os_log_impl((void *)&_mh_execute_header, v78, v79, "Unknown Game Mode state for: %s", v80, 0xCu);
            swift_arrayDestroy(v81, 1, v121);
            swift_slowDealloc(v81, -1, -1);
            swift_slowDealloc(v80, -1, -1);

            (*(void (**)(char *, uint64_t))(v15 + 8))(v128, v132);
          }
          else
          {

            swift_release(v42);
            (*(void (**)(char *, uint64_t))(v15 + 8))(v75, v76);
          }
          if (qword_100037328 != -1)
            swift_once(&qword_100037328, sub_10000764C);
          v85 = off_1000375F8;
          v86 = *(_QWORD *)(v42 + 24);
          v87 = *(_QWORD *)(v42 + 32);
          swift_retain(off_1000375F8);
          swift_bridgeObjectRetain(v87);
          v88 = GlobalPreferences.gameModeEnabledList.getter();
          swift_bridgeObjectRetain(v87);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v88);
          v143 = (void *)v88;
          sub_100009DF4(1, v86, v87, isUniquelyReferenced_nonNull_native);
          v90 = (uint64_t)v143;
          swift_bridgeObjectRelease(v87);
          swift_bridgeObjectRelease(0x8000000000000000);
          v91 = (void *)v85[2];
          isa = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v90);
          v93 = String._bridgeToObjectiveC()();
          objc_msgSend(v91, "setValue:forKey:", isa, v93);
          swift_release(v85);
          swift_bridgeObjectRelease(v87);

          *(_BYTE *)(v42 + 49) = 1;
          v94 = swift_retain(v42);
          v95 = v138;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v94);
          v97 = *(_QWORD *)((*v95 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v96 = *(_QWORD *)((*v95 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v97 < v96 >> 1)
          {
            v22 = v126;
LABEL_51:
            v98 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v97, v42);
            specialized Array._endMutation()(v98);
            goto LABEL_52;
          }
          v22 = v126;
LABEL_65:
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v96 > 1, v97 + 1, 1);
          goto LABEL_51;
        }
        v58 = *(unsigned __int8 *)(*(_QWORD *)(v55 + 56) + v56);
        v59 = swift_bridgeObjectRelease(v53);
        v60 = Logger.daemon.unsafeMutableAddressor(v59);
        v61 = v120;
        v62 = v132;
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v120, v60, v132);
        v63 = swift_retain(v42);
        v64 = Logger.logObject.getter(v63);
        v65 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v64, v65))
        {
          v66 = swift_slowAlloc(18, -1);
          v67 = swift_slowAlloc(32, -1);
          v143 = (void *)v67;
          *(_DWORD *)v66 = v116.n128_u32[0];
          *(_DWORD *)(v66 + 4) = v58;
          *(_WORD *)(v66 + 8) = 2080;
          v68 = v58;
          v69 = *(_QWORD *)(v42 + 24);
          v70 = *(_QWORD *)(v42 + 32);
          swift_bridgeObjectRetain(v70);
          v71 = v69;
          v58 = v68;
          *(_QWORD *)(v66 + 10) = sub_100004814(v71, v70, (uint64_t *)&v143);
          swift_release(v42);
          v72 = v70;
          a4 = v124;
          swift_bridgeObjectRelease(v72);
          _os_log_impl((void *)&_mh_execute_header, v64, v65, "Known Game Mode state: %{BOOL}d for: %s", (uint8_t *)v66, 0x12u);
          swift_arrayDestroy(v67, 1, (char *)&type metadata for Any + 8);
          v73 = v67;
          a5 = v140;
          swift_slowDealloc(v73, -1, -1);
          swift_slowDealloc(v66, -1, -1);

          (*(void (**)(char *, uint64_t))(v125 + 8))(v61, v132);
        }
        else
        {

          swift_release(v42);
          (*(void (**)(char *, uint64_t))(v15 + 8))(v61, v62);
        }
        *(_BYTE *)(v42 + 49) = v58;
        v15 = v125;
        v22 = v126;
        if (v58)
        {
          v101 = swift_retain(v42);
          v102 = v138;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v101);
          v97 = *(_QWORD *)((*v102 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v96 = *(_QWORD *)((*v102 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v97 < v96 >> 1)
            goto LABEL_51;
          goto LABEL_65;
        }
      }
LABEL_52:
      if (*(_BYTE *)(v42 + 44) == 1)
      {
        *(_BYTE *)(v42 + 50) = 1;
        *v129 = 1;
      }
      if (*(_BYTE *)(v42 + 49) == 1 && v136 != 2)
      {
        *(_BYTE *)(v42 + 50) = 1;
        *v127 = 1;
      }
      v99 = *(unsigned __int8 *)(v42 + 45);
      swift_release(v42);
      v30 = v33;
      v100 = v141;
      v24 = v141;
      v105 = v99 == 1;
      v31 = v139;
      if (v105)
      {
        *v130 = 1;
        v30 = v33;
        v24 = v100;
      }
    }
    else
    {
      *(_WORD *)(v42 + 49) = 0;
      swift_release(v42);
      v30 = v33;
      v24 = v141;
    }
  }
  v45 = v30 + 5;
  while (v137 != v45)
  {
    v44 = *(_QWORD *)(v22 + 8 * v45++);
    if (v44)
    {
      v33 = v45 - 1;
      goto LABEL_31;
    }
  }
LABEL_66:
  result = sub_1000246F0(v31);
  v31 = *v138;
  if (!((unint64_t)*v138 >> 62))
  {
    v104 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_68;
  }
LABEL_96:
  if (v31 < 0)
    v115 = v31;
  else
    v115 = v31 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v31);
  v104 = _CocoaArrayWrapper.endIndex.getter(v115);
  result = swift_bridgeObjectRelease(v31);
LABEL_68:
  v105 = v104 > 0 || v136 == 1;
  v107 = v105 && v136 != 2;
  v108 = 2;
  switch(v118[7])
  {
    case 0:
      if ((*v129 & 1) != 0)
        goto LABEL_79;
      if (*v127)
        v108 = 0;
      else
        v108 = 2;
      break;
    case 1:
      break;
    case 2:
      v108 = 0;
      break;
    case 3:
LABEL_79:
      v108 = 1;
      break;
    default:
      v143 = (void *)v118[7];
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for ModelManagerPolicyStrategy, &v143, &type metadata for ModelManagerPolicyStrategy, &type metadata for Int);
      __break(1u);
      JUMPOUT(0x10001D0ACLL);
  }
  v109 = v118[5];
  v110 = ((*v131 & 1) != 0 || v109 == 1) && v109 != 2;
  v111 = v118[6];
  if ((*a4 & 1) == 0 && v111 != 1)
  {
    v112 = 0;
    v113 = 0;
    if (!v107)
      goto LABEL_94;
LABEL_93:
    v113 = *v130;
    goto LABEL_94;
  }
  v112 = v111 != 2;
  if ((v107 & 1) != 0)
    goto LABEL_93;
  v113 = 0;
LABEL_94:
  v114 = v119;
  *v119 = v107;
  v114[1] = v110;
  v114[2] = v112;
  v114[3] = v108;
  v114[4] = v113;
  return result;
}

void sub_10001D0BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t Strong;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];
  id v30;
  id v31;
  _QWORD v32[5];
  _BYTE v33[24];

  v1 = v0;
  v2 = type metadata accessor for GameModeStatus.Config(0);
  __chkstk_darwin(v2);
  v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (_QWORD *)((char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) != 0)
  {
    if (qword_100037358 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100037358, sub_10000F17C);
LABEL_3:
  v11 = off_100037F18;
  v12 = (_QWORD *)swift_retain(off_100037F18);
  v13 = sub_10000E800(v12);
  swift_release(v11);
  v14 = v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig;
  swift_beginAccess(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig, v33, 1, 0);
  *(_QWORD *)(v14 + *(int *)(v2 + 52)) = v13;
  sub_100011868(v14, (uint64_t)v4, (uint64_t (*)(_QWORD))&type metadata accessor for GameModeStatus.Config);
  v15 = objc_allocWithZone((Class)type metadata accessor for GameModeStatus(0));
  v16 = (void *)GameModeStatus.init(config:)(v4);
  v17 = off_100037F18;
  v18 = (void *)*((_QWORD *)off_100037F18 + 2);
  swift_retain(off_100037F18);
  objc_msgSend(v18, "lock");
  v30 = v16;
  sub_10000FD58((uint64_t)v17, v16, v32);
  objc_msgSend(v18, "unlock");
  v19 = v32[0];
  if (!(v32[0] >> 62))
  {
    v20 = *(_QWORD *)((v32[0] & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v20)
      goto LABEL_5;
LABEL_23:
    swift_release(v17);
LABEL_24:
    swift_bridgeObjectRelease(v19);
    sub_100002778();

    return;
  }
  if (v32[0] < 0)
    v28 = v32[0];
  else
    v28 = v32[0] & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v32[0]);
  v20 = _CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v19);
  if (!v20)
    goto LABEL_23;
LABEL_5:
  if (v20 >= 1)
  {
    v29[0] = v17;
    v29[1] = v1;
    for (i = 0; i != v20; ++i)
    {
      if ((v19 & 0xC000000000000001) != 0)
      {
        v22 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v19);
      }
      else
      {
        v22 = *(_QWORD *)(v19 + 8 * i + 32);
        swift_retain(v22);
      }
      Strong = swift_unknownObjectWeakLoadStrong(v22 + 16);
      if (Strong)
      {
        v24 = Strong;
        v25 = objc_msgSend(*(id *)(Strong + 16), "remoteObjectProxy", v29[0]);
        _bridgeAnyObjectToAny(_:)(v32, v25);
        swift_unknownObjectRelease(v25);
        v26 = sub_100002090(&qword_100038CE0);
        if ((swift_dynamicCast(&v31, v32, (char *)&type metadata for Any + 8, v26, 6) & 1) != 0)
        {
          v27 = v31;
          objc_msgSend(v31, "updateStatus::::", v30, 0, 0, 0);
          swift_release(v22);
          swift_unknownObjectRelease(v24);
          swift_unknownObjectRelease(v27);
        }
        else
        {
          swift_release(v22);
          swift_unknownObjectRelease(v24);
        }
      }
      else
      {
        swift_release(v22);
      }
    }
    swift_release(v29[0]);
    goto LABEL_24;
  }
  __break(1u);
}

void sub_10001D440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _BYTE v19[24];

  v1 = v0;
  v2 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  __chkstk_darwin(v2);
  v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (qword_100037358 != -1)
LABEL_5:
    swift_once(&qword_100037358, sub_10000F17C);
  v11 = off_100037F18;
  v12 = swift_retain(off_100037F18);
  v13 = sub_10000EAD0(v12);
  swift_release(v11);
  v14 = v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig;
  swift_beginAccess(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig, v19, 1, 0);
  *(_QWORD *)(v14 + *(int *)(v2 + 44)) = v13;
  sub_100011868(v14, (uint64_t)v4, (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
  v15 = objc_allocWithZone((Class)type metadata accessor for ModelManagerGameAssertionStatus(0));
  v16 = (void *)ModelManagerGameAssertionStatus.init(config:)(v4);
  v17 = off_100037F18;
  swift_retain(off_100037F18);
  sub_10000FEA0(v16);
  swift_release(v17);
  sub_100002778();

}

void sub_10001D60C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t Strong;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];
  id v30;
  id v31;
  _QWORD v32[5];
  _BYTE v33[24];

  v1 = v0;
  v2 = type metadata accessor for SustainedExecutionStatus.Config(0);
  __chkstk_darwin(v2);
  v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (_QWORD *)((char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) != 0)
  {
    if (qword_100037358 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100037358, sub_10000F17C);
LABEL_3:
  v11 = off_100037F18;
  v12 = (_QWORD *)swift_retain(off_100037F18);
  v13 = sub_10000E804(v12);
  swift_release(v11);
  v14 = v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig;
  swift_beginAccess(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig, v33, 1, 0);
  *(_QWORD *)(v14 + *(int *)(v2 + 40)) = v13;
  sub_100011868(v14, (uint64_t)v4, (uint64_t (*)(_QWORD))&type metadata accessor for SustainedExecutionStatus.Config);
  v15 = objc_allocWithZone((Class)type metadata accessor for SustainedExecutionStatus(0));
  v16 = (void *)SustainedExecutionStatus.init(config:)(v4);
  v17 = off_100037F18;
  v18 = (void *)*((_QWORD *)off_100037F18 + 2);
  swift_retain(off_100037F18);
  objc_msgSend(v18, "lock");
  v30 = v16;
  sub_1000108DC((uint64_t)v17, v16, v32);
  objc_msgSend(v18, "unlock");
  v19 = v32[0];
  if (!(v32[0] >> 62))
  {
    v20 = *(_QWORD *)((v32[0] & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v20)
      goto LABEL_5;
LABEL_23:
    swift_release(v17);
LABEL_24:
    swift_bridgeObjectRelease(v19);
    sub_100002778();

    return;
  }
  if (v32[0] < 0)
    v28 = v32[0];
  else
    v28 = v32[0] & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v32[0]);
  v20 = _CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v19);
  if (!v20)
    goto LABEL_23;
LABEL_5:
  if (v20 >= 1)
  {
    v29[0] = v17;
    v29[1] = v1;
    for (i = 0; i != v20; ++i)
    {
      if ((v19 & 0xC000000000000001) != 0)
      {
        v22 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v19);
      }
      else
      {
        v22 = *(_QWORD *)(v19 + 8 * i + 32);
        swift_retain(v22);
      }
      Strong = swift_unknownObjectWeakLoadStrong(v22 + 16);
      if (Strong)
      {
        v24 = Strong;
        v25 = objc_msgSend(*(id *)(Strong + 16), "remoteObjectProxy", v29[0]);
        _bridgeAnyObjectToAny(_:)(v32, v25);
        swift_unknownObjectRelease(v25);
        v26 = sub_100002090(&qword_100038CE0);
        if ((swift_dynamicCast(&v31, v32, (char *)&type metadata for Any + 8, v26, 6) & 1) != 0)
        {
          v27 = v31;
          objc_msgSend(v31, "updateStatus::::", 0, 0, v30, 0);
          swift_release(v22);
          swift_unknownObjectRelease(v24);
          swift_unknownObjectRelease(v27);
        }
        else
        {
          swift_release(v22);
          swift_unknownObjectRelease(v24);
        }
      }
      else
      {
        swift_release(v22);
      }
    }
    swift_release(v29[0]);
    goto LABEL_24;
  }
  __break(1u);
}

void sub_10001D990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t Strong;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];
  id v30;
  id v31;
  _QWORD v32[5];
  _BYTE v33[24];

  v1 = v0;
  v2 = type metadata accessor for DynamicSplitterStatus.Config(0);
  __chkstk_darwin(v2);
  v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (_QWORD *)((char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) != 0)
  {
    if (qword_100037358 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_100037358, sub_10000F17C);
LABEL_3:
  v11 = off_100037F18;
  v12 = (_QWORD *)swift_retain(off_100037F18);
  v13 = sub_10000E808(v12);
  swift_release(v11);
  v14 = v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig;
  swift_beginAccess(v1 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig, v33, 1, 0);
  *(_QWORD *)(v14 + *(int *)(v2 + 40)) = v13;
  sub_100011868(v14, (uint64_t)v4, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicSplitterStatus.Config);
  v15 = objc_allocWithZone((Class)type metadata accessor for DynamicSplitterStatus(0));
  v16 = (void *)DynamicSplitterStatus.init(config:)(v4);
  v17 = off_100037F18;
  v18 = (void *)*((_QWORD *)off_100037F18 + 2);
  swift_retain(off_100037F18);
  objc_msgSend(v18, "lock");
  v30 = v16;
  sub_100010A24((uint64_t)v17, v16, v32);
  objc_msgSend(v18, "unlock");
  v19 = v32[0];
  if (!(v32[0] >> 62))
  {
    v20 = *(_QWORD *)((v32[0] & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v20)
      goto LABEL_5;
LABEL_23:
    swift_release(v17);
LABEL_24:
    swift_bridgeObjectRelease(v19);
    sub_100002778();

    return;
  }
  if (v32[0] < 0)
    v28 = v32[0];
  else
    v28 = v32[0] & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v32[0]);
  v20 = _CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v19);
  if (!v20)
    goto LABEL_23;
LABEL_5:
  if (v20 >= 1)
  {
    v29[0] = v17;
    v29[1] = v1;
    for (i = 0; i != v20; ++i)
    {
      if ((v19 & 0xC000000000000001) != 0)
      {
        v22 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, v19);
      }
      else
      {
        v22 = *(_QWORD *)(v19 + 8 * i + 32);
        swift_retain(v22);
      }
      Strong = swift_unknownObjectWeakLoadStrong(v22 + 16);
      if (Strong)
      {
        v24 = Strong;
        v25 = objc_msgSend(*(id *)(Strong + 16), "remoteObjectProxy", v29[0]);
        _bridgeAnyObjectToAny(_:)(v32, v25);
        swift_unknownObjectRelease(v25);
        v26 = sub_100002090(&qword_100038CE0);
        if ((swift_dynamicCast(&v31, v32, (char *)&type metadata for Any + 8, v26, 6) & 1) != 0)
        {
          v27 = v31;
          objc_msgSend(v31, "updateStatus::::", 0, 0, 0, v30);
          swift_release(v22);
          swift_unknownObjectRelease(v24);
          swift_unknownObjectRelease(v27);
        }
        else
        {
          swift_release(v22);
          swift_unknownObjectRelease(v24);
        }
      }
      else
      {
        swift_release(v22);
      }
    }
    swift_release(v29[0]);
    goto LABEL_24;
  }
  __break(1u);
}

uint64_t sub_10001DD14()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  char *v63;
  id v64;
  uint64_t result;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void **aBlock;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v69 = *(_QWORD *)(v1 - 8);
  v70 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v66 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v67 = *(_QWORD *)(v4 - 8);
  v68 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void *)objc_opt_self(NSNotificationCenter);
  v8 = objc_msgSend(v7, "defaultCenter");
  if (qword_100037330 != -1)
    swift_once(&qword_100037330, sub_10000D258);
  v9 = qword_1000391B8;
  v10 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_operationQueue;
  v11 = *(void **)&v0[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_operationQueue];
  v12 = swift_allocObject(&unk_100031688, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v0);
  v76 = sub_100021808;
  v77 = v12;
  aBlock = _NSConcreteStackBlock;
  v73 = 1107296256;
  v74 = sub_10001E534;
  v75 = &unk_1000316F0;
  v13 = _Block_copy(&aBlock);
  v14 = v77;
  v15 = v11;
  swift_release(v14);
  v16 = objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, 0, v15, v13);
  _Block_release(v13);
  swift_unknownObjectRelease(v16);

  v17 = objc_msgSend(v7, "defaultCenter");
  if (qword_100037338 != -1)
    swift_once(&qword_100037338, sub_10000D28C);
  v18 = qword_1000391C0;
  v19 = *(void **)&v0[v10];
  v20 = swift_allocObject(&unk_100031688, 24, 7);
  swift_unknownObjectWeakInit(v20 + 16, v0);
  v76 = sub_100021830;
  v77 = v20;
  aBlock = _NSConcreteStackBlock;
  v73 = 1107296256;
  v74 = sub_10001E534;
  v75 = &unk_100031718;
  v21 = _Block_copy(&aBlock);
  v22 = v77;
  v23 = v19;
  swift_release(v22);
  v24 = objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v18, 0, v23, v21);
  _Block_release(v21);
  swift_unknownObjectRelease(v24);

  v25 = objc_msgSend(v7, "defaultCenter");
  if (qword_100037340 != -1)
    swift_once(&qword_100037340, sub_10000D2C0);
  v26 = qword_1000391C8;
  v27 = *(void **)&v0[v10];
  v28 = swift_allocObject(&unk_100031688, 24, 7);
  swift_unknownObjectWeakInit(v28 + 16, v0);
  v76 = sub_100021858;
  v77 = v28;
  aBlock = _NSConcreteStackBlock;
  v73 = 1107296256;
  v74 = sub_10001E534;
  v75 = &unk_100031740;
  v29 = _Block_copy(&aBlock);
  v30 = v77;
  v31 = v27;
  swift_release(v30);
  v32 = objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", v26, 0, v31, v29);
  _Block_release(v29);
  swift_unknownObjectRelease(v32);

  v33 = objc_msgSend(v7, "defaultCenter");
  if (qword_100037348 != -1)
    swift_once(&qword_100037348, sub_10000D2F4);
  v34 = qword_1000391D0;
  v35 = *(void **)&v0[v10];
  v36 = swift_allocObject(&unk_100031688, 24, 7);
  swift_unknownObjectWeakInit(v36 + 16, v0);
  v76 = sub_100021880;
  v77 = v36;
  aBlock = _NSConcreteStackBlock;
  v73 = 1107296256;
  v74 = sub_10001E534;
  v75 = &unk_100031768;
  v37 = _Block_copy(&aBlock);
  v38 = v77;
  v39 = v35;
  swift_release(v38);
  v40 = objc_msgSend(v33, "addObserverForName:object:queue:usingBlock:", v34, 0, v39, v37);
  _Block_release(v37);
  swift_unknownObjectRelease(v40);

  v41 = objc_msgSend(v7, "defaultCenter");
  if (qword_100037350 != -1)
    swift_once(&qword_100037350, sub_10000D328);
  v42 = qword_1000391D8;
  v43 = *(void **)&v0[v10];
  v44 = swift_allocObject(&unk_100031688, 24, 7);
  swift_unknownObjectWeakInit(v44 + 16, v0);
  v76 = sub_1000218A8;
  v77 = v44;
  aBlock = _NSConcreteStackBlock;
  v73 = 1107296256;
  v74 = sub_10001E534;
  v75 = &unk_100031790;
  v45 = _Block_copy(&aBlock);
  v46 = v77;
  v47 = v43;
  swift_release(v46);
  v48 = objc_msgSend(v41, "addObserverForName:object:queue:usingBlock:", v42, 0, v47, v45);
  _Block_release(v45);
  swift_unknownObjectRelease(v48);

  v49 = *(void **)&v0[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue];
  v50 = swift_allocObject(&unk_1000317C8, 24, 7);
  *(_QWORD *)(v50 + 16) = v0;
  v76 = sub_1000218F4;
  v77 = v50;
  aBlock = _NSConcreteStackBlock;
  v73 = 1107296256;
  v74 = sub_10000215C;
  v75 = &unk_1000317E0;
  v51 = _Block_copy(&aBlock);
  v52 = v49;
  v53 = v0;
  static DispatchQoS.unspecified.getter(v53);
  v71 = &_swiftEmptyArrayStorage;
  v54 = sub_10000211C(&qword_100038158, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v55 = sub_100002090((uint64_t *)&unk_100038B80);
  v56 = sub_1000020D0();
  v57 = v70;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v71, v55, v56, v70, v54);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v6, v3, v51);
  _Block_release(v51);

  (*(void (**)(char *, uint64_t))(v69 + 8))(v3, v57);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v6, v68);
  swift_release(v77);
  v58 = *(void **)&v53[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_processMonitor];
  v59 = swift_allocObject(&unk_100031818, 24, 7);
  *(_QWORD *)(v59 + 16) = v53;
  v60 = swift_allocObject(&unk_100031840, 32, 7);
  *(_QWORD *)(v60 + 16) = sub_1000218FC;
  *(_QWORD *)(v60 + 24) = v59;
  v76 = sub_100021914;
  v77 = v60;
  aBlock = _NSConcreteStackBlock;
  v73 = 1107296256;
  v74 = sub_100018ED8;
  v75 = &unk_100031858;
  v61 = _Block_copy(&aBlock);
  v62 = v77;
  v63 = v53;
  v64 = v58;
  swift_retain(v60);
  swift_release(v62);
  objc_msgSend(v64, "updateConfiguration:", v61);

  _Block_release(v61);
  LOBYTE(v61) = swift_isEscapingClosureAtFileLocation(v60, "", 108, 922, 44, 1);
  swift_release(v59);
  result = swift_release(v60);
  if ((v61 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_10001E534(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_10001E5D8(uint64_t a1, void (*a2)(void))
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    a2();

  }
}

uint64_t sub_10001E62C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  void *v16;
  id v17;
  uint64_t v18;
  void *Strong;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD aBlock[5];
  uint64_t v31;
  char v32[24];
  char v33[24];

  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a2 + 16;
  swift_beginAccess(a2 + 16, v33, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(a2 + 16);
  if (result)
  {
    v16 = (void *)result;
    v17 = *(id *)(result + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);

    v18 = swift_allocObject(&unk_100031688, 24, 7);
    v27 = v8;
    swift_beginAccess(v14, v32, 0, 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v14);
    swift_unknownObjectWeakInit(v18 + 16, Strong);

    aBlock[4] = a3;
    v31 = v18;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000215C;
    aBlock[3] = a4;
    v20 = _Block_copy(aBlock);
    v21 = swift_retain(v18);
    static DispatchQoS.unspecified.getter(v21);
    v29 = &_swiftEmptyArrayStorage;
    v22 = sub_10000211C(&qword_100038158, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v23 = sub_100002090((uint64_t *)&unk_100038B80);
    v24 = sub_1000020D0();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v23, v24, v7, v22);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v10, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);
    v25 = v31;
    swift_release(v18);
    return swift_release(v25);
  }
  return result;
}

void sub_10001E87C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t Strong;
  void *v7;
  void *v8;
  id v9;
  _BYTE v11[24];

  v2 = type metadata accessor for DispatchPredicate(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a1 += 16;
  swift_beginAccess(a1, v11, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v7 = (void *)Strong;
    v8 = *(void **)(Strong + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);
    *v5 = v8;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
    v9 = v8;
    LOBYTE(v8) = _dispatchPreconditionTest(_:)(v5);
    (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
    if ((v8 & 1) != 0)
    {
      sub_100002778();

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10001E970()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  unsigned __int8 v9;
  id v10;
  _QWORD v11[7];
  uint64_t v12;

  if (qword_100037358 != -1)
    swift_once(&qword_100037358, sub_10000F17C);
  v0 = off_100037F18;
  v1 = swift_retain(off_100037F18);
  sub_10000D35C(v11, v1);
  swift_release(v0);
  v2 = (void *)v11[1];
  v10 = (id)v11[0];
  v3 = (void *)v11[2];
  v4 = (void *)v11[3];
  v5 = v11[5];
  v6 = v11[6];
  v7 = v12;
  v8 = v12 != 2;
  sub_1000192B0(v11[4] == 1, 0, (uint64_t)&_swiftEmptyArrayStorage, (uint64_t)&_swiftEmptyArrayStorage, 1);
  if (v7 == 3)
    v9 = 1;
  else
    v9 = 2 * v8;
  sub_10001AC08(v9, (uint64_t)&_swiftEmptyArrayStorage, 1);
  sub_10001B560(v5 == 1, (uint64_t)&_swiftEmptyArrayStorage, 1);
  sub_100003220(v6 == 1, (uint64_t)&_swiftEmptyArrayStorage, 1);

}

void sub_10001EA8C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  Class isa;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;

  v4 = sub_100002090(&qword_100038688);
  v5 = swift_allocObject(v4, 40, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100026FD0;
  v6 = objc_msgSend((id)objc_opt_self(RBSProcessPredicate), "predicateMatchingProcessTypeApplication");
  *(_QWORD *)(v5 + 32) = v6;
  v10[0] = v5;
  specialized Array._endMutation()(v6);
  sub_1000046A8(0, &qword_100038C88, RBSProcessPredicate_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  objc_msgSend(a1, "setPredicates:", isa);

  objc_msgSend(a1, "setStateDescriptor:", *(_QWORD *)(a2 + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_assertionDescriptor));
  objc_msgSend(a1, "setEvents:", 1);
  v8 = swift_allocObject(&unk_100031688, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16, a2);
  v10[4] = sub_100021934;
  v11 = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100002008;
  v10[3] = &unk_100031880;
  v9 = _Block_copy(v10);
  swift_release(v11);
  objc_msgSend(a1, "setUpdateHandler:", v9);
  _Block_release(v9);
}

uint64_t sub_10001EC1C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD aBlock[5];
  _QWORD *v27;
  _BYTE v28[24];

  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess(a4 + 16, v28, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(a4 + 16);
  if (result)
  {
    v15 = (void *)result;
    v16 = *(id *)(result + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue);

    v17 = (_QWORD *)swift_allocObject(&unk_1000318B8, 40, 7);
    v17[2] = a4;
    v17[3] = a2;
    v17[4] = a3;
    aBlock[4] = sub_100021970;
    v27 = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000215C;
    aBlock[3] = &unk_1000318D0;
    v18 = _Block_copy(aBlock);
    swift_retain(a4);
    v19 = a2;
    static DispatchQoS.unspecified.getter(a3);
    v25 = &_swiftEmptyArrayStorage;
    v20 = sub_10000211C(&qword_100038158, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v21 = sub_100002090((uint64_t *)&unk_100038B80);
    v22 = sub_1000020D0();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v21, v22, v7, v20);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v9, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v7);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return swift_release(v27);
  }
  return result;
}

void sub_10001EE48(uint64_t a1, void *a2, void *a3)
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
  char *v15;
  uint64_t Strong;
  char *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  int v43;
  uint8_t *v44;
  uint64_t v45;
  _QWORD *v46;
  uint8_t *v47;
  void *v48;
  uint8_t *v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  int v64;
  uint8_t *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint8_t *v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint8_t *v77;
  uint8_t *v78;
  uint8_t *v79;
  uint8_t *v80;
  uint8_t *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  NSObject *v85;
  uint8_t *v86;
  void *v87;
  uint8_t *v88;
  uint8_t *v89;
  uint8_t *v90;
  uint8_t *v91;
  NSObject *v92;
  uint64_t v93;
  Swift::Int v94;
  uint8_t *v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  _BYTE v99[24];
  char v100[24];

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v88 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v88 - v14;
  a1 += 16;
  swift_beginAccess(a1, v100, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v17 = (char *)Strong;
    v18 = objc_msgSend(a2, "identity");
    v19 = objc_msgSend(a3, "exitEvent");
    if (v19)
    {

      v20 = (uint64_t *)&v17[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses];
      swift_beginAccess(&v17[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses], v99, 0, 0);
      v21 = *v20;
      v22 = v18;
      swift_bridgeObjectRetain(v21);
      v23 = sub_100017A70(v22, v21);

      swift_bridgeObjectRelease(v21);
      if (v23)
      {
        *(_WORD *)(v23 + 47) = 1;
        v24 = (void *)objc_opt_self(CLPCPolicyInterface);
        v97 = 0;
        v25 = objc_msgSend(v24, "createClient:", &v97);
        v26 = v97;
        if (v25)
        {
          v27 = v25;
          v28 = v97;
          sub_100003ECC(0, v23, v27);
          swift_unknownObjectRelease(v27);
        }
        else
        {
          v36 = v97;
          v37 = _convertNSErrorToError(_:)(v26);

          v38 = swift_willThrow();
          v39 = Logger.daemon.unsafeMutableAddressor(v38);
          (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v39, v6);
          swift_errorRetain(v37);
          v40 = swift_errorRetain(v37);
          v41 = Logger.logObject.getter(v40);
          v42 = static os_log_type_t.error.getter();
          v43 = v42;
          if (os_log_type_enabled(v41, v42))
          {
            v92 = v41;
            v44 = (uint8_t *)swift_slowAlloc(12, -1);
            v45 = swift_slowAlloc(8, -1);
            LODWORD(v91) = v43;
            v46 = (_QWORD *)v45;
            v93 = v6;
            *(_DWORD *)v44 = 138543362;
            v47 = v44 + 12;
            v89 = v44 + 4;
            v90 = v44;
            swift_errorRetain(v37);
            v48 = (void *)_swift_stdlib_bridgeErrorToNSError(v37);
            v97 = v48;
            v49 = v47;
            v6 = v93;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v97, &v98, v89, v49);
            *v46 = v48;
            swift_errorRelease(v37);
            swift_errorRelease(v37);
            v50 = v90;
            _os_log_impl((void *)&_mh_execute_header, v92, (os_log_type_t)v91, "Unable to set game mode for exiting game process %{public}@", v90, 0xCu);
            v51 = sub_100002090((uint64_t *)&unk_100037CA0);
            swift_arrayDestroy(v46, 1, v51);
            swift_slowDealloc(v46, -1, -1);
            swift_slowDealloc(v50, -1, -1);

            swift_errorRelease(v37);
          }
          else
          {
            swift_errorRelease(v37);
            swift_errorRelease(v37);
            swift_errorRelease(v37);

          }
          (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
        }
        v52 = *(_QWORD *)&v17[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeState];
        swift_beginAccess(v52 + 16, &v97, 33, 0);
        swift_retain(v52);
        sub_100020F18(v23);
        swift_endAccess(&v97);
        swift_release(v23);
        swift_release(v52);
      }
      swift_beginAccess(&v17[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_ignoredProcesses], &v97, 33, 0);
      v53 = (void *)sub_100023444(v22);
      swift_endAccess(&v97);

      swift_beginAccess(v20, &v97, 33, 0);
      v54 = v22;
      v55 = sub_100020FD8((unint64_t)v54);
      swift_endAccess(&v97);

      swift_release(v55);
      sub_100002778();

    }
    else
    {
      v93 = v6;
      v29 = (uint64_t *)&v17[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_ignoredProcesses];
      swift_beginAccess(&v17[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_ignoredProcesses], v99, 0, 0);
      v30 = *v29;
      swift_bridgeObjectRetain(*v29);
      v31 = sub_100002188(v18, v30);
      swift_bridgeObjectRelease(v30);
      if ((v31 & 1) != 0)
      {

      }
      else
      {
        v92 = v29;
        v32 = (uint8_t *)&v17[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses];
        swift_beginAccess(&v17[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses], &v97, 0, 0);
        v33 = *(_QWORD *)v32;
        v34 = v18;
        swift_bridgeObjectRetain(v33);
        v35 = sub_100017A70(v34, v33);

        swift_bridgeObjectRelease(v33);
        if (v35)
        {
          sub_100002314(v35, a3);

          swift_release(v35);
        }
        else
        {
          v91 = v32;
          v56 = type metadata accessor for EmbeddedGameProcess();
          swift_allocObject(v56, 64, 7);
          v57 = sub_100017D04(a2);
          if (v57)
          {
            v58 = v57;
            v59 = Logger.daemon.unsafeMutableAddressor(v57);
            v60 = v93;
            (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v59, v93);
            v61 = swift_retain_n(v58, 2);
            v62 = Logger.logObject.getter(v61);
            v63 = static os_log_type_t.default.getter();
            v64 = v63;
            if (os_log_type_enabled(v62, v63))
            {
              LODWORD(v92) = v64;
              v65 = (uint8_t *)swift_slowAlloc(12, -1);
              v90 = (uint8_t *)swift_slowAlloc(32, -1);
              v95 = v90;
              v89 = v65;
              *(_DWORD *)v65 = 136446210;
              v88 = v65 + 4;
              swift_retain(v58);
              v66 = sub_100018BE4();
              v68 = v67;
              swift_release(v58);
              v94 = sub_100004814(v66, v68, (uint64_t *)&v95);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, &v95, v88, v65 + 12);
              swift_release_n(v58, 2);
              swift_bridgeObjectRelease(v68);
              v69 = v89;
              _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v92, "Identified game %{public}s", v89, 0xCu);
              v70 = v90;
              swift_arrayDestroy(v90, 1, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v70, -1, -1);
              swift_slowDealloc(v69, -1, -1);

              (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v93);
            }
            else
            {

              swift_release_n(v58, 2);
              (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v60);
            }
            swift_beginAccess(v91, &v95, 33, 0);
            v83 = v34;
            v84 = swift_retain(v58);
            sub_100021124(v84, v83);
            swift_endAccess(&v95);

            sub_100002314(v58, a3);
            swift_release(v58);
          }
          else
          {
            v71 = Logger.daemon.unsafeMutableAddressor(0);
            v72 = v93;
            (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, v71, v93);
            v73 = (uint8_t *)v34;
            v74 = Logger.logObject.getter(v73);
            v75 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v74, v75))
            {
              v76 = (uint8_t *)swift_slowAlloc(12, -1);
              v90 = (uint8_t *)swift_slowAlloc(8, -1);
              v91 = v76;
              *(_DWORD *)v76 = 138543362;
              v77 = v76 + 12;
              v95 = v73;
              v78 = v73;
              v79 = v76 + 4;
              v72 = v93;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, &v96, v79, v77);
              v80 = v90;
              *(_QWORD *)v90 = v73;

              v81 = v91;
              _os_log_impl((void *)&_mh_execute_header, v74, v75, "Ignoring process %{public}@", v91, 0xCu);
              v82 = sub_100002090((uint64_t *)&unk_100037CA0);
              swift_arrayDestroy(v80, 1, v82);
              swift_slowDealloc(v80, -1, -1);
              swift_slowDealloc(v81, -1, -1);
            }
            else
            {

              v74 = v73;
            }
            v85 = v92;

            (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v72);
            swift_beginAccess(v85, &v95, 33, 0);
            v86 = v73;
            sub_100021E24(&v94, v86);
            v87 = (void *)v94;
            swift_endAccess(&v95);

          }
        }
      }
    }
  }
}

uint64_t sub_10001F740(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  char *v5;
  char *v6;
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
  void (*v24)(void *);
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSString v38;
  NSString v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  Class isa;
  id v44;
  uint64_t v45;
  void *v46;
  NSString v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  NSString v59;
  NSString v60;
  NSObject *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  const void *v72;
  uint64_t v73;
  id v74;
  char *v75;
  uint64_t result;
  void *v77;
  char *v78;
  uint64_t v79;
  void *v80;
  NSString v81;
  Class v82;
  Class v83;
  Class v84;
  Class v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  NSObject *v95;
  uint8_t *v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  os_log_type_t v102;
  uint8_t *v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  NSObject *v108;
  uint8_t *v109;
  uint8_t *v110;
  NSObject *v111;
  uint64_t v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  int v118;
  int v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  __int128 aBlock;
  __int128 v124;
  uint64_t (*v125)();
  uint64_t v126;
  __objc2_prot *v127;
  _OWORD v128[3];

  v6 = v5;
  v116 = a5;
  v118 = a3;
  v119 = a4;
  v115 = a1;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v121 = (char *)&v112 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v112 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v112 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v112 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v112 - v22;
  v24 = 0;
  v25 = 0;
  v122 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection;
  if (*(_QWORD *)&v6[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection])
  {
LABEL_2:
    v117 = (uint64_t)v24;
    v120 = v25;
    v114 = a2;
    v26 = Logger.daemon.unsafeMutableAddressor(v21);
    v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v28 = v27(v14, v26, v8);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc(14, -1);
      *(_DWORD *)v31 = 67109376;
      LODWORD(aBlock) = v118 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4, v31 + 4, v31 + 8);
      *(_WORD *)(v31 + 8) = 1024;
      LODWORD(aBlock) = v119 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4, v31 + 10, v31 + 14);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "showAngelBanner(for: bundleIdentifier, available:%{BOOL}d enabled:%{BOOL}d", (uint8_t *)v31, 0xEu);
      swift_slowDealloc(v31, -1, -1);
    }

    v32 = *(void (**)(char *, uint64_t))(v9 + 8);
    v32(v14, v8);
    v33 = *(void **)&v6[v122];
    if (v33)
    {
      v34 = v8;
      v35 = sub_100002090(&qword_100038688);
      v36 = swift_allocObject(v35, 40, 7);
      *(_OWORD *)(v36 + 16) = xmmword_100026FD0;
      v37 = v33;
      v38 = String._bridgeToObjectiveC()();
      v39 = String._bridgeToObjectiveC()();
      v40 = objc_msgSend((id)objc_opt_self(RBSDomainAttribute), "attributeWithDomain:name:", v38, v39);

      *(_QWORD *)(v36 + 32) = v40;
      *(_QWORD *)&v128[0] = v36;
      specialized Array._endMutation()(v41);
      v42 = *(_QWORD *)&v128[0];
      sub_1000046A8(0, (unint64_t *)&unk_100038BA0, RBSAttribute_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v42);
      v44 = objc_msgSend(v37, "remoteTargetWithLaunchingAssertionAttributes:", isa);

      if (v44)
      {
        _bridgeAnyObjectToAny(_:)(v128, v44);
        swift_unknownObjectRelease(v44);
      }
      else
      {
        memset(v128, 0, 32);
      }
      v78 = v121;
      sub_100001E90((uint64_t)v128, (uint64_t)&aBlock);
      v8 = v34;
      if (*((_QWORD *)&v124 + 1))
      {
        v79 = sub_100002090((uint64_t *)&unk_100038BB0);
        if ((swift_dynamicCast(v128, &aBlock, (char *)&type metadata for Any + 8, v79, 6) & 1) != 0)
        {
          v80 = *(void **)&v128[0];
          v81 = String._bridgeToObjectiveC()();
          sub_1000046A8(0, (unint64_t *)&unk_100037C90, NSNumber_ptr);
          v82 = NSNumber.init(BOOLeanLiteral:)(v118 & 1).super.super.isa;
          v83 = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
          v84 = NSNumber.init(BOOLeanLiteral:)(v119 & 1).super.super.isa;
          v85 = NSNumber.init(BOOLeanLiteral:)(v116 & 1).super.super.isa;
          objc_msgSend(v80, "showGameModeBannerWithBundleIdentifier:available:required:enabled:showText:", v81, v82, v83, v84, v85);
          swift_unknownObjectRelease(v80);

          return sub_100021780(v117, v120);
        }
LABEL_22:
        v86 = v27(v78, v26, v8);
        v87 = Logger.logObject.getter(v86);
        v88 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v87, v88))
        {
          v89 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v89 = 0;
          _os_log_impl((void *)&_mh_execute_header, v87, v88, "com.apple.GamePolicyAngel.notification.service Game Mode No Conn", v89, 2u);
          swift_slowDealloc(v89, -1, -1);
        }

        v32(v78, v8);
        return sub_100021780(v117, v120);
      }
    }
    else
    {
      aBlock = 0u;
      v124 = 0u;
      v78 = v121;
    }
    sub_100024740((uint64_t)&aBlock, &qword_100037600);
    goto LABEL_22;
  }
  v117 = v9;
  v114 = v8;
  v45 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_interface;
  v46 = *(void **)&v6[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_interface];
  if (!v46)
  {
    v47 = String._bridgeToObjectiveC()();
    v48 = objc_msgSend((id)objc_opt_self(BSMutableServiceInterface), "interfaceWithIdentifier:", v47);

    v49 = (void *)objc_opt_self(BSObjCProtocol);
    v50 = objc_msgSend(v49, "protocolForProtocol:", &OBJC_PROTOCOL____TtP11gamepolicyd34GamePolicyAngelNotificationService_);
    objc_msgSend(v48, "setServer:", v50);

    v51 = objc_msgSend(v49, "protocolForProtocol:", &OBJC_PROTOCOL____TtP11gamepolicyd42GamePolicyAngelNotificationServiceCallback_);
    objc_msgSend(v48, "setClient:", v51);

    objc_msgSend(v48, "setClientMessagingExpectation:", 1);
    v52 = objc_msgSend(v48, "copy");
    _bridgeAnyObjectToAny(_:)(&aBlock, v52);
    swift_unknownObjectRelease(v52);
    v53 = sub_1000046A8(0, &qword_100038C20, BSServiceInterface_ptr);
    v54 = swift_dynamicCast(v128, &aBlock, (char *)&type metadata for Any + 8, v53, 6);
    v55 = *(_QWORD *)&v128[0];
    if (!v54)
      v55 = 0;
    v56 = *(void **)&v6[v45];
    *(_QWORD *)&v6[v45] = v55;

    v46 = *(void **)&v6[v45];
    if (!v46)
    {
      v98 = Logger.daemon.unsafeMutableAddressor(v57);
      v99 = v114;
      v100 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v117 + 16))(v17, v98, v114);
      v101 = Logger.logObject.getter(v100);
      v102 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v101, v102))
      {
        v103 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v103 = 0;
        _os_log_impl((void *)&_mh_execute_header, v101, v102, "com.apple.GamePolicyAngel.notification.service No interface", v103, 2u);
        swift_slowDealloc(v103, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v17, v99);
    }
  }
  v58 = v46;
  v59 = String._bridgeToObjectiveC()();
  v60 = String._bridgeToObjectiveC()();
  v61 = objc_msgSend((id)objc_opt_self(BSServiceConnectionEndpoint), "endpointForMachName:service:instance:", v59, v60, 0);

  if (!v61)
  {
    v90 = Logger.daemon.unsafeMutableAddressor(v62);
    v91 = v114;
    v92 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v117 + 16))(v20, v90, v114);
    v93 = Logger.logObject.getter(v92);
    v94 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = v58;
      v96 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v96 = 0;
      _os_log_impl((void *)&_mh_execute_header, v93, v94, "com.apple.GamePolicyAngel.notification.service No endpoint", v96, 2u);
      swift_slowDealloc(v96, -1, -1);
      v97 = v95;
    }
    else
    {
      v97 = v93;
      v93 = v58;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v20, v91);
  }
  v63 = objc_msgSend((id)objc_opt_self(BSServiceConnection), "connectionWithEndpoint:", v61);
  v64 = v114;
  if (!v63)
  {
LABEL_34:
    v104 = Logger.daemon.unsafeMutableAddressor(v63);
    v105 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v117 + 16))(v23, v104, v64);
    v106 = Logger.logObject.getter(v105);
    v107 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v106, v107))
    {
      v108 = v58;
      v109 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v109 = 0;
      _os_log_impl((void *)&_mh_execute_header, v106, v107, "com.apple.GamePolicyAngel.notification.service No connection", v109, 2u);
      v110 = v109;
      v58 = v108;
      swift_slowDealloc(v110, -1, -1);
      v111 = v61;
    }
    else
    {
      v111 = v106;
      v106 = v61;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v23, v64);
  }
  v65 = v63;
  v127 = &OBJC_PROTOCOL___BSServiceConnectionClient;
  v66 = swift_dynamicCastObjCProtocolConditional(v63, 1, &v127);
  if (!v66)
  {

    goto LABEL_34;
  }
  v67 = (void *)v66;
  v68 = swift_allocObject(&unk_1000315E8, 32, 7);
  *(_QWORD *)(v68 + 16) = v58;
  *(_QWORD *)(v68 + 24) = v6;
  v69 = swift_allocObject(&unk_100031610, 32, 7);
  *(_QWORD *)(v69 + 16) = sub_1000217BC;
  *(_QWORD *)(v69 + 24) = v68;
  v120 = v68;
  v125 = sub_100024A68;
  v126 = v69;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v124 = sub_100018ED8;
  *((_QWORD *)&v124 + 1) = &unk_100031628;
  v70 = _Block_copy(&aBlock);
  v71 = v58;
  v72 = v70;
  v73 = v126;
  v113 = v71;
  v74 = v65;
  v75 = v6;
  swift_retain(v69);
  swift_release(v73);
  objc_msgSend(v67, "configureConnection:", v72);

  _Block_release(v72);
  LOBYTE(v72) = swift_isEscapingClosureAtFileLocation(v69, "", 108, 1026, 44, 1);
  result = swift_release(v69);
  if ((v72 & 1) == 0)
  {
    objc_msgSend(v67, "activate");
    v77 = *(void **)&v6[v122];
    *(_QWORD *)&v6[v122] = v67;

    v24 = sub_1000217BC;
    v8 = v114;
    v9 = v117;
    v25 = v120;
    goto LABEL_2;
  }
  __break(1u);
  return result;
}

void sub_10002023C(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  void (*v16)(uint64_t);
  uint64_t v17;

  v6 = objc_msgSend((id)objc_opt_self(BSServiceQuality), "userInitiated");
  objc_msgSend(a1, "setServiceQuality:", v6);

  objc_msgSend(a1, "setInterface:", a2);
  objc_msgSend(a1, "setInterfaceTarget:", a3);
  v16 = (void (*)(uint64_t))nullsub_1;
  v17 = 0;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_10002042C;
  v15 = &unk_100031650;
  v7 = _Block_copy(&v12);
  objc_msgSend(a1, "setActivationHandler:", v7);
  _Block_release(v7);
  v8 = swift_allocObject(&unk_100031688, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16, a3);
  v16 = sub_1000217F8;
  v17 = v8;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_10002042C;
  v15 = &unk_1000316A0;
  v9 = _Block_copy(&v12);
  swift_release(v17);
  objc_msgSend(a1, "setInterruptionHandler:", v9);
  _Block_release(v9);
  v10 = swift_allocObject(&unk_100031688, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, a3);
  v16 = sub_100021800;
  v17 = v10;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_10002042C;
  v15 = &unk_1000316C8;
  v11 = _Block_copy(&v12);
  swift_release(v17);
  objc_msgSend(a1, "setInvalidationHandler:", v11);
  _Block_release(v11);
}

void sub_10002042C(uint64_t a1, void *a2)
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

void sub_10002047C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BYTE v8[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (char *)Strong;
    v5 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection;
    v6 = *(void **)(Strong + OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection);
    if (v6)
    {
      objc_msgSend(v6, "invalidate");
      v7 = *(void **)&v4[v5];
    }
    else
    {
      v7 = 0;
    }
    *(_QWORD *)&v4[v5] = 0;

  }
}

void sub_100020500(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *Strong;
  void *v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = *(void **)&Strong[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection];
    *(_QWORD *)&Strong[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection] = 0;

  }
}

uint64_t sub_10002055C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100020598(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD aBlock[5];
  _QWORD *v27;

  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void **)&v3[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue];
  v14 = (_QWORD *)swift_allocObject(&unk_100031598, 48, 7);
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = a3;
  v14[5] = v3;
  aBlock[4] = sub_100020CFC;
  v27 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000215C;
  aBlock[3] = &unk_1000315B0;
  v15 = _Block_copy(aBlock);
  v16 = v13;
  swift_bridgeObjectRetain(a2);
  v17 = a3;
  static DispatchQoS.unspecified.getter(v3);
  v25 = &_swiftEmptyArrayStorage;
  v18 = sub_10000211C(&qword_100038158, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v19 = sub_100002090((uint64_t *)&unk_100038B80);
  v20 = sub_1000020D0();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v19, v20, v7, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v9, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
  return swift_release(v27);
}

uint64_t sub_100020798(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  _QWORD *v22;
  char v23;
  unint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  void *v27;
  Class isa;
  NSString v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = Logger.daemon.unsafeMutableAddressor(v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v13, v8);
  swift_bridgeObjectRetain_n(a2, 2);
  v14 = a3;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.info.getter();
  v17 = os_log_type_enabled(v15, v16);
  v34 = a1;
  if (v17)
  {
    v18 = swift_slowAlloc(18, -1);
    v33 = a4;
    v19 = v18;
    v20 = swift_slowAlloc(32, -1);
    v36 = v20;
    *(_DWORD *)v19 = 136315394;
    v32 = v8;
    swift_bridgeObjectRetain(a2);
    v35 = sub_100004814(a1, a2, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v19 + 12) = 1024;
    v21 = objc_msgSend(v14, "BOOLValue");

    LODWORD(v35) = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, (char *)&v35 + 4, v19 + 14, v19 + 18);

    _os_log_impl((void *)&_mh_execute_header, v15, v16, "setGameModeForBundleIdentifier(%s enabled:%{BOOL}d)", (uint8_t *)v19, 0x12u);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  if (qword_100037328 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v22 = off_1000375F8;
  swift_retain(off_1000375F8);
  v23 = objc_msgSend(v14, "BOOLValue");
  v24 = GlobalPreferences.gameModeEnabledList.getter();
  swift_bridgeObjectRetain(a2);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v24);
  v36 = v24;
  sub_100009DF4(v23, v34, a2, isUniquelyReferenced_nonNull_native);
  v26 = v36;
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(0x8000000000000000);
  v27 = (void *)v22[2];
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v26);
  v29 = String._bridgeToObjectiveC()();
  objc_msgSend(v27, "setValue:forKey:", isa, v29);
  swift_release(v22);

  return sub_100002778();
}

uint64_t sub_100020B60(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[26];

  v7[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v7[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v7[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v7[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v7[4] = (char *)&value witness table for Builtin.NativeObject + 64;
  v7[5] = "\b";
  v7[6] = &unk_1000271F8;
  v7[7] = &unk_1000271F8;
  v7[8] = &unk_1000271F8;
  v7[9] = &unk_1000271F8;
  v7[10] = &unk_100027210;
  v7[11] = &unk_100027210;
  v7[12] = &unk_100027210;
  v7[13] = &unk_100027210;
  result = type metadata accessor for GameModeStatus.Config(319);
  if (v3 <= 0x3F)
  {
    v7[14] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for ModelManagerGameAssertionStatus.Config(319);
    if (v4 <= 0x3F)
    {
      v7[15] = *(_QWORD *)(result - 8) + 64;
      result = type metadata accessor for SustainedExecutionStatus.Config(319);
      if (v5 <= 0x3F)
      {
        v7[16] = *(_QWORD *)(result - 8) + 64;
        result = type metadata accessor for DynamicSplitterStatus.Config(319);
        if (v6 <= 0x3F)
        {
          v7[17] = *(_QWORD *)(result - 8) + 64;
          v7[18] = (char *)&value witness table for Builtin.Int32 + 64;
          v7[19] = (char *)&value witness table for Builtin.Int32 + 64;
          v7[20] = (char *)&value witness table for Builtin.Int32 + 64;
          v7[21] = (char *)&value witness table for Builtin.Int32 + 64;
          v7[22] = (char *)&value witness table for Builtin.UnknownObject + 64;
          v7[23] = (char *)&value witness table for Builtin.UnknownObject + 64;
          v7[24] = "\b";
          v7[25] = "\b";
          return swift_updateClassMetadata2(a1, 256, 26, v7, a1 + 80);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100020C9C(uint64_t a1, uint64_t a2)
{
  return sub_10000211C(&qword_100038B68, a2, (uint64_t (*)(uint64_t))type metadata accessor for EmbeddedGameProcess, (uint64_t)&unk_100027248);
}

uint64_t sub_100020CC8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100020CFC()
{
  uint64_t v0;

  return sub_100020798(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_100020D08(_QWORD *a1, _QWORD *a2)
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
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_100020DCC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002090((uint64_t *)&unk_100038B90);
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

uint64_t sub_100020F18(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  char v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  v4 = *v2;
  swift_bridgeObjectRetain(*v2);
  v5 = sub_10000452C(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0)
    return 2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v8 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000A554();
    v8 = v12;
  }
  swift_release(*(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v5));
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v8 + 56) + v5);
  sub_1000213F8(v5, v8);
  v10 = *v2;
  *v2 = v8;
  swift_bridgeObjectRelease(v10);
  return v9;
}

uint64_t sub_100020FD8(unint64_t a1)
{
  Swift::Int *v1;
  Swift::Int *v2;
  Swift::Int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  char v12;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  Swift::Int v15;
  Swift::Int v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain(v4);
    a1 = sub_1000022E4(a1);
    v12 = v11;
    swift_bridgeObjectRelease(v4);
    if ((v12 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
      v4 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_10000A6F4();
        v4 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v4);
  v6 = (id)a1;
  v7 = __CocoaDictionary.lookup(_:)();

  if (!v7)
  {
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  swift_unknownObjectRelease(v7);
  v8 = __CocoaDictionary.count.getter(v5);
  v4 = sub_1000211C4(v5, v8);
  swift_retain(v4);
  a1 = sub_1000022E4((uint64_t)v6);
  v10 = v9;
  swift_release(v4);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v14 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * a1);
  sub_1000215D0(a1, v4);
  v15 = *v2;
  *v2 = v4;
  swift_bridgeObjectRelease(v15);
  return v14;
}

uint64_t sub_100021124(uint64_t a1, void *a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  Swift::Int v10;
  Swift::Int v11;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = __CocoaDictionary.count.getter(v7);
  if (!__OFADD__(result, 1))
  {
    v6 = sub_1000211C4(v7, result + 1);
    *v3 = v6;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
    v11 = *v3;
    *v3 = 0x8000000000000000;
    sub_10000A0A0(a1, a2, isUniquelyReferenced_nonNull_native);
    v10 = *v3;
    *v3 = v11;
    return swift_bridgeObjectRelease(v10);
  }
  __break(1u);
  return result;
}

Swift::Int sub_1000211C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::Int result;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (a2)
  {
    sub_100002090(&qword_1000377F0);
    v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    v32 = v4;
    v5 = __CocoaDictionary.makeIterator()(a1);
    v7 = __CocoaDictionary.Iterator.next()(v6);
    if (v7)
    {
      v9 = v7;
      v10 = v8;
      v11 = sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
      do
      {
        v30 = v9;
        swift_dynamicCast(&v31, &v30, (char *)&type metadata for Swift.AnyObject + 8, v11, 7);
        v29 = v10;
        v23 = type metadata accessor for EmbeddedGameProcess();
        swift_dynamicCast(&v30, &v29, (char *)&type metadata for Swift.AnyObject + 8, v23, 7);
        v4 = v32;
        v24 = *(_QWORD *)(v32 + 16);
        if (*(_QWORD *)(v32 + 24) <= v24)
        {
          sub_100009B20(v24 + 1, 1);
          v4 = v32;
        }
        v13 = v30;
        v12 = v31;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v16 = v4 + 64;
        v17 = -1 << *(_BYTE *)(v4 + 32);
        v18 = result & ~v17;
        v19 = v18 >> 6;
        if (((-1 << v18) & ~*(_QWORD *)(v4 + 64 + 8 * (v18 >> 6))) != 0)
        {
          v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v4 + 64 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v25 = 0;
          v26 = (unint64_t)(63 - v17) >> 6;
          do
          {
            if (++v19 == v26 && (v25 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v27 = v19 == v26;
            if (v19 == v26)
              v19 = 0;
            v25 |= v27;
            v28 = *(_QWORD *)(v16 + 8 * v19);
          }
          while (v28 == -1);
          v20 = __clz(__rbit64(~v28)) + (v19 << 6);
        }
        *(_QWORD *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
        v21 = 8 * v20;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + v21) = v12;
        *(_QWORD *)(*(_QWORD *)(v4 + 56) + v21) = v13;
        ++*(_QWORD *)(v4 + 16);
        v9 = __CocoaDictionary.Iterator.next()(v15);
        v10 = v22;
      }
      while (v9);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v4;
}

unint64_t sub_1000213F8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
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
        v9 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        v10 = *(void **)(v9 + 16);
        swift_retain(v9);
        v11 = v10;
        NSObject.hash(into:)(v26);

        v12 = Hasher._finalize()();
        result = swift_release(v9);
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
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_BYTE *)(v17 + v3);
          v19 = (_BYTE *)(v17 + v6);
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

void sub_1000215D0(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

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
        v10 = *(_QWORD *)(a2 + 40);
        v11 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v3 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(a2 + 48);
            v17 = (_QWORD *)(v16 + 8 * v3);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v3 != v6 || v17 >= v18 + 1)
              *v17 = *v18;
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_QWORD *)(v19 + 8 * v3);
            v21 = (_QWORD *)(v19 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 1))
            {
              *v20 = *v21;
              v3 = v6;
            }
          }
        }
        else if (v13 >= v9 || v3 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v24 = *v22;
    v23 = (-1 << a1) - 1;
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
}

uint64_t sub_100021780(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100021790()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_1000217BC(void *a1)
{
  uint64_t v1;

  sub_10002023C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1000217C4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000217D4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000217F8(uint64_t a1)
{
  uint64_t v1;

  sub_10002047C(a1, v1);
}

void sub_100021800(uint64_t a1)
{
  uint64_t v1;

  sub_100020500(a1, v1);
}

uint64_t sub_100021808(uint64_t a1)
{
  uint64_t v1;

  return sub_10001E62C(a1, v1, (uint64_t)sub_1000246D0, (uint64_t)&unk_100031998);
}

uint64_t sub_100021830(uint64_t a1)
{
  uint64_t v1;

  return sub_10001E62C(a1, v1, (uint64_t)sub_1000246B0, (uint64_t)&unk_100031970);
}

uint64_t sub_100021858(uint64_t a1)
{
  uint64_t v1;

  return sub_10001E62C(a1, v1, (uint64_t)sub_100024690, (uint64_t)&unk_100031948);
}

uint64_t sub_100021880(uint64_t a1)
{
  uint64_t v1;

  return sub_10001E62C(a1, v1, (uint64_t)sub_100024670, (uint64_t)&unk_100031920);
}

uint64_t sub_1000218A8(uint64_t a1)
{
  uint64_t v1;

  return sub_10001E62C(a1, v1, (uint64_t)sub_100024668, (uint64_t)&unk_1000318F8);
}

uint64_t sub_1000218D0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1000218F4()
{
  sub_10001E970();
}

void sub_1000218FC(void *a1)
{
  uint64_t v1;

  sub_10001EA8C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100021904()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100021914()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100021934(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;

  return sub_10001EC1C(a1, a2, a3, v3);
}

uint64_t sub_10002193C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

void sub_100021970()
{
  uint64_t v0;

  sub_10001EE48(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_10002197C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1000219B4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100021998(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100021B10(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1000219B4(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002090(&qword_100038CC8);
    v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8])
      memmove(v14, v15, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100021B10(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002090(&qword_100038718);
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

uint64_t sub_100021C78(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_1000228AC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100021E24(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  Swift::Int v32;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v31 = v9;
      v10 = sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v23 = sub_1000220C0(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_100022590(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_10002282C((uint64_t)v8, v25);
    v28 = *v3;
    *v3 = v25;
  }
  else
  {
    v12 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v13 = NSObject._rawHashValue(seed:)(v12);
    v14 = -1 << *(_BYTE *)(v6 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)(v16, a2);

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v21 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        v22 = v21;
        return 0;
      }
      v18 = ~v14;
      while (1)
      {
        v15 = (v15 + 1) & v18;
        if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          break;
        v19 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
        v20 = static NSObject.== infix(_:_:)(v19, a2);

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_100022A44((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_1000220C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_100002090(&qword_100038C98);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_100022590(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()(result);
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_1000222B4(uint64_t a1)
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
  sub_100002090(&qword_100038CD8);
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

Swift::Int sub_100022590(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100002090(&qword_100038C98);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_10002282C(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_1000228AC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1000222B4(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_100022BC8();
      goto LABEL_22;
    }
    sub_100022F20(v11);
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

void sub_100022A44(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100022590(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_100022D78();
      goto LABEL_14;
    }
    sub_1000231CC(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)(v14, a1);

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)(v17, a1);

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

void *sub_100022BC8()
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
  sub_100002090(&qword_100038CD8);
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

id sub_100022D78()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100002090(&qword_100038C98);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_100022F20(uint64_t a1)
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
  sub_100002090(&qword_100038CD8);
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

Swift::Int sub_1000231CC(uint64_t a1)
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
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100002090(&qword_100038C98);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100023444(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char v7;
  uint64_t v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v2 = v1;
  v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v4 < 0)
      v5 = *v1;
    else
      v5 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v6 = a1;
    v7 = __CocoaSet.contains(_:)();

    if ((v7 & 1) != 0)
    {
      v8 = sub_100023618(v5, (uint64_t)v6);
      swift_bridgeObjectRelease(v4);
      return v8;
    }
LABEL_15:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  v9 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain(v4);
  v10 = NSObject._rawHashValue(seed:)(v9);
  v11 = -1 << *(_BYTE *)(v4 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
    goto LABEL_15;
  sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
  v13 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
  v14 = static NSObject.== infix(_:_:)(v13, a1);

  if ((v14 & 1) == 0)
  {
    v15 = ~v11;
    do
    {
      v12 = (v12 + 1) & v15;
      if (((*(_QWORD *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        goto LABEL_15;
      v16 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
      v17 = static NSObject.== infix(_:_:)(v16, a1);

    }
    while ((v17 & 1) == 0);
  }
  swift_bridgeObjectRelease(v4);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v19 = *v2;
  v22 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100022D78();
    v19 = v22;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * v12);
  sub_1000237B0(v12);
  v20 = *v2;
  *v2 = v22;
  swift_bridgeObjectRelease(v20);
  return v8;
}

uint64_t sub_100023618(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t result;
  Swift::Int v19;

  v3 = v2;
  swift_bridgeObjectRelease(*v3);
  v6 = __CocoaSet.count.getter(a1);
  v7 = swift_unknownObjectRetain(a1);
  v8 = sub_1000220C0(v7, v6);
  v19 = v8;
  v9 = *(_QWORD *)(v8 + 40);
  swift_retain(v8);
  v10 = NSObject._rawHashValue(seed:)(v9);
  v11 = -1 << *(_BYTE *)(v8 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    sub_1000046A8(0, &qword_100038C90, RBSProcessIdentity_ptr);
    v13 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v12);
    v14 = static NSObject.== infix(_:_:)(v13, a2);

    if ((v14 & 1) != 0)
    {
LABEL_6:
      swift_release(v8);
      v8 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v12);
      sub_1000237B0(v12);
      if ((static NSObject.== infix(_:_:)(a2, v8) & 1) != 0)
      {
        *v3 = v19;
        return v8;
      }
      __break(1u);
    }
    else
    {
      v15 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v15;
        if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          break;
        v16 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v12);
        v17 = static NSObject.== infix(_:_:)(v16, a2);

        if ((v17 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release(v8);
    __break(1u);
  }
  result = swift_release(v8);
  __break(1u);
  return result;
}

unint64_t sub_1000237B0(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 40);
        v11 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(v3 + 48);
            v17 = (_QWORD *)(v16 + 8 * v2);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v17 >= v18 + 1))
            {
              *v17 = *v18;
              v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v19 = *(_QWORD *)(v3 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

id sub_100023950(void *a1)
{
  char *v1;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  void ***v21;
  void ***v22;
  int *v23;
  int *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  const char *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  const char *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  int *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  int *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  _UNKNOWN **v49;
  unsigned __int8 v50;
  void *v51;
  uint64_t v52;
  unsigned __int8 v53;
  void *v54;
  uint64_t v55;
  unsigned __int8 v56;
  void *v57;
  uint64_t v58;
  unsigned __int8 v59;
  void *v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t, uint64_t);
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  objc_class *v74;
  unint64_t v76;
  int *v77;
  int *v78;
  char *v79;
  void *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  objc_super v87;
  void **aBlock;
  unint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void *v91;
  uint64_t (*v92)();
  uint64_t v93;

  v80 = a1;
  type metadata accessor for DynamicSplitterStatus.Config(0);
  ((void (*)(void))__chkstk_darwin)();
  v86 = (char *)&v76 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SustainedExecutionStatus.Config(0);
  ((void (*)(void))__chkstk_darwin)();
  v85 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  ((void (*)(void))__chkstk_darwin)();
  v82 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002090(&qword_100038128);
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v84 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v83 = (char *)&v76 - v7;
  v8 = type metadata accessor for GameModeStatus.Config(0);
  __chkstk_darwin(v8);
  v81 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for String.Encoding(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_ignoredProcesses] = &_swiftEmptySetSingleton;
  v14 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameProcesses;
  v15 = v1;
  *(_QWORD *)&v1[v14] = sub_100008278((uint64_t)&_swiftEmptyArrayStorage);
  v16 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeState;
  v17 = type metadata accessor for GameModeState();
  v18 = swift_allocObject(v17, 24, 7);
  *(_QWORD *)(v18 + 16) = sub_10000817C((uint64_t)&_swiftEmptyArrayStorage);
  *(_QWORD *)&v15[v16] = v18;
  *(_QWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_identifiedGameTransaction] = 0;
  v19 = &v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification];
  v79 = &v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotification];
  *(_QWORD *)v19 = 0xD000000000000031;
  *((_QWORD *)v19 + 1) = 0x800000010002A930;
  v20 = &v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotification];
  *(_QWORD *)v20 = 0xD000000000000025;
  *((_QWORD *)v20 + 1) = 0x800000010002A970;
  v21 = (void ***)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotification];
  *v21 = (void **)0xD00000000000002FLL;
  v21[1] = (void **)0x800000010002A9A0;
  v22 = (void ***)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotification];
  *v22 = (void **)0xD000000000000039;
  v22[1] = (void **)0x800000010002A9D0;
  v23 = (int *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken];
  *(_DWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeNotifyToken] = 0;
  v24 = (int *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken];
  *(_DWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeAvailableNotifyToken] = 0;
  v77 = (int *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken];
  *(_DWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeCameraJettisonS2RNotifyToken] = 0;
  v78 = (int *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken];
  *(_DWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_semNotifyToken] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_connection] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_interface] = 0;
  aBlock = (void **)0xD000000000000025;
  v89 = 0x800000010002A970;
  ((void (*)(void))static String.Encoding.utf8.getter)();
  v76 = sub_100011824();
  v25 = StringProtocol.cString(using:)(v13, &type metadata for String, v76);
  v26 = *(void (**)(char *, uint64_t))(v11 + 8);
  v26(v13, v10);
  swift_bridgeObjectRelease(v89);
  if (v25)
    v27 = (const char *)(v25 + 32);
  else
    v27 = 0;
  swift_beginAccess(v23, &aBlock, 33, 0);
  notify_register_check(v27, v23);
  swift_endAccess(&aBlock);
  swift_bridgeObjectRelease(v25);
  v28 = (unint64_t)v21[1];
  aBlock = *v21;
  v89 = v28;
  v29 = swift_bridgeObjectRetain(v28);
  static String.Encoding.utf8.getter(v29);
  v30 = v76;
  v31 = StringProtocol.cString(using:)(v13, &type metadata for String, v76);
  v26(v13, v10);
  swift_bridgeObjectRelease(v89);
  if (v31)
    v32 = (const char *)(v31 + 32);
  else
    v32 = 0;
  swift_beginAccess(v24, &aBlock, 33, 0);
  notify_register_check(v32, v24);
  swift_endAccess(&aBlock);
  swift_bridgeObjectRelease(v31);
  v33 = (unint64_t)v22[1];
  aBlock = *v22;
  v89 = v33;
  v34 = swift_bridgeObjectRetain(v33);
  static String.Encoding.utf8.getter(v34);
  v35 = StringProtocol.cString(using:)(v13, &type metadata for String, v30);
  v36 = v10;
  v26(v13, v10);
  swift_bridgeObjectRelease(v89);
  if (v35)
    v37 = (const char *)(v35 + 32);
  else
    v37 = 0;
  v38 = v77;
  swift_beginAccess(v77, &aBlock, 33, 0);
  notify_register_check(v37, v38);
  swift_endAccess(&aBlock);
  swift_bridgeObjectRelease(v35);
  v39 = *((_QWORD *)v79 + 1);
  aBlock = *(void ***)v79;
  v89 = v39;
  v40 = swift_bridgeObjectRetain(v39);
  static String.Encoding.utf8.getter(v40);
  v41 = StringProtocol.cString(using:)(v13, &type metadata for String, v30);
  v26(v13, v36);
  swift_bridgeObjectRelease(v89);
  if (v41)
    v42 = (const char *)(v41 + 32);
  else
    v42 = 0;
  v43 = v78;
  swift_beginAccess(v78, &aBlock, 33, 0);
  notify_register_check(v42, v43);
  swift_endAccess(&aBlock);
  swift_bridgeObjectRelease(v41);
  v44 = v80;
  *(_QWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_queue] = v80;
  v45 = objc_allocWithZone((Class)NSOperationQueue);
  v46 = v44;
  v47 = objc_msgSend(v45, "init");
  *(_QWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_operationQueue] = v47;
  v48 = (char *)&off_100037000;
  v49 = &off_100037000;
  if ((sub_100005588() & 1) == 0)
  {
    if (qword_100037328 != -1)
      goto LABEL_35;
    goto LABEL_16;
  }
  v50 = 1;
  while (1)
  {
    v52 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsGameMode;
    v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsGameMode] = v50 & 1;
    if ((sub_100005ABC() & 1) != 0)
    {
      v53 = 1;
    }
    else
    {
      if (*((_QWORD *)v48 + 101) != -1)
        swift_once(&qword_100037328, sub_10000764C);
      v54 = v49[191];
      swift_retain(v54);
      v53 = GlobalPreferences.ignoreDeviceRestrictions.getter();
      swift_release(v54);
    }
    v55 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsModelManagerGameAssertion;
    v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsModelManagerGameAssertion] = v53 & 1;
    if ((sub_100006094() & 1) != 0)
    {
      v56 = 1;
    }
    else
    {
      if (*((_QWORD *)v48 + 101) != -1)
        swift_once(&qword_100037328, sub_10000764C);
      v57 = v49[191];
      swift_retain(v57);
      v56 = GlobalPreferences.ignoreDeviceRestrictions.getter();
      swift_release(v57);
    }
    v58 = OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsDynamicPowerSplitter;
    v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsDynamicPowerSplitter] = v56 & 1;
    if ((sub_1000065EC() & 1) != 0)
    {
      v59 = 1;
    }
    else
    {
      if (*((_QWORD *)v48 + 101) != -1)
        swift_once(&qword_100037328, sub_10000764C);
      v60 = v49[191];
      swift_retain(v60);
      v59 = GlobalPreferences.ignoreDeviceRestrictions.getter();
      swift_release(v60);
    }
    v49 = (_UNKNOWN **)OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsSustainedExecutionMode;
    v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_deviceSupportsSustainedExecutionMode] = v59 & 1;
    v61 = type metadata accessor for Date(0);
    v62 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56);
    v63 = v83;
    v62(v83, 1, 1, v61);
    v48 = v84;
    v62(v84, 1, 1, v61);
    v64 = v15[v52];
    v65 = (uint64_t)v81;
    GameModeStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:jettisonCameraS2R:gameBundleIdentifiers:previousGameBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)(0, v63, v48, v64, 0, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, 0);
    sub_1000247C4(v65, (uint64_t)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_gameModeStatusConfig], (uint64_t (*)(_QWORD))&type metadata accessor for GameModeStatus.Config);
    v62(v63, 1, 1, v61);
    v62(v48, 1, 1, v61);
    v66 = (uint64_t)v82;
    ModelManagerGameAssertionStatus.Config.init(policy:enablementDate:disablementDate:deviceSupported:aaaBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:policyStrategy:)(2, v63, v48, v15[v55], &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, 0);
    sub_1000247C4(v66, (uint64_t)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_modelManagerGameAssertionStatusConfig], (uint64_t (*)(_QWORD))&type metadata accessor for ModelManagerGameAssertionStatus.Config);
    v62(v63, 1, 1, v61);
    v62(v48, 1, 1, v61);
    v67 = (uint64_t)v85;
    SustainedExecutionStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)(0, v63, v48, *((unsigned __int8 *)v49 + (_QWORD)v15), &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, 0);
    sub_1000247C4(v67, (uint64_t)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_sustainedExecutionStatusConfig], (uint64_t (*)(_QWORD))&type metadata accessor for SustainedExecutionStatus.Config);
    v62(v63, 1, 1, v61);
    v62(v48, 1, 1, v61);
    v68 = (uint64_t)v86;
    DynamicSplitterStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)(0, v63, v48, v15[v58], &_swiftEmptyArrayStorage, &_swiftEmptyArrayStorage, 0);
    sub_1000247C4(v68, (uint64_t)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_dynamicSplitterStatusConfig], (uint64_t (*)(_QWORD))&type metadata accessor for DynamicSplitterStatus.Config);
    v69 = objc_msgSend(objc_allocWithZone((Class)RBSProcessStateDescriptor), "init");
    objc_msgSend(v69, "setValues:", 17);
    *(_QWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_assertionDescriptor] = v69;
    v92 = nullsub_1;
    v93 = 0;
    aBlock = _NSConcreteStackBlock;
    v89 = 1107296256;
    v90 = sub_100018ED8;
    v91 = &unk_1000319C0;
    v70 = _Block_copy(&aBlock);
    v71 = (void *)objc_opt_self(RBSProcessMonitor);
    v72 = v69;
    v73 = objc_msgSend(v71, "monitorWithConfiguration:", v70);
    _Block_release(v70);
    swift_release(v93);
    LOBYTE(v70) = swift_isEscapingClosureAtFileLocation(0, "", 0, 0, 0, 1);

    if ((v70 & 1) == 0)
      break;
    __break(1u);
LABEL_35:
    swift_once(&qword_100037328, sub_10000764C);
LABEL_16:
    v51 = v49[191];
    swift_retain(v51);
    v50 = GlobalPreferences.ignoreDeviceRestrictions.getter();
    swift_release(v51);
  }
  *(_QWORD *)&v15[OBJC_IVAR____TtC11gamepolicyd26EmbeddedGameProcessMonitor_processMonitor] = v73;

  v74 = (objc_class *)type metadata accessor for EmbeddedGameProcessMonitor(0);
  v87.receiver = v15;
  v87.super_class = v74;
  return objc_msgSendSuper2(&v87, "init");
}

Swift::Int sub_10002436C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100002090(&qword_100038CD8);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v27 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v27 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      Hasher.init(_seed:)(v28, *(_QWORD *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      result = Hasher._finalize()();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = v16[1];
        v18 = *v16 == v8 && v17 == v7;
        if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }
        v19 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v19;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v20 = (_QWORD *)(v15 + 16 * v11);
          v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0);
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v23 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v23 = v8;
      v23[1] = v7;
      v24 = *(_QWORD *)(v3 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

unint64_t sub_10002450C()
{
  unint64_t result;

  result = qword_100038CB0;
  if (!qword_100038CB0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100038CB0);
  }
  return result;
}

uint64_t sub_100024550(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100002090(&qword_100038CD0);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    v7 = *(_QWORD *)(v3 + 40);
    v8 = ~(-1 << *(_BYTE *)(v3 + 32));
    while (1)
    {
      v9 = *(_QWORD *)(v6 + 8 * v4);
      result = static Hasher._hash(seed:_:)(v7, v9);
      v11 = result & v8;
      v12 = (result & (unint64_t)v8) >> 6;
      v13 = *(_QWORD *)(v5 + 8 * v12);
      v14 = 1 << (result & v8);
      v15 = *(_QWORD *)(v3 + 48);
      if ((v14 & v13) != 0)
      {
        while (*(_QWORD *)(v15 + 8 * v11) != v9)
        {
          v11 = (v11 + 1) & v8;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            goto LABEL_7;
        }
      }
      else
      {
LABEL_7:
        *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
        *(_QWORD *)(v15 + 8 * v11) = v9;
        v16 = *(_QWORD *)(v3 + 16);
        v17 = __OFADD__(v16, 1);
        v18 = v16 + 1;
        if (v17)
        {
          __break(1u);
          return result;
        }
        *(_QWORD *)(v3 + 16) = v18;
      }
      if (++v4 == v1)
        return v3;
    }
  }
  return (uint64_t)&_swiftEmptySetSingleton;
}

void sub_100024668()
{
  uint64_t v0;

  sub_10001E87C(v0);
}

void sub_100024670()
{
  uint64_t v0;

  sub_10001E5D8(v0, sub_10001D990);
}

void sub_100024690()
{
  uint64_t v0;

  sub_10001E5D8(v0, sub_10001D60C);
}

void sub_1000246B0()
{
  uint64_t v0;

  sub_10001E5D8(v0, sub_10001D440);
}

void sub_1000246D0()
{
  uint64_t v0;

  sub_10001E5D8(v0, sub_10001D0BC);
}

uint64_t sub_1000246F0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000246F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002090(&qword_100038128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024740(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100002090(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002477C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002090(&qword_100038128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000247C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_BYTE *initializeBufferWithCopyOfBuffer for GamePolicyFF(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GamePolicyFF(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GamePolicyFF(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000248F0 + 4 * byte_100027115[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100024924 + 4 * byte_100027110[v4]))();
}

uint64_t sub_100024924(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002492C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100024934);
  return result;
}

uint64_t sub_100024940(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100024948);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10002494C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100024954(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100024960(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100024968(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyFF()
{
  return &type metadata for GamePolicyFF;
}

unint64_t sub_100024988()
{
  unint64_t result;

  result = qword_100038D10;
  if (!qword_100038D10)
  {
    result = swift_getWitnessTable(&unk_100027348, &type metadata for GamePolicyFF);
    atomic_store(result, (unint64_t *)&qword_100038D10);
  }
  return result;
}

BOOL static GamePolicyMobileAssetRetriever.RetrievalError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void GamePolicyMobileAssetRetriever.RetrievalError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

BOOL sub_100024AA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int _s11gamepolicyd30GamePolicyMobileAssetRetrieverC6StatusC5StateO9hashValueSivg_0(unsigned __int8 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

uint64_t GamePolicyMobileAssetRetriever.Status.description.getter()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;
  uint64_t v3;
  Swift::String v4;
  void *object;
  Swift::String v6;
  uint64_t v7;
  Swift::String v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[0] = 0;
  v12[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(66);
  v1._object = (void *)0x800000010002AAC0;
  v1._countAndFlagsBits = 0xD00000000000002DLL;
  String.append(_:)(v1);
  LOBYTE(v11) = *(_BYTE *)(v0 + 16);
  _print_unlocked<A, B>(_:_:)(&v11, v12, &type metadata for GamePolicyMobileAssetRetriever.Status.State, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v2._countAndFlagsBits = 0x3D726F72726520;
  v2._object = (void *)0xE700000000000000;
  String.append(_:)(v2);
  v11 = *(_QWORD *)(v0 + 24);
  swift_errorRetain(v11);
  v3 = sub_100002090(&qword_100038D20);
  v4._countAndFlagsBits = String.init<A>(describing:)(&v11, v3);
  object = v4._object;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(object);
  v6._countAndFlagsBits = 0x3D746C7573657220;
  v6._object = (void *)0xE800000000000000;
  String.append(_:)(v6);
  v11 = *(_QWORD *)(v0 + 32);
  swift_retain(v11);
  v7 = sub_100002090(&qword_100038D28);
  v8._countAndFlagsBits = String.init<A>(describing:)(&v11, v7);
  v9 = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v9);
  return v12[0];
}

uint64_t GamePolicyMobileAssetRetriever.Status.deinit()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return v0;
}

uint64_t GamePolicyMobileAssetRetriever.Status.__deallocating_deinit()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_100024CA4()
{
  return GamePolicyMobileAssetRetriever.Status.description.getter();
}

uint64_t GamePolicyMobileAssetRetriever.forceCatalogRefresh.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t GamePolicyMobileAssetRetriever.assetType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t GamePolicyMobileAssetRetriever.status.getter()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 40));
}

id GamePolicyMobileAssetRetriever.registerCompletionHandler(completion:)(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char **v9;
  char *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _BYTE v16[24];

  v3 = v2;
  objc_msgSend(*(id *)(v2 + 56), "lock");
  v6 = *(_QWORD *)(v2 + 40);
  if (*(_BYTE *)(v6 + 16))
  {
    v7 = swift_retain(*(_QWORD *)(v2 + 40));
    a1(v7);
    swift_release(v6);
  }
  else
  {
    v8 = swift_allocObject(&unk_100031AF0, 32, 7);
    *(_QWORD *)(v8 + 16) = a1;
    *(_QWORD *)(v8 + 24) = a2;
    v9 = (char **)(v3 + 48);
    swift_beginAccess(v3 + 48, v16, 33, 0);
    v10 = *(char **)(v3 + 48);
    swift_retain(a2);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
    *(_QWORD *)(v3 + 48) = v10;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v10 = sub_10002500C(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
      *v9 = v10;
    }
    v13 = *((_QWORD *)v10 + 2);
    v12 = *((_QWORD *)v10 + 3);
    if (v13 >= v12 >> 1)
    {
      v10 = sub_10002500C((char *)(v12 > 1), v13 + 1, 1, v10);
      *v9 = v10;
    }
    *((_QWORD *)v10 + 2) = v13 + 1;
    v14 = &v10[16 * v13];
    *((_QWORD *)v14 + 4) = sub_100024E6C;
    *((_QWORD *)v14 + 5) = v8;
    swift_endAccess(v16);
  }
  return objc_msgSend(*(id *)(v3 + 56), "unlock");
}

uint64_t sub_100024E48()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100024E6C(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t GamePolicyMobileAssetRetriever.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));

  return v0;
}

uint64_t GamePolicyMobileAssetRetriever.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));

  return swift_deallocClassInstance(v0, 64, 7);
}

char *sub_100024F00(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100002090(&qword_100038718);
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
    sub_1000254B8(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10002500C(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100002090(&qword_100038F80);
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
    sub_1000255A8(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

unint64_t sub_10002511C()
{
  unint64_t result;

  result = qword_100038D30;
  if (!qword_100038D30)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for GamePolicyMobileAssetRetriever.RetrievalError, &type metadata for GamePolicyMobileAssetRetriever.RetrievalError);
    atomic_store(result, (unint64_t *)&qword_100038D30);
  }
  return result;
}

unint64_t sub_100025164()
{
  unint64_t result;

  result = qword_100038D38;
  if (!qword_100038D38)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for GamePolicyMobileAssetRetriever.Status.State, &type metadata for GamePolicyMobileAssetRetriever.Status.State);
    atomic_store(result, (unint64_t *)&qword_100038D38);
  }
  return result;
}

uint64_t type metadata accessor for GamePolicyMobileAssetRetriever()
{
  return objc_opt_self(_TtC11gamepolicyd30GamePolicyMobileAssetRetriever);
}

uint64_t getEnumTagSinglePayload for GamePolicyMobileAssetRetriever.RetrievalError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GamePolicyMobileAssetRetriever.RetrievalError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1000252A4 + 4 * byte_1000273A5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1000252D8 + 4 * byte_1000273A0[v4]))();
}

uint64_t sub_1000252D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000252E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000252E8);
  return result;
}

uint64_t sub_1000252F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000252FCLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_100025300(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100025308(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100025314(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyMobileAssetRetriever.RetrievalError()
{
  return &type metadata for GamePolicyMobileAssetRetriever.RetrievalError;
}

uint64_t type metadata accessor for GamePolicyMobileAssetRetriever.Status()
{
  return objc_opt_self(_TtCC11gamepolicyd30GamePolicyMobileAssetRetriever6Status);
}

uint64_t getEnumTagSinglePayload for GamePolicyMobileAssetRetriever.Status.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GamePolicyMobileAssetRetriever.Status.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100025428 + 4 * byte_1000273AF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10002545C + 4 * byte_1000273AA[v4]))();
}

uint64_t sub_10002545C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100025464(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002546CLL);
  return result;
}

uint64_t sub_100025478(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100025480);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100025484(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002548C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GamePolicyMobileAssetRetriever.Status.State()
{
  return &type metadata for GamePolicyMobileAssetRetriever.Status.State;
}

ValueMetadata *type metadata accessor for GamePolicyMobileAssetRetriever.Status.Result()
{
  return &type metadata for GamePolicyMobileAssetRetriever.Status.Result;
}

uint64_t sub_1000254B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_1000255A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
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
      sub_100002090(&qword_100038F88);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1000256C8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocClassInstance(v0, 65, 7);
}

uint64_t type metadata accessor for AssetDatabase()
{
  return objc_opt_self(_TtC11gamepolicyd13AssetDatabase);
}

uint64_t sub_100025734()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t _s11PersonalityCMa()
{
  return objc_opt_self(_TtCCC11gamepolicyd22GamingMetadataDBBundle10Descriptor11Personality);
}

uint64_t sub_100025778()
{
  uint64_t v0;
  Swift::String v1;
  void *object;
  Swift::String v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v6 = 60;
  v7 = 0xE100000000000000;
  v5 = _s11PersonalityCMa();
  v0 = sub_100002090(&qword_100039178);
  v1._countAndFlagsBits = String.init<A>(describing:)(&v5, v0);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  v3._countAndFlagsBits = 62;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return v6;
}

id objc_msgSend_predicateMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatching:");
}

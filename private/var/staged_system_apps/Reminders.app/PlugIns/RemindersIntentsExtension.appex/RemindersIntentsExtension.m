uint64_t sub_10000453C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042038);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042038);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100004788(uint64_t a1, void (*a2)(NSObject *))
{
  uint8_t *v2;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
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
  void **v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  Class isa;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;

  if (qword_100042030 != -1)
    swift_once(&qword_100042030, sub_10000453C);
  v5 = type metadata accessor for Logger(0);
  sub_10000A4A4(v5, (uint64_t)qword_100042038);
  v6 = swift_bridgeObjectRetain_n(a1, 2);
  v7 = Logger.logObject.getter(v6);
  LOBYTE(v8) = static os_log_type_t.default.getter();
  v9 = (unint64_t)a1 >> 62;
  if (!os_log_type_enabled(v7, (os_log_type_t)v8))
  {

    swift_bridgeObjectRelease_n(a1, 2);
    goto LABEL_8;
  }
  v2 = (uint8_t *)swift_slowAlloc(12, -1);
  *(_DWORD *)v2 = 134217984;
  if (v9)
    goto LABEL_40;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease(a1);
    v39 = (_QWORD *)v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v2 + 4, v2 + 12);
    swift_bridgeObjectRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v8, "Search dataSource returned %ld reminders", v2, 0xCu);
    swift_slowDealloc(v2, -1, -1);

LABEL_8:
    if (v9)
    {
      if (a1 < 0)
        v11 = a1;
      else
        v11 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v12 = _CocoaArrayWrapper.endIndex.getter(v11);
      swift_bridgeObjectRelease(a1);
      if (v12 <= 9)
      {
LABEL_10:
        sub_10000A848(0, &qword_100042308, INTask_ptr);
        a1 = static INTask.augmentWithSubtasks(reminders:)(a1);
        goto LABEL_16;
      }
    }
    else if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10) <= 9)
    {
      goto LABEL_10;
    }
    swift_bridgeObjectRetain(a1);
LABEL_16:
    if ((unint64_t)a1 >> 62)
    {
      if (a1 < 0)
        v25 = a1;
      else
        v25 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v8 = _CocoaArrayWrapper.endIndex.getter(v25);
      swift_bridgeObjectRelease(a1);
      if (!v8)
      {
LABEL_30:
        swift_bridgeObjectRelease(a1);
        v24 = _swiftEmptyArrayStorage;
        goto LABEL_31;
      }
    }
    else
    {
      v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v8)
        goto LABEL_30;
    }
    v39 = _swiftEmptyArrayStorage;
    v7 = &v39;
    specialized ContiguousArray.reserveCapacity(_:)(v8);
    if ((v8 & 0x8000000000000000) == 0)
      break;
    __break(1u);
LABEL_40:
    if (a1 < 0)
      v37 = a1;
    else
      v37 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v10 = _CocoaArrayWrapper.endIndex.getter(v37);
    swift_bridgeObjectRelease(a1);
  }
  sub_10000A848(0, &qword_100042308, INTask_ptr);
  if ((a1 & 0xC000000000000001) != 0)
  {
    v13 = 0;
    do
    {
      v14 = v13 + 1;
      v15 = specialized _ArrayBuffer._getElementSlowPath(_:)(v13, a1);
      v16 = INTask.init(reminder:)(v15);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v16);
      v17 = v39[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
      v18 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v16);
      specialized ContiguousArray._endMutation()(v18);
      v13 = v14;
    }
    while (v8 != v14);
  }
  else
  {
    v19 = (void **)(a1 + 32);
    do
    {
      v20 = *v19++;
      v21 = INTask.init(reminder:)(v20);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v21);
      v22 = v39[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v22);
      v23 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v21);
      specialized ContiguousArray._endMutation()(v23);
      --v8;
    }
    while (v8);
  }
  v24 = v39;
  swift_bridgeObjectRelease(a1);
LABEL_31:
  v26 = objc_msgSend(objc_allocWithZone((Class)INSearchForNotebookItemsIntentResponse), "initWithCode:userActivity:", 3, 0);
  v27 = sub_10000A848(0, &qword_100042308, INTask_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v24);
  objc_msgSend(v26, "setTasks:", isa);

  v29 = v26;
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v32 = 134217984;
    v33 = -[NSObject tasks](v29, "tasks");
    if (v33)
    {
      v34 = v33;
      v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v33, v27);

      if ((unint64_t)v35 >> 62)
      {
        if (v35 < 0)
          v38 = v35;
        else
          v38 = v35 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v35);
        v36 = _CocoaArrayWrapper.endIndex.getter(v38);

        swift_bridgeObjectRelease_n(v35, 2);
      }
      else
      {
        v36 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);

        swift_bridgeObjectRelease(v35);
      }
    }
    else
    {

      v36 = -1;
    }
    v39 = (_QWORD *)v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v32 + 4, v32 + 12);

    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Return success search result {tasksCount: %ld}", v32, 0xCu);
    swift_slowDealloc(v32, -1, -1);
  }
  else
  {

    v30 = v29;
  }

  a2(v29);
}

void sub_100004CA4(uint64_t a1, void *a2, void (*a3)(NSObject *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  Class isa;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  char v38[8];
  char v39[16];

  v5 = REMSiriSearchDataView.ListsResult.lists.getter();
  v6 = REMSiriSearchDataView.ListsResult.smartLists.getter();
  if (qword_100042030 != -1)
    swift_once(&qword_100042030, sub_10000453C);
  v7 = type metadata accessor for Logger(0);
  sub_10000A4A4(v7, (uint64_t)qword_100042038);
  v8 = swift_bridgeObjectRetain_n(v5, 2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v11 = 134217984;
    if ((unint64_t)v5 >> 62)
    {
      if (v5 < 0)
        v34 = v5;
      else
        v34 = v5 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v5);
      v12 = _CocoaArrayWrapper.endIndex.getter(v34);
      swift_bridgeObjectRelease(v5);
    }
    else
    {
      v12 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v5);
    v37 = (_QWORD *)v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Search dataSource returned %ld lists", v11, 0xCu);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v5, 2);
  }
  v13 = swift_bridgeObjectRetain_n(v6, 2);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v16 = 134217984;
    if ((unint64_t)v6 >> 62)
    {
      if (v6 < 0)
        v35 = v6;
      else
        v35 = v6 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v6);
      v17 = _CocoaArrayWrapper.endIndex.getter(v35);
      swift_bridgeObjectRelease(v6);
    }
    else
    {
      v17 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v6);
    v37 = (_QWORD *)v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Search dataSource returned %ld smartLists", v16, 0xCu);
    swift_slowDealloc(v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v6, 2);
  }
  v18 = a2;
  v19 = sub_10000A69C(v5, (uint64_t)v18, (uint64_t)v39, (void (*)(uint64_t *__return_ptr, id *, uint64_t))sub_10000517C);
  swift_bridgeObjectRelease(v5);

  v20 = v18;
  v21 = sub_10000A69C(v6, (uint64_t)v20, (uint64_t)v38, (void (*)(uint64_t *__return_ptr, id *, uint64_t))sub_10000557C);
  swift_bridgeObjectRelease(v6);

  v22 = objc_msgSend(objc_allocWithZone((Class)INSearchForNotebookItemsIntentResponse), "initWithCode:userActivity:", 3, 0);
  v37 = v19;
  sub_10000DEDC((uint64_t)v21);
  v23 = v37;
  v24 = sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  objc_msgSend(v22, "setTaskLists:", isa);

  v26 = v22;
  v27 = Logger.logObject.getter(v26);
  v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v29 = 134217984;
    v30 = -[NSObject taskLists](v26, "taskLists");
    if (v30)
    {
      v31 = v30;
      v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v30, v24);

      if ((unint64_t)v32 >> 62)
      {
        if (v32 < 0)
          v36 = v32;
        else
          v36 = v32 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v32);
        v33 = _CocoaArrayWrapper.endIndex.getter(v36);

        swift_bridgeObjectRelease_n(v32, 2);
      }
      else
      {
        v33 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10);

        swift_bridgeObjectRelease(v32);
      }
    }
    else
    {

      v33 = -1;
    }
    v37 = (_QWORD *)v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v29 + 4, v29 + 12);

    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Return success search result {taskListsCount: %ld}", v29, 0xCu);
    swift_slowDealloc(v29, -1, -1);
  }
  else
  {

    v27 = v26;
  }

  a3(v26);
}

uint64_t sub_10000517C@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[3];
  char v38[8];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = *a1;
  v5 = sub_10000A430(&qword_1000425A0);
  v6 = type metadata accessor for REMSearchCriterion(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 72);
  v9 = *(unsigned __int8 *)(v7 + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject(v5, v10 + 2 * v8, v9 | 7);
  *(_OWORD *)(v11 + 16) = xmmword_100034870;
  v12 = (_QWORD *)(v11 + v10);
  v13 = (char *)v12 + *(int *)(sub_10000A430(&qword_100042320) + 48);
  *v12 = objc_msgSend(v4, "objectID");
  v14 = enum case for REMSearchCriterion.Inclusion.includeForSiri(_:);
  v15 = type metadata accessor for REMSearchCriterion.Inclusion(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  v16 = *(void (**)(void))(v7 + 104);
  ((void (*)(_QWORD *, _QWORD, uint64_t))v16)(v12, enum case for REMSearchCriterion.listID(_:), v6);
  *((_BYTE *)v12 + v8) = 0;
  v16();
  type metadata accessor for REMSiriSearchDataView(0);
  v17 = v34;
  v18 = static REMSiriSearchDataView.fetchReminders(store:criteria:diffingAgainst:)(*(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_store), v11, 0);
  if (v34)
  {
    swift_bridgeObjectRelease(v11);
    if (qword_100042030 != -1)
      swift_once(&qword_100042030, sub_10000453C);
    v19 = type metadata accessor for Logger(0);
    sub_10000A4A4(v19, (uint64_t)qword_100042038);
    swift_errorRetain();
    v20 = v4;
    v21 = swift_errorRetain();
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc(22, -1);
      v25 = (_QWORD *)swift_slowAlloc(8, -1);
      v35 = swift_slowAlloc(32, -1);
      v41 = v35;
      *(_DWORD *)v24 = 138412546;
      v26 = objc_msgSend(v20, "objectID");
      v39 = (uint64_t)v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v24 + 4, v24 + 12);
      *v25 = v26;

      *(_WORD *)(v24 + 12) = 2080;
      swift_getErrorValue(v17, v38, v37);
      v27 = Error.localizedDescription.getter(v37[1], v37[2]);
      v29 = v28;
      v39 = sub_10002CB54(v27, v28, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v24 + 14, v24 + 22);
      swift_bridgeObjectRelease(v29);
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Error fetching reminders for list {listID: %@, error: %s", (uint8_t *)v24, 0x16u);
      v30 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v25, 1, v30);
      swift_slowDealloc(v25, -1, -1);
      swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }

    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    v33 = INTaskList.init(list:includeReminders:)(v20, 0);
    result = swift_errorRelease();
  }
  else
  {
    v31 = v18;
    swift_bridgeObjectRelease(v11);
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    result = INTaskList.init(list:reminders:)(v4, v31);
    v33 = result;
  }
  *a3 = v33;
  return result;
}

uint64_t sub_10000557C@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD v25[3];
  _BYTE v26[8];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = *a1;
  type metadata accessor for REMSiriSearchDataView(0);
  v7 = static REMSiriSearchDataView.fetchReminders(store:inCustomSmartList:diffingAgainst:)(*(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_store), v6, 0);
  if (v3)
  {
    if (qword_100042030 != -1)
      swift_once(&qword_100042030, sub_10000453C);
    v8 = type metadata accessor for Logger(0);
    sub_10000A4A4(v8, (uint64_t)qword_100042038);
    swift_errorRetain();
    v9 = v6;
    v10 = swift_errorRetain();
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc(22, -1);
      v14 = (_QWORD *)swift_slowAlloc(8, -1);
      v23 = swift_slowAlloc(32, -1);
      v29 = v23;
      *(_DWORD *)v13 = 138412546;
      v24 = a3;
      v15 = objc_msgSend(v9, "objectID");
      v27 = (uint64_t)v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v13 + 4, v13 + 12);
      *v14 = v15;

      *(_WORD *)(v13 + 12) = 2080;
      swift_getErrorValue(v3, v26, v25);
      v16 = Error.localizedDescription.getter(v25[1], v25[2]);
      v18 = v17;
      v27 = sub_10002CB54(v16, v17, &v29);
      a3 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v13 + 14, v13 + 22);
      swift_bridgeObjectRelease(v18);
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error fetching reminders for smartList {smartListID: %@, error: %s", (uint8_t *)v13, 0x16u);
      v19 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v14, 1, v19);
      swift_slowDealloc(v14, -1, -1);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v13, -1, -1);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }

    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    v22 = INTaskList.init(smartList:reminders:)(v9, _swiftEmptyArrayStorage);
    result = swift_errorRelease();
  }
  else
  {
    v20 = v7;
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    result = INTaskList.init(smartList:reminders:)(v6, v20);
    v22 = result;
  }
  *a3 = v22;
  return result;
}

void sub_10000589C(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
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

id sub_100005944()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSearchForNotebookItemsIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id variable initialization expression of TTRIntentHandler.store()
{
  return objc_msgSend(objc_allocWithZone((Class)REMStore), "initUserInteractive:", 1);
}

uint64_t variable initialization expression of TTRIntentHandler.queue()
{
  sub_10000A848(0, (unint64_t *)&qword_1000420C0, OS_dispatch_queue_ptr);
  return static OS_dispatch_queue.main.getter();
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_contactStore()
{
  return 0;
}

uint64_t type metadata accessor for TTRSearchForNotebookItemsIntentHandler()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler);
}

__n128 initializeWithTake for TTRContactRepresentationResolver(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005A64(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100005A84(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_10000A8C8(a1, (unint64_t *)&unk_100042290, (uint64_t)&unk_10003D170);
}

void sub_100005AC0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100005ACC(uint64_t a1, uint64_t a2)
{
  return sub_100005D84(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005AD8(uint64_t a1, id *a2)
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

uint64_t sub_100005B4C(uint64_t a1, id *a2)
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

uint64_t sub_100005BC8@<X0>(_QWORD *a1@<X8>)
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

uint64_t sub_100005C08(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_100005C90@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100005CA0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100005CE4@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005D0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10000A954(&qword_100042360, (uint64_t)&unk_1000349E0);
  v3 = sub_10000A954(&qword_100042368, (uint64_t)&unk_100034988);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005D78(uint64_t a1, uint64_t a2)
{
  return sub_100005D84(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005D84(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100005DC0(uint64_t a1)
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

Swift::Int sub_100005E00(uint64_t a1)
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

void sub_100005E70(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSObject **v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (**v33)(_QWORD, _QWORD);
  NSObject *v34;
  uint64_t v35;

  v6 = type metadata accessor for Logger(0);
  v29 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v32 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100042030 != -1)
    swift_once(&qword_100042030, sub_10000453C);
  v30 = v6;
  v8 = sub_10000A4A4(v6, (uint64_t)qword_100042038);
  v9 = a1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v31 = v8;
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(8, -1);
    v33 = a3;
    v34 = v9;
    v14 = (_QWORD *)v13;
    *(_DWORD *)v12 = 138412290;
    v15 = v9;
    v8 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v12 + 4, v12 + 12);
    *v14 = v9;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "SiriKit asked for resolving itemType {intent: %@}", v12, 0xCu);
    v16 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v14, 1, v16);
    v17 = v14;
    a3 = v33;
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

  }
  switch((unint64_t)-[NSObject itemType](v9, "itemType"))
  {
    case 0uLL:
    case 3uLL:
      goto LABEL_7;
    case 1uLL:
      v19 = sub_10000A848(0, &qword_100042330, INNotebookItemTypeResolutionResult_ptr);
      v18 = objc_msgSend((id)swift_getObjCClassFromMetadata(v19), "unsupported");
      goto LABEL_9;
    case 2uLL:
      if ((INSearchForNotebookItemsIntent.isTodayQuery(timeProvider:)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider) & 1) != 0)
LABEL_7:
        v18 = objc_msgSend((id)objc_opt_self(INNotebookItemTypeResolutionResult), "successWithResolvedNotebookItemType:", 3);
      else
        v18 = objc_msgSend((id)objc_opt_self(INNotebookItemTypeResolutionResult), "successWithResolvedNotebookItemType:", 2);
LABEL_9:
      v20 = v18;
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc(12, -1);
        v24 = (NSObject **)swift_slowAlloc(8, -1);
        *(_DWORD *)v23 = 138412290;
        v34 = v20;
        v25 = v20;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v23 + 4, v23 + 12);
        *v24 = v20;

        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Resolved itemType {result: %@}", v23, 0xCu);
        v26 = sub_10000A430((uint64_t *)&unk_1000422E0);
        swift_arrayDestroy(v24, 1, v26);
        swift_slowDealloc(v24, -1, -1);
        swift_slowDealloc(v23, -1, -1);
      }
      else
      {

        v21 = v20;
      }

      ((void (**)(_QWORD, NSObject *))a3)[2](a3, v20);
      return;
    default:
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v32, v8, v30);
      v27 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
      v28 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
      _Block_release(a3);
      sub_100028360((uint64_t)"unknown item type", 17, 2uLL, v27, v28);
      __break(1u);
      JUMPOUT(0x100006294);
  }
}

uint64_t sub_1000062A4(void *a1, char *a2, const void *a3)
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
  uint64_t v90;
  uint64_t v91;
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
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
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
  uint64_t v126;
  uint64_t v127;
  _BYTE *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t inited;
  id v133;
  unint64_t v134;
  void (*v135)(_BYTE *, uint64_t);
  NSObject *v136;
  NSObject *v137;
  os_log_type_t v138;
  _BOOL4 v139;
  uint8_t *v140;
  NSObject **v141;
  NSObject *v142;
  uint64_t v143;
  id v144;
  void *v145;
  id v146;
  uint64_t v147;
  objc_class *v148;
  objc_class *v149;
  id v150;
  void *v151;
  uint64_t v152;
  objc_class *v153;
  objc_class *v154;
  uint64_t v155;
  uint64_t v156;
  NSObject *v157;
  unint64_t v158;
  unint64_t isa;
  NSObject *v160;
  unint64_t v161;
  unint64_t v162;
  NSObject *v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t *v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  void (*v174)(char *, uint64_t, uint64_t);
  uint64_t v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  uint64_t v180;
  void (*v181)(unint64_t, uint64_t *, uint64_t);
  uint64_t v182;
  uint64_t *v183;
  char *v184;
  uint64_t v185;
  void (*v186)(_BYTE *, _QWORD, uint64_t);
  unint64_t v187;
  unint64_t v188;
  unint64_t v189;
  id v190;
  void *v191;
  id v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t *v199;
  unint64_t v200;
  unint64_t v201;
  id v202;
  void *v203;
  uint64_t v204;
  unint64_t v205;
  unint64_t v206;
  uint64_t v207;
  unsigned int (**v208)(_QWORD, _QWORD, _QWORD);
  unint64_t v209;
  uint64_t v210;
  NSObject *v211;
  os_log_type_t v212;
  uint8_t *v213;
  NSObject *v214;
  uint64_t v215;
  char *v216;
  NSObject *v217;
  os_log_type_t v218;
  NSObject *v219;
  uint8_t *v220;
  uint64_t v221;
  _BYTE *v222;
  uint64_t (*v223)(_BYTE *, _BYTE *, unint64_t);
  _BYTE *v224;
  uint64_t v225;
  NSObject *v226;
  os_log_type_t v227;
  uint8_t *v228;
  uint64_t v229;
  _BYTE *v230;
  uint64_t v231;
  unint64_t v232;
  unint64_t v233;
  void (*v234)(_BYTE *, unint64_t);
  _BYTE *v235;
  uint64_t v236;
  BOOL *v237;
  unint64_t v238;
  unint64_t v239;
  unint64_t v240;
  void (*v241)(BOOL *, BOOL *, uint64_t);
  id v242;
  void *v243;
  id v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t *v249;
  char *v250;
  uint64_t v251;
  uint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  void (*v256)(void);
  BOOL *v257;
  NSObject *v258;
  unsigned __int8 v259;
  unsigned __int8 v260;
  BOOL v261;
  NSObject *v262;
  unsigned __int8 v263;
  BOOL *v264;
  uint64_t v265;
  uint64_t v266;
  void (*v267)(void);
  unint64_t v268;
  unint64_t v269;
  unint64_t v270;
  uint64_t v271;
  id v272;
  void *v273;
  id v274;
  void *v275;
  uint64_t v276;
  uint64_t v277;
  _BYTE *v278;
  id v279;
  void *v280;
  void (*v281)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v282;
  _BYTE *v283;
  unsigned int (*v284)(_BYTE *, uint64_t, uint64_t);
  uint64_t v285;
  uint64_t v286;
  id v287;
  void *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  _BYTE *v292;
  _BYTE *v293;
  _BYTE *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  _BYTE *v298;
  unsigned int (*v299)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v300;
  uint64_t v301;
  uint64_t v302;
  _BYTE *v303;
  _BYTE *v304;
  uint64_t v305;
  uint64_t *v306;
  int v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  unint64_t v311;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v313;
  unint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t *v319;
  unint64_t v320;
  unint64_t v321;
  NSObject *v322;
  os_log_type_t v323;
  uint8_t *v324;
  uint64_t v325;
  uint64_t v326;
  unint64_t v327;
  uint64_t v328;
  _BYTE *v329;
  uint64_t v330;
  unsigned int v331;
  _BYTE *v332;
  uint64_t v333;
  uint64_t v334;
  void (*v335)(uint64_t, uint64_t);
  uint64_t v336;
  uint64_t v337;
  uint64_t (*v338)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v339;
  uint64_t v340;
  _BYTE *v341;
  uint64_t v342;
  uint64_t v343;
  _BYTE *v344;
  uint64_t v345;
  uint64_t v346;
  void (*v347)(_BYTE *, uint64_t);
  uint64_t v348;
  _BYTE *v349;
  _BYTE *v350;
  _BYTE *v351;
  _BYTE *v352;
  _BYTE *v353;
  void (*v354)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v355;
  uint64_t v356;
  _BYTE *v357;
  uint64_t v358;
  uint64_t (*v359)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v360;
  _BYTE *v361;
  uint64_t v362;
  _BYTE *v363;
  uint64_t v364;
  _BYTE *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  _BYTE *v370;
  unsigned int (*v371)(uint64_t, uint64_t, uint64_t);
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  void (*v376)(_BYTE *, uint64_t);
  uint64_t v377;
  void (*v378)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v379;
  _BYTE *v380;
  _BYTE *v381;
  uint64_t v382;
  _BYTE *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  _BYTE *v387;
  uint64_t v388;
  unint64_t v389;
  unint64_t v390;
  BOOL *v391;
  unsigned int v392;
  _BYTE *v393;
  void (*v394)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v395;
  void (*v396)(_BYTE *, _BYTE *, uint64_t);
  char *v397;
  uint64_t v398;
  _BYTE *v399;
  void (*v400)(_BYTE *, uint64_t);
  void (*v401)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v402;
  uint64_t v403;
  void (*v404)(uint64_t, uint64_t);
  uint64_t v405;
  _BYTE *v406;
  uint64_t v407;
  _BYTE *v408;
  _BYTE *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t (*v412)(uint64_t, uint64_t, uint64_t);
  uint64_t v413;
  _BYTE *v414;
  _BYTE *v415;
  uint64_t v416;
  int v417;
  id v418;
  _BYTE *v419;
  id v420;
  void (*v421)(_BYTE *, uint64_t);
  uint64_t v422;
  _BYTE *v423;
  uint64_t v424;
  _BYTE *v425;
  _BYTE *v426;
  uint64_t v427;
  uint64_t v428;
  void (*v429)(_BYTE *, _BYTE *, uint64_t);
  void (*v430)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v431;
  unint64_t v432;
  unint64_t v433;
  unint64_t v434;
  void (*v435)(BOOL *, _BYTE *, uint64_t);
  BOOL *v436;
  uint64_t v437;
  uint64_t v438;
  _BYTE *v439;
  _BYTE *v440;
  _BYTE *v441;
  uint64_t v442;
  unint64_t v443;
  unint64_t v444;
  unint64_t v445;
  BOOL *v446;
  uint64_t *v447;
  uint64_t v448;
  _BYTE *v449;
  uint64_t v450;
  _BYTE *v451;
  _BYTE *v452;
  void (*v453)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v454;
  uint64_t v455;
  void (*v456)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v457;
  unint64_t v458;
  unint64_t v459;
  unint64_t v460;
  BOOL *v461;
  uint64_t v462;
  uint64_t v463;
  _BYTE *v464;
  _BYTE *v465;
  unint64_t v466;
  unint64_t v467;
  uint64_t v468;
  int v469;
  uint64_t v470;
  uint64_t v471;
  _BYTE *v472;
  _BYTE *v473;
  void (*v474)(_BYTE *, _BYTE *, uint64_t);
  void (*v475)(_BYTE *, _QWORD, uint64_t, uint64_t);
  unint64_t v476;
  unint64_t v477;
  unint64_t v478;
  void (*v479)(BOOL *, _BYTE *, uint64_t);
  void (*v480)(_BYTE *, uint64_t);
  void (*v481)(BOOL *, _BYTE *, uint64_t);
  uint64_t v482;
  _BYTE *v483;
  _BYTE *v484;
  void (*v485)(_BYTE *, _BYTE *, uint64_t);
  void (*v486)(_BYTE *, _QWORD, uint64_t, uint64_t);
  unint64_t v487;
  unint64_t v488;
  unint64_t v489;
  void (*v490)(_BYTE *, uint64_t);
  _BYTE *v491;
  uint64_t v492;
  void (*v493)(BOOL *, _BYTE *, uint64_t);
  _BYTE *v494;
  _BYTE *v495;
  unint64_t v496;
  unint64_t v497;
  unint64_t v498;
  id v499;
  uint64_t v500;
  void (*v501)(void);
  unint64_t v502;
  unint64_t v503;
  unint64_t v504;
  BOOL *v505;
  char *v506;
  unint64_t v507;
  unint64_t v508;
  id v509;
  NSObject *v510;
  os_log_type_t v511;
  uint8_t *v512;
  uint64_t v513;
  uint64_t v514;
  _QWORD *v515;
  uint64_t v516;
  uint64_t v517;
  unint64_t v518;
  unint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  _QWORD *v523;
  _QWORD *v524;
  void (*v525)(_QWORD *, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  void (*v526)(uint64_t);
  NSObject *v527;
  os_log_type_t v528;
  uint8_t *v529;
  uint64_t v530;
  uint64_t v531;
  _QWORD *v532;
  uint64_t v533;
  uint64_t v534;
  unint64_t v535;
  unint64_t v536;
  uint64_t v537;
  void *v538;
  id v539;
  NSObject *v540;
  os_log_type_t v541;
  uint8_t *v542;
  id v543;
  _QWORD *v544;
  void (*v546)(_BYTE *, uint64_t);
  unint64_t v547;
  const char *v548;
  uint64_t v549;
  _BYTE v550[4];
  unsigned int v551;
  uint64_t v552;
  void (*v553)(uint64_t *, _QWORD, uint64_t);
  _BYTE *v554;
  void (*v555)(_BYTE *, uint64_t, uint64_t);
  uint64_t v556;
  _BYTE *v557;
  _BYTE *v558;
  _BYTE *v559;
  _BYTE *v560;
  _BYTE *v561;
  _BYTE *v562;
  uint64_t v563;
  _BYTE *v564;
  _BYTE *v565;
  _BYTE *v566;
  uint64_t v567;
  _BYTE *v568;
  _BYTE *v569;
  _BYTE *v570;
  _BYTE *v571;
  _BYTE *v572;
  uint64_t *v573;
  _BYTE *v574;
  _BYTE *v575;
  uint64_t *v576;
  NSObject **v577;
  uint64_t *v578;
  _BYTE *v579;
  _BYTE *v580;
  _BYTE *v581;
  _BYTE *v582;
  _BYTE *v583;
  _BYTE *v584;
  _BYTE *v585;
  _BYTE *v586;
  _BYTE *v587;
  _BYTE *v588;
  _BYTE *v589;
  _BYTE *v590;
  const void *v591;
  _BYTE *v592;
  _BYTE *v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t *v596;
  _BYTE *v597;
  _BYTE *v598;
  void (*v599)(void);
  _BYTE *v600;
  _BYTE *v601;
  _BYTE *v602;
  _BYTE *v603;
  _BYTE *v604;
  _BYTE *v605;
  _BYTE *v606;
  _BYTE *v607;
  _BYTE *v608;
  _BYTE *v609;
  _BYTE *v610;
  _BYTE *v611;
  BOOL *v612;
  unsigned int (**v613)(_QWORD, _QWORD, _QWORD);
  _BYTE *v614;
  _BYTE *v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  void (*v624)(BOOL *, BOOL *, uint64_t);
  BOOL *v625;
  char *v626;
  _BYTE *v627;
  _BYTE *v628;
  _BYTE *v629;
  uint64_t *v630;
  BOOL *v631;
  _QWORD *v632;
  _BYTE *v633;
  _BYTE *v634;
  uint64_t v635;
  NSObject *v636;
  uint64_t v637;
  char v638[8];
  char v639;
  char v640;
  char v641[8];
  uint64_t v642;
  uint64_t v643;
  char v644[8];
  NSObject *v645;
  char v646[8];
  _QWORD *v647;
  _QWORD *v648;
  char v649[8];

  v626 = a2;
  v595 = type metadata accessor for Calendar.Component(0);
  v594 = *(_QWORD *)(v595 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v593 = &v550[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000A430(&qword_100042800);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v589 = &v550[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __chkstk_darwin(v6);
  v590 = &v550[-v9];
  v10 = __chkstk_darwin(v8);
  v561 = &v550[-v11];
  v12 = __chkstk_darwin(v10);
  v562 = &v550[-v13];
  v14 = __chkstk_darwin(v12);
  v569 = &v550[-v15];
  v16 = __chkstk_darwin(v14);
  v570 = &v550[-v17];
  __chkstk_darwin(v16);
  v583 = &v550[-v18];
  v616 = type metadata accessor for DateComponents(0);
  v618 = *(_QWORD *)(v616 - 8);
  v19 = __chkstk_darwin(v616);
  v592 = &v550[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = __chkstk_darwin(v19);
  v584 = &v550[-v22];
  __chkstk_darwin(v21);
  v582 = &v550[-v23];
  v623 = type metadata accessor for Date(0);
  v24 = *(_QWORD *)(v623 - 8);
  v25 = __chkstk_darwin(v623);
  v588 = &v550[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v27 = __chkstk_darwin(v25);
  v585 = &v550[-v28];
  v29 = __chkstk_darwin(v27);
  v560 = &v550[-v30];
  v31 = __chkstk_darwin(v29);
  v568 = &v550[-v32];
  v33 = __chkstk_darwin(v31);
  v559 = &v550[-v34];
  v35 = __chkstk_darwin(v33);
  v608 = &v550[-v36];
  v37 = __chkstk_darwin(v35);
  v581 = &v550[-v38];
  v39 = __chkstk_darwin(v37);
  v628 = &v550[-v40];
  __chkstk_darwin(v39);
  v633 = &v550[-v41];
  v42 = sub_10000A430((uint64_t *)&unk_1000422A0);
  v43 = __chkstk_darwin(v42);
  v580 = &v550[-((v44 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v43);
  v614 = &v550[-v45];
  v622 = type metadata accessor for Calendar(0);
  v620 = *(_QWORD *)(v622 - 8);
  __chkstk_darwin(v622);
  v627 = &v550[-((v46 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v47 = sub_10000A430((uint64_t *)&unk_100042540);
  v48 = __chkstk_darwin(v47);
  v607 = &v550[-((v49 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v50 = __chkstk_darwin(v48);
  v606 = &v550[-v51];
  v52 = __chkstk_darwin(v50);
  v579 = &v550[-v53];
  v54 = __chkstk_darwin(v52);
  v605 = &v550[-v55];
  v56 = __chkstk_darwin(v54);
  v604 = &v550[-v57];
  v58 = __chkstk_darwin(v56);
  v602 = &v550[-v59];
  v60 = __chkstk_darwin(v58);
  v603 = &v550[-v61];
  v62 = __chkstk_darwin(v60);
  v634 = &v550[-v63];
  v64 = __chkstk_darwin(v62);
  v600 = &v550[-v65];
  v66 = __chkstk_darwin(v64);
  v601 = &v550[-v67];
  __chkstk_darwin(v66);
  v629 = &v550[-v68];
  v567 = sub_10000A430(&qword_1000422B0);
  v69 = __chkstk_darwin(v567);
  v615 = &v550[-((v70 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v71 = __chkstk_darwin(v69);
  v609 = &v550[-v72];
  v73 = __chkstk_darwin(v71);
  v625 = &v550[-v74];
  __chkstk_darwin(v73);
  v566 = &v550[-v75];
  v76 = sub_10000A430(&qword_1000422B8);
  __chkstk_darwin(v76);
  v599 = (void (*)(void))&v550[-((v77 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v632 = (_QWORD *)type metadata accessor for REMNotificationIdentifier(0);
  v613 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))*(v632 - 1);
  v78 = __chkstk_darwin(v632);
  v578 = (uint64_t *)&v550[-((v79 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v80 = __chkstk_darwin(v78);
  v565 = &v550[-v81];
  v82 = __chkstk_darwin(v80);
  v575 = &v550[-v83];
  __chkstk_darwin(v82);
  v624 = &v550[-v84];
  v85 = type metadata accessor for REMSearchCriterion(0);
  v635 = *(_QWORD *)(v85 - 8);
  v86 = __chkstk_darwin(v85);
  v612 = &v550[-((v87 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v88 = __chkstk_darwin(v86);
  v587 = &v550[-v89];
  v90 = __chkstk_darwin(v88);
  v586 = &v550[-v91];
  v92 = __chkstk_darwin(v90);
  v574 = &v550[-v93];
  v94 = __chkstk_darwin(v92);
  v611 = &v550[-v95];
  v96 = __chkstk_darwin(v94);
  v610 = &v550[-v97];
  v98 = __chkstk_darwin(v96);
  v597 = &v550[-v99];
  v100 = __chkstk_darwin(v98);
  v598 = &v550[-v101];
  v102 = __chkstk_darwin(v100);
  v558 = &v550[-v103];
  v104 = __chkstk_darwin(v102);
  v572 = &v550[-v105];
  v106 = __chkstk_darwin(v104);
  v571 = &v550[-v107];
  v108 = __chkstk_darwin(v106);
  v573 = (uint64_t *)&v550[-v109];
  v110 = __chkstk_darwin(v108);
  v631 = &v550[-v111];
  v112 = __chkstk_darwin(v110);
  v576 = (uint64_t *)&v550[-v113];
  v114 = __chkstk_darwin(v112);
  v577 = (NSObject **)&v550[-v115];
  v116 = __chkstk_darwin(v114);
  v564 = &v550[-v117];
  v118 = __chkstk_darwin(v116);
  v596 = (uint64_t *)&v550[-v119];
  __chkstk_darwin(v118);
  v630 = (uint64_t *)&v550[-v120];
  v121 = type metadata accessor for Logger(0);
  v122 = *(_QWORD *)(v121 - 8);
  v123 = __chkstk_darwin(v121);
  v557 = &v550[-((v124 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v125 = __chkstk_darwin(v123);
  v554 = &v550[-v126];
  __chkstk_darwin(v125);
  v128 = &v550[-v127];
  v129 = swift_allocObject(&unk_10003D198, 24, 7);
  *(_QWORD *)(v129 + 16) = a3;
  _Block_copy(a3);
  if (qword_100042030 != -1)
    swift_once(&qword_100042030, sub_10000453C);
  v130 = sub_10000A4A4(v121, (uint64_t)qword_100042038);
  v555 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v122 + 16);
  v555(v128, v130, v121);
  v131 = sub_10000A430(&qword_1000422C0);
  inited = swift_initStackObject(v131, v649);
  *(_OWORD *)(inited + 16) = xmmword_100034880;
  *(_QWORD *)(inited + 32) = 0x746E65746E69;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = sub_10000A848(0, &qword_1000422C8, INSearchForNotebookItemsIntent_ptr);
  *(_QWORD *)(inited + 48) = a1;
  v133 = a1;
  v134 = sub_10001C784(inited);
  sub_1000285E0((uint64_t)"Search task via Siri {intent: %@}", 33, 2, v134);
  swift_bridgeObjectRelease(v134);
  v135 = *(void (**)(_BYTE *, uint64_t))(v122 + 8);
  v556 = v121;
  v135(v128, v121);
  v136 = v133;
  v137 = Logger.logObject.getter(v136);
  v138 = static os_log_type_t.default.getter();
  v139 = os_log_type_enabled(v137, v138);
  v619 = v129;
  v637 = v85;
  v617 = v24;
  v591 = a3;
  if (v139)
  {
    v140 = (uint8_t *)swift_slowAlloc(12, -1);
    v141 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v140 = 138412290;
    v645 = v136;
    v142 = v136;
    v85 = v637;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v645, v646, v140 + 4, v140 + 12);
    *v141 = v136;

    _os_log_impl((void *)&_mh_execute_header, v137, v138, "SiriKit asked for handling search {intent: %@}", v140, 0xCu);
    v143 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v141, 1, v143);
    swift_slowDealloc(v141, -1, -1);
    swift_slowDealloc(v140, -1, -1);
  }
  else
  {

    v137 = v136;
  }

  v647 = _swiftEmptyArrayStorage;
  v648 = _swiftEmptyArrayStorage;
  v144 = -[NSObject title](v136, "title");
  if (v144)
  {
    v145 = v144;
    v146 = objc_msgSend(v144, "spokenPhrase");

    v147 = static String._unconditionallyBridgeFromObjectiveC(_:)(v146);
    v149 = v148;

  }
  else
  {
    v147 = 0;
    v149 = 0;
  }
  v150 = -[NSObject content](v136, "content");
  if (v150)
  {
    v151 = v150;
    v152 = static String._unconditionallyBridgeFromObjectiveC(_:)(v150);
    v154 = v153;

  }
  else
  {
    v152 = 0;
    v154 = 0;
  }
  v621 = v130;
  v636 = v136;
  if (!((unint64_t)v149 | (unint64_t)v154))
    goto LABEL_41;
  v155 = sub_10000A430(&qword_1000422F0);
  v156 = swift_initStackObject(v155, v638);
  *(_OWORD *)(v156 + 16) = xmmword_100034870;
  *(_QWORD *)(v156 + 32) = v147;
  *(_QWORD *)(v156 + 40) = v149;
  *(_QWORD *)(v156 + 48) = v152;
  *(_QWORD *)(v156 + 56) = v154;
  if (!v149)
  {
    v157 = _swiftEmptyArrayStorage;
    if (!v154)
      goto LABEL_24;
    goto LABEL_19;
  }
  swift_bridgeObjectRetain(v149);
  v157 = sub_10002C828(0, 1, 1, _swiftEmptyArrayStorage);
  isa = (unint64_t)v157[2].isa;
  v158 = (unint64_t)v157[3].isa;
  if (isa >= v158 >> 1)
    v157 = sub_10002C828((_QWORD *)(v158 > 1), isa + 1, 1, v157);
  v157[2].isa = (Class)(isa + 1);
  v160 = &v157[2 * isa];
  v160[4].isa = (Class)v147;
  v160[5].isa = v149;
  if (v154)
  {
LABEL_19:
    swift_bridgeObjectRetain(v154);
    if ((swift_isUniquelyReferenced_nonNull_native(v157) & 1) == 0)
      v157 = sub_10002C828(0, (int64_t)v157[2].isa + 1, 1, v157);
    v162 = (unint64_t)v157[2].isa;
    v161 = (unint64_t)v157[3].isa;
    if (v162 >= v161 >> 1)
      v157 = sub_10002C828((_QWORD *)(v161 > 1), v162 + 1, 1, v157);
    v157[2].isa = (Class)(v162 + 1);
    v163 = &v157[2 * v162];
    v163[4].isa = (Class)v152;
    v163[5].isa = v154;
  }
LABEL_24:
  swift_release(v156);
  v645 = v157;
  v164 = sub_10000A430(&qword_1000422F8);
  v165 = sub_10000A60C();
  v166 = BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v164, v165);
  v168 = v167;
  swift_bridgeObjectRelease(v157);
  v169 = sub_10000A430(&qword_1000422D8);
  v170 = v630;
  v171 = (char *)v630 + *(int *)(v169 + 48);
  v552 = v166;
  *v630 = v166;
  v170[1] = v168;
  v172 = enum case for REMStringMatchingStyle.prefix(_:);
  v173 = type metadata accessor for REMStringMatchingStyle(0);
  v174 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v173 - 8) + 104);
  v551 = v172;
  v174(v171, v172, v173);
  v175 = enum case for REMSearchCriterion.textualField(_:);
  v553 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v635 + 104);
  v553(v170, enum case for REMSearchCriterion.textualField(_:), v637);
  v176 = (unint64_t)v648;
  swift_bridgeObjectRetain(v168);
  if ((swift_isUniquelyReferenced_nonNull_native(v176) & 1) == 0)
    v176 = sub_10002C814(0, *(_QWORD *)(v176 + 16) + 1, 1, v176);
  v178 = *(_QWORD *)(v176 + 16);
  v177 = *(_QWORD *)(v176 + 24);
  if (v178 >= v177 >> 1)
    v176 = sub_10002C814(v177 > 1, v178 + 1, 1, v176);
  *(_QWORD *)(v176 + 16) = v178 + 1;
  v179 = (*(unsigned __int8 *)(v635 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v635 + 80);
  v563 = *(_QWORD *)(v635 + 72);
  v180 = v637;
  v181 = *(void (**)(unint64_t, uint64_t *, uint64_t))(v635 + 32);
  v181(v176 + v179 + v563 * v178, v630, v637);
  v648 = (_QWORD *)v176;
  v182 = *(int *)(v169 + 48);
  v183 = v596;
  v184 = (char *)v596 + v182;
  *v596 = v552;
  v183[1] = v168;
  v185 = v173;
  v85 = v180;
  v174(v184, v551, v185);
  v186 = (void (*)(_BYTE *, _QWORD, uint64_t))v553;
  v553(v183, v175, v180);
  v187 = (unint64_t)v647;
  if ((swift_isUniquelyReferenced_nonNull_native(v647) & 1) == 0)
    v187 = sub_10002C814(0, *(_QWORD *)(v187 + 16) + 1, 1, v187);
  v136 = v636;
  v189 = *(_QWORD *)(v187 + 16);
  v188 = *(_QWORD *)(v187 + 24);
  if (v189 >= v188 >> 1)
    v187 = sub_10002C814(v188 > 1, v189 + 1, 1, v187);
  *(_QWORD *)(v187 + 16) = v189 + 1;
  v181(v187 + v179 + v189 * v563, v183, v180);
  v647 = (_QWORD *)v187;
  v190 = -[NSObject title](v136, "title");
  if (v190)
  {
    v191 = v190;
    v192 = objc_msgSend(v190, "vocabularyIdentifier");

    if (v192)
    {
      v193 = static String._unconditionallyBridgeFromObjectiveC(_:)(v192);
      v195 = v194;

      if (v193 == 0xD000000000000011 && v195 == 0x8000000100035200)
      {
        swift_bridgeObjectRelease(0x8000000100035200);
        v136 = v636;
      }
      else
      {
        v196 = _stringCompareWithSmolCheck(_:_:expecting:)(v193, v195, 0xD000000000000011, 0x8000000100035200, 0);
        swift_bridgeObjectRelease(v195);
        v136 = v636;
        if ((v196 & 1) == 0)
          goto LABEL_41;
      }
      v197 = enum case for REMSearchableListType.grocery(_:);
      v198 = type metadata accessor for REMSearchableListType(0);
      v199 = v564;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v198 - 8) + 104))(v564, v197, v198);
      v186((uint64_t *)v199, enum case for REMSearchCriterion.listType(_:), v85);
      v201 = *(_QWORD *)(v187 + 16);
      v200 = *(_QWORD *)(v187 + 24);
      if (v201 >= v200 >> 1)
        v187 = sub_10002C814(v200 > 1, v201 + 1, 1, v187);
      *(_QWORD *)(v187 + 16) = v201 + 1;
      v181(v187 + v179 + v201 * v563, (uint64_t *)v199, v85);
      v647 = (_QWORD *)v187;
    }
  }
LABEL_41:
  v202 = -[NSObject notebookItemIdentifier](v136, "notebookItemIdentifier");
  if (!v202)
  {
    v217 = v136;
    v211 = Logger.logObject.getter(v217);
    v218 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v211, v218))
    {
      v213 = (uint8_t *)swift_slowAlloc(12, -1);
      v214 = swift_slowAlloc(8, -1);
      *(_DWORD *)v213 = 138412290;
      v645 = v217;
      v219 = v217;
      v215 = v637;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v645, v646, v213 + 4, v213 + 12);
      v214->isa = (Class)v217;

      _os_log_impl((void *)&_mh_execute_header, v211, v218, "[Announce Reminders] notebookIdentifier not found in intent: %@", v213, 0xCu);
      v216 = (char *)sub_10000A430((uint64_t *)&unk_1000422E0);
      goto LABEL_47;
    }

LABEL_52:
    v221 = v635;
    v215 = v85;
    goto LABEL_53;
  }
  v203 = v202;
  v204 = static String._unconditionallyBridgeFromObjectiveC(_:)(v202);
  v206 = v205;

  swift_bridgeObjectRetain(v206);
  v207 = (uint64_t)v599;
  REMNotificationIdentifier.init(requestIdentifier:)(v204, v206);
  v208 = v613;
  v209 = (unint64_t)v632;
  if (((unsigned int (**)(uint64_t, uint64_t, _QWORD *))v613)[6](v207, 1, v632) == 1)
  {
    sub_10000A5D0(v207, &qword_1000422B8);
    v210 = swift_bridgeObjectRetain(v206);
    v211 = Logger.logObject.getter(v210);
    v212 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v211, v212))
    {
      v213 = (uint8_t *)swift_slowAlloc(12, -1);
      v214 = swift_slowAlloc(32, -1);
      v645 = v214;
      *(_DWORD *)v213 = 136315138;
      swift_bridgeObjectRetain(v206);
      v643 = sub_10002CB54(v204, v206, (uint64_t *)&v645);
      v215 = v637;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v643, v644, v213 + 4, v213 + 12);
      swift_bridgeObjectRelease_n(v206, 3);
      _os_log_impl((void *)&_mh_execute_header, v211, v212, "[Announce Reminders] Unable to create itemIdentifier from %s", v213, 0xCu);
      v216 = (char *)&type metadata for Any + 8;
LABEL_47:
      swift_arrayDestroy(v214, 1, v216);
      swift_slowDealloc(v214, -1, -1);
      v220 = v213;
      v136 = v636;
      swift_slowDealloc(v220, -1, -1);

      v221 = v635;
LABEL_53:
      v235 = v629;
LABEL_54:
      v236 = v616;
      goto LABEL_55;
    }

    swift_bridgeObjectRelease_n(v206, 2);
    goto LABEL_52;
  }
  swift_bridgeObjectRelease(v206);
  v222 = v624;
  v208[4](v624, v207, v209);
  v223 = (uint64_t (*)(_BYTE *, _BYTE *, unint64_t))v208[2];
  v224 = v575;
  v225 = v223(v575, v222, v209);
  v226 = Logger.logObject.getter(v225);
  v227 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v226, v227))
  {
    v228 = (uint8_t *)swift_slowAlloc(12, -1);
    v229 = swift_slowAlloc(32, -1);
    v645 = v229;
    *(_DWORD *)v228 = 136446210;
    v230 = v565;
    v223(v565, v224, (unint64_t)v632);
    v231 = String.init<A>(describing:)(v230, v632);
    v233 = v232;
    v643 = sub_10002CB54(v231, v232, (uint64_t *)&v645);
    v208 = v613;
    v209 = (unint64_t)v632;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v643, v644, v228 + 4, v228 + 12);
    swift_bridgeObjectRelease(v233);
    v234 = (void (*)(_BYTE *, unint64_t))v208[1];
    v234(v224, v209);
    _os_log_impl((void *)&_mh_execute_header, v226, v227, "[Announce Reminders] requestIdentifier:%{public}s", v228, 0xCu);
    swift_arrayDestroy(v229, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v229, -1, -1);
    swift_slowDealloc(v228, -1, -1);
  }
  else
  {
    v234 = (void (*)(_BYTE *, unint64_t))v208[1];
    v234(v224, v209);
  }

  v221 = v635;
  v306 = v578;
  v223(v578, v624, v209);
  v307 = ((uint64_t (*)(uint64_t *, unint64_t))v208[11])(v306, v209);
  if (v307 == enum case for REMNotificationIdentifier.objectID(_:))
  {
    ((void (*)(uint64_t *, unint64_t))v208[12])(v306, v209);
    v308 = *v306;
    v309 = sub_10000A430(&qword_1000427E0);
    v310 = swift_allocObject(v309, 40, 7);
    *(_OWORD *)(v310 + 16) = xmmword_100034890;
    *(_QWORD *)(v310 + 32) = v308;
    v645 = v310;
    specialized Array._endMutation()(v310);
    *v577 = v645;
    (*(void (**)(void))(v221 + 104))();
    v311 = (unint64_t)v648;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v648);
    v236 = v616;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v311 = sub_10002C814(0, *(_QWORD *)(v311 + 16) + 1, 1, v311);
    v314 = *(_QWORD *)(v311 + 16);
    v313 = *(_QWORD *)(v311 + 24);
    if (v314 >= v313 >> 1)
      v311 = sub_10002C814(v313 > 1, v314 + 1, 1, v311);
    *(_QWORD *)(v311 + 16) = v314 + 1;
    v315 = *(unsigned __int8 *)(v221 + 80);
    v316 = *(_QWORD *)(v221 + 72);
    v317 = (*(uint64_t (**)(unint64_t, NSObject **, uint64_t))(v221 + 32))(v311 + ((v315 + 32) & ~v315) + v316 * v314, v577, v637);
  }
  else
  {
    v236 = v616;
    if (v307 != enum case for REMNotificationIdentifier.daCalendarItemUniqueIdentifier(_:))
      goto LABEL_237;
    ((void (*)(uint64_t *, unint64_t))v208[12])(v306, v209);
    v318 = v306[1];
    v319 = v576;
    *v576 = *v306;
    v319[1] = v318;
    (*(void (**)(void))(v221 + 104))();
    v311 = (unint64_t)v648;
    if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
      v311 = sub_10002C814(0, *(_QWORD *)(v311 + 16) + 1, 1, v311);
    v321 = *(_QWORD *)(v311 + 16);
    v320 = *(_QWORD *)(v311 + 24);
    if (v321 >= v320 >> 1)
      v311 = sub_10002C814(v320 > 1, v321 + 1, 1, v311);
    *(_QWORD *)(v311 + 16) = v321 + 1;
    v315 = *(unsigned __int8 *)(v221 + 80);
    v316 = *(_QWORD *)(v221 + 72);
    v317 = (*(uint64_t (**)(unint64_t, uint64_t *, uint64_t))(v221 + 32))(v311 + ((v315 + 32) & ~v315) + v316 * v321, v576, v637);
  }
  v648 = (_QWORD *)v311;
  v322 = Logger.logObject.getter(v317);
  v323 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v322, v323))
  {
    v324 = (uint8_t *)swift_slowAlloc(12, -1);
    v325 = swift_slowAlloc(32, -1);
    v645 = v325;
    *(_DWORD *)v324 = 136446210;
    swift_beginAccess(&v648, v641, 0, 0);
    v326 = v648[2];
    if (v326)
    {
      v327 = (unint64_t)v648
           + ((v315 + 32) & ~(unint64_t)v315)
           + v316 * (v326 - 1);
      v328 = v635;
      v329 = v566;
      v215 = v637;
      (*(void (**)(_BYTE *, unint64_t, uint64_t))(v635 + 16))(v566, v327, v637);
      v330 = 0;
    }
    else
    {
      v330 = 1;
      v215 = v637;
      v328 = v635;
      v329 = v566;
    }
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v328 + 56))(v329, v330, 1, v215);
    v388 = String.init<A>(describing:)(v329, v567);
    v390 = v389;
    v643 = sub_10002CB54(v388, v389, (uint64_t *)&v645);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v643, v644, v324 + 4, v324 + 12);
    swift_bridgeObjectRelease(v390);
    _os_log_impl((void *)&_mh_execute_header, v322, v323, "[Announce Reminders] Added %{public}s to search criteria", v324, 0xCu);
    swift_arrayDestroy(v325, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v325, -1, -1);
    swift_slowDealloc(v324, -1, -1);

    v234((void (*)(BOOL *, BOOL *, uint64_t))v624, (unint64_t)v632);
    v221 = v328;
    v235 = v629;
    v136 = v636;
    goto LABEL_54;
  }

  v234((void (*)(BOOL *, BOOL *, uint64_t))v624, (unint64_t)v632);
  v215 = v637;
  v235 = v629;
  v136 = v636;
LABEL_55:
  v237 = v631;
  *v237 = -[NSObject status](v136, "status") == (id)2;
  v632 = *(_QWORD **)(v221 + 104);
  ((void (*)(BOOL *, _QWORD, uint64_t))v632)(v237, enum case for REMSearchCriterion.isCompleted(_:), v215);
  swift_beginAccess(&v648, &v645, 33, 0);
  v238 = (unint64_t)v648;
  if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
    v238 = sub_10002C814(0, *(_QWORD *)(v238 + 16) + 1, 1, v238);
  v240 = *(_QWORD *)(v238 + 16);
  v239 = *(_QWORD *)(v238 + 24);
  if (v240 >= v239 >> 1)
    v238 = sub_10002C814(v239 > 1, v240 + 1, 1, v238);
  *(_QWORD *)(v238 + 16) = v240 + 1;
  v631 = (BOOL *)((*(unsigned __int8 *)(v221 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v221 + 80));
  v630 = *(uint64_t **)(v221 + 72);
  v241 = *(void (**)(BOOL *, BOOL *, uint64_t))(v221 + 32);
  v241(&v631[v238 + (_QWORD)v630 * v240], v237, v637);
  v648 = (_QWORD *)v238;
  swift_endAccess(&v645);
  v242 = -[NSObject location](v136, "location");
  if (v242)
  {
    v243 = v242;
    v244 = objc_msgSend(v242, "name");

    if (v244)
    {
      v245 = static String._unconditionallyBridgeFromObjectiveC(_:)(v244);
      v247 = v246;

      if (-[NSObject locationSearchType](v636, "locationSearchType") == (id)1)
      {
        v248 = sub_10000A430(&qword_1000422D8);
        v249 = v573;
        v250 = (char *)v573 + *(int *)(v248 + 48);
        *v573 = v245;
        v249[1] = v247;
        v251 = enum case for REMStringMatchingStyle.prefix(_:);
        v252 = type metadata accessor for REMStringMatchingStyle(0);
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v252 - 8) + 104))(v250, v251, v252);
        ((void (*)(uint64_t *, _QWORD, uint64_t))v632)(v249, enum case for REMSearchCriterion.location(_:), v637);
        swift_beginAccess(&v648, &v645, 33, 0);
        v253 = (unint64_t)v648;
        if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
          v253 = sub_10002C814(0, *(_QWORD *)(v253 + 16) + 1, 1, v253);
        v255 = *(_QWORD *)(v253 + 16);
        v254 = *(_QWORD *)(v253 + 24);
        if (v255 >= v254 >> 1)
          v253 = sub_10002C814(v254 > 1, v255 + 1, 1, v253);
        *(_QWORD *)(v253 + 16) = v255 + 1;
        v241(&v631[v253 + v255 * (_QWORD)v630], (BOOL *)v249, v637);
        v648 = (_QWORD *)v253;
        swift_endAccess(&v645);
      }
      else
      {
        swift_bridgeObjectRelease(v247);
      }
    }
  }
  v624 = v241;
  v256 = *(void (**)(void))(v221 + 56);
  v257 = v625;
  v256();
  v258 = v636;
  v259 = -[NSObject temporalEventTriggerTypes](v636, "temporalEventTriggerTypes");
  v260 = -[NSObject temporalEventTriggerTypes](v258, "temporalEventTriggerTypes");
  v261 = (v260 & 2) == 0;
  v262 = v258;
  v263 = -[NSObject temporalEventTriggerTypes](v258, "temporalEventTriggerTypes");
  v264 = v257;
  if ((v259 & 1) != 0)
  {
    if ((v260 & 2) != 0)
    {
      v265 = v618;
      if ((v263 & 4) != 0)
        goto LABEL_85;
      v261 = 0;
      v267 = (void (*)(void))v632;
      goto LABEL_79;
    }
    v265 = v618;
    if ((v263 & 4) != 0)
      goto LABEL_85;
    goto LABEL_84;
  }
  if ((v260 & 2) == 0)
  {
    v265 = v618;
    if ((v263 & 4) == 0)
      goto LABEL_85;
    goto LABEL_76;
  }
  v265 = v618;
  if ((v263 & 4) != 0)
  {
LABEL_84:
    sub_10000A5D0((uint64_t)v264, &qword_1000422B0);
    *v264 = (v259 & 1) == 0;
    v271 = v637;
    ((void (*)(BOOL *, _QWORD, uint64_t))v632)(v264, enum case for REMSearchCriterion.hasDueDate(_:), v637);
    ((void (*)(BOOL *, _QWORD, uint64_t, uint64_t))v256)(v264, 0, 1, v271);
    goto LABEL_85;
  }
LABEL_76:
  sub_10000A5D0((uint64_t)v264, &qword_1000422B0);
  *v264 = 1;
  v266 = v637;
  v267 = (void (*)(void))v632;
  ((void (*)(BOOL *, _QWORD, uint64_t))v632)(v264, enum case for REMSearchCriterion.hasDueDate(_:), v637);
  ((void (*)(BOOL *, _QWORD, uint64_t, uint64_t))v256)(v264, 0, 1, v266);
LABEL_79:
  *v612 = v261;
  v267();
  swift_beginAccess(&v648, &v645, 33, 0);
  v268 = (unint64_t)v648;
  if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
    v268 = sub_10002C814(0, *(_QWORD *)(v268 + 16) + 1, 1, v268);
  v270 = *(_QWORD *)(v268 + 16);
  v269 = *(_QWORD *)(v268 + 24);
  if (v270 >= v269 >> 1)
    v268 = sub_10002C814(v269 > 1, v270 + 1, 1, v268);
  *(_QWORD *)(v268 + 16) = v270 + 1;
  ((void (*)(BOOL *, BOOL *, uint64_t))v624)(&v631[v268 + v270 * (_QWORD)v630], v612, v637);
  v648 = (_QWORD *)v268;
  swift_endAccess(&v645);
LABEL_85:
  v599 = v256;
  v272 = -[NSObject dateTime](v262, "dateTime");
  if (!v272)
    goto LABEL_199;
  v273 = v272;
  v274 = objc_msgSend(v272, "allDay");
  if (v274)
  {
    v275 = v274;
    LODWORD(v612) = objc_msgSend(v274, "BOOLValue");

  }
  else
  {
    LODWORD(v612) = 0;
  }
  v276 = (uint64_t)v604;
  v277 = (uint64_t)v603;
  v278 = v600;
  v279 = objc_msgSend(v273, "startDateComponents");
  if (v279)
  {
    v280 = v279;
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

    v281 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v265 + 56);
    v281(v278, 0, 1, v236);
  }
  else
  {
    v281 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v265 + 56);
    v281(v278, 1, 1, v236);
  }
  v282 = (uint64_t)v278;
  v283 = v601;
  sub_10000A544(v282, (uint64_t)v601);
  v284 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v265 + 48);
  if (v284(v283, 1, v236) == 1)
  {
    sub_10000A5D0((uint64_t)v283, (uint64_t *)&unk_100042540);
    v285 = 1;
  }
  else
  {
    DateComponents.smartlyCorrectedValue.getter();
    (*(void (**)(_BYTE *, uint64_t))(v265 + 8))(v283, v236);
    v285 = 0;
  }
  v286 = 1;
  v281(v235, v285, 1, v236);
  v613 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))v273;
  v287 = objc_msgSend(v273, "endDateComponents");
  if (v287)
  {
    v288 = v287;
    v289 = (uint64_t)v602;
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

    v286 = 0;
    v290 = v620;
  }
  else
  {
    v290 = v620;
    v289 = (uint64_t)v602;
  }
  v281((_BYTE *)v289, v286, 1, v236);
  sub_10000A544(v289, v277);
  if (v284((_BYTE *)v277, 1, v236) == 1)
  {
    sub_10000A5D0(v277, (uint64_t *)&unk_100042540);
    v291 = 1;
    v292 = v634;
  }
  else
  {
    v293 = v634;
    DateComponents.smartlyCorrectedValue.getter();
    v292 = v293;
    v265 = v618;
    (*(void (**)(uint64_t, uint64_t))(v618 + 8))(v277, v236);
    v291 = 0;
  }
  v281(v292, v291, 1, v236);
  sub_10000A58C((uint64_t)v235, v276, (uint64_t *)&unk_100042540);
  if (v284((_BYTE *)v276, 1, v236) == 1)
  {
    sub_10000A5D0(v276, (uint64_t *)&unk_100042540);
    v294 = v614;
    v295 = v622;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v290 + 56))(v614, 1, 1, v622);
    v296 = v623;
  }
  else
  {
    v294 = v614;
    DateComponents.calendar.getter();
    (*(void (**)(uint64_t, uint64_t))(v265 + 8))(v276, v236);
    v296 = v623;
    v295 = v622;
  }
  v297 = v637;
  v298 = v605;
  sub_10000A58C((uint64_t)v634, (uint64_t)v605, (uint64_t *)&unk_100042540);
  v299 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v290 + 48);
  if (v299(v294, 1, v295) != 1)
  {
    sub_10000A5D0((uint64_t)v298, (uint64_t *)&unk_100042540);
    v302 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v290 + 32))(v627, v294, v295);
    v303 = v634;
    v304 = v608;
    v305 = (uint64_t)v606;
    goto LABEL_129;
  }
  v300 = v579;
  sub_10000A58C((uint64_t)v298, (uint64_t)v579, (uint64_t *)&unk_100042540);
  if (v284(v300, 1, v236) == 1)
  {
    sub_10000A5D0((uint64_t)v300, (uint64_t *)&unk_100042540);
    v301 = (uint64_t)v580;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v620 + 56))(v580, 1, 1, v622);
  }
  else
  {
    v301 = (uint64_t)v580;
    DateComponents.calendar.getter();
    (*(void (**)(_BYTE *, uint64_t))(v265 + 8))(v300, v236);
    v331 = v299((_BYTE *)v301, 1, v622);
    v332 = v627;
    if (v331 != 1)
    {
      sub_10000A5D0((uint64_t)v298, (uint64_t *)&unk_100042540);
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v620 + 32))(v332, v301, v622);
      goto LABEL_128;
    }
  }
  v333 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 24];
  v334 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 32];
  sub_10000A4BC(&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider], v333);
  v335 = *(void (**)(uint64_t, uint64_t))(v334 + 16);
  v336 = v334;
  v296 = v623;
  v335(v333, v336);
  sub_10000A5D0((uint64_t)v298, (uint64_t *)&unk_100042540);
  sub_10000A5D0(v301, (uint64_t *)&unk_1000422A0);
LABEL_128:
  v304 = v608;
  v305 = (uint64_t)v606;
  v302 = sub_10000A5D0((uint64_t)v614, (uint64_t *)&unk_1000422A0);
  v303 = v634;
LABEL_129:
  v337 = static Date.distantPast.getter(v302);
  static Date.distantFuture.getter(v337);
  sub_10000A58C((uint64_t)v629, v305, (uint64_t *)&unk_100042540);
  if (v284((_BYTE *)v305, 1, v236) == 1)
  {
    sub_10000A5D0(v305, (uint64_t *)&unk_100042540);
  }
  else
  {
    v338 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v265 + 32);
    v339 = v582;
    v340 = v338(v582, v305, v236);
    if ((v612 & 1) != 0)
    {
      v341 = v584;
      DateComponents.rem_allDayDateComponents()(v340);
      (*(void (**)(_BYTE *, uint64_t))(v265 + 8))(v339, v236);
      v338(v339, (uint64_t)v341, v236);
    }
    v342 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    v343 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    v344 = v339;
    sub_10000A4BC(&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider], v342);
    (*(void (**)(uint64_t, uint64_t))(v343 + 8))(v342, v343);
    v345 = (uint64_t)v583;
    Calendar.dateMatching(_:now:)(v339, v304);
    v346 = v617;
    v347 = *(void (**)(_BYTE *, uint64_t))(v617 + 8);
    v296 = v623;
    v347(v304, v623);
    v348 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v346 + 48))(v345, 1, v296);
    if ((_DWORD)v348 == 1)
    {
      v349 = v581;
      static Date.distantPast.getter(v348);
      v350 = v344;
      v351 = v349;
      (*(void (**)(_BYTE *, uint64_t))(v265 + 8))(v350, v236);
      v352 = v633;
      v347(v633, v296);
      sub_10000A5D0(v345, &qword_100042800);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v346 + 32))(v352, v351, v296);
    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v265 + 8))(v339, v236);
      v353 = v633;
      v347(v633, v296);
      v354 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v346 + 32);
      v355 = v581;
      v354(v581, v345, v296);
      v354(v353, (uint64_t)v355, v296);
    }
    v303 = v634;
    v297 = v637;
  }
  v356 = (uint64_t)v303;
  v357 = v607;
  sub_10000A58C(v356, (uint64_t)v607, (uint64_t *)&unk_100042540);
  if (v284(v357, 1, v236) == 1)
  {
    sub_10000A5D0((uint64_t)v357, (uint64_t *)&unk_100042540);
    v358 = v617;
    goto LABEL_153;
  }
  v359 = *(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v265 + 32);
  v360 = v265;
  v361 = v592;
  v362 = v359(v592, v357, v236);
  if ((v612 & 1) != 0)
  {
    v363 = v584;
    DateComponents.rem_allDayDateComponents()(v362);
    v364 = v296;
    v365 = *(_BYTE **)(v360 + 8);
    ((void (*)(_BYTE *, uint64_t))v365)(v361, v236);
    v359(v361, v363, v236);
    v366 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    v367 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    sub_10000A4BC(&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider], v366);
    (*(void (**)(uint64_t, uint64_t))(v367 + 8))(v366, v367);
    v368 = (uint64_t)v570;
    Calendar.dateMatching(_:now:)(v361, v304);
    v369 = v617;
    v370 = *(_BYTE **)(v617 + 8);
    ((void (*)(_BYTE *, uint64_t))v370)(v304, v364);
    v371 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v369 + 48);
    if (v371(v368, 1, v364) == 1)
    {
      ((void (*)(_BYTE *, uint64_t))v365)(v361, v236);
      sub_10000A5D0(v368, &qword_100042800);
      v297 = v637;
      v296 = v364;
      v358 = v369;
      goto LABEL_153;
    }
    v612 = v370;
    v614 = v365;
    v381 = v559;
    v618 = *(_QWORD *)(v369 + 32);
    ((void (*)(_BYTE *, uint64_t, uint64_t))v618)(v559, v368, v364);
    v382 = v594;
    v383 = v593;
    v384 = v595;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v594 + 104))(v593, enum case for Calendar.Component.day(_:), v595);
    v385 = (uint64_t)v561;
    Calendar.date(byAdding:value:to:wrappingComponents:)(v383, 1, v381, 0);
    (*(void (**)(_BYTE *, uint64_t))(v382 + 8))(v383, v384);
    if (v371(v385, 1, v364) == 1)
    {
      ((void (*)(_BYTE *, uint64_t))v612)(v381, v364);
      ((void (*)(_BYTE *, uint64_t))v614)(v592, v616);
      sub_10000A5D0(v385, &qword_100042800);
      v386 = (uint64_t)v562;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v369 + 56))(v562, 1, 1, v364);
      v297 = v637;
      v296 = v364;
      v358 = v369;
      v387 = v628;
LABEL_151:
      v393 = v560;
      v394 = (void (*)(_BYTE *, _BYTE *, uint64_t))v618;
      ((void (*)(_BYTE *, _BYTE *, uint64_t))v618)(v560, v387, v296);
      sub_10000A5D0(v386, &qword_100042800);
      v394(v387, v393, v296);
      goto LABEL_153;
    }
    v386 = (uint64_t)v562;
    Date.addingTimeInterval(_:)(-1.0);
    v391 = v612;
    ((void (*)(_BYTE *, uint64_t))v612)(v381, v364);
    ((void (*)(_BYTE *, uint64_t))v614)(v592, v616);
    ((void (*)(uint64_t, uint64_t))v391)(v385, v364);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v369 + 56))(v386, 0, 1, v364);
    v392 = v371(v386, 1, v364);
    v297 = v637;
    v296 = v364;
    v358 = v369;
    v387 = v628;
    if (v392 == 1)
      goto LABEL_151;
    ((void (*)(_BYTE *, uint64_t))v391)(v628, v364);
    v395 = v560;
    v396 = (void (*)(_BYTE *, _BYTE *, uint64_t))v618;
    ((void (*)(_BYTE *, uint64_t, uint64_t))v618)(v560, v386, v364);
    v396(v387, v395, v364);
  }
  else
  {
    v372 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    v373 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    sub_10000A4BC(&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider], v372);
    (*(void (**)(uint64_t, uint64_t))(v373 + 8))(v372, v373);
    v374 = (uint64_t)v569;
    Calendar.dateMatching(_:now:)(v361, v304);
    v375 = v617;
    v376 = *(void (**)(_BYTE *, uint64_t))(v617 + 8);
    v376(v304, v296);
    v377 = v236;
    v358 = v375;
    (*(void (**)(_BYTE *, uint64_t))(v360 + 8))(v361, v377);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v375 + 48))(v374, 1, v296) == 1)
    {
      v378 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v375 + 32);
      v379 = v568;
      v380 = v628;
      v378(v568, v628, v296);
      sub_10000A5D0(v374, &qword_100042800);
    }
    else
    {
      v380 = v628;
      v376(v628, v296);
      v378 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v375 + 32);
      v379 = v568;
      v378(v568, (_BYTE *)v374, v296);
    }
    v378(v380, v379, v296);
  }
LABEL_153:
  v397 = &v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider];
  v398 = INSearchForNotebookItemsIntent.isTodayQuery(timeProvider:)(&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider]);
  v399 = v633;
  if ((v398 & 1) == 0)
    goto LABEL_160;
  static Date.distantPast.getter(v398);
  v400 = *(void (**)(_BYTE *, uint64_t))(v358 + 8);
  v400(v399, v296);
  v401 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v358 + 32);
  v401(v399, v304, v296);
  v402 = *((_QWORD *)v397 + 3);
  v403 = *((_QWORD *)v397 + 4);
  sub_10000A4BC(v397, v402);
  v404 = *(void (**)(uint64_t, uint64_t))(v403 + 8);
  v405 = v403;
  v296 = v623;
  v404(v402, v405);
  v406 = v585;
  Calendar.startOfDay(for:)(v304);
  v400(v304, v296);
  v407 = v594;
  v408 = v406;
  v409 = v593;
  v410 = v595;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v594 + 104))(v593, enum case for Calendar.Component.day(_:), v595);
  v411 = (uint64_t)v589;
  Calendar.date(byAdding:value:to:wrappingComponents:)(v409, 1, v408, 0);
  (*(void (**)(_BYTE *, uint64_t))(v407 + 8))(v409, v410);
  v412 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v358 + 48);
  if (v412(v411, 1, v296) == 1)
  {
    v400(v408, v296);
    sub_10000A5D0(v411, &qword_100042800);
    v413 = (uint64_t)v590;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v358 + 56))(v590, 1, 1, v296);
    v414 = v588;
    v415 = v628;
  }
  else
  {
    v416 = v411;
    v413 = (uint64_t)v590;
    Date.addingTimeInterval(_:)(-1.0);
    v400(v408, v296);
    v400((_BYTE *)v416, v296);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v358 + 56))(v413, 0, 1, v296);
    v417 = v412(v413, 1, v296);
    v414 = v588;
    v415 = v628;
    if (v417 != 1)
    {
      v400(v628, v296);
      v401(v414, (_BYTE *)v413, v296);
      goto LABEL_159;
    }
  }
  v401(v414, v415, v296);
  sub_10000A5D0(v413, &qword_100042800);
LABEL_159:
  v297 = v637;
  v399 = v633;
  v401(v415, v414, v296);
LABEL_160:
  v262 = v636;
  v418 = -[NSObject dateSearchType](v636, "dateSearchType");
  v264 = v625;
  v419 = v609;
  v420 = v613;
  switch((unint64_t)v418)
  {
    case 0uLL:

      v421 = *(void (**)(_BYTE *, uint64_t))(v358 + 8);
      v421(v628, v296);
      v421(v399, v296);
      (*(void (**)(_BYTE *, uint64_t))(v620 + 8))(v627, v622);
      goto LABEL_162;
    case 1uLL:
      sub_10000A58C((uint64_t)v625, (uint64_t)v609, &qword_1000422B0);
      v468 = v635;
      v469 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v635 + 48))(v419, 1, v297);
      v470 = v622;
      if (v469 == 1)
      {
        sub_10000A5D0((uint64_t)v419, &qword_1000422B0);
        goto LABEL_192;
      }
      if ((*(unsigned int (**)(_BYTE *, uint64_t))(v468 + 88))(v419, v297) != enum case for REMSearchCriterion.hasDueDate(_:))
      {
        (*(void (**)(_BYTE *, uint64_t))(v468 + 8))(v419, v297);
LABEL_192:
        v481 = (void (*)(BOOL *, _BYTE *, uint64_t))v624;
        v482 = sub_10000A430(&qword_1000422D0);
        v483 = v574;
        v484 = &v574[*(int *)(v482 + 48)];
        v485 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v358 + 16);
        v485(v574, v633, v296);
        v486 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v358 + 56);
        v486(v483, 0, 1, v296);
        v485(v484, v628, v296);
        v486(v484, 0, 1, v296);
        ((void (*)(_BYTE *, _QWORD, uint64_t))v632)(v483, enum case for REMSearchCriterion.dueDate(_:), v297);
        swift_beginAccess(&v648, &v645, 33, 0);
        v487 = (unint64_t)v648;
        if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
          v487 = sub_10002C814(0, *(_QWORD *)(v487 + 16) + 1, 1, v487);
        v489 = *(_QWORD *)(v487 + 16);
        v488 = *(_QWORD *)(v487 + 24);
        v441 = v628;
        if (v489 >= v488 >> 1)
          v487 = sub_10002C814(v488 > 1, v489 + 1, 1, v487);
        *(_QWORD *)(v487 + 16) = v489 + 1;
        v481(&v631[v487 + v489 * (_QWORD)v630], v574, v297);
        v648 = (_QWORD *)v487;
        swift_endAccess(&v645);

LABEL_197:
        v490 = *(void (**)(_BYTE *, uint64_t))(v358 + 8);
        v490(v441, v296);
        v490(v633, v296);
        (*(void (**)(_BYTE *, uint64_t))(v620 + 8))(v627, v622);
        sub_10000A5D0((uint64_t)v634, (uint64_t *)&unk_100042540);
        sub_10000A5D0((uint64_t)v629, (uint64_t *)&unk_100042540);
        goto LABEL_198;
      }
      (*(void (**)(_BYTE *, uint64_t))(v468 + 96))(v419, v297);
      if ((*v419 & 1) != 0)
      {
        v471 = sub_10000A430(&qword_1000422D0);
        v472 = v558;
        v473 = &v558[*(int *)(v471 + 48)];
        v474 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v358 + 16);
        v474(v558, v633, v296);
        v475 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v358 + 56);
        v475(v472, 0, 1, v296);
        v474(v473, v628, v296);
        v475(v473, 0, 1, v296);
        ((void (*)(_BYTE *, _QWORD, uint64_t))v632)(v472, enum case for REMSearchCriterion.dueDate(_:), v297);
        swift_beginAccess(&v648, &v645, 33, 0);
        v476 = (unint64_t)v648;
        if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
          v476 = sub_10002C814(0, *(_QWORD *)(v476 + 16) + 1, 1, v476);
        v478 = *(_QWORD *)(v476 + 16);
        v477 = *(_QWORD *)(v476 + 24);
        v479 = (void (*)(BOOL *, _BYTE *, uint64_t))v624;
        if (v478 >= v477 >> 1)
          v476 = sub_10002C814(v477 > 1, v478 + 1, 1, v476);
        *(_QWORD *)(v476 + 16) = v478 + 1;
        v479(&v631[v476 + v478 * (_QWORD)v630], v472, v297);
        v648 = (_QWORD *)v476;
        swift_endAccess(&v645);

        v480 = *(void (**)(_BYTE *, uint64_t))(v358 + 8);
        v480(v628, v296);
        v480(v633, v296);
        (*(void (**)(_BYTE *, uint64_t))(v620 + 8))(v627, v622);
        sub_10000A5D0((uint64_t)v634, (uint64_t *)&unk_100042540);
        sub_10000A5D0((uint64_t)v629, (uint64_t *)&unk_100042540);
        sub_10000A5D0((uint64_t)v264, &qword_1000422B0);
        ((void (*)(BOOL *, uint64_t, uint64_t, uint64_t))v599)(v264, 1, 1, v297);
LABEL_198:
        v221 = v635;
        v262 = v636;
        break;
      }

      v546 = *(void (**)(_BYTE *, uint64_t))(v358 + 8);
      v546(v628, v296);
      v546(v633, v296);
      (*(void (**)(_BYTE *, uint64_t))(v620 + 8))(v627, v470);
LABEL_162:
      sub_10000A5D0((uint64_t)v634, (uint64_t *)&unk_100042540);
      sub_10000A5D0((uint64_t)v629, (uint64_t *)&unk_100042540);
      v221 = v635;
      break;
    case 2uLL:
      v422 = sub_10000A430(&qword_1000422D0);
      v423 = v399;
      v424 = v422;
      v425 = v571;
      v426 = &v571[*(int *)(v422 + 48)];
      v427 = v296;
      v428 = v297;
      v429 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v358 + 16);
      v429(v571, v423, v427);
      v430 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v358 + 56);
      v430(v425, 0, 1, v427);
      v429(v426, v628, v427);
      v430(v426, 0, 1, v427);
      v431 = enum case for REMSearchCriterion.modifiedDate(_:);
      ((void (*)(_BYTE *, _QWORD, uint64_t))v632)(v425, enum case for REMSearchCriterion.modifiedDate(_:), v428);
      swift_beginAccess(&v648, &v645, 33, 0);
      v432 = (unint64_t)v648;
      if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
        v432 = sub_10002C814(0, *(_QWORD *)(v432 + 16) + 1, 1, v432);
      v434 = *(_QWORD *)(v432 + 16);
      v433 = *(_QWORD *)(v432 + 24);
      v435 = (void (*)(BOOL *, _BYTE *, uint64_t))v624;
      if (v434 >= v433 >> 1)
        v432 = sub_10002C814(v433 > 1, v434 + 1, 1, v432);
      *(_QWORD *)(v432 + 16) = v434 + 1;
      v436 = &v631[v432 + v434 * (_QWORD)v630];
      v437 = v637;
      v435(v436, v425, v637);
      v648 = (_QWORD *)v432;
      swift_endAccess(&v645);
      v438 = *(int *)(v424 + 48);
      v439 = v586;
      v440 = &v586[v438];
      v296 = v623;
      v429(v586, v633, v623);
      v430(v439, 0, 1, v296);
      v441 = v628;
      v429(v440, v628, v296);
      v442 = v437;
      v430(v440, 0, 1, v296);
      ((void (*)(_BYTE *, uint64_t, uint64_t))v632)(v439, v431, v437);
      v443 = (unint64_t)v647;
      if ((swift_isUniquelyReferenced_nonNull_native(v647) & 1) == 0)
        v443 = sub_10002C814(0, *(_QWORD *)(v443 + 16) + 1, 1, v443);
      v264 = v625;
      v358 = v617;
      v445 = *(_QWORD *)(v443 + 16);
      v444 = *(_QWORD *)(v443 + 24);
      if (v445 >= v444 >> 1)
        v443 = sub_10002C814(v444 > 1, v445 + 1, 1, v443);
      *(_QWORD *)(v443 + 16) = v445 + 1;
      v446 = &v631[v443 + v445 * (_QWORD)v630];
      v447 = &v618;
      goto LABEL_181;
    case 3uLL:
      v448 = sub_10000A430(&qword_1000422D0);
      v449 = v399;
      v450 = v448;
      v451 = v572;
      v452 = &v572[*(int *)(v448 + 48)];
      v453 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v358 + 16);
      v453(v572, v449, v296);
      v454 = v296;
      v455 = v297;
      v456 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v358 + 56);
      v456(v451, 0, 1, v454);
      v453(v452, v628, v454);
      v456(v452, 0, 1, v454);
      v457 = enum case for REMSearchCriterion.creationDate(_:);
      ((void (*)(_BYTE *, _QWORD, uint64_t))v632)(v451, enum case for REMSearchCriterion.creationDate(_:), v455);
      swift_beginAccess(&v648, &v645, 33, 0);
      v458 = (unint64_t)v648;
      if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
        v458 = sub_10002C814(0, *(_QWORD *)(v458 + 16) + 1, 1, v458);
      v460 = *(_QWORD *)(v458 + 16);
      v459 = *(_QWORD *)(v458 + 24);
      v435 = (void (*)(BOOL *, _BYTE *, uint64_t))v624;
      if (v460 >= v459 >> 1)
        v458 = sub_10002C814(v459 > 1, v460 + 1, 1, v458);
      *(_QWORD *)(v458 + 16) = v460 + 1;
      v461 = &v631[v458 + v460 * (_QWORD)v630];
      v462 = v637;
      v435(v461, v451, v637);
      v648 = (_QWORD *)v458;
      swift_endAccess(&v645);
      v463 = *(int *)(v450 + 48);
      v464 = v587;
      v465 = &v587[v463];
      v296 = v623;
      v453(v587, v633, v623);
      v456(v464, 0, 1, v296);
      v441 = v628;
      v453(v465, v628, v296);
      v456(v465, 0, 1, v296);
      v442 = v462;
      ((void (*)(_BYTE *, uint64_t, uint64_t))v632)(v464, v457, v462);
      v443 = (unint64_t)v647;
      if ((swift_isUniquelyReferenced_nonNull_native(v647) & 1) == 0)
        v443 = sub_10002C814(0, *(_QWORD *)(v443 + 16) + 1, 1, v443);
      v264 = v625;
      v358 = v617;
      v467 = *(_QWORD *)(v443 + 16);
      v466 = *(_QWORD *)(v443 + 24);
      if (v467 >= v466 >> 1)
        v443 = sub_10002C814(v466 > 1, v467 + 1, 1, v443);
      *(_QWORD *)(v443 + 16) = v467 + 1;
      v446 = &v631[v443 + v467 * (_QWORD)v630];
      v447 = &v619;
LABEL_181:
      v435(v446, (_BYTE *)*(v447 - 32), v442);

      v647 = (_QWORD *)v443;
      goto LABEL_197;
    default:
      v555(v554, v621, v556);
      v547 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
      v209 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
      swift_release(v619);
      _Block_release(v591);
      v548 = "unknown date search type";
      v549 = 24;
      goto LABEL_236;
  }
LABEL_199:
  v491 = v615;
  sub_10000A58C((uint64_t)v264, (uint64_t)v615, &qword_1000422B0);
  v492 = v637;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v221 + 48))(v491, 1, v637) == 1)
  {
    sub_10000A5D0((uint64_t)v491, &qword_1000422B0);
    v493 = (void (*)(BOOL *, _BYTE *, uint64_t))v624;
  }
  else
  {
    v494 = v598;
    v493 = (void (*)(BOOL *, _BYTE *, uint64_t))v624;
    ((void (*)(_BYTE *, _BYTE *, uint64_t))v624)(v598, v491, v492);
    v495 = v597;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v221 + 16))(v597, v494, v492);
    swift_beginAccess(&v648, &v645, 33, 0);
    v496 = (unint64_t)v648;
    if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
      v496 = sub_10002C814(0, *(_QWORD *)(v496 + 16) + 1, 1, v496);
    v498 = *(_QWORD *)(v496 + 16);
    v497 = *(_QWORD *)(v496 + 24);
    if (v498 >= v497 >> 1)
      v496 = sub_10002C814(v497 > 1, v498 + 1, 1, v496);
    *(_QWORD *)(v496 + 16) = v498 + 1;
    v493(&v631[v496 + v498 * (_QWORD)v630], v495, v492);
    v648 = (_QWORD *)v496;
    swift_endAccess(&v645);
    (*(void (**)(_BYTE *, uint64_t))(v221 + 8))(v494, v492);
    v262 = v636;
  }
  v499 = -[NSObject taskPriority](v262, "taskPriority");
  v500 = v619;
  v501 = (void (*)(void))v632;
  if (v499)
  {
    if (v499 == (id)1)
    {
      *v611 = 0;
      v501();
      swift_beginAccess(&v648, &v645, 33, 0);
      v502 = (unint64_t)v648;
      if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
        v502 = sub_10002C814(0, *(_QWORD *)(v502 + 16) + 1, 1, v502);
      v504 = *(_QWORD *)(v502 + 16);
      v503 = *(_QWORD *)(v502 + 24);
      if (v504 >= v503 >> 1)
        v502 = sub_10002C814(v503 > 1, v504 + 1, 1, v502);
      *(_QWORD *)(v502 + 16) = v504 + 1;
      v505 = &v631[v502 + v504 * (_QWORD)v630];
      v506 = &v640;
LABEL_219:
      v493(v505, *((_BYTE **)v506 - 32), v492);
      v648 = (_QWORD *)v502;
      swift_endAccess(&v645);
      goto LABEL_220;
    }
    if (v499 == (id)2)
    {
      *v610 = 1;
      v501();
      swift_beginAccess(&v648, &v645, 33, 0);
      v502 = (unint64_t)v648;
      if ((swift_isUniquelyReferenced_nonNull_native(v648) & 1) == 0)
        v502 = sub_10002C814(0, *(_QWORD *)(v502 + 16) + 1, 1, v502);
      v508 = *(_QWORD *)(v502 + 16);
      v507 = *(_QWORD *)(v502 + 24);
      if (v508 >= v507 >> 1)
        v502 = sub_10002C814(v507 > 1, v508 + 1, 1, v502);
      *(_QWORD *)(v502 + 16) = v508 + 1;
      v505 = &v631[v502 + v508 * (_QWORD)v630];
      v506 = &v639;
      goto LABEL_219;
    }
    v555(v557, v621, v556);
    v547 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
    v209 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
    swift_release(v500);
    _Block_release(v591);
    v548 = "unknown task priority";
    v549 = 21;
LABEL_236:
    sub_100028360((uint64_t)v548, v549, 2uLL, v547, v209);
    __break(1u);
LABEL_237:
    swift_release(v619);
    _Block_release(v591);
    _diagnoseUnexpectedEnumCase<A>(type:)(v209, v209);
    __break(1u);
    JUMPOUT(0x10000A420);
  }
LABEL_220:
  v509 = -[NSObject itemType](v262, "itemType");
  if (v509 == (id)2)
  {
    v527 = Logger.logObject.getter(2);
    v528 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v527, v528))
    {
      v529 = (uint8_t *)swift_slowAlloc(12, -1);
      v530 = swift_slowAlloc(32, -1);
      v645 = v530;
      *(_DWORD *)v529 = 136315138;
      swift_beginAccess(&v647, &v643, 0, 0);
      v531 = v492;
      v532 = v647;
      v533 = swift_bridgeObjectRetain(v647);
      v534 = Array.description.getter(v533, v531);
      v536 = v535;
      swift_bridgeObjectRelease(v532);
      v537 = v534;
      v500 = v619;
      v642 = sub_10002CB54(v537, v536, (uint64_t *)&v645);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v642, &v643, v529 + 4, v529 + 12);
      swift_bridgeObjectRelease(v536);
      _os_log_impl((void *)&_mh_execute_header, v527, v528, "Consulting Search datasource for lists {itemType: taskList, criteria: %s}", v529, 0xCu);
      swift_arrayDestroy(v530, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v530, -1, -1);
      swift_slowDealloc(v529, -1, -1);
    }

    v538 = v626;
    v521 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 24];
    v522 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 32];
    sub_10000A4BC(&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource], v521);
    swift_beginAccess(&v647, &v645, 0, 0);
    v523 = v647;
    v524 = (_QWORD *)swift_allocObject(&unk_10003D1C0, 40, 7);
    v524[2] = v538;
    v524[3] = sub_10000A494;
    v524[4] = v500;
    v525 = *(void (**)(_QWORD *, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v522 + 32);
    swift_retain(v500);
    swift_bridgeObjectRetain(v523);
    v539 = v538;
    v526 = sub_10000A50C;
    goto LABEL_228;
  }
  if (v509 == (id)3)
  {
    v510 = Logger.logObject.getter(3);
    v511 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v510, v511))
    {
      v512 = (uint8_t *)swift_slowAlloc(12, -1);
      v513 = swift_slowAlloc(32, -1);
      v645 = v513;
      *(_DWORD *)v512 = 136315138;
      v514 = v492;
      v515 = v648;
      v516 = swift_bridgeObjectRetain(v648);
      v517 = Array.description.getter(v516, v514);
      v519 = v518;
      swift_bridgeObjectRelease(v515);
      v520 = v517;
      v500 = v619;
      v643 = sub_10002CB54(v520, v519, (uint64_t *)&v645);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v643, v644, v512 + 4, v512 + 12);
      swift_bridgeObjectRelease(v519);
      _os_log_impl((void *)&_mh_execute_header, v510, v511, "Consulting Search datasource for reminders {itemType: task, criteria: %s}", v512, 0xCu);
      swift_arrayDestroy(v513, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v513, -1, -1);
      swift_slowDealloc(v512, -1, -1);
    }

    v521 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 24];
    v522 = *(_QWORD *)&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 32];
    sub_10000A4BC(&v626[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource], v521);
    v523 = v648;
    v524 = (_QWORD *)swift_allocObject(&unk_10003D1E8, 32, 7);
    v524[2] = sub_10000A494;
    v524[3] = v500;
    v525 = *(void (**)(_QWORD *, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v522 + 24);
    swift_bridgeObjectRetain(v523);
    swift_retain(v500);
    v526 = sub_10000A53C;
LABEL_228:
    v525(v523, v526, v524, v521, v522);
    swift_bridgeObjectRelease(v523);
    swift_release(v524);
    goto LABEL_232;
  }
  v540 = Logger.logObject.getter(v509);
  v541 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v540, v541))
  {
    v542 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v542 = 0;
    _os_log_impl((void *)&_mh_execute_header, v540, v541, "Unhandled itemType. Should have been cleaned up in resolve(). Return failure search result.", v542, 2u);
    swift_slowDealloc(v542, -1, -1);
  }

  v543 = objc_msgSend(objc_allocWithZone((Class)INSearchForNotebookItemsIntentResponse), "initWithCode:userActivity:", 4, 0);
  (*((void (**)(const void *, id))v591 + 2))(v591, v543);

LABEL_232:
  sub_10000A5D0((uint64_t)v264, &qword_1000422B0);
  swift_bridgeObjectRelease(v647);
  v544 = v648;
  swift_release(v500);
  return swift_bridgeObjectRelease(v544);
}

uint64_t sub_10000A430(uint64_t *a1)
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

uint64_t sub_10000A470()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A494()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_10000A4A4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *sub_10000A4BC(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000A4E0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10000A50C(uint64_t a1)
{
  uint64_t v1;

  sub_100004CA4(a1, *(void **)(v1 + 16), *(void (**))(v1 + 24));
}

uint64_t sub_10000A518()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000A53C(uint64_t a1)
{
  uint64_t v1;

  sub_100004788(a1, *(void (**))(v1 + 16));
}

uint64_t sub_10000A544(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000A430((uint64_t *)&unk_100042540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A58C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000A430(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000A5D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000A430(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000A60C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042300;
  if (!qword_100042300)
  {
    v1 = sub_10000A658(&qword_1000422F8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100042300);
  }
  return result;
}

uint64_t sub_10000A658(uint64_t *a1)
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

_QWORD *sub_10000A69C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, id *, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  uint64_t v19;
  _QWORD *v20;

  v5 = v4;
  if ((unint64_t)a1 >> 62)
    goto LABEL_16;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = &_swiftEmptyArrayStorage;
    if (!v8)
      break;
    v20 = &_swiftEmptyArrayStorage;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v8);
    if (v8 < 0)
    {
      __break(1u);
      return result;
    }
    v10 = 0;
    while (v8 != v10)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a1);
      else
        v11 = *(id *)(a1 + 8 * v10 + 32);
      v12 = v11;
      v18 = v11;
      a4(&v19, &v18, a2);

      if (v5)
        return (_QWORD *)swift_release(v20);
      ++v10;
      v13 = v19;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v14 = v20[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
      v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v13);
      specialized ContiguousArray._endMutation()(v15);
      if (v8 == v10)
        return v20;
    }
    __break(1u);
LABEL_16:
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v8 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  return result;
}

uint64_t *sub_10000A808(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000A848(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000A880(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void type metadata accessor for INTaskReference(uint64_t a1)
{
  sub_10000A8C8(a1, &qword_100042338, (uint64_t)&unk_10003D210);
}

void type metadata accessor for REMSmartListType(uint64_t a1)
{
  sub_10000A8C8(a1, &qword_100042340, (uint64_t)&unk_10003D230);
}

void sub_10000A8C8(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_10000A90C()
{
  return sub_10000A954(&qword_100042348, (uint64_t)&unk_100034950);
}

uint64_t sub_10000A930()
{
  return sub_10000A954(&qword_100042350, (uint64_t)&unk_100034928);
}

uint64_t sub_10000A954(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for REMSmartListType(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A994()
{
  return sub_10000A954(&qword_100042358, (uint64_t)&unk_1000349B8);
}

uint64_t sub_10000A9BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_1000423D0);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_1000423D0);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_10000AA4C(uint64_t a1, void (*a2)(id))
{
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void **v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  void *v41;
  Class isa;
  id v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v46 = a1;
    else
      v46 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = (char *)_CocoaArrayWrapper.endIndex.getter(v46);
    swift_bridgeObjectRelease(a1);
    if ((uint64_t)v4 > 0)
      goto LABEL_3;
LABEL_33:
    if (qword_100042050 != -1)
      swift_once(&qword_100042050, sub_10000A9BC);
    v47 = type metadata accessor for Logger(0);
    v48 = sub_10000A4A4(v47, (uint64_t)qword_1000423D0);
    v49 = Logger.logObject.getter(v48);
    v50 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "No reminder matches with the term {result: .unsupported}", v51, 2u);
      swift_slowDealloc(v51, -1, -1);
    }

    v52 = sub_10000A848(0, (unint64_t *)&unk_100042590, INTaskResolutionResult_ptr);
    v43 = objc_msgSend((id)swift_getObjCClassFromMetadata(v52), "unsupported");
    goto LABEL_38;
  }
  v4 = *(char **)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if ((uint64_t)v4 <= 0)
    goto LABEL_33;
LABEL_3:
  if (v4 == (char *)1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
    }
    else
    {
      if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_41;
      }
      v5 = *(id *)(a1 + 32);
    }
    v6 = v5;
    sub_10000A848(0, &qword_100042308, INTask_ptr);
    v4 = (char *)INTask.init(reminder:)(v6);
    if (qword_100042050 == -1)
    {
LABEL_8:
      v7 = type metadata accessor for Logger(0);
      sub_10000A4A4(v7, (uint64_t)qword_1000423D0);
      v8 = swift_bridgeObjectRetain_n(a1, 2);
      v9 = Logger.logObject.getter(v8);
      v10 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc(12, -1);
        v12 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v11 = 138412290;
        if ((a1 & 0xC000000000000001) != 0)
          v13 = (_QWORD *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
        else
          v13 = *(id *)(a1 + 32);
        v44 = v13;
        v54 = v13;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v11 + 4, v11 + 12);
        *v12 = v44;
        swift_bridgeObjectRelease_n(a1, 2);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "One reminder matches with the term {result: .success(%@)}", v11, 0xCu);
        v45 = sub_10000A430((uint64_t *)&unk_1000422E0);
        swift_arrayDestroy(v12, 1, v45);
        swift_slowDealloc(v12, -1, -1);
        swift_slowDealloc(v11, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a1, 2);
      }
      v43 = objc_msgSend((id)objc_opt_self(INTaskResolutionResult), "successWithResolvedTask:", v4);

      goto LABEL_38;
    }
LABEL_41:
    swift_once(&qword_100042050, sub_10000A9BC);
    goto LABEL_8;
  }
  if (qword_100042050 != -1)
    swift_once(&qword_100042050, sub_10000A9BC);
  v14 = type metadata accessor for Logger(0);
  v15 = sub_10000A4A4(v14, (uint64_t)qword_1000423D0);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Multiple reminders match with the term {result: .disambiguation}", v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  v19 = swift_bridgeObjectRetain_n(a1, 2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = (_QWORD *)swift_slowAlloc(32, -1);
    v54 = v23;
    *(_DWORD *)v22 = 136315138;
    v24 = sub_10000A848(0, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
    v25 = swift_bridgeObjectRetain(a1);
    v26 = Array.description.getter(v25, v24);
    v28 = v27;
    swift_bridgeObjectRelease(a1);
    v53 = sub_10002CB54(v26, v28, (uint64_t *)&v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Matching reminders: %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
  }
  v54 = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v4);
  sub_10000A848(0, &qword_100042308, INTask_ptr);
  if ((a1 & 0xC000000000000001) != 0)
  {
    v29 = 0;
    do
    {
      v30 = v29 + 1;
      v31 = specialized _ArrayBuffer._getElementSlowPath(_:)(v29, a1);
      v32 = INTask.init(reminder:)(v31);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v32);
      v33 = v54[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v33);
      v34 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v32);
      specialized ContiguousArray._endMutation()(v34);
      v29 = v30;
    }
    while (v4 != v30);
  }
  else
  {
    v35 = (void **)(a1 + 32);
    do
    {
      v36 = *v35++;
      v37 = INTask.init(reminder:)(v36);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v37);
      v38 = v54[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v38);
      v39 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v38, v37);
      specialized ContiguousArray._endMutation()(v39);
      --v4;
    }
    while (v4);
  }
  v40 = v54;
  v41 = (void *)objc_opt_self(INTaskResolutionResult);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v40);
  v43 = objc_msgSend(v41, "disambiguationWithTasksToDisambiguate:", isa);

LABEL_38:
  a2(v43);

}

void sub_10000B1B4(void **a1, uint64_t a2, id a3, uint64_t a4, uint64_t a5, void *a6, void (*a7)(void))
{
  uint64_t v9;
  id v10;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  uint64_t v21;
  id v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  uint8_t *v49;
  _QWORD *v50;
  uint64_t v54;
  _QWORD v55[3];
  _BYTE v56[8];
  id v57;
  uint64_t v58;

  v9 = a4;
  v10 = a3;
  v12 = *a1;
  if (*a1)
  {
    v13 = qword_100042050;
    v14 = v12;
    if (v13 != -1)
      swift_once(&qword_100042050, sub_10000A9BC);
    v15 = type metadata accessor for Logger(0);
    sub_10000A4A4(v15, (uint64_t)qword_1000423D0);
    v16 = v14;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v50 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v19 = 138412290;
      v49 = v19 + 4;
      v57 = v16;
      v20 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, &v58, v19 + 4, v19 + 12);
      *v50 = v12;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Populating contactRepresentation {contactRepresentation: %@}", v19, 0xCu);
      v21 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v50, 1, v21);
      swift_slowDealloc(v50, -1, -1);
      swift_slowDealloc(v19, -1, -1);

    }
    else
    {

    }
    v9 = a4;
    v22 = v16;
    TTRReminderEditor.edit(contactHandles:)(v12);

    v10 = a3;
  }
  v57 = 0;
  v23 = objc_msgSend(v10, "saveSynchronouslyWithError:", &v57, v49);
  v24 = v57;
  if (!v23)
    goto LABEL_11;
  v25 = *(_QWORD *)TTRWidgetCenter.shared.unsafeMutableAddressor(v57);
  swift_retain(v25);
  TTRWidgetCenter.reloadAllTimelines()();
  swift_release(v25);
  v26 = *(void **)(v9 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store);
  v57 = 0;
  v27 = objc_msgSend(v26, "fetchReminderWithObjectID:error:", a5, &v57);
  v24 = v57;
  if (v27)
  {
    v28 = v27;
    v29 = objc_allocWithZone((Class)INSetTaskAttributeIntentResponse);
    v30 = v24;
    v31 = objc_msgSend(v29, "initWithCode:userActivity:", 3, 0);
    sub_10000A848(0, &qword_100042308, INTask_ptr);
    v32 = v28;
    v33 = (void *)INTask.init(reminder:)(v32);
    objc_msgSend(v31, "setModifiedTask:", v33);

    v57 = a6;
    v34 = objc_msgSend(*(id *)(a2 + 16), "accountCapabilities");
    v35 = sub_10000A848(0, &qword_100042550, INSetTaskAttributeIntent_ptr);
    v36 = TTRIntentResultWarningBearing.warnings(store:accountCapabilties:)(v26, v34, v35, &protocol witness table for INSetTaskAttributeIntent);

    objc_msgSend(v31, "setWarnings:", v36);
    ((void (*)(id))a7)(v31);

  }
  else
  {
LABEL_11:
    v37 = v24;
    v38 = _convertNSErrorToError(_:)(v24);

    swift_willThrow();
    if (qword_100042050 != -1)
      swift_once(&qword_100042050, sub_10000A9BC);
    v39 = type metadata accessor for Logger(0);
    sub_10000A4A4(v39, (uint64_t)qword_1000423D0);
    swift_errorRetain();
    v40 = swift_errorRetain();
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc(12, -1);
      v44 = (void *)swift_slowAlloc(32, -1);
      v57 = v44;
      *(_DWORD *)v43 = 136315138;
      swift_getErrorValue(v38, v56, v55);
      v45 = Error.localizedDescription.getter(v55[1], v55[2]);
      v47 = v46;
      v54 = sub_10002CB54(v45, v46, (uint64_t *)&v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, v55, v43 + 4, v43 + 12);
      swift_bridgeObjectRelease(v47);
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Error saving saveRequest {error: %s}", v43, 0xCu);
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v43, -1, -1);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v48 = objc_msgSend(objc_allocWithZone((Class)INSetTaskAttributeIntentResponse), "initWithCode:userActivity:", 4, 0);
    a7();

    swift_errorRelease();
  }
}

id sub_10000B784()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSetTaskAttributeIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRSetTaskAttributeIntentHandler()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler);
}

_UNKNOWN **sub_10000B83C()
{
  return &off_10003DD08;
}

_UNKNOWN **sub_10000B848()
{
  return &off_10003E128;
}

_UNKNOWN **sub_10000B854()
{
  return &off_10003D648;
}

void sub_10000B860(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t *p_align;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  BOOL *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57[40];

  v6 = type metadata accessor for REMSearchCriterion(0);
  v52 = *(_QWORD *)(v6 - 8);
  v53 = v6;
  __chkstk_darwin(v6);
  v51 = (BOOL *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = swift_allocObject(&unk_10003D358, 24, 7);
  *(_QWORD *)(v54 + 16) = a3;
  _Block_copy(a3);
  if (qword_100042050 != -1)
    swift_once(&qword_100042050, sub_10000A9BC);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_10000A4A4(v8, (uint64_t)qword_1000423D0);
  v10 = a1;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  p_align = &stru_100040FE8.align;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = swift_slowAlloc(12, -1);
    v50 = v9;
    v15 = (uint8_t *)v14;
    v49 = swift_slowAlloc(32, -1);
    v56 = v49;
    *(_DWORD *)v15 = 136315138;
    v48 = v15 + 4;
    v16 = objc_msgSend(v10, "targetTask");
    v55 = (uint64_t)v16;
    v17 = sub_10000A430(&qword_100042558);
    v18 = Optional.descriptionOrNil.getter(v17);
    v19 = a3;
    v20 = a2;
    v22 = v21;

    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    v55 = sub_10002CB54(v18, v22, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v48, v15 + 12);

    v23 = v22;
    a2 = v20;
    a3 = v19;
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "SiriKit asked for resolving target task {targetTask: %s}", v15, 0xCu);
    v24 = v49;
    swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v15, -1, -1);

  }
  else
  {

  }
  v25 = objc_msgSend(v10, *((SEL *)p_align + 166));
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v10, "status") == (id)1;
    v29 = v51;
    v28 = v52;
    *v51 = v27;
    v30 = v53;
    (*(void (**)(BOOL *, _QWORD, uint64_t))(v28 + 104))(v29, enum case for REMSearchCriterion.isCompleted(_:), v53);
    v31 = *(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource + 32);
    v49 = *(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource + 24);
    v50 = v31;
    v48 = sub_10000A4BC((_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource), v49);
    v32 = sub_10000A430(&qword_1000427E0);
    inited = swift_initStackObject(v32, v57);
    *(_OWORD *)(inited + 16) = xmmword_100034890;
    *(_QWORD *)(inited + 32) = v26;
    v56 = inited;
    specialized Array._endMutation()(inited);
    v34 = v56;
    v35 = sub_10000A430(&qword_1000425A0);
    v36 = *(unsigned __int8 *)(v28 + 80);
    v37 = (v36 + 32) & ~v36;
    v38 = swift_allocObject(v35, v37 + *(_QWORD *)(v28 + 72), v36 | 7);
    *(_OWORD *)(v38 + 16) = xmmword_100034880;
    (*(void (**)(uint64_t, BOOL *, uint64_t))(v28 + 16))(v38 + v37, v29, v30);
    v39 = swift_allocObject(&unk_10003D380, 32, 7);
    v40 = v54;
    *(_QWORD *)(v39 + 16) = sub_10000A494;
    *(_QWORD *)(v39 + 24) = v40;
    v41 = v26;
    swift_retain(v40);
    sub_10000D35C(v34, v38, sub_10000D34C, v39, v49, v50);
    swift_bridgeObjectRelease(v34);
    swift_bridgeObjectRelease(v38);
    swift_release(v39);

    (*(void (**)(BOOL *, uint64_t))(v28 + 8))(v29, v30);
    swift_release(v40);
  }
  else
  {
    v42 = Logger.logObject.getter(0);
    v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "INSetTaskAttributeIntent contains nil targetTask, returning INTask.disambiguateWithIncompleteReminders", v44, 2u);
      swift_slowDealloc(v44, -1, -1);
    }

    sub_10000A848(0, &qword_100042308, INTask_ptr);
    v45 = *(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store);
    v46 = sub_10000A848(0, (unint64_t *)&unk_100042590, INTaskResolutionResult_ptr);
    v47 = (void *)static INTask.disambiguateWithIncompleteReminders<A>(store:)(v45, v46);
    ((void (**)(_QWORD, void *))a3)[2](a3, v47);
    swift_release(v54);

  }
}

uint64_t sub_10000BD24(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = objc_msgSend(a1, "contactEventTrigger");

  if (v2)
    return 0;
  if (objc_msgSend(a1, "priority"))
    return 0;
  v3 = objc_msgSend(a1, "spatialEventTrigger");

  if (v3)
    return 0;
  if (objc_msgSend(a1, "status"))
    return 0;
  v4 = objc_msgSend(a1, "taskTitle");

  if (v4)
    return 0;
  v5 = objc_msgSend(a1, "temporalEventTrigger");
  if (v5)
  {

    return 0;
  }
  return 1;
}

void sub_10000BDFC(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t *p_align;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  NSObject *v29;
  os_log_type_t v30;
  BOOL v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;

  if (qword_100042050 != -1)
    swift_once(&qword_100042050, sub_10000A9BC);
  v4 = type metadata accessor for Logger(0);
  sub_10000A4A4(v4, (uint64_t)qword_1000423D0);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  p_align = &stru_100040FE8.align;
  if (os_log_type_enabled(v6, v7))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v38 = a2;
    v10 = swift_slowAlloc(32, -1);
    v40 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = objc_msgSend(v5, "taskTitle");
    v12 = sub_10000A430(&qword_100042588);
    v13 = Optional.descriptionOrNil.getter(v12);
    v15 = v14;

    v16 = v13;
    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    v39 = sub_10002CB54(v16, v15, (uint64_t *)&v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v9 + 4, v9 + 12);

    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SiriKit asked for resolving task title {taskTitle: %s}", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    v17 = v10;
    a2 = v38;
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

  }
  v18 = objc_msgSend(v5, *((SEL *)p_align + 168));
  if (v18)
  {
    v19 = v18;
    v20 = v18;
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v23 = 138412290;
      v40 = v20;
      v25 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v23 + 4, v23 + 12);
      *v24 = v19;

      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Resolving TaskTitle, got new task title, returning success {taskTitle: %@}", v23, 0xCu);
      v26 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v24, 1, v26);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);
    }
    else
    {

      v21 = v20;
    }

    v35 = objc_msgSend((id)objc_opt_self(INSpeakableStringResolutionResult), "successWithResolvedString:", v20);
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v35);

  }
  else
  {
    v27 = sub_10000BD24(v5);
    v28 = v27;
    v29 = Logger.logObject.getter(v27);
    v30 = static os_log_type_t.default.getter();
    v31 = os_log_type_enabled(v29, v30);
    if ((v28 & 1) != 0)
    {
      if (v31)
      {
        v32 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Resolving TaskTitle, nothing to do, returning .needsValue()", v32, 2u);
        swift_slowDealloc(v32, -1, -1);
      }

      v33 = sub_10000A848(0, &qword_100042580, INSpeakableStringResolutionResult_ptr);
      v34 = objc_msgSend((id)swift_getObjCClassFromMetadata(v33), "needsValue");
    }
    else
    {
      if (v31)
      {
        v36 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Resolving TaskTitle, no title, other stuff to do, returning .notRequired()", v36, 2u);
        swift_slowDealloc(v36, -1, -1);
      }

      v37 = sub_10000A848(0, &qword_100042580, INSpeakableStringResolutionResult_ptr);
      v34 = objc_msgSend((id)swift_getObjCClassFromMetadata(v37), "notRequired");
    }
    v35 = v34;
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v35);
  }

}

void sub_10000C2A8(void *a1, char *a2, void *a3)
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
  uint64_t v17;
  char *v18;
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
  uint64_t inited;
  id v30;
  unint64_t v31;
  void (*v32)(char *, uint64_t);
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  NSObject *v37;
  uint8_t *v38;
  NSObject **v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  NSString v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  void (**v73)(const void *, id);
  id v74;
  id v75;
  unsigned int v76;
  id v77;
  Swift::Bool v78;
  id v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  id v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  Swift::Bool v109;
  uint64_t v110;
  NSObject *v111;
  id v112;
  id v113;
  _QWORD *v114;
  __int128 v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  NSObject *v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  const char *v137;
  uint64_t v138;
  id v139;
  id v140;
  void (*v141)(char *, uint64_t, uint64_t);
  char *v142;
  uint64_t v143;
  char *v144;
  __int128 v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void (**v156)(const void *, id);
  char *v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  _BYTE v163[24];
  Swift::OpaquePointer_optional v164;

  v159 = a2;
  v5 = type metadata accessor for TTRRecurrenceRuleModel(0);
  v157 = *(char **)(v5 - 8);
  __chkstk_darwin(v5);
  v146 = (uint64_t)&v139 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000A430(&qword_100042B30);
  v8 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v7);
  v148 = (uint64_t)&v139 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v149 = (char *)&v139 - v10;
  v154 = type metadata accessor for DateComponents(0);
  v153 = *(_QWORD *)(v154 - 8);
  __chkstk_darwin(v154);
  v152 = (char *)&v139 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10000A430((uint64_t *)&unk_100042540);
  v13 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v12);
  v147 = (char *)&v139 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v13);
  v151 = (uint64_t)&v139 - v16;
  __chkstk_darwin(v15);
  v18 = (char *)&v139 - v17;
  v19 = type metadata accessor for Logger(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v19);
  v144 = (char *)&v139 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v21);
  v142 = (char *)&v139 - v24;
  __chkstk_darwin(v23);
  v26 = (char *)&v139 - v25;
  v158 = swift_allocObject(&unk_10003D308, 24, 7);
  *(_QWORD *)(v158 + 16) = a3;
  _Block_copy(a3);
  if (qword_100042050 != -1)
    swift_once(&qword_100042050, sub_10000A9BC);
  v27 = sub_10000A4A4(v19, (uint64_t)qword_1000423D0);
  v141 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v141(v26, v27, v19);
  v28 = sub_10000A430(&qword_1000422C0);
  inited = swift_initStackObject(v28, v163);
  v145 = xmmword_100034880;
  *(_OWORD *)(inited + 16) = xmmword_100034880;
  *(_QWORD *)(inited + 32) = 0x746E65746E69;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = sub_10000A848(0, &qword_100042550, INSetTaskAttributeIntent_ptr);
  *(_QWORD *)(inited + 48) = a1;
  v30 = a1;
  v31 = sub_10001C784(inited);
  sub_1000285E0((uint64_t)"Set task attribute via Siri {intent: %@}", 40, 2, v31);
  swift_bridgeObjectRelease(v31);
  v32 = *(void (**)(char *, uint64_t))(v20 + 8);
  v143 = v19;
  v32(v26, v19);
  v33 = v30;
  v155 = v27;
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.default.getter();
  v36 = os_log_type_enabled(v34, v35);
  v150 = v5;
  v156 = (void (**)(const void *, id))a3;
  if (v36)
  {
    v37 = v33;
    v38 = (uint8_t *)swift_slowAlloc(12, -1);
    v39 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v38 = 138412290;
    v160 = (uint64_t)v33;
    v40 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v160, &v161, v38 + 4, v38 + 12);
    *v39 = v37;

    v33 = v37;
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "SiriKit asked for handling set task attribute intent {intent: %@}", v38, 0xCu);
    v41 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v39, 1, v41);
    swift_slowDealloc(v39, -1, -1);
    swift_slowDealloc(v38, -1, -1);
  }
  else
  {

    v34 = v33;
  }

  v42 = -[NSObject targetTask](v33, "targetTask");
  if (!v42
    || (v43 = v42,
        v44 = *(_QWORD *)&v159[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store],
        v45 = (void *)INTask.remReminder(store:)(v44),
        v43,
        !v45))
  {
    v63 = v33;
    v64 = Logger.logObject.getter(v63);
    v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc(12, -1);
      v67 = swift_slowAlloc(32, -1);
      v160 = v67;
      *(_DWORD *)v66 = 136315138;
      v68 = -[NSObject targetTask](v63, "targetTask");
      v162 = (uint64_t)v68;
      v69 = sub_10000A430(&qword_100042558);
      v70 = Optional.descriptionOrNil.getter(v69);
      v72 = v71;

      v162 = sub_10002CB54(v70, v72, &v160);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, v163, v66 + 4, v66 + 12);

      swift_bridgeObjectRelease(v72);
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "Should have resolved targetTask into a reminder. {targetTask: %s}", v66, 0xCu);
      swift_arrayDestroy(v67, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v67, -1, -1);
      swift_slowDealloc(v66, -1, -1);

    }
    else
    {

    }
    v73 = v156;
    v74 = objc_msgSend(objc_allocWithZone((Class)INSetTaskAttributeIntentResponse), "initWithCode:userActivity:", 4, 0);
    v73[2](v73, v74);
    swift_release(v158);

    return;
  }
  v140 = objc_msgSend(v45, "objectID");
  v46 = objc_msgSend(objc_allocWithZone((Class)REMSaveRequest), "initWithStore:", v44);
  v47 = type metadata accessor for TTRReminderEditor(0);
  v162 = (uint64_t)v45;
  v48 = (char *)v46;
  v139 = v45;
  TTROneshotEditing.init(item:saveRequest:undoManager:)(&v160, &v162, v48, 0, v47, &protocol witness table for TTRReminderEditor);
  v49 = v160;
  v50 = -[NSObject taskTitle](v33, "taskTitle");
  if (v50)
  {
    v51 = v50;
    v52 = objc_msgSend(v50, "spokenPhrase");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
    v53 = v33;
    v55 = v54;

    v56 = objc_allocWithZone((Class)NSAttributedString);
    v57 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v55);
    v58 = objc_msgSend(v56, "initWithString:", v57);

    TTRReminderEditor.edit(title:locale:registeringUndo:)((NSAttributedString)v58, (Swift::String_optional)0, 1);
    v33 = v53;
  }
  v59 = -[NSObject status](v33, "status");
  v60 = v154;
  v61 = (uint64_t)v157;
  if (v59)
  {
    if (v59 == (id)1)
    {
      v62 = 0;
    }
    else
    {
      if (v59 != (id)2)
      {
        v141(v142, v155, v143);
        v135 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
        v136 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
        swift_release(v158);
        _Block_release(v156);
        v137 = "unknown status";
        v138 = 14;
        goto LABEL_51;
      }
      v62 = 1;
    }
    TTRReminderEditor.edit(completed:trackEditedUsing:)(v62, 0);
  }
  v75 = objc_msgSend(*(id *)(v49 + 16), "accountCapabilities");
  v76 = objc_msgSend(v75, "supportsFlagged");

  if (!v76)
    goto LABEL_27;
  v77 = -[NSObject priority](v33, "priority");
  if (!v77)
    goto LABEL_27;
  if (v77 != (id)1)
  {
    if (v77 == (id)2)
    {
      v78 = 1;
      goto LABEL_26;
    }
    v141(v144, v155, v143);
    v135 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
    v136 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
    swift_release(v158);
    _Block_release(v156);
    v137 = "unknown priority";
    v138 = 16;
LABEL_51:
    sub_100028360((uint64_t)v137, v138, 2uLL, v135, v136);
    __break(1u);
    return;
  }
  v78 = 0;
LABEL_26:
  TTRReminderEditor.edit(isFlagged:)(v78);
LABEL_27:
  v79 = -[NSObject spatialEventTrigger](v33, "spatialEventTrigger");
  v80 = v153;
  if (v79)
  {
    v81 = v79;
    v82 = v33;
    sub_10000A848(0, &qword_100042570, REMAlarmLocationTrigger_ptr);
    v83 = v81;
    v84 = REMAlarmLocationTrigger.init(spatialEventTrigger:)();
    if (v84)
    {
      v85 = (void *)v84;
      TTRReminderEditor.edit(locationTrigger:)();

    }
    sub_10000A848(0, &qword_100042578, REMAlarmVehicleTrigger_ptr);
    v86 = v83;
    v87 = REMAlarmVehicleTrigger.init(spatialEventTrigger:)();
    if (v87)
    {
      v88 = (void *)v87;
      TTRReminderEditor.edit(vehicleTrigger:)();

      v86 = v88;
    }
    v33 = v82;

    v61 = (uint64_t)v157;
  }
  v89 = -[NSObject temporalEventTrigger](v33, "temporalEventTrigger");
  if (v89)
  {
    v90 = v89;
    INTemporalEventTrigger.dueDateComponents(timeProvider:)(&v159[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_timeProvider]);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v80 + 56))(v18, 1, 1, v60);
  }
  v91 = v151;
  sub_10000A58C((uint64_t)v18, v151, (uint64_t *)&unk_100042540);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48))(v91, 1, v60) == 1)
  {
    sub_10000A5D0(v91, (uint64_t *)&unk_100042540);
  }
  else
  {
    v157 = v48;
    v92 = v91;
    v93 = v152;
    (*(void (**)(char *, uint64_t, uint64_t))(v80 + 32))(v152, v92, v60);
    v94 = (uint64_t)v147;
    (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v147, v93, v60);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v80 + 56))(v94, 0, 1, v60);
    TTRReminderEditor.edit(dueDateComponents:)(v94);
    sub_10000A5D0(v94, (uint64_t *)&unk_100042540);
    v95 = -[NSObject temporalEventTrigger](v33, "temporalEventTrigger");
    if (v95)
    {
      v96 = v95;
      sub_10000D2E4((uint64_t)&v159[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_timeProvider], (uint64_t)&v160);
      v97 = (uint64_t)v149;
      TTRRecurrenceRuleModel.init(temporalEventTrigger:timeProvider:)(v96, &v160);
      v98 = v150;
    }
    else
    {
      v97 = (uint64_t)v149;
      v98 = v150;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56))(v149, 1, 1, v150);
    }
    v99 = v148;
    sub_10000A58C(v97, v148, &qword_100042B30);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v99, 1, v98) == 1)
    {
      sub_10000A5D0(v97, &qword_100042B30);
      (*(void (**)(char *, uint64_t))(v80 + 8))(v152, v60);
      sub_10000A5D0(v99, &qword_100042B30);
    }
    else
    {
      v156 = (void (**)(const void *, id))v33;
      v100 = v146;
      sub_10000D220(v99, v146);
      v101 = sub_10000A430(&qword_100042568);
      v102 = *(unsigned __int8 *)(v61 + 80);
      v103 = (v102 + 32) & ~v102;
      v104 = swift_allocObject(v101, v103 + *(_QWORD *)(v61 + 72), v102 | 7);
      v105 = v98;
      v106 = (_QWORD *)v104;
      *(_OWORD *)(v104 + 16) = v145;
      v107 = v80;
      v108 = v104 + v103;
      sub_10000D264(v100, v104 + v103);
      v164.value._rawValue = v106;
      v164.is_nil = 0;
      TTRReminderEditor.edit(recurrenceRules:shouldCopyRecurrenceEnd:)(v164, v109);
      swift_setDeallocating(v106);
      swift_arrayDestroy(v108, v106[2], v105);
      swift_deallocClassInstance(v106, 32, 7);
      v110 = v100;
      v33 = v156;
      sub_10000D2A8(v110);
      sub_10000A5D0(v97, &qword_100042B30);
      (*(void (**)(char *, uint64_t))(v107 + 8))(v152, v60);
    }
    v48 = v157;
  }
  v157 = v18;
  v111 = v33;
  v112 = -[NSObject contactEventTrigger](v33, "contactEventTrigger");
  v113 = objc_msgSend(v112, "triggerContact");

  if (v113)
  {
    v114 = sub_10000A4BC(&v159[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver], *(_QWORD *)&v159[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver+ 24]);
    *(double *)&v115 = __chkstk_darwin(v114);
    *((_OWORD *)&v139 - 2) = v115;
    *(&v139 - 2) = v113;
    v116 = sub_10000A430(&qword_100042560);
    swift_allocObject(v116, *(unsigned int *)(v116 + 48), *(unsigned __int16 *)(v116 + 52));
    v117 = v113;
    v118 = Promise.init(resolver:)(sub_10000D214, &v139 - 6);

    swift_retain(v118);
    v119 = v118;
  }
  else
  {
    v160 = 0;
    v120 = sub_10000A430(&qword_100042560);
    swift_allocObject(v120, *(unsigned int *)(v120 + 48), *(unsigned __int16 *)(v120 + 52));
    v118 = Promise.init(value:)(&v160);
    v119 = 0;
  }
  v121 = (_QWORD *)swift_allocObject(&unk_10003D330, 72, 7);
  v121[2] = v49;
  v121[3] = v48;
  v122 = v48;
  v123 = v158;
  v124 = v159;
  v125 = v140;
  v121[4] = v159;
  v121[5] = v125;
  v121[6] = v111;
  v121[7] = sub_10000D358;
  v121[8] = v123;
  v126 = v111;
  v127 = v122;
  swift_retain(v49);
  v128 = v124;
  v129 = v125;
  v130 = v123;
  v131 = v129;
  v132 = swift_retain(v130);
  v133 = (void *)zalgo.getter(v132);
  v134 = dispatch thunk of Promise.then<A>(on:closure:)(v133, sub_10000D1F0, v121, (char *)&type metadata for () + 8);

  swift_release(v119);
  swift_release(v49);

  swift_release(v118);
  swift_release(v134);
  swift_release(v121);

  sub_10000A5D0((uint64_t)v157, (uint64_t *)&unk_100042540);
  swift_release(v130);
}

uint64_t sub_10000D180()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D1A4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

void sub_10000D1F0(void **a1)
{
  uint64_t v1;

  sub_10000B1B4(a1, *(_QWORD *)(v1 + 16), *(id *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48), *(void (**)(void))(v1 + 56));
}

void sub_10000D214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_100029178(a1, a2, a3, a4, *(uint64_t (**)(uint64_t))(v4 + 16), *(_QWORD *)(v4 + 24), *(void **)(v4 + 32));
}

uint64_t sub_10000D220(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTRRecurrenceRuleModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTRRecurrenceRuleModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D2A8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TTRRecurrenceRuleModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D2E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D328()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000D34C(uint64_t a1)
{
  uint64_t v1;

  sub_10000AA4C(a1, *(void (**)(id))(v1 + 16));
}

void sub_10000D35C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t);
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  unint64_t v64;

  v55 = a6;
  v54 = a5;
  v61 = type metadata accessor for REMSearchCriterion(0);
  v10 = *(_QWORD *)(v61 - 8);
  __chkstk_darwin(v61);
  v12 = (uint64_t *)((char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v64 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v51 = a1;
    else
      v51 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v13 = _CocoaArrayWrapper.endIndex.getter(v51);
  }
  else
  {
    v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
  }
  v57 = a3;
  v58 = a4;
  v53 = a2;
  if (v13)
  {
    if (v13 < 1)
    {
      __break(1u);
      return;
    }
    v14 = 0;
    v62 = a1 & 0xC000000000000001;
    v60 = enum case for REMStringMatchingStyle.prefix(_:);
    v59 = enum case for REMSearchCriterion.textualField(_:);
    v15 = _swiftEmptyArrayStorage;
    do
    {
      if (v62)
        v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, a1);
      else
        v21 = *(id *)(a1 + 8 * v14 + 32);
      v20 = v21;
      v22 = (void *)INTask.reminderID.getter();
      if (v22)
      {
        v16 = v22;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v18 = *(_QWORD *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v17 = *(_QWORD *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v18 >= v17 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v18 + 1, 1);
        v19 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v16);
        specialized Array._endMutation()(v19);

        v20 = v16;
      }
      else
      {
        v23 = objc_msgSend(v20, "title");
        v24 = objc_msgSend(v23, "spokenPhrase");

        v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        v27 = v26;

        v28 = (char *)v12 + *(int *)(sub_10000A430(&qword_1000422D8) + 48);
        *v12 = v25;
        v12[1] = v27;
        v29 = type metadata accessor for REMStringMatchingStyle(0);
        (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v28, v60, v29);
        (*(void (**)(uint64_t *, _QWORD, uint64_t))(v10 + 104))(v12, v59, v61);
        if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0)
          v15 = (_QWORD *)sub_10002C814(0, v15[2] + 1, 1, (unint64_t)v15);
        v31 = v15[2];
        v30 = v15[3];
        if (v31 >= v30 >> 1)
          v15 = (_QWORD *)sub_10002C814(v30 > 1, v31 + 1, 1, (unint64_t)v15);
        v15[2] = v31 + 1;
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v10 + 32))((unint64_t)v15+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * v31, v12, v61);
      }
      ++v14;

    }
    while (v13 != v14);
    swift_bridgeObjectRelease(a1);
    v32 = (_QWORD *)v64;
  }
  else
  {
    swift_bridgeObjectRelease(a1);
    v32 = _swiftEmptyArrayStorage;
    v15 = _swiftEmptyArrayStorage;
  }
  v33 = v55;
  v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v55 + 8);
  v35 = swift_bridgeObjectRetain(v32);
  v36 = v56;
  v37 = v54;
  v38 = v34(v35, v54, v33);
  swift_bridgeObjectRelease(v32);
  if (v15[2])
  {
    v39 = sub_10000A430(&qword_1000425F8);
    __chkstk_darwin(v39);
    *(&v52 - 4) = v37;
    *(&v52 - 3) = v33;
    v40 = v53;
    *(&v52 - 2) = v36;
    *(&v52 - 1) = v40;
    swift_bridgeObjectRetain(v15);
    v41 = sub_10002979C((_QWORD *(*)(uint64_t *__return_ptr, uint64_t))sub_10000EE60, (uint64_t)(&v52 - 6), (uint64_t)v15);
    swift_bridgeObjectRelease(v15);
    v42 = v64;
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v42);
    v63 = v41;
    v43 = sub_10000A430(&qword_100042600);
    v44 = sub_10000EED4(&qword_100042608, &qword_100042600);
    v45 = static Promise.all<A>(_:)(&v63, v43, v44);
    swift_bridgeObjectRelease(v41);
    v46 = (_QWORD *)swift_allocObject(&unk_10003D450, 40, 7);
    v46[2] = v57;
    v47 = v58;
    v46[3] = v58;
    v46[4] = v38;
    v48 = swift_retain(v47);
    v49 = (void *)zalgo.getter(v48);
    v50 = dispatch thunk of Promise.then<A>(on:closure:)(v49, sub_10000EEAC, v46, (char *)&type metadata for () + 8);
    swift_release(v50);
    swift_release(v45);
    swift_release(v46);

  }
  else
  {
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v32);
    v57(v38);
    swift_bridgeObjectRelease(v38);
  }
}

uint64_t sub_10000D7F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  v9 = sub_10000A430(&qword_1000425A0);
  v10 = type metadata accessor for REMSearchCriterion(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned __int8 *)(v11 + 80);
  v13 = (v12 + 32) & ~v12;
  v14 = swift_allocObject(v9, v13 + *(_QWORD *)(v11 + 72), v12 | 7);
  *(_OWORD *)(v14 + 16) = xmmword_100034880;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v14 + v13, a1, v10);
  swift_bridgeObjectRetain(a2);
  sub_10000DEE8(v14);
  v15 = a2;
  v16 = sub_10000D928(a2, a3, a4);
  result = swift_bridgeObjectRelease(v15);
  *a5 = v16;
  return result;
}

uint64_t sub_10000D928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[6];

  v5[2] = a2;
  v5[3] = a3;
  v5[5] = a1;
  v3 = sub_10000A430(&qword_1000425F8);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  return Promise.init(resolver:)(sub_10000EEC8, v5);
}

uint64_t sub_10000D97C(uint64_t *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;

  v6 = *a1;
  v7 = *(_QWORD *)(*a1 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain(v6);
    for (i = 0; i != v7; ++i)
    {
      v9 = *(_QWORD *)(v6 + 8 * i + 32);
      v10 = swift_bridgeObjectRetain(v9);
      sub_10000E074(v10, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000E594);
    }
    swift_bridgeObjectRelease(v6);
  }
  swift_bridgeObjectRetain(a4);
  sub_10000E074((uint64_t)_swiftEmptyArrayStorage, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000E594);
  a2(a4);
  return swift_bridgeObjectRelease(a4);
}

uint64_t sub_10000DA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t);

  v13 = swift_allocObject(&unk_10003D478, 32, 7);
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v14 = swift_allocObject(&unk_10003D4A0, 32, 7);
  *(_QWORD *)(v14 + 16) = sub_10000EE30;
  *(_QWORD *)(v14 + 24) = v13;
  v15 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a8 + 24);
  swift_retain(a2);
  v15(a6, sub_10000EE04, v14, a7, a8);
  return swift_release(v14);
}

uint64_t sub_10000DB14(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_10000DB34(uint64_t a1, uint64_t a2)
{
  return sub_10000DBDC(a1, a2, &qword_1000425E8, (uint64_t)sub_10000EDD4);
}

uint64_t sub_10000DB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  void (*v12)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);

  v11 = swift_allocObject(&unk_10003D3D8, 32, 7);
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  v12 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a7 + 80);
  swift_retain();
  v12(sub_10000EE04, v11, a6, a7);
  return swift_release(v11);
}

uint64_t sub_10000DBC8(uint64_t a1, uint64_t a2)
{
  return sub_10000DBDC(a1, a2, &qword_1000425F0, (uint64_t)sub_10000EE24);
}

uint64_t sub_10000DBDC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5;
  _QWORD v7[4];

  v7[2] = a1;
  v7[3] = a2;
  v5 = sub_10000A430(a3);
  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  return Promise.init(resolver:)(a4, v7);
}

uint64_t sub_10000DC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);

  v11 = swift_allocObject(&unk_10003D400, 32, 7);
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  v12 = swift_allocObject(&unk_10003D428, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_10000EE30;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a7 + 88);
  swift_retain();
  v13(sub_10000EF14, v12, a6, a7);
  return swift_release(v12);
}

uint64_t sub_10000DCD0(uint64_t *a1, void (*a2)(_QWORD *, _QWORD *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD *, _QWORD *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;

  v4 = v3;
  v8 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v41 = *(_QWORD **)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v42 = _swiftEmptyArrayStorage;
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v36 = a3;
    v37 = a2;
    v38 = v4;
    v39 = v12;
    v14 = v12 + ((*((unsigned __int8 *)v41 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v41 + 80));
    v40 = v41[9];
    v15 = (uint64_t (*)(char *, uint64_t, uint64_t))v41[2];
    v16 = v9;
    swift_bridgeObjectRetain(v12);
    v17 = v14;
    v35 = v13;
    v18 = v13;
    do
    {
      v19 = v15(v11, v17, v16);
      v20 = v15;
      v21 = v16;
      v22 = REMSiriSearchDataView.ListsResult.lists.getter(v19);
      v23 = (void (*)(char *, uint64_t))v41[1];
      v23(v11, v21);
      v24 = v22;
      v16 = v21;
      sub_10000E074(v24, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000E9BC);
      v17 += v40;
      --v18;
    }
    while (v18);
    v25 = v39;
    swift_bridgeObjectRelease(v39);
    v41 = v42;
    v42 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v25);
    v26 = v40;
    v27 = v35;
    do
    {
      v28 = v15(v11, v14, v16);
      v29 = REMSiriSearchDataView.ListsResult.smartLists.getter(v28);
      v23(v11, v21);
      v30 = v29;
      v16 = v21;
      sub_10000E074(v30, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000E7A8);
      v15 = v20;
      v14 += v26;
      --v27;
    }
    while (v27);
    swift_bridgeObjectRelease(v39);
    v31 = v42;
    v32 = v41;
    v37(v41, v42);
  }
  else
  {
    v31 = _swiftEmptyArrayStorage;
    v32 = _swiftEmptyArrayStorage;
    a2(_swiftEmptyArrayStorage, _swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRelease(v32);
  return swift_bridgeObjectRelease(v31);
}

uint64_t sub_10000DEDC(uint64_t a1)
{
  return sub_10000E074(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000E380);
}

uint64_t sub_10000DEE8(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;
  char v25;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_10002C814(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = type metadata accessor for REMSearchCriterion(0);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy(v14);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v25 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v25, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000E050(uint64_t a1)
{
  return sub_10000E074(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000E7A8);
}

uint64_t sub_10000E05C(uint64_t a1)
{
  return sub_10000E074(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000E9BC);
}

uint64_t sub_10000E068(uint64_t a1)
{
  return sub_10000E074(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000EBD0);
}

uint64_t sub_10000E074(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, uint64_t))
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v5 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v6 < 0)
    v19 = *v2;
  else
    v19 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v2);
  v7 = _CocoaArrayWrapper.endIndex.getter(v19);
  swift_bridgeObjectRelease(v6);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_29;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if ((unint64_t)v6 >> 62)
    goto LABEL_31;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain(v6);
    v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v7, v11, 1, v6);
    swift_bridgeObjectRelease(*v2);
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v6 < 0)
      v20 = v6;
    else
      v20 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v6);
    v11 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v6);
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    v17 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E230(uint64_t a1)
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
  v3 = sub_10002C828(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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

uint64_t sub_10000E380(unint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t (*v18[4])();

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
        sub_10000EED4(&qword_100042628, &qword_100042620);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000A430(&qword_100042620);
          v13 = sub_10002D3C4(v18, i, a3);
          v15 = *v14;
          ((void (*)(uint64_t (**)(), _QWORD))v13)(v18, 0);
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
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000E594(unint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t (*v18[4])();

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
        sub_10000EED4(&qword_100042618, &qword_100042610);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000A430(&qword_100042610);
          v13 = sub_10002D3C4(v18, i, a3);
          v15 = *v14;
          ((void (*)(uint64_t (**)(), _QWORD))v13)(v18, 0);
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
    sub_10000A848(0, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000E7A8(unint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t (*v18[4])();

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
        sub_10000EED4(&qword_1000425B8, &qword_1000425B0);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000A430(&qword_1000425B0);
          v13 = sub_10002D3C4(v18, i, a3);
          v15 = *v14;
          ((void (*)(uint64_t (**)(), _QWORD))v13)(v18, 0);
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
    sub_10000A848(0, &qword_1000425A8, REMSmartList_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000E9BC(unint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t (*v18[4])();

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
        sub_10000EED4(&qword_1000425D0, &qword_1000425C8);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000A430(&qword_1000425C8);
          v13 = sub_10002D3C4(v18, i, a3);
          v15 = *v14;
          ((void (*)(uint64_t (**)(), _QWORD))v13)(v18, 0);
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
    sub_10000A848(0, (unint64_t *)&qword_1000425C0, REMList_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000EBD0(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_10000EED4(&qword_1000425E0, &qword_1000425D8);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000A430(&qword_1000425D8);
          v13 = sub_10002D41C(v18, i, a3);
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
    type metadata accessor for ConfigurationList(0);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000EDD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_10000DB48(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_10000EDE0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EE04()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000EE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_10000DC2C(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_10000EE30(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_10000EE60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_10000D7F8(a1, v2[5], v2[2], v2[3], a2);
}

uint64_t sub_10000EE80()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000EEAC(uint64_t *a1)
{
  uint64_t v1;

  return sub_10000D97C(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_10000EEC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_10000DA5C(a1, a2, a3, a4, v4[4], v4[5], v4[2], v4[3]);
}

uint64_t sub_10000EED4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000A658(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000EF28(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  void (*v29)(_QWORD, _QWORD, _QWORD);
  unint64_t v30;
  char *v31;
  void (*v32)(char *, uint64_t);
  unsigned int (*v33)(char *, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  void (*v36)(_QWORD, _QWORD);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char v41;
  void (*v42)(char *, _QWORD);
  char *v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t result;
  uint64_t v51;
  unint64_t v52;
  int v53;
  char *v54;
  char *v55;
  unint64_t v56;
  void (*v57)(char *, unint64_t, uint64_t);
  char *v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  char *v61;
  char *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  char *v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  int v83;
  unsigned int v84;
  char *v85;
  void (*v86)(_QWORD, _QWORD, _QWORD);
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  void (*v91)(_QWORD, _QWORD);
  unsigned int (*v92)(char *, uint64_t);
  void (*v93)(char *, uint64_t);
  _QWORD v94[2];

  v81 = a1;
  v3 = type metadata accessor for REMSearchableListType(0);
  v90 = *(_QWORD *)(v3 - 8);
  v91 = (void (*)(_QWORD, _QWORD))v3;
  __chkstk_darwin(v3);
  v89 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v88 = (char *)&v74 - v6;
  v7 = type metadata accessor for REMSearchCriterion(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (uint64_t *)((char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v11);
  v13 = (char *)&v74 - v12;
  __chkstk_darwin(v14);
  v79 = (char *)&v74 - v15;
  __chkstk_darwin(v16);
  v80 = (char *)&v74 - v17;
  __chkstk_darwin(v18);
  v20 = (char *)&v74 - v19;
  __chkstk_darwin(v21);
  v23 = (char *)&v74 - v22;
  if ((unint64_t)a2 >> 62)
  {
    if (a2 < 0)
      v70 = a2;
    else
      v70 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v71 = _CocoaArrayWrapper.endIndex.getter(v70);
    swift_bridgeObjectRelease(a2);
    if (v71 < 2)
    {
LABEL_12:
      swift_bridgeObjectRetain(a2);
      if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
        && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
      {
        sub_100010F40((uint64_t)_swiftEmptyArrayStorage);
      }
      else
      {
        v45 = &_swiftEmptySetSingleton;
      }
      v94[0] = v45;
      v46 = swift_bridgeObjectRetain(a2);
      v47 = sub_100011298(v46, (uint64_t)v94);
      swift_bridgeObjectRelease(a2);
      v48 = v94[0];
      v49 = a2;
      goto LABEL_15;
    }
  }
  else if (*(uint64_t *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10) < 2)
  {
    goto LABEL_12;
  }
  v87 = v20;
  v24 = v81;
  v25 = *(_QWORD *)(v81 + 16);
  if (!v25)
    goto LABEL_12;
  v74 = v10;
  v75 = v13;
  v77 = 0;
  v26 = v25;
  v27 = v81 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v93 = *(void (**)(char *, uint64_t))(v8 + 72);
  v28 = enum case for REMSearchCriterion.listType(_:);
  v84 = enum case for REMSearchableListType.grocery(_:);
  v29 = *(void (**)(_QWORD, _QWORD, _QWORD))(v8 + 16);
  v78 = a2;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(v24);
  v76 = v27;
  v82 = v26;
  v30 = v26;
  v31 = v87;
  v85 = v23;
  v86 = v29;
  v83 = v28;
  while (1)
  {
    v29(v23, v27, v7);
    v29(v31, v23, v7);
    v33 = *(unsigned int (**)(char *, uint64_t))(v8 + 88);
    if (v33(v31, v7) == v28)
      break;
    v32 = *(void (**)(char *, uint64_t))(v8 + 8);
    v32(v31, v7);
LABEL_6:
    v32(v23, v7);
    v27 += (unint64_t)v93;
    if (!--v30)
    {
      a2 = v78;
      swift_bridgeObjectRelease(v78);
      v44 = v81;
LABEL_11:
      swift_bridgeObjectRelease(v44);
      goto LABEL_12;
    }
  }
  v92 = v33;
  v34 = *(void (**)(char *, uint64_t))(v8 + 96);
  v35 = v7;
  v34(v31, v7);
  v37 = v90;
  v36 = v91;
  v38 = v88;
  (*(void (**)(char *, char *, void (*)(_QWORD, _QWORD)))(v90 + 32))(v88, v31, v91);
  v39 = v8;
  v40 = v89;
  (*(void (**)(char *, _QWORD, void (*)(_QWORD, _QWORD)))(v37 + 104))(v89, v84, v36);
  v41 = static REMSearchableListType.== infix(_:_:)(v38, v40);
  v42 = *(void (**)(char *, _QWORD))(v37 + 8);
  v43 = v40;
  v8 = v39;
  v42(v43, v36);
  v42(v38, v36);
  v32 = *(void (**)(char *, uint64_t))(v39 + 8);
  if ((v41 & 1) == 0)
  {
    v29 = v86;
    v31 = v87;
    v7 = v35;
    v23 = v85;
    v28 = v83;
    goto LABEL_6;
  }
  v91 = (void (*)(_QWORD, _QWORD))v34;
  v51 = v35;
  v32(v85, v35);
  a2 = v78;
  swift_bridgeObjectRelease(v78);
  v44 = v81;
  swift_bridgeObjectRelease(v81);
  swift_bridgeObjectRetain(v44);
  v52 = 0;
  v53 = enum case for REMSearchCriterion.textualField(_:);
  v55 = v79;
  v54 = v80;
  v56 = v76;
  v57 = (void (*)(char *, unint64_t, uint64_t))v86;
  while (1)
  {
    v57(v54, v56, v51);
    v57(v55, (unint64_t)v54, v51);
    if (v92(v55, v51) == v53)
      break;
    swift_bridgeObjectRetain(v44);
    v32(v55, v51);
    v32(v54, v51);
    swift_bridgeObjectRelease(v44);
    ++v52;
    v56 += (unint64_t)v93;
    if (v82 == v52)
      goto LABEL_11;
  }
  v76 = v56;
  v91(v55, v51);
  a2 = *((_QWORD *)v55 + 1);
  v58 = &v55[*(int *)(sub_10000A430(&qword_1000422D8) + 48)];
  v59 = type metadata accessor for REMStringMatchingStyle(0);
  v60 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v59 - 8) + 8);
  swift_bridgeObjectRetain(v81);
  v61 = v58;
  v44 = v81;
  v93 = v60;
  v60(v61, v59);
  v32(v54, v51);
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(v44);
  if (v82 == v52)
  {
    a2 = v78;
    goto LABEL_11;
  }
  if (v52 >= v82)
  {
    __break(1u);
    goto LABEL_37;
  }
  v62 = v75;
  v57(v75, v76, v51);
  v63 = v74;
  v57((char *)v74, (unint64_t)v62, v51);
  if (v92((char *)v63, v51) != v53)
  {
    v32((char *)v63, v51);
    result = ((uint64_t (*)(char *, uint64_t))v32)(v62, v51);
    __break(1u);
    return result;
  }
  v91(v63, v51);
  v65 = *v63;
  v64 = v63[1];
  v66 = sub_10000A430(&qword_1000422D8);
  v93((char *)v63 + *(int *)(v66 + 48), v59);
  v32(v62, v51);
  swift_bridgeObjectRelease(v44);
  a2 = v78;
  v67 = swift_bridgeObjectRetain(v78);
  v44 = (uint64_t)sub_100010D40(v67, v65, v64);
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(v64);
  if ((unint64_t)v44 >> 62)
  {
LABEL_37:
    if (v44 < 0)
      v72 = v44;
    else
      v72 = v44 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v44);
    v73 = _CocoaArrayWrapper.endIndex.getter(v72);
    swift_bridgeObjectRelease(v44);
    if (!v73)
      goto LABEL_11;
    goto LABEL_26;
  }
  if (!*(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_11;
LABEL_26:
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    sub_100010F40((uint64_t)_swiftEmptyArrayStorage);
  }
  else
  {
    v68 = &_swiftEmptySetSingleton;
  }
  v94[0] = v68;
  v69 = swift_bridgeObjectRetain(v44);
  v47 = sub_100011298(v69, (uint64_t)v94);
  swift_bridgeObjectRelease(v44);
  v48 = v94[0];
  v49 = v44;
LABEL_15:
  swift_bridgeObjectRelease(v49);
  swift_bridgeObjectRelease(v48);
  return (uint64_t)v47;
}

uint64_t sub_10000F5F0(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  uint64_t result;
  Swift::Int v14;
  Swift::Int v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  Swift::Int v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  Swift::Int v34;

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

      v33 = v9;
      v10 = sub_100011464();
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(&v34, &v33, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      v12 = v34;
      swift_unknownObjectRelease(v9);
      result = 0;
      *a1 = v12;
      return result;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v25 = sub_10000FA18(v7, result + 1);
    v34 = v25;
    v26 = *(_QWORD *)(v25 + 16);
    if (*(_QWORD *)(v25 + 24) <= v26)
    {
      v31 = v26 + 1;
      v32 = v8;
      sub_10000FBFC(v31);
      v27 = v34;
    }
    else
    {
      v27 = v25;
      v28 = v8;
    }
    sub_100010160((uint64_t)v8, v27);
    v30 = *v3;
    *v3 = v27;
  }
  else
  {
    v14 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v15 = NSObject._rawHashValue(seed:)(v14);
    v16 = -1 << *(_BYTE *)(v6 + 32);
    v17 = v15 & ~v16;
    if (((*(_QWORD *)(v6 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) != 0)
    {
      sub_100011464();
      v18 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v17);
      v19 = static NSObject.== infix(_:_:)();

      if ((v19 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v23 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v17);
        *a1 = (Swift::Int)v23;
        v24 = v23;
        return 0;
      }
      v20 = ~v16;
      while (1)
      {
        v17 = (v17 + 1) & v20;
        if (((*(_QWORD *)(v6 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) == 0)
          break;
        v21 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v17);
        v22 = static NSObject.== infix(_:_:)();

        if ((v22 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v34 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_1000101E0((uint64_t)v8, v17, isUniquelyReferenced_nonNull_native);
    v30 = *v3;
    *v3 = v34;
  }
  swift_bridgeObjectRelease(v30);
  *a1 = (Swift::Int)v8;
  return 1;
}

uint64_t sub_10000F86C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_100010354(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_10000FA18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
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
    sub_10000A430(&qword_100042638);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_100011464();
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_10000FBFC(v16 + 1);
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
        v7 = __CocoaSet.Iterator.next()();
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

Swift::Int sub_10000FBFC(uint64_t a1)
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
  sub_10000A430(&qword_100042638);
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
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_34;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_34;
          v19 = v8[v14];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v11)
            {
LABEL_34:
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
                  goto LABEL_40;
                if (v14 >= v11)
                  goto LABEL_34;
                v19 = v8[v14];
                ++v20;
                if (v19)
                  goto LABEL_24;
              }
            }
            v14 = v20;
          }
        }
LABEL_24:
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
            goto LABEL_39;
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

Swift::Int sub_10000FE84(uint64_t a1)
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
  sub_10000A430(&qword_100042640);
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

unint64_t sub_100010160(uint64_t a1, uint64_t a2)
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

void sub_1000101E0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
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
    sub_10000FBFC(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_1000104EC();
      goto LABEL_14;
    }
    sub_100010830(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_100011464();
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

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
        v18 = static NSObject.== infix(_:_:)();

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

uint64_t sub_100010354(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_10000FE84(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_100010680();
      goto LABEL_22;
    }
    sub_100010A94(v11);
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

id sub_1000104EC()
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
  sub_10000A430(&qword_100042638);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
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

void *sub_100010680()
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
  sub_10000A430(&qword_100042640);
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

Swift::Int sub_100010830(uint64_t a1)
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
  sub_10000A430(&qword_100042638);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_35:
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
  result = swift_retain_n(v3, 2);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v20 = v18 + 2;
        if (v20 >= v11)
        {
LABEL_33:
          result = swift_release_n(v3, 3);
          v2 = v30;
          goto LABEL_35;
        }
        v19 = *(_QWORD *)(v8 + 8 * v20);
        v14 = v20;
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
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
          goto LABEL_36;
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
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

Swift::Int sub_100010A94(uint64_t a1)
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
  sub_10000A430(&qword_100042640);
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

_QWORD *sub_100010D40(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint32_t *p_align;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v31[4];
  _QWORD *v32;

  v3 = a1;
  v32 = _swiftEmptyArrayStorage;
  if (a1 >> 62)
    goto LABEL_21;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v5 = 0;
      v6 = v3 & 0xC000000000000001;
      v7 = v3 & 0xFFFFFFFFFFFFFF8;
      p_align = &stru_100040FE8.align;
      v28 = v3;
      v27 = v3 & 0xFFFFFFFFFFFFFF8;
      while (v6)
      {
        v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v3);
LABEL_9:
        v10 = v9;
        v11 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_20;
        v12 = objc_msgSend(v9, *((SEL *)p_align + 185));
        if (v12)
        {
          v13 = v12;
          if (objc_msgSend(v12, "shouldCategorizeGroceryItems"))
          {
            v14 = v4;
            v15 = v6;
            v16 = objc_msgSend(v10, "name");
            v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
            v19 = v18;

            v31[2] = v17;
            v31[3] = v19;
            v31[0] = a2;
            v31[1] = a3;
            v20 = sub_100011420();
            v21 = StringProtocol.caseInsensitiveCompare<A>(_:)(v31, &type metadata for String, &type metadata for String, v20, v20);
            swift_bridgeObjectRelease(v19);

            if (v21)
            {

            }
            else
            {
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v22);
              v23 = v32[2];
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v23);
              v24 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v10);
              specialized ContiguousArray._endMutation()(v24);
            }
            v6 = v15;
            v4 = v14;
            v7 = v27;
            v3 = v28;
            p_align = (_DWORD *)(&stru_100040FE8 + 24);
          }
          else
          {

          }
        }
        else
        {

        }
        ++v5;
        if (v11 == v4)
          return v32;
      }
      if (v5 < *(_QWORD *)(v7 + 16))
        break;
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      if (v3 < 0)
        v26 = v3;
      else
        v26 = v3 & 0xFFFFFFFFFFFFFF8;
      v4 = _CocoaArrayWrapper.endIndex.getter(v26);
      if (!v4)
        return _swiftEmptyArrayStorage;
    }
    v9 = *(id *)(v3 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void sub_100010F40(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  id v28;
  Swift::Int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = a1;
  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v6 = a1;
    else
      v6 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_10000A430(&qword_100042638);
      v4 = (_QWORD *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2)
        goto LABEL_4;
LABEL_11:
      if (v1 < 0)
        v7 = v1;
      else
        v7 = v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(v1);
      if (!v5)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  if (v2)
    goto LABEL_11;
LABEL_4:
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
    return;
LABEL_15:
  v8 = (char *)(v4 + 7);
  v44 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v9 = 0;
    v42 = v1;
    while (1)
    {
      v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
      v11 = __OFADD__(v9++, 1);
      if (v11)
      {
        __break(1u);
        goto LABEL_43;
      }
      v12 = v10;
      v13 = NSObject._rawHashValue(seed:)(v4[5]);
      v14 = -1 << *((_BYTE *)v4 + 32);
      v15 = v13 & ~v14;
      v16 = v15 >> 6;
      v17 = *(_QWORD *)&v8[8 * (v15 >> 6)];
      v18 = 1 << v15;
      if (((1 << v15) & v17) != 0)
      {
        sub_100011464();
        v19 = *(id *)(v4[6] + 8 * v15);
        v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0)
        {
LABEL_17:
          swift_unknownObjectRelease(v12);
          v1 = v42;
          goto LABEL_18;
        }
        v21 = ~v14;
        while (1)
        {
          v15 = (v15 + 1) & v21;
          v16 = v15 >> 6;
          v17 = *(_QWORD *)&v8[8 * (v15 >> 6)];
          v18 = 1 << v15;
          if ((v17 & (1 << v15)) == 0)
            break;
          v22 = *(id *)(v4[6] + 8 * v15);
          v23 = static NSObject.== infix(_:_:)();

          if ((v23 & 1) != 0)
            goto LABEL_17;
        }
        v1 = v42;
      }
      *(_QWORD *)&v8[8 * v16] = v18 | v17;
      *(_QWORD *)(v4[6] + 8 * v15) = v12;
      v24 = v4[2];
      v11 = __OFADD__(v24, 1);
      v25 = v24 + 1;
      if (v11)
        goto LABEL_44;
      v4[2] = v25;
LABEL_18:
      if (v9 == v44)
        return;
    }
  }
  v26 = 0;
  v43 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v26 != v43)
  {
    v27 = v4[5];
    v28 = *(id *)(v1 + 32 + 8 * v26);
    v29 = NSObject._rawHashValue(seed:)(v27);
    v30 = -1 << *((_BYTE *)v4 + 32);
    v31 = v29 & ~v30;
    v32 = v31 >> 6;
    v33 = *(_QWORD *)&v8[8 * (v31 >> 6)];
    v34 = 1 << v31;
    if (((1 << v31) & v33) != 0)
    {
      sub_100011464();
      v35 = *(id *)(v4[6] + 8 * v31);
      v36 = static NSObject.== infix(_:_:)();

      if ((v36 & 1) != 0)
        goto LABEL_30;
      v37 = ~v30;
      v31 = (v31 + 1) & v37;
      v32 = v31 >> 6;
      v33 = *(_QWORD *)&v8[8 * (v31 >> 6)];
      v34 = 1 << v31;
      if ((v33 & (1 << v31)) != 0)
      {
        while (1)
        {
          v38 = *(id *)(v4[6] + 8 * v31);
          v39 = static NSObject.== infix(_:_:)();

          if ((v39 & 1) != 0)
            break;
          v31 = (v31 + 1) & v37;
          v32 = v31 >> 6;
          v33 = *(_QWORD *)&v8[8 * (v31 >> 6)];
          v34 = 1 << v31;
          if ((v33 & (1 << v31)) == 0)
            goto LABEL_38;
        }
LABEL_30:

        v5 = v44;
        goto LABEL_31;
      }
LABEL_38:
      v5 = v44;
    }
    *(_QWORD *)&v8[8 * v32] = v34 | v33;
    *(_QWORD *)(v4[6] + 8 * v31) = v28;
    v40 = v4[2];
    v11 = __OFADD__(v40, 1);
    v41 = v40 + 1;
    if (v11)
      goto LABEL_45;
    v4[2] = v41;
LABEL_31:
    if (++v26 == v5)
      return;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
}

_QWORD *sub_100011298(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;

  v3 = a1;
  v24 = _swiftEmptyArrayStorage;
  if (a1 >> 62)
    goto LABEL_16;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v5 = 0;
      v6 = v3 & 0xC000000000000001;
      v7 = v3 & 0xFFFFFFFFFFFFFF8;
      v22 = v3 & 0xFFFFFFFFFFFFFF8;
      while (v6)
      {
        v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v3);
        v9 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_13:
          __break(1u);
          return v24;
        }
LABEL_9:
        v10 = v8;
        v11 = sub_10000F5F0((Swift::Int *)&v23, v10);

        if ((v11 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
          v13 = v6;
          v14 = v4;
          v15 = v3;
          v16 = a2;
          v17 = v24[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
          v18 = v17;
          a2 = v16;
          v3 = v15;
          v4 = v14;
          v6 = v13;
          v7 = v22;
          v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v10);
          specialized ContiguousArray._endMutation()(v19);
        }
        else
        {

        }
        ++v5;
        if (v9 == v4)
          return v24;
      }
      if (v5 < *(_QWORD *)(v7 + 16))
        break;
      __break(1u);
LABEL_16:
      if (v3 < 0)
        v21 = v3;
      else
        v21 = v3 & 0xFFFFFFFFFFFFFF8;
      v4 = _CocoaArrayWrapper.endIndex.getter(v21);
      if (!v4)
        return _swiftEmptyArrayStorage;
    }
    v8 = *(id *)(v3 + 8 * v5 + 32);
    v9 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_13;
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

unint64_t sub_100011420()
{
  unint64_t result;

  result = qword_100042630;
  if (!qword_100042630)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100042630);
  }
  return result;
}

unint64_t sub_100011464()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000425C0;
  if (!qword_1000425C0)
  {
    v1 = objc_opt_self(REMList);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000425C0);
  }
  return result;
}

uint64_t sub_1000114A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042648);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042648);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100011530(uint64_t a1, void (*a2)(void))
{
  uint64_t v2;
  uint64_t v5;

  type metadata accessor for REMSiriSearchDataView(0);
  v5 = static REMSiriSearchDataView.fetchReminders(store:criteria:diffingAgainst:)(*(_QWORD *)(v2 + 16), a1, 0);
  a2();
  return swift_bridgeObjectRelease(v5);
}

uint64_t *sub_100011780(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  Class isa;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  if (!((unint64_t)a1 >> 62))
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
    return _swiftEmptyArrayStorage;
  }
  if (a1 < 0)
    v25 = a1;
  else
    v25 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v26 = _CocoaArrayWrapper.endIndex.getter(v25);
  swift_bridgeObjectRelease(a1);
  if (!v26)
    return _swiftEmptyArrayStorage;
LABEL_3:
  v3 = *(void **)(v1 + 16);
  v4 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v29 = 0;
  v6 = objc_msgSend(v3, "fetchRemindersWithObjectIDs:error:", isa, &v29);

  v7 = v29;
  if (!v6)
  {
    v13 = v29;
    _convertNSErrorToError(_:)(v7);

    swift_willThrow();
    if (qword_100042058 != -1)
      swift_once(&qword_100042058, sub_1000114A0);
    v14 = type metadata accessor for Logger(0);
    sub_10000A4A4(v14, (uint64_t)qword_100042648);
    v15 = swift_bridgeObjectRetain_n(a1, 2);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = (void *)swift_slowAlloc(32, -1);
      v29 = v19;
      *(_DWORD *)v18 = 136315138;
      v20 = swift_bridgeObjectRetain(a1);
      v21 = Array.description.getter(v20, v4);
      v23 = v22;
      swift_bridgeObjectRelease(a1);
      v27 = sub_10002CB54(v21, v23, (uint64_t *)&v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v23);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Error fetching reminders by objetIDs {objectIDs: %s}", v18, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a1, 2);
    }
    swift_errorRelease();
    return _swiftEmptyArrayStorage;
  }
  v8 = sub_10000A848(0, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
  v9 = sub_100013FF4();
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v6, v4, v8, v9);
  v11 = v7;

  v12 = sub_10002D194(v10);
  swift_bridgeObjectRelease(v10);
  return v12;
}

uint64_t sub_100011AA0(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v7 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  __chkstk_darwin(v9);
  v11 = (char *)&v14 - v10;
  if (*(_QWORD *)(a1 + 16) <= 1uLL)
  {
    type metadata accessor for REMSiriSearchDataView(0);
    static REMSiriSearchDataView.fetchLists(store:criteria:diffingAgainst:)(*(_QWORD *)(v3 + 16), a1, 0);
    a2(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  else
  {
    v12 = swift_allocObject(&unk_10003D618, 32, 7);
    *(_QWORD *)(v12 + 16) = a2;
    *(_QWORD *)(v12 + 24) = a3;
    swift_retain(a3);
    sub_100029A20(a1, (uint64_t)sub_100014088, v12);
    return swift_release(v12);
  }
}

uint64_t sub_100011DCC(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a2);
  REMSiriSearchDataView.ListsResult.init(lists:smartLists:)(a1, a2);
  a3(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100011E80(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(uint64_t *, _QWORD, _QWORD *);
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t *, _QWORD *);
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  Class isa;
  id v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  unint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *);
  uint64_t v86;
  _QWORD *v87;
  unint64_t v88;
  unsigned int v89;
  unsigned int v90;
  unint64_t v91;
  char *v92;
  unsigned int v93;
  unsigned int v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint8_t *v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  id v104[3];
  uint64_t v105;

  v86 = a3;
  v85 = a2;
  v84 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v83 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v82 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for REMSearchCriterion(0);
  v99 = *(uint8_t **)(v7 - 8);
  v100 = (_QWORD *)v7;
  __chkstk_darwin(v7);
  v92 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v98 = (uint64_t *)((char *)&v82 - v10);
  v103 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v76 = a1;
    else
      v76 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v11 = _CocoaArrayWrapper.endIndex.getter(v76);
    v87 = v3;
    if (v11)
      goto LABEL_3;
LABEL_42:
    swift_bridgeObjectRelease(a1);
    v51 = (uint64_t)_swiftEmptyArrayStorage;
    v14 = _swiftEmptyArrayStorage;
    if ((unint64_t)_swiftEmptyArrayStorage >> 62)
      goto LABEL_43;
LABEL_28:
    if (*(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_29;
LABEL_47:
    v74 = _swiftEmptyArrayStorage;
    v4 = _swiftEmptyArrayStorage;
    if (v14[2])
      goto LABEL_48;
    goto LABEL_37;
  }
  v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  v87 = v3;
  if (!v11)
    goto LABEL_42;
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
LABEL_51:
    swift_once(&qword_100042058, sub_1000114A0);
LABEL_32:
    v63 = type metadata accessor for Logger(0);
    v64 = sub_10000A4A4(v63, (uint64_t)qword_100042648);
    v65 = Logger.logObject.getter(v64);
    v66 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = (uint8_t *)swift_slowAlloc(12, -1);
      v68 = swift_slowAlloc(32, -1);
      v105 = v68;
      *(_DWORD *)v67 = 136315138;
      v99 = v67 + 4;
      swift_beginAccess(&v103, v104, 0, 0);
      v69 = v103;
      v70 = swift_bridgeObjectRetain(v103);
      v71 = Array.description.getter(v70, v11);
      v73 = v72;
      swift_bridgeObjectRelease(v69);
      v101 = sub_10002CB54(v71, v73, &v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, &v102, v99, v67 + 12);
      swift_bridgeObjectRelease(v73);
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "Error fetching lists by objetIDs {objectIDs: %s}", v67, 0xCu);
      swift_arrayDestroy(v68, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v68, -1, -1);
      swift_slowDealloc(v67, -1, -1);
    }
    swift_errorRelease();

    v74 = _swiftEmptyArrayStorage;
    v14 = v100;
    if (v100[2])
      goto LABEL_48;
LABEL_37:
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v74);
    v75 = v82;
    REMSiriSearchDataView.ListsResult.init(lists:smartLists:)(v4, _swiftEmptyArrayStorage);
    v85(v75);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v75, v84);
    return swift_bridgeObjectRelease(v103);
  }
  v12 = 0;
  v13 = a1 & 0xC000000000000001;
  v94 = enum case for REMStringMatchingStyle.prefix(_:);
  v93 = enum case for REMSearchCriterion.textualField(_:);
  v90 = enum case for REMSearchableListType.grocery(_:);
  v89 = enum case for REMSearchCriterion.listType(_:);
  v14 = _swiftEmptyArrayStorage;
  v91 = (unint64_t)"TTRContactEventTriggerBearing";
  v88 = 0x8000000100035200;
  v95 = a1 & 0xC000000000000001;
  v96 = v11;
  v97 = a1;
  do
  {
    if (v13)
      v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12, a1);
    else
      v15 = *(id *)(a1 + 8 * v12 + 32);
    v16 = v15;
    v17 = (void *)INTaskList.listID.getter();
    if (!v17)
    {
      v22 = objc_msgSend(v16, "title");
      v23 = objc_msgSend(v22, "spokenPhrase");

      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v26 = v25;

      v27 = sub_10000A430(&qword_1000422D8);
      v28 = v98;
      v29 = (char *)v98 + *(int *)(v27 + 48);
      *v98 = v24;
      v28[1] = v26;
      v30 = type metadata accessor for REMStringMatchingStyle(0);
      (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v29, v94, v30);
      v31 = (void (*)(uint64_t *, _QWORD, _QWORD *))*((_QWORD *)v99 + 13);
      v31(v28, v93, v100);
      if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
        v14 = (_QWORD *)sub_10002C814(0, v14[2] + 1, 1, (unint64_t)v14);
      v33 = v14[2];
      v32 = v14[3];
      if (v33 >= v32 >> 1)
        v14 = (_QWORD *)sub_10002C814(v32 > 1, v33 + 1, 1, (unint64_t)v14);
      v14[2] = v33 + 1;
      v34 = (v99[80] + 32) & ~(unint64_t)v99[80];
      v35 = (unint64_t)v14;
      v36 = (char *)v14 + v34;
      v37 = *((_QWORD *)v99 + 9);
      v38 = &v36[v37 * v33];
      v39 = (void (*)(char *, uint64_t *, _QWORD *))*((_QWORD *)v99 + 4);
      v39(v38, v98, v100);
      v40 = objc_msgSend(v16, "title");
      v41 = objc_msgSend(v40, "vocabularyIdentifier");

      if (v41)
      {
        v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
        v44 = v43;

        if (v42 == 0xD000000000000011 && v44 == v88)
        {
          swift_bridgeObjectRelease(v91 | 0x8000000000000000);
LABEL_24:
          v46 = type metadata accessor for REMSearchableListType(0);
          v47 = v92;
          (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v92, v90, v46);
          v31((uint64_t *)v47, v89, v100);
          v49 = *(_QWORD *)(v35 + 16);
          v48 = *(_QWORD *)(v35 + 24);
          if (v49 >= v48 >> 1)
            v35 = sub_10002C814(v48 > 1, v49 + 1, 1, v35);
          *(_QWORD *)(v35 + 16) = v49 + 1;
          v50 = v35 + v34 + v49 * v37;
          v14 = (_QWORD *)v35;
          v39((char *)v50, (uint64_t *)v92, v100);
          goto LABEL_6;
        }
        v45 = _stringCompareWithSmolCheck(_:_:expecting:)(v42, v44, 0xD000000000000011, v91 | 0x8000000000000000, 0);
        swift_bridgeObjectRelease(v44);
        if ((v45 & 1) != 0)
          goto LABEL_24;
      }
      v14 = (_QWORD *)v35;
LABEL_6:
      v11 = v96;
      a1 = v97;
      v13 = v95;
      goto LABEL_7;
    }
    v18 = v17;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v20 = *(_QWORD *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v19 = *(_QWORD *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v20 >= v19 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1);
    v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v18);
    specialized Array._endMutation()(v21);

    v16 = v18;
LABEL_7:
    ++v12;

  }
  while (v11 != v12);
  swift_bridgeObjectRelease(a1);
  v51 = v103;
  v3 = v87;
  if (!(v103 >> 62))
    goto LABEL_28;
LABEL_43:
  if (v51 < 0)
    v77 = v51;
  else
    v77 = v51 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v51);
  v78 = _CocoaArrayWrapper.endIndex.getter(v77);
  swift_bridgeObjectRelease(v51);
  if (!v78)
    goto LABEL_47;
LABEL_29:
  v52 = (void *)v3[2];
  v11 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
  swift_bridgeObjectRetain(v51);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v51);
  v104[0] = 0;
  v54 = objc_msgSend(v52, "fetchListsWithObjectIDs:error:", isa, v104);

  v55 = v104[0];
  if (!v54)
  {
    v100 = v14;
    v62 = v104[0];
    _convertNSErrorToError(_:)(v55);

    swift_willThrow();
    v4 = _swiftEmptyArrayStorage;
    if (qword_100042058 == -1)
      goto LABEL_32;
    goto LABEL_51;
  }
  v56 = sub_10000A848(0, (unint64_t *)&qword_1000425C0, REMList_ptr);
  v57 = sub_100013FF4();
  v58 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v54, v11, v56, v57);
  v59 = v55;

  v4 = sub_10002D1A8(v58);
  swift_bridgeObjectRelease(v58);
  v60 = v103;
  swift_retain(v3);
  v61 = swift_bridgeObjectRetain(v60);
  v74 = sub_1000138D4(v61, v3);
  swift_bridgeObjectRelease(v60);
  swift_release(v3);
  if (!v14[2])
    goto LABEL_37;
LABEL_48:
  v79 = (_QWORD *)swift_allocObject(&unk_10003D5A0, 56, 7);
  v80 = v86;
  v79[2] = v85;
  v79[3] = v80;
  v79[4] = v4;
  v79[5] = v14;
  v79[6] = v74;
  swift_bridgeObjectRetain(v14);
  swift_retain(v80);
  sub_100029A20((uint64_t)v14, (uint64_t)sub_100013FE4, (uint64_t)v79);
  swift_bridgeObjectRelease(v14);
  swift_release(v79);
  return swift_bridgeObjectRelease(v103);
}

uint64_t sub_1000127A8(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v13 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1;
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a5);
  sub_10000E05C(a5);
  v17 = v21;
  v18 = sub_10000EF28(a6, v21);
  swift_bridgeObjectRelease(v17);
  v21 = a2;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a7);
  sub_10000E050(a7);
  REMSiriSearchDataView.ListsResult.init(lists:smartLists:)(v18, v21);
  a3(v16);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_1000128C4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v3;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD *v16;

  v7 = swift_allocObject(&unk_10003D528, 24, 7);
  *(_QWORD *)(v7 + 16) = _swiftEmptyArrayStorage;
  v8 = *(void **)(v3 + 16);
  v9 = (_QWORD *)swift_allocObject(&unk_10003D550, 40, 7);
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = v7;
  v15[4] = sub_100013C00;
  v16 = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100013368;
  v15[3] = &unk_10003D568;
  v10 = _Block_copy(v15);
  v11 = v16;
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a2);
  swift_retain(v7);
  swift_release(v11);
  objc_msgSend(v8, "enumerateAllListsWithBlock:", v10);
  _Block_release(v10);
  swift_beginAccess(v7 + 16, v15, 0, 0);
  v12 = *(_QWORD *)(v7 + 16);
  v13 = swift_bridgeObjectRetain(v12);
  a3(v13);
  swift_release(v7);
  return swift_bridgeObjectRelease(v12);
}

id sub_100012A18(SEL *p_align, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  id result;
  _QWORD *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  SEL *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSString v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char v46;
  SEL *v47;
  _QWORD *v48;
  SEL *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  _QWORD *v60;
  SEL *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[24];

  v9 = type metadata accessor for Logger(0);
  v63 = *(_QWORD *)(v9 - 8);
  v64 = v9;
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = -[SEL isShared](p_align, "isShared", v10);
  if (!(_DWORD)result)
    return result;
  v14 = (_QWORD *)(a5 + 16);
  v15 = -[SEL sharedOwnerAddress](p_align, "sharedOwnerAddress");
  if (v15)
  {
    v16 = v15;
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v19 = v18;

    if ((sub_100012F54(v17, v19, (uint64_t)a3) & 1) != 0)
    {
      swift_bridgeObjectRelease(v19);
    }
    else
    {
      v20 = sub_100012F54(v17, v19, a4);
      swift_bridgeObjectRelease(v19);
      if ((v20 & 1) == 0)
        goto LABEL_10;
    }
    if (-[SEL isShared](p_align, "isShared"))
    {
      swift_beginAccess(v14, v65, 33, 0);
      v21 = p_align;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v23 = *(_QWORD *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v22 = *(_QWORD *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v23 >= v22 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1);
      v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v21);
      specialized Array._endMutation()(v24);
      swift_endAccess(v65);
    }
  }
LABEL_10:
  result = -[SEL shareeContext](p_align, "shareeContext");
  if (result)
  {
    v25 = result;
    v59 = a4;
    v26 = objc_msgSend(result, "sharees");

    v27 = sub_10000A848(0, &qword_100042760, REMSharee_ptr);
    v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v26, v27);

    if ((unint64_t)v28 >> 62)
      goto LABEL_38;
    v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v28);
    while (1)
    {
      v60 = a3;
      v61 = p_align;
      v62 = v14;
      if (!v29)
        break;
      v58 = v12;
      v12 = (char *)(v28 & 0xC000000000000001);
      a3 = _swiftEmptyArrayStorage;
      v30 = 4;
      p_align = (SEL *)&stru_100040FE8.align;
      while (2)
      {
        if (v12)
          v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v30 - 4, v28);
        else
          v31 = *(id *)(v28 + 8 * v30);
        v32 = v31;
        v14 = (_QWORD *)(v30 - 3);
        if (!__OFADD__(v30 - 4, 1))
        {
          switch((unint64_t)objc_msgSend(v31, p_align[140]))
          {
            case 0uLL:
            case 2uLL:
            case 3uLL:
            case 4uLL:
              goto LABEL_15;
            case 1uLL:
            case 5uLL:
              v33 = objc_msgSend(v32, "address");
              if (v33)
              {
                v34 = v33;
                static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
                v36 = v35;

                v37 = String._bridgeToObjectiveC()();
                swift_bridgeObjectRelease(v36);
                v38 = objc_msgSend(v37, "rem_removingMailto");

                v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
                v41 = v40;

                if ((swift_isUniquelyReferenced_nonNull_native(a3) & 1) == 0)
                  a3 = sub_10002C828(0, a3[2] + 1, 1, a3);
                v43 = a3[2];
                v42 = a3[3];
                if (v43 >= v42 >> 1)
                  a3 = sub_10002C828((_QWORD *)(v42 > 1), v43 + 1, 1, a3);
                a3[2] = v43 + 1;
                v44 = &a3[2 * v43];
                v44[4] = v39;
                v44[5] = v41;
                p_align = (SEL *)(&stru_100040FE8 + 24);
              }
              else
              {
LABEL_15:

              }
              ++v30;
              if (v14 != (_QWORD *)v29)
                continue;
              goto LABEL_29;
            default:
              if (qword_100042058 != -1)
                swift_once(&qword_100042058, sub_1000114A0);
              v54 = v64;
              v55 = sub_10000A4A4(v64, (uint64_t)qword_100042648);
              (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v58, v55, v54);
              v56 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
              v57 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
              sub_100028360((uint64_t)"unknown status", 14, 2uLL, v56, v57);
              __break(1u);
              JUMPOUT(0x100012F3CLL);
          }
        }
        break;
      }
      __break(1u);
LABEL_38:
      if (v28 < 0)
        v53 = v28;
      else
        v53 = v28 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n(v28, 2);
      v29 = _CocoaArrayWrapper.endIndex.getter(v53);
      swift_bridgeObjectRelease(v28);
    }
    a3 = _swiftEmptyArrayStorage;
LABEL_29:
    swift_bridgeObjectRelease_n(v28, 2);
    v45 = sub_100023074((uint64_t)a3);
    swift_bridgeObjectRelease(a3);
    if ((sub_100013088(v45, (uint64_t)v60) & 1) != 0)
    {
      v46 = sub_100013088(v45, v59);
      result = (id)swift_bridgeObjectRelease(v45);
      v47 = v61;
      v48 = v62;
      if ((v46 & 1) != 0)
        return result;
    }
    else
    {
      swift_bridgeObjectRelease(v45);
      v47 = v61;
      v48 = v62;
    }
    swift_beginAccess(v48, v65, 33, 0);
    v49 = v47;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v51 = *(_QWORD *)((*v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v50 = *(_QWORD *)((*v48 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v51 >= v50 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v50 > 1, v51 + 1, 1);
    v52 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v51, v49);
    specialized Array._endMutation()(v52);
    return (id)swift_endAccess(v65);
  }
  return result;
}

uint64_t sub_100012F54(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100013088(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  Swift::Int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[9];

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 1;
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 1;
  if (v2 >= v3)
    v4 = a1;
  else
    v4 = a2;
  if (v2 >= v3)
    v5 = a2;
  else
    v5 = a1;
  v34 = v4;
  v35 = v4 + 56;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v4 + 56);
  v33 = (unint64_t)(63 - v6) >> 6;
  v9 = v5 + 56;
  swift_bridgeObjectRetain(v4);
  result = swift_bridgeObjectRetain(v5);
  v11 = 0;
  while (1)
  {
    while (1)
    {
      v12 = v11;
      if (!v8)
        break;
      v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v14 = v13 | (v11 << 6);
      if (*(_QWORD *)(v5 + 16))
        goto LABEL_31;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v33)
      goto LABEL_48;
    v16 = *(_QWORD *)(v35 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v12 + 2;
      if (v12 + 2 >= v33)
        goto LABEL_48;
      v16 = *(_QWORD *)(v35 + 8 * v11);
      if (!v16)
      {
        v11 = v12 + 3;
        if (v12 + 3 >= v33)
          goto LABEL_48;
        v16 = *(_QWORD *)(v35 + 8 * v11);
        if (!v16)
          break;
      }
    }
LABEL_30:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(_QWORD *)(v5 + 16))
    {
LABEL_31:
      v18 = (uint64_t *)(*(_QWORD *)(v34 + 48) + 16 * v14);
      v20 = *v18;
      v19 = v18[1];
      Hasher.init(_seed:)(v36, *(_QWORD *)(v5 + 40));
      swift_bridgeObjectRetain(v19);
      String.hash(into:)(v36, v20, v19);
      v21 = Hasher._finalize()();
      v22 = -1 << *(_BYTE *)(v5 + 32);
      v23 = v21 & ~v22;
      if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
      {
        v24 = *(_QWORD *)(v5 + 48);
        v25 = (_QWORD *)(v24 + 16 * v23);
        v26 = v25[1];
        v27 = *v25 == v20 && v26 == v19;
        if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v25, v26, v20, v19, 0) & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease(v19);
          swift_bridgeObjectRelease(v5);
          v32 = 0;
LABEL_45:
          sub_100013FA0(v34);
          return v32;
        }
        v28 = ~v22;
        while (1)
        {
          v23 = (v23 + 1) & v28;
          if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            break;
          v29 = (_QWORD *)(v24 + 16 * v23);
          v30 = v29[1];
          v31 = *v29 == v20 && v30 == v19;
          if (v31 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v29, v30, v20, v19, 0) & 1) != 0)
            goto LABEL_44;
        }
      }
      result = swift_bridgeObjectRelease(v19);
    }
  }
  v17 = v12 + 4;
  if (v12 + 4 >= v33)
  {
LABEL_48:
    swift_bridgeObjectRelease(v5);
    v32 = 1;
    goto LABEL_45;
  }
  v16 = *(_QWORD *)(v35 + 8 * v17);
  if (v16)
  {
    v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v33)
      goto LABEL_48;
    v16 = *(_QWORD *)(v35 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_30;
  }
LABEL_50:
  __break(1u);
  return result;
}

void sub_100013368(uint64_t a1, void *a2)
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

id sub_1000133C4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  _QWORD v15[3];
  _BYTE v16[16];
  id v17;

  v1 = *(void **)(v0 + 16);
  v17 = 0;
  v2 = objc_msgSend(v1, "fetchDefaultListWithError:", &v17);
  if (v17)
  {
    v3 = v17;

    swift_willThrow();
    if (qword_100042058 != -1)
      swift_once(&qword_100042058, sub_1000114A0);
    v4 = type metadata accessor for Logger(0);
    sub_10000A4A4(v4, (uint64_t)qword_100042648);
    v5 = v3;
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = (void *)swift_slowAlloc(32, -1);
      v17 = v9;
      *(_DWORD *)v8 = 136315138;
      swift_getErrorValue(v5, v16, v15);
      v10 = Error.localizedDescription.getter(v15[1], v15[2]);
      v12 = v11;
      v14 = sub_10002CB54(v10, v11, (uint64_t *)&v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, v15, v8 + 4, v8 + 12);

      swift_bridgeObjectRelease(v12);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error fetching default list %s", v8, 0xCu);
      swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v2;
}

uint64_t sub_1000135E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t Options;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v19[0] = a1;
  Options = type metadata accessor for REMAccountsListDataView.FetchOptions(0);
  v3 = *(_QWORD *)(Options - 8);
  v4 = __chkstk_darwin(Options);
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for REMAccountsListDataView.Result(0, v4);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000A430(&qword_100042758);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for REMAccountsListDataView(0, v12);
  v15 = *(_QWORD *)(v1 + 16);
  static REMAccountsListDataView.FetchOptions.accountsOnly.getter();
  static REMAccountsListDataView.fetchModel(store:diffingAgainst:options:)(v15, 0, v6);
  v16 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, Options);
  REMAccountsListDataView.Result.model.getter(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v17 = type metadata accessor for REMAccountsListDataView.Model(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 0, 1, v17);
  ((void (*)(char *))v19[0])(v14);
  return sub_100013B68((uint64_t)v14);
}

uint64_t sub_1000137AC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for TTRIntentsHandlerStoreDataSource()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension32TTRIntentsHandlerStoreDataSource);
}

uint64_t *sub_1000137F0(uint64_t a1)
{
  return sub_100011780(a1);
}

uint64_t sub_100013810(uint64_t a1, void (*a2)(void))
{
  return sub_100011530(a1, a2);
}

uint64_t sub_100013830(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_100011AA0(a1, a2, a3);
}

uint64_t sub_100013850(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_100011E80(a1, a2, a3);
}

uint64_t sub_100013870(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_1000128C4(a1, a2, a3);
}

id sub_100013890()
{
  return sub_1000133C4();
}

uint64_t sub_1000138B0(uint64_t a1)
{
  return sub_1000135E4(a1);
}

_QWORD *sub_1000138D4(uint64_t a1, _QWORD *a2)
{
  uint32_t *v2;
  uint32_t *p_align;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint32_t *v19;
  id v20;
  _QWORD *v21;

  p_align = v2;
  if ((unint64_t)a1 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = &_swiftEmptyArrayStorage;
    if (!v6)
      break;
    v21 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v6);
    if (v6 < 0)
      __break(1u);
    v19 = p_align;
    v8 = 0;
    a2 = (_QWORD *)a2[2];
    p_align = &stru_100040FE8.align;
    while (v6 != v8)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a1);
      else
        v9 = *(id *)(a1 + 8 * v8 + 32);
      v10 = v9;
      v20 = 0;
      v11 = objc_msgSend(a2, "fetchCustomSmartListWithObjectID:error:", v9, &v20, v19);
      v12 = v20;
      if (!v11)
      {
        v17 = v20;
        _convertNSErrorToError(_:)(v12);

        swift_willThrow();
        return (_QWORD *)swift_release(v21);
      }
      v13 = v11;
      ++v8;
      v14 = v20;

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v15 = v21[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
      v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v13);
      specialized ContiguousArray._endMutation()(v16);
      if (v6 == v8)
        return v21;
    }
    __break(1u);
LABEL_16:
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v6 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a1);
  }
  return result;
}

uint64_t sub_100013AA0(void (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = sub_10000A430(&qword_100042C20);
  v3 = swift_allocObject(v2, 72, 7);
  *(_OWORD *)(v3 + 16) = xmmword_100034BF0;
  v4 = (void *)REMSmartListTypeToday;
  v5 = (void *)REMSmartListTypeScheduled;
  *(_QWORD *)(v3 + 32) = REMSmartListTypeToday;
  *(_QWORD *)(v3 + 40) = v5;
  v6 = (void *)REMSmartListTypeAll;
  v7 = (void *)REMSmartListTypeFlagged;
  *(_QWORD *)(v3 + 48) = REMSmartListTypeAll;
  *(_QWORD *)(v3 + 56) = v7;
  v8 = (void *)REMSmartListTypeAssigned;
  *(_QWORD *)(v3 + 64) = REMSmartListTypeAssigned;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  a1(v3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_100013B68(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000A430(&qword_100042758);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100013BA8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100013BCC()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_bridgeObjectRelease(v0[3]);
  swift_release(v0[4]);
  return swift_deallocObject(v0, 40, 7);
}

id sub_100013C00(SEL *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100012A18(a1, a2, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_100013C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100013C1C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100013C24(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v8 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  v12 = (char *)&v17 - v11;
  v13 = swift_allocObject(&unk_10003D5C8, 32, 7);
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  if (*(_QWORD *)(a1 + 16) < 2uLL)
  {
    type metadata accessor for REMSiriSearchDataView(0);
    v16 = *(_QWORD *)(a2 + 16);
    swift_retain(a4);
    static REMSiriSearchDataView.fetchLists(store:criteria:diffingAgainst:)(v16, a1, 0);
    a3(v12);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    return swift_release(v13);
  }
  else
  {
    v14 = swift_allocObject(&unk_10003D5F0, 32, 7);
    *(_QWORD *)(v14 + 16) = sub_10001404C;
    *(_QWORD *)(v14 + 24) = v13;
    swift_retain(a4);
    swift_retain(v13);
    sub_100029A20(a1, sub_100014078, v14);
    swift_release(v13);
    return swift_release(v14);
  }
}

uint64_t sub_100013FA0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100013FA8()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100013FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000127A8(a1, a2, *(void (**)(char *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

unint64_t sub_100013FF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042770;
  if (!qword_100042770)
  {
    v1 = sub_10000A848(255, &qword_100042768, REMObjectID_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100042770);
  }
  return result;
}

uint64_t sub_10001404C(uint64_t a1)
{
  uint64_t v1;

  return sub_10000DB14(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_100014054()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014078(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100011DCC(a1, a2, *(void (**)(char *))(v2 + 16));
}

uint64_t sub_10001408C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042780);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042780);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10001411C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  id v17;

  v7 = objc_msgSend(a1, "tasks");
  if (v7)
  {
    v8 = v7;
    v9 = sub_10000A848(0, &qword_100042308, INTask_ptr);
    v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

    v11 = (_QWORD *)swift_allocObject(&unk_10003D6C0, 32, 7);
    v11[2] = a2;
    v11[3] = a3;
    swift_retain();
    sub_10002E3BC(v10, (uint64_t)sub_1000154C0, (uint64_t)v11);
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    v12 = *(_QWORD **)(v3 + OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_dataSource);
    v13 = (_QWORD *)swift_allocObject(&unk_10003D670, 40, 7);
    v13[2] = a2;
    v13[3] = a3;
    v13[4] = a1;
    v14 = v12[6];
    v15 = v12[7];
    sub_10000A4BC(v12 + 3, v14);
    v11 = (_QWORD *)swift_allocObject(&unk_10003D698, 40, 7);
    v11[2] = v12;
    v11[3] = sub_100015458;
    v11[4] = v13;
    v16 = *(void (**)(uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v15 + 8);
    swift_retain();
    v17 = a1;
    swift_retain();
    swift_retain();
    v16(sub_100015490, v11, v14, v15);
    swift_release(v13);
  }
  return swift_release(v11);
}

void sub_1000142A8(uint64_t a1, void (*a2)(_QWORD *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  Class isa;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  id v46;
  _QWORD *v47;
  uint64_t v48;

  if (!((unint64_t)a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_31:
    if (qword_100042060 != -1)
      swift_once(&qword_100042060, sub_10001408C);
    v38 = type metadata accessor for Logger(0);
    v39 = sub_10000A4A4(v38, (uint64_t)qword_100042780);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "No reminders found for searchTerm {result: .unsupported(.noTasksFound)}", v42, 2u);
      swift_slowDealloc(v42, -1, -1);
    }

    v15 = objc_msgSend((id)objc_opt_self(INSnoozeTasksTaskResolutionResult), "unsupportedForReason:", 1);
    goto LABEL_36;
  }
  if (a1 < 0)
    v36 = a1;
  else
    v36 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v37 = _CocoaArrayWrapper.endIndex.getter(v36);
  swift_bridgeObjectRelease(a1);
  if (!v37)
    goto LABEL_31;
  swift_bridgeObjectRetain(a1);
  v4 = _CocoaArrayWrapper.endIndex.getter(v36);
  swift_bridgeObjectRelease(a1);
LABEL_3:
  if (v4 == 1)
  {
    if (qword_100042060 != -1)
      swift_once(&qword_100042060, sub_10001408C);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_10000A4A4(v5, (uint64_t)qword_100042780);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.info.getter();
    v4 = v8;
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v4, "One reminder found for searchTerm {result: .success}", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    if ((a1 & 0xC000000000000001) != 0)
    {
      v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
      goto LABEL_11;
    }
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v10 = *(id *)(a1 + 32);
LABEL_11:
      v11 = v10;
      v12 = (void *)objc_opt_self(INTaskResolutionResult);
      sub_10000A848(0, &qword_100042308, INTask_ptr);
      v13 = (void *)INTask.init(reminder:)(v11);
      v14 = objc_msgSend(v12, "successWithResolvedTask:", v13);

      v15 = objc_msgSend(objc_allocWithZone((Class)INSnoozeTasksTaskResolutionResult), "initWithTaskResolutionResult:", v14);
LABEL_36:
      v43 = sub_10000A430(&qword_1000427E0);
      v44 = swift_allocObject(v43, 40, 7);
      *(_OWORD *)(v44 + 16) = xmmword_100034890;
      *(_QWORD *)(v44 + 32) = v15;
      v47 = (_QWORD *)v44;
      specialized Array._endMutation()(v44);
      v45 = v47;
      v46 = v15;
      a2(v45);
      swift_bridgeObjectRelease(v45);

      return;
    }
    __break(1u);
  }
  else if (qword_100042060 == -1)
  {
    goto LABEL_13;
  }
  swift_once(&qword_100042060, sub_10001408C);
LABEL_13:
  v16 = type metadata accessor for Logger(0);
  sub_10000A4A4(v16, (uint64_t)qword_100042780);
  v17 = swift_bridgeObjectRetain(a1);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v20 = 134217984;
    v47 = (_QWORD *)v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Found %ld reminders found for searchTerm {result: .disambiguation}", v20, 0xCu);
    swift_slowDealloc(v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease(a1);
  }
  v21 = _swiftEmptyArrayStorage;
  if (!v4)
    goto LABEL_25;
  v47 = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v4);
  if ((v4 & 0x8000000000000000) == 0)
  {
    sub_10000A848(0, &qword_100042308, INTask_ptr);
    if ((a1 & 0xC000000000000001) != 0)
    {
      v22 = 0;
      do
      {
        v23 = v22 + 1;
        v24 = specialized _ArrayBuffer._getElementSlowPath(_:)(v22, a1);
        v25 = INTask.init(reminder:)(v24);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v25);
        v26 = v47[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v26);
        v27 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v25);
        specialized ContiguousArray._endMutation()(v27);
        v22 = v23;
      }
      while (v4 != v23);
    }
    else
    {
      v28 = (void **)(a1 + 32);
      do
      {
        v29 = *v28++;
        v30 = INTask.init(reminder:)(v29);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v30);
        v31 = v47[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v31);
        v32 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v30);
        specialized ContiguousArray._endMutation()(v32);
        --v4;
      }
      while (v4);
    }
    v21 = v47;
LABEL_25:
    v33 = (void *)objc_opt_self(INTaskResolutionResult);
    sub_10000A848(0, &qword_100042308, INTask_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    v35 = objc_msgSend(v33, "disambiguationWithTasksToDisambiguate:", isa);

    v15 = objc_msgSend(objc_allocWithZone((Class)INSnoozeTasksTaskResolutionResult), "initWithTaskResolutionResult:", v35);
    goto LABEL_36;
  }
  __break(1u);
}

uint64_t sub_100014868(uint64_t a1, void (*a2)(_QWORD), int a3, id a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  void (*v31)(_QWORD);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void **v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *ObjCClassFromMetadata;
  Class isa;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  _QWORD *v80;
  id v81;
  _QWORD *v82;
  os_log_type_t v83;
  _QWORD *v84;
  _QWORD *v85;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v72 = a1;
    else
      v72 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v73 = _CocoaArrayWrapper.endIndex.getter(v72);
    swift_bridgeObjectRelease(a1);
    if (v73)
    {
      swift_bridgeObjectRetain(a1);
      v7 = _CocoaArrayWrapper.endIndex.getter(v72);
      swift_bridgeObjectRelease(a1);
      if (v7 == 1)
        goto LABEL_6;
LABEL_4:
      v8 = objc_msgSend(a4, "all");
      if (!v8 || (v9 = v8, v10 = objc_msgSend(v8, "BOOLValue"), v9, !v10))
      {
        if (qword_100042060 == -1)
        {
LABEL_17:
          v25 = type metadata accessor for Logger(0);
          sub_10000A4A4(v25, (uint64_t)qword_100042780);
          v26 = swift_bridgeObjectRetain_n(a1, 2);
          v27 = Logger.logObject.getter(v26);
          v28 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v27, v28))
          {
            v29 = (uint8_t *)swift_slowAlloc(12, -1);
            v30 = (_QWORD *)swift_slowAlloc(32, -1);
            v85 = v30;
            *(_DWORD *)v29 = 136315138;
            v31 = a2;
            v32 = sub_10000A848(0, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
            v33 = swift_bridgeObjectRetain(a1);
            v34 = Array.description.getter(v33, v32);
            v36 = v35;
            swift_bridgeObjectRelease(a1);
            v37 = v34;
            a2 = v31;
            v84 = (_QWORD *)sub_10002CB54(v37, v36, (uint64_t *)&v85);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, &v85, v29 + 4, v29 + 12);
            swift_bridgeObjectRelease_n(a1, 2);
            swift_bridgeObjectRelease(v36);
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "Multiple reminders match but user didn't say 'all'. Ask the user to disambiguate which reminder to snooze. {reminders: %s, result: .disambiguation}", v29, 0xCu);
            swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v30, -1, -1);
            swift_slowDealloc(v29, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n(a1, 2);
          }
          v53 = sub_10000A430(&qword_1000427E0);
          v54 = (_QWORD *)swift_allocObject(v53, 40, 7);
          *((_OWORD *)v54 + 1) = xmmword_100034890;
          v55 = _swiftEmptyArrayStorage;
          if (!v7)
            goto LABEL_40;
          v85 = _swiftEmptyArrayStorage;
          result = specialized ContiguousArray.reserveCapacity(_:)(v7);
          if ((v7 & 0x8000000000000000) == 0)
          {
            sub_10000A848(0, &qword_100042308, INTask_ptr);
            if ((a1 & 0xC000000000000001) != 0)
            {
              v56 = 0;
              do
              {
                v57 = v56 + 1;
                v58 = specialized _ArrayBuffer._getElementSlowPath(_:)(v56, a1);
                v59 = INTask.init(reminder:)(v58);
                specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v59);
                v60 = v85[2];
                specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v60);
                v61 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v60, v59);
                specialized ContiguousArray._endMutation()(v61);
                v56 = v57;
              }
              while (v7 != v57);
            }
            else
            {
              v62 = (void **)(a1 + 32);
              do
              {
                v63 = *v62++;
                v64 = INTask.init(reminder:)(v63);
                specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v64);
                v65 = v85[2];
                specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v65);
                v66 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v65, v64);
                specialized ContiguousArray._endMutation()(v66);
                --v7;
              }
              while (v7);
            }
            v55 = v85;
LABEL_40:
            v67 = sub_10000A848(0, &qword_1000427E8, INSnoozeTasksTaskResolutionResult_ptr);
            ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v67);
            sub_10000A848(0, &qword_100042308, INTask_ptr);
            isa = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v55);
            v70 = objc_msgSend(ObjCClassFromMetadata, "disambiguationWithTasksToDisambiguate:", isa);

            v54[4] = v70;
            v85 = v54;
            specialized Array._endMutation()(v71);
            v42 = v85;
            goto LABEL_41;
          }
          goto LABEL_57;
        }
LABEL_55:
        swift_once(&qword_100042060, sub_10001408C);
        goto LABEL_17;
      }
LABEL_6:
      if (qword_100042060 != -1)
        swift_once(&qword_100042060, sub_10001408C);
      v11 = type metadata accessor for Logger(0);
      sub_10000A4A4(v11, (uint64_t)qword_100042780);
      v12 = swift_bridgeObjectRetain_n(a1, 2);
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v83 = v14;
        v15 = swift_slowAlloc(22, -1);
        v82 = (_QWORD *)swift_slowAlloc(32, -1);
        v84 = (_QWORD *)v7;
        v85 = v82;
        *(_DWORD *)v15 = 134218242;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, &v85, v15 + 4, v15 + 12);
        *(_WORD *)(v15 + 12) = 2080;
        v16 = _swiftEmptyArrayStorage;
        if (v7)
        {
          v84 = _swiftEmptyArrayStorage;
          result = specialized ContiguousArray.reserveCapacity(_:)(v7);
          if (v7 < 0)
          {
            __break(1u);
LABEL_57:
            __break(1u);
            return result;
          }
          v18 = 0;
          do
          {
            if ((a1 & 0xC000000000000001) != 0)
              v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18, a1);
            else
              v19 = *(id *)(a1 + 8 * v18 + 32);
            v20 = v19;
            ++v18;
            v21 = objc_msgSend(v19, "objectID");

            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v22);
            v23 = v84[2];
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v23);
            v24 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v21);
            specialized ContiguousArray._endMutation()(v24);
          }
          while (v7 != v18);
          v16 = v84;
        }
        v38 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
        v39 = Array.description.getter(v16, v38);
        v41 = v40;
        swift_bridgeObjectRelease(v16);
        v84 = (_QWORD *)sub_10002CB54(v39, v41, (uint64_t *)&v85);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, &v85, v15 + 14, v15 + 22);
        swift_bridgeObjectRelease_n(a1, 2);
        swift_bridgeObjectRelease(v41);
        _os_log_impl((void *)&_mh_execute_header, v13, v83, "Resolved %ld tasks to snooze. {reminderIDs: %s, result: .success}", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy(v82, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v82, -1, -1);
        swift_slowDealloc(v15, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a1, 2);
      }
      v42 = _swiftEmptyArrayStorage;
      if (!v7)
      {
LABEL_41:
        a2(v42);
        return swift_bridgeObjectRelease(v42);
      }
      v85 = _swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v7);
      if ((v7 & 0x8000000000000000) == 0)
      {
        v43 = sub_10000A848(0, &qword_1000427E8, INSnoozeTasksTaskResolutionResult_ptr);
        v44 = (void *)swift_getObjCClassFromMetadata(v43);
        sub_10000A848(0, &qword_100042308, INTask_ptr);
        v45 = 0;
        do
        {
          if ((a1 & 0xC000000000000001) != 0)
            v46 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v45, a1);
          else
            v46 = *(id *)(a1 + 8 * v45 + 32);
          ++v45;
          v47 = v46;
          v48 = (void *)INTask.init(reminder:)(v47);
          v49 = objc_msgSend(v44, "successWithResolvedTask:", v48);

          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v50);
          v51 = v85[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v51);
          v52 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v51, v49);
          specialized ContiguousArray._endMutation()(v52);
        }
        while (v7 != v45);
        v42 = v85;
        a2(v85);
        return swift_bridgeObjectRelease(v42);
      }
      __break(1u);
      goto LABEL_55;
    }
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
      if (v7 == 1)
        goto LABEL_6;
      goto LABEL_4;
    }
  }
  if (qword_100042060 != -1)
    swift_once(&qword_100042060, sub_10001408C);
  v74 = type metadata accessor for Logger(0);
  v75 = sub_10000A4A4(v74, (uint64_t)qword_100042780);
  v76 = Logger.logObject.getter(v75);
  v77 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v76, v77))
  {
    v78 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v78 = 0;
    _os_log_impl((void *)&_mh_execute_header, v76, v77, "No reminders to snooze. {result: .unsupported(.noTasksFound)}", v78, 2u);
    swift_slowDealloc(v78, -1, -1);
  }

  v79 = sub_10000A430(&qword_1000427E0);
  v80 = (_QWORD *)swift_allocObject(v79, 40, 7);
  *((_OWORD *)v80 + 1) = xmmword_100034890;
  v81 = objc_msgSend((id)objc_opt_self(INSnoozeTasksTaskResolutionResult), "unsupportedForReason:", 1);
  v80[4] = v81;
  v85 = v80;
  specialized Array._endMutation()(v81);
  a2(v80);
  return swift_bridgeObjectRelease(v80);
}

void sub_100015218(uint64_t a1, uint64_t a2)
{
  Class isa;

  sub_10000A848(0, &qword_1000427E8, INSnoozeTasksTaskResolutionResult_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, isa);

}

id sub_100015394()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSnoozeTasksIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRSnoozeTasksIntentHandler()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler);
}

uint64_t sub_10001542C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100015458(uint64_t a1)
{
  uint64_t v1;

  return sub_100014868(a1, *(void (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24), *(id *)(v1 + 32));
}

uint64_t sub_100015464()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100015490(uint64_t a1)
{
  uint64_t v1;

  return sub_10002E880(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_10001549C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1000154C0(uint64_t a1)
{
  uint64_t v1;

  sub_1000142A8(a1, *(void (**)(_QWORD *))(v1 + 16));
}

id sub_1000154C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  Class isa;
  Class v14;
  uint64_t v15;
  uint64_t v16;
  Class v17;
  uint64_t v18;
  uint64_t v19;
  Class v20;
  id v21;

  v5 = v4;
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  isa = 0;
  if (v12(a1, 1, v10) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  }
  if (v12(a2, 1, v10) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  }
  v15 = type metadata accessor for Calendar(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(a3, 1, v15) != 1)
  {
    v17 = Calendar._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  }
  v18 = type metadata accessor for TimeZone(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(a4, 1, v18) != 1)
  {
    v20 = TimeZone._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a4, v18);
  }
  v21 = objc_msgSend(v5, "initWithStartDate:endDate:onCalendar:inTimeZone:", isa, v14, v17, v20);

  return v21;
}

uint64_t sub_100015668(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    return __CocoaDictionary.startIndex.getter(a1);
  }
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v1 = 1 << v5;
  if (v6 < 7)
    return v1;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v3 = 64;
  while (v8)
  {
    v10 = *v9++;
    v2 = v10;
    --v8;
    v3 += 64;
    if (v10)
      return __clz(__rbit64(v2)) + v3;
  }
  return v1;
}

void sub_100015728(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        _HashTable.occupiedBucket(after:)(a1);
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (__CocoaDictionary.Index.age.getter(a1, a2) != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v6 = __CocoaDictionary.Index.key.getter(a1, a2);
  v13 = v6;
  sub_100017100(a1, a2, 1);
  v7 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
  swift_unknownObjectRetain(v6, v8);
  swift_dynamicCast(&v14, &v13, (char *)&type metadata for Swift.AnyObject + 8, v7, 7);
  v9 = v14;
  swift_unknownObjectRelease(v6);
  sub_100022754((uint64_t)v9);
  v11 = v10;

  if ((v11 & 1) != 0)
  {
    v12 = __CocoaDictionary.Index.dictionary.getter(a1, a2);
    __CocoaDictionary.index(after:)(a1, a2, v12);
    sub_1000170F4(a1, a2, 1);
    swift_unknownObjectRelease(v12);
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_1000158C4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
LABEL_15:
        v17 = *(id *)(*(_QWORD *)(a4 + 56) + 8 * v6);
        return;
      }
      __break(1u);
LABEL_13:
      if (__CocoaDictionary.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        v11 = __CocoaDictionary.Index.key.getter(v6, a2);
        v18 = v11;
        v12 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
        swift_unknownObjectRetain(v11, v13);
        swift_dynamicCast(&v19, &v18, (char *)&type metadata for Swift.AnyObject + 8, v12, 7);
        v14 = v19;
        swift_unknownObjectRelease(v11);
        v6 = sub_100022754((uint64_t)v14);
        v16 = v15;

        if ((v16 & 1) != 0)
          goto LABEL_15;
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    __break(1u);
    goto LABEL_18;
  }
  if ((a3 & 1) == 0)
  {
LABEL_20:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  v8 = __CocoaDictionary.value(at:)(a1, a2, v7);
  v18 = v8;
  v9 = sub_10000A848(0, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
  swift_unknownObjectRetain(v8, v10);
  swift_dynamicCast(&v19, &v18, (char *)&type metadata for Swift.AnyObject + 8, v9, 7);
  swift_unknownObjectRelease(v8);
}

_QWORD *sub_100015A80(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  void (*v27)(_BYTE *, _QWORD);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE v31[32];
  _QWORD *v32;
  uint64_t v33;
  char v34;
  _QWORD *v35;

  v3 = a1;
  v30 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    v4 = __CocoaDictionary.count.getter(a1);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 16);
  }
  result = _swiftEmptyArrayStorage;
  if (v4)
  {
    v35 = _swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v4);
    result = (_QWORD *)sub_100015668(v3);
    v32 = result;
    v33 = v6;
    v34 = v7 & 1;
    if (v4 < 0)
    {
      __break(1u);
LABEL_21:
      __break(1u);
    }
    else
    {
      v8 = v3 & 0xFFFFFFFFFFFFFF8;
      if (v3 < 0)
        v8 = v3;
      v29 = v8;
      do
      {
        while (1)
        {
          v15 = (uint64_t)v32;
          v16 = v33;
          v17 = v34;
          sub_1000158C4((uint64_t)v32, v33, v34, v3);
          v19 = v18;
          v20 = objc_msgSend(a2, "updateReminder:", v18);

          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v21);
          v22 = v35[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v22);
          v23 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v20);
          result = (_QWORD *)specialized ContiguousArray._endMutation()(v23);
          if (v30)
            break;
          sub_100015728(v15, v16, v17, v3);
          v10 = v9;
          v12 = v11;
          v14 = v13;
          sub_1000170F4(v15, v16, v17);
          v32 = (_QWORD *)v10;
          v33 = v12;
          v34 = v14 & 1;
          if (!--v4)
            goto LABEL_18;
        }
        if ((v17 & 1) == 0)
          goto LABEL_21;
        v24 = __CocoaDictionary.Index.handleBitPattern.getter(v15, v16);
        if (v24)
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v24);
        else
          isUniquelyReferenced_nonNull_native = 1;
        v26 = sub_10000A430(&qword_100042808);
        v27 = (void (*)(_BYTE *, _QWORD))Dictionary.Index._asCocoa.modify(v31, v26);
        __CocoaDictionary.formIndex(after:isUnique:)(v28, isUniquelyReferenced_nonNull_native, v29);
        v27(v31, 0);
        --v4;
      }
      while (v4);
LABEL_18:
      sub_1000170F4((uint64_t)v32, v33, v34);
      return v35;
    }
  }
  return result;
}

uint64_t sub_100015C80(void *a1, uint64_t a2)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint32_t *p_align;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  _QWORD *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  _QWORD *v52;
  void (*v53)(char *, char *, uint64_t);
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v55)(uint64_t, uint64_t, uint64_t);
  char *v56;
  id v57;
  void *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t, uint64_t);
  char v67;
  void (*v68)(char *, char *, uint64_t);
  _QWORD *v69;
  uint64_t v70;
  void (*v71)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  id v82;
  id v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint8_t *v90;
  id v91;
  uint64_t (*v92)(char *, uint64_t);
  uint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  id v108;
  uint64_t v109;

  v105 = a2;
  v3 = sub_10000A430((uint64_t *)&unk_100042810);
  __chkstk_darwin(v3);
  v98 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10000A430((uint64_t *)&unk_1000422A0);
  __chkstk_darwin(v5);
  v102 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000A430(&qword_100042800);
  __chkstk_darwin(v7);
  v95 = (char *)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v101 = (char *)&v94 - v10;
  __chkstk_darwin(v11);
  v100 = (char *)&v94 - v12;
  __chkstk_darwin(v13);
  v15 = (char *)&v94 - v14;
  __chkstk_darwin(v16);
  v97 = (char *)&v94 - v17;
  v18 = type metadata accessor for Date(0);
  v107 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v96 = (char *)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v22 = (char *)&v94 - v21;
  __chkstk_darwin(v23);
  v25 = (char *)&v94 - v24;
  __chkstk_darwin(v26);
  v28 = (char *)&v94 - v27;
  if (qword_100042060 != -1)
    swift_once(&qword_100042060, sub_10001408C);
  v29 = type metadata accessor for Logger(0);
  v30 = sub_10000A4A4(v29, (uint64_t)qword_100042780);
  v31 = a1;
  v99 = v30;
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.default.getter();
  v34 = os_log_type_enabled(v32, v33);
  p_align = &stru_100040FE8.align;
  v103 = v28;
  v104 = v18;
  if (v34)
  {
    v36 = (uint8_t *)swift_slowAlloc(12, -1);
    v37 = swift_slowAlloc(32, -1);
    v106 = v25;
    v38 = v37;
    v109 = v37;
    *(_DWORD *)v36 = 136315138;
    v108 = objc_msgSend(v31, "nextTriggerTime");
    v39 = sub_10000A430((uint64_t *)&unk_100042820);
    v40 = String.init<A>(describing:)(&v108, v39);
    v42 = v41;
    v108 = (id)sub_10002CB54(v40, v41, &v109);
    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v108, &v109, v36 + 4, v36 + 12);

    v43 = v42;
    v18 = v104;
    swift_bridgeObjectRelease(v43);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Resolving nextTriggerTime {nextTriggerTime: %s}", v36, 0xCu);
    swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
    v44 = v38;
    v25 = v106;
    swift_slowDealloc(v44, -1, -1);
    v45 = v36;
    v28 = v103;
    swift_slowDealloc(v45, -1, -1);

  }
  else
  {

  }
  v46 = ((uint64_t (*)(void))Date.init())();
  Date.init()(v46);
  Date.addingTimeInterval(_:)(3600.0);
  v47 = (_QWORD *)v107;
  v106 = *(char **)(v107 + 8);
  ((void (*)(char *, uint64_t))v106)(v22, v18);
  v48 = objc_msgSend(v31, *((SEL *)p_align + 200));
  if (v48)
  {
    v49 = v48;
    v50 = objc_msgSend(v48, "endDate");
    if (v50)
    {
      v51 = v50;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v52 = v47;
      v53 = (void (*)(char *, char *, uint64_t))v47[4];
      v53(v15, v22, v18);
      v54 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v52[7];
      v54(v15, 0, 1, v18);
      v55 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v52[6];
      if (v55((uint64_t)v15, 1, v18) != 1)
      {
        v63 = (uint64_t)v97;
        v53(v97, v15, v18);
        v54((char *)v63, 0, 1, v18);
        v64 = v63;
        v47 = (_QWORD *)v107;
        v56 = v96;
LABEL_16:
        if (v55(v64, 1, v18) == 1)
        {

          sub_1000170B4(v64);
        }
        else
        {
          v65 = v64;
          v66 = (void (*)(char *, uint64_t, uint64_t))v47[4];
          v66(v56, v65, v18);
          v67 = static Date.< infix(_:_:)(v28, v56);

          if ((v67 & 1) != 0)
          {
            ((void (*)(char *, uint64_t))v106)(v25, v18);
            v66(v25, (uint64_t)v56, v18);
          }
          else
          {
            ((void (*)(char *, uint64_t))v106)(v56, v18);
          }
        }
        goto LABEL_21;
      }
      v47 = (_QWORD *)v107;
    }
    else
    {
      v54 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v47[7];
      v54(v15, 1, 1, v18);
    }
    v56 = v96;
    v57 = objc_msgSend(v49, "startDate");
    if (v57)
    {
      v58 = v57;
      v59 = v15;
      v60 = v95;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v61 = (uint64_t)v60;
      v15 = v59;
      v62 = 0;
    }
    else
    {
      v62 = 1;
      v61 = (uint64_t)v95;
    }
    v54((char *)v61, v62, 1, v18);
    v64 = (uint64_t)v97;
    sub_10001710C(v61, (uint64_t)v97);
    sub_1000170B4((uint64_t)v15);
    v55 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v47[6];
    goto LABEL_16;
  }
LABEL_21:
  v68 = (void (*)(char *, char *, uint64_t))v47[2];
  v69 = v47;
  v70 = (uint64_t)v100;
  v68(v100, v28, v18);
  v71 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v69[7];
  v71(v70, 0, 1, v18);
  v72 = (uint64_t)v101;
  v68(v101, v25, v18);
  v71(v72, 0, 1, v18);
  v73 = type metadata accessor for Calendar(0);
  v74 = (uint64_t)v102;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 56))(v102, 1, 1, v73);
  v75 = type metadata accessor for TimeZone(0);
  v76 = (uint64_t)v98;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 56))(v98, 1, 1, v75);
  v77 = objc_allocWithZone((Class)INDateComponentsRange);
  v78 = sub_1000154C8(v70, v72, v74, v76);
  v79 = Logger.logObject.getter(v78);
  v80 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v79, v80))
  {
    v81 = (uint8_t *)swift_slowAlloc(12, -1);
    v107 = swift_slowAlloc(32, -1);
    v109 = v107;
    *(_DWORD *)v81 = 136315138;
    v102 = (char *)(v81 + 4);
    v82 = v78;
    v83 = objc_msgSend(v82, "description");
    v84 = v25;
    v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(v83);
    v87 = v86;

    v88 = v85;
    v25 = v84;
    v108 = (id)sub_10002CB54(v88, v87, &v109);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v108, &v109, v102, v81 + 12);

    v28 = v103;
    swift_bridgeObjectRelease(v87);
    _os_log_impl((void *)&_mh_execute_header, v79, v80, "Resolved nextTriggerTime. {nextTriggerTime: %s, result: .success", v81, 0xCu);
    v89 = v107;
    swift_arrayDestroy(v107, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v89, -1, -1);
    v90 = v81;
    v18 = v104;
    swift_slowDealloc(v90, -1, -1);

  }
  else
  {

  }
  v91 = objc_msgSend((id)objc_opt_self(INDateComponentsRangeResolutionResult), "successWithResolvedDateComponentsRange:", v78);
  (*(void (**)(uint64_t, id))(v105 + 16))(v105, v91);

  v92 = (uint64_t (*)(char *, uint64_t))v106;
  ((void (*)(char *, uint64_t))v106)(v25, v18);
  return v92(v28, v18);
}

void sub_1000164F4(void *a1, char *a2, uint64_t a3)
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
  char *v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  _QWORD *v22;
  id v23;
  id v24;
  uint8_t *v25;
  uint64_t v26;
  uint8_t *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  void *v34;
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  double v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  id v53;
  void (*v54)(void);
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  uint64_t v59;
  uint8_t *v60;
  Class isa;
  id v62;
  id v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  char *v68;
  uint64_t v69;
  uint64_t j;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  id v100;
  id v101;
  id v102;
  id v103;
  uint64_t v104;
  uint8_t *v105;
  char *v106;
  char *v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;

  v111 = a3;
  v107 = a2;
  v4 = sub_10000A430(&qword_100042800);
  __chkstk_darwin(v4);
  v6 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v103 - v12;
  if (qword_100042060 != -1)
    swift_once(&qword_100042060, sub_10001408C);
  v14 = type metadata accessor for Logger(0);
  v15 = (uint8_t *)sub_10000A4A4(v14, (uint64_t)qword_100042780);
  v16 = a1;
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  v19 = os_log_type_enabled(v17, v18);
  v110 = v10;
  if (v19)
  {
    v106 = v6;
    v20 = swift_slowAlloc(12, -1);
    v108 = v7;
    v21 = (uint8_t *)v20;
    v22 = (_QWORD *)swift_slowAlloc(8, -1);
    v105 = v21;
    *(_DWORD *)v21 = 138412290;
    v114 = (unint64_t)v16;
    v23 = v16;
    v109 = v13;
    v24 = v23;
    v6 = v106;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v114, &v115, v21 + 4, v21 + 12);
    *v22 = v16;

    v13 = v109;
    v25 = v105;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "SiriKit asked for handling snooze tasks intent {intent: %@}", v105, 0xCu);
    v26 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v22, 1, v26);
    swift_slowDealloc(v22, -1, -1);
    v27 = v25;
    v7 = v108;
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

  }
  v28 = objc_msgSend(v16, "tasks");
  if (!v28)
  {
    v50 = Logger.logObject.getter(0);
    v51 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "No .tasks to snooze. Should have resolved this in resolve stage. Giving up", v52, 2u);
      swift_slowDealloc(v52, -1, -1);
    }

    v53 = objc_msgSend(objc_allocWithZone((Class)INSnoozeTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
    v54 = *(void (**)(void))(v111 + 16);
    goto LABEL_32;
  }
  v29 = v28;
  v30 = sub_10000A848(0, &qword_100042308, INTask_ptr);
  v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v29, v30);
  v32 = (char *)objc_msgSend(v16, "nextTriggerTime");
  if (!v32)
  {
    swift_bridgeObjectRelease(v31);

LABEL_29:
    v56 = Logger.logObject.getter(v55);
    v57 = static os_log_type_t.error.getter();
    v58 = os_log_type_enabled(v56, v57);
    v59 = v111;
    if (v58)
    {
      v60 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "No nextTriggerTime.endDate. Should have resolved this in resolve stage. Giving up.", v60, 2u);
      swift_slowDealloc(v60, -1, -1);
    }

    v53 = objc_msgSend(objc_allocWithZone((Class)INSnoozeTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
    v54 = *(void (**)(void))(v59 + 16);
LABEL_32:
    v54();

    return;
  }
  v105 = v15;
  v106 = v32;
  v33 = objc_msgSend(v32, "endDate");
  if (!v33)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_28;
  }
  v34 = v33;
  v35 = v110;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v36 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v36(v6, v35, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_28:

    swift_bridgeObjectRelease(v31);
    v55 = sub_1000170B4((uint64_t)v6);
    goto LABEL_29;
  }
  v37 = ((uint64_t (*)(char *, char *, uint64_t))v36)(v13, v6, v7);
  v109 = v13;
  v38 = Date.timeIntervalSinceNow.getter(v37);
  v39 = *(_QWORD *)&v107[OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_store];
  v40 = (char *)objc_msgSend(objc_allocWithZone((Class)REMSaveRequest), "initWithStore:", v39);
  v114 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)v31 >> 62)
  {
    if (v31 < 0)
      v73 = v31;
    else
      v73 = v31 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v31);
    v41 = _CocoaArrayWrapper.endIndex.getter(v73);
  }
  else
  {
    v41 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v31);
  }
  v103 = v29;
  v104 = v8;
  v110 = v40;
  if (v41)
  {
    if (v41 < 1)
    {
      __break(1u);
      goto LABEL_49;
    }
    v42 = v39;
    for (i = 0; i != v41; ++i)
    {
      if ((v31 & 0xC000000000000001) != 0)
        v45 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v31);
      else
        v45 = *(id *)(v31 + 8 * i + 32);
      v46 = v45;
      v47 = INTask.reminderID.getter();

      if (v47)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v49 = *(_QWORD *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v48 = *(_QWORD *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v49 >= v48 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v48 > 1, v49 + 1, 1);
        v44 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v49, v47);
        specialized Array._endMutation()(v44);
      }
    }
    swift_bridgeObjectRelease(v31);
    v29 = (_QWORD *)v114;
    v39 = v42;
    v40 = v110;
  }
  else
  {
    swift_bridgeObjectRelease(v31);
    v29 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(v31);
  v31 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v114 = 0;
  v62 = objc_msgSend((id)v39, "fetchRemindersWithObjectIDs:error:", isa, &v114);

  v63 = (id)v114;
  v108 = v7;
  if (!v62)
    goto LABEL_57;
  v64 = sub_10000A848(0, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
  v65 = sub_100013FF4();
  v66 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v62, v31, v64, v65);
  v67 = v63;

  v68 = v40;
  v107 = v68;
  v39 = (uint64_t)sub_100015A80(v66, v68);
  swift_bridgeObjectRelease(v66);

  if ((unint64_t)v39 >> 62)
  {
LABEL_49:
    if (v39 < 0)
      v74 = v39;
    else
      v74 = v39 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v39);
    v69 = _CocoaArrayWrapper.endIndex.getter(v74);
    if (v69)
      goto LABEL_38;
    goto LABEL_53;
  }
  v69 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v39);
  if (v69)
  {
LABEL_38:
    if (v69 < 1)
      __break(1u);
    for (j = 0; j != v69; ++j)
    {
      if ((v39 & 0xC000000000000001) != 0)
        v71 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(j, v39);
      else
        v71 = *(id *)(v39 + 8 * j + 32);
      v72 = v71;
      objc_msgSend(v71, "snoozeFromNowForTimeInterval:", v38, v103);

    }
  }
LABEL_53:
  swift_bridgeObjectRelease_n(v39, 2);
  v114 = 0;
  v75 = v107;
  v76 = objc_msgSend(v107, "saveSynchronouslyWithError:", &v114);
  v63 = (id)v114;
  if (v76)
  {
    v77 = *(_QWORD *)TTRWidgetCenter.shared.unsafeMutableAddressor((id)v114);
    swift_retain();
    TTRWidgetCenter.reloadAllTimelines()();
    swift_release(v77);
    v78 = swift_bridgeObjectRetain(v29);
    v79 = Logger.logObject.getter(v78);
    v80 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc(12, -1);
      v82 = swift_slowAlloc(32, -1);
      v114 = v82;
      *(_DWORD *)v81 = 136315138;
      v83 = swift_bridgeObjectRetain(v29);
      v84 = Array.description.getter(v83, v31);
      v86 = v85;
      swift_bridgeObjectRelease(v29);
      v87 = v84;
      v75 = v107;
      v112 = sub_10002CB54(v87, v86, (uint64_t *)&v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v112, &v113, v81 + 4, v81 + 12);
      swift_bridgeObjectRelease_n(v29, 2);
      swift_bridgeObjectRelease(v86);
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "Successfully snoozed reminders. {reminderIDs: %s}", v81, 0xCu);
      swift_arrayDestroy(v82, 1, (char *)&type metadata for Any + 8);
      v88 = v111;
      swift_slowDealloc(v82, -1, -1);
      swift_slowDealloc(v81, -1, -1);

      v89 = v108;
    }
    else
    {

      swift_bridgeObjectRelease_n(v29, 2);
      v89 = v108;
      v88 = v111;
    }
    v101 = objc_msgSend(objc_allocWithZone((Class)INSnoozeTasksIntentResponse), "initWithCode:userActivity:", 3, 0);
    v102 = v103;
    objc_msgSend(v101, "setSnoozedTasks:", v103);

    (*(void (**)(uint64_t, id))(v88 + 16))(v88, v101);
    (*(void (**)(char *, uint64_t))(v104 + 8))(v109, v89);
    return;
  }
  v7 = v108;
  v40 = v110;
LABEL_57:
  v90 = v63;

  _convertNSErrorToError(_:)(v63);
  swift_willThrow();
  v91 = swift_bridgeObjectRetain(v29);
  v92 = Logger.logObject.getter(v91);
  v93 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v92, v93))
  {
    v94 = (uint8_t *)swift_slowAlloc(12, -1);
    v95 = swift_slowAlloc(32, -1);
    v114 = v95;
    *(_DWORD *)v94 = 136315138;
    v96 = swift_bridgeObjectRetain(v29);
    v97 = Array.description.getter(v96, v31);
    v99 = v98;
    swift_bridgeObjectRelease(v29);
    v112 = sub_10002CB54(v97, v99, (uint64_t *)&v114);
    v40 = v110;
    v7 = v108;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v112, &v113, v94 + 4, v94 + 12);
    swift_bridgeObjectRelease_n(v29, 2);
    swift_bridgeObjectRelease(v99);
    _os_log_impl((void *)&_mh_execute_header, v92, v93, "Error snoozing reminders {reminderIDs: %s}", v94, 0xCu);
    swift_arrayDestroy(v95, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v95, -1, -1);
    swift_slowDealloc(v94, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v29, 2);
  }
  v100 = objc_msgSend(objc_allocWithZone((Class)INSnoozeTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
  (*(void (**)(uint64_t, id))(v111 + 16))(v111, v100);

  swift_errorRelease();
  (*(void (**)(char *, uint64_t))(v104 + 8))(v109, v7);
}

uint64_t sub_1000170B4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000A430(&qword_100042800);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000170F4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_100017100(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain(result);
  return result;
}

uint64_t sub_10001710C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000A430(&qword_100042800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017154()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100017178(uint64_t a1)
{
  uint64_t v1;

  sub_100015218(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100017180()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042830);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042830);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_100017210()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)CNContactStore), "init");
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id TTRIntentHandler.handler(for:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  NSObject **v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  NSObject **v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t ObjectType;
  void *v33;
  NSObject *v34;
  uint64_t v35;

  ObjectType = swift_getObjectType(v2);
  if (qword_100042068 != -1)
    swift_once(&qword_100042068, sub_100017180);
  v5 = type metadata accessor for Logger(0);
  sub_10000A4A4(v5, (uint64_t)qword_100042830);
  v6 = a1;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v9 = 138412290;
    v34 = v6;
    v11 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v9 + 4, v9 + 12);
    *v10 = v6;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "SiriKit asks for handler for intent: %@", v9, 0xCu);
    v12 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v10, 1, v12);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

  }
  v13 = objc_opt_self(INAddTasksIntent);
  if (swift_dynamicCastObjCClass(v6, v13))
  {
    v14 = &OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___addTasksHandler;
    v15 = (uint64_t (*)(uint64_t))sub_100017B14;
LABEL_8:
    v16 = sub_100017868(v14, v15);
LABEL_11:
    v20 = v16;
    result = (id)swift_getObjectType(v16);
LABEL_12:
    a2[3] = (uint64_t)result;
    *a2 = v20;
    return result;
  }
  v17 = objc_opt_self(INSetTaskAttributeIntent);
  v18 = swift_dynamicCastObjCClass(v6, v17);
  if (v18)
  {
    v16 = (uint64_t)sub_10001766C(v18, v19);
    goto LABEL_11;
  }
  v22 = objc_opt_self(INSnoozeTasksIntent);
  if (swift_dynamicCastObjCClass(v6, v22))
  {
    v14 = &OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___snoozeTasksHandler;
    v15 = (uint64_t (*)(uint64_t))sub_100017DB0;
    goto LABEL_8;
  }
  v23 = objc_opt_self(INSearchForNotebookItemsIntent);
  if (swift_dynamicCastObjCClass(v6, v23))
  {
    v14 = &OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler;
    v15 = (uint64_t (*)(uint64_t))sub_100017F0C;
    goto LABEL_8;
  }
  v24 = type metadata accessor for ConfigurationIntent();
  if (swift_dynamicCastClass(v6, v24))
  {
    v20 = (uint64_t)sub_1000178C8();
    result = (id)type metadata accessor for ConfigurationIntentHandler();
    goto LABEL_12;
  }
  v25 = v6;
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc(12, -1);
    v29 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v28 = 138412290;
    v34 = v25;
    v30 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v28 + 4, v28 + 12);
    *v29 = v25;

    _os_log_impl((void *)&_mh_execute_header, v26, v27, "TTRIntentHandler does not know how to handle intent of class: %@", v28, 0xCu);
    v31 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v29, 1, v31);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v28, -1, -1);
  }
  else
  {

    v26 = v25;
  }

  a2[3] = ObjectType;
  *a2 = (uint64_t)v33;
  return v33;
}

id sub_10001766C(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  id v26;
  id v27;
  char *v28;
  id v29;
  uint64_t v30;

  v3 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler;
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler];
  if (v4)
  {
    v5 = *(id *)&v2[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler];
  }
  else
  {
    v6 = v2;
    v7 = *(void **)&v2[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store];
    v8 = *(void **)&v6[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue];
    v9 = type metadata accessor for TTRIntentsHandlerStoreDataSource();
    v10 = swift_allocObject(v9, 24, 7);
    v11 = qword_100042058;
    v12 = v7;
    if (v11 != -1)
      swift_once(&qword_100042058, sub_1000114A0);
    v13 = type metadata accessor for Logger(0);
    v14 = sub_10000A4A4(v13, (uint64_t)qword_100042648);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }

    *(_QWORD *)(v10 + 16) = v12;
    v18 = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
    v19 = swift_allocObject(v18, 72, 7);
    v20 = v12;
    v21 = v8;
    v22 = sub_1000183A0((uint64_t)v20, (uint64_t)v21, v10, v19);
    v23 = swift_allocObject(&unk_10003D738, 24, 7);
    *(_QWORD *)(v23 + 16) = v6;
    v24 = type metadata accessor for TTRCurrentTimeProvider(0);
    v25 = (uint64_t *)swift_allocObject(v24, 16, 7);
    v26 = v20;
    v27 = v21;
    v28 = v6;
    v29 = sub_1000186BC((uint64_t)v26, (uint64_t)v27, (uint64_t)sub_100018A0C, v23, v22, v25);
    v30 = *(_QWORD *)&v6[v3];
    *(_QWORD *)&v6[v3] = v29;
    v5 = v29;
    swift_unknownObjectRelease(v30);
    v4 = 0;
  }
  swift_unknownObjectRetain(v4, a2);
  return v5;
}

uint64_t sub_100017868(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v4 = *(_QWORD *)(v2 + *a1);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v5 = a2(v2);
    v6 = *(_QWORD *)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease(v6);
  }
  swift_unknownObjectRetain();
  return v5;
}

id sub_1000178C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  char *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;

  v1 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler);
  }
  else
  {
    v4 = v0;
    v5 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store);
    v6 = *(void **)(v4 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue);
    v7 = type metadata accessor for TTRIntentsHandlerStoreDataSource();
    v8 = swift_allocObject(v7, 24, 7);
    v9 = qword_100042058;
    v10 = v5;
    if (v9 != -1)
      swift_once(&qword_100042058, sub_1000114A0);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_10000A4A4(v11, (uint64_t)qword_100042648);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

    *(_QWORD *)(v8 + 16) = v10;
    v16 = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
    v17 = swift_allocObject(v16, 72, 7);
    v18 = v10;
    v19 = v6;
    v20 = sub_1000183A0((uint64_t)v18, (uint64_t)v19, v8, v17);
    v21 = (char *)objc_allocWithZone((Class)type metadata accessor for ConfigurationIntentHandler());
    v22 = v18;
    v23 = v19;
    v24 = sub_10001886C(v22, v23, v20, v21);

    v25 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v24;
    v3 = v24;

    v2 = 0;
  }
  v26 = v2;
  return v3;
}

id sub_100017B14(char *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  ValueWitnessTable *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  char *v31;
  id v32;
  _QWORD v35[5];

  v2 = *(void **)&a1[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store];
  v3 = *(void **)&a1[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue];
  v4 = type metadata accessor for TTRIntentsHandlerStoreDataSource();
  v5 = swift_allocObject(v4, 24, 7);
  v6 = qword_100042058;
  v7 = v2;
  if (v6 != -1)
    swift_once(&qword_100042058, sub_1000114A0);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_10000A4A4(v8, (uint64_t)qword_100042648);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  *(_QWORD *)(v5 + 16) = v7;
  v13 = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v14 = swift_allocObject(v13, 72, 7);
  v15 = v7;
  v16 = v3;
  v17 = sub_1000183A0((uint64_t)v15, (uint64_t)v16, v5, v14);
  v18 = swift_allocObject(&unk_10003D710, 24, 7);
  *(_QWORD *)(v18 + 16) = a1;
  v19 = type metadata accessor for TTRCurrentTimeProvider(0);
  v20 = swift_allocObject(v19, 16, 7);
  v35[3] = &type metadata for TTRContactRepresentationResolver;
  v35[4] = &off_10003DE10;
  v35[0] = sub_1000184DC;
  v35[1] = v18;
  v21 = objc_allocWithZone((Class)type metadata accessor for TTRAddTasksIntentHandler());
  v22 = sub_1000184FC((uint64_t)v35, (uint64_t)&type metadata for TTRContactRepresentationResolver);
  __chkstk_darwin(v22);
  v24 = (_QWORD *)((char *)&v35[-1] - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  ((void (*)(_QWORD *, _QWORD *))v25->initializeWithCopy)(v24, v26);
  v27 = *v24;
  v28 = v24[1];
  v29 = v15;
  v30 = v16;
  v31 = a1;
  swift_retain();
  swift_retain();
  swift_retain();
  v32 = sub_100018524((uint64_t)v29, (uint64_t)v30, v17, v27, v28, v20, v21);
  sub_10000A880(v35);
  swift_release(v17);
  swift_release(v18);
  swift_release(v20);
  return v32;
}

id sub_100017DB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  NSString v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  char *v12;
  id v13;
  id v14;
  objc_super v16;
  __int128 v17;
  uint64_t v18;
  _UNKNOWN **v19;

  static String._unconditionallyBridgeFromObjectiveC(_:)(REMAppBundleIdentifier);
  v3 = v2;
  v4 = objc_allocWithZone((Class)UNUserNotificationCenter);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "initWithBundleIdentifier:", v5);

  v7 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store);
  v18 = sub_10000A848(0, (unint64_t *)&unk_1000428C0, UNUserNotificationCenter_ptr);
  v19 = &off_10003E040;
  *(_QWORD *)&v17 = v6;
  v8 = type metadata accessor for TTRIntentsHandlerNotificationCenterDataSource();
  v9 = swift_allocObject(v8, 64, 7);
  *(_QWORD *)(v9 + 16) = v7;
  sub_1000186A4(&v17, v9 + 24);
  v10 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue);
  v11 = (objc_class *)type metadata accessor for TTRSnoozeTasksIntentHandler();
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_store] = v7;
  *(_QWORD *)&v12[OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_queue] = v10;
  *(_QWORD *)&v12[OBJC_IVAR____TtC25RemindersIntentsExtension27TTRSnoozeTasksIntentHandler_dataSource] = v9;
  v16.receiver = v12;
  v16.super_class = v11;
  v13 = v7;
  v14 = v10;
  return objc_msgSendSuper2(&v16, "init");
}

id sub_100017F0C(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  objc_super v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];

  v1 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store);
  v2 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue);
  v3 = type metadata accessor for TTRIntentsHandlerStoreDataSource();
  v4 = swift_allocObject(v3, 24, 7);
  v5 = qword_100042058;
  v6 = v1;
  if (v5 != -1)
    swift_once(&qword_100042058, sub_1000114A0);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_10000A4A4(v7, (uint64_t)qword_100042648);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  *(_QWORD *)(v4 + 16) = v6;
  v12 = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v13 = swift_allocObject(v12, 72, 7);
  v14 = v6;
  v15 = v2;
  swift_retain();
  v16 = sub_1000183A0((uint64_t)v14, (uint64_t)v15, v4, v13);
  v28[3] = v12;
  v28[4] = &off_10003DE20;
  swift_release(v4);
  v28[0] = v16;
  sub_10000D2E4((uint64_t)v28, (uint64_t)v27);
  v17 = type metadata accessor for TTRCurrentTimeProvider(0);
  v18 = swift_allocObject(v17, 16, 7);
  v26[3] = v17;
  v26[4] = &protocol witness table for TTRCurrentTimeProvider;
  v26[0] = v18;
  v19 = (objc_class *)type metadata accessor for TTRSearchForNotebookItemsIntentHandler();
  v20 = (char *)objc_allocWithZone(v19);
  *(_QWORD *)&v20[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_store] = v14;
  *(_QWORD *)&v20[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_queue] = v15;
  sub_10000D2E4((uint64_t)v27, (uint64_t)&v20[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_dataSource]);
  sub_10000D2E4((uint64_t)v26, (uint64_t)&v20[OBJC_IVAR____TtC25RemindersIntentsExtension38TTRSearchForNotebookItemsIntentHandler_timeProvider]);
  v25.receiver = v20;
  v25.super_class = v19;
  v21 = v14;
  v22 = v15;
  swift_retain();
  v23 = objc_msgSendSuper2(&v25, "init");
  sub_10000A880(v26);
  sub_10000A880(v27);
  swift_release(v18);
  sub_10000A880(v28);
  return v23;
}

id TTRIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id TTRIntentHandler.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  id v3;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store;
  v3 = objc_allocWithZone((Class)REMStore);
  v4 = v0;
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, "initUserInteractive:", 1);
  v5 = OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue;
  sub_10000A848(0, (unint64_t *)&qword_1000420C0, OS_dispatch_queue_ptr);
  *(_QWORD *)&v4[v5] = static OS_dispatch_queue.main.getter();
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___addTasksHandler] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___setTaskAttributeHandler] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___snoozeTasksHandler] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler] = 0;

  v7.receiver = v4;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, "init");
}

id TTRIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRIntentHandler()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension16TTRIntentHandler);
}

uint64_t sub_1000183A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;

  v15 = type metadata accessor for TTRIntentsHandlerStoreDataSource();
  v16 = &off_10003D4B8;
  *(_QWORD *)&v14 = a3;
  if (qword_1000420A8 != -1)
    swift_once(&qword_1000420A8, sub_100029B4C);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_10000A4A4(v8, (uint64_t)qword_100042C78);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[TTRIntentsHandlerSpotlightDataSource] Using the Spotlight intents handler data source", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  *(_QWORD *)(a4 + 16) = a1;
  *(_QWORD *)(a4 + 24) = a2;
  sub_1000186A4(&v14, a4 + 32);
  return a4;
}

uint64_t sub_1000184B8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_1000184DC()
{
  return sub_100017210();
}

uint64_t sub_1000184FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

id sub_100018524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v14;
  objc_super v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];

  v20[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v20[4] = &off_10003DE20;
  v20[0] = a3;
  v19[3] = &type metadata for TTRCurrentUserActivityProvider;
  v19[4] = &protocol witness table for TTRCurrentUserActivityProvider;
  v18[3] = type metadata accessor for TTRCurrentTimeProvider(0);
  v18[4] = &protocol witness table for TTRCurrentTimeProvider;
  v18[0] = a6;
  v17[3] = &type metadata for TTRContactRepresentationResolver;
  v17[4] = &off_10003DE10;
  v17[0] = a4;
  v17[1] = a5;
  a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_didNotSpecifyTargetList] = 0;
  sub_10000D2E4((uint64_t)v18, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider]);
  *(_QWORD *)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store] = a1;
  *(_QWORD *)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_queue] = a2;
  sub_10000D2E4((uint64_t)v20, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource]);
  sub_10000D2E4((uint64_t)v17, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_contactRepresentationResolver]);
  sub_10000D2E4((uint64_t)v19, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider]);
  v16.receiver = a7;
  v16.super_class = (Class)type metadata accessor for TTRAddTasksIntentHandler();
  v14 = objc_msgSendSuper2(&v16, "init");
  sub_10000A880(v18);
  sub_10000A880(v19);
  sub_10000A880(v17);
  sub_10000A880(v20);
  return v14;
}

uint64_t sub_1000186A4(__int128 *a1, uint64_t a2)
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

id sub_1000186BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v12;
  objc_class *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  ValueWitnessTable *v18;
  _QWORD *v19;
  id v20;
  objc_super v22;
  __int128 v23;
  ValueMetadata *v24;
  _UNKNOWN **v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];

  v12 = *a6;
  v28[4] = &off_10003DE20;
  v28[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v28[0] = a5;
  v27[3] = &type metadata for TTRContactRepresentationResolver;
  v27[4] = &off_10003DE10;
  v27[0] = a3;
  v27[1] = a4;
  v26[3] = v12;
  v26[4] = &protocol witness table for TTRCurrentTimeProvider;
  v26[0] = a6;
  v13 = (objc_class *)type metadata accessor for TTRSetTaskAttributeIntentHandler();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = sub_1000184FC((uint64_t)v27, (uint64_t)&type metadata for TTRContactRepresentationResolver);
  __chkstk_darwin(v15);
  v17 = (id *)((char *)&v22.receiver - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  ((void (*)(_QWORD *, _QWORD *))v18->initializeWithCopy)(v17, v19);
  v24 = &type metadata for TTRContactRepresentationResolver;
  v25 = &off_10003DE10;
  v23 = *(_OWORD *)v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store] = a1;
  *(_QWORD *)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_queue] = a2;
  sub_10000D2E4((uint64_t)&v23, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver]);
  sub_10000D2E4((uint64_t)v28, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_dataSource]);
  sub_10000D2E4((uint64_t)v26, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_timeProvider]);
  v22.receiver = v14;
  v22.super_class = v13;
  v20 = objc_msgSendSuper2(&v22, "init");
  sub_10000A880(v26);
  sub_10000A880(v28);
  sub_10000A880(&v23);
  sub_10000A880(v27);
  return v20;
}

id sub_10001886C(void *a1, void *a2, uint64_t a3, char *a4)
{
  objc_class *ObjectType;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  id v17;
  id v18;
  objc_super v20;
  _QWORD v21[5];

  ObjectType = (objc_class *)swift_getObjectType(a4);
  v21[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v21[4] = &off_10003DE20;
  v21[0] = a3;
  *(int64x2_t *)&a4[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_badgeSize] = vdupq_n_s64(0x4040000000000000uLL);
  v9 = qword_100042070;
  v10 = a4;
  if (v9 != -1)
    swift_once(&qword_100042070, sub_100018A10);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_10000A4A4(v11, (uint64_t)qword_1000428D0);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "ConfigurationIntentHandler Created", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  *(_QWORD *)&v10[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_store] = a1;
  *(_QWORD *)&v10[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_queue] = a2;
  sub_10000D2E4((uint64_t)v21, (uint64_t)&v10[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource]);
  v16 = a1;
  v17 = a2;

  v20.receiver = v10;
  v20.super_class = ObjectType;
  v18 = objc_msgSendSuper2(&v20, "init");
  sub_10000A880(v21);
  return v18;
}

uint64_t sub_100018A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_1000428D0);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_1000428D0);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100018B14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  if (qword_100042070 != -1)
    swift_once(&qword_100042070, sub_100018A10);
  v8 = type metadata accessor for Logger(0);
  sub_10000A4A4(v8, (uint64_t)qword_1000428D0);
  swift_bridgeObjectRetain_n(a3, 2);
  v9 = a1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(22, -1);
    v41 = a5;
    v13 = swift_slowAlloc(64, -1);
    v47 = v13;
    *(_DWORD *)v12 = 136315394;
    v14 = v9;
    v15 = objc_msgSend(v14, "description");
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v18 = v17;

    v45 = sub_10002CB54(v16, v18, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v12 + 4, v12 + 12);

    swift_bridgeObjectRelease(v18);
    *(_WORD *)(v12 + 12) = 2080;
    v19 = a2;
    v45 = a2;
    v46 = a3;
    swift_bridgeObjectRetain(a3);
    v20 = sub_10000A430(&qword_100042940);
    v21 = String.init<A>(describing:)(&v45, v20);
    v23 = v22;
    v45 = sub_10002CB54(v21, v22, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v12 + 14, v12 + 22);
    swift_bridgeObjectRelease_n(a3, 2);
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Widget provideListOptions {intent: %s, searchTerm: %s}", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy(v13, 2, (char *)&type metadata for Any + 8);
    v24 = v13;
    a5 = v41;
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    v19 = a2;
  }
  sub_10000A430(&qword_100042938);
  v25 = &v43[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource];
  v26 = *(_QWORD *)&v43[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource + 24];
  v27 = *(_QWORD *)&v43[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource + 32];
  sub_10000A4BC(&v43[OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource], v26);
  v28 = sub_10000DBC8(v26, v27);
  v29 = *((_QWORD *)v25 + 3);
  v30 = *((_QWORD *)v25 + 4);
  sub_10000A4BC(v25, v29);
  v31 = sub_10000DB34(v29, v30);
  v32 = static Promise.zip<A, B>(_:_:)(v28, v31);
  swift_release(v28);
  swift_release(v31);
  v33 = (_QWORD *)swift_allocObject(&unk_10003D878, 56, 7);
  v33[2] = a4;
  v33[3] = a5;
  v33[4] = v43;
  v33[5] = v19;
  v33[6] = a3;
  v34 = swift_allocObject(&unk_10003D8A0, 32, 7);
  *(_QWORD *)(v34 + 16) = sub_10001C000;
  *(_QWORD *)(v34 + 24) = v33;
  swift_bridgeObjectRetain(a3);
  swift_retain();
  v35 = (void *)zalgo.getter(v43);
  v36 = dispatch thunk of Promise.then<A>(on:closure:)(v35, sub_10001C034, v34, (char *)&type metadata for () + 8);
  swift_release(v34);

  v37 = swift_allocObject(&unk_10003D8C8, 32, 7);
  *(_QWORD *)(v37 + 16) = a4;
  *(_QWORD *)(v37 + 24) = a5;
  v38 = swift_retain();
  v39 = (void *)zalgo.getter(v38);
  v40 = dispatch thunk of Promise.error(on:closure:)(v39, sub_10001C08C, v37);
  swift_release(v32);
  swift_release(v40);
  swift_release(v36);
  swift_release(v37);

}

void sub_100018FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_100019020(uint64_t a1, uint64_t a2, uint64_t (*a3)(id, _QWORD), uint64_t a4, char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t result;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void **v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  id *v56;
  void **v57;
  id v58;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  Class isa;
  id v70;
  id v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  void **v85;
  char *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  char *v92;
  void **v93;
  uint64_t v94;
  void (*v95)(void **, char *, char *);
  int v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  NSString v110;
  NSString v111;
  id v112;
  id v113;
  id v114;
  id v115;
  uint64_t v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  char *v124;
  unint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void (*v129)(id *, char *, uint64_t);
  id *v130;
  int v131;
  id v132;
  id v133;
  id v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  NSString v143;
  NSString v144;
  id v145;
  id v146;
  id v147;
  id v148;
  NSObject *v149;
  _QWORD *v150;
  char *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  char *v155;
  id v156;
  id v157;
  void *v158;
  id v159;
  id v160;
  NSString v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  id v165;
  id v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  NSString v175;
  NSString v176;
  id v177;
  id v178;
  id v179;
  uint64_t v180;
  NSObject *v181;
  _QWORD *v182;
  char *v183;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  char *v187;
  id v188;
  id v189;
  void *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  _QWORD *v194;
  void *v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  id v199;
  NSString v200;
  Class v201;
  id v202;
  id v203;
  unint64_t v204;
  unint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  NSObject *v209;
  os_log_type_t v210;
  BOOL v211;
  void *v212;
  uint8_t *v213;
  uint64_t v214;
  uint64_t v215;
  id v216;
  Class v217;
  id v218;
  id v219;
  uint64_t v220;
  uint64_t v221;
  id v222;
  uint64_t v223;
  void (*v224)(char *, uint64_t);
  uint64_t v225;
  uint64_t v226;
  uint64_t (*v227)(id, _QWORD);
  char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  unint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  unint64_t v236;
  char *v237;
  uint64_t v238;
  uint64_t v239;
  int v240;
  uint64_t v241;
  int v242;
  char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  __int128 v247;
  int v248;
  void (*v249)(void **, char *, char *);
  uint64_t v250;
  unint64_t v251;
  char *v252;
  uint64_t v253;
  void **v254;
  uint64_t v255;
  uint64_t v256;
  int v257;
  id v258;
  int v259;
  uint64_t v260;
  id *v261;
  char *v262;
  uint64_t v263;
  void (*v264)(id *, char *, uint64_t);
  char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  char *v270;
  unint64_t v271;
  char *v272;
  void **aBlock;
  uint64_t v274;
  uint64_t (*v275)(uint64_t);
  void *v276;
  uint64_t (*v277)();
  uint64_t v278;
  void *v279;
  void **v280;
  _QWORD *v281;
  uint64_t v282;
  char v283[8];
  _OWORD v284[2];
  uint64_t v285;
  char v286;
  id v287;

  v235 = a7;
  v230 = a6;
  v226 = a4;
  v227 = (uint64_t (*)(id, _QWORD))a3;
  v268 = type metadata accessor for REMAccountsListDataView.Model.GroupChild(0);
  v10 = *(_QWORD *)(v268 - 8);
  __chkstk_darwin(v268);
  v261 = (id *)((char *)&v221 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __chkstk_darwin(v12);
  v262 = (char *)&v221 - v14;
  v245 = type metadata accessor for REMAccountsListDataView.Model.Group(0, v13);
  v244 = *(_QWORD *)(v245 - 8);
  __chkstk_darwin(v245);
  v243 = (char *)&v221 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v267 = type metadata accessor for URL(0);
  v266 = *(_QWORD *)(v267 - 8);
  v16 = __chkstk_darwin(v267);
  v265 = (char *)&v221 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v255 = type metadata accessor for REMAccountsListDataView.Model.AccountChild(0, v16);
  v246 = *(_QWORD *)(v255 - 8);
  __chkstk_darwin(v255);
  v254 = (void **)((char *)&v221 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = __chkstk_darwin(v19);
  v22 = (char *)&v221 - v21;
  v238 = type metadata accessor for REMAccountsListDataView.Model.Account(0, v20);
  v239 = *(_QWORD *)(v238 - 8);
  __chkstk_darwin(v238);
  v237 = (char *)&v221 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_10000A430(&qword_100042758);
  __chkstk_darwin(v24);
  v26 = (char *)&v221 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for REMAccountsListDataView.Model(0);
  v28 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v30 = (char *)&v221 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  v228 = (char *)&v221 - v32;
  if (!a1)
  {
LABEL_4:
    if (qword_100042070 == -1)
    {
LABEL_5:
      v33 = type metadata accessor for Logger(0);
      v34 = sub_10000A4A4(v33, (uint64_t)qword_1000428D0);
      v35 = Logger.logObject.getter(v34);
      v36 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "Widget provideListOptions failed no data", v37, 2u);
        swift_slowDealloc(v37, -1, -1);
      }

      return v227(0, 0);
    }
LABEL_77:
    swift_once(&qword_100042070, sub_100018A10);
    goto LABEL_5;
  }
  sub_10001C094(a2, (uint64_t)v26);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) == 1)
  {
    sub_10000A5D0((uint64_t)v26, &qword_100042758);
    goto LABEL_4;
  }
  v272 = a5;
  v39 = v228;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v228, v26, v27);
  v40 = qword_100042070;
  swift_bridgeObjectRetain(a1);
  if (v40 != -1)
    swift_once(&qword_100042070, sub_100018A10);
  v41 = type metadata accessor for Logger(0);
  v42 = sub_10000A4A4(v41, (uint64_t)qword_1000428D0);
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v30, v39, v27);
  v43 = swift_bridgeObjectRetain(a1);
  v223 = v42;
  v44 = Logger.logObject.getter(v43);
  v45 = static os_log_type_t.default.getter();
  v46 = os_log_type_enabled(v44, v45);
  v260 = v10;
  v252 = v22;
  v225 = v27;
  if (v46)
  {
    v47 = swift_slowAlloc(22, -1);
    *(_DWORD *)v47 = 134218240;
    aBlock = *(void ***)(a1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v274, v47 + 4, v47 + 12);
    v48 = swift_bridgeObjectRelease(a1);
    *(_WORD *)(v47 + 12) = 2048;
    v49 = REMAccountsListDataView.Model.accounts.getter(v48);
    v50 = *(void ***)(v49 + 16);
    swift_bridgeObjectRelease(v49);
    v224 = *(void (**)(char *, uint64_t))(v28 + 8);
    v224(v30, v27);
    aBlock = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v274, v47 + 14, v47 + 22);
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Widget provideListOptions smartListTypes: %ld, accounts %ld ", (uint8_t *)v47, 0x16u);
    swift_slowDealloc(v47, -1, -1);

  }
  else
  {
    v224 = *(void (**)(char *, uint64_t))(v28 + 8);
    v224(v30, v27);

    swift_bridgeObjectRelease(a1);
  }
  v51 = v237;
  v282 = (uint64_t)_swiftEmptyArrayStorage;
  type metadata accessor for TTRAccountsListsViewModel(0);
  v52 = static TTRAccountsListsViewModel.generateAccountsCapabilities(_:)(v228);
  v53 = *(_QWORD *)(a1 + 16);
  v54 = v262;
  if (v53)
  {
    v55 = v52;
    v56 = (id *)(a1 + 32);
    v57 = (void **)_swiftEmptyArrayStorage;
    do
    {
      v287 = *v56;
      v58 = v287;
      if (sub_10001A98C((uint64_t *)&v287, v55))
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v57);
        aBlock = v57;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_10002297C(0, (int64_t)v57[2] + 1, 1);
          v57 = aBlock;
        }
        v61 = (unint64_t)v57[2];
        v60 = (unint64_t)v57[3];
        if (v61 >= v60 >> 1)
        {
          sub_10002297C(v60 > 1, v61 + 1, 1);
          v57 = aBlock;
        }
        v57[2] = (void *)(v61 + 1);
        v57[v61 + 4] = v58;
        v54 = v262;
        v51 = v237;
      }
      else
      {

      }
      ++v56;
      --v53;
    }
    while (v53);
  }
  else
  {
    v57 = (void **)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(a1);
  v62 = v272;
  v63 = sub_10001C0DC((uint64_t)v57);
  swift_release(v57);
  v270 = v62;

  v64 = v235;
  if (v235)
  {
    swift_bridgeObjectRetain(v235);
    v65 = sub_10001C1B0((uint64_t)v63, v230, v64);
    v234 = 0;
    swift_bridgeObjectRelease(v63);
    swift_bridgeObjectRelease(v64);
    v63 = v65;
  }
  else
  {
    v234 = 0;
  }
  v66 = v268;
  v67 = v260;
  v68 = objc_allocWithZone((Class)INObjectSection);
  v269 = type metadata accessor for ConfigurationList(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v63);
  v70 = objc_msgSend(v68, "initWithTitle:items:", 0, isa);

  v71 = v70;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v73 = *(_QWORD *)((v282 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v72 = *(_QWORD *)((v282 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v73 >= v72 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v72 > 1, v73 + 1, 1);
  v222 = v71;
  v74 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v73, v71);
  v75 = specialized Array._endMutation()(v74);
  v76 = REMAccountsListDataView.Model.accounts.getter(v75);
  v231 = *(_QWORD *)(v76 + 16);
  if (!v231)
  {
LABEL_68:
    swift_bridgeObjectRelease(v76);
    v207 = v282;
    v208 = swift_bridgeObjectRetain_n(v282, 2);
    v209 = Logger.logObject.getter(v208);
    v210 = static os_log_type_t.default.getter();
    v211 = os_log_type_enabled(v209, v210);
    v212 = v222;
    if (v211)
    {
      v213 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v213 = 134217984;
      if ((unint64_t)v207 >> 62)
      {
        if (v207 < 0)
          v220 = v207;
        else
          v220 = v207 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v207);
        v214 = _CocoaArrayWrapper.endIndex.getter(v220);
        swift_bridgeObjectRelease(v207);
      }
      else
      {
        v214 = *(_QWORD *)((v207 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v207);
      aBlock = (void **)v214;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v274, v213 + 4, v213 + 12);
      swift_bridgeObjectRelease(v207);
      _os_log_impl((void *)&_mh_execute_header, v209, v210, "Widget provideListOptions sections %ld ", v213, 0xCu);
      swift_slowDealloc(v213, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v207, 2);
    }
    swift_beginAccess(&v282, &aBlock, 0, 0);
    v215 = v282;
    v216 = objc_allocWithZone((Class)INObjectCollection);
    sub_10000A430(&qword_100042950);
    v217 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v215);
    v218 = objc_msgSend(v216, "initWithSections:", v217);

    v219 = v218;
    v227(v218, 0);

    return ((uint64_t (*)(char *, uint64_t))v224)(v228, v225);
  }
  v77 = 0;
  v232 = v76 + ((*(unsigned __int8 *)(v239 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v239 + 80));
  v248 = enum case for REMAccountsListDataView.Model.AccountChild.list(_:);
  v242 = enum case for REMAccountsListDataView.Model.AccountChild.customSmartList(_:);
  v240 = enum case for REMAccountsListDataView.Model.AccountChild.group(_:);
  v259 = enum case for REMAccountsListDataView.Model.GroupChild.list(_:);
  v257 = enum case for REMAccountsListDataView.Model.GroupChild.customSmartList(_:);
  v247 = xmmword_100034890;
  v229 = v76;
  while (1)
  {
    if (v77 >= *(_QWORD *)(v76 + 16))
    {
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    v78 = *(_QWORD *)(v239 + 72);
    v236 = v77;
    v79 = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v239 + 16))(v51, v232 + v78 * v77, v238);
    v80 = REMAccountsListDataView.Model.Account.children.getter(v79);
    v81 = _swiftEmptyArrayStorage;
    v281 = _swiftEmptyArrayStorage;
    v253 = *(_QWORD *)(v80 + 16);
    if (v253)
      break;
    v191 = swift_bridgeObjectRelease(v80);
LABEL_63:
    v192 = v235;
    if (v235)
    {
      swift_bridgeObjectRetain(v235);
      v193 = v234;
      v194 = sub_10001C1B0((uint64_t)v81, v230, v192);
      v234 = v193;
      swift_bridgeObjectRelease(v81);
      v191 = swift_bridgeObjectRelease(v192);
      v81 = v194;
    }
    v195 = (void *)REMAccountsListDataView.Model.Account.account.getter(v191);
    v196 = objc_msgSend(v195, "displayName");

    static String._unconditionallyBridgeFromObjectiveC(_:)(v196);
    v198 = v197;

    v199 = objc_allocWithZone((Class)INObjectSection);
    v200 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v198);
    v201 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v81);
    v202 = objc_msgSend(v199, "initWithTitle:items:", v200, v201);

    v203 = v202;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v205 = *(_QWORD *)((v282 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v204 = *(_QWORD *)((v282 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v205 >= v204 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v204 > 1, v205 + 1, 1);
    v77 = v236 + 1;
    v206 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v205, v203);
    specialized Array._endMutation()(v206);

    (*(void (**)(char *, uint64_t))(v239 + 8))(v51, v238);
    v76 = v229;
    if (v77 == v231)
      goto LABEL_68;
  }
  v82 = v246;
  v251 = v80 + ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80));
  v233 = v80;
  swift_bridgeObjectRetain(v80);
  v83 = 0;
  v250 = *(_QWORD *)(v82 + 72);
  v249 = *(void (**)(_QWORD, _QWORD, _QWORD))(v82 + 16);
  v84 = (char *)v255;
  v85 = v254;
  v86 = v252;
  while (1)
  {
    v256 = v83;
    v95 = (void (*)(void **, char *, char *))v249;
    v249(v86, v251 + v250 * v83, v84);
    v95(v85, v86, v84);
    v96 = (*(uint64_t (**)(void **, char *))(v82 + 88))(v85, v84);
    if (v96 != v248)
      break;
    (*(void (**)(void **, char *))(v82 + 96))(v85, v84);
    v87 = *v85;
    v88 = sub_10000A430(&qword_1000427E0);
    v89 = swift_allocObject(v88, 40, 7);
    *(_OWORD *)(v89 + 16) = v247;
    v90 = v82;
    v91 = sub_10001AEEC(v87);
    *(_QWORD *)(v89 + 32) = v91;
    aBlock = (void **)v89;
    specialized Array._endMutation()(v91);
    v92 = (char *)v255;
    v93 = aBlock;

LABEL_35:
    v94 = v256 + 1;
    v86 = v252;
    (*(void (**)(char *, char *))(v90 + 8))(v252, v92);
    v84 = v92;
    sub_10000E068((uint64_t)v93);
    v83 = v94;
    v82 = v90;
    v85 = v254;
    if (v94 == v253)
    {
      v191 = swift_bridgeObjectRelease_n(v233, 2);
      v81 = v281;
      v51 = v237;
      goto LABEL_63;
    }
  }
  if (v96 == v242)
  {
    (*(void (**)(void **, char *))(v82 + 96))(v85, v84);
    v97 = *v85;
    v98 = sub_10000A430(&qword_1000427E0);
    v99 = swift_allocObject(v98, 40, 7);
    *(_OWORD *)(v99 + 16) = v247;
    v100 = objc_msgSend(v97, "objectID");
    v101 = objc_msgSend(v100, "urlRepresentation");

    v102 = v265;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v101);

    URL.absoluteString.getter(v103);
    v105 = v104;
    (*(void (**)(char *, uint64_t))(v266 + 8))(v102, v267);
    v106 = objc_msgSend(v97, "name");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v106);
    v108 = v107;

    v109 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v269));
    v110 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v105);
    v111 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v108);
    v112 = objc_msgSend(v109, "initWithIdentifier:displayString:", v110, v111);

    v113 = objc_msgSend(v97, "customContext");
    v114 = objc_msgSend(v113, "badge");
    v115 = objc_msgSend(v113, "color");
    v116 = TTRListBadgeView.Shape.customSmartListInListRowView.unsafeMutableAddressor();
    sub_10001BE00(v116, (uint64_t)v283);
    v117 = (void *)sub_10001B7C4(v114, v115, (uint64_t)v283);

    if (v117)
    {
      objc_msgSend(v112, "setDisplayImage:", v117);

    }
    v118 = objc_msgSend(v112, "setSubtitleString:", 0);
    *(_QWORD *)(v99 + 32) = v112;
    aBlock = (void **)v99;
    specialized Array._endMutation()(v118);
    v93 = aBlock;

    v66 = v268;
    v92 = (char *)v255;
LABEL_60:
    v90 = v246;
    goto LABEL_35;
  }
  if (v96 != v240)
    goto LABEL_83;
  (*(void (**)(void **, char *))(v82 + 96))(v85, v84);
  v119 = (*(uint64_t (**)(char *, void **, uint64_t))(v244 + 32))(v243, v85, v245);
  v120 = REMAccountsListDataView.Model.Group.lists.getter(v119);
  v121 = v120;
  v84 = *(char **)(v120 + 16);
  if (!v84)
  {
    swift_bridgeObjectRelease(v120);
    v93 = (void **)_swiftEmptyArrayStorage;
LABEL_59:
    v92 = (char *)v255;
    (*(void (**)(char *, uint64_t))(v244 + 8))(v243, v245);
    goto LABEL_60;
  }
  v280 = (void **)_swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v84);
  v122 = (*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
  v241 = v121;
  v123 = v121 + v122;
  v263 = *(_QWORD *)(v67 + 72);
  v264 = *(void (**)(_QWORD, _QWORD, _QWORD))(v67 + 16);
  while (1)
  {
    v129 = (void (*)(id *, char *, uint64_t))v264;
    v264(v54, v123, v66);
    v130 = v261;
    v129(v261, v54, v66);
    v131 = (*(uint64_t (**)(id *, uint64_t))(v67 + 88))(v130, v66);
    v272 = v84;
    v271 = v123;
    if (v131 != v259)
      break;
    (*(void (**)(id *, uint64_t))(v67 + 96))(v130, v66);
    v132 = *v130;
    v133 = objc_msgSend(*v130, "objectID");
    v134 = objc_msgSend(v133, "urlRepresentation");

    v135 = v265;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v134);

    URL.absoluteString.getter(v136);
    v138 = v137;
    (*(void (**)(char *, uint64_t))(v266 + 8))(v135, v267);
    v139 = objc_msgSend(v132, "displayName");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v139);
    v141 = v140;

    v142 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v269));
    v143 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v138);
    v144 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v141);
    v145 = objc_msgSend(v142, "initWithIdentifier:displayString:", v143, v144);

    v146 = objc_msgSend(v132, "appearanceContext");
    v147 = objc_msgSend(v146, "badge");

    v148 = objc_msgSend(v132, "color");
    memset(v284, 0, sizeof(v284));
    v285 = 0;
    v286 = 2;
    v279 = 0;
    sub_10001BDC0();
    v149 = static OS_dispatch_queue.main.getter();
    v150 = (_QWORD *)swift_allocObject(&unk_10003D968, 96, 7);
    v151 = v270;
    v150[2] = v270;
    v150[3] = v147;
    v150[4] = v148;
    sub_10001BE00((uint64_t)v284, (uint64_t)(v150 + 5));
    v150[11] = &v279;
    v152 = swift_allocObject(&unk_10003D990, 32, 7);
    *(_QWORD *)(v152 + 16) = sub_10001BE3C;
    *(_QWORD *)(v152 + 24) = v150;
    v277 = sub_10000EF14;
    v278 = v152;
    aBlock = _NSConcreteStackBlock;
    v274 = 1107296256;
    v275 = sub_10001BBB0;
    v276 = &unk_10003D9A8;
    v153 = _Block_copy(&aBlock);
    v154 = v278;
    v155 = v151;
    swift_retain();
    v156 = v147;
    v157 = v148;
    swift_release(v154);
    dispatch_sync(v149, v153);

    _Block_release(v153);
    LOBYTE(v154) = swift_isEscapingClosureAtFileLocation(v152, "", 132, 199, 33, 1);
    swift_release(v152);
    if ((v154 & 1) != 0)
    {
      __break(1u);
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    v158 = v279;

    swift_release(v150);
    if (v158)
    {
      objc_msgSend(v145, "setDisplayImage:", v158);

    }
    v159 = v145;
    v160 = objc_msgSend(v132, "sharingStatusText");
    v161 = v160;
    v67 = v260;
    v54 = v262;
    v66 = v268;
    if (v160)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v160);
      v163 = v162;

      v161 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v163);
    }
    v124 = v272;
    v125 = v271;
    objc_msgSend(v159, "setSubtitleString:", v161);

LABEL_45:
    v126 = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v54, v66);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v126);
    v127 = v280[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v127);
    v128 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v127, v159);
    specialized ContiguousArray._endMutation()(v128);
    v123 = v125 + v263;
    v84 = v124 - 1;
    if (!v84)
    {
      v93 = v280;
      swift_bridgeObjectRelease(v241);
      goto LABEL_59;
    }
  }
  if (v131 == v257)
  {
    (*(void (**)(id *, uint64_t))(v67 + 96))(v130, v66);
    v164 = *v130;
    v165 = objc_msgSend(*v130, "objectID");
    v166 = objc_msgSend(v165, "urlRepresentation");

    v167 = v265;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v166);

    URL.absoluteString.getter(v168);
    v170 = v169;
    (*(void (**)(char *, uint64_t))(v266 + 8))(v167, v267);
    v171 = objc_msgSend(v164, "name");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v171);
    v173 = v172;

    v174 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v269));
    v175 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v170);
    v176 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v173);
    v159 = objc_msgSend(v174, "initWithIdentifier:displayString:", v175, v176);

    v258 = v164;
    v177 = objc_msgSend(v164, "customContext");
    v178 = objc_msgSend(v177, "badge");
    v179 = objc_msgSend(v177, "color");
    v180 = TTRListBadgeView.Shape.customSmartListInListRowView.unsafeMutableAddressor();
    sub_10001BE00(v180, (uint64_t)&v287);
    v279 = 0;
    sub_10001BDC0();
    v181 = static OS_dispatch_queue.main.getter();
    v182 = (_QWORD *)swift_allocObject(&unk_10003D8F0, 96, 7);
    v183 = v270;
    v182[2] = v270;
    v182[3] = v178;
    v182[4] = v179;
    sub_10001BE00((uint64_t)&v287, (uint64_t)(v182 + 5));
    v182[11] = &v279;
    v184 = swift_allocObject(&unk_10003D918, 32, 7);
    *(_QWORD *)(v184 + 16) = sub_10001BE3C;
    *(_QWORD *)(v184 + 24) = v182;
    v277 = sub_10000EF14;
    v278 = v184;
    aBlock = _NSConcreteStackBlock;
    v274 = 1107296256;
    v275 = sub_10001BBB0;
    v276 = &unk_10003D930;
    v185 = _Block_copy(&aBlock);
    v186 = v278;
    v187 = v183;
    swift_retain();
    v188 = v178;
    v189 = v179;
    swift_release(v186);
    dispatch_sync(v181, v185);

    _Block_release(v185);
    LOBYTE(v185) = swift_isEscapingClosureAtFileLocation(v184, "", 132, 199, 33, 1);
    swift_release(v184);
    if ((v185 & 1) != 0)
      goto LABEL_75;
    v190 = v279;

    swift_release(v182);
    v54 = v262;
    v125 = v271;
    if (v190)
    {
      objc_msgSend(v159, "setDisplayImage:", v190);

    }
    objc_msgSend(v159, "setSubtitleString:", 0);
    v66 = v268;
    v67 = v260;
    v124 = v272;
    v161 = v258;
    goto LABEL_45;
  }
  _diagnoseUnexpectedEnumCase<A>(type:)(v66, v66);
  __break(1u);
LABEL_83:
  result = _diagnoseUnexpectedEnumCase<A>(type:)(v84, v84);
  __break(1u);
  return result;
}

BOOL sub_10001A98C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  _BOOL8 result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
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
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v3 = *a1;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMSmartListTypeToday);
  v6 = v5;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  if (v4 == v7 && v6 == v8)
    goto LABEL_14;
  v10 = v8;
  v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7, v8, 0);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v10);
  if ((v11 & 1) != 0)
    return 1;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMSmartListTypeFlagged);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  if (v13 == v16 && v15 == v17)
  {
    v21 = swift_bridgeObjectRelease_n(v15, 2);
    goto LABEL_16;
  }
  v19 = v17;
  v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v16, v17, 0);
  swift_bridgeObjectRelease(v15);
  v21 = swift_bridgeObjectRelease(v19);
  if ((v20 & 1) != 0)
  {
LABEL_16:
    v27 = (_QWORD *)TTRAccountsListsViewModel.AccountsCapabilities.supportsFlagged.unsafeMutableAddressor(v21);
    return (*v27 & ~a2) == 0;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMSmartListTypeScheduled);
  v6 = v23;
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v26 = v24;
  if (v22 == v25 && v6 == v24)
  {
LABEL_14:
    swift_bridgeObjectRelease_n(v6, 2);
    return 1;
  }
  v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v6, v25, v24, 0);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v26);
  if ((v28 & 1) != 0)
    return 1;
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMSmartListTypeAll);
  v31 = v30;
  v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v34 = v32;
  if (v29 == v33 && v31 == v32)
  {
    v35 = v31;
LABEL_23:
    swift_bridgeObjectRelease_n(v35, 2);
    return 0;
  }
  v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v31, v33, v32, 0);
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v34);
  result = 0;
  if ((v36 & 1) == 0)
  {
    v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMSmartListTypeAssigned);
    v39 = v38;
    v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v42 = v40;
    if (v37 == v41 && v39 == v40)
    {
      v43 = swift_bridgeObjectRelease_n(v39, 2);
LABEL_30:
      v27 = (_QWORD *)TTRAccountsListsViewModel.AccountsCapabilities.supportsAssignment.unsafeMutableAddressor(v43);
      return (*v27 & ~a2) == 0;
    }
    v44 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v39, v41, v40, 0);
    swift_bridgeObjectRelease(v39);
    v43 = swift_bridgeObjectRelease(v42);
    if ((v44 & 1) != 0)
      goto LABEL_30;
    v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMSmartListTypeSiriFoundInApps);
    v47 = v46;
    v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v50 = v48;
    if (v45 == v49 && v47 == v48)
    {
LABEL_33:
      v35 = v47;
      goto LABEL_23;
    }
    v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v45, v47, v49, v48, 0);
    swift_bridgeObjectRelease(v47);
    swift_bridgeObjectRelease(v50);
    result = 0;
    if ((v51 & 1) == 0)
    {
      v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(REMSmartListTypeTagged);
      v47 = v53;
      v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
      v56 = v54;
      if (v52 != v55 || v47 != v54)
      {
        _stringCompareWithSmolCheck(_:_:expecting:)(v52, v47, v55, v54, 0);
        swift_bridgeObjectRelease(v47);
        swift_bridgeObjectRelease(v56);
        return 0;
      }
      goto LABEL_33;
    }
  }
  return result;
}

id sub_10001ACE8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSString v17;
  uint64_t v18;
  id v19;
  NSString v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000A430(&qword_100042930);
  __chkstk_darwin(v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  REMNavigationSpecifier.init(_:)();
  v10 = type metadata accessor for REMNavigationSpecifier(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_10000A5D0((uint64_t)v8, &qword_100042930);
    v12 = 0;
  }
  else
  {
    REMNavigationSpecifier.url.getter();
    v13 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    URL.absoluteString.getter(v13);
    v12 = v14;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  REMSmartListType.title.getter(v9);
  if (v15)
    v16 = v15;
  else
    v16 = 0xE500000000000000;
  if (v12)
  {
    v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
  }
  else
  {
    v17 = 0;
  }
  v18 = type metadata accessor for ConfigurationList(0);
  v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v18));
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  v21 = objc_msgSend(v19, "initWithIdentifier:displayString:", v17, v20);

  v22 = sub_10001B668(v9);
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(v21, "setDisplayImage:", v22);

  }
  return v21;
}

id sub_10001AEEC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSString v15;
  NSString v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  _OWORD v25[2];
  uint64_t v26;
  char v27;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ConfigurationList(0);
  v7 = objc_msgSend(a1, "objectID");
  v8 = objc_msgSend(v7, "urlRepresentation");

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v8);
  URL.absoluteString.getter();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11 = objc_msgSend(a1, "displayName");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v13 = v12;

  v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  v17 = objc_msgSend(v14, "initWithIdentifier:displayString:", v15, v16);

  v18 = objc_msgSend(a1, "appearanceContext");
  v19 = objc_msgSend(v18, "badge");

  v20 = objc_msgSend(a1, "color");
  memset(v25, 0, sizeof(v25));
  v26 = 0;
  v27 = 2;
  v21 = (void *)sub_10001B7C4(v19, v20, (uint64_t)v25);

  if (v21)
  {
    objc_msgSend(v17, "setDisplayImage:", v21);

  }
  v22 = v17;
  v23 = objc_msgSend(a1, "sharingStatusText");
  objc_msgSend(v22, "setSubtitleString:", v23);

  return v22;
}

uint64_t sub_10001B14C(uint64_t a1, uint64_t (*a2)(_QWORD, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  _QWORD v15[3];
  _BYTE v16[8];
  uint64_t v17;

  if (qword_100042070 != -1)
    swift_once(&qword_100042070, sub_100018A10);
  v4 = type metadata accessor for Logger(0);
  sub_10000A4A4(v4, (uint64_t)qword_1000428D0);
  swift_errorRetain();
  v5 = swift_errorRetain();
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue(a1, v16, v15);
    v10 = Error.localizedDescription.getter(v15[1], v15[2]);
    v12 = v11;
    v14 = sub_10002CB54(v10, v11, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, v15, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Widget provideListOptions failed error %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return a2(0, a1);
}

id sub_10001B3DC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = v1;
  if (qword_100042070 != -1)
    swift_once(&qword_100042070, sub_100018A10);
  v4 = type metadata accessor for Logger(0);
  sub_10000A4A4(v4, (uint64_t)qword_1000428D0);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = v2;
    v9 = swift_slowAlloc(32, -1);
    v24 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    v11 = objc_msgSend(v10, "description");
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v14 = v13;

    v23 = sub_10002CB54(v12, v14, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v8 + 4, v8 + 12);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Widget defaultList {intent: %s}", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    v15 = v9;
    v2 = v22;
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource + 24);
  v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource + 32);
  sub_10000A4BC((_QWORD *)(v2 + OBJC_IVAR____TtC25RemindersIntentsExtension26ConfigurationIntentHandler_dataSource), v16);
  v18 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 72))(v16, v17);
  if (!v18)
    return sub_10001ACE8(REMSmartListTypeToday);
  v19 = v18;
  v20 = sub_10001AEEC(v18);

  return v20;
}

uint64_t sub_10001B668(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  _QWORD aBlock[5];
  uint64_t v14;
  uint64_t v15;

  v2 = v1;
  v15 = 0;
  sub_10001BDC0();
  v4 = static OS_dispatch_queue.main.getter();
  v5 = (_QWORD *)swift_allocObject(&unk_10003D7D8, 40, 7);
  v5[2] = a1;
  v5[3] = v2;
  v5[4] = &v15;
  v6 = swift_allocObject(&unk_10003D800, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_10001BF84;
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = sub_10000EF14;
  v14 = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001BBB0;
  aBlock[3] = &unk_10003D818;
  v7 = _Block_copy(aBlock);
  v8 = v14;
  v9 = a1;
  v10 = v2;
  swift_retain();
  swift_release(v8);
  dispatch_sync(v4, v7);

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation(v6, "", 132, 239, 33, 1);
  result = swift_release(v6);
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v12 = v15;
    swift_release(v5);
    return v12;
  }
  return result;
}

uint64_t sub_10001B7C4(void *a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t result;
  uint64_t v17;
  _QWORD aBlock[5];
  uint64_t v19;
  uint64_t v20;

  v4 = v3;
  v20 = 0;
  sub_10001BDC0();
  v8 = static OS_dispatch_queue.main.getter();
  v9 = (_QWORD *)swift_allocObject(&unk_10003D760, 96, 7);
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a2;
  sub_10001BE00(a3, (uint64_t)(v9 + 5));
  v9[11] = &v20;
  v10 = swift_allocObject(&unk_10003D788, 32, 7);
  *(_QWORD *)(v10 + 16) = sub_10001BE3C;
  *(_QWORD *)(v10 + 24) = v9;
  aBlock[4] = sub_10000EE04;
  v19 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001BBB0;
  aBlock[3] = &unk_10003D7A0;
  v11 = _Block_copy(aBlock);
  v12 = v19;
  v13 = a2;
  swift_retain();
  v14 = v4;
  v15 = a1;
  swift_release(v12);
  dispatch_sync(v8, v11);

  _Block_release(v11);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation(v10, "", 132, 199, 33, 1);
  result = swift_release(v10);
  if ((v8 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v17 = v20;
    swift_release(v9);
    return v17;
  }
  return result;
}

void sub_10001B93C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, id *a5)
{
  _QWORD *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  _BYTE v28[56];

  v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TTRListBadgeView(0)), "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
  if (!a2)
    goto LABEL_7;
  v10 = objc_msgSend(a2, "emoji");
  if (!v10)
  {
    v19 = objc_msgSend(a2, "emblem");
    if (v19)
    {
      v20 = v19;
      v21 = REMListBadgeEmblem.image.getter(v19);

      goto LABEL_8;
    }
LABEL_7:
    v21 = REMListBadgeEmblem.image.getter(REMListBadgeEmblemDefault);
LABEL_8:
    (*(void (**)(uint64_t))((swift_isaMask & *v9) + 0x140))(v21);
    if (!a3)
      goto LABEL_4;
    goto LABEL_9;
  }
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v14 = v13;

  v15 = (*(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & *v9) + 0x158))(v12, v14);
  (*(void (**)(uint64_t, double))((swift_isaMask & *v9) + 0x170))(v15, 20.0);
  if (!a3)
  {
LABEL_4:
    v16 = TTRListColors.defaultColor.unsafeMutableAddressor(v9);
    swift_beginAccess(v16, &v27, 0, 0);
    sub_10001BE68(v16, (uint64_t)v28);
    v17 = sub_10001BEE0((uint64_t)v28, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001BEA4);
    v18 = (void *)TTRListColors.Color.nativeColor.getter(v17);
    sub_10001BEE0((uint64_t)v28, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001BF1C);
    goto LABEL_10;
  }
LABEL_9:
  v18 = (void *)REMColor.nativeColor.getter(v9);
LABEL_10:
  objc_msgSend(v9, "setTintColor:", v18);

  (*(void (**)(uint64_t))((swift_isaMask & *v9) + 0x110))(a4);
  UIView.ttr_setNeedsLayout()();
  objc_msgSend(v9, "layoutIfNeeded");
  v22 = (unint64_t)UIView.snapshotImage()();
  if (v22)
  {
    v23 = (_QWORD *)v22;
    v24 = objc_msgSend((id)objc_opt_self(INImage), "imageWithUIImage:", v22);
    v25 = *a5;
    *a5 = v24;

    if (*a5)
    {
      v26 = *a5;
      objc_msgSend(v26, "_setRenderingMode:", 1);

    }
    v9 = v23;
  }

}

uint64_t sub_10001BBB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_10001BBD0(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void (*v10)(void *);
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v5 = REMSmartListType.glyph.getter();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = REMSmartListType.color.getter(a1);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TTRListBadgeView(0)), "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
      v10 = *(void (**)(void *))((swift_isaMask & *v9) + 0x140);
      v17 = v6;
      v10(v6);
      objc_msgSend(v9, "setTintColor:", v8);
      v11 = (unint64_t)UIView.snapshotImage()();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend((id)objc_opt_self(INImage), "imageWithUIImage:", v11);
        v14 = *a3;
        *a3 = v13;

        if (*a3)
        {
          v15 = *a3;
          objc_msgSend(v15, "_setRenderingMode:", 1);

        }
      }
      else
      {
        v12 = v17;
        v17 = v9;
      }

      v16 = v17;
    }
    else
    {
      v16 = v6;
    }

  }
}

uint64_t type metadata accessor for ConfigurationIntentHandler()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension26ConfigurationIntentHandler);
}

unint64_t sub_10001BDC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000420C0;
  if (!qword_1000420C0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000420C0);
  }
  return result;
}

uint64_t sub_10001BE00(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for TTRListBadgeView.Shape - 1) + 32))(a2, a1);
  return a2;
}

uint64_t sub_10001BE40()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001BE50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001BE60(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001BE68(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for TTRListColors.Color - 1) + 32))(a2, a1);
  return a2;
}

id sub_10001BEA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if ((a7 & 1) != 0)
    return a1;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  return (id)swift_bridgeObjectRetain(a6);
}

uint64_t sub_10001BEE0(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  return a1;
}

void sub_10001BF1C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if ((a7 & 1) != 0)
  {

  }
  else
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
  }
}

uint64_t sub_10001BF58()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

void sub_10001BF84()
{
  uint64_t v0;

  sub_10001BBD0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(id **)(v0 + 32));
}

uint64_t sub_10001BF90()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001BFA0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10001BFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100018FC8(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10001BFCC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001C000(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100019020(a1, a2, *(uint64_t (**)(id, _QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(char **)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_10001C010()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001C034(char *a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, char *);
  uint64_t v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  v4 = *(_QWORD *)a1;
  v5 = sub_10000A430(&qword_100042948);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_10001C08C(uint64_t a1)
{
  uint64_t v1;

  return sub_10001B14C(a1, *(uint64_t (**)(_QWORD, uint64_t))(v1 + 16));
}

uint64_t sub_10001C094(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000A430(&qword_100042758);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_10001C0DC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  void **v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  result = _swiftEmptyArrayStorage;
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)(v2);
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      v6 = v5;
      v7 = sub_10001ACE8(v6);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v8);
      v9 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
      v10 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7);
      specialized ContiguousArray._endMutation()(v10);
      --v2;
    }
    while (v2);
    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001C1A0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

_QWORD *sub_10001C1B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  _QWORD *v32;

  v4 = v3;
  v28 = a2;
  v29 = a3;
  v6 = sub_10000A430(&qword_100042958);
  __chkstk_darwin(v6);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = _swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
    goto LABEL_16;
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v9)
  {
    while (1)
    {
      v10 = 0;
      v27 = a1 & 0xC000000000000001;
      v25[1] = v4;
      v26 = a1 & 0xFFFFFFFFFFFFFF8;
      while (v27)
      {
        v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a1);
LABEL_9:
        v4 = v11;
        v12 = v10 + 1;
        if (__OFADD__(v10, 1))
          goto LABEL_15;
        v13 = objc_msgSend(v11, "displayString");
        v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
        v16 = v15;

        v30[2] = v14;
        v31 = v16;
        v30[0] = v28;
        v30[1] = v29;
        v17 = type metadata accessor for Locale(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v8, 1, 1, v17);
        v18 = sub_100011420();
        StringProtocol.range<A>(of:options:range:locale:)(v30, 1, 0, 0, 1, v8, &type metadata for String, &type metadata for String, v18, v18);
        LOBYTE(v13) = v19;
        sub_10000A5D0((uint64_t)v8, &qword_100042958);
        v20 = swift_bridgeObjectRelease(v31);
        if ((v13 & 1) != 0)
        {

        }
        else
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v20);
          v21 = v32[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v21);
          v22 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v21, v4);
          specialized ContiguousArray._endMutation()(v22);
        }
        ++v10;
        if (v12 == v9)
          return v32;
      }
      if (v10 < *(_QWORD *)(v26 + 16))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      if (a1 < 0)
        v24 = a1;
      else
        v24 = a1 & 0xFFFFFFFFFFFFFF8;
      v9 = _CocoaArrayWrapper.endIndex.getter(v24);
      if (!v9)
        return _swiftEmptyArrayStorage;
    }
    v11 = *(id *)(a1 + 8 * v10 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10001C3DC()
{
  id *v0;

  return swift_deallocObject(v0, 96, 7);
}

void sub_10001C410()
{
  uint64_t v0;

  sub_10001B93C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), v0 + 40, *(id **)(v0 + 88));
}

uint64_t sub_10001C424()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10001C434(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  NSString v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  type metadata accessor for ConfigurationIntentResponse(0);
  v4 = (void *)ConfigurationIntentResponse.__allocating_init(code:userActivity:)(4, 0);
  v5 = objc_msgSend(a1, "list");
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "identifier");

    if (v7)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
      v9 = v8;

      v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v9);
    }
    else
    {
      v6 = 0;
    }
  }
  objc_msgSend(v4, "setList:", v6);

  if (qword_100042070 != -1)
    swift_once(&qword_100042070, sub_100018A10);
  v10 = type metadata accessor for Logger(0);
  sub_10000A4A4(v10, (uint64_t)qword_1000428D0);
  v11 = a1;
  v12 = v4;
  v13 = v11;
  v14 = v12;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(22, -1);
    v28 = swift_slowAlloc(64, -1);
    v31 = v28;
    *(_DWORD *)v17 = 136315394;
    v18 = v13;
    v19 = objc_msgSend(v18, "description");
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v29 = a2;
    v22 = v21;

    v30 = sub_10002CB54(v20, v22, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v17 + 4, v17 + 12);

    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v17 + 12) = 2080;
    v23 = v14;
    v24 = objc_msgSend(v23, "description");
    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v27 = v26;

    v30 = sub_10002CB54(v25, v27, &v31);
    a2 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v17 + 14, v17 + 22);

    swift_bridgeObjectRelease(v27);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Widget handle {intent: %s, response: %s}", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

  }
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v14);

}

unint64_t sub_10001C784(uint64_t a1)
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
  sub_10000A430(&qword_100042BA0);
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
    sub_10000A58C(v7, (uint64_t)&v16, &qword_100042BA8);
    v8 = v16;
    v9 = v17;
    result = sub_1000226F0(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100028228(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_10001C8B8(uint64_t a1)
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
  sub_10000A430(&qword_100042B98);
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
    result = sub_1000226F0(v7, v8);
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

uint64_t sub_10001C9D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042960);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042960);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_10001CA60(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  NSObject *v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  Class isa;
  _QWORD *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  objc_class *v42;
  void (*v43)(_QWORD);
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  void *ObjCClassFromMetadata;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  os_log_type_t type[8];
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;

  v5 = (_QWORD *)REMSiriSearchDataView.ListsResult.lists.getter(a1);
  v6 = REMSiriSearchDataView.ListsResult.smartLists.getter(v5);
  v81 = v5;
  v7 = sub_10000A430(&qword_1000425C8);
  v8 = type metadata accessor for UUID(0);
  v9 = sub_1000282EC();
  v10 = sub_100028164(&qword_100042C18, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v11 = Sequence.unique<A>(by:)(sub_10001D5C4, 0, v7, v8, v9, v10);
  swift_bridgeObjectRelease(v5);
  if ((unint64_t)v11 >> 62)
  {
    if (v11 < 0)
      v49 = v11;
    else
      v49 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v11);
    v12 = (void *)_CocoaArrayWrapper.endIndex.getter(v49);
    swift_bridgeObjectRelease(v11);
    if (v12)
      goto LABEL_5;
  }
  else
  {
    v12 = *(void **)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_5;
  }
  if (!((unint64_t)v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_65:
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v6);
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v73 = type metadata accessor for Logger(0);
    v74 = sub_10000A4A4(v73, (uint64_t)qword_100042960);
    v75 = Logger.logObject.getter(v74);
    v76 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v75, v76))
    {
      v77 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v77 = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "No REMList or REMSmartList matches the name, prompt for creation {result: .confirmationRequired(.listShouldBeCreated)}", v77, 2u);
      swift_slowDealloc(v77, -1, -1);
    }

    v47 = objc_msgSend((id)objc_opt_self(INAddTasksTargetTaskListResolutionResult), "confirmationRequiredWithTaskListToConfirm:forReason:", a2, 1);
    goto LABEL_70;
  }
  if (v6 < 0)
    v71 = v6;
  else
    v71 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v6);
  v72 = _CocoaArrayWrapper.endIndex.getter(v71);
  swift_bridgeObjectRelease(v6);
  if (!v72)
    goto LABEL_65;
LABEL_5:
  if (!((unint64_t)v11 >> 62))
  {
    v13 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v12)
      goto LABEL_19;
LABEL_12:
    if (v13 != 1)
      goto LABEL_19;
    if ((v11 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain(v11);
      v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v11);
      swift_bridgeObjectRelease(v6);
      v6 = v11;
    }
    else
    {
      if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_60;
      }
      v15 = *(id *)(v11 + 32);
    }
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v6);
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    v11 = (uint64_t)v15;
    v12 = (void *)INTaskList.init(list:includeReminders:)(v11, 0);
    if (qword_100042078 == -1)
    {
LABEL_17:
      v16 = type metadata accessor for Logger(0);
      sub_10000A4A4(v16, (uint64_t)qword_100042960);
      v17 = (id)v11;
      v18 = v12;
      v19 = v17;
      v20 = v18;
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = swift_slowAlloc(22, -1);
        v24 = (_QWORD *)swift_slowAlloc(16, -1);
        *(_DWORD *)v23 = 138412546;
        *(_QWORD *)type = a3;
        v25 = -[NSObject objectID](v19, "objectID");
        v81 = v25;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v23 + 4, v23 + 12);
        *v24 = v25;

        *(_WORD *)(v23 + 12) = 2112;
        v81 = v20;
        v26 = v19;
        v27 = v20;
        a3 = *(void (**)(_QWORD))type;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v23 + 14, v23 + 22);
        v24[1] = v20;

        v19 = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Got one REMList(%@) matches the name {result: .success(%@)}", (uint8_t *)v23, 0x16u);
        v28 = sub_10000A430((uint64_t *)&unk_1000422E0);
        swift_arrayDestroy(v24, 2, v28);
        swift_slowDealloc(v24, -1, -1);
        swift_slowDealloc(v23, -1, -1);
      }
      else
      {

        v21 = v19;
      }

      v46 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
      v47 = objc_msgSend((id)swift_getObjCClassFromMetadata(v46), "successWithResolvedTaskList:", v20);

      goto LABEL_70;
    }
LABEL_60:
    swift_once(&qword_100042078, sub_10001C9D0);
    goto LABEL_17;
  }
  if (v11 < 0)
    v14 = v11;
  else
    v14 = v11 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v11);
  v13 = _CocoaArrayWrapper.endIndex.getter(v14);
  swift_bridgeObjectRelease(v11);
  if (v12)
    goto LABEL_12;
LABEL_19:
  if (!((unint64_t)v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1)
      goto LABEL_44;
    swift_bridgeObjectRelease(v11);
    v29 = *(void **)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v29)
      goto LABEL_22;
    goto LABEL_43;
  }
  if (v6 < 0)
    v50 = v6;
  else
    v50 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v6);
  v51 = _CocoaArrayWrapper.endIndex.getter(v50);
  swift_bridgeObjectRelease(v6);
  if (v51 == 1)
  {
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRetain(v6);
    v29 = (void *)_CocoaArrayWrapper.endIndex.getter(v50);
    swift_bridgeObjectRelease(v6);
    if (v29)
    {
LABEL_22:
      if ((v6 & 0xC000000000000001) != 0)
      {
        v30 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v6);
      }
      else
      {
        if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_73;
        }
        v30 = *(id *)(v6 + 32);
      }
      v31 = v30;
      swift_bridgeObjectRelease(v6);
      sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
      v11 = v31;
      v29 = (void *)INTaskList.init(smartList:reminders:)(v11, _swiftEmptyArrayStorage);
      if (qword_100042078 == -1)
      {
LABEL_26:
        v32 = type metadata accessor for Logger(0);
        sub_10000A4A4(v32, (uint64_t)qword_100042960);
        v33 = (id)v11;
        v34 = v29;
        isa = (Class)v33;
        v36 = v34;
        v37 = Logger.logObject.getter(v36);
        v38 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v37, v38))
        {
          v39 = swift_slowAlloc(22, -1);
          v40 = (_QWORD *)swift_slowAlloc(16, -1);
          *(_DWORD *)v39 = 138412546;
          v41 = -[objc_class objectID](isa, "objectID");
          v81 = v41;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v39 + 4, v39 + 12);
          *v40 = v41;

          *(_WORD *)(v39 + 12) = 2112;
          v81 = v36;
          v42 = isa;
          v43 = a3;
          v44 = v36;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v39 + 14, v39 + 22);
          v40[1] = v36;

          a3 = v43;
          isa = v42;
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "Found REMSmartList matching the name {objectID: %@, result: .success(%@)}", (uint8_t *)v39, 0x16u);
          v45 = sub_10000A430((uint64_t *)&unk_1000422E0);
          swift_arrayDestroy(v40, 2, v45);
          swift_slowDealloc(v40, -1, -1);
          swift_slowDealloc(v39, -1, -1);
        }
        else
        {

          v37 = isa;
        }

        v48 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
        v47 = objc_msgSend((id)swift_getObjCClassFromMetadata(v48), "successWithResolvedTaskList:", v36);

LABEL_58:
LABEL_70:
        a3(v47);

        return;
      }
LABEL_73:
      swift_once(&qword_100042078, sub_10001C9D0);
      goto LABEL_26;
    }
LABEL_43:
    swift_bridgeObjectRelease(v6);
    __break(1u);
  }
LABEL_44:
  swift_bridgeObjectRelease(v6);
  v52 = _swiftEmptyArrayStorage;
  if (!v13)
    goto LABEL_52;
  v81 = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v13);
  if ((v13 & 0x8000000000000000) == 0)
  {
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    v53 = 0;
    do
    {
      if ((v11 & 0xC000000000000001) != 0)
        v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v53, v11);
      else
        v54 = *(id *)(v11 + 8 * v53 + 32);
      ++v53;
      v55 = INTaskList.init(list:includeReminders:)(v54, 0);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v55);
      v56 = v81[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v56);
      v57 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v56, v55);
      specialized ContiguousArray._endMutation()(v57);
    }
    while (v13 != v53);
    v52 = v81;
LABEL_52:
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v58 = type metadata accessor for Logger(0);
    sub_10000A4A4(v58, (uint64_t)qword_100042960);
    swift_bridgeObjectRetain_n(v52, 2);
    v59 = swift_bridgeObjectRetain(v11);
    v60 = Logger.logObject.getter(v59);
    v61 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = swift_slowAlloc(22, -1);
      v63 = (_QWORD *)swift_slowAlloc(32, -1);
      v81 = v63;
      *(_DWORD *)v62 = 134218242;
      swift_bridgeObjectRelease(v11);
      v79 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v62 + 4, v62 + 12);
      swift_bridgeObjectRelease(v11);
      *(_WORD *)(v62 + 12) = 2080;
      v64 = sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
      v65 = swift_bridgeObjectRetain(v52);
      v66 = Array.description.getter(v65, v64);
      v68 = v67;
      swift_bridgeObjectRelease(v52);
      v79 = sub_10002CB54(v66, v68, (uint64_t *)&v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v62 + 14, v62 + 22);
      swift_bridgeObjectRelease_n(v52, 2);
      swift_bridgeObjectRelease(v68);
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "Got %ld REMList matches the name {result: .disambiguation(%s)}", (uint8_t *)v62, 0x16u);
      swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v63, -1, -1);
      swift_slowDealloc(v62, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v52, 2);
      swift_bridgeObjectRelease_n(v11, 2);
    }
    v69 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v69);
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v52);
    v47 = objc_msgSend(ObjCClassFromMetadata, "disambiguationWithTaskListsToDisambiguate:", isa);
    goto LABEL_58;
  }
  __break(1u);
}

void sub_10001D5C4(id *a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(*a1, "remObjectID");
  v2 = objc_msgSend(v1, "uuid");

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v2);
}

void sub_10001D638(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4, uint64_t a5, void (*a6)(_QWORD))
{
  void *v6;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD);
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void **v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  void *ObjCClassFromMetadata;
  Class isa;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  _QWORD *v95;
  os_log_type_t v96;
  _QWORD *v97;
  NSObject *loga;
  os_log_t log;
  os_log_t logb;
  _QWORD *v101;
  void (*v102)(_QWORD);
  void (*v103)(_QWORD);
  uint64_t v104;
  _QWORD *p_isa;

  if (!((unint64_t)a1 >> 62))
  {
    v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_3;
LABEL_32:
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v78 = type metadata accessor for Logger(0);
    sub_10000A4A4(v78, (uint64_t)qword_100042960);
    swift_bridgeObjectRetain_n(a2, 2);
    swift_bridgeObjectRetain_n(a3, 2);
    v79 = swift_bridgeObjectRetain_n(a4, 2);
    v80 = Logger.logObject.getter(v79);
    v81 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = swift_slowAlloc(32, -1);
      v97 = (_QWORD *)swift_slowAlloc(96, -1);
      p_isa = v97;
      *(_DWORD *)v82 = 136315650;
      v103 = a6;
      v83 = sub_10000A848(0, &qword_100042BB8, INPerson_ptr);
      v84 = swift_bridgeObjectRetain(a2);
      v85 = Array.description.getter(v84, v83);
      v87 = v86;
      swift_bridgeObjectRelease(a2);
      v104 = sub_10002CB54(v85, v87, (uint64_t *)&p_isa);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v82 + 4, v82 + 12);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease(v87);
      *(_WORD *)(v82 + 12) = 2080;
      swift_bridgeObjectRetain(a3);
      v88 = Array.description.getter(a3, &type metadata for String);
      v90 = v89;
      swift_bridgeObjectRelease(a3);
      v104 = sub_10002CB54(v88, v90, (uint64_t *)&p_isa);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v82 + 14, v82 + 22);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease(v90);
      *(_WORD *)(v82 + 22) = 2080;
      v91 = swift_bridgeObjectRetain(a4);
      v92 = Array.description.getter(v91, &type metadata for String);
      v94 = v93;
      swift_bridgeObjectRelease(a4);
      v104 = sub_10002CB54(v92, v94, (uint64_t *)&p_isa);
      a6 = v103;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v82 + 24, v82 + 32);
      swift_bridgeObjectRelease_n(a4, 2);
      swift_bridgeObjectRelease(v94);
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "No list shared with the specified .targetTaskListMembers {targetTaskListMembers: %s, emails: %s, phones: %s, result: .disambiguateDueToNoDefaultList}", (uint8_t *)v82, 0x20u);
      swift_arrayDestroy(v97, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v97, -1, -1);
      swift_slowDealloc(v82, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a4, 2);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease_n(a2, 2);
    }
    v44 = sub_10001E304();
    goto LABEL_38;
  }
  if (a1 < 0)
    v6 = (void *)a1;
  else
    v6 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain(a1);
  v77 = _CocoaArrayWrapper.endIndex.getter(v6);
  swift_bridgeObjectRelease(a1);
  if (!v77)
    goto LABEL_32;
  swift_bridgeObjectRetain(a1);
  v12 = _CocoaArrayWrapper.endIndex.getter(v6);
  swift_bridgeObjectRelease(a1);
LABEL_3:
  v13 = _swiftEmptyArrayStorage;
  if (!v12)
  {
LABEL_21:
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v51 = type metadata accessor for Logger(0);
    sub_10000A4A4(v51, (uint64_t)qword_100042960);
    swift_bridgeObjectRetain_n(a1, 2);
    swift_bridgeObjectRetain_n(a2, 2);
    swift_bridgeObjectRetain_n(a3, 2);
    swift_bridgeObjectRetain_n(a4, 2);
    v52 = swift_bridgeObjectRetain_n(v13, 2);
    v53 = Logger.logObject.getter(v52);
    v54 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = swift_slowAlloc(52, -1);
      logb = (os_log_t)swift_slowAlloc(128, -1);
      p_isa = &logb->isa;
      *(_DWORD *)v55 = 134219010;
      swift_bridgeObjectRelease(a1);
      v104 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v55 + 4, v55 + 12);
      swift_bridgeObjectRelease(a1);
      *(_WORD *)(v55 + 12) = 2080;
      v56 = a4;
      v57 = sub_10000A848(0, &qword_100042BB8, INPerson_ptr);
      v58 = swift_bridgeObjectRetain(a2);
      v59 = Array.description.getter(v58, v57);
      v96 = v54;
      v61 = v60;
      swift_bridgeObjectRelease(a2);
      v104 = sub_10002CB54(v59, v61, (uint64_t *)&p_isa);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v55 + 14, v55 + 22);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease(v61);
      *(_WORD *)(v55 + 22) = 2080;
      swift_bridgeObjectRetain(a3);
      v62 = Array.description.getter(a3, &type metadata for String);
      v64 = v63;
      swift_bridgeObjectRelease(a3);
      v104 = sub_10002CB54(v62, v64, (uint64_t *)&p_isa);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v55 + 24, v55 + 32);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease(v64);
      *(_WORD *)(v55 + 32) = 2080;
      v65 = swift_bridgeObjectRetain(v56);
      v66 = Array.description.getter(v65, &type metadata for String);
      v68 = v67;
      swift_bridgeObjectRelease(v56);
      v104 = sub_10002CB54(v66, v68, (uint64_t *)&p_isa);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v55 + 34, v55 + 42);
      swift_bridgeObjectRelease_n(v56, 2);
      swift_bridgeObjectRelease(v68);
      *(_WORD *)(v55 + 42) = 2080;
      v69 = sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
      v70 = swift_bridgeObjectRetain(v13);
      v71 = Array.description.getter(v70, v69);
      v73 = v72;
      swift_bridgeObjectRelease(v13);
      v104 = sub_10002CB54(v71, v73, (uint64_t *)&p_isa);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v55 + 44, v55 + 52);
      swift_bridgeObjectRelease_n(v13, 2);
      swift_bridgeObjectRelease(v73);
      _os_log_impl((void *)&_mh_execute_header, v53, v96, "Got %ld REMList matching .targetTaskListMembers {targetTaskListMembers: %s, emails: %s, phones: %s, result: .disambiguation(%s)}", (uint8_t *)v55, 0x34u);
      swift_arrayDestroy(logb, 4, (char *)&type metadata for Any + 8);
      swift_slowDealloc(logb, -1, -1);
      swift_slowDealloc(v55, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v13, 2);
      swift_bridgeObjectRelease_n(a4, 2);
      swift_bridgeObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease_n(a1, 2);
    }
    v74 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v74);
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v13);
    v44 = objc_msgSend(ObjCClassFromMetadata, "disambiguationWithTaskListsToDisambiguate:", isa);

    goto LABEL_38;
  }
  if (v12 == 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
    }
    else
    {
      if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_41;
      }
      v14 = *(id *)(a1 + 32);
    }
    v15 = v14;
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    v6 = (void *)INTaskList.init(list:includeReminders:)(v15, 0);
    if (qword_100042078 == -1)
    {
LABEL_9:
      v16 = type metadata accessor for Logger(0);
      sub_10000A4A4(v16, (uint64_t)qword_100042960);
      swift_bridgeObjectRetain_n(a2, 2);
      swift_bridgeObjectRetain_n(a3, 2);
      swift_bridgeObjectRetain_n(a4, 2);
      v17 = v6;
      v18 = Logger.logObject.getter(v17);
      v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        loga = v18;
        v20 = swift_slowAlloc(42, -1);
        v95 = (_QWORD *)swift_slowAlloc(8, -1);
        v101 = (_QWORD *)swift_slowAlloc(96, -1);
        p_isa = v101;
        *(_DWORD *)v20 = 136315906;
        v21 = sub_10000A848(0, &qword_100042BB8, INPerson_ptr);
        v22 = swift_bridgeObjectRetain(a2);
        v23 = Array.description.getter(v22, v21);
        v24 = a6;
        v26 = v25;
        swift_bridgeObjectRelease(a2);
        v104 = sub_10002CB54(v23, v26, (uint64_t *)&p_isa);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v20 + 4, v20 + 12);
        swift_bridgeObjectRelease_n(a2, 2);
        swift_bridgeObjectRelease(v26);
        *(_WORD *)(v20 + 12) = 2080;
        swift_bridgeObjectRetain(a3);
        v27 = Array.description.getter(a3, &type metadata for String);
        v29 = v28;
        swift_bridgeObjectRelease(a3);
        v30 = v27;
        a6 = v24;
        v104 = sub_10002CB54(v30, v29, (uint64_t *)&p_isa);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v20 + 14, v20 + 22);
        swift_bridgeObjectRelease_n(a3, 2);
        swift_bridgeObjectRelease(v29);
        *(_WORD *)(v20 + 22) = 2080;
        v31 = swift_bridgeObjectRetain(a4);
        v32 = Array.description.getter(v31, &type metadata for String);
        v34 = v33;
        swift_bridgeObjectRelease(a4);
        v104 = sub_10002CB54(v32, v34, (uint64_t *)&p_isa);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v20 + 24, v20 + 32);
        swift_bridgeObjectRelease_n(a4, 2);
        swift_bridgeObjectRelease(v34);
        *(_WORD *)(v20 + 32) = 2112;
        v104 = (uint64_t)v17;
        v35 = v17;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, &p_isa, v20 + 34, v20 + 42);
        *v95 = v17;

        _os_log_impl((void *)&_mh_execute_header, loga, v19, "Found exactly 1 list matching .targetTaskListMembers, using that. {targetTaskListMembers: %s, emails: %s, phones: %s, result: .success(%@)}", (uint8_t *)v20, 0x2Au);
        v36 = sub_10000A430((uint64_t *)&unk_1000422E0);
        swift_arrayDestroy(v95, 1, v36);
        swift_slowDealloc(v95, -1, -1);
        swift_arrayDestroy(v101, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v101, -1, -1);
        swift_slowDealloc(v20, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a4, 2);
        swift_bridgeObjectRelease_n(a3, 2);
        swift_bridgeObjectRelease_n(a2, 2);
      }
      v43 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
      v44 = objc_msgSend((id)swift_getObjCClassFromMetadata(v43), "successWithResolvedTaskList:", v17);

LABEL_38:
      a6(v44);

      return;
    }
LABEL_41:
    swift_once(&qword_100042078, sub_10001C9D0);
    goto LABEL_9;
  }
  log = a4;
  p_isa = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v12);
  if ((v12 & 0x8000000000000000) == 0)
  {
    v102 = a6;
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    if ((a1 & 0xC000000000000001) != 0)
    {
      v37 = 0;
      do
      {
        v38 = v37 + 1;
        v39 = specialized _ArrayBuffer._getElementSlowPath(_:)(v37, a1);
        v40 = INTaskList.init(list:includeReminders:)(v39, 0);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v40);
        v41 = p_isa[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v41);
        v42 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v41, v40);
        specialized ContiguousArray._endMutation()(v42);
        v37 = v38;
      }
      while (v12 != v38);
    }
    else
    {
      v45 = (void **)(a1 + 32);
      v46 = v12;
      do
      {
        v47 = *v45++;
        v48 = INTaskList.init(list:includeReminders:)(v47, 0);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v48);
        v49 = p_isa[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v49);
        v50 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v49, v48);
        specialized ContiguousArray._endMutation()(v50);
        --v46;
      }
      while (v46);
    }
    v13 = p_isa;
    a6 = v102;
    a4 = log;
    goto LABEL_21;
  }
  __break(1u);
}

id sub_10001E304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  void *ObjCClassFromMetadata;
  Class v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  NSArray v51;
  unsigned int (*v52)(char *, uint64_t, uint64_t);
  Class isa;
  Class v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  _QWORD *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  _QWORD v81[3];
  _BYTE v82[16];
  _QWORD *v83;
  uint64_t v84;

  v1 = sub_10000A430((uint64_t *)&unk_100042540);
  __chkstk_darwin(v1);
  v3 = (char *)&v78 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v78 - v6;
  v8 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store);
  v83 = 0;
  v9 = objc_msgSend(v8, "fetchEligibleDefaultListsWithError:", &v83, v5);
  v10 = v83;
  if (!v9)
  {
    v30 = v83;
    v31 = (_QWORD *)_convertNSErrorToError(_:)(v10);

    swift_willThrow();
    goto LABEL_44;
  }
  v11 = v9;
  v79 = v8;
  v12 = sub_10000A848(0, (unint64_t *)&qword_1000425C0, REMList_ptr);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);
  v14 = v10;

  if (!((unint64_t)v13 >> 62))
  {
    v15 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v15)
      goto LABEL_4;
LABEL_31:
    swift_bridgeObjectRelease(v13);
    v15 = (uint64_t)_swiftEmptyArrayStorage;
    if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
      goto LABEL_11;
    goto LABEL_32;
  }
  if (v13 < 0)
    v41 = v13;
  else
    v41 = v13 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v13);
  v15 = _CocoaArrayWrapper.endIndex.getter(v41);
  swift_bridgeObjectRelease(v13);
  if (!v15)
    goto LABEL_31;
LABEL_4:
  v83 = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v15);
  if ((v15 & 0x8000000000000000) == 0)
  {
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    v16 = 0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
        v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v16, v13);
      else
        v17 = *(id *)(v13 + 8 * v16 + 32);
      ++v16;
      v18 = INTaskList.init(list:includeReminders:)(v17, 0);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v18);
      v19 = v83[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v19);
      v20 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, v18);
      specialized ContiguousArray._endMutation()(v20);
    }
    while (v15 != v16);
    v15 = (uint64_t)v83;
    swift_bridgeObjectRelease(v13);
    if (!((unint64_t)v15 >> 62))
    {
LABEL_11:
      v21 = *(_QWORD **)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v21)
        goto LABEL_12;
LABEL_37:
      swift_bridgeObjectRelease(v15);
      v44._object = (void *)0x80000001000359E0;
      v45._countAndFlagsBits = 0x7265646E696D6552;
      v45._object = (void *)0xE900000000000073;
      v44._countAndFlagsBits = 0xD00000000000006ALL;
      v46 = TTRLocalizedString(_:comment:)(v45, v44);
      v47 = (void *)String.speakableString.getter(v46._countAndFlagsBits);
      swift_bridgeObjectRelease(v46._object);
      v48 = type metadata accessor for DateComponents(0);
      v49 = *(_QWORD *)(v48 - 8);
      v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56);
      v50(v7, 1, 1, v48);
      v50(v3, 1, 1, v48);
      sub_10000A848(0, &qword_100042308, INTask_ptr);
      v51.super.isa = Array._bridgeToObjectiveC()().super.isa;
      v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
      isa = 0;
      if (v52(v7, 1, v48) != 1)
      {
        isa = DateComponents._bridgeToObjectiveC()().super.isa;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v48);
      }
      if (v52(v3, 1, v48) == 1)
      {
        v54 = 0;
      }
      else
      {
        v54 = DateComponents._bridgeToObjectiveC()().super.isa;
        (*(void (**)(char *, uint64_t))(v49 + 8))(v3, v48);
      }
      v15 = (uint64_t)objc_msgSend(objc_allocWithZone((Class)INTaskList), "initWithTitle:tasks:groupName:createdDateComponents:modifiedDateComponents:identifier:", v47, v51.super.isa, 0, isa, v54, 0);

      v83 = 0;
      v55 = (char *)objc_msgSend(v79, "fetchDefaultAccountWithError:", &v83);
      v3 = v55;
      if (!v83)
      {
        if (!v55)
        {
          if (qword_100042078 != -1)
            swift_once(&qword_100042078, sub_10001C9D0);
          v72 = type metadata accessor for Logger(0);
          v73 = sub_10000A4A4(v72, (uint64_t)qword_100042960);
          v74 = Logger.logObject.getter(v73);
          v75 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v74, v75))
          {
            v76 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v76 = 0;
            _os_log_impl((void *)&_mh_execute_header, v74, v75, "No lists found in fetchEligibleDefaultLists and no default account available. Responding with .success so that we can fail the user in handle() with .failureRequiringAppLaunch. {result: .success}", v76, 2u);
            swift_slowDealloc(v76, -1, -1);
          }

          v77 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
          v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(v77), "successWithResolvedTaskList:", v15);

          return v40;
        }
        if (qword_100042078 == -1)
          goto LABEL_53;
        goto LABEL_66;
      }
      v31 = v83;

      swift_willThrow();
LABEL_44:
      if (qword_100042078 != -1)
        swift_once(&qword_100042078, sub_10001C9D0);
      v56 = type metadata accessor for Logger(0);
      sub_10000A4A4(v56, (uint64_t)qword_100042960);
      swift_errorRetain();
      v57 = swift_errorRetain();
      v58 = Logger.logObject.getter(v57);
      v59 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc(12, -1);
        v61 = (_QWORD *)swift_slowAlloc(32, -1);
        v83 = v61;
        *(_DWORD *)v60 = 136315138;
        swift_getErrorValue(v31, v82, v81);
        v62 = Error.localizedDescription.getter(v81[1], v81[2]);
        v64 = v63;
        v80 = sub_10002CB54(v62, v63, (uint64_t *)&v83);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, v81, v60 + 4, v60 + 12);
        swift_bridgeObjectRelease(v64);
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "Error trying to retrieve eligible default lists {error: %s}", v60, 0xCu);
        swift_arrayDestroy(v61, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v61, -1, -1);
        swift_slowDealloc(v60, -1, -1);
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      v65 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
      v29 = objc_msgSend((id)swift_getObjCClassFromMetadata(v65), "unsupported");
      swift_errorRelease();
      return v29;
    }
LABEL_32:
    if (v15 < 0)
      v42 = v15;
    else
      v42 = v15 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v15);
    v43 = _CocoaArrayWrapper.endIndex.getter(v42);
    swift_bridgeObjectRelease(v15);
    if (v43)
    {
      swift_bridgeObjectRetain(v15);
      v21 = (_QWORD *)_CocoaArrayWrapper.endIndex.getter(v42);
      swift_bridgeObjectRelease(v15);
LABEL_12:
      if (v21 != (_QWORD *)1)
      {
        if (qword_100042078 != -1)
          swift_once(&qword_100042078, sub_10001C9D0);
        v32 = type metadata accessor for Logger(0);
        sub_10000A4A4(v32, (uint64_t)qword_100042960);
        v33 = swift_bridgeObjectRetain(v15);
        v34 = Logger.logObject.getter(v33);
        v35 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v34, v35))
        {
          v36 = (uint8_t *)swift_slowAlloc(12, -1);
          *(_DWORD *)v36 = 134217984;
          v83 = v21;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v36 + 4, v36 + 12);
          swift_bridgeObjectRelease(v15);
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "Disambiguating with some lists {count: %ld}", v36, 0xCu);
          swift_slowDealloc(v36, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease(v15);
        }
        v37 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
        ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v37);
        sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
        v39 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v15);
        v40 = objc_msgSend(ObjCClassFromMetadata, "disambiguationWithTaskListsToDisambiguate:", v39);

        return v40;
      }
      if (qword_100042078 == -1)
        goto LABEL_14;
      goto LABEL_63;
    }
    goto LABEL_37;
  }
  __break(1u);
LABEL_63:
  swift_once(&qword_100042078, sub_10001C9D0);
LABEL_14:
  v22 = type metadata accessor for Logger(0);
  v23 = sub_10000A4A4(v22, (uint64_t)qword_100042960);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v3 = (char *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Got exactly 1 list from fetchEligibleDefaultLists, using that. {result: .confirmationRequired}", (uint8_t *)v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

  if ((v15 & 0xC000000000000001) != 0)
  {
    v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v15);
    goto LABEL_19;
  }
  if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v26 = *(id *)(v15 + 32);
LABEL_19:
    v27 = v26;
    swift_bridgeObjectRelease(v15);
    v28 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
    v29 = objc_msgSend((id)swift_getObjCClassFromMetadata(v28), "confirmationRequiredWithTaskListToConfirm:", v27);

    return v29;
  }
  __break(1u);
LABEL_66:
  swift_once(&qword_100042078, sub_10001C9D0);
LABEL_53:
  v67 = type metadata accessor for Logger(0);
  v68 = sub_10000A4A4(v67, (uint64_t)qword_100042960);
  v69 = Logger.logObject.getter(v68);
  v70 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v69, v70))
  {
    v71 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v71 = 0;
    _os_log_impl((void *)&_mh_execute_header, v69, v70, "No lists found in fetchEligibleDefaultLists(), prompt for creation {result: .confirmationRequired(.listShouldBeCreated)}", v71, 2u);
    swift_slowDealloc(v71, -1, -1);
  }

  v40 = objc_msgSend((id)objc_opt_self(INAddTasksTargetTaskListResolutionResult), "confirmationRequiredWithTaskListToConfirm:forReason:", v15, 1);
  return v40;
}

void sub_10001EDB0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = v3;
  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v8 = type metadata accessor for Logger(0);
  sub_10000A4A4(v8, (uint64_t)qword_100042960);
  v9 = a1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v38 = a2;
    v39 = a3;
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v41 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = objc_msgSend(v9, "taskTitles");
    v37 = v4;
    if (v14)
    {
      v15 = v14;
      v16 = sub_10000A848(0, &qword_100042B00, INSpeakableString_ptr);
      v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);

    }
    else
    {
      v17 = 0;
    }
    v19 = sub_10000A430(&qword_100042AF8);
    v20 = Optional.descriptionOrNil.getter(v19);
    v22 = v21;
    swift_bridgeObjectRelease(v17);
    v40 = sub_10002CB54(v20, v22, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v12 + 4, v12 + 12);

    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "SiriKit asked for resolving task titles {taskTitles: %s}", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    a2 = v38;
    a3 = v39;
    v4 = v37;
  }
  else
  {

  }
  __chkstk_darwin(v18);
  v36[2] = v9;
  v36[3] = v4;
  v23 = sub_10000A430((uint64_t *)&unk_100042AE0);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  v24 = Promise.init(resolver:)(sub_10002265C, v36);
  v25 = (void *)zalgo.getter(v24);
  v26 = sub_10000A430(&qword_100042940);
  v27 = dispatch thunk of Promise.then<A>(on:closure:)(v25, sub_10001F13C, 0, v26);
  swift_release(v24);

  v28 = swift_allocObject(&unk_10003DA08, 24, 7);
  *(_QWORD *)(v28 + 16) = v9;
  v29 = (void *)zalgo.getter(v9);
  v30 = sub_10000A430(&qword_100042AF0);
  v31 = dispatch thunk of Promise.then<A>(on:closure:)(v29, sub_100022688, v28, v30);
  swift_release(v27);
  swift_release(v28);

  v32 = swift_allocObject(&unk_10003DA30, 32, 7);
  *(_QWORD *)(v32 + 16) = a2;
  *(_QWORD *)(v32 + 24) = a3;
  v33 = swift_retain();
  v34 = (void *)zalgo.getter(v33);
  v35 = dispatch thunk of Promise.then<A>(on:closure:)(v34, sub_1000226C4, v32, (char *)&type metadata for () + 8);
  swift_release(v35);
  swift_release(v31);
  swift_release(v32);

}

uint64_t sub_10001F13C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v4 = sub_10000A430((uint64_t *)&unk_100042B10);
  __chkstk_darwin(v4);
  v6 = (_QWORD *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __chkstk_darwin(v7);
  v10 = (char *)v17 - v9;
  if (*a1)
  {
    NSUserActivity.ttrExtractedInfo.getter(v8);
    v12 = type metadata accessor for NSUserActivity.ExtractedInfo(0, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    v12 = type metadata accessor for NSUserActivity.ExtractedInfo(0, v8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  sub_100027F94((uint64_t)v10, (uint64_t)v6, (uint64_t *)&unk_100042B10);
  type metadata accessor for NSUserActivity.ExtractedInfo(0, v13);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v6, 1, v12) == 1)
  {
    result = sub_10000A5D0((uint64_t)v6, (uint64_t *)&unk_100042B10);
    v15 = 0;
    v16 = 0;
  }
  else
  {
    v15 = *v6;
    v16 = v6[1];
    swift_bridgeObjectRetain(v16);
    result = sub_1000281A4((uint64_t)v6, (uint64_t (*)(_QWORD))&type metadata accessor for NSUserActivity.ExtractedInfo);
  }
  *a2 = v15;
  a2[1] = v16;
  return result;
}

uint64_t sub_10001F29C@<X0>(id a1@<X1>, uint64_t *a2@<X0>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  unint64_t v55;

  v4 = *a2;
  v5 = a2[1];
  v6 = objc_msgSend(a1, "taskTitles");
  v54 = a3;
  if (!v6)
  {
    a3 = _swiftEmptyArrayStorage;
    if (!v5)
      goto LABEL_25;
    goto LABEL_15;
  }
  v7 = v6;
  v8 = sub_10000A848(0, &qword_100042B00, INSpeakableString_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  if (!((unint64_t)v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_4;
LABEL_24:
    swift_bridgeObjectRelease(v9);
    a3 = _swiftEmptyArrayStorage;
    if (!v5)
      goto LABEL_25;
    goto LABEL_15;
  }
  if (v9 < 0)
    v26 = v9;
  else
    v26 = v9 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v9);
  v10 = _CocoaArrayWrapper.endIndex.getter(v26);
  swift_bridgeObjectRelease(v9);
  if (!v10)
    goto LABEL_24;
LABEL_4:
  sub_100022998(0, v10 & ~(v10 >> 63), 0);
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_42;
  }
  v52 = v5;
  v53 = v4;
  v11 = 0;
  a3 = _swiftEmptyArrayStorage;
  v55 = v9 & 0xC000000000000001;
  v12 = v9;
  v13 = v10;
  do
  {
    if (v55)
      v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v9);
    else
      v14 = *(id *)(v9 + 8 * v11 + 32);
    v15 = v14;
    v16 = objc_msgSend(v14, "spokenPhrase");
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    v19 = v18;

    v21 = _swiftEmptyArrayStorage[2];
    v20 = _swiftEmptyArrayStorage[3];
    if (v21 >= v20 >> 1)
      sub_100022998(v20 > 1, v21 + 1, 1);
    ++v11;
    _swiftEmptyArrayStorage[2] = v21 + 1;
    v22 = &_swiftEmptyArrayStorage[2 * v21];
    v22[4] = v17;
    v22[5] = v19;
    v9 = v12;
  }
  while (v13 != v11);
  swift_bridgeObjectRelease(v12);
  v5 = v52;
  v4 = v53;
  if (v52)
  {
LABEL_15:
    if (_swiftEmptyArrayStorage[2])
    {
LABEL_26:
      if (qword_100042078 != -1)
        swift_once(&qword_100042078, sub_10001C9D0);
      v27 = type metadata accessor for Logger(0);
      v28 = sub_10000A4A4(v27, (uint64_t)qword_100042960);
      v29 = Logger.logObject.getter(v28);
      v30 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Resolved taskTitles {result: .success}", v31, 2u);
        swift_slowDealloc(v31, -1, -1);
      }

      v32 = a3[2];
      if (v32)
      {
        swift_bridgeObjectRetain(a3);
        specialized ContiguousArray.reserveCapacity(_:)(v32);
        v33 = (void *)objc_opt_self(INSpeakableStringResolutionResult);
        v34 = a3 + 5;
        do
        {
          v36 = *(v34 - 1);
          v35 = *v34;
          swift_bridgeObjectRetain(*v34);
          v37 = (void *)String.speakableString.getter(v36);
          v38 = objc_msgSend(v33, "successWithResolvedString:", v37);
          swift_bridgeObjectRelease(v35);

          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v39);
          v40 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v40);
          v41 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v40, v38);
          specialized ContiguousArray._endMutation()(v41);
          v34 += 2;
          --v32;
        }
        while (v32);
        v42 = _swiftEmptyArrayStorage;
        result = swift_bridgeObjectRelease_n(a3, 2);
      }
      else
      {
        result = swift_bridgeObjectRelease(a3);
        v42 = _swiftEmptyArrayStorage;
      }
      goto LABEL_40;
    }
    swift_bridgeObjectRetain(v5);
    if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) != 0)
    {
LABEL_17:
      v24 = a3[2];
      v23 = a3[3];
      if (v24 >= v23 >> 1)
        a3 = sub_10002C828((_QWORD *)(v23 > 1), v24 + 1, 1, a3);
      a3[2] = v24 + 1;
      v25 = &a3[2 * v24];
      v25[4] = v4;
      v25[5] = v5;
      goto LABEL_26;
    }
LABEL_42:
    a3 = sub_10002C828(0, 1, 1, a3);
    goto LABEL_17;
  }
LABEL_25:
  if (_swiftEmptyArrayStorage[2])
    goto LABEL_26;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v44 = type metadata accessor for Logger(0);
  v45 = sub_10000A4A4(v44, (uint64_t)qword_100042960);
  v46 = Logger.logObject.getter(v45);
  v47 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v48 = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "userTitles has 0 elements {result: .needsValue}", v48, 2u);
    swift_slowDealloc(v48, -1, -1);
  }

  v49 = sub_10000A430(&qword_1000427E0);
  v42 = (_QWORD *)swift_allocObject(v49, 40, 7);
  *((_OWORD *)v42 + 1) = xmmword_100034890;
  v50 = sub_10000A848(0, &qword_100042580, INSpeakableStringResolutionResult_ptr);
  v51 = objc_msgSend((id)swift_getObjCClassFromMetadata(v50), "needsValue");
  v42[4] = v51;
  result = specialized Array._endMutation()(v51);
LABEL_40:
  *v54 = v42;
  return result;
}

void sub_10001F86C(uint64_t a1, uint64_t a2)
{
  Class isa;

  sub_10000A848(0, &qword_100042580, INSpeakableStringResolutionResult_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, isa);

}

id sub_10001F8E8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = v1;
  v3 = objc_msgSend(a1, "targetTaskList");
  if (!v3
    || (v4 = v3,
        v5 = (void *)INTaskList.remList(store:)(*(_QWORD *)(v1
                                                          + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store)),
        v4,
        !v5))
  {
    v6 = sub_100022E58(*(void **)(v2 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store));
    if (!v6)
      return 0;
LABEL_6:
    v7 = objc_msgSend(v6, "capabilities");

    return v7;
  }
  v6 = objc_msgSend(v5, "account");

  if (v6)
    goto LABEL_6;
  return 0;
}

void sub_10001F9AC(_QWORD *a1, void (*a2)(void))
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;

  if (*a1)
  {
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v3 = type metadata accessor for Logger(0);
    v4 = sub_10000A4A4(v3, (uint64_t)qword_100042960);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Got userActivity {result: .success(.currentActivity)", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    v8 = objc_msgSend((id)objc_opt_self(INTaskReferenceResolutionResult), "successWithResolvedTaskReference:", 1);
  }
  else
  {
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v9 = type metadata accessor for Logger(0);
    v10 = sub_10000A4A4(v9, (uint64_t)qword_100042960);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Got nil userActivity {result: .notRequired}", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

    v14 = sub_10000A848(0, &qword_100042BC8, INTaskReferenceResolutionResult_ptr);
    v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(v14), "notRequired");
  }
  v15 = v8;
  a2();

}

void sub_10001FB98(uint64_t a1, void (*a2)(void))
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[3];
  _BYTE v17[8];
  uint64_t v18;

  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v4 = type metadata accessor for Logger(0);
  sub_10000A4A4(v4, (uint64_t)qword_100042960);
  swift_errorRetain();
  v5 = swift_errorRetain();
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v18 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue(a1, v17, v16);
    v10 = Error.localizedDescription.getter(v16[1], v16[2]);
    v12 = v11;
    v15 = sub_10002CB54(v10, v11, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, v16, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Got error userActivity. {result: .notRequired, error: %s}", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  v13 = sub_10000A848(0, &qword_100042BC8, INTaskReferenceResolutionResult_ptr);
  v14 = objc_msgSend((id)swift_getObjCClassFromMetadata(v13), "notRequired");
  a2();

}

void sub_10001FDB8(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, void *))
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a3;
  v10 = a1;
  a5(v9, v8);
  _Block_release(v8);
  _Block_release(v8);

}

void sub_10001FE3C(void **a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;
  _BYTE v6[24];

  v2 = *a1;
  if (*a1)
  {
    swift_beginAccess(a2 + 16, v6, 1, 0);
    v4 = *(void **)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v2;
    v5 = v2;

  }
}

uint64_t sub_10001FE9C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t result;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v32[24];
  _BYTE v33[24];
  _BYTE v34[24];
  uint64_t v35;

  v9 = type metadata accessor for NSUserActivity.ExtractedInfo(0, a5);
  __chkstk_darwin(v9);
  v11 = &v32[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = sub_10000A430(&qword_100042B58);
  v13 = __chkstk_darwin(v12);
  v15 = &v32[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v16 = *a1;
  result = swift_projectBox(a3, v13);
  if (v16)
  {
    v18 = result;
    v35 = a4 + 16;
    v19 = objc_allocWithZone((Class)REMUserActivity);
    v20 = v16;
    v21 = objc_msgSend(v19, "initWithUserActivity:", v20);
    swift_beginAccess(a2 + 16, v34, 1, 0);
    v22 = *(void **)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v21;

    v23 = objc_msgSend(v20, "webpageURL");
    if (v23)
    {
      v24 = v23;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v23);

      v25 = type metadata accessor for URL(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v15, 0, 1, v25);
    }
    else
    {
      v26 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v15, 1, 1, v26);
    }
    swift_beginAccess(v18, v33, 1, 0);
    sub_1000281E0((uint64_t)v15, v18);
    NSUserActivity.ttrExtractedInfo.getter(v27);

    v29 = *((_QWORD *)v11 + 2);
    v28 = *((_QWORD *)v11 + 3);
    swift_bridgeObjectRetain(v28);
    sub_1000281A4((uint64_t)v11, (uint64_t (*)(_QWORD))&type metadata accessor for NSUserActivity.ExtractedInfo);
    swift_beginAccess(v35, v32, 1, 0);
    v30 = *(_QWORD *)(a4 + 24);
    *(_QWORD *)(a4 + 16) = v29;
    *(_QWORD *)(a4 + 24) = v28;
    return swift_bridgeObjectRelease(v30);
  }
  return result;
}

void sub_1000200A8(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, NSObject *a15, uint64_t a16, void (*a17)(void))
{
  double v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  Class isa;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  NSObject *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  id v61;
  Class v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  NSObject **v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  _QWORD v82[3];
  char v83[8];
  uint64_t v84;
  _BYTE v85[16];
  NSObject *v86;
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
  NSObject *v97;
  NSObject *v98;
  uint64_t v99;

  v77 = swift_projectBox(a8, a1);
  v20 = swift_projectBox(a12, v19);
  v75 = *(_QWORD *)(a3 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store);
  v21 = objc_msgSend(objc_allocWithZone((Class)REMSaveRequest), "initWithStore:", v75);
  v22 = type metadata accessor for TTRListEditor(0);
  v84 = (uint64_t)a4;
  a4;
  v23 = v21;
  TTROneshotEditing.init(item:saveRequest:undoManager:)(&v98, &v84, v23, 0, v22, &protocol witness table for TTRListEditor);
  v76 = v98;
  v86 = v98;
  v87 = 0;
  v88 = a6;
  v89 = a7;
  v90 = v77;
  v91 = a9;
  v92 = a10 + 16;
  v93 = a11 + 16;
  v94 = v20;
  v95 = a13 + 16;
  v96 = a14 + 16;
  v97 = a15;
  v24 = v23;
  v25 = (uint64_t)sub_1000298B8((void (*)(uint64_t *__return_ptr, id *))sub_100028120, (uint64_t)v85, a5);
  v98 = 0;
  v26 = objc_msgSend(v24, "saveSynchronouslyWithError:", &v98);
  v27 = v98;
  if (v26)
  {
    v28 = *(_QWORD *)TTRWidgetCenter.shared.unsafeMutableAddressor(v98);
    swift_retain();
    TTRWidgetCenter.reloadAllTimelines()();
    swift_release(v28);
    if ((unint64_t)v25 >> 62)
    {
      if (v25 < 0)
        v73 = v25;
      else
        v73 = v25 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v25);
      v29 = _CocoaArrayWrapper.endIndex.getter(v73);
      swift_bridgeObjectRelease(v25);
    }
    else
    {
      v29 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v74 = v24;
    if (v29)
    {
      v98 = _swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v29);
      if (v29 < 0)
        __break(1u);
      sub_10000A848(0, &qword_100042308, INTask_ptr);
      v30 = 0;
      do
      {
        if ((v25 & 0xC000000000000001) != 0)
          v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v30, v25);
        else
          v31 = *(id *)(v25 + 8 * v30 + 32);
        ++v30;
        v32 = INTask.init(reminderChangeItem:)(v31);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v32);
        isa = v98[2].isa;
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(isa);
        v34 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(isa, v32);
        specialized ContiguousArray._endMutation()(v34);
      }
      while (v29 != v30);
      v46 = v98;
      swift_bridgeObjectRelease(v25);
    }
    else
    {
      swift_bridgeObjectRelease(v25);
      v46 = _swiftEmptyArrayStorage;
    }
    v48 = a16;
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v49 = type metadata accessor for Logger(0);
    sub_10000A4A4(v49, (uint64_t)qword_100042960);
    v50 = swift_bridgeObjectRetain_n(v46, 2);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(12, -1);
      v54 = swift_slowAlloc(32, -1);
      v98 = v54;
      *(_DWORD *)v53 = 136315138;
      v55 = sub_10000A848(0, &qword_100042308, INTask_ptr);
      v56 = swift_bridgeObjectRetain(v46);
      v57 = Array.description.getter(v56, v55);
      v59 = v58;
      swift_bridgeObjectRelease(v46);
      v60 = v57;
      v48 = a16;
      v84 = sub_10002CB54(v60, v59, (uint64_t *)&v98);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85, v53 + 4, v53 + 12);
      swift_bridgeObjectRelease_n(v46, 2);
      swift_bridgeObjectRelease(v59);
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "insertedTasks: %s", v53, 0xCu);
      swift_arrayDestroy(v54, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v54, -1, -1);
      swift_slowDealloc(v53, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v46, 2);
    }
    v61 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 3, 0);
    objc_msgSend(v61, "setModifiedTaskList:", v48);
    sub_10000A848(0, &qword_100042308, INTask_ptr);
    v62 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v46);
    objc_msgSend(v61, "setAddedTasks:", v62);

    v98 = a15;
    v63 = (void *)REMList.accountCapabilities.getter();
    v64 = sub_10000A848(0, (unint64_t *)&unk_100042B48, INAddTasksIntent_ptr);
    v65 = TTRIntentResultWarningBearing.warnings(store:accountCapabilties:)(v75, v63, v64, &protocol witness table for INAddTasksIntent);

    objc_msgSend(v61, "setWarnings:", v65);
    v66 = v61;
    v67 = Logger.logObject.getter(v66);
    v68 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc(12, -1);
      v70 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v69 = 138412290;
      v98 = v66;
      v71 = v66;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v69 + 4, v69 + 12);
      *v70 = v66;

      _os_log_impl((void *)&_mh_execute_header, v67, v68, "successfully handled intent {result: %@}", v69, 0xCu);
      v72 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v70, 1, v72);
      swift_slowDealloc(v70, -1, -1);
      swift_slowDealloc(v69, -1, -1);
    }
    else
    {

      v67 = v66;
    }

    ((void (*))a17)(v66);
    swift_release(v76);

  }
  else
  {
    v35 = v98;
    swift_bridgeObjectRelease(v25);
    v36 = _convertNSErrorToError(_:)(v27);

    swift_willThrow();
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v37 = type metadata accessor for Logger(0);
    sub_10000A4A4(v37, (uint64_t)qword_100042960);
    swift_errorRetain();
    v38 = swift_errorRetain();
    v39 = Logger.logObject.getter(v38);
    v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc(12, -1);
      v42 = swift_slowAlloc(32, -1);
      v98 = v42;
      *(_DWORD *)v41 = 136446210;
      swift_getErrorValue(v36, v83, v82);
      v43 = Error.rem_errorDescription.getter(v82[1], v82[2]);
      v45 = v44;
      v84 = sub_10002CB54(v43, v44, (uint64_t *)&v98);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85, v41 + 4, v41 + 12);
      swift_bridgeObjectRelease(v45);
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Error saving saveRequest {error: %{public}s}", v41, 0xCu);
      swift_arrayDestroy(v42, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v42, -1, -1);
      swift_slowDealloc(v41, -1, -1);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    v47 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
    a17();

    swift_errorRelease();
    swift_release(v76);
  }
}

void sub_100020940(void **a1@<X0>, void *a2@<X2>, void *a3@<X3>, _QWORD *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, void **a7@<X7>, _QWORD *a8@<X8>, void **a9, _QWORD *a10, void **a11, uint64_t a12, id a13)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  NSString v53;
  id v54;
  _UNKNOWN **v55;
  id v56;
  uint64_t v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  _QWORD *v63;
  NSObject *v64;
  uint64_t v65;
  uint8_t *v66;
  NSObject *v67;
  void **v68;
  void *v69;
  _QWORD *v70;
  NSObject *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  _QWORD *v75;
  NSObject *v76;
  _QWORD *v77;
  uint64_t v78;
  uint8_t *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  char *v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  _QWORD *v97;
  uint8_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _OWORD *v121;
  uint64_t v122;
  Swift::Bool v123;
  void **v124;
  void *v125;
  void *v126;
  id v127;
  NSObject *v128;
  NSObject *v129;
  os_log_type_t v130;
  uint8_t *v131;
  NSObject *v132;
  _QWORD *v133;
  uint64_t v134;
  NSObject *v135;
  uint64_t v136;
  void **v137;
  void *v138;
  void *v139;
  id v140;
  NSObject *v141;
  NSObject *v142;
  os_log_type_t v143;
  uint8_t *v144;
  NSObject *v145;
  _QWORD *v146;
  uint64_t v147;
  uint8_t *v148;
  NSObject *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void (*v153)(char *, char *, uint64_t);
  uint64_t v154;
  char *v155;
  uint64_t v156;
  NSObject *v157;
  os_log_type_t v158;
  uint8_t *v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  unint64_t v163;
  void (*v164)(char *, uint64_t);
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  NSObject *v171;
  os_log_type_t v172;
  uint8_t *v173;
  id v174;
  NSString v175;
  objc_class *v176;
  id *v177;
  void *v178;
  id v179;
  uint64_t v180;
  NSObject *v181;
  os_log_type_t v182;
  uint8_t *v183;
  char *v184;
  uint64_t v185;
  id v186;
  id v187;
  unsigned int v188;
  id v189;
  Swift::Bool v190;
  id v191;
  NSObject *v192;
  os_log_type_t v193;
  uint8_t *v194;
  _QWORD *v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  unint64_t v200;
  unint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  char *v210;
  char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void **v219;
  char *v220;
  uint64_t v221;
  id v222;
  _QWORD *v223;
  char *v224;
  uint64_t v225;
  id v226;
  _QWORD *v227;
  void **v228;
  _QWORD *v229;
  uint64_t v230;
  NSObject *v231;
  char *v232;
  uint64_t v233;
  uint64_t v234;
  char v235[8];
  uint64_t v236;
  NSObject *v237;
  char v238[8];
  uint64_t v239;
  char v240[8];
  uint64_t v241;
  NSObject *v242;
  char v243[8];
  id v244;
  uint64_t v245;
  Swift::OpaquePointer_optional v246;
  NSAttributedString_optional v247;

  v219 = a7;
  v208 = a6;
  v217 = a5;
  v227 = a4;
  v226 = a3;
  v223 = a8;
  v15 = type metadata accessor for Logger(0);
  v202 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v203 = (char *)&v202 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v213 = type metadata accessor for Date(0);
  v212 = *(_QWORD *)(v213 - 8);
  __chkstk_darwin(v213);
  v211 = (char *)&v202 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_10000A430(&qword_100042B58);
  __chkstk_darwin(v18);
  v210 = (char *)&v202 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v22 = (char *)&v202 - v21;
  v221 = type metadata accessor for URL(0);
  v225 = *(_QWORD *)(v221 - 8);
  __chkstk_darwin(v221);
  v24 = (char *)&v202 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v220 = (char *)&v202 - v26;
  v27 = sub_10000A430(&qword_100042B30);
  __chkstk_darwin(v27);
  v207 = (uint64_t)&v202 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v215 = type metadata accessor for TTRRecurrenceRuleModel(0);
  v214 = *(_QWORD *)(v215 - 8);
  __chkstk_darwin(v215);
  v204 = (uint64_t)&v202 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v205 = (uint64_t)&v202 - v31;
  __chkstk_darwin(v32);
  v209 = (uint64_t)&v202 - v33;
  v34 = sub_10000A430((uint64_t *)&unk_100042540);
  __chkstk_darwin(v34);
  v206 = (char *)&v202 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  v216 = (uint64_t)&v202 - v37;
  v229 = (_QWORD *)type metadata accessor for DateComponents(0);
  v218 = *(v229 - 1);
  __chkstk_darwin(v229);
  v228 = (void **)((char *)&v202 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = __chkstk_darwin(v39);
  v224 = (char *)&v202 - v41;
  v42 = *a1;
  v43 = (void *)TTRListEditor.addNewReminder(with:title:)(0, 0, 0xE000000000000000, v40);
  v44 = type metadata accessor for TTRReminderEditor(0);
  v45 = sub_100028164((unint64_t *)&unk_100042B80, (uint64_t (*)(uint64_t))&type metadata accessor for TTRReminderEditor, (uint64_t)&protocol conformance descriptor for TTRReminderEditor);
  v46 = v43;
  v47 = a2;
  v222 = v46;
  TTRUndoableEditing.init(changeItem:undoManager:)(&v242, v46, a2, v44, v45);
  v48 = v242;
  v49 = objc_msgSend(v42, "spokenPhrase");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
  v51 = v50;

  v52 = objc_allocWithZone((Class)NSAttributedString);
  v53 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v51);
  v54 = objc_msgSend(v52, "initWithString:", v53);

  TTRReminderEditor.edit(title:locale:registeringUndo:)((NSAttributedString)v54, (Swift::String_optional)0, 1);
  v55 = &off_100042000;
  v233 = v15;
  v56 = v226;
  v231 = v48;
  v232 = v24;
  v230 = (uint64_t)v22;
  if (v226)
  {
    v57 = qword_100042078;
    v58 = v226;
    if (v57 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v59 = v58;
    v60 = Logger.logObject.getter(v59);
    v61 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc(12, -1);
      v63 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v62 = 138412290;
      v242 = v59;
      v64 = v59;
      v55 = &off_100042000;
      v48 = v231;
      v24 = v232;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v243, v62 + 4, v62 + 12);
      *v63 = v226;

      v22 = (char *)v230;
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "setting locationTrigger {locationTrigger: %@}", v62, 0xCu);
      v65 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v63, 1, v65);
      swift_slowDealloc(v63, -1, -1);
      v66 = v62;
      v56 = v226;
      swift_slowDealloc(v66, -1, -1);
    }
    else
    {

      v60 = v59;
    }

    v67 = v59;
    TTRReminderEditor.edit(locationTrigger:)(v56);

  }
  v68 = v228;
  if (v227)
  {
    v69 = v55[15];
    v70 = v227;
    if (v69 != (void *)-1)
      swift_once(&qword_100042078, sub_10001C9D0);
    sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v71 = v70;
    v72 = Logger.logObject.getter(v71);
    v73 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc(12, -1);
      v75 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v74 = 138412290;
      v242 = v71;
      v76 = v71;
      v22 = (char *)v230;
      v24 = v232;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v243, v74 + 4, v74 + 12);
      v77 = v227;
      *v75 = v227;

      v48 = v231;
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "setting vehicleTrigger {vehicleTrigger: %@}", v74, 0xCu);
      v78 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v75, 1, v78);
      swift_slowDealloc(v75, -1, -1);
      v79 = v74;
      v55 = &off_100042000;
      swift_slowDealloc(v79, -1, -1);
      v68 = v228;
    }
    else
    {

      v72 = v71;
      v68 = v228;
      v77 = v227;
    }

    v80 = v71;
    TTRReminderEditor.edit(vehicleTrigger:)(v77);

  }
  v228 = a9;
  v81 = v217;
  swift_beginAccess(v217, &v242, 0, 0);
  v82 = v216;
  sub_10000A58C(v81, v216, (uint64_t *)&unk_100042540);
  v83 = v218;
  v84 = v229;
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v218 + 48))(v82, 1, v229) == 1)
  {
    sub_10000A5D0(v82, (uint64_t *)&unk_100042540);
  }
  else
  {
    v85 = v224;
    (*(void (**)(char *, uint64_t, _QWORD *))(v83 + 32))(v224, v82, v84);
    if (v55[15] != (_UNKNOWN *)-1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v86 = (void *)sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v227 = *(_QWORD **)(v83 + 16);
    v87 = ((uint64_t (*)(void **, char *, _QWORD *))v227)(v68, v85, v84);
    v88 = Logger.logObject.getter(v87);
    v89 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc(12, -1);
      v91 = swift_slowAlloc(32, -1);
      v226 = v86;
      v92 = v91;
      v241 = v91;
      *(_DWORD *)v90 = 136315138;
      v93 = sub_100028164(&qword_100042B90, (uint64_t (*)(uint64_t))&type metadata accessor for DateComponents, (uint64_t)&protocol conformance descriptor for DateComponents);
      v94 = dispatch thunk of CustomStringConvertible.description.getter(v229, v93);
      v96 = v95;
      v239 = sub_10002CB54(v94, v95, &v241);
      v84 = v229;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v239, v240, v90 + 4, v90 + 12);
      swift_bridgeObjectRelease(v96);
      v97 = *(_QWORD **)(v83 + 8);
      ((void (*)(void **, _QWORD *))v97)(v68, v84);
      _os_log_impl((void *)&_mh_execute_header, v88, v89, "setting dueDateComponents {dueDateComponents: %s}", v90, 0xCu);
      swift_arrayDestroy(v92, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v92, -1, -1);
      v98 = v90;
      v55 = &off_100042000;
      swift_slowDealloc(v98, -1, -1);
    }
    else
    {
      v97 = *(_QWORD **)(v83 + 8);
      ((void (*)(void **, _QWORD *))v97)(v68, v84);
    }

    v99 = v215;
    v100 = v83;
    v101 = (uint64_t)v206;
    v102 = v224;
    ((void (*)(char *, char *, _QWORD *))v227)(v206, v224, v84);
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD *))(v100 + 56))(v101, 0, 1, v84);
    v48 = v231;
    TTRReminderEditor.edit(dueDateComponents:)(v101);
    sub_10000A5D0(v101, (uint64_t *)&unk_100042540);
    v103 = v207;
    sub_10000A58C(v208, v207, &qword_100042B30);
    v104 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v214 + 48))(v103, 1, v99);
    v22 = (char *)v230;
    if (v104 == 1)
    {
      ((void (*)(char *, _QWORD *))v97)(v102, v84);
      sub_10000A5D0(v103, &qword_100042B30);
      v24 = v232;
    }
    else
    {
      v227 = v97;
      v105 = v209;
      sub_10000D220(v103, v209);
      v106 = v205;
      v107 = sub_10000D264(v105, v205);
      v108 = Logger.logObject.getter(v107);
      v109 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v108, v109))
      {
        v110 = (uint8_t *)swift_slowAlloc(12, -1);
        v111 = swift_slowAlloc(32, -1);
        v241 = v111;
        *(_DWORD *)v110 = 136315138;
        v112 = v204;
        sub_10000D264(v106, v204);
        v113 = String.init<A>(describing:)(v112, v215);
        v115 = v114;
        v239 = sub_10002CB54(v113, v114, &v241);
        v22 = (char *)v230;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v239, v240, v110 + 4, v110 + 12);
        v116 = v115;
        v55 = &off_100042000;
        swift_bridgeObjectRelease(v116);
        sub_1000281A4(v106, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRecurrenceRuleModel);
        _os_log_impl((void *)&_mh_execute_header, v108, v109, "setting recurrenceRule {recurrenceRule: %s}", v110, 0xCu);
        swift_arrayDestroy(v111, 1, (char *)&type metadata for Any + 8);
        v117 = v111;
        v99 = v215;
        swift_slowDealloc(v117, -1, -1);
        swift_slowDealloc(v110, -1, -1);
      }
      else
      {
        sub_1000281A4(v106, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRecurrenceRuleModel);
      }

      v24 = v232;
      v118 = sub_10000A430(&qword_100042568);
      v119 = *(unsigned __int8 *)(v214 + 80);
      v120 = (v119 + 32) & ~v119;
      v121 = (_OWORD *)swift_allocObject(v118, v120 + *(_QWORD *)(v214 + 72), v119 | 7);
      v121[1] = xmmword_100034880;
      v122 = v209;
      sub_10000D264(v209, (uint64_t)v121 + v120);
      v246.value._rawValue = v121;
      v246.is_nil = 0;
      TTRReminderEditor.edit(recurrenceRules:shouldCopyRecurrenceEnd:)(v246, v123);
      swift_setDeallocating(v121);
      swift_arrayDestroy((char *)v121 + v120, *((_QWORD *)v121 + 2), v99);
      swift_deallocClassInstance(v121, 32, 7);
      sub_1000281A4(v122, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRecurrenceRuleModel);
      ((void (*)(char *, _QWORD *))v227)(v224, v229);
    }
  }
  v229 = a10;
  v124 = v219;
  swift_beginAccess(v219, &v241, 0, 0);
  v125 = *v124;
  if (v125)
  {
    v126 = v55[15];
    v127 = v125;
    if (v126 != (void *)-1)
      swift_once(&qword_100042078, sub_10001C9D0);
    sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v128 = v127;
    v129 = Logger.logObject.getter(v128);
    v130 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v129, v130))
    {
      v131 = (uint8_t *)swift_slowAlloc(12, -1);
      v227 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v131 = 138412290;
      v239 = (uint64_t)v128;
      v132 = v128;
      v48 = v231;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v239, v240, v131 + 4, v131 + 12);
      v133 = v227;
      *v227 = v125;

      v55 = &off_100042000;
      _os_log_impl((void *)&_mh_execute_header, v129, v130, "setting contactRepresentation {contactRepresentation: %@}", v131, 0xCu);
      v134 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v133, 1, v134);
      swift_slowDealloc(v133, -1, -1);
      swift_slowDealloc(v131, -1, -1);
    }
    else
    {

      v129 = v128;
    }
    v24 = v232;
    v22 = (char *)v230;

    v135 = v128;
    TTRReminderEditor.edit(contactHandles:)(v125);

  }
  v136 = (uint64_t)a11;
  v137 = v228;
  swift_beginAccess(v228, &v239, 0, 0);
  v138 = *v137;
  if (*v137)
  {
    v139 = v55[15];
    v140 = v138;
    if (v139 != (void *)-1)
      swift_once(&qword_100042078, sub_10001C9D0);
    sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v141 = v140;
    v142 = Logger.logObject.getter(v141);
    v143 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v142, v143))
    {
      v144 = (uint8_t *)swift_slowAlloc(12, -1);
      v227 = (_QWORD *)swift_slowAlloc(8, -1);
      v228 = a11;
      *(_DWORD *)v144 = 138412290;
      v237 = v141;
      v145 = v141;
      v48 = v231;
      v136 = (uint64_t)v228;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v237, v238, v144 + 4, v144 + 12);
      v146 = v227;
      *v227 = v138;

      _os_log_impl((void *)&_mh_execute_header, v142, v143, "setting userActivity {remUserActivity: %@}", v144, 0xCu);
      v147 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v146, 1, v147);
      swift_slowDealloc(v146, -1, -1);
      v148 = v144;
      v22 = (char *)v230;
      swift_slowDealloc(v148, -1, -1);
    }
    else
    {

      v142 = v141;
    }

    v149 = v141;
    TTRReminderEditor.edit(userActivity:)(v138);

    v55 = &off_100042000;
    v24 = v232;
  }
  v230 = a12;
  v150 = (uint64_t)v229;
  swift_beginAccess(v229, &v237, 0, 0);
  sub_10000A58C(v150, (uint64_t)v22, &qword_100042B58);
  v151 = v225;
  v152 = v221;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v225 + 48))(v22, 1, v221) == 1)
  {
    sub_10000A5D0((uint64_t)v22, &qword_100042B58);
  }
  else
  {
    v153 = *(void (**)(char *, char *, uint64_t))(v151 + 32);
    v154 = v151;
    v155 = v220;
    v153(v220, v22, v152);
    if (v55[15] != (_UNKNOWN *)-1)
      swift_once(&qword_100042078, sub_10001C9D0);
    sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v229 = *(_QWORD **)(v154 + 16);
    v156 = ((uint64_t (*)(char *, char *, uint64_t))v229)(v24, v155, v152);
    v157 = Logger.logObject.getter(v156);
    v158 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v157, v158))
    {
      v159 = (uint8_t *)swift_slowAlloc(12, -1);
      v160 = swift_slowAlloc(32, -1);
      v236 = v160;
      *(_DWORD *)v159 = 136315138;
      v161 = URL.absoluteString.getter(v160);
      v163 = v162;
      v234 = sub_10002CB54(v161, v162, &v236);
      v154 = v225;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v234, v235, v159 + 4, v159 + 12);
      swift_bridgeObjectRelease(v163);
      v164 = *(void (**)(char *, uint64_t))(v154 + 8);
      v164(v232, v152);
      _os_log_impl((void *)&_mh_execute_header, v157, v158, "setting URL attachment {userActivityURL: %s}", v159, 0xCu);
      swift_arrayDestroy(v160, 1, (char *)&type metadata for Any + 8);
      v165 = v160;
      v55 = &off_100042000;
      swift_slowDealloc(v165, -1, -1);
      swift_slowDealloc(v159, -1, -1);
    }
    else
    {
      v164 = *(void (**)(char *, uint64_t))(v154 + 8);
      v164(v24, v152);
    }

    v166 = (uint64_t)v210;
    v167 = v220;
    ((void (*)(char *, char *, uint64_t))v229)(v210, v220, v152);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v154 + 56))(v166, 0, 1, v152);
    v48 = v231;
    TTRReminderEditor.edit(url:)(v166);
    sub_10000A5D0(v166, &qword_100042B58);
    v164(v167, v152);
  }
  swift_beginAccess(v136, &v236, 0, 0);
  v168 = *(_QWORD *)(v136 + 8);
  if (v168)
  {
    v169 = v55[15];
    swift_bridgeObjectRetain(*(_QWORD *)(v136 + 8));
    if (v169 != (void *)-1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v170 = sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v171 = Logger.logObject.getter(v170);
    v172 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v171, v172))
    {
      v173 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v173 = 0;
      _os_log_impl((void *)&_mh_execute_header, v171, v172, "setting notes", v173, 2u);
      swift_slowDealloc(v173, -1, -1);
    }

    v174 = objc_allocWithZone((Class)NSAttributedString);
    v175 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v168);
    v176 = (objc_class *)objc_msgSend(v174, "initWithString:", v175);

    v247.value.super.isa = v176;
    TTRReminderEditor.edit(notes:)(v247);

  }
  v177 = (id *)v230;
  swift_beginAccess(v230, &v234, 0, 0);
  if (*v177)
  {
    v178 = v55[15];
    v179 = *v177;
    if (v178 != (void *)-1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v180 = sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v181 = Logger.logObject.getter(v180);
    v182 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v181, v182))
    {
      v183 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v183 = 0;
      _os_log_impl((void *)&_mh_execute_header, v181, v182, "setting custom smart list filters", v183, 2u);
      swift_slowDealloc(v183, -1, -1);
    }

    v184 = v211;
    Date.init()(v185);
    TTRReminderEditor.edit(toMatch:now:)(v179, v184);

    (*(void (**)(char *, uint64_t))(v212 + 8))(v184, v213);
  }
  v186 = v222;
  v187 = objc_msgSend(v222, "accountCapabilities", v202);
  v188 = objc_msgSend(v187, "supportsFlagged");

  if (!v188)
    goto LABEL_69;
  v189 = objc_msgSend(a13, "priority");
  if (!v189)
    goto LABEL_69;
  if (v189 == (id)1)
  {
    v190 = 0;
LABEL_68:
    TTRReminderEditor.edit(isFlagged:)(v190);
LABEL_69:
    if (v55[15] != (_UNKNOWN *)-1)
      swift_once(&qword_100042078, sub_10001C9D0);
    sub_10000A4A4(v233, (uint64_t)qword_100042960);
    v191 = v186;
    v192 = Logger.logObject.getter(v191);
    v193 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v192, v193))
    {
      v194 = (uint8_t *)swift_slowAlloc(12, -1);
      v195 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v194 = 138543362;
      v196 = objc_msgSend(v191, "objectID");
      v244 = v196;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v244, &v245, v194 + 4, v194 + 12);
      *v195 = v196;

      _os_log_impl((void *)&_mh_execute_header, v192, v193, "Inserting reminder: {objectID: %{public}@}", v194, 0xCu);
      v197 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v195, 1, v197);
      swift_slowDealloc(v195, -1, -1);
      swift_slowDealloc(v194, -1, -1);

      swift_release(v48);
    }
    else
    {

      swift_release(v48);
    }
    *v223 = v191;
    return;
  }
  if (v189 == (id)2)
  {
    v190 = 1;
    goto LABEL_68;
  }
  if (v55[15] != (_UNKNOWN *)-1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v198 = v233;
  v199 = sub_10000A4A4(v233, (uint64_t)qword_100042960);
  (*(void (**)(char *, uint64_t, uint64_t))(v202 + 16))(v203, v199, v198);
  v200 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
  v201 = sub_10001C784((uint64_t)_swiftEmptyArrayStorage);
  sub_100028360((uint64_t)"unknown priority", 16, 2uLL, v200, v201);
  __break(1u);
}

uint64_t sub_100022154(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void (*v17)(uint64_t (*)(uint64_t, uint64_t), _QWORD *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v12 = swift_allocObject(&unk_10003DA58, 32, 7);
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  swift_retain();
  v13 = objc_msgSend(a5, "taskReference");
  if (!v13)
  {
    swift_release(v12);
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v19 = type metadata accessor for Logger(0);
    v20 = sub_10000A4A4(v19, (uint64_t)qword_100042960);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v21, v22))
      goto LABEL_13;
    v23 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v23 = 0;
    v24 = ".taskReference is .unknown. {resolve: nil}";
    goto LABEL_12;
  }
  if (v13 == (id)1)
  {
    v14 = *(_QWORD *)(a6
                    + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider
                    + 24);
    v15 = *(_QWORD *)(a6
                    + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider
                    + 32);
    sub_10000A4BC((_QWORD *)(a6 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_userActivityProvider), v14);
    v16 = (_QWORD *)swift_allocObject(&unk_10003DA80, 48, 7);
    v16[2] = a3;
    v16[3] = a4;
    v16[4] = sub_10000EE30;
    v16[5] = v12;
    v17 = *(void (**)(uint64_t (*)(uint64_t, uint64_t), _QWORD *, uint64_t, uint64_t))(v15 + 8);
    swift_retain();
    v17(sub_100022CD0, v16, v14, v15);
    return swift_release(v16);
  }
  swift_release(v12);
  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v25 = type metadata accessor for Logger(0);
  v26 = sub_10000A4A4(v25, (uint64_t)qword_100042960);
  v21 = Logger.logObject.getter(v26);
  v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v23 = 0;
    v24 = ".taskReference is an unhandled enum. {resolve: nil}";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v21, v22, v24, v23, 2u);
    swift_slowDealloc(v23, -1, -1);
  }
LABEL_13:

  v27 = 0;
  return a1(&v27);
}

uint64_t sub_1000223C4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(void))
{
  if (!a2)
    return a5();
  swift_errorRetain(a2);
  a3(a2);
  return swift_errorRelease(a2);
}

uint64_t sub_100022420(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  _QWORD *v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v11[2];
  id v12;
  uint64_t v13;

  v2 = objc_msgSend(a1, "contactEventTrigger");
  v3 = objc_msgSend(v2, "triggerContact");

  if (v3)
  {
    v4 = sub_10000A4BC((_QWORD *)(v1+ OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_contactRepresentationResolver), *(_QWORD *)(v1+ OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_contactRepresentationResolver+ 24));
    *(double *)&v5 = __chkstk_darwin(v4);
    v11[1] = v5;
    v12 = v3;
    v6 = sub_10000A430(&qword_100042560);
    swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
    v7 = v3;
    v8 = Promise.init(resolver:)(sub_10000D214, v11);

  }
  else
  {
    v13 = 0;
    v9 = sub_10000A430(&qword_100042560);
    swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
    return Promise.init(value:)(&v13);
  }
  return v8;
}

id sub_100022570()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRAddTasksIntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRAddTasksIntentHandler()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler);
}

_UNKNOWN **sub_100022638()
{
  return &off_10003DCF8;
}

_UNKNOWN **sub_100022644()
{
  return &off_10003E118;
}

_UNKNOWN **sub_100022650()
{
  return &off_10003D638;
}

uint64_t sub_10002265C(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_100022154(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_100022664()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100022688@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_10001F29C(*(id *)(v2 + 16), a1, a2);
}

uint64_t sub_1000226A0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000226C4(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

unint64_t sub_1000226F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100022784(a1, a2, v5);
}

unint64_t sub_100022754(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100022864(a1, v4);
}

unint64_t sub_100022784(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100022864(uint64_t a1, uint64_t a2)
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
    sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
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

uint64_t sub_10002297C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000229B4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100022998(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100022B38(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1000229B4(char a1, int64_t a2, char a3, _QWORD *a4)
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
    v10 = sub_10000A430(&qword_100042C20);
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
    type metadata accessor for REMSmartListType(0);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100022B38(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000A430(&qword_100042B08);
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

uint64_t sub_100022CA4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000223C4(a1, a2, *(void (**)(uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(uint64_t (**)(void))(v2 + 32));
}

_QWORD *sub_100022CDC(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = _swiftEmptyArrayStorage;
    if (!v4)
      break;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v4);
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    v6 = 0;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
      else
        v7 = *(id *)(a1 + 8 * v6 + 32);
      ++v6;
      v8 = v7;
      v9 = objc_msgSend(objc_allocWithZone((Class)INSpatialEventTrigger), "initWithPlacemark:event:", v8, objc_msgSend(a2, "event"));

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v10 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v10);
      v11 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v10, v9);
      specialized ContiguousArray._endMutation()(v11);
      if (v4 == v6)
        return _swiftEmptyArrayStorage;
    }
    __break(1u);
LABEL_14:
    if (a1 < 0)
      v12 = a1;
    else
      v12 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a1);
  }
  return result;
}

id sub_100022E58(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  _QWORD v14[3];
  _BYTE v15[16];
  id v16;

  v16 = 0;
  v1 = objc_msgSend(a1, "fetchDefaultAccountWithError:", &v16);
  if (v16)
  {
    v2 = v16;

    swift_willThrow();
    if (qword_100042078 != -1)
      swift_once(&qword_100042078, sub_10001C9D0);
    v3 = type metadata accessor for Logger(0);
    sub_10000A4A4(v3, (uint64_t)qword_100042960);
    v4 = v2;
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(12, -1);
      v8 = (void *)swift_slowAlloc(32, -1);
      v16 = v8;
      *(_DWORD *)v7 = 136315138;
      swift_getErrorValue(v4, v15, v14);
      v9 = Error.localizedDescription.getter(v14[1], v14[2]);
      v11 = v10;
      v13 = sub_10002CB54(v9, v10, (uint64_t *)&v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, v14, v7 + 4, v7 + 12);

      swift_bridgeObjectRelease(v11);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Unable to determine default account {error: %s}", v7, 0xCu);
      swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v8, -1, -1);
      swift_slowDealloc(v7, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v1;
}

uint64_t sub_100023074(uint64_t a1)
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
      sub_10000F86C(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_100023108(void *a1, char *a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t *p_align;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint8_t *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  void (*v30)(_QWORD *, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  id v31;
  _QWORD *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  void (*v55)(uint64_t, uint64_t, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  char *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  _QWORD *v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  NSObject *v70;
  _QWORD *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  os_log_type_t type[8];
  void (**v83)(_QWORD, _QWORD);
  void (**v84)(_QWORD, _QWORD);
  uint64_t v85;
  char *v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;

  v6 = swift_allocObject(&unk_10003DC60, 24, 7);
  *(_QWORD *)(v6 + 16) = a3;
  _Block_copy(a3);
  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v7 = type metadata accessor for Logger(0);
  sub_10000A4A4(v7, (uint64_t)qword_100042960);
  v8 = a1;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  p_align = &stru_100040FE8.align;
  if (os_log_type_enabled(v9, v10))
  {
    v83 = a3;
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_QWORD *)type = v6;
    v13 = (_QWORD *)swift_slowAlloc(32, -1);
    v88 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = objc_msgSend(v8, "targetTaskList");
    v15 = sub_10000A430((uint64_t *)&unk_100042C00);
    v16 = Optional.descriptionOrNil.getter(v15);
    v18 = v17;

    v19 = v16;
    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    v87 = sub_10002CB54(v19, v18, (uint64_t *)&v88);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v12 + 4, v12 + 12);

    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "SiriKit asked for resolving tasklist {targetTaskList: %s}", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    v20 = v13;
    v6 = *(_QWORD *)type;
    swift_slowDealloc(v20, -1, -1);
    v21 = v12;
    a3 = v83;
    swift_slowDealloc(v21, -1, -1);

  }
  else
  {

  }
  v22 = objc_msgSend(v8, *((SEL *)p_align + 243));
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource + 24];
    v25 = *(_QWORD *)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource + 32];
    sub_10000A4BC(&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource], v24);
    v26 = sub_10000A430(&qword_1000427E0);
    v27 = swift_allocObject(v26, 40, 7);
    *(_OWORD *)(v27 + 16) = xmmword_100034890;
    *(_QWORD *)(v27 + 32) = v23;
    v88 = (_QWORD *)v27;
    specialized Array._endMutation()(v27);
    v28 = v88;
    v29 = (_QWORD *)swift_allocObject(&unk_10003DCB0, 40, 7);
    v29[2] = v23;
    v29[3] = sub_10000D358;
    v29[4] = v6;
    v30 = *(void (**)(_QWORD *, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v25 + 40);
    v31 = v23;
    swift_retain();
    v30(v28, sub_1000282E0, v29, v24, v25);
    swift_release(v6);

    swift_bridgeObjectRelease(v28);
    v32 = v29;
LABEL_8:
    swift_release(v32);
    return;
  }
  v33 = objc_msgSend(v8, "targetTaskListMembers");
  if (v33)
  {
    v34 = v33;
    v35 = sub_10000A848(0, &qword_100042BB8, INPerson_ptr);
    v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v34, v35);

    if ((unint64_t)v36 >> 62)
    {
      if (v36 < 0)
        v57 = v36;
      else
        v57 = v36 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v36);
      v37 = _CocoaArrayWrapper.endIndex.getter(v57);
      swift_bridgeObjectRelease(v36);
      if (v37)
        goto LABEL_12;
    }
    else
    {
      v37 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v37)
      {
LABEL_12:
        v88 = _swiftEmptyArrayStorage;
        if (v37 < 1)
          __break(1u);
        v38 = v36 & 0xC000000000000001;
        swift_bridgeObjectRetain(v36);
        v39 = 0;
        do
        {
          if (v38)
            v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v39, v36);
          else
            v40 = *(id *)(v36 + 8 * v39 + 32);
          v41 = v40;
          ++v39;
          v42 = INPerson.flattenedEmails.getter();

          sub_10000E230(v42);
        }
        while (v37 != v39);
        swift_bridgeObjectRelease(v36);
        v43 = v88;
        v88 = _swiftEmptyArrayStorage;
        swift_bridgeObjectRetain(v36);
        v44 = 0;
        do
        {
          if (v38)
            v45 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v44, v36);
          else
            v45 = *(id *)(v36 + 8 * v44 + 32);
          v46 = v45;
          ++v44;
          v47 = INPerson.flattenedPhones.getter();

          sub_10000E230(v47);
        }
        while (v37 != v44);
        swift_bridgeObjectRelease(v36);
        v48 = v88;
        v49 = *(_QWORD *)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource + 32];
        v85 = *(_QWORD *)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource + 24];
        sub_10000A4BC(&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_dataSource], v85);
        v50 = swift_bridgeObjectRetain(v48);
        v51 = sub_100023074(v50);
        swift_bridgeObjectRelease(v48);
        v52 = swift_bridgeObjectRetain(v43);
        v53 = sub_100023074(v52);
        swift_bridgeObjectRelease(v43);
        v54 = (_QWORD *)swift_allocObject(&unk_10003DC88, 64, 7);
        v54[2] = v36;
        v54[3] = v43;
        v54[4] = v48;
        v54[5] = a2;
        v54[6] = sub_10000D358;
        v54[7] = v6;
        v55 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v49 + 56);
        swift_retain();
        v56 = a2;
        v55(v51, v53, sub_1000282A4, v54, v85, v49);
        swift_release(v6);
        swift_bridgeObjectRelease(v51);
        swift_bridgeObjectRelease(v53);
        v32 = v54;
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease(v36);
  }
  v58 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store];
  v88 = 0;
  v59 = objc_msgSend(v58, "fetchDefaultListWithError:", &v88);
  v60 = v59;
  if (v88)
  {
    v61 = v88;

    swift_willThrow();
  }
  else if (v59)
  {
    v86 = a2;
    sub_10000A848(0, (unint64_t *)&unk_100042310, INTaskList_ptr);
    v66 = v60;
    v67 = (void *)INTaskList.init(list:includeReminders:)(v66, 0);
    v68 = v66;
    v69 = v67;
    v70 = v68;
    v71 = v69;
    v72 = Logger.logObject.getter(v71);
    v73 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = swift_slowAlloc(22, -1);
      v75 = (_QWORD *)swift_slowAlloc(16, -1);
      *(_DWORD *)v74 = 138412546;
      v84 = a3;
      v76 = -[NSObject objectID](v70, "objectID");
      v88 = v76;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89, v74 + 4, v74 + 12);
      *v75 = v76;

      *(_WORD *)(v74 + 12) = 2112;
      v88 = v71;
      v77 = v6;
      v78 = v71;
      a3 = v84;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89, v74 + 14, v74 + 22);
      v75[1] = v71;

      v6 = v77;
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Using defaultList {objectID: %@, result: .success(%@)}", (uint8_t *)v74, 0x16u);
      v79 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v75, 2, v79);
      swift_slowDealloc(v75, -1, -1);
      swift_slowDealloc(v74, -1, -1);
    }
    else
    {

      v72 = v70;
    }

    v86[OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_didNotSpecifyTargetList] = 1;
    v80 = sub_10000A848(0, (unint64_t *)&unk_100042B20, INAddTasksTargetTaskListResolutionResult_ptr);
    v81 = objc_msgSend((id)swift_getObjCClassFromMetadata(v80), "successWithResolvedTaskList:", v71);
    ((void (**)(_QWORD, id))a3)[2](a3, v81);
    swift_release(v6);

    return;
  }
  v62 = Logger.logObject.getter(v59);
  v63 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v64 = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "No .targetTaskList and unable to get defaultList. {result: .disambiguateDueToNoDefaultList}", v64, 2u);
    swift_slowDealloc(v64, -1, -1);
  }

  v65 = sub_10001E304();
  ((void (**)(_QWORD, id))a3)[2](a3, v65);
  swift_release(v6);

}

void sub_1000239B4(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t *p_align;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  BOOL v24;
  uint8_t *v25;
  _QWORD *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  id v73;
  uint64_t v74;
  _QWORD *v75;
  void *v76;
  Class isa;
  id v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  id v96;
  NSObject *v97;
  NSObject *v98;
  NSObject *v99;
  os_log_type_t v100;
  uint64_t v101;
  uint64_t *v102;
  NSObject *v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  os_log_type_t v108;
  uint8_t *v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  id v119;
  id v120;
  NSObject *v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  _BYTE v127[16];

  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v4 = type metadata accessor for Logger(0);
  sub_10000A4A4(v4, (uint64_t)qword_100042960);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  p_align = &stru_100040FE8.align;
  if (os_log_type_enabled(v6, v7))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v123 = a2;
    v10 = swift_slowAlloc(32, -1);
    v126 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = objc_msgSend(v5, "spatialEventTrigger");
    v12 = sub_10000A430(&qword_100042BF8);
    v13 = Optional.descriptionOrNil.getter(v12);
    v15 = v14;

    v125 = sub_10002CB54(v13, v15, (uint64_t *)&v126);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v9 + 4, v9 + 12);

    v16 = v15;
    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SiriKit asked for resolving spatial event trigger {spatialEventTrigger: %s}", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    v17 = v10;
    a2 = v123;
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

  }
  v18 = objc_msgSend(v5, *((SEL *)p_align + 171));
  if (!v18)
  {
    v30 = Logger.logObject.getter(0);
    v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, ".spatialEventTrigger is nil {result: .notRequired}", v32, 2u);
      swift_slowDealloc(v32, -1, -1);
    }

    v33 = sub_10000A848(0, &qword_100042BD0, INSpatialEventTriggerResolutionResult_ptr);
    v34 = objc_msgSend((id)swift_getObjCClassFromMetadata(v33), "notRequired");
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v34);
    goto LABEL_67;
  }
  v19 = v18;
  if (!objc_msgSend(v18, "event"))
  {
    v35 = Logger.logObject.getter(0);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "spatialEventTrigger.event must not be .unknown {result: .unsupported}", v37, 2u);
      swift_slowDealloc(v37, -1, -1);
    }

    v38 = sub_10000A848(0, &qword_100042BD0, INSpatialEventTriggerResolutionResult_ptr);
    v34 = objc_msgSend((id)swift_getObjCClassFromMetadata(v38), "unsupported");
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v34);

    goto LABEL_67;
  }
  v20 = objc_msgSend(v19, "mobileSpace");
  v21 = v19;
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.default.getter();
  v24 = os_log_type_enabled(v22, v23);
  if (v20 == (id)1)
  {
    if (v24)
    {
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v25 = 138412290;
      v126 = v21;
      v27 = v21;
      v28 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, v127, v25 + 4, v25 + 12);
      *v26 = v19;

      v21 = v27;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Resolved vehicle trigger {result: .success, spatialEventTrigger: %@}", v25, 0xCu);
      v29 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v26, 1, v29);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);
    }
    else
    {

      v22 = v21;
    }

    v34 = objc_msgSend((id)objc_opt_self(INSpatialEventTriggerResolutionResult), "successWithResolvedSpatialEventTrigger:", v21);
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v34);

LABEL_67:
    return;
  }
  v124 = a2;
  v121 = v21;
  if (v24)
  {
    v39 = (uint8_t *)swift_slowAlloc(12, -1);
    v40 = swift_slowAlloc(32, -1);
    v126 = v40;
    *(_DWORD *)v39 = 136315138;
    v41 = -[NSObject suggestedValues](v21, "suggestedValues");
    if (v41)
    {
      v42 = v41;
      v43 = sub_10000A848(0, &qword_100042BE0, CLPlacemark_ptr);
      v44 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v42, v43);

    }
    else
    {
      v44 = 0;
    }
    v125 = v44;
    v45 = sub_10000A430(&qword_100042BF0);
    v46 = Optional.descriptionOrNil.getter(v45);
    v48 = v47;
    swift_bridgeObjectRelease(v44);
    v125 = sub_10002CB54(v46, v48, (uint64_t *)&v126);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v39 + 4, v39 + 12);
    v21 = v121;

    swift_bridgeObjectRelease(v48);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "suggestedValues: %s", v39, 0xCu);
    swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1, -1);
    swift_slowDealloc(v39, -1, -1);

    a2 = v124;
  }
  else
  {

  }
  v49 = -[NSObject suggestedValues](v21, "suggestedValues");
  if (v49)
  {
    v50 = v49;
    v51 = sub_10000A848(0, &qword_100042BE0, CLPlacemark_ptr);
    v52 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v50, v51);

    v53 = (unint64_t)v52 >> 62;
    if (!((unint64_t)v52 >> 62))
      goto LABEL_27;
  }
  else
  {
    v52 = (uint64_t)_swiftEmptyArrayStorage;
    v53 = (unint64_t)_swiftEmptyArrayStorage >> 62;
    if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
    {
LABEL_27:
      if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_28;
LABEL_39:
      v69 = swift_bridgeObjectRelease(v52);
      v70 = Logger.logObject.getter(v69);
      v71 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v72 = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, v71, "fallback to spatialEventTrigger.placemark instead because placemark count is 0 {count: 0}", v72, 2u);
        swift_slowDealloc(v72, -1, -1);
      }

      v73 = -[NSObject placemark](v21, "placemark");
      if (!v73)
      {
        v79 = Logger.logObject.getter(v74);
        v80 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v81 = 0;
          _os_log_impl((void *)&_mh_execute_header, v79, v80, "spatialEventTrigger.placemark == nil. Siri is messed up. Ignoring. {result: .notRequired}", v81, 2u);
          swift_slowDealloc(v81, -1, -1);
        }

        v82 = sub_10000A848(0, &qword_100042BD0, INSpatialEventTriggerResolutionResult_ptr);
        v83 = objc_msgSend((id)swift_getObjCClassFromMetadata(v82), "notRequired");
        (*(void (**)(uint64_t, id))(a2 + 16))(a2, v83);

        v34 = v21;
        goto LABEL_67;
      }
      v54 = -[NSObject placemark](v21, "placemark");
LABEL_56:
      v90 = objc_msgSend(v54, "region");
      if (v90)
      {
        v91 = v90;
        v92 = objc_opt_self(CLCircularRegion);
        v93 = swift_dynamicCastObjCClass(v91, v92);
        if (v93)
        {
          v94 = v93;
          v95 = v121;
          v96 = v91;
          v97 = v95;
          v98 = v96;
          v99 = Logger.logObject.getter(v98);
          v100 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v99, v100))
          {
            v122 = v97;
            v101 = swift_slowAlloc(22, -1);
            v102 = (uint64_t *)swift_slowAlloc(16, -1);
            *(_DWORD *)v101 = 138412546;
            v126 = v94;
            v103 = v98;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, v127, v101 + 4, v101 + 12);
            *v102 = v94;

            *(_WORD *)(v101 + 12) = 2112;
            v126 = v122;
            v104 = v122;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, v127, v101 + 14, v101 + 22);
            v102[1] = (uint64_t)v19;

            a2 = v124;
            _os_log_impl((void *)&_mh_execute_header, v99, v100, "Resolved circularRegion {circularRegion: %@, result: .success(%@)}", (uint8_t *)v101, 0x16u);
            v105 = sub_10000A430((uint64_t *)&unk_1000422E0);
            swift_arrayDestroy(v102, 2, v105);
            swift_slowDealloc(v102, -1, -1);
            v106 = v101;
            v97 = v122;
            swift_slowDealloc(v106, -1, -1);
          }
          else
          {

            v99 = v98;
          }

          v34 = v54;
          v119 = objc_msgSend(objc_allocWithZone((Class)INSpatialEventTrigger), "initWithPlacemark:event:", v34, -[NSObject event](v97, "event"));

          v120 = objc_msgSend((id)objc_opt_self(INSpatialEventTriggerResolutionResult), "successWithResolvedSpatialEventTrigger:", v119);
          (*(void (**)(uint64_t, id))(a2 + 16))(a2, v120);

          goto LABEL_67;
        }

      }
      v34 = v54;
      v107 = Logger.logObject.getter(v34);
      v108 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v107, v108))
      {
        v109 = (uint8_t *)swift_slowAlloc(12, -1);
        v110 = swift_slowAlloc(32, -1);
        v126 = v110;
        *(_DWORD *)v109 = 136315138;
        v111 = -[NSObject region](v34, "region");
        v125 = (uint64_t)v111;
        v112 = sub_10000A430(&qword_100042BE8);
        v113 = Optional.descriptionOrNil.getter(v112);
        v115 = v114;

        v125 = sub_10002CB54(v113, v115, (uint64_t *)&v126);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v109 + 4, v109 + 12);

        swift_bridgeObjectRelease(v115);
        _os_log_impl((void *)&_mh_execute_header, v107, v108, "Got a placemark with a CLRegion that is not a CLCircularRegion {region: %s, result: unsupported}", v109, 0xCu);
        swift_arrayDestroy(v110, 1, (char *)&type metadata for Any + 8);
        v116 = v110;
        a2 = v124;
        swift_slowDealloc(v116, -1, -1);
        swift_slowDealloc(v109, -1, -1);

      }
      else
      {

      }
      v117 = sub_10000A848(0, &qword_100042BD0, INSpatialEventTriggerResolutionResult_ptr);
      v118 = objc_msgSend((id)swift_getObjCClassFromMetadata(v117), "unsupported");
      (*(void (**)(uint64_t, id))(a2 + 16))(a2, v118);

      goto LABEL_67;
    }
  }
  if (v52 < 0)
    v67 = v52;
  else
    v67 = v52 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v52);
  v68 = _CocoaArrayWrapper.endIndex.getter(v67);
  swift_bridgeObjectRelease(v52);
  if (!v68)
    goto LABEL_39;
LABEL_28:
  if ((v52 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain(v52);
    v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v52);
    swift_bridgeObjectRelease(v52);
    if (!v53)
    {
LABEL_31:
      if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10) != 1)
      {
LABEL_32:

        v55 = swift_bridgeObjectRetain_n(v52, 2);
        v56 = Logger.logObject.getter(v55);
        v57 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc(12, -1);
          v59 = swift_slowAlloc(32, -1);
          v126 = v59;
          *(_DWORD *)v58 = 136315138;
          v60 = sub_10000A848(0, &qword_100042BE0, CLPlacemark_ptr);
          v61 = swift_bridgeObjectRetain(v52);
          v62 = Array.description.getter(v61, v60);
          v63 = v21;
          v65 = v64;
          swift_bridgeObjectRelease(v52);
          v125 = sub_10002CB54(v62, v65, (uint64_t *)&v126);
          a2 = v124;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v58 + 4, v58 + 12);
          swift_bridgeObjectRelease_n(v52, 2);
          v66 = v65;
          v21 = v63;
          swift_bridgeObjectRelease(v66);
          _os_log_impl((void *)&_mh_execute_header, v56, v57, "Disambiguate suggestedValues {result: .disambiguation, placemarks: %s}", v58, 0xCu);
          swift_arrayDestroy(v59, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v59, -1, -1);
          swift_slowDealloc(v58, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n(v52, 2);
        }
        v34 = v21;
        v75 = sub_100022CDC(v52, v34);
        swift_bridgeObjectRelease(v52);

        v76 = (void *)objc_opt_self(INSpatialEventTriggerResolutionResult);
        sub_10000A848(0, &qword_100042BD8, INSpatialEventTrigger_ptr);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v75);
        v78 = objc_msgSend(v76, "disambiguationWithSpatialEventTriggersToDisambiguate:", isa);

        (*(void (**)(uint64_t, id))(a2 + 16))(a2, v78);
        goto LABEL_67;
      }
      goto LABEL_53;
    }
LABEL_49:
    if (v52 < 0)
      v84 = v52;
    else
      v84 = v52 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v52);
    v85 = _CocoaArrayWrapper.endIndex.getter(v84);
    swift_bridgeObjectRelease(v52);
    if (v85 != 1)
      goto LABEL_32;
LABEL_53:
    v86 = swift_bridgeObjectRelease(v52);
    v87 = Logger.logObject.getter(v86);
    v88 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v89 = 0;
      _os_log_impl((void *)&_mh_execute_header, v87, v88, "Using the only suggestedValue because placemarks.count is 1 {count: 1}", v89, 2u);
      swift_slowDealloc(v89, -1, -1);
    }

    goto LABEL_56;
  }
  if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v54 = *(id *)(v52 + 32);
    if (!v53)
      goto LABEL_31;
    goto LABEL_49;
  }
  __break(1u);
}

void sub_10002494C(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t *p_align;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  _QWORD v45[5];
  uint64_t v46;
  id v47;
  uint64_t v48;

  v6 = swift_allocObject(&unk_10003DBC0, 24, 7);
  *(_QWORD *)(v6 + 16) = a3;
  _Block_copy(a3);
  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_10000A4A4(v7, (uint64_t)qword_100042960);
  v9 = a1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  p_align = &stru_100040FE8.align;
  if (os_log_type_enabled(v10, v11))
  {
    v46 = v6;
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v48 = v14;
    *(_DWORD *)v13 = 136315138;
    v45[4] = v8;
    v47 = objc_msgSend(v9, "taskReference");
    type metadata accessor for INTaskReference(0);
    v16 = String.init<A>(describing:)(&v47, v15);
    v18 = v17;
    v47 = (id)sub_10002CB54(v16, v17, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48, v13 + 4, v13 + 12);

    v19 = v18;
    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "SiriKit asked for resolving task reference {taskReference: %s}", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    v20 = v13;
    v6 = v46;
    swift_slowDealloc(v20, -1, -1);

  }
  else
  {

  }
  v21 = objc_msgSend(v9, *((SEL *)p_align + 235));
  if (v21 != (id)1)
  {
    v36 = Logger.logObject.getter(v21);
    v37 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "userActivity not requested {result: .notRequired}", v38, 2u);
      swift_slowDealloc(v38, -1, -1);
    }

    v39 = sub_10000A848(0, &qword_100042BC8, INTaskReferenceResolutionResult_ptr);
    v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(v39), "notRequired");
    goto LABEL_16;
  }
  v22 = sub_10001F8E8(v9);
  if (v22)
  {
    v23 = v22;
    v24 = objc_msgSend(v22, "supportsReminderActions");

    if ((v24 & 1) == 0)
    {
      v41 = Logger.logObject.getter(v22);
      v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Target list account doesn't support userActivity. {result: .unsupported()}", v43, 2u);
        swift_slowDealloc(v43, -1, -1);
      }

      v44 = sub_10000A848(0, &qword_100042BC8, INTaskReferenceResolutionResult_ptr);
      v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(v44), "unsupported");
LABEL_16:
      v33 = v40;
      ((void (**)(_QWORD, id))a3)[2](a3, v33);
      v35 = v6;
      goto LABEL_17;
    }
  }
  __chkstk_darwin(v22);
  v45[2] = v9;
  v45[3] = a2;
  v25 = sub_10000A430((uint64_t *)&unk_100042AE0);
  swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
  v26 = Promise.init(resolver:)(sub_100028338, v45);
  v27 = swift_allocObject(&unk_10003DBE8, 32, 7);
  *(_QWORD *)(v27 + 16) = sub_10000D358;
  *(_QWORD *)(v27 + 24) = v6;
  v28 = swift_retain();
  v29 = (void *)zalgo.getter(v28);
  v30 = dispatch thunk of Promise.then<A>(on:closure:)(v29, sub_100028238, v27, (char *)&type metadata for () + 8);
  swift_release(v26);
  swift_release(v27);

  v31 = swift_allocObject(&unk_10003DC10, 32, 7);
  *(_QWORD *)(v31 + 16) = sub_10000D358;
  *(_QWORD *)(v31 + 24) = v6;
  v32 = swift_retain();
  v33 = (id)zalgo.getter(v32);
  v34 = dispatch thunk of Promise.error(on:closure:)(v33, sub_100028250, v31);
  swift_release(v6);
  swift_release(v34);
  swift_release(v30);
  v35 = v31;
LABEL_17:
  swift_release(v35);

}

void sub_100024E1C(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  NSArray v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;

  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v4 = type metadata accessor for Logger(0);
  sub_10000A4A4(v4, (uint64_t)qword_100042960);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(32, -1);
    v40 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = objc_msgSend(v5, "targetTaskListMembers");
    if (v10)
    {
      v11 = v10;
      v12 = sub_10000A848(0, &qword_100042BB8, INPerson_ptr);
      v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

    }
    else
    {
      v13 = 0;
    }
    v39 = v13;
    v14 = sub_10000A430(&qword_100042BC0);
    v15 = String.init<A>(describing:)(&v39, v14);
    v17 = v16;
    v39 = sub_10002CB54(v15, v16, (uint64_t *)&v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v8 + 4, v8 + 12);

    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SiriKit asked for resolving target task list members {targetTaskListMembers: %s}", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v18 = objc_msgSend(v5, "targetTaskListMembers");
  if (!v18)
  {
    v32 = sub_10000A848(0, &qword_100042BB0, INPersonResolutionResult_ptr);
    v33 = objc_msgSend((id)swift_getObjCClassFromMetadata(v32), "notRequired");
    v34 = sub_10000A430(&qword_1000427E0);
    v35 = (_QWORD *)swift_allocObject(v34, 40, 7);
    *((_OWORD *)v35 + 1) = xmmword_100034890;
    v35[4] = v33;
    v40 = v35;
    specialized Array._endMutation()(v35);
    v31 = v40;
    v36 = v33;
    v37.super.isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, Class))(a2 + 16))(a2, v37.super.isa);

LABEL_26:
    swift_bridgeObjectRelease(v31);

    return;
  }
  v19 = v18;
  v20 = sub_10000A848(0, &qword_100042BB8, INPerson_ptr);
  v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, v20);

  if (!((unint64_t)v21 >> 62))
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v22)
      goto LABEL_12;
LABEL_24:
    swift_bridgeObjectRelease(v21);
    v31 = _swiftEmptyArrayStorage;
LABEL_25:
    sub_10000A848(0, &qword_100042BB0, INPersonResolutionResult_ptr);
    v37.super.isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, Class))(a2 + 16))(a2, v37.super.isa);
    goto LABEL_26;
  }
  if (v21 < 0)
    v38 = v21;
  else
    v38 = v21 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v21);
  v22 = _CocoaArrayWrapper.endIndex.getter(v38);
  swift_bridgeObjectRelease(v21);
  if (!v22)
    goto LABEL_24;
LABEL_12:
  v40 = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v22);
  if ((v22 & 0x8000000000000000) == 0)
  {
    v23 = (void *)objc_opt_self(INPersonResolutionResult);
    v24 = 0;
    do
    {
      if ((v21 & 0xC000000000000001) != 0)
        v25 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v24, v21);
      else
        v25 = *(id *)(v21 + 8 * v24 + 32);
      v26 = v25;
      ++v24;
      v27 = objc_msgSend(v23, "successWithResolvedPerson:", v25);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v28);
      v29 = v40[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v29);
      v30 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v29, v27);
      specialized ContiguousArray._endMutation()(v30);
    }
    while (v22 != v24);
    v31 = v40;
    swift_bridgeObjectRelease(v21);
    goto LABEL_25;
  }
  __break(1u);
}

void sub_10002526C(void *a1, NSObject **a2, void (**a3)(const void *, id))
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
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
  void (**v27)(const void *, id);
  void *v28;
  uint64_t v29;
  uint64_t inited;
  id v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint8_t *v38;
  NSObject **v39;
  NSObject *v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  NSObject **v44;
  char *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t countAndFlagsBits;
  void *object;
  void (**v55)(char *, uint64_t, _QWORD *);
  char *v56;
  uint64_t v57;
  _QWORD *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint8_t *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t v66;
  _QWORD *v67;
  NSObject *v68;
  uint64_t v69;
  _QWORD *v70;
  id v71;
  void *v72;
  Class isa;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  os_log_type_t v85;
  int v86;
  _BOOL4 v87;
  uint64_t v88;
  uint8_t *v89;
  NSObject **v90;
  uint8_t *v91;
  NSObject *v92;
  NSObject *v93;
  uint8_t *v94;
  NSObject **v95;
  uint8_t *v96;
  uint64_t v97;
  os_log_t v98;
  void *v99;
  uint64_t v100;
  void (**v101)(char *, uint64_t, _QWORD *);
  os_log_t v102;
  _QWORD *v103;
  uint64_t v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  NSString v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  id v113;
  unsigned int v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  _QWORD *v121;
  id v122;
  NSObject *v123;
  os_log_type_t v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  id v130;
  id v131;
  os_log_t v132;
  uint64_t v133;
  void *v134;
  Class v135;
  char *v136;
  void *v137;
  id v138;
  id v139;
  NSObject *v140;
  os_log_type_t v141;
  uint8_t *v142;
  uint64_t v143;
  _QWORD *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  _QWORD *v150;
  char *v151;
  uint8_t *v152;
  NSObject *v153;
  NSObject *v154;
  os_log_type_t v155;
  uint8_t *v156;
  NSObject **v157;
  uint64_t v158;
  NSObject *v159;
  NSObject **v160;
  uint64_t v161;
  id v162;
  id v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  char *v169;
  id v170;
  char *v171;
  id v172;
  NSObject *v173;
  os_log_type_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  _QWORD *v178;
  char *v179;
  unint64_t v180;
  uint64_t v181;
  unint64_t v182;
  unint64_t v183;
  uint64_t v184;
  NSObject **v185;
  uint64_t v186;
  id v187;
  NSObject **v188;
  uint64_t v189;
  id v190;
  NSObject *v191;
  NSObject *v192;
  os_log_type_t v193;
  uint64_t v194;
  uint64_t v195;
  _QWORD *v196;
  id v197;
  id v198;
  NSObject *v199;
  id v200;
  uint64_t v201;
  _QWORD *v202;
  id v203;
  uint64_t v204;
  unsigned int v205;
  NSObject *v206;
  NSObject *v207;
  NSObject *v208;
  os_log_type_t v209;
  uint8_t *v210;
  uint64_t v211;
  _QWORD *v212;
  uint64_t v213;
  uint64_t v214;
  id v215;
  uint64_t v216;
  _QWORD *v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  uint64_t v224;
  void *v225;
  void *v226;
  id v227;
  id v228;
  id v229;
  id v230;
  NSObject *v231;
  os_log_type_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  _QWORD *v236;
  id v237;
  unint64_t v238;
  uint64_t v239;
  unint64_t v240;
  unint64_t v241;
  uint64_t v242;
  NSObject **v243;
  uint64_t v244;
  id v245;
  id v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  id v250;
  void *v251;
  id v252;
  id v253;
  uint8_t *v254;
  uint64_t v255;
  NSObject *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  NSObject *v261;
  uint64_t v262;
  void *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  _QWORD *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  uint64_t v272;
  _QWORD *v273;
  uint64_t v274;
  void *v275;
  uint64_t v276;
  uint64_t v277;
  id v278;
  uint64_t v279;
  char *v280;
  uint64_t v281;
  uint64_t v282;
  void (*v283)(char *, uint64_t);
  NSObject **v284;
  id v285;
  id v286;
  id v287;
  _QWORD *v288;
  uint64_t v289;
  uint64_t v290;
  char *v291;
  void *v292;
  Class v293;
  char *v294;
  Class v295;
  id v296;
  char *v297;
  uint64_t v298;
  char v299;
  uint64_t v300;
  void *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  unint64_t v307;
  unint64_t v308;
  unint64_t v309;
  unint64_t v310;
  unint64_t v311;
  unint64_t v312;
  _QWORD *v313;
  id v314;
  char *v315;
  id v316;
  id v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t (**v320)();
  NSObject *v321;
  id v322;
  uint64_t (*v323)();
  NSObject *v324;
  id v325;
  os_log_t v326;
  char *v327;
  uint64_t v328;
  NSObject **v329;
  char *v330;
  void *v331;
  uint8_t *v332;
  uint64_t v333;
  uint64_t v334;
  _QWORD *v335;
  id v336;
  id v337;
  id v338;
  id v339;
  void *v340;
  void *v341;
  id v342;
  id v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  NSObject *v348;
  id v349;
  NSObject *v350;
  id v351;
  NSObject *v352;
  os_log_type_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  NSObject **v357;
  NSObject *v358;
  NSObject **v359;
  unint64_t v360;
  uint64_t v361;
  unint64_t v362;
  unint64_t v363;
  uint64_t v364;
  NSObject **v365;
  uint64_t v366;
  id v367;
  id v368;
  id v369;
  uint8_t *v370;
  uint8_t *v371;
  char *v372;
  NSObject *v373;
  id v374;
  void *v375;
  id v376;
  uint64_t v377;
  id v378;
  uint64_t v379;
  NSObject *v380;
  void (**v381)(const void *, id);
  char *v382;
  uint64_t v383;
  uint64_t v384;
  char *v385;
  uint64_t v386;
  uint64_t v387;
  char *v388;
  uint64_t v389;
  uint64_t v390;
  char *v391;
  uint64_t v392;
  uint64_t v393;
  unint64_t v394;
  unint64_t v395;
  char *v396;
  char *v397;
  uint64_t v398;
  os_log_t v399;
  char *v400;
  uint64_t v401;
  void (**v402)(char *, uint64_t, _QWORD *);
  _QWORD *v403;
  char *v404;
  id v405;
  NSObject **v406;
  uint64_t v407;
  void *v408;
  NSObject **v409;
  id v410;
  char v411[8];
  char v412[8];
  Swift::tuple_isSmartListID_Bool_decodedIdentifier_String_optional v413;

  v406 = a2;
  v384 = type metadata accessor for TimeZone(0);
  v383 = *(_QWORD *)(v384 - 8);
  __chkstk_darwin(v384);
  v382 = (char *)&v370 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v390 = type metadata accessor for DateComponents(0);
  v389 = *(_QWORD *)(v390 - 8);
  __chkstk_darwin(v390);
  v388 = (char *)&v370 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v387 = type metadata accessor for Date(0);
  v386 = *(_QWORD *)(v387 - 8);
  v7 = __chkstk_darwin(v387);
  v9 = (char *)&v370 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v393 = type metadata accessor for REMFeatureFlags(0, v7);
  v392 = *(_QWORD *)(v393 - 8);
  __chkstk_darwin(v393);
  v391 = (char *)&v370 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000A430(&qword_100042B30);
  v394 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v396 = (char *)&v370 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v395 = v12;
  __chkstk_darwin(v13);
  v398 = (uint64_t)&v370 - v14;
  v15 = sub_10000A430((uint64_t *)&unk_100042B38);
  __chkstk_darwin(v15);
  v399 = (os_log_t)((char *)&v370 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  v404 = (char *)&v370 - v18;
  v403 = (_QWORD *)type metadata accessor for UUID(0);
  v402 = (void (**)(char *, uint64_t, _QWORD *))*(v403 - 1);
  __chkstk_darwin(v403);
  v400 = (char *)&v370 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v397 = (char *)&v370 - v21;
  v22 = type metadata accessor for Logger(0);
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v25 = (char *)&v370 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = swift_allocObject(&unk_10003DAA8, 24, 7);
  *(_QWORD *)(v26 + 16) = a3;
  v27 = a3;
  _Block_copy(a3);
  if (qword_100042078 != -1)
    swift_once(&qword_100042078, sub_10001C9D0);
  v28 = (void *)sub_10000A4A4(v22, (uint64_t)qword_100042960);
  (*(void (**)(char *, void *, uint64_t))(v23 + 16))(v25, v28, v22);
  v29 = sub_10000A430(&qword_1000422C0);
  inited = swift_initStackObject(v29, v412);
  *(_OWORD *)(inited + 16) = xmmword_100034880;
  *(_QWORD *)(inited + 32) = 0x746E65746E69;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = sub_10000A848(0, (unint64_t *)&unk_100042B48, INAddTasksIntent_ptr);
  *(_QWORD *)(inited + 48) = a1;
  v31 = a1;
  v32 = sub_10001C784(inited);
  sub_1000285E0((uint64_t)"Add task via Siri {intent: %@}", 30, 2, v32);
  swift_bridgeObjectRelease(v32);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  v33 = v31;
  v405 = v28;
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.default.getter();
  v36 = os_log_type_enabled(v34, v35);
  v385 = v9;
  if (v36)
  {
    v37 = swift_slowAlloc(12, -1);
    v401 = v26;
    v38 = (uint8_t *)v37;
    v39 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v38 = 138412290;
    v410 = v33;
    v40 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v38 + 4, v38 + 12);
    *v39 = v33;

    _os_log_impl((void *)&_mh_execute_header, v34, v35, "SiriKit asked for handling intent {intent: %@}", v38, 0xCu);
    v41 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v39, 1, v41);
    swift_slowDealloc(v39, -1, -1);
    v42 = v38;
    v43 = v401;
    v44 = v406;
    swift_slowDealloc(v42, -1, -1);
  }
  else
  {

    v34 = v33;
    v43 = v26;
    v44 = v406;
  }
  v45 = v404;

  v46 = -[NSObject taskTitles](v33, "taskTitles");
  if (!v46)
  {
    v59 = Logger.logObject.getter(0);
    v60 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v59, v60))
    {
LABEL_18:

      v71 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
      v27[2](v27, v71);
      swift_release(v43);

      return;
    }
    v61 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v61 = 0;
    _os_log_impl((void *)&_mh_execute_header, v59, v60, "intent.taskTitles is nil - should have resolved it in previous calls. {result: .failure}", v61, 2u);
    v62 = v61;
LABEL_16:
    swift_slowDealloc(v62, -1, -1);
    goto LABEL_18;
  }
  v47 = v46;
  v48 = sub_10000A848(0, &qword_100042B00, INSpeakableString_ptr);
  v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v47, v48);

  v50 = (char *)-[NSObject targetTaskList](v33, "targetTaskList");
  if (!v50)
  {
    swift_bridgeObjectRelease(v49);
    v63 = v33;
    v59 = Logger.logObject.getter(v63);
    v64 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v59, v64))
    {

      v59 = v63;
      goto LABEL_18;
    }
    v65 = (uint8_t *)swift_slowAlloc(12, -1);
    v66 = swift_slowAlloc(8, -1);
    v381 = v27;
    v67 = (_QWORD *)v66;
    *(_DWORD *)v65 = 138412290;
    v410 = v63;
    v68 = v63;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v65 + 4, v65 + 12);
    *v67 = v63;

    _os_log_impl((void *)&_mh_execute_header, v59, v64, "Unexpected nil .targetTaskList from intent. {intent: %@, result: .failure}", v65, 0xCu);
    v69 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v67, 1, v69);
    v70 = v67;
    v27 = v381;
    swift_slowDealloc(v70, -1, -1);
    v62 = v65;
    goto LABEL_16;
  }
  v51 = v50;
  v380 = v33;
  v52 = swift_allocObject(&unk_10003DAD0, 24, 7);
  *(_QWORD *)(v52 + 16) = 0;
  v413 = INTaskList.decodeIdentifier()();
  v404 = v51;
  if (!v413.value.decodedIdentifier._object)
    goto LABEL_27;
  countAndFlagsBits = v413.value.decodedIdentifier._countAndFlagsBits;
  object = v413.value.decodedIdentifier._object;
  if (v413.value.isSmartListID)
  {
    v379 = v52;
    UUID.init(uuidString:)(v413.value.decodedIdentifier._countAndFlagsBits, v413.value.decodedIdentifier._object);
    v55 = v402;
    v56 = v45;
    v57 = (uint64_t)v45;
    v58 = v403;
    if (((unsigned int (*)(char *, uint64_t, _QWORD *))v402[6])(v56, 1, v403) == 1)
    {
      sub_10000A5D0(v57, (uint64_t *)&unk_100042B38);
      v52 = v379;
      goto LABEL_25;
    }
    v55[4](v397, v57, v58);
    v72 = (void *)objc_opt_self(REMSmartList);
    isa = UUID._bridgeToObjectiveC()().super.isa;
    v74 = objc_msgSend(v72, "objectIDWithUUID:", isa);

    v75 = *(NSObject **)((char *)v44 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store);
    v410 = 0;
    v378 = v74;
    v76 = objc_msgSend(v75, "fetchCustomSmartListWithObjectID:error:", v74, &v410);
    v77 = v410;
    if (v76)
    {
      v78 = v76;
      v376 = v75;
      v79 = v410;
      v80 = objc_msgSend(v78, "customContext");
      v52 = v379;
      if (!v80
        || (v81 = v80, v82 = REMSmartListCustomContext.filter.getter(), v81, (v375 = (void *)v82) == 0))
      {

        ((void (*)(char *, _QWORD *))v402[1])(v397, v403);
        v51 = v404;
        goto LABEL_25;
      }
      v374 = v78;
      v83 = v378;
      v84 = Logger.logObject.getter(v83);
      v85 = static os_log_type_t.default.getter();
      v86 = v85;
      v87 = os_log_type_enabled(v84, v85);
      v401 = v43;
      v373 = v83;
      if (v87)
      {
        v88 = swift_slowAlloc(12, -1);
        LODWORD(v372) = v86;
        v89 = (uint8_t *)v88;
        v90 = (NSObject **)swift_slowAlloc(8, -1);
        v381 = v27;
        v371 = v89;
        *(_DWORD *)v89 = 138543362;
        v91 = v89 + 12;
        v370 = v89 + 4;
        v410 = v83;
        v92 = v83;
        v377 = v49;
        v93 = v92;
        v43 = v401;
        v94 = v91;
        v27 = v381;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v370, v94);
        *v90 = v83;
        v95 = v90;

        v49 = v377;
        v96 = v371;
        _os_log_impl((void *)&_mh_execute_header, v84, (os_log_type_t)v372, "Successfully fetched custom smart list {smartListID: %{public}@}", v371, 0xCu);
        v97 = sub_10000A430((uint64_t *)&unk_1000422E0);
        swift_arrayDestroy(v95, 1, v97);
        swift_slowDealloc(v95, -1, -1);
        swift_slowDealloc(v96, -1, -1);
      }
      else
      {

        v84 = v83;
      }
      v339 = v376;

      v340 = *(void **)(v52 + 16);
      v341 = v375;
      *(_QWORD *)(v52 + 16) = v375;
      v376 = v341;

      v410 = 0;
      v342 = objc_msgSend(v339, "fetchDefaultListWithError:", &v410);
      if (!v410)
      {
        ((void (*)(char *, _QWORD *))v402[1])(v397, v403);

        v51 = v404;
        if (v342)
        {
          v121 = v342;
          swift_bridgeObjectRelease(object);
          v403 = v121;
LABEL_52:
          v205 = objc_msgSend(v121, "isGroup");
          v206 = v380;
          if (v205)
          {
            swift_bridgeObjectRelease(v49);
            v207 = v121;
            v208 = Logger.logObject.getter(v207);
            v209 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v208, v209))
            {
              v210 = (uint8_t *)swift_slowAlloc(12, -1);
              v211 = swift_slowAlloc(8, -1);
              v381 = v27;
              v212 = (_QWORD *)v211;
              *(_DWORD *)v210 = 138543362;
              v213 = v52;
              v214 = v43;
              v215 = -[NSObject objectID](v207, "objectID");
              v410 = v215;
              v51 = v404;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v210 + 4, v210 + 12);
              *v212 = v215;
              v43 = v214;
              v52 = v213;

              _os_log_impl((void *)&_mh_execute_header, v208, v209, "Fetched list is a Group, can't add reminder to groups. {result: .failure, listID: %{public}@}", v210, 0xCu);
              v216 = sub_10000A430((uint64_t *)&unk_1000422E0);
              swift_arrayDestroy(v212, 1, v216);
              v217 = v212;
              v27 = v381;
              swift_slowDealloc(v217, -1, -1);
              swift_slowDealloc(v210, -1, -1);
            }
            else
            {

              v208 = v207;
            }
            v220 = v403;

            v221 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
            v27[2](v27, v221);
            swift_release(v43);
            swift_release(v52);

            return;
          }
          v405 = v121;
          v401 = v43;
          v218 = -[NSObject spatialEventTrigger](v380, "spatialEventTrigger");
          if (v218)
          {
            v219 = v218;
            sub_10000A848(0, &qword_100042570, REMAlarmLocationTrigger_ptr);
            v400 = (char *)REMAlarmLocationTrigger.init(spatialEventTrigger:)(v219);
          }
          else
          {
            v400 = 0;
          }
          v245 = -[NSObject spatialEventTrigger](v206, "spatialEventTrigger");
          v377 = v49;
          if (v245)
          {
            v246 = v245;
            sub_10000A848(0, &qword_100042578, REMAlarmVehicleTrigger_ptr);
            v376 = (id)REMAlarmVehicleTrigger.init(spatialEventTrigger:)(v246);
          }
          else
          {
            v376 = 0;
          }
          v247 = sub_10000A430((uint64_t *)&unk_100042540);
          v402 = (void (**)(char *, uint64_t, _QWORD *))swift_allocBox(v247);
          v249 = v248;
          v250 = -[NSObject temporalEventTrigger](v206, "temporalEventTrigger");
          v370 = (uint8_t *)v249;
          if (v250)
          {
            v251 = v250;
            INTemporalEventTrigger.dueDateComponents(timeProvider:)((char *)v44 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider);

          }
          else
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v389 + 56))(v249, 1, 1, v390);
          }
          v252 = -[NSObject temporalEventTrigger](v206, "temporalEventTrigger", v370);
          v381 = v27;
          v379 = v52;
          if (v252)
          {
            v253 = v252;
            v254 = (uint8_t *)v406;
            sub_10000D2E4((uint64_t)v406 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider, (uint64_t)&v410);
            TTRRecurrenceRuleModel.init(temporalEventTrigger:timeProvider:)(v253, &v410);
          }
          else
          {
            v255 = type metadata accessor for TTRRecurrenceRuleModel(0);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v255 - 8) + 56))(v398, 1, 1, v255);
            v254 = (uint8_t *)v406;
          }
          v256 = swift_allocObject(&unk_10003DAF8, 24, 7);
          v256[2].isa = 0;
          v257 = sub_100022420(v206);
          v258 = swift_allocObject(&unk_10003DB20, 24, 7);
          *(_QWORD *)(v258 + 16) = 0;
          __chkstk_darwin(v258);
          *(&v370 - 2) = (uint8_t *)v259;
          *(&v370 - 1) = v254;
          v260 = sub_10000A430((uint64_t *)&unk_100042AE0);
          swift_allocObject(v260, *(unsigned int *)(v260 + 48), *(unsigned __int16 *)(v260 + 52));
          v261 = Promise.init(resolver:)(sub_100028338, &v370 - 4);
          v262 = sub_10000A430(&qword_100042B58);
          v263 = (void *)swift_allocBox(v262);
          v265 = v264;
          v266 = type metadata accessor for URL(0);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v266 - 8) + 56))(v265, 1, 1, v266);
          v267 = (_QWORD *)swift_allocObject(&unk_10003DB48, 32, 7);
          v267[2] = 0;
          v267[3] = 0;
          v371 = (uint8_t *)sub_10000A430(&qword_100042B60);
          v268 = sub_10000A430(&qword_1000427E0);
          v269 = swift_allocObject(v268, 48, 7);
          *(_OWORD *)(v269 + 16) = xmmword_100034DB0;
          v270 = swift_retain();
          v271 = (void *)zalgo.getter(v270);
          v375 = (void *)v257;
          v272 = dispatch thunk of Promise.then<A>(on:closure:)(v271, sub_100027D34, v256, (char *)&type metadata for () + 8);
          v399 = v256;
          swift_release(v256);

          *(_QWORD *)(v269 + 32) = v272;
          v273 = (_QWORD *)swift_allocObject(&unk_10003DB70, 40, 7);
          v273[2] = v258;
          v273[3] = v263;
          v273[4] = v267;
          v397 = (char *)v258;
          swift_retain();
          v378 = v263;
          swift_retain();
          v374 = v267;
          v274 = swift_retain();
          v275 = (void *)zalgo.getter(v274);
          v372 = (char *)&type metadata for () + 8;
          v373 = v261;
          v276 = dispatch thunk of Promise.then<A>(on:closure:)(v275, sub_100027D80, v273, (char *)&type metadata for () + 8);
          swift_release(v273);

          *(_QWORD *)(v269 + 40) = v276;
          v410 = (id)v269;
          specialized Array._endMutation()(v277);
          v278 = v410;
          v371 = (uint8_t *)static Promise.all(_:)(v410);
          swift_bridgeObjectRelease(v278);
          v279 = v392;
          v280 = v391;
          v281 = v393;
          v282 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v392 + 104))(v391, enum case for REMFeatureFlags.siriDefaultTime(_:), v393);
          LOBYTE(v276) = REMFeatureFlags.isEnabled.getter(v282);
          v283 = *(void (**)(char *, uint64_t))(v279 + 8);
          v284 = v406;
          v283(v280, v281);
          if ((v276 & 1) != 0
            && *((_BYTE *)v284
               + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_didNotSpecifyTargetList) == 1)
          {
            v285 = -[NSObject temporalEventTrigger](v380, "temporalEventTrigger");

            if (!v285)
            {
              v286 = -[NSObject spatialEventTrigger](v380, "spatialEventTrigger");

              if (!v286)
              {
                v287 = -[NSObject contactEventTrigger](v380, "contactEventTrigger");

                if (!v287)
                {
                  v288 = (NSObject **)((char *)v284
                                     + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider);
                  v289 = *(uint64_t *)((char *)v284
                                    + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider
                                    + 24);
                  v290 = v288[4];
                  sub_10000A4BC(v288, v289);
                  v291 = v385;
                  (*(void (**)(uint64_t, uint64_t))(v290 + 8))(v289, v290);
                  v292 = (void *)objc_opt_self(NSDateComponents);
                  v293 = Date._bridgeToObjectiveC()().super.isa;
                  v294 = v382;
                  static TimeZone.current.getter();
                  v295 = TimeZone._bridgeToObjectiveC()().super.isa;
                  (*(void (**)(char *, uint64_t))(v383 + 8))(v294, v384);
                  v296 = objc_msgSend(v292, "rem_dateComponentsWithDate:timeZone:isAllDay:", v293, v295, 0);

                  v297 = v388;
                  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v296);

                  v298 = DateComponents.hour.getter();
                  if ((v299 & 1) != 0)
                  {
                    _Block_release(v381);

                    __break(1u);
                    return;
                  }
                  v300 = v298;
                  v301 = (void *)objc_opt_self(REMSnoozeTimeUtils);
                  DateComponents.hour.setter(objc_msgSend(v301, "nextThirdsHour:", objc_msgSend(v301, "nextThirdsHourFromHour:", v300)), 0);
                  DateComponents.minute.setter(0, 0);
                  DateComponents.second.setter(0, 0);
                  (*(void (**)(char *, uint64_t))(v386 + 8))(v291, v387);
                  v302 = (uint64_t)v370;
                  sub_10000A5D0((uint64_t)v370, (uint64_t *)&unk_100042540);
                  v303 = v389;
                  v304 = v390;
                  (*(void (**)(uint64_t, char *, uint64_t))(v389 + 32))(v302, v297, v390);
                  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v303 + 56))(v302, 0, 1, v304);
                  v284 = v406;
                }
              }
            }
          }
          sub_10000A58C(v398, (uint64_t)v396, &qword_100042B30);
          v305 = *(unsigned __int8 *)(v394 + 80);
          v306 = (v305 + 64) & ~v305;
          v394 = (v395 + v306 + 7) & 0xFFFFFFFFFFFFFFF8;
          v307 = (v394 + 15) & 0xFFFFFFFFFFFFFFF8;
          v308 = (v307 + 15) & 0xFFFFFFFFFFFFFFF8;
          v309 = (v308 + 15) & 0xFFFFFFFFFFFFFFF8;
          v395 = (v309 + 15) & 0xFFFFFFFFFFFFFFF8;
          v310 = (v395 + 15) & 0xFFFFFFFFFFFFFFF8;
          v311 = (v310 + 15) & 0xFFFFFFFFFFFFFFF8;
          v312 = (v311 + 15) & 0xFFFFFFFFFFFFFFF8;
          v313 = (_QWORD *)swift_allocObject(&unk_10003DB98, v312 + 16, v305 | 7);
          v314 = v405;
          v313[2] = v284;
          v313[3] = v314;
          v315 = v400;
          v313[4] = v377;
          v313[5] = v315;
          v316 = v376;
          v317 = v402;
          v313[6] = v376;
          v313[7] = v317;
          sub_100027F94((uint64_t)v396, (uint64_t)v313 + v306, &qword_100042B30);
          *(_QWORD *)((char *)v313 + v394) = v399;
          *(_QWORD *)((char *)v313 + v307) = v397;
          *(_QWORD *)((char *)v313 + v308) = v378;
          v318 = (uint64_t)v374;
          *(_QWORD *)((char *)v313 + v309) = v374;
          v319 = v318;
          v320 = (uint64_t (**)())((char *)v313 + v312);
          *(_QWORD *)((char *)v313 + v395) = v379;
          v321 = v380;
          *(_QWORD *)((char *)v313 + v310) = v380;
          v322 = v404;
          *(_QWORD *)((char *)v313 + v311) = v404;
          v323 = (uint64_t (*)())v401;
          *v320 = sub_10000A494;
          v320[1] = v323;
          v396 = (char *)v316;
          swift_retain();
          swift_retain();
          v404 = (char *)v322;
          swift_retain();
          v324 = v321;
          v325 = v405;
          v326 = v399;
          swift_retain();
          v327 = v397;
          swift_retain();
          swift_retain();
          v328 = v319;
          swift_retain();
          v329 = v406;
          v330 = v400;
          v331 = (void *)zalgo.getter(v330);
          v332 = v371;
          v333 = dispatch thunk of Promise.then<A>(on:closure:)(v331, sub_100027FD8, v313, v372);

          swift_release(v375);
          swift_release(v373);
          swift_release(v332);
          swift_release(v333);
          swift_release(v313);

          sub_10000A5D0(v398, &qword_100042B30);
          swift_release(v323);
          swift_release(v379);
          swift_release(v402);
          swift_release(v326);
          swift_release(v327);
          swift_release(v378);
          v334 = v328;
LABEL_86:
          swift_release(v334);
          return;
        }
        goto LABEL_25;
      }
      v343 = v410;
      swift_bridgeObjectRelease(v49);

      v344 = swift_bridgeObjectRelease(object);
      swift_willThrow(v344);
      v410 = v343;
      v223 = v343;
      v345 = sub_10000A430(&qword_100042B68);
      v346 = sub_10000A848(0, &qword_100042B70, NSError_ptr);
      if ((swift_dynamicCast(&v408, &v410, v345, v346, 0) & 1) != 0)
      {

        v347 = v408;
        v348 = v373;
        v349 = v347;
        v350 = v348;
        v351 = v349;
        v352 = Logger.logObject.getter(v351);
        v353 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v352, v353))
        {
          v354 = swift_slowAlloc(22, -1);
          v381 = v27;
          v355 = v354;
          v356 = swift_slowAlloc(8, -1);
          v405 = v351;
          v357 = (NSObject **)v356;
          v406 = (NSObject **)swift_slowAlloc(32, -1);
          v407 = (uint64_t)v350;
          v409 = v406;
          *(_DWORD *)v355 = 138543618;
          v358 = v350;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v407, &v408, v355 + 4, v355 + 12);
          v359 = v357;
          v351 = v405;
          *v359 = v350;

          *(_WORD *)(v355 + 12) = 2082;
          v407 = (uint64_t)v351;
          v360 = sub_1000280C8();
          v361 = Error.rem_errorDescription.getter(v346, v360);
          v363 = v362;
          v407 = sub_10002CB54(v361, v362, (uint64_t *)&v409);
          v52 = v379;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v407, &v408, v355 + 14, v355 + 22);

          swift_bridgeObjectRelease(v363);
          _os_log_impl((void *)&_mh_execute_header, v352, v353, "Smart List found and unable to fetch default list. {result: .failure, smartListID: %{public}@, error: %{public}s}", (uint8_t *)v355, 0x16u);
          v364 = sub_10000A430((uint64_t *)&unk_1000422E0);
          swift_arrayDestroy(v359, 1, v364);
          swift_slowDealloc(v359, -1, -1);
          v365 = v406;
          swift_arrayDestroy(v406, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v365, -1, -1);
          v366 = v355;
          v27 = v381;
          swift_slowDealloc(v366, -1, -1);

        }
        else
        {

        }
        v367 = v404;
        v368 = v376;
        v369 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
        v27[2](v27, v369);

LABEL_84:
        ((void (*)(char *, _QWORD *))v402[1])(v397, v403);
        swift_errorRelease();
        v204 = v401;
        goto LABEL_85;
      }

      swift_errorRelease();
    }
    else
    {
      v401 = v43;
      v222 = v410;
      swift_bridgeObjectRelease(v49);
      swift_bridgeObjectRelease(object);
      v223 = (id)_convertNSErrorToError(_:)(v77);

      ((void (*)(void))swift_willThrow)();
      v52 = v379;
    }
    v410 = v223;
    v224 = sub_10000A430(&qword_100042B68);
    v225 = (void *)sub_10000A848(0, &qword_100042B70, NSError_ptr);
    swift_dynamicCast(&v408, &v410, v224, v225, 0);
    v226 = v408;
    v227 = v378;
    v228 = v226;
    v229 = v227;
    v230 = v228;
    v231 = Logger.logObject.getter(v230);
    v232 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v231, v232))
    {
      v233 = swift_slowAlloc(22, -1);
      v381 = v27;
      v234 = v233;
      v235 = swift_slowAlloc(8, -1);
      v405 = v225;
      v236 = (_QWORD *)v235;
      v406 = (NSObject **)swift_slowAlloc(32, -1);
      v407 = (uint64_t)v229;
      v409 = v406;
      *(_DWORD *)v234 = 138543618;
      v237 = v229;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v407, &v408, v234 + 4, v234 + 12);
      *v236 = v229;

      *(_WORD *)(v234 + 12) = 2082;
      v407 = (uint64_t)v230;
      v238 = sub_1000280C8();
      v239 = Error.rem_errorDescription.getter(v405, v238);
      v241 = v240;
      v407 = sub_10002CB54(v239, v240, (uint64_t *)&v409);
      v52 = v379;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v407, &v408, v234 + 14, v234 + 22);

      swift_bridgeObjectRelease(v241);
      _os_log_impl((void *)&_mh_execute_header, v231, v232, "Error fetching smart list. {listID: %{public}@, error: %{public}s}", (uint8_t *)v234, 0x16u);
      v242 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v236, 1, v242);
      swift_slowDealloc(v236, -1, -1);
      v243 = v406;
      swift_arrayDestroy(v406, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v243, -1, -1);
      v244 = v234;
      v27 = v381;
      swift_slowDealloc(v244, -1, -1);

    }
    else
    {

    }
    v337 = v404;
    v338 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
    v27[2](v27, v338);

    goto LABEL_84;
  }
LABEL_25:
  v98 = v399;
  UUID.init(uuidString:)(countAndFlagsBits, object);
  v99 = object;
  v100 = (uint64_t)v98;
  swift_bridgeObjectRelease(v99);
  v101 = v402;
  v102 = v98;
  v103 = v403;
  if (((unsigned int (*)(os_log_t, uint64_t, _QWORD *))v402[6])(v102, 1, v403) != 1)
  {
    v101[4](v400, v100, v103);
    v134 = (void *)objc_opt_self(REMList);
    v135 = UUID._bridgeToObjectiveC()().super.isa;
    v136 = (char *)objc_msgSend(v134, "objectIDWithUUID:", v135);

    v137 = *(NSObject **)((char *)v44 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store);
    v410 = 0;
    v138 = objc_msgSend(v137, "fetchListWithObjectID:error:", v136, &v410);
    v139 = v410;
    if (!v138)
    {
      v379 = v52;
      v163 = v410;
      swift_bridgeObjectRelease(v49);
      v164 = (void *)_convertNSErrorToError(_:)(v139);

      swift_willThrow(v165);
      v410 = v164;
      v166 = sub_10000A430(&qword_100042B68);
      v167 = (void *)sub_10000A848(0, &qword_100042B70, NSError_ptr);
      swift_dynamicCast(&v408, &v410, v166, v167, 0);
      v168 = v408;
      v169 = v136;
      v170 = v168;
      v171 = v169;
      v172 = v170;
      v173 = Logger.logObject.getter(v172);
      v174 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v173, v174))
      {
        v175 = swift_slowAlloc(22, -1);
        v381 = v27;
        v176 = v175;
        v177 = swift_slowAlloc(8, -1);
        v405 = v167;
        v178 = (_QWORD *)v177;
        v406 = (NSObject **)swift_slowAlloc(32, -1);
        v407 = (uint64_t)v171;
        v409 = v406;
        *(_DWORD *)v176 = 138543618;
        v401 = v43;
        v179 = v171;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v407, &v408, v176 + 4, v176 + 12);
        *v178 = v171;

        *(_WORD *)(v176 + 12) = 2082;
        v407 = (uint64_t)v172;
        v180 = sub_1000280C8();
        v181 = Error.rem_errorDescription.getter(v405, v180);
        v183 = v182;
        v407 = sub_10002CB54(v181, v182, (uint64_t *)&v409);
        v43 = v401;
        v51 = v404;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v407, &v408, v176 + 14, v176 + 22);

        swift_bridgeObjectRelease(v183);
        _os_log_impl((void *)&_mh_execute_header, v173, v174, "Unable to fetch list. {result: .failure, listID: %{public}@, error: %{public}s}", (uint8_t *)v176, 0x16u);
        v184 = sub_10000A430((uint64_t *)&unk_1000422E0);
        swift_arrayDestroy(v178, 1, v184);
        swift_slowDealloc(v178, -1, -1);
        v185 = v406;
        swift_arrayDestroy(v406, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v185, -1, -1);
        v186 = v176;
        v27 = v381;
        swift_slowDealloc(v186, -1, -1);

      }
      else
      {

      }
      v335 = v403;
      v336 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
      v27[2](v27, v336);

      ((void (*)(char *, _QWORD *))v402[1])(v400, v335);
      swift_errorRelease();
      swift_release(v43);
      v334 = v379;
      goto LABEL_86;
    }
    v121 = v138;
    v140 = Logger.logObject.getter(v139);
    v141 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v140, v141))
    {
      v381 = v27;
      v142 = (uint8_t *)swift_slowAlloc(12, -1);
      v143 = swift_slowAlloc(8, -1);
      v397 = v136;
      v144 = (_QWORD *)v143;
      v399 = v140;
      *(_DWORD *)v142 = 138543362;
      v145 = v49;
      v146 = v52;
      v147 = v43;
      v148 = objc_msgSend(v121, "objectID");
      v410 = v148;
      v27 = v381;
      v140 = v399;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v142 + 4, v142 + 12);
      *v144 = v148;
      v43 = v147;
      v52 = v146;
      v49 = v145;

      _os_log_impl((void *)&_mh_execute_header, v140, v141, "Successfully fetched list {listID: %{public}@}", v142, 0xCu);
      v149 = sub_10000A430((uint64_t *)&unk_1000422E0);
      v150 = v144;
      v151 = v397;
      swift_arrayDestroy(v150, 1, v149);
      v51 = v404;
      swift_slowDealloc(v150, -1, -1);
      v152 = v142;
      v44 = v406;
      swift_slowDealloc(v152, -1, -1);
    }
    else
    {

      v151 = (char *)v121;
    }

    ((void (*)(char *, _QWORD *))v402[1])(v400, v403);
    v403 = 0;
    goto LABEL_52;
  }
  sub_10000A5D0(v100, (uint64_t *)&unk_100042B38);
LABEL_27:
  v104 = v49;
  v105 = *(NSObject **)((char *)v44 + OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_store);
  v106 = sub_100022E58(v105);
  if (v106)
  {
    v107 = v106;
    v108 = objc_msgSend(v51, "title");
    v109 = objc_msgSend(v108, "spokenPhrase");

    if (!v109)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v111 = v110;
      v109 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v111);
    }
    v112 = objc_msgSend(objc_allocWithZone((Class)REMSaveRequest), "initWithStore:", v105);
    v402 = (void (**)(char *, uint64_t, _QWORD *))objc_msgSend(v112, "updateAccount:", v107);
    v113 = objc_msgSend(v112, "addListWithName:toAccountChangeItem:", v109);

    v410 = 0;
    v403 = v112;
    v114 = objc_msgSend(v112, "saveSynchronouslyWithError:", &v410);
    v115 = v410;
    if (v114)
    {
      v381 = v27;
      v116 = v410;
      v117 = objc_msgSend(v113, "objectID");
      v410 = 0;
      v118 = objc_msgSend(v105, "fetchListWithObjectID:error:", v117, &v410);

      v115 = v410;
      if (v118)
      {
        v401 = v43;
        v119 = v118;
        v120 = v107;
        v121 = v119;
        v122 = v120;
        v123 = Logger.logObject.getter(v115);
        v124 = static os_log_type_t.default.getter();
        v125 = v124;
        if (os_log_type_enabled(v123, v124))
        {
          v126 = swift_slowAlloc(22, -1);
          LODWORD(v400) = v125;
          v127 = v126;
          v128 = swift_slowAlloc(16, -1);
          v399 = v123;
          v129 = (_QWORD *)v128;
          *(_DWORD *)v127 = 138543618;
          v130 = objc_msgSend(v121, "objectID");
          v410 = v130;
          v379 = v52;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v127 + 4, v127 + 12);
          *v129 = v130;

          *(_WORD *)(v127 + 12) = 2112;
          v410 = v122;
          v131 = v122;
          v52 = v379;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v127 + 14, v127 + 22);
          v129[1] = v107;

          v132 = v399;
          _os_log_impl((void *)&_mh_execute_header, v399, (os_log_type_t)v400, "Successfully created new list {listID: %{public}@, account: %@}", (uint8_t *)v127, 0x16u);
          v133 = sub_10000A430((uint64_t *)&unk_1000422E0);
          swift_arrayDestroy(v129, 2, v133);
          swift_slowDealloc(v129, -1, -1);
          swift_slowDealloc(v127, -1, -1);

        }
        else
        {

        }
        v403 = 0;
        v43 = v401;
        v27 = v381;
        v51 = v404;
        v44 = v406;
        v49 = v104;
        goto LABEL_52;
      }
      v27 = v381;
    }
    v187 = v115;
    swift_bridgeObjectRelease(v104);
    v188 = (NSObject **)_convertNSErrorToError(_:)(v115);

    swift_willThrow(v189);
    v190 = v107;
    v191 = v113;
    v192 = Logger.logObject.getter(v191);
    v193 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v192, v193))
    {
      v194 = swift_slowAlloc(22, -1);
      v195 = swift_slowAlloc(16, -1);
      v401 = v43;
      v196 = (_QWORD *)v195;
      *(_DWORD *)v194 = 138543618;
      v379 = v52;
      v197 = -[NSObject objectID](v191, "objectID");
      v381 = v27;
      v198 = v197;
      v410 = v197;
      v405 = v107;
      v406 = v188;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v194 + 4, v194 + 12);
      *v196 = v198;

      *(_WORD *)(v194 + 12) = 2112;
      v410 = v190;
      v199 = v191;
      v200 = v190;
      v27 = v381;
      v52 = v379;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v194 + 14, v194 + 22);
      v196[1] = v405;

      v191 = v199;
      _os_log_impl((void *)&_mh_execute_header, v192, v193, "Error creating new list. {listID: %{public}@, account: %@, result: .failure}", (uint8_t *)v194, 0x16u);
      v201 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v196, 2, v201);
      v202 = v196;
      v43 = v401;
      swift_slowDealloc(v202, -1, -1);
      swift_slowDealloc(v194, -1, -1);
    }
    else
    {

      v192 = v191;
    }

    v203 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 4, 0);
    v27[2](v27, v203);

    swift_errorRelease();
    v204 = v43;
LABEL_85:
    swift_release(v204);
    v334 = v52;
    goto LABEL_86;
  }
  swift_bridgeObjectRelease(v49);
  v153 = v380;
  v154 = Logger.logObject.getter(v153);
  v155 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v154, v155))
  {
    v156 = (uint8_t *)swift_slowAlloc(12, -1);
    v157 = (NSObject **)swift_slowAlloc(8, -1);
    v381 = v27;
    v406 = v157;
    *(_DWORD *)v156 = 138412290;
    v410 = v153;
    v158 = v52;
    v159 = v153;
    v51 = v404;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v410, v411, v156 + 4, v156 + 12);
    v160 = v406;
    *v406 = v153;

    v52 = v158;
    _os_log_impl((void *)&_mh_execute_header, v154, v155, "Unable to create list because there is no default account. {intent: %@, result: .failureRequiringAppLaunch}", v156, 0xCu);
    v161 = sub_10000A430((uint64_t *)&unk_1000422E0);
    swift_arrayDestroy(v160, 1, v161);
    v27 = v381;
    swift_slowDealloc(v160, -1, -1);
    swift_slowDealloc(v156, -1, -1);
  }
  else
  {

    v154 = v153;
  }

  v162 = objc_msgSend(objc_allocWithZone((Class)INAddTasksIntentResponse), "initWithCode:userActivity:", 5, 0);
  v27[2](v27, v162);
  swift_release(v43);
  swift_release(v52);

}

uint64_t sub_100027CEC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100027D10()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100027D34(void **a1)
{
  uint64_t v1;

  sub_10001FE3C(a1, v1);
}

uint64_t sub_100027D4C()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100027D80(void **a1, double a2)
{
  uint64_t *v2;

  return sub_10001FE9C(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_100027D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v1 = *(_QWORD *)(sub_10000A430(&qword_100042B30) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 64) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 56));
  v5 = v0 + v3;
  v6 = (int *)type metadata accessor for TTRRecurrenceRuleModel(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v6 - 1) + 48))(v0 + v3, 1, v6))
  {
    v7 = type metadata accessor for TTRRecurrenceEndModel(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v0 + v3, 1, v7)
      && !swift_getEnumCaseMultiPayload(v0 + v3, v7))
    {
      v8 = type metadata accessor for Date(0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v3, v8);
    }
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + v6[8]));
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + v6[9]));
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + v6[10]));
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + v6[11]));
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + v6[12]));
    swift_bridgeObjectRelease(*(_QWORD *)(v5 + v6[13]));
  }
  v9 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF8;
  v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + v9));
  swift_release(*(_QWORD *)(v0 + v10));
  swift_release(*(_QWORD *)(v0 + v11));
  swift_release(*(_QWORD *)(v0 + v12));
  swift_release(*(_QWORD *)(v0 + v13));

  swift_release(*(_QWORD *)(v0 + v16 + 8));
  return swift_deallocObject(v0, v16 + 16, v2 | 7);
}

uint64_t sub_100027F94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000A430(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_100027FD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double v10;

  v3 = *(_QWORD *)(sub_10000A430(&qword_100042B30) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_1000200A8(v10, a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + v6), *(_QWORD *)(v1 + v7), *(_QWORD *)(v1 + v8), *(_QWORD *)(v1 + v9), *(NSObject **)(v1 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(void))(v1+ ((((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

unint64_t sub_1000280C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042B78;
  if (!qword_100042B78)
  {
    v1 = sub_10000A848(255, &qword_100042B70, NSError_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSError, v1);
    atomic_store(result, (unint64_t *)&qword_100042B78);
  }
  return result;
}

void sub_100028120(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_100020940(a1, *(void **)(v2 + 24), *(void **)(v2 + 32), *(_QWORD **)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(void ***)(v2 + 64), a2, *(void ***)(v2 + 72), *(_QWORD **)(v2 + 80), *(void ***)(v2 + 88), *(_QWORD *)(v2 + 96), *(id *)(v2 + 104));
}

uint64_t sub_100028164(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000281A4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000281E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000A430(&qword_100042B58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100028228(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_100028238(_QWORD *a1)
{
  uint64_t v1;

  sub_10001F9AC(a1, *(void (**)(void))(v1 + 16));
}

void sub_100028250(uint64_t a1)
{
  uint64_t v1;

  sub_10001FB98(a1, *(void (**)(void))(v1 + 16));
}

void sub_100028258(uint64_t a1)
{
  uint64_t v1;

  sub_10001F86C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100028260()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

void sub_1000282A4(uint64_t a1)
{
  uint64_t v1;

  sub_10001D638(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(NSObject **)(v1 + 32), *(_QWORD *)(v1 + 40), *(void (**)(_QWORD))(v1 + 48));
}

uint64_t sub_1000282B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_1000282E0(uint64_t a1)
{
  uint64_t v1;

  sub_10001CA60(a1, *(_QWORD *)(v1 + 16), *(void (**)(_QWORD))(v1 + 24));
}

unint64_t sub_1000282EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042C10;
  if (!qword_100042C10)
  {
    v1 = sub_10000A658(&qword_1000425C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100042C10);
  }
  return result;
}

void sub_100028360(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  swift_bridgeObjectRetain_n(a4, 2);
  v10 = swift_bridgeObjectRetain_n(a5, 2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.fault.getter();
  v26 = a1;
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(32, -1);
    v24 = swift_slowAlloc(96, -1);
    v28 = v24;
    *(_DWORD *)v13 = 136446722;
    v14 = StaticString.description.getter(a1, a2, a3);
    v16 = v15;
    v27 = sub_10002CB54(v14, v15, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v16);
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    v25 = a3;
    v17 = Dictionary.description.getter(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v19 = v18;
    swift_bridgeObjectRelease(a4);
    v27 = sub_10002CB54(v17, v19, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v13 + 14, v13 + 22);
    swift_bridgeObjectRelease_n(a4, 2);
    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v13 + 22) = 2082;
    v20 = swift_bridgeObjectRetain(a5);
    v21 = Dictionary.description.getter(v20, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    a3 = v22;
    swift_bridgeObjectRelease(a5);
    v27 = sub_10002CB54(v21, a3, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v13 + 24, v13 + 32);
    swift_bridgeObjectRelease_n(a5, 2);
    v23 = a3;
    LOBYTE(a3) = v25;
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}s; UserInfo=%s; PublicUserInfo=%{public}s",
      (uint8_t *)v13,
      0x20u);
    swift_arrayDestroy(v24, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a5, 2);
    swift_bridgeObjectRelease_n(a4, 2);
  }

  if ((a3 & 1) != 0)
    goto LABEL_7;
  if (v26)
  {
    rdi_os_crash();
LABEL_7:
    __break(1u);
  }
  __break(1u);
}

void sub_1000285E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[56];

  static REM_os_activity.labelUserAction(_:dso:)(a1, a2, a3, &_mh_execute_header);
  v8 = sub_10000A430(&qword_100042C28);
  inited = swift_initStackObject(v8, v28);
  *(_OWORD *)(inited + 16) = xmmword_100034880;
  type metadata accessor for Analytics(0);
  *(_QWORD *)(inited + 32) = 0x696669746E656449;
  *(_QWORD *)(inited + 40) = 0xEA00000000007265;
  StaticString.description.getter(a1, a2, a3);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(inited + 48) = v12;
  v13 = sub_10001C8B8(inited);
  static Analytics.postEvent(_:payload:duration:)(0xD00000000000001CLL, 0x8000000100035AB0, v13, 0, 1);
  swift_bridgeObjectRelease(v13);
  if (qword_100042080 != -1)
    swift_once(&qword_100042080, sub_1000288C8);
  v14 = type metadata accessor for Logger(0);
  sub_10000A4A4(v14, (uint64_t)qword_100043270);
  v15 = swift_bridgeObjectRetain_n(a4, 2);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(22, -1);
    v19 = swift_slowAlloc(64, -1);
    v27 = v19;
    *(_DWORD *)v18 = 136446466;
    v20 = StaticString.description.getter(a1, a2, a3);
    v22 = v21;
    v26 = sub_10002CB54(v20, v21, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    v23 = Dictionary.description.getter(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v25 = v24;
    swift_bridgeObjectRelease(a4);
    v26 = sub_10002CB54(v23, v25, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v18 + 14, v18 + 22);
    swift_bridgeObjectRelease_n(a4, 2);
    swift_bridgeObjectRelease(v25);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}s; UserInfo=%s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy(v19, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v18, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a4, 2);
  }
}

uint64_t sub_1000288C8(uint64_t a1)
{
  return sub_100028904(a1, qword_100043270, (SEL *)&selRef_userAction);
}

uint64_t sub_1000288DC(uint64_t a1)
{
  return sub_100028904(a1, qword_100043288, (SEL *)&selRef_utility);
}

uint64_t sub_1000288F0(uint64_t a1)
{
  return sub_100028904(a1, qword_1000432A0, (SEL *)&selRef_siriKit);
}

uint64_t sub_100028904(uint64_t a1, uint64_t *a2, SEL *a3)
{
  uint64_t v5;
  id v6;

  v5 = type metadata accessor for Logger(0);
  sub_10000A808(v5, a2);
  sub_10000A4A4(v5, (uint64_t)a2);
  v6 = objc_msgSend((id)objc_opt_self(REMLog), *a3);
  return Logger.init(_:)(v6);
}

uint64_t sub_100028974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042C30);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042C30);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100028A04(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100028A3C(a1, a2, a3, &OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_timeProvider, INSetTaskAttributeTemporalEventTriggerResolutionResult_ptr, &qword_100042C58);
}

void sub_100028A20(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100028A3C(a1, a2, a3, &OBJC_IVAR____TtC25RemindersIntentsExtension24TTRAddTasksIntentHandler_timeProvider, INAddTasksTemporalEventTriggerResolutionResult_ptr, &qword_100042C48);
}

void sub_100028A3C(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5, unint64_t *a6)
{
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t *p_align;
  uint8_t *v17;
  _DWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  unint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  id v39;
  uint64_t v40;
  uint8_t *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  id v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  id v59;
  _DWORD *v60;
  uint8_t *buf;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  if (qword_100042098 != -1)
    swift_once(&qword_100042098, sub_100028974);
  v12 = type metadata accessor for Logger(0);
  sub_10000A4A4(v12, (uint64_t)qword_100042C30);
  v13 = a1;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  p_align = &stru_100040FE8.align;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v62 = swift_slowAlloc(32, -1);
    v68 = v62;
    v64 = a5;
    *(_DWORD *)v17 = 136315138;
    v18 = v17 + 12;
    v60 = v17 + 4;
    buf = v17;
    v19 = a2;
    v20 = a4;
    v21 = a6;
    v22 = objc_msgSend(v13, "temporalEventTrigger");
    v23 = sub_10000A430(&qword_100042C50);
    v24 = Optional.descriptionOrNil.getter(v23);
    v66 = a3;
    v26 = v25;

    a6 = v21;
    a4 = v20;
    a2 = v19;
    v27 = v24;
    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    v67 = sub_10002CB54(v27, v26, &v68);
    v28 = v18;
    a5 = v64;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v60, v28);

    v29 = v26;
    a3 = v66;
    swift_bridgeObjectRelease(v29);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "SiriKit asked for resolving temporalEventTrigger {temporalEventTrigger: %s}", buf, 0xCu);
    swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v62, -1, -1);
    swift_slowDealloc(buf, -1, -1);

  }
  else
  {

  }
  v30 = objc_msgSend(v13, *((SEL *)p_align + 172));
  if (v30)
  {
    v31 = v30;
    v32 = (void *)INTemporalEventTrigger.validate(timeProvider:)(a2 + *a4);
    v33 = v32;
    if ((v34 & 1) != 0)
    {
      if ((_BYTE)v32)
      {
        if (v32 == 1)
        {
          v46 = Logger.logObject.getter(v32);
          v47 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v46, v47))
          {
            v48 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v48 = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, v47, ".temporalEventTrigger.recurrenceRule is not supported {result: .unsupported(.invalidRecurrence)}", v48, 2u);
            swift_slowDealloc(v48, -1, -1);
          }

          v49 = objc_msgSend((id)objc_opt_self(*a5), "unsupportedForReason:", 2);
        }
        else
        {
          v55 = Logger.logObject.getter(v32);
          v56 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v55, v56))
          {
            v57 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v57 = 0;
            _os_log_impl((void *)&_mh_execute_header, v55, v56, ".temporalEventTrigger could not be converted into a dueDate, ignoring it {result: .notRequired}", v57, 2u);
            swift_slowDealloc(v57, -1, -1);
          }

          v58 = sub_10000A848(0, a6, a5);
          v49 = objc_msgSend((id)swift_getObjCClassFromMetadata(v58), "notRequired");
        }
      }
      else
      {
        v52 = Logger.logObject.getter(v32);
        v53 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v52, v53))
        {
          v54 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v54 = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, v53, ".temporalEventTrigger would create a due date in the past {result: .unsupported(.timeInPast)}", v54, 2u);
          swift_slowDealloc(v54, -1, -1);
        }

        v49 = objc_msgSend((id)objc_opt_self(*a5), "unsupportedForReason:", 1);
      }
      v59 = v49;
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v59);

      v31 = v59;
    }
    else
    {
      v35 = v32;
      v36 = Logger.logObject.getter(v35);
      v37 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v36, v37))
      {
        v65 = v35;
        v38 = (uint8_t *)swift_slowAlloc(12, -1);
        v63 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v38 = 138412290;
        v68 = (uint64_t)v65;
        v39 = v65;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v38 + 4, v38 + 12);
        *v63 = v33;
        sub_1000290DC(v33, 0);
        sub_1000290DC(v33, 0);
        _os_log_impl((void *)&_mh_execute_header, v36, v37, ".temporalEventTrigger resolved to a valid date {result: .success(with: %@)}", v38, 0xCu);
        v40 = sub_10000A430((uint64_t *)&unk_1000422E0);
        swift_arrayDestroy(v63, 1, v40);
        swift_slowDealloc(v63, -1, -1);
        v41 = v38;
        v35 = v65;
        swift_slowDealloc(v41, -1, -1);
      }
      else
      {
        sub_1000290DC(v33, 0);
        sub_1000290DC(v33, 0);
      }

      v50 = sub_10000A848(0, a6, a5);
      v51 = objc_msgSend((id)swift_getObjCClassFromMetadata(v50), "successWithResolvedTemporalEventTrigger:", v35);
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v51);

      sub_1000290DC(v33, 0);
    }
  }
  else
  {
    v42 = Logger.logObject.getter(0);
    v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, ".temporalEventTrigger is nil {result: .notRequired}", v44, 2u);
      swift_slowDealloc(v44, -1, -1);
    }

    v45 = sub_10000A848(0, a6, a5);
    v31 = objc_msgSend((id)swift_getObjCClassFromMetadata(v45), "notRequired");
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v31);
  }

}

void sub_1000290DC(id a1, char a2)
{
  if ((a2 & 1) == 0)

}

uint64_t sub_1000290E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042C60);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042C60);
  if (qword_100042088 != -1)
    swift_once(&qword_100042088, sub_1000288DC);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_100043288);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100029178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, void *a7)
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[5];
  _QWORD *v20;

  v12 = swift_allocObject(&unk_10003DD28, 32, 7);
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  v13 = swift_retain(a2);
  v14 = (void *)a5(v13);
  v15 = (_QWORD *)swift_allocObject(&unk_10003DD50, 56, 7);
  v15[2] = sub_10000EE30;
  v15[3] = v12;
  v15[4] = a7;
  v15[5] = a5;
  v15[6] = a6;
  v19[4] = sub_1000295E0;
  v20 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v19[2] = sub_1000295F0;
  v19[3] = &unk_10003DD68;
  v16 = _Block_copy(v19);
  v17 = v20;
  v18 = a7;
  swift_retain(a6);
  swift_release(v17);
  objc_msgSend(v14, "requestAccessForEntityType:completionHandler:", 0, v16);
  _Block_release(v16);

}

uint64_t sub_100029290()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1000292B4(char a1, uint64_t a2, void (*a3)(id), uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[3];
  _BYTE v26[8];
  uint64_t v27;

  if (a2)
  {
    swift_errorRetain();
    if (qword_1000420A0 != -1)
      swift_once(&qword_1000420A0, sub_1000290E8);
    v8 = type metadata accessor for Logger(0);
    sub_10000A4A4(v8, (uint64_t)qword_100042C60);
    swift_errorRetain();
    v9 = swift_errorRetain();
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v27 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_getErrorValue(a2, v26, v25);
      v14 = Error.localizedDescription.getter(v25[1], v25[2]);
      v16 = v15;
      v24 = sub_10002CB54(v14, v15, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, v25, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease(v16);
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error requesting permission for CNContactStore {error: %s}", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    a3(0);
    swift_errorRelease();
  }
  else if ((a1 & 1) != 0)
  {
    v17 = (void *)a6();
    v23 = (id)INPerson.contactRepresentation(contactStore:)();

    a3(v23);
  }
  else
  {
    if (qword_1000420A0 != -1)
      swift_once(&qword_1000420A0, sub_1000290E8);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_10000A4A4(v18, (uint64_t)qword_100042C60);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Permission not granted for accessing CNContactStore {granted: false}", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    a3(0);
  }
}

uint64_t sub_1000295AC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_1000295E0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000292B4(a1, a2, *(void (**)(id))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(uint64_t (**)(void))(v2 + 40));
}

void sub_1000295F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  id v7;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

uint64_t sub_100029650(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100029660(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

_QWORD *initializeBufferWithCopyOfBuffer for TTRContactRepresentationResolver(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for TTRContactRepresentationResolver(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for TTRContactRepresentationResolver(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

uint64_t assignWithTake for TTRContactRepresentationResolver(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRContactRepresentationResolver(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRContactRepresentationResolver(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TTRContactRepresentationResolver()
{
  return &type metadata for TTRContactRepresentationResolver;
}

_QWORD *sub_10002979C(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  return sub_1000297B0(a1, a2, a3);
}

_QWORD *sub_1000297B0(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  result = _swiftEmptyArrayStorage;
  if (v6)
  {
    v17 = _swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v6);
    v9 = *(_QWORD *)(type metadata accessor for REMSearchCriterion(0) - 8);
    v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v11 = *(_QWORD *)(v9 + 72);
    while (1)
    {
      v12 = a1(&v16, v10);
      if (v4)
        break;
      v4 = 0;
      v13 = v16;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
      v14 = v17[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
      v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v13);
      specialized ContiguousArray._endMutation()(v15);
      v10 += v11;
      if (!--v6)
        return v17;
    }
    return (_QWORD *)swift_release(v17);
  }
  return result;
}

_QWORD *sub_1000298B8(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;

  v4 = v3;
  if ((unint64_t)a3 >> 62)
    goto LABEL_16;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = _swiftEmptyArrayStorage;
    if (!v7)
      break;
    v19 = _swiftEmptyArrayStorage;
    result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v7);
    if (v7 < 0)
    {
      __break(1u);
      return result;
    }
    v9 = 0;
    while (v7 != v9)
    {
      if ((a3 & 0xC000000000000001) != 0)
        v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, a3);
      else
        v10 = *(id *)(a3 + 8 * v9 + 32);
      v11 = v10;
      v17 = v10;
      a1(&v18, &v17);

      if (v4)
        return (_QWORD *)swift_release(v19);
      ++v9;
      v13 = v18;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
      v14 = v19[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
      v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v13);
      specialized ContiguousArray._endMutation()(v15);
      if (v7 == v9)
        return v19;
    }
    __break(1u);
LABEL_16:
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
  }
  return result;
}

void sub_100029A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100029A3C(a1, a2, a3, (_QWORD *(*)(uint64_t *__return_ptr, uint64_t))sub_10002E304, (uint64_t)&unk_10003E020, (uint64_t)sub_10002E3A4);
}

void sub_100029A3C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, uint64_t), uint64_t a5, uint64_t a6)
{
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  _QWORD *v19;
  uint64_t v20;

  v18[2] = &v20;
  v10 = sub_1000297B0(a4, (uint64_t)v18, a1);
  sub_10000A430(&qword_100042DA8);
  v19 = v10;
  v11 = sub_10000A430(&qword_100042DB0);
  v12 = sub_10002D71C();
  v13 = static Promise.all<A>(_:)(&v19, v11, v12);
  swift_bridgeObjectRelease(v10);
  v14 = swift_allocObject(a5, 32, 7);
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  v15 = swift_retain(a3);
  v16 = (void *)zalgo.getter(v15);
  v17 = dispatch thunk of Promise.then<A>(on:closure:)(v16, a6, v14, (char *)&type metadata for () + 8);
  swift_release(v17);
  swift_release(v13);
  swift_release(v14);

}

uint64_t sub_100029B4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042C78);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042C78);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100029BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  _QWORD *v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v4 = v3;
  v8 = type metadata accessor for REMSearchCriterion(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v62 - v13;
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v62 = v4;
    v63 = a2;
    v64 = a3;
    v16 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v17 = enum case for REMSearchCriterion.textualField(_:);
    v18 = a1;
    v19 = *(_QWORD *)(v9 + 72);
    v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v65 = v18;
    swift_bridgeObjectRetain(v18);
    while (1)
    {
      v20(v14, v16, v8);
      v20(v11, (uint64_t)v14, v8);
      if ((*(unsigned int (**)(char *, uint64_t))(v9 + 88))(v11, v8) == v17)
        break;
      v21 = *(void (**)(char *, uint64_t))(v9 + 8);
      v21(v11, v8);
      v21(v14, v8);
      v16 += v19;
      if (!--v15)
      {
        a1 = v65;
        swift_bridgeObjectRelease(v65);
        a2 = v63;
        a3 = v64;
        v4 = v62;
        goto LABEL_6;
      }
    }
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    swift_bridgeObjectRelease(*((_QWORD *)v11 + 1));
    v30 = &v11[*(int *)(sub_10000A430(&qword_1000422D8) + 48)];
    v31 = type metadata accessor for REMStringMatchingStyle(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v30, v31);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    v32 = v65;
    swift_bridgeObjectRelease(v65);
    if (qword_1000420A8 != -1)
      swift_once(&qword_1000420A8, sub_100029B4C);
    v33 = type metadata accessor for Logger(0);
    sub_10000A4A4(v33, (uint64_t)qword_100042C78);
    v34 = swift_bridgeObjectRetain_n(v32, 2);
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.default.getter();
    v37 = os_log_type_enabled(v35, v36);
    v38 = v62;
    if (v37)
    {
      v39 = (uint8_t *)swift_slowAlloc(12, -1);
      v40 = swift_slowAlloc(32, -1);
      v67 = v40;
      *(_DWORD *)v39 = 136315138;
      swift_bridgeObjectRetain(v65);
      v41 = Array.description.getter(v65, v8);
      v43 = v42;
      swift_bridgeObjectRelease(v65);
      v66 = sub_10002CB54(v41, v43, &v67);
      v32 = v65;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v39 + 4, v39 + 12);
      swift_bridgeObjectRelease_n(v32, 2);
      swift_bridgeObjectRelease(v43);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Querying Spotlight for reminders {criteria: %s}", v39, 0xCu);
      swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1, -1);
      swift_slowDealloc(v39, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v32, 2);
    }
    type metadata accessor for TTRSearchResultCollector(0);
    v44 = sub_10000A430(&qword_100042DC0);
    v45 = type metadata accessor for REMSearchableItemType(0);
    v46 = *(_QWORD *)(v45 - 8);
    v47 = *(unsigned __int8 *)(v46 + 80);
    v48 = (v47 + 32) & ~v47;
    v49 = swift_allocObject(v44, v48 + *(_QWORD *)(v46 + 72), v47 | 7);
    *(_OWORD *)(v49 + 16) = xmmword_100034880;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v46 + 104))(v49 + v48, enum case for REMSearchableItemType.reminder(_:), v45);
    sub_10000A848(0, (unint64_t *)&qword_1000420C0, OS_dispatch_queue_ptr);
    v50 = (void *)static OS_dispatch_queue.main.getter();
    v51 = static TTRSearchResultCollector.promise(criteria:itemTypes:attributesToFetch:queue:)(v32, v49, _swiftEmptyArrayStorage, v50);
    swift_bridgeObjectRelease(v49);

    v52 = (_QWORD *)swift_allocObject(&unk_10003DFD0, 48, 7);
    v52[2] = v32;
    v52[3] = v38;
    v54 = v63;
    v53 = v64;
    v52[4] = v63;
    v52[5] = v53;
    swift_bridgeObjectRetain(v32);
    swift_retain();
    v55 = swift_retain();
    v56 = (void *)zalgo.getter(v55);
    v57 = dispatch thunk of Promise.then<A>(on:closure:)(v56, sub_10002DFA8, v52, (char *)&type metadata for () + 8);
    swift_release(v51);
    swift_release(v52);

    v58 = (_QWORD *)swift_allocObject(&unk_10003DFF8, 40, 7);
    v58[2] = v32;
    v58[3] = v54;
    v58[4] = v53;
    swift_bridgeObjectRetain(v32);
    v59 = swift_retain();
    v60 = (void *)zalgo.getter(v59);
    v61 = dispatch thunk of Promise.error(on:closure:)(v60, sub_10002DFF4, v58);
    swift_release(v61);
    swift_release(v57);
    swift_release(v58);

  }
  else
  {
LABEL_6:
    if (qword_1000420A8 != -1)
      swift_once(&qword_1000420A8, sub_100029B4C);
    v22 = type metadata accessor for Logger(0);
    v23 = sub_10000A4A4(v22, (uint64_t)qword_100042C78);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Criteria does not contain a text search, using fallback data source", v26, 2u);
      swift_slowDealloc(v26, -1, -1);
    }

    v27 = v4 + 4;
    v29 = v4[7];
    v28 = v4[8];
    sub_10000A4BC(v27, v29);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 24))(a1, a2, a3, v29, v28);
  }
}

uint64_t sub_10002A1A4(uint64_t *a1, uint64_t a2, _QWORD *a3, void (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  Class isa;
  id v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t, uint64_t);
  id *v67;
  char *v68;
  uint64_t v69;
  uint64_t (*v70)(id *, uint64_t);
  int v71;
  void (*v72)(id *, uint64_t);
  uint64_t v73;
  id v74;
  uint64_t v75;
  char *v77;
  void (*v78)(char *, uint64_t);
  void (*v79)(char *, char *, uint64_t);
  char *v80;
  char *v81;
  void **v82;
  int v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  char v89;
  void (*v90)(char *, uint64_t);
  char v91;
  uint64_t v92;
  char *v93;
  NSObject *v94;
  os_log_type_t v95;
  _BOOL4 v96;
  uint8_t *v97;
  uint8_t *v98;
  char *v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  char *v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint8_t *v106;
  uint64_t v107;
  void *v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  void (*v113)(char *, uint64_t);
  void (*v114)(char *, uint64_t);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  os_log_type_t v119;
  uint8_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(id *, uint64_t);
  uint64_t v126;
  char *v127;
  char *v128;
  void **v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  id *v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  void (*v141)(uint64_t);
  _QWORD *v142;
  uint64_t v143;
  uint64_t v144;
  void (*v145)(char *, uint64_t);
  uint64_t v146;
  id v147;

  v139 = a5;
  v141 = a4;
  v9 = type metadata accessor for REMSearchCriterion.Inclusion(0);
  v131 = *(_QWORD *)(v9 - 8);
  v132 = v9;
  __chkstk_darwin(v9);
  v127 = (char *)&v124 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v128 = (char *)&v124 - v12;
  __chkstk_darwin(v13);
  v15 = (char *)&v124 - v14;
  v143 = type metadata accessor for REMSearchCriterion(0);
  v136 = *(_QWORD *)(v143 - 8);
  __chkstk_darwin(v143);
  v129 = (void **)((char *)&v124 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  v135 = (id *)((char *)&v124 - v18);
  __chkstk_darwin(v19);
  v134 = (char *)&v124 - v20;
  __chkstk_darwin(v21);
  v23 = (char *)&v124 - v22;
  __chkstk_darwin(v24);
  v130 = (char *)&v124 - v25;
  v26 = *a1;
  v27 = swift_bridgeObjectRetain(v26);
  v28 = sub_10002D2CC(v27);
  swift_bridgeObjectRelease(v26);
  if (qword_1000420A8 != -1)
    swift_once(&qword_1000420A8, sub_100029B4C);
  v29 = type metadata accessor for Logger(0);
  v30 = sub_10000A4A4(v29, (uint64_t)qword_100042C78);
  swift_retain_n(v28, 4);
  v31 = swift_bridgeObjectRetain_n(a2, 2);
  v133 = v30;
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.default.getter();
  v34 = os_log_type_enabled(v32, (os_log_type_t)v33);
  v144 = a2;
  v140 = v5;
  v142 = a3;
  if (v34)
  {
    v137 = v15;
    LODWORD(v145) = v33;
    v35 = swift_slowAlloc(32, -1);
    v36 = (void *)swift_slowAlloc(64, -1);
    v147 = v36;
    *(_DWORD *)v35 = 134218498;
    v138 = v23;
    v126 = (uint64_t)v36;
    if (((unint64_t)v28 & 0x8000000000000000) != 0 || ((unint64_t)v28 & 0x4000000000000000) != 0)
    {
      v37 = v32;
      v123 = swift_bridgeObjectRetain(v28);
      v38 = _CocoaArrayWrapper.endIndex.getter(v123);
      swift_release(v28);
    }
    else
    {
      v37 = v32;
      v38 = v28[2];
    }
    swift_release(v28);
    v146 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v146, &v147, v35 + 4, v35 + 12);
    swift_release(v28);
    *(_WORD *)(v35 + 12) = 2080;
    v39 = v144;
    v40 = swift_bridgeObjectRetain(v144);
    v41 = Array.description.getter(v40, v143);
    v43 = v42;
    swift_bridgeObjectRelease(v39);
    v146 = sub_10002CB54(v41, v43, (uint64_t *)&v147);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v146, &v147, v35 + 14, v35 + 22);
    swift_bridgeObjectRelease_n(v39, 2);
    swift_bridgeObjectRelease(v43);
    *(_WORD *)(v35 + 22) = 2080;
    v44 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
    v45 = swift_bridgeObjectRetain(v28);
    v46 = Array.description.getter(v45, v44);
    v48 = v47;
    swift_release(v28);
    v146 = sub_10002CB54(v46, v48, (uint64_t *)&v147);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v146, &v147, v35 + 24, v35 + 32);
    swift_release_n(v28, 2);
    swift_bridgeObjectRelease(v48);
    v49 = v37;
    _os_log_impl((void *)&_mh_execute_header, v37, (os_log_type_t)v145, "Got %ld reminders from Spotlight {criteria: %s, reminderIDs: %s}", (uint8_t *)v35, 0x20u);
    v50 = v126;
    swift_arrayDestroy(v126, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1, -1);
    swift_slowDealloc(v35, -1, -1);

    a3 = v142;
    v15 = v137;
    v23 = v138;
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    swift_release_n(v28, 4);
  }
  v51 = (void *)a3[2];
  v52 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v28);
  v147 = 0;
  v54 = objc_msgSend(v51, "fetchRemindersWithObjectIDs:error:", isa, &v147);

  v55 = v147;
  if (!v54)
  {
    v74 = v147;
    _convertNSErrorToError(_:)(v55);

    return swift_willThrow(v75);
  }
  v56 = sub_10000A848(0, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
  v57 = sub_100013FF4();
  v58 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v54, v52, v56, v57);
  v59 = v55;

  v60 = (uint64_t)sub_10002D1BC(v58, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
  swift_bridgeObjectRelease(v58);
  v61 = v144;
  v62 = *(_QWORD *)(v144 + 16);
  if (!v62)
  {
    v73 = v139;
    goto LABEL_28;
  }
  v126 = v60;
  v137 = v15;
  v138 = v23;
  v63 = (_QWORD *)v136;
  v64 = v144 + ((*(unsigned __int8 *)(v136 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v136 + 80));
  LODWORD(v145) = enum case for REMSearchCriterion.listID(_:);
  v65 = *(_QWORD *)(v136 + 72);
  v66 = *(void (**)(char *, uint64_t, uint64_t))(v136 + 16);
  swift_bridgeObjectRetain(v144);
  v68 = v134;
  v67 = v135;
  v69 = v143;
  while (1)
  {
    v66(v68, v64, v69);
    v66((char *)v67, (uint64_t)v68, v69);
    v70 = (uint64_t (*)(id *, uint64_t))v63[11];
    v71 = v70(v67, v69);
    if (v71 == (_DWORD)v145)
      break;
    v72 = (void (*)(id *, uint64_t))v63[1];
    v72(v67, v69);
    v72((id *)v68, v69);
    v64 += v65;
    if (!--v62)
    {
      v61 = v144;
      swift_bridgeObjectRelease(v144);
      v73 = v139;
LABEL_27:
      v60 = v126;
      goto LABEL_28;
    }
  }
  v125 = (void (*)(id *, uint64_t))v63[12];
  v125(v67, v69);

  v124 = sub_10000A430(&qword_100042320);
  v77 = (char *)v67 + *(int *)(v124 + 48);
  v78 = *(void (**)(char *, uint64_t))(v131 + 8);
  v78(v77, v132);
  swift_bridgeObjectRelease(v144);
  v79 = (void (*)(char *, char *, uint64_t))v63[4];
  v80 = v138;
  v79(v138, v68, v69);
  v81 = v130;
  v79(v130, v80, v69);
  v82 = v129;
  v66((char *)v129, (uint64_t)v81, v69);
  v83 = v70(v82, v69);
  if (v83 != (_DWORD)v145)
  {
    v101 = (void (*)(char *, uint64_t))v63[1];
    v101(v81, v69);
    v101((char *)v82, v69);
LABEL_26:
    v73 = v139;
    v61 = v144;
    goto LABEL_27;
  }
  v125(v82, v69);
  v84 = (char *)*v82;
  v85 = v131;
  v86 = v132;
  v87 = v137;
  (*(void (**)(char *, char *, uint64_t))(v131 + 32))(v137, (char *)v82 + *(int *)(v124 + 48), v132);
  v88 = v128;
  (*(void (**)(char *, _QWORD, uint64_t))(v85 + 104))(v128, enum case for REMSearchCriterion.Inclusion.includeForSiri(_:), v86);
  v89 = static REMSearchCriterion.Inclusion.== infix(_:_:)(v87, v88);
  v90 = v78;
  v91 = v89;
  v145 = v90;
  v92 = ((uint64_t (*)(char *, uint64_t))v90)(v88, v86);
  if ((v91 & 1) == 0)
  {
    v102 = v127;
    v103 = (*(uint64_t (**)(char *, char *, uint64_t))(v85 + 16))(v127, v87, v86);
    v104 = Logger.logObject.getter(v103);
    v105 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v104, v105))
    {
      v106 = (uint8_t *)swift_slowAlloc(12, -1);
      v107 = v86;
      v108 = (void *)swift_slowAlloc(32, -1);
      v147 = v108;
      v138 = v84;
      *(_DWORD *)v106 = 136315138;
      v135 = (id *)(v106 + 4);
      v109 = sub_10002E000();
      v110 = dispatch thunk of CustomStringConvertible.description.getter(v107, v109);
      v112 = v111;
      v146 = sub_10002CB54(v110, v111, (uint64_t *)&v147);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v146, &v147, v135, v106 + 12);
      swift_bridgeObjectRelease(v112);
      v113 = v145;
      v145(v102, v107);
      _os_log_impl((void *)&_mh_execute_header, v104, v105, "Called with %s, but should only be .includeForSiri in TTRIntentsHandlerSpotlightDataSource.", v106, 0xCu);
      swift_arrayDestroy(v108, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v108, -1, -1);
      swift_slowDealloc(v106, -1, -1);

      v113(v137, v107);
      (*(void (**)(char *, uint64_t))(v136 + 8))(v130, v69);
    }
    else
    {

      v114 = v145;
      v145(v102, v86);
      v114(v87, v86);
      (*(void (**)(char *, uint64_t))(v136 + 8))(v81, v69);
    }
    goto LABEL_26;
  }
  v93 = v84;
  v94 = Logger.logObject.getter(v92);
  v95 = static os_log_type_t.default.getter();
  v96 = os_log_type_enabled(v94, v95);
  v73 = v139;
  v61 = v144;
  if (v96)
  {
    v97 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v97 = 0;
    _os_log_impl((void *)&_mh_execute_header, v94, v95, "Criteria had list id, filtering further", v97, 2u);
    v98 = v97;
    v87 = v137;
    swift_slowDealloc(v98, -1, -1);
  }

  v99 = v93;
  v100 = v126;
  v60 = (uint64_t)sub_10002E048(v126, (uint64_t)v99);
  swift_release(v100);

  v145(v87, v86);
  (*(void (**)(char *, uint64_t))(v136 + 8))(v130, v69);

LABEL_28:
  if ((unint64_t)v60 >> 62)
  {
    if (v60 < 0)
      v115 = v60;
    else
      v115 = v60 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v60);
    v116 = _CocoaArrayWrapper.endIndex.getter(v115);
    swift_bridgeObjectRelease(v60);
    if (v116)
      goto LABEL_30;
  }
  else if (*(_QWORD *)((v60 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_30:
    v141(v60);
    return swift_bridgeObjectRelease(v60);
  }
  v117 = swift_bridgeObjectRelease(v60);
  v118 = Logger.logObject.getter(v117);
  v119 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v118, v119))
  {
    v120 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v120 = 0;
    _os_log_impl((void *)&_mh_execute_header, v118, v119, "Consulting fallbackDataSource since Spotlight result is empty.", v120, 2u);
    swift_slowDealloc(v120, -1, -1);
  }

  v121 = v142[7];
  v122 = v142[8];
  sub_10000A4BC(v142 + 4, v121);
  return (*(uint64_t (**)(uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v122 + 24))(v61, v141, v73, v121, v122);
}

uint64_t sub_10002ACDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD);
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v22[3];
  _BYTE v23[8];
  uint64_t v24;
  uint64_t v25;

  if (qword_1000420A8 != -1)
    swift_once(&qword_1000420A8, sub_100029B4C);
  v6 = type metadata accessor for Logger(0);
  sub_10000A4A4(v6, (uint64_t)qword_100042C78);
  swift_bridgeObjectRetain(a2);
  swift_errorRetain();
  swift_bridgeObjectRetain(a2);
  v7 = swift_errorRetain();
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(22, -1);
    v11 = swift_slowAlloc(64, -1);
    v25 = v11;
    *(_DWORD *)v10 = 136315394;
    v12 = type metadata accessor for REMSearchCriterion(0);
    v13 = swift_bridgeObjectRetain(a2);
    v14 = Array.description.getter(v13, v12);
    v15 = a3;
    v17 = v16;
    swift_bridgeObjectRelease(a2);
    v24 = sub_10002CB54(v14, v17, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v17);
    *(_WORD *)(v10 + 12) = 2080;
    swift_getErrorValue(a1, v23, v22);
    v18 = Error.localizedDescription.getter(v22[1], v22[2]);
    v20 = v19;
    v24 = sub_10002CB54(v18, v19, &v25);
    a3 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v10 + 14, v10 + 22);
    swift_bridgeObjectRelease(v20);
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Error matching reminders from Spotlight {criteria: %s, error: %s}", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy(v11, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a2, 2);
    swift_errorRelease();
    swift_errorRelease();
  }

  return a3(_swiftEmptyArrayStorage);
}

void sub_10002AF54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = v3;
  if (*(_QWORD *)(a1 + 16) < 2uLL)
  {
    if (qword_1000420A8 != -1)
      swift_once(&qword_1000420A8, sub_100029B4C);
    v10 = type metadata accessor for Logger(0);
    sub_10000A4A4(v10, (uint64_t)qword_100042C78);
    v11 = swift_bridgeObjectRetain_n(a1, 2);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v15 = swift_slowAlloc(32, -1);
      v38 = v15;
      *(_DWORD *)v14 = 136315138;
      v16 = type metadata accessor for REMSearchCriterion(0);
      v17 = swift_bridgeObjectRetain(a1);
      v18 = Array.description.getter(v17, v16);
      v20 = v19;
      swift_bridgeObjectRelease(a1);
      v37 = sub_10002CB54(v18, v20, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Querying Spotlight for lists {criteria: %s}", v14, 0xCu);
      swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a1, 2);
    }
    type metadata accessor for TTRSearchResultCollector(0);
    v21 = sub_10000A430(&qword_100042DC0);
    v22 = type metadata accessor for REMSearchableItemType(0);
    v23 = *(_QWORD *)(v22 - 8);
    v24 = *(unsigned __int8 *)(v23 + 80);
    v25 = (v24 + 32) & ~v24;
    v26 = swift_allocObject(v21, v25 + *(_QWORD *)(v23 + 72), v24 | 7);
    *(_OWORD *)(v26 + 16) = xmmword_100034880;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104))(v26 + v25, enum case for REMSearchableItemType.list(_:), v22);
    sub_10000A848(0, (unint64_t *)&qword_1000420C0, OS_dispatch_queue_ptr);
    v27 = (void *)static OS_dispatch_queue.main.getter();
    v28 = static TTRSearchResultCollector.promise(criteria:itemTypes:attributesToFetch:queue:)(a1, v26, _swiftEmptyArrayStorage, v27);
    swift_bridgeObjectRelease(v26);

    v29 = (_QWORD *)swift_allocObject(&unk_10003DF58, 48, 7);
    v29[2] = a1;
    v29[3] = v4;
    v29[4] = a2;
    v29[5] = a3;
    swift_retain();
    swift_bridgeObjectRetain(a1);
    v30 = swift_retain();
    v31 = (void *)zalgo.getter(v30);
    v32 = dispatch thunk of Promise.then<A>(on:closure:)(v31, sub_10002DED0, v29, (char *)&type metadata for () + 8);
    swift_release(v28);
    swift_release(v29);

    v33 = (_QWORD *)swift_allocObject(&unk_10003DF80, 40, 7);
    v33[2] = a1;
    v33[3] = a2;
    v33[4] = a3;
    swift_retain();
    v34 = swift_bridgeObjectRetain(a1);
    v35 = (void *)zalgo.getter(v34);
    v36 = dispatch thunk of Promise.error(on:closure:)(v35, sub_10002DEF0, v33);
    swift_release(v36);
    swift_release(v32);
    swift_release(v33);

  }
  else
  {
    v8 = (_QWORD *)swift_allocObject(&unk_10003DFA8, 40, 7);
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = a1;
    swift_retain();
    v9 = swift_bridgeObjectRetain(a1);
    sub_100029A3C(v9, (uint64_t)sub_10002DF28, (uint64_t)v8, (_QWORD *(*)(uint64_t *__return_ptr, uint64_t))sub_10002D6F8, (uint64_t)&unk_10003DEE0, (uint64_t)sub_10002D768);
    swift_release(v8);
  }
}

uint64_t sub_10002B360(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v9 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000EF28(a5, a1);
  swift_bridgeObjectRetain(a2);
  REMSiriSearchDataView.ListsResult.init(lists:smartLists:)(v13, a2);
  a3(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10002B420(uint64_t *a1, uint64_t a2, _QWORD *a3, void (*a4)(_QWORD), uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  Class isa;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  char *v46;
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void (*v58)(_QWORD);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  id v67;

  v65 = a3;
  v10 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v63 = *(_QWORD *)(v10 - 8);
  v64 = v10;
  __chkstk_darwin(v10);
  v62 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v13 = swift_bridgeObjectRetain(v12);
  v14 = sub_10002D2CC(v13);
  swift_bridgeObjectRelease(v12);
  if (qword_1000420A8 != -1)
    swift_once(&qword_1000420A8, sub_100029B4C);
  v15 = type metadata accessor for Logger(0);
  v16 = sub_10000A4A4(v15, (uint64_t)qword_100042C78);
  swift_retain_n(v14, 4);
  v17 = swift_bridgeObjectRetain_n(a2, 2);
  v61 = v16;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc(32, -1);
    v57 = (void *)swift_slowAlloc(64, -1);
    v67 = v57;
    *(_DWORD *)v20 = 134218498;
    v59 = a5;
    v60 = v5;
    v58 = a4;
    if (((unint64_t)v14 & 0x8000000000000000) != 0 || ((unint64_t)v14 & 0x4000000000000000) != 0)
    {
      v21 = a2;
      v56 = swift_bridgeObjectRetain(v14);
      v22 = _CocoaArrayWrapper.endIndex.getter(v56);
      swift_release(v14);
    }
    else
    {
      v21 = a2;
      v22 = v14[2];
    }
    swift_release(v14);
    v66 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v20 + 4, v20 + 12);
    swift_release(v14);
    *(_WORD *)(v20 + 12) = 2080;
    v23 = type metadata accessor for REMSearchCriterion(0);
    v24 = swift_bridgeObjectRetain(v21);
    v25 = Array.description.getter(v24, v23);
    v27 = v26;
    swift_bridgeObjectRelease(v21);
    v66 = sub_10002CB54(v25, v27, (uint64_t *)&v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v20 + 14, v20 + 22);
    swift_bridgeObjectRelease_n(v21, 2);
    swift_bridgeObjectRelease(v27);
    *(_WORD *)(v20 + 22) = 2080;
    v28 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
    v29 = swift_bridgeObjectRetain(v14);
    v30 = Array.description.getter(v29, v28);
    v32 = v31;
    swift_release(v14);
    v66 = sub_10002CB54(v30, v32, (uint64_t *)&v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v20 + 24, v20 + 32);
    swift_release_n(v14, 2);
    v33 = v32;
    a2 = v21;
    swift_bridgeObjectRelease(v33);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Got %ld lists from Spotlight {criteria: %s, listIDs: %s}", (uint8_t *)v20, 0x20u);
    v34 = v57;
    swift_arrayDestroy(v57, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    a5 = v59;
    a4 = v58;
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    swift_release_n(v14, 4);
  }
  v35 = (void *)v65[2];
  v36 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v14);
  v67 = 0;
  v38 = objc_msgSend(v35, "fetchListsWithObjectIDs:error:", isa, &v67);

  v39 = v67;
  if (v38)
  {
    v40 = sub_10000A848(0, (unint64_t *)&qword_1000425C0, REMList_ptr);
    v41 = sub_100013FF4();
    v42 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v38, v36, v40, v41);
    v43 = v39;

    if ((v42 & 0xC000000000000001) != 0)
    {
      if (v42 < 0)
        v44 = v42;
      else
        v44 = v42 & 0xFFFFFFFFFFFFFF8;
      if (__CocoaDictionary.count.getter(v44))
        goto LABEL_15;
    }
    else if (*(_QWORD *)(v42 + 16))
    {
LABEL_15:
      v45 = sub_10002D1BC(v42, (unint64_t *)&qword_1000425C0, REMList_ptr);
      swift_bridgeObjectRelease(v42);
      v46 = v62;
      REMSiriSearchDataView.ListsResult.init(lists:smartLists:)(v45, _swiftEmptyArrayStorage);
      a4(v46);
      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v46, v64);
    }
    v50 = swift_bridgeObjectRelease(v42);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Consulting fallbackDataSource for CSL or non-Spotlight-indexed list", v53, 2u);
      swift_slowDealloc(v53, -1, -1);
    }

    v54 = v65[7];
    v55 = v65[8];
    sub_10000A4BC(v65 + 4, v54);
    return (*(uint64_t (**)(uint64_t, void (*)(_QWORD), uint64_t, uint64_t, uint64_t))(v55 + 32))(a2, a4, a5, v54, v55);
  }
  else
  {
    v48 = v67;
    _convertNSErrorToError(_:)(v39);

    return swift_willThrow(v49);
  }
}

uint64_t sub_10002B99C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(_QWORD);
  _QWORD v36[3];
  char v37[8];
  uint64_t v38;
  uint64_t v39;

  v8 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000420A8 != -1)
    swift_once(&qword_1000420A8, sub_100029B4C);
  v12 = type metadata accessor for Logger(0);
  sub_10000A4A4(v12, (uint64_t)qword_100042C78);
  swift_bridgeObjectRetain(a2);
  swift_errorRetain();
  swift_bridgeObjectRetain(a2);
  v13 = swift_errorRetain();
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc(22, -1);
    v32 = v9;
    v17 = v16;
    v18 = swift_slowAlloc(64, -1);
    v35 = a3;
    v19 = v18;
    v39 = v18;
    *(_DWORD *)v17 = 136315394;
    v20 = type metadata accessor for REMSearchCriterion(0);
    v34 = a4;
    v21 = v20;
    v22 = swift_bridgeObjectRetain(a2);
    v23 = Array.description.getter(v22, v21);
    v33 = v8;
    v25 = v24;
    swift_bridgeObjectRelease(a2);
    v38 = sub_10002CB54(v23, v25, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v17 + 4, v17 + 12);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v17 + 12) = 2080;
    swift_getErrorValue(a1, v37, v36);
    v26 = Error.localizedDescription.getter(v36[1], v36[2]);
    v28 = v27;
    v38 = sub_10002CB54(v26, v27, &v39);
    v8 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v17 + 14, v17 + 22);
    swift_bridgeObjectRelease(v28);
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Error matching lists from Spotlight {criteria: %s, error: %s}", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy(v19, 2, (char *)&type metadata for Any + 8);
    v29 = v19;
    a3 = v35;
    swift_slowDealloc(v29, -1, -1);
    v30 = v17;
    v9 = v32;
    swift_slowDealloc(v30, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a2, 2);
    swift_errorRelease();
    swift_errorRelease();
  }

  REMSiriSearchDataView.ListsResult.init(lists:smartLists:)(_swiftEmptyArrayStorage, _swiftEmptyArrayStorage);
  a3(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10002BC78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(uint64_t *, _QWORD, uint64_t);
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(unint64_t, uint64_t *, uint64_t);
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  unint64_t v60;
  unsigned int v61;
  unsigned int v62;
  char *v63;
  unint64_t v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;

  v72 = type metadata accessor for REMSearchCriterion(0);
  v68 = *(_QWORD *)(v72 - 8);
  __chkstk_darwin(v72);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v56 - v10);
  v67 = swift_allocObject(&unk_10003DE90, 24, 7);
  *(_QWORD *)(v67 + 16) = _swiftEmptyArrayStorage;
  v73 = (unint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v49 = a1;
    else
      v49 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    result = _CocoaArrayWrapper.endIndex.getter(v49);
    v12 = result;
    if (result)
      goto LABEL_3;
LABEL_32:
    swift_bridgeObjectRelease(a1);
    v48 = _swiftEmptyArrayStorage;
LABEL_33:
    v50 = v73;
    if (v48[2])
    {
      v51 = (_QWORD *)swift_allocObject(&unk_10003DEB8, 64, 7);
      v51[2] = v3;
      v51[3] = a1;
      v51[4] = a2;
      v51[5] = a3;
      v51[6] = v50;
      v52 = v67;
      v51[7] = v67;
      swift_bridgeObjectRetain(a1);
      swift_bridgeObjectRetain(v48);
      swift_retain();
      swift_retain();
      swift_retain();
      sub_100029A3C((uint64_t)v48, (uint64_t)sub_10002D570, (uint64_t)v51, (_QWORD *(*)(uint64_t *__return_ptr, uint64_t))sub_10002D6F8, (uint64_t)&unk_10003DEE0, (uint64_t)sub_10002D768);
      swift_release(v52);
      swift_bridgeObjectRelease(v48);
      v53 = v51;
    }
    else
    {
      swift_bridgeObjectRelease(v73);
      v54 = v3[7];
      v55 = v3[8];
      sub_10000A4BC(v3 + 4, v54);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 40))(a1, a2, a3, v54, v55);
      v53 = (_QWORD *)v67;
    }
    return swift_release(v53);
  }
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain(a1);
  if (!v12)
    goto LABEL_32;
LABEL_3:
  if (v12 >= 1)
  {
    v63 = v8;
    v57 = a2;
    v58 = a3;
    v59 = v3;
    v14 = 0;
    v69 = a1 & 0xC000000000000001;
    v66 = enum case for REMStringMatchingStyle.prefix(_:);
    v65 = enum case for REMSearchCriterion.textualField(_:);
    v62 = enum case for REMSearchableListType.grocery(_:);
    v61 = enum case for REMSearchCriterion.listType(_:);
    v64 = (unint64_t)"TTRContactEventTriggerBearing";
    v60 = 0x8000000100035200;
    v70 = v12;
    v71 = a1;
    while (1)
    {
      if (v69)
        v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, a1);
      else
        v19 = *(id *)(a1 + 8 * v14 + 32);
      v20 = v19;
      v21 = (void *)INTaskList.listID.getter();

      if (v21)
      {
        v15 = v20;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v17 = *(_QWORD *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v16 = *(_QWORD *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v17 >= v16 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
        v18 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v15);
        specialized Array._endMutation()(v18);
        goto LABEL_8;
      }
      v22 = objc_msgSend(v20, "title");
      v23 = objc_msgSend(v22, "spokenPhrase");

      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v26 = v25;

      v27 = (char *)v11 + *(int *)(sub_10000A430(&qword_1000422D8) + 48);
      *v11 = v24;
      v11[1] = v26;
      v28 = type metadata accessor for REMStringMatchingStyle(0);
      (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v27, v66, v28);
      v29 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v68 + 104);
      v29(v11, v65, v72);
      v30 = *(_QWORD *)(v67 + 16);
      if ((swift_isUniquelyReferenced_nonNull_native(v30) & 1) == 0)
      {
        v30 = sub_10002C948(0, *(_QWORD *)(v30 + 16) + 1, 1, v30, &qword_1000425A0, (uint64_t (*)(_QWORD))&type metadata accessor for REMSearchCriterion);
        *(_QWORD *)(v67 + 16) = v30;
      }
      v32 = *(_QWORD *)(v30 + 16);
      v31 = *(_QWORD *)(v30 + 24);
      if (v32 >= v31 >> 1)
      {
        v30 = sub_10002C948(v31 > 1, v32 + 1, 1, v30, &qword_1000425A0, (uint64_t (*)(_QWORD))&type metadata accessor for REMSearchCriterion);
        *(_QWORD *)(v67 + 16) = v30;
      }
      *(_QWORD *)(v30 + 16) = v32 + 1;
      v33 = (*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
      v34 = *(_QWORD *)(v68 + 72);
      v35 = v30 + v33 + v34 * v32;
      v36 = *(void (**)(unint64_t, uint64_t *, uint64_t))(v68 + 32);
      v36(v35, v11, v72);
      v37 = objc_msgSend(v20, "title");
      v38 = objc_msgSend(v37, "vocabularyIdentifier");

      if (v38)
      {
        v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        v41 = v40;

        if (v39 == 0xD000000000000011 && v41 == v60)
        {
          swift_bridgeObjectRelease(v64 | 0x8000000000000000);
LABEL_22:
          v43 = type metadata accessor for REMSearchableListType(0);
          v44 = v63;
          (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v63, v62, v43);
          v29((uint64_t *)v44, v61, v72);
          v45 = *(_QWORD *)(v67 + 16);
          if ((swift_isUniquelyReferenced_nonNull_native(v45) & 1) == 0)
          {
            v45 = sub_10002C948(0, *(_QWORD *)(v45 + 16) + 1, 1, v45, &qword_1000425A0, (uint64_t (*)(_QWORD))&type metadata accessor for REMSearchCriterion);
            *(_QWORD *)(v67 + 16) = v45;
          }
          v47 = *(_QWORD *)(v45 + 16);
          v46 = *(_QWORD *)(v45 + 24);
          if (v47 >= v46 >> 1)
          {
            v45 = sub_10002C948(v46 > 1, v47 + 1, 1, v45, &qword_1000425A0, (uint64_t (*)(_QWORD))&type metadata accessor for REMSearchCriterion);
            *(_QWORD *)(v67 + 16) = v45;
          }
          *(_QWORD *)(v45 + 16) = v47 + 1;
          v36(v45 + v33 + v47 * v34, (uint64_t *)v44, v72);
          goto LABEL_8;
        }
        v42 = _stringCompareWithSmolCheck(_:_:expecting:)(v39, v41, 0xD000000000000011, v64 | 0x8000000000000000, 0);
        swift_bridgeObjectRelease(v41);
        if ((v42 & 1) != 0)
          goto LABEL_22;
      }
LABEL_8:
      ++v14;

      a1 = v71;
      if (v70 == v14)
      {
        swift_bridgeObjectRelease(v71);
        v48 = *(_QWORD **)(v67 + 16);
        a3 = v58;
        v3 = v59;
        a2 = v57;
        goto LABEL_33;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002C2A4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void (*v20)(uint64_t, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v22 = a1;
    else
      v22 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v23 = _CocoaArrayWrapper.endIndex.getter(v22);
    swift_bridgeObjectRelease(a1);
    if (v23)
      goto LABEL_5;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_5:
    v16 = a3 + 4;
    v17 = a3[7];
    v18 = a3[8];
    sub_10000A4BC(v16, v17);
    v19 = (_QWORD *)swift_allocObject(&unk_10003DF30, 56, 7);
    v19[2] = a1;
    v19[3] = a8;
    v19[4] = a2;
    v19[5] = a5;
    v19[6] = a6;
    v20 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v18 + 40);
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRetain(a2);
    swift_retain();
    swift_retain();
    v20(a7, sub_10002D838, v19, v17, v18);
    return swift_release(v19);
  }
  if ((unint64_t)a2 >> 62)
  {
    if (a2 < 0)
      v24 = a2;
    else
      v24 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v25 = _CocoaArrayWrapper.endIndex.getter(v24);
    swift_bridgeObjectRelease(a2);
    if (v25)
      goto LABEL_5;
  }
  else if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_5;
  }
  v26 = a3[7];
  v27 = a3[8];
  sub_10000A4BC(a3 + 4, v26);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 40))(a4, a5, a6, v26, v27);
}

uint64_t sub_10002C44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6)
{
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
  uint64_t v22;
  void (*v23)(char *);
  uint64_t v24;
  uint64_t v25[3];

  v22 = a6;
  v23 = a5;
  v9 = type metadata accessor for REMSiriSearchDataView.ListsResult(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = REMSiriSearchDataView.ListsResult.lists.getter(v13);
  v25[0] = a2;
  swift_bridgeObjectRetain(a2);
  sub_10000E05C(v14);
  v15 = v25[0];
  swift_beginAccess(a3 + 16, v25, 0, 0);
  v16 = *(_QWORD *)(a3 + 16);
  v17 = swift_bridgeObjectRetain(v16);
  v18 = sub_10000EF28(v17, v15);
  swift_bridgeObjectRelease(v15);
  v19 = swift_bridgeObjectRelease(v16);
  v20 = REMSiriSearchDataView.ListsResult.smartLists.getter(v19);
  v24 = a4;
  swift_bridgeObjectRetain(a4);
  sub_10000E050(v20);
  REMSiriSearchDataView.ListsResult.init(lists:smartLists:)(v18, v24);
  v23(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10002C590()
{
  uint64_t v0;

  sub_10000A880((_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for TTRIntentsHandlerSpotlightDataSource()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension36TTRIntentsHandlerSpotlightDataSource);
}

uint64_t sub_10002C5E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  sub_10000A4BC((_QWORD *)(*(_QWORD *)v1 + 32), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

void sub_10002C634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100029BDC(a1, a2, a3);
}

void sub_10002C654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10002AF54(a1, a2, a3);
}

uint64_t sub_10002C674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002BC78(a1, a2, a3);
}

uint64_t sub_10002C694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;

  v9 = *(_QWORD *)(*(_QWORD *)v4 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)v4 + 64);
  sub_10000A4BC((_QWORD *)(*(_QWORD *)v4 + 32), v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, a2, a3, a4, v9, v10);
}

uint64_t sub_10002C70C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  sub_10000A4BC((_QWORD *)(*(_QWORD *)v0 + 32), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
}

uint64_t sub_10002C754(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 64);
  sub_10000A4BC((_QWORD *)(*(_QWORD *)v2 + 32), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 80))(a1, a2, v5, v6);
}

uint64_t sub_10002C7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 64);
  sub_10000A4BC((_QWORD *)(*(_QWORD *)v2 + 32), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 88))(a1, a2, v5, v6);
}

uint64_t sub_10002C814(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002C948(a1, a2, a3, a4, &qword_1000425A0, (uint64_t (*)(_QWORD))&type metadata accessor for REMSearchCriterion);
}

_QWORD *sub_10002C828(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      v10 = sub_10000A430(&qword_100042B08);
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
    sub_10002DDDC(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002C934(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002C948(a1, a2, a3, a4, &qword_100042DE0, (uint64_t (*)(_QWORD))&type metadata accessor for REMNotificationIdentifier);
}

uint64_t sub_10002C948(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
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
  v13 = sub_10000A430(a5);
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
    sub_10002E1EC(0, v11, v24, a4, a6);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_10002CB54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10002CC24(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10002DF34((uint64_t)v12, *a3);
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
      sub_10002DF34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000A880(v12);
  return v7;
}

uint64_t sub_10002CC24(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10002CDDC(a5, a6);
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

uint64_t sub_10002CDDC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10002CE70(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10002D048(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10002D048(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10002CE70(uint64_t a1, unint64_t a2)
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
      v5 = sub_10002CFE4(v4, 0);
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

_QWORD *sub_10002CFE4(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000A430(&qword_100042DC8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10002D048(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000A430(&qword_100042DC8);
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

uint64_t *sub_10002D194(uint64_t a1)
{
  return sub_10002D1BC(a1, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
}

uint64_t *sub_10002D1A8(uint64_t a1)
{
  return sub_10002D1BC(a1, (unint64_t *)&qword_1000425C0, REMList_ptr);
}

uint64_t *sub_10002D1BC(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *result;
  uint64_t v13;

  v5 = a1;
  if ((a1 & 0xC000000000000001) == 0)
  {
    v6 = *(_QWORD *)(a1 + 16);
    if (v6)
      goto LABEL_5;
    return _swiftEmptyArrayStorage;
  }
  if (a1 >= 0)
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  v6 = __CocoaDictionary.count.getter(a1);
  if (!v6)
    return _swiftEmptyArrayStorage;
LABEL_5:
  if (v6 <= 0)
  {
    v8 = _swiftEmptyArrayStorage;
  }
  else
  {
    v7 = sub_10000A430(&qword_1000427E0);
    v8 = (uint64_t *)swift_allocObject(v7, 8 * v6 + 32, 7);
    v9 = j__malloc_size(v8);
    v10 = v9 - 32;
    if (v9 < 32)
      v10 = v9 - 25;
    v8[2] = v6;
    v8[3] = (2 * (v10 >> 3)) | 1;
  }
  swift_bridgeObjectRetain(v5);
  v11 = sub_10002D848((uint64_t)&v13, v8 + 4, v6, v5, a2, a3);
  result = (uint64_t *)sub_100013FA0(v13);
  if (v11 == v6)
    return v8;
  __break(1u);
  return result;
}

uint64_t *sub_10002D2CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *result;
  uint64_t v9;

  v1 = a1;
  if ((a1 & 0xC000000000000001) == 0)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
      goto LABEL_5;
    return _swiftEmptyArrayStorage;
  }
  if (a1 >= 0)
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  v2 = __CocoaDictionary.count.getter(a1);
  if (!v2)
    return _swiftEmptyArrayStorage;
LABEL_5:
  if (v2 <= 0)
  {
    v4 = _swiftEmptyArrayStorage;
  }
  else
  {
    v3 = sub_10000A430(&qword_1000427E0);
    v4 = (uint64_t *)swift_allocObject(v3, 8 * v2 + 32, 7);
    v5 = j__malloc_size(v4);
    v6 = v5 - 32;
    if (v5 < 32)
      v6 = v5 - 25;
    v4[2] = v2;
    v4[3] = (2 * (v6 >> 3)) | 1;
  }
  swift_bridgeObjectRetain(v1);
  v7 = sub_10002DB10((uint64_t)&v9, v4 + 4, v2, v1);
  result = (uint64_t *)sub_100013FA0(v9);
  if (v7 == v2)
    return v4;
  __break(1u);
  return result;
}

void (*sub_10002D3C4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10002D49C(v6, a2, a3);
  return sub_10002D418;
}

void (*sub_10002D41C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10002D580(v6, a2, a3);
  return sub_10002D418;
}

void sub_10002D470(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_10002D49C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
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
    return sub_10002E3B8;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002D508()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002D52C()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[3]);
  swift_release(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  swift_release(v0[7]);
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002D570(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10002C2A4(a1, a2, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

void (*sub_10002D580(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_10002D5EC;
  }
  __break(1u);
  return result;
}

void sub_10002D5EC(id *a1)
{

}

uint64_t sub_10002D5F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
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
  uint64_t result;
  _QWORD v17[4];
  uint64_t v18;

  v7 = *a2;
  v8 = sub_10000A430(&qword_1000425A0);
  v9 = type metadata accessor for REMSearchCriterion(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v11 + 32) & ~v11;
  v13 = swift_allocObject(v8, v12 + *(_QWORD *)(v10 + 72), v11 | 7);
  *(_OWORD *)(v13 + 16) = xmmword_100034880;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13 + v12, a1, v9);
  v18 = v7;
  v17[2] = &v18;
  v17[3] = v13;
  v14 = sub_10000A430(&qword_100042DA8);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  v15 = Promise.init(resolver:)(a3, v17);
  result = swift_bridgeObjectRelease(v13);
  *a4 = v15;
  return result;
}

uint64_t sub_10002D6F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_10002D5F4(a1, *(uint64_t **)(v2 + 16), (uint64_t)sub_10002D7F4, a2);
}

unint64_t sub_10002D71C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042DB8;
  if (!qword_100042DB8)
  {
    v1 = sub_10000A658(&qword_100042DB0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100042DB8);
  }
  return result;
}

uint64_t sub_10002D768(uint64_t *a1)
{
  uint64_t v1;

  return sub_10000DCD0(a1, *(void (**)(_QWORD *, _QWORD *))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10002D780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;

  v9 = swift_allocObject(&unk_10003DF08, 32, 7);
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  swift_retain();
  sub_10002AF54(a6, sub_10001404C, v9);
  return swift_release(v9);
}

uint64_t sub_10002D7F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_10002D780(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_10002D7FC()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002D838(uint64_t a1)
{
  uint64_t v1;

  return sub_10002C44C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void (**)(char *))(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_10002D848(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t *a5, _QWORD *a6)
{
  unint64_t v6;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  int64_t v34;
  uint64_t v37;
  uint64_t v38;

  v6 = a4;
  v8 = a2;
  v9 = (_QWORD *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a4 < 0)
      v10 = a4;
    else
      v10 = a4 & 0xFFFFFFFFFFFFFF8;
    result = __CocoaDictionary.makeIterator()(v10);
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v6 = result | 0x8000000000000000;
    if (v8)
      goto LABEL_6;
LABEL_39:
    v14 = 0;
    a3 = 0;
LABEL_48:
    *v9 = v6;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v14;
    v9[4] = v13;
    return a3;
  }
  v28 = -1 << *(_BYTE *)(a4 + 32);
  v11 = a4 + 64;
  v29 = ~v28;
  v30 = -v28;
  if (v30 < 64)
    v31 = ~(-1 << v30);
  else
    v31 = -1;
  v13 = v31 & *(_QWORD *)(a4 + 64);
  v12 = v29;
  if (!a2)
    goto LABEL_39;
LABEL_6:
  if (!a3)
  {
    v14 = 0;
    goto LABEL_48;
  }
  if (a3 < 0)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v32 = v12;
  v33 = v9;
  v14 = 0;
  v15 = 0;
  v34 = (unint64_t)(v12 + 64) >> 6;
  while ((v6 & 0x8000000000000000) != 0)
  {
    v21 = v11;
    v22 = __CocoaDictionary.Iterator.next()();
    if (!v22)
    {
      a3 = v15;
LABEL_47:
      v12 = v32;
      v9 = v33;
      goto LABEL_48;
    }
    v24 = v23;
    swift_unknownObjectRelease(v22);
    v37 = v24;
    v25 = sub_10000A848(0, a5, a6);
    swift_unknownObjectRetain(v24, v26);
    swift_dynamicCast(&v38, &v37, (char *)&type metadata for Swift.AnyObject + 8, v25, 7);
    v18 = v38;
    result = swift_unknownObjectRelease(v24);
    v11 = v21;
    if (!v18)
      goto LABEL_46;
LABEL_11:
    ++v15;
    *v8++ = v18;
    if (v15 == a3)
      goto LABEL_47;
  }
  if (v13)
  {
    v16 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    v17 = v16 | (v14 << 6);
    goto LABEL_10;
  }
  v19 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
    goto LABEL_50;
  }
  if (v19 >= v34)
    goto LABEL_42;
  v20 = *(_QWORD *)(v11 + 8 * v19);
  if (v20)
    goto LABEL_26;
  v14 += 2;
  if (v19 + 1 >= v34)
  {
    v13 = 0;
    v14 = v19;
    goto LABEL_46;
  }
  v20 = *(_QWORD *)(v11 + 8 * v14);
  if (v20)
  {
LABEL_19:
    v19 = v14;
LABEL_26:
    v13 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v19 << 6);
    v14 = v19;
LABEL_10:
    result = (uint64_t)*(id *)(*(_QWORD *)(v6 + 56) + 8 * v17);
    v18 = result;
    if (!result)
      goto LABEL_46;
    goto LABEL_11;
  }
  v27 = v19 + 2;
  if (v19 + 2 >= v34)
    goto LABEL_42;
  v20 = *(_QWORD *)(v11 + 8 * v27);
  if (v20)
  {
LABEL_25:
    v19 = v27;
    goto LABEL_26;
  }
  v14 = v19 + 3;
  if (v19 + 3 >= v34)
  {
    v13 = 0;
    v14 = v19 + 2;
    goto LABEL_46;
  }
  v20 = *(_QWORD *)(v11 + 8 * v14);
  if (v20)
    goto LABEL_19;
  v27 = v19 + 4;
  if (v19 + 4 >= v34)
  {
LABEL_42:
    v13 = 0;
LABEL_46:
    a3 = v15;
    goto LABEL_47;
  }
  v20 = *(_QWORD *)(v11 + 8 * v27);
  if (v20)
    goto LABEL_25;
  while (1)
  {
    v19 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v19 >= v34)
    {
      v13 = 0;
      v14 = v34 - 1;
      goto LABEL_46;
    }
    v20 = *(_QWORD *)(v11 + 8 * v19);
    ++v27;
    if (v20)
      goto LABEL_26;
  }
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_10002DB10(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t *v6;
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
    v20 = __CocoaDictionary.Iterator.nextKey()();
    if (!v20)
    {
      a3 = v13;
LABEL_47:
      v10 = v29;
      v7 = v30;
      goto LABEL_48;
    }
    v21 = v20;
    v32 = v20;
    v22 = sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
    swift_unknownObjectRetain(v21, v23);
    swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v22, 7);
    v16 = v33;
    result = swift_unknownObjectRelease(v21);
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
    result = (uint64_t)*(id *)(*(_QWORD *)(v4 + 48) + 8 * v15);
    v16 = result;
    if (!result)
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

uint64_t sub_10002DDDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10002DED0(uint64_t *a1)
{
  uint64_t v1;

  return sub_10002B420(a1, *(_QWORD *)(v1 + 16), *(_QWORD **)(v1 + 24), *(void (**)(_QWORD))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_10002DEF0(uint64_t a1)
{
  uint64_t v1;

  return sub_10002B99C(a1, *(_QWORD *)(v1 + 16), *(void (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_10002DEFC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002DF28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10002B360(a1, a2, *(void (**)(char *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_10002DF34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002DF74()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002DFA8(uint64_t *a1)
{
  uint64_t v1;

  return sub_10002A1A4(a1, *(_QWORD *)(v1 + 16), *(_QWORD **)(v1 + 24), *(void (**)(uint64_t))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_10002DFC8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002DFF4(uint64_t a1)
{
  uint64_t v1;

  return sub_10002ACDC(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(_QWORD))(v1 + 24));
}

unint64_t sub_10002E000()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042DD0;
  if (!qword_100042DD0)
  {
    v1 = type metadata accessor for REMSearchCriterion.Inclusion(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for REMSearchCriterion.Inclusion, v1);
    atomic_store(result, (unint64_t *)&qword_100042DD0);
  }
  return result;
}

_QWORD *sub_10002E048(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  if ((unint64_t)a1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
LABEL_9:
        v6 = v5;
        v7 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_15;
        sub_10000A848(0, &qword_100042DD8, NSObject_ptr);
        v8 = objc_msgSend(v6, "list");
        v9 = objc_msgSend(v8, "objectID");

        LOBYTE(v8) = static NSObject.== infix(_:_:)(v9, a2);
        if ((v8 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v10);
          v11 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v11);
          v12 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v6);
          specialized ContiguousArray._endMutation()(v12);
        }
        else
        {

        }
        ++v4;
        if (v7 == v3)
          return _swiftEmptyArrayStorage;
      }
      if (v4 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      if (a1 < 0)
        v14 = a1;
      else
        v14 = a1 & 0xFFFFFFFFFFFFFF8;
      v3 = _CocoaArrayWrapper.endIndex.getter(v14);
      if (!v3)
        return _swiftEmptyArrayStorage;
    }
    v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10002E1EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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

uint64_t sub_10002E304@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_10002D5F4(a1, *(uint64_t **)(v2 + 16), (uint64_t)sub_10002E34C, a2);
}

uint64_t sub_10002E328()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002E34C(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(uint64_t **)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v7 = *v5;
  swift_retain(a2);
  sub_100013C24(v6, v7, a1, a2);
  return swift_release(a2);
}

uint64_t sub_10002E3A4(uint64_t *a1)
{
  return sub_10002D768(a1);
}

uint64_t sub_10002E3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  void (*v31)(uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v35 = swift_allocObject(&unk_10003E060, 24, 7);
  *(_QWORD *)(v35 + 16) = _swiftEmptyArrayStorage;
  v4 = (_QWORD *)(v35 + 16);
  v37 = swift_allocObject(&unk_10003E088, 24, 7);
  *(_QWORD *)(v37 + 16) = _swiftEmptyArrayStorage;
  if (!((unint64_t)a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(a1);
    if (v5)
      goto LABEL_3;
LABEL_22:
    swift_bridgeObjectRelease(a1);
    v27 = (_QWORD *)swift_allocObject(&unk_10003E0B0, 48, 7);
    v27[2] = v35;
    v27[3] = v37;
    v27[4] = a2;
    v27[5] = a3;
    v28 = v34[6];
    v29 = v34[7];
    sub_10000A4BC(v34 + 3, v28);
    v30 = (_QWORD *)swift_allocObject(&unk_10003E0D8, 40, 7);
    v30[2] = v34;
    v30[3] = sub_10002F74C;
    v30[4] = v27;
    v31 = *(void (**)(uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v29 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v31(sub_100015490, v30, v28, v29);
    swift_release(v35);
    swift_release(v37);
    swift_release(v27);
    return swift_release(v30);
  }
  if (a1 < 0)
    v26 = a1;
  else
    v26 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  result = _CocoaArrayWrapper.endIndex.getter(v26);
  v5 = result;
  if (!result)
    goto LABEL_22;
LABEL_3:
  if (v5 >= 1)
  {
    v7 = 0;
    v8 = a1 & 0xC000000000000001;
    v36 = a1;
    do
    {
      if (v8)
        v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, a1);
      else
        v14 = *(id *)(a1 + 8 * v7 + 32);
      v13 = v14;
      v15 = (void *)INTask.reminderID.getter();
      if (v15)
      {
        v9 = v15;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v11 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v10 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v11 >= v10 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
        v12 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v9);
        specialized Array._endMutation()(v12);

        v13 = v9;
      }
      else
      {
        v16 = objc_msgSend(v13, "title");
        v17 = objc_msgSend(v16, "spokenPhrase");

        v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
        v20 = v19;

        v21 = *(_QWORD **)(v37 + 16);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v21);
        *(_QWORD *)(v37 + 16) = v21;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v21 = sub_10002C828(0, v21[2] + 1, 1, v21);
          *(_QWORD *)(v37 + 16) = v21;
        }
        v24 = v21[2];
        v23 = v21[3];
        if (v24 >= v23 >> 1)
        {
          v21 = sub_10002C828((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
          *(_QWORD *)(v37 + 16) = v21;
        }
        v21[2] = v24 + 1;
        v25 = &v21[2 * v24];
        v25[4] = v18;
        v25[5] = v20;
        a1 = v36;
      }
      ++v7;

    }
    while (v5 != v7);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002E6EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042DE8);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042DE8);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10002E77C(uint64_t a1, uint64_t a2)
{
  void **v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;

  v3 = *v2;
  v6[4] = a1;
  v7 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10002E814;
  v6[3] = &unk_10003E0F0;
  v4 = _Block_copy(v6);
  swift_retain();
  objc_msgSend(v3, "getDeliveredNotificationsWithCompletionHandler:", v4);
  _Block_release(v4);
  return swift_release(v7);
}

uint64_t sub_10002E814(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = sub_10000A848(0, &qword_100042EB0, UNNotification_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v5);
  swift_retain();
  v4(v6);
  swift_release(v3);
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_10002E880(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  void (*v33)(uint64_t, _BYTE *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  int v37;
  _BYTE *v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _BYTE *v46;
  _QWORD *v47;
  unint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t, uint64_t);
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t result;
  uint64_t v75;
  _BYTE v76[4];
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  void (*v85)(uint64_t);
  int v86;
  int v87;
  int v88;
  _BYTE *v89;
  _BYTE *v90;
  _BYTE *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  _BYTE *v96;
  _QWORD *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  _BYTE v102[16];

  v84 = a4;
  v85 = a3;
  v6 = sub_10000A430(&qword_100042EA8);
  v7 = __chkstk_darwin(v6);
  v90 = &v76[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = type metadata accessor for RDUserNotificationType(0, v7);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v76[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  v15 = (uint64_t)&v76[-v14];
  v16 = sub_10000A430(&qword_1000422B8);
  __chkstk_darwin(v16);
  v18 = &v76[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = type metadata accessor for REMNotificationIdentifier(0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v96 = &v76[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v22);
  v89 = &v76[-v23];
  if ((unint64_t)a1 >> 62)
  {
LABEL_38:
    if (a1 < 0)
      v52 = a1;
    else
      v52 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v24 = _CocoaArrayWrapper.endIndex.getter(v52);
    v98 = v19;
    if (v24)
      goto LABEL_3;
  }
  else
  {
    v24 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    v98 = v19;
    if (v24)
    {
LABEL_3:
      v91 = v12;
      v92 = v15;
      v82 = a2;
      v95 = a1 & 0xC000000000000001;
      v88 = enum case for RDUserNotificationType.reminderAlarm(_:);
      v87 = enum case for RDUserNotificationType.todayNotificationForSingleReminder(_:);
      v86 = enum case for RDUserNotificationType.caldavSharedList(_:);
      v83 = enum case for RDUserNotificationType.assignmentNotification(_:);
      v81 = enum case for RDUserNotificationType.sharedListAddedReminderNotification(_:);
      v80 = enum case for RDUserNotificationType.dueDateDeltaAlarm(_:);
      v79 = enum case for RDUserNotificationType.todayNotification(_:);
      v15 = 4;
      v78 = enum case for RDUserNotificationType.todayNotificationBadge(_:);
      v77 = enum case for RDUserNotificationType.beforeFirstUnlock(_:);
      v97 = _swiftEmptyArrayStorage;
      v93 = v24;
      v94 = a1;
      v12 = v90;
      while (1)
      {
        a2 = v15 - 4;
        if (v95)
        {
          v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15 - 4, a1);
          a1 = v15 - 3;
          if (__OFADD__(a2, 1))
            goto LABEL_37;
        }
        else
        {
          v26 = *(id *)(a1 + 8 * v15);
          a1 = v15 - 3;
          if (__OFADD__(a2, 1))
          {
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
        }
        v99 = v26;
        v27 = objc_msgSend(v26, "request");
        v28 = objc_msgSend(v27, "content");

        v29 = v28;
        RDUserNotificationType.init(notificationContent:)();
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v12, 1, v9) == 1)
        {

          sub_10000A5D0((uint64_t)v12, &qword_100042EA8);
          v30 = 1;
          v19 = v98;
        }
        else
        {
          v31 = v20;
          v32 = v18;
          v33 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v10 + 32);
          v34 = v10;
          v35 = v92;
          v33(v92, v12, v9);
          v36 = v91;
          (*(void (**)(_BYTE *, uint64_t, uint64_t))(v34 + 16))(v91, v35, v9);
          v37 = (*(uint64_t (**)(_BYTE *, uint64_t))(v34 + 88))(v36, v9);
          v19 = v98;
          if (v37 == v88)
          {
            (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v9);

            (*(void (**)(_BYTE *, uint64_t))(v34 + 96))(v36, v9);
            v38 = v32;
            v20 = v31;
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v31 + 32))(v38, v36, v19);
            v30 = 0;
            v12 = v90;
            v10 = v34;
            v18 = v38;
            goto LABEL_20;
          }
          if (v37 == v87)
          {
            v10 = v34;
            v39 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
            v39(v92, v9);

            v39((uint64_t)v91, v9);
            v19 = v98;
            v30 = 1;
            v12 = v90;
            v18 = v32;
            goto LABEL_19;
          }
          v12 = v90;
          v10 = v34;
          v18 = v32;
          if (v37 == v86)
          {
            v40 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
            v40(v92, v9);

            v40((uint64_t)v91, v9);
            v19 = v98;
            v30 = 1;
LABEL_19:
            v20 = v31;
LABEL_20:
            v24 = v93;
            goto LABEL_21;
          }
          v20 = v31;
          if (v37 == v83)
          {
            v49 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
            v49(v92, v9);

            v49((uint64_t)v91, v9);
            v19 = v98;
            v30 = 1;
            goto LABEL_20;
          }
          v24 = v93;
          if (v37 == v81 || v37 == v80)
          {
            v50 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
            v50(v92, v9);

            v50((uint64_t)v91, v9);
            v19 = v98;
            v30 = 1;
          }
          else
          {
            if (v37 != v79 && v37 != v78 && v37 != v77)
            {
              result = _diagnoseUnexpectedEnumCase<A>(type:)(v9, v9);
              __break(1u);
              return result;
            }
            (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v92, v9);

            v30 = 1;
          }
        }
LABEL_21:
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, v30, 1, v19);

        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
        {
          sub_10000A5D0((uint64_t)v18, &qword_1000422B8);
        }
        else
        {
          v41 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v20 + 32);
          v42 = v89;
          v41(v89, v18, v19);
          v41(v96, v42, v19);
          v43 = (unint64_t)v97;
          if ((swift_isUniquelyReferenced_nonNull_native(v97) & 1) == 0)
            v43 = sub_10002C934(0, *(_QWORD *)(v43 + 16) + 1, 1, v43);
          v45 = *(_QWORD *)(v43 + 16);
          v44 = *(_QWORD *)(v43 + 24);
          v97 = (_QWORD *)v43;
          if (v45 >= v44 >> 1)
            v97 = (_QWORD *)sub_10002C934(v44 > 1, v45 + 1, 1, (unint64_t)v97);
          v46 = v96;
          v47 = v97;
          v97[2] = v45 + 1;
          v48 = (unint64_t)v47
              + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))
              + *(_QWORD *)(v20 + 72) * v45;
          v19 = v98;
          v41((_BYTE *)v48, v46, v98);
          v24 = v93;
        }
        ++v15;
        v25 = a1 == v24;
        a1 = v94;
        if (v25)
        {
          swift_bridgeObjectRelease(v94);
          v51 = v97;
          goto LABEL_43;
        }
      }
    }
  }
  swift_bridgeObjectRelease(a1);
  v51 = _swiftEmptyArrayStorage;
LABEL_43:
  v53 = v51;
  v54 = REMStore.fetchReminders(notificationIdentifiers:)();
  v55 = v54;
  if ((unint64_t)v54 >> 62)
  {
    if (v54 < 0)
      v75 = v54;
    else
      v75 = v54 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v54);
    v56 = _CocoaArrayWrapper.endIndex.getter(v75);
    swift_bridgeObjectRelease(v55);
  }
  else
  {
    v56 = *(_QWORD *)((v54 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v57 = v53[2];
  if (v56 != v57)
  {
    if (qword_1000420B0 != -1)
      swift_once(&qword_1000420B0, sub_10002E6EC);
    v58 = type metadata accessor for Logger(0);
    sub_10000A4A4(v58, (uint64_t)qword_100042DE8);
    swift_bridgeObjectRetain(v55);
    v59 = swift_bridgeObjectRetain(v53);
    v60 = Logger.logObject.getter(v59);
    v61 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = swift_slowAlloc(22, -1);
      *(_DWORD *)v62 = 134218240;
      v101 = v56;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, v102, v62 + 4, v62 + 12);
      swift_bridgeObjectRelease(v55);
      *(_WORD *)(v62 + 12) = 2048;
      v101 = v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, v102, v62 + 14, v62 + 22);
      swift_bridgeObjectRelease(v53);
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "Unable to fetch some reminders. reminders count doesn't match with reminderIDs count. {notificationIdentifiers.count: %ld, reminders.count: %ld}", (uint8_t *)v62, 0x16u);
      swift_slowDealloc(v62, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease(v53);
      swift_bridgeObjectRelease(v55);
    }
    v19 = v98;
  }
  if (qword_1000420B0 != -1)
    swift_once(&qword_1000420B0, sub_10002E6EC);
  v63 = type metadata accessor for Logger(0);
  sub_10000A4A4(v63, (uint64_t)qword_100042DE8);
  swift_bridgeObjectRetain_n(v55, 2);
  v64 = swift_bridgeObjectRetain(v53);
  v65 = Logger.logObject.getter(v64);
  v66 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = v19;
    v68 = swift_slowAlloc(22, -1);
    v69 = swift_slowAlloc(32, -1);
    v101 = v69;
    *(_DWORD *)v68 = 134218242;
    swift_bridgeObjectRelease(v55);
    v100 = v56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v68 + 4, v68 + 12);
    swift_bridgeObjectRelease(v55);
    *(_WORD *)(v68 + 12) = 2080;
    v70 = swift_bridgeObjectRetain(v53);
    v71 = Array.description.getter(v70, v67);
    v73 = v72;
    swift_bridgeObjectRelease(v53);
    v100 = sub_10002CB54(v71, v73, &v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v68 + 14, v68 + 22);
    swift_bridgeObjectRelease_n(v53, 2);
    swift_bridgeObjectRelease(v73);
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Retrieved %ld reminders from notification center {notificationIdentifiers: %s}", (uint8_t *)v68, 0x16u);
    swift_arrayDestroy(v69, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v69, -1, -1);
    swift_slowDealloc(v68, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v53, 2);
    swift_bridgeObjectRelease_n(v55, 2);
  }
  v85(v55);
  return swift_bridgeObjectRelease(v55);
}

uint64_t sub_10002F418(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26[2];

  v6 = (uint64_t *)(a2 + 16);
  v7 = (_QWORD *)(a3 + 16);
  v8 = swift_bridgeObjectRetain(a1);
  v9 = (uint64_t)sub_10002F784(v8, v6, v7);
  swift_bridgeObjectRelease(a1);
  if (qword_1000420B0 != -1)
    swift_once(&qword_1000420B0, sub_10002E6EC);
  v10 = type metadata accessor for Logger(0);
  sub_10000A4A4(v10, (uint64_t)qword_100042DE8);
  v11 = swift_bridgeObjectRetain_n(v9, 4);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v15 = swift_slowAlloc(32, -1);
    v26[0] = v15;
    *(_DWORD *)v14 = 134218242;
    v24 = a4;
    if ((unint64_t)v9 >> 62)
    {
      if (v9 < 0)
        v23 = v9;
      else
        v23 = v9 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v9);
      v16 = _CocoaArrayWrapper.endIndex.getter(v23);
      swift_bridgeObjectRelease(v9);
    }
    else
    {
      v16 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v9);
    v25 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v9);
    *(_WORD *)(v14 + 12) = 2080;
    v17 = sub_10000A848(0, (unint64_t *)&unk_1000427F0, REMReminder_ptr);
    v18 = swift_bridgeObjectRetain(v9);
    v19 = Array.description.getter(v18, v17);
    v21 = v20;
    swift_bridgeObjectRelease(v9);
    v25 = sub_10002CB54(v19, v21, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v14 + 14, v14 + 22);
    swift_bridgeObjectRelease_n(v9, 2);
    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Got %ld matchingReminders matching searchTerms {matchingReminders: %s}", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    v24(v9);
  }
  else
  {

    swift_bridgeObjectRelease_n(v9, 4);
    a4(v9);
  }
  return swift_bridgeObjectRelease(v9);
}

uint64_t sub_10002F6A8()
{
  uint64_t v0;

  sub_10000A880((_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for TTRIntentsHandlerNotificationCenterDataSource()
{
  return objc_opt_self(_TtC25RemindersIntentsExtension45TTRIntentsHandlerNotificationCenterDataSource);
}

uint64_t sub_10002F6F4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F718()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002F74C(uint64_t a1)
{
  uint64_t v1;

  return sub_10002F418(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

uint64_t sub_10002F758()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

_QWORD *sub_10002F784(unint64_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char v46[24];
  char v47[24];
  _QWORD *v48;

  v4 = a1;
  v48 = _swiftEmptyArrayStorage;
  if (a1 >> 62)
    goto LABEL_55;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  swift_beginAccess(a2, v47, 0, 0);
  swift_beginAccess(a3, v46, 0, 0);
  if (v5)
  {
    v6 = 0;
    v43 = v4 & 0xFFFFFFFFFFFFFF8;
    v44 = v4 & 0xC000000000000001;
    v41 = v4;
    v42 = v4 + 32;
    v38 = a2;
    v40 = v5;
    while (1)
    {
      if (v44)
      {
        v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v4);
      }
      else
      {
        if (v6 >= *(_QWORD *)(v43 + 16))
          goto LABEL_52;
        v8 = *(id *)(v42 + 8 * v6);
      }
      v9 = v8;
      v10 = __OFADD__(v6, 1);
      v11 = v6 + 1;
      if (v10)
        goto LABEL_53;
      v45 = v11;
      v12 = *a2;
      swift_bridgeObjectRetain(*a2);
      v13 = objc_msgSend(v9, "objectID");
      if ((unint64_t)v12 >> 62)
      {
        if (v12 < 0)
          v35 = v12;
        else
          v35 = v12 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v12);
        v14 = _CocoaArrayWrapper.endIndex.getter(v35);
        if (!v14)
          goto LABEL_19;
      }
      else
      {
        v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v12);
        if (!v14)
          goto LABEL_19;
      }
      if ((v12 & 0xC000000000000001) != 0)
        v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v12);
      else
        v15 = *(id *)(v12 + 32);
      v16 = v15;
      sub_10000A848(0, &qword_100042768, REMObjectID_ptr);
      v4 = static NSObject.== infix(_:_:)(v16, v13);

      if ((v4 & 1) != 0)
      {

        v17 = swift_bridgeObjectRelease_n(v12, 2);
LABEL_41:
        v7 = v40;
        v4 = v41;
        v6 = v45;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
        v33 = v48[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v33);
        v34 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v9);
        specialized ContiguousArray._endMutation()(v34);
        goto LABEL_7;
      }
      if (v14 != 1)
      {
        if ((v12 & 0xC000000000000001) != 0)
        {
          v28 = 1;
          while (1)
          {
            v29 = specialized _ArrayBuffer._getElementSlowPath(_:)(v28, v12);
            a2 = (uint64_t *)(v28 + 1);
            if (__OFADD__(v28, 1))
              break;
            v4 = v29;
            v30 = static NSObject.== infix(_:_:)(v29, v13);
            swift_unknownObjectRelease(v4);
            if ((v30 & 1) != 0)
              goto LABEL_39;
            ++v28;
            if (a2 == (uint64_t *)v14)
              goto LABEL_38;
          }
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        v31 = 5;
        while (1)
        {
          a2 = (uint64_t *)(v31 - 3);
          if (__OFADD__(v31 - 4, 1))
            break;
          v32 = *(id *)(v12 + 8 * v31);
          v4 = static NSObject.== infix(_:_:)(v32, v13);

          if ((v4 & 1) != 0)
          {
LABEL_39:

            v17 = swift_bridgeObjectRelease_n(v12, 2);
LABEL_40:
            a2 = v38;
            goto LABEL_41;
          }
          ++v31;
          if (a2 == (uint64_t *)v14)
          {
LABEL_38:

            swift_bridgeObjectRelease(v12);
            a2 = v38;
            goto LABEL_20;
          }
        }
LABEL_54:
        __break(1u);
LABEL_55:
        if (v4 < 0)
          v37 = v4;
        else
          v37 = v4 & 0xFFFFFFFFFFFFFF8;
        v5 = _CocoaArrayWrapper.endIndex.getter(v37);
        goto LABEL_3;
      }
LABEL_19:

      swift_bridgeObjectRelease(v12);
LABEL_20:
      swift_bridgeObjectRelease(v12);
      v18 = *a3;
      v19 = *(_QWORD *)(*a3 + 16);
      if (v19)
      {
        swift_bridgeObjectRetain(*a3);
        v20 = (_QWORD *)(v18 + 40);
        while (1)
        {
          v22 = *(v20 - 1);
          v21 = (void *)*v20;
          swift_bridgeObjectRetain(*v20);
          v23 = objc_msgSend(v9, "titleAsString");
          if (v23)
          {
            v24 = v23;
            static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
            v26 = v25;

            v27._countAndFlagsBits = v22;
            v27._object = v21;
            LOBYTE(v24) = String.fuzzyMatch(_:)(v27);
            swift_bridgeObjectRelease(v26);
            swift_bridgeObjectRelease(v21);
            if ((v24 & 1) != 0)
            {
              v17 = swift_bridgeObjectRelease(v18);
              goto LABEL_40;
            }
          }
          else
          {
            swift_bridgeObjectRelease(v21);
          }
          v20 += 2;
          if (!--v19)
          {

            swift_bridgeObjectRelease(v18);
            a2 = v38;
            goto LABEL_6;
          }
        }
      }

LABEL_6:
      v7 = v40;
      v4 = v41;
      v6 = v45;
LABEL_7:
      if (v6 == v7)
        return v48;
    }
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10002FB64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002FB74(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002FB80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000A808(v0, qword_100042EB8);
  v1 = sub_10000A4A4(v0, (uint64_t)qword_100042EB8);
  if (qword_100042090 != -1)
    swift_once(&qword_100042090, sub_1000288F0);
  v2 = sub_10000A4A4(v0, (uint64_t)qword_1000432A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_10002FC10(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint8_t *v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t *p_align;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *ObjCClassFromMetadata;
  NSArray v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  unint64_t v81;
  void *v82;
  _QWORD *i;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  id v91;
  objc_class *v92;
  uint64_t v93;
  id v94;
  uint8_t *v95;
  uint8_t *v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;

  if (qword_1000420B8 != -1)
    swift_once(&qword_1000420B8, sub_10002FB80);
  v6 = type metadata accessor for Logger(0);
  v7 = (uint8_t *)sub_10000A4A4(v6, (uint64_t)qword_100042EB8);
  v8 = a1;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  p_align = &stru_100040FE8.align;
  if (os_log_type_enabled(v9, v10))
  {
    v97 = a3;
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v95 = v7;
    v13 = (_QWORD *)swift_slowAlloc(32, -1);
    v100 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = objc_msgSend(v8, "contactEventTrigger");
    v15 = sub_10000A430(&qword_100042EE0);
    v16 = Optional.descriptionOrNil.getter(v15);
    v18 = v17;

    v19 = v16;
    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    v99 = sub_10002CB54(v19, v18, (uint64_t *)&v100);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v12 + 4, v12 + 12);

    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "SiriKit asked for resolving contactEventTrigger {contactEventTrigger: %s}", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    v7 = v95;
    swift_slowDealloc(v13, -1, -1);
    v20 = v12;
    a3 = v97;
    swift_slowDealloc(v20, -1, -1);

  }
  else
  {

  }
  v21 = objc_msgSend(v8, *((SEL *)p_align + 173));
  if (!v21)
    goto LABEL_18;
  v22 = v21;
  v23 = objc_msgSend(v21, "triggerContact");
  if (!v23)
  {

LABEL_18:
    v41 = Logger.logObject.getter(v21);
    v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Got nil contactEventTrigger. {result: .notRequired}", v43, 2u);
      swift_slowDealloc(v43, -1, -1);
    }

    v44 = sub_10000A848(0, &qword_100042EE8, INSetTaskAttributeContactEventTriggerResolutionResult_ptr);
    v22 = objc_msgSend((id)swift_getObjCClassFromMetadata(v44), "notRequired");
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v22);
    goto LABEL_21;
  }
  v24 = v23;
  v25 = objc_msgSend(v8, "targetTask");
  if (!v25
    || (v26 = v25,
        v27 = (void *)INTask.remReminder(store:)(*(_QWORD *)(a2
                                                           + OBJC_IVAR____TtC25RemindersIntentsExtension32TTRSetTaskAttributeIntentHandler_store)),
        v26,
        !v27)
    || (v28 = objc_msgSend(v27, "account"),
        v29 = objc_msgSend(v28, "capabilities"),
        v28,
        v27,
        !v29))
  {
    v36 = Logger.logObject.getter(v25);
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Unable to lookup capabilities. Ignoring contactEventTrigger. {result: .notRequired}", v38, 2u);
      swift_slowDealloc(v38, -1, -1);
    }

    v39 = sub_10000A848(0, &qword_100042EE8, INSetTaskAttributeContactEventTriggerResolutionResult_ptr);
    v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(v39), "notRequired");
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v40);

    v22 = v40;
    goto LABEL_21;
  }
  v30 = objc_msgSend(v29, "supportsPersonTrigger");
  if (!(_DWORD)v30)
  {
    v45 = Logger.logObject.getter(v30);
    v46 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Reminder account doesn't support contactTrigger. {result: .unsupported(.accountDoesNotSupport)}", v47, 2u);
      swift_slowDealloc(v47, -1, -1);
    }

    v48 = objc_msgSend((id)objc_opt_self(INSetTaskAttributeContactEventTriggerResolutionResult), "unsupportedForReason:", 1);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v48);

    v22 = v48;
    goto LABEL_21;
  }
  v31 = objc_msgSend(v24, "contactIdentifier");
  if (v31)
  {

    v32 = sub_10000A430(&qword_1000427E0);
    v33 = (_QWORD *)swift_allocObject(v32, 40, 7);
    *((_OWORD *)v33 + 1) = xmmword_100034890;
    v33[4] = v24;
    v100 = v33;
    specialized Array._endMutation()(v33);
    v34 = (uint64_t)v100;
    v35 = v24;
  }
  else
  {
    v49 = objc_msgSend(v24, "alternatives");
    if (v49)
    {
      v50 = v49;
      v51 = sub_10000A848(0, &qword_100042BB8, INPerson_ptr);
      v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v50, v51);

    }
    else
    {
      v34 = (uint64_t)_swiftEmptyArrayStorage;
    }
  }
  if ((unint64_t)v34 >> 62)
  {
    if (v34 < 0)
      v60 = v34;
    else
      v60 = v34 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v34);
    v52 = _CocoaArrayWrapper.endIndex.getter(v60);
    swift_bridgeObjectRelease(v34);
    v94 = v29;
    if (v52)
      goto LABEL_30;
LABEL_41:
    swift_bridgeObjectRelease(v34);
    v52 = (uint64_t)_swiftEmptyArrayStorage;
    goto LABEL_42;
  }
  v52 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
  v94 = v29;
  if (!v52)
    goto LABEL_41;
LABEL_30:
  v96 = v7;
  v100 = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v52);
  if (v52 < 0)
  {
    __break(1u);
LABEL_69:
    v92 = (objc_class *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v52);
LABEL_65:
    v75.super.isa = v92;
    swift_bridgeObjectRelease(v52);
    v93 = sub_10000A848(0, &qword_100042EE8, INSetTaskAttributeContactEventTriggerResolutionResult_ptr);
    v76 = objc_msgSend((id)swift_getObjCClassFromMetadata(v93), "successWithResolvedContactEventTrigger:", v75.super.isa);
    goto LABEL_66;
  }
  v53 = 0;
  do
  {
    if ((v34 & 0xC000000000000001) != 0)
      v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v53, v34);
    else
      v54 = *(id *)(v34 + 8 * v53 + 32);
    v55 = v54;
    ++v53;
    v56 = objc_msgSend(objc_allocWithZone((Class)INContactEventTrigger), "initWithTriggerContact:", v54);

    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v57);
    v58 = v100[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v58);
    v59 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v58, v56);
    specialized ContiguousArray._endMutation()(v59);
  }
  while (v52 != v53);
  v52 = (uint64_t)v100;
  swift_bridgeObjectRelease(v34);
  v7 = v96;
  v29 = v94;
LABEL_42:
  if ((unint64_t)v52 >> 62)
  {
    if (v52 < 0)
      v77 = v52;
    else
      v77 = v52 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v52);
    v61 = _CocoaArrayWrapper.endIndex.getter(v77);
    swift_bridgeObjectRelease(v52);
    if (v61 >= 2)
      goto LABEL_44;
  }
  else
  {
    v61 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v61 >= 2)
    {
LABEL_44:
      v62 = swift_bridgeObjectRetain_n(v52, 2);
      v63 = Logger.logObject.getter(v62);
      v64 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v63, v64))
      {
        v65 = (uint8_t *)swift_slowAlloc(12, -1);
        v98 = (_QWORD *)swift_slowAlloc(32, -1);
        v100 = v98;
        *(_DWORD *)v65 = 136315138;
        v66 = v24;
        v67 = sub_10000A848(0, &qword_100042ED8, INContactEventTrigger_ptr);
        v68 = swift_bridgeObjectRetain(v52);
        v69 = Array.description.getter(v68, v67);
        v71 = v70;
        swift_bridgeObjectRelease(v52);
        v72 = v69;
        v24 = v66;
        v29 = v94;
        v99 = sub_10002CB54(v72, v71, (uint64_t *)&v100);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v65 + 4, v65 + 12);
        swift_bridgeObjectRelease_n(v52, 2);
        swift_bridgeObjectRelease(v71);
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "Got >1 triggersToChoose {result: .disambiguation(%s)}", v65, 0xCu);
        swift_arrayDestroy(v98, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v98, -1, -1);
        swift_slowDealloc(v65, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v52, 2);
      }
      v73 = sub_10000A848(0, &qword_100042EE8, INSetTaskAttributeContactEventTriggerResolutionResult_ptr);
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v73);
      sub_10000A848(0, &qword_100042ED8, INContactEventTrigger_ptr);
      v75.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v52);
      v76 = objc_msgSend(ObjCClassFromMetadata, "disambiguationWithContactEventTriggersToDisambiguate:", v75.super.isa);
LABEL_66:
      v91 = v76;

LABEL_67:
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v91);

LABEL_21:
      return;
    }
  }
  if (v61 != 1)
  {
    v86 = swift_bridgeObjectRelease(v52);
    v87 = Logger.logObject.getter(v86);
    v88 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v89 = 0;
      _os_log_impl((void *)&_mh_execute_header, v87, v88, "Got 0 triggersToChoose {result: .unsupported}", v89, 2u);
      swift_slowDealloc(v89, -1, -1);
    }

    v90 = sub_10000A848(0, &qword_100042EE8, INSetTaskAttributeContactEventTriggerResolutionResult_ptr);
    v91 = objc_msgSend((id)swift_getObjCClassFromMetadata(v90), "unsupported");
    goto LABEL_67;
  }
  v78 = swift_bridgeObjectRetain_n(v52, 2);
  v79 = Logger.logObject.getter(v78);
  v80 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v79, v80))
  {

    swift_bridgeObjectRelease_n(v52, 2);
    v81 = v52 & 0xC000000000000001;
    goto LABEL_62;
  }
  v7 = (uint8_t *)swift_slowAlloc(12, -1);
  v34 = swift_slowAlloc(8, -1);
  *(_DWORD *)v7 = 138412290;
  v81 = v52 & 0xC000000000000001;
  if ((v52 & 0xC000000000000001) != 0)
    goto LABEL_71;
  if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v82 = v24;
    for (i = *(id *)(v52 + 32); ; i = (_QWORD *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v52))
    {
      v84 = i;
      v100 = i;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v7 + 4, v7 + 12);
      *(_QWORD *)v34 = v84;
      swift_bridgeObjectRelease_n(v52, 2);
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "Got 1 triggersToChoose {result: .success(%@)}", v7, 0xCu);
      v85 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v34, 1, v85);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v7, -1, -1);

      v24 = v82;
      v29 = v94;
LABEL_62:
      if (v81)
        break;
      if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v92 = (objc_class *)*(id *)(v52 + 32);
        goto LABEL_65;
      }
      __break(1u);
LABEL_71:
      v82 = v24;
    }
    goto LABEL_69;
  }
  __break(1u);
}

void sub_1000307C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint8_t *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t *p_align;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *ObjCClassFromMetadata;
  NSArray v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  _QWORD *i;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  uint8_t *v86;
  uint64_t v87;
  id v88;
  objc_class *v89;
  uint64_t v90;
  void *v91;
  uint8_t *v92;
  uint8_t *v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;

  if (qword_1000420B8 != -1)
    swift_once(&qword_1000420B8, sub_10002FB80);
  v5 = type metadata accessor for Logger(0);
  v6 = (uint8_t *)sub_10000A4A4(v5, (uint64_t)qword_100042EB8);
  v7 = a1;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  p_align = &stru_100040FE8.align;
  if (os_log_type_enabled(v8, v9))
  {
    v94 = a3;
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v92 = v6;
    v12 = (_QWORD *)swift_slowAlloc(32, -1);
    v97 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = objc_msgSend(v7, "contactEventTrigger");
    v14 = sub_10000A430(&qword_100042EE0);
    v15 = Optional.descriptionOrNil.getter(v14);
    v17 = v16;

    v18 = v15;
    p_align = (_DWORD *)(&stru_100040FE8 + 24);
    v96 = sub_10002CB54(v18, v17, (uint64_t *)&v97);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v11 + 4, v11 + 12);

    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "SiriKit asked for resolving contactEventTrigger {contactEventTrigger: %s}", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    v6 = v92;
    swift_slowDealloc(v12, -1, -1);
    v19 = v11;
    a3 = v94;
    swift_slowDealloc(v19, -1, -1);

  }
  else
  {

  }
  v20 = objc_msgSend(v7, *((SEL *)p_align + 173));
  if (!v20)
    goto LABEL_13;
  v21 = v20;
  v22 = objc_msgSend(v20, "triggerContact");
  if (!v22)
  {

LABEL_13:
    v32 = Logger.logObject.getter(v20);
    v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Got nil contactEventTrigger. {result: .notRequired}", v34, 2u);
      swift_slowDealloc(v34, -1, -1);
    }

    v35 = sub_10000A848(0, &qword_100042ED0, INAddTasksContactEventTriggerResolutionResult_ptr);
    v21 = objc_msgSend((id)swift_getObjCClassFromMetadata(v35), "notRequired");
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v21);
    goto LABEL_16;
  }
  v23 = v22;
  v24 = sub_10001F8E8(v7);
  if (!v24)
  {
    v36 = Logger.logObject.getter(0);
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Unable to lookup capabilities. Ignoring contactEventTrigger. {result: .notRequired}", v38, 2u);
      swift_slowDealloc(v38, -1, -1);
    }

    v39 = sub_10000A848(0, &qword_100042ED0, INAddTasksContactEventTriggerResolutionResult_ptr);
    v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(v39), "notRequired");
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v40);

    v21 = v40;
    goto LABEL_16;
  }
  v25 = v24;
  v26 = objc_msgSend(v24, "supportsPersonTrigger");
  if ((v26 & 1) == 0)
  {
    v41 = Logger.logObject.getter(v26);
    v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Reminder account doesn't support contactTrigger. {result: .unsupported(.accountDoesNotSupport)}", v43, 2u);
      swift_slowDealloc(v43, -1, -1);
    }

    v44 = objc_msgSend((id)objc_opt_self(INAddTasksContactEventTriggerResolutionResult), "unsupportedForReason:", 1);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v44);

    v21 = v44;
    goto LABEL_16;
  }
  v27 = objc_msgSend(v23, "contactIdentifier");
  if (v27)
  {

    v28 = sub_10000A430(&qword_1000427E0);
    v29 = (_QWORD *)swift_allocObject(v28, 40, 7);
    *((_OWORD *)v29 + 1) = xmmword_100034890;
    v29[4] = v23;
    v97 = v29;
    specialized Array._endMutation()(v29);
    v30 = (uint64_t)v97;
    v31 = v23;
  }
  else
  {
    v45 = objc_msgSend(v23, "alternatives");
    if (v45)
    {
      v46 = v45;
      v47 = sub_10000A848(0, &qword_100042BB8, INPerson_ptr);
      v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v46, v47);

    }
    else
    {
      v30 = (uint64_t)_swiftEmptyArrayStorage;
    }
  }
  if ((unint64_t)v30 >> 62)
  {
    if (v30 < 0)
      v72 = v30;
    else
      v72 = v30 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v30);
    v48 = _CocoaArrayWrapper.endIndex.getter(v72);
    swift_bridgeObjectRelease(v30);
    v91 = v25;
    if (v48)
    {
LABEL_28:
      v93 = v6;
      v97 = _swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v48);
      if (v48 < 0)
      {
        __break(1u);
LABEL_66:
        v89 = (objc_class *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v48);
LABEL_62:
        v70.super.isa = v89;
        swift_bridgeObjectRelease(v48);
        v90 = sub_10000A848(0, &qword_100042ED0, INAddTasksContactEventTriggerResolutionResult_ptr);
        v71 = objc_msgSend((id)swift_getObjCClassFromMetadata(v90), "successWithResolvedContactEventTrigger:", v70.super.isa);
        goto LABEL_63;
      }
      v49 = 0;
      do
      {
        if ((v30 & 0xC000000000000001) != 0)
          v50 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v49, v30);
        else
          v50 = *(id *)(v30 + 8 * v49 + 32);
        v51 = v50;
        ++v49;
        v52 = objc_msgSend(objc_allocWithZone((Class)INContactEventTrigger), "initWithTriggerContact:", v50);

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v53);
        v54 = v97[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v54);
        v55 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v54, v52);
        specialized ContiguousArray._endMutation()(v55);
      }
      while (v48 != v49);
      v48 = (uint64_t)v97;
      swift_bridgeObjectRelease(v30);
      v6 = v93;
      v25 = v91;
      if (!((unint64_t)v48 >> 62))
        goto LABEL_35;
LABEL_45:
      if (v48 < 0)
        v73 = v48;
      else
        v73 = v48 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v48);
      v56 = _CocoaArrayWrapper.endIndex.getter(v73);
      swift_bridgeObjectRelease(v48);
      if (v56 >= 2)
        goto LABEL_36;
      goto LABEL_49;
    }
  }
  else
  {
    v48 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
    v91 = v25;
    if (v48)
      goto LABEL_28;
  }
  swift_bridgeObjectRelease(v30);
  v48 = (uint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)_swiftEmptyArrayStorage >> 62)
    goto LABEL_45;
LABEL_35:
  v56 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v56 >= 2)
  {
LABEL_36:
    v57 = swift_bridgeObjectRetain_n(v48, 2);
    v58 = Logger.logObject.getter(v57);
    v59 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc(12, -1);
      v95 = (_QWORD *)swift_slowAlloc(32, -1);
      v97 = v95;
      *(_DWORD *)v60 = 136315138;
      v61 = v23;
      v62 = sub_10000A848(0, &qword_100042ED8, INContactEventTrigger_ptr);
      v63 = swift_bridgeObjectRetain(v48);
      v64 = Array.description.getter(v63, v62);
      v66 = v65;
      swift_bridgeObjectRelease(v48);
      v67 = v64;
      v23 = v61;
      v25 = v91;
      v96 = sub_10002CB54(v67, v66, (uint64_t *)&v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v60 + 4, v60 + 12);
      swift_bridgeObjectRelease_n(v48, 2);
      swift_bridgeObjectRelease(v66);
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Got >1 triggersToChoose {result: .disambiguation(%s)}", v60, 0xCu);
      swift_arrayDestroy(v95, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v95, -1, -1);
      swift_slowDealloc(v60, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v48, 2);
    }
    v68 = sub_10000A848(0, &qword_100042ED0, INAddTasksContactEventTriggerResolutionResult_ptr);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v68);
    sub_10000A848(0, &qword_100042ED8, INContactEventTrigger_ptr);
    v70.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v48);
    v71 = objc_msgSend(ObjCClassFromMetadata, "disambiguationWithContactEventTriggersToDisambiguate:", v70.super.isa);
LABEL_63:
    v88 = v71;

LABEL_64:
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v88);

LABEL_16:
    return;
  }
LABEL_49:
  if (v56 != 1)
  {
    v83 = swift_bridgeObjectRelease(v48);
    v84 = Logger.logObject.getter(v83);
    v85 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v84, v85))
    {
      v86 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v86 = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Got 0 triggersToChoose {result: .unsupported}", v86, 2u);
      swift_slowDealloc(v86, -1, -1);
    }

    v87 = sub_10000A848(0, &qword_100042ED0, INAddTasksContactEventTriggerResolutionResult_ptr);
    v88 = objc_msgSend((id)swift_getObjCClassFromMetadata(v87), "unsupported");
    goto LABEL_64;
  }
  v74 = swift_bridgeObjectRetain_n(v48, 2);
  v75 = Logger.logObject.getter(v74);
  v76 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v75, v76))
  {

    swift_bridgeObjectRelease_n(v48, 2);
    v78 = v48 & 0xC000000000000001;
    goto LABEL_59;
  }
  v6 = (uint8_t *)swift_slowAlloc(12, -1);
  v77 = swift_slowAlloc(8, -1);
  v30 = v77;
  *(_DWORD *)v6 = 138412290;
  v78 = v48 & 0xC000000000000001;
  if ((v48 & 0xC000000000000001) != 0)
    goto LABEL_68;
  if (*(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v79 = v23;
    for (i = *(id *)(v48 + 32); ; i = (_QWORD *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v48))
    {
      v81 = i;
      v97 = i;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v97, &v98, v6 + 4, v6 + 12);
      *(_QWORD *)v30 = v81;
      swift_bridgeObjectRelease_n(v48, 2);
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "Got 1 triggersToChoose {result: .success(%@)}", v6, 0xCu);
      v82 = sub_10000A430((uint64_t *)&unk_1000422E0);
      swift_arrayDestroy(v30, 1, v82);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v6, -1, -1);

      v23 = v79;
      v25 = v91;
LABEL_59:
      if (v78)
        break;
      if (*(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v89 = (objc_class *)*(id *)(v48 + 32);
        goto LABEL_62;
      }
      __break(1u);
LABEL_68:
      v79 = v23;
    }
    goto LABEL_66;
  }
  __break(1u);
  DateComponents.rem_allDayDateComponents()(v77);
}

id objc_msgSend_all(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "all");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

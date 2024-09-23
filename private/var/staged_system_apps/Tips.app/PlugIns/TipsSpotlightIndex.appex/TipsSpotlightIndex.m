void sub_100003050(uint64_t a1, void *a2)
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

uint64_t sub_100003120(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  _BYTE v26[8];

  v9 = *(_QWORD *)(type metadata accessor for TipsLog(0) - 8);
  v10 = __chkstk_darwin();
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v24 = v10;
    v13 = swift_errorRetain(a1);
    static TipsLog.indexing.getter(v13);
    v14 = sub_100003770(&qword_1000081A8);
    v15 = swift_allocObject(v14, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_100003B50;
    swift_getErrorValue(a1, v26, v25);
    v16 = a2;
    v17 = a5;
    v18 = Error.localizedDescription.getter(v25[1], v25[2]);
    v20 = v19;
    *(_QWORD *)(v15 + 56) = &type metadata for String;
    *(_QWORD *)(v15 + 64) = sub_100003840();
    *(_QWORD *)(v15 + 32) = v18;
    *(_QWORD *)(v15 + 40) = v20;
    v21 = v17;
    a2 = v16;
    logError(_:_:_:)(v12, a4, v21, 2, v15);
    swift_bridgeObjectRelease(v15);
    swift_errorRelease(a1);
    v10 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v24);
  }
  return a2(v10);
}

id sub_100003398()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IndexRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IndexRequestHandler()
{
  return objc_opt_self(_TtC18TipsSpotlightIndex19IndexRequestHandler);
}

uint64_t sub_1000033F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000341C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_100003428(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD aBlock[5];
  uint64_t v16;

  v5 = type metadata accessor for TipsLog(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin();
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TipsLog.indexing.getter(v7);
  logInfo(_:_:)(v9, 0xD000000000000011, 0x8000000100003CA0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v10 = *(void **)(v2 + OBJC_IVAR____TtC18TipsSpotlightIndex19IndexRequestHandler_searchQueryClient);
  v11 = swift_allocObject(&unk_100004298, 32, 7);
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  aBlock[4] = sub_1000038E4;
  v16 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003050;
  aBlock[3] = &unk_1000042B0;
  v12 = _Block_copy(aBlock);
  v13 = v16;
  v14 = v10;
  swift_retain(a2);
  swift_release(v13);
  objc_msgSend(v14, "reindexAllSearchableItemsWithCompletionHandler:", v12);
  _Block_release(v12);

}

void sub_100003574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  Class isa;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[5];
  uint64_t v27;

  v4 = v3;
  v25 = a2;
  v7 = type metadata accessor for TipsLog(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TipsLog.indexing.getter(v9);
  v12 = sub_100003770(&qword_1000081A8);
  v13 = swift_allocObject(v12, 72, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100003B50;
  aBlock[0] = a1;
  v14 = sub_100003770(&qword_1000081B0);
  v15 = sub_1000037B0();
  v16 = BidirectionalCollection<>.joined(separator:)(0, 0xE000000000000000, v14, v15);
  v18 = v17;
  *(_QWORD *)(v13 + 56) = &type metadata for String;
  *(_QWORD *)(v13 + 64) = sub_100003840();
  *(_QWORD *)(v13 + 32) = v16;
  *(_QWORD *)(v13 + 40) = v18;
  logInfo(_:_:_:)(v11, "Reindex specific items; item identifiers = %@", 45, 2, v13);
  swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v19 = *(id *)(v4 + OBJC_IVAR____TtC18TipsSpotlightIndex19IndexRequestHandler_searchQueryClient);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v21 = swift_allocObject(&unk_100004220, 32, 7);
  *(_QWORD *)(v21 + 16) = v25;
  *(_QWORD *)(v21 + 24) = a3;
  aBlock[4] = sub_1000038A8;
  v27 = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003050;
  aBlock[3] = &unk_100004238;
  v22 = _Block_copy(aBlock);
  v23 = v27;
  swift_retain(a3);
  swift_release(v23);
  objc_msgSend(v19, "reindexSearchableItemsWithIdentifiers:completionHandler:", isa, v22);
  _Block_release(v22);

}

uint64_t sub_100003770(uint64_t *a1)
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

unint64_t sub_1000037B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000081B8;
  if (!qword_1000081B8)
  {
    v1 = sub_1000037FC(&qword_1000081B0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000081B8);
  }
  return result;
}

uint64_t sub_1000037FC(uint64_t *a1)
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

unint64_t sub_100003840()
{
  unint64_t result;

  result = qword_1000081C0;
  if (!qword_1000081C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000081C0);
  }
  return result;
}

uint64_t sub_100003884()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000038A8(uint64_t a1)
{
  uint64_t v1;

  return sub_100003120(a1, *(uint64_t (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)"Error reindexing specific items: %@", 35);
}

uint64_t sub_1000038CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000038DC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000038E4(uint64_t a1)
{
  uint64_t v1;

  return sub_100003120(a1, *(uint64_t (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)"Error reindexing all items: %@", 30);
}

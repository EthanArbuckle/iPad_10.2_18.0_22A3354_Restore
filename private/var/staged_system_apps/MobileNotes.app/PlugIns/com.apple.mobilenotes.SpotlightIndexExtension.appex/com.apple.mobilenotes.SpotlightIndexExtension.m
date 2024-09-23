void sub_100003DF4(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;

  +[ICNoteContext startSharedContextWithOptions:](ICNoteContext, "startSharedContextWithOptions:", 8456256);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "persistentContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext initializeSearchIndexerDataSourceWithPersistentContainer:](ICNoteContext, "initializeSearchIndexerDataSourceWithPersistentContainer:", v2));
  objc_msgSend(v5, "addDataSource:", v3);

  v4 = objc_alloc_init((Class)ICHTMLSearchIndexerDataSource);
  objc_msgSend(v5, "addDataSource:", v4);
  objc_msgSend(v5, "setRetryOnErrors:", 0);

}

void sub_100003FC8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100006668((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_10000663C();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000415C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000067D0(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_100006748(a1, v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000047AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000047BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ICCloudSyncingObject.MoveAction.Types.init(fromParentObject:toParentObject:)(void *a1, void *a2)
{
  return sub_100005D44(a1, a2);
}

unint64_t ICCloudSyncingObject.MoveAction.Types.init(rawValue:)(unint64_t a1)
{
  return sub_100005F08(a1);
}

BOOL sub_100004814(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100004828()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000486C()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100004894(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_1000048D4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_100005F08(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_100004904(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t ICCloudSyncingObject.MoveAction.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type);
}

id ICCloudSyncingObject.MoveAction.object.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object);
}

id ICCloudSyncingObject.MoveAction.fromParentObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject);
}

id ICCloudSyncingObject.MoveAction.toParentObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
}

uint64_t ICCloudSyncingObject.MoveAction.isCopy.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy);
}

id ICCloudSyncingObject.MoveAction.__allocating_init(type:object:fromParentObject:toParentObject:isCopy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  objc_class *v5;
  _BYTE *v11;
  objc_super v13;

  v11 = objc_allocWithZone(v5);
  *(_QWORD *)&v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_type] = a1;
  *(_QWORD *)&v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_object] = a2;
  *(_QWORD *)&v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject] = a3;
  *(_QWORD *)&v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject] = a4;
  v11[OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy] = a5;
  v13.receiver = v11;
  v13.super_class = v5;
  return objc_msgSendSuper2(&v13, "init");
}

id ICCloudSyncingObject.MoveAction.init(type:object:fromParentObject:toParentObject:isCopy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _BYTE *v5;
  objc_class *ObjectType;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType(v5);
  *(_QWORD *)&v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_type] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_object] = a2;
  *(_QWORD *)&v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject] = a3;
  *(_QWORD *)&v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject] = a4;
  v5[OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy] = a5;
  v13.receiver = v5;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, "init");
}

id ICCloudSyncingObject.MoveAction.__allocating_init(object:fromParentObject:toParentObject:isCopy:)(void *a1, void *a2, void *a3, char a4)
{
  objc_class *v4;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  id v14;
  uint64_t ObjectType;

  v9 = objc_allocWithZone(v4);
  if (!a2)
  {

    a1 = a3;
LABEL_8:

    ObjectType = swift_getObjectType(v9);
    swift_deallocPartialClassInstance(v9, ObjectType, 41, 7);
    return 0;
  }
  if (!a3)
  {

    goto LABEL_8;
  }
  v10 = a3;
  v11 = a2;
  v12 = sub_100005D44(v11, v10);
  if ((v13 & 1) != 0)
  {

    goto LABEL_8;
  }
  v14 = objc_msgSend(v9, "initWithType:object:fromParentObject:toParentObject:isCopy:", v12, a1, v11, v10, a4 & 1);

  return v14;
}

id ICCloudSyncingObject.MoveAction.init(object:fromParentObject:toParentObject:isCopy:)(void *a1, void *a2, void *a3, char a4)
{
  void *v4;
  void *v6;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  id v12;
  uint64_t ObjectType;

  v6 = a1;
  if (!a2)
  {

    v6 = a3;
LABEL_8:

    ObjectType = swift_getObjectType(v4);
    swift_deallocPartialClassInstance(v4, ObjectType, 41, 7);
    return 0;
  }
  if (!a3)
  {

    goto LABEL_8;
  }
  v8 = a2;
  v9 = a3;
  v10 = sub_100005D44(v8, v9);
  if ((v11 & 1) != 0)
  {

    goto LABEL_8;
  }
  v12 = objc_msgSend(v4, "initWithType:object:fromParentObject:toParentObject:isCopy:", v10, v6, v8, v9, a4 & 1);

  return v12;
}

id ICCloudSyncingObject.MoveAction.__allocating_init(folder:toParentObject:isCopy:)(void *a1, void *a2, char a3)
{
  objc_class *v3;
  objc_class *v4;
  id v8;
  id v9;
  id v10;

  v4 = v3;
  v8 = objc_allocWithZone(v4);
  v9 = objc_msgSend(a1, "parent");
  if (!v9)
    v9 = objc_msgSend(a1, "account");
  v10 = objc_msgSend(v8, "initWithObject:fromParentObject:toParentObject:isCopy:", a1, v9, a2, a3 & 1);

  return v10;
}

id ICCloudSyncingObject.MoveAction.init(folder:toParentObject:isCopy:)(void *a1, void *a2, char a3)
{
  void *v3;
  void *v4;
  id v8;
  id v9;

  v4 = v3;
  v8 = objc_msgSend(a1, "parent");
  if (!v8)
    v8 = objc_msgSend(a1, "account");
  v9 = objc_msgSend(v4, "initWithObject:fromParentObject:toParentObject:isCopy:", a1, v8, a2, a3 & 1);

  return v9;
}

id ICCloudSyncingObject.MoveAction.__allocating_init(note:toFolder:isCopy:)(void *a1, void *a2, char a3)
{
  objc_class *v3;
  id v7;
  id v8;
  id v9;

  v7 = objc_allocWithZone(v3);
  v8 = objc_msgSend(a1, "folder");
  v9 = objc_msgSend(v7, "initWithObject:fromParentObject:toParentObject:isCopy:", a1, v8, a2, a3 & 1);

  return v9;
}

id ICCloudSyncingObject.MoveAction.init(note:toFolder:isCopy:)(void *a1, void *a2, char a3)
{
  void *v3;
  id v7;
  id v8;

  v7 = objc_msgSend(a1, "folder");
  v8 = objc_msgSend(v3, "initWithObject:fromParentObject:toParentObject:isCopy:", a1, v7, a2, a3 & 1);

  return v8;
}

id ICCloudSyncingObject.MoveAction.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

void ICCloudSyncingObject.MoveAction.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("com_apple_mobilenotes_SpotlightIndexExtension.MoveAction", 56, "init()", 6, 0);
  __break(1u);
}

id ICCloudSyncingObject.MoveAction.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

Swift::Void __swiftcall ICCloudSyncingObject.persistParticipantActivityEvents(oldShare:newShare:)(CKShare_optional oldShare, CKShare_optional newShare)
{
  void *v2;
  void *v3;
  Class isa;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  void (*v30)(_QWORD *, _QWORD);
  uint64_t v31;
  void *v32;
  int v33;
  id v34;
  char **v35;
  uint64_t v36;
  void *v37;
  void (*v38)(char *, uint64_t);
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  uint64_t v41;
  _QWORD v42[4];
  uint64_t v43;

  v3 = *(void **)&oldShare.is_nil;
  isa = oldShare.value.super.super.isa;
  v41 = sub_1000063B4(&qword_10000C528);
  v5 = *(_QWORD *)(v41 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000063B4(&qword_10000C530);
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v40 = (char *)&v37 - v12;
  if (isa)
  {
    v13 = -[objc_class ic_nonCurrentUserParticipants](isa, "ic_nonCurrentUserParticipants");
    v14 = sub_1000065D8(0, &qword_10000C550, CKShareParticipant_ptr);
    v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, v14);

    if ((v15 & 0x8000000000000000) != 0)
      goto LABEL_9;
  }
  else
  {
    v15 = (unint64_t)&_swiftEmptyArrayStorage;
    if (((unint64_t)&_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
      goto LABEL_9;
  }
  if ((v15 & 0x4000000000000000) == 0)
  {
    v16 = v15 & 0xFFFFFFFFFFFFFF8;
    if (!v3)
      goto LABEL_10;
    goto LABEL_7;
  }
LABEL_9:
  v16 = (uint64_t)sub_100005C50(v15);
  swift_bridgeObjectRelease(v15);
  if (!v3)
  {
LABEL_10:
    v19 = (unint64_t)&_swiftEmptyArrayStorage;
    v37 = v2;
    if (((unint64_t)&_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
      goto LABEL_18;
    goto LABEL_11;
  }
LABEL_7:
  v17 = objc_msgSend(v3, "ic_nonCurrentUserParticipants");
  v18 = sub_1000065D8(0, &qword_10000C550, CKShareParticipant_ptr);
  v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v17, v18);

  v37 = v2;
  if ((v19 & 0x8000000000000000) != 0)
    goto LABEL_18;
LABEL_11:
  if ((v19 & 0x4000000000000000) == 0)
  {
    v20 = v19 & 0xFFFFFFFFFFFFFF8;
    goto LABEL_13;
  }
LABEL_18:
  v20 = (uint64_t)sub_100005C50(v19);
  swift_bridgeObjectRelease(v19);
LABEL_13:
  v42[0] = v20;
  v43 = v16;
  v21 = sub_1000063B4(&qword_10000C538);
  v22 = sub_100006598(&qword_10000C540, &qword_10000C538, (uint64_t)&protocol conformance descriptor for [A]);
  v23 = sub_100006438();
  BidirectionalCollection<>.difference<A>(from:)(&v43, v21, v21, v22, v22, v23);
  swift_release(v20);
  swift_release(v16);
  v24 = v41;
  v39 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v39(v11, v7, v41);
  v25 = sub_100006598(&qword_10000C558, &qword_10000C528, (uint64_t)&protocol conformance descriptor for CollectionDifference<A>);
  dispatch thunk of Collection.startIndex.getter(v42, v24, v25);
  v38 = *(void (**)(char *, uint64_t))(v5 + 8);
  v38(v7, v24);
  *(_QWORD *)&v11[*(int *)(v8 + 36)] = v42[0];
  v26 = (uint64_t)v40;
  sub_100006490((uint64_t)v11, (uint64_t)v40);
  v27 = (uint64_t *)(v26 + *(int *)(v8 + 36));
  v28 = *v27;
  dispatch thunk of Collection.endIndex.getter(v42, v24, v25);
  v29 = v37;
  if (v28 != v42[0])
  {
    do
    {
      v30 = (void (*)(_QWORD *, _QWORD))dispatch thunk of Collection.subscript.read(v42, v27, v24, v25);
      v32 = *(void **)(v31 + 8);
      v33 = *(unsigned __int8 *)(v31 + 25);
      v34 = v32;
      v30(v42, 0);
      v39(v7, v40, v41);
      dispatch thunk of Collection.formIndex(after:)(v27, v41, v25);
      v38(v7, v41);
      v35 = &selRef_persistRemoveParticipantActivityEventForObject_participant_;
      if (!v33)
        v35 = &selRef_persistAddParticipantActivityEventForObject_participant_;

      v26 = (uint64_t)v40;
      v24 = v41;

      v36 = *v27;
      dispatch thunk of Collection.endIndex.getter(v42, v24, v25);
    }
    while (v36 != v42[0]);
  }
  sub_1000064E0(v26, &qword_10000C530);
}

Swift::Void __swiftcall ICCloudSyncingObject.persistJoinActivityEvent()()
{
  sub_100005780(&enum case for PersistedActivityEvent.Activities.addParticipant(_:));
}

Swift::Void __swiftcall ICCloudSyncingObject.persistLeaveActivityEvent()()
{
  sub_100005780(&enum case for PersistedActivityEvent.Activities.removeParticipant(_:));
}

uint64_t sub_100005780(unsigned int *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;

  v19 = a1;
  v20 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PersistedActivityEvent.Activities(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000063B4(&qword_10000C560);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for ActivityEventParticipant(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v1;
  ActivityEventParticipant.init(cloudSyncingObject:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    return sub_1000064E0((uint64_t)v11, &qword_10000C560);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v15, v12);
  v18 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *v19, v5);
  Date.init()(v18);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v20);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_1000059A4(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
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
  void (*v17[4])(id *);

  v5 = result;
  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    result = swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      if (a3 < 0)
        v10 = a3;
      else
        v10 = a3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a3);
      v11 = _CocoaArrayWrapper.endIndex.getter(v10);
      result = swift_bridgeObjectRelease(a3);
      if (v11 <= a2)
      {
        if (v7 >= 1)
        {
          sub_100006598(&qword_10000C5A0, &qword_10000C538, (uint64_t)&protocol conformance descriptor for [A]);
          swift_bridgeObjectRetain(a3);
          for (i = 0; i != v7; ++i)
          {
            sub_1000063B4(&qword_10000C538);
            v13 = sub_100005B5C(v17, i, a3);
            v15 = *v14;
            ((void (*)(void (**)(id *), _QWORD))v13)(v17, 0);
            *(_QWORD *)(v5 + 8 * i) = v15;
          }
          swift_bridgeObjectRelease(a3);
          return a3;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v8 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v8 <= a2)
      {
        v9 = sub_1000065D8(0, &qword_10000C550, CKShareParticipant_ptr);
        swift_arrayInitWithCopy(v5, (a3 & 0xFFFFFFFFFFFFFF8) + 32, v8, v9);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_100005B5C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_100005BDC(v6, a2, a3);
  return sub_100005BB0;
}

void sub_100005BB0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100005BDC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_100005C48;
  }
  __break(1u);
  return result;
}

void sub_100005C48(id *a1)
{

}

_QWORD *sub_100005C50(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return &_swiftEmptyArrayStorage;
  while (1)
  {
    if (v2 <= 0)
    {
      v4 = &_swiftEmptyArrayStorage;
    }
    else
    {
      v3 = sub_1000063B4(&qword_10000C598);
      v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
      v5 = j__malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 25;
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v1);
    v7 = sub_1000059A4((uint64_t)(v4 + 4), v2, v1);
    v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    if (v1 < 0)
      v9 = v1;
    else
      v9 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (!v2)
      return &_swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t sub_100005D44(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  unsigned int v14;

  v4 = objc_opt_self(ICFolder);
  v5 = (void *)swift_dynamicCastObjCClass(a1, v4);
  if (v5 && objc_msgSend(v5, "isTrashFolder")
    || (v6 = objc_opt_self(ICFolder), (v7 = (void *)swift_dynamicCastObjCClass(a2, v6)) != 0)
    && objc_msgSend(v7, "isTrashFolder"))
  {

    return 0;
  }
  if (objc_msgSend(a1, "isSharedViaICloud") && objc_msgSend(a2, "isSharedViaICloud"))
  {
    v9 = objc_msgSend(a1, "sharedRootObject");
    v10 = objc_msgSend(a2, "sharedRootObject");
    v11 = v10;
    if (v9)
    {
      if (v10)
      {
        sub_1000065D8(0, &qword_10000C5A8, ICCloudSyncingObject_ptr);
        v12 = v9;
        v13 = static NSObject.== infix(_:_:)();

        if ((v13 & 1) == 0)
          return 2;
        return 3;
      }

      v11 = a2;
    }
    else
    {

      if (!v11)
        return 3;
    }

    return 2;
  }
  if ((objc_msgSend(a1, "isSharedViaICloud") & 1) != 0)
  {
    v14 = objc_msgSend(a2, "isSharedViaICloud");

    if (v14)
      return 0;
    else
      return 4;
  }
  else
  {

    return 1;
  }
}

unint64_t sub_100005F08(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

void _sSo20ICCloudSyncingObjectC45com_apple_mobilenotes_SpotlightIndexExtensionE29undoablyPersistActivityEvents3for03oldC003newC0yAbCE10MoveActionC_ABSgAJtFZ_0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  switch(*(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type))
  {
    case 0:
      return;
    case 1:
      if (!a3)
        return;
      v4 = *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
      v29 = a3;
      if (*(_BYTE *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) != 1)
        goto LABEL_28;
      v5 = *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object);
      v6 = a3;
      v7 = objc_msgSend(v6, "persistCopyActivityEventForObject:originalObject:fromParentObject:toParentObject:", v6, v5, 0, v4);
      goto LABEL_29;
    case 2:
      v29 = a3;
      if (a2)
      {
        v12 = *(void **)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject);
        v13 = a2;
        v14 = objc_msgSend(v12, "sharedRootObject");
        if (v14)
        {
          v15 = v14;
          if (*(_BYTE *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) == 1)
            v16 = objc_msgSend(v14, "persistCopyActivityEventForObject:originalObject:fromParentObject:toParentObject:", v13, *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object), v12, 0);
          else
            v16 = objc_msgSend(v14, "persistMoveActivityEventForObject:fromParentObject:toParentObject:", v13, v12, 0);
          v24 = v16;
          v25 = objc_msgSend((id)objc_opt_self(NSUndoManager), "shared");
          objc_msgSend(v25, "registerUndoForCloudSyncingObjectActivityEvent:cloudSyncingObject:", v24, v15);

          v13 = v25;
        }

        a3 = v29;
      }
      if (!a3)
        return;
      v4 = *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
      if (*(_BYTE *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) == 1)
      {
        v26 = *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object);
        v27 = a3;
        v7 = objc_msgSend(v27, "persistCopyActivityEventForObject:originalObject:fromParentObject:toParentObject:", v27, v26, 0, v4);
      }
      else
      {
LABEL_28:
        v28 = a3;
        v7 = objc_msgSend(v28, "persistMoveActivityEventForObject:fromParentObject:toParentObject:", v28, 0, v4);
      }
      goto LABEL_29;
    case 3:
      if (!a3)
        return;
      v17 = *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject);
      v18 = *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
      v29 = a3;
      if (*(_BYTE *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) == 1)
      {
        v19 = *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object);
        v20 = a3;
        v7 = objc_msgSend(v20, "persistCopyActivityEventForObject:originalObject:fromParentObject:toParentObject:", v20, v19, v17, v18);
      }
      else
      {
        v21 = a3;
        v7 = objc_msgSend(v21, "persistMoveActivityEventForObject:fromParentObject:toParentObject:", v21, v17, v18);
      }
LABEL_29:
      v22 = v7;
      v23 = objc_msgSend((id)objc_opt_self(NSUndoManager), "shared");
      objc_msgSend(v23, "registerUndoForCloudSyncingObjectActivityEvent:cloudSyncingObject:", v22, v29);
      goto LABEL_30;
    case 4:
      if (!a2)
        return;
      v8 = *(void **)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject);
      v29 = a2;
      v9 = objc_msgSend(v8, "sharedRootObject");
      if (v9)
      {
        v10 = v9;
        if (*(_BYTE *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) == 1)
          v11 = objc_msgSend(v9, "persistCopyActivityEventForObject:originalObject:fromParentObject:toParentObject:", v29, *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object), v8, 0);
        else
          v11 = objc_msgSend(v9, "persistMoveActivityEventForObject:fromParentObject:toParentObject:", v29, v8, 0);
        v22 = v11;
        v23 = objc_msgSend((id)objc_opt_self(NSUndoManager), "shared");
        objc_msgSend(v23, "registerUndoForCloudSyncingObjectActivityEvent:cloudSyncingObject:", v22, v10);

LABEL_30:
      }
      else
      {

      }
      return;
    default:
      v30 = *(_QWORD *)(a1 + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type);
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for ICCloudSyncingObject.MoveAction.Types, &v30, &type metadata for ICCloudSyncingObject.MoveAction.Types, &type metadata for Int);
      __break(1u);
      JUMPOUT(0x1000063A0);
  }
}

uint64_t sub_1000063B4(uint64_t *a1)
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

uint64_t sub_1000063F4(uint64_t *a1)
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

unint64_t sub_100006438()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C548;
  if (!qword_10000C548)
  {
    v1 = sub_1000065D8(255, &qword_10000C550, CKShareParticipant_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10000C548);
  }
  return result;
}

uint64_t sub_100006490(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000063B4(&qword_10000C530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000064E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000063B4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100006520()
{
  unint64_t result;

  result = qword_10000C568;
  if (!qword_10000C568)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ICCloudSyncingObject.MoveAction.Types, &type metadata for ICCloudSyncingObject.MoveAction.Types);
    atomic_store(result, (unint64_t *)&qword_10000C568);
  }
  return result;
}

uint64_t type metadata accessor for ICCloudSyncingObject.MoveAction()
{
  return objc_opt_self(ICCloudSyncingObjectMoveAction);
}

ValueMetadata *type metadata accessor for ICCloudSyncingObject.MoveAction.Types()
{
  return &type metadata for ICCloudSyncingObject.MoveAction.Types;
}

uint64_t sub_100006598(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000063F4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000065D8(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void sub_100006610()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000047CC();
  sub_1000047AC((void *)&_mh_execute_header, v0, v1, "Index extension wants to reindex. Deleting everything", v2, v3, v4, v5, v6);
  sub_1000047A4();
}

void sub_10000663C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000047CC();
  sub_1000047AC((void *)&_mh_execute_header, v0, v1, "Index extension did delete everything", v2, v3, v4, v5, v6);
  sub_1000047A4();
}

void sub_100006668(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error deleting everything in extension: %@", (uint8_t *)&v2, 0xCu);
  sub_1000047D8();
}

void sub_1000066D8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Index extension reindexing objectIDURIs: %@", (uint8_t *)&v2, 0xCu);
  sub_1000047D8();
}

void sub_100006748(uint64_t a1, NSObject *a2)
{
  unsigned int v3;
  _DWORD v4[2];

  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Index extension did reindex %d items", (uint8_t *)v4, 8u);
  sub_1000047D8();
}

void sub_1000067D0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  unsigned int v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;

  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6[0] = 67109378;
  v6[1] = v5;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error reindexing %d searchable items in extension: %@", (uint8_t *)v6, 0x12u);
}

void sub_10000686C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000047CC();
  sub_1000047A4();
}

void sub_100006898()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000047CC();
  sub_1000047A4();
}

id objc_msgSend_addDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDataSource:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataForTypeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForTypeIdentifier:");
}

id objc_msgSend_deleteAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllSearchableItemsWithCompletionHandler:");
}

id objc_msgSend_fileURLForTypeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLForTypeIdentifier:");
}

id objc_msgSend_initializeSearchIndexerDataSourceWithPersistentContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeSearchIndexerDataSourceWithPersistentContainer:");
}

id objc_msgSend_isValidItemIdentifier_typeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidItemIdentifier:typeIdentifier:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_logMethodCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logMethodCall:");
}

id objc_msgSend_newContextsForAllDataSources(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newContextsForAllDataSources");
}

id objc_msgSend_objectForManagedObjectIDURI_inContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForManagedObjectIDURI:inContexts:");
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentContainer");
}

id objc_msgSend_reindexSearchableItemsWithObjectIDURIs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexSearchableItemsWithObjectIDURIs:completionHandler:");
}

id objc_msgSend_reindexer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexer");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setRetryOnErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryOnErrors:");
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedContext");
}

id objc_msgSend_sharedIndexer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedIndexer");
}

id objc_msgSend_startSharedContextWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSharedContextWithOptions:");
}

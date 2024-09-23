@implementation ICSelectionStateModel

- (_TtC11MobileNotes21ICSelectionStateModel)init
{
  return (_TtC11MobileNotes21ICSelectionStateModel *)sub_1000102E8();
}

- (void).cxx_destruct
{
  sub_100012DDC((uint64_t)self + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_objectSelection, &qword_1005D1508);
  sub_100012DDC((uint64_t)self + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_containerSelection, &qword_1005D1500);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentFirstVisibleObjectIDURLForContainerObjectIDURL));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentActivityStreamSelection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentSelectedSearchResult));
  sub_100012DDC((uint64_t)self + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectIDURL, &qword_1005CEFD0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentFirstVisibleObjectIDForContainerObjectID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectID));
}

- (ICSearchResult)currentSelectedSearchResult
{
  return (ICSearchResult *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentSelectedSearchResult));
}

- (void)setCurrentSelectedSearchResult:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentSelectedSearchResult);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentSelectedSearchResult) = (Class)a3;
  v3 = a3;

}

- (NSDictionary)currentFirstVisibleObjectIDForContainerObjectID
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentFirstVisibleObjectIDForContainerObjectID);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentFirstVisibleObjectIDForContainerObjectID, v6, 0, 0);
  v3 = *v2;
  if (!v3)
    return (NSDictionary *)0;
  sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  sub_100167280();
  swift_bridgeObjectRetain(v3);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)setCurrentFirstVisibleObjectIDForContainerObjectID:(id)a3
{
  id v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _BYTE v9[24];

  v3 = a3;
  if (a3)
  {
    v5 = sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
    v6 = sub_100167280();
    v3 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, v5, v5, v6);
  }
  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_currentFirstVisibleObjectIDForContainerObjectID);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = *v7;
  *v7 = (uint64_t)v3;
  swift_bridgeObjectRelease(v8);
}

- (NSManagedObjectID)focusedNoteObjectID
{
  return (NSManagedObjectID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectID));
}

- (void)setFocusedNoteObjectID:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectID);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_focusedNoteObjectID) = (Class)a3;
  v3 = a3;

}

- (ICTagSelection)tagSelection
{
  _TtC11MobileNotes21ICSelectionStateModel *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100018D60();

  return (ICTagSelection *)v3;
}

- (ICItemIdentifier)selectedNoteBrowseContainerItemID
{
  _TtC11MobileNotes21ICSelectionStateModel *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100018628();

  return (ICItemIdentifier *)v3;
}

- (NSManagedObjectID)selectedNoteObjectID
{
  _TtC11MobileNotes21ICSelectionStateModel *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1000189CC();

  return (NSManagedObjectID *)v3;
}

- (NSManagedObjectID)selectedInvitationObjectID
{
  _TtC11MobileNotes21ICSelectionStateModel *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1000187EC();

  return (NSManagedObjectID *)v3;
}

- (NSManagedObjectID)selectedObjectID
{
  _TtC11MobileNotes21ICSelectionStateModel *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1000189CC();
  if (!v3)
    v3 = (void *)sub_1000187EC();

  return (NSManagedObjectID *)v3;
}

- (void)setSelectedNoteObjectID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  char *v10;
  _TtC11MobileNotes21ICSelectionStateModel *v11;
  _BYTE v12[24];

  v5 = sub_100012E18(&qword_1005D1508);
  __chkstk_darwin(v5);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = a3;
  v11 = self;
  if (objc_msgSend(v8, "ic_isNoteType"))
  {
    *v7 = v8;
    v7[1] = 0;
    v9 = type metadata accessor for ICSelectionStateModel.ObjectSelection(0);
    swift_storeEnumTagMultiPayload(v7, v9, 4);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 0, 1, v9);
    v10 = (char *)v11 + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_objectSelection;
    swift_beginAccess((char *)v11 + OBJC_IVAR____TtC11MobileNotes21ICSelectionStateModel_objectSelection, v12, 33, 0);
    v8 = v8;
    sub_100164108((uint64_t)v7, (uint64_t)v10, &qword_1005D1508);
    swift_endAccess(v12);
  }

}

- (id)dataRepresentation
{
  uint64_t ObjectType;
  uint64_t v4;
  _TtC11MobileNotes21ICSelectionStateModel *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;
  _TtC11MobileNotes21ICSelectionStateModel *v13;

  ObjectType = swift_getObjectType(self);
  v4 = type metadata accessor for JSONEncoder(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = self;
  v6 = JSONEncoder.init()();
  v13 = v5;
  v7 = sub_100019C6C(&qword_1005D16C8, type metadata accessor for ICSelectionStateModel, (uint64_t)&unk_100455C90);
  v8 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v13, ObjectType, v7);
  v10 = v9;

  swift_release(v6);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10013DD30(v8, v10);
  return isa;
}

+ (id)modelWithData:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  swift_getObjCClassMetadata(a1);
  v9 = (void *)sub_10015CCD8(v6, v8);
  sub_10013DD30(v6, v8);
  return v9;
}

+ (id)dataRepresentationForSelectionStateModels:(id)a3
{
  uint64_t ObjCClassMetadata;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Class isa;
  uint64_t v15;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, ObjCClassMetadata);
  v6 = type metadata accessor for JSONEncoder(0);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  v7 = JSONEncoder.init()();
  v15 = v5;
  v8 = sub_100012E18((uint64_t *)&unk_1005D6780);
  v9 = sub_100167368();
  v10 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v15, v8, v9);
  v12 = v11;
  swift_bridgeObjectRelease(v5);
  swift_release(v7);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10013DD30(v10, v12);
  return isa;
}

+ (id)modelsWithData:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSArray v8;

  swift_getObjCClassMetadata(a1);
  if (a3)
  {
    v4 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;

  }
  else
  {
    v6 = 0xF000000000000000;
  }
  v7 = sub_100166A94((uint64_t)a3, v6);
  sub_1001672D8((uint64_t)a3, v6);
  if (v7)
  {
    v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8.super.isa = 0;
  }
  return v8.super.isa;
}

- (NSString)description
{
  _TtC11MobileNotes21ICSelectionStateModel *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10015EA54();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t ObjectType;
  _TtC11MobileNotes21ICSelectionStateModel *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC11MobileNotes21ICSelectionStateModel *v9;
  void *v10;
  char v11;
  void *v13;
  _BYTE v14[24];
  uint64_t v15;
  _OWORD v16[2];

  ObjectType = swift_getObjectType(self);
  if (a3)
  {
    v6 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v16, v7);
    swift_unknownObjectRelease(a3, v8);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v9 = self;
  }
  sub_100012CE8((uint64_t)v16, (uint64_t)v14, &qword_1005CF190);
  if (!v15)
  {
    sub_100012DDC((uint64_t)v14, &qword_1005CF190);
    goto LABEL_8;
  }
  if ((swift_dynamicCast(&v13, v14, (char *)&type metadata for Any + 8, ObjectType, 6) & 1) == 0)
  {
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  v10 = v13;
  v11 = sub_100166BC0((uint64_t)self, (uint64_t)v13);

LABEL_9:
  sub_100012DDC((uint64_t)v16, &qword_1005CF190);
  return v11 & 1;
}

@end

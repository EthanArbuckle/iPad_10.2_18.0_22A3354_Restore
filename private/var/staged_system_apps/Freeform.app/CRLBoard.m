@implementation CRLBoard

- (id)searchableItemAttributeSet:(id)a3
{
  double *v4;
  _TtC8Freeform8CRLBoard *v5;
  id v6;

  if (a3)
    v4 = (double *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  else
    v4 = 0;
  v5 = self;
  v6 = sub_10071C28C(v4);

  swift_bridgeObjectRelease(v4);
  return v6;
}

- (double)lastSaveChangesTime
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_lastSaveChangesTime);
}

- (void)setLastSaveChangesTime:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_lastSaveChangesTime) = a3;
}

- (_TtC8Freeform17CRLBoardDataStore)store
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform8CRLBoard_store));
}

- (_TtC8Freeform20CRLRootContainerItem)rootContainer
{
  return (_TtC8Freeform20CRLRootContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer));
}

- (void)setRootContainer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform20CRLRootContainerItem)alternateRootContainer
{
  return (_TtC8Freeform20CRLRootContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC8Freeform8CRLBoard_alternateRootContainer));
}

- (void)setAlternateRootContainer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_alternateRootContainer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_alternateRootContainer) = (Class)a3;
  v3 = a3;

}

- (NSString)boardIdentifierStringRepresentation
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_100B118E0);
}

- (NSDictionary)items
{
  return (NSDictionary *)sub_100B11B10((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer);
}

- (NSDictionary)alternateItems
{
  return (NSDictionary *)sub_100B11B10((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform8CRLBoard_alternateRootContainer);
}

- (NSArray)infosToDisplayForInteractiveCanvas
{
  _TtC8Freeform8CRLBoard *v2;
  Class isa;

  v2 = self;
  sub_100B11C00();

  sub_1004B804C(&qword_1013E0670);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (NSArray)orderedItemUUIDs
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _TtC8Freeform8CRLBoard *v5;
  char *v6;
  Class isa;

  v2 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer);
  v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs;
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs];
  v5 = self;
  v6 = v2;
  if (!v4)
  {
    sub_100740DA4();
    v4 = *(_QWORD *)&v2[v3];
  }
  swift_bridgeObjectRetain(v4);

  type metadata accessor for UUID(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)isEqual:(id)a3
{
  return sub_10077BB24(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *, __n128))sub_100B11F00);
}

- (BOOL)crl_isEqualValue:(id)a3
{
  return sub_10077BB24(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *, __n128))sub_100B122DC);
}

- (int64_t)hash
{
  _TtC8Freeform8CRLBoard *v2;
  Swift::Int v3;

  v2 = self;
  v3 = sub_100B1267C();

  return v3;
}

- (BOOL)makeUnsupported
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_makeUnsupported);
}

- (NSUUID)id
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
  _TtC8Freeform8CRLBoard *v12;
  uint64_t v13;
  Class isa;
  _BYTE v17[24];

  v3 = type metadata accessor for CRLBoardCRDTData(0);
  __chkstk_darwin(v3);
  v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data);
  v11 = v10 + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess(v10 + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData, v17, 0, 0);
  sub_1004B8460(v11, (uint64_t)v5, type metadata accessor for CRLBoardCRDTData);
  v12 = self;
  swift_retain(v10);
  v13 = sub_1004B804C(&qword_1013E1A80);
  CRRegister.wrappedValue.getter(v13);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLBoardCRDTData);

  swift_release(v10);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (NSUUID *)isa;
}

- (NSString)title
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  _TtC8Freeform8CRLBoard *v7;
  uint64_t v8;
  NSString v9;
  _BYTE v12[24];

  v3 = type metadata accessor for CRLBoardCRDTData(0);
  __chkstk_darwin(v3);
  v5 = v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  v6 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data)
     + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess(v6, v12, 0, 0);
  sub_1004B8460((uint64_t)v6, (uint64_t)v5, type metadata accessor for CRLBoardCRDTData);
  v7 = self;
  v8 = sub_1004B804C(&qword_1013E1980);
  CRRegister.wrappedValue.getter(v8);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLBoardCRDTData);

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform8CRLBoard *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100B12B6C(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform21CRLEditingCoordinator)hack_editingCoordinator
{
  return (_TtC8Freeform21CRLEditingCoordinator *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform8CRLBoard_hack_editingCoordinator);
}

- (void)setHack_editingCoordinator:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform8CRLBoard_hack_editingCoordinator, a3);
}

- (void)enterRealTimeSyncSessionWithGloballyScopedOwnerName:(id)a3 localParticipantUUID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC8Freeform8CRLBoard *v14;
  __n128 v15;
  uint64_t v16;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  sub_100B17AD0(v11, v13, (uint64_t)v10);

  v15 = swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v15);
}

- (void)exitRealTimeSyncSession
{
  _TtC8Freeform8CRLBoard *v2;

  v2 = self;
  sub_100B1856C();

}

- (BOOL)isInBoard
{
  return 1;
}

- (BOOL)isTransactableEqualValue:(id)a3
{
  _TtC8Freeform8CRLBoard *v5;
  uint64_t v6;
  _TtC8Freeform8CRLBoard *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100B122DC((uint64_t)v10);

  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
  return v8 & 1;
}

- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3
{
  _TtC8Freeform8CRLBoard *v4;
  Class isa;

  v4 = self;
  sub_100B1B1A0(a3);

  type metadata accessor for UUID(0);
  sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)modelEnumeratorWithFlags:(unint64_t)a3
{
  return objc_msgSend(objc_allocWithZone((Class)CRLDocumentModelEnumerator), "initWithRootModelObject:flags:filter:", *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer), a3, 0);
}

- (BOOL)isSupported
{
  _TtC8Freeform8CRLBoard *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_makeUnsupported) & 1) != 0)
    return 0;
  v3 = self;
  sub_100B1BA74();
  v5 = v4;
  v6 = sub_1001E9730();

  return v6 >= v5;
}

- (BOOL)hasUnsupportedItems
{
  _TtC8Freeform8CRLBoard *v2;
  char v3;

  v2 = self;
  v3 = sub_100B1B3BC();

  return v3 & 1;
}

- (BOOL)hasItemsNeedingDownload
{
  _TtC8Freeform8CRLBoard *v2;
  char v3;

  v2 = self;
  v3 = sub_100B1B718();

  return v3 & 1;
}

- (unint64_t)resolvedMinRequiredVersion
{
  _TtC8Freeform8CRLBoard *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_100B1BA74();
  v4 = v3;

  return v4;
}

- (unint64_t)resolvedMinRequiredVersionForGoodEnoughFidelity
{
  _TtC8Freeform8CRLBoard *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_100B1BD68();
  v4 = v3;

  return v4;
}

- (BOOL)needsToShowFidelityAlertWithVersionFidelityAlertWasShown:(unint64_t)a3
{
  _TtC8Freeform8CRLBoard *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = self;
  v5 = sub_1001E9730();
  sub_100B1BD68();
  v7 = v6;

  return v5 < v7 && v5 != a3;
}

- (NSArray)sceneInfos
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  _TtC8Freeform8CRLBoard *v9;
  Class isa;
  _BYTE v13[24];

  v3 = sub_1004B804C((uint64_t *)&unk_1013F02F0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data)
     + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess(v7, v13, 0, 0);
  v8 = type metadata accessor for CRLBoardCRDTData(0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 36)], v3);
  v9 = self;
  sub_10054B7E8((uint64_t)v6, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  type metadata accessor for CRLSceneInfo(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (id)createSceneWithSceneID:(id)a3 savedRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _TtC8Freeform8CRLBoard *v17;
  void (*v18)(char *, uint64_t);
  Class isa;
  uint64_t v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)&v21 - v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = self;
  sub_100B1CDF0((uint64_t)v13, (uint64_t)v16, x, y, width, height);

  v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v13, v10);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v18(v16, v10);
  return isa;
}

- (id)getSceneWith:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform8CRLBoard *v9;
  id v10;
  uint64_t v12;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = sub_100B1D110((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (BOOL)deleteSceneWith:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _TtC8Freeform8CRLBoard *v10;
  __n128 v11;
  _BYTE v14[24];

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data);
  swift_beginAccess(v9 + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData, v14, 33, 0);
  type metadata accessor for CRLBoardCRDTData(0);
  v10 = self;
  swift_retain(v9);
  LOBYTE(a3) = sub_1005C7148((uint64_t)v8);
  swift_endAccess(v14);

  v11 = swift_release(v9);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v6 + 8))(v8, v5, v11);
  return a3 & 1;
}

- (BOOL)setSceneName:(id)a3 :(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC8Freeform8CRLBoard *v15;
  __n128 v16;
  uint64_t v18;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data);
  v15 = self;
  swift_retain(v14);
  LOBYTE(v11) = sub_100DD1CFC((uint64_t)v10, v11, v13);

  swift_bridgeObjectRelease();
  v16 = swift_release(v14);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v11 & 1;
}

- (id)getSceneName:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC8Freeform8CRLBoard *v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  NSString v19;
  _QWORD v21[3];
  _BYTE v22[24];

  v5 = type metadata accessor for CRLBoardScenesCRDTData(0);
  __chkstk_darwin(v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data);
  v13 = v12 + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess(v12 + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData, v22, 0, 0);
  v14 = type metadata accessor for CRLBoardCRDTData(0);
  sub_1004B8460(v13 + *(int *)(v14 + 36), (uint64_t)v7, type metadata accessor for CRLBoardScenesCRDTData);
  v15 = self;
  swift_retain(v12);
  v16 = sub_1004B804C((uint64_t *)&unk_101405CB0);
  CRDictionary.subscript.getter(v11, v16);
  v17 = v21[2];
  sub_1004B84A4((uint64_t)v7, type metadata accessor for CRLBoardScenesCRDTData);

  v18 = swift_release(v12);
  (*(void (**)(char *, uint64_t, __n128))(v9 + 8))(v11, v8, v18);
  if (!v17)
    return 0;
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v19;
}

- (BOOL)setSceneSavedRect:(id)a3 :(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _TtC8Freeform8CRLBoard *v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  _BYTE v23[24];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = &v23[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data);
  swift_beginAccess(v14 + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData, v23, 33, 0);
  type metadata accessor for CRLBoardCRDTData(0);
  v15 = self;
  v16 = swift_retain(v14);
  v16.n128_f64[0] = x;
  v17.n128_f64[0] = y;
  v18.n128_f64[0] = width;
  v19.n128_f64[0] = height;
  LOBYTE(a3) = sub_1005C73D0((uint64_t)v13, v16, v17, v18, v19);
  swift_endAccess(v23);

  v20 = swift_release(v14);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v11 + 8))(v13, v10, v20);
  return a3 & 1;
}

- (BOOL)applyReorderingWithReorderedScenes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform8CRLBoard *v7;
  char v8;

  v5 = type metadata accessor for CRLSceneInfo(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  v8 = sub_100B1DADC(v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (int64_t)getScenesCount
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  _TtC8Freeform8CRLBoard *v9;
  int64_t v10;
  _BYTE v13[24];

  v3 = sub_1004B804C((uint64_t *)&unk_1013F02F0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data)
     + OBJC_IVAR____TtC8Freeform12CRLBoardData_crdtData;
  swift_beginAccess(v7, v13, 0, 0);
  v8 = type metadata accessor for CRLBoardCRDTData(0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 36)], v3);
  v9 = self;
  v10 = CROrderedSet.count.getter(v3);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v10;
}

- (_TtC8Freeform8CRLBoard)init
{
  _TtC8Freeform8CRLBoard *result;

  result = (_TtC8Freeform8CRLBoard *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoard", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_transactionContext));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_freehandDrawingBucketManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_pendingChanges));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform8CRLBoard_realTimeSessionInfo, (uint64_t *)&unk_101405E90);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_shareState));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_data));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform8CRLBoard_uncommittedChangeAvailablePublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform8CRLBoard_uncommittedRealTimeChangesAvailablePublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform8CRLBoard_changeSummaryPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform8CRLBoard_realTimePendingChangesCancellable));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform8CRLBoard_hack_editingCoordinator);
}

- (id)getBoardItemForUUID:(id)a3
{
  return sub_100B1EA80(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for CRLBoardItem);
}

- (id)getContainerItemForUUID:(id)a3
{
  return sub_100B1EA80(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for CRLContainerItem);
}

- (void)fixUp
{
  _TtC8Freeform8CRLBoard *v2;

  v2 = self;
  sub_100B1F658();

}

- (BOOL)shouldEnsureParentsOfCreatedObjects
{
  return 1;
}

- (id)resolveAncestorsFor:(id)a3 ignoringIds:(id)a4
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _TtC8Freeform8CRLBoard *v10;
  Class isa;

  v7 = type metadata accessor for UUID(0);
  v8 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v10 = self;
  sub_100B204CC(v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for CRLBoardItem(0);
  sub_1004B7878((unint64_t *)&qword_1013E4190, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)resolveToSiblingsWithUuids:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform8CRLBoard *v7;
  Class isa;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class v14;

  v5 = type metadata accessor for UUID(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v9 = -[CRLBoard parentMapOfItemsFrom:](v7, "parentMapOfItemsFrom:", isa);

  v10 = type metadata accessor for CRLBoardItem(0);
  v11 = sub_1004B804C(&qword_1013E41F0);
  v12 = sub_1004B7878((unint64_t *)&qword_1013E4190, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v9, v10, v11, v12);

  sub_100B216A4(v13, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v14;
}

- (id)parentMapOfItemsFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform8CRLBoard *v7;
  Class isa;

  v5 = type metadata accessor for UUID(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_100B21F94(v6);

  swift_bridgeObjectRelease();
  type metadata accessor for CRLBoardItem(0);
  sub_1004B804C(&qword_1013E41F0);
  sub_1004B7878((unint64_t *)&qword_1013E4190, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)hasUnsyncedChangesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform8CRLBoard *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1012945E0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101294608, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_101405D68;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_101294630, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_101405D70;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_101405D78, (uint64_t)v12);
  swift_release(v14);
}

- (void)savePendingChanges
{
  _TtC8Freeform8CRLBoard *v2;

  v2 = self;
  sub_100B238A0(0, 0);

}

- (void)asyncSavePendingChangesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform8CRLBoard *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101294540, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101294568, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_101405D40;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_101294590, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10140B7B0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_101405D50, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC8Freeform8CRLBoard)parentBoard
{
  return (_TtC8Freeform8CRLBoard *)0;
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform8CRLBoard *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  __n128 v18;
  _BYTE v21[24];

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v11 = sub_100B10D70((uint64_t)v8);
  if (v11)
  {
    v12 = v10;
    v13 = (uint64_t *)((char *)v9 + OBJC_IVAR____TtC8Freeform8CRLBoard_fixupData);
    swift_beginAccess((char *)v9 + OBJC_IVAR____TtC8Freeform8CRLBoard_fixupData, v21, 0, 0);
    v14 = *v13;
    v15 = type metadata accessor for CRLTransactableHashableWrapper();
    ObjectType = swift_getObjectType(v11);
    v17 = sub_100DBC4CC(v11, v15, ObjectType, v12);
    swift_bridgeObjectRetain(v14);
    swift_unknownObjectRetain(v11);
    LOBYTE(v15) = sub_100621710(v17, v14);

    swift_release(v17);
    swift_bridgeObjectRelease();
    v18 = swift_unknownObjectRelease(v11);
    LOBYTE(v11) = v15 ^ 1;
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v18);
  return v11 & 1;
}

- (NSString)description
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_100B261E8);
}

+ (NSString)defaultBoardTitle
{
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, v4, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return (NSString *)v8;
}

@end

@implementation CRLContainerItem

- (NSDictionary)items
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLContainerItem_items);
  type metadata accessor for UUID(0);
  type metadata accessor for CRLBoardItem(0);
  sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  swift_bridgeObjectRetain(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (void)setItems:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform16CRLContainerItem *v9;

  v5 = type metadata accessor for UUID(0);
  v6 = type metadata accessor for CRLBoardItem(0);
  v7 = sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6, v7);
  v9 = self;
  sub_100740CF4(v8);

}

- (unsigned)timeStamp
{
  return *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLContainerItem_timeStamp);
}

- (void)setTimeStamp:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLContainerItem_timeStamp) = a3;
}

- (NSArray)childItems
{
  return (NSArray *)sub_100746E00((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems, (void (*)(_QWORD))type metadata accessor for CRLBoardItem);
}

- (NSArray)orderedItemUUIDs
{
  return (NSArray *)sub_100746E00((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs, (void (*)(_QWORD))&type metadata accessor for UUID);
}

- (NSSet)unorderedItemUUIDs
{
  uint64_t v3;
  void *v4;
  _TtC8Freeform16CRLContainerItem *v5;
  void *v6;
  Class isa;

  v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedUnorderedItemUUIDs;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedUnorderedItemUUIDs);
  v5 = self;
  if (!v4)
  {
    sub_100740DA4();
    v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
  }
  if (v4)
    v6 = v4;
  else
    v6 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRetain(v4);

  type metadata accessor for UUID(0);
  sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSSet *)isa;
}

- (void)clearChildItemsCache
{
  _TtC8Freeform16CRLContainerItem *v2;

  v2 = self;
  sub_100740D5C();

}

- (NSArray)childInfos
{
  uint64_t v3;
  double *v4;
  _TtC8Freeform16CRLContainerItem *v5;
  double *v6;
  uint64_t v7;
  Class isa;

  v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  v4 = *(double **)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  v5 = self;
  if (!v4)
  {
    sub_100740DA4();
    v4 = *(double **)((char *)&self->super.super.super.isa + v3);
  }
  if (v4)
    v6 = v4;
  else
    v6 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(v4);
  v7 = sub_100520818((uint64_t)v6);

  swift_bridgeObjectRelease(v6);
  sub_1004B804C(&qword_1013E0670);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)isa;
}

- (id)infoForSelectionPath:(id)a3
{
  return 0;
}

- (void)fixUpWithInsertedChild:(id)a3 expectTransactionContext:(BOOL)a4
{
  _QWORD *v6;
  _TtC8Freeform16CRLContainerItem *v7;

  v6 = a3;
  v7 = self;
  sub_100742678(v6, a4);

}

- (BOOL)containsChild:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  double *v10;
  _TtC8Freeform16CRLContainerItem *v11;
  _TtC8Freeform16CRLContainerItem *v12;
  double *v13;
  BOOL v14;
  __n128 v15;
  _BYTE v17[16];

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs;
  v10 = *(double **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs);
  v11 = self;
  v12 = v11;
  if (!v10)
  {
    sub_100740DA4();
    v10 = *(double **)((char *)&self->super.super.super.isa + v9);
  }
  if (v10)
    v13 = v10;
  else
    v13 = _swiftEmptyArrayStorage;
  __chkstk_darwin(v11);
  *(_QWORD *)&v17[-16] = v8;
  swift_bridgeObjectRetain(v10);
  v14 = sub_100DAFBE0((uint64_t (*)(char *))sub_10074BA14, (_BOOL8)&v17[-32], (uint64_t)v13);

  v15 = swift_bridgeObjectRelease(v13);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v6 + 8))(v8, v5, v15);
  return v14;
}

- (void)fixUpWithRemovedChild:(id)a3 expectTransactionContext:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8Freeform16CRLContainerItem *v11;
  uint64_t v12;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = self;
  sub_10074315C((uint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)beforeInsertionAddNewItems:(id)a3 board:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8Freeform16CRLContainerItem *v11;

  v8 = type metadata accessor for CRLBoardItem(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v8);
  v10 = a4;
  v11 = self;
  sub_10074B364(v9);
  swift_bridgeObjectRelease(v9);

  return 1;
}

- (BOOL)beforeInsertionAddNewItems:(id)a3 atIndex:(int64_t)a4 board:(id)a5 error:(id *)a6
{
  uint64_t v10;
  int64_t v11;
  id v12;
  _TtC8Freeform16CRLContainerItem *v13;

  v10 = type metadata accessor for CRLBoardItem(0);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v10);
  v12 = a5;
  v13 = self;
  sub_10074B6B8(v11, a4);
  swift_bridgeObjectRelease(v11);

  return 1;
}

- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3
{
  _TtC8Freeform16CRLContainerItem *v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;

  v4 = self;
  sub_1007409E0(a3);
  v6 = v5;

  type metadata accessor for UUID(0);
  sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (id)childEnumerator
{
  uint64_t v3;
  double *v4;
  _TtC8Freeform16CRLContainerItem *v5;
  double *v6;
  uint64_t v7;
  id v8;
  Class isa;
  id v10;
  id v11;

  v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  v4 = *(double **)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  v5 = self;
  if (!v4)
  {
    sub_100740DA4();
    v4 = *(double **)((char *)&self->super.super.super.isa + v3);
  }
  if (v4)
    v6 = v4;
  else
    v6 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(v4);
  v7 = sub_100520C64((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  v8 = objc_allocWithZone((Class)NSArray);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v10 = objc_msgSend(v8, "initWithArray:", isa, swift_bridgeObjectRelease(v7).n128_f64[0]);

  v11 = objc_msgSend(v10, "objectEnumerator");
  return v11;
}

- (id)childEnumeratorForUserFlags:(unint64_t)a3
{
  uint64_t v4;
  double *v5;
  _TtC8Freeform16CRLContainerItem *v6;
  double *v7;
  uint64_t v8;
  id v9;
  Class isa;
  id v11;
  id v12;

  v4 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  v5 = *(double **)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  v6 = self;
  if (!v5)
  {
    sub_100740DA4();
    v5 = *(double **)((char *)&self->super.super.super.isa + v4);
  }
  if (v5)
    v7 = v5;
  else
    v7 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(v5);
  v8 = sub_100520C64((uint64_t)v7);
  swift_bridgeObjectRelease(v7);
  v9 = objc_allocWithZone((Class)NSArray);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v11 = objc_msgSend(v9, "initWithArray:", isa, swift_bridgeObjectRelease(v8).n128_f64[0]);

  v12 = objc_msgSend(v11, "objectEnumerator");
  return v12;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform16CRLContainerItem_items));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItemUUIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedUnorderedItemUUIDs));
}

- (_TtC8Freeform16CRLContainerItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v14;

  v8 = type metadata accessor for UUID(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a5;
  return (_TtC8Freeform16CRLContainerItem *)sub_100747DE0((uint64_t)v11, (uint64_t)v10, a5);
}

- (void)_setParentItemReferenceWithItem:(id)a3 parent:(id)a4
{
  swift_unknownObjectWeakAssign((char *)a3 + OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem, a4);
}

- (void)_setParentItemUUIDWithItem:(id)a3 parent:(id)a4
{
  _QWORD *v6;
  id v7;
  _TtC8Freeform16CRLContainerItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10077F1BC(v6, (uint64_t)v7);

}

@end

@implementation TrackableWidgetState

- (NSString)entryID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_entryID + 8];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSString)contentID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentID + 8];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_contentID + 8]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)appearanceType
{
  return *(_QWORD *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_appearanceType];
}

- (unint64_t)stackKind
{
  return *(_QWORD *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_stackKind];
}

- (unint64_t)stackLocation
{
  return *(_QWORD *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_stackLocation];
}

- (unint64_t)absoluteOrderOfItem:(id)a3
{
  _QWORD *v5;
  unint64_t v6;
  char v7;
  char v8;

  swift_unknownObjectRetain(a3);
  swift_retain(self);
  v5 = NTTodayResults.allItems.getter();
  swift_unknownObjectRetain(a3);
  v6 = sub_10007A430((uint64_t)v5, (uint64_t)a3);
  v8 = v7;
  swift_bridgeObjectRelease(v5);
  swift_unknownObjectRelease(a3);
  if ((v8 & 1) != 0)
    goto LABEL_4;
  if ((v6 & 0x8000000000000000) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, 2, 3451, 0);
    __break(1u);
LABEL_4:
    v6 = -1;
  }
  swift_unknownObjectRelease(a3);
  swift_release(self);
  return v6;
}

- (unint64_t)absoluteOrderOfItemInSection:(id)a3
{
  unint64_t v5;

  swift_unknownObjectRetain(a3);
  swift_retain(self);
  v5 = sub_1000734DC(a3);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  return v5;
}

- (unint64_t)absoluteOrderOfSection:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  swift_retain(self);
  v5 = sub_1000737B0(v4);

  swift_release(self);
  return v5;
}

- (id)visibleSections
{
  _QWORD *v3;
  Class isa;

  swift_retain(self);
  v3 = sub_100073920();
  swift_release(self);
  sub_10002A0D8(0, (unint64_t *)&qword_1000DCC40, NTSection_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)sectionForItem:(id)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;

  v5 = *(void **)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results];
  swift_unknownObjectRetain(a3);
  swift_retain(self);
  v6 = objc_msgSend(v5, "sections");
  v7 = objc_msgSend(v6, "array");

  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, (char *)&type metadata for Any + 8);
  v9 = sub_100056898(v8);
  swift_bridgeObjectRelease(v8);
  swift_unknownObjectRetain(a3);
  v10 = sub_10007A2B4((uint64_t)v9, (uint64_t)a3);
  swift_release(self);
  swift_bridgeObjectRelease(v9);
  swift_unknownObjectRelease_n(a3, 2);
  return v10;
}

- (id)visibleItems
{
  _QWORD *v3;
  Class isa;

  swift_retain(self);
  v3 = sub_100072D4C();
  swift_release(self);
  sub_100016484(&qword_1000D9FC0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)visibleItemsOfType:(unint64_t)a3
{
  _QWORD *v5;
  Class isa;

  swift_retain(self);
  v5 = sub_10007777C((id)a3);
  swift_release(self);
  sub_100016484(&qword_1000D9FC0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (id)extentsOfSections:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  Class isa;
  _QWORD v13[4];

  v5 = sub_10002A0D8(0, (unint64_t *)&qword_1000DCC40, NTSection_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_retain(self);
  v7 = sub_100073BBC();
  v13[2] = v7;
  v8 = sub_10002A0D8(0, &qword_1000DCA20, NSNumber_ptr);
  v9 = sub_100079D18();
  v10 = Array.mapToDictionary<A>(_:)(sub_10007A18C, v13, v6, v5, v8, v9);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

- (id)fetchInfoForVisibleResults
{
  return *(id *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_fetchInfo];
}

- (uint64_t)absoluteItemCountForCurrentDisplayMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  char v6;

  swift_retain(a1);
  v2 = (uint64_t)NTTodayResults.allItems.getter();
  v3 = v2;
  if (!((unint64_t)v2 >> 62))
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease(v2);
LABEL_3:
    swift_release(a1);
    return v4;
  }
  if (v2 >= 0)
    v2 &= 0xFFFFFFFFFFFFFF8uLL;
  v4 = _CocoaArrayWrapper.endIndex.getter(v2);
  swift_bridgeObjectRelease(v3);
  if ((v4 & 0x8000000000000000) == 0)
    goto LABEL_3;
  v6 = 2;
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, v6, 3451, 0);
  __break(1u);
  return result;
}

- (id)todayResults
{
  return *(id *)&self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_results];
}

- (unint64_t)activeDisplayMode
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  int v9;
  uint64_t v11;

  v3 = type metadata accessor for InternalWidgetFamily(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &self->entryID[OBJC_IVAR____TtC10NewsToday220TrackableWidgetState_layoutContext];
  v8 = type metadata accessor for LayoutContext(0);
  (*(void (**)(char *, unsigned __int8 *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 24)], v3);
  v9 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v9 == enum case for InternalWidgetFamily.systemSmall(_:))
    return 3;
  if (v9 == enum case for InternalWidgetFamily.systemMedium(_:))
    return 4;
  if (v9 == enum case for InternalWidgetFamily.systemLarge(_:))
    return 5;
  if (v9 == enum case for InternalWidgetFamily.newsLargeTall(_:))
    return 6;
  if (v9 == enum case for InternalWidgetFamily.accessoryRectangular(_:))
    return 7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

- (NSDate)fetchDate
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

@end

@implementation PlaceCardCollectionMembershipProvider

- (MKMapItem)mapItem
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_mapItem);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_mapItem, v4, 0, 0);
  return (MKMapItem *)*v2;
}

- (void)setMapItem:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_mapItem);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_mapItem, v13, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  v9 = objc_msgSend((id)objc_opt_self(CollectionManager), "sharedManager");
  v10 = objc_msgSend(v9, "currentCollections");

  v11 = sub_10000E4BC(0, (unint64_t *)&qword_10149DF70, off_1011960E8);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  sub_10012B6F8(v12);
  swift_bridgeObjectRelease(v12);
}

- (_TtP4Maps45PlaceCardCollectionMembershipProviderDelegate_)delegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_delegate, v4, 0, 0);
  return (_TtP4Maps45PlaceCardCollectionMembershipProviderDelegate_ *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (NSArray)containingCollections
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollections);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollections, v6, 0, 0);
  v3 = *v2;
  sub_10000E4BC(0, (unint64_t *)&qword_10149DF70, off_1011960E8);
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setContainingCollections:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *v9;
  char v10[24];

  v5 = sub_10000E4BC(0, (unint64_t *)&qword_10149DF70, off_1011960E8);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollections);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollections, v10, 1, 0);
  v8 = *v7;
  *v7 = v6;
  v9 = self;
  swift_bridgeObjectRelease(v8);
  sub_10012BE40();

}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (void *)objc_opt_self(CollectionManager);
  v5 = self;
  v6 = objc_msgSend(v4, "sharedManager");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[PlaceCardCollectionMembershipProvider dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{

  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollections));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollectionIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_observedCollections));
}

- (_TtC4Maps37PlaceCardCollectionMembershipProvider)init
{
  return (_TtC4Maps37PlaceCardCollectionMembershipProvider *)sub_10012C338();
}

- (id)containingCollectionWithIdentifer:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *v9;
  unint64_t v10;
  void *v11;
  _BYTE v13[24];

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollections);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollections, v13, 0, 0);
  v8 = *v7;
  v9 = self;
  v10 = swift_bridgeObjectRetain(v8);
  v11 = sub_10012C9B0(v10, v4, v6);

  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v8);
  return v11;
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *v10;

  v7 = sub_10000E4BC(0, (unint64_t *)&qword_10149DF70, off_1011960E8);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10012B6F8(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)collectionHandlerContentUpdated:(id)a3
{
  CollectionHandler *v4;
  _TtC4Maps37PlaceCardCollectionMembershipProvider *v5;

  v4 = (CollectionHandler *)a3;
  v5 = self;
  PlaceCardCollectionMembershipProvider.collectionHandlerContentUpdated(_:)(v4);

}

@end

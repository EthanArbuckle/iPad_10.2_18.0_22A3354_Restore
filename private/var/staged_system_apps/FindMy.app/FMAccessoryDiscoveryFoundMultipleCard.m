@implementation FMAccessoryDiscoveryFoundMultipleCard

- (_TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard)initWithContentView:(id)a3
{
  id v3;
  _TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard *result;

  v3 = a3;
  result = (_TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryDiscoveryFoundMultipleCard", 44, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard_discoveryController]);
  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard_continueActionCancellable]);
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard_coordinator]);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard *v15;
  void (*v16)(char *, uint64_t);
  Class isa;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100053F2C(&qword_1005D33C0);
  __chkstk_darwin(v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  sub_1002D0DE4((uint64_t)v10, (uint64_t)v13);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v16(v13, v7);
  }
  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1002D1194((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end

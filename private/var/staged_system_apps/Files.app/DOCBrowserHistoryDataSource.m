@implementation DOCBrowserHistoryDataSource

- (void)dealloc
{
  _TtC5Files27DOCBrowserHistoryDataSource *v2;
  objc_super v3;

  v2 = self;
  sub_10043D524();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DOCBrowserHistoryDataSource();
  -[DOCBrowserHistoryDataSource dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5Files27DOCBrowserHistoryDataSource_observableTrashCollection));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5Files27DOCBrowserHistoryDataSource_sourcesObserverToken));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5Files27DOCBrowserHistoryDataSource_sourceObserver));
  swift_release(*(_QWORD *)&self->super.shortDebugID[OBJC_IVAR____TtC5Files27DOCBrowserHistoryDataSource_allowedItemsFilter]);
}

- (_TtC5Files27DOCBrowserHistoryDataSource)init
{
  _TtC5Files27DOCBrowserHistoryDataSource *result;

  result = (_TtC5Files27DOCBrowserHistoryDataSource *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCBrowserHistoryDataSource", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)tagRegistry:(id)a3 didRemoveTag:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtC5Files27DOCBrowserHistoryDataSource *v11;

  v7 = swift_allocObject(&unk_1005EC938, 24, 7);
  *(_QWORD *)(v7 + 16) = a4;
  v8 = swift_allocObject(&unk_1005EC960, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_100447104;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = a4;
  v10 = a3;
  v11 = self;
  swift_retain();
  sub_10001A27C(0, (uint64_t)sub_100447B10, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)tagRegistry:(id)a3 didReplaceTag:(id)a4 withTag:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC5Files27DOCBrowserHistoryDataSource *v16;

  v9 = swift_allocObject(&unk_1005EC8E8, 32, 7);
  *(_QWORD *)(v9 + 16) = a4;
  *(_QWORD *)(v9 + 24) = a5;
  v10 = swift_allocObject(&unk_1005EC910, 32, 7);
  *(_QWORD *)(v10 + 16) = sub_1004470FC;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  v14 = v12;
  v15 = a3;
  v16 = self;
  swift_retain();
  sub_10001A27C(0, (uint64_t)sub_100447B10, v10);

  swift_release(v9);
  swift_release(v10);
}

@end

@implementation StockShareActivityItemSource

- (_TtC8StocksUI28StockShareActivityItemSource)init
{
  _TtC8StocksUI28StockShareActivityItemSource *result;

  result = (_TtC8StocksUI28StockShareActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI28StockShareActivityItemSource_stock;
  v4 = sub_1DC4010E4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1DC1C9068((uint64_t)self + OBJC_IVAR____TtC8StocksUI28StockShareActivityItemSource_quote);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8StocksUI28StockShareActivityItemSource *v13;
  void *v14;
  uint64_t v16;

  v5 = sub_1DC3FFDD0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v16 - v10;
  v12 = a3;
  v13 = self;
  sub_1DC401048();

  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  v14 = (void *)sub_1DC409A24();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v14;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC8StocksUI28StockShareActivityItemSource *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD v17[3];
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DC1CABC8(a4, (uint64_t)v17);

  v9 = v18;
  if (!v18)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1(v17, v18);
  v11 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
  v15 = (void *)sub_1DC4099D0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v15;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC8StocksUI28StockShareActivityItemSource *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DC4010D8();
  swift_bridgeObjectRetain();
  sub_1DC408B48();
  swift_bridgeObjectRelease();
  sub_1DC40106C();
  swift_bridgeObjectRetain();
  sub_1DC408B48();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_1DC408A1C();
  swift_bridgeObjectRelease();
  return v9;
}

@end

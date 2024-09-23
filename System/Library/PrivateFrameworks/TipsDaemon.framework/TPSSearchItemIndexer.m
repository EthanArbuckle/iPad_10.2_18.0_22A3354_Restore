@implementation TPSSearchItemIndexer

+ (TPSSearchItemIndexer)default
{
  if (qword_1EDAF3040 != -1)
    swift_once();
  return (TPSSearchItemIndexer *)(id)qword_1EDAF3038;
}

- (void)indexUserGuides:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t (*v7)();
  unint64_t v8;
  uint64_t v9;
  TPSSearchItemIndexer *v10;

  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_1DACA2CF8();
  v8 = sub_1DACA2E3C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_1DAC94874;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  SearchItemIndexer.indexUserGuides(_:qualityOfService:completionHandler:)(v8, a4, (uint64_t)v7, v9);
  sub_1DAC447B0((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)indexTips:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t (*v7)();
  unint64_t v8;
  uint64_t v9;
  TPSSearchItemIndexer *v10;

  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_1DAC450D4();
  v8 = sub_1DACA2E3C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_1DAC94874;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  SearchItemIndexer.indexTips(_:qualityOfService:completionHandler:)(v8, a4, (uint64_t)v7, v9);
  sub_1DAC447B0((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (TPSSearchItemIndexer)initWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1DACA2D94();
  return (TPSSearchItemIndexer *)SearchItemIndexer.init(name:)(v3, v4);
}

- (TPSSearchItemIndexer)init
{
  TPSSearchItemIndexer *result;

  result = (TPSSearchItemIndexer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
}

- (void)reindexTips:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  TPSSearchItemIndexer *v10;

  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_1DAC450D4();
  v8 = sub_1DACA2E3C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_1DAC94874;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  SearchItemIndexer.reindexTips(_:qualityOfService:completionHandler:)(v8, a4, (uint64_t)v7, v9);
  sub_1DAC447B0((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)reindexUserGuides:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  TPSSearchItemIndexer *v10;

  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_1DACA2CF8();
  v8 = sub_1DACA2E3C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_1DAC94874;
  }
  else
  {
    v9 = 0;
  }
  v10 = self;
  SearchItemIndexer.reindexUserGuides(_:qualityOfService:completionHandler:)(v8, a4, (uint64_t)v7, v9);
  sub_1DAC447B0((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)deleteAllItemsWithQualityOfService:(int64_t)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  TPSSearchItemIndexer *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1DAC45080;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  SearchItemIndexer.deleteAllItems(qualityOfService:completionHandler:)(a3, (uint64_t)v6, v7);
  sub_1DAC447B0((uint64_t)v6);

}

@end

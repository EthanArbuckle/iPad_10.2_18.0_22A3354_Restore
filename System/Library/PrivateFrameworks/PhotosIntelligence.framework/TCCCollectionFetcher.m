@implementation TCCCollectionFetcher

- (id)init:(id)a3
{
  id result;

  TCCCollectionFetcher.init(_:)((uint64_t)a3);
  return result;
}

- (id)fetchAssetsForTCCWithLimit:(int64_t)a3 seed:(id)a4
{
  TCCCollectionFetcher *v6;
  id v7;
  unint64_t v8;
  void *v9;
  NSNumber_optional v11;

  v6 = self;
  v7 = a4;
  v11.value.super.super.isa = (Class)a4;
  v8 = (unint64_t)TCCCollectionFetcher.fetchAssetsForTCC(limit:seed:)(a3, v11);

  if (v8)
  {
    sub_243C67FD8(0, (unint64_t *)&qword_2543D29B0);
    v9 = (void *)sub_243F85108();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (TCCCollectionFetcher)init
{
  TCCCollectionFetcher.init()();
}

- (void).cxx_destruct
{

}

@end

@implementation TPSSearchQueryManager

+ (TPSSearchQueryManager)shared
{
  if (qword_1EE3B6100 != -1)
    swift_once();
  return (TPSSearchQueryManager *)(id)qword_1EE3B6B70;
}

- (TPSSearchQueryManager)init
{
  return (TPSSearchQueryManager *)SearchQueryManager.init()();
}

- (void)performQuery:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  char *v8;
  TPSSearchQueryManager *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (char *)a3;
  v9 = self;
  sub_19A97E528(v8, (uint64_t)sub_19A981078, v7);

  swift_release();
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TPSSearchQueryManager *v7;

  v4 = sub_19A990D58();
  v6 = v5;
  v7 = self;
  sub_19A97F61C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end

@implementation GKGameInstallDataFetcher

+ (id)createAndReturnError:(id *)a3
{
  id v3;

  sub_1001ADF0C();
  return v3;
}

- (void)fetchGameInstallInfoFor:(NSArray *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSArray *v8;
  GKGameInstallDataFetcher *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_1002C78C0, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1001C15C4((uint64_t)&unk_100316648, (uint64_t)v7);
}

- (GKGameInstallDataFetcher)init
{
  sub_1001AE498();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKGameInstallDataFetcher_appPurchaseHistoryFetcher));
  sub_100161FE0((Class *)((char *)&self->super.isa + OBJC_IVAR___GKGameInstallDataFetcher_appInstallHistoryFetcher));
}

@end

@implementation DatabaseClient

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;

  sub_1C1479E4C(0, (unint64_t *)&qword_1ED1E98B0);
  sub_1C1499894();
  v7 = (void *)sub_1C1546E10();
  v8 = sub_1C1546E10();
  v9 = sub_1C1546E10();
  v10 = a3;
  swift_retain();
  DatabaseClient.databaseDidChange(_:modified:inserted:removed:)((uint64_t)v10, v7, v8, v9);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

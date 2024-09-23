@implementation SleepDiffableTableViewAdaptor

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  sub_1A9C07624();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v8);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE6A44();
  swift_retain();
  sub_1A9C070F4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end

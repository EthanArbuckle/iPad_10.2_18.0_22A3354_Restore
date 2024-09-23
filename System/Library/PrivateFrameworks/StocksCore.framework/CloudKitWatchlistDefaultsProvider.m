@implementation CloudKitWatchlistDefaultsProvider

- (void)fetchWatchlistDefaultsWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  sub_1ABF2FF68();
  sub_1ABDA7C30((uint64_t)sub_1ABDAAB70, v4);
  swift_release();
  swift_release();
}

@end

@implementation CloudKitWatchlistMetadataProvider

- (void)fetchMetadataForSymbols:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  v6 = sub_1ABF31A08();
  _Block_copy(v5);
  sub_1ABF2FF68();
  sub_1ABDAA500(v6, self, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_release();
  swift_bridgeObjectRelease();
}

@end

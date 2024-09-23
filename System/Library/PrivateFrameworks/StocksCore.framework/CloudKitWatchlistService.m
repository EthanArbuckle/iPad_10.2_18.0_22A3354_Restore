@implementation CloudKitWatchlistService

- (void)watchlistManager:(id)a3 didChangeInWatchlist:(id)a4
{
  uint64_t v5;
  id v6;

  sub_1ABCF7BCC(0, (unint64_t *)&unk_1ED34CAA0);
  v5 = sub_1ABF31624();
  v6 = a3;
  sub_1ABF2FF68();
  sub_1ABDA99AC(v5);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)watchlistManager:(id)a3 didChangeInWatchlistOrder:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_1ABF2FF68();
  sub_1ABDA9B60(v6);

  swift_release();
}

@end

@implementation DOCUserInterfaceState

- (unint64_t)mostRecentlyVisitedBrowseSourceWithFallback:(unint64_t)a3
{
  DOCUserInterfaceState *v4;
  id v5;
  void *v6;
  unint64_t v7;
  char v8;
  char v9;

  v4 = self;
  v5 = -[DOCUserInterfaceState mostRecentlyVisitedEffectiveTabIdentifier](v4, "mostRecentlyVisitedEffectiveTabIdentifier");
  if (v5)
  {
    v6 = v5;
    v7 = sub_100152104((uint64_t)v5);
    v9 = v8;

    if ((v9 & 1) == 0)
      return v7;
  }
  else
  {

  }
  return a3;
}

- (void)updateMostRecentlyVisitedBrowseSourceToTab:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  DOCUserInterfaceState *v6;
  id v7;

  if (a3 > 2)
  {
    __break(1u);
  }
  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)*(&off_1005CAA68 + a3));
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
    -[DOCUserInterfaceState setMostRecentlyVisitedEffectiveTabIdentifier:](v6, "setMostRecentlyVisitedEffectiveTabIdentifier:", v7);

  }
}

@end

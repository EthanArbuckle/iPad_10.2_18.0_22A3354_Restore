@implementation GKScoreSubmissionBulletin

- (GKScoreSubmissionBulletin)initWithScore:(id)a3
{
  return (GKScoreSubmissionBulletin *)sub_100163AF0(a3);
}

+ (NSDateFormatter)timeFormatter
{
  return (NSDateFormatter *)sub_1001640E4();
}

- (GKScoreSubmissionBulletin)initWithCoder:(id)a3
{
  sub_100164138();
}

+ (void)presentForScores:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_100164514();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  sub_10016419C(v5);
  swift_bridgeObjectRelease(v5, v6);
}

- (GKScoreSubmissionBulletin)initWithPushNotification:(id)a3
{
  if (a3)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  sub_10016436C();
}

- (GKScoreSubmissionBulletin)init
{
  sub_1001643D0();
}

@end

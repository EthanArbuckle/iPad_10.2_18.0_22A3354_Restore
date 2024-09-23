@implementation NSUserDefaults

- (BOOL)BEDocumentExternalLoadApprovalCacheDidReset
{
  uint64_t v2;
  NSUserDefaults *v3;
  NSString v4;
  unsigned __int8 v5;

  v2 = qword_3B5738;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_3B5738, sub_A7D88);
  v4 = String._bridgeToObjectiveC()();
  v5 = -[NSUserDefaults BOOLForKey:](v3, "BOOLForKey:", v4);

  return v5;
}

- (NSString)BKContentSizeCategoryManagerOverrideKey
{
  NSUserDefaults *v2;
  NSString v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSUserDefaults stringForKey:](v2, "stringForKey:", v3);

  if (v4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {

    v7 = 0;
  }
  return (NSString *)v7;
}

- (void)setBKContentSizeCategoryManagerOverrideKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSUserDefaults *v6;
  NSString v7;
  NSUserDefaults *v8;
  id v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9 = String._bridgeToObjectiveC()();
  -[NSUserDefaults setObject:forKey:](self, "setObject:forKey:", v7, v9);

  swift_unknownObjectRelease(v7);
}

- (NSString)BookEPUB_CurrentThemePersistence_themeIdentifier
{
  NSUserDefaults *v2;
  NSString v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSUserDefaults stringForKey:](v2, "stringForKey:", v3);

  if (v4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {

    v7 = 0;
  }
  return (NSString *)v7;
}

- (void)setBookEPUB_CurrentThemePersistence_themeIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSUserDefaults *v6;
  NSString v7;
  NSUserDefaults *v8;
  id v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9 = String._bridgeToObjectiveC()();
  -[NSUserDefaults setValue:forKey:](self, "setValue:forKey:", v7, v9);

  swift_unknownObjectRelease(v7);
}

- (BOOL)BKLeftTapTurnToNext
{
  NSUserDefaults *v2;
  NSString v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", v3);

  return v4;
}

- (void)setBKLeftTapTurnToNext:(BOOL)a3
{
  NSUserDefaults *v3;
  Class isa;
  id v5;

  v3 = self;
  isa = Bool._bridgeToObjectiveC()().super.super.isa;
  v5 = String._bridgeToObjectiveC()();
  -[NSUserDefaults setValue:forKey:](v3, "setValue:forKey:", isa, v5);

}

- (NSString)BKPageTurnStyle
{
  NSUserDefaults *v2;
  NSString v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSUserDefaults stringForKey:](v2, "stringForKey:", v3);

  if (v4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {

    v7 = 0;
  }
  return (NSString *)v7;
}

- (void)setBKPageTurnStyle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSUserDefaults *v6;
  NSString v7;
  NSUserDefaults *v8;
  id v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9 = String._bridgeToObjectiveC()();
  -[NSUserDefaults setObject:forKey:](self, "setObject:forKey:", v7, v9);

  swift_unknownObjectRelease(v7);
}

- (NSDate)BKPageTurnStyleUserSelectionTimestamp
{
  return (NSDate *)sub_19FBF8(self);
}

- (void)setBKPageTurnStyleUserSelectionTimestamp:(id)a3
{
  sub_19FDFC(self, (uint64_t)a2, (uint64_t)a3);
}

- (NSDate)BKPageTurnStyleReduceMotionEnabledTimestamp
{
  return (NSDate *)sub_19FBF8(self);
}

- (void)setBKPageTurnStyleReduceMotionEnabledTimestamp:(id)a3
{
  sub_19FDFC(self, (uint64_t)a2, (uint64_t)a3);
}

@end

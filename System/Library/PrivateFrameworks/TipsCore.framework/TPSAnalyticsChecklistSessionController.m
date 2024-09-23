@implementation TPSAnalyticsChecklistSessionController

- (TPSAnalyticsChecklistSessionController)init
{
  return (TPSAnalyticsChecklistSessionController *)TPSAnalyticsChecklistSessionController.init()();
}

+ (TPSAnalyticsChecklistSessionController)sharedInstance
{
  if (qword_1EE3B5950 != -1)
    swift_once();
  return (TPSAnalyticsChecklistSessionController *)(id)qword_1EE3B5940;
}

- (BOOL)isFirstLaunch
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch;
  swift_beginAccess();
  return *v2;
}

- (void)setIsFirstLaunch:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_isFirstLaunch;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasActiveSession
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession;
  swift_beginAccess();
  return *v2;
}

- (void)setHasActiveSession:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_hasActiveSession;
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)sessionEndSuggestedTipsCount
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
  swift_beginAccess();
  return *v2;
}

- (void)setSessionEndSuggestedTipsCount:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionEndSuggestedTipsCount);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)sessionTipsCompleted
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
  swift_beginAccess();
  return *v2;
}

- (void)setSessionTipsCompleted:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionTipsCompleted);
  swift_beginAccess();
  *v4 = a3;
}

- (void)startSession
{
  TPSAnalyticsChecklistSessionController *v2;

  v2 = self;
  sub_19A95D7E8();

}

- (void)continueSession
{
  TPSAnalyticsChecklistSessionController *v2;

  v2 = self;
  sub_19A95DE0C();

}

- (void)stopSession
{
  TPSAnalyticsChecklistSessionController *v2;

  v2 = self;
  sub_19A95E20C();

}

- (void).cxx_destruct
{
  sub_19A90A538((uint64_t)self + OBJC_IVAR___TPSAnalyticsChecklistSessionController_sessionStartTime, &qword_1ED03D380);

}

@end

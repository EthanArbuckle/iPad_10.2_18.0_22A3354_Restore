@implementation CHWorkoutDetailAnalyticsTracker

+ (CHWorkoutDetailAnalyticsTracker)sharedInstance
{
  if (qword_10081E0A0 != -1)
    swift_once(&qword_10081E0A0, sub_1005CE424);
  return (CHWorkoutDetailAnalyticsTracker *)(id)qword_10086B020;
}

- (CHWorkoutDetailAnalyticsTracker)init
{
  CHWorkoutDetailAnalyticsTracker *v2;
  void *v3;
  CHWorkoutDetailAnalyticsTracker *v4;
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDetailAnalyticsTracker_trackingWorkouts) = (Class)_swiftEmptyDictionarySingleton;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WorkoutDetailAnalyticsTracker();
  v2 = -[CHWorkoutDetailAnalyticsTracker init](&v7, "init");
  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = v2;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, "applicationWillTerminateWithNotification:", UIApplicationWillTerminateNotification, 0);

  return v4;
}

- (void)applicationWillTerminateWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  CHWorkoutDetailAnalyticsTracker *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1005CE54C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)sendEventWith:(id)a3
{
  id v4;
  CHWorkoutDetailAnalyticsTracker *v5;

  v4 = a3;
  v5 = self;
  sub_1005CEF68();

}

- (void)startTrackingWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  CHWorkoutDetailAnalyticsTracker *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1005CE91C(v6, a4);

}

- (void)stopTrackingWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  CHWorkoutDetailAnalyticsTracker *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1005CEB80(v6, a4);

}

- (id)workoutAnalyticsHandlerFor:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  CHWorkoutDetailAnalyticsTracker *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1005CED64(v6, a4);

  return v9;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHWorkoutDetailAnalyticsTracker_trackingWorkouts));
}

@end

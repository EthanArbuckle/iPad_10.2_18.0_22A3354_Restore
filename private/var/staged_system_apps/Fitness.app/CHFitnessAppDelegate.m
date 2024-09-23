@implementation CHFitnessAppDelegate

- (CHFitnessAppDelegate)init
{
  CHFitnessAppDelegate *result;

  sub_1004A97A8();
  return result;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v8;
  CHWorkoutDetailHeartRateTableViewCell *v9;
  CHWorkoutDetailHeartRateTableViewCell *v10;
  CHWorkoutDetailHeartRateTableViewCell *v11;
  id v12;
  CHFitnessAppDelegate *v13;
  SEL v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SEL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = (CHWorkoutDetailHeartRateTableViewCell *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_1003D00C0(v8, v10, (uint64_t)v11);

  swift_bridgeObjectRelease(v10, v14, v15, v16, v17, v18, v19, v20);
  swift_bridgeObjectRelease(v11, v21, v22, v23, v24, v25, v26, v27);
  return self & 1;
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                  + OBJC_IVAR___CHFitnessAppDelegate_healthStore));
}

- (CHHistoryDataProvider)historyDataProvider
{
  return (CHHistoryDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR___CHFitnessAppDelegate_historyDataProvider));
}

- (FIUIFormattingManager)fitnessUIFormattingManager
{
  return (FIUIFormattingManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR___CHFitnessAppDelegate_fitnessUIFormattingManager));
}

- (CHWorkoutFormattingManager)workoutFormattingManager
{
  return (CHWorkoutFormattingManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                               + OBJC_IVAR___CHFitnessAppDelegate_workoutFormattingManager));
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return (FIPauseRingsCoordinator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                            + OBJC_IVAR___CHFitnessAppDelegate_pauseRingsCoordinator));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->phoneSceneConfigurationName[OBJC_IVAR___CHFitnessAppDelegate_phoneSceneConfigurationName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->phoneSceneConfigurationName[OBJC_IVAR___CHFitnessAppDelegate_iPadSceneConfigurationName]);

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHFitnessAppDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1004A9D24(v9);

  return v12;
}

@end

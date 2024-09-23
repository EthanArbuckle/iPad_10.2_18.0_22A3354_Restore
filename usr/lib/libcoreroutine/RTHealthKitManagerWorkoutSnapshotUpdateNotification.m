@implementation RTHealthKitManagerWorkoutSnapshotUpdateNotification

- (RTHealthKitManagerWorkoutSnapshotUpdateNotification)initWithWorkoutSnapshot:(id)a3
{
  id v4;
  RTHealthKitManagerWorkoutSnapshotUpdateNotification *v5;
  uint64_t v6;
  RTCurrentWorkoutSnapshot *workoutSnapshot;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTHealthKitManagerWorkoutSnapshotUpdateNotification;
  v5 = -[RTNotification init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    workoutSnapshot = v5->_workoutSnapshot;
    v5->_workoutSnapshot = (RTCurrentWorkoutSnapshot *)v6;

  }
  return v5;
}

- (RTCurrentWorkoutSnapshot)workoutSnapshot
{
  return self->_workoutSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutSnapshot, 0);
}

@end

@implementation _CHWorkoutDetailMultiSportTableItem

- (HKWorkoutActivity)workoutActivity
{
  return self->_workoutActivity;
}

- (void)setWorkoutActivity:(id)a3
{
  objc_storeStrong((id *)&self->_workoutActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutActivity, 0);
}

@end

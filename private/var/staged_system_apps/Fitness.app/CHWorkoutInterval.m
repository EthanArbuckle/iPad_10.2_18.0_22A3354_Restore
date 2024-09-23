@implementation CHWorkoutInterval

- (id)description
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHWorkoutInterval;
  v3 = -[CHWorkoutSegment description](&v14, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[CHWorkoutSegment elapsedTime](self, "elapsedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5 / 60.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment formattedActiveEnergyValueForUnit:](self, "formattedActiveEnergyValueForUnit:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit mileUnit](HKUnit, "mileUnit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutSegment formattedDistanceValueForUnit:](self, "formattedDistanceValueForUnit:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutInterval stepKeyPath](self, "stepKeyPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(INTERVAL) %@: Duration: %@ min; Energy: %@; Distance: %@; KeyPath: %@; Success: %i"),
                    v4,
                    v6,
                    v8,
                    v10,
                    v11,
                    -[CHWorkoutInterval wasSuccessful](self, "wasSuccessful")));

  return v12;
}

- (NSString)stepKeyPath
{
  return self->_stepKeyPath;
}

- (void)setStepKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_stepKeyPath, a3);
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (void)setWasSuccessful:(BOOL)a3
{
  self->_wasSuccessful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepKeyPath, 0);
}

@end

@implementation ATXLocationManagerGuardedData

- (ATXLocationManagerGuardedData)init
{
  ATXLocationManagerGuardedData *v2;
  ATXLocationManagerGuardedData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXLocationManagerGuardedData;
  v2 = -[ATXLocationManagerGuardedData init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ATXLocationManagerGuardedData clear](v2, "clear");
  return v3;
}

- (void)clear
{
  CLLocation *currentLocation;
  NSDate *v4;
  NSDate *lastRequestLocationDate;
  ATXLocationManagerState *v6;
  ATXLocationManagerState *state;
  NSDate *v8;
  NSDate *lastLOIUpdateTimestamp;
  NSDate *v10;
  NSDate *lastPredictedLOIsUpdateTimestamp;
  NSDate *v12;
  NSDate *lastPredictedExitTimesUpdateTimestamp;

  currentLocation = self->currentLocation;
  self->currentLocation = 0;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastRequestLocationDate = self->lastRequestLocationDate;
  self->lastRequestLocationDate = v4;

  v6 = (ATXLocationManagerState *)objc_opt_new();
  state = self->state;
  self->state = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastLOIUpdateTimestamp = self->lastLOIUpdateTimestamp;
  self->lastLOIUpdateTimestamp = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastPredictedLOIsUpdateTimestamp = self->lastPredictedLOIsUpdateTimestamp;
  self->lastPredictedLOIsUpdateTimestamp = v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastPredictedExitTimesUpdateTimestamp = self->lastPredictedExitTimesUpdateTimestamp;
  self->lastPredictedExitTimesUpdateTimestamp = v12;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastPredictedExitTimesUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->lastPredictedLOIsUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->lastRoutineModeTimestamp, 0);
  objc_storeStrong((id *)&self->lastLOIUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->state, 0);
  objc_storeStrong((id *)&self->lastRequestLocationDate, 0);
  objc_storeStrong((id *)&self->currentLocation, 0);
}

@end

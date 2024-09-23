@implementation CHWorkoutTrackLap

- (CHWorkoutTrackLap)initWithWorkoutEvent:(id)a3
{
  id v4;
  CHWorkoutTrackLap *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CHWorkoutTrackLap;
  v5 = -[CHWorkoutTrackLap init](&v20, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateInterval"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    -[CHWorkoutSegment setStartDate:](v5, "setStartDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateInterval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
    -[CHWorkoutSegment setEndDate:](v5, "setEndDate:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", FIPrivateMetadataKeyLapIndex));

    -[CHWorkoutTrackLap setLapIndex:](v5, "setLapIndex:", objc_msgSend(v11, "integerValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", FIPrivateMetadataKeyLaneNumber));

    -[CHWorkoutTrackLap setLaneNumber:](v5, "setLaneNumber:", objc_msgSend(v13, "integerValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", FIPrivateMetadataKeyLapDistance));

    -[CHWorkoutSegment setDistance:](v5, "setDistance:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", FIPrivateMetadataKeyLapDuration));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit secondUnit](HKUnit, "secondUnit"));
      objc_msgSend(v17, "doubleValueForUnit:", v18);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateInterval"));
      objc_msgSend(v18, "duration");
    }
    -[CHWorkoutSegment setElapsedTime:](v5, "setElapsedTime:");

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHWorkoutTrackLap;
  v3 = -[CHWorkoutSegment description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(TRACK LAP) %@: Index: %li; Lane: %li"),
                   v4,
                   -[CHWorkoutTrackLap lapIndex](self, "lapIndex"),
                   -[CHWorkoutTrackLap laneNumber](self, "laneNumber")));

  return v5;
}

- (int64_t)lapIndex
{
  return self->_lapIndex;
}

- (void)setLapIndex:(int64_t)a3
{
  self->_lapIndex = a3;
}

- (int64_t)laneNumber
{
  return self->_laneNumber;
}

- (void)setLaneNumber:(int64_t)a3
{
  self->_laneNumber = a3;
}

@end

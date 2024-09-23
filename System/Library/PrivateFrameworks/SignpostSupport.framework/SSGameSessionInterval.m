@implementation SSGameSessionInterval

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSGameSessionInterval startMachContinuousTime](self, "startMachContinuousTime");
  -[SSGameSessionInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSGameSessionInterval endMachContinuousTime](self, "endMachContinuousTime");
  -[SSGameSessionInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SSGameSessionInterval endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SSGameSessionInterval startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[SSGameSessionInterval endSeconds](self, "endSeconds");
  v4 = v3;
  -[SSGameSessionInterval startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[SSGameSessionInterval startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[SSGameSessionInterval endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[SSGameSessionInterval durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[SSGameSessionInterval startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[SSGameSessionInterval endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[SSGameSessionInterval durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
}

- (SSGameSessionInterval)initWithIncludeTimelines:(BOOL)a3 timebaseRatio:(double)a4
{
  SSGameSessionInterval *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSGameSessionInterval;
  result = -[SSGameSessionInterval init](&v7, sel_init);
  if (result)
  {
    result->_includeTimelines = a3;
    result->_timebaseRatio = a4;
  }
  return result;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  _timeIntervalDict(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSGameSessionInterval supportsSEM](self, "supportsSEM"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, kSSGameSessionKey_SupportsSEM);

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSGameSessionInterval jsonDescription:](self, "jsonDescription:", 3);
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (BOOL)supportsSEM
{
  return self->_supportsSEM;
}

- (NSArray)triggeringSEMIntervals
{
  return self->_triggeringSEMIntervals;
}

- (NSArray)triggeringGameModeIntervals
{
  return self->_triggeringGameModeIntervals;
}

- (unint64_t)earliestMCT
{
  return self->_earliestMCT;
}

- (void)setEarliestMCT:(unint64_t)a3
{
  self->_earliestMCT = a3;
}

- (unint64_t)latestMCT
{
  return self->_latestMCT;
}

- (void)setLatestMCT:(unint64_t)a3
{
  self->_latestMCT = a3;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestDate, a3);
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (void)setLatestDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestDate, a3);
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (void)setStartMachContinuousTime:(unint64_t)a3
{
  self->_startMachContinuousTime = a3;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (void)setEndMachContinuousTime:(unint64_t)a3
{
  self->_endMachContinuousTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_latestDate, 0);
  objc_storeStrong((id *)&self->_earliestDate, 0);
  objc_storeStrong((id *)&self->_triggeringGameModeIntervals, 0);
  objc_storeStrong((id *)&self->_triggeringSEMIntervals, 0);
}

@end

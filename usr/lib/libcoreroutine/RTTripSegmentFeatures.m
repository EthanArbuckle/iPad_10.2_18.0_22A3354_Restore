@implementation RTTripSegmentFeatures

- (RTTripSegmentFeatures)initWithTransitionIndex:(unint64_t)a3 tripId:(id)a4 mode:(int64_t)a5 dateInterval:(id)a6
{
  id v11;
  id v12;
  RTTripSegmentFeatures *v13;
  RTTripSegmentFeatures *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)RTTripSegmentFeatures;
  v13 = -[RTTripSegmentFeatures init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_transitionIndex = a3;
    objc_storeStrong((id *)&v13->_tripId, a4);
    v14->_mode = a5;
    objc_storeStrong((id *)&v14->_dateInterval, a6);
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTTripSegmentFeatures dateInterval](self, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTripSegmentFeatures tripId](self, "tripId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("dateInterval,%@,tripId,%@,mode,%zd,transitionIdx,%tu"), v4, v5, -[RTTripSegmentFeatures mode](self, "mode"), -[RTTripSegmentFeatures transitionIndex](self, "transitionIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)transitionIndex
{
  return self->_transitionIndex;
}

- (void)setTransitionIndex:(unint64_t)a3
{
  self->_transitionIndex = a3;
}

- (NSUUID)tripId
{
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
  objc_storeStrong((id *)&self->_tripId, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_tripId, 0);
}

@end

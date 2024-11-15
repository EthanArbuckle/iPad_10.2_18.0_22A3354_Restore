@implementation TAInterVisitSummary

- (TAInterVisitSummary)initWithObservationInterval:(id)a3 andLocationHistory:(id)a4 andLastObservation:(id)a5
{
  id v8;
  id v9;
  id v10;
  TAInterVisitSummary *v11;
  TAInterVisitSummary *v12;
  uint64_t v13;
  NSDateInterval *deviceObservationInterval;
  uint64_t v15;
  NSArray *deviceLocationHistory;
  uint64_t v17;
  TASPAdvertisement *latestObservation;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TAInterVisitSummary;
  v11 = -[TAInterVisitSummary init](&v20, sel_init);
  if (!v11)
    goto LABEL_6;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v13 = objc_msgSend(v8, "copy");
    deviceObservationInterval = v11->_deviceObservationInterval;
    v11->_deviceObservationInterval = (NSDateInterval *)v13;

    v15 = objc_msgSend(v9, "copy");
    deviceLocationHistory = v11->_deviceLocationHistory;
    v11->_deviceLocationHistory = (NSArray *)v15;

    v17 = objc_msgSend(v10, "copy");
    latestObservation = v11->_latestObservation;
    v11->_latestObservation = (TASPAdvertisement *)v17;

LABEL_6:
    v12 = v11;
  }

  return v12;
}

- (NSDateInterval)deviceObservationInterval
{
  return self->_deviceObservationInterval;
}

- (NSArray)deviceLocationHistory
{
  return self->_deviceLocationHistory;
}

- (TASPAdvertisement)latestObservation
{
  return self->_latestObservation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestObservation, 0);
  objc_storeStrong((id *)&self->_deviceLocationHistory, 0);
  objc_storeStrong((id *)&self->_deviceObservationInterval, 0);
}

@end

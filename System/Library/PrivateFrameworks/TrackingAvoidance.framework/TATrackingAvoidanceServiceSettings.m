@implementation TATrackingAvoidanceServiceSettings

- (double)classificationTimeInterval
{
  return self->_classificationTimeInterval;
}

- (BOOL)enableTAFilterVisits
{
  return self->_enableTAFilterVisits;
}

- (BOOL)enableTAFilterSingleVisit
{
  return self->_enableTAFilterSingleVisit;
}

- (TATrackingAvoidanceServiceSettings)initWithDefaults
{
  return -[TATrackingAvoidanceServiceSettings initWithEnableTAFilterGeneral:enableTAFilterVisits:enableTAFilterSingleVisit:enableTAFilterLeavingLOI:classificationTimeInterval:](self, "initWithEnableTAFilterGeneral:enableTAFilterVisits:enableTAFilterSingleVisit:enableTAFilterLeavingLOI:classificationTimeInterval:", 1, 1, 1, 1, 120.0);
}

- (TATrackingAvoidanceServiceSettings)initWithEnableTAFilterGeneral:(BOOL)a3 enableTAFilterVisits:(BOOL)a4 enableTAFilterSingleVisit:(BOOL)a5 enableTAFilterLeavingLOI:(BOOL)a6 classificationTimeInterval:(double)a7
{
  TATrackingAvoidanceServiceSettings *result;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TATrackingAvoidanceServiceSettings;
  result = -[TATrackingAvoidanceServiceSettings init](&v14, sel_init);
  if (result)
  {
    result->_enableTAFilterGeneral = a3;
    result->_enableTAFilterVisits = a4;
    result->_enableTAFilterSingleVisit = a5;
    result->_enableTAFilterLeavingLOI = a6;
    v13 = 120.0;
    if (a7 > 0.0)
      v13 = a7;
    result->_classificationTimeInterval = v13;
  }
  return result;
}

- (TATrackingAvoidanceServiceSettings)initWithEnableTAFilterGeneralOrDefault:(id)a3 enableTAFilterVisitsOrDefault:(id)a4 enableTAFilterSingleVisitOrDefault:(id)a5 enableTAFilterLeavingLOIOrDefault:(id)a6 classificationTimeIntervalOrDefault:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  TATrackingAvoidanceServiceSettings *v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    v17 = objc_msgSend(v12, "BOOLValue");
    if (v13)
      goto LABEL_3;
  }
  else
  {
    v17 = 1;
    if (v13)
    {
LABEL_3:
      v18 = objc_msgSend(v13, "BOOLValue");
      if (v14)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v18 = 1;
  if (v14)
  {
LABEL_4:
    v19 = objc_msgSend(v14, "BOOLValue");
    if (v15)
      goto LABEL_5;
LABEL_10:
    v20 = 1;
    if (v16)
      goto LABEL_6;
LABEL_11:
    v21 = 120.0;
    goto LABEL_12;
  }
LABEL_9:
  v19 = 1;
  if (!v15)
    goto LABEL_10;
LABEL_5:
  v20 = objc_msgSend(v15, "BOOLValue");
  if (!v16)
    goto LABEL_11;
LABEL_6:
  objc_msgSend(v16, "doubleValue");
LABEL_12:
  v22 = -[TATrackingAvoidanceServiceSettings initWithEnableTAFilterGeneral:enableTAFilterVisits:enableTAFilterSingleVisit:enableTAFilterLeavingLOI:classificationTimeInterval:](self, "initWithEnableTAFilterGeneral:enableTAFilterVisits:enableTAFilterSingleVisit:enableTAFilterLeavingLOI:classificationTimeInterval:", v17, v18, v19, v20, v21);

  return v22;
}

- (BOOL)enableTAFilterGeneral
{
  return self->_enableTAFilterGeneral;
}

- (BOOL)enableTAFilterLeavingLOI
{
  return self->_enableTAFilterLeavingLOI;
}

@end

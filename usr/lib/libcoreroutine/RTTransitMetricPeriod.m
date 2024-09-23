@implementation RTTransitMetricPeriod

- (RTTransitMetricPeriod)initWithJourneyPeriod:(id)a3 homeStayPeriod:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTTransitMetricPeriod *v10;
  id *p_isa;
  RTTransitMetricPeriod *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: journeyPeriod";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: homeStayPeriod";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTTransitMetricPeriod;
  v10 = -[RTTransitMetricPeriod init](&v16, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_journeyPeriod, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (BOOL)travelTogether:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[RTTransitMetricPeriod journeyPeriod](self, "journeyPeriod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isBeforeDate:", v7))
  {
    objc_msgSend(v4, "entryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTransitMetricPeriod journeyPeriod](self, "journeyPeriod");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isBeforeDate:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)stayAtHomeTogether:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[RTTransitMetricPeriod homeStayPeriod](self, "homeStayPeriod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isBeforeDate:", v7))
  {
    objc_msgSend(v4, "entryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTransitMetricPeriod homeStayPeriod](self, "homeStayPeriod");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isBeforeDate:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSDateInterval)journeyPeriod
{
  return self->_journeyPeriod;
}

- (NSDateInterval)homeStayPeriod
{
  return self->_homeStayPeriod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeStayPeriod, 0);
  objc_storeStrong((id *)&self->_journeyPeriod, 0);
}

@end

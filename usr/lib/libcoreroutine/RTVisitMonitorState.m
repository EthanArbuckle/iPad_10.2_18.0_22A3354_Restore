@implementation RTVisitMonitorState

- (RTVisitMonitorState)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLastVisit_lastLowConfidenceVisit_);
}

- (RTVisitMonitorState)initWithLastVisit:(id)a3 lastLowConfidenceVisit:(id)a4
{
  id v7;
  id v8;
  RTVisitMonitorState *v9;
  RTVisitMonitorState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTVisitMonitorState;
  v9 = -[RTVisitMonitorState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastVisitIncident, a3);
    objc_storeStrong((id *)&v10->_lastLowConfidenceVisitIncident, a4);
  }

  return v10;
}

- (void)dump
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitMonitorState lastVisitIncident](self, "lastVisitIncident");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitMonitorState lastLowConfidenceVisitIncident](self, "lastLowConfidenceVisitIncident");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, lastVisit, %@, lastLowConfidenceVisit, %@", (uint8_t *)&v8, 0x20u);

    }
  }
}

- (RTVisit)lastVisitIncident
{
  return self->_lastVisitIncident;
}

- (void)setLastVisitIncident:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisitIncident, a3);
}

- (RTVisit)lastLowConfidenceVisitIncident
{
  return self->_lastLowConfidenceVisitIncident;
}

- (void)setLastLowConfidenceVisitIncident:(id)a3
{
  objc_storeStrong((id *)&self->_lastLowConfidenceVisitIncident, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLowConfidenceVisitIncident, 0);
  objc_storeStrong((id *)&self->_lastVisitIncident, 0);
}

@end

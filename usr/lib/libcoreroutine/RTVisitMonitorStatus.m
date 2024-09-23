@implementation RTVisitMonitorStatus

- (RTVisitMonitorStatus)initWithMonitoringVisitIncidents:(BOOL)a3 monitoringLeechedVisitIncidents:(BOOL)a4 monitoringLowConfidenceVisitIncidents:(BOOL)a5 feedBufferReferenceCounter:(unint64_t)a6
{
  RTVisitMonitorStatus *v10;
  RTVisitMonitorStatus *v11;
  NSObject *v12;
  RTVisitMonitorStatus *v13;
  objc_super v15;
  uint8_t buf[4];
  RTVisitMonitorStatus *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)RTVisitMonitorStatus;
  v10 = -[RTVisitMonitorStatus init](&v15, sel_init);
  v11 = v10;
  if (v10
    && (v10->_monitoringVisitIncidents = a3,
        v10->_monitoringLeechedVisitIncidents = a4,
        v10->_monitoringLowConfidenceVisitIncidents = a5,
        v10->_feedBufferReferenceCounter = a6,
        -[RTVisitMonitorStatus invalid](v10, "invalid")))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "Invalid RTVisitMonitorStatus, %@", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    v13 = v11;
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTVisitMonitorStatus feedBufferReferenceCounter](self, "feedBufferReferenceCounter");
  if (-[RTVisitMonitorStatus monitoringVisitIncidents](self, "monitoringVisitIncidents"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[RTVisitMonitorStatus monitoringLeechedVisitIncidents](self, "monitoringLeechedVisitIncidents"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[RTVisitMonitorStatus monitoringLowConfidenceVisitIncidents](self, "monitoringLowConfidenceVisitIncidents"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, feedBufferReferenceCounter, %lu, monitoringVisitIncidents, %@, monitoringLeechedVisitIncidents, %@, monitoringLowConfVisitIncidents, %@"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)invalid
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  int v6;

  if (-[RTVisitMonitorStatus monitoringVisitIncidents](self, "monitoringVisitIncidents"))
    v3 = -[RTVisitMonitorStatus feedBufferReferenceCounter](self, "feedBufferReferenceCounter") == 0;
  else
    v3 = 0;
  if (-[RTVisitMonitorStatus monitoringLeechedVisitIncidents](self, "monitoringLeechedVisitIncidents"))
    v4 = -[RTVisitMonitorStatus feedBufferReferenceCounter](self, "feedBufferReferenceCounter") == 0;
  else
    v4 = 0;
  if (-[RTVisitMonitorStatus monitoringLowConfidenceVisitIncidents](self, "monitoringLowConfidenceVisitIncidents"))
    v5 = -[RTVisitMonitorStatus feedBufferReferenceCounter](self, "feedBufferReferenceCounter") == 0;
  else
    v5 = 0;
  if (!-[RTVisitMonitorStatus feedBufferReferenceCounter](self, "feedBufferReferenceCounter")
    || -[RTVisitMonitorStatus monitoringVisitIncidents](self, "monitoringVisitIncidents")
    || -[RTVisitMonitorStatus monitoringLeechedVisitIncidents](self, "monitoringLeechedVisitIncidents"))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = !-[RTVisitMonitorStatus monitoringLowConfidenceVisitIncidents](self, "monitoringLowConfidenceVisitIncidents");
  }
  return (v4 || v3) | v5 | v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMonitoringVisitIncidents:monitoringLeechedVisitIncidents:monitoringLowConfidenceVisitIncidents:feedBufferReferenceCounter:", -[RTVisitMonitorStatus monitoringVisitIncidents](self, "monitoringVisitIncidents"), -[RTVisitMonitorStatus monitoringLeechedVisitIncidents](self, "monitoringLeechedVisitIncidents"), -[RTVisitMonitorStatus monitoringLowConfidenceVisitIncidents](self, "monitoringLowConfidenceVisitIncidents"), -[RTVisitMonitorStatus feedBufferReferenceCounter](self, "feedBufferReferenceCounter"));
}

- (BOOL)monitoringVisitIncidents
{
  return self->_monitoringVisitIncidents;
}

- (void)setMonitoringVisitIncidents:(BOOL)a3
{
  self->_monitoringVisitIncidents = a3;
}

- (BOOL)monitoringLeechedVisitIncidents
{
  return self->_monitoringLeechedVisitIncidents;
}

- (void)setMonitoringLeechedVisitIncidents:(BOOL)a3
{
  self->_monitoringLeechedVisitIncidents = a3;
}

- (BOOL)monitoringLowConfidenceVisitIncidents
{
  return self->_monitoringLowConfidenceVisitIncidents;
}

- (void)setMonitoringLowConfidenceVisitIncidents:(BOOL)a3
{
  self->_monitoringLowConfidenceVisitIncidents = a3;
}

- (unint64_t)feedBufferReferenceCounter
{
  return self->_feedBufferReferenceCounter;
}

- (void)setFeedBufferReferenceCounter:(unint64_t)a3
{
  self->_feedBufferReferenceCounter = a3;
}

@end

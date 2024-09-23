@implementation SPMonitoredProcess

- (SPMonitoredProcess)initWithPid:(int)a3
{
  SPMonitoredProcess *v4;
  SPMonitoredProcess *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPMonitoredProcess;
  v4 = -[SPProcessEvent init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->super._targetProcessId = a3;
    v4->super._isLiveSampling = 1;
    -[SPProcessEvent setIncidentUUID:](v4, "setIncidentUUID:", +[NSUUID UUID](NSUUID, "UUID"));
  }
  return v5;
}

- (double)reportTimeThreshold
{
  return self->_reportTimeThreshold;
}

- (void)setReportTimeThreshold:(double)a3
{
  self->_reportTimeThreshold = a3;
}

@end

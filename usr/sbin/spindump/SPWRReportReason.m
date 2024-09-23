@implementation SPWRReportReason

- (SPWRReportReason)initWithWorkflowTracker:(id)a3 signpostTracker:(id)a4 diagnostic:(id)a5
{
  SPWRReportReason *v8;

  v8 = -[SPWRReportReason init](self, "init");
  if (v8)
  {
    v8->_workflowTracker = (WRWorkflowEventTracker *)a3;
    v8->_signpostTracker = (WRSignpostTracker *)a4;
    v8->_diagnostic = (WRDiagnostic *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPWRReportReason;
  -[SPWRReportReason dealloc](&v3, "dealloc");
}

- (WRWorkflowEventTracker)workflowTracker
{
  return self->_workflowTracker;
}

- (WRSignpostTracker)signpostTracker
{
  return self->_signpostTracker;
}

- (WRDiagnostic)diagnostic
{
  return self->_diagnostic;
}

- (BOOL)workflowEventTimedOut
{
  return self->_workflowEventTimedOut;
}

- (void)setWorkflowEventTimedOut:(BOOL)a3
{
  self->_workflowEventTimedOut = a3;
}

- (double)workflowDuration
{
  return self->_workflowDuration;
}

- (void)setWorkflowDuration:(double)a3
{
  self->_workflowDuration = a3;
}

- (double)workflowDurationOmittingNetworkBoundIntervals
{
  return self->_workflowDurationOmittingNetworkBoundIntervals;
}

- (void)setWorkflowDurationOmittingNetworkBoundIntervals:(double)a3
{
  self->_workflowDurationOmittingNetworkBoundIntervals = a3;
}

- (unint64_t)signpostCount
{
  return self->_signpostCount;
}

- (void)setSignpostCount:(unint64_t)a3
{
  self->_signpostCount = a3;
}

- (double)signpostDurationUnion
{
  return self->_signpostDurationUnion;
}

- (void)setSignpostDurationUnion:(double)a3
{
  self->_signpostDurationUnion = a3;
}

- (double)signpostDurationSum
{
  return self->_signpostDurationSum;
}

- (void)setSignpostDurationSum:(double)a3
{
  self->_signpostDurationSum = a3;
}

- (double)signpostDurationSingle
{
  return self->_signpostDurationSingle;
}

- (void)setSignpostDurationSingle:(double)a3
{
  self->_signpostDurationSingle = a3;
}

@end

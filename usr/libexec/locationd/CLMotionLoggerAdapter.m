@implementation CLMotionLoggerAdapter

- (CLMotionLoggerAdapter)initWithMotionLogger:(void *)a3
{
  CLMotionLoggerAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMotionLoggerAdapter;
  result = -[CLMotionLoggerAdapter init](&v5, "init");
  if (result)
  {
    result->_motionLogger = a3;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x10] = 0;
  }
  return result;
}

- (void)onLowConfidenceVisit:(id)a3
{
  sub_100BCF2F8((uint64_t)self->_motionLogger, a3, 0);
}

- (void)onVisit:(id)a3
{
  sub_100BCF2F8((uint64_t)self->_motionLogger, a3, 2);
}

- (void)onMobilityBoutMetrics:(BoutMetrics *)a3
{
  sub_100BCF8F4((uint64_t)self->_motionLogger);
}

- (uint64_t)onWalkingSteadinessClassification:(uint64_t)a3
{
  return sub_100BCFA10(*(_QWORD *)(a1 + 8), a3);
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  sub_100BCFB28((uint64_t)self, a3);
}

- (void)didExitFence:(id)a3
{
  sub_100BCFFA8((uint64_t)self->_motionLogger);
}

- (void)onBackgroundInertialOdometryState:(id)a3
{
  sub_100BD013C((uint64_t)self, a3);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end

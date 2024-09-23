@implementation CMCoastedGravityEstimator

- (CMCoastedGravityEstimator)init
{
  CMCoastedGravityEstimator *v2;
  CMCoastedGravityEstimator *v3;
  CMCoastedGravityEstimator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMCoastedGravityEstimator;
  v2 = -[CMCoastedGravityEstimator init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (CMGravity)feedAccelAtTimestamp:(double)a3 X:(float)a4 Y:(float)a5 Z:(float)a6
{
  float v6;
  float v7;
  float v8;
  CMGravity result;

  v6 = sub_100050080((uint64_t *)&self->_impl, a3, a4, a5, a6);
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (CMGravity)feedRotationRateAtTimestamp:(double)a3 X:(float)a4 Y:(float)a5 Z:(float)a6
{
  float v6;
  float v7;
  float v8;
  CMGravity result;

  sub_100050600((uint64_t *)&self->_impl, a3, a4, a5, a6);
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (unint64_t)numSamples
{
  return sub_1000F7018((uint64_t)&self->_impl);
}

- (BOOL)isConverged
{
  return sub_10004F698((uint64_t)&self->_impl);
}

- (void).cxx_destruct
{
  sub_1000C7D78((uint64_t *)&self->_impl);
}

- (id).cxx_construct
{
  sub_1000C7DB8();
}

@end

@implementation CLSerializableWalkingSpeedStrideCal

- (CLSerializableWalkingSpeedStrideCal)initWithWalkingSpeedStrideCal:(const WalkingSpeedStrideCal *)a3
{
  CLSerializableWalkingSpeedStrideCal *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSerializableWalkingSpeedStrideCal;
  result = -[CLSerializableWalkingSpeedStrideCal init](&v7, "init");
  if (result)
  {
    v5 = *(_OWORD *)&a3->startTime;
    v6 = *(_OWORD *)&a3->cadenceWatch;
    *(_OWORD *)&result->_strideCal.meanWalkingSpeed = *(_OWORD *)&a3->meanWalkingSpeed;
    *(_OWORD *)&result->_strideCal.cadenceWatch = v6;
    *(_OWORD *)&result->_strideCal.startTime = v5;
  }
  return result;
}

- (void)getWalkingSpeedStrideCal:(WalkingSpeedStrideCal *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->_strideCal.startTime;
  v4 = *(_OWORD *)&self->_strideCal.meanWalkingSpeed;
  *(_OWORD *)&a3->cadenceWatch = *(_OWORD *)&self->_strideCal.cadenceWatch;
  *(_OWORD *)&a3->meanWalkingSpeed = v4;
  *(_OWORD *)&a3->startTime = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_strideCal.startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("endTime"), self->_strideCal.endTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("cadenceWatch"), self->_strideCal.cadenceWatch);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("cadenceGaitCycle"), self->_strideCal.cadenceGaitCycle);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("meanWalkingSpeed"), self->_strideCal.meanWalkingSpeed);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("gaitCycleYield"), self->_strideCal.gaitCycleYield);
}

- (CLSerializableWalkingSpeedStrideCal)initWithCoder:(id)a3
{
  CLSerializableWalkingSpeedStrideCal *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSerializableWalkingSpeedStrideCal;
  v4 = -[CLSerializableWalkingSpeedStrideCal init](&v12, "init");
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_strideCal.startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("endTime"));
    v4->_strideCal.endTime = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("cadenceWatch"));
    v4->_strideCal.cadenceWatch = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("cadenceGaitCycle"));
    v4->_strideCal.cadenceGaitCycle = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("meanWalkingSpeed"));
    v4->_strideCal.meanWalkingSpeed = v9;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("gaitCycleYield"));
    v4->_strideCal.gaitCycleYield = v10;
  }
  return v4;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

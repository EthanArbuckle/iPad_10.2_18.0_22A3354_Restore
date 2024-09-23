@implementation CLEEDCoexThermalForCA

- (CLEEDCoexThermalForCA)initWithCoexMetricDict:(id)a3
{
  char *v4;
  CLEEDCoexThermalForCA *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLEEDCoexThermalForCA;
  v4 = -[CLEEDCoexThermalForCA init](&v14, "init");
  v5 = (CLEEDCoexThermalForCA *)v4;
  if (v4)
  {
    if (a3)
    {
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("thermalNominalDuration")), "doubleValue");
      v5->_thermalNominalDuration = v6;
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("thermalLightDuration")), "doubleValue");
      v5->_thermalLightDuration = v7;
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("thermalModerateDuration")), "doubleValue");
      v5->_thermalModerateDuration = v8;
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("thermalHeavyDuration")), "doubleValue");
      v5->_thermalHeavyDuration = v9;
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("thermalTrappingDuration")), "doubleValue");
      v5->_thermalTrappingDuration = v10;
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("thermalSleepingDuration")), "doubleValue");
      v5->_thermalSleepingDuration = v11;
      v5->_thermalLevelAtStartOfCall = objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("thermalLevelAtStartOfCall")), "intValue");
      v5->_maxThermalLevelInCall = objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("maxThermalLevelInCall")), "intValue");
      v5->_thermalLevelAtEndOfCall = objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("thermalLevelAtEndOfCall")), "intValue");
      objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("currentThermalLevelStartTime")), "doubleValue");
      v5->_currentThermalLevelStartTime = v12;
    }
    else
    {
      *((_QWORD *)v4 + 1) = 0;
      *((_DWORD *)v4 + 4) = 0;
      *(_OWORD *)(v4 + 24) = 0u;
      *(_OWORD *)(v4 + 40) = 0u;
      *(_OWORD *)(v4 + 56) = 0u;
      *((_QWORD *)v4 + 9) = 0;
    }
  }
  return v5;
}

- (double)thermalNominalDuration
{
  return self->_thermalNominalDuration;
}

- (void)setThermalNominalDuration:(double)a3
{
  self->_thermalNominalDuration = a3;
}

- (double)thermalLightDuration
{
  return self->_thermalLightDuration;
}

- (void)setThermalLightDuration:(double)a3
{
  self->_thermalLightDuration = a3;
}

- (double)thermalModerateDuration
{
  return self->_thermalModerateDuration;
}

- (void)setThermalModerateDuration:(double)a3
{
  self->_thermalModerateDuration = a3;
}

- (double)thermalHeavyDuration
{
  return self->_thermalHeavyDuration;
}

- (void)setThermalHeavyDuration:(double)a3
{
  self->_thermalHeavyDuration = a3;
}

- (double)thermalTrappingDuration
{
  return self->_thermalTrappingDuration;
}

- (void)setThermalTrappingDuration:(double)a3
{
  self->_thermalTrappingDuration = a3;
}

- (double)thermalSleepingDuration
{
  return self->_thermalSleepingDuration;
}

- (void)setThermalSleepingDuration:(double)a3
{
  self->_thermalSleepingDuration = a3;
}

- (int)thermalLevelAtStartOfCall
{
  return self->_thermalLevelAtStartOfCall;
}

- (void)setThermalLevelAtStartOfCall:(int)a3
{
  self->_thermalLevelAtStartOfCall = a3;
}

- (int)maxThermalLevelInCall
{
  return self->_maxThermalLevelInCall;
}

- (void)setMaxThermalLevelInCall:(int)a3
{
  self->_maxThermalLevelInCall = a3;
}

- (int)thermalLevelAtEndOfCall
{
  return self->_thermalLevelAtEndOfCall;
}

- (void)setThermalLevelAtEndOfCall:(int)a3
{
  self->_thermalLevelAtEndOfCall = a3;
}

- (double)currentThermalLevelStartTime
{
  return self->_currentThermalLevelStartTime;
}

- (void)setCurrentThermalLevelStartTime:(double)a3
{
  self->_currentThermalLevelStartTime = a3;
}

@end

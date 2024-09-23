@implementation PidComponent

- (int)mitigationType
{
  return self->mitigationType;
}

- (int)controlEffort
{
  return self->controlEffort;
}

- (id)initPIDWith:(__CFDictionary *)a3
{
  PidComponent *v4;
  PidComponent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PidComponent;
  v4 = -[PidComponent init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      sub_1000048B0(a3, CFSTR("kp"), kCFNumberFloatType, &v4->kp);
      sub_1000048B0(a3, CFSTR("ki"), kCFNumberFloatType, &v5->ki);
      sub_1000048B0(a3, CFSTR("ts"), kCFNumberFloatType, &v5->ts);
      sub_1000048B0(a3, CFSTR("intMin"), kCFNumberFloatType, &v5->integratorMin);
      sub_1000048B0(a3, CFSTR("intMax"), kCFNumberFloatType, &v5->integratorMax);
      sub_1000048B0(a3, CFSTR("target"), kCFNumberFloatType, &v5->TARGET);
      v5->engageDelta = 0.0;
      sub_1000048B0(a3, CFSTR("engageDelta"), kCFNumberFloatType, &v5->engageDelta);
    }
    v5->allowCEOverride = 0;
    v5->mitigationType = -1;
    v5->nameofComponent = 0;
    *(_QWORD *)&v5->boundCheckLow = 0xFF00000000;
  }
  return v5;
}

- (void)dealloc
{
  __CFString *nameofComponent;
  objc_super v4;

  nameofComponent = self->nameofComponent;
  if (nameofComponent)
    CFRelease(nameofComponent);
  v4.receiver = self;
  v4.super_class = (Class)PidComponent;
  -[PidComponent dealloc](&v4, "dealloc");
}

- (void)calculateControlEffort:(float)a3
{
  float v3;
  float integratorMin;
  float v5;
  float integratorMax;
  int boundCheckLow;

  v3 = self->TARGET - a3;
  integratorMin = self->integratorMin;
  v5 = self->integrator + (float)((float)(self->ki * self->ts) * v3);
  self->integrator = v5;
  if (v5 < integratorMin)
  {
    self->integrator = integratorMin;
    v5 = integratorMin;
  }
  integratorMax = self->integratorMax;
  if (v5 > integratorMax)
  {
    self->integrator = integratorMax;
    v5 = integratorMax;
  }
  if (!self->allowCEOverride)
  {
    boundCheckLow = (int)(float)(v5 + (float)(self->kp * (float)(v3 - self->engageDelta)));
    if (self->boundCheckLow > boundCheckLow)
      boundCheckLow = self->boundCheckLow;
    if (boundCheckLow >= self->boundCheckHigh)
      boundCheckLow = self->boundCheckHigh;
    self->controlEffort = boundCheckLow;
  }
}

- (BOOL)isEqualMType:(int)a3
{
  return self->mitigationType == a3;
}

- (BOOL)isIntegratorAtMin
{
  return self->integrator == self->integratorMin;
}

- (void)applySeedToIntegratorFromControlEffort:(int)a3 currentTemperature:(float)a4
{
  int boundCheckLow;
  float v5;
  float v6;
  float integratorMin;
  float integratorMax;
  NSObject *v9;
  int v10;
  double v11;

  boundCheckLow = self->boundCheckLow;
  if (boundCheckLow <= a3)
    boundCheckLow = a3;
  v5 = self->TARGET - a4;
  if (boundCheckLow >= self->boundCheckHigh)
    boundCheckLow = self->boundCheckHigh;
  v6 = (float)(int)(float)((float)boundCheckLow - (float)(v5 * self->kp));
  self->integrator = v6;
  integratorMin = self->integratorMin;
  if (integratorMin > v6)
  {
    self->integrator = integratorMin;
    v6 = integratorMin;
  }
  integratorMax = self->integratorMax;
  if (v6 > integratorMax)
  {
    self->integrator = integratorMax;
    v6 = integratorMax;
  }
  v9 = qword_1000A28A0;
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Setting integral component to %f", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)allowCEOverride
{
  return self->allowCEOverride;
}

- (void)setAllowCEOverride:(BOOL)a3
{
  self->allowCEOverride = a3;
}

- (void)setControlEffort:(int)a3
{
  self->controlEffort = a3;
}

- (__CFString)nameofComponent
{
  return self->nameofComponent;
}

- (float)integrator
{
  return self->integrator;
}

- (float)TARGET
{
  return self->TARGET;
}

- (void)setTARGET:(float)a3
{
  self->TARGET = a3;
}

@end

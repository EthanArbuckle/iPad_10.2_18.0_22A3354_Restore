@implementation SLUEStatisticsModuleIpFeatures

- (SLUEStatisticsModuleIpFeatures)initWithDefaults
{
  SLUEStatisticsModuleIpFeatures *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLUEStatisticsModuleIpFeatures;
  result = -[SLUEStatisticsModuleIpFeatures init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_buttonPressIntendedRatio = 0;
    result->_cohortType = (NSString *)&stru_24D0C6768;
    *(_QWORD *)&result->_intendedRatio = 0;
    *(_QWORD *)&result->_voiceTriggerIntendedRatio = 0;
    *(_OWORD *)&result->_requestCount = 0u;
    *(_OWORD *)&result->_unintendedCount = 0u;
    *(_OWORD *)&result->_voiceTriggerCount = 0u;
    result->_voiceTriggerUnintendedCount = 0;
  }
  return result;
}

- (NSString)cohortType
{
  return self->_cohortType;
}

- (void)setCohortType:(id)a3
{
  self->_cohortType = (NSString *)a3;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (unint64_t)intendedCount
{
  return self->_intendedCount;
}

- (void)setIntendedCount:(unint64_t)a3
{
  self->_intendedCount = a3;
}

- (unint64_t)unintendedCount
{
  return self->_unintendedCount;
}

- (void)setUnintendedCount:(unint64_t)a3
{
  self->_unintendedCount = a3;
}

- (unint64_t)buttonPressCount
{
  return self->_buttonPressCount;
}

- (void)setButtonPressCount:(unint64_t)a3
{
  self->_buttonPressCount = a3;
}

- (unint64_t)voiceTriggerCount
{
  return self->_voiceTriggerCount;
}

- (void)setVoiceTriggerCount:(unint64_t)a3
{
  self->_voiceTriggerCount = a3;
}

- (unint64_t)voiceTriggerIntendedCount
{
  return self->_voiceTriggerIntendedCount;
}

- (void)setVoiceTriggerIntendedCount:(unint64_t)a3
{
  self->_voiceTriggerIntendedCount = a3;
}

- (unint64_t)voiceTriggerUnintendedCount
{
  return self->_voiceTriggerUnintendedCount;
}

- (void)setVoiceTriggerUnintendedCount:(unint64_t)a3
{
  self->_voiceTriggerUnintendedCount = a3;
}

- (float)intendedRatio
{
  return self->_intendedRatio;
}

- (void)setIntendedRatio:(float)a3
{
  self->_intendedRatio = a3;
}

- (float)voiceTriggerRequestRatio
{
  return self->_voiceTriggerRequestRatio;
}

- (void)setVoiceTriggerRequestRatio:(float)a3
{
  self->_voiceTriggerRequestRatio = a3;
}

- (float)voiceTriggerIntendedRatio
{
  return self->_voiceTriggerIntendedRatio;
}

- (void)setVoiceTriggerIntendedRatio:(float)a3
{
  self->_voiceTriggerIntendedRatio = a3;
}

- (float)buttonPressRequestRatio
{
  return self->_buttonPressRequestRatio;
}

- (void)setButtonPressRequestRatio:(float)a3
{
  self->_buttonPressRequestRatio = a3;
}

- (float)buttonPressIntendedRatio
{
  return self->_buttonPressIntendedRatio;
}

- (void)setButtonPressIntendedRatio:(float)a3
{
  self->_buttonPressIntendedRatio = a3;
}

- (float)sdsdRetryCount
{
  return self->_sdsdRetryCount;
}

- (void)setSdsdRetryCount:(float)a3
{
  self->_sdsdRetryCount = a3;
}

@end

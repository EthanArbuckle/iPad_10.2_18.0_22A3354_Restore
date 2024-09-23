@implementation SCLSchedulingParameters

- (id)copyWithZone:(_NSZone *)a3
{
  SCLSchedulingParameters *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(SCLSchedulingParameters);
  -[SCLSchedulingParameters calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchedulingParameters setCalendar:](v4, "setCalendar:", v5);

  -[SCLSchedulingParameters evaluationDate](self, "evaluationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchedulingParameters setEvaluationDate:](v4, "setEvaluationDate:", v6);

  -[SCLSchedulingParameters scheduleSettings](self, "scheduleSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchedulingParameters setScheduleSettings:](v4, "setScheduleSettings:", v7);

  -[SCLSchedulingParameters setActivationSetting:](v4, "setActivationSetting:", -[SCLSchedulingParameters activationSetting](self, "activationSetting"));
  -[SCLSchedulingParameters setSuppressed:](v4, "setSuppressed:", -[SCLSchedulingParameters isSuppressed](self, "isSuppressed"));
  return v4;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)evaluationDate
{
  return self->_evaluationDate;
}

- (void)setEvaluationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SCLScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void)setSuppressed:(BOOL)a3
{
  self->_suppressed = a3;
}

- (unint64_t)activationSetting
{
  return self->_activationSetting;
}

- (void)setActivationSetting:(unint64_t)a3
{
  self->_activationSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
  objc_storeStrong((id *)&self->_evaluationDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end

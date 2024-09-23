@implementation SCLSettingsViewModel

- (SCLSettingsViewModel)init
{
  SCLSettingsViewModel *v2;
  SCLSettingsViewModel *v3;
  NSArray *historyItems;
  NSArray *v5;
  NSArray *timeIntervals;
  uint64_t v7;
  SCLRecurrenceSchedule *customSchedule;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCLSettingsViewModel;
  v2 = -[SCLSettingsViewModel init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    historyItems = v2->_historyItems;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_historyItems = (NSArray *)MEMORY[0x24BDBD1A8];

    timeIntervals = v3->_timeIntervals;
    v3->_timeIntervals = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE841D8]), "initWithRecurrences:", v5);
    customSchedule = v3->_customSchedule;
    v3->_customSchedule = (SCLRecurrenceSchedule *)v7;

  }
  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (void)setScheduleType:(unint64_t)a3
{
  self->_scheduleType = a3;
}

- (int64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (void)setRepeatSchedule:(int64_t)a3
{
  self->_repeatSchedule = a3;
}

- (NSArray)timeIntervals
{
  return self->_timeIntervals;
}

- (void)setTimeIntervals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SCLRecurrenceSchedule)customSchedule
{
  return self->_customSchedule;
}

- (void)setCustomSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)historyItems
{
  return self->_historyItems;
}

- (void)setHistoryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyItems, 0);
  objc_storeStrong((id *)&self->_customSchedule, 0);
  objc_storeStrong((id *)&self->_timeIntervals, 0);
}

@end

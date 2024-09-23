@implementation STBlueprintUsageLimitScheduleRepresentation

- (STBlueprintUsageLimitScheduleSimpleItem)simpleSchedule
{
  return self->_simpleSchedule;
}

- (void)setSimpleSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_simpleSchedule, a3);
}

- (NSArray)customScheduleItems
{
  return self->_customScheduleItems;
}

- (void)setCustomScheduleItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customScheduleItems, 0);
  objc_storeStrong((id *)&self->_simpleSchedule, 0);
}

@end

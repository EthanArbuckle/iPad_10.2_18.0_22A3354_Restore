@implementation STBlueprintScheduleRepresentation

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[STBlueprintScheduleSimpleItem copyWithZone:](self->_simpleSchedule, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSArray copyWithZone:](self->_customScheduleItems, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (STBlueprintScheduleSimpleItem)simpleSchedule
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

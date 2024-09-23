@implementation STBlueprintScheduleCustomDayItem

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDateComponents copyWithZone:](self->_startTime, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDateComponents copyWithZone:](self->_endTime, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[3] = self->_day;
  return v5;
}

- (NSDateComponents)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDateComponents)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (unint64_t)day
{
  return self->_day;
}

- (void)setDay:(unint64_t)a3
{
  self->_day = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end

@implementation _REPeriodOfDay

- (_REPeriodOfDay)initWithInterval:(id)a3 periodOfDay:(unint64_t)a4
{
  id v6;
  _REPeriodOfDay *v7;
  uint64_t v8;
  NSDateInterval *interval;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_REPeriodOfDay;
  v7 = -[_REPeriodOfDay init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    interval = v7->_interval;
    v7->_interval = (NSDateInterval *)v8;

    v7->_periodOfDay = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_periodOfDay ^ -[NSDateInterval hash](self->_interval, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  NSDateInterval *interval;
  NSDateInterval *v7;
  NSDateInterval *v8;
  NSDateInterval *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    interval = self->_interval;
    v7 = (NSDateInterval *)v5[2];
    if (interval == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = interval;
      v10 = -[NSDateInterval isEqual:](v9, "isEqual:", v8);

      if (!v10)
      {
        v11 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v11 = self->_periodOfDay == (_QWORD)v5[1];
    goto LABEL_8;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (NSDate)startDate
{
  return -[NSDateInterval startDate](self->_interval, "startDate");
}

- (NSDate)endDate
{
  return -[NSDateInterval endDate](self->_interval, "endDate");
}

- (unint64_t)periodOfDay
{
  return self->_periodOfDay;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interval, 0);
}

@end

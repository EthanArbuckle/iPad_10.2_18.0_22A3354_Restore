@implementation _UIDatePickerChineseCalendar

+ (id)relatedFromCyclical:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend(a3, "year") != 0x7FFFFFFFFFFFFFFFLL || (v4 = a3, objc_msgSend(a3, "month") != 0x7FFFFFFFFFFFFFFFLL))
    v4 = (id)objc_msgSend(a3, "copy");
  if (objc_msgSend(a3, "year") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setEra:", 1);
    v5 = objc_msgSend(a3, "era");
    v6 = objc_msgSend(a3, "year") + 60 * v5;
    if (v6 == 112)
    {
LABEL_10:
      v9 = 1604;
    }
    else
    {
      v7 = 0;
      while (v7 != 11)
      {
        v8 = chineseLeapMonthExtendedYears[v7++ + 2];
        if (v8 == v6 - 61)
        {
          if (v7 < 0xC)
            goto LABEL_10;
          break;
        }
      }
      v9 = v6 - 2697;
    }
    objc_msgSend(v4, "setYear:", v9);
  }
  if (objc_msgSend(a3, "month") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setMonth:", 2 * objc_msgSend(a3, "month") - (objc_msgSend(a3, "isLeapMonth") ^ 1));
    objc_msgSend(v4, "setLeapMonth:", 0);
  }
  return v4;
}

+ (id)cyclicalFromRelated:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v6 = objc_msgSend(a3, "month");
  v7 = v6;
  v8 = v6 - 1;
  if (v6 < 1)
    v8 = v6;
  v9 = (v8 >> 1) + 1;
  v10 = objc_msgSend(a3, "year");
  if (v10 != 0x7FFFFFFFFFFFFFFFLL || (v11 = a3, v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = (id)objc_msgSend(a3, "copy");
    if (v7 == 0x7FFFFFFFFFFFFFFFLL && v10 == 1604)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIDatePickerChineseCalendar.m"), 82, CFSTR("Chinese calendar yearless date without month"));
    }
    else
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_12;
      if (v10 != 1604)
      {
        v12 = v10 + 2636;
        goto LABEL_11;
      }
    }
    v12 = chineseLeapMonthExtendedYears[v9];
LABEL_11:
    v13 = v12 % 60;
    objc_msgSend(v11, "setEra:", v12 / 60 + 1);
    objc_msgSend(v11, "setYear:", v13 + 1);
  }
LABEL_12:
  if (objc_msgSend(a3, "month") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v11, "setMonth:", v9);
    objc_msgSend(v11, "setLeapMonth:", (v7 & 1) == 0);
  }
  return v11;
}

- (_UIDatePickerChineseCalendar)initWithCalendar:(id)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerChineseCalendar;
  -[_UIDatePickerChineseCalendar initWithCalendarIdentifier:](&v6, sel_initWithCalendarIdentifier_, objc_msgSend(a3, "calendarIdentifier"));
  if (self)
    -[_UIDatePickerChineseCalendar setRealCalendar:](self, "setRealCalendar:", a3);
  return self;
}

- (id)dateFromComponents:(id)a3
{
  return -[NSCalendar dateFromComponents:](self->_realCalendar, "dateFromComponents:", objc_msgSend((id)objc_opt_class(), "cyclicalFromRelated:", a3));
}

- (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6
{
  NSDateComponents *v6;

  v6 = -[NSCalendar components:fromDate:toDate:options:](self->_realCalendar, "components:fromDate:toDate:options:", a3, a4, a5, a6);
  if (-[NSDateComponents year](v6, "year") != 0x7FFFFFFFFFFFFFFFLL
    && -[NSDateComponents era](v6, "era") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSDateComponents setYear:](v6, "setYear:", -[NSDateComponents year](v6, "year") + 60 * -[NSDateComponents era](v6, "era"));
    -[NSDateComponents setEra:](v6, "setEra:", 0);
  }
  return v6;
}

- (id)components:(unint64_t)a3 fromDate:(id)a4
{
  unint64_t v4;

  v4 = (a3 >> 1) & 2;
  if ((a3 & 8) != 0)
    v4 = 6;
  return (id)objc_msgSend((id)objc_opt_class(), "relatedFromCyclical:", -[NSCalendar components:fromDate:](self->_realCalendar, "components:fromDate:", v4 | a3, a4));
}

- (void)setTimeZone:(id)a3
{
  -[NSCalendar setTimeZone:](self->_realCalendar, "setTimeZone:", a3);
}

- (_NSRange)maximumRangeOfUnit:(unint64_t)a3
{
  NSCalendar *realCalendar;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  if (a3 == 2)
    goto LABEL_4;
  if (a3 != 8)
  {
    if (a3 != 4)
    {
      realCalendar = self->_realCalendar;
      goto LABEL_7;
    }
LABEL_4:
    realCalendar = (NSCalendar *)objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
LABEL_7:
    v5 = -[NSCalendar maximumRangeOfUnit:](realCalendar, "maximumRangeOfUnit:", a3);
    goto LABEL_8;
  }
  v5 = -[NSCalendar maximumRangeOfUnit:](self->_realCalendar, "maximumRangeOfUnit:", 8);
  v7 = 2 * v6;
LABEL_8:
  result.length = v7;
  result.location = v5;
  return result;
}

- (id)calendarIdentifier
{
  return -[NSCalendar calendarIdentifier](self->_realCalendar, "calendarIdentifier");
}

- (id)dateByAddingComponents:(id)a3 toDate:(id)a4 options:(unint64_t)a5
{
  return -[NSCalendar dateByAddingComponents:toDate:options:](self->_realCalendar, "dateByAddingComponents:toDate:options:", a3, a4, a5);
}

- (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5
{
  NSCalendar *realCalendar;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  _NSRange result;

  if (a3 == 4 && a4 == 2)
  {
    realCalendar = (NSCalendar *)objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    a3 = 4;
    a4 = 2;
LABEL_7:
    v7 = -[NSCalendar rangeOfUnit:inUnit:forDate:](realCalendar, "rangeOfUnit:inUnit:forDate:", a3, a4, a5);
    goto LABEL_8;
  }
  realCalendar = self->_realCalendar;
  if (a3 != 8 || a4 != 4)
    goto LABEL_7;
  v7 = -[NSCalendar rangeOfUnit:inUnit:forDate:](realCalendar, "rangeOfUnit:inUnit:forDate:", 8, 4, a5);
  v9 = 2 * v8;
LABEL_8:
  result.length = v9;
  result.location = v7;
  return result;
}

- (NSCalendar)realCalendar
{
  return self->_realCalendar;
}

- (void)setRealCalendar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end

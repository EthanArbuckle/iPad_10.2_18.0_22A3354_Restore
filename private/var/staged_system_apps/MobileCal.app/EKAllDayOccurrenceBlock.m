@implementation EKAllDayOccurrenceBlock

- (EKAllDayOccurrenceBlock)initWithEventIndex:(unint64_t)a3 calendarOrder:(unint64_t)a4 dayRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  EKAllDayOccurrenceBlock *result;
  objc_super v10;

  length = a5.length;
  location = a5.location;
  v10.receiver = self;
  v10.super_class = (Class)EKAllDayOccurrenceBlock;
  result = -[EKAllDayOccurrenceBlock init](&v10, "init");
  if (result)
  {
    result->_eventIndex = a3;
    result->_dayRange.location = location;
    result->_dayRange.length = length;
    result->_calendarOrder = a4;
  }
  return result;
}

- (id)lengthForSorting
{
  return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[EKAllDayOccurrenceBlock length](self, "length"));
}

- (unint64_t)length
{
  return self->_dayRange.length;
}

- (unint64_t)rangeStart
{
  return self->_dayRange.location;
}

- (unint64_t)rangeEnd
{
  return self->_dayRange.location + self->_dayRange.length - 1;
}

- (unint64_t)gapBetweenBlock:(id)a3
{
  EKAllDayOccurrenceBlock *v4;
  unint64_t v5;
  EKAllDayOccurrenceBlock *v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;

  v4 = (EKAllDayOccurrenceBlock *)a3;
  v5 = -[EKAllDayOccurrenceBlock rangeStart](self, "rangeStart");
  if (v5 <= -[EKAllDayOccurrenceBlock rangeEnd](v4, "rangeEnd"))
  {
    v7 = -[EKAllDayOccurrenceBlock rangeStart](v4, "rangeStart");
    v8 = -[EKAllDayOccurrenceBlock rangeEnd](self, "rangeEnd");
    v6 = v4;
    if (v7 <= v8)
    {
      v10 = -1;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = self;
    self = v4;
  }
  v9 = -[EKAllDayOccurrenceBlock rangeStart](v6, "rangeStart");
  v10 = v9 - (_BYTE *)-[EKAllDayOccurrenceBlock rangeEnd](self, "rangeEnd");
LABEL_6:

  return v10;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKAllDayOccurrenceBlock occurrenceView](self, "occurrenceView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "occurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; [%@] eventIndex = %ld; rangeStart= %lu; rangeEnd = %lu; calendarOrder = %lu>"),
                   v3,
                   self,
                   v6,
                   -[EKAllDayOccurrenceBlock eventIndex](self, "eventIndex"),
                   -[EKAllDayOccurrenceBlock rangeStart](self, "rangeStart"),
                   -[EKAllDayOccurrenceBlock rangeEnd](self, "rangeEnd"),
                   -[EKAllDayOccurrenceBlock calendarOrder](self, "calendarOrder")));

  return v7;
}

- (unint64_t)eventIndex
{
  return self->_eventIndex;
}

- (unint64_t)calendarOrder
{
  return self->_calendarOrder;
}

- (EKDayOccurrenceView)occurrenceView
{
  return self->_occurrenceView;
}

- (void)setOccurrenceView:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceView, 0);
}

@end

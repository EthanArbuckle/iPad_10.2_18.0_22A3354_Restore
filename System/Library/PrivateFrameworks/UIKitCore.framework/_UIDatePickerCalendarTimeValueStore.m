@implementation _UIDatePickerCalendarTimeValueStore

- (_UIDatePickerCalendarTimeValueStore)initWithTimeFormat:(id)a3
{
  return -[_UIDatePickerCalendarTimeValueStore initWithTimeFormat:minuteInterval:decrementBehaviour:](self, "initWithTimeFormat:minuteInterval:decrementBehaviour:", a3, 1, 0);
}

- (_UIDatePickerCalendarTimeValueStore)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4 decrementBehaviour:(int64_t)a5
{
  id v9;
  _UIDatePickerCalendarTimeValueStore *v10;
  int64_t v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIDatePickerCalendarTimeValueStore;
  v10 = -[_UIDatePickerCalendarTimeValueStore init](&v13, sel_init);
  if (v10)
  {
    v10->_inputBuffer = (unint64_t *)malloc_type_calloc(8uLL, 4uLL, 0x164AA4E6uLL);
    objc_storeStrong((id *)&v10->_timeFormat, a3);
    if (a4 <= 1)
      v11 = 1;
    else
      v11 = a4;
    v10->_minuteInterval = v11;
    v10->_decrementBehaviour = a5;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_inputBuffer);
  self->_inputBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerCalendarTimeValueStore;
  -[_UIDatePickerCalendarTimeValueStore dealloc](&v3, sel_dealloc);
}

- (void)setMinuteInterval:(int64_t)a3
{
  int64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_minuteInterval = v3;
}

- (void)_verifyInputWithScope:(int64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = -[_UIDatePickerCalendarTimeValueStore hourValue](self, "hourValue");
  v6 = -[_UIDatePickerCalendarTimeValueStore minuteValue](self, "minuteValue");
  -[_UIDatePickerCalendarTimeValueStore timeFormat](self, "timeFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clockLayout");

  if (!v8 && v5 > 0x18
    || (-[_UIDatePickerCalendarTimeValueStore timeFormat](self, "timeFormat"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "clockLayout"),
        v9,
        v10)
    && v5 >= 0xD)
  {
    *-[_UIDatePickerCalendarTimeValueStore inputBuffer](self, "inputBuffer") = 0;
  }
  if (v6 >= 0x3C && (a3 == 3 || v6 % 0xA >= 6))
    -[_UIDatePickerCalendarTimeValueStore inputBuffer](self, "inputBuffer")[16] = 0;
}

- (void)__setIntegerInBuffer:(unint64_t)a3 range:(_NSRange)a4
{
  NSUInteger v4;
  NSUInteger location;
  unint64_t v7;

  v4 = a4.location + a4.length;
  if (a4.location + a4.length > a4.location)
  {
    location = a4.location;
    do
    {
      v7 = a3 / 0xA;
      *(-[_UIDatePickerCalendarTimeValueStore inputBuffer](self, "inputBuffer") + 8 * v4 - 8) = a3 % 0xA;
      a3 = v7;
      --v4;
    }
    while (v4 > location);
  }
}

- (unint64_t)__integerInBufferWithRange:(_NSRange)a3
{
  NSUInteger length;
  unint64_t v5;
  NSUInteger v6;

  if (a3.location >= a3.location + a3.length)
    return 0;
  length = a3.length;
  v5 = 0;
  v6 = 8 * a3.location;
  do
  {
    v5 = -[_UIDatePickerCalendarTimeValueStore inputBuffer](self, "inputBuffer")[v6] + 10 * v5;
    v6 += 8;
    --length;
  }
  while (length);
  return v5;
}

- (void)_setDigits:(unint64_t)a3 count:(unint64_t)a4 inRange:(_NSRange)a5 append:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;

  length = a5.length;
  location = a5.location;
  v8 = a3;
  if (a6)
  {
    v10 = a4;
    if (a4)
    {
      v11 = -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", a5.location, a5.length);
    }
    else
    {
      v12 = a3;
      do
      {
        ++v10;
        v13 = v12 > 9;
        v12 /= 0xAuLL;
      }
      while (v13);
      v11 = -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", a5.location, a5.length);
      if (!v10)
        goto LABEL_8;
    }
    do
    {
      v11 *= 10;
      --v10;
    }
    while (v10);
LABEL_8:
    v8 += v11;
  }
  -[_UIDatePickerCalendarTimeValueStore __setIntegerInBuffer:range:](self, "__setIntegerInBuffer:range:", v8, location, length);
}

- (void)_removeLastDigitInRange:(_NSRange)a3
{
  -[_UIDatePickerCalendarTimeValueStore __setIntegerInBuffer:range:](self, "__setIntegerInBuffer:range:", -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:") / 0xA, a3.location, a3.length);
}

- (void)setDigits:(unint64_t)a3 count:(unint64_t)a4 inScope:(int64_t)a5 append:(BOOL)a6
{
  _BOOL8 v6;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a6;
  v9 = a5 - 2;
  if ((unint64_t)(a5 - 2) > 2)
  {
    v10 = 0;
    v11 = 4;
  }
  else
  {
    v10 = qword_1866857E0[v9];
    v11 = qword_1866857F8[v9];
  }
  -[_UIDatePickerCalendarTimeValueStore _setDigits:count:inRange:append:](self, "_setDigits:count:inRange:append:", a3, a4, v10, v11, v6);
  -[_UIDatePickerCalendarTimeValueStore _verifyInputWithScope:](self, "_verifyInputWithScope:", a5);
}

- (unint64_t)digitsInScope:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3 - 2;
  if ((unint64_t)(a3 - 2) > 2)
  {
    v4 = 0;
    v5 = 4;
  }
  else
  {
    v4 = qword_1866857E0[v3];
    v5 = qword_1866857F8[v3];
  }
  return -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", v4, v5);
}

- (void)removeLastDigitInScope:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3 - 2;
  if ((unint64_t)(a3 - 2) > 2)
  {
    v4 = 0;
    v5 = 4;
  }
  else
  {
    v4 = qword_1866857E0[v3];
    v5 = qword_1866857F8[v3];
  }
  -[_UIDatePickerCalendarTimeValueStore _removeLastDigitInRange:](self, "_removeLastDigitInRange:", v4, v5);
}

- (unint64_t)hourValue
{
  return -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", 0, 2);
}

- (void)setHourValue:(unint64_t)a3
{
  -[_UIDatePickerCalendarTimeValueStore __setIntegerInBuffer:range:](self, "__setIntegerInBuffer:range:", a3, 0, 2);
}

- (unint64_t)minuteValue
{
  return -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", 2, 2);
}

- (void)setMinuteValue:(unint64_t)a3
{
  -[_UIDatePickerCalendarTimeValueStore __setIntegerInBuffer:range:](self, "__setIntegerInBuffer:range:", a3, 2, 2);
}

- (BOOL)roundToMinuteInterval
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;

  v3 = -[_UIDatePickerCalendarTimeValueStore minuteValue](self, "minuteValue");
  v4 = (double)-[_UIDatePickerCalendarTimeValueStore minuteInterval](self, "minuteInterval");
  v5 = floor((double)v3 / v4) * v4;
  v6 = (uint64_t)v5;
  if (v3 != (uint64_t)v5)
    -[_UIDatePickerCalendarTimeValueStore setMinuteValue:](self, "setMinuteValue:", (uint64_t)v5);
  return v3 != v6;
}

- (void)incrementDigitForScope:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t minuteInterval;
  uint64_t v10;
  uint64_t v11;
  id v12;

  switch(a3)
  {
    case 4:
      -[_UIDatePickerCalendarTimeValueStore setIsPM:](self, "setIsPM:", -[_UIDatePickerCalendarTimeValueStore isPM](self, "isPM") ^ 1);
      break;
    case 3:
      v8 = -[_UIDatePickerCalendarTimeValueStore minuteValue](self, "minuteValue");
      minuteInterval = self->_minuteInterval;
      v10 = 59;
      if ((uint64_t)(minuteInterval + v8) < 0 == __OFADD__(minuteInterval, v8))
        v10 = minuteInterval + v8;
      if ((uint64_t)(minuteInterval + v8) <= 59)
        v11 = v10;
      else
        v11 = 0;
      -[_UIDatePickerCalendarTimeValueStore setMinuteValue:](self, "setMinuteValue:", (uint64_t)(floor((double)v11 / (double)minuteInterval) * (double)minuteInterval));
      break;
    case 2:
      v4 = -[_UIDatePickerCalendarTimeValueStore hourValue](self, "hourValue");
      -[_UIDatePickerCalendarTimeValueStore timeFormat](self, "timeFormat");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v12, "clock");
      if (v4 >= qword_186685830[v5])
        v6 = v4 + 1;
      else
        v6 = qword_186685890[v5];
      if (v4 <= qword_186685810[v5])
        v7 = v6;
      else
        v7 = qword_1866858B0[v5];
      -[_UIDatePickerCalendarTimeValueStore setHourValue:](self, "setHourValue:", (uint64_t)(double)v7);

      break;
  }
}

- (void)decrementDigitForScope:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t minuteInterval;
  BOOL v10;
  int64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  switch(a3)
  {
    case 4:
      -[_UIDatePickerCalendarTimeValueStore setIsPM:](self, "setIsPM:", -[_UIDatePickerCalendarTimeValueStore isPM](self, "isPM") ^ 1);
      break;
    case 3:
      v8 = -[_UIDatePickerCalendarTimeValueStore minuteValue](self, "minuteValue");
      minuteInterval = self->_minuteInterval;
      if (v8 % minuteInterval)
        v10 = self->_decrementBehaviour == 0;
      else
        v10 = 0;
      if (v10)
        v11 = 0;
      else
        v11 = self->_minuteInterval;
      v12 = __OFSUB__(v8, v11);
      v13 = v8 - v11;
      v14 = 59;
      if (v13 < 0 == v12)
        v14 = v13;
      if (v13 <= 59)
        v15 = v14;
      else
        v15 = 0;
      -[_UIDatePickerCalendarTimeValueStore setMinuteValue:](self, "setMinuteValue:", (uint64_t)(floor((double)v15 / (double)minuteInterval) * (double)minuteInterval));
      break;
    case 2:
      v4 = -[_UIDatePickerCalendarTimeValueStore hourValue](self, "hourValue");
      -[_UIDatePickerCalendarTimeValueStore timeFormat](self, "timeFormat");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v16, "clock");
      if (v4 >= qword_186685870[v5])
        v6 = v4 - 1;
      else
        v6 = qword_186685890[v5];
      if (v4 <= qword_186685850[v5])
        v7 = v6;
      else
        v7 = qword_1866858B0[v5];
      -[_UIDatePickerCalendarTimeValueStore setHourValue:](self, "setHourValue:", (uint64_t)(double)v7);

      break;
  }
}

- (BOOL)isPM
{
  return self->_isPM;
}

- (void)setIsPM:(BOOL)a3
{
  self->_isPM = a3;
}

- (int64_t)minuteInterval
{
  return self->_minuteInterval;
}

- (int64_t)decrementBehaviour
{
  return self->_decrementBehaviour;
}

- (void)setDecrementBehaviour:(int64_t)a3
{
  self->_decrementBehaviour = a3;
}

- (unint64_t)inputBuffer
{
  return self->_inputBuffer;
}

- (_UIDatePickerCalendarTimeFormat)timeFormat
{
  return self->_timeFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFormat, 0);
}

@end

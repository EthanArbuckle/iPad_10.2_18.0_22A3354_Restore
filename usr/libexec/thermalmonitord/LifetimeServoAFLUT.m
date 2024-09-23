@implementation LifetimeServoAFLUT

- (LifetimeServoAFLUT)initWithAFTableColumns:(id)a3
{
  LifetimeServoAFLUT *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t columnCount;
  uint64_t v12;
  id *v13;
  int v14;
  NSObject *v15;
  uint8_t v17;
  char v18[15];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)LifetimeServoAFLUT;
  v4 = -[LifetimeServoAFLUT init](&v19, "init");
  if (v4)
  {
    v5 = objc_msgSend(a3, "count");
    v4->_columnCount = v5;
    if (v5 <= 26)
    {
      if (v5 >= 1)
      {
        v9 = 0;
        do
        {
          v10 = objc_msgSend(a3, "objectAtIndex:", v9);
          v4->_afLUTColumns[v9++] = -[LifetimeServoAFLUTColumn initWithLUTColumn:voltage:]([LifetimeServoAFLUTColumn alloc], "initWithLUTColumn:voltage:", objc_msgSend(v10, "objectForKey:", CFSTR("afColumn")), objc_msgSend(objc_msgSend(v10, "objectForKey:", CFSTR("voltage")), "intValue"));
          columnCount = v4->_columnCount;
        }
        while (v9 < columnCount);
        if ((int)columnCount >= 2)
        {
          v12 = 0;
          do
          {
            v13 = (id *)(&v4->super.isa + v12);
            v14 = objc_msgSend(v13[3], "voltage");
            if (v14 >= (int)objc_msgSend(v13[4], "voltage"))
            {
              v15 = qword_1000A28A0;
              if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                sub_100050ADC(&v17, v18, v15);
            }
            ++v12;
          }
          while (v12 < v4->_columnCount - 1);
        }
      }
      v4->_minVoltage = -[LifetimeServoAFLUTColumn voltage](v4->_afLUTColumns[0], "voltage");
      v4->_maxVoltage = -[LifetimeServoAFLUTColumn voltage](v4->_afLUTColumns[v4->_columnCount - 1], "voltage");
    }
    else
    {
      v6 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100050AA4(v6, v7, v8);
      return 0;
    }
  }
  return v4;
}

- (float)accelerationFactor:(int)a3 voltage:(int)a4
{
  uint64_t v4;
  int minVoltage;
  LifetimeServoAFLUTColumn **afLUTColumns;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  LifetimeServoAFLUTColumn **v12;
  unsigned int v13;
  unsigned int v14;
  float v15;
  float v16;
  float v17;
  float v18;

  v4 = *(_QWORD *)&a3;
  minVoltage = self->_minVoltage;
  if (minVoltage <= a4)
  {
    if (self->_maxVoltage >= a4)
      minVoltage = a4;
    else
      minVoltage = self->_maxVoltage;
  }
  afLUTColumns = self->_afLUTColumns;
  if (self->_columnCount < 2)
  {
    v11 = 1;
  }
  else
  {
    v8 = 4;
    while (minVoltage > (int)objc_msgSend(*((id *)&self->super.isa + v8), "voltage"))
    {
      v9 = v8 + 1;
      v10 = v8 - 2;
      ++v8;
      if (v10 >= self->_columnCount)
      {
        v11 = v9 - 3;
        goto LABEL_12;
      }
    }
    v11 = v8 - 3;
  }
LABEL_12:
  v12 = &afLUTColumns[v11];
  v13 = -[LifetimeServoAFLUTColumn voltage](*(v12 - 1), "voltage");
  v14 = -[LifetimeServoAFLUTColumn voltage](afLUTColumns[v11], "voltage");
  -[LifetimeServoAFLUTColumn accelerationFactor:](*(v12 - 1), "accelerationFactor:", v4);
  v16 = v15;
  -[LifetimeServoAFLUTColumn accelerationFactor:](afLUTColumns[v11], "accelerationFactor:", v4);
  v18 = 0.0;
  if (v14 != v13)
    return (float)((float)(v16 * (float)(int)(v14 - minVoltage)) + (float)(v17 * (float)(int)(minVoltage - v13)))
         / (float)(int)(v14 - v13);
  return v18;
}

@end

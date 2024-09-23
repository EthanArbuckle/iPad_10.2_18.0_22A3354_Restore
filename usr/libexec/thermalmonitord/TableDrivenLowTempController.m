@implementation TableDrivenLowTempController

- (TableDrivenLowTempController)initWithParams:(id)a3
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  int temperatureThresholdCount;
  int chargeThresholdCount;
  id v12;
  int v13;
  NSObject *v14;
  int batteryRaThresholdCount;
  int v16;
  int v17;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;

  *(_QWORD *)&self->_tempThresholdHysteresis = 0xFFFFFFFF00000000;
  sub_1000048B0((CFDictionaryRef)a3, CFSTR("tempLimitHysteresis"), kCFNumberIntType, &self->_tempThresholdHysteresis);
  v5 = objc_msgSend(a3, "valueForKey:", CFSTR("tempLimits"));
  v6 = objc_msgSend(a3, "valueForKey:", CFSTR("chargeLimits"));
  if (v5)
  {
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v5, "count");
      self->_temperatureThresholdCount = v8;
      if (v8 >= 16)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_1000524A8();
        self->_temperatureThresholdCount = 0;
      }
      v9 = objc_msgSend(v7, "count");
      self->_chargeThresholdCount = v9;
      if (v9 >= 19)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100052440();
        self->_chargeThresholdCount = 0;
      }
    }
  }
  temperatureThresholdCount = self->_temperatureThresholdCount;
  if (temperatureThresholdCount >= 1)
  {
    chargeThresholdCount = self->_chargeThresholdCount;
    if (chargeThresholdCount >= 1)
    {
      self->_responseTableCellCount = temperatureThresholdCount
                                    + 1
                                    + (temperatureThresholdCount + 1) * chargeThresholdCount;
      -[TableDrivenLowTempController populateIntArray:params:key:expectedCount:assertArraySorting:](self, "populateIntArray:params:key:expectedCount:assertArraySorting:", self->_temperatureThresholds, a3, CFSTR("tempLimits"));
      -[TableDrivenLowTempController populateIntArray:params:key:expectedCount:assertArraySorting:](self, "populateIntArray:params:key:expectedCount:assertArraySorting:", self->_chargeThresholds, a3, CFSTR("chargeLimits"), self->_chargeThresholdCount, 1);
      -[TableDrivenLowTempController populateTableValues:expectedCount:assertArraySorting:](self, "populateTableValues:expectedCount:assertArraySorting:", a3, self->_responseTableCellCount, 0);
    }
  }
  v12 = objc_msgSend(a3, "valueForKey:", CFSTR("RaLimits"));
  if (v12)
  {
    v13 = objc_msgSend(v12, "count");
    self->_batteryRaThresholdCount = v13;
    if (v13 < 7)
    {
      if (v13 >= 1)
      {
        -[TableDrivenLowTempController populateIntArray:params:key:expectedCount:assertArraySorting:](self, "populateIntArray:params:key:expectedCount:assertArraySorting:", self->_batteryRaThresholds, a3, CFSTR("RaLimits"), v13, 1);
        if (byte_1000A2480)
        {
          v14 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            batteryRaThresholdCount = self->_batteryRaThresholdCount;
            v16 = self->_batteryRaThresholds[0];
            v17 = self->_batteryRaThresholds[1];
            v19[0] = 67109632;
            v19[1] = batteryRaThresholdCount;
            v20 = 1024;
            v21 = v16;
            v22 = 1024;
            v23 = v17;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> Clamp: Ra thresholds (%d) %d %d", (uint8_t *)v19, 0x14u);
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000523D8();
      self->_batteryRaThresholdCount = 0;
    }
  }
  return self;
}

- (BOOL)populateIntArray:(int *)a3 params:(id)a4 key:(id)a5 expectedCount:(unint64_t)a6 assertArraySorting:(BOOL)a7
{
  _BOOL4 v7;
  int *v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  id v15;
  signed int v16;
  BOOL v17;

  if (!a3 || !a4 || !a5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052510();
    return 0;
  }
  v7 = a7;
  v9 = a3;
  v10 = objc_msgSend(a4, "valueForKey:", a5);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005253C();
    return 0;
  }
  v11 = v10;
  if (objc_msgSend(v10, "count") != (id)a6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100052594();
    return 0;
  }
  if (!a6)
    return 1;
  v12 = 0;
  v13 = 0;
  v14 = -32768;
  while (1)
  {
    v15 = objc_msgSend(v11, "objectAtIndex:", v13);
    if (v15)
      break;
LABEL_12:
    v12 = ++v13 >= a6;
    if (a6 == v13)
      return 1;
  }
  v16 = objc_msgSend(v15, "intValue");
  if (!v7 || (v17 = v16 <= v14, v14 = v16, !v17))
  {
    *v9++ = v16;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100052568();
  return v12;
}

- (BOOL)populateTableValues:(id)a3 expectedCount:(unint64_t)a4 assertArraySorting:(BOOL)a5
{
  return -[TableDrivenLowTempController populateIntArray:params:key:expectedCount:assertArraySorting:](self, "populateIntArray:params:key:expectedCount:assertArraySorting:", self->_tableValues, a3, CFSTR("tableValues"), a4, a5);
}

- (int)mitigationIndexForBatteryTemperature:(int)a3 stateOfCharge:(int)a4 batteryRaValue:(int)a5
{
  uint64_t temperatureThresholdCount;
  uint64_t v6;
  int v7;
  uint64_t batteryRaThresholdCount;
  uint64_t v9;
  int v10;
  uint64_t chargeThresholdCount;
  uint64_t v12;

  temperatureThresholdCount = self->_temperatureThresholdCount;
  if ((int)temperatureThresholdCount <= 0)
  {
LABEL_7:
    LODWORD(v6) = self->_temperatureThresholdCount;
  }
  else
  {
    v6 = 0;
    while (1)
    {
      v7 = self->_temperatureThresholds[v6];
      if (v6 >= self->_temperatureRow)
        v7 += self->_tempThresholdHysteresis;
      if (v7 > a3)
        break;
      if (temperatureThresholdCount == ++v6)
        goto LABEL_7;
    }
  }
  batteryRaThresholdCount = self->_batteryRaThresholdCount;
  if ((int)batteryRaThresholdCount < 1)
  {
    LODWORD(v9) = 0;
  }
  else
  {
    v9 = 0;
    while (self->_batteryRaThresholds[v9] <= a5)
    {
      if (batteryRaThresholdCount == ++v9)
      {
        LODWORD(v9) = self->_batteryRaThresholdCount;
        break;
      }
    }
  }
  v10 = (v6 - v9) & ~(((int)v6 - (int)v9) >> 31);
  if (v10 < (int)temperatureThresholdCount)
    LODWORD(temperatureThresholdCount) = v10;
  self->_temperatureRow = temperatureThresholdCount;
  chargeThresholdCount = self->_chargeThresholdCount;
  if ((int)chargeThresholdCount <= 0)
  {
LABEL_20:
    LODWORD(v12) = self->_chargeThresholdCount;
  }
  else
  {
    v12 = 0;
    while (self->_chargeThresholds[v12] <= a4)
    {
      if (chargeThresholdCount == ++v12)
        goto LABEL_20;
    }
  }
  return v12 + temperatureThresholdCount + temperatureThresholdCount * chargeThresholdCount;
}

- (int)outputForBatteryTemperature:(int)a3 stateOfCharge:(int)a4 batteryRaValue:(int)a5
{
  return self->_tableValues[-[TableDrivenLowTempController mitigationIndexForBatteryTemperature:stateOfCharge:batteryRaValue:](self, "mitigationIndexForBatteryTemperature:stateOfCharge:batteryRaValue:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5)];
}

@end

@implementation MaxLoadIndexTableSectionPiecewiseLinear

- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MaxLoadIndexTableSectionPiecewiseLinear;
  return -[MaxLoadIndexTableSection getReleaseMaxLI:releaseRate:](&v5, "getReleaseMaxLI:releaseRate:", a3, *(_QWORD *)&a4);
}

- (unint64_t)getMaxLI:(unint64_t)a3
{
  unint64_t v4;
  MaxLoadIndexTableSectionPiecewiseLinear *v5;
  unint64_t v6;
  unint64_t result;

  if (a3)
  {
    v4 = self->_pointCount - 1;
    v5 = self;
    while (v4)
    {
      v6 = v5->_controlEfforts[1];
      v5 = (MaxLoadIndexTableSectionPiecewiseLinear *)((char *)v5 + 8);
      --v4;
      if (v6 >= a3)
      {
        result = (v5->_controlEfforts[11] * (v6 - a3) + (a3 - v5->super._releaseRate) * v5->_maxLIs[0])
               / (v6 - v5->super._releaseRate);
        goto LABEL_10;
      }
    }
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100056298();
    result = -1;
  }
  else
  {
    result = self->_unconstrainedMaxLI;
  }
LABEL_10:
  self->super._maxLI = result;
  return result;
}

- (MaxLoadIndexTableSectionPiecewiseLinear)initWithDecisionTreeSectionControlEfforts:(id)a3 maxLIs:(id)a4 unconstrainedMaxLI:(unint64_t)a5
{
  MaxLoadIndexTableSectionPiecewiseLinear *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *controlEfforts;
  id v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v18;
  unint64_t pointCount;
  uint8_t buf[16];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MaxLoadIndexTableSectionPiecewiseLinear;
  v8 = -[MaxLoadIndexTableSection init](&v22, "init");
  if (v8)
  {
    v9 = objc_msgSend(a3, "count");
    if (v9 == objc_msgSend(a4, "count"))
    {
      if (v9)
      {
        if ((unint64_t)v9 < 0xD)
        {
          v10 = 0;
          v11 = 0;
          v12 = 0;
          v8->_unconstrainedMaxLI = a5;
          v8->_pointCount = (unint64_t)v9;
          do
          {
            controlEfforts = v8->_controlEfforts;
            v8->_controlEfforts[v10] = (unint64_t)objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v10), "unsignedIntegerValue");
            v14 = objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v10), "unsignedIntegerValue");
            v15 = (unint64_t)v14;
            v8->_maxLIs[v10] = (unint64_t)v14;
            v16 = v8->_controlEfforts[v10];
            if (v10)
            {
              if (v16 <= v12 || (unint64_t)v14 > v11)
              {
                v18 = qword_1000A28A0;
                if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "<Error> Piecewise DT table non-monotonic", buf, 2u);
                  v16 = controlEfforts[v10];
                  v15 = v8->_maxLIs[v10];
                }
              }
            }
            ++v10;
            pointCount = v8->_pointCount;
            v11 = v15;
            v12 = v16;
          }
          while (v10 < pointCount);
          if ((*controlEfforts || controlEfforts[pointCount - 1] != 255)
            && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_100056238();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_100056208();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_1000561D8();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100056268();
    }
  }
  return v8;
}

- (unint64_t)getControlEffortForMaxLI:(unint64_t)a3
{
  unint64_t v4;
  MaxLoadIndexTableSectionPiecewiseLinear *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  unint64_t releaseRate;
  unint64_t v15;
  int v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;

  if (self->_unconstrainedMaxLI <= a3)
    return 0;
  v4 = self->_pointCount - 1;
  v5 = self;
  while (v4)
  {
    v6 = v5->_maxLIs[1];
    v5 = (MaxLoadIndexTableSectionPiecewiseLinear *)((char *)v5 + 8);
    --v4;
    if (a3 >= v6)
    {
      v7 = v5->_controlEfforts[11];
      if (v7 == v6)
      {
        if (a3 == v6)
          v8 = v5->_controlEfforts[0];
        else
          v8 = 0;
      }
      else
      {
        v8 = (v5->_controlEfforts[0] * (v7 - a3) + v5->super._releaseRate * (a3 - v6)) / (v7 - v6);
      }
      if (byte_1000A2480)
      {
        v13 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          releaseRate = v5->super._releaseRate;
          v15 = v5->_controlEfforts[0];
          v17 = 134219264;
          v18 = v15;
          v19 = 2048;
          v20 = releaseRate;
          v21 = 2048;
          v22 = v6;
          v23 = 2048;
          v24 = v7;
          v25 = 2048;
          v26 = a3;
          v27 = 2048;
          v28 = v8;
          v10 = "<Notice> Seeding: CE+1 %lu CE %lu maxLI+1 %lu maxLI %lu maxLI %lu CE %lu";
          v11 = v13;
          v12 = 62;
          goto LABEL_17;
        }
      }
      return v8;
    }
  }
  v8 = *(&self->super._releaseRate + self->_pointCount);
  if (byte_1000A2480)
  {
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218240;
      v18 = a3;
      v19 = 2048;
      v20 = v8;
      v10 = "<Notice> Seeding: Piecewise reverse DT maxLI:%lu controlEffort:%lu";
      v11 = v9;
      v12 = 22;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
    }
  }
  return v8;
}

@end

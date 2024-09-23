@implementation SingleDaySummary

- (SingleDaySummary)init
{
  SingleDaySummary *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SingleDaySummary;
  v2 = -[SingleDaySummary init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SingleDaySummary setBackgroundColor:](v2, "setBackgroundColor:", v3);

  }
  return v2;
}

- (void)setData:(id)a3 date:(id)a4 calendar:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[SingleDaySummary setInputEventData:](self, "setInputEventData:", a3);
  -[SingleDaySummary setCalendar:](self, "setCalendar:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startOfDayForDate:", v12));

  -[SingleDaySummary setDate:](self, "setDate:", v13);
  -[SingleDaySummary setWeekDelegate:](self, "setWeekDelegate:", v10);

  -[SingleDaySummary _processEventData](self, "_processEventData");
  -[SingleDaySummary setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_processEventData
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  Block_layout *v29;
  double v30;
  void *v31;
  uint64_t j;
  void *v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v3 = objc_alloc((Class)CalPreferences);
  v34 = objc_msgSend(v3, "initWithDomain:", kPreferenceDomain);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary inputEventData](self, "inputEventData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v7)
    goto LABEL_13;
  v8 = v7;
  v9 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v38 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary date](self, "date"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary calendar](self, "calendar"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timeZone"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v12, v14));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendarDateForDay"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "date"));
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v19 = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendarDateForEndOfDay"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "date"));
      objc_msgSend(v21, "timeIntervalSinceReferenceDate");
      v23 = v22;

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
      objc_msgSend(v24, "timeIntervalSinceReferenceDate");
      if (v25 > v23)
      {

LABEL_10:
        objc_msgSend(v35, "addObject:", v11);
        goto LABEL_11;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endDate"));
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      v28 = v27;

      if (v28 < v19)
        goto LABEL_10;
LABEL_11:

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v8);
LABEL_13:

  objc_msgSend(v6, "removeObjectsInArray:", v35);
  if ((objc_msgSend(v34, "getBooleanPreference:defaultValue:", kCompactMonthSortSummaryWithTime, 1) & 1) != 0)
  {
    v29 = &stru_1001B49B8;
  }
  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000B6EF8;
    v36[3] = &unk_1001B49D8;
    v36[4] = 0x3FC5604180000000;
    v29 = (Block_layout *)v36;
  }
  objc_msgSend(v6, "sortUsingComparator:", v29);
  -[SingleDaySummary frame](self, "frame");
  if (v30 <= 0.01 || (unint64_t)objc_msgSend(v6, "count") < 0x13)
  {
    v31 = v6;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 18));
    for (j = 0; j != 18; ++j)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", j));
      objc_msgSend(v31, "addObject:", v33);

    }
  }
  -[SingleDaySummary setTotalEventUnits:](self, "setTotalEventUnits:", (double)(unint64_t)objc_msgSend(v31, "count"));
  -[SingleDaySummary setProcessedEventData:](self, "setProcessedEventData:", v31);

}

- (id)dataForEventID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventIdentifier"));
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGRect)frameForEventID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  __n128 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
  v6 = objc_msgSend(v5, "count");

  v7 = 0;
  if (v6)
  {
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v7));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventIdentifier"));
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if ((v11 & 1) != 0)
        break;
      ++v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
      v13 = objc_msgSend(v12, "count");

    }
    while (v7 < (unint64_t)v13);
  }
  -[SingleDaySummary _actualEventsWidth](self, "_actualEventsWidth");
  v15 = v14;
  -[SingleDaySummary frame](self, "frame");
  v17.n128_f64[0] = (v16 - v15) * 0.5;
  v18 = CalFloorToScreenScale(v17);
  -[SingleDaySummary frame](self, "frame");
  v20 = v19;
  -[SingleDaySummary totalEventUnits](self, "totalEventUnits");
  v22 = 1.0 / v21;
  v23 = -[SingleDaySummary _totalEventsWidth](self, "_totalEventsWidth");
  v25 = CalCeilToScreenScale(v23, v22 * v24);

  v26 = 0.0;
  v27 = v18 + (double)v7 * v25;
  v28 = v25;
  v29 = v20;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v26;
  result.origin.x = v27;
  return result;
}

- (unint64_t)backGroundCornerMaskforEventID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  char *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v7));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventIdentifier"));
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if (v11)
        break;

      ++v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
      v13 = (char *)objc_msgSend(v12, "count");

      if (v7 >= v13)
        goto LABEL_5;
    }
    if (v7)
      v15 = 0;
    else
      v15 = 5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
    v17 = (char *)objc_msgSend(v16, "count") - 1;

    if (v17 == v7)
      v14 = v15 | 0xA;
    else
      v14 = v15;

  }
  else
  {
LABEL_5:
    v14 = 0;
  }

  return v14;
}

- (double)_totalEventsWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  -[SingleDaySummary frame](self, "frame");
  v4 = v3;
  -[SingleDaySummary totalEventUnits](self, "totalEventUnits");
  v6 = 36.0;
  if (v5 * 6.0 < 36.0)
  {
    -[SingleDaySummary totalEventUnits](self, "totalEventUnits");
    v6 = 6.0;
    if (v7 >= 1.0)
    {
      -[SingleDaySummary totalEventUnits](self, "totalEventUnits");
      v6 = v8 * 6.0;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary weekDelegate](self, "weekDelegate"));
  objc_msgSend(v9, "monthWeekScale");
  v11 = v10;

  if (v11 <= 1.0)
    return v6;
  +[CompactMonthWeekView narrowScale](CompactMonthWeekView, "narrowScale");
  return v6 + (v4 * 0.9 - v6) * ((v11 + -1.0) / (v12 + -1.0));
}

- (double)_actualEventsWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __n128 v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
  v4 = (double)(unint64_t)objc_msgSend(v3, "count");
  -[SingleDaySummary _totalEventsWidth](self, "_totalEventsWidth");
  v6 = v5;
  -[SingleDaySummary totalEventUnits](self, "totalEventUnits");
  v8.n128_f64[0] = v6 / v7;
  v9 = CalFloorToScreenScale(v8) * v4;

  return v9;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  id v5;
  unsigned int v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __n128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  char *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  CGRect v39;
  CGRect v40;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary backgroundColor](self, "backgroundColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  objc_msgSend(v4, "setFill");

  -[SingleDaySummary bounds](self, "bounds");
  UIRectFill(v39);
  v5 = objc_alloc((Class)CalPreferences);
  v38 = objc_msgSend(v5, "initWithDomain:", kPreferenceDomain);
  v6 = objc_msgSend(v38, "getBooleanPreference:defaultValue:", kCompactMonthShowEventsSummaryDividers, 0);
  -[SingleDaySummary frame](self, "frame");
  if (v7 > 10.0)
  {
    -[SingleDaySummary frame](self, "frame");
    if (v8 >= 0.1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
      if (!objc_msgSend(v9, "count"))
      {
LABEL_14:

        goto LABEL_15;
      }
      -[SingleDaySummary totalEventUnits](self, "totalEventUnits");
      v11 = v10;

      if (v11 != 0.0)
      {
        -[SingleDaySummary _actualEventsWidth](self, "_actualEventsWidth");
        v13 = v12;
        -[SingleDaySummary frame](self, "frame");
        v15.n128_f64[0] = (v14 - v13) * 0.5;
        v16 = CalFloorToScreenScale(v15);
        -[SingleDaySummary frame](self, "frame");
        v18 = v17;
        -[SingleDaySummary totalEventUnits](self, "totalEventUnits");
        v20 = 1.0 / v19;
        v21 = -[SingleDaySummary _totalEventsWidth](self, "_totalEventsWidth");
        v23 = CalCeilToScreenScale(v21, v20 * v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v16, 0.0, v13, v18, v18 * 0.5));
        objc_msgSend(v9, "addClip");
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
        v25 = objc_msgSend(v24, "count");

        if (v25)
        {
          v26 = 0;
          do
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndex:", v26));

            if ((objc_msgSend(v28, "animating") & 1) == 0)
            {
              v29 = 0.0;
              if (v6)
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
                v31 = (char *)objc_msgSend(v30, "count");
                if (v26 < (unint64_t)(v31 - 1))
                  v29 = CalOnePixelInPoints(v31);

              }
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "color"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary traitCollection](self, "traitCollection"));
              v34 = CUIKSummaryColorForColor(v32, objc_msgSend(v33, "userInterfaceStyle"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

              objc_msgSend(v35, "setFill");
              v40.size.width = v23 - v29;
              v40.origin.y = 0.0;
              v40.origin.x = v16;
              v40.size.height = v18;
              UIRectFill(v40);

            }
            v16 = v23 + v16;

            ++v26;
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDaySummary processedEventData](self, "processedEventData"));
            v37 = objc_msgSend(v36, "count");

          }
          while (v26 < (unint64_t)v37);
        }
        goto LABEL_14;
      }
    }
  }
LABEL_15:

}

- (NSArray)processedEventData
{
  return self->_processedEventData;
}

- (void)setProcessedEventData:(id)a3
{
  objc_storeStrong((id *)&self->_processedEventData, a3);
}

- (NSArray)inputEventData
{
  return self->_inputEventData;
}

- (void)setInputEventData:(id)a3
{
  objc_storeStrong((id *)&self->_inputEventData, a3);
}

- (double)totalEventUnits
{
  return self->_totalEventUnits;
}

- (void)setTotalEventUnits:(double)a3
{
  self->_totalEventUnits = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (CompactMonthWeekViewDelegate)weekDelegate
{
  return (CompactMonthWeekViewDelegate *)objc_loadWeakRetained((id *)&self->_weekDelegate);
}

- (void)setWeekDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_weekDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weekDelegate);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_inputEventData, 0);
  objc_storeStrong((id *)&self->_processedEventData, 0);
}

@end

@implementation GuidanceETA

- (GuidanceETA)initWithRemainingTime:(double)a3 remainingDistance:(double)a4 arrivalBatteryCharge:(id)a5 destinationTimeZone:(id)a6 transportType:(int)a7
{
  id v13;
  id v14;
  GuidanceETA *v15;
  GuidanceETA *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDate *etaDate;
  NSTimeZone *v21;
  NSTimeZone *destinationTimeZone;
  objc_super v24;

  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)GuidanceETA;
  v15 = -[GuidanceETA init](&v24, "init");
  v16 = v15;
  if (v15)
  {
    v15->_remainingMinutes = (unint64_t)objc_msgSend((id)objc_opt_class(v15), "displayMinutesForTimeInterval:", a3);
    v16->_remainingDistance = a4;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceETA displayDateForDate:](GuidanceETA, "displayDateForDate:", v17));

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingTimeInterval:", (double)v16->_remainingMinutes * 60.0));
    etaDate = v16->_etaDate;
    v16->_etaDate = (NSDate *)v19;

    objc_storeStrong((id *)&v16->_arrivalBatteryCharge, a5);
    if (v14)
      v21 = (NSTimeZone *)v14;
    else
      v21 = (NSTimeZone *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
    destinationTimeZone = v16->_destinationTimeZone;
    v16->_destinationTimeZone = v21;

    v16->_transportType = a7;
    v16->_isEtaToFinalDestination = 1;

  }
  return v16;
}

- (GuidanceETA)initWithDisplayETA:(id)a3 remainingDistance:(id)a4 batteryChargeInfo:(id)a5 destinationTimeZone:(id)a6 transportType:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  GuidanceETA *v16;
  double v17;
  uint64_t v18;
  NSDate *etaDate;
  uint64_t v20;
  NSNumber *arrivalBatteryCharge;
  NSTimeZone *v22;
  NSTimeZone *destinationTimeZone;
  void *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)GuidanceETA;
  v16 = -[GuidanceETA init](&v26, "init");
  if (v16)
  {
    v16->_remainingMinutes = (unint64_t)objc_msgSend(v12, "displayRemainingMinutesToEndOfLeg");
    objc_msgSend(v13, "distanceRemainingToEndOfLeg");
    v16->_remainingDistance = v17;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayETAToEndOfLeg"));
    etaDate = v16->_etaDate;
    v16->_etaDate = (NSDate *)v18;

    if (v14)
    {
      objc_msgSend(v14, "batteryChargeRemainingAtEndOfLeg");
      v20 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      arrivalBatteryCharge = v16->_arrivalBatteryCharge;
      v16->_arrivalBatteryCharge = (NSNumber *)v20;
    }
    else
    {
      arrivalBatteryCharge = v16->_arrivalBatteryCharge;
      v16->_arrivalBatteryCharge = 0;
    }

    if (v15)
      v22 = (NSTimeZone *)v15;
    else
      v22 = (NSTimeZone *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
    destinationTimeZone = v16->_destinationTimeZone;
    v16->_destinationTimeZone = v22;

    v16->_transportType = a7;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "legInfos"));
    v16->_isEtaToFinalDestination = (unint64_t)objc_msgSend(v24, "count") < 2;

  }
  return v16;
}

- (id)etaDateStringWithAMPMSymbol:(BOOL)a3
{
  return -[GuidanceETA etaDateStringWithAMPMSymbol:allowTimeZone:](self, "etaDateStringWithAMPMSymbol:allowTimeZone:", a3, 1);
}

- (id)etaDateStringWithAMPMSymbol:(BOOL)a3 allowTimeZone:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSString *etaDateStringWithoutAMPM;
  void *v9;
  NSTimeZone *destinationTimeZone;
  void *v11;
  unsigned __int8 v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;

  v4 = a4;
  v5 = a3;
  if (qword_100090AF0 == -1)
  {
    if (a3)
      goto LABEL_3;
LABEL_6:
    etaDateStringWithoutAMPM = self->_etaDateStringWithoutAMPM;
    if (etaDateStringWithoutAMPM)
      return etaDateStringWithoutAMPM;
    goto LABEL_7;
  }
  dispatch_once(&qword_100090AF0, &stru_100083460);
  if (!v5)
    goto LABEL_6;
LABEL_3:
  etaDateStringWithoutAMPM = self->_etaDateString;
  if (etaDateStringWithoutAMPM)
    return etaDateStringWithoutAMPM;
LABEL_7:
  if (v4 && self->_destinationTimeZone)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
    destinationTimeZone = self->_destinationTimeZone;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA etaDate](self, "etaDate"));
    v12 = objc_msgSend(v9, "_navigation_isEquivalentToTimeZone:forDate:", destinationTimeZone, v11);

    v13 = CFSTR("J:mm");
    if (v5)
      v13 = CFSTR("j:mm");
    v14 = v13;
    v15 = v14;
    if ((v12 & 1) == 0)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("z")));

      v15 = (__CFString *)v16;
    }
  }
  else
  {
    v17 = CFSTR("J:mm");
    if (v5)
      v17 = CFSTR("j:mm");
    v15 = v17;
  }
  objc_msgSend((id)qword_100090AE8, "setLocalizedDateFormatFromTemplate:", v15);
  objc_msgSend((id)qword_100090AE8, "setTimeZone:", self->_destinationTimeZone);
  v18 = (void *)qword_100090AE8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA etaDate](self, "etaDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringFromDate:", v19));

  v21 = (objc_class *)objc_msgSend(v20, "copy");
  v22 = 24;
  if (v5)
    v22 = 16;
  v23 = *(Class *)((char *)&self->super.isa + v22);
  *(Class *)((char *)&self->super.isa + v22) = v21;

  return v20;
}

+ (id)etaStringFromEtaLegInfo:(id)a3 includingAMPMSymbols:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class(a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eta"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_arrivalTimeStringForEtaDate:timeZone:includingAMPMSymbols:", v8, v9, v4));
  return v10;
}

+ (unint64_t)displayMinutesForTimeInterval:(double)a3
{
  return vcvtpd_u64_f64(a3 / 60.0);
}

+ (id)displayDateForDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 96, v3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v6, "hour"), objc_msgSend(v6, "minute"), 0, v3, 2));
  return v7;
}

- (id)description
{
  NSNumber *arrivalBatteryCharge;
  uint64_t v4;
  unint64_t remainingMinutes;
  double remainingDistance;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  uint64_t v12;

  arrivalBatteryCharge = self->_arrivalBatteryCharge;
  v4 = objc_opt_class(self);
  remainingMinutes = self->_remainingMinutes;
  remainingDistance = self->_remainingDistance;
  v7 = objc_claimAutoreleasedReturnValue(-[GuidanceETA etaDate](self, "etaDate"));
  v8 = (void *)v7;
  if (arrivalBatteryCharge)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p remainingMinutes=%lu remainingDistance=%f etaDate=%@ arrivalBatteryCharge=%lu timezone=%@>"), v4, self, remainingMinutes, *(_QWORD *)&remainingDistance, v7, -[NSNumber unsignedIntegerValue](self->_arrivalBatteryCharge, "unsignedIntegerValue"), self->_destinationTimeZone);
  else
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p remainingMinutes=%lu remainingDistance=%f etaDate=%@ timezone=%@>"), v4, self, remainingMinutes, *(_QWORD *)&remainingDistance, v7, self->_destinationTimeZone, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)arrivalTimeStringIncludingAMPMSymbols:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA etaDate](self, "etaDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_arrivalTimeStringForEtaDate:timeZone:includingAMPMSymbols:", v6, self->_destinationTimeZone, v3));

  return v7;
}

- (NSString)arrivalTimeBottomString
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[GuidanceETA isEtaToFinalDestination](self, "isEtaToFinalDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("[NavTray] arrival label");
  else
    v5 = CFSTR("[NavTray] arrival label (next stop)");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return (NSString *)v6;
}

- (id)arrivalTimeExpandedStringIncludingAMPMSymbols:(BOOL)a3
{
  GuidanceETA *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalTimeStringIncludingAMPMSymbols:](self, "arrivalTimeStringIncludingAMPMSymbols:", a3));
  LODWORD(v3) = -[GuidanceETA isEtaToFinalDestination](v3, "isEtaToFinalDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if ((_DWORD)v3)
    v7 = CFSTR("[NavTray] Arrival time format");
  else
    v7 = CFSTR("[NavTray] Arrival time format (next stop)");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4));

  return v9;
}

+ (id)_arrivalTimeStringForEtaDate:(id)a3 timeZone:(id)a4 includingAMPMSymbols:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (qword_100090B00 != -1)
    dispatch_once(&qword_100090B00, &stru_100083480);
  objc_msgSend((id)qword_100090AF8, "setTimeZone:", v8);
  if (v5)
    v9 = CFSTR("j:mm");
  else
    v9 = CFSTR("J:mm");
  objc_msgSend((id)qword_100090AF8, "setLocalizedDateFormatFromTemplate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100090AF8, "stringFromDate:", v7));

  return v10;
}

- (NSString)timeValue
{
  NSString *timeValue;

  timeValue = self->_timeValue;
  if (!timeValue)
  {
    -[GuidanceETA _computeTimeProperties](self, "_computeTimeProperties");
    timeValue = self->_timeValue;
  }
  return timeValue;
}

- (NSString)timeUnit
{
  NSString *timeUnit;

  timeUnit = self->_timeUnit;
  if (!timeUnit)
  {
    -[GuidanceETA _computeTimeProperties](self, "_computeTimeProperties");
    timeUnit = self->_timeUnit;
  }
  return timeUnit;
}

- (NSString)timeUnitAccessibility
{
  NSString *timeUnitAccessibility;

  timeUnitAccessibility = self->_timeUnitAccessibility;
  if (!timeUnitAccessibility)
  {
    -[GuidanceETA _computeTimeProperties](self, "_computeTimeProperties");
    timeUnitAccessibility = self->_timeUnitAccessibility;
  }
  return timeUnitAccessibility;
}

- (void)_computeTimeProperties
{
  uint64_t remainingMinutes_low;
  void *v4;
  NSString *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  NSString *timeValue;
  NSString *v20;
  NSString *v21;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  NSString *v27;
  NSString *v28;
  void *v29;
  void *v30;
  NSString *v31;
  NSString *timeUnit;
  NSString *v33;
  NSString *timeUnitAccessibility;
  void *v35;

  remainingMinutes_low = LODWORD(self->_remainingMinutes);
  if ((int)remainingMinutes_low < 14401)
  {
    v12 = ((int)remainingMinutes_low / 60);
    if ((int)remainingMinutes_low <= 1439)
      v13 = ((int)remainingMinutes_low % 60);
    else
      v13 = 0;
    if ((_DWORD)v13)
      v14 = (remainingMinutes_low - 60) >= 0x3C;
    else
      v14 = 1;
    if (v14)
      v15 = v12;
    else
      v15 = 2;
    if ((_DWORD)v15)
    {
      if ((_DWORD)v13)
      {
        v16 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSString localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("Hours and minutes value [ETA]"), CFSTR("localized string not found"), 0));
        v18 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v12, v13));
        timeValue = self->_timeValue;
        self->_timeValue = v18;

      }
      else
      {
        v28 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%d"), v12));
        v16 = self->_timeValue;
        self->_timeValue = v28;
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Hours label [ETA]"), CFSTR("localized string not found"), 0));
      v31 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v15));
      timeUnit = self->_timeUnit;
      self->_timeUnit = v31;

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Hours accessibility label [ETA]"), CFSTR("localized string not found"), 0));
      v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v15);
    }
    else
    {
      v20 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%d"), LODWORD(self->_remainingMinutes)));
      v21 = self->_timeValue;
      self->_timeValue = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Minutes label [ETA]"), CFSTR("localized string not found"), 0));
      v24 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, remainingMinutes_low));
      v25 = self->_timeUnit;
      self->_timeUnit = v24;

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Minutes accessibility label [ETA]"), CFSTR("localized string not found"), 0));
      v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, remainingMinutes_low);
    }
    v33 = (NSString *)objc_claimAutoreleasedReturnValue(v27);
    timeUnitAccessibility = self->_timeUnitAccessibility;
    self->_timeUnitAccessibility = v33;

    v11 = (NSString *)v35;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Excessive time (10+ days) [ETA]"), CFSTR("localized string not found"), 0));
    v6 = self->_timeValue;
    self->_timeValue = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Days label [ETA]"), CFSTR("localized string not found"), 0));
    v9 = self->_timeUnit;
    self->_timeUnit = v8;

    v10 = self->_timeUnit;
    v11 = self->_timeUnitAccessibility;
    self->_timeUnitAccessibility = v10;
  }

}

- (NSString)distanceValue
{
  NSString *distanceValue;

  distanceValue = self->_distanceValue;
  if (!distanceValue)
  {
    -[GuidanceETA _computeDistanceProperties](self, "_computeDistanceProperties");
    distanceValue = self->_distanceValue;
  }
  return distanceValue;
}

- (NSString)distanceUnit
{
  NSString *distanceUnit;

  distanceUnit = self->_distanceUnit;
  if (!distanceUnit)
  {
    -[GuidanceETA _computeDistanceProperties](self, "_computeDistanceProperties");
    distanceUnit = self->_distanceUnit;
  }
  return distanceUnit;
}

- (NSString)distanceUnitAccessibility
{
  NSString *distanceUnitAccessibility;

  distanceUnitAccessibility = self->_distanceUnitAccessibility;
  if (!distanceUnitAccessibility)
  {
    -[GuidanceETA _computeDistanceProperties](self, "_computeDistanceProperties");
    distanceUnitAccessibility = self->_distanceUnitAccessibility;
  }
  return distanceUnitAccessibility;
}

- (int64_t)_lengthUnitFromUnit:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  int64_t v9;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUnitLength kilometers](NSUnitLength, "kilometers"));

  if (v4 == v3)
  {
    v9 = 14;
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUnitLength meters](NSUnitLength, "meters"));

    if (v5 == v3)
    {
      v9 = 11;
    }
    else
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUnitLength miles](NSUnitLength, "miles"));

      if (v6 == v3)
      {
        v9 = 1284;
      }
      else
      {
        v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUnitLength yards](NSUnitLength, "yards"));

        if (v7 == v3)
        {
          v9 = 1283;
        }
        else
        {
          v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUnitLength feet](NSUnitLength, "feet"));

          if (v8 == v3)
            v9 = 1282;
          else
            v9 = 1284;
        }
      }
    }
  }

  return v9;
}

- (int64_t)_unitStyleForUnit:(int64_t)a3
{
  int64_t result;

  result = 1;
  if (a3 > 1282)
  {
    if ((unint64_t)(a3 - 1283) >= 2)
      return 2;
  }
  else if (a3 != 11 && a3 != 14)
  {
    return 2;
  }
  return result;
}

- (void)_computeDistanceProperties
{
  uint64_t v3;
  double v4;
  double v5;
  NSString *distanceValue;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  int64_t v12;
  id v13;
  NSString *v14;
  NSString *distanceUnit;
  id v16;
  NSString *v17;
  NSString *distanceUnitAccessibility;
  id v19;

  v3 = GEORoundedMeasurementForDistance(2 * (self->_transportType == 2), a2, self->_remainingDistance);
  v19 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v19, "doubleValue");
  v5 = v4;
  if (self->_remainingDistance >= 0.0)
  {
    if (vabdd_f64(v4, floor(v4)) < 0.000001)
      v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%.0f"), *(_QWORD *)&v4);
    else
      v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&v4);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
    distanceValue = self->_distanceValue;
    self->_distanceValue = v10;
  }
  else
  {
    distanceValue = (NSString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString localizedStringForKey:value:table:](distanceValue, "localizedStringForKey:value:table:", CFSTR("Invalid Distance [ETA]"), CFSTR("localized string not found"), 0));
    v8 = self->_distanceValue;
    self->_distanceValue = v7;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "unit"));
  v12 = -[GuidanceETA _lengthUnitFromUnit:](self, "_lengthUnitFromUnit:", v11);

  if (qword_100090B10 != -1)
    dispatch_once(&qword_100090B10, &stru_1000834A0);
  v13 = (id)qword_100090B08;
  objc_msgSend(v13, "setUnitStyle:", -[GuidanceETA _unitStyleForUnit:](self, "_unitStyleForUnit:", v12));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "unitStringFromValue:unit:", v12, v5));
  distanceUnit = self->_distanceUnit;
  self->_distanceUnit = v14;

  if (qword_100090B20 != -1)
    dispatch_once(&qword_100090B20, &stru_1000834C0);
  v16 = (id)qword_100090B18;
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "unitStringFromValue:unit:", v12, v5));
  distanceUnitAccessibility = self->_distanceUnitAccessibility;
  self->_distanceUnitAccessibility = v17;

}

+ (id)defaultArrivalString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("arrival/ETA"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)invalidValueString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[NavTray] Unknown value"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)defaultTimeUnit
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[NavTray] default time units"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)defaultTimeUnitAccessibility
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[NavTray] default time units accessibility"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)defaultDistanceUnit
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = objc_msgSend(v2, "_navigation_distanceUsesMetricSystem");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("[NavTray][Metric] default distance units");
  else
    v6 = CFSTR("[NavTray][Imperial] default distance units");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  return v7;
}

+ (id)defaultDistanceUnitAccessibility
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = objc_msgSend(v2, "_navigation_distanceUsesMetricSystem");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("[NavTray][Metric] default distance units accessibility");
  else
    v6 = CFSTR("[NavTray][Imperial] default distance units accessibility");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  return v7;
}

+ (id)defaultBatteryOnArrivalString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("on arrival/ETA"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_chargeImageAttachmentWithFont:(id)a3
{
  id v4;
  NSTextAttachment *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  v5 = objc_opt_new(NSTextAttachment);
  objc_msgSend(v4, "pointSize");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](self, "arrivalBatteryCharge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage chargeImageOfSize:batteryLevel:](UIImage, "chargeImageOfSize:batteryLevel:", objc_msgSend(v8, "unsignedIntegerValue"), v7));

  -[NSTextAttachment setImage:](v5, "setImage:", v9);
  objc_msgSend(v4, "capHeight");
  v11 = v10;

  objc_msgSend(v9, "size");
  v13 = (v11 - v12) * 0.5;
  objc_msgSend(v9, "size");
  v15 = v14;
  objc_msgSend(v9, "size");
  -[NSTextAttachment setBounds:](v5, "setBounds:", 0.0, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v5));

  return v17;
}

- (id)batteryChargeStringWithFont:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSAttributedStringKey v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA _chargeImageAttachmentWithFont:](self, "_chargeImageAttachmentWithFont:", v4));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
  objc_msgSend(v6, "appendAttributedString:", v7);

  v8 = objc_alloc((Class)NSAttributedString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](self, "arrivalBatteryCharge"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld%%"), objc_msgSend(v9, "integerValue")));
  v11 = objc_msgSend(v8, "initWithString:", v10);
  objc_msgSend(v6, "appendAttributedString:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  v13 = objc_msgSend(v12, "length");

  v17 = NSFontAttributeName;
  v18 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

  objc_msgSend(v6, "addAttributes:range:", v14, 0, v13);
  v15 = objc_msgSend(v6, "copy");

  return v15;
}

- (id)arrivalWithBatteryChargeStringWithFont:(id)a3 includingAMPMSymbols:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSAttributedStringKey v24;
  id v25;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA _chargeImageAttachmentWithFont:](self, "_chargeImageAttachmentWithFont:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA etaDateStringWithAMPMSymbol:allowTimeZone:](self, "etaDateStringWithAMPMSymbol:allowTimeZone:", v4, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("00:00 arrival with X%"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](self, "arrivalBatteryCharge"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8, objc_msgSend(v11, "integerValue")));

  v13 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v12);
  v14 = objc_msgSend(v13, "mutableCopy");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "string"));
  v16 = objc_msgSend(v15, "rangeOfString:", CFSTR("$1$@"));
  v18 = v17;

  if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", v16, v18, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "string"));
  v20 = objc_msgSend(v19, "length");

  v24 = NSFontAttributeName;
  v25 = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  objc_msgSend(v14, "addAttributes:range:", v21, 0, v20);

  v22 = objc_msgSend(v14, "copy");
  return v22;
}

- (id)extendedArrivalBatteryChargeStringWithFont:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSAttributedStringKey v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA _chargeImageAttachmentWithFont:](self, "_chargeImageAttachmentWithFont:", v4));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
  objc_msgSend(v6, "appendAttributedString:", v7);

  v8 = objc_alloc((Class)NSAttributedString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[NavTray] Extended arrival battery charge format"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceETA arrivalBatteryCharge](self, "arrivalBatteryCharge"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, objc_msgSend(v11, "integerValue")));
  v13 = objc_msgSend(v8, "initWithString:", v12);
  objc_msgSend(v6, "appendAttributedString:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  v15 = objc_msgSend(v14, "length");

  v19 = NSFontAttributeName;
  v20 = v4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  objc_msgSend(v6, "addAttributes:range:", v16, 0, v15);
  v17 = objc_msgSend(v6, "copy");

  return v17;
}

- (double)remainingDistance
{
  return self->_remainingDistance;
}

- (NSNumber)arrivalBatteryCharge
{
  return self->_arrivalBatteryCharge;
}

- (unint64_t)remainingMinutes
{
  return self->_remainingMinutes;
}

- (NSDate)etaDate
{
  return self->_etaDate;
}

- (BOOL)isEtaToFinalDestination
{
  return self->_isEtaToFinalDestination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaDate, 0);
  objc_storeStrong((id *)&self->_timeUnitAccessibility, 0);
  objc_storeStrong((id *)&self->_timeUnit, 0);
  objc_storeStrong((id *)&self->_timeValue, 0);
  objc_storeStrong((id *)&self->_distanceUnitAccessibility, 0);
  objc_storeStrong((id *)&self->_distanceUnit, 0);
  objc_storeStrong((id *)&self->_distanceValue, 0);
  objc_storeStrong((id *)&self->_arrivalBatteryCharge, 0);
  objc_storeStrong((id *)&self->_etaDateStringWithoutAMPM, 0);
  objc_storeStrong((id *)&self->_etaDateString, 0);
  objc_storeStrong((id *)&self->_destinationTimeZone, 0);
}

@end

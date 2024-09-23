@implementation TransitSchedulesDepartureBaseViewCell

- (void)setTimeZone:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[NSTimeZone isEqual:](self->_timeZone, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeZone, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell dateFormatter](self, "dateFormatter"));
    objc_msgSend(v5, "setTimeZone:", v6);

  }
}

- (NSDateFormatter)dateFormatter
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100688CFC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  if (qword_1014D2D50 != -1)
    dispatch_once(&qword_1014D2D50, block);
  return (NSDateFormatter *)(id)qword_1014D2D48;
}

- (NSDateComponentsFormatter)timeFormatter
{
  if (qword_1014D2D60 != -1)
    dispatch_once(&qword_1014D2D60, &stru_1011BFB68);
  return (NSDateComponentsFormatter *)(id)qword_1014D2D58;
}

- (id)emphasizedLowFrequencyDepartureDateForDeparture:(id)a3
{
  void *v3;
  id v4;
  char *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "liveStatus");
  if ((unint64_t)(v5 - 1) < 4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "liveDepartureDate"));
LABEL_6:
    v3 = (void *)v6;
    goto LABEL_7;
  }
  if (!v5 || v5 == (char *)5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduledDepartureDate"));
    goto LABEL_6;
  }
LABEL_7:

  return v3;
}

- (id)timeStringForDeparture:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = -[TransitSchedulesDepartureBaseViewCell timeDisplayStyle](self, "timeDisplayStyle");
  if (v5 == 2 || v5 == 4)
  {
    if (objc_msgSend(v4, "isPastDeparture"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "departureDate"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheduledDepartureDate"));
      v8 = v7;
      if (v7)
        v9 = v7;
      else
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "liveDepartureDate"));
      v6 = v9;

    }
    goto LABEL_12;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "departureDate"));
  v10 = objc_msgSend(v4, "liveStatus") == 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell referenceDate](self, "referenceDate"));
  LOBYTE(v10) = objc_msgSend(v4, "isPastDepartureRelativeToDate:usingGracePeriod:", v11, v10);

  if ((v10 & 1) != 0)
  {
LABEL_12:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell timeZone](self, "timeZone"));
    v16 = objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:showTimeZone:useShortFormat:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:showTimeZone:useShortFormat:", v6, v15, 0, 0, 0));
    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell referenceDate](self, "referenceDate"));
  objc_msgSend(v6, "timeIntervalSinceDate:", v12);
  v14 = v13;

  if (!GEOTransitDepartureIsImminentDepartureTimeInterval(v14))
  {
    if (v14 <= GEOTransitDepartureNearFuturePeriod())
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell timeFormatter](self, "timeFormatter"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringFromTimeInterval:", v14));
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Now"), CFSTR("localized string not found"), 0));
LABEL_13:
  v17 = (void *)v16;

  return v17;
}

- (int64_t)effectiveLiveStatusForDeparture:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "liveStatus");
  if ((id)-[TransitSchedulesDepartureBaseViewCell timeDisplayStyle](self, "timeDisplayStyle") == (id)1 && v4 == (id)3)
    return 2;
  else
    return (int64_t)v4;
}

- (unint64_t)timeDisplayStyle
{
  return self->_timeDisplayStyle;
}

- (void)setTimeDisplayStyle:(unint64_t)a3
{
  self->_timeDisplayStyle = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_referenceDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end

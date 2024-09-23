@implementation TransitSchedulesDepartureInfoProvider

- (TransitSchedulesDepartureInfoProvider)initWithTransitLine:(id)a3 timeZone:(id)a4 referenceDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  TransitSchedulesDepartureInfoProvider *v12;
  TransitSchedulesDepartureInfoProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TransitSchedulesDepartureInfoProvider;
  v12 = -[TransitSchedulesDepartureInfoProvider init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transitLine, a3);
    objc_storeStrong((id *)&v13->_timeZone, a4);
    objc_storeStrong((id *)&v13->_date, a5);
  }

  return v13;
}

- (NSArray)identifiers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider frequencyString](self, "frequencyString"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
    objc_msgSend(v3, "addObject:", CFSTR("DepartureInfoSectionCellFrequencyIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider operatingHours](self, "operatingHours"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
    objc_msgSend(v3, "addObject:", CFSTR("DepartureInfoSectionCellOperatingHoursIdentifier"));
  return (NSArray *)v3;
}

+ (Class)cellClass
{
  return (Class)objc_opt_class(TransitSchedulesDepartureInfoViewCell);
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v7 = a5;
  v8 = objc_opt_class(TransitSchedulesDepartureInfoViewCell);
  if ((objc_opt_isKindOfClass(v20, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if (!v12)
      goto LABEL_12;
    v13 = v20;
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("DepartureInfoSectionCellFrequencyIdentifier")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Frequency"), CFSTR("localized string not found"), 0));
      objc_msgSend(v13, "setTitle:", v15);

      v16 = objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider frequencyString](self, "frequencyString"));
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("DepartureInfoSectionCellOperatingHoursIdentifier")))
      {
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Operating Hours"), CFSTR("localized string not found"), 0));
      objc_msgSend(v13, "setTitle:", v18);

      v16 = objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider operatingHours](self, "operatingHours"));
    }
    v19 = (void *)v16;
    objc_msgSend(v13, "setContent:", v16);

    goto LABEL_11;
  }
LABEL_13:

}

- (BOOL)allowsCellSelection
{
  return 0;
}

- (void)setTransitLine:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = -[GEOTransitLine muid](self->_transitLine, "muid");
  if (v5 != objc_msgSend(v7, "muid"))
  {
    objc_storeStrong((id *)&self->_transitLine, a3);
    -[TransitSchedulesDepartureInfoProvider _invalidateOperatingHours](self, "_invalidateOperatingHours");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider delegate](self, "delegate"));
    objc_msgSend(v6, "updatedDepartureInfoProvider:", self);

  }
}

- (void)setDepartureSequence:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[GEOTransitDepartureSequence isEqual:](self->_departureSequence, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_departureSequence, a3);
    -[TransitSchedulesDepartureInfoProvider _invalidateOperatingHours](self, "_invalidateOperatingHours");
    -[TransitSchedulesDepartureInfoProvider _invalidateFrequencyString](self, "_invalidateFrequencyString");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider delegate](self, "delegate"));
    objc_msgSend(v5, "updatedDepartureInfoProvider:", self);

  }
}

- (void)_invalidateFrequencyString
{
  NSString *frequencyString;

  frequencyString = self->_frequencyString;
  self->_frequencyString = 0;

}

- (NSString)frequencyString
{
  void *frequencyString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  frequencyString = self->_frequencyString;
  if (!frequencyString)
  {
    frequencyString = self->_departureSequence;
    if (frequencyString)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(frequencyString, "frequencyToDescribeAtDate:", self->_date));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitDepartureSequence firstDepartureValidForDate:](self->_departureSequence, "firstDepartureValidForDate:", self->_date));

      if (!v5 && v4)
      {
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_formattedDescriptionForFrequency:](NSString, "_navigation_formattedDescriptionForFrequency:", v4));
        v7 = self->_frequencyString;
        self->_frequencyString = v6;

      }
      frequencyString = self->_frequencyString;
    }
  }
  return (NSString *)frequencyString;
}

- (void)_invalidateOperatingHours
{
  NSString *operatingHours;

  operatingHours = self->_operatingHours;
  self->_operatingHours = 0;

}

- (NSString)operatingHours
{
  id *p_operatingHours;
  id v3;
  void *v6;
  id v7;
  id v8;
  void *v9;

  p_operatingHours = (id *)&self->_operatingHours;
  if (!self->_operatingHours)
  {
    if (self->_departureSequence)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider _operatingHoursDescriptionFromDepartureSequence](self, "_operatingHoursDescriptionFromDepartureSequence"));
      if (objc_msgSend(v6, "length"))
      {
        v7 = *p_operatingHours;
        *p_operatingHours = v6;
        v8 = v6;

        v3 = *p_operatingHours;
        return (NSString *)v3;
      }

    }
    if (self->_transitLine)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider _operatingHoursDescriptionFromTransitLine](self, "_operatingHoursDescriptionFromTransitLine"));
      if (objc_msgSend(v9, "length"))
        objc_storeStrong(p_operatingHours, v9);

    }
  }
  v3 = *p_operatingHours;
  return (NSString *)v3;
}

- (id)_operatingHoursStringForTimeRanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (qword_1014D3BB0 != -1)
    dispatch_once(&qword_1014D3BB0, &stru_1011DD848);
  objc_msgSend((id)qword_1014D3BA8, "setTimeZone:", self->_timeZone);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)qword_1014D3BA8;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v8));

    v10 = (void *)qword_1014D3BA8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Transit Schedule] Operating hours with separator"), CFSTR("localized string not found"), 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v9, v12));
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_operatingHoursDescriptionFromTransitLine
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitLine operatingHours](self->_transitLine, "operatingHours"));
  if (-[GEOTransitLine departureTimeDisplayStyle](self->_transitLine, "departureTimeDisplayStyle") == (id)3
    && objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider _operatingHoursStringForTimeRanges:](self, "_operatingHoursStringForTimeRanges:", v3));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_operatingHoursDescriptionFromDepartureSequence
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitDepartureSequence operatingHoursForDate:inTimeZone:](self->_departureSequence, "operatingHoursForDate:inTimeZone:", self->_date, self->_timeZone));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureInfoProvider _operatingHoursStringForTimeRanges:](self, "_operatingHoursStringForTimeRanges:", v3));

  return v4;
}

- (TransitSchedulesDepartureInfoProviderDelegate)delegate
{
  return (TransitSchedulesDepartureInfoProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (GEOTransitDepartureSequence)departureSequence
{
  return self->_departureSequence;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_departureSequence, 0);
  objc_storeStrong((id *)&self->_transitLine, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operatingHours, 0);
  objc_storeStrong((id *)&self->_frequencyString, 0);
}

@end

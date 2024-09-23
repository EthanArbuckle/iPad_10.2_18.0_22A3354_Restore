@implementation NSDate

- (BOOL)isToday
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v3, "isDateInToday:", self);

  return (char)self;
}

- (BOOL)isYesterday
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v3, "isDateInYesterday:", self);

  return (char)self;
}

+ (id)randomDateBeforeNow
{
  id v2;
  double v3;
  double v4;

  v2 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v4 = v3 * FCRandom(v2);
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v4);
}

- (id)stringWithFormat:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatterWithFormat:forReuse:](NSDateFormatter, "dateFormatterWithFormat:forReuse:", a3, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", self));

  return v5;
}

- (id)stringWithTopStoriesFormat
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate fr_partOfDay](self, "fr_partOfDay"));
  v4 = objc_alloc((Class)NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatterWithFormat:forReuse:](NSDateFormatter, "dateFormatterWithFormat:forReuse:", CFSTR("EEEE '%@', MMMM d"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", self));
  v7 = objc_msgSend(v4, "initWithFormat:", v6, v3);

  return v7;
}

- (id)fr_partOfDay
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  unint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (char *)objc_msgSend(v3, "component:fromDate:", 32, self);
  if ((unint64_t)v4 > 0xB)
  {
    if ((unint64_t)(v4 - 12) > 4)
    {
      v8 = (unint64_t)(v4 - 17);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      if (v8 > 3)
        v7 = CFSTR("Night");
      else
        v7 = CFSTR("Evening");
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Afternoon");
    }
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Morning");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1000DF290, 0));

  return v9;
}

- (id)fr_gregorianShortDisplayStringPreferringToday
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000185A4;
  v9 = sub_1000184F4;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002DA3C;
  v4[3] = &unk_1000DA388;
  v4[4] = &v5;
  -[NSDate nss_gregorianDescriptionWithFlags:options:completion:](self, "nss_gregorianDescriptionWithFlags:options:completion:", 1, 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianMediumDisplayStringPreferringToday
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000185A4;
  v9 = sub_1000184F4;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002DB18;
  v4[3] = &unk_1000DA388;
  v4[4] = &v5;
  -[NSDate nss_gregorianDescriptionWithFlags:options:completion:](self, "nss_gregorianDescriptionWithFlags:options:completion:", 2, 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianLongDisplayStringPreferringToday
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000185A4;
  v9 = sub_1000184F4;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002DBF8;
  v4[3] = &unk_1000DA388;
  v4[4] = &v5;
  -[NSDate nss_gregorianDescriptionWithFlags:options:completion:](self, "nss_gregorianDescriptionWithFlags:options:completion:", 4, 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianShortDisplayString
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000185A4;
  v9 = sub_1000184F4;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002DCD8;
  v4[3] = &unk_1000DA388;
  v4[4] = &v5;
  -[NSDate nss_gregorianDescriptionWithFlags:options:completion:](self, "nss_gregorianDescriptionWithFlags:options:completion:", 1, 0, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianMediumDisplayString
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000185A4;
  v9 = sub_1000184F4;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002DDB4;
  v4[3] = &unk_1000DA388;
  v4[4] = &v5;
  -[NSDate nss_gregorianDescriptionWithFlags:options:completion:](self, "nss_gregorianDescriptionWithFlags:options:completion:", 2, 0, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_gregorianLongDisplayString
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000185A4;
  v9 = sub_1000184F4;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002DE94;
  v4[3] = &unk_1000DA388;
  v4[4] = &v5;
  -[NSDate nss_gregorianDescriptionWithFlags:options:completion:](self, "nss_gregorianDescriptionWithFlags:options:completion:", 4, 0, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)fr_localDate
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init((Class)NSDateFormatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'"));
  v5 = objc_alloc_init((Class)NSDateFormatter);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", CFSTR("UTC")));
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromString:", v7));

  return v8;
}

+ (id)_fr_sharedGregorianCalendar
{
  if (qword_10010A4A0 != -1)
    dispatch_once(&qword_10010A4A0, &stru_1000DA3A8);
  return (id)qword_10010A4A8;
}

+ (id)_fr_sharedDayOfWeekDateFormatter
{
  if (qword_10010A4B0 != -1)
    dispatch_once(&qword_10010A4B0, &stru_1000DA3C8);
  return (id)qword_10010A4B8;
}

+ (id)_fr_sharedShortTimeDateFormatter
{
  if (qword_10010A4C0 != -1)
    dispatch_once(&qword_10010A4C0, &stru_1000DA3E8);
  return (id)qword_10010A4C8;
}

+ (id)_fr_sharedShortDateDateFormatter
{
  if (qword_10010A4D0 != -1)
    dispatch_once(&qword_10010A4D0, &stru_1000DA408);
  return (id)qword_10010A4D8;
}

@end

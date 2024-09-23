@implementation NTPBEvent

- (void)ft_setTemporalBoundsBySanitizingStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v13 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "components:fromDate:", 28, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateFromComponents:", v8));
  -[NTPBEvent nss_setStartDate:](self, "nss_setStartDate:", v9);
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v11 = v10;

  v12 = round(v11);
  if (v12 > 21.0)
    v12 = 21.0;
  -[NTPBEvent setDuration:](self, "setDuration:", (uint64_t)v12);

}

@end

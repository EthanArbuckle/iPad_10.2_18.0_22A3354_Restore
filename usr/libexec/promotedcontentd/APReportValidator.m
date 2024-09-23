@implementation APReportValidator

+ (void)verifyPastDueReports:(id)a3 deliveredReport:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = dispatch_queue_create("com.apple.ap.pastduereport", v13);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086C80;
  block[3] = &unk_100212FA8;
  v19 = v7;
  v20 = v8;
  v21 = v9;
  v15 = v9;
  v16 = v8;
  v17 = v7;
  dispatch_async(v14, block);

}

- (APReportValidator)initWithReportDatasource:(id)a3 deliveredReport:(id)a4 currentDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  APReportValidator *v11;
  uint64_t v12;
  NSString *reportType;
  uint64_t v14;
  APDBDeliveredReportRow *lastReport;
  APReportDate *v16;
  APReportDate *reportDate;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APReportValidator;
  v11 = -[APReportValidator init](&v19, "init");
  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reportType"));
    reportType = v11->_reportType;
    v11->_reportType = (NSString *)v12;

    v11->_reportFrequency = (int64_t)objc_msgSend((id)objc_opt_class(v8), "reportFrequency");
    objc_storeStrong((id *)&v11->_deliveredReport, a4);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastDeliveryReportWithType:", v11->_reportType));
    lastReport = v11->_lastReport;
    v11->_lastReport = (APDBDeliveredReportRow *)v14;

    v16 = -[APReportDate initWithDate:]([APReportDate alloc], "initWithDate:", v10);
    reportDate = v11->_reportDate;
    v11->_reportDate = v16;

  }
  return v11;
}

- (BOOL)validateCurrent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  BOOL v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator lastReport](self, "lastReport"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator reportDate](self, "reportDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reportDate"));
    v6 = (uint64_t)objc_msgSend(v4, "numberOfDaysSinceDate:", v5);

    v7 = -[APReportValidator reportFrequency](self, "reportFrequency");
    v8 = v6 > 0;
    if (v7 != 1901)
      v8 = 0;
    if (v7 == 1902)
      v9 = v6 > 6;
    else
      v9 = v8;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)pastDueReportDates
{
  void *v3;
  int64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator lastReport](self, "lastReport"));

  if (v3)
  {
    v4 = -[APReportValidator reportFrequency](self, "reportFrequency");
    switch(v4)
    {
      case 1903:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator _pastDueMonthlyReportDates](self, "_pastDueMonthlyReportDates"));
        break;
      case 1902:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator _pastDueWeeklyReportDates](self, "_pastDueWeeklyReportDates"));
        break;
      case 1901:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator _pastDueDailyReportDates](self, "_pastDueDailyReportDates"));
        break;
      default:
        v5 = 0;
        break;
    }
  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return v5;
}

- (id)_pastDueDailyReportDates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v15[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator reportDate](self, "reportDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator reportType](self, "reportType"));
  v6 = 7;
  do
  {
    v7 = objc_msgSend(v4, "reportDayMinus:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APReportValidator deliveredReport](self, "deliveredReport"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deliveryReportWithType:dayOfYear:", v5, v9));

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDateMinusDays:", v6));
      if (v11)
      {
        objc_msgSend(v3, "addObject:", v11);
      }
      else
      {
        v12 = APLogForCategory(39);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Reports: Error creating report date.", v15, 2u);
        }

      }
    }

    --v6;
  }
  while (v6);

  return v3;
}

- (id)_pastDueWeeklyReportDates
{
  return +[NSMutableArray array](NSMutableArray, "array");
}

- (id)_pastDueMonthlyReportDates
{
  return +[NSMutableArray array](NSMutableArray, "array");
}

- (NSString)reportType
{
  return self->_reportType;
}

- (APDBDeliveredReportRow)lastReport
{
  return self->_lastReport;
}

- (int64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (APReportDate)reportDate
{
  return self->_reportDate;
}

- (APDBDeliveredReport)deliveredReport
{
  return self->_deliveredReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveredReport, 0);
  objc_storeStrong((id *)&self->_reportDate, 0);
  objc_storeStrong((id *)&self->_lastReport, 0);
  objc_storeStrong((id *)&self->_reportType, 0);
}

@end

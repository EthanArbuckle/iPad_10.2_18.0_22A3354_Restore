@implementation PLYearGroupingRule

- (PLYearGroupingRule)init
{
  PLYearGroupingRule *v2;
  uint64_t v3;
  NSCalendar *calendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLYearGroupingRule;
  v2 = -[PLYearGroupingRule init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

  }
  return v2;
}

- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 resultBlock:(id)a5
{
  -[PLYearGroupingRule titlesForHighlightItemList:dateRangeTitleGenerator:forceUpdateLocale:resultBlock:](self, "titlesForHighlightItemList:dateRangeTitleGenerator:forceUpdateLocale:resultBlock:", a3, a4, 0, a5);
}

- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 forceUpdateLocale:(BOOL)a5 resultBlock:(id)a6
{
  _BOOL4 v6;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a5;
  v9 = (void (**)(id, void *, _QWORD))a6;
  v10 = a4;
  objc_msgSend(a3, "sortedChildHighlightItems");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v13);
  objc_msgSend(v13, "dateByAddingTimeInterval:", v15 * 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateRangeTitleWithStartDate:endDate:category:kind:type:options:", v16, v16, 0, 2, 0, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v17, 0);
}

- (unint64_t)dominantYearForStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;

  v6 = a4;
  v7 = a3;
  -[PLYearGroupingRule calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v10 = v9;

  objc_msgSend(v7, "dateByAddingTimeInterval:", v10 * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "component:fromDate:", 4, v11);
  return v12;
}

- (BOOL)highlightItem:(id)a3 belongsToHighlightItemList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PLYearGroupingRule dominantYearForStartDate:endDate:](self, "dominantYearForStartDate:endDate:", v8, v9);
  objc_msgSend(v7, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PLYearGroupingRule dominantYearForStartDate:endDate:](self, "dominantYearForStartDate:endDate:", v11, v12);
  return v10 == v13;
}

- (BOOL)highlightItemList:(id)a3 canBeMergedWithOtherHighlightItemList:(id)a4
{
  return 0;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end

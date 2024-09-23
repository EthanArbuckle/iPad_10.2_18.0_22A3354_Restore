@implementation PLSearchSuggestionDateUtility

+ (id)dateFilterForSearchSuggestionTemplateDateType:(unint64_t)a3 calendar:(id)a4 relativeDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v8 = a4;
  if (a3)
  {
    v9 = a5;
    objc_msgSend(v8, "components:fromDate:", 28, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 28, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a3)
    {
      case 1uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:startDayOffset:startMonthOffset:startYearOffset:endDayOffset:endMonthOffset:endYearOffset:", v10, v11, v8, -3, 0, -1, 4, 0, -1);
        goto LABEL_14;
      case 2uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:startDayOffset:startMonthOffset:startYearOffset:endDayOffset:endMonthOffset:endYearOffset:", v10, v11, v8, -8, 0, 0, -5, 0, 0);
        goto LABEL_14;
      case 3uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:numberOfMonthsAgo:", v10, v11, v8, 1);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:numberOfYearsAgo:", v10, v11, v8, 1);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 5uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:startDayOffset:startMonthOffset:startYearOffset:endDayOffset:endMonthOffset:endYearOffset:", v10, v11, v8, -3, 0, -2, 4, 0, -2);
        goto LABEL_14;
      case 6uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:startDayOffset:startMonthOffset:startYearOffset:endDayOffset:endMonthOffset:endYearOffset:", v10, v11, v8, -3, 0, -5, 4, 0, -5);
        goto LABEL_14;
      case 7uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:startDayOffset:startMonthOffset:startYearOffset:endDayOffset:endMonthOffset:endYearOffset:", v10, v11, v8, -3, 0, -10, 4, 0, -10);
        goto LABEL_14;
      case 8uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:startDayOffset:startMonthOffset:startYearOffset:endDayOffset:endMonthOffset:endYearOffset:", v10, v11, v8, -3, 0, -15, 4, 0, -15);
        goto LABEL_14;
      case 9uLL:
        objc_msgSend(a1, "_dateFilterFromStartDateComponents:endDateComponents:calendar:startDayOffset:startMonthOffset:startYearOffset:endDayOffset:endMonthOffset:endYearOffset:", v10, v11, v8, -3, 0, -20, 4, 0, -20);
LABEL_14:
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v12 = (void *)v13;
        break;
      default:
        v12 = 0;
        break;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)allTemplateDateTypes
{
  id v2;
  uint64_t i;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  for (i = 1; i != 10; ++i)
    objc_msgSend(v2, "addIndex:", i);
  return v2;
}

+ (id)_dateFilterFromStartDateComponents:(id)a3 endDateComponents:(id)a4 calendar:(id)a5 numberOfYearsAgo:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  PSIDate *v18;
  PSIDate *v19;
  PSIDateFilter *v20;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "setDay:", 1);
  objc_msgSend(v11, "setMonth:", 1);
  objc_msgSend(v11, "setYear:", objc_msgSend(v11, "year") - a6);
  objc_msgSend(v10, "setDay:", 1);
  objc_msgSend(v10, "setYear:", objc_msgSend(v10, "year") - a6);
  objc_msgSend(v9, "dateFromComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rangeOfUnit:inUnit:forDate:", 8, 4, v12);
  v14 = v13;

  objc_msgSend(v10, "setMonth:", v14);
  objc_msgSend(v9, "dateFromComponents:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rangeOfUnit:inUnit:forDate:", 16, 8, v15);
  v17 = v16;

  objc_msgSend(v10, "setDay:", v17);
  v18 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v11);

  v19 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v10);
  v20 = -[PSIDateFilter initWithStartDate:endDate:]([PSIDateFilter alloc], "initWithStartDate:endDate:", v18, v19);

  return v20;
}

+ (id)_dateFilterFromStartDateComponents:(id)a3 endDateComponents:(id)a4 calendar:(id)a5 numberOfMonthsAgo:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  PSIDate *v15;
  PSIDate *v16;
  PSIDateFilter *v17;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "setDay:", 1);
  objc_msgSend(v11, "setMonth:", objc_msgSend(v11, "month") - a6);
  objc_msgSend(v9, "dateFromComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rangeOfUnit:inUnit:forDate:", 16, 8, v12);
  v14 = v13;

  objc_msgSend(v10, "setDay:", v14);
  objc_msgSend(v10, "setMonth:", objc_msgSend(v10, "month") - a6);
  v15 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v11);

  v16 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v10);
  v17 = -[PSIDateFilter initWithStartDate:endDate:]([PSIDateFilter alloc], "initWithStartDate:endDate:", v15, v16);

  return v17;
}

+ (id)_dateFilterFromStartDateComponents:(id)a3 endDateComponents:(id)a4 calendar:(id)a5 startDayOffset:(unint64_t)a6 startMonthOffset:(unint64_t)a7 startYearOffset:(unint64_t)a8 endDayOffset:(unint64_t)a9 endMonthOffset:(unint64_t)a10 endYearOffset:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PSIDate *v23;
  PSIDate *v24;
  PSIDateFilter *v25;

  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v18, "setDay:", objc_msgSend(v18, "day") + a6);
  objc_msgSend(v18, "setMonth:", objc_msgSend(v18, "month") + a7);
  objc_msgSend(v18, "setYear:", objc_msgSend(v18, "year") + a8);
  objc_msgSend(v17, "setDay:", objc_msgSend(v17, "day") + a9);
  objc_msgSend(v17, "setMonth:", objc_msgSend(v17, "month") + a10);
  objc_msgSend(v17, "setYear:", objc_msgSend(v17, "year") + a11);
  objc_msgSend(v16, "dateFromComponents:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "dateFromComponents:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "components:fromDate:", 28, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "components:fromDate:", 28, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v21);
  v24 = -[PSIDate initWithDateComponents:]([PSIDate alloc], "initWithDateComponents:", v22);
  v25 = -[PSIDateFilter initWithStartDate:endDate:]([PSIDateFilter alloc], "initWithStartDate:endDate:", v23, v24);

  return v25;
}

+ (id)templateKeyForDateTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 8)
    return 0;
  else
    return off_1E3660080[a3 - 1];
}

@end

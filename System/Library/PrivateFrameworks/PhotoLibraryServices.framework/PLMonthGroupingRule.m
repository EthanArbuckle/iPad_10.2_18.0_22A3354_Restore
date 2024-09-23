@implementation PLMonthGroupingRule

- (PLMonthGroupingRule)init
{
  PLMonthGroupingRule *v2;
  uint64_t v3;
  NSCalendar *calendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLMonthGroupingRule;
  v2 = -[PLMonthGroupingRule init](&v6, sel_init);
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
  -[PLMonthGroupingRule titlesForHighlightItemList:dateRangeTitleGenerator:forceUpdateLocale:resultBlock:](self, "titlesForHighlightItemList:dateRangeTitleGenerator:forceUpdateLocale:resultBlock:", a3, a4, 0, a5);
}

- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 forceUpdateLocale:(BOOL)a5 resultBlock:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v7 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  -[PLMonthGroupingRule calendar](self, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedChildHighlightItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && v16)
    {
      objc_msgSend(v18, "earlierDate:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = v11;
      v37 = v10;
      v20 = v7;
      if (v19)
      {
        v21 = v18;

        v16 = v21;
      }
      objc_msgSend(v13, "components:fromDate:", 30, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "components:fromDate:", 30, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "month");
      if (v24 != objc_msgSend(v23, "month"))
      {
        objc_msgSend(v13, "rangeOfUnit:inUnit:forDate:", 16, 8, v16);
        if (v25 - objc_msgSend(v22, "day") <= 5)
        {
          objc_msgSend(v22, "setMonth:", objc_msgSend(v22, "month") + 1);
          objc_msgSend(v22, "setDay:", 10);
        }
        v26 = objc_msgSend(v22, "month");
        if (v26 != objc_msgSend(v23, "month") && objc_msgSend(v23, "day") <= 4)
        {
          objc_msgSend(v23, "setMonth:", objc_msgSend(v23, "month") - 1);
          objc_msgSend(v23, "setDay:", 10);
        }
      }
      objc_msgSend(v13, "dateFromComponents:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateFromComponents:", v23);
      v35 = v22;
      v28 = v16;
      v29 = v18;
      v30 = v23;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "dateRangeTitleWithStartDate:endDate:category:kind:type:options:", v27, v31, 0, 1, 0, v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v32);

      v18 = v29;
      v16 = v28;
      v11 = v36;

      v10 = v37;
    }
    else
    {
      PLMomentsGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v10;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_FAULT, "Cannot generate title, unexpected nil startDate/endDate for: %@", buf, 0xCu);
      }

      v12[2](v12, 0, 0);
    }

  }
  else
  {
    PLMomentsGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v10;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_FAULT, "Cannot generate title, no child highlights for: %@", buf, 0xCu);
    }

    v12[2](v12, 0, 0);
  }

}

- (id)dominantMonthDateComponentForStartDateComponents:(id)a3 endDateComponents:(id)a4 numberOfDaysInMonthOfStartDate:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (a5 - objc_msgSend(v7, "day") >= 5)
    goto LABEL_9;
  v9 = objc_msgSend(v7, "month");
  v10 = objc_msgSend(v8, "month");
  v11 = objc_msgSend(v8, "year");
  v12 = objc_msgSend(v7, "year");
  v13 = v9 - v10 - 12 * (v11 - v12);
  if (v13 < 0)
    v13 = 12 * (v11 - v12) - (v9 - v10);
  if ((unint64_t)v13 < 2)
  {
    v15 = a5 - objc_msgSend(v7, "day");
    if (v15 < objc_msgSend(v8, "day"))
    {
      v16 = v8;
LABEL_10:
      v14 = v16;
      goto LABEL_11;
    }
LABEL_9:
    v16 = v7;
    goto LABEL_10;
  }
  v14 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v14, "setMonth:", objc_msgSend(v14, "month") + 1);
  if (objc_msgSend(v14, "month") >= 13)
  {
    objc_msgSend(v14, "setMonth:", 1);
    objc_msgSend(v14, "setYear:", objc_msgSend(v14, "year") + 1);
  }
LABEL_11:

  return v14;
}

- (BOOL)highlightItem:(id)a3 belongsToHighlightItemList:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "groupingStartDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v7, "groupingEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PLMonthGroupingRule calendar](self, "calendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "groupingStartDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:", 28, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "groupingEndDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:", 28, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:", 28, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:", 28, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = v13;
      v20 = objc_msgSend(v13, "year");
      if (v20 != objc_msgSend(v17, "year"))
      {
        v21 = objc_msgSend(v15, "year");
        if (v21 != objc_msgSend(v19, "year"))
        {
          v34 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      objc_msgSend(v7, "groupingStartDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rangeOfUnit:inUnit:forDate:", 16, 8, v22);
      v24 = v23;

      objc_msgSend(v6, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rangeOfUnit:inUnit:forDate:", 16, 8, v25);
      v27 = v26;

      v43 = v24;
      v45 = v15;
      -[PLMonthGroupingRule dominantMonthDateComponentForStartDateComponents:endDateComponents:numberOfDaysInMonthOfStartDate:](self, "dominantMonthDateComponentForStartDateComponents:endDateComponents:numberOfDaysInMonthOfStartDate:", v46, v15, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLMonthGroupingRule dominantMonthDateComponentForStartDateComponents:endDateComponents:numberOfDaysInMonthOfStartDate:](self, "dominantMonthDateComponentForStartDateComponents:endDateComponents:numberOfDaysInMonthOfStartDate:", v17, v19, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "month");
      if (v30 == objc_msgSend(v29, "month"))
      {
        v31 = objc_msgSend(v28, "year");
        if (v31 == objc_msgSend(v29, "year"))
        {
          v32 = objc_msgSend(v28, "month");
          if (v32 == objc_msgSend(v19, "month"))
          {
            v33 = objc_msgSend(v28, "year");
            if (v33 == objc_msgSend(v19, "year"))
            {
              v34 = 1;
LABEL_17:

              v15 = v45;
              goto LABEL_18;
            }
          }
          v36 = (void *)objc_msgSend(v28, "copy");
          objc_msgSend(v36, "setMonth:", objc_msgSend(v36, "month") + 1);
          objc_msgSend(v36, "setDay:", 0);
          objc_msgSend(v11, "dateFromComponents:", v36);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "endDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "components:fromDate:toDate:options:", 16, v42, v37, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = v43 - objc_msgSend(v17, "day");
          v44 = objc_msgSend(v38, "day");

          v40 = v39;
          v34 = 1;
          if (v40 > 3 || v40 + 1 >= v44)
            goto LABEL_17;
        }
      }
      v34 = 0;
      goto LABEL_17;
    }
  }
  PLMomentsGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v7;
    _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "unexpected nil startDate/endDate for: %@", buf, 0xCu);
  }

  v34 = 0;
LABEL_19:

  return v34;
}

- (BOOL)highlightItemList:(id)a3 canBeMergedWithOtherHighlightItemList:(id)a4
{
  return 0;
}

- (unint64_t)maximumNumberOfHighlightItemsToPromote
{
  if (_os_feature_enabled_impl())
    return 6;
  else
    return 5;
}

- (BOOL)highlightItemHasMinimumRequirementToBePromoted:(id)a3 withSharingConsideration:(int64_t)a4
{
  id v6;
  int v7;
  int v8;
  double v9;
  BOOL v10;
  unint64_t v12;

  v6 = a3;
  v7 = _os_feature_enabled_impl();
  v8 = objc_msgSend(v6, "type");
  if (v7)
  {
    if (v8 == 6 || objc_msgSend(v6, "kind"))
      goto LABEL_10;
  }
  else if (v8 == 3 || objc_msgSend(v6, "type") == 6 || objc_msgSend(v6, "type") == 5)
  {
    goto LABEL_10;
  }
  objc_msgSend(v6, "promotionScore");
  if (v9 > 0.2 && (objc_msgSend(v6, "isRecent") & 1) == 0)
  {
    v12 = -[PLMonthGroupingRule _extendedAssetsCountThresholdForHighlightItem:](self, "_extendedAssetsCountThresholdForHighlightItem:", v6);
    v10 = objc_msgSend(v6, "numberOfAssetsInExtendedForSharingConsideration:", a4) > v12;
    goto LABEL_11;
  }
LABEL_10:
  v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)_extendedAssetsCountThresholdForHighlightItem:(id)a3
{
  id v3;
  int v4;
  int v5;
  _BOOL4 v7;

  v3 = a3;
  v4 = _os_feature_enabled_impl();
  v5 = objc_msgSend(v3, "type");

  v7 = v5 == 4 || (v5 - 1) < 2;
  if (v4)
    v7 = v5 == 5;
  if (v7)
    return 0;
  else
    return 6;
}

- (id)highlightItemsSortedByImportance:(id)a3 withSharingConsideration:(int64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PLMonthGroupingRule_highlightItemsSortedByImportance_withSharingConsideration___block_invoke;
  v8[3] = &__block_descriptor_40_e49_q24__0___PLHighlightItem__8___PLHighlightItem__16l;
  v8[4] = a4;
  objc_msgSend(v6, "sortUsingComparator:", v8);
  return v6;
}

- (id)fallbackHighlightItemFromAllHighlightItems:(id)a3 withSharingConsideration:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__PLMonthGroupingRule_fallbackHighlightItemFromAllHighlightItems_withSharingConsideration___block_invoke;
  v12[3] = &__block_descriptor_40_e44_B24__0___PLHighlightItem__8__NSDictionary_16l;
  v12[4] = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterUsingPredicate:", v8);

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __91__PLMonthGroupingRule_fallbackHighlightItemFromAllHighlightItems_withSharingConsideration___block_invoke_2;
  v11[3] = &__block_descriptor_40_e49_q24__0___PLHighlightItem__8___PLHighlightItem__16l;
  v11[4] = a4;
  objc_msgSend(v6, "sortUsingComparator:", v11);
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
}

BOOL __91__PLMonthGroupingRule_fallbackHighlightItemFromAllHighlightItems_withSharingConsideration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  double v6;
  double v7;

  v3 = a2;
  if ((objc_msgSend(v3, "isRecent") & 1) != 0)
  {
    _os_feature_enabled_impl();
LABEL_3:
    v4 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v3, "promotionScore");
  v7 = v6;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (v7 <= 0.2 || objc_msgSend(v3, "kind"))
      goto LABEL_3;
  }
  else if (v7 <= 0.2 || objc_msgSend(v3, "type") == 6 || objc_msgSend(v3, "type") == 5)
  {
    goto LABEL_3;
  }
  v4 = *(_QWORD *)(a1 + 32) == 2 || objc_msgSend(v3, "numberOfAssetsInExtendedForSharingConsideration:") != 0;
LABEL_4:

  return v4;
}

uint64_t __91__PLMonthGroupingRule_fallbackHighlightItemFromAllHighlightItems_withSharingConsideration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = _os_feature_enabled_impl();
  v8 = objc_msgSend(v5, "type");
  if (v7)
  {
    if (v8 == 6 && objc_msgSend(v6, "type") != 6)
      goto LABEL_12;
    if (objc_msgSend(v5, "type") != 6 && objc_msgSend(v6, "type") == 6)
    {
LABEL_14:
      v10 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    if (v8 == 3 && objc_msgSend(v6, "type") != 3)
      goto LABEL_12;
    if (objc_msgSend(v5, "type") != 3 && objc_msgSend(v6, "type") == 3)
      goto LABEL_14;
  }
  v9 = objc_msgSend(v5, "numberOfAssetsInExtendedForSharingConsideration:", *(_QWORD *)(a1 + 32));
  if (v9 <= objc_msgSend(v6, "numberOfAssetsInExtendedForSharingConsideration:", *(_QWORD *)(a1 + 32)))
  {
    v11 = objc_msgSend(v5, "numberOfAssetsInExtendedForSharingConsideration:", *(_QWORD *)(a1 + 32));
    if (v11 >= objc_msgSend(v6, "numberOfAssetsInExtendedForSharingConsideration:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v5, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "compare:", v13);

      goto LABEL_16;
    }
    goto LABEL_14;
  }
LABEL_12:
  v10 = -1;
LABEL_16:

  return v10;
}

uint64_t __81__PLMonthGroupingRule_highlightItemsSortedByImportance_withSharingConsideration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  _BOOL4 v10;
  int v11;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v17;
  BOOL v18;
  int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;

  v5 = a2;
  v6 = a3;
  v7 = _os_feature_enabled_impl();
  v8 = objc_msgSend(v5, "type");
  v9 = v8;
  if (v7)
  {
    v10 = v8 != 5;
    v11 = objc_msgSend(v6, "type");
    if (v11 == 5 || v10)
      v13 = 1;
    else
      v13 = -1;
    if (((v10 ^ (v11 == 5)) & 1) == 0)
      goto LABEL_34;
LABEL_29:
    v21 = objc_msgSend(v5, "numberOfAssetsInExtendedForSharingConsideration:", *(_QWORD *)(a1 + 32));
    v22 = objc_msgSend(v6, "numberOfAssetsInExtendedForSharingConsideration:", *(_QWORD *)(a1 + 32));
    if (v21 <= v22)
    {
      if (v21 >= v22)
      {
        objc_msgSend(v5, "startDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "startDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v23, "compare:", v24);

      }
      else
      {
        v13 = 1;
      }
    }
    else
    {
      v13 = -1;
    }
    goto LABEL_34;
  }
  v14 = v8 - 3;
  v15 = objc_msgSend(v6, "type");
  v17 = v15 == 4 || (v15 - 1) < 2;
  v18 = v9 == 4 || v14 >= 0xFFFFFFFE;
  v19 = !v18;
  if (v18)
    v20 = v17;
  else
    v20 = 1;
  if (v20)
    v13 = 1;
  else
    v13 = -1;
  if (v17 != v19)
    goto LABEL_29;
LABEL_34:

  return v13;
}

@end

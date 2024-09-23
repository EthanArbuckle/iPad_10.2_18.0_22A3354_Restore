@implementation REMRecurrenceRule(CustomEditorAdditions)

- (uint64_t)isWeekdayRule
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "daysOfTheWeek");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", CFSTR("dayOfTheWeek"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToArray:", &unk_1E67F4540);
  return v3;
}

- (uint64_t)isWeekendRule
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "daysOfTheWeek");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", CFSTR("dayOfTheWeek"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToArray:", &unk_1E67F4558);
  return v3;
}

- (uint64_t)isAnyDayRule
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "daysOfTheWeek");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", CFSTR("dayOfTheWeek"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToArray:", &unk_1E67F4570);
  return v3;
}

- (uint64_t)isSimpleRule
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (!objc_msgSend(a1, "frequency"))
    return 1;
  v5 = objc_msgSend(a1, "frequency");
  if (v5 == 1)
  {
    objc_msgSend(a1, "daysOfTheWeek");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v1, "count") < 2)
    {
      v6 = 1;
LABEL_14:

      return v6;
    }
  }
  v7 = objc_msgSend(a1, "frequency");
  if (v7 != 2
    || (objc_msgSend(a1, "daysOfTheWeek"), v2 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v2, "count")))
  {
    v8 = 0;
    v6 = 0;
    if (objc_msgSend(a1, "frequency") != 3)
      goto LABEL_11;
LABEL_8:
    objc_msgSend(a1, "daysOfTheWeek");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {

      v6 = 0;
      if (!v8)
        goto LABEL_11;
      goto LABEL_10;
    }
    objc_msgSend(a1, "monthsOfTheYear");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {
      objc_msgSend(a1, "weeksOfTheYear");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "count"))
      {
        objc_msgSend(a1, "daysOfTheYear");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v6 = (unint64_t)objc_msgSend(v13, "count") < 2;

        if ((v8 & 1) == 0)
        {
LABEL_11:
          if (v7 != 2)
            goto LABEL_13;
          goto LABEL_12;
        }
LABEL_10:

        goto LABEL_11;
      }

    }
    v6 = 0;
    if ((v8 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(a1, "daysOfTheMonth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    if (objc_msgSend(a1, "frequency") != 3)
    {

      v6 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v8 = 1;
    goto LABEL_8;
  }

  v6 = 1;
LABEL_13:
  if (v5 == 1)
    goto LABEL_14;
  return v6;
}

@end

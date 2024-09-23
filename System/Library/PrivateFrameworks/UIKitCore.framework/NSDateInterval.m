@implementation NSDateInterval

- (BOOL)_intersectsDateComponents:(uint64_t)a3 accuracy:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v22 = 0.0;
    objc_msgSend(v5, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v6, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfUnit:startDate:interval:forDate:", a3, &v21, &v22, v8);
    v10 = v21;

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "calendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__intersectsDateComponents_accuracy_, a1, CFSTR("NSDateInterval+UICalendarAdditions.m"), 41, CFSTR("Unable to calculate range for date %@ in calendar %@ with accuracy %tu."), v19, v20, a3);

    }
    objc_msgSend(v10, "dateByAddingTimeInterval:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "compare:", v11);

    objc_msgSend((id)a1, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "compare:", v14);

    a1 = v15 != 1 && v13 == -1;
  }

  return a1;
}

@end

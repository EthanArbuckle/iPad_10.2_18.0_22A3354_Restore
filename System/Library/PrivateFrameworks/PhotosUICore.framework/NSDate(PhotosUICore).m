@implementation NSDate(PhotosUICore)

- (uint64_t)px_isSameDayAsDate:()PhotosUICore
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:inSameDayAsDate:", a1, v5);

  return v7;
}

- (unint64_t)px_yearsSinceDate:()PhotosUICore
{
  id v5;
  double v6;
  double v7;
  float v8;
  unint64_t v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+PhotosUICore.m"), 23, CFSTR("date cannot be nil"));

  }
  objc_msgSend(a1, "timeIntervalSinceDate:", v5);
  v7 = v6;
  if (v6 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+PhotosUICore.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeInterval >= 0"));

  }
  v8 = v7 / 31557600.0;
  v9 = vcvtas_u32_f32(v8);

  return v9;
}

- (BOOL)px_isWithinTimeInterval:()PhotosUICore sinceDate:
{
  double v5;

  if (!a4)
    return 0;
  objc_msgSend(a1, "timeIntervalSinceDate:");
  return v5 <= a2 && v5 >= 0.0;
}

- (BOOL)px_isBetweenDate:()PhotosUICore andDate:
{
  _BOOL8 v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    v8 = a3;
    objc_msgSend(v8, "earlierDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "laterDate:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "timeIntervalSinceDate:", v9);
    if (v11 >= 0.0)
    {
      objc_msgSend(a1, "timeIntervalSinceDate:", v10);
      v4 = v12 <= 0.0;
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)px_dateTruncatedToCalendarUnit:()PhotosUICore calendar:
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDate+PhotosUICore.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

  }
  if (a3 > 31)
  {
    switch(a3)
    {
      case 32:
        v8 = 62;
        break;
      case 64:
        v8 = 126;
        break;
      case 128:
        v8 = 254;
        break;
      default:
        goto LABEL_20;
    }
  }
  else
  {
    switch(a3)
    {
      case 4:
        v8 = 6;
        break;
      case 8:
        v8 = 14;
        break;
      case 16:
        v8 = 30;
        break;
      default:
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSCalendarUnit _CalendarUnitMaskForCalendarUnit(NSCalendarUnit)");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSDate+PhotosUICore.m"), 102, CFSTR("Code which should be unreachable has been reached"));

        abort();
    }
  }
  objc_msgSend(v7, "components:fromDate:", v8, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "dateFromComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)px_unionStartDate:()PhotosUICore endDate:withDate:
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a5;
  v8 = v7;
  if (v7)
  {
    v13 = v7;
    if (a3)
    {
      if (!*a3)
      {
        v11 = objc_retainAutorelease(v7);
        v8 = v13;
        *a3 = v11;
        if (!a4)
          goto LABEL_11;
LABEL_6:
        if (*a4)
        {
          objc_msgSend(*a4, "laterDate:", v13);
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *a4 = v10;

          v8 = v13;
        }
        else
        {
          v12 = objc_retainAutorelease(v8);
          v8 = v13;
          *a4 = v12;
        }
        goto LABEL_11;
      }
      objc_msgSend(*a3, "earlierDate:", v7);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v9;

      v8 = v13;
    }
    if (!a4)
      goto LABEL_11;
    goto LABEL_6;
  }
LABEL_11:

}

+ (void)px_unionStartDate:()PhotosUICore endDate:withDateInterval:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v7 = a5;
  if (v7)
  {
    v16 = v7;
    if (a3)
    {
      v8 = *a3;
      objc_msgSend(v7, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
      {
        objc_msgSend(v8, "earlierDate:", v9);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a3 = v11;

      }
      else
      {
        *a3 = objc_retainAutorelease(v9);
      }

      v7 = v16;
    }
    if (a4)
    {
      v12 = *a4;
      objc_msgSend(v7, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12)
      {
        objc_msgSend(v12, "laterDate:", v13);
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v15;

      }
      else
      {
        *a4 = objc_retainAutorelease(v13);
      }

      v7 = v16;
    }
  }

}

@end

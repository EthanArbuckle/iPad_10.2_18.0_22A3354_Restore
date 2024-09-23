@implementation NSTimeZone(ICSTranslation)

- (id)ICSComputeTimeZoneChangeListFromDate:()ICSTranslation toDate:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v24;
  ICSTimeZoneChange *v25;
  void *v26;
  void *v27;
  ICSTimeZoneChange *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C99D48]);
  v10 = (void *)objc_msgSend(v9, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v10, "setTimeZone:", a1);
  v32 = v6;
  objc_msgSend(v6, "components");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromComponents:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v7;
  objc_msgSend(v7, "components");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromComponents:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v14 = v13;
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v16 = v15;
  objc_msgSend(v11, "dateByAddingTimeInterval:", 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(a1, "secondsFromGMTForDate:", v17);

  objc_msgSend(a1, "nextDaylightSavingTimeTransitionAfterDate:", v11);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    do
    {
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      v22 = v21;
      if (v21 >= v14 && v21 <= v16)
      {
        objc_msgSend(v20, "dateByAddingTimeInterval:", 1.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(a1, "secondsFromGMTForDate:", v24);

        v25 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:]([ICSTimeZoneChange alloc], "initWithTimeInterval:tzOffsetTo:", v18, v22);
        objc_msgSend(v8, "addObject:", v25);

      }
      if (v22 > v16)
        break;
      objc_msgSend(v20, "dateByAddingTimeInterval:", 1.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nextDaylightSavingTimeTransitionAfterDate:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "compare:", v20) != 1)
      {

        break;
      }

      v20 = v27;
    }
    while (v27);

  }
  if (!objc_msgSend(v8, "count"))
  {
    v28 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:]([ICSTimeZoneChange alloc], "initWithTimeInterval:tzOffsetTo:", v18, 0.0);
    objc_msgSend(v8, "addObject:", v28);

  }
  objc_msgSend(v8, "sortUsingSelector:", sel_compare_);

  return v8;
}

@end

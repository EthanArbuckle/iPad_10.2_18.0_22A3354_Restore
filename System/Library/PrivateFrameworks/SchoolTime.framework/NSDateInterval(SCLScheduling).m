@implementation NSDateInterval(SCLScheduling)

+ (id)SCL_dateIntervalForActiveScheduleOnOrAfterDate:()SCLScheduling calendar:startComponents:endComponents:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "nextDateAfterDate:matchingComponents:options:", v9, v11, 5124);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextDateAfterDate:matchingComponents:options:", v9, v12, 9220);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  while (objc_msgSend(v9, "compare:", v15) != -1 || objc_msgSend(v13, "compare:", v15) != -1)
  {
    objc_msgSend(v10, "nextDateAfterDate:matchingComponents:options:", v15, v11, 9216);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "nextDateAfterDate:matchingComponents:options:", v15, v12, 5120);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "nextDateAfterDate:matchingComponents:options:", v16, v12, 5120);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v17;
    v15 = v18;
    v13 = v16;
    if (objc_msgSend(v17, "compare:", v18) == -1)
    {
      v14 = v17;
      v15 = v18;
      v13 = v16;
      if (objc_msgSend(v17, "compare:", v16) == -1)
      {
        v15 = v17;

        objc_msgSend(v10, "nextDateAfterDate:matchingComponents:options:", v15, v11, 9220);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v17;
      }
    }
  }
  objc_msgSend(v10, "nextDateAfterDate:matchingComponents:options:", v15, v11, 9220);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextDateAfterDate:matchingComponents:options:", v13, v12, 9216);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v19, v20);

  return v21;
}

@end

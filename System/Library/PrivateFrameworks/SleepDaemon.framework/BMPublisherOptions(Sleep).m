@implementation BMPublisherOptions(Sleep)

+ (uint64_t)hdsp_optionsForDateInterval:()Sleep
{
  return objc_msgSend(a1, "hdsp_optionsForDateInterval:reversed:", a3, 0);
}

+ (id)hdsp_optionsForDateInterval:()Sleep reversed:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x24BE0CC98];
  v6 = a3;
  v7 = [v5 alloc];
  if (a4)
  {
    objc_msgSend(v6, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v7;
    v11 = v8;
    v12 = v9;
    v13 = 1;
  }
  else
  {
    objc_msgSend(v6, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v7;
    v11 = v8;
    v12 = v9;
    v13 = 0;
  }
  v14 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v11, v12, 0, 0, v13);

  return v14;
}

@end

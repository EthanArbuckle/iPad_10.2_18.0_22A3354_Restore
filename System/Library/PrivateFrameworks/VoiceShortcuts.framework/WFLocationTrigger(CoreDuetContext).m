@implementation WFLocationTrigger(CoreDuetContext)

- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "startTime");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 1;
  v3 = (void *)v2;
  objc_msgSend(a1, "endTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "isDateWithinTimeRange:", v5);

  return v6;
}

@end

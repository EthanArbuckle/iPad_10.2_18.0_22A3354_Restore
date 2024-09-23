@implementation NSDateComponents(WFAdditions)

+ (id)wf_nowDateComponents
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "components:fromDate:", 3145852, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

@implementation NSError(HDSPWakeUpResultsNotification)

+ (id)hdsp_insufficientSleepDataError
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0FC8];
  v5[0] = CFSTR("Query returned data insufficient to attempt wake up result computation");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("HDSPWakeUpResultsNotificationErrorDomain"), 1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)hdsp_isInsufficientSleepDataError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("HDSPWakeUpResultsNotificationErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 1;
  else
    v3 = 0;

  return v3;
}

@end

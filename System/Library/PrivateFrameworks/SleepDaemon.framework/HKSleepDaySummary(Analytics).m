@implementation HKSleepDaySummary(Analytics)

- (void)hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock:()Analytics
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (objc_msgSend(a1, "containsPeriodsWithAppleSleepTrackingData"))
  {
    objc_msgSend(a1, "periods");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __92__HKSleepDaySummary_Analytics__hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock___block_invoke;
    v6[3] = &unk_24D4E4000;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

@end

@implementation HKSleepDaySummary

void __92__HKSleepDaySummary_Analytics__hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a2;
  if (objc_msgSend(v4, "containsSegmentsWithAppleSleepTrackingData"))
  {
    objc_msgSend(v4, "segments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __92__HKSleepDaySummary_Analytics__hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock___block_invoke_2;
    v5[3] = &unk_24D4E3FD8;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  }
}

void __92__HKSleepDaySummary_Analytics__hdsp_enumerateFirstPartyWatchSleepTrackingSegmentsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "containsAppleSleepTrackingData"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end

@implementation NSDate

void __42__NSDate_HKSPSleep__hksp_latestFromDates___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "hksp_isAfterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __44__NSDate_HKSPSleep__hksp_earliestFromDates___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "hksp_isBeforeDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __50__NSDate_HKSPSleep__hksp_closestFromDates_toDate___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:");
  v5 = fabs(v4);
  if (v5 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }

}

@end

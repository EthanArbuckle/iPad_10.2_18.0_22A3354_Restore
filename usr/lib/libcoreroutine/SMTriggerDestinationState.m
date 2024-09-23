@implementation SMTriggerDestinationState

void __92__SMTriggerDestinationState_RTCoreDataTransformable__createWithSMTriggerDestinationStateMO___block_invoke(uint64_t a1)
{
  void *v2;
  __int16 v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;

  v24 = objc_alloc(MEMORY[0x1E0D8BAA8]);
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier_v2");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v23 = (int)objc_msgSend(*(id *)(a1 + 32), "currentStatus");
  objc_msgSend(*(id *)(a1 + 32), "currentStatusDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastLockDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastUnlockDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(*(id *)(a1 + 32), "predominantModeOfTransport_v2");
  v3 = objc_msgSend(*(id *)(a1 + 32), "numberOfETARetries");
  v4 = objc_msgSend(*(id *)(a1 + 32), "shouldRetryETAQuery");
  objc_msgSend(*(id *)(a1 + 32), "roundTripReminderDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timeToUpdateStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D8BAB0]);
  objc_msgSend(*(id *)(a1 + 32), "upperBoundEtaMapsUpperBoundEta");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "upperBoundEtaCrowFliesUpperBoundEta");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithMapsUpperBoundEta:crowFliesUpperBoundEta:", v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "mapsExpectedTravelTime");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "remainingDistance");
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 32), "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v19) = v4;
  LOWORD(v19) = v3;
  v16 = objc_msgSend(v24, "initWithSessionIdentifier:currentStatus:currentStatusDate:lastLockDate:lastUnlockDate:predominantModeOfTransport:numberOfETARetries:shouldRetryETAQuery:roundTripReminderDate:timeToUpdateStatus:upperBoundEta:mapsExpectedTravelTime:remainingDistance:date:", v25, v23, v22, v21, v2, v20, v12, v14, v19, v5, v6, v10, v15);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

@end

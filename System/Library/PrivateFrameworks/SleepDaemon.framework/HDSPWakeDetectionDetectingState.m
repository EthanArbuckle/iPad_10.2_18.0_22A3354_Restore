@implementation HDSPWakeDetectionDetectingState

void __61___HDSPWakeDetectionDetectingState_wakeupEventDetected_date___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "notifiedState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

void __66___HDSPWakeDetectionDetectingState_earlyWakeUpWasNotifiedRemotely__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "notifiedState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

@end

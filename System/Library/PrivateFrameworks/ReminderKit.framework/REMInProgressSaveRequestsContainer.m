@implementation REMInProgressSaveRequestsContainer

uint64_t __67___REMInProgressSaveRequestsContainer_latestSaveInProgressAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_latestSaveInProgressAccountForObjectID:saveRequest:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __64___REMInProgressSaveRequestsContainer_latestSaveInProgressList___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
}

uint64_t __68___REMInProgressSaveRequestsContainer_latestSaveInProgressReminder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2);
}

uint64_t __89___REMInProgressSaveRequestsContainer_latestSaveInProgressReminderForReminderChangeItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:", *(_QWORD *)(a1 + 40), 0, 0, 0, 0, a2);
}

@end

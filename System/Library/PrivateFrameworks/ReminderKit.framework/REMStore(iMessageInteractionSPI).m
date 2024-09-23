@implementation REMStore(iMessageInteractionSPI)

+ (void)_shouldNotifyReminddOfInteractionWithPeople
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Failed to register shouldNotifyOfInteractionWithPeople with notifyd {status: %d}", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_7();
}

@end

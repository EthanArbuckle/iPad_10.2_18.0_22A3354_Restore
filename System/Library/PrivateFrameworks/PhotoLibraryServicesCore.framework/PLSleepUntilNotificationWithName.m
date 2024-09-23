@implementation PLSleepUntilNotificationWithName

uint64_t __PLSleepUntilNotificationWithName_block_invoke(uint64_t a1)
{
  FILE *v2;
  pid_t v3;
  uint64_t result;

  v2 = (FILE *)*MEMORY[0x1E0C80C10];
  v3 = getpid();
  result = fprintf(v2, "PID %d: Got %s\n", v3, *(const char **)(a1 + 32));
  PLSleepUntilNotificationWithName_waiting = 0;
  return result;
}

@end

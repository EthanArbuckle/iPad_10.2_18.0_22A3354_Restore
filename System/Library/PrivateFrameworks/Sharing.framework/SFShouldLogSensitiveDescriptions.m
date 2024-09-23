@implementation SFShouldLogSensitiveDescriptions

uint64_t __SFShouldLogSensitiveDescriptions_block_invoke()
{
  uint64_t result;

  result = IsAppleInternalBuild();
  if ((_DWORD)result || (result = CFPrefs_GetInt64()) != 0)
    SFShouldLogSensitiveDescriptions_shouldLog = 1;
  return result;
}

@end

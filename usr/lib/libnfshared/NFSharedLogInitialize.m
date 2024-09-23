@implementation NFSharedLogInitialize

os_log_t __NFSharedLogInitialize_block_invoke()
{
  os_log_t result;
  char __str[16];
  __int128 v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _NFSharedLogClient[0] = (uint64_t)os_log_create("com.apple.nfc", "Logging");
  qword_1ECFF6B38 = (uint64_t)os_log_create("com.apple.nfc", "CoreNFC");
  qword_1ECFF6B40 = (uint64_t)os_log_create("com.apple.greentea", "Nfc");
  result = os_log_create("com.apple.nfc", "Accessory");
  qword_1ECFF6B48 = (uint64_t)result;
  if (!_NFSharedSignpostLog)
  {
    LOWORD(v4) = 0;
    v2 = 0u;
    v3 = 0u;
    *(_OWORD *)__str = 0u;
    snprintf(__str, 0x31uLL, "%s.signpost", "com.apple.nfc");
    result = os_log_create(__str, "GeneralSignposts");
    _NFSharedSignpostLog = (uint64_t)result;
  }
  if (!_NFSecondarySignpostLog)
  {
    v3 = 0u;
    v4 = 0u;
    *(_OWORD *)__str = 0u;
    v2 = 0u;
    snprintf(__str, 0x3FuLL, "%s.accessory.signpost", "com.apple.nfc");
    result = os_log_create(__str, "GeneralSignposts");
    _NFSecondarySignpostLog = (uint64_t)result;
  }
  return result;
}

@end

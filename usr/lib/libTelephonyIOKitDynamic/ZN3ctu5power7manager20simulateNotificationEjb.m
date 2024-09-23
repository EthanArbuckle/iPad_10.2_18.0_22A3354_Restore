@implementation ZN3ctu5power7manager20simulateNotificationEjb

ctu::power::manager *___ZN3ctu5power7manager20simulateNotificationEjb_block_invoke(uint64_t a1)
{
  ctu::power::manager *result;

  result = *(ctu::power::manager **)(a1 + 32);
  if (*((_DWORD *)result + 14))
    return (ctu::power::manager *)ctu::power::manager::handlePowerChanged_sync(result, (ctu::power::manager *)*(unsigned int *)(a1 + 40), *(_BYTE *)(a1 + 44));
  return result;
}

@end

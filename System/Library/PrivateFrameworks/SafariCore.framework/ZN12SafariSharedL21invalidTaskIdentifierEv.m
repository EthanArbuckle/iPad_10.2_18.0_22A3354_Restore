@implementation ZN12SafariSharedL21invalidTaskIdentifierEv

uint64_t *___ZN12SafariSharedL21invalidTaskIdentifierEv_block_invoke()
{
  uint64_t *result;

  result = (uint64_t *)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "UIBackgroundTaskInvalid");
  if (result)
    SafariShared::invalidTaskIdentifier(void)::identifer = *result;
  return result;
}

@end

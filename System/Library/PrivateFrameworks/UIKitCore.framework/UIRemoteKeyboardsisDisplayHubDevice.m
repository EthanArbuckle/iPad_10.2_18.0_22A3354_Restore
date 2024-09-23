@implementation UIRemoteKeyboardsisDisplayHubDevice

void ___UIRemoteKeyboardsisDisplayHubDevice_block_invoke()
{
  uint64_t v0;
  const void *v1;

  v0 = MGCopyAnswer();
  if (v0)
  {
    v1 = (const void *)v0;
    if (objc_msgSend(&unk_1E1A94238, "containsObject:", v0))
      byte_1ECD7A2B3 = 1;
    CFRelease(v1);
  }
}

@end

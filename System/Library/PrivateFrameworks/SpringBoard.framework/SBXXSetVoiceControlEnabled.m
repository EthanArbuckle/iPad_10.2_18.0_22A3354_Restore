@implementation SBXXSetVoiceControlEnabled

uint64_t ___SBXXSetVoiceControlEnabled_block_invoke(uint64_t a1)
{
  return +[SBVoiceDisabledBundles setAppDisabledVoiceControl:bundleIdentifier:](SBVoiceDisabledBundles, "setAppDisabledVoiceControl:bundleIdentifier:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end

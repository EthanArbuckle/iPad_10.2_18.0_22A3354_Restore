@implementation SBXXSetWantsVolumeButtonEvents

uint64_t ___SBXXSetWantsVolumeButtonEvents_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)SBApp, "setAppRegisteredForVolumeEvents:isActive:", *(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40) != 0);
}

@end

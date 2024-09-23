@implementation SBContinuitySessionStateRemapReasons

id ___SBContinuitySessionStateRemapReasons_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void **v3;
  int v4;
  void *v5;
  id v6;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("block.embedded-display.uiBlocked")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("block.sos.active")))
  {
    v3 = (void **)MEMORY[0x1E0DAC8A0];
LABEL_12:
    v5 = *v3;
    goto LABEL_13;
  }
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("block.embedded-display.uiUnlocked")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("block.inCall")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("block.keybag-unlocked")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("block.lockScreen.searchPresented")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("block.embedded-display.secureAppUsage")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("block.airplayMirroring")) & 1) != 0
    || (v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("block.userInitiatedRemoteTransientOverlayPresented")),
        v5 = v2,
        v4))
  {
    v3 = (void **)MEMORY[0x1E0DAC898];
    goto LABEL_12;
  }
LABEL_13:
  v6 = v5;

  return v6;
}

@end

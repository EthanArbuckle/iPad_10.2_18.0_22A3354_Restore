@implementation FBSDisplayIdentity(ExtendedDisplayControllerProvider)

- (uint64_t)_sb_supportsExtendedDisplayMode
{
  int v2;
  void *v3;
  void *v4;
  int v5;

  if (objc_msgSend(a1, "connectionType") == 1)
  {
    v2 = 0;
  }
  else
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "externalDisplayDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowWirelessDisplaysForExtendedDisplayMode");

    v2 = v5 ^ 1;
  }
  if (objc_msgSend(a1, "isExternal")
    && objc_msgSend(a1, "isAirPlayDisplay")
    && (objc_msgSend(a1, "isCarDisplay") & 1) == 0
    && ((objc_msgSend(a1, "isCarInstrumentsDisplay") | v2) & 1) == 0)
  {
    return objc_msgSend(a1, "isRootIdentity");
  }
  else
  {
    return 0;
  }
}

@end

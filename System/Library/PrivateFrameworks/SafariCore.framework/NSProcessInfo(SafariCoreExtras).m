@implementation NSProcessInfo(SafariCoreExtras)

- (id)safari_operatingSystemVersionString
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__NSProcessInfo_SafariCoreExtras__safari_operatingSystemVersionString__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = a1;
  if (safari_operatingSystemVersionString_onceToken != -1)
    dispatch_once(&safari_operatingSystemVersionString_onceToken, block);
  return (id)safari_operatingSystemVersionString_osVersionString;
}

- (id)_safari_operatingSystemVersionStringFromOperatingSystemVersion:()SafariCoreExtras
{
  uint64_t v3;
  uint64_t v5;

  v3 = a3[2];
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld.%ld"), *a3, a3[1], v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.%ld"), *a3, a3[1], v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)safari_deviceUDID
{
  if (safari_deviceUDID_onceToken != -1)
    dispatch_once(&safari_deviceUDID_onceToken, &__block_literal_global_25);
  return (id)safari_deviceUDID_udid;
}

- (uint64_t)safari_systemSupportsBookmarkDAVMoves
{
  return 1;
}

@end

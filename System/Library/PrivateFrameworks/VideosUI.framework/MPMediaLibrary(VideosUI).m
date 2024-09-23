@implementation MPMediaLibrary(VideosUI)

- (BOOL)vui_isDeviceMediaLibrary
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == a1;

  return v3;
}

- (uint64_t)vui_isHomeShareMediaLibrary
{
  return objc_msgSend(a1, "vui_isDeviceMediaLibrary") ^ 1;
}

@end

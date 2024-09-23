@implementation ShareSheetDeviceScreenScale

void ___ShareSheetDeviceScreenScale_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 6)
  {
    _ShareSheetDeviceScreenScale_scale = 0x3FF0000000000000;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    _ShareSheetDeviceScreenScale_scale = v2;

  }
}

@end

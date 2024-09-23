@implementation MTMPUDeviceGetGraphicsQuality

void __MTMPUDeviceGetGraphicsQuality_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_graphicsQuality");

  if (v1 == 10)
  {
    v2 = 100;
LABEL_6:
    MTMPUDeviceGetGraphicsQuality_sGraphicsQuality = v2;
    return;
  }
  v2 = 500;
  v3 = MGGetProductType();
  if (v3 == 1517755655 || v3 == 3953847432 || v3 == 1549248876)
    goto LABEL_6;
}

@end

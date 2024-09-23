@implementation UIImageCIImageContent

void __34___UIImageCIImageContent__context__block_invoke()
{
  CGColorSpace *DeviceRGB;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v1 = *MEMORY[0x1E0C9DF50];
  v4[0] = *MEMORY[0x1E0C9DF90];
  v4[1] = v1;
  v5[0] = DeviceRGB;
  v5[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD79548;
  qword_1ECD79548 = v2;

  CGColorSpaceRelease(DeviceRGB);
}

@end

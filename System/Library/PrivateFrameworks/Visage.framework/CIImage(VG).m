@implementation CIImage(VG)

- (id)vg_surfaceWithPixelFormat:()VG colorSpaceName:
{
  __CFString *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGColorSpace *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1, "extent");
  v8 = v7;
  objc_msgSend(a1, "extent");
  v10 = v9;
  v11 = objc_alloc(MEMORY[0x24BDD8DE8]);
  v21[0] = *MEMORY[0x24BDD8D90];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v21[1] = *MEMORY[0x24BDD8D58];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  v21[2] = *MEMORY[0x24BDD8D60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = *MEMORY[0x24BDD8D38];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", VGGetBytesPerElementFromPixelFormat(a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v11, "initWithProperties:", v16);

  v18 = CGColorSpaceCreateWithName(v6);
  v19 = (void *)objc_opt_new();
  objc_msgSend(a1, "extent");
  objc_msgSend(v19, "render:toIOSurface:bounds:colorSpace:", a1, v17, v18);
  CGColorSpaceRelease(v18);

  return v17;
}

@end

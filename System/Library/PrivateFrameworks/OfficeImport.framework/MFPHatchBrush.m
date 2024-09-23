@implementation MFPHatchBrush

+ (id)bitmapNameForHatchStyle:(int)a3
{
  if (a3 > 0x34)
    return 0;
  else
    return off_24F3A58D8[a3];
}

- (MFPHatchBrush)initWithHatchStyle:(int)a3 foreColor:(id)a4 backColor:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OITSUImage *v14;
  objc_super v16;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  +[MFPHatchBrush bitmapNameForHatchStyle:](MFPHatchBrush, "bitmapNameForHatchStyle:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[TCBundleResourceManager instance](TCBundleResourceManager, "instance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataForResource:ofType:inPackage:cacheResult:", v10, CFSTR("bmp"), CFSTR("OAPatterns"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  if (v13)
  {
    v14 = -[OITSUImage initWithData:]([OITSUImage alloc], "initWithData:", v13);
    if (v14)
    {
      v16.receiver = self;
      v16.super_class = (Class)MFPHatchBrush;
      self = -[MFPImageBrush initWithPhoneImage:](&v16, sel_initWithPhoneImage_, v14);
    }

  }
  return self;
}

@end

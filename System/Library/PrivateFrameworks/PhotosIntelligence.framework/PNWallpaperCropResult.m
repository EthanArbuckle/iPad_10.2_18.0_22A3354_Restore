@implementation PNWallpaperCropResult

- (PNWallpaperCropResult)initWithAsset:(id)a3 classification:(unint64_t)a4
{
  id v6;
  PNWallpaperCropResult *v7;
  PNWallpaperCrop *v8;
  PNWallpaperCrop *portraitCrop;
  PNWallpaperCrop *v10;
  PNWallpaperCrop *landscapeCrop;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PNWallpaperCropResult;
  v7 = -[PNWallpaperCropResult init](&v13, sel_init);
  if (v7)
  {
    v8 = -[PNWallpaperCrop initWithAsset:orientation:classification:]([PNWallpaperCrop alloc], "initWithAsset:orientation:classification:", v6, 1, a4);
    portraitCrop = v7->_portraitCrop;
    v7->_portraitCrop = v8;

    v10 = -[PNWallpaperCrop initWithAsset:orientation:classification:]([PNWallpaperCrop alloc], "initWithAsset:orientation:classification:", v6, 2, a4);
    landscapeCrop = v7->_landscapeCrop;
    v7->_landscapeCrop = v10;

  }
  return v7;
}

- (id)cropForOrientation:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[PNWallpaperCropResult landscapeCrop](self, "landscapeCrop");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[PNWallpaperCropResult portraitCrop](self, "portraitCrop");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("portraitCrop");
  -[PNWallpaperCropResult portraitCrop](self, "portraitCrop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("landscapeCrop");
  v10[0] = v4;
  -[PNWallpaperCropResult landscapeCrop](self, "landscapeCrop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PNWallpaperCrop)portraitCrop
{
  return self->_portraitCrop;
}

- (PNWallpaperCrop)landscapeCrop
{
  return self->_landscapeCrop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeCrop, 0);
  objc_storeStrong((id *)&self->_portraitCrop, 0);
}

+ (id)cropScoreSortDescriptorForOrientation:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  if (a3 == 1)
  {
    v5 = CFSTR("cropResult.portraitCrop.cropScore");
  }
  else
  {
    if (a3 != 2)
      return 0;
    v5 = CFSTR("cropResult.landscapeCrop.cropScore");
  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v5, 0, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation BICImageEntry

+ (BOOL)shouldBeRemovedOnPrimaryChanged:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  unsigned int v8;
  BOOL v10;
  BOOL v11;
  unsigned int v12;
  BOOL v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "processingOptions");
  v5 = objc_msgSend(v3, "quality");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataStoreInformation"));
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("https"));

  v8 = objc_msgSend(v3, "quality");
  v10 = (~v4 & 0x220) != 0 || v8 != 2;
  if ((objc_msgSend(v3, "potentialPrimary") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = objc_msgSend(v3, "state");
    v13 = v10 & (v7 ^ 1);
    if (v5 == 3)
      v13 = 0;
    v11 = v12 == 2 && v13;
  }

  return v11;
}

- (CGSize)imageSize
{
  float v3;
  double v4;
  float v5;
  double v6;
  double v7;
  CGSize result;

  -[BICImageEntry width](self, "width");
  v4 = v3;
  -[BICImageEntry height](self, "height");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double v5;

  height = a3.height;
  *(float *)&a3.width = a3.width;
  -[BICImageEntry setWidth:](self, "setWidth:", a3.width);
  *(float *)&v5 = height;
  -[BICImageEntry setHeight:](self, "setHeight:", v5);
}

- (void)deleteEntry
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BICImageEntry managedObjectContext](self, "managedObjectContext"));
  objc_msgSend(v3, "deleteObject:", self);

}

- (id)entryLocationFromParameters
{
  void *v3;
  void *v4;
  id v5;
  float v6;
  double v7;
  float v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageEntry imageSet](self, "imageSet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = -[BICImageEntry level](self, "level");
  -[BICImageEntry width](self, "width");
  v7 = v6;
  -[BICImageEntry height](self, "height");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage entryLocationWithIdentifier:level:size:options:quality:](BICDescribedImage, "entryLocationWithIdentifier:level:size:options:quality:", v4, v5, -[BICImageEntry processingOptions](self, "processingOptions"), -[BICImageEntry quality](self, "quality"), v7, v8));

  return v9;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageEntry expiry](self, "expiry"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageEntry expiry](self, "expiry"));
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 < 0.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end

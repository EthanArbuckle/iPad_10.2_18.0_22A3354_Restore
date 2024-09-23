@implementation BCUPurgeableImage

- (id)initWithData:(id)a3 contentsScale:(double)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  BCUPurgeableImage *v10;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:scale:", v6, a4);

  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "CGImage");
  objc_msgSend(v8, "scale");
  v10 = -[BCUPurgeableImage initWithImage:surface:contentsScale:](self, "initWithImage:surface:contentsScale:", v9, 0);

  return v10;
}

- (BCUPurgeableImage)initWithImage:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "CGImage");
  objc_msgSend(v4, "scale");
  v7 = v6;

  return -[BCUPurgeableImage initWithImage:surface:contentsScale:](self, "initWithImage:surface:contentsScale:", v5, 0, v7);
}

- (id)newImage
{
  id v3;
  id v4;
  void *v5;

  if (!-[BCUPurgeableImage CGImage](self, "CGImage"))
    return 0;
  v3 = objc_alloc((Class)UIImage);
  v4 = -[BCUPurgeableImage CGImage](self, "CGImage");
  -[BCUPurgeableImage contentsScale](self, "contentsScale");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tui_initWithCGImage:scale:", v4));

  return v5;
}

@end

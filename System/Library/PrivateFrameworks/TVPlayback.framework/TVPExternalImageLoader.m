@implementation TVPExternalImageLoader

- (TVPExternalImageLoader)initWithConfig:(id)a3
{
  id v5;
  TVPExternalImageLoader *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *v10;
  NSMutableSet *imageProxies;
  NSMutableDictionary *v12;
  NSMutableDictionary *imageProxyMappings;
  NSMutableSet *v14;
  void *loadedImageActualTimes;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TVPExternalImageLoader;
  v6 = -[TVPExternalImageLoader init](&v17, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "imageNameFormatString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^[^%]*%[.0-9]*d[^%]*$"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "length");
    if (v7 && objc_msgSend(v8, "numberOfMatchesInString:options:range:", v7, 0, 0, v9) == 1)
    {
      objc_storeStrong((id *)&v6->_config, a3);
      v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      imageProxies = v6->_imageProxies;
      v6->_imageProxies = v10;

      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      imageProxyMappings = v6->_imageProxyMappings;
      v6->_imageProxyMappings = v12;

      v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      loadedImageActualTimes = v6->_loadedImageActualTimes;
      v6->_loadedImageActualTimes = v14;
    }
    else
    {
      loadedImageActualTimes = v6;
      v6 = 0;
    }

  }
  return v6;
}

- (void)invalidate
{
  void *v3;
  id v4;

  -[TVPExternalImageLoader imageProxies](self, "imageProxies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TVPExternalImageLoader imageProxyMappings](self, "imageProxyMappings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (double)closestImageTimeForTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  -[TVPExternalImageLoader config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageInterval");
  -[TVPExternalImageLoader closestImageTimeForTime:imageInterval:](self, "closestImageTimeForTime:imageInterval:", a3, v6);
  v8 = v7;

  return v8;
}

- (double)closestImageTimeForTime:(double)a3 imageInterval:(double)a4
{
  double v5;

  v5 = 0.0;
  -[TVPExternalImageLoader _closestImageIndexForTime:actualTime:imageInterval:](self, "_closestImageIndexForTime:actualTime:imageInterval:", &v5, a3, a4);
  return v5;
}

- (id)loadImagesForTimes:(id)a3 maxSize:(CGSize)a4 withHandler:(id)a5
{
  return objc_alloc_init(MEMORY[0x24BDBCEB8]);
}

- (double)firstImageTime
{
  void *v3;
  double v4;
  double v6;

  v6 = 0.0;
  -[TVPExternalImageLoader config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageInterval");
  -[TVPExternalImageLoader _closestImageIndexForTime:actualTime:imageInterval:](self, "_closestImageIndexForTime:actualTime:imageInterval:", &v6, 0.0, v4);

  return v6;
}

- (double)lastImageTime
{
  void *v3;
  double v4;
  double v6;

  v6 = 0.0;
  -[TVPExternalImageLoader config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageInterval");
  -[TVPExternalImageLoader _closestImageIndexForTime:actualTime:imageInterval:](self, "_closestImageIndexForTime:actualTime:imageInterval:", &v6, 1000000.0, v4);

  return v6;
}

- (BOOL)imageIsLoadedForTime:(double)a3
{
  return 0;
}

- (id)loadedImageForTime:(double)a3
{
  return 0;
}

- (unint64_t)_closestImageIndexForTime:(double)a3 actualTime:(double *)a4 imageInterval:(double)a5
{
  unint64_t v5;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;

  if (a3 < 0.0)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[TVPExternalImageLoader config](self, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)objc_msgSend(v9, "imageCount");
  v11 = round(a3 / a5) * a5;
  v12 = vcvtad_u64_f64(v11) / (unint64_t)a5;
  v13 = (double)v12;
  v14 = v10 + -1.0;
  if ((double)v12 >= v10)
    v15 = (unint64_t)v14;
  else
    v15 = v12;
  v5 = v15 + objc_msgSend(v9, "usesOneBasedImageIndexes");
  if (a4)
  {
    v16 = round(v11);
    if (v13 >= v10)
      v16 = v14 * a5;
    *a4 = v16;
  }

  return v5;
}

- (id)_closestURLForImageTime:(double)a3 actualTime:(double *)a4
{
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  -[TVPExternalImageLoader config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageInterval");
  v9 = -[TVPExternalImageLoader _closestImageIndexForTime:actualTime:imageInterval:](self, "_closestImageIndexForTime:actualTime:imageInterval:", a4, a3, v8);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    -[TVPExternalImageLoader config](self, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "imageNameFormatString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%d"), 0, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x24BDD1808]);
      objc_msgSend(v11, "baseURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithURL:resolvingAgainstBaseURL:", v16, 0);

      if (v17)
      {
        objc_msgSend(v17, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "hasSuffix:", CFSTR("/")) & 1) == 0)
        {
          objc_msgSend(v18, "stringByAppendingString:", CFSTR("/"));
          v19 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v19;
        }
        objc_msgSend(v18, "stringByAppendingString:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setPath:", v20);
        objc_msgSend(v17, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (TVPExternalImageConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (NSMutableSet)imageProxies
{
  return self->_imageProxies;
}

- (void)setImageProxies:(id)a3
{
  objc_storeStrong((id *)&self->_imageProxies, a3);
}

- (NSMutableDictionary)imageProxyMappings
{
  return self->_imageProxyMappings;
}

- (void)setImageProxyMappings:(id)a3
{
  objc_storeStrong((id *)&self->_imageProxyMappings, a3);
}

- (NSMutableSet)loadedImageActualTimes
{
  return self->_loadedImageActualTimes;
}

- (void)setLoadedImageActualTimes:(id)a3
{
  objc_storeStrong((id *)&self->_loadedImageActualTimes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedImageActualTimes, 0);
  objc_storeStrong((id *)&self->_imageProxyMappings, 0);
  objc_storeStrong((id *)&self->_imageProxies, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end

@implementation QLDiskCacheEnumerator

+ (double)_expectedThumbnailSizeForRequest:(id)a3
{
  float v3;

  objc_msgSend(a3, "maximumPixelSize");
  return v3;
}

+ (BOOL)cachedThumbnailDataIsLowQuality:(id)a3 forThumbnailRequest:(id)a4
{
  id v5;
  float v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "size");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "_expectedThumbnailSizeForRequest:", v5);
  v9 = v8;

  return vabdd_f64(v7, v9) > 0.001;
}

- (QLDiskCacheEnumerator)initWithDiskCache:(id)a3
{
  id v5;
  QLDiskCacheEnumerator *v6;
  QLDiskCacheEnumerator *v7;

  v5 = a3;
  v6 = -[QLDiskCacheEnumerator init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_diskCache, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end

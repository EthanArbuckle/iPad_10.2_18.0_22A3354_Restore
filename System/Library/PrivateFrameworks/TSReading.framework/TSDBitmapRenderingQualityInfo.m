@implementation TSDBitmapRenderingQualityInfo

- (TSDBitmapRenderingQualityInfo)initWithQuality:(int)a3 canvasScale:(float)a4
{
  TSDBitmapRenderingQualityInfo *v6;
  TSDBitmapRenderingQualityInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDBitmapRenderingQualityInfo;
  v6 = -[TSDBitmapRenderingQualityInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mQuality = a3;
    v6->mCanvasScale = a4;
    v6->mImageMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDBitmapRenderingQualityInfo;
  -[TSDBitmapRenderingQualityInfo dealloc](&v3, sel_dealloc);
}

- (void)cacheProvider:(id)a3 ofSize:(CGSize)a4
{
  double height;
  double width;
  TSDBitmapRenderingQualityImageMapValue *v8;

  height = a4.height;
  width = a4.width;
  v8 = (TSDBitmapRenderingQualityImageMapValue *)-[NSMutableDictionary objectForKey:](self->mImageMap, "objectForKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:"));
  if (!v8)
  {
    v8 = objc_alloc_init(TSDBitmapRenderingQualityImageMapValue);
    -[NSMutableDictionary setObject:forKey:](self->mImageMap, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3));

  }
  -[TSDBitmapRenderingQualityImageMapValue addSize:](v8, "addSize:", width, height);
}

- (CGImage)degradedImageRefForProvider:(id)a3 ofSize:(CGSize)a4
{
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;

  -[TSDBitmapRenderingQualityInfo cacheProvider:ofSize:](self, "cacheProvider:ofSize:", a4.width, a4.height);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->mImageMap, "objectForKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3));
  if (!v6)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBitmapRenderingQualityInfo degradedImageRefForProvider:ofSize:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapRenderingQualityInfo.m"), 80, CFSTR("Bitmap rendering quality info encountered an unprocessed image ref"));
  }
  *(float *)&v7 = self->mCanvasScale;
  return (CGImage *)objc_msgSend(v6, "degradedImageRefForForProvider:quality:canvasScale:", a3, self->mQuality, v7);
}

- (int)quality
{
  return self->mQuality;
}

@end

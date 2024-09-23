@implementation OADImage

- (OADImage)init
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)OADImage;
  return -[OADDrawable initWithPropertiesClass:](&v5, sel_initWithPropertiesClass_, v3);
}

- (id)imageProperties
{
  return self->super.super.mDrawableProperties;
}

- (id)movie
{
  return self->mMovie;
}

- (void)setOle:(id)a3
{
  objc_storeStrong((id *)&self->mOle, a3);
}

- (void)setGeometry:(id)a3
{
  objc_storeStrong((id *)&self->mGeometry, a3);
}

- (id)ole
{
  return self->mOle;
}

- (void)setMovie:(id)a3
{
  objc_storeStrong((id *)&self->mMovie, a3);
}

- (OADImage)initWithBlipRef:(id)a3
{
  id v4;
  OADImage *v5;
  OADImageFill *v6;
  OADStretchTechnique *v7;
  void *v8;

  v4 = a3;
  v5 = -[OADImage init](self, "init");
  if (v5)
  {
    v6 = objc_alloc_init(OADImageFill);
    -[OADImageFill setBlipRef:](v6, "setBlipRef:", v4);
    v7 = objc_alloc_init(OADStretchTechnique);
    -[OADImageFill setTechnique:](v6, "setTechnique:", v7);
    -[OADImage imageProperties](v5, "imageProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImageFill:", v6);

  }
  return v5;
}

- (id)geometry
{
  return self->mGeometry;
}

- (id)createImageFill
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  OADImageFill *v7;
  void *v8;
  void *v9;
  void *v10;

  -[OADImage imageProperties](self, "imageProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMergedWithParent");
  objc_msgSend(v3, "setMergedWithParent:", 0);
  if (objc_msgSend(v3, "hasImageFill"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADImage createImageFill]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADImage.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 81, 0, "An image fill already exists");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(v3, "setMergedWithParent:", v4);
  v7 = objc_alloc_init(OADImageFill);
  -[OADImage imageProperties](self, "imageProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImageFill:", v7);

  +[OADStretchTechnique defaultProperties](OADStretchTechnique, "defaultProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[OADImageFill setTechnique:](v7, "setTechnique:", v10);

  return v7;
}

- (void)createPictureFramePresetGeometry
{
  void *v3;
  void *v4;
  OADPresetShapeGeometry *v5;
  OADShapeGeometry *mGeometry;

  if (self->mGeometry)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADImage createPictureFramePresetGeometry]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADImage.mm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 90, 0, "A geometry already exists");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v5 = objc_alloc_init(OADPresetShapeGeometry);
  mGeometry = self->mGeometry;
  self->mGeometry = &v5->super;

  -[OADShapeGeometry setType:](self->mGeometry, "setType:", 75);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADImage;
  -[OADGraphic description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMovie, 0);
  objc_storeStrong((id *)&self->mOle, 0);
  objc_storeStrong((id *)&self->mGeometry, 0);
}

@end

@implementation PXGCornerMaskPathLibrary

- (PXGCornerMaskPathLibrary)init
{
  PXGCornerMaskPathLibrary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGCornerMaskPathLibrary;
  v2 = -[PXGCornerMaskPathLibrary init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (id)pathForCornerRadius:(double)a3 continuousCorners:(BOOL)a4 screenScale:(double)a5 maskColor:(id)a6
{
  _BOOL8 v7;
  id v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  const CGPath *v23;
  const CGPath *v24;
  CGPath *Mutable;
  _QWORD v27[3];
  CGRect BoundingBox;

  v7 = a4;
  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a3 * a5;
  v12 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3 * a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithObjects:", v14);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = (double)(uint64_t)round((double)(uint64_t)ceil(a3 * 1.528665 + a3 * 1.528665) * a5) * 0.5;
    v18 = (double)(uint64_t)round(v17);
    v19 = (double)(uint64_t)(double)(uint64_t)(2 * llround(v17));
    objc_msgSend(MEMORY[0x1E0DC3508], "px_bezierPathWithRoundedRect:cornerRadius:continuousCorners:", v7, 0.0, 0.0, v19, v19, (double)(uint64_t)v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bezierPathByReversingPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_retainAutorelease(v21);
    v23 = (const CGPath *)objc_msgSend(v22, "CGPath");
    BoundingBox = CGPathGetBoundingBox(v23);
    v24 = CGPathCreateWithRect(BoundingBox, 0);
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, 0, v24);
    CGPathAddPath(Mutable, 0, v23);
    v16 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2C28), "initWithBounds:CGPath:strokeColor:lineWidth:fillColor:drawingMode:", Mutable, 0, v10, 0, 0.0, 0.0, v18, v18, 0.0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v16, v15);
    CGPathRelease(Mutable);
    CGPathRelease(v24);

  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

+ (PXGCornerMaskPathLibrary)sharedLibrary
{
  if (sharedLibrary_onceToken != -1)
    dispatch_once(&sharedLibrary_onceToken, &__block_literal_global_139_194272);
  return (PXGCornerMaskPathLibrary *)(id)sharedLibrary_sharedLibrary;
}

void __41__PXGCornerMaskPathLibrary_sharedLibrary__block_invoke()
{
  PXGCornerMaskPathLibrary *v0;
  void *v1;

  v0 = objc_alloc_init(PXGCornerMaskPathLibrary);
  v1 = (void *)sharedLibrary_sharedLibrary;
  sharedLibrary_sharedLibrary = (uint64_t)v0;

}

@end

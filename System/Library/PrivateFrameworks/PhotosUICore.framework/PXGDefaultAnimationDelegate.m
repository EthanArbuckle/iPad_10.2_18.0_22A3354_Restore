@implementation PXGDefaultAnimationDelegate

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  return a4;
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;

  length = a7.length;
  if (a7.length)
  {
    do
    {
      a5->var0 = 0.0;
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      --length;
    }
    while (length);
  }
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;

  length = a7.length;
  if (a7.length)
  {
    do
    {
      a5->var0 = 0.0;
      a5 = ($225AF24142A77900D29617A74D173C5F *)((char *)a5 + 160);
      --length;
    }
    while (length);
  }
}

+ (PXGDefaultAnimationDelegate)sharedInstance
{
  if (sharedInstance_onceToken_71411 != -1)
    dispatch_once(&sharedInstance_onceToken_71411, &__block_literal_global_71412);
  return (PXGDefaultAnimationDelegate *)(id)sharedInstance_sharedInstance_71413;
}

+ (void)adjustGeometry:(id *)a3 style:(id *)a4 info:(id *)a5 forTextSpriteAnimatingFromAttributes:(id *)a6 toAttributes:(id *)a7 inRootLayout:(id)a8
{
  id v12;
  double y;
  double x;
  CGFloat v15;
  double v16;
  double var2;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  BOOL v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat width;
  CGFloat height;
  float v29;
  double MidX;
  double MidY;
  CGFloat v32;
  float64x2_t v33;
  CGFloat v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v12 = a8;
  x = a6->var3.x;
  y = a6->var3.y;
  v16 = a7->var3.x;
  v15 = a7->var3.y;
  var2 = a7->var2;
  v18 = a6->var2;
  if (objc_msgSend(v12, "userInterfaceDirection") == 1)
  {
    objc_msgSend(v12, "referenceSize");
    x = v19 - x;
    v16 = v19 - v16;
  }
  v20 = fabs(var2 / v18);
  v21 = v20 < INFINITY;
  v22 = v20 <= INFINITY;
  v23 = 1.0;
  if (v21)
    v23 = var2 / v18;
  memset(&v37.c, 0, 32);
  if (v22)
    v24 = v23;
  else
    v24 = var2 / v18;
  *(_OWORD *)&v37.a = 0uLL;
  CGAffineTransformMakeTranslation(&v37, v16, v15);
  v35 = v37;
  CGAffineTransformScale(&v36, &v35, v24, v24);
  v37 = v36;
  v35 = v36;
  CGAffineTransformTranslate(&v36, &v35, -x, -y);
  v37 = v36;
  PXRectWithCenterAndSize();
  v36 = v37;
  v39 = CGRectApplyAffineTransform(v38, &v36);
  v25 = v39.origin.x;
  v26 = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  v29 = a3->var0.var2;
  MidX = CGRectGetMidX(v39);
  v40.origin.x = v25;
  v40.origin.y = v26;
  v40.size.width = width;
  v40.size.height = height;
  MidY = CGRectGetMidY(v40);
  v41.origin.x = v25;
  v41.origin.y = v26;
  v41.size.width = width;
  v41.size.height = height;
  v34 = CGRectGetWidth(v41);
  v42.origin.x = v25;
  v42.origin.y = v26;
  v42.size.width = width;
  v42.size.height = height;
  v32 = CGRectGetHeight(v42);
  v33.f64[0] = v34;
  v33.f64[1] = v32;
  a3->var0.var0 = MidX;
  a3->var0.var1 = MidY;
  a3->var0.var2 = v29;
  *(float32x2_t *)&a3[1].var0.var0 = vcvt_f32_f64(v33);
  a4->var0 = 0.0;

}

void __45__PXGDefaultAnimationDelegate_sharedInstance__block_invoke()
{
  PXGDefaultAnimationDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(PXGDefaultAnimationDelegate);
  v1 = (void *)sharedInstance_sharedInstance_71413;
  sharedInstance_sharedInstance_71413 = (uint64_t)v0;

}

@end

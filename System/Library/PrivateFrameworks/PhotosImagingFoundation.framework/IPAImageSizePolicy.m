@implementation IPAImageSizePolicy

- (PFIntSize_st)integralTransformSize:(CGSize)a3
{
  double v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  PFIntSize_st result;

  -[IPAImageSizePolicy transformSize:](self, "transformSize:", a3.width, a3.height);
  v4 = vcvtad_u64_f64(v3);
  v6 = vcvtad_u64_f64(v5);
  result.height = v6;
  result.width = v4;
  return result;
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double result;
  double v7;
  double v8;

  height = a3.height;
  width = a3.width;
  -[IPAImageSizePolicy transformSize:](self, "transformSize:");
  result = v5 / width;
  v8 = v7 / height;
  if (result >= v8)
    return v8;
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 0;
}

- (BOOL)isOriginalSizePolicy
{
  return 0;
}

- (IPAImageSizePolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IPAImageSizePolicy;
  return -[IPAImageSizePolicy init](&v4, sel_init, a3);
}

+ (id)originalSizePolicy
{
  return (id)objc_opt_new();
}

+ (id)scalePolicyWithScale:(double)a3
{
  IPAScaleImageSizePolicy *v3;

  if (a3 == 1.0)
  {
    +[IPAImageSizePolicy originalSizePolicy](IPAImageSizePolicy, "originalSizePolicy");
    v3 = (IPAScaleImageSizePolicy *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = -[IPAScaleImageSizePolicy initWithScale:]([IPAScaleImageSizePolicy alloc], "initWithScale:", a3);
  }
  return v3;
}

+ (id)bestFitPolicyInSize:(CGSize)a3
{
  return -[IPABestFitImageSizePolicy initWithFitSize:]([IPABestFitImageSizePolicy alloc], "initWithFitSize:", a3.width, a3.height);
}

+ (id)bestFitPolicyInSquare:(double)a3
{
  return (id)objc_msgSend(a1, "bestFitPolicyInSize:", a3, a3);
}

+ (id)bestFitPolicyShortestEdge:(double)a3
{
  return -[IPAShortestEdgeImageSizePolicy initWithShortestEdge:]([IPAShortestEdgeImageSizePolicy alloc], "initWithShortestEdge:", a3);
}

+ (id)bestFitPolicyWithWidth:(double)a3
{
  return -[IPABestFitImageWidthPolicy initWithWidth:]([IPABestFitImageWidthPolicy alloc], "initWithWidth:", a3);
}

+ (id)bestFitPolicyWithHeight:(double)a3
{
  return -[IPABestFitImageHeightPolicy initWithHeight:]([IPABestFitImageHeightPolicy alloc], "initWithHeight:", a3);
}

+ (id)bestFitPolicyThumbnail
{
  return (id)objc_msgSend(a1, "bestFitPolicyInSquare:", 1024.0);
}

+ (id)bestFitPolicyWithTotalPixelCount:(int64_t)a3
{
  return -[IPABestFitTotalPixelCountImageSizePolicy initWithTotalPixelCount:]([IPABestFitTotalPixelCountImageSizePolicy alloc], "initWithTotalPixelCount:", a3);
}

+ (id)bestFitPolicyWithEvenTotalPixelCount:(int64_t)a3
{
  return -[IPABestFitEvenTotalPixelCountImageSizePolicy initWithTotalPixelCount:]([IPABestFitEvenTotalPixelCountImageSizePolicy alloc], "initWithTotalPixelCount:", a3);
}

+ (id)bestFitPolicyWithEvenWidthTotalPixelCount:(int64_t)a3
{
  return -[IPABestFitTotalPixelCountImageSizePolicy initWithTotalPixelCount:]([IPABestFitEvenWidthTotalPixelCountImageSizePolicy alloc], "initWithTotalPixelCount:", a3);
}

+ (id)largestPolicyWithPolicies:(id)a3
{
  id v3;
  IPAAggregateLargestImageSizePolicy *v4;

  v3 = a3;
  v4 = -[IPAAggregateLargestImageSizePolicy initWithPolicies:]([IPAAggregateLargestImageSizePolicy alloc], "initWithPolicies:", v3);

  return v4;
}

+ (id)bestFitPolicyWithNominalShortSide:(int64_t)a3 minLongSide:(int64_t)a4 maxLongSide:(int64_t)a5
{
  return -[IPABestFitShortSideWithLongSideLimit initWithNominalShortSide:minLongSide:maxLongSide:]([IPABestFitShortSideWithLongSideLimit alloc], "initWithNominalShortSide:minLongSide:maxLongSide:", a3, a4, a5);
}

@end

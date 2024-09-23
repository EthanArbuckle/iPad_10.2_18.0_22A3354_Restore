@implementation SXOEmbedVideoResponse

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("HTML")))
  {

    v4 = CFSTR("html");
  }

  return v4;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SXOEmbedVideoResponse width](self, "width");
  v4 = v3;
  -[SXOEmbedVideoResponse height](self, "height");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

@end

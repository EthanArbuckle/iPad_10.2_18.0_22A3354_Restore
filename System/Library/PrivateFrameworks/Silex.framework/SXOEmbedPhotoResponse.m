@implementation SXOEmbedPhotoResponse

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SXOEmbedPhotoResponse width](self, "width");
  v4 = v3;
  -[SXOEmbedPhotoResponse height](self, "height");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

@end

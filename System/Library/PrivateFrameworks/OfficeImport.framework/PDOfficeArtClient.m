@implementation PDOfficeArtClient

- (PDOfficeArtClient)init
{
  PDOfficeArtClient *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDOfficeArtClient;
  result = -[PDOfficeArtClient init](&v3, sel_init);
  if (result)
    result->mInheritedTextStylePlaceholderType = -1;
  return result;
}

- (BOOL)hasPlaceholder
{
  return self->mPlaceholder != 0;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->mPlaceholder, a3);
}

- (id)placeholder
{
  return self->mPlaceholder;
}

- (BOOL)hasBounds
{
  return 0;
}

- (int)inheritedTextStylePlaceholderType
{
  return self->mInheritedTextStylePlaceholderType;
}

- (void)setInheritedTextStylePlaceholderType:(int)a3
{
  self->mInheritedTextStylePlaceholderType = a3;
}

- (void)setImageRecolorInfo:(id)a3
{
  objc_storeStrong((id *)&self->mImageRecolorInfo, a3);
}

- (void)setHasOleChart:(BOOL)a3
{
  self->mHasOleChart = a3;
}

- (void)setIsComment:(BOOL)a3
{
  self->mIsComment = a3;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)imageRecolorInfo
{
  return self->mImageRecolorInfo;
}

- (BOOL)isComment
{
  return self->mIsComment;
}

- (BOOL)hasAnimationInfo
{
  return self->mAnimationInfo != 0;
}

- (void)setAnimationInfo:(id)a3
{
  objc_storeStrong((id *)&self->mAnimationInfo, a3);
}

- (id)animationInfo
{
  return self->mAnimationInfo;
}

- (BOOL)hasOleChart
{
  return self->mHasOleChart;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDOfficeArtClient;
  -[PDOfficeArtClient description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAnimationInfo, 0);
  objc_storeStrong((id *)&self->mPlaceholder, 0);
  objc_storeStrong((id *)&self->mImageRecolorInfo, 0);
}

@end

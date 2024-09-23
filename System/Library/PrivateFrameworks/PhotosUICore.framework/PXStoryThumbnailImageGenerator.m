@implementation PXStoryThumbnailImageGenerator

+ (id)generateImageWithStoryConfiguration:(id)a3 size:(CGSize)a4 displayScale:(double)a5 convertToYUV:(BOOL)a6 storyLoadTimeOut:(double)a7 nonDegradedTimeout:(double)a8
{
  _BOOL4 v10;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  void *v18;

  v10 = a6;
  height = a4.height;
  width = a4.width;
  v15 = objc_allocWithZone((Class)type metadata accessor for StoryThumbnailImageGenerator.Request());
  v16 = a3;
  v17 = sub_1A6DDC970(v16, v10, width, height, a5, a7, a8);
  v18 = (void *)sub_1A6DDC1AC();

  return v18;
}

- (PXStoryThumbnailImageGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StoryThumbnailImageGenerator();
  return -[PXStoryThumbnailImageGenerator init](&v3, sel_init);
}

@end

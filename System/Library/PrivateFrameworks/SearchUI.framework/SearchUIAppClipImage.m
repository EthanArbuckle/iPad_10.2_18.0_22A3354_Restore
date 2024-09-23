@implementation SearchUIAppClipImage

- (SearchUIAppClipImage)initWithSFImage:(id)a3
{
  SearchUIAppClipImage *v3;
  SearchUIAppClipImage *v4;
  double v5;
  double v6;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIAppClipImage;
  v3 = -[SearchUIImage initWithSFImage:](&v9, sel_initWithSFImage_, a3);
  v4 = v3;
  if (v3)
  {
    -[SearchUIImage size](v3, "size");
    if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", 4);
      -[SearchUIAppClipImage setSize:](v4, "setSize:");
    }
  }
  return v4;
}

- (int)defaultCornerRoundingStyle
{
  return 3;
}

- (id)loadImageWithImageData:(id)a3 scale:(double)a4 isDarkStyle:(BOOL)a5
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIAppClipImage;
  -[SearchUIImage loadImageWithImageData:scale:isDarkStyle:](&v9, sel_loadImageWithImageData_scale_isDarkStyle_, a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIImage size](self, "size");
  +[SearchUIWebClipIconImage convertImage:ofSize:withShape:scale:](SearchUIWebClipIconImage, "convertImage:ofSize:withShape:scale:", v6, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

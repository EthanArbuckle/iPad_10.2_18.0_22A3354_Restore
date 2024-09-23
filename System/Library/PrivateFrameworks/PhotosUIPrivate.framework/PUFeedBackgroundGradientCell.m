@implementation PUFeedBackgroundGradientCell

- (PUFeedBackgroundGradientCell)initWithFrame:(CGRect)a3
{
  PUFeedBackgroundGradientCell *v4;
  PUFeedBackgroundGradientCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUFeedBackgroundGradientCell;
  v4 = -[PUFeedBackgroundGradientCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[PUFeedBackgroundGradientCell setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[PUFeedBackgroundGradientCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PUFeedBackgroundGradientCell.m"), 23, CFSTR("The content view must be a UIImageView: %@"), v6);

    }
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudFeedSectionHeaderBackgroundImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setImage:", v8);
  }
  return v5;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

@end

@implementation SearchUILocalImage

- (SearchUILocalImage)initWithSFImage:(id)a3
{
  id v4;
  SearchUILocalImage *v5;
  SearchUILocalImage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUILocalImage;
  v5 = -[SearchUIImage initWithSFImage:](&v8, sel_initWithSFImage_, v4);
  if (v5)
  {
    -[SearchUILocalImage setImageType:](v5, "setImageType:", objc_msgSend(v4, "localImageType"));
    if (-[SearchUILocalImage imageType](v5, "imageType") != 3)
    {
      v6 = 0;
      goto LABEL_6;
    }
    -[SearchUILocalImage setIsTemplate:](v5, "setIsTemplate:", 1);
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  if (-[SearchUILocalImage imageType](self, "imageType", a4, a3) == 3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("yahooFinanceLogo"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "size");
    objc_msgSend(v6, "imageWithBaselineOffsetFromBottom:", v7 * 0.21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int)imageType
{
  return self->_imageType;
}

- (void)setImageType:(int)a3
{
  self->_imageType = a3;
}

@end

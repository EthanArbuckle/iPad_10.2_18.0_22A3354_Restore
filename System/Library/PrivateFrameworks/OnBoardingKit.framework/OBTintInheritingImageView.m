@implementation OBTintInheritingImageView

- (OBTintInheritingImageView)initWithImage:(id)a3 highlightedImage:(id)a4 tintColor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  OBTintInheritingImageView *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "_flatImageWithColor:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)OBTintInheritingImageView;
  v13 = -[OBTintInheritingImageView initWithImage:highlightedImage:](&v15, sel_initWithImage_highlightedImage_, v12, v11);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_originalImage, a3);
    -[OBTintInheritingImageView setTintColor:](v13, "setTintColor:", v10);
  }

  return v13;
}

- (void)setImage:(id)a3
{
  id v5;
  objc_super v6;

  objc_storeStrong((id *)&self->_originalImage, a3);
  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OBTintInheritingImageView;
  -[OBTintInheritingImageView setImage:](&v6, sel_setImage_, v5);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBTintInheritingImageView;
  -[OBTintInheritingImageView tintColorDidChange](&v7, sel_tintColorDidChange);
  -[OBTintInheritingImageView originalImage](self, "originalImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTintInheritingImageView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_flatImageWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)OBTintInheritingImageView;
  -[OBTintInheritingImageView setImage:](&v6, sel_setImage_, v5);

}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setOriginalImage:(id)a3
{
  objc_storeStrong((id *)&self->_originalImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalImage, 0);
}

@end

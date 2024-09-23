@implementation VUIVideosImageView

- (void)setImage:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *flatImage;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIVideosImageView;
  v4 = a3;
  -[VUIVideosImageView setImage:](&v7, sel_setImage_, v4);
  v5 = (UIImage *)objc_msgSend(v4, "copy", v7.receiver, v7.super_class);

  flatImage = self->_flatImage;
  self->_flatImage = v5;

}

- (void)setHighlightOrSelectedImage:(id)a3
{
  objc_storeStrong((id *)&self->_highlightOrSelectedImage, a3);
}

+ (id)imageWithImage:(id)a3 existingImageView:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "setImage:", v5);
  }
  else
  {
    v7 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:", v5);
  }

  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIVideosImageView;
  -[VUIVideosImageView setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[VUIVideosImageView _updateImage](self, "_updateImage");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_selected = a3;
  -[VUIVideosImageView _updateImage](self, "_updateImage");
}

- (void)_updateImage
{
  UIImage **p_highlightOrSelectedImage;
  UIImage *v4;
  objc_super v5;
  objc_super v6;

  p_highlightOrSelectedImage = &self->_highlightOrSelectedImage;
  if (self->_highlightOrSelectedImage)
  {
    if (!self->_selected)
    {
      v6.receiver = self;
      v6.super_class = (Class)VUIVideosImageView;
      if ((-[VUIVideosImageView isHighlighted](&v6, sel_isHighlighted) & 1) == 0)
        p_highlightOrSelectedImage = &self->_flatImage;
    }
    v4 = *p_highlightOrSelectedImage;
    v5.receiver = self;
    v5.super_class = (Class)VUIVideosImageView;
    -[VUIVideosImageView setImage:](&v5, sel_setImage_, v4);
  }
}

- (UIImage)highlightOrSelectedImage
{
  return self->_highlightOrSelectedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightOrSelectedImage, 0);
  objc_storeStrong((id *)&self->_flatImage, 0);
}

@end

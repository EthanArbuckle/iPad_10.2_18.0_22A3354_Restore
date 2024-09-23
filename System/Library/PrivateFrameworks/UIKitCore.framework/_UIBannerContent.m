@implementation _UIBannerContent

+ (_UIBannerContent)bannerContentWithTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setTitle:", v4);

  return (_UIBannerContent *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBannerContent)initWithCoder:(id)a3
{
  id v4;
  _UIBannerContent *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *body;
  uint64_t v10;
  NSString *imageName;
  uint64_t v12;
  UIImage *image;
  uint64_t v14;
  UIColor *backgroundColor;
  uint64_t v16;
  UIColor *contentColor;

  v4 = a3;
  v5 = -[_UIBannerContent init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v8 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
    v10 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v12 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v14 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentColor"));
    v16 = objc_claimAutoreleasedReturnValue();
    contentColor = v5->_contentColor;
    v5->_contentColor = (UIColor *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageName, CFSTR("imageName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentColor, CFSTR("contentColor"));

}

- (UIImage)image
{
  UIImage *image;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  image = self->_image;
  if (!image)
  {
    if (self->_imageName)
    {
      +[UIImage kitImageNamed:](UIImage, "kitImageNamed:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageWithRenderingMode:", 2);
      v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v6 = self->_image;
      self->_image = v5;

      image = self->_image;
    }
    else
    {
      image = 0;
    }
  }
  return image;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void)setContentColor:(id)a3
{
  objc_storeStrong((id *)&self->_contentColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

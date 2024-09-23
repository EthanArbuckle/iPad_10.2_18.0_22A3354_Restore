@implementation REImageImage

- (REImageImage)initWithImage:(id)a3
{
  id v5;
  REImageImage *v6;
  REImageImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REImageImage;
  v6 = -[REImageImage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uiImage, a3);

  return v7;
}

- (id)image
{
  return self->_uiImage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithImage:", self->_uiImage);
}

- (unint64_t)hash
{
  return -[UIImage hash](self->_uiImage, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uiImage");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 == self->_uiImage)
      v7 = 1;
    else
      v7 = -[UIImage isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (REImageImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REImageImage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  REDecodeImage(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REImageImage initWithImage:](self, "initWithImage:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  UIImage *uiImage;
  id v4;
  id v5;

  uiImage = self->_uiImage;
  v4 = a3;
  REEncodeImage(uiImage);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("encodedImage"));

}

- (UIImage)uiImage
{
  return self->_uiImage;
}

- (void)setUiImage:(id)a3
{
  objc_storeStrong((id *)&self->_uiImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiImage, 0);
}

@end

@implementation WBSParsecImageRepresentation

- (WBSParsecImageRepresentation)initWithSFImage:(id)a3
{
  id v5;
  WBSParsecImageRepresentation *v6;
  WBSParsecImageRepresentation *v7;
  WBSParsecImageRepresentation *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSParsecImageRepresentation;
  v6 = -[WBSParsecImageRepresentation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sfImage, a3);
    v8 = v7;
  }

  return v7;
}

- (id)imageWithSession:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "uiScale");
  -[WBSParsecImageRepresentation imageWithScaleFactor:](self, "imageWithScaleFactor:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imageWithScaleFactor:(double)a3
{
  UIImage *image;
  UIImage *v4;

  image = self->_image;
  if (image)
    v4 = image;
  return image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end

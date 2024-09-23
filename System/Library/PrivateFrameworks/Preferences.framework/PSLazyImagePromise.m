@implementation PSLazyImagePromise

+ (id)imagePromiseWithImagePath:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (id)imagePromiseWithImageNamed:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (_QWORD *)objc_opt_new();
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[2];
  v7[2] = v8;

  v10 = (void *)v7[3];
  v7[3] = v5;

  return v7;
}

+ (id)imagePromiseWithLoadBlock:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

- (void)loadImage
{
  void (**loadBlock)(id, SEL);
  UIImage *v4;
  UIImage *image;
  UIImage *v6;
  UIImage *v7;
  NSString *imageName;
  NSBundle *imageBundle;
  void *v10;
  void *v11;
  void *v12;
  UIImage *v13;
  UIImage *v14;
  UIImage *v15;

  if (!self->_imageLoaded)
  {
    loadBlock = (void (**)(id, SEL))self->_loadBlock;
    if (loadBlock)
    {
      loadBlock[2](loadBlock, a2);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      image = self->_image;
      self->_image = v4;

    }
    if (!self->_image)
    {
      if (!self->_imagePath
        || (v6 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithContentsOfFile:", self->_imagePath),
            v7 = self->_image,
            self->_image = v6,
            v7,
            !self->_image))
      {
        imageName = self->_imageName;
        if (imageName)
        {
          imageBundle = self->_imageBundle;
          v10 = (void *)MEMORY[0x1E0CEA638];
          if (imageBundle)
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "traitCollection");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", imageName, imageBundle, v12);
            v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
            v14 = self->_image;
            self->_image = v13;

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", self->_imageName);
            v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
            v11 = self->_image;
            self->_image = v15;
          }

        }
      }
    }
    self->_imageLoaded = 1;
  }
}

- (UIImage)image
{
  if (!self->_imageLoaded)
    -[PSLazyImagePromise loadImage](self, "loadImage");
  return self->_image;
}

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_storeStrong((id *)&self->_imageBundle, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
}

@end

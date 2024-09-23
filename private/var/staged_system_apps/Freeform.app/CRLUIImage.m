@implementation CRLUIImage

+ (id)imageNamed:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v4));

  v7 = objc_msgSend(v5, "initWithUIImage:", v6);
  return v7;
}

- (CRLUIImage)initWithUIImage:(id)a3
{
  id v5;
  CRLUIImage *v6;
  CRLUIImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLUIImage;
  v6 = -[CRLImage init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->mUIImage, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (CRLUIImage)initWithContentsOfFile:(id)a3
{
  id v4;
  id v5;
  CRLUIImage *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)UIImage), "initWithContentsOfFile:", v4);

  v6 = -[CRLUIImage initWithUIImage:](self, "initWithUIImage:", v5);
  return v6;
}

- (CRLUIImage)initWithSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  CRLUIImage *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v6, v7));

  v9 = -[CRLUIImage initWithUIImage:](self, "initWithUIImage:", v8);
  return v9;
}

- (CRLUIImage)initWithSystemImageNamed:(id)a3
{
  void *v4;
  CRLUIImage *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", a3));
  v5 = -[CRLUIImage initWithUIImage:](self, "initWithUIImage:", v4);

  return v5;
}

- (CRLUIImage)initWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4
{
  void *v5;
  CRLUIImage *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage crl_internalSystemImageNamed:pointSize:](UIImage, "crl_internalSystemImageNamed:pointSize:", a3, a4));
  v6 = -[CRLUIImage initWithUIImage:](self, "initWithUIImage:", v5);

  return v6;
}

- (CRLUIImage)initWithPrivateSystemImageNamed:(id)a3
{
  void *v4;
  CRLUIImage *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage crl_internalSystemImageNamed:](UIImage, "crl_internalSystemImageNamed:", a3));
  v5 = -[CRLUIImage initWithUIImage:](self, "initWithUIImage:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Class v4;

  objc_opt_class(self, a2);
  return objc_msgSend([v4 alloc], "initWithUIImage:", self->mUIImage);
}

- (void)dealloc
{
  UIImage *mUIImage;
  objc_super v4;

  mUIImage = self->mUIImage;
  self->mUIImage = 0;

  v4.receiver = self;
  v4.super_class = (Class)CRLUIImage;
  -[CRLImage dealloc](&v4, "dealloc");
}

- (id)UIImage
{
  return self->mUIImage;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  -[UIImage size](self->mUIImage, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)scale
{
  double result;

  -[UIImage scale](self->mUIImage, "scale");
  return result;
}

- (CGImage)CGImage
{
  return -[UIImage CGImage](self->mUIImage, "CGImage");
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  return -[UIImage CGImage](self->mUIImage, "CGImage", a3.width, a3.height);
}

- (int64_t)imageOrientation
{
  return -[UIImage imageOrientation](self->mUIImage, "imageOrientation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mUIImage, 0);
}

@end

@implementation TSUUIImage

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  id v6;

  v6 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v6, "initWithUIImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", a3, a4, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "traitCollection")));
}

- (TSUUIImage)initWithUIImage:(id)a3
{
  TSUUIImage *v4;
  UIImage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSUUIImage;
  v4 = -[TSUImage init](&v7, sel_init);
  if (v4)
  {
    v5 = (UIImage *)a3;
    v4->mUIImage = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (TSUUIImage)initWithData:(id)a3
{
  return -[TSUUIImage initWithUIImage:](self, "initWithUIImage:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", a3));
}

- (TSUUIImage)initWithContentsOfFile:(id)a3
{
  return -[TSUUIImage initWithUIImage:](self, "initWithUIImage:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithContentsOfFile:", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUIImage:", self->mUIImage);
}

- (void)dealloc
{
  objc_super v3;

  self->mUIImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUUIImage;
  -[TSUImage dealloc](&v3, sel_dealloc);
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

@end

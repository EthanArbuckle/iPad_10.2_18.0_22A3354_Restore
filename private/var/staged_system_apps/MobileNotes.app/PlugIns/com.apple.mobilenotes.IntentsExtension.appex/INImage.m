@implementation INImage

+ (id)ic_imageNamed:(id)a3
{
  UIImage *v3;
  UIImage *v4;
  NSData *v5;
  void *v6;
  void *v7;

  v3 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = UIImagePNGRepresentation(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[INImage imageWithImageData:](INImage, "imageWithImageData:", v6));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end

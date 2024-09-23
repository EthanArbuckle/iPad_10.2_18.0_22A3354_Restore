@implementation UIImage

+ (id)th_imageNamed:(id)a3
{
  uint64_t v4;

  v4 = THBundle();
  return +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", a3, v4, 0);
}

@end

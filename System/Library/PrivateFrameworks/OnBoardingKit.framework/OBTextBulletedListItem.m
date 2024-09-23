@implementation OBTextBulletedListItem

- (OBTextBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 accessoryButton:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBTextBulletedListItem;
  return -[OBBulletedListItem initWithTitle:description:image:tintColor:linkButton:](&v7, sel_initWithTitle_description_image_tintColor_linkButton_, a3, a4, a5, 0, a6);
}

- (double)imageSizeForImage:(id)a3
{
  double v3;

  objc_msgSend(a3, "size");
  return v3;
}

- (BOOL)shouldLayoutVertically
{
  return 0;
}

- (double)leadingMargins
{
  return 10.0;
}

- (double)trailingMargins
{
  return 0.0;
}

@end

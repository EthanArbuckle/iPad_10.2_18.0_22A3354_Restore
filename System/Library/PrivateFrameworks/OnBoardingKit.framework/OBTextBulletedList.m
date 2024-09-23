@implementation OBTextBulletedList

- (void)addItemWithTitle:(id)a3 description:(id)a4 accessoryButton:(id)a5
{
  id v8;
  id v9;
  id v10;
  OBTextBulletedListItem *v11;
  void *v12;
  OBTextBulletedListItem *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [OBTextBulletedListItem alloc];
  -[OBTextBulletedList bulletImage](self, "bulletImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[OBTextBulletedListItem initWithTitle:description:image:accessoryButton:](v11, "initWithTitle:description:image:accessoryButton:", v10, v9, v12, v8);

  -[OBTextBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v13);

}

- (double)bulletedListItemSpacing
{
  return 16.0;
}

- (id)bulletImage
{
  void *v2;
  void *v3;
  void *v4;
  CGSize v6;

  v6.width = 8.0;
  v6.height = 8.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, 8.0, 8.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v4;
}

@end

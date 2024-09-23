@implementation FREditorialItemThumbnailCreator

- (id)editorialThumbnailImageWith:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", a3));
  v4 = objc_alloc((Class)UIImage);
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "CGImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v8 = objc_msgSend(v4, "initWithCGImage:scale:orientation:", v6, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_imageThatSuppressesAccessibilityHairlineThickening"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fr_scaledImageWithMaximumSize:", 40.0, 40.0));

  return v10;
}

@end

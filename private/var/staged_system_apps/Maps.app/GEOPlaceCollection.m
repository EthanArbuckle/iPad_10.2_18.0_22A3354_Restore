@implementation GEOPlaceCollection

- (id)joeColorImage
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  UIImage *ImageFromCurrentImageContext;
  void *v8;
  CGSize v10;
  CGRect v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "joeColorForCuratedCollection:", self));

  v5 = kRichPreviewSnapshotSize[0];
  v6 = kRichPreviewSnapshotSize[1];
  v10.width = kRichPreviewSnapshotSize[0];
  v10.height = v6;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  objc_msgSend(v4, "set");
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = v5;
  v11.size.height = v6;
  UIRectFill(v11);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v8;
}

@end

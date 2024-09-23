@implementation MKLookAroundView

- (NSString)locationTitle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  __CFString *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView muninViewState](self, "muninViewState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locationInfo"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationName"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationName"));
  else
    v6 = &stru_1011EB268;

  return (NSString *)v6;
}

- (NSString)locationSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView muninViewState](self, "muninViewState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locationInfo"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "secondaryLocationName"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "secondaryLocationName"));
  else
    v6 = &stru_1011EB268;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localityName"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    if (-[__CFString length](v6, "length"))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR(", ")));

      v6 = (__CFString *)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localityName"));
    v11 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v10));

    v6 = (__CFString *)v11;
  }

  return (NSString *)v6;
}

- (UIImage)snapshotImage
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  CGFloat v9;
  UIImage *ImageFromCurrentImageContext;
  void *v11;
  CGSize v13;

  -[MKLookAroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v9 = v8;
  v13.width = v4;
  v13.height = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);

  -[MKLookAroundView bounds](self, "bounds");
  -[MKLookAroundView drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return (UIImage *)v11;
}

- (NSString)expandedSceneTitle
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView locationTitle](self, "locationTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView locationSubtitle](self, "locationSubtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v3, v4));

  return (NSString *)v5;
}

- (NSString)sceneTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView muninViewState](self, "muninViewState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locationInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localityName"));

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[App switcher title] Look Around — <location>"), CFSTR("localized string not found"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[App switcher title] Look Around"), CFSTR("localized string not found"), 0));
  }

  return (NSString *)v7;
}

@end

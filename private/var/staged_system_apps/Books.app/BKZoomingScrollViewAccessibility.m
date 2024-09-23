@implementation BKZoomingScrollViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKZoomingScrollView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  CGRect v27;
  CGRect v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("visibleBounds")));
  objc_msgSend(v3, "rectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_accessibilityContentSize")));
  objc_msgSend(v12, "sizeValue");
  v14 = v13;
  v16 = v15;

  if (byte_1009F4FA0 == 1)
  {
    v17 = v16 / v11;
    v18 = ceilf(v17);
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.width = v9;
    v27.size.height = v11;
    v19 = CGRectGetMidY(v27) / v16;
  }
  else
  {
    v20 = v14 / v9;
    v18 = ceilf(v20);
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    v19 = CGRectGetMidX(v28) / v14;
  }
  v21 = v19 * (double)(uint64_t)v18;
  v22 = (uint64_t)(float)(floorf(v21) + 1.0);
  v23 = sub_10009A13C(CFSTR("picture.book.scroll.status %ld %ld"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v22, (uint64_t)v18));

  return v25;
}

- (void)accessibilityScrollDownPage
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  byte_1009F4FA0 = 1;
  -[BKZoomingScrollViewAccessibility _bkaxIgnoreNextNotification:](self, "_bkaxIgnoreNextNotification:", UIAccessibilityPageScrolledNotification);
  v5.receiver = self;
  v5.super_class = (Class)BKZoomingScrollViewAccessibility;
  -[BKZoomingScrollViewAccessibility accessibilityScrollDownPage](&v5, "accessibilityScrollDownPage");
  v3 = UIAccessibilityAnnouncementNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollViewAccessibility _accessibilityScrollStatus](self, "_accessibilityScrollStatus"));
  UIAccessibilityPostNotification(v3, v4);

}

- (void)accessibilityScrollUpPage
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  byte_1009F4FA0 = 1;
  -[BKZoomingScrollViewAccessibility _bkaxIgnoreNextNotification:](self, "_bkaxIgnoreNextNotification:", UIAccessibilityPageScrolledNotification);
  v5.receiver = self;
  v5.super_class = (Class)BKZoomingScrollViewAccessibility;
  -[BKZoomingScrollViewAccessibility accessibilityScrollUpPage](&v5, "accessibilityScrollUpPage");
  v3 = UIAccessibilityAnnouncementNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollViewAccessibility _accessibilityScrollStatus](self, "_accessibilityScrollStatus"));
  UIAccessibilityPostNotification(v3, v4);

}

- (void)accessibilityScrollLeftPage
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  byte_1009F4FA0 = 0;
  -[BKZoomingScrollViewAccessibility _bkaxIgnoreNextNotification:](self, "_bkaxIgnoreNextNotification:", UIAccessibilityPageScrolledNotification);
  v5.receiver = self;
  v5.super_class = (Class)BKZoomingScrollViewAccessibility;
  -[BKZoomingScrollViewAccessibility accessibilityScrollLeftPage](&v5, "accessibilityScrollLeftPage");
  v3 = UIAccessibilityAnnouncementNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollViewAccessibility _accessibilityScrollStatus](self, "_accessibilityScrollStatus"));
  UIAccessibilityPostNotification(v3, v4);

}

- (void)accessibilityScrollRightPage
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  byte_1009F4FA0 = 0;
  -[BKZoomingScrollViewAccessibility _bkaxIgnoreNextNotification:](self, "_bkaxIgnoreNextNotification:", UIAccessibilityPageScrolledNotification);
  v5.receiver = self;
  v5.super_class = (Class)BKZoomingScrollViewAccessibility;
  -[BKZoomingScrollViewAccessibility accessibilityScrollRightPage](&v5, "accessibilityScrollRightPage");
  v3 = UIAccessibilityAnnouncementNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKZoomingScrollViewAccessibility _accessibilityScrollStatus](self, "_accessibilityScrollStatus"));
  UIAccessibilityPostNotification(v3, v4);

}

@end

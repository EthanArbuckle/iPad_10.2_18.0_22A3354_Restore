@implementation CarSmallWidgetCollectionViewFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  NSString *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  CGSize v24;
  CGSize v25;

  height = a3.size.height;
  width = a3.size.width;
  v6 = sub_10043379C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v24.width = width;
    v24.height = height;
    v8 = NSStringFromCGSize(v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionViewFlowLayout collectionView](self, "collectionView"));
    objc_msgSend(v10, "bounds");
    v25.width = v11;
    v25.height = v12;
    v13 = NSStringFromCGSize(v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v20 = 138412546;
    v21 = v9;
    v22 = 2112;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange newBoundsSize: %@, collectionViewBounds: %@", (uint8_t *)&v20, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSmallWidgetCollectionViewFlowLayout collectionView](self, "collectionView"));
  objc_msgSend(v15, "bounds");
  v18 = height != v17 || width != v16;

  return v18;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  void *v11;

  v9.receiver = self;
  v9.super_class = (Class)CarSmallWidgetCollectionViewFlowLayout;
  v3 = -[CarSmallWidgetCollectionViewFlowLayout invalidationContextForBoundsChange:](&v9, "invalidationContextForBoundsChange:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setInvalidateFlowLayoutDelegateMetrics:", 1);
  v5 = sub_10043379C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionViewFlowLayout invalidationContextForBoundsChange %@", buf, 0xCu);

  }
  return v4;
}

@end

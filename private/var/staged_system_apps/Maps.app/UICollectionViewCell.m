@implementation UICollectionViewCell

- (void)_maps_setCollectionViewCellBackgroundConfiguration
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1002A9078;
  v3[3] = &unk_1011AF768;
  objc_copyWeak(&v4, &location);
  -[UICollectionViewCell _setBackgroundViewConfigurationProvider:](self, "_setBackgroundViewConfigurationProvider:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)setMaps_suppressBackgroundColors:(BOOL)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1014D2348, v4, (void *)1);

  -[UICollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (BOOL)maps_suppressBackgroundColors
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1014D2348);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end

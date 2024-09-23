@implementation ARParentTechnique

- (CLLocation)vlfLocation
{
  return (CLLocation *)objc_getAssociatedObject(self, off_1014B0418);
}

- (void)setVlfLocation:(id)a3
{
  objc_setAssociatedObject(self, off_1014B0418, a3, (void *)3);
}

- (BOOL)vlfLocalized
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ARParentTechnique vlfLocation](self, "vlfLocation"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)vioThrottled
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, off_1014B5F28);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setVioThrottled:(BOOL)a3
{
  const void *v4;
  id v5;

  v4 = off_1014B5F28;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, v4, v5, (void *)3);

}

@end

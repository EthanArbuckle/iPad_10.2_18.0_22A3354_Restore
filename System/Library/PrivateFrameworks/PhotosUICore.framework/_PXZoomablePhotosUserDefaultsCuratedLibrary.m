@implementation _PXZoomablePhotosUserDefaultsCuratedLibrary

- (NSNumber)preferredIndividualItemsColumnsNumber
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  -[_PXZoomablePhotosUserDefaultsImp defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "allPhotosLemonadePreferredIndividualItemsColumns");
  else
    objc_msgSend(v4, "allPhotosPreferredIndividualItemsColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (void)setPreferredIndividualItemsColumnsNumber:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  -[_PXZoomablePhotosUserDefaultsImp defaults](self, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setAllPhotosLemonadePreferredIndividualItemsColumns:", v4);
  else
    objc_msgSend(v6, "setAllPhotosPreferredIndividualItemsColumns:", v4);

}

@end

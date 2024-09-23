@implementation _PXZoomablePhotosUserDefaultPhotosGrids

- (NSNumber)preferredIndividualItemsColumnsNumber
{
  void *v2;
  void *v3;

  -[_PXZoomablePhotosUserDefaultsImp defaults](self, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosGridPreferredIndividualItemsColumns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setPreferredIndividualItemsColumnsNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_PXZoomablePhotosUserDefaultsImp defaults](self, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhotosGridPreferredIndividualItemsColumns:", v4);

}

@end

@implementation UISheetPresentationController

- (NSArray)_maps_effectiveDetentValues
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UISheetPresentationController _detentValues](self, "_detentValues"));
  v3 = sub_10039DCD4(v2, &stru_1011AF740);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

@end

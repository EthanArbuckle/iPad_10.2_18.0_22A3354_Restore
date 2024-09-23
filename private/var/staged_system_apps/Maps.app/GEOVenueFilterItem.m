@implementation GEOVenueFilterItem

- (id)_maps_alphabeticallySortableObject_name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOVenueFilterItem label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return v3;
}

@end

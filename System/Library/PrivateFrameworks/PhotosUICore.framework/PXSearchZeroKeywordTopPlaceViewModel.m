@implementation PXSearchZeroKeywordTopPlaceViewModel

- (PXSearchZeroKeywordTopPlaceViewModel)initWithTitle:(id)a3 representedObject:(id)a4 fullGeoLocationName:(id)a5 keyAssetLocalIdentifiers:(id)a6 region:(id *)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchZeroKeywordTopPlaceViewModel;
  return -[PXSearchZeroKeywordPlaceViewModel initWithType:title:representedObject:fullGeoLocationName:keyAssetLocalIdentifiers:region:](&v8, sel_initWithType_title_representedObject_fullGeoLocationName_keyAssetLocalIdentifiers_region_, 2, a3, a4, a5, a6);
}

@end

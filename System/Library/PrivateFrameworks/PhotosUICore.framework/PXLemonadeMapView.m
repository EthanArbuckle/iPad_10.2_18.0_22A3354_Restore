@implementation PXLemonadeMapView

+ (id)makeViewWithPhotoLibrary:(id)a3 collection:(id)a4 libraryFilterViewMode:(int64_t)a5 initialCenterCoordinate:(CLLocationCoordinate2D)a6 wantsNearbyAssetsAffordance:(BOOL)a7 enableGridView:(BOOL)a8
{
  double longitude;
  double latitude;
  id v14;
  id v15;
  void *v16;

  longitude = a6.longitude;
  latitude = a6.latitude;
  v14 = a3;
  v15 = a4;
  v16 = _s12PhotosUICore17PXLemonadeMapViewC04makeE012photoLibrary10collection013libraryFilterE4Mode23initialCenterCoordinate27wantsNearbyAssetsAffordance010enableGridE0So16UIViewControllerCSo07PHPhotoH0C_So17PHAssetCollectionCSgSo09PXLibrarykeL0VSo22CLLocationCoordinate2DVS2btFZ_0(v14, a4, a5, a7, a8, latitude, longitude);

  return v16;
}

- (_TtC12PhotosUICore17PXLemonadeMapView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXLemonadeMapView();
  return -[PXLemonadeMapView init](&v3, sel_init);
}

@end

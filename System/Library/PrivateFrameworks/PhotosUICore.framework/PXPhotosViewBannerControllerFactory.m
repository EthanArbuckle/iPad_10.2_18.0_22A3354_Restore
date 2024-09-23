@implementation PXPhotosViewBannerControllerFactory

+ (id)makeBannerControllerForPerson:(id)a3 photosViewModel:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  type metadata accessor for PhotosViewPersonBannerController();
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = (void *)sub_1A6D9D66C(v8, v9);

  return v10;
}

- (PXPhotosViewBannerControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosViewBannerControllerFactory();
  return -[PXPhotosViewBannerControllerFactory init](&v3, sel_init);
}

@end

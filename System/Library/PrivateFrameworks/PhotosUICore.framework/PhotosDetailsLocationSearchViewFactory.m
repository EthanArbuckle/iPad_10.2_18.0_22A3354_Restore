@implementation PhotosDetailsLocationSearchViewFactory

+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_1A687EE8C;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  swift_unknownObjectRetain();
  v10 = _s12PhotosUICore0A32DetailsLocationSearchViewFactoryC06searchF10Controller6assets8delegate10completionSo06UIViewI0CSo13PHFetchResultCySo7PHAssetCG_So08PXPhotoscdE8Delegate_pSgySbcSgtFZ_0(v9, a4, (uint64_t)v7, v8);
  sub_1A686EE5C((uint64_t)v7);

  swift_unknownObjectRelease();
  return v10;
}

- (_TtC12PhotosUICore38PhotosDetailsLocationSearchViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsLocationSearchViewFactory();
  return -[PhotosDetailsLocationSearchViewFactory init](&v3, sel_init);
}

@end

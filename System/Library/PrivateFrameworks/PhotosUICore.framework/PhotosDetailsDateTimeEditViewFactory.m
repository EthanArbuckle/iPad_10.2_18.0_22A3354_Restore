@implementation PhotosDetailsDateTimeEditViewFactory

+ (id)dateTimeViewControllerWithAssets:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  v8 = _s12PhotosUICore0A30DetailsDateTimeEditViewFactoryC04dateeG10Controller6assets10completionSo06UIViewJ0CSo13PHFetchResultCySo7PHAssetCG_ySbctFZ_0(v7, (uint64_t)sub_1A687EE8C, v6);

  swift_release();
  return v8;
}

- (_TtC12PhotosUICore36PhotosDetailsDateTimeEditViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDetailsDateTimeEditViewFactory();
  return -[PhotosDetailsDateTimeEditViewFactory init](&v3, sel_init);
}

@end

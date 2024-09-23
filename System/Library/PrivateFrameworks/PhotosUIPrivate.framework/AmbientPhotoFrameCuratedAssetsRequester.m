@implementation AmbientPhotoFrameCuratedAssetsRequester

- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester *v5;

  v4 = a3;
  v5 = self;
  sub_1AABF0258(v4);

}

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester *v5;

  v4 = a3;
  v5 = self;
  sub_1AABF0478();

}

- (_TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester)init
{
  sub_1AABF06F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester____lazy_storage___smartAlbumDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester____lazy_storage___peoplePickerDataSource));
  sub_1AABF098C((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester_assetsContinuation);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedAssetsRequester_photoLibrary));
}

@end

@implementation AmbientPhotoFrameCuratedPeopleRequester

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC2A128();

}

- (_TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester)init
{
  sub_1AAC2A390();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester____lazy_storage___peoplePickerDataSource));
  sub_1AAC2C80C((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester_assetsContinuation);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate39AmbientPhotoFrameCuratedPeopleRequester_photoLibrary));
}

@end

@implementation AmbientPhotoFramePeoplePickerDataSource

- (id)peopleSuggestionSubtypes
{
  _TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource *v2;
  void *v3;

  v2 = self;
  sub_1AAC2935C();

  sub_1AAB74D50(0, (unint64_t *)&qword_1EEBBB360);
  sub_1AAC29494();
  v3 = (void *)sub_1AB08D6E4();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3
{
  void *v4;
  _TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource *v5;

  v4 = (void *)sub_1AB08D6FC();
  v5 = self;
  sub_1AAC29550(v4);

  swift_bridgeObjectRelease();
}

- (_TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource)initWithPhotoLibrary:(id)a3
{
  _TtC15PhotosUIPrivate39AmbientPhotoFramePeoplePickerDataSource *result;

  AmbientPhotoFramePeoplePickerDataSource.init(photoLibrary:)((uint64_t)a3);
  return result;
}

@end

@implementation AmbientPhotoFrameDataSource

- (_TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4
{
  id v5;
  _TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource *result;

  v5 = a3;
  swift_unknownObjectRetain();
  sub_1AAC353C8((uint64_t)v5, (uint64_t)a4);
  return result;
}

+ (unint64_t)supportedTypes
{
  return 31;
}

- (void)fetchSuggestions
{
  _TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource *v2;

  v2 = self;
  sub_1AAC35578();

}

- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3
{
  _TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource *v4;
  void *v5;
  void *v6;

  sub_1AB08D498();
  v4 = self;
  sub_1AAC36098();
  v6 = v5;

  swift_bridgeObjectRelease();
  return v6;
}

- (id)keyAssetFetchOptions
{
  _TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource *v2;
  id v3;

  v2 = self;
  v3 = sub_1AAC36188();

  return v3;
}

- (void)setupPreviewAssets
{
  _TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource *v2;

  v2 = self;
  sub_1AAC3628C();

}

+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3
{
  id v3;

  sub_1AAC3732C(a3);
  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate27AmbientPhotoFrameDataSource_featuredAssets));
}

@end

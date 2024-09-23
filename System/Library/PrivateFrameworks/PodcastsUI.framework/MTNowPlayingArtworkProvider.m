@implementation MTNowPlayingArtworkProvider

- (id)fetchInfoCenterArtworkWith:(id)a3 at:(double)a4 of:(CGSize)a5 completion:(id)a6
{
  double height;
  double width;
  void *v11;
  uint64_t v12;
  id v13;
  MTNowPlayingArtworkProvider *v14;
  id v15;

  height = a5.height;
  width = a5.width;
  v11 = _Block_copy(a6);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a3;
  v14 = self;
  v15 = NowPlayingArtworkProviderObjCWrapper.fetchInfoCenterArtwork(with:at:of:completion:)(v13, (uint64_t)sub_1DA59AC20, v12, a4, width, height);

  swift_release();
  return v15;
}

- (MTNowPlayingArtworkProvider)init
{
  MTNowPlayingArtworkProvider *result;

  result = (MTNowPlayingArtworkProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___MTNowPlayingArtworkProvider_artworkProvider);
}

@end

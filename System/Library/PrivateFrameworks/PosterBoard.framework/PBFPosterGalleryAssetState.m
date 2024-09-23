@implementation PBFPosterGalleryAssetState

void __57___PBFPosterGalleryAssetState_liveAlwaysPostersPredicate__block_invoke()
{
  void *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;

  if (PBFForceLiveWallpapers())
  {
    v0 = (void *)MEMORY[0x1E0CB3880];
    v1 = 1;
LABEL_6:
    objc_msgSend(v0, "predicateWithValue:", v1);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v2 = PBFDebugLiveWallpapers();
  v0 = (void *)MEMORY[0x1E0CB3880];
  if (!v2)
  {
    v1 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_189);
  v3 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v4 = (void *)liveAlwaysPostersPredicate_liveAlwaysPostersPredicate;
  liveAlwaysPostersPredicate_liveAlwaysPostersPredicate = v3;

}

uint64_t __57___PBFPosterGalleryAssetState_liveAlwaysPostersPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = a2;
  objc_msgSend(v2, "setWithObjects:", CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Earth-Detail"), CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Earth-Full"), CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Moon-Detail"), CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Moon-Full"), CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster:Orrery"), CFSTR("com.apple.WallpaperKit.CollectionsPoster:5010"), CFSTR("com.apple.weather.poster:weather-poster-gallery"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

@end

@implementation AVURLAsset.ProgressiveDownloadObserver

- (void)dealloc
{
  _TtCE18_SonicKit_MusicKitCSo10AVURLAssetP33_74B862D6782B3183FF1D401209C0AA2227ProgressiveDownloadObserver *v2;

  v2 = self;
  sub_24B3D412C();
}

- (void).cxx_destruct
{
  swift_release();
  sub_24B3D4EC0((uint64_t)self+ OBJC_IVAR____TtCE18_SonicKit_MusicKitCSo10AVURLAssetP33_74B862D6782B3183FF1D401209C0AA2227ProgressiveDownloadObserver_continuation, &qword_257975218, (void (*)(uint64_t))sub_24B3D491C);
}

- (void)downloadCompletedWithNotification:(id)a3
{
  sub_24B3D4758(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_24B3D4318);
}

- (void)downloadFailedWithNotification:(id)a3
{
  sub_24B3D4758(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_24B3D446C);
}

- (_TtCE18_SonicKit_MusicKitCSo10AVURLAssetP33_74B862D6782B3183FF1D401209C0AA2227ProgressiveDownloadObserver)init
{
  return (_TtCE18_SonicKit_MusicKitCSo10AVURLAssetP33_74B862D6782B3183FF1D401209C0AA2227ProgressiveDownloadObserver *)sub_24B3D47F8();
}

@end

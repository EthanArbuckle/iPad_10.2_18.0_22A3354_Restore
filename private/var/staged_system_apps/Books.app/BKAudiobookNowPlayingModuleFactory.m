@implementation BKAudiobookNowPlayingModuleFactory

+ (id)instantiate
{
  return (id)sub_1003B0D10(0x657263736C6C7566, (void *)0xEA00000000006E65, (uint64_t (*)(_QWORD))type metadata accessor for AudiobookNowPlayingFullscreenTouchViewController, (uint64_t (*)(id, uint64_t, uint64_t, id, uint64_t, id))sub_1003B05BC);
}

+ (id)fetchOrCreateMiniPlayer
{
  void *v2;

  v2 = (void *)sub_1003B0800();
  if (!v2)
    v2 = (void *)sub_1003B0D10(1768843629, (void *)0xE400000000000000, type metadata accessor for AudiobookNowPlayingMiniTouchViewController, (uint64_t (*)(id, uint64_t, uint64_t, id, uint64_t, id))sub_1003AFC04);
  return v2;
}

+ (id)currentMiniPlayer
{
  return (id)sub_1003B0800();
}

- (BKAudiobookNowPlayingModuleFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[BKAudiobookNowPlayingModuleFactory init](&v3, "init");
}

@end

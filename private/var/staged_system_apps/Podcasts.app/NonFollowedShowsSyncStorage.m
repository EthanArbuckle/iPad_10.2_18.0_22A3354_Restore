@implementation NonFollowedShowsSyncStorage

- (_TtC8Podcasts27NonFollowedShowsSyncStorage)init
{
  return (_TtC8Podcasts27NonFollowedShowsSyncStorage *)sub_100179674();
}

- (void).cxx_destruct
{

  sub_10003D380((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts27NonFollowedShowsSyncStorage_fetchNonFollowedShows));
  sub_10003D380((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts27NonFollowedShowsSyncStorage_podcastsStateCoordinator));
}

+ (void)resetNonFollowedShowsSync
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = type metadata accessor for SyncKeysRepository(0);
  v3 = (void *)static SyncKeysRepository.shared.getter(v2);
  SyncKeysRepository.nonFollowedShowsLastSyncTimestamp.setter(0, 1);

  v5 = (void *)static SyncKeysRepository.shared.getter(v4);
  SyncKeysRepository.nonFollowedShowsSyncVersion.setter(0, 0);

  v7 = (id)static SyncKeysRepository.shared.getter(v6);
  SyncKeysRepository.isNonFollowedShowsSyncDirty.setter(1);

}

@end

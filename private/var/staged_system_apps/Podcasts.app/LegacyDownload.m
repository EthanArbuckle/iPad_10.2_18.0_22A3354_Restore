@implementation LegacyDownload

- (NSString)episodeGuid
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->episodeGuid[8];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->episodeGuid[8]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setEpisodeGuid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = *(_QWORD *)&self->episodeGuid[8];
  *(_QWORD *)self->episodeGuid = v4;
  *(_QWORD *)&self->episodeGuid[8] = v5;
  v7 = swift_retain(self);
  swift_release(v7);
  swift_bridgeObjectRelease(v6);
}

- (NSNumber)storeCollectionIdentifier
{
  return (NSNumber *)*(id *)self->storeCollectionIdentifier;
}

- (void)setStoreCollectionIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)self->storeCollectionIdentifier;
  *(_QWORD *)self->storeCollectionIdentifier = a3;
  v3 = a3;

}

- (NSNumber)storeItemId
{
  return (NSNumber *)*(id *)self->storeItemId;
}

- (void)setStoreItemId:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)self->storeItemId;
  *(_QWORD *)self->storeItemId = a3;
  v3 = a3;

}

- (NSString)podcastUuid
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->podcastUuid[8];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->podcastUuid[8]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setPodcastUuid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = *(_QWORD *)&self->podcastUuid[8];
  *(_QWORD *)self->podcastUuid = v4;
  *(_QWORD *)&self->podcastUuid[8] = v5;
  v7 = swift_retain(self);
  swift_release(v7);
  swift_bridgeObjectRelease(v6);
}

- (NSString)episodeUuid
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->episodeUuid[8];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->episodeUuid[8]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setEpisodeUuid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = *(_QWORD *)&self->episodeUuid[8];
  *(_QWORD *)self->episodeUuid = v4;
  *(_QWORD *)&self->episodeUuid[8] = v5;
  v7 = swift_retain(self);
  swift_release(v7);
  swift_bridgeObjectRelease(v6);
}

- (int64_t)downloadBytes
{
  return *(_QWORD *)self->downloadBytes;
}

- (void)setDownloadBytes:(int64_t)a3
{
  *(_QWORD *)self->downloadBytes = a3;
}

- (int64_t)downloadPhase
{
  return *(_QWORD *)self->downloadPhase;
}

- (void)setDownloadPhase:(int64_t)a3
{
  *(_QWORD *)self->downloadPhase = a3;
}

- (double)downloadProgress
{
  return *(double *)self->downloadProgress;
}

- (void)setDownloadProgress:(double)a3
{
  *(double *)self->downloadProgress = a3;
}

- (double)downloadRemainingTime
{
  return *(double *)self->downloadRemainingTime;
}

- (void)setDownloadRemainingTime:(double)a3
{
  *(double *)self->downloadRemainingTime = a3;
}

- (BOOL)isPaused
{
  return self->isPaused[0];
}

- (void)setPaused:(BOOL)a3
{
  self->isPaused[0] = a3;
}

- (BOOL)isPausable
{
  return 1;
}

- (id)downloadDescription
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->description[15];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->description[15]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)percentComplete
{
  return *(double *)self->downloadProgress;
}

- (int64_t)phase
{
  return sub_1001997EC();
}

@end

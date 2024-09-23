@implementation JobPipelineInMemoryStorage

- (id)downloadForEpisodeWithUuid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain();
  v7 = (void *)sub_100379FD8(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (int64_t)indexForDownload:(id)a3
{
  int64_t v5;

  swift_unknownObjectRetain(a3);
  swift_retain();
  v5 = sub_10037A2DC(a3);
  swift_unknownObjectRelease(a3);
  swift_release(self);
  return v5;
}

- (id)downloadAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  swift_retain();
  sub_10037A5A4(a3);
  v6 = v5;
  swift_release(self);
  return v6;
}

- (int64_t)numberOfDownloads
{
  uint64_t v3;
  int64_t v4;
  uint64_t v6;
  _BYTE v7[24];

  objc_msgSend(*(id *)self->lock, "lock", swift_retain(self).n128_f64[0]);
  swift_beginAccess(self->pipelines, v7, 0, 0);
  v3 = *(_QWORD *)self->pipelines;
  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0)
      v6 = *(_QWORD *)self->pipelines;
    else
      v6 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(_QWORD *)self->pipelines);
    v4 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  objc_msgSend(*(id *)self->lock, "unlock");
  swift_release(self);
  return v4;
}

- (int64_t)numberOfDownloadsFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain();
  v7 = sub_10037A7EC(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  return v7;
}

@end

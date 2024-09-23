@implementation GKAppMetadataFetcher

+ (id)createFor:(id)a3 language:(id)a4 bag:(id)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = a5;
  v15 = sub_100166F40(v8, v10, v11, v13, v14);

  swift_bridgeObjectRelease(v13, v16);
  swift_bridgeObjectRelease(v10, v17);
  return v15;
}

- (void)fetchWithBundleIDs:(NSArray *)a3 adamIDs:(NSArray *)a4 batchSize:(int64_t)a5 ttl:(double)a6 refreshExpiredCompletion:(id)a7 completionHandler:
{
  const void *v7;
  const void *v8;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *v18;
  GKAppMetadataFetcher *v19;

  v8 = v7;
  v14 = _Block_copy(a7);
  v15 = _Block_copy(v8);
  v16 = swift_allocObject(&unk_1002C58F0, 72, 7);
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  *(_QWORD *)(v16 + 32) = a5;
  *(double *)(v16 + 40) = a6;
  *(_QWORD *)(v16 + 48) = v14;
  *(_QWORD *)(v16 + 56) = v15;
  *(_QWORD *)(v16 + 64) = self;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1001C15C4((uint64_t)&unk_100314E70, v16);
}

- (GKAppMetadataFetcher)init
{
  AppMetadataFetcher.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_100161FE0((Class *)((char *)&self->super.isa + OBJC_IVAR___GKAppMetadataFetcher_network));

}

@end

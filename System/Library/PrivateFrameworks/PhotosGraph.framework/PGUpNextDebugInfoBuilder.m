@implementation PGUpNextDebugInfoBuilder

- (BOOL)wantsVerboseDebugInfo
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_wantsVerboseDebugInfo;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsVerboseDebugInfo:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_wantsVerboseDebugInfo;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)inputDebugInfo
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setInputDebugInfo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1CA85B534();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_inputDebugInfo);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)rootMemoryIsAggregation
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_rootMemoryIsAggregation;
  swift_beginAccess();
  return *v2;
}

- (void)setRootMemoryIsAggregation:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_rootMemoryIsAggregation;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)rootMemoryNodeUniqueIdentifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_rootMemoryNodeUniqueIdentifier;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setRootMemoryNodeUniqueIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1CA85B534();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_rootMemoryNodeUniqueIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)momentUUIDs
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_momentUUIDs);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setMomentUUIDs:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_1CA85B7B0();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_momentUUIDs);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)featureWeightVectors
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_featureWeightVectors);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  sub_1CA2FDBAC();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setFeatureWeightVectors:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1CA2FDBAC();
    v3 = sub_1CA85B7B0();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_featureWeightVectors);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (_TtC11PhotosGraph24PGUpNextDebugInfoBuilder)init
{
  return (_TtC11PhotosGraph24PGUpNextDebugInfoBuilder *)PGUpNextDebugInfoBuilder.init()();
}

- (void)addSuggestionFilteringLog:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _TtC11PhotosGraph24PGUpNextDebugInfoBuilder *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = sub_1CA85B534();
  v6 = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____TtC11PhotosGraph24PGUpNextDebugInfoBuilder_suggestionFilteringLogs);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1CA26BCE4(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1CA26BCE4((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = v4;
  v13[5] = v6;
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (NSString)debugInfo
{
  _TtC11PhotosGraph24PGUpNextDebugInfoBuilder *v2;
  void *v3;

  v2 = self;
  PGUpNextDebugInfoBuilder.debugInfo.getter();

  v3 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

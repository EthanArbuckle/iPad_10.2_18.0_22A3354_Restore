@implementation SwiftVideoProcessor

- (id)validationCallback
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SwiftVideoProcessor_validationCallback);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2443BC6FC;
  aBlock[3] = &block_descriptor_12;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setValidationCallback:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  SwiftVideoProcessor *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_2443C3354;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_2443C26F8((uint64_t)v7, v6);
  sub_2443C27EC((uint64_t)v7);

}

- (BOOL)inTestingMode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_inTestingMode;
  swift_beginAccess();
  return *v2;
}

- (void)setInTestingMode:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_inTestingMode;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)debugMode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_debugMode;
  swift_beginAccess();
  return *v2;
}

- (void)setDebugMode:(BOOL)a3
{
  BOOL *v5;
  char *v6;

  v5 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_debugMode;
  swift_beginAccess();
  *v5 = a3;
  v6 = (char *)self + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  swift_beginAccess();
  v6[5] = a3;
}

- (BOOL)copySourceOnlyDebugging
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging;
  swift_beginAccess();
  return *v2;
}

- (void)setCopySourceOnlyDebugging:(BOOL)a3
{
  BOOL *v5;
  char *v6;

  v5 = (BOOL *)self + OBJC_IVAR___SwiftVideoProcessor_copySourceOnlyDebugging;
  swift_beginAccess();
  *v5 = a3;
  v6 = (char *)self + OBJC_IVAR___SwiftVideoProcessor_bufferConstants;
  swift_beginAccess();
  v6[7] = a3;
}

- (SwiftVideoProcessor)init
{
  return (SwiftVideoProcessor *)VideoProcessor.init()();
}

- (void)processSurfaceWithSourceSurface:(__IOSurface *)a3 timestamp:(double)a4 destinationSurface:(__IOSurface *)a5 options:(id)a6
{
  __IOSurface *v10;
  __IOSurface *v11;
  id v12;
  SwiftVideoProcessor *v13;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  VideoProcessor.processSurface(sourceSurface:timestamp:destinationSurface:options:)(v10, a4, v11, (NSDictionary)v12);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_2443C27EC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SwiftVideoProcessor_validationCallback));
}

@end

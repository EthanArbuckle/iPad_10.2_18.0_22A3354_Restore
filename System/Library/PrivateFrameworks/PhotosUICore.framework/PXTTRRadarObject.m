@implementation PXTTRRadarObject

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  PXTTRRadarObject *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1A7216DA4(a3);
  swift_unknownObjectRelease();

}

- (PXTTRRadarObject)init
{
  return (PXTTRRadarObject *)TTRRadarObject.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A67EC02C((uint64_t)self + OBJC_IVAR___PXTTRRadarObject_preflightScreenshotURL, (uint64_t)&qword_1EE8C2740, (uint64_t)MEMORY[0x1E0CAFFF8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1A67ECCF8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  PXTTRRadarObject *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  TTRRadarObject.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1A7AE4D9C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

@end

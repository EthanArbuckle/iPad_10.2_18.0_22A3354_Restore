@implementation SecureCaptureSceneExtension

+ (id)clientSettingsExtensions
{
  uint64_t v2;
  void *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575130F8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_245BD9E50;
  *(_QWORD *)(v2 + 32) = type metadata accessor for SecureCaptureSessionPathSettingsExtension();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575130F0);
  v3 = (void *)sub_245BD8B4C();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)hostComponents
{
  void *v2;

  if (sub_245BCC774())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575130F0);
    v2 = (void *)sub_245BD8B4C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_TtC16SecureCaptureKit27SecureCaptureSceneExtension)init
{
  return (_TtC16SecureCaptureKit27SecureCaptureSceneExtension *)sub_245BCC030(self, (uint64_t)a2, type metadata accessor for SecureCaptureSceneExtension);
}

@end

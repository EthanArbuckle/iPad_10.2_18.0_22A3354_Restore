@implementation PommesRenderOptions

- (_TtC21SiriInformationSearch19PommesRenderOptions)init
{
  uint64_t ObjectType;
  _TtC21SiriInformationSearch19PommesRenderOptions *v3;

  ObjectType = swift_getObjectType();
  v3 = (_TtC21SiriInformationSearch19PommesRenderOptions *)(*(uint64_t (**)(uint64_t (*)(), _QWORD))(ObjectType + 128))(AudioExperience.Builder.serverAudioResults.modify, 0);
  swift_deallocPartialClassInstance();
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch19PommesRenderOptions)initWithCoder:(id)a3
{
  id v3;
  _TtC21SiriInformationSearch19PommesRenderOptions *v4;

  v3 = a3;
  v4 = (_TtC21SiriInformationSearch19PommesRenderOptions *)specialized PommesRenderOptions.init(coder:)(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21SiriInformationSearch19PommesRenderOptions *v5;

  v4 = a3;
  v5 = self;
  PommesRenderOptions.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  outlined destroy of ClientExperienceSignals?((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_switchProfile, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  swift_bridgeObjectRelease();
}

@end

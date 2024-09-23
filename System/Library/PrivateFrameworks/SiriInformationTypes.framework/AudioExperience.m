@implementation AudioExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch15AudioExperience)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch15AudioExperience *)AudioExperience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21SiriInformationSearch15AudioExperience *v5;

  v4 = a3;
  v5 = self;
  AudioExperience.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioUnderstanding;
  v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_playbackSignals;
  v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioClientComponent;
  v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  outlined destroy of ClientExperienceSignals?((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);

}

@end

@implementation GenericExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch17GenericExperience)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch17GenericExperience *)GenericExperience.init(coder:)((char *)a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21SiriInformationSearch17GenericExperience *v5;

  v4 = a3;
  v5 = self;
  GenericExperience.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined destroy of ClientExperienceSignals?((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_serverSuggestions, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
  outlined destroy of ClientExperienceSignals?((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_sageExperience, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SageExperience?);
}

@end

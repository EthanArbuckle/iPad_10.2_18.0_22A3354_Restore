@implementation PommesResponse

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static PommesResponse.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static PommesResponse.supportsSecureCoding = a3;
}

- (_TtC21SiriInformationSearch14PommesResponse)initWithCoder:(id)a3
{
  uint64_t ObjectType;
  id v5;
  _TtC21SiriInformationSearch14PommesResponse *v6;
  _BYTE v8[328];
  _BYTE __src[321];

  ObjectType = swift_getObjectType();
  memset(__src, 0, 24);
  *(_QWORD *)&__src[24] = 0xF000000000000000;
  memset(&__src[32], 0, 17);
  memset(&__src[56], 0, 24);
  *(_OWORD *)&__src[80] = xmmword_246451590;
  *(_QWORD *)&__src[96] = 0xF000000000000000;
  __src[104] = 0;
  memset(&__src[112], 0, 48);
  *(_WORD *)&__src[160] = 255;
  memset(&__src[168], 0, 32);
  *(_QWORD *)&__src[200] = MEMORY[0x24BEE4AF8];
  memset(&__src[208], 0, 18);
  memset(&__src[232], 0, 40);
  *(_OWORD *)&__src[272] = xmmword_246451590;
  *(_QWORD *)&__src[288] = 0xF000000000000000;
  memset(&__src[296], 0, 25);
  v5 = a3;
  closure #1 in PommesResponse.init(coder:)((uint64_t)__src, v5);
  memcpy(v8, __src, 0x141uLL);
  v6 = (_TtC21SiriInformationSearch14PommesResponse *)(*(uint64_t (**)(_BYTE *))(ObjectType + 312))(v8);

  swift_deallocPartialClassInstance();
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC21SiriInformationSearch14PommesResponse *v5;

  v4 = a3;
  v5 = self;
  PommesResponse.encode(with:)((NSCoder)v4);

}

- (NSString)description
{
  _TtC21SiriInformationSearch14PommesResponse *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = PommesResponse.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x24955A5F0](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC21SiriInformationSearch14PommesResponse)init
{
  _TtC21SiriInformationSearch14PommesResponse *result;

  result = (_TtC21SiriInformationSearch14PommesResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext), *(_QWORD *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog), *(_QWORD *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog]);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log), *(_QWORD *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of PommesCandidateId?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId), *(_QWORD *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId], *(_QWORD *)&self->clientResults[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId], *(_QWORD *)&self->conversationContext[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId], self->conversationContext[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 8]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses), *(_QWORD *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses]);
  outlined consume of Data._Representation?(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse), *(_QWORD *)&self->experiences[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse]);

  swift_bridgeObjectRelease();
}

@end

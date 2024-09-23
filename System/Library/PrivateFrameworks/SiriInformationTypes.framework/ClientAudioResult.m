@implementation ClientAudioResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch17ClientAudioResult)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch17ClientAudioResult *)ClientAudioResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  _TtC21SiriInformationSearch17ClientAudioResult *v7;

  v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult);
  v5 = a3;
  v7 = self;
  v6 = (void *)MEMORY[0x24955A5F0](0xD000000000000010, 0x8000000246453520);
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v6);

  PommesResult.encode(with:)((NSCoder)v5);
}

- (NSString)description
{
  _TtC21SiriInformationSearch17ClientAudioResult *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = ClientAudioResult.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x24955A5F0](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult));
}

@end

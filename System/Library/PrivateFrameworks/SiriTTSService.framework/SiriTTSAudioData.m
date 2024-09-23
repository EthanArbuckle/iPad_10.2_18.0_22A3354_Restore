@implementation SiriTTSAudioData

- (AudioStreamBasicDescription)asbd
{
  AudioStreamBasicDescription *result;
  __int128 v5;
  __int128 v6;
  Float64 v7;
  __int128 v8;
  __int128 v9;

  sub_19AD589B4((uint64_t)&v7);
  v5 = v8;
  v6 = v9;
  retstr->mSampleRate = v7;
  *(_OWORD *)&retstr->mFormatID = v5;
  *(_OWORD *)&retstr->mBytesPerFrame = v6;
  return result;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  Float64 mSampleRate;
  __int128 v5;
  __int128 v6;

  mSampleRate = a3->mSampleRate;
  v3 = *(_OWORD *)&a3->mBytesPerFrame;
  v5 = *(_OWORD *)&a3->mFormatID;
  v6 = v3;
  sub_19AD58A40((uint64_t)&mSampleRate);
}

- (NSData)audioData
{
  return (NSData *)sub_19AD58D7C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19AD58B10);
}

- (void)setAudioData:(id)a3
{
  sub_19AD58E18(self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_19AD58B6C);
}

- (int64_t)packetCount
{
  return sub_19AD58C4C();
}

- (void)setPacketCount:(int64_t)a3
{
  sub_19AD58CAC(a3);
}

- (NSData)packetDescriptions
{
  return (NSData *)sub_19AD58D7C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19AD58DC0);
}

- (void)setPacketDescriptions:(id)a3
{
  sub_19AD58E18(self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_19AD58E80);
}

- (SiriTTSAudioData)init
{
  return (SiriTTSAudioData *)AudioData.init()();
}

+ (BOOL)supportsSecureCoding
{
  return static AudioData.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static AudioData.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSAudioData *v5;

  v4 = a3;
  v5 = self;
  sub_19AD5910C(v4);

}

- (SiriTTSAudioData)initWithCoder:(id)a3
{
  return (SiriTTSAudioData *)AudioData.init(coder:)(a3);
}

- (NSString)description
{
  SiriTTSAudioData *v2;
  void *v3;

  v2 = self;
  sub_19AD59634();

  v3 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_19AD58B78(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSAudioData_audioData), *(_QWORD *)&self->asbd[OBJC_IVAR___SiriTTSAudioData_audioData]);
  sub_19AD58B78(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSAudioData_packetDescriptions), *(_QWORD *)&self->asbd[OBJC_IVAR___SiriTTSAudioData_packetDescriptions]);
}

- (BOOL)isEqual:(id)a3
{
  SiriTTSAudioData *v4;
  SiriTTSAudioData *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19AE55A6C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = AudioData.isEqual(_:)((uint64_t)v8);

  sub_19AD567C8((uint64_t)v8, (uint64_t *)&unk_1ED05B470);
  return v6 & 1;
}

- (int64_t)hash
{
  SiriTTSAudioData *v2;
  int64_t v3;

  v2 = self;
  v3 = AudioData.hash.getter();

  return v3;
}

@end

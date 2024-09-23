@implementation SiriTTSInstrumentationMetrics

- (NSString)utterance
{
  return (NSString *)sub_19AE1159C(self, (uint64_t)a2, sub_19AE112C0);
}

- (void)setUtterance:(id)a3
{
  sub_19AE115EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_19AE112D8);
}

- (SiriTTSSynthesisVoice)voice
{
  id v2;

  sub_19AE11340();
  return (SiriTTSSynthesisVoice *)v2;
}

- (void)setVoice:(id)a3
{
  id v4;
  SiriTTSInstrumentationMetrics *v5;

  v4 = a3;
  v5 = self;
  sub_19AE113C8();

}

- (SiriTTSSynthesisResource)resource
{
  id v2;

  sub_19AE1145C();
  return (SiriTTSSynthesisResource *)v2;
}

- (void)setResource:(id)a3
{
  id v4;
  SiriTTSInstrumentationMetrics *v5;

  v4 = a3;
  v5 = self;
  sub_19AE114E4();

}

- (NSString)audioOutputRoute
{
  return (NSString *)sub_19AE1159C(self, (uint64_t)a2, sub_19AE115D4);
}

- (void)setAudioOutputRoute:(id)a3
{
  sub_19AE115EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_19AE1164C);
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)sub_19AE1159C(self, (uint64_t)a2, sub_19AE116D8);
}

- (void)setClientBundleIdentifier:(id)a3
{
  sub_19AE115EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_19AE116F0);
}

- (NSString)experimentIdentifier
{
  return (NSString *)sub_19AE1159C(self, (uint64_t)a2, sub_19AE11744);
}

- (void)setExperimentIdentifier:(id)a3
{
  sub_19AE115EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_19AE1175C);
}

- (unint64_t)requestCreatedTime
{
  unint64_t result;

  sub_19AE117C4();
  return result;
}

- (void)setRequestCreatedTime:(unint64_t)a3
{
  sub_19AE11820(a3);
}

- (double)eagerRequestGapInterval
{
  double result;

  sub_19AE118B8();
  return result;
}

- (void)setEagerRequestGapInterval:(double)a3
{
  sub_19AE11910(a3);
}

- (unint64_t)synthesisBeginTime
{
  unint64_t result;

  sub_19AE119AC();
  return result;
}

- (void)setSynthesisBeginTime:(unint64_t)a3
{
  sub_19AE11A08(a3);
}

- (unint64_t)synthesisEndTime
{
  unint64_t result;

  sub_19AE11AA0();
  return result;
}

- (void)setSynthesisEndTime:(unint64_t)a3
{
  sub_19AE11AFC(a3);
}

- (unint64_t)speechBeginTime
{
  unint64_t result;

  sub_19AE11B94();
  return result;
}

- (void)setSpeechBeginTime:(unint64_t)a3
{
  sub_19AE11BF0(a3);
}

- (unint64_t)speechEndTime
{
  unint64_t result;

  sub_19AE11C88();
  return result;
}

- (void)setSpeechEndTime:(unint64_t)a3
{
  sub_19AE11CE4(a3);
}

- (unint64_t)speechEstimatedOutputBeginTime
{
  unint64_t result;

  sub_19AE11D7C();
  return result;
}

- (void)setSpeechEstimatedOutputBeginTime:(unint64_t)a3
{
  sub_19AE11DD8(a3);
}

- (double)audioStartLatency
{
  double result;

  sub_19AE11E70();
  return result;
}

- (void)setAudioStartLatency:(double)a3
{
  sub_19AE11EC8(a3);
}

- (unint64_t)serverFirstPacketTime
{
  unint64_t result;

  sub_19AE11F64();
  return result;
}

- (void)setServerFirstPacketTime:(unint64_t)a3
{
  sub_19AE11FC0(a3);
}

- (unint64_t)serverLastPacketTime
{
  unint64_t result;

  sub_19AE12058();
  return result;
}

- (void)setServerLastPacketTime:(unint64_t)a3
{
  sub_19AE120B4(a3);
}

- (double)serverStreamedAudioDuration
{
  double result;

  sub_19AE1214C();
  return result;
}

- (void)setServerStreamedAudioDuration:(double)a3
{
  sub_19AE121A4(a3);
}

- (double)audioDuration
{
  double result;

  sub_19AE12240();
  return result;
}

- (void)setAudioDuration:(double)a3
{
  sub_19AE12298(a3);
}

- (BOOL)isWarmStart
{
  char v2;

  sub_19AE12338();
  return v2 & 1;
}

- (void)setIsWarmStart:(BOOL)a3
{
  sub_19AE12394(a3);
}

- (int64_t)sourceOfTTS
{
  int64_t result;

  sub_19AE1246C();
  return result;
}

- (void)setSourceOfTTS:(int64_t)a3
{
  sub_19AE124C8(a3);
}

- (BOOL)privacySensitive
{
  char v2;

  sub_19AE12564();
  return v2 & 1;
}

- (void)setPrivacySensitive:(BOOL)a3
{
  sub_19AE125C0(a3);
}

- (BOOL)minimizeDeviceUsage
{
  char v2;

  sub_19AE1265C();
  return v2 & 1;
}

- (void)setMinimizeDeviceUsage:(BOOL)a3
{
  sub_19AE126B8(a3);
}

- (int64_t)errorCode
{
  int64_t result;

  sub_19AE12750();
  return result;
}

- (void)setErrorCode:(int64_t)a3
{
  sub_19AE127AC(a3);
}

- (BOOL)isServerTTSRacing
{
  char v2;

  sub_19AE12848();
  return v2 & 1;
}

- (void)setIsServerTTSRacing:(BOOL)a3
{
  sub_19AE128A4(a3);
}

- (int64_t)promptCount
{
  int64_t result;

  sub_19AE1293C();
  return result;
}

- (void)setPromptCount:(int64_t)a3
{
  sub_19AE12998(a3);
}

- (BOOL)neuralAlignmentStall
{
  char v2;

  sub_19AE12A34();
  return v2 & 1;
}

- (void)setNeuralAlignmentStall:(BOOL)a3
{
  sub_19AE12A90(a3);
}

- (BOOL)neuralAudioClick
{
  char v2;

  sub_19AE12B2C();
  return v2 & 1;
}

- (void)setNeuralAudioClick:(BOOL)a3
{
  sub_19AE12B88(a3);
}

- (BOOL)useHydraFrontend
{
  char v2;

  sub_19AE12C24();
  return v2 & 1;
}

- (void)setUseHydraFrontend:(BOOL)a3
{
  sub_19AE12C80(a3);
}

- (BOOL)neuralFallback
{
  char v2;

  sub_19AE12D1C();
  return v2 & 1;
}

- (void)setNeuralFallback:(BOOL)a3
{
  sub_19AE12D78(a3);
}

- (BOOL)isAudibleRequest
{
  char v2;

  sub_19AE12E14();
  return v2 & 1;
}

- (void)setIsAudibleRequest:(BOOL)a3
{
  sub_19AE12E70(a3);
}

- (int64_t)deviceThermalState
{
  int64_t result;

  sub_19AE12F08();
  return result;
}

- (void)setDeviceThermalState:(int64_t)a3
{
  sub_19AE12F64(a3);
}

- (SiriTTSInstrumentationMetrics)init
{
  return (SiriTTSInstrumentationMetrics *)InstrumentationMetrics.init()();
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static InstrumentationMetrics.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static InstrumentationMetrics.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSInstrumentationMetrics *v5;

  v4 = a3;
  v5 = self;
  sub_19AE1327C();

}

- (SiriTTSInstrumentationMetrics)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (SiriTTSInstrumentationMetrics *)InstrumentationMetrics.init(coder:)();
}

- (NSString)description
{
  return (NSString *)sub_19AE16280(self, (uint64_t)a2, (void (*)(void))sub_19AE1453C);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_196_0(OBJC_IVAR___SiriTTSInstrumentationMetrics_voice);
  OUTLINED_FUNCTION_196_0(OBJC_IVAR___SiriTTSInstrumentationMetrics_resource);
  OUTLINED_FUNCTION_147_0();
  OUTLINED_FUNCTION_147_0();
  OUTLINED_FUNCTION_224_0(OBJC_IVAR___SiriTTSInstrumentationMetrics_experimentIdentifier);
  OUTLINED_FUNCTION_41_1();
}

- (NSString)voiceAssetKey
{
  return (NSString *)sub_19AE14EB8(self);
}

- (NSString)voiceResourceAssetKey
{
  return (NSString *)sub_19AE14EB8(self);
}

@end

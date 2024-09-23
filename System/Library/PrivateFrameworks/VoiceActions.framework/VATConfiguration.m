@implementation VATConfiguration

+ (OS_os_log)logger
{
  if (qword_257917730 != -1)
    swift_once();
  return (OS_os_log *)(id)qword_25791D798;
}

- (NeuralNetworkConfig)neuralNetwork
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_neuralNetwork);
  swift_beginAccess();
  return (NeuralNetworkConfig *)*v2;
}

- (void)setNeuralNetwork:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___VATConfiguration_neuralNetwork);
}

- (FeatureExtractorConfig)featureExtractor
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_featureExtractor);
  swift_beginAccess();
  return (FeatureExtractorConfig *)*v2;
}

- (void)setFeatureExtractor:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___VATConfiguration_featureExtractor);
}

- (DecoderConfig)decoder
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_decoder);
  swift_beginAccess();
  return (DecoderConfig *)*v2;
}

- (void)setDecoder:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___VATConfiguration_decoder);
}

- (SecondPassConfig)secondPass
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_secondPass);
  swift_beginAccess();
  return (SecondPassConfig *)*v2;
}

- (void)setSecondPass:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___VATConfiguration_secondPass);
}

- (RuntimeConfig)runtime
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VATConfiguration_runtime);
  swift_beginAccess();
  return (RuntimeConfig *)*v2;
}

- (void)setRuntime:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___VATConfiguration_runtime);
}

- (VATConfiguration)init
{
  return (VATConfiguration *)sub_24A19F3E4();
}

- (VATConfiguration)initWithFilename:(id)a3 error:(id *)a4
{
  uint64_t v4;
  unint64_t v5;

  if (a3)
  {
    v4 = sub_24A215CB4();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (VATConfiguration *)VATConfiguration.init(filename:)(v4, v5);
}

- (void)_replaceModelPathWithCustomModelPathForTestWithPrefix:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)(void);
  VATConfiguration *v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = sub_24A215CB4();
  v6 = v5;
  v7 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v8 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x78);
  v9 = self;
  v10 = (_QWORD *)v8();
  (*(void (**)(void))((*v7 & *v10) + 0x68))();

  v11 = (_QWORD *)v8();
  swift_bridgeObjectRetain();
  sub_24A215D98();
  swift_bridgeObjectRetain();
  sub_24A215D98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))((*v7 & *v11) + 0x70))(v4, v6);

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  VATConfiguration *v2;
  void *v3;

  v2 = self;
  sub_24A1A0C98();

  v3 = (void *)sub_24A215C90();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{

}

@end

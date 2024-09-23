@implementation NeuralNetworkConfig

- (NSString)modelPath
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24A215C90();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setModelPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_24A215CB4();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_modelPath);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (float)logThreshold
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_logThreshold);
  swift_beginAccess();
  return *v2;
}

- (void)setLogThreshold:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_logThreshold);
  swift_beginAccess();
  *v4 = a3;
}

- (float)logMinimum
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_logMinimum);
  swift_beginAccess();
  return *v2;
}

- (void)setLogMinimum:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR___NeuralNetworkConfig_logMinimum);
  swift_beginAccess();
  *v4 = a3;
}

- (NeuralNetworkConfig)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___NeuralNetworkConfig_modelPath);
  *v2 = 0xD000000000000041;
  v2[1] = 0x800000024A224110;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___NeuralNetworkConfig_logThreshold) = -1035468800;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___NeuralNetworkConfig_logMinimum) = -1027080192;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NeuralNetworkConfig();
  return -[NeuralNetworkConfig init](&v4, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for NeuralNetworkConfig, &qword_25790DC30, (uint64_t)&protocol conformance descriptor for NeuralNetworkConfig);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

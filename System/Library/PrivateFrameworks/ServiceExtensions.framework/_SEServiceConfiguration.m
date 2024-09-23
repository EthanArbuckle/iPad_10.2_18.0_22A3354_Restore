@implementation _SEServiceConfiguration

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

- (_SEServiceConfiguration)initWithServiceIdentifier:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  objc_super v9;

  v4 = sub_245DC4CB8();
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  *v5 = nullsub_1;
  v5[1] = 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  *v6 = v4;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for _SEServiceConfiguration();
  return -[_SEServiceConfiguration init](&v9, sel_init);
}

- (NSString)serviceIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_245DC4CAC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setServiceIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_245DC4CB8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)interruptionHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->serviceIdentifier[OBJC_IVAR____SEServiceConfiguration_interruptionHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_245DB1954;
  v5[3] = &block_descriptor;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setInterruptionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  *v6 = sub_245DBAC50;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (_SEServiceConfiguration)init
{
  _SEServiceConfiguration *result;

  result = (_SEServiceConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

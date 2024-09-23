@implementation SSKLegacyDisplayProfileBuilder

- (void)setPriorityLevel:(unint64_t)a3 sceneSpecification:(id)a4
{
  id v6;
  SSKLegacyDisplayProfileBuilder *v7;

  v6 = a4;
  v7 = self;
  sub_2460161E4(a3, v6);

}

- (void)deriveWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_246017D04();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)setMainLike:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay) = a3;
}

- (void)setCloningSupported:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning) = a3;
}

- (id)createDisplayProfileConfiguration
{
  SSKLegacyDisplayProfileBuilder *v2;
  id v3;

  v2 = self;
  v3 = sub_2460164C0();

  return v3;
}

- (SSKLegacyDisplayProfileBuilder)init
{
  _QWORD *v3;
  uint64_t v4;
  SSKLegacyDisplayProfileBuilder *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_identifier);
  *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_priority) = 0;
  v4 = OBJC_IVAR___SSKLegacyDisplayProfileBuilder_requestsByGroup;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_24600F378(MEMORY[0x24BEE4AF8]);
  *((_BYTE *)&v5->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_behavesAsMainDisplay) = 0;
  *((_BYTE *)&v5->super.isa + OBJC_IVAR___SSKLegacyDisplayProfileBuilder_supportsCloning) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for LegacyDisplayProfileBuilder();
  return -[SSKLegacyDisplayProfileBuilder init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

@implementation MTGenericDataSourceSection

- (id)shouldIncludeSeeAllBlock
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[6];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A91D815C;
  aBlock[3] = &block_descriptor_21;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v5;
}

- (void)setShouldIncludeSeeAllBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  swift_beginAccess();
  *v6 = sub_1A91D862C;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (MTGenericDataSourceSection)initWithTitle:(id)a3
{
  uint64_t v4;
  uint64_t (**v5)();
  uint64_t *v6;
  uint64_t v7;
  objc_super v9;

  v4 = sub_1A93F8040();
  v5 = (uint64_t (**)())((char *)self + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  *v5 = sub_1A9123748;
  v5[1] = 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___MTGenericDataSourceSection_storedTitle);
  *v6 = v4;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GenericDataSourceSection();
  return -[MTGenericDataSourceSection init](&v9, sel_init);
}

- (MTGenericDataSourceSection)init
{
  MTGenericDataSourceSection *result;

  result = (MTGenericDataSourceSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end

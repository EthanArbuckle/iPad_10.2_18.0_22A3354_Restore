@implementation ICSelectionStateModelContainerSelectionOptionsCompletionBlocks

- (id)dataIndexedBlock
{
  return sub_10015AC6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock, (uint64_t)sub_10015AC08, (uint64_t)&unk_10055A5A0);
}

- (id)dataRenderedBlock
{
  return sub_10015AC6C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock, (uint64_t)sub_100206734, (uint64_t)&unk_10055A578);
}

- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)initWithDataIndexedBlock:(id)a3 dataRenderedBlock:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();
  _QWORD *v12;
  uint64_t (**v13)();
  objc_super v15;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = v7;
  if (!v6)
  {
    v9 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v9 = swift_allocObject(&unk_10055A560, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v6 = sub_100166BB0;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject(&unk_10055A538, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = sub_100166BA8;
LABEL_6:
  v12 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock);
  *v12 = v6;
  v12[1] = v9;
  v13 = (uint64_t (**)())((char *)self
                       + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock);
  *v13 = v11;
  v13[1] = (uint64_t (*)())v10;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for ICSelectionStateModel.ContainerSelectionCompletionBlocks();
  return -[ICSelectionStateModelContainerSelectionOptionsCompletionBlocks init](&v15, "init");
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  uint64_t *v9;
  uint64_t *v10;
  objc_super v12;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock);
  v4 = *(_QWORD *)&self->dataIndexedBlock[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock];
  v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock);
  v6 = *(_QWORD *)&self->dataIndexedBlock[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock];
  v7 = (objc_class *)type metadata accessor for ICSelectionStateModel.ContainerSelectionCompletionBlocks();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = (uint64_t *)&v8[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock];
  *v9 = v3;
  v9[1] = v4;
  v10 = (uint64_t *)&v8[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock];
  *v10 = v5;
  v10[1] = v6;
  sub_100166B74(v3, v4);
  sub_100166B74(v5, v6);
  v12.receiver = v8;
  v12.super_class = v7;
  return -[ICSelectionStateModelContainerSelectionOptionsCompletionBlocks init](&v12, "init");
}

- (BOOL)isEqual:(id)a3
{
  return sub_10015B280(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))type metadata accessor for ICSelectionStateModel.ContainerSelectionCompletionBlocks);
}

- (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks)init
{
  ICSelectionStateModelContainerSelectionOptionsCompletionBlocks *result;

  result = (ICSelectionStateModelContainerSelectionOptionsCompletionBlocks *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ContainerSelectionCompletionBlocks", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock), *(_QWORD *)&self->dataIndexedBlock[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataIndexedBlock]);
  sub_100012C50(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock), *(_QWORD *)&self->dataIndexedBlock[OBJC_IVAR___ICSelectionStateModelContainerSelectionOptionsCompletionBlocks_dataRenderedBlock]);
}

@end

@implementation _SFXPCBlockContainer

- (void)dealloc
{
  _SFXPCBlockContainer *v2;

  v2 = self;
  _SFXPCBlockContainer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____SFXPCBlockContainer_uuid;
  v4 = sub_1A2AE3130();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)invoke:(id)a3 parametersData:(id)a4 parametersAsyncSequenceContainer:(id)a5 parametersBlocksContainer:(id)a6 sync:(BOOL)a7 completion:(id)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  _SFXPCBlockContainer *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL4 v24;

  v24 = a7;
  v13 = sub_1A2AE3130();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a8);
  sub_1A2AE310C();
  v18 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v19 = self;
  v20 = sub_1A2AE2F80();
  v22 = v21;

  _Block_copy(v17);
  sub_1A297C30C(v16, v20, v22, (uint64_t)a5, (uint64_t)a6, v24, (char *)v19, v17);
  _Block_release(v17);
  _Block_release(v17);
  sub_1A29736C4(v20, v22);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (_SFXPCBlockContainer)init
{
  _SFXPCBlockContainer *result;

  result = (_SFXPCBlockContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

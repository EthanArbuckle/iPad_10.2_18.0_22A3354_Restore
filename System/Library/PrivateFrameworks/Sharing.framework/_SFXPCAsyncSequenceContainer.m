@implementation _SFXPCAsyncSequenceContainer

- (void)dealloc
{
  _SFXPCAsyncSequenceContainer *v2;

  v2 = self;
  _SFXPCAsyncSequenceContainer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____SFXPCAsyncSequenceContainer_uuid;
  v3 = sub_1A2AE3130();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)xpcMakeAsyncIteratorFor:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _SFXPCAsyncSequenceContainer *v11;
  uint64_t v12;

  v6 = sub_1A2AE3130();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1A2AE310C();
  _Block_copy(v10);
  v11 = self;
  sub_1A29B8CE0((uint64_t)v9, (uint64_t)v11, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_SFXPCAsyncSequenceContainer)init
{
  _SFXPCAsyncSequenceContainer *result;

  result = (_SFXPCAsyncSequenceContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

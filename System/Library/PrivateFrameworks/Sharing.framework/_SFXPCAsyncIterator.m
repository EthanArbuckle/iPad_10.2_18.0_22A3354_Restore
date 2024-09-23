@implementation _SFXPCAsyncIterator

- (void)dealloc
{
  _SFXPCAsyncIterator *v2;

  v2 = self;
  sub_1A29B5FC0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____SFXPCAsyncIterator_uuid;
  v4 = sub_1A2AE3130();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1A29B97D0(*(void **)((char *)&self->super.isa + OBJC_IVAR____SFXPCAsyncIterator_iterator), *(_QWORD *)&self->_anon_0[OBJC_IVAR____SFXPCAsyncIterator_iterator], self->iterator[OBJC_IVAR____SFXPCAsyncIterator_iterator]);
  swift_release();
  swift_release();
}

- (void)xpcNextWithCompletion:(id)a3
{
  void *v4;
  _SFXPCAsyncIterator *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A29B8AF0((uint64_t)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)xpcCancel
{
  _SFXPCAsyncIterator *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____SFXPCAsyncIterator_currentTask))
  {
    v2 = self;
    swift_retain();
    sub_1A2AE376C();

    swift_release();
  }
}

- (_SFXPCAsyncIterator)init
{
  _SFXPCAsyncIterator *result;

  result = (_SFXPCAsyncIterator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

@implementation TPSAsyncBlockOperation

- (void).cxx_destruct
{
  swift_release();
}

- (TPSAsyncBlockOperation)initWithAsyncBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t, uint64_t);
  objc_super v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t, uint64_t))((char *)self + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  *v6 = sub_19A9168BC;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t))v5;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TPSAsyncBlockOperation();
  return -[TPSAsyncOperation init](&v8, sel_init);
}

- (void)main
{
  char *v3;
  void (*v4)(void (*)(void *), uint64_t);
  uint64_t v5;
  TPSAsyncBlockOperation *v6;

  v3 = (char *)self + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock;
  swift_beginAccess();
  v4 = *(void (**)(void (*)(void *), uint64_t))v3;
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = self;
  swift_retain();
  swift_retain();
  v4(sub_19A960FCC, v5);

  swift_release();
  swift_release_n();
}

- (id)asyncBlock
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[6];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19A960B30;
  aBlock[3] = &block_descriptor_12;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v5;
}

- (void)setAsyncBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t, uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t, uint64_t))((char *)self + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  *v6 = sub_19A961088;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t))v5;
  swift_release();
}

- (TPSAsyncBlockOperation)init
{
  TPSAsyncBlockOperation *result;

  result = (TPSAsyncBlockOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

@implementation QLThumbnailExtensionGenerator

- (void)generateThumbnailWithThumbnailRequest:(QLTGeneratorThumbnailRequest *)a3 item:(QLThumbnailItem *)a4 flavor:(int)a5 wantsLowQuality:(BOOL)a6 generationData:(NSDictionary *)a7 completionHandler:(id)a8
{
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  QLTGeneratorThumbnailRequest *v22;
  QLThumbnailItem *v23;
  NSDictionary *v24;
  QLThumbnailExtensionGenerator *v25;
  uint64_t v26;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9A66E0);
  MEMORY[0x1E0C80A78]();
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a8);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a3;
  *(_QWORD *)(v18 + 24) = a4;
  *(_DWORD *)(v18 + 32) = a5;
  *(_BYTE *)(v18 + 36) = a6;
  *(_QWORD *)(v18 + 40) = a7;
  *(_QWORD *)(v18 + 48) = v17;
  *(_QWORD *)(v18 + 56) = self;
  v19 = sub_1D54FC710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EFF39408;
  v20[5] = v18;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EFF39418;
  v21[5] = v20;
  v22 = a3;
  v23 = a4;
  v24 = a7;
  v25 = self;
  sub_1D54E8D10((uint64_t)v16, (uint64_t)&unk_1EFF39428, (uint64_t)v21);
  swift_release();
}

- (void)cancel
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___QLThumbnailExtensionGenerator_operation), sel_cancel);
}

- (QLThumbnailExtensionGenerator)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___QLThumbnailExtensionGenerator_operation) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ThumbnailExtensionGenerator();
  return -[QLThumbnailExtensionGenerator init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end

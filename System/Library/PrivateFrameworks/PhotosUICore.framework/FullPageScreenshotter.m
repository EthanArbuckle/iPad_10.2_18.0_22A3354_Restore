@implementation FullPageScreenshotter

- (void)screenshotService:(UIScreenshotService *)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  UIScreenshotService *v15;
  _TtC12PhotosUICore21FullPageScreenshotter *v16;
  uint64_t v17;

  sub_1A67ECCF8(0, (unint64_t *)&qword_1EE8D9360, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - v8;
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE8EE5A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE8EE5B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A6A7BFAC((uint64_t)v9, (uint64_t)&unk_1EE8EE5C0, (uint64_t)v14);
  swift_release();
}

- (_TtC12PhotosUICore21FullPageScreenshotter)init
{
  _TtC12PhotosUICore21FullPageScreenshotter *result;

  result = (_TtC12PhotosUICore21FullPageScreenshotter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end

@implementation PXVideoFormatMetadataProvider

- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)initWithImageManager:(id)a3
{
  char *v4;
  id v5;
  objc_super v7;

  v4 = (char *)self + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_activeRequestID;
  *(_DWORD *)v4 = 0;
  v4[4] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_imageManager) = (Class)a3;
  *(_DWORD *)v4 = 0;
  v4[4] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PXVideoFormatMetadataProvider();
  v5 = a3;
  return -[PXVideoFormatMetadataProvider init](&v7, sel_init);
}

- (void)cancelActiveRequest
{
  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_activeRequestID + 4) & 1) == 0)
    objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_imageManager), sel_cancelImageRequest_, *(unsigned int *)((char *)&self->super.isa+ OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_activeRequestID));
}

- (void)requestVideoMetadataFor:(id)a3 processingQueue:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(id, id, id, void (*)(void *, char), uint64_t);
  id v14;
  id v15;
  _TtC12PhotosUICore29PXVideoFormatMetadataProvider *v16;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1A6C60368;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = *(void (**)(id, id, id, void (*)(void *, char), uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa)
                                                                                      + 0x88);
  swift_unknownObjectRetain();
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_1A7ADBF34();
  v13(a3, v14, v15, sub_1A6D81B90, v12);
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
}

- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)init
{
  _TtC12PhotosUICore29PXVideoFormatMetadataProvider *result;

  result = (_TtC12PhotosUICore29PXVideoFormatMetadataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore29PXVideoFormatMetadataProvider_imageManager));
}

@end

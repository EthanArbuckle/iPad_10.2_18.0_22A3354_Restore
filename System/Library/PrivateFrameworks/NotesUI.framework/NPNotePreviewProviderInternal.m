@implementation NPNotePreviewProviderInternal

+ (NPNotePreviewProviderInternal)shared
{
  if (qword_1EEC9F398 != -1)
    swift_once();
  return (NPNotePreviewProviderInternal *)(id)qword_1EECA33A0;
}

- (id)previewForUserActivity:(id)a3 error:(id *)a4
{
  id v5;
  NPNotePreviewProviderInternal *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  v5 = a3;
  v6 = self;
  NotePreviewProvider.preview(for:)(v5, v11);
  v7 = (void *)v11[4];
  v8 = (void *)v11[5];
  sub_1AC988CFC();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v9 = (void *)sub_1ACA42000();
  swift_bridgeObjectRelease();
  return v9;
}

- (NPNotePreviewProviderInternal)init
{
  objc_class *ObjectType;
  uint64_t v4;
  void *v5;
  NPNotePreviewProviderInternal *v6;
  id v7;
  objc_class *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___NPNotePreviewProviderInternal_cache;
  v5 = (void *)objc_opt_self();
  v6 = self;
  v7 = objc_msgSend(v5, sel_defaultManager);
  type metadata accessor for PersistedThumbnailCache();
  v8 = (objc_class *)swift_allocObject();
  *((_QWORD *)v8 + 2) = v7;
  *(Class *)((char *)&self->super.isa + v4) = v8;

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return -[NPNotePreviewProviderInternal init](&v10, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end

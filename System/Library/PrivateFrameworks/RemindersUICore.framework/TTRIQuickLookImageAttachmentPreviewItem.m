@implementation TTRIQuickLookImageAttachmentPreviewItem

- (BOOL)isEqual:(id)a3
{
  _TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem *v4;
  _TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = TTRIQuickLookImageAttachmentPreviewItem.isEqual(_:)((uint64_t)v8);

  sub_1B4314F88((uint64_t)v8);
  return v6 & 1;
}

- (_TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem)init
{
  _TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem *result;

  result = (_TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem_attachmentID));
  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem_fileURL;
  v4 = sub_1B49036D4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (NSURL)previewItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4E9EC0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem_fileURL;
  v7 = sub_1B49036D4();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1B4903638();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (NSString)previewItemTitle
{
  uint64_t v2;
  _TtC15RemindersUICore39TTRIQuickLookImageAttachmentPreviewItem *v3;
  void *v4;

  v2 = qword_1ED4EE550;
  v3 = self;
  if (v2 != -1)
    swift_once();
  sub_1B4903434();

  v4 = (void *)sub_1B4906A34();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

@end

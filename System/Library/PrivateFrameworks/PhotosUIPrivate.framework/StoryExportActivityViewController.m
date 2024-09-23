@implementation StoryExportActivityViewController

- (_TtC15PhotosUIPrivate33StoryExportActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  sub_1AB08D5C4();
  if (a4)
  {
    sub_1AAB74D50(0, (unint64_t *)&unk_1EEBBF5F0);
    sub_1AB08D5C4();
  }
  sub_1AAC0BF3C();
}

- (int64_t)modalPresentationStyle
{
  _TtC15PhotosUIPrivate33StoryExportActivityViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1AAC0C03C();

  return (int64_t)v3;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  _TtC15PhotosUIPrivate33StoryExportActivityViewController *v4;

  v4 = self;
  sub_1AAC0C0AC(a3);

}

- (id)completionWithItemsHandler
{
  _TtC15PhotosUIPrivate33StoryExportActivityViewController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];

  v2 = self;
  v3 = sub_1AAC0CDCC();
  v5 = v4;

  if (v3)
  {
    v7[4] = v3;
    v7[5] = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 1107296256;
    v7[2] = sub_1AAC0D210;
    v7[3] = &block_descriptor_44;
    v3 = _Block_copy(v7);
    swift_release();
  }
  return v3;
}

- (void)setCompletionWithItemsHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC15PhotosUIPrivate33StoryExportActivityViewController *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AAC0E3AC;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1AAC0CEC0((uint64_t)v4, v5);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController_exportActivityItemProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController_exportPreviewViewController));
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController_errorReporter);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController_fullSizePlayerAspect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33StoryExportActivityViewController____lazy_storage___linkMetadata));
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate33StoryExportActivityViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1AAC0D36C();

  sub_1AAB74D50(0, &qword_1EEBBF550);
  v6 = (void *)sub_1AB08D5B8();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3
{
  id v4;
  _TtC15PhotosUIPrivate33StoryExportActivityViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC0E280();

}

@end

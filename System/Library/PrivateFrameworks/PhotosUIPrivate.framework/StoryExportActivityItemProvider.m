@implementation StoryExportActivityItemProvider

- (_TtC15PhotosUIPrivate31StoryExportActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_1AB08DCA8();
  swift_unknownObjectRelease();
  sub_1AAB984D0();
}

- (id)item
{
  _TtC15PhotosUIPrivate31StoryExportActivityItemProvider *v2;
  void *v3;
  _QWORD v5[4];

  v2 = self;
  sub_1AAB987C0((uint64_t)v5);

  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  v3 = (void *)sub_1AB08DFE4();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC15PhotosUIPrivate31StoryExportActivityItemProvider *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1AAB98C2C();

  v9 = (void *)sub_1AB08D468();
  swift_bridgeObjectRelease();
  return v9;
}

- (void)cancel
{
  _TtC15PhotosUIPrivate31StoryExportActivityItemProvider *v2;

  v2 = self;
  sub_1AAB99C04();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_storyConfiguration));
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_aspectRatio);
  v3 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_destinationURL;
  v4 = OUTLINED_FUNCTION_11_7();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_exportManager);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_fullSizePlayerExtendedTraitCollectionSnapshot);
  swift_unknownObjectWeakDestroy();
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_progressController));
}

@end

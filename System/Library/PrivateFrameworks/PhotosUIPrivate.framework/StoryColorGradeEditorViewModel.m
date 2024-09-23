@implementation StoryColorGradeEditorViewModel

- (_TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel)init
{
  sub_1AAC79658();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_storyModel));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_mediaProvider));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_selectionHandler);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_cancelHandler);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_specManager));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel_layoutSpec);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate30StoryColorGradeEditorViewModel__tungstenView;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBC26C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end

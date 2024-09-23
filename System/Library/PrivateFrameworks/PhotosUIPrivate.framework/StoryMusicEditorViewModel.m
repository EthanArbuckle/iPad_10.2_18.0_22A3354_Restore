@implementation StoryMusicEditorViewModel

- (_TtC15PhotosUIPrivate25StoryMusicEditorViewModel)init
{
  sub_1AAC99BCC();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_storyViewModel));

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_42_7();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_selectionHandler);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_cancelHandler);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel____lazy_storage___flexMusicCollectionsLoadingQueue));
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBC35D0);
  OUTLINED_FUNCTION_7_14(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBC35C8);
  OUTLINED_FUNCTION_7_14(v4);
  sub_1AAB866A8(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_songCollectionLoadingState));
  OUTLINED_FUNCTION_16_16(OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_songCollectionLoadedCompletionHandler);
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_actionPerformerDelegate);
}

@end

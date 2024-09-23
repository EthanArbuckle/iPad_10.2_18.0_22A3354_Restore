@implementation StoryMusicFeedbackContextMenuDelegate

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC15PhotosUIPrivate37StoryMusicFeedbackContextMenuDelegate *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1AAC9B51C();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC15PhotosUIPrivate37StoryMusicFeedbackContextMenuDelegate *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1AAC9BEC8(v6);
  v10 = v9;

  return v10;
}

- (_TtC15PhotosUIPrivate37StoryMusicFeedbackContextMenuDelegate)init
{
  sub_1AAC9C804();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate37StoryMusicFeedbackContextMenuDelegate_storyViewModel));
  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end

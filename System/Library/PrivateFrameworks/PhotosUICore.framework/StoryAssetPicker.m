@implementation StoryAssetPicker

- (_TtC12PhotosUICore16StoryAssetPicker)init
{
  _QWORD *v2;
  _TtC12PhotosUICore16StoryAssetPicker *result;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore16StoryAssetPicker_pickerHelper) = 0;
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore16StoryAssetPicker_completion);
  *v2 = 0;
  v2[1] = 0;

  result = (_TtC12PhotosUICore16StoryAssetPicker *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)storyPickerHelper:(id)a3 didFinishPicking:(id)a4 promotedAssets:(id)a5 demotedAssets:(id)a6
{
  id v10;
  _TtC12PhotosUICore16StoryAssetPicker *v11;

  v10 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = self;
  sub_1A71D1130(v10, (uint64_t)a4, a5, a6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void).cxx_destruct
{

  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore16StoryAssetPicker_completion));
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC12PhotosUICore16StoryAssetPicker *v5;

  v4 = a3;
  v5 = self;
  StoryAssetPicker.presentationControllerDidDismiss(_:)((UIPresentationController)v4);

}

@end

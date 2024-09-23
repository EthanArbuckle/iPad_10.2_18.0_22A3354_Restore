@implementation ContextMenuPreviewItemController

- (_TtC8VideosUI32ContextMenuPreviewItemController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI32ContextMenuPreviewItemController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1DA027A2C(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI32ContextMenuPreviewItemController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI32ContextMenuPreviewItemController *)sub_1DA027B2C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI32ContextMenuPreviewItemController_cardView));
}

@end

@implementation TTRIRemindersListSmallImageAttachmentsView

- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)init
{
  return (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView *)sub_1B4558C60();
}

- (void)didTapImage:(id)a3
{
  id v4;
  _TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView *v5;

  v4 = a3;
  v5 = self;
  sub_1B4559418(v4);

}

- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithDocumentView:(id)a3
{
  sub_1B45596A8((uint64_t)self, (uint64_t)a2, a3);
}

- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithContentView:(id)a3
{
  sub_1B45596A8((uint64_t)self, (uint64_t)a2, a3);
}

- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithFrame:(CGRect)a3
{
  _TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView *result;

  result = (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView_attachmentsDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView_stackView));
  swift_bridgeObjectRelease();
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5
{
  _TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView *v8;
  void *v9;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  v9 = sub_1B4559ED0((uint64_t)a4, &a5->origin.x);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v9;
}

@end

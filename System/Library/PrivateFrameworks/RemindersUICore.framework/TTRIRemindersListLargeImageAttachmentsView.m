@implementation TTRIRemindersListLargeImageAttachmentsView

- (_TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView *)_s15RemindersUICore42TTRIRemindersListLargeImageAttachmentsViewC5frameACSo6CGRectV_tcfc_0();
}

- (_TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s15RemindersUICore42TTRIRemindersListLargeImageAttachmentsViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  _TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView *v2;

  v2 = self;
  TTRIRemindersListLargeImageAttachmentsView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double *v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  v4 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_fixedWidth);
  swift_beginAccess();
  v5 = *v4;
  if (*((_BYTE *)v4 + 8))
    v5 = width;
  v6 = 157.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (void)didTapImage:(id)a3
{
  id v4;
  _TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView *v5;

  v4 = a3;
  v5 = self;
  sub_1B4546248(v4);

}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_grid));
  swift_bridgeObjectRelease();
  sub_1B4224758(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_totalCountViews), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView_totalCountViews));
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5
{
  _TtC15RemindersUICore42TTRIRemindersListLargeImageAttachmentsView *v8;
  void *v9;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  v9 = sub_1B45476B0((uint64_t)a4, &a5->origin.x);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v9;
}

@end

@implementation TTRAutoCompleteReminderStackedImagesView

- (_TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView_images) = 0;
  v4 = OBJC_IVAR____TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView_firstImageView;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)_s15RemindersUICore40TTRAutoCompleteReminderStackedImagesViewC010firstImageH033_7D16EBB5E7E79D207D11AC8A78C0B96FLLSo07UIImageH0Cvpfi_0();
  v6 = OBJC_IVAR____TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView_secondImageView;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)_s15RemindersUICore40TTRAutoCompleteReminderStackedImagesViewC010firstImageH033_7D16EBB5E7E79D207D11AC8A78C0B96FLLSo07UIImageH0Cvpfi_0();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView____lazy_storage___maskLayer) = 0;

  result = (_TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView *)sub_1B4908144();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView)initWithFrame:(CGRect)a3
{
  _TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView *result;

  result = (_TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView)initWithArrangedSubviews:(id)a3
{
  _TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView *result;

  result = (_TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView_firstImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView_secondImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRAutoCompleteReminderStackedImagesView____lazy_storage___maskLayer));
}

@end

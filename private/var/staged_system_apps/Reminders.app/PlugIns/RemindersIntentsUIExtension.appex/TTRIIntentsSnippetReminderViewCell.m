@implementation TTRIIntentsSnippetReminderViewCell

- (void)prepareForReuse
{
  _TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell *v2;

  v2 = self;
  sub_1000181E0();

}

- (UILabel)titleLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_titleLabel, a2);
}

- (void)setTitleLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_titleLabel, a3);
}

- (UILabel)timeTriggerLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel, a2);
}

- (void)setTimeTriggerLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel, a3);
}

- (UILabel)locationTriggerLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_locationTriggerLabel, a2);
}

- (void)setLocationTriggerLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_locationTriggerLabel, a3);
}

- (UILabel)contactTriggerLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_contactTriggerLabel, a2);
}

- (void)setContactTriggerLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_contactTriggerLabel, a3);
}

- (UIStackView)stackView
{
  return (UIStackView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView, a2);
}

- (void)setStackView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView, a3);
}

- (void)layoutSubviews
{
  _TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell *v2;

  v2 = self;
  sub_10001845C();

}

- (void)didTapCompleteButton:(id)a3
{
  sub_100019B8C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_100019458);
}

- (void)didTapAppLinkButton:(id)a3
{
  sub_100019B8C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_100019AA0);
}

- (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell *)sub_100019C04(a3, (uint64_t)a4, v6);
}

- (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell *)sub_100019DA4(a3);
}

- (void).cxx_destruct
{
  _QWORD v3[16];

  sub_10001A230((uint64_t)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, (uint64_t)v3);
  sub_10001A6FC(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001A3C4);
  sub_10001A458((uint64_t)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_titleLabel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_locationTriggerLabel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_contactTriggerLabel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView);
  sub_10001A36C(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton), *(void **)&self->viewModel[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView));
}

@end

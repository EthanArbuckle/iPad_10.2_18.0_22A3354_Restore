@implementation TTRIRemindersListReminderCellLinkView

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v3 = self;
  -[TTRIRemindersListReminderCellLinkView maximumLayoutSize](v3, sel_maximumLayoutSize);
  v5 = v4;
  v7 = v6;
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for TTRIRemindersListReminderCellLinkView();
  -[LPLinkView sizeThatFits:](&v14, sel_sizeThatFits_, v5, v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithURL:(id)a3
{
  sub_1B455A804((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], (void (*)(uint64_t, __n128))MEMORY[0x1E0CAFF00]);
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadata:(id)a3
{
  id v3;
  _TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *result;

  v3 = a3;
  result = (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithFrame:(CGRect)a3
{
  _TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *result;

  result = (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithPresentationProperties:(id)a3
{
  _TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *result;

  swift_unknownObjectRetain();
  result = (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *result;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4E9EC0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1B490368C();
    v8 = sub_1B49036D4();
    v9 = 0;
  }
  else
  {
    v8 = sub_1B49036D4();
    v9 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, v9, 1);
  swift_unknownObjectRetain();
  result = (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadataLoadedFromURL:(id)a3
{
  sub_1B455A804((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], (void (*)(uint64_t, __n128))MEMORY[0x1E0CAFF00]);
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadataLoadedFromRequest:(id)a3
{
  sub_1B455A804((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E0CADF50], MEMORY[0x1E0CADF08]);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView_attachmentID));
}

@end

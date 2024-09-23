@implementation TTRIReminderListPickerViewController

- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_palette);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_contentSizeObserver) = 0;
  v5 = a3;

  result = (_TtC15RemindersUICore36TTRIReminderListPickerViewController *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v2;

  v2 = self;
  sub_1B422217C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[TTRIReminderListPickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  sub_1B422253C();

}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[TTRIReminderListPickerViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  sub_1B42229D0();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return *(_QWORD *)((*(_QWORD **)((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_presenter))[4]
                   + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(self + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_presenter)
                   + 32);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 48 * a4 + 72) + 16);
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1B4222CBC((uint64_t)v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 0.0;
  if (*(_QWORD *)((*(_QWORD **)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_presenter))[4]
                 + 16) > a4)
  {
    if (a4 < 0)
      __break(1u);
    else
      return *MEMORY[0x1E0DC53D8];
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v11;
  char *v12;
  uint64_t v14;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  v12 = sub_1B4222DEC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v15;
  unint64_t v16;
  unint64_t v17;
  _BYTE v19[224];

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B4903C38();
  v10 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_presenter);
  v11 = *(_QWORD *)(v10 + 32);
  v12 = *(void **)(v10 + 40);
  v13 = v12;
  v14 = a3;
  v15 = self;
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  v16 = sub_1B4903C50();
  v17 = sub_1B4903C80();
  TTRReminderListPickerViewModel.list(at:inSectionAt:)(v16, v17, v11, v12, (uint64_t)v19);

  swift_bridgeObjectRelease();
  sub_1B42247F8((uint64_t)v19);

  LOBYTE(v11) = (v19[219] & 1) == 0;
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v11;
  uint64_t v12;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  sub_1B42239B8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)cancelButtonAction:(id)a3
{
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v4;
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v5;
  __int128 v6;
  __int128 v7;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = self;
  }
  -[TTRIReminderListPickerViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_1B41EA560((uint64_t)&v6, &qword_1ED4ED170);
}

- (void)moveButtonAction:(id)a3
{
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v4;
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B4226C0C((uint64_t)self);

  sub_1B41EA560((uint64_t)v6, &qword_1ED4ED170);
}

- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithStyle:(int64_t)a3
{
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *result;

  result = (_TtC15RemindersUICore36TTRIReminderListPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore36TTRIReminderListPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15RemindersUICore36TTRIReminderListPickerViewController *result;

  v4 = a4;
  result = (_TtC15RemindersUICore36TTRIReminderListPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1B4224758(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_palette), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_palette));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore36TTRIReminderListPickerViewController_contentSizeObserver));
}

@end

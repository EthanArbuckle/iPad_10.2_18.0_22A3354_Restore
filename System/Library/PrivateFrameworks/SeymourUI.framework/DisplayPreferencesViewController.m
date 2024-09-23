@implementation DisplayPreferencesViewController

- (void)viewDidLoad
{
  _TtC9SeymourUI32DisplayPreferencesViewController *v2;

  v2 = self;
  sub_22B662C60();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DisplayPreferencesViewController();
  v4 = v7.receiver;
  -[DisplayPreferencesViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_tableView, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_reloadData);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DisplayPreferencesViewController();
  v4 = (char *)v7.receiver;
  -[DisplayPreferencesViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_onSettingsDismissed];
  if (v5)
  {
    v6 = swift_retain();
    v5(v6);
    sub_22B0FAA68((uint64_t)v5);
  }

}

- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9SeymourUI32DisplayPreferencesViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_contentSizeObserver) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_onSettingsDismissed);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels) = (Class)MEMORY[0x24BEE4AF8];
  v5 = a3;

  result = (_TtC9SeymourUI32DisplayPreferencesViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtC9SeymourUI32DisplayPreferencesViewController *v2;

  v2 = self;
  sub_22B663480();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_contentSizeObserver));
  swift_release();
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_onSettingsDismissed));
  swift_bridgeObjectRelease();
}

- (void)visibilitySwitchChanged:(id)a3
{
  id v4;
  _TtC9SeymourUI32DisplayPreferencesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22B663570(v4);

}

- (void)dismissTapped
{
  -[DisplayPreferencesViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithStyle:(int64_t)a3
{
  _TtC9SeymourUI32DisplayPreferencesViewController *result;

  result = (_TtC9SeymourUI32DisplayPreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI32DisplayPreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI32DisplayPreferencesViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI32DisplayPreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels))[2];
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
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 72 * a4 + 32) + 16);
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC9SeymourUI32DisplayPreferencesViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_22B663724(v6, a4);

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC9SeymourUI32DisplayPreferencesViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_22B663964(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  double result;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  result = *MEMORY[0x24BEBE770];
  if (!*(_QWORD *)(v4 + 72 * a4 + 56))
    return 2.22507386e-308;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  double result;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  result = *MEMORY[0x24BEBE770];
  if (!*(_QWORD *)(v4 + 72 * a4 + 72))
    return 2.22507386e-308;
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  double result;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  result = 44.0;
  if (!*(_QWORD *)(v4 + 72 * a4 + 56))
    return 2.22507386e-308;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI32DisplayPreferencesViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_22B663C88(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI32DisplayPreferencesViewController *v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v16;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  v12 = sub_22BA79C08();
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  v13 = *(uint64_t *)((char *)&v11->super.super.super.super.isa
                   + OBJC_IVAR____TtC9SeymourUI32DisplayPreferencesViewController_sectionViewModels);
  if (v12 >= *(_QWORD *)(v13 + 16))
  {
LABEL_5:
    __break(1u);
    return v12;
  }
  v14 = *(_BYTE *)(v13 + 72 * v12 + 41);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  LOBYTE(v12) = v14;
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI32DisplayPreferencesViewController *v11;
  uint64_t v12;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  sub_22B664124(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end

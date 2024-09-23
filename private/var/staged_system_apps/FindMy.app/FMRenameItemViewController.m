@implementation FMRenameItemViewController

- (_TtC6FindMy26FMRenameItemViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000A41D4();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy26FMRenameItemViewController *v4;

  v4 = self;
  sub_1000A1A28(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMRenameItemViewController(0);
  v4 = (char *)v6.receiver;
  -[FMRenameItemViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_customRoleView];
  *(_BYTE *)(v5 + OBJC_IVAR____TtC6FindMy16FMCustomRoleView_emojiPickerEnabled) = 1;
  objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC6FindMy16FMCustomRoleView_emojiBackground), "setUserInteractionEnabled:", 1, v6.receiver, v6.super_class);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy26FMRenameItemViewController *v4;

  v4 = self;
  sub_1000A1C74(a3);

}

- (void)dismissKeyboard
{
  _TtC6FindMy26FMRenameItemViewController *v2;

  v2 = self;
  sub_1000A2D40();

}

- (void)scrollViewDidScroll:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC6FindMy26FMRenameItemViewController *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_scrollHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->super.super.mediator[OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_scrollHandler];
    v6 = a3;
    v7 = self;
    sub_1000A190C((uint64_t)v3, v5);
    v3(v6);
    sub_1000327F0((uint64_t)v3, v5);

  }
}

- (void)saveRole
{
  _TtC6FindMy26FMRenameItemViewController *v2;

  v2 = self;
  sub_1000A33FC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_scrollHandler), *(_QWORD *)&self->super.super.mediator[OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_scrollHandler]);
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_item;
  v4 = type metadata accessor for FMIPItem(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_rolePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_customRoleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_dataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_devicesSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_doneButtonItem));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_keyboardWillShowObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6FindMy26FMRenameItemViewController_keyboardWillHideObserver));
}

@end

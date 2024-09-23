@implementation ICTagAssignmentViewController

- (ICTagAssignmentViewController)initWithCoder:(id)a3
{
  ICTagAssignmentViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___collectionView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___cancelBarButtonItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___doneBarButtonItem) = 0;

  result = (ICTagAssignmentViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000047, 0x8000000100482800, "MobileNotes/TagAssignmentViewController.swift", 45, 2, 33, 0);
  __break(1u);
  return result;
}

- (ICTagAssignmentViewController)initWithSelectedNotes:(id)a3 managedObjectContext:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v7 = _Block_copy(a5);
  v8 = sub_1000163BC(0, (unint64_t *)&qword_1005D39F0, ICNote_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v8);
  v10 = (_QWORD *)swift_allocObject(&unk_10055DC10, 24, 7);
  v10[2] = v7;
  return (ICTagAssignmentViewController *)sub_1001EC534(v9, a4, (uint64_t)sub_100166BA8, v10);
}

- (void)viewDidLoad
{
  ICTagAssignmentViewController *v2;

  v2 = self;
  sub_1001EC7D8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  char *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v4 = v7.receiver;
  -[ICTagAssignmentViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = sub_1001EC15C();
  objc_msgSend(v5, "layoutIfNeeded", v7.receiver, v7.super_class);

  sub_1001ECA00();
  v6 = sub_1001EC434(&OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___doneBarButtonItem, &selRef_dismissAndSaveActionWithSender_, 0);
  objc_msgSend(v6, "setEnabled:", 0);

}

- (void)dismissActionWithSender:(id)a3
{
  ICTagAssignmentViewController *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;
  _QWORD v12[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v12, a3);
  swift_unknownObjectRelease(a3, v6);
  v7 = *(_QWORD *)&v5->$__lazy_storage_$_collectionView[OBJC_IVAR___ICTagAssignmentViewController_completion];
  v10[4] = *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___ICTagAssignmentViewController_completion);
  v11 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100206734;
  v10[3] = &unk_10055DAC0;
  v8 = _Block_copy(v10);
  v9 = v11;
  swift_retain(v7);
  swift_release(v9);
  -[ICTagAssignmentViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, v8);
  _Block_release(v8);

  sub_1000153C0(v12);
}

- (void)dismissAndSaveActionWithSender:(id)a3
{
  ICTagAssignmentViewController *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;
  _QWORD v12[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v12, a3);
  swift_unknownObjectRelease(a3, v6);
  sub_100336B74(0, 0);
  v7 = *(_QWORD *)&v5->$__lazy_storage_$_collectionView[OBJC_IVAR___ICTagAssignmentViewController_completion];
  v10[4] = *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___ICTagAssignmentViewController_completion);
  v11 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100206734;
  v10[3] = &unk_10055DA98;
  v8 = _Block_copy(v10);
  v9 = v11;
  swift_retain(v7);
  swift_release(v9);
  -[ICTagAssignmentViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, v8);
  _Block_release(v8);

  sub_1000153C0(v12);
}

- (ICTagAssignmentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICTagAssignmentViewController *result;

  v4 = a4;
  result = (ICTagAssignmentViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.TagAssignmentViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___doneBarButtonItem));
  swift_release(*(_QWORD *)&self->$__lazy_storage_$_collectionView[OBJC_IVAR___ICTagAssignmentViewController_completion]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICTagAssignmentViewController_selectedNotes));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICTagAssignmentViewController_managedObjectContext));
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICTagAssignmentViewController_model));
}

@end

@implementation ICActivityStreamViewController

- (ICActivityStreamCoordinating)coordinator
{
  return (ICActivityStreamCoordinating *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController_coordinator]);
}

- (ICActivityStreamViewController)initWithCoordinator:(id)a3 error:(id *)a4
{
  swift_unknownObjectRetain(a3);
  return (ICActivityStreamViewController *)sub_10013B248((uint64_t)a3);
}

- (ICActivityStreamViewController)initWithCoder:(id)a3
{
  sub_10013B710(a3);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v2 = v6.receiver;
  -[ICActivityStreamViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "ICBackgroundColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[ICActivityStreamViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_10013BA10();

}

- (void)addHostingViewIfNeeded
{
  ICActivityStreamViewController *v2;

  v2 = self;
  sub_10013BB8C();

}

- (double)topInset
{
  return *(double *)&self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController_topInset];
}

- (void)setTopInset:(double)a3
{
  ICActivityStreamViewController *v3;

  *(double *)&self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController_topInset] = a3;
  v3 = self;
  sub_10013BA10();

}

- (void)updateContentLayout
{
  ICActivityStreamViewController *v2;

  v2 = self;
  sub_10013BA10();

}

- (ICActivityStreamSelection)selection
{
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  ICActivityStreamViewController *v6;
  id v8;

  KeyPath = swift_getKeyPath(&unk_1004543E8, a2);
  v5 = swift_getKeyPath(&unk_100454410, v4);
  v6 = self;
  static Published.subscript.getter(&v8);
  swift_release(v5);
  swift_release(KeyPath);

  return (ICActivityStreamSelection *)v8;
}

- (void)setSelection:(id)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  KeyPath = swift_getKeyPath(&unk_1004543E8, a2);
  v7 = swift_getKeyPath(&unk_100454410, v6);
  v9 = a3;
  v8 = a3;
  static Published.subscript.setter(&v9, self, KeyPath, v7);
}

- (void)observeActivityStreamForObject:(id)a3
{
  ICActivityStreamViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10013C038(a3);

}

- (NSManagedObjectID)objectID
{
  ICActivityStreamViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_10013C9C8();

  return (NSManagedObjectID *)v3;
}

- (ICActivityStreamViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  ICActivityStreamViewController *result;

  v4 = a4;
  result = (ICActivityStreamViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ActivityStreamViewController", 40, "init(nibName:bundle:)", 21, 0, v5, v6, v7, v8);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;

  swift_unknownObjectRelease(*(_QWORD *)&self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController_coordinator], a2);

  v3 = &self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController__activityStream];
  v4 = sub_100012E18(&qword_1005D0408);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = &self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController__selection];
  v6 = sub_100012E18(&qword_1005D03A8);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = &self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController__pressedItem];
  v8 = sub_100012E18(&qword_1005D03B8);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release(*(_QWORD *)&self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController_activityStreamUpdater]);
  swift_release(*(_QWORD *)&self->ICNAViewController_opaque[OBJC_IVAR___ICActivityStreamViewController_activityStreamObservation]);
}

@end

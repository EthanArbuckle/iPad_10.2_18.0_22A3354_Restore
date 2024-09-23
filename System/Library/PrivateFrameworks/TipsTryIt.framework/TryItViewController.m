@implementation TryItViewController

- (TryItViewControllerDelegate)delegate
{
  return (TryItViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TryItViewController_delegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (TryItViewController)initWithLessonURL:(id)a3 tipID:(id)a4 collectionID:(id)a5 correlationID:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v9 = sub_248AF4E80();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF4E68();
  if (a4)
  {
    a4 = (id)sub_248AF5A5C();
    v13 = v12;
    if (a5)
      goto LABEL_3;
LABEL_6:
    v15 = 0;
    if (a6)
      goto LABEL_4;
LABEL_7:
    v16 = 0;
    v18 = 0;
    return (TryItViewController *)TryItViewController.init(lessonURL:tipID:collectionID:correlationID:)((uint64_t)v11, (uint64_t)a4, v13, (uint64_t)a5, v15, v16, v18);
  }
  v13 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  a5 = (id)sub_248AF5A5C();
  v15 = v14;
  if (!a6)
    goto LABEL_7;
LABEL_4:
  v16 = sub_248AF5A5C();
  v18 = v17;
  return (TryItViewController *)TryItViewController.init(lessonURL:tipID:collectionID:correlationID:)((uint64_t)v11, (uint64_t)a4, v13, (uint64_t)a5, v15, v16, v18);
}

- (TryItViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  TryItViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TryItViewController_hostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TryItViewController_delegate) = 0;
  v5 = (char *)self + OBJC_IVAR___TryItViewController_tryItView;
  v6 = type metadata accessor for TipsTryItView();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (TryItViewController *)sub_248AF5CFC();
  __break(1u);
  return result;
}

- (void)logEndSession
{
  TryItViewController *v2;

  v2 = self;
  sub_248ADE4B4();

}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v5;

  height = a3.height;
  width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TryItViewController();
  -[TryItViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (void)loadView
{
  TryItViewController *v2;

  v2 = self;
  sub_248ADE65C();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TryItViewController();
  v4 = (char *)v6.receiver;
  -[TryItViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  v5 = *(void **)&v4[OBJC_IVAR___TryItViewController_delegate];
  if (v5)
    objc_msgSend(v5, sel_tryItViewControllerDidDismissWithTryItViewController_, v4, v6.receiver, v6.super_class);

}

- (TryItViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  TryItViewController *result;

  v4 = a4;
  result = (TryItViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  sub_248ADECBC((uint64_t)self + OBJC_IVAR___TryItViewController_tryItView);
}

- (double)preferredContentSize
{
  void *v0;
  id v1;
  double v2;
  double v3;
  id v4;
  double v5;
  double v6;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v1, sel_bounds);
  v3 = v2;

  if (v3 <= 744.0
    && (v4 = objc_msgSend(v0, sel_mainScreen),
        objc_msgSend(v4, sel_bounds),
        v6 = v5,
        v4,
        v6 <= 1133.0))
  {
    return 644.0;
  }
  else
  {
    return 704.0;
  }
}

@end

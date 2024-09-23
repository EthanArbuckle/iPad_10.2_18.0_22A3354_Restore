@implementation BKGoalPickerViewController

- (UIView)containerView
{
  return (UIView *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___BKGoalPickerViewController_containerView);
}

- (void)setContainerView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKGoalPickerViewController_containerView, a3);
}

- (UIView)titleView
{
  return (UIView *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___BKGoalPickerViewController_titleView);
}

- (void)setTitleView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKGoalPickerViewController_titleView, a3);
}

- (UIPickerView)picker
{
  return (UIPickerView *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___BKGoalPickerViewController_picker);
}

- (void)setPicker:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKGoalPickerViewController_picker, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___BKGoalPickerViewController_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKGoalPickerViewController_titleLabel, a3);
}

- (UIButton)doneButton
{
  return (UIButton *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___BKGoalPickerViewController_doneButton);
}

- (void)setDoneButton:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKGoalPickerViewController_doneButton, a3);
}

- (int64_t)modalPresentationStyle
{
  return 4;
}

+ (void)createAsync:(int64_t)a3 :(int64_t)a4 :(id)a5 :(id)a6
{
  id v10;

  swift_unknownObjectRetain(a5);
  v10 = a6;
  sub_1005686D4(a3, a4, (uint64_t)a5, v10);
  swift_unknownObjectRelease(a5);

}

- (BKGoalPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005688E4();
}

- (BOOL)shouldAutorotate
{
  void *v3;
  BKGoalPickerViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  return v6 == (id)1;
}

- (void)viewDidLoad
{
  BKGoalPickerViewController *v2;

  v2 = self;
  sub_100566440();

}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  BKGoalPickerViewController *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_100566C38();

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  BKGoalPickerViewController *v4;

  v4 = self;
  sub_100566DDC(a3);

}

- (void)viewWillLayoutSubviews
{
  BKGoalPickerViewController *v2;

  v2 = self;
  sub_100566ED0();

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  BKGoalPickerViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(UIDevice);
  v4 = self;
  v5 = objc_msgSend(v3, "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)1)
    return 30;
  else
    return 2;
}

- (void)doneButtonPressed:(id)a3
{
  BKGoalPickerViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_1005674D4(1);
  -[BKGoalPickerViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

  _s5Books15CurrentPageViewVwxx_0(v6);
}

- (void)backgroundTapped:(id)a3
{
  id v4;
  BKGoalPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005674D4(1);
  -[BKGoalPickerViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BKGoalPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  BKGoalPickerViewController *result;

  v4 = a4;
  result = (BKGoalPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.GoalPickerViewController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKGoalPickerViewController_containerView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKGoalPickerViewController_titleView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKGoalPickerViewController_picker);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKGoalPickerViewController_titleLabel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKGoalPickerViewController_doneButton);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___BKGoalPickerViewController_eventHandler));
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKGoalPickerViewController_model);
  v4 = *(_QWORD *)&self->titleView[OBJC_IVAR___BKGoalPickerViewController_model];
  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabel[OBJC_IVAR___BKGoalPickerViewController_model]);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa + OBJC_IVAR___BKGoalPickerViewController_model))[2];
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  BKGoalPickerViewController *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v7 = a3;
  v8 = self;
  sub_100568C3C(v7, a4);
  v10 = v9;

  if (v10)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  BKGoalPickerViewController *v8;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKGoalPickerViewController_selectedRow) = (Class)a4;
  v7 = a3;
  v8 = self;
  sub_1005674D4(0);
  sub_100567178();
  sub_1005679C4(v7, a4);

}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  uint64_t v5;
  id v6;
  BKGoalPickerViewController *v7;
  double v8;

  v5 = qword_1009CE848;
  v6 = a3;
  v7 = self;
  if (v5 != -1)
    swift_once(&qword_1009CE848, sub_100565F28);
  v8 = *(double *)&qword_1009EB500;

  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  BKGoalPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005674D4(1);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKGoalPickerViewController *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_100567D8C((uint64_t)v8, (uint64_t)a4, v10);

  return v12;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  char *v5;
  void *Strong;
  id v7;
  BKGoalPickerViewController *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGPoint v24;
  CGRect v25;

  v5 = (char *)self + OBJC_IVAR___BKGoalPickerViewController_containerView;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___BKGoalPickerViewController_containerView);
  v7 = a3;
  v8 = self;
  objc_msgSend(v7, "locationInView:", Strong);
  v10 = v9;
  v12 = v11;

  v13 = (void *)swift_unknownObjectWeakLoadStrong(v5);
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v25.origin.x = v16;
    v25.origin.y = v18;
    v25.size.width = v20;
    v25.size.height = v22;
    v24.x = v10;
    v24.y = v12;
    LOBYTE(v14) = CGRectContainsPoint(v25, v24);

    LOBYTE(v13) = v14 ^ 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v13;
}

@end

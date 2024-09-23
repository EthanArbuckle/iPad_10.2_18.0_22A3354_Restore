@implementation CRLiOSMiniFormatterTextEditingAccessoryViewController

- (_TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100C58510();
}

- (void)loadView
{
  id v3;
  _TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)UIInputView);
  v4 = self;
  v5 = objc_msgSend(v3, "initWithFrame:inputViewStyle:", 0, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CRLiOSMiniFormatterTextEditingAccessoryViewController setInputView:](v4, "setInputView:", v5);
  sub_100C54390();

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController *v10;

  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject(&unk_10129D3A8, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_100565828;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_100C58600(v9);
  sub_1004C1024((uint64_t)v7, v8);

}

- (_TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController *result;

  v4 = a4;
  result = (_TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSMiniFormatterTextEditingAccessoryViewController", 62, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_textBuilder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_icc));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_editor);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_editorController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_stateManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_presentedNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_presentedAuxiliaryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_toolbar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_auxiliaryPresentedBuilder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_inputViewStateAtLastReload));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController__leadingBarButtonGroups));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController__trailingBarButtonGroups));
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_presentedAuxiliaryViewController)
    && objc_msgSend((id)objc_opt_self(UIDevice), "crl_phoneUI"))
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100C57768(v4);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController *v15;

  v8 = type metadata accessor for CRLiOSMiniFormatterPopoverContainerViewController();
  if (swift_dynamicCastClass(a4, v8))
  {
    v9 = a3;
    v10 = a4;
    v15 = self;
    sub_1005B6148(v11, v12, v13, v14);
    objc_msgSend(v9, "setPreferredContentSize:");

  }
}

@end

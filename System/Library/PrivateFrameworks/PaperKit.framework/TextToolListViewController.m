@implementation TextToolListViewController

- (void)viewDidLoad
{
  _TtC8PaperKit26TextToolListViewController *v2;

  v2 = self;
  TextToolListViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updatePreferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  _TtC8PaperKit26TextToolListViewController *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_stackView);
  v3 = *MEMORY[0x1E0DC4FF8];
  v4 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
  v6 = self;
  objc_msgSend(v2, sel_systemLayoutSizeFittingSize_, v3, v4);
  if (*(double *)((char *)&v6->super.super.super.isa
                 + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_minimumPreferredContentSizeWidth) > v5)
    v5 = *(double *)((char *)&v6->super.super.super.isa
                   + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_minimumPreferredContentSizeWidth);
  -[TextToolListViewController setPreferredContentSize:](v6, sel_setPreferredContentSize_, v5);

}

- (void)didTapAddTextBoxListItemView:(id)a3 forEvent:(id)a4
{
  id v6;
  _TtC8PaperKit26TextToolListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[TextToolListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(10, ObjectType, v10);

      swift_unknownObjectRelease();
    }
    else
    {

    }
    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)didTapAddSignatureListItemView:(id)a3 forEvent:(id)a4
{
  @objc TextToolListViewController.didTapAddSignatureListItemView(_:forEvent:)((char *)self, (uint64_t)a2, a3, a4, (void (*)(void))specialized ToolPickerController.textToolListViewController(_:didSelectAddSignatureWithEvent:));
}

- (void)didTapAutoFillFormListItemView:(id)a3 forEvent:(id)a4
{
  if (MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_delegate, a2, a3, a4))
    swift_unknownObjectRelease();
}

- (void)didTapAddShapeListItemView:(id)a3 forEvent:(id)a4
{
  @objc TextToolListViewController.didTapAddSignatureListItemView(_:forEvent:)((char *)self, (uint64_t)a2, a3, a4, (void (*)(void))specialized ToolPickerController.textToolListViewController(_:didSelectAddShapeWithEvent:));
}

- (void)didTapOpacityListItemView:(id)a3 forEvent:(id)a4
{
  id v6;
  _TtC8PaperKit26TextToolListViewController *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  -[TextToolListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  if (MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_delegate))
  {
    specialized ToolPickerController.textToolListViewController(_:didSelectOpacityWithEvent:)(v7);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)didTapDescriptionListItemView:(id)a3 forEvent:(id)a4
{
  @objc TextToolListViewController.didTapDescriptionListItemView(_:forEvent:)((char *)self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1EA853F20, (uint64_t)partial apply for closure #1 in ToolPickerController.textToolListViewController(_:didSelectDescriptionWithEvent:), (uint64_t)&block_descriptor_6_5);
}

- (void)didTapAddStickerListItemView:(id)a3 forEvent:(id)a4
{
  @objc TextToolListViewController.didTapAddSignatureListItemView(_:forEvent:)((char *)self, (uint64_t)a2, a3, a4, (void (*)(void))specialized ToolPickerController.textToolListViewController(_:didSelectAddStickerWithEvent:));
}

- (void)didTapAddGraphListItemView:(id)a3 forEvent:(id)a4
{
  @objc TextToolListViewController.didTapDescriptionListItemView(_:forEvent:)((char *)self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1EA853ED0, (uint64_t)partial apply for closure #1 in ToolPickerController.textToolListViewController(_:didSelectAddGraphWithEvent:), (uint64_t)&block_descriptor_61);
}

- (_TtC8PaperKit26TextToolListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8PaperKit26TextToolListViewController *)TextToolListViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit26TextToolListViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit26TextToolListViewController *)TextToolListViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_stackView));
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___addTextBoxListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___autoFillFormListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___addSignatureListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___addStickerListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___opacityListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___descriptionListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___addShapeListItemView));
}

@end

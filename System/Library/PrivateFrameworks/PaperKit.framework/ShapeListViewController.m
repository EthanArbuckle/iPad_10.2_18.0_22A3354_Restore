@implementation ShapeListViewController

- (void)viewDidLoad
{
  _TtC8PaperKit23ShapeListViewController *v2;

  v2 = self;
  ShapeListViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didSelectAddRectangle:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v10 + 56))(0, ObjectType, v10);

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

- (void)didSelectAddOval:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(1, ObjectType, v10);

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

- (void)didSelectAddTriangle:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(2, ObjectType, v10);

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

- (void)didSelectAddLine:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(3, ObjectType, v10);

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

- (void)didSelectAddChatBubble:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(4, ObjectType, v10);

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

- (void)didSelectAddRoundedRect:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(5, ObjectType, v10);

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

- (void)didSelectAddPolygon:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(6, ObjectType, v10);

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

- (void)didSelectAddStar:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(7, ObjectType, v10);

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

- (void)didSelectAddArrow:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(8, ObjectType, v10);

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

- (void)didSelectAddArrowShape:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC8PaperKit23ShapeListViewController *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  -[ShapeListViewController dismissViewControllerAnimated:completion:](v7, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v8 = MEMORY[0x1DF0E666C]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x1DF0E666C](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 56))(9, ObjectType, v10);

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

- (_TtC8PaperKit23ShapeListViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8PaperKit23ShapeListViewController *)ShapeListViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit23ShapeListViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit23ShapeListViewController *)ShapeListViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_stackView));
  swift_bridgeObjectRelease();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
}

@end

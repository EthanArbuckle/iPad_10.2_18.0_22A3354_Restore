@implementation PRAmbientEditingTitledViewController

- (PRAmbientEditingTitledViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
  swift_beginAccess();
  return (PRAmbientEditingTitledViewControllerDelegate *)(id)MEMORY[0x18D77C9B8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (PRAmbientEditingTitledViewController)initWithContentViewController:(id)a3
{
  return (PRAmbientEditingTitledViewController *)AmbientEditingTitledViewController.init(contentViewController:)(a3);
}

- (PRAmbientEditingTitledViewController)initWithCoder:(id)a3
{
  id v5;
  PRAmbientEditingTitledViewController *result;

  swift_unknownObjectWeakInit();
  sub_18B6FEB68(0, &qword_1ED1B9330);
  v5 = a3;
  sub_18B729424();
  sub_18B6FEB68(0, &qword_1ED1B9358);
  sub_18B729424();

  result = (PRAmbientEditingTitledViewController *)sub_18B729538();
  __break(1u);
  return result;
}

- (void)loadView
{
  PRAmbientEditingTitledViewController *v2;

  v2 = self;
  AmbientEditingTitledViewController.loadView()();

}

- (id)accessibilityTitleLabel
{
  PRAmbientEditingTitledViewController *v3;
  id v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18B72940C();

  swift_release();
  swift_release();
  return v5;
}

- (PRAmbientEditingTitledViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PRAmbientEditingTitledViewController *result;

  v4 = a4;
  result = (PRAmbientEditingTitledViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PRAmbientEditingTitledViewController_contentViewController));
  sub_18B6FEDC0((uint64_t)self + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate);
  v3 = (char *)self + OBJC_IVAR___PRAmbientEditingTitledViewController__titleLabel;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8D98);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___PRAmbientEditingTitledViewController__closeButton;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8DA0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end

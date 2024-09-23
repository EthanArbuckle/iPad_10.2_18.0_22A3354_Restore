@implementation _PKAccountDocumentsViewController

- (_PKAccountDocumentsViewController)initWithConfiguration:(id)a3
{
  return (_PKAccountDocumentsViewController *)AccountDocumentsViewController.init(withConfiguration:)(a3);
}

- (_PKAccountDocumentsViewController)initWithCoder:(id)a3
{
  _PKAccountDocumentsViewController *result;

  result = (_PKAccountDocumentsViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _PKAccountDocumentsViewController *v2;

  v2 = self;
  sub_19D299AF0(type metadata accessor for AccountDocumentsViewController, &OBJC_IVAR____PKAccountDocumentsViewController_documentsHostingVC);

}

- (void)viewWillLayoutSubviews
{
  sub_19D299C74(self, (uint64_t)a2, type metadata accessor for AccountDocumentsViewController, &OBJC_IVAR____PKAccountDocumentsViewController_documentsHostingVC);
}

- (_PKAccountDocumentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_19D29AA78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountDocumentsViewController_documentsHostingVC));
}

@end

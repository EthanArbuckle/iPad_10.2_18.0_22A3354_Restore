@implementation DOCErrorViewController

- (_TtC5Files22DOCErrorViewController)initWithCoder:(id)a3
{
  _TtC5Files22DOCErrorViewController *result;

  result = (_TtC5Files22DOCErrorViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCErrorViewController.swift", 34, 2, 69, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC5Files22DOCErrorViewController *v3;

  v3 = self;
  sub_1002B9744((uint64_t)v3, v2);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Files22DOCErrorViewController *v4;

  v4 = self;
  sub_1002B98B0(a3);

}

- (void)willMoveToParentViewController:(id)a3
{
  objc_class *ObjectType;
  _TtC5Files22DOCErrorViewController *v6;
  id v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = self;
  if (!a3)
    sub_1002B9590(1);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  v7 = a3;
  -[DOCErrorViewController willMoveToParentViewController:](&v8, "willMoveToParentViewController:", v7);

}

- (void)docUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  _TtC5Files22DOCErrorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002BC7C8();

}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  _TtC5Files22DOCErrorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002BCA6C();

}

- (void).cxx_destruct
{
  swift_errorRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                              + OBJC_IVAR____TtC5Files22DOCErrorViewController_error));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCErrorViewController_source));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCErrorViewController_location));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCErrorViewController_authenticationAction));
}

- (void)actionControllerDidFinishAction:(id)a3 error:(id)a4
{
  id v6;
  _TtC5Files22DOCErrorViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1002BCB90((uint64_t)a4);

}

- (void)actionController:(id)a3 presentError:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  _TtC5Files22DOCErrorViewController *v10;
  void *v11;
  id v12;

  v8 = _Block_copy(a5);
  v9 = a3;
  v12 = a4;
  v10 = self;
  v11 = (void *)_convertErrorToNSError(_:)(v12);
  DOCPresentAlertForError(v11, v9);

  _Block_release(v8);
}

@end

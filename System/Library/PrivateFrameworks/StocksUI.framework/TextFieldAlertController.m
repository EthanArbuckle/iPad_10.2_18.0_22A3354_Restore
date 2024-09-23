@implementation TextFieldAlertController

- (_TtC8StocksUI24TextFieldAlertController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC2919A0();
}

- (void)cancel
{
  void (*v2)(uint64_t);
  _TtC8StocksUI24TextFieldAlertController *v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController_onCancel);
  v3 = self;
  if (v2)
  {
    v4 = sub_1DC113F04((uint64_t)v2);
    v2(v4);
    sub_1DC0E81D0((uint64_t)v2);
  }
  -[TextFieldAlertController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

- (void)viewDidLoad
{
  _TtC8StocksUI24TextFieldAlertController *v2;

  v2 = self;
  sub_1DC290C08();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[TextFieldAlertController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = sub_1DC290788();
  objc_msgSend(v5, sel_setEnabled_, 1, v7.receiver, v7.super_class);

  v6 = sub_1DC290788();
  objc_msgSend(v6, sel_becomeFirstResponder);

}

- (_TtC8StocksUI24TextFieldAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8StocksUI24TextFieldAlertController *result;

  v4 = a4;
  result = (_TtC8StocksUI24TextFieldAlertController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DC0E81D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController_configureTextField));
  sub_1DC0E81D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController_onSubmit));
  sub_1DC0E81D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController_onCancel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___textFieldLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___submitButton));
}

- (NSArray)keyCommands
{
  void *v2;

  if (sub_1DC291A74())
  {
    sub_1DC0821D4(0, &qword_1EDB42CF0);
    v2 = (void *)sub_1DC408CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

@end

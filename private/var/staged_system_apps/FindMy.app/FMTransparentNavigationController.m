@implementation FMTransparentNavigationController

- (_TtC6FindMy33FMTransparentNavigationController)initWithRootViewController:(id)a3
{
  id v4;
  _TtC6FindMy33FMTransparentNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMTransparentNavigationController();
  v4 = a3;
  v5 = -[FMActivityIndicatingNavigationController initWithRootViewController:](&v7, "initWithRootViewController:", v4);
  -[FMTransparentNavigationController setDelegate:](v5, "setDelegate:", v5, v7.receiver, v7.super_class);

  return v5;
}

- (_TtC6FindMy33FMTransparentNavigationController)initWithCoder:(id)a3
{
  _TtC6FindMy33FMTransparentNavigationController *result;

  result = (_TtC6FindMy33FMTransparentNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMTransparentNavigationController.swift", 46, 2, 47, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC6FindMy33FMTransparentNavigationController *v2;

  v2 = self;
  sub_1002142E4();

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC6FindMy33FMTransparentNavigationController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1002147E8(v8);

}

@end

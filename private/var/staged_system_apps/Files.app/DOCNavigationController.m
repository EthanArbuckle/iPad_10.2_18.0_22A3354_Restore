@implementation DOCNavigationController

- (_TtC5Files23DOCNavigationController)init
{
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  objc_super v6;

  v3 = type metadata accessor for DOCNavigationBar();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v3);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCNavigationController();
  return -[DOCNavigationController initWithNavigationBarClass:toolbarClass:](&v6, "initWithNavigationBarClass:toolbarClass:", ObjCClassFromMetadata, 0);
}

- (_TtC5Files23DOCNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  _TtC5Files23DOCNavigationController *result;

  result = (_TtC5Files23DOCNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002ELL, 0x800000010053A930, "Files/UIKit+DOCAdditionsCore.swift", 34, 2, 16, 0);
  __break(1u);
  return result;
}

- (_TtC5Files23DOCNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC5Files23DOCNavigationController *)sub_1004A81B4(a3);
}

- (_TtC5Files23DOCNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC5Files23DOCNavigationController *result;

  result = (_TtC5Files23DOCNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCNavigationController", 29, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

@end

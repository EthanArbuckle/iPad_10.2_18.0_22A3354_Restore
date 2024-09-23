@implementation CRLiOSParticipantContactViewController

- (_TtC8Freeform38CRLiOSParticipantContactViewController)initWithCoder:(id)a3
{
  _TtC8Freeform38CRLiOSParticipantContactViewController *result;

  result = (_TtC8Freeform38CRLiOSParticipantContactViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSActiveParticipantContactViewController.swift", 59, 2, 38, 0);
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSParticipantContactViewController();
  v2 = v3.receiver;
  -[CRLiOSParticipantContactViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  if (qword_1013DD278 != -1)
    swift_once(&qword_1013DD278, sub_100858BA0);
  objc_msgSend(v2, "setPreferredContentSize:", xmmword_1013F5910, v3.receiver, v3.super_class);

}

- (_TtC8Freeform38CRLiOSParticipantContactViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC8Freeform38CRLiOSParticipantContactViewController *result;

  result = (_TtC8Freeform38CRLiOSParticipantContactViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSParticipantContactViewController", 47, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform38CRLiOSParticipantContactViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC8Freeform38CRLiOSParticipantContactViewController *result;

  v3 = a3;
  result = (_TtC8Freeform38CRLiOSParticipantContactViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSParticipantContactViewController", 47, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform38CRLiOSParticipantContactViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform38CRLiOSParticipantContactViewController *result;

  v4 = a4;
  result = (_TtC8Freeform38CRLiOSParticipantContactViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSParticipantContactViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSParticipantContactViewController_contactViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSParticipantContactViewController_contact));
}

@end

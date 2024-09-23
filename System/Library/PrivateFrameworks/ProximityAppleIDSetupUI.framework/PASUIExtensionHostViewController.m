@implementation PASUIExtensionHostViewController

- (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_finished) = 0;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy) = 0;
  v5 = a3;

  result = (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *)sub_220D995A4();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PASUIExtensionHostViewController();
  v2 = v6.receiver;
  -[PASUIExtensionHostViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = sub_220D88154();
  v4 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v4)
  {
    v5 = v4;
    sub_220D673C8(v3, v4);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *result;

  v4 = a4;
  result = (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_identity;
  v4 = sub_220D988A8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_220D671D8((uint64_t)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController));
  swift_release();
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *v5;

  v4 = a3;
  v5 = self;
  sub_220D88AFC(v4);

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6;
  _TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_220D89AF8(a4);

}

- (void)extensionDidFinishWith:(id)a3 context:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_220D88EA8(v10, v11, (uint64_t)sub_220D6E74C, v9);

  swift_release();
}

- (void)promptForFlowCancelWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_220D8944C((uint64_t)sub_220D6E74C, v5);

  swift_release();
}

@end

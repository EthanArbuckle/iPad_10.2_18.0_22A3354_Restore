@implementation CommerceNavigationController

- (_TtC5Music28CommerceNavigationController)initWithCoder:(id)a3
{
  _TtC5Music28CommerceNavigationController *result;

  result = (_TtC5Music28CommerceNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/CommerceView.swift", 24, 2, 78, 0);
  __break(1u);
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void (*v7)(void (*)(uint64_t), uint64_t);
  id v8;
  _QWORD *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = v10.receiver;
  -[CommerceNavigationController viewDidDisappear:](&v10, "viewDidDisappear:", v3);
  v5 = (_QWORD *)*JSBridge.shared.unsafeMutableAddressor();
  v6 = swift_allocObject(&unk_1010AEC80, 24, 7);
  *(_QWORD *)(v6 + 16) = v4;
  v7 = *(void (**)(void (*)(uint64_t), uint64_t))((swift_isaMask & *v5) + 0xD8);
  v8 = v4;
  v9 = v5;
  v7(sub_10004FFEC, v6);

  swift_release(v6);
}

- (_TtC5Music28CommerceNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC5Music28CommerceNavigationController *result;

  result = (_TtC5Music28CommerceNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Music.CommerceNavigationController", 34, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC5Music28CommerceNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC5Music28CommerceNavigationController *result;

  v3 = a3;
  result = (_TtC5Music28CommerceNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Music.CommerceNavigationController", 34, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC5Music28CommerceNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music28CommerceNavigationController *result;

  v4 = a4;
  result = (_TtC5Music28CommerceNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Music.CommerceNavigationController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28CommerceNavigationController_segue));
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _TtC5Music28CommerceNavigationController *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1010AEC30, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = objc_allocWithZone((Class)AMSUIAuthenticateTask);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = objc_msgSend(v10, "initWithRequest:presentingViewController:", v12, v13);
  v15 = objc_msgSend(v14, "performAuthentication");
  v18[4] = sub_10004FF9C;
  v19 = v9;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_10004E2F4;
  v18[3] = &unk_1010AEC48;
  v16 = _Block_copy(v18);
  v17 = v19;
  swift_retain(v9);
  objc_msgSend(v15, "addFinishBlock:", v16, swift_release(v17).n128_f64[0]);
  _Block_release(v16);

  swift_release(v9);
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _TtC5Music28CommerceNavigationController *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1010AEBE0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = objc_allocWithZone((Class)AMSUIAlertDialogTask);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = objc_msgSend(v10, "initWithRequest:presentingViewController:", v12, v13);
  v15 = objc_msgSend(v14, "present");
  v18[4] = sub_10004FF9C;
  v19 = v9;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_100537628;
  v18[3] = &unk_1010AEBF8;
  v16 = _Block_copy(v18);
  v17 = v19;
  swift_retain(v9);
  objc_msgSend(v15, "addFinishBlock:", v16, swift_release(v17).n128_f64[0]);
  _Block_release(v16);

  swift_release(v9);
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC5Music28CommerceNavigationController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_10004FB0C(a4, (uint64_t)a5);

}

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  return 0;
}

@end

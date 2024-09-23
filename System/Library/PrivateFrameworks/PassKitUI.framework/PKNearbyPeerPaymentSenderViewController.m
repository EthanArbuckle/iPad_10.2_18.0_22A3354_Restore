@implementation PKNearbyPeerPaymentSenderViewController

- (PKNearbyPeerPaymentSenderViewController)initWithUserInfo:(id)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;

  v6 = _Block_copy(a4);
  v7 = _Block_copy(a5);
  v8 = sub_19DE87AC8();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v6;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v7;
  v11 = sub_19D865F4C(v8, (uint64_t)sub_19D266A30, v9, (uint64_t)sub_19D3364BC, v10);
  swift_release();
  swift_release();
  return (PKNearbyPeerPaymentSenderViewController *)v11;
}

- (void)applicationDidBecomeActive
{
  PKNearbyPeerPaymentSenderViewController *v2;

  v2 = self;
  sub_19D862CFC();

}

- (void)viewDidLoad
{
  PKNearbyPeerPaymentSenderViewController *v2;

  v2 = self;
  sub_19D8633C4();

}

- (void)viewDidAppear:(BOOL)a3
{
  PKNearbyPeerPaymentSenderViewController *v4;

  v4 = self;
  sub_19D863934(a3, (SEL *)&selRef_viewDidAppear_);

}

- (void)viewDidDisappear:(BOOL)a3
{
  PKNearbyPeerPaymentSenderViewController *v4;

  v4 = self;
  sub_19D863934(a3, (SEL *)&selRef_viewDidDisappear_);

}

- (void)viewDidLayoutSubviews
{
  PKNearbyPeerPaymentSenderViewController *v2;

  v2 = self;
  sub_19D863AA8();

}

- (void)debugViewTapped
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  PKNearbyPeerPaymentSenderViewController *v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v3 = (char *)self + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_monitor;
  swift_beginAccess();
  sub_19D1BB334((uint64_t)v3, (uint64_t)v8);
  v4 = v9;
  v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 88);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);

}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6;
  id v7;
  PKNearbyPeerPaymentSenderViewController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D4220E0(v7);
  v9 = (uint64_t)v8 + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_monitor;
  swift_beginAccess();
  sub_19D1BB334(v9, (uint64_t)v12);
  v10 = v13;
  v11 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  (*(void (**)(id, uint64_t, uint64_t))(v11 + 96))(v7, v10, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);

}

- (int64_t)modalTransitionStyle
{
  return 2;
}

- (void)setModalTransitionStyle:(int64_t)a3
{
  sub_19D8658E4(self, (uint64_t)a2, a3, (SEL *)&selRef_setModalTransitionStyle_);
}

- (int64_t)modalPresentationStyle
{
  return 0;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  sub_19D8658E4(self, (uint64_t)a2, a3, (SEL *)&selRef_setModalPresentationStyle_);
}

- (int64_t)overrideUserInterfaceStyle
{
  return 2;
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  sub_19D8658E4(self, (uint64_t)a2, a3, (SEL *)&selRef_setOverrideUserInterfaceStyle_);
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)invalidate
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  PKNearbyPeerPaymentSenderViewController *v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v3 = (char *)self + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_monitor;
  swift_beginAccess();
  sub_19D1BB334((uint64_t)v3, (uint64_t)v8);
  v4 = v9;
  v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 80);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);

}

- (PKNearbyPeerPaymentSenderViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  void *v6;
  void *v7;
  PKNearbyPeerPaymentSenderViewController *result;

  v6 = _Block_copy(a4);
  v7 = _Block_copy(a5);
  _Block_release(v6);
  _Block_release(v7);
  result = (PKNearbyPeerPaymentSenderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_monitor);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_spinnerStateLabels));
}

@end

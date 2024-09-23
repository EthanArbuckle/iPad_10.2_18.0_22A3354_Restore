@implementation PKNearbyPeerPaymentReceiverViewController

- (PKNearbyPeerPaymentReceiverViewController)initWithUserInfo:(id)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PKNearbyPeerPaymentReceiverViewController *v11;
  PKNearbyPeerPaymentReceiverViewController *v12;

  v6 = _Block_copy(a4);
  v7 = _Block_copy(a5);
  v8 = sub_19DE87AC8();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v6;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v7;
  sub_19D3352EC(v8, (uint64_t)sub_19D266A30, v9, (uint64_t)sub_19D3364BC, v10);
  v12 = v11;
  swift_release();
  swift_release();
  return v12;
}

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyPeerPaymentReceiverViewController();
  v2 = v5.receiver;
  -[PKNearbyPeerPaymentViewController viewDidLoad](&v5, sel_viewDidLoad);
  type metadata accessor for NearbyPeerPaymentReceiverVFXViewController();
  v3 = swift_dynamicCastClass();
  if (v3)
  {
    v4 = v3 + OBJC_IVAR____TtC9PassKitUI42NearbyPeerPaymentReceiverVFXViewController_animationDelegate;
    swift_beginAccess();
    *(_QWORD *)(v4 + 8) = &protocol witness table for NearbyPeerPaymentReceiverViewController;
    swift_unknownObjectWeakAssign();
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  PKNearbyPeerPaymentReceiverViewController *v4;

  v4 = self;
  sub_19D3314FC(a3, (SEL *)&selRef_viewDidAppear_);

}

- (void)viewDidDisappear:(BOOL)a3
{
  PKNearbyPeerPaymentReceiverViewController *v4;

  v4 = self;
  sub_19D3314FC(a3, (SEL *)&selRef_viewDidDisappear_);

}

- (void)viewDidLayoutSubviews
{
  PKNearbyPeerPaymentReceiverViewController *v2;

  v2 = self;
  sub_19D331690();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidate
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  PKNearbyPeerPaymentReceiverViewController *v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v3 = (char *)self + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_transferMonitor;
  swift_beginAccess();
  sub_19D1BB334((uint64_t)v3, (uint64_t)v8);
  v4 = v9;
  v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 96);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);

}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6;
  id v7;
  PKNearbyPeerPaymentReceiverViewController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(id, uint64_t, uint64_t);
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D4220E0(v7);
  v9 = (uint64_t)v8 + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_transferMonitor;
  swift_beginAccess();
  v10 = *(_QWORD *)(v9 + 24);
  v11 = *(_QWORD *)(v9 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v9, v10);
  v12 = *(void (**)(id, uint64_t, uint64_t))(v11 + 72);
  v13 = v7;
  v12(v7, v10, v11);
  swift_endAccess();

}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  if (a4)
    -[PKNearbyPeerPaymentReceiverViewController presentViewController:animated:completion:](self, sel_presentViewController_animated_completion_, a4, 1, 0);
  else
    __break(1u);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id v6;
  PKNearbyPeerPaymentReceiverViewController *v7;

  v6 = a3;
  v7 = self;
  sub_19D335E94(a3);

}

- (PKNearbyPeerPaymentReceiverViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  void *v6;
  void *v7;
  PKNearbyPeerPaymentReceiverViewController *result;

  v6 = _Block_copy(a4);
  v7 = _Block_copy(a5);
  _Block_release(v6);
  _Block_release(v7);
  result = (PKNearbyPeerPaymentReceiverViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_peerPaymentAccount));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_transferMonitor);
  sub_19D1CE5EC((uint64_t)self + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_state, type metadata accessor for NearbyPeerPaymentReceiverState);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_accountResolutionController));
  swift_unknownObjectRelease();
}

@end

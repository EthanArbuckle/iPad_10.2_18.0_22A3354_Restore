@implementation PKNearbyPeerPaymentViewController

- (BOOL)hideStatusBar
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PKNearbyPeerPaymentViewController_hideStatusBar;
  swift_beginAccess();
  return *v2;
}

- (void)setHideStatusBar:(BOOL)a3
{
  PKNearbyPeerPaymentViewController *v4;

  v4 = self;
  sub_19D420328(a3);

}

- (PKNearbyPeerPaymentViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  return (PKNearbyPeerPaymentViewController *)NearbyPeerPaymentViewController.init(context:screenEdgeSwipeAction:dismissAction:)(a3, (uint64_t)sub_19D266A30, v9, (uint64_t)sub_19D3364BC, v10);
}

- (PKNearbyPeerPaymentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D42284C();
}

- (void)viewDidLoad
{
  PKNearbyPeerPaymentViewController *v2;

  v2 = self;
  sub_19D420D98();

}

- (void)viewDidLayoutSubviews
{
  PKNearbyPeerPaymentViewController *v2;

  v2 = self;
  sub_19D4211E4();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showAppearanceDetail
{
  PKNearbyPeerPaymentViewController *v2;

  v2 = self;
  sub_19D42054C();

}

- (void)handlePan:(id)a3
{
  id v4;
  PKNearbyPeerPaymentViewController *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)3)
    (*(void (**)(void))((char *)&v5->super.super.super.isa
                      + OBJC_IVAR___PKNearbyPeerPaymentViewController_screenEdgeSwipeAction))();

}

- (BOOL)prefersStatusBarHidden
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PKNearbyPeerPaymentViewController_hideStatusBar;
  swift_beginAccess();
  return *v2;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6;
  id v7;
  PKNearbyPeerPaymentViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D4220E0(v7);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  PKNearbyPeerPaymentViewController *v8;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKNearbyPeerPaymentViewController_divider);
  v5 = a3;
  v8 = self;
  objc_msgSend(v5, sel_contentOffset);
  v6 = 0.0;
  if (v7 > 0.0)
    v6 = 1.0;
  objc_msgSend(v4, sel_setAlpha_, v6);

}

- (PKNearbyPeerPaymentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PKNearbyPeerPaymentViewController *result;

  v4 = a4;
  result = (PKNearbyPeerPaymentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentViewController_vfxViewController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentViewController_identityManager));

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end

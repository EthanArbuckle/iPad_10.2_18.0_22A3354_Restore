@implementation NearbyPeerPaymentVFXViewController

- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)init
{
  return (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController *)NearbyPeerPaymentVFXViewController.init()();
}

- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D61CAB4();
}

- (void)viewDidLoad
{
  char *v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXViewController();
  v2 = (char *)v5.receiver;
  -[NearbyPeerPaymentVFXViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(_QWORD *)&v2[OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_vfxView]);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  _TtC9PassKitUI34NearbyPeerPaymentVFXViewController *v2;

  v2 = self;
  sub_19D61B914();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9PassKitUI34NearbyPeerPaymentVFXViewController *v4;

  v4 = self;
  sub_19D61BE04(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXViewController();
  v4 = v5.receiver;
  -[NearbyPeerPaymentVFXViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_motionManager], sel_stopDeviceMotionUpdates, v5.receiver, v5.super_class);
  v4[OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_isMonitoringMotion] = 0;

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9PassKitUI34NearbyPeerPaymentVFXViewController *result;

  v4 = a4;
  result = (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_amount));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_vfxView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_camera));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_world));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_ambientEmitter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_nodeBindings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_unknownAmountEmitter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_digitRoot));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_digitTemplate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_transferStatusParticles));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_blueRing));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_blueRingParticles));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_transferParticlesBurstA));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_transferParticlesBurstB));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_pulsingGradient));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_motionManager));
  swift_release();
}

@end

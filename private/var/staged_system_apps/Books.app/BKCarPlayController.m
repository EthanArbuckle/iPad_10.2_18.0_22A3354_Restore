@implementation BKCarPlayController

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  BKCarPlayController *v5;
  id v6;
  BKCarPlayController *v7;
  objc_super v8;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKCarPlayController_acknowledgementObservation);
  if (v3)
  {
    v4 = (void *)objc_opt_self(NSNotificationCenter);
    v5 = self;
    swift_unknownObjectRetain(v3);
    v6 = objc_msgSend(v4, "defaultCenter");
    objc_msgSend(v6, "removeObserver:", v3);
    swift_unknownObjectRelease(v3);

  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CarPlayController();
  -[BKCarPlayController dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCarPlayController_dataManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCarPlayController_presenter));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___BKCarPlayController_acknowledgementObservation));
}

- (BKCarPlayController)init
{
  return (BKCarPlayController *)CarPlayController.init()();
}

- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v6;
  id v7;
  BKCarPlayController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CarPlayController.templateApplicationScene(_:didConnect:)((CPTemplateApplicationScene)v6, (CPInterfaceController)v7);

}

- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4
{
  id v6;
  id v7;
  BKCarPlayController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s5Books17CarPlayControllerC24templateApplicationScene_022didDisconnectInterfaceD0ySo010CPTemplatefG0C_So011CPInterfaceD0CtF_0();

}

- (void)templateWillAppear:(id)a3 animated:(BOOL)a4
{
  id v5;
  BKCarPlayController *v6;

  v5 = a3;
  v6 = self;
  _s5Books17CarPlayControllerC18templateWillAppear_8animatedySo10CPTemplateC_SbtF_0(v5);

}

- (void)templateWillDisappear:(id)a3 animated:(BOOL)a4
{
  id v5;
  BKCarPlayController *v6;

  v5 = a3;
  v6 = self;
  _s5Books17CarPlayControllerC21templateWillDisappear_8animatedySo10CPTemplateC_SbtF_0(v5);

}

@end

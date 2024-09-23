@implementation CRLiOSPrintCoordinator

- (_TtC8Freeform22CRLiOSPrintCoordinator)init
{
  return (_TtC8Freeform22CRLiOSPrintCoordinator *)sub_1006D2048();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_boardActor));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_scenes));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printOptionsViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printInteractionController));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printInteractionContinuation, &qword_1013ED308);
}

- (id)printInteractionControllerParentViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_parentViewController));
}

- (void)printInteractionControllerDidFinishJob:(id)a3
{
  void *v4;
  id v5;
  _TtC8Freeform22CRLiOSPrintCoordinator *v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printInteractionController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_printInteractionController) = 0;
  v5 = a3;
  v6 = self;

  *((_BYTE *)&v6->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_isPresenting) = 0;
}

- (void)printInteractionControllerDidDismissPrinterOptions:(id)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform22CRLiOSPrintCoordinator_isPresenting) = 0;
}

- (id)appOptionsViewController
{
  _TtC8Freeform22CRLiOSPrintCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1006D23C8();

  return v3;
}

@end

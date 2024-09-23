@implementation CRLiOSMiniShapePickerHostingController

- (_TtC8Freeform38CRLiOSMiniShapePickerHostingController)initWithCoder:(id)a3
{
  id v4;
  _TtC8Freeform38CRLiOSMiniShapePickerHostingController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_associatedBoardItems) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_interactiveCanvasController) = 0;
  v4 = a3;

  result = (_TtC8Freeform38CRLiOSMiniShapePickerHostingController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLMiniShapePickerSupport.swift", 40, 2, 269, 0);
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSMiniShapePickerHostingController();
  v4 = (char *)v6.receiver;
  -[CRLiOSMiniShapePickerHostingController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_interactiveCanvasController];
  if (v5)
    objc_msgSend(v5, "addDecorator:", v4, v6.receiver, v6.super_class);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8Freeform38CRLiOSMiniShapePickerHostingController *v4;

  v4 = self;
  sub_1009F8E70(a3);

}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform38CRLiOSMiniShapePickerHostingController *v9;
  _QWORD v10[4];

  v7 = type metadata accessor for CRLChangeRecord();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  swift_unknownObjectRetain(a4);
  v9 = self;
  _bridgeAnyObjectToAny(_:)(v10, a4);
  swift_unknownObjectRelease(a4);
  sub_1009F9098(v8, (uint64_t)v10);

  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v10);
}

- (NSArray)decoratorOverlayRenderables
{
  sub_1004B8930(0, (unint64_t *)&qword_1013EE6D0, off_101229820);
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (void)willBeginZoomingOperation
{
  _TtC8Freeform38CRLiOSMiniShapePickerHostingController *v2;

  v2 = self;
  sub_1009F9594();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_associatedBoardItems));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform38CRLiOSMiniShapePickerHostingController_interactiveCanvasController));
}

@end

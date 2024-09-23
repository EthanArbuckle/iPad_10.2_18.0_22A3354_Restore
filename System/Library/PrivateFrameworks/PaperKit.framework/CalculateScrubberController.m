@implementation CalculateScrubberController

- (void)showScrubberFor:(id)a3 frame:(CGRect)a4 compact:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v11;
  void *v12;
  void *v13;
  _TtC8PaperKit27CalculateScrubberController *v14;
  Swift::String v15;
  __C::CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  v14 = self;
  v15._countAndFlagsBits = v11;
  v15._object = v13;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  CalculateScrubberController.showScrubber(for:frame:compact:)(v15, v16, a5);

  swift_bridgeObjectRelease();
}

- (void)hideScrubber
{
  _TtC8PaperKit27CalculateScrubberController *v2;

  v2 = self;
  CalculateScrubberController.hideScrubber()();

}

- (id)activeScrubberView
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit27CalculateScrubberController_viewController);
  if (v2)
    return objc_autoreleaseReturnValue(objc_retain(*(id *)(v2
                                                         + direct field offset for CalculateScrubberViewController.hostingView)));
  else
    return 0;
}

- (void)sendValueChanged
{
  _TtC8PaperKit27CalculateScrubberController *v2;

  v2 = self;
  CalculateScrubberController.sendValueChanged()();

}

- (_TtC8PaperKit27CalculateScrubberController)init
{
  _TtC8PaperKit27CalculateScrubberController *result;

  result = (_TtC8PaperKit27CalculateScrubberController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit27CalculateScrubberController_delegate);
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  _TtC8PaperKit27CalculateScrubberController *v8;

  v5 = (void *)MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit27CalculateScrubberController_delegate, a2);
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, sel_respondsToSelector_, sel_scrubberControllerDidDismiss_) & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      objc_msgSend(v6, sel_scrubberControllerDidDismiss_, v8);

    }
    swift_unknownObjectRelease();
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end

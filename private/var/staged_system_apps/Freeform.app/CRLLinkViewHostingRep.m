@implementation CRLLinkViewHostingRep

- (NSString)crlaxLabel
{
  _TtC8Freeform21CRLLinkViewHostingRep *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  CRLLinkViewHostingRep.getAccessibilityLabelTokens(forUserInput:)(0);
  v3 = sub_1004B804C((uint64_t *)&unk_1013E4970);
  v4 = sub_1004CBA30((unint64_t *)&qword_1013DFC40, (uint64_t *)&unk_1013E4970, (uint64_t)&protocol conformance descriptor for [A]);
  BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v3, v4);

  swift_bridgeObjectRelease();
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSArray)crlaxUserInputLabels
{
  _TtC8Freeform21CRLLinkViewHostingRep *v2;
  Class isa;

  v2 = self;
  CRLLinkViewHostingRep.getAccessibilityLabelTokens(forUserInput:)(1);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)directlyManagesContentPlatformView
{
  void *v3;
  _TtC8Freeform21CRLLinkViewHostingRep *v4;
  CRLCanvas *v5;
  _TtC8Freeform21CRLLinkViewHostingRep *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_opt_self(NSThread);
  v4 = self;
  if (objc_msgSend(v3, "isMainThread")
    && (v5 = -[CRLCanvasRep canvas](v4, "canvas")) != 0)
  {
    v6 = (_TtC8Freeform21CRLLinkViewHostingRep *)v5;
    v7 = -[CRLCanvas isCanvasInteractive](v5, "isCanvasInteractive");

    v4 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIView)contentPlatformView
{
  _TtC8Freeform21CRLLinkViewHostingRep *v2;
  void *v3;
  void *v4;

  v2 = self;
  CRLLinkViewHostingRep.contentPlatformView.getter();
  v4 = v3;

  return (UIView *)v4;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC8Freeform21CRLLinkViewHostingRep *v5;

  v4 = a3;
  v5 = self;
  CRLLinkViewHostingRep.draw(in:)(v4);

}

- (void)cancelReload:(id)a3
{
  _TtC8Freeform21CRLLinkViewHostingRep *v4;
  uint64_t v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6, v5);

    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_1004CB800((uint64_t)v6, &qword_1013E0230);
}

- (void)handleFadeOutForZoom
{
  _TtC8Freeform21CRLLinkViewHostingRep *v2;

  v2 = self;
  CRLLinkViewHostingRep.handleFadeOutForZoom()();

}

- (void)handleFadeInForZoom
{
  _TtC8Freeform21CRLLinkViewHostingRep *v2;

  v2 = self;
  CRLLinkViewHostingRep.handleFadeInForZoom()();

}

- (void)viewScaleDidChange
{
  _TtC8Freeform21CRLLinkViewHostingRep *v2;

  v2 = self;
  CRLLinkViewHostingRep.viewScaleDidChange()();

}

- (void)dynamicallyRotatingWithTracker:(id)a3
{
  sub_100BFEA34((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_dynamicallyRotatingWithTracker_);
}

- (void)willUpdateRenderable:(id)a3
{
  sub_100BFEA34((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_willUpdateRenderable_);
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  _TtC8Freeform21CRLLinkViewHostingRep *v4;
  char v5;
  char v6;

  v4 = self;
  _s8Freeform21CRLLinkViewHostingRepC15handleDoubleTap2at9inputTypeSbSo7CGPointV_So08CRLInputK0VtF_0();
  v6 = v5;

  return v6 & 1;
}

- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3
{
  CGContext *v4;
  _TtC8Freeform21CRLLinkViewHostingRep *v5;

  v4 = a3;
  v5 = self;
  CRLLinkViewHostingRep.drawInContextWithoutEffectsForAlphaOnly(_:)(v4);

}

- (NSArray)accessibilityCustomActions
{
  _TtC8Freeform21CRLLinkViewHostingRep *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = CRLLinkViewHostingRep.accessibilityCustomActions.getter();

  if (v3)
  {
    sub_1004B8930(0, &qword_1013E78E8, UIAccessibilityCustomAction_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (_TtC8Freeform21CRLLinkViewHostingRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v5;
  id v6;
  _TtC8Freeform21CRLLinkViewHostingRep *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC8Freeform21CRLLinkViewHostingRep *)sub_100BFF77C((uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform21CRLLinkViewHostingRep____lazy_storage___reloadView));
}

@end

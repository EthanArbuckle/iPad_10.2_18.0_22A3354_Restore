@implementation CRLiOSMiniFormatterBuilder

+ (double)defaultRowHeight
{
  if (qword_1013DC8B0 != -1)
    swift_once(&qword_1013DC8B0, sub_1004C5444);
  return *(double *)&qword_10147E6D0;
}

+ (id)makeSmallButtonWith:(id)a3 title:(id)a4 action:(id)a5 backgroundColor:(id)a6 pressedBackgroundColor:(id)a7 foregroundColor:(id)a8 pressedForegroundColor:(id)a9 cornerRadius:(double)a10 italicTitle:(BOOL)a11
{
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v26;
  uint64_t v27;
  uint64_t v28;

  if (a4)
  {
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v28 = v18;
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
  swift_getObjCClassMetadata(a1);
  v26 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = sub_1004C8F18(a3, v27, v28, a5, a6, a7, v22, v23, a10, a11);

  swift_bridgeObjectRelease(v28);
  return v24;
}

- (id)viewControllerForLargeContentViewerInteraction:(id)a3
{
  id v4;
  _TtC8Freeform26CRLiOSMiniFormatterBuilder *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1004CB2D0();

  return v6;
}

- (_TtC8Freeform26CRLiOSMiniFormatterBuilder)init
{
  _TtC8Freeform26CRLiOSMiniFormatterBuilder *result;

  result = (_TtC8Freeform26CRLiOSMiniFormatterBuilder *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSMiniFormatterBuilder", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_interactiveCanvasController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_boardItemDataProvider));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_crlaxPopoverContainerViewController);
  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_crlaxAccessibilityFormatterLabel]);
}

@end

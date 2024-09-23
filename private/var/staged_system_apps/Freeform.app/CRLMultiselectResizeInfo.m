@implementation CRLMultiselectResizeInfo

- (_TtC8Freeform24CRLMultiselectResizeInfo)initWithParentInfo:(id)a3
{
  _TtC8Freeform24CRLMultiselectResizeInfo *v4;

  swift_unknownObjectRetain(a3);
  v4 = (_TtC8Freeform24CRLMultiselectResizeInfo *)sub_10071D258((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (CRLCanvasElementInfo)parentInfo
{
  return (CRLCanvasElementInfo *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_parentInfo));
}

- (void)setParentInfo:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_parentInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_parentInfo) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (CRLCanvasInfoGeometry)geometry
{
  return (CRLCanvasInfoGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_geometry));
}

- (void)setGeometry:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_geometry);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_geometry) = (Class)a3;
  v3 = a3;

}

- (BOOL)isSelectable
{
  return 0;
}

- (BOOL)isSupported
{
  return 1;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013EF948, off_101229950);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  Class result;

  result = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_repClass);
  if (result)
    return (Class)swift_getObjCClassFromMetadata(result, a2);
  return result;
}

- (Class)editorClass
{
  return 0;
}

- (void)setRepresentedSelectedBoardItems:(id)a3 currentlyLaidOutWith:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8Freeform24CRLMultiselectResizeInfo *v11;

  v7 = type metadata accessor for CRLBoardItem(0);
  v8 = sub_10058528C();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_10071CFF0(v9, v10);

  swift_bridgeObjectRelease(v9);
}

- (NSSet)representedSelectedBoardItems
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo__selectedBoardItems);
  type metadata accessor for CRLBoardItem(0);
  sub_10058528C();
  swift_bridgeObjectRetain(v2);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSSet *)isa;
}

- (_TtC8Freeform24CRLMultiselectResizeInfo)init
{
  _TtC8Freeform24CRLMultiselectResizeInfo *result;

  result = (_TtC8Freeform24CRLMultiselectResizeInfo *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLMultiselectResizeInfo", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo__selectedBoardItems));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_parentInfo));

}

@end

@implementation CRLWPLayout

- (_TtC8Freeform11CRLWPLayout)initWithInfo:(id)a3
{
  _TtC8Freeform11CRLWPLayout *v4;

  swift_unknownObjectRetain(a3);
  v4 = (_TtC8Freeform11CRLWPLayout *)sub_10062E2A0((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (BOOL)parentAutosizes
{
  _TtC8Freeform11CRLWPLayout *v2;
  CRLCanvasAbstractLayout *v3;
  CRLCanvasAbstractLayout *v4;
  void *v5;
  id v6;
  BOOL v7;
  objc_class *v8;
  __objc2_prot *v10;
  objc_super v11;

  v2 = self;
  v3 = -[CRLCanvasAbstractLayout parent](v2, "parent");
  if (!v3)
    goto LABEL_5;
  v4 = v3;
  v10 = &OBJC_PROTOCOL____TtP8Freeform17CRLWPLayoutParent_;
  v5 = (void *)swift_dynamicCastObjCProtocolConditional(v3, 1, &v10);
  if (!v5)
  {

LABEL_5:
    v8 = (objc_class *)type metadata accessor for CRLWPLayout();
    v11.receiver = v2;
    v11.super_class = v8;
    v7 = -[CRLCanvasLayout parentAutosizes](&v11, "parentAutosizes");

    return v7;
  }
  v6 = objc_msgSend(v5, "autosizeFlagsFor:", v2);

  return v6 != 0;
}

- (void)validate
{
  _TtC8Freeform11CRLWPLayout *v2;

  v2 = self;
  CRLWPLayout.validate()();

}

- (void)invalidateTextLayout
{
  _TtC8Freeform11CRLWPLayout *v2;

  v2 = self;
  if (-[CRLWPLayout parentAutosizes](v2, "parentAutosizes"))
    -[CRLWPLayout invalidateSize](v2, "invalidateSize");
  *((_BYTE *)&v2->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLWPLayout_textLayoutIsValid) = 0;
  -[CRLCanvasLayout invalidate](v2, "invalidate");
  -[CRLCanvasLayout setNeedsDisplay](v2, "setNeedsDisplay");

}

- (void)invalidateSize
{
  objc_super v2;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLWPLayout_textLayoutIsValid) = 0;
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CRLWPLayout();
  -[CRLCanvasLayout invalidateSize](&v2, "invalidateSize");
}

- (id)computeLayoutGeometry
{
  _TtC8Freeform11CRLWPLayout *v2;
  CRLCanvasLayoutGeometry_optional *v3;
  void *v4;
  void *v5;

  v2 = self;
  CRLWPLayout.computeLayoutGeometry()(v3);
  v5 = v4;

  return v5;
}

- (BOOL)markedTextContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform11CRLWPLayout *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_100625424(x, y);

  return v6 & 1;
}

- (id)selectionRectsFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8Freeform11CRLWPLayout *v8;
  id v9;
  uint64_t v10;
  Class isa;
  uint64_t v13;

  v5 = type metadata accessor for CRLTextRange();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = qword_1013DCB58;
  v8 = self;
  if (v7 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v9 = (id)qword_10147ECB0;
  swift_bridgeObjectRetain(v6);
  sub_100625FAC((uint64_t)v8, v6, &v13);

  swift_bridgeObjectRelease_n(v6, 2);
  v10 = v13;
  type metadata accessor for CRLTextSelectionRect();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return isa;
}

- (id)closestPositionTo:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  _TtC8Freeform11CRLWPLayout *v6;
  id v7;
  id v9;

  y = a3.y;
  x = a3.x;
  v5 = qword_1013DCB58;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v7 = (id)qword_10147ECB0;
  sub_100627450(v6, 1, &v9, x, y);

  return v9;
}

- (BOOL)shouldInvalidateSizeWhenInvalidateSizeOfReliedOnLayout:(id)a3
{
  return 1;
}

- (NSArray)dependentLayouts
{
  _TtC8Freeform11CRLWPLayout *v2;
  double *v3;
  NSArray v4;

  v2 = self;
  v3 = CRLWPLayout.dependentLayouts.getter();

  if (v3)
  {
    sub_1004B8930(0, (unint64_t *)&qword_1013FC960, off_101229810);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 completionBlock:(id)a6
{
  void *v10;
  void (*v11)(__n128);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _TtC8Freeform11CRLWPLayout *v17;

  v10 = _Block_copy(a5);
  v11 = (void (*)(__n128))_Block_copy(a6);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;
  v15 = swift_allocObject(&unk_101272F48, 24, 7);
  *(_QWORD *)(v15 + 16) = v10;
  if (v11)
  {
    v16 = swift_allocObject(&unk_101272F70, 24, 7);
    *(_QWORD *)(v16 + 16) = v11;
    v11 = (void (*)(__n128))sub_100565828;
  }
  else
  {
    v16 = 0;
  }
  v17 = self;
  CRLWPLayout.layoutSearch(for:options:hit:completionBlock:)(v12, v14, a4, (uint64_t)sub_10062E614, v15, v11, v16);
  sub_1004C1024((uint64_t)v11, v16);

  swift_bridgeObjectRelease(v14);
  swift_release(v15);
}

- (void)layoutSearchForSpellingErrorsWithHitBlock:(id)a3 stop:(BOOL *)a4
{
  void *v6;
  uint64_t v7;
  _TtC8Freeform11CRLWPLayout *v8;

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_101272F20, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  CRLWPLayout.layoutSearchForSpellingErrors(hit:stop:)((uint64_t)sub_10062E570, v7, (uint64_t)a4);

  swift_release(v7);
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  id v4;
  _TtC8Freeform11CRLWPLayout *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  v5 = self;
  CRLWPLayout.rectInRoot(for:)(v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)rectInRootOfAutoZoomContextOfSelectionPath:(id)a3
{
  id v4;
  _TtC8Freeform11CRLWPLayout *v5;
  CRLCanvasAbstractLayout *v6;
  CRLCanvasAbstractLayout *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  v4 = a3;
  v5 = self;
  v6 = -[CRLCanvasAbstractLayout parent](v5, "parent");
  if (!v6)
    goto LABEL_5;
  v7 = v6;
  v8 = objc_opt_self(CRLWPShapeLayout);
  v9 = (void *)swift_dynamicCastObjCClass(v7, v8);
  if (!v9)
  {

LABEL_5:
    v26.receiver = v5;
    v26.super_class = (Class)type metadata accessor for CRLWPLayout();
    -[CRLCanvasLayout rectInRootOfAutoZoomContextOfSelectionPath:](&v26, "rectInRootOfAutoZoomContextOfSelectionPath:", v4);
    v11 = v18;
    v13 = v19;
    v15 = v20;
    v17 = v21;

    goto LABEL_6;
  }
  objc_msgSend(v9, "rectInRootOfAutoZoomContextOfSelectionPath:", v4);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

LABEL_6:
  v22 = v11;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (double)viewScaleForZoomingToSelectionPath:(id)a3 targetPointSize:(double)a4
{
  id v6;
  _TtC8Freeform11CRLWPLayout *v7;
  CRLCanvasAbstractLayout *v8;
  CRLCanvasAbstractLayout *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v6 = a3;
  v7 = self;
  v8 = -[CRLCanvasAbstractLayout parent](v7, "parent");
  if (!v8)
    goto LABEL_5;
  v9 = v8;
  v10 = objc_opt_self(CRLWPShapeLayout);
  v11 = (void *)swift_dynamicCastObjCClass(v9, v10);
  if (!v11)
  {

LABEL_5:
    v16.receiver = v7;
    v16.super_class = (Class)type metadata accessor for CRLWPLayout();
    -[CRLCanvasLayout viewScaleForZoomingToSelectionPath:targetPointSize:](&v16, "viewScaleForZoomingToSelectionPath:targetPointSize:", v6, a4);
    v13 = v14;

    return v13;
  }
  objc_msgSend(v11, "viewScaleForZoomingToSelectionPath:targetPointSize:", v6, a4);
  v13 = v12;

  return v13;
}

- (BOOL)isOverflowing
{
  _TtC8Freeform11CRLWPLayout *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = CRLWPLayout.isOverflowing()();

  return v3;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform11CRLWPLayout_geometryWhenLastInvalidated));
}

- (BOOL)caresAboutStorageChanges
{
  return 0;
}

- (id)textWrapper
{
  _TtC8Freeform11CRLWPLayout *v2;
  CRLCanvasAbstractLayout *v3;
  uint64_t v4;
  _TtC8Freeform11CRLWPLayout *v5;

  v2 = self;
  v3 = -[CRLCanvasAbstractLayout parent](v2, "parent");
  if (v3)
  {
    v4 = objc_opt_self(CRLWPShapeLayout);
    v5 = (_TtC8Freeform11CRLWPLayout *)swift_dynamicCastObjCClass(v3, v4);
    if (!v5)

    v3 = (CRLCanvasAbstractLayout *)-[CRLWPLayout textWrapper](v5, "textWrapper");
  }
  else
  {
    v5 = v2;
  }

  return v3;
}

- (id)columnMetricsForCharIndex:(int64_t)a3 outRange:(_NSRange *)a4
{
  _TtC8Freeform11CRLWPLayout *v4;
  CRLCanvasAbstractLayout *v5;
  CRLCanvasAbstractLayout *v6;
  void *v7;
  _QWORD v9[2];

  v4 = self;
  v5 = -[CRLCanvasAbstractLayout parent](v4, "parent");
  if (v5)
  {
    v6 = v5;
    v9[0] = &OBJC_PROTOCOL___NSObject;
    v9[1] = &OBJC_PROTOCOL___CRLWPColumnMetrics;
    v7 = (void *)swift_dynamicCastObjCProtocolConditional(v5, 2, v9);

    if (!v7)
  }
  else
  {

    v7 = 0;
  }
  return v7;
}

- (NSMutableArray)columns
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLWPLayout__columns);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform11CRLWPLayout__columns, v4, 0, 0);
  return (NSMutableArray *)*v2;
}

- (CRLWPOffscreenColumn)previousTargetLastColumn
{
  return (CRLWPOffscreenColumn *)0;
}

- (CRLWPOffscreenColumn)nextTargetFirstColumn
{
  return (CRLWPOffscreenColumn *)0;
}

- (CRLWPTextSource)storage
{
  return (CRLWPTextSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR____TtC8Freeform11CRLWPLayout_wpStorage));
}

- (BOOL)isLastTarget
{
  return 1;
}

- (BOOL)isInstructional
{
  _TtC8Freeform11CRLWPLayout *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = CRLWPLayout.isInstructional.getter();

  return v3 & 1;
}

- (CGSize)minSize
{
  _TtC8Freeform11CRLWPLayout *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = CRLWPLayout.minSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)maxSize
{
  _TtC8Freeform11CRLWPLayout *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = CRLWPLayout.maxSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)currentSize
{
  _TtC8Freeform11CRLWPLayout *v2;
  CRLCanvasLayoutGeometry *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = self;
  v3 = -[CRLCanvasAbstractLayout geometry](v2, "geometry");
  -[CRLCanvasLayoutGeometry size](v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGPoint)position
{
  _TtC8Freeform11CRLWPLayout *v2;
  CRLCanvasLayoutGeometry *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  v2 = self;
  v3 = -[CRLCanvasAbstractLayout geometry](v2, "geometry");
  -[CRLCanvasLayoutGeometry frame](v3, "frame");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)anchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (unint64_t)autosizeFlags
{
  return (unint64_t)sub_10062A05C(self, (uint64_t)a2, (SEL *)&selRef_autosizeFlagsFor_);
}

- (int64_t)verticalAlignment
{
  return (int64_t)sub_10062A05C(self, (uint64_t)a2, (SEL *)&selRef_verticalAlignmentFor_);
}

- (int64_t)naturalAlignment
{
  _TtC8Freeform11CRLWPLayout *v2;
  CRLCanvasAbstractLayout *v3;
  CRLCanvasAbstractLayout *v4;
  void *v5;
  id v6;
  __objc2_prot *v8;

  v2 = self;
  v3 = -[CRLCanvasAbstractLayout parent](v2, "parent");
  if (!v3)
  {

    return 4;
  }
  v4 = v3;
  v8 = &OBJC_PROTOCOL____TtP8Freeform17CRLWPLayoutParent_;
  v5 = (void *)swift_dynamicCastObjCProtocolConditional(v3, 1, &v8);
  if (!v5)
  {

    return 4;
  }
  v6 = objc_msgSend(v5, "naturalAlignmentFor:", v2);

  return (int64_t)v6;
}

- (int64_t)naturalDirection
{
  return 0;
}

- (BOOL)wantsLineFragments
{
  return 1;
}

- (unint64_t)pageNumber
{
  return 0;
}

- (unint64_t)pageCount
{
  return 0;
}

- (BOOL)textIsVertical
{
  return sub_10062A324(self, (uint64_t)a2, (SEL *)&selRef_textLayoutShouldLayoutVertically_);
}

- (BOOL)layoutIsValid
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform11CRLWPLayout_textLayoutIsValid);
}

- (BOOL)shouldWrapAroundExternalDrawables
{
  return sub_10062A324(self, (uint64_t)a2, (SEL *)&selRef_textLayoutShouldWrapAroundExternalDrawables_);
}

- (CRLWrapSegments)interiorWrapSegments
{
  _TtC8Freeform11CRLWPLayout *v2;
  CRLCanvasAbstractLayout *v3;
  CRLCanvasAbstractLayout *v4;
  void *v5;
  id v6;
  __objc2_prot *v8;

  v2 = self;
  v3 = -[CRLCanvasAbstractLayout parent](v2, "parent");
  if (v3)
  {
    v4 = v3;
    v8 = &OBJC_PROTOCOL____TtP8Freeform17CRLWPLayoutParent_;
    v5 = (void *)swift_dynamicCastObjCProtocolConditional(v3, 1, &v8);
    if (v5)
    {
      v6 = objc_msgSend(v5, "interiorWrapSegmentsFor:", v2);

      return (CRLWrapSegments *)v6;
    }

  }
  else
  {

  }
  return (CRLWrapSegments *)0;
}

- (id)interiorClippingPath
{
  return 0;
}

- (void)setNeedsDisplayInTargetRect:(CGRect)a3
{
  -[CRLCanvasLayout setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)descendersCannotClip
{
  return 0;
}

@end

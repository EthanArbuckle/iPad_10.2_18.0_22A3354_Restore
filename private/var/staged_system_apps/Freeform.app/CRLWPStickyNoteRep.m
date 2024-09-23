@implementation CRLWPStickyNoteRep

- (BOOL)allowsColorDrop
{
  return 0;
}

- (BOOL)canMakePathEditable
{
  return 0;
}

- (void)becameSelected
{
  _TtC8Freeform18CRLWPStickyNoteRep *v2;

  v2 = self;
  sub_10055630C();

}

- (void)becameNotSelected
{
  _TtC8Freeform18CRLWPStickyNoteRep *v2;

  v2 = self;
  sub_100556534();

}

- (BOOL)shouldSelectInfoWhenTargetOfDrag:(id)a3
{
  return 0;
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  double height;
  double width;
  id v11;
  _TtC8Freeform18CRLWPStickyNoteRep *v12;
  CRLCanvasLayout *v13;
  CRLCanvasLayoutGeometry *v14;
  id v15;
  _TtC8Freeform18CRLWPStickyNoteRep *v16;
  CGImage *v17;

  height = a3.height;
  width = a3.width;
  v11 = a4;
  v12 = self;
  v13 = -[CRLCanvasRep layout](v12, "layout");
  v14 = -[CRLCanvasAbstractLayout geometryInRoot](v13, "geometryInRoot");

  v15 = v11;
  v16 = v12;
  v17 = (CGImage *)sub_100556E0C(v14, v15, (uint64_t)a5, a6, v16, (uint64_t)v15, (uint64_t)a5, a6, width, height);

  return v17;
}

- (_TtC8Freeform18CRLWPStickyNoteRep)initWithLayout:(id)a3 canvas:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLWPStickyNoteRep();
  return -[CRLWPShapeRep initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
}

@end

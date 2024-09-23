@implementation CRLSceneRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)willUpdateRenderable:(id)a3
{
  id v5;
  _TtC8Freeform11CRLSceneRep *v6;

  v5 = a3;
  v6 = self;
  sub_100758874(a3);

}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return 0;
}

- (_TtC8Freeform11CRLSceneRep)initWithLayout:(id)a3 canvas:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLSceneRep();
  return -[CRLCanvasRep initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
}

@end

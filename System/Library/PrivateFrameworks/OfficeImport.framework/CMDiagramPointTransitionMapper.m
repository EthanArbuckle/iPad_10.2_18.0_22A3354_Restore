@implementation CMDiagramPointTransitionMapper

- (CMDiagramPointTransitionMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 shapeType:(int)a6 adjustValues:(id)a7 parent:(id)a8
{
  id v15;
  CMDiagramPointTransitionMapper *v16;
  CMDiagramPointTransitionMapper *v17;
  objc_super v19;

  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CMDiagramPointTransitionMapper;
  v16 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:](&v19, sel_initWithPoint_drawingContext_orientedBounds_parent_, a3, a4, a5, a8);
  v17 = v16;
  if (v16)
  {
    v16->mShapeType = a6;
    objc_storeStrong((id *)&v16->mAdjustValues, a7);
  }

  return v17;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  void *v5;
  uint64_t mShapeType;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[CMDiagramPointMapper presentationWithName:](self, "presentationWithName:", CFSTR("sibTrans"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
    mShapeType = self->mShapeType;
    -[CMDiagramPointMapper fill](self, "fill");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDiagramPointMapper stroke](self, "stroke");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", mShapeType, v7, v8, self->mAdjustValues, self->super.mOrientedBounds, v9, self->super.mDrawingContext);

  }
}

- (CMDiagramPointTransitionMapper)initWithPoint:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 shapeType:(int)a6 parent:(id)a7
{
  return -[CMDiagramPointTransitionMapper initWithPoint:drawingContext:orientedBounds:shapeType:adjustValues:parent:](self, "initWithPoint:drawingContext:orientedBounds:shapeType:adjustValues:parent:", a3, a4, a5, *(_QWORD *)&a6, 0, a7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAdjustValues, 0);
}

@end

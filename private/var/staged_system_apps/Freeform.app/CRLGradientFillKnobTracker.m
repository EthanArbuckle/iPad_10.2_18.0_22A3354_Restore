@implementation CRLGradientFillKnobTracker

- (id)shapeLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layout"));

  return v3;
}

- (void)beginMovingKnob
{
  CRLGradientFillKnobTracker *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CRLMutableTransformGradientFill *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  objc_class *v24;
  CRLCanvasRep *v25;
  objc_super v26;

  v2 = self;
  v26.receiver = self;
  v26.super_class = (Class)CRLGradientFillKnobTracker;
  -[CRLCanvasKnobTracker beginMovingKnob](&v26, "beginMovingKnob");
  v4 = objc_opt_class(CRLGradientFill, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillKnobTracker shapeLayout](v2, "shapeLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fill"));
  v7 = sub_100221D0C(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillKnobTracker shapeLayout](v2, "shapeLayout"));
  objc_msgSend(v9, "boundsForStandardKnobs");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillKnobTracker shapeLayout](v2, "shapeLayout"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));

  v20 = -[CRLTransformGradientFill initWithGradient:inPath:andBounds:]([CRLMutableTransformGradientFill alloc], "initWithGradient:inPath:andBounds:", v8, v19, v11, v13, v15, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillKnobTracker shapeLayout](v2, "shapeLayout"));
  objc_msgSend(v21, "setDynamicFill:", v20);

  objc_msgSend(v8, "startPointForPath:andBounds:", v19, v11, v13, v15, v17);
  v2->mOriginalStartPoint.x = v22;
  v2->mOriginalStartPoint.y = v23;
  v2 = (CRLGradientFillKnobTracker *)((char *)v2 + 96);
  objc_msgSend(v8, "endPointForPath:andBounds:", v19, v11, v13, v15, v17);
  v2->super.super.isa = v24;
  v2->super._rep = v25;

}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int *v19;
  double *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  y = a3.y;
  x = a3.x;
  v6 = objc_opt_class(CRLMutableTransformGradientFill, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillKnobTracker shapeLayout](self, "shapeLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicFill"));
  v9 = sub_100221D0C(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  if (objc_msgSend(v11, "tag") == (id)25)
  {
    v12 = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    v12 = objc_msgSend(v13, "tag") == (id)26;

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillKnobTracker shapeLayout](self, "shapeLayout"));
  objc_msgSend(v14, "boundsForStandardKnobs");
  v16 = sub_1000603B8(x, y, v15);
  v18 = v17;

  if (objc_msgSend(v10, "gradientType"))
  {
    if (!v12)
      goto LABEL_13;
  }
  else
  {
    v19 = &OBJC_IVAR___CRLGradientFillKnobTracker_mOriginalStartPoint;
    if (v12)
      v19 = &OBJC_IVAR___CRLGradientFillKnobTracker_mOriginalEndPoint;
    v20 = (double *)((char *)self + *v19);
    v22 = *v20;
    v21 = v20[1];
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v23, "boundsForStandardKnobs");
    if (!v12)
    {
      objc_msgSend(v10, "setStartPoint:inShapeWithNaturalSize:", v22, v21);

LABEL_13:
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      objc_msgSend(v24, "boundsForStandardKnobs");
      objc_msgSend(v10, "setEndPoint:inShapeWithNaturalSize:", v16, v18);
      goto LABEL_14;
    }
    objc_msgSend(v10, "setEndPoint:inShapeWithNaturalSize:", v22, v21);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v24, "boundsForStandardKnobs");
  objc_msgSend(v10, "setStartPoint:inShapeWithNaturalSize:", v16, v18);
LABEL_14:

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v25, "invalidateKnobPositions");

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v26, "setNeedsDisplay");

  v27.receiver = self;
  v27.super_class = (Class)CRLGradientFillKnobTracker;
  -[CRLCanvasKnobTracker moveKnobToRepPosition:](&v27, "moveKnobToRepPosition:", v16, v18);

}

- (void)endMovingKnob
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _TtC8Freeform17CRLCommandSetFill *v8;
  void *v9;
  void *v10;
  _TtC8Freeform17CRLCommandSetFill *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLGradientFillKnobTracker;
  -[CRLCanvasKnobTracker endMovingKnob](&v13, "endMovingKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));

  v8 = [_TtC8Freeform17CRLCommandSetFill alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillKnobTracker shapeLayout](self, "shapeLayout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dynamicFill"));
  v11 = -[CRLCommandSetFill initWithShapeItem:fill:](v8, "initWithShapeItem:fill:", v7, v10);

  objc_msgSend(v5, "enqueueCommand:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillKnobTracker shapeLayout](self, "shapeLayout"));
  objc_msgSend(v12, "setDynamicFill:", 0);

}

@end

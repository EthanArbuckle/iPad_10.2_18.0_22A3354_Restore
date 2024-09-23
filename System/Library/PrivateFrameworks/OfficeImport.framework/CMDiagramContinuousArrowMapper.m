@implementation CMDiagramContinuousArrowMapper

- (id)fill
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "shapeProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fill");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)stroke
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "shapeProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stroke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CMDiagramShapeMapper setDefaultFonSize](self, "setDefaultFonSize");
  objc_msgSend(MEMORY[0x24BDD1438], "transform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  v9 = v8;
  -[OADOrientedBounds bounds](self->super.super.super.mOrientedBounds, "bounds");
  objc_msgSend(v7, "translateXBy:yBy:", v9);
  -[CMDrawingContext addTransform:](self->super.super.mDrawingContext, "addTransform:", v7);
  -[CMDiagramContinuousArrowMapper mapChildrenAt:withState:](self, "mapChildrenAt:withState:", v10, v6);
  -[CMDrawingContext restoreLastTransform](self->super.super.mDrawingContext, "restoreLastTransform");

}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CMDiagramPointContinuousArrowMapper *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  -[ODDDiagram documentPoint](self->super.super.mDiagram, "documentPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDiagramContinuousArrowMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CMDiagramPointMapper initWithPoint:drawingContext:orientedBounds:parent:]([CMDiagramPointContinuousArrowMapper alloc], "initWithPoint:drawingContext:orientedBounds:parent:", v11, self->super.super.mDrawingContext, v12, self);
      -[CMDiagramPointContinuousArrowMapper mapAt:withState:](v13, "mapAt:withState:", v22, v6);

      ++v10;
    }
    while (v9 != v10);
  }
  -[CMDiagramContinuousArrowMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", -1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramContinuousArrowMapper fill](self, "fill");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramContinuousArrowMapper stroke](self, "stroke");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDBCE70];
  v17 = (double)(self->super.mChildCount + 1) * 100000.0 / (double)(self->super.mChildCount + 2);
  *(float *)&v17 = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryWithObject:forKey:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 13, v14, v15, v20, v21, v6, self->super.super.mDrawingContext);

}

- (id)_suggestedBoundsForNodeAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (a3 < 0)
  {
    v3 = 1.0;
    v4 = 0.0;
    v6 = 0.0;
    v5 = 1.0;
  }
  else
  {
    v3 = 1.0 / ((double)self->super.mChildCount + 0.5);
    v4 = v3 * (double)a3;
    v5 = 0.666666667;
    v6 = 0.166666667;
  }
  return +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", self->super.super.super.mOrientedBounds, v4, v6, v3, v5);
}

- (CGSize)sizeForNode:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CMDiagramContinuousArrowMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end

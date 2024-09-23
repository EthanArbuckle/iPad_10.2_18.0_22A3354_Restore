@implementation CMDiagramPointSegmentedPieMapper

- (void)setStartAngle:(double)a3
{
  self->mStartAngle = a3;
}

- (void)setStopAngle:(double)a3
{
  self->mStopAngle = a3;
}

- (void)setDrawArrows:(BOOL)a3
{
  self->mDrawArrows = a3;
}

- (void)setSegmentIndex:(unint64_t)a3
{
  self->mSegmentIndex = a3;
}

- (void)setSegmentCount:(unint64_t)a3
{
  self->mSegmentCount = a3;
}

- (id)_arrowFillWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  OADRgbColor *v15;
  double v16;
  double v17;
  double v18;
  OADRgbColor *v19;
  OADSolidFill *v20;

  v4 = a3;
  -[CMDiagramPointMapper fill](self, "fill");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "redComponent");
  v8 = v7 * 1.2;
  if (v8 <= 1.0)
    v9 = v8;
  else
    v9 = 1.0;
  objc_msgSend(v6, "greenComponent");
  v11 = v10 * 1.2;
  if (v11 <= 1.0)
    v12 = v11;
  else
    v12 = 1.0;
  objc_msgSend(v6, "blueComponent");
  v14 = v13;
  v15 = [OADRgbColor alloc];
  v16 = v14 * 1.2;
  v17 = 1.0;
  if (v14 * 1.2 <= 1.0)
    v18 = v14 * 1.2;
  else
    v18 = 1.0;
  *(float *)&v16 = v9;
  *(float *)&v17 = v12;
  *(float *)&v18 = v18;
  v19 = -[OADRgbColor initWithRed:green:blue:](v15, "initWithRed:green:blue:", v16, v17, v18);
  v20 = objc_alloc_init(OADSolidFill);
  -[OADSolidFill setColor:](v20, "setColor:", v19);

  return v20;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  __double2 v17;
  uint64_t v18;
  void *v19;
  double mStartAngle;
  void *v21;
  double mStopAngle;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  __double2 v39;
  void *v40;
  void *v41;
  CMDrawableStyle *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  OADOrientedBounds *v49;
  objc_super v50;
  _OWORD v51[3];
  __int128 v52;
  __int128 v53;
  double v54[4];
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v47 = a3;
  v48 = a4;
  -[CMDiagramPointSegmentedPieMapper transformPresentationName](self, "transformPresentationName");
  v6 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v6;
  if (v6)
  {
    -[CMDiagramPointMapper transformForPresentationWithName:](self, "transformForPresentationWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->mDrawArrows || !self->mSegmentIndex)
    {
      v53 = 0u;
      *(_OWORD *)v54 = 0u;
      v52 = 0u;
      if (v7)
      {
        objc_msgSend(v7, "transformStruct");
        v9 = v54[1];
        v10 = v54[0];
      }
      else
      {
        v9 = 0.0;
        v10 = 0.0;
      }
      if (v10 == 0.0 && v9 == 0.0)
      {
        -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
        x = v55.origin.x;
        y = v55.origin.y;
        width = v55.size.width;
        height = v55.size.height;
        v15 = CGRectGetWidth(v55);
        v56.origin.x = x;
        v56.origin.y = y;
        v56.size.width = width;
        v56.size.height = height;
        v16 = (v15 + CGRectGetHeight(v56)) * 0.03;
        v17 = __sincos_stret(((double)self->mSegmentIndex + 0.5 + (double)self->mSegmentIndex + 0.5)* -3.14159265/ (double)self->mSegmentCount+ 1.57079633);
        v54[0] = v16 * v17.__cosval;
        v54[1] = -(v16 * v17.__sinval);
        v51[0] = v52;
        v51[1] = v53;
        v51[2] = *(_OWORD *)v54;
        objc_msgSend(v8, "setTransformStruct:", v51);
      }
    }
    +[CMShapeUtils transformedBoundsWithBounds:transform:](CMShapeUtils, "transformedBoundsWithBounds:transform:", self->super.mOrientedBounds, v8);
    v49 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = self->super.mOrientedBounds;
  }
  -[CMDiagramPointMapper applyDiagramStyleToShapeProperties](self, "applyDiagramStyleToShapeProperties");
  -[CMDiagramPointMapper fill](self, "fill");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMDiagramPointMapper stroke](self, "stroke");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDBCE70];
  mStartAngle = self->mStartAngle;
  *(float *)&mStartAngle = mStartAngle;
  v44 = (void *)v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", mStartAngle);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  mStopAngle = self->mStopAngle;
  *(float *)&mStopAngle = mStopAngle;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", mStopAngle);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v43, v21, v23, v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v48;
  +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 250, v45, v44, v25, v49, v48, self->super.mDrawingContext);

  if (self->mDrawArrows)
  {
    -[CMDiagramPointSegmentedPieMapper _arrowFillWithState:](self, "_arrowFillWithState:", v48);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = self->mStartAngle;
    *(float *)&v29 = v29;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = self->mStopAngle;
    *(float *)&v32 = v32;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v30, v31, v33, v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMShapeRenderer renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:](CMShapeRenderer, "renderCanonicalShape:fill:stroke:adjustValues:orientedBounds:state:drawingContext:", 251, v27, 0, v35, v49, v48, self->super.mDrawingContext);

    v26 = v48;
  }
  -[OADOrientedBounds bounds](v49, "bounds");
  v36 = v57.origin.x;
  v37 = v57.origin.y;
  v38 = CGRectGetWidth(v57);
  v39 = __sincos_stret((self->mStartAngle + self->mStopAngle) * 0.5);
  -[CMDrawingContext transformRectToGroup:](self->super.mDrawingContext, "transformRectToGroup:", v36 + v38 * 0.5 + v38 / 3.0 * v39.__cosval - v38 / 6.0, v37 + v38 * 0.5 - v38 / 3.0 * v39.__sinval - v38 / 6.0, v38 / 3.0, v38 / 3.0);
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_alloc_init(CMDrawableStyle);
  objc_msgSend(v40, "bounds");
  -[CMDrawableStyle addPositionProperties:](v42, "addPositionProperties:");
  objc_msgSend(v47, "addChild:", v41);
  v50.receiver = self;
  v50.super_class = (Class)CMDiagramPointSegmentedPieMapper;
  -[CMMapper addStyleUsingGlobalCacheTo:style:](&v50, sel_addStyleUsingGlobalCacheTo_style_, v41, v42);
  -[CMDiagramPointMapper mapTextAt:withBounds:isCentered:includeChildren:withState:](self, "mapTextAt:withBounds:isCentered:includeChildren:withState:", v41, v40, 1, 1, v26);

}

- (id)transformPresentationName
{
  return self->super.mPresentationName;
}

@end

@implementation SBFluidScrunchGestureRecognizer

- (SBFluidScrunchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return -[SBFluidScrunchGestureRecognizer initWithTarget:action:displayConfiguration:](self, "initWithTarget:action:displayConfiguration:", a3, a4, 0);
}

- (SBFluidScrunchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 displayConfiguration:(id)a5
{
  id v9;
  SBFluidScrunchGestureRecognizer *v10;
  SBFluidScrunchGestureRecognizer *v11;
  SBTouchHistory *v12;
  SBTouchHistory *touchHistory;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBFluidScrunchGestureRecognizer;
  v10 = -[SBTouchTemplateGestureRecognizer initWithTarget:action:](&v15, sel_initWithTarget_action_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_displayConfiguration, a5);
    -[SBFluidScrunchGestureRecognizer _installTemplatesForDisplayConfiguration:](v11, "_installTemplatesForDisplayConfiguration:", v9);
    v12 = objc_alloc_init(SBTouchHistory);
    touchHistory = v11->_touchHistory;
    v11->_touchHistory = v12;

  }
  return v11;
}

- (void)setAllowedTouchTypes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFluidScrunchGestureRecognizer;
  -[SBFluidScrunchGestureRecognizer setAllowedTouchTypes:](&v4, sel_setAllowedTouchTypes_, a3);
  -[SBFluidScrunchGestureRecognizer _installTemplatesForDisplayConfiguration:](self, "_installTemplatesForDisplayConfiguration:", self->_displayConfiguration);
}

- (void)setState:(int64_t)a3
{
  CGPoint v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  objc_super v12;

  if (a3 == 1)
  {
    v5 = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_absoluteTranslation = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_absoluteScale = 1.0;
    self->_additionalTranslationDueToChangingAnchorPoints = v5;
    -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v6);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "_perimeter");
    self->_lastPerimeter = v11;
    self->_initialCentroid.x = v8;
    self->_initialCentroid.y = v10;

  }
  v12.receiver = self;
  v12.super_class = (Class)SBFluidScrunchGestureRecognizer;
  -[SBTouchTemplateGestureRecognizer setState:](&v12, sel_setState_, a3);
}

- (void)_setMatchedPolygon:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  objc_super v9;

  v4 = a3;
  -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v5)
  {
    -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v4);
    self->_initialCentroid.x = v6;
    self->_initialCentroid.y = v7;
    objc_msgSend(v4, "_perimeter");
    self->_lastPerimeter = v8;
  }
  v9.receiver = self;
  v9.super_class = (Class)SBFluidScrunchGestureRecognizer;
  -[SBTouchTemplateGestureRecognizer _setMatchedPolygon:](&v9, sel__setMatchedPolygon_, v4);

}

- (void)_computeGestureMotionWithTouches:(id)a3 polygon:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double absoluteScale;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;

  v6 = a4;
  v7 = a3;
  -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v6);
  v9 = v8;
  v11 = v10;
  -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SBFluidScrunchGestureRecognizer centroid](self, "centroid");
    v14 = v9 - v13;
    v16 = v11 - v15;
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v17 = v16 + self->_absoluteTranslation.y;
  self->_absoluteTranslation.x = v14 + self->_absoluteTranslation.x;
  self->_absoluteTranslation.y = v17;
  if (self->_lastPerimeter != 0.0)
  {
    absoluteScale = self->_absoluteScale;
    if (-[SBFluidScrunchGestureRecognizer _isMatchedTemplateScrunchTemplate](self, "_isMatchedTemplateScrunchTemplate"))
    {
      v19 = self->_absoluteScale;
      objc_msgSend(v6, "_perimeter");
      absoluteScale = v19 * v20 / self->_lastPerimeter;
    }
    if (absoluteScale > 1.0)
    {
      BSUIConstrainValueWithRubberBand();
      absoluteScale = v21 + 1.0;
    }
    self->_absoluteScale = absoluteScale;
  }
  objc_msgSend(v6, "_perimeter");
  self->_lastPerimeter = v22;
  v23.receiver = self;
  v23.super_class = (Class)SBFluidScrunchGestureRecognizer;
  -[SBTouchTemplateGestureRecognizer _computeGestureMotionWithTouches:polygon:](&v23, sel__computeGestureMotionWithTouches_polygon_, v7, v6);

}

- (BOOL)_shouldAddNewTouchesAfterGestureRecognition
{
  return 1;
}

- (void)reset
{
  CGPoint v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFluidScrunchGestureRecognizer;
  -[SBTouchTemplateGestureRecognizer reset](&v4, sel_reset);
  v3 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_absoluteTranslation = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_absoluteScale = 1.0;
  self->_additionalTranslationDueToChangingAnchorPoints = v3;
  self->_initialCentroid = v3;
  self->_lastPerimeter = 0.0;
  -[SBTouchHistory reset](self->_touchHistory, "reset");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  double absoluteScale;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SBTouchHistory *touchHistory;
  double v29;
  objc_super v30;
  CGPoint absoluteTranslation;

  v6 = a4;
  absoluteTranslation = self->_absoluteTranslation;
  absoluteScale = self->_absoluteScale;
  v8 = a3;
  -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v9);
  v11 = v10;
  v13 = v12;

  -[SBTouchTemplateGestureRecognizer _matchedTemplate](self, "_matchedTemplate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = -[SBFluidScrunchGestureRecognizer state](self, "state");

    v30.receiver = self;
    v30.super_class = (Class)SBFluidScrunchGestureRecognizer;
    -[SBTouchTemplateGestureRecognizer touchesBegan:withEvent:](&v30, sel_touchesBegan_withEvent_, v8, v6);
    -[SBFluidScrunchGestureRecognizer _updateRecognizedTouchTypeIfNecessaryWithTouches:](self, "_updateRecognizedTouchTypeIfNecessaryWithTouches:", v8);

    if (v16)
    {
      self->_absoluteTranslation = absoluteTranslation;
      self->_absoluteScale = absoluteScale;
      -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v17);
      v19 = v18 - v11;
      v21 = v20 - v13;

      v22 = v21 + self->_additionalTranslationDueToChangingAnchorPoints.y;
      self->_additionalTranslationDueToChangingAnchorPoints.x = v19
                                                              + self->_additionalTranslationDueToChangingAnchorPoints.x;
      self->_additionalTranslationDueToChangingAnchorPoints.y = v22;
    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)SBFluidScrunchGestureRecognizer;
    -[SBTouchTemplateGestureRecognizer touchesBegan:withEvent:](&v30, sel_touchesBegan_withEvent_, v8, v6);
    -[SBFluidScrunchGestureRecognizer _updateRecognizedTouchTypeIfNecessaryWithTouches:](self, "_updateRecognizedTouchTypeIfNecessaryWithTouches:", v8);

  }
  -[SBFluidScrunchGestureRecognizer _gestureView](self, "_gestureView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer locationInView:](self, "locationInView:", v23);
  v25 = v24;
  v27 = v26;

  touchHistory = self->_touchHistory;
  -[SBFluidScrunchGestureRecognizer lastTouchTimestamp](self, "lastTouchTimestamp");
  -[SBTouchHistory updateWithLocation:timestamp:](touchHistory, "updateWithLocation:timestamp:", v25, v27, v29);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBTouchHistory *touchHistory;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBFluidScrunchGestureRecognizer;
  v6 = a3;
  -[SBTouchTemplateGestureRecognizer touchesMoved:withEvent:](&v14, sel_touchesMoved_withEvent_, v6, a4);
  -[SBFluidScrunchGestureRecognizer _updateRecognizedTouchTypeIfNecessaryWithTouches:](self, "_updateRecognizedTouchTypeIfNecessaryWithTouches:", v6, v14.receiver, v14.super_class);

  -[SBFluidScrunchGestureRecognizer _gestureView](self, "_gestureView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer locationInView:](self, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  touchHistory = self->_touchHistory;
  -[SBFluidScrunchGestureRecognizer lastTouchTimestamp](self, "lastTouchTimestamp");
  -[SBTouchHistory updateWithLocation:timestamp:](touchHistory, "updateWithLocation:timestamp:", v9, v11, v13);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  double absoluteScale;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  objc_super v20;
  CGPoint absoluteTranslation;

  absoluteTranslation = self->_absoluteTranslation;
  absoluteScale = self->_absoluteScale;
  v7 = a4;
  v8 = a3;
  -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v9);
  v11 = v10;
  v13 = v12;

  v20.receiver = self;
  v20.super_class = (Class)SBFluidScrunchGestureRecognizer;
  -[SBTouchTemplateGestureRecognizer touchesEnded:withEvent:](&v20, sel_touchesEnded_withEvent_, v8, v7);

  -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v14);
  v16 = v15 - v11;
  v18 = v17 - v13;

  self->_absoluteTranslation = absoluteTranslation;
  self->_absoluteScale = absoluteScale;
  v19 = v18 + self->_additionalTranslationDueToChangingAnchorPoints.y;
  self->_additionalTranslationDueToChangingAnchorPoints.x = v16
                                                          + self->_additionalTranslationDueToChangingAnchorPoints.x;
  self->_additionalTranslationDueToChangingAnchorPoints.y = v19;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  double absoluteScale;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  objc_super v20;
  CGPoint absoluteTranslation;

  absoluteTranslation = self->_absoluteTranslation;
  absoluteScale = self->_absoluteScale;
  v7 = a4;
  v8 = a3;
  -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v9);
  v11 = v10;
  v13 = v12;

  v20.receiver = self;
  v20.super_class = (Class)SBFluidScrunchGestureRecognizer;
  -[SBTouchTemplateGestureRecognizer touchesCancelled:withEvent:](&v20, sel_touchesCancelled_withEvent_, v8, v7);

  -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v14);
  v16 = v15 - v11;
  v18 = v17 - v13;

  self->_absoluteTranslation = absoluteTranslation;
  self->_absoluteScale = absoluteScale;
  v19 = v18 + self->_additionalTranslationDueToChangingAnchorPoints.y;
  self->_additionalTranslationDueToChangingAnchorPoints.x = v16
                                                          + self->_additionalTranslationDueToChangingAnchorPoints.x;
  self->_additionalTranslationDueToChangingAnchorPoints.y = v19;
}

- (CGPoint)centroid
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[SBTouchTemplateGestureRecognizer _matchedPolygon](self, "_matchedPolygon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer _centroidInGestureViewForPolygon:](self, "_centroidInGestureViewForPolygon:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5 - self->_additionalTranslationDueToChangingAnchorPoints.x;
  v9 = v7 - self->_additionalTranslationDueToChangingAnchorPoints.y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)_hysteresis
{
  return 10.0;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
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
  double v18;
  CGPoint result;

  v4 = a3;
  -[SBFluidScrunchGestureRecognizer _gestureView](self, "_gestureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer translationInView:](self, "translationInView:", v5);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10 * 0.5;
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "convertPoint:toView:", v4, v7 + v11, v9 + v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  id v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGPoint result;

  v4 = a3;
  -[SBFluidScrunchGestureRecognizer _gestureView](self, "_gestureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer absoluteScale](self, "absoluteScale");
  v7 = v6;
  -[SBFluidScrunchGestureRecognizer initialCentroid](self, "initialCentroid");
  v9 = v8;
  v11 = v10;
  -[SBFluidScrunchGestureRecognizer centroid](self, "centroid");
  v14 = v13;
  if (v12 <= v11)
    v15 = v12;
  else
    v15 = v11;
  objc_msgSend(v5, "bounds");
  v17 = v15 + (1.0 - v7) * v16 * -0.5;
  objc_msgSend(v5, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fixedCoordinateSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v20, v9, v11);
  v22 = v21;
  v24 = v23;
  objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v20, v14, v17);
  v26 = v25;
  v28 = v27;
  objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v20, v22, v24);
  v30 = v29;
  v32 = v31;
  objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v20, v26, v28);
  v34 = v33;
  v36 = v35;

  v37 = v34 - v30;
  v38 = v36 - v32;
  result.y = v38;
  result.x = v37;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[SBFluidScrunchGestureRecognizer touchHistory](self, "touchHistory", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)translationWithoutConsideringScaleInView:(id)a3
{
  id v4;
  void *v5;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  v4 = a3;
  -[SBFluidScrunchGestureRecognizer _gestureView](self, "_gestureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidScrunchGestureRecognizer initialCentroid](self, "initialCentroid");
  v7 = v6;
  v9 = v8;
  -[SBFluidScrunchGestureRecognizer centroid](self, "centroid");
  v12 = v11;
  if (v10 <= v9)
    v13 = v10;
  else
    v13 = v9;
  objc_msgSend(v5, "convertPoint:toView:", v4, v7, v9);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "convertPoint:toView:", v4, v12, v13);
  v19 = v18;
  v21 = v20;

  v22 = v19 - v15;
  v23 = v21 - v17;
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  double result;

  -[SBTouchHistory averageTouchPathAngleOverTimeDuration:](self->_touchHistory, "averageTouchPathAngleOverTimeDuration:", a3);
  return result;
}

- (double)peakSpeed
{
  double result;

  -[SBTouchHistory peakSpeed](self->_touchHistory, "peakSpeed");
  return result;
}

- (id)_gestureView
{
  void *v3;
  void *v4;

  -[SBFluidScrunchGestureRecognizer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForSystemGestureRecognizer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGPoint)_centroidInGestureViewForPolygon:(id)a3
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  v4 = a3;
  -[SBFluidScrunchGestureRecognizer _gestureView](self, "_gestureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_centroid");
  v8 = v7;
  v10 = v9;

  objc_msgSend(v6, "_convertPointFromSceneReferenceSpace:", v8, v10);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v5, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertPoint:toView:", v5, v12, v14);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)_installTemplatesForDisplayConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBFluidScrunchGestureRecognizer allowedTouchTypes](self, "allowedTouchTypes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "integerValue");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_panTemplatesForTouchType:displayConfiguration:", v10, v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v12);

        objc_msgSend((id)objc_opt_class(), "_scrunchTemplatesForTouchType:displayConfiguration:", v10, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v13);

        -[SBTouchTemplateGestureRecognizer setTemplates:forTouchType:](self, "setTemplates:forTouchType:", v11, v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (BOOL)_isMatchedTemplateScrunchTemplate
{
  void *v2;
  uint64_t v3;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[SBTouchTemplateGestureRecognizer _matchedTemplate](self, "_matchedTemplate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "pointCount") >= 4)
  {
    objc_msgSend(v2, "_pointAtIndex:", 0);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__SBFluidScrunchGestureRecognizer__isMatchedTemplateScrunchTemplate__block_invoke;
    v6[3] = &unk_1E8EB6E30;
    v6[5] = v3;
    v6[4] = &v7;
    objc_msgSend(v2, "enumeratePointsUsingBlock:", v6);
  }
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __68__SBFluidScrunchGestureRecognizer__isMatchedTemplateScrunchTemplate__block_invoke(uint64_t result, double a2, double a3)
{
  if (a3 != *(double *)(result + 40))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_updateRecognizedTouchTypeIfNecessaryWithTouches:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SBFluidScrunchGestureRecognizer state](self, "state") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_recognizedTouchType = objc_msgSend(v4, "type");

  }
}

- (double)animationDistance
{
  return 350.0;
}

- (double)incrementalGestureMotionForCandidate:(id)a3 withTransformAnalyzerInfo:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  double v14;

  v5 = a4;
  -[SBFluidScrunchGestureRecognizer _gestureView](self, "_gestureView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  objc_msgSend(v5, "scale");
  objc_msgSend(v5, "scale");
  v10 = v9 * v8 + 0.0;
  objc_msgSend(v5, "translation");
  v12 = v11;
  objc_msgSend(v5, "translation");
  v14 = v10 + hypot(v12, v13);

  return v14;
}

+ (void)_rotateTemplates:(id)a3 forDisplayConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowForSystemGestures");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_fbsDisplayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nativeOrientation");
    v11 = v10;

    objc_msgSend(v6, "nativeOrientation");
    v13 = v12;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = v11 - v13;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "_rotate:", v17, (_QWORD)v20);
        }
        while (v16 != v19);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

  }
}

+ (id)_scrunchTemplatesForTouchType:(int64_t)a3 displayConfiguration:(id)a4
{
  id v5;
  void *v6;
  SBTouchTemplate *v7;
  SBTouchTemplate *v8;
  SBTouchTemplate *v9;
  SBTouchTemplate *v10;
  SBTouchTemplate *v11;
  SBTouchTemplate *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = xmmword_1D0E8A8D0;
  v39 = xmmword_1D0E8A8E0;
  v40 = xmmword_1D0E8A8F0;
  v41 = xmmword_1D0E8A900;
  v7 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v38, 4);
  objc_msgSend(v6, "addObject:", v7);
  v34 = xmmword_1D0E8A910;
  v35 = xmmword_1D0E8A920;
  v36 = xmmword_1D0E8A930;
  v37 = xmmword_1D0E8A940;
  v8 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v34, 4);

  objc_msgSend(v6, "addObject:", v8);
  v29 = xmmword_1D0E8A950;
  v30 = xmmword_1D0E8A960;
  v31 = xmmword_1D0E8A970;
  v32 = xmmword_1D0E8A980;
  v33 = xmmword_1D0E8A990;
  v9 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v29, 5);

  objc_msgSend(v6, "addObject:", v9);
  v24 = xmmword_1D0E8A9A0;
  v25 = xmmword_1D0E8A9B0;
  v26 = xmmword_1D0E8A9C0;
  v27 = xmmword_1D0E8A9D0;
  v28 = xmmword_1D0E8A9E0;
  v10 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v24, 5);

  objc_msgSend(v6, "addObject:", v10);
  v19 = xmmword_1D0E8A9F0;
  v20 = xmmword_1D0E8AA00;
  v21 = xmmword_1D0E8AA10;
  v22 = xmmword_1D0E8AA20;
  v23 = xmmword_1D0E8AA30;
  v11 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v19, 5);

  objc_msgSend(v6, "addObject:", v11);
  v14 = xmmword_1D0E8AA40;
  v15 = xmmword_1D0E8AA50;
  v16 = xmmword_1D0E8AA60;
  v17 = xmmword_1D0E8AA70;
  v18 = xmmword_1D0E8AA80;
  v12 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v14, 5);

  objc_msgSend(v6, "addObject:", v12, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41);
  if (a3 == 1 && v5)
    +[SBFluidScrunchGestureRecognizer _rotateTemplates:forDisplayConfiguration:](SBFluidScrunchGestureRecognizer, "_rotateTemplates:forDisplayConfiguration:", v6, v5);

  return v6;
}

+ (id)_panTemplatesForTouchType:(int64_t)a3 displayConfiguration:(id)a4
{
  id v5;
  void *v6;
  SBTouchTemplate *v7;
  SBTouchTemplate *v8;
  SBTouchTemplate *v9;
  SBTouchTemplate *v10;
  SBTouchTemplate *v11;
  SBTouchTemplate *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    v14 = xmmword_1D0E8AA90;
    v15 = xmmword_1D0E8AAA0;
    v16 = xmmword_1D0E8AAB0;
    v7 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v14, 3);
    objc_msgSend(v6, "addObject:", v7);
    v23 = xmmword_1D0E8A960;
    v24 = xmmword_1D0E8A970;
    v25 = xmmword_1D0E8A980;
    v8 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v23, 3);

    objc_msgSend(v6, "addObject:", v8);
    v19 = xmmword_1D0E8AAC0;
    v20 = xmmword_1D0E8A960;
    v21 = xmmword_1D0E8A970;
    v9 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v19, 3);

    objc_msgSend(v6, "addObject:", v9);
  }
  v23 = xmmword_1D0E8AAD0;
  v24 = xmmword_1D0E8AAE0;
  v25 = xmmword_1D0E8AAF0;
  v26 = xmmword_1D0E8AB00;
  v10 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v23, 4);
  objc_msgSend(v6, "addObject:", v10);
  v19 = xmmword_1D0E8AAC0;
  v20 = xmmword_1D0E8A960;
  v21 = xmmword_1D0E8A970;
  v22 = xmmword_1D0E8A980;
  v11 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v19, 4);

  objc_msgSend(v6, "addObject:", v11);
  v14 = xmmword_1D0E8AAC0;
  v15 = xmmword_1D0E8A960;
  v16 = xmmword_1D0E8A970;
  v17 = xmmword_1D0E8A980;
  v18 = xmmword_1D0E8A990;
  v12 = -[SBPolygon initWithPoints:pointCount:]([SBTouchTemplate alloc], "initWithPoints:pointCount:", &v14, 5);

  objc_msgSend(v6, "addObject:", v12);
  if (a3 == 1 && v5)
    +[SBFluidScrunchGestureRecognizer _rotateTemplates:forDisplayConfiguration:](SBFluidScrunchGestureRecognizer, "_rotateTemplates:forDisplayConfiguration:", v6, v5);

  return v6;
}

- (double)absoluteScale
{
  return self->_absoluteScale;
}

- (void)setAbsoluteScale:(double)a3
{
  self->_absoluteScale = a3;
}

- (CGPoint)initialCentroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialCentroid.x;
  y = self->_initialCentroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialCentroid:(CGPoint)a3
{
  self->_initialCentroid = a3;
}

- (int64_t)recognizedTouchType
{
  return self->_recognizedTouchType;
}

- (CGPoint)absoluteTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_absoluteTranslation.x;
  y = self->_absoluteTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAbsoluteTranslation:(CGPoint)a3
{
  self->_absoluteTranslation = a3;
}

- (CGPoint)additionalTranslationDueToChangingAnchorPoints
{
  double x;
  double y;
  CGPoint result;

  x = self->_additionalTranslationDueToChangingAnchorPoints.x;
  y = self->_additionalTranslationDueToChangingAnchorPoints.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAdditionalTranslationDueToChangingAnchorPoints:(CGPoint)a3
{
  self->_additionalTranslationDueToChangingAnchorPoints = a3;
}

- (double)lastPerimeter
{
  return self->_lastPerimeter;
}

- (void)setLastPerimeter:(double)a3
{
  self->_lastPerimeter = a3;
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_touchHistory, a3);
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setDisplayConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_displayConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
}

@end

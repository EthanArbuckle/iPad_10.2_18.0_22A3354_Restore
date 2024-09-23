@implementation CRLPathSourceCommandHelper

+ (double)adjustedCalloutTailPositionXWithValue:(double)a3 isAnchoredAtRight:(BOOL)a4 layoutGeometry:(id)a5
{
  double v6;

  if (a4)
  {
    objc_msgSend(a5, "frame");
    return v6 - a3;
  }
  return a3;
}

+ (id)commandForSettingCornerRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  return _objc_msgSend(a1, "p_commandToSetPathSourceScalarValue:withPathSource:shapeItem:", a4, a5, a3);
}

+ (id)commandForSettingNumberOfSides:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  return _objc_msgSend(a1, "p_commandToSetPathSourceScalarValue:withPathSource:shapeItem:", a4, a5, a3);
}

+ (id)commandForSettingStarPoints:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  objc_opt_class(CRLPointPathSource, v10);
  v12 = sub_100221D0C(v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "point");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandForSettingPathSourcePointValue:onPathSource:shapeItem:", v13, v8, a3));

  return v14;
}

+ (id)commandForSettingStarRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  objc_opt_class(CRLPointPathSource, v9);
  v11 = sub_100221D0C(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v12, "point");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandForSettingPathSourcePointValue:onPathSource:shapeItem:", v12, v7));

  return v13;
}

+ (id)commandForSettingArrowHead:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  objc_opt_class(CRLPointPathSource, v10);
  v12 = sub_100221D0C(v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "point");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandForSettingPathSourcePointValue:onPathSource:shapeItem:", v13, v8, a3));

  return v14;
}

+ (id)commandForSettingArrowIndent:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  objc_opt_class(CRLPointPathSource, v9);
  v11 = sub_100221D0C(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v12, "point");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandForSettingPathSourcePointValue:onPathSource:shapeItem:", v12, v7));

  return v13;
}

+ (id)commandForSettingCalloutCornerRadius:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _TtC8Freeform23CRLCommandSetPathSource *v11;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_calloutPathSourceForCommandWithPathSource:", a4));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setCornerRadius:", a3);
    v11 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v8, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)commandForSettingCalloutTailSize:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  _TtC8Freeform23CRLCommandSetPathSource *v11;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_calloutPathSourceForCommandWithPathSource:", a4));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setTailSize:", a3);
    v11 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v8, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)commandForSettingCalloutTailPositionX:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5 isAnchoredAtRight:(BOOL)a6 layoutGeometry:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _TtC8Freeform23CRLCommandSetPathSource *v16;

  v8 = a6;
  v12 = a5;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_calloutPathSourceForCommandWithPathSource:", a4));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "tailKnobPosition");
    objc_msgSend(a1, "adjustedCalloutTailPositionXWithValue:isAnchoredAtRight:layoutGeometry:", v8, v13, a3);
    objc_msgSend(v15, "setTailKnobPosition:");
    v16 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v12, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)commandForSettingCalloutTailPositionY:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  _TtC8Freeform23CRLCommandSetPathSource *v10;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_calloutPathSourceForCommandWithPathSource:", a4));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "tailKnobPosition");
    objc_msgSend(v9, "setTailKnobPosition:");
    v10 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v7, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)commandForSettingCornerRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  return _objc_msgSend(a1, "p_commandToSetPathSourceScalarValue:withPathSource:imageItem:maskLayout:", a4, a5, a6, a3);
}

+ (id)commandForSettingNumberOfSides:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  return _objc_msgSend(a1, "p_commandToSetPathSourceScalarValue:withPathSource:imageItem:maskLayout:", a4, a5, a6, a3);
}

+ (id)commandForSettingStarPoints:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_opt_class(CRLPointPathSource, v13);
  v15 = sub_100221D0C(v14, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  objc_msgSend(v16, "point");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandForSettingPathSourcePointValue:onPathSource:imageItem:maskLayout:", v16, v11, v10, a3));

  return v17;
}

+ (id)commandForSettingStarRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  objc_opt_class(CRLPointPathSource, v12);
  v14 = sub_100221D0C(v13, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  objc_msgSend(v15, "point");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandForSettingPathSourcePointValue:onPathSource:imageItem:maskLayout:", v15, v10, v9));

  return v16;
}

+ (id)commandForSettingArrowHead:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_opt_class(CRLPointPathSource, v13);
  v15 = sub_100221D0C(v14, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  objc_msgSend(v16, "point");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandForSettingPathSourcePointValue:onPathSource:imageItem:maskLayout:", v16, v11, v10, a3));

  return v17;
}

+ (id)commandForSettingArrowIndent:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  objc_opt_class(CRLPointPathSource, v12);
  v14 = sub_100221D0C(v13, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  objc_msgSend(v15, "point");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandForSettingPathSourcePointValue:onPathSource:imageItem:maskLayout:", v15, v10, v9));

  return v16;
}

+ (id)commandForSettingCalloutCornerRadius:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  CRLMaskInfo *v14;
  void *v15;
  CRLMaskInfo *v16;
  _TtC8Freeform17CRLCommandSetMask *v17;

  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_calloutPathSourceForCommandWithPathSource:", a4));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setCornerRadius:", a3);
    v14 = [CRLMaskInfo alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "infoGeometry"));
    v16 = -[CRLMaskInfo initWithImageItem:geometry:pathSource:](v14, "initWithImageItem:geometry:pathSource:", v10, v15, v13);

    v17 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v10, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)commandForSettingCalloutTailSize:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  CRLMaskInfo *v14;
  void *v15;
  CRLMaskInfo *v16;
  _TtC8Freeform17CRLCommandSetMask *v17;

  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_calloutPathSourceForCommandWithPathSource:", a4));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setTailSize:", a3);
    v14 = [CRLMaskInfo alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "infoGeometry"));
    v16 = -[CRLMaskInfo initWithImageItem:geometry:pathSource:](v14, "initWithImageItem:geometry:pathSource:", v10, v15, v13);

    v17 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v10, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)commandForSettingCalloutTailPositionX:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6 isAnchoredAtRight:(BOOL)a7 layoutGeometry:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  CRLMaskInfo *v19;
  void *v20;
  CRLMaskInfo *v21;
  _TtC8Freeform17CRLCommandSetMask *v22;

  v9 = a7;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_calloutPathSourceForCommandWithPathSource:", a4));
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "tailKnobPosition");
    objc_msgSend(a1, "adjustedCalloutTailPositionXWithValue:isAnchoredAtRight:layoutGeometry:", v9, v16, a3);
    objc_msgSend(v18, "setTailKnobPosition:");
    v19 = [CRLMaskInfo alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "infoGeometry"));
    v21 = -[CRLMaskInfo initWithImageItem:geometry:pathSource:](v19, "initWithImageItem:geometry:pathSource:", v14, v20, v18);

    v22 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v14, v21);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)commandForSettingCalloutTailPositionY:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  CRLMaskInfo *v13;
  void *v14;
  CRLMaskInfo *v15;
  _TtC8Freeform17CRLCommandSetMask *v16;

  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_calloutPathSourceForCommandWithPathSource:", a4));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "tailKnobPosition");
    objc_msgSend(v12, "setTailKnobPosition:");
    v13 = [CRLMaskInfo alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "infoGeometry"));
    v15 = -[CRLMaskInfo initWithImageItem:geometry:pathSource:](v13, "initWithImageItem:geometry:pathSource:", v9, v14, v12);

    v16 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v9, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)p_commandToSetPathSourceScalarValue:(double)a3 withPathSource:(id)a4 shapeItem:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _TtC8Freeform23CRLCommandSetPathSource *v14;

  v7 = a5;
  v8 = a4;
  objc_opt_class(CRLScalarPathSource, v9);
  v11 = sub_100221D0C(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = objc_msgSend(v12, "copy");
    objc_msgSend(v13, "setScalar:", a3);
    v14 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v7, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)p_commandForSettingPathSourcePointValue:(CGPoint)a3 onPathSource:(id)a4 shapeItem:(id)a5
{
  _TtC8Freeform23CRLCommandSetPathSource *v5;
  double y;
  double x;
  id v8;
  id v9;

  v5 = (_TtC8Freeform23CRLCommandSetPathSource *)a4;
  if (a4)
  {
    y = a3.y;
    x = a3.x;
    v8 = a5;
    v9 = -[CRLCommandSetPathSource copy](v5, "copy");
    objc_msgSend(v9, "setPoint:", x, y);
    v5 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v8, v9);

  }
  return v5;
}

+ (id)p_commandToSetPathSourceScalarValue:(double)a3 withPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _TtC8Freeform17CRLCommandSetMask *v19;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  objc_opt_class(CRLScalarPathSource, v12);
  v14 = sub_100221D0C(v13, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    v16 = objc_msgSend(v15, "copy");
    objc_msgSend(v16, "setScalar:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "maskInfo"));
    v18 = objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "setPathSource:", v16);
    v19 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v9, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)p_commandForSettingPathSourcePointValue:(CGPoint)a3 onPathSource:(id)a4 imageItem:(id)a5 maskLayout:(id)a6
{
  _TtC8Freeform17CRLCommandSetMask *v6;
  double y;
  double x;
  id v10;
  id v11;
  id v12;
  _TtC8Freeform17CRLCommandSetMask *v13;
  void *v14;

  v6 = (_TtC8Freeform17CRLCommandSetMask *)a4;
  if (a4)
  {
    y = a3.y;
    x = a3.x;
    v10 = a6;
    v11 = a5;
    v12 = -[CRLCommandSetMask copy](v6, "copy");
    objc_msgSend(v12, "setPoint:", x, y);
    v13 = [_TtC8Freeform17CRLCommandSetMask alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "infoGeometry"));

    v6 = -[CRLCommandSetMask initWithImageItem:maskGeometry:maskPath:](v13, "initWithImageItem:maskGeometry:maskPath:", v11, v14, v12);
  }
  return v6;
}

+ (id)p_calloutPathSourceForCommandWithPathSource:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_opt_class(CRLCalloutPathSource, v4);
  v6 = sub_100221D0C(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = objc_msgSend(v7, "copy");
  else
    v8 = 0;

  return v8;
}

@end

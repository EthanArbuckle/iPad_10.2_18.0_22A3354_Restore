@implementation ODIDrawable

+ (id)shapeGeometryForRectangle
{
  OADPresetShapeGeometry *v2;

  v2 = objc_alloc_init(OADPresetShapeGeometry);
  -[OADPresetShapeGeometry setType:](v2, "setType:", 1);
  return v2;
}

+ (id)shapeGeometryForEllipse
{
  OADPresetShapeGeometry *v2;

  v2 = objc_alloc_init(OADPresetShapeGeometry);
  -[OADPresetShapeGeometry setType:](v2, "setType:", 3);
  return v2;
}

+ (id)shapeGeometryForRoundedRectangleWithRadius:(float)a3
{
  OADPresetShapeGeometry *v4;

  v4 = objc_alloc_init(OADPresetShapeGeometry);
  -[OADPresetShapeGeometry setType:](v4, "setType:", 2);
  -[OADShapeGeometry setIsEscher:](v4, "setIsEscher:", 1);
  -[OADShapeGeometry setAdjustValue:atIndex:](v4, "setAdjustValue:atIndex:", (int)(float)(a3 * 21600.0), 0);
  return v4;
}

+ (id)shapeGeometryForRightArrowWithControlPoint:(CGPoint)a3
{
  double y;
  double x;
  OADPresetShapeGeometry *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(OADPresetShapeGeometry);
  -[OADPresetShapeGeometry setType:](v5, "setType:", 13);
  -[OADShapeGeometry setIsEscher:](v5, "setIsEscher:", 1);
  -[OADShapeGeometry setAdjustValue:atIndex:](v5, "setAdjustValue:atIndex:", (int)((1.0 - x) * 21600.0), 0);
  -[OADShapeGeometry setAdjustValue:atIndex:](v5, "setAdjustValue:atIndex:", (int)(y * 21600.0), 1);
  return v5;
}

+ (id)shapeGeometryForDoubleArrowWithControlPoint:(CGPoint)a3
{
  double y;
  double x;
  OADPresetShapeGeometry *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(OADPresetShapeGeometry);
  -[OADPresetShapeGeometry setType:](v5, "setType:", 69);
  -[OADShapeGeometry setIsEscher:](v5, "setIsEscher:", 1);
  -[OADShapeGeometry setAdjustValue:atIndex:](v5, "setAdjustValue:atIndex:", (int)(x * 21600.0), 0);
  -[OADShapeGeometry setAdjustValue:atIndex:](v5, "setAdjustValue:atIndex:", (int)(y * 21600.0), 1);
  return v5;
}

+ (id)shapeGeometryWithShapeType:(int)a3 adjustValues:(const int *)a4
{
  uint64_t v5;
  OADPresetShapeGeometry *v6;
  uint64_t i;
  uint64_t v8;

  v5 = *(_QWORD *)&a3;
  v6 = objc_alloc_init(OADPresetShapeGeometry);
  -[OADPresetShapeGeometry setType:](v6, "setType:", v5);
  if (a4)
  {
    for (i = 0; ; ++i)
    {
      v8 = a4[i];
      if ((_DWORD)v8 != -559038738)
      {
        if ((_DWORD)v8 == -559038737)
          return v6;
        -[OADShapeGeometry setAdjustValue:atIndex:](v6, "setAdjustValue:atIndex:", v8, i);
      }
    }
  }
  return v6;
}

+ (id)shapeGeometryForBezierPath:(id)a3 gSpace:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
  OADCustomShapeGeometry *v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MinX;
  double MinY;
  double MaxX;
  OADPath *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __objc2_class **v25;
  OADCubicBezierToPathElement *v26;
  OADCubicBezierToPathElement *v27;
  OADClosePathElement *v28;
  _DWORD v30[4];
  double v31[7];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v31[6] = *(double *)MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (width >= height)
    v9 = width;
  else
    v9 = height;
  v10 = objc_alloc_init(OADCustomShapeGeometry);
  v11 = 21600.0 / v9;
  v12 = height * (21600.0 / v9);
  v13 = width * (21600.0 / v9);
  v14 = y * (21600.0 / v9);
  v15 = x * (21600.0 / v9);
  v32.origin.x = v15;
  v32.origin.y = v14;
  v32.size.width = v13;
  v32.size.height = v12;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = v15;
  v33.origin.y = v14;
  v33.size.width = v13;
  v33.size.height = v12;
  MinY = CGRectGetMinY(v33);
  v34.origin.x = v15;
  v34.origin.y = v14;
  v34.size.width = v13;
  v34.size.height = v12;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v15;
  v35.origin.y = v14;
  v35.size.width = v13;
  v35.size.height = v12;
  v30[0] = (int)MinX;
  v30[1] = (int)MinY;
  v30[2] = (int)MaxX;
  v30[3] = (int)CGRectGetMaxY(v35);
  -[OADCustomShapeGeometry setGeometryCoordSpace:](v10, "setGeometryCoordSpace:", v30);
  -[OADShapeGeometry setIsEscher:](v10, "setIsEscher:", 1);
  v19 = 0;
  v20 = objc_msgSend(v8, "elementCount");
  if (v20)
  {
    v21 = 0;
    while (2)
    {
      if (!v19)
      {
        v19 = objc_alloc_init(OADPath);
        -[OADCustomShapeGeometry addPath:](v10, "addPath:", v19);
      }
      v22 = objc_msgSend(v8, "elementAtIndex:associatedPoints:", v21, v31);
      v23 = (unint64_t)(int)(v11 * v31[0]) << 32;
      v24 = (unint64_t)(int)(v11 * v31[1]) << 32;
      v25 = off_24F399340;
      switch(v22)
      {
        case 0:
          goto LABEL_10;
        case 1:
          v25 = off_24F399338;
LABEL_10:
          v26 = (OADCubicBezierToPathElement *)objc_msgSend(objc_alloc(*v25), "initWithToPoint:", v23, v24);
          goto LABEL_12;
        case 2:
          v26 = -[OADCubicBezierToPathElement initWithControlPoint1:controlPoint2:toPoint:]([OADCubicBezierToPathElement alloc], "initWithControlPoint1:controlPoint2:toPoint:", v23, v24, (unint64_t)(int)(v11 * v31[2]) << 32, (unint64_t)(int)(v11 * v31[3]) << 32, (unint64_t)(int)(v11 * v31[4]) << 32, (unint64_t)(int)(v11 * v31[5]) << 32);
LABEL_12:
          v27 = v26;
          if (v26)
            -[OADPath addElement:](v19, "addElement:", v26);
          goto LABEL_16;
        case 3:
          v28 = objc_alloc_init(OADClosePathElement);
          -[OADPath addElement:](v19, "addElement:", v28);

          v19 = 0;
          goto LABEL_15;
        default:
LABEL_15:
          v27 = 0;
LABEL_16:

          if (v20 == ++v21)
            break;
          continue;
      }
      break;
    }
  }

  return v10;
}

+ (CGSize)sizeOfDiagram:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  +[OAITOrientedBounds relativeOrientedBoundsOfDrawable:](OAITOrientedBounds, "relativeOrientedBoundsOfDrawable:", a3);
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

+ (id)addShapeWithBounds:(CGRect)a3 rotation:(float)a4 geometry:(id)a5 state:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  OADShape *v14;
  void *v15;
  double v16;
  double v17;
  OADOrientedBounds *v18;
  double v19;
  OADOrientedBounds *v20;
  void *v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(OADShape);
  objc_msgSend(v13, "group");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addChild:", v14);

  objc_msgSend(v13, "scale");
  v17 = v16;
  v18 = [OADOrientedBounds alloc];
  *(float *)&v19 = a4;
  v20 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v18, "initWithBounds:rotation:flipX:flipY:", 0, 0, x * v17, y * v17, width * v17, height * v17, v19);
  -[OADDrawable drawableProperties](v14, "drawableProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOrientedBounds:", v20);

  -[OADShape setGeometry:](v14, "setGeometry:", v12);
  return v14;
}

+ (void)mapStyleFromPoint:(id)a3 shape:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "presentationNameForPointType:", objc_msgSend(v17, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentationWithName:point:", v10, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "styleForPresentation:point:state:", v11, v17, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextStyle:", v12);
  objc_msgSend(v17, "shapeProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "drawingTheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "styleMatrix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "shapeProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applyToGraphicProperties:styleMatrix:", v16, v15);
    objc_msgSend(v13, "setParent:", v16);

  }
  else
  {
    objc_msgSend(v12, "applyToGraphicProperties:styleMatrix:", v13, v15);
  }
  objc_msgSend(a1, "mapShapeProperties:shape:state:", v13, v8, v9);

}

+ (void)mapStyleForPresentationName:(id)a3 point:(id)a4 shape:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  OADShapeProperties *v14;
  OADShapeProperties *v15;
  id v16;

  v16 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "presentationWithName:point:", a3, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "styleForPresentation:point:state:", v12, v16, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "shapeProperties");
    v14 = (OADShapeProperties *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_alloc_init(OADShapeProperties);
  }
  v15 = v14;
  objc_msgSend(a1, "mapShapeProperties:shapeStyle:shape:state:", v14, v13, v10, v11);

}

+ (void)mapStyleForLabelName:(id)a3 shape:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  OADShapeProperties *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(OADShapeProperties);
  objc_msgSend(a1, "styleForLabelName:styleCount:styleIndex:state:", v12, objc_msgSend(v9, "pointCount"), objc_msgSend(v9, "pointIndex"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mapShapeProperties:shapeStyle:shape:state:", v10, v11, v8, v9);

}

+ (void)mapStyleForLabelName:(id)a3 point:(id)a4 shape:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a1, "styleForLabelName:styleCount:styleIndex:state:", v15, objc_msgSend(v12, "pointCount"), objc_msgSend(v12, "pointIndex"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextStyle:", v13);
  objc_msgSend(v10, "shapeProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mapShapeProperties:shapeStyle:shape:state:", v14, v13, v11, v12);

}

+ (void)map1dArrowStyleFromPoint:(id)a3 shape:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "presentationNameForPointType:", objc_msgSend(v16, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentationWithName:point:", v10, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "styleForPresentation:point:state:", v11, v16, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shapeProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "drawingTheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "styleMatrix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applyToGraphicProperties:styleMatrix:", v13, v15);

  objc_msgSend(a1, "addArrowHeadToShapeProperties:", v13);
  objc_msgSend(v9, "setTextStyle:", v12);
  objc_msgSend(a1, "mapShapeProperties:shape:state:", v13, v8, v9);

}

+ (void)map1dArrowStyleToShape:(id)a3 state:(id)a4
{
  id v6;
  OADShapeProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_alloc_init(OADShapeProperties);
  objc_msgSend(a1, "styleForLabelName:styleCount:styleIndex:state:", CFSTR("sibTrans1D1"), objc_msgSend(v6, "pointCount"), objc_msgSend(v6, "pointIndex"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawingTheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "styleMatrix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyToGraphicProperties:styleMatrix:", v7, v10);

  objc_msgSend(a1, "addArrowHeadToShapeProperties:", v7);
  objc_msgSend(a1, "mapShapeProperties:shape:state:", v7, v11, v6);

}

+ (void)mapStyleAndTextFromPoint:(id)a3 shape:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "mapStyleFromPoint:shape:state:", v11, v8, v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      +[ODIText mapTextFromPoint:toShape:isCentered:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCentered:includeChildren:state:", v11, v8, 1, 1, v9);
  }

}

+ (id)presentationWithName:(id)a3 point:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "presentations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v9, "nextObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
      {

        goto LABEL_7;
      }
      objc_msgSend(v10, "propertySet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentationName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "isEqualToString:", v13);

      if (v14)
        break;

    }
  }
  else
  {
LABEL_7:
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)styleForPresentation:(id)a3 point:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8
    || (objc_msgSend(v8, "propertySet"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "presentationStyleLabel"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v11, "presentationStyleCount"),
        v14 = objc_msgSend(v11, "presentationStyleIndex"),
        v11,
        !v12))
  {
    objc_msgSend(v10, "defaultStyleLabelNameForPointType:", objc_msgSend(v9, "type"));
    v15 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "pointCount");
    v14 = objc_msgSend(v10, "pointIndex");
    v12 = (void *)v15;
  }
  objc_msgSend(a1, "styleForLabelName:styleCount:styleIndex:state:", v12, v13, v14, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)styleForLabelName:(id)a3 styleCount:(int)a4 styleIndex:(int)a5 state:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "diagram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "styleDefinition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "labelForName:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shapeStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "colorTransform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "labelForName:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_msgSend(v14, "copy");

      v14 = (void *)v17;
      objc_msgSend(v16, "applyToShapeStyle:index:count:state:", v17, v7, v8, v10);
    }

  }
  return v14;
}

+ (void)mapShapeProperties:(id)a3 shapeStyle:(id)a4 shape:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "drawingTheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "styleMatrix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyToGraphicProperties:styleMatrix:", v15, v14);

  objc_msgSend(a1, "mapShapeProperties:shape:state:", v15, v11, v12);
}

+ (void)mapShapeProperties:(id)a3 shape:(id)a4 state:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "shapeProperties");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v10)
  {
    objc_msgSend(v10, "fill");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFill:", v7);

    objc_msgSend(v10, "stroke");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStroke:", v8);

    objc_msgSend(v10, "effects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEffects:", v9);

  }
}

+ (void)addArrowHeadToShapeProperties:(id)a3
{
  void *v3;
  void *v4;
  OADLineEnd *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "stroke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v6, "setStroke:", v4);
  v5 = -[OADLineEnd initWithType:width:length:]([OADLineEnd alloc], "initWithType:width:length:", 1, 1, 1);
  objc_msgSend(v4, "setHead:", v5);

}

@end

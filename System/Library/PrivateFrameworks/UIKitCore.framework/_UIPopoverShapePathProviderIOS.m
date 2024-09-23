@implementation _UIPopoverShapePathProviderIOS

- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3
{
  void *v5;
  double y;
  double x;
  double width;
  double height;
  int64_t var1;
  double var5;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  x = a3->var2.origin.x;
  y = a3->var2.origin.y;
  width = a3->var2.size.width;
  height = a3->var2.size.height;
  var1 = a3->var1;
  switch(a3->var0)
  {
    case 1uLL:
      var5 = a3->var5;
      v12 = y + var5;
      v13 = height - var5;
      -[_UIPopoverShapePathProviderIOS _upAndDownStartingXLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:](self, "_upAndDownStartingXLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:", a3->var1, a3->var2.origin.x, v12, a3->var2.size.width, v13, a3->var6, a3->var3);
      -[_UIPopoverShapePathProviderIOS _generateTopArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:](self, "_generateTopArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:", v5, var1, x, v12, width, v13, v14, v12, v14 + a3->var6, v12, v14 + a3->var6 * 0.5, v12 - a3->var5, *(_QWORD *)&a3->var4, *(_QWORD *)&a3->var6);
      break;
    case 2uLL:
      v15 = height - a3->var5;
      -[_UIPopoverShapePathProviderIOS _upAndDownStartingXLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:](self, "_upAndDownStartingXLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:", a3->var1, a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, v15, a3->var6, a3->var3);
      -[_UIPopoverShapePathProviderIOS _generateBottomArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:](self, "_generateBottomArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:", v5, var1, x, y, width, v15, v16, y + v15, v16 + a3->var6, y + v15, v16 + a3->var6 * 0.5, y + v15 + a3->var5, *(_QWORD *)&a3->var4, *(_QWORD *)&a3->var6);
      break;
    case 4uLL:
      v18 = a3->var5;
      v19 = x + v18;
      v20 = width - v18;
      -[_UIPopoverShapePathProviderIOS _leftAndRightStartYLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:](self, "_leftAndRightStartYLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:", a3->var1, v19, a3->var2.origin.y, v20, a3->var2.size.height, a3->var6, a3->var3);
      -[_UIPopoverShapePathProviderIOS _generateLeftArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:](self, "_generateLeftArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:", v5, var1, v19, y, v20, height, v19, v21, v19, v21 + a3->var6, v19 - a3->var5, v21 + a3->var6 * 0.5, *(_QWORD *)&a3->var4, *(_QWORD *)&a3->var6);
      break;
    case 8uLL:
      v22 = width - a3->var5;
      -[_UIPopoverShapePathProviderIOS _leftAndRightStartYLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:](self, "_leftAndRightStartYLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:", a3->var1, a3->var2.origin.x, a3->var2.origin.y, v22, a3->var2.size.height, a3->var6, a3->var3);
      -[_UIPopoverShapePathProviderIOS _generateRightArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:](self, "_generateRightArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:", v5, var1, x, y, v22, height, x + v22, v23, x + v22, v23 + a3->var6, x + v22 + a3->var5, v23 + a3->var6 * 0.5, *(_QWORD *)&a3->var4, *(_QWORD *)&a3->var6);
      break;
    default:
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, height - a3->var5, a3->var4);
      v17 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v17;
      break;
  }
  return v5;
}

- (CGPoint)_addLineWithSlightTrailingAndLeadingCurveToPath:(id)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 leadingEdge:(BOOL)a6 isVertical:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;

  v7 = a7;
  v8 = a6;
  y = a5.y;
  x = a5.x;
  v11 = a4.y;
  v12 = a4.x;
  v13 = (a5.x - a4.x) * 0.5;
  v14 = (a5.y - a4.y) * 0.5;
  v15 = a3;
  v16 = v15;
  if (v8)
  {
    v17 = 0.0;
    if (v7)
      v18 = 0.0;
    else
      v18 = v13;
    v19 = v12 - v18;
    if (v7)
      v17 = v14;
    v20 = v11 - v17;
    objc_msgSend(v15, "moveToPoint:", v12 - v18, v11 - v17, v11 + v14, v12 + v13);
    objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", v28, v27, v12, v11, v12, v11);
    objc_msgSend(v16, "lineToPoint:", x, y);
  }
  else
  {
    v19 = x - v13;
    v20 = y - v14;
    v21 = -0.0;
    if (v7)
      v22 = -0.0;
    else
      v22 = v13;
    v23 = x + v22;
    if (v7)
      v21 = v14;
    v24 = y + v21;
    objc_msgSend(v15, "lineToPoint:", x - v13, y - v14);
    objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", v23, v24, x, y, x, y);
  }

  v25 = v19;
  v26 = v20;
  result.y = v26;
  result.x = v25;
  return result;
}

- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3 pinnedArrowSide:(int64_t)a4 arrowBase:(double)a5 arrowOffset:(double)a6
{
  double x;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;

  x = a3.origin.x;
  v8 = a3.origin.x + a3.size.width - a5;
  v9 = a3.origin.x + a3.size.width * 0.5 + a6 - a5 * 0.5;
  v10 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
  if (a4 == 2)
    v11 = v8;
  else
    v11 = v9;
  if (a4 == 4)
    v11 = x;
  if (!v10)
    v11 = v9;
  return fmax(x, fmin(v11, v8));
}

- (double)_leftAndRightStartYLocationForBounds:(CGRect)a3 pinnedArrowSide:(int64_t)a4 arrowBase:(double)a5 arrowOffset:(double)a6
{
  double y;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;

  y = a3.origin.y;
  v8 = a3.origin.y + a3.size.height - a5;
  v9 = a3.origin.y + a3.size.height * 0.5 + a6 - a5 * 0.5;
  v10 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
  if (a4 == 3)
    v11 = v8;
  else
    v11 = v9;
  if (a4 == 1)
    v11 = y;
  if (!v10)
    v11 = v9;
  return fmax(y, fmin(v11, v8));
}

- (CGPoint)_addArrowCurveToPath:(id)a3 direction:(unint64_t)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8
{
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v17;
  double v18;
  id v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  double v24;
  double v25;
  BOOL v26;
  _UIPopoverShapePathProviderIOS *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  uint64_t v36;
  double v37;
  double v38;
  BOOL v39;
  double v40;
  double v41;
  BOOL v42;
  double v43;
  double v44;
  CGPoint result;

  y = a7.y;
  x = a7.x;
  v11 = a6.y;
  v12 = a6.x;
  v13 = a5.y;
  v14 = a5.x;
  v17 = a5.x;
  v18 = a5.y;
  v19 = a3;
  switch(a4)
  {
    case 1uLL:
      v17 = x + 2.0;
      v20 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 == 2 && v20)
      {
        objc_msgSend(v19, "moveToPoint:", x + 2.0, y + 1.0);
        v18 = y + 1.0;
      }
      else
      {
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v19, 1, 0, v12, v11, x + 2.0, y + 1.0);
        v17 = v24;
        v18 = v25;
      }
      objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", x + -2.0, y + 1.0, x, y, x, y);
      v26 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 != 4 || !v26)
      {
        v27 = self;
        v28 = v19;
        v29 = x + -2.0;
        v30 = y + 1.0;
        v31 = v14;
        v32 = v13;
        goto LABEL_22;
      }
      break;
    case 2uLL:
      v17 = x + -2.0;
      v21 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 == 4 && v21)
      {
        objc_msgSend(v19, "moveToPoint:", x + -2.0, y + -1.0);
        v18 = y + -1.0;
      }
      else
      {
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v19, 1, 0, v14, v13, x + -2.0, y + -1.0);
        v17 = v33;
        v18 = v34;
      }
      objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", x + 2.0, y + -1.0, x, y, x, y);
      v35 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 != 2 || !v35)
      {
        v27 = self;
        v28 = v19;
        v29 = x + 2.0;
        v30 = y + -1.0;
        v31 = v12;
        v32 = v11;
LABEL_22:
        v36 = 0;
        goto LABEL_32;
      }
      break;
    case 4uLL:
      v18 = y + -2.0;
      v22 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 == 1 && v22)
      {
        objc_msgSend(v19, "moveToPoint:", x + 1.0, y + -2.0);
        v17 = x + 1.0;
      }
      else
      {
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v19, 1, 1, v14, v13, x + 1.0, y + -2.0);
        v17 = v37;
        v18 = v38;
      }
      objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", x + 1.0, y + 2.0, x, y, x, y);
      v39 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 != 3 || !v39)
      {
        v27 = self;
        v28 = v19;
        v29 = x + 1.0;
        v30 = y + 2.0;
        v31 = v12;
        v32 = v11;
        goto LABEL_31;
      }
      break;
    case 8uLL:
      v18 = y + 2.0;
      v23 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 == 3 && v23)
      {
        objc_msgSend(v19, "moveToPoint:", x + -1.0, y + 2.0);
        v17 = x + -1.0;
      }
      else
      {
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v19, 1, 1, v12, v11, x + -1.0, y + 2.0);
        v17 = v40;
        v18 = v41;
      }
      objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", x + -1.0, y + -2.0, x, y, x, y);
      v42 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 != 1 || !v42)
      {
        v27 = self;
        v28 = v19;
        v29 = x + -1.0;
        v30 = y + -2.0;
        v31 = v14;
        v32 = v13;
LABEL_31:
        v36 = 1;
LABEL_32:
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](v27, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v28, 0, v36, v29, v30, v31, v32);
      }
      break;
    default:
      break;
  }

  v43 = v17;
  v44 = v18;
  result.y = v44;
  result.x = v43;
  return result;
}

- (void)_generateTopArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10
{
  CGFloat x;
  double y;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double MaxX;
  CGFloat MinY;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat width;
  CGFloat v38;
  double MinX;
  double v40;
  double v41;
  double v42;
  CGFloat height;
  id v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  x = a7.x;
  y = a6.y;
  v12 = a6.x;
  v13 = a5.y;
  v14 = a5.x;
  height = a4.size.height;
  v36 = a4.origin.x;
  width = a4.size.width;
  v15 = a4.origin.y;
  v44 = a3;
  v34 = v12;
  v35 = y;
  -[_UIPopoverShapePathProviderIOS _addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:pinnedArrowSide:](self, "_addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:pinnedArrowSide:", v14, v13, v12, y, a9, a10);
  v41 = v17;
  v42 = v18;
  if (*(_QWORD *)&x == 4)
  {
    v33 = v14;
    v46.origin.x = v36;
    v46.origin.y = v15;
    v46.size.width = width;
    v19 = height;
    v46.size.height = height;
    MinX = CGRectGetMinX(v46);
    v20 = v36;
    v47.origin.x = v36;
    v47.origin.y = v15;
    v47.size.width = width;
    v47.size.height = height;
    v21 = CGRectGetMinY(v47) + v45;
    if (!_UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows())
      objc_msgSend(v44, "lineToPoint:", v33, v13);
    objc_msgSend(v44, "addCurveToPoint:controlPoint1:controlPoint2:", MinX, v21, v36, v15, v36, v15, *(_QWORD *)&v33);
    v22 = v36 + v45;
    v40 = v15 + v45;
    v23 = v44;
    v24 = v15;
    v25 = width;
  }
  else
  {
    v20 = v36;
    v22 = v36 + v45;
    v40 = v15 + v45;
    objc_msgSend(v44, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v36 + v45);
    v23 = v44;
    v24 = v15;
    v25 = width;
    v19 = height;
  }
  v38 = v24;
  v26 = v24 + v19;
  v27 = v24 + v19 - v45;
  objc_msgSend(v23, "lineToPoint:", v20, v27);
  objc_msgSend(v44, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v22, v27, v45, 3.14159265, 1.57079633);
  objc_msgSend(v44, "lineToPoint:", v20 + v25 - v45, v26);
  objc_msgSend(v44, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20 + v25 - v45, v27, v45, 1.57079633, 0.0);
  objc_msgSend(v44, "lineToPoint:", v20 + v25, v40);
  if (*(_QWORD *)&x == 2)
  {
    v28 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
    if (v28)
      v29 = v41;
    else
      v29 = v34;
    if (v28)
      v30 = v42;
    else
      v30 = v35;
    v48.origin.x = v20;
    v48.origin.y = v38;
    v48.size.width = v25;
    v48.size.height = height;
    MaxX = CGRectGetMaxX(v48);
    v49.origin.x = v20;
    v49.origin.y = v38;
    v49.size.width = v25;
    v49.size.height = height;
    MinY = CGRectGetMinY(v49);
    objc_msgSend(v44, "addCurveToPoint:controlPoint1:controlPoint2:", v29, v30, MaxX, MinY, MaxX, MinY);
  }
  else
  {
    objc_msgSend(v44, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20 + v25 - v45, v40, v45, 0.0, 4.71238898);
    objc_msgSend(v44, "lineToPoint:", v41, v42);
  }
  objc_msgSend(v44, "closePath");

}

- (void)_generateBottomArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10
{
  CGFloat x;
  double y;
  double v12;
  double height;
  double width;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double MinX;
  CGFloat v29;
  double v30;
  double MaxX;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  id v40;
  double v41;
  double v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  x = a7.x;
  y = a5.y;
  v12 = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v36 = a4.origin.y;
  v15 = a4.origin.x;
  v40 = a3;
  v32 = v12;
  v33 = y;
  -[_UIPopoverShapePathProviderIOS _addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:pinnedArrowSide:](self, "_addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:pinnedArrowSide:", v12, y, a6.x, a6.y, a9, a10);
  v34 = width;
  v35 = height;
  v37 = v17;
  v38 = v18;
  if (*(_QWORD *)&x == 2)
  {
    v43.origin.x = v15;
    v19 = v36;
    v43.origin.y = v36;
    v43.size.width = width;
    v43.size.height = height;
    MaxX = CGRectGetMaxX(v43);
    v44.origin.x = v15;
    v44.origin.y = v36;
    v44.size.width = width;
    v44.size.height = height;
    v30 = CGRectGetMaxY(v44) - v41;
    v45.origin.x = v15;
    v45.origin.y = v36;
    v45.size.width = width;
    v45.size.height = height;
    v20 = CGRectGetMaxX(v45);
    v46.origin.x = v15;
    v46.origin.y = v36;
    v46.size.width = width;
    v46.size.height = height;
    MaxY = CGRectGetMaxY(v46);
    if (!_UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows())
      objc_msgSend(v40, "lineToPoint:", a6.x, a6.y);
    objc_msgSend(v40, "addCurveToPoint:controlPoint1:controlPoint2:", MaxX, v30, v20, MaxY, v20, MaxY);
    v22 = v15 + width;
    v23 = v15 + width - v41;
    v24 = v36 + height - v41;
  }
  else
  {
    v22 = v15 + width;
    v23 = v15 + width - v41;
    v19 = v36;
    v24 = v36 + height - v41;
    objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v23, v24, v41, 1.57079633, 0.0);
  }
  objc_msgSend(v40, "lineToPoint:", v22, v19 + v41);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v23, v19 + v41, v41, 0.0, 4.71238898);
  objc_msgSend(v40, "lineToPoint:", v15 + v41 + v42 + 6.0, v19);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v15 + v41, v19 + v41, v41, 4.71238898, 3.14159265);
  objc_msgSend(v40, "lineToPoint:", v15, v24);
  if (*(_QWORD *)&x == 4)
  {
    v25 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
    if (v25)
      v26 = v37;
    else
      v26 = v32;
    if (v25)
      v27 = v38;
    else
      v27 = v33;
    v47.origin.x = v15;
    v47.origin.y = v19;
    v47.size.width = v34;
    v47.size.height = v35;
    MinX = CGRectGetMinX(v47);
    v48.origin.x = v15;
    v48.origin.y = v19;
    v48.size.width = v34;
    v48.size.height = v35;
    v29 = CGRectGetMaxY(v48);
    objc_msgSend(v40, "addCurveToPoint:controlPoint1:controlPoint2:", v26, v27, MinX, v29, MinX, v29);
  }
  else
  {
    objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v15 + v41, v24, v41, 3.14159265, 1.57079633);
    objc_msgSend(v40, "lineToPoint:", v37, v38);
  }
  objc_msgSend(v40, "closePath");

}

- (void)_generateLeftArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10
{
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double height;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double MinX;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  double v31;
  double v32;
  CGFloat MinY;
  double v34;
  double MaxY;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double y;
  CGFloat width;
  id v45;
  double v46;
  double v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  x = a7.x;
  y = a6.y;
  width = a4.size.width;
  v11 = a6.x;
  v12 = a5.y;
  v13 = a5.x;
  height = a4.size.height;
  v15 = a4.origin.y;
  v40 = a4.origin.x;
  v45 = a3;
  v37 = v13;
  v38 = v12;
  -[_UIPopoverShapePathProviderIOS _addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:pinnedArrowSide:](self, "_addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:pinnedArrowSide:", v13, v12, v11, y, a9, a10);
  v39 = height;
  v41 = v17;
  v42 = v18;
  if (*(_QWORD *)&x == 3)
  {
    v34 = v11;
    v19 = v40;
    v48.origin.x = v40;
    v48.origin.y = v15;
    v20 = width;
    v48.size.width = width;
    v48.size.height = height;
    v36 = CGRectGetMinX(v48) + v46;
    v49.origin.x = v40;
    v49.origin.y = v15;
    v49.size.width = width;
    v49.size.height = height;
    MaxY = CGRectGetMaxY(v49);
    v50.origin.x = v40;
    v50.origin.y = v15;
    v50.size.width = width;
    v50.size.height = height;
    MinX = CGRectGetMinX(v50);
    v51.origin.x = v40;
    v51.origin.y = v15;
    v51.size.width = width;
    v51.size.height = height;
    v22 = CGRectGetMaxY(v51);
    if (!_UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows())
      objc_msgSend(v45, "lineToPoint:", v34, y);
    objc_msgSend(v45, "addCurveToPoint:controlPoint1:controlPoint2:", v36, MaxY, MinX, v22, MinX, v22);
    v23 = v15 + height;
    v24 = v15 + height - v46;
    v25 = v40 + v46;
    v26 = v45;
  }
  else
  {
    v19 = v40;
    v25 = v40 + v46;
    v23 = v15 + height;
    v24 = v15 + height - v46;
    objc_msgSend(v45, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v40 + v46, v24, v46, 3.14159265, 1.57079633);
    v26 = v45;
    v20 = width;
  }
  v27 = v19 + v20;
  v28 = v19 + v20 - v46;
  objc_msgSend(v26, "lineToPoint:", v28, v23);
  objc_msgSend(v45, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v28, v24, v46, 1.57079633, 0.0);
  objc_msgSend(v45, "lineToPoint:", v27, v15 + v46);
  objc_msgSend(v45, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v28, v15 + v46, v46, 0.0, 4.71238898);
  objc_msgSend(v45, "lineToPoint:", v25 + v47 + 6.0, v15);
  if (*(_QWORD *)&x == 1)
  {
    v29 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
    if (v29)
      v30 = v41;
    else
      v30 = v37;
    if (v29)
      v31 = v42;
    else
      v31 = v38;
    v52.origin.x = v19;
    v52.origin.y = v15;
    v52.size.width = width;
    v52.size.height = v39;
    v32 = CGRectGetMinX(v52);
    v53.origin.x = v19;
    v53.origin.y = v15;
    v53.size.width = width;
    v53.size.height = v39;
    MinY = CGRectGetMinY(v53);
    objc_msgSend(v45, "addCurveToPoint:controlPoint1:controlPoint2:", v30, v31, v32, MinY, v32, MinY);
  }
  else
  {
    objc_msgSend(v45, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v25, v15 + v46, v46, 4.71238898, 3.14159265);
    objc_msgSend(v45, "lineToPoint:", v41, v42);
  }
  objc_msgSend(v45, "closePath");

}

- (void)_generateRightArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10
{
  CGFloat x;
  double y;
  double v12;
  double v13;
  double v14;
  CGFloat width;
  double v16;
  double v18;
  double v19;
  double v20;
  double MaxX;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  CGFloat MaxY;
  double MinY;
  double v34;
  double v35;
  CGFloat height;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  x = a7.x;
  y = a6.y;
  v12 = a6.x;
  v13 = a5.y;
  v14 = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v42 = a4.origin.y;
  v16 = a4.origin.x;
  v43 = a3;
  v37 = v13;
  v35 = y;
  -[_UIPopoverShapePathProviderIOS _addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:pinnedArrowSide:](self, "_addArrowCurveToPath:direction:startPoint:endPoint:peakPoint:pinnedArrowSide:", v14, v13, v12, y, a9, a10);
  v40 = v18;
  v41 = width;
  v39 = v19;
  if (*(_QWORD *)&x == 1)
  {
    v46.origin.x = v16;
    v46.origin.y = v42;
    v46.size.width = width;
    v46.size.height = height;
    v20 = v44;
    v34 = CGRectGetMaxX(v46) - v44;
    v47.origin.x = v16;
    v47.origin.y = v42;
    v47.size.width = width;
    v47.size.height = height;
    MinY = CGRectGetMinY(v47);
    v48.origin.x = v16;
    v48.origin.y = v42;
    v48.size.width = width;
    v48.size.height = height;
    MaxX = CGRectGetMaxX(v48);
    v49.origin.x = v16;
    v49.origin.y = v42;
    v49.size.width = width;
    v22 = height;
    v49.size.height = height;
    v23 = CGRectGetMinY(v49);
    if (!_UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows())
      objc_msgSend(v43, "lineToPoint:", v14, v37);
    objc_msgSend(v43, "addCurveToPoint:controlPoint1:controlPoint2:", v34, MinY, MaxX, v23, MaxX, v23);
    v24 = v42;
    v25 = v42 + v44;
    v38 = v16 + v41 - v44;
  }
  else
  {
    v26 = width;
    v22 = height;
    v20 = v44;
    v24 = v42;
    v25 = v42 + v44;
    v38 = v16 + v26 - v44;
    objc_msgSend(v43, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
  }
  objc_msgSend(v43, "lineToPoint:", v16 + v20 + v45 + 6.0, v24);
  objc_msgSend(v43, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16 + v20, v25, v20, 4.71238898, 3.14159265);
  v27 = v24 + v22;
  objc_msgSend(v43, "lineToPoint:", v16, v27 - v20);
  objc_msgSend(v43, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16 + v20, v27 - v20, v20, 3.14159265, 1.57079633);
  objc_msgSend(v43, "lineToPoint:", v38, v27);
  if (*(_QWORD *)&x == 3)
  {
    v28 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
    if (v28)
      v29 = v39;
    else
      v29 = v12;
    if (v28)
      v30 = v40;
    else
      v30 = v35;
    v50.origin.x = v16;
    v50.origin.y = v42;
    v50.size.width = v41;
    v50.size.height = v22;
    v31 = CGRectGetMaxX(v50);
    v51.origin.x = v16;
    v51.origin.y = v42;
    v51.size.width = v41;
    v51.size.height = v22;
    MaxY = CGRectGetMaxY(v51);
    objc_msgSend(v43, "addCurveToPoint:controlPoint1:controlPoint2:", v29, v30, v31, MaxY, v31, MaxY);
  }
  else
  {
    objc_msgSend(v43, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v38, v27 - v20, v20, 1.57079633, 0.0);
    objc_msgSend(v43, "lineToPoint:", v39, v40);
  }
  objc_msgSend(v43, "closePath");

}

@end

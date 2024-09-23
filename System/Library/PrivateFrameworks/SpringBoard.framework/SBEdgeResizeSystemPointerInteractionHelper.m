@implementation SBEdgeResizeSystemPointerInteractionHelper

+ (BOOL)shouldBeginPointerInteractionAtLocation:(CGPoint)a3 frame:(CGRect)a4 innerLengthOfInteractionRegion:(double)a5 outerLengthOfInteractionRegion:(double)a6 cornerLengthOfInteractionRegion:(double)a7 occupiedCorners:(unint64_t)a8 hoveringOverEdge:(unint64_t *)a9 pointerRegion:(CGRect *)a10
{
  char v12;
  double height;
  CGFloat y;
  CGFloat x;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  BOOL result;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double width;
  CGPoint v32;
  CGPoint v33;
  CGPoint v34;
  CGPoint v35;
  CGPoint v36;
  CGPoint v37;
  CGPoint v38;
  CGPoint v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v12 = a8;
  height = a4.size.height;
  width = a4.size.width;
  y = a3.y;
  x = a3.x;
  v18 = a5 + a6;
  SBRectWithSize();
  v40.origin.x = -a6;
  v19 = v18;
  v20 = v40.origin.x;
  v21 = height + a7 * -2.0;
  v40.origin.y = a7;
  v40.size.width = v19;
  v40.size.height = v21;
  v32.x = x;
  v32.y = y;
  if (CGRectContainsPoint(v40, v32))
  {
    result = 1;
    v23 = 3;
    v24 = v19;
    v25 = a7;
    v26 = v20;
    goto LABEL_22;
  }
  v30 = height;
  v26 = width - a5;
  v41.origin.x = width - a5;
  v41.origin.y = a7;
  v41.size.width = v19;
  v41.size.height = v21;
  v33.x = x;
  v33.y = y;
  if (CGRectContainsPoint(v41, v33))
  {
    result = 1;
    v23 = 4;
    v24 = v19;
    v25 = a7;
    goto LABEL_22;
  }
  v21 = v19;
  v25 = v30 - a5;
  v27 = y;
  v24 = width + -a7 * 2.0;
  v42.origin.x = a7;
  v42.origin.y = v25;
  v42.size.width = v24;
  v42.size.height = v21;
  v34.x = x;
  v34.y = v27;
  if (CGRectContainsPoint(v42, v34))
  {
    result = 1;
    v23 = 2;
    v26 = a7;
    goto LABEL_22;
  }
  v26 = a7;
  v43.origin.x = a7;
  v29 = v20;
  v43.origin.y = v20;
  v43.size.width = width + -a7 * 2.0;
  v28 = v21;
  v43.size.height = v21;
  v35.x = x;
  v35.y = v27;
  result = CGRectContainsPoint(v43, v35);
  v23 = 1;
  if ((v12 & 8) == 0)
  {
    if (!result)
    {
      UIRectCenteredAboutPoint();
      v26 = v44.origin.x;
      v24 = v44.size.width;
      v28 = v44.size.height;
      v29 = v44.origin.y;
      v36.y = v27;
      v36.x = x;
      result = CGRectContainsPoint(v44, v36);
      v23 = 8;
    }
    if ((v12 & 4) != 0)
      goto LABEL_15;
    goto LABEL_13;
  }
  if ((v12 & 4) == 0)
  {
LABEL_13:
    if (!result)
    {
      UIRectCenteredAboutPoint();
      v26 = v45.origin.x;
      v24 = v45.size.width;
      v28 = v45.size.height;
      v29 = v45.origin.y;
      v37.y = v27;
      v37.x = x;
      result = CGRectContainsPoint(v45, v37);
      v23 = 7;
    }
  }
LABEL_15:
  if ((v12 & 2) == 0 && !result)
  {
    UIRectCenteredAboutPoint();
    v26 = v46.origin.x;
    v24 = v46.size.width;
    v28 = v46.size.height;
    v29 = v46.origin.y;
    v38.y = v27;
    v38.x = x;
    result = CGRectContainsPoint(v46, v38);
    v23 = 6;
  }
  v21 = v28;
  if ((v12 & 1) != 0)
  {
    v25 = v29;
  }
  else
  {
    v25 = v29;
    if (!result)
    {
      UIRectCenteredAboutPoint();
      v26 = v47.origin.x;
      v25 = v47.origin.y;
      v24 = v47.size.width;
      v21 = v47.size.height;
      v39.y = v27;
      v39.x = x;
      result = CGRectContainsPoint(v47, v39);
      v23 = 5;
    }
  }
LABEL_22:
  *a9 = v23;
  a10->origin.x = v26;
  a10->origin.y = v25;
  a10->size.width = v24;
  a10->size.height = v21;
  return result;
}

+ (id)fancyResizePointerShapeHoveringOverEdge:(unint64_t)a3 innerLengthOfInteractionRegion:(double)a4 outerLengthOfInteractionRegion:(double)a5 cornerRadii:(UIRectCornerRadii)a6
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  CGPath *Mutable;
  CGFloat v14;
  double v15;
  id v16;
  void *v17;
  CGAffineTransform v19;
  CGAffineTransform m;

  topRight = a6.topRight;
  bottomRight = a6.bottomRight;
  bottomLeft = a6.bottomLeft;
  topLeft = a6.topLeft;
  Mutable = CGPathCreateMutable();
  v14 = 1.57079633;
  switch(a3)
  {
    case 1uLL:
      v14 = -1.57079633;
      goto LABEL_5;
    case 2uLL:
      goto LABEL_5;
    case 3uLL:
      v14 = 3.14159265;
      goto LABEL_5;
    case 5uLL:
      v14 = -2.35619449;
      bottomRight = topLeft;
      goto LABEL_10;
    case 6uLL:
      v14 = -0.785398163;
      bottomRight = topRight;
      goto LABEL_10;
    case 7uLL:
      v14 = 2.35619449;
      bottomRight = bottomLeft;
      goto LABEL_10;
    case 8uLL:
      v14 = 0.785398163;
LABEL_10:
      v15 = bottomRight - sqrt(bottomRight * bottomRight + bottomRight * bottomRight);
      break;
    default:
      v14 = 0.0;
LABEL_5:
      v15 = (a4 - a5) * 0.5;
      break;
  }
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeRotation(&v19, v14);
  CGAffineTransformTranslate(&m, &v19, v15, 0.0);
  CGPathMoveToPoint(Mutable, &m, -3.0, 0.0);
  CGPathAddArcToPoint(Mutable, &m, -3.0, 8.0, -19.8947368, 0.0, 2.0);
  CGPathAddArcToPoint(Mutable, &m, -19.8947368, 0.0, -3.0, -8.0, 2.0);
  CGPathAddArcToPoint(Mutable, &m, -3.0, -8.0, -3.0, 8.0, 2.0);
  CGPathCloseSubpath(Mutable);
  CGPathMoveToPoint(Mutable, &m, 3.0, 0.0);
  CGPathAddArcToPoint(Mutable, &m, 3.0, 8.0, 19.8947368, 0.0, 2.0);
  CGPathAddArcToPoint(Mutable, &m, 19.8947368, 0.0, 3.0, -8.0, 2.0);
  CGPathAddArcToPoint(Mutable, &m, 3.0, -8.0, 3.0, 8.0, 2.0);
  CGPathCloseSubpath(Mutable);
  v16 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  objc_msgSend(v16, "setCGPath:", Mutable);
  CGPathRelease(Mutable);
  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithPath:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (unint64_t)latchingAxesForHoveredEdge:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 0;
  else
    return qword_1D0E8B100[a3 - 1];
}

@end

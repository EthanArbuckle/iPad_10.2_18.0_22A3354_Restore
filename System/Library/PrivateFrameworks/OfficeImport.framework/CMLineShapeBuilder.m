@implementation CMLineShapeBuilder

- (void)setStroke:(id)a3
{
  objc_storeStrong((id *)&self->_stroke, a3);
}

- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3
{
  CGPath *Mutable;
  int type;
  __int128 v7;
  __int128 v8;
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  int v20;
  void *v21;
  double v22;
  int v23;
  int v24;
  void *v25;
  double v26;
  _OWORD v28[3];
  _OWORD v29[3];
  _OWORD v30[3];
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  Mutable = CGPathCreateMutable();
  type = self->super._type;
  if (type == 34)
  {
    v8 = *(_OWORD *)&a3->c;
    v29[0] = *(_OWORD *)&a3->a;
    v29[1] = v8;
    v29[2] = *(_OWORD *)&a3->tx;
    -[CMLineShapeBuilder _renderBentConnector3InPath:withTransform:andOrientedBounds:headSrc:headDst:tailSrc:tailDst:](self, "_renderBentConnector3InPath:withTransform:andOrientedBounds:headSrc:headDst:tailSrc:tailDst:", Mutable, v29, self->super._orientedBounds, &v37, &v35, &v33, &v31);
  }
  else
  {
    v7 = *(_OWORD *)&a3->c;
    if (type == 33)
    {
      v30[0] = *(_OWORD *)&a3->a;
      v30[1] = v7;
      v30[2] = *(_OWORD *)&a3->tx;
      -[CMLineShapeBuilder _renderBentConnector2InPath:withTransform:andOrientedBounds:headSrc:headDst:tailSrc:tailDst:](self, "_renderBentConnector2InPath:withTransform:andOrientedBounds:headSrc:headDst:tailSrc:tailDst:", Mutable, v30, self->super._orientedBounds, &v37, &v35, &v33, &v31);
    }
    else
    {
      v28[0] = *(_OWORD *)&a3->a;
      v28[1] = v7;
      v28[2] = *(_OWORD *)&a3->tx;
      -[CMLineShapeBuilder _renderStraightConnector1InPath:withTransform:andOrientedBounds:headSrc:headDst:tailSrc:tailDst:](self, "_renderStraightConnector1InPath:withTransform:andOrientedBounds:headSrc:headDst:tailSrc:tailDst:", Mutable, v28, self->super._orientedBounds, &v37, &v35, &v33, &v31);
    }
  }
  a = a3->a;
  b = a3->b;
  c = a3->c;
  d = a3->d;
  tx = a3->tx;
  ty = a3->ty;
  v15 = ty + v38 * d + b * v37;
  v37 = tx + v38 * c + a3->a * v37;
  v38 = v15;
  v16 = ty + d * v36 + b * v35;
  v35 = tx + c * v36 + a * v35;
  v36 = v16;
  v17 = v33;
  v33 = tx + c * v34 + a * v33;
  v34 = ty + d * v34 + b * v17;
  v18 = ty + d * v32 + b * v31;
  v31 = tx + c * v32 + a * v31;
  v32 = v18;
  -[CMLineShapeBuilder _getRotationFromPoint:toPoint:withBounds:](self, "_getRotationFromPoint:toPoint:withBounds:", self->super._orientedBounds);
  v20 = v19;
  -[OADStroke head](self->_stroke, "head");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = v20;
  -[CMLineShapeBuilder _renderLineEnd:atPoint:withOrientation:inPath:](self, "_renderLineEnd:atPoint:withOrientation:inPath:", v21, Mutable, v35, v36, v22);

  -[CMLineShapeBuilder _getRotationFromPoint:toPoint:withBounds:](self, "_getRotationFromPoint:toPoint:withBounds:", self->super._orientedBounds, v33, v34, v31, v32);
  v24 = v23;
  -[OADStroke tail](self->_stroke, "tail");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = v24;
  -[CMLineShapeBuilder _renderLineEnd:atPoint:withOrientation:inPath:](self, "_renderLineEnd:atPoint:withOrientation:inPath:", v25, Mutable, v31, v32, v26);

  return Mutable;
}

- (void)_renderStraightConnector1InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9
{
  _BOOL4 v14;
  int v15;
  int v16;
  double v17;
  double v18;
  id v19;

  v19 = a5;
  objc_msgSend(v19, "rotation");
  v14 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  v15 = objc_msgSend(v19, "flipX");
  v16 = v15 ^ objc_msgSend(v19, "flipY");
  if ((v14 & v16) != 0)
    v17 = 0.0;
  else
    v17 = 10.0;
  if ((v14 & v16) != 0)
    v18 = 10.0;
  else
    v18 = 0.0;
  CGPathMoveToPoint(a3, a4, v17, v18);
  CGPathAddLineToPoint(a3, a4, v18, v17);
  a9->x = v18;
  a9->y = v17;
  a8->x = v17;
  a8->y = v18;
  a6->x = v18;
  a6->y = v17;
  a7->x = v17;
  a7->y = v18;

}

- (float)_getRotationFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 withBounds:(id)a5
{
  double x;
  double v6;
  double v7;
  double v8;
  float result;

  x = a4.x;
  v6 = a3.x;
  v7 = a4.x - a3.x;
  if (v7 == 0.0)
    v8 = dbl_22A4D53E0[a3.y > a4.y];
  else
    v8 = atan((a4.y - a3.y) / v7);
  result = v8;
  if (x < v6)
    return result + 3.14159265;
  return result;
}

- (void)_renderLineEnd:(id)a3 atPoint:(CGPoint)a4 withOrientation:(float)a5 inPath:(CGPath *)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  int v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform m;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  if (v11)
  {
    -[CMLineShapeBuilder _boundingBoxForLineEnd:](self, "_boundingBoxForLineEnd:", v11);
    v12 = v43.origin.x;
    v13 = v43.origin.y;
    width = v43.size.width;
    height = v43.size.height;
    v16 = CGRectGetWidth(v43);
    v44.origin.x = v12;
    v44.origin.y = v13;
    v44.size.width = width;
    v44.size.height = height;
    v17 = CGRectGetHeight(v44);
    memset(&v41, 0, sizeof(v41));
    CGAffineTransformMakeTranslation(&v41, x, y);
    v39 = v41;
    CGAffineTransformScale(&v40, &v39, 1.66666663, 1.66666663);
    v41 = v40;
    v38 = v40;
    CGAffineTransformRotate(&v40, &v38, a5 + 1.57079633);
    v41 = v40;
    v37 = v40;
    CGAffineTransformScale(&v40, &v37, 1.0, -1.0);
    v41 = v40;
    v18 = objc_msgSend(v11, "type");
    v19 = v16;
    v20 = v17;
    v21 = v19 * 0.5;
    switch(v18)
    {
      case 1:
        CGAffineTransformMakeTranslation(&m, 0.0, (float)-v20);
        t1 = m;
        t2 = v41;
        CGAffineTransformConcat(&v40, &t1, &t2);
        m = v40;
        CGPathMoveToPoint(a6, &m, v21, 0.0);
        v22 = 0.0;
        CGPathAddLineToPoint(a6, &m, 0.0, v20);
        v23 = (float)-v21;
        goto LABEL_7;
      case 2:
        CGAffineTransformMakeTranslation(&m, 0.0, (float)(v20 / -3.0));
        v34 = m;
        v33 = v41;
        CGAffineTransformConcat(&v40, &v34, &v33);
        m = v40;
        CGPathMoveToPoint(a6, &m, v21, 0.0);
        CGPathAddLineToPoint(a6, &m, 0.0, v20);
        v23 = 0.0;
        CGPathAddLineToPoint(a6, &m, (float)-v21, 0.0);
        v24 = v20 / 3.0;
        goto LABEL_6;
      case 3:
        m = v41;
        CGPathMoveToPoint(a6, &m, v21, 0.0);
        CGPathAddLineToPoint(a6, &m, 0.0, (float)(v20 * 0.5));
        v23 = 0.0;
        CGPathAddLineToPoint(a6, &m, (float)-v21, 0.0);
        v24 = -(float)(v20 * 0.5);
LABEL_6:
        v22 = v24;
LABEL_7:
        CGPathAddLineToPoint(a6, &m, v23, v22);
        CGPathCloseSubpath(a6);
        break;
      case 4:
        m = v41;
        v45.origin.x = (float)(v19 * -0.5);
        v45.origin.y = (float)(v20 * -0.5);
        v45.size.width = v19;
        v45.size.height = v20;
        CGPathAddEllipseInRect(a6, &m, v45);
        break;
      case 5:
        v25 = atanf((float)(sqrtf((float)((float)(v20 + (float)(v20 * -0.5)) + -0.5) + (float)(v21 * (float)(v21 + -1.0)))- (float)(v20 + -0.5))/ (float)(v21 + -1.0));
        v26 = v25 + v25;
        v27 = sinf(v25 + v25);
        v28 = v20 + (float)(-1.0 / v27);
        CGAffineTransformMakeTranslation(&m, 0.0, (float)-v28);
        v32 = m;
        v31 = v41;
        CGAffineTransformConcat(&v40, &v32, &v31);
        m = v40;
        CGPathMoveToPoint(a6, &m, 0.0, v20);
        v29 = v21 + -0.5;
        v30 = cosf(v26);
        CGPathAddLineToPoint(a6, &m, (float)(v29 + (float)(v30 * 0.5)), (float)((float)(v27 * 0.5) + 0.5));
        CGPathAddLineToPoint(a6, &m, 0.0, v28);
        CGPathAddLineToPoint(a6, &m, (float)-(float)(v29 + (float)(v30 * -0.5)), (float)((float)(v27 * -0.5) + 0.5));
        CGPathCloseSubpath(a6);
        break;
      default:
        break;
    }
  }

}

- (CGRect)_boundingBoxForLineEnd:(id)a3
{
  id v3;
  float *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  float v8;
  unsigned int v9;
  float v10;
  int v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 5)
    v4 = (float *)&-[CMLineShapeBuilder _boundingBoxForLineEnd:]::openEndArrowSizes;
  else
    v4 = (float *)&-[CMLineShapeBuilder _boundingBoxForLineEnd:]::arrowSizes;
  v5 = objc_msgSend(v3, "width");
  v6 = objc_msgSend(v3, "length");
  if (v5 >= 3)
    v7 = 0;
  else
    v7 = v5;
  v8 = v4[v7];
  if (v6 >= 3)
    v9 = 0;
  else
    v9 = v6;
  v10 = v4[v9];
  v11 = objc_msgSend(v3, "type");
  v12 = 0.0;
  if (v11 == 4)
    v12 = v10 * 0.5;
  if (v11 == 3)
    v12 = v10 * 0.5;
  v13 = (float)(v12 - v10);

  v14 = (float)(v8 * -0.5);
  v15 = v13;
  v16 = v8;
  v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_renderBentConnector3InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9
{
  _BOOL4 v15;
  int v16;
  int v17;
  float v18;
  int v19;
  double v20;
  double v21;
  float v22;
  CGFloat v23;
  id v24;

  v24 = a5;
  objc_msgSend(v24, "rotation");
  v15 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  v16 = objc_msgSend(v24, "flipX");
  v17 = objc_msgSend(v24, "flipY");
  -[CMLineShapeBuilder _adjustedCoefAtIndex:](self, "_adjustedCoefAtIndex:", 0);
  v19 = v16 ^ v17;
  if ((v15 & (v16 ^ v17)) != 0)
    v20 = 10.0;
  else
    v20 = 0.0;
  if ((v15 & v19) != 0)
    v21 = 0.0;
  else
    v21 = 10.0;
  if ((v15 & v19) != 0)
    v22 = 1.0 - v18;
  else
    v22 = v18;
  CGPathMoveToPoint(a3, a4, v21, v20);
  v23 = v22 * 10.0;
  CGPathAddLineToPoint(a3, a4, v23, v20);
  CGPathAddLineToPoint(a3, a4, v23, v21);
  CGPathAddLineToPoint(a3, a4, v20, v21);
  a7->x = v21;
  a7->y = v20;
  a6->x = v23;
  a6->y = v20;
  a8->x = v23;
  a8->y = v21;
  a9->x = v20;
  a9->y = v21;

}

- (float)_adjustedCoefAtIndex:(int)a3
{
  NSDictionary *adjustValues;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;

  adjustValues = self->super._adjustValues;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](adjustValues, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;
    -[CMShapeBuilder maxAdjustedValue](self, "maxAdjustedValue");
    v10 = v8 / (float)(v9 + v9);
  }
  else
  {
    v10 = 0.5;
  }

  return v10;
}

- (void)_renderBentConnector2InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9
{
  _BOOL4 v14;
  int v15;
  int v16;
  double v17;
  double v18;
  id v19;

  v19 = a5;
  objc_msgSend(v19, "rotation");
  v14 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  v15 = objc_msgSend(v19, "flipX");
  v16 = v15 ^ objc_msgSend(v19, "flipY");
  if ((v14 & v16) != 0)
    v17 = 10.0;
  else
    v17 = 0.0;
  if ((v14 & v16) != 0)
    v18 = 0.0;
  else
    v18 = 10.0;
  CGPathMoveToPoint(a3, a4, v17, v18);
  CGPathAddLineToPoint(a3, a4, v18, v18);
  CGPathAddLineToPoint(a3, a4, v18, v17);
  a9->x = v17;
  a9->y = v18;
  a8->x = v18;
  a8->y = v18;
  a6->x = v18;
  a6->y = v18;
  a7->x = v18;
  a7->y = v17;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stroke, 0);
}

@end

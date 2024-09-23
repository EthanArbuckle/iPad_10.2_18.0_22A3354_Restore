@implementation CMFreeFormShapeBuilder

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void)setSpace:(CGSize)a3
{
  _BOOL4 v4;

  if (a3.width == 0.0 || a3.height == 0.0)
  {
    v4 = -[CMShapeBuilder isOffice12](self, "isOffice12");
    a3.width = 12666.0;
    if (!v4)
      a3.width = 8.0;
    a3.height = a3.width;
  }
  self->_space = a3;
}

- (CGAffineTransform)affineTransform
{
  OADOrientedBounds *orientedBounds;
  uint64_t v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  float v20;
  float v21;
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
  CGAffineTransform *result;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;

  orientedBounds = self->super.super._orientedBounds;
  if (!orientedBounds)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("CMFreeFormShapeBuilder.mm"), 41, CFSTR("oriented bounds not set"));

    orientedBounds = self->super.super._orientedBounds;
  }
  v6 = MEMORY[0x24BDBD8B8];
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  -[OADOrientedBounds bounds](orientedBounds, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[OADOrientedBounds rotation](self->super.super._orientedBounds, "rotation");
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    v9 = NSTransposedRectWithSameCenter(v9, v11, v13, v15);
    v11 = v16;
    v13 = v17;
    v15 = v18;
  }
  v19 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v47.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v47.c = v19;
  *(_OWORD *)&v47.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(retstr, &v47, v9, v11);
  -[OADOrientedBounds rotation](self->super.super._orientedBounds, "rotation");
  v21 = v20 * 3.14159265 / -180.0;
  if (v21 != 0.0)
  {
    v22 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v45.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v45.c = v22;
    *(_OWORD *)&v45.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v46, &v45, v13 * 0.5, v15 * 0.5);
    v23 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v23;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
    v24 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v44.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v44.c = v24;
    *(_OWORD *)&v44.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v46, &v44, v21);
    v25 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v25;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
    v26 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v43.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v43.c = v26;
    *(_OWORD *)&v43.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v46, &v43, -(v13 * 0.5), -(v15 * 0.5));
    v27 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
  }
  if (-[OADOrientedBounds flipX](self->super.super._orientedBounds, "flipX"))
  {
    v28 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v42.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v42.c = v28;
    *(_OWORD *)&v42.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v46, &v42, -1.0, 1.0);
    v29 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v29;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
    v30 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v41.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v41.c = v30;
    *(_OWORD *)&v41.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v46, &v41, -v13, 0.0);
    v31 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v31;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
  }
  result = (CGAffineTransform *)-[OADOrientedBounds flipY](self->super.super._orientedBounds, "flipY");
  if ((_DWORD)result)
  {
    v33 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v40.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v40.c = v33;
    *(_OWORD *)&v40.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v46, &v40, 1.0, -1.0);
    v34 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v34;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
    v35 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v39.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v39.c = v35;
    *(_OWORD *)&v39.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v46, &v39, 0.0, -v15);
    v36 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v36;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
  }
  return result;
}

- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3
{
  CGPath *Mutable;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  __int128 v9;
  _OWORD v12[3];

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, 0.0, 0.0);
  if (-[OADPath elementCount](self->_path, "elementCount"))
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      -[OADPath elementAtIndex:](self->_path, "elementAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v9 = *(_OWORD *)&a3->c;
      v12[0] = *(_OWORD *)&a3->a;
      v12[1] = v9;
      v12[2] = *(_OWORD *)&a3->tx;
      -[CMFreeFormShapeBuilder _renderPathElement:withTransform:inPath:](self, "_renderPathElement:withTransform:inPath:", v8, v12, Mutable);

      v6 = v7;
      if (-[OADPath elementCount](self->_path, "elementCount") <= v7++)
        return Mutable;
    }
    CGPathCloseSubpath(Mutable);

  }
  return Mutable;
}

- (CGPoint)_renderPathElement:(id)a3 withTransform:(CGAffineTransform *)a4 inPath:(CGPath *)a5
{
  double v5;
  double v6;
  id v10;
  int v11;
  CGSize *p_space;
  double width;
  int v14;
  double v15;
  double v16;
  int v17;
  double v18;
  int v19;
  CGPoint CurrentPoint;
  int v21;
  CGSize *v22;
  double v23;
  int v24;
  int v25;
  CGSize *v26;
  double v27;
  int v28;
  int v29;
  double height;
  int v31;
  double v32;
  int v33;
  int v34;
  double v35;
  int v36;
  double v37;
  int v38;
  int v39;
  CGSize *v40;
  double v41;
  int v42;
  int v43;
  double v44;
  int v45;
  double v46;
  int v47;
  CGPoint result;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (unint64_t)objc_msgSend(v10, "toPoint") >> 32;
    p_space = &self->_space;
    width = p_space->width;
    objc_msgSend(v10, "toPoint");
    v5 = (double)v11 / width;
    v6 = (double)v14 / p_space->height;
    CGPathMoveToPoint(a5, a4, v5, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (unint64_t)objc_msgSend(v10, "toPoint") >> 32;
      v18 = self->_space.width;
      objc_msgSend(v10, "toPoint");
      v5 = (double)v17 / v18;
      v6 = (double)v19 / self->_space.height;
      if (objc_msgSend(v10, "relative"))
      {
        CurrentPoint = CGPathGetCurrentPoint(a5);
        v5 = v5 + CurrentPoint.x;
        v6 = v6 + CurrentPoint.y;
        CGPathAddLineToPoint(a5, 0, v5, v6);
      }
      else
      {
        CGPathAddLineToPoint(a5, a4, v5, v6);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (unint64_t)objc_msgSend(v10, "toPoint") >> 32;
        v22 = &self->_space;
        v23 = v22->width;
        objc_msgSend(v10, "toPoint");
        v5 = (double)v21 / v23;
        v6 = (double)v24 / v22->height;
        CGPathAddLineToPoint(a5, a4, v5, v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = (unint64_t)objc_msgSend(v10, "toPoint") >> 32;
          v26 = &self->_space;
          v27 = self->_space.width;
          objc_msgSend(v10, "toPoint");
          v29 = v28;
          height = v26->height;
          v31 = (unint64_t)objc_msgSend(v10, "controlPoint1") >> 32;
          v32 = v26->width;
          objc_msgSend(v10, "controlPoint1");
          v34 = v33;
          v35 = v26->height;
          v36 = (unint64_t)objc_msgSend(v10, "controlPoint2") >> 32;
          v37 = v26->width;
          objc_msgSend(v10, "controlPoint2");
          v5 = (double)v25 / v27;
          v6 = (double)v29 / height;
          CGPathAddCurveToPoint(a5, a4, (double)v31 / v32, (double)v34 / v35, (double)v36 / v37, (double)v38 / v26->height, v5, v6);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = (unint64_t)objc_msgSend(v10, "toPoint") >> 32;
            v40 = &self->_space;
            v41 = self->_space.width;
            objc_msgSend(v10, "toPoint");
            v43 = v42;
            v44 = v40->height;
            v45 = (unint64_t)objc_msgSend(v10, "controlPoint") >> 32;
            v46 = v40->width;
            objc_msgSend(v10, "controlPoint");
            v5 = (double)v39 / v41;
            v6 = (double)v43 / v44;
            CGPathAddQuadCurveToPoint(a5, a4, (double)v45 / v46, (double)v47 / v40->height, v5, v6);
          }
        }
      }
    }
  }

  v15 = v5;
  v16 = v6;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end

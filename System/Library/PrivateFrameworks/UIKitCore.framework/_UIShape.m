@implementation _UIShape

+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5 cornerMask:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  double v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v13 = objc_opt_new();
  v14 = (_QWORD *)v13;
  *(CGFloat *)(v13 + 40) = x;
  *(CGFloat *)(v13 + 48) = y;
  *(CGFloat *)(v13 + 56) = width;
  *(CGFloat *)(v13 + 64) = height;
  v15 = 0.0;
  if (a4 >= 0.0)
    v15 = a4;
  *(double *)(v13 + 16) = v15;
  v16 = *(void **)(v13 + 24);
  *(_QWORD *)(v13 + 24) = v12;

  v14[4] = a6;
  return v14;
}

+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5
{
  return +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:", a5, 15, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (id)shapeWithPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  int v10;
  id *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v4 = objc_opt_new();
  if (objc_msgSend(v3, "_isRoundedRect"))
  {
    objc_msgSend(v3, "bounds");
    *(_QWORD *)(v4 + 40) = v5;
    *(_QWORD *)(v4 + 48) = v6;
    *(_QWORD *)(v4 + 56) = v7;
    *(_QWORD *)(v4 + 64) = v8;
    objc_msgSend(v3, "_cornerRadius");
    if (v9 < 0.0)
      v9 = 0.0;
    *(double *)(v4 + 16) = v9;
    v10 = objc_msgSend(v3, "_hasContinuousCorners");
    v11 = (id *)MEMORY[0x1E0CD2A68];
    if (!v10)
      v11 = (id *)MEMORY[0x1E0CD2A60];
    objc_storeStrong((id *)(v4 + 24), *v11);
    *(_QWORD *)(v4 + 32) = objc_msgSend(v3, "_cornerMask");
  }
  else
  {
    v12 = objc_msgSend(v3, "copy");
    v13 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v12;

  }
  return (id)v4;
}

+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadii:(CACornerRadii *)a4 cornerCurve:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  uint64_t v11;
  CGSize minXMinY;
  CGSize maxXMinY;
  CGSize maxXMaxY;
  void *v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v11 = objc_opt_new();
  *(CGFloat *)(v11 + 40) = x;
  *(CGFloat *)(v11 + 48) = y;
  *(CGFloat *)(v11 + 56) = width;
  *(CGFloat *)(v11 + 64) = height;
  maxXMinY = a4->maxXMinY;
  minXMinY = a4->minXMinY;
  maxXMaxY = a4->maxXMaxY;
  *(CGSize *)(v11 + 72) = a4->minXMaxY;
  *(CGSize *)(v11 + 104) = maxXMinY;
  *(CGSize *)(v11 + 120) = minXMinY;
  *(CGSize *)(v11 + 88) = maxXMaxY;
  v15 = *(void **)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v10;

  *(_QWORD *)(v11 + 32) = 15;
  return (id)v11;
}

- (id)shapeConvertedFromCoordinateSpace:(id)a3 toCoordinateSpace:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)-[_UIShape copy](self, "copy");
  v9 = v8;
  if (v6 != v7)
  {
    if (objc_msgSend(v8, "isRect"))
    {
      objc_msgSend(v9, "rect");
      objc_msgSend(v6, "convertRect:toCoordinateSpace:", v7);
      v9[5] = v10;
      v9[6] = v11;
      v9[7] = v12;
      v9[8] = v13;
    }
    else
    {
      -[UIBezierPath _bezierPathConvertedFromCoordinateSpace:toCoordinateSpace:](self->_path, "_bezierPathConvertedFromCoordinateSpace:toCoordinateSpace:", v6, v7);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v9[1];
      v9[1] = v14;

    }
  }

  return v9;
}

- (CGSize)size
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_UIShape bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (-[_UIShape isRect](self, "isRect"))
  {
    -[_UIShape rect](self, "rect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[_UIShape path](self, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;

  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)isRect
{
  void *v2;
  BOOL v3;

  -[_UIShape path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (UIBezierPath)outline
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  unint64_t v17;

  -[_UIShape path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_UIShape bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[_UIShape cornerRadius](self, "cornerRadius");
    v13 = v12;
    -[_UIShape cornerCurve](self, "cornerCurve");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)*MEMORY[0x1E0CD2A68];

    v16 = _UIClampedCornerRadius(self->_cornerMask, v13, v5, v7, v9, v11);
    v17 = self->_cornerMask & 0xF;
    if (v14 == v15)
      +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v17, v5, v7, v9, v11, v16, v16);
    else
      +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", v17, 16, 1, v5, v7, v9, v11, v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIBezierPath *)v3;
}

- (_UIShape)zeroOriginShape
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat MinY;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  if (-[_UIShape isRect](self, "isRect"))
  {
    -[_UIShape rect](self, "rect");
    v4 = v3;
    v6 = v5;
    -[_UIShape cornerRadius](self, "cornerRadius");
    v8 = v7;
    -[_UIShape cornerCurve](self, "cornerCurve");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:", v9, -[_UIShape cornerMask](self, "cornerMask"), 0.0, 0.0, v4, v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UIShape path](self, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    memset(&v17, 0, sizeof(v17));
    objc_msgSend(v12, "bounds");
    v13 = -CGRectGetMinX(v18);
    objc_msgSend(v12, "bounds");
    MinY = CGRectGetMinY(v19);
    CGAffineTransformMakeTranslation(&v17, v13, -MinY);
    v16 = v17;
    objc_msgSend(v12, "applyTransform:", &v16);
    +[_UIShape shapeWithPath:](_UIShape, "shapeWithPath:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (_UIShape *)v10;
}

- (BOOL)isEqual:(id)a3
{
  _UIShape *v4;
  _UIShape *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGRect v29;
  CGRect v30;

  v4 = (_UIShape *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UIShape path](v5, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIShape path](self, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v8;
        if (!v8 || !v9)
          goto LABEL_17;
        LODWORD(v11) = objc_msgSend(v8, "isEqual:", v9);

        if (!(_DWORD)v11)
          goto LABEL_18;
      }
      -[_UIShape rect](v5, "rect");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[_UIShape rect](self, "rect");
      v30.origin.x = v21;
      v30.origin.y = v22;
      v30.size.width = v23;
      v30.size.height = v24;
      v29.origin.x = v14;
      v29.origin.y = v16;
      v29.size.width = v18;
      v29.size.height = v20;
      if (!CGRectEqualToRect(v29, v30)
        || (-[_UIShape cornerRadius](v5, "cornerRadius"),
            v26 = v25,
            -[_UIShape cornerRadius](self, "cornerRadius"),
            v26 != v27))
      {
        LOBYTE(v11) = 0;
LABEL_18:

        goto LABEL_19;
      }
      -[_UIShape cornerCurve](v5, "cornerCurve");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIShape cornerCurve](self, "cornerCurve");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 == v9)
      {
        v11 = -[_UIShape cornerMask](v5, "cornerMask");
        LOBYTE(v11) = v11 == -[_UIShape cornerMask](self, "cornerMask");
        v9 = v12;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
LABEL_17:

      goto LABEL_18;
    }
    LOBYTE(v11) = 0;
  }
LABEL_19:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[_UIShape path](self, "path");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  -[_UIShape rect](self, "rect");
  v4[5] = v7;
  v4[6] = v8;
  v4[7] = v9;
  v4[8] = v10;
  -[_UIShape cornerRadius](self, "cornerRadius");
  v4[2] = v11;
  -[_UIShape cornerCurve](self, "cornerCurve");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v4[3];
  v4[3] = v12;

  v4[4] = -[_UIShape cornerMask](self, "cornerMask");
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIShape isRect](self, "isRect"))
  {
    -[_UIShape rect](self, "rect");
    objc_msgSend(v3, "appendFormat:", CFSTR("; rect = (%g %g; %g %g)"), v4, v5, v6, v7);
    -[_UIShape cornerRadius](self, "cornerRadius");
    if (fabs(v8) >= 2.22044605e-16)
    {
      -[_UIShape cornerRadius](self, "cornerRadius");
      objc_msgSend(v3, "appendFormat:", CFSTR("; cornerRadius = %g"), v9);
      -[_UIShape cornerCurve](self, "cornerCurve");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)*MEMORY[0x1E0CD2A68];

      if (v10 == v11)
        v12 = CFSTR("; cornerCurve = continuous");
      else
        v12 = CFSTR("; cornerCurve = circular");
      objc_msgSend(v3, "appendFormat:", v12);
    }
  }
  else
  {
    -[_UIShape path](self, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[_UIShape path](self, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    -[_UIShape path](self, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; path = <%@: %p; bounds = (%g %g; %g %g)>"), v23, v24, v15, v17, v19, v21);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (CACornerRadii)cornerRadii
{
  CGSize v3;
  CGSize v4;

  v3 = *(CGSize *)&self[1].maxXMaxY.height;
  retstr->minXMaxY = *(CGSize *)&self[1].minXMaxY.height;
  retstr->maxXMaxY = v3;
  v4 = *(CGSize *)&self[1].minXMinY.height;
  retstr->maxXMinY = *(CGSize *)&self[1].maxXMinY.height;
  retstr->minXMinY = v4;
  return self;
}

@end

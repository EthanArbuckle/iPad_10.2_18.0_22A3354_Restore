@implementation UIPointerShape

- (UIPointerShape)init
{
  UIPointerShape *v2;
  UIPointerShape *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIPointerShape;
  v2 = -[UIPointerShape init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIPointerShape setMaterialUsage:](v2, "setMaterialUsage:", 1);
    +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "freeformPointerSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "slipFactorX");
    v7 = v6;
    objc_msgSend(v5, "slipFactorY");
    -[UIPointerShape setInherentConstrainedSlip:](v3, "setInherentConstrainedSlip:", v7, v8);
    objc_msgSend(v5, "defaultPointerCornerRadius");
    -[UIPointerShape setDefaultCornerRadius:](v3, "setDefaultCornerRadius:");
    -[UIPointerShape setPinnedPoint:](v3, "setPinnedPoint:", 1.79769313e308, 1.79769313e308);

  }
  return v3;
}

+ (UIPointerShape)shapeWithPath:(UIBezierPath *)path
{
  UIBezierPath *v3;
  void *v4;

  v3 = path;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "_setType:", 1);
  objc_msgSend(v4, "setPath:", v3);

  return (UIPointerShape *)v4;
}

+ (UIPointerShape)shapeWithRoundedRect:(CGRect)rect
{
  return (UIPointerShape *)objc_msgSend(a1, "shapeWithRoundedRect:cornerRadius:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 2.22507386e-308);
}

+ (UIPointerShape)shapeWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
  double height;
  double width;
  double y;
  double x;
  void *v9;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "_setType:", 0);
  objc_msgSend(v9, "setRect:", x, y, width, height);
  objc_msgSend(v9, "setCornerRadius:", cornerRadius);
  return (UIPointerShape *)v9;
}

+ (UIPointerShape)beamWithPreferredLength:(CGFloat)length axis:(UIAxis)axis
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Width;
  double Height;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  CGRect v25;
  CGRect v26;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beamSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (axis - 3 < 0xFFFFFFFFFFFFFFFELL)
    axis = 2;
  objc_msgSend(v8, "minLength");
  v10 = v9;
  objc_msgSend(v8, "maxLength");
  v12 = fmax(v10, fmin(length, v11));
  objc_msgSend(v8, "width");
  v14 = *MEMORY[0x1E0C9D538];
  v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (axis == 2)
    v16 = v13;
  else
    v16 = v12;
  if (axis != 2)
    v12 = v13;
  v25.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v25.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v25.size.width = v16;
  v25.size.height = v12;
  Width = CGRectGetWidth(v25);
  v26.origin.x = v14;
  v26.origin.y = v15;
  v26.size.width = v16;
  v26.size.height = v12;
  Height = CGRectGetHeight(v26);
  if (Width < Height)
    Height = Width;
  objc_msgSend(a1, "shapeWithRoundedRect:cornerRadius:", v14, v15, v16, v12, Height * 0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMaterialUsage:", 2);
  objc_msgSend(v8, "slipFactorX");
  v21 = v20;
  objc_msgSend(v8, "slipFactorY");
  objc_msgSend(v19, "setInherentConstrainedSlip:", v21, v22);
  if (axis == 1)
    v23 = 3;
  else
    v23 = 2;
  objc_msgSend(v19, "_setType:", v23);
  objc_msgSend(v19, "setBeamLength:", length);

  return (UIPointerShape *)v19;
}

+ (id)_linkPointerShape
{
  return (id)objc_opt_new();
}

+ (id)_elasticRectShapePinnedAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setPinnedPoint:", x, y);
  return v5;
}

+ (id)_shapeWithSymbol:(id)a3 pointSize:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat MinY;
  void *v12;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;

  v5 = a3;
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_outlinePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "bounds");
    v10 = -CGRectGetMinX(v15);
    objc_msgSend(v9, "bounds");
    MinY = CGRectGetMinY(v16);
    CGAffineTransformMakeTranslation(&v14, v10, -MinY);
    objc_msgSend(v9, "applyTransform:", &v14);
    +[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGSize)size
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[UIPointerShape path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIPointerShape path](self, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    -[UIPointerShape rect](self, "rect");
    v6 = v9;
    v8 = v10;
  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)isEmpty
{
  void *v4;
  void *v5;
  BOOL IsEmpty;
  CGRect v7;
  CGRect v8;

  if (-[UIPointerShape isElastic](self, "isElastic"))
    return 0;
  -[UIPointerShape path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPointerShape path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    IsEmpty = CGRectIsEmpty(v7);

    return IsEmpty;
  }
  else
  {
    -[UIPointerShape rect](self, "rect");
    return CGRectIsEmpty(v8);
  }
}

- (BOOL)isCircle
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  if (-[UIPointerShape isEmpty](self, "isEmpty"))
    return 0;
  -[UIPointerShape path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  -[UIPointerShape rect](self, "rect");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v8 = CGRectGetWidth(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (vabdd_f64(v8, CGRectGetHeight(v14)) > 2.22044605e-16)
    return 0;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v10 = CGRectGetWidth(v15) * 0.5;
  -[UIPointerShape effectiveCornerRadius](self, "effectiveCornerRadius");
  if (v11 > v10)
    return 1;
  -[UIPointerShape effectiveCornerRadius](self, "effectiveCornerRadius");
  return vabdd_f64(v12, v10) <= 2.22044605e-16;
}

- (BOOL)isElastic
{
  double v2;
  double v3;

  -[UIPointerShape pinnedPoint](self, "pinnedPoint");
  return v3 != 1.79769313e308 || v2 != 1.79769313e308;
}

- (double)effectiveCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;

  -[UIPointerShape cornerRadius](self, "cornerRadius");
  v4 = v3;
  v5 = vabdd_f64(2.22507386e-308, v3);
  if (v4 < 0.0 || v5 <= 2.22044605e-16)
  {
    -[UIPointerShape defaultCornerRadius](self, "defaultCornerRadius", v5);
    v4 = v7;
  }
  -[UIPointerShape rect](self, "rect");
  return _UIClampedCornerRadius(15, v4, v8, v9, v10, v11);
}

- (NSString)cornerCurve
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  id *v10;

  -[UIPointerShape cornerRadius](self, "cornerRadius");
  v4 = v3;
  -[UIPointerShape rect](self, "rect");
  v9 = _UIClampedCornerRadius(15, v4, v5, v6, v7, v8);
  v10 = (id *)MEMORY[0x1E0CD2A68];
  if (v4 > v9)
    v10 = (id *)MEMORY[0x1E0CD2A60];
  return (NSString *)*v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "_setType:", -[UIPointerShape _type](self, "_type"));
  -[UIPointerShape path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", v5);

  -[UIPointerShape rect](self, "rect");
  objc_msgSend(v4, "setRect:");
  -[UIPointerShape pinnedPoint](self, "pinnedPoint");
  objc_msgSend(v4, "setPinnedPoint:");
  -[UIPointerShape cornerRadius](self, "cornerRadius");
  objc_msgSend(v4, "setCornerRadius:");
  -[UIPointerShape defaultCornerRadius](self, "defaultCornerRadius");
  objc_msgSend(v4, "setDefaultCornerRadius:");
  -[UIPointerShape beamLength](self, "beamLength");
  objc_msgSend(v4, "setBeamLength:");
  -[UIPointerShape inherentConstrainedSlip](self, "inherentConstrainedSlip");
  objc_msgSend(v4, "setInherentConstrainedSlip:");
  objc_msgSend(v4, "setMaterialUsage:", -[UIPointerShape materialUsage](self, "materialUsage"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UIPointerShape *v4;
  UIPointerShape *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
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
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  CGRect v51;
  CGRect v52;

  v4 = (UIPointerShape *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[UIPointerShape _type](v5, "_type");
      if (v6 != -[UIPointerShape _type](self, "_type"))
      {
LABEL_23:
        v13 = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[UIPointerShape path](v5, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerShape path](self, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {

      }
      else
      {
        if (!v9 || !v10)
        {

LABEL_22:
          goto LABEL_23;
        }
        v12 = objc_msgSend(v9, "isEqual:", v10);

        if (!v12)
          goto LABEL_22;
      }
      -[UIPointerShape rect](v5, "rect");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[UIPointerShape rect](self, "rect");
      v52.origin.x = v22;
      v52.origin.y = v23;
      v52.size.width = v24;
      v52.size.height = v25;
      v51.origin.x = v15;
      v51.origin.y = v17;
      v51.size.width = v19;
      v51.size.height = v21;
      if (CGRectEqualToRect(v51, v52))
      {
        -[UIPointerShape pinnedPoint](v5, "pinnedPoint");
        v27 = v26;
        v29 = v28;
        -[UIPointerShape pinnedPoint](self, "pinnedPoint");
        if (v27 == v31 && v29 == v30)
        {
          -[UIPointerShape cornerRadius](v5, "cornerRadius");
          v33 = v32;
          -[UIPointerShape cornerRadius](self, "cornerRadius");
          if (v33 == v34)
          {
            -[UIPointerShape defaultCornerRadius](v5, "defaultCornerRadius");
            v36 = v35;
            -[UIPointerShape defaultCornerRadius](self, "defaultCornerRadius");
            if (v36 == v37)
            {
              -[UIPointerShape beamLength](v5, "beamLength");
              v39 = v38;
              -[UIPointerShape beamLength](self, "beamLength");
              if (v39 == v40)
              {
                -[UIPointerShape inherentConstrainedSlip](v5, "inherentConstrainedSlip");
                v42 = v41;
                v44 = v43;
                -[UIPointerShape inherentConstrainedSlip](self, "inherentConstrainedSlip");
                v46 = v45;
                v48 = v47;

                v13 = 0;
                if (v42 == v46 && v44 == v48)
                {
                  v49 = -[UIPointerShape materialUsage](v5, "materialUsage");
                  v13 = v49 == -[UIPointerShape materialUsage](self, "materialUsage");
                }
                goto LABEL_24;
              }
            }
          }
        }
      }
      goto LABEL_22;
    }
    v13 = 0;
  }
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3;
  double v4;
  int v5;
  double v6;
  int v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  int v23;
  double v24;
  int v25;
  double v26;
  int v27;
  double v28;
  uint64_t v30;
  int v31;
  int v32;

  v3 = -[UIPointerShape _type](self, "_type");
  if (-[UIPointerShape isElastic](self, "isElastic"))
  {
    -[UIPointerShape pinnedPoint](self, "pinnedPoint");
    v5 = (int)v4;
    -[UIPointerShape pinnedPoint](self, "pinnedPoint");
    v7 = (int)v6 ^ v5;
  }
  else
  {
    -[UIPointerShape path](self, "path");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "bounds");
    v32 = (int)v9;
    -[UIPointerShape path](self, "path");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "bounds");
    v31 = (int)v11;
    -[UIPointerShape path](self, "path");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "bounds");
    HIDWORD(v30) = (int)v13;
    -[UIPointerShape path](self, "path");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v14, "bounds");
    LODWORD(v30) = (int)v15;

    -[UIPointerShape rect](self, "rect");
    LODWORD(v8) = (int)v16;
    -[UIPointerShape rect](self, "rect");
    LODWORD(v10) = (int)v17;
    -[UIPointerShape rect](self, "rect");
    LODWORD(v12) = (int)v18;
    -[UIPointerShape rect](self, "rect");
    LODWORD(v14) = (int)v19;
    -[UIPointerShape cornerRadius](self, "cornerRadius");
    v21 = (int)v20;
    -[UIPointerShape defaultCornerRadius](self, "defaultCornerRadius");
    v23 = (int)v22;
    -[UIPointerShape beamLength](self, "beamLength");
    v25 = (int)v24;
    -[UIPointerShape inherentConstrainedSlip](self, "inherentConstrainedSlip");
    v27 = (int)v26;
    -[UIPointerShape inherentConstrainedSlip](self, "inherentConstrainedSlip");
    v7 = v31 ^ v32 ^ HIDWORD(v30) ^ v30 ^ v8 ^ v10 ^ v12 ^ v21 ^ v14 ^ v23 ^ v25 ^ v27 ^ (int)v28;
  }
  return v3 ^ -[UIPointerShape materialUsage](self, "materialUsage", v30) ^ v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[UIPointerShape _type](self, "_type"))
  {
    case 0:
      -[UIPointerShape rect](self, "rect");
      v5 = v4;
      -[UIPointerShape rect](self, "rect");
      v7 = v6;
      -[UIPointerShape rect](self, "rect");
      v9 = v8;
      -[UIPointerShape rect](self, "rect");
      objc_msgSend(v3, "appendFormat:", CFSTR("; rect = (%g %g; %g %g)"), v5, v7, v9, v10);
      -[UIPointerShape cornerRadius](self, "cornerRadius");
      if (vabdd_f64(2.22507386e-308, v11) > 2.22044605e-16)
        objc_msgSend(v3, "appendFormat:", CFSTR("; cornerRadius = %g"), *(_QWORD *)&v11);
      break;
    case 1:
      -[UIPointerShape path](self, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("; path = <UIBezierPath: %p>"), v14);

      break;
    case 2:
      -[UIPointerShape beamLength](self, "beamLength");
      objc_msgSend(v3, "appendFormat:", CFSTR("; beamLength = %g (vertical)"), v12);
      break;
    case 3:
      -[UIPointerShape beamLength](self, "beamLength");
      objc_msgSend(v3, "appendFormat:", CFSTR("; beamLength = %g (horizontal)"), v13);
      break;
    default:
      break;
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (CGPoint)pinnedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_pinnedPoint.x;
  y = self->_pinnedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPinnedPoint:(CGPoint)a3
{
  self->_pinnedPoint = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)defaultCornerRadius
{
  return self->_defaultCornerRadius;
}

- (void)setDefaultCornerRadius:(double)a3
{
  self->_defaultCornerRadius = a3;
}

- (CGPoint)inherentConstrainedSlip
{
  double x;
  double y;
  CGPoint result;

  x = self->_inherentConstrainedSlip.x;
  y = self->_inherentConstrainedSlip.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInherentConstrainedSlip:(CGPoint)a3
{
  self->_inherentConstrainedSlip = a3;
}

- (double)beamLength
{
  return self->_beamLength;
}

- (void)setBeamLength:(double)a3
{
  self->_beamLength = a3;
}

- (unint64_t)materialUsage
{
  return self->_materialUsage;
}

- (void)setMaterialUsage:(unint64_t)a3
{
  self->_materialUsage = a3;
}

- (int64_t)_type
{
  return self->__type;
}

- (void)_setType:(int64_t)a3
{
  self->__type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end

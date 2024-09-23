@implementation UIPointerAccessory

+ (UIPointerAccessory)accessoryWithShape:(UIPointerShape *)shape position:(UIPointerAccessoryPosition)position
{
  double angle;
  double offset;
  UIPointerShape *v6;
  void *v7;

  angle = position.angle;
  offset = position.offset;
  v6 = shape;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setShape:", v6);

  objc_msgSend(v7, "setPosition:", fmax(offset, 0.0), angle);
  return (UIPointerAccessory *)v7;
}

+ (UIPointerAccessory)arrowAccessoryWithPosition:(UIPointerAccessoryPosition)position
{
  double angle;
  double offset;
  _BYTE *v5;

  angle = position.angle;
  offset = position.offset;
  if (_MergedGlobals_936 != -1)
    dispatch_once(&_MergedGlobals_936, &__block_literal_global_20);
  +[UIPointerAccessory accessoryWithShape:position:](UIPointerAccessory, "accessoryWithShape:position:", qword_1ECD7CAB0, offset, angle);
  v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrientationMatchesAngle:", 1);
  v5[8] = 1;
  return (UIPointerAccessory *)v5;
}

void __49__UIPointerAccessory_arrowAccessoryWithPosition___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIPointerShape _shapeWithSymbol:pointSize:](UIPointerShape, "_shapeWithSymbol:pointSize:", CFSTR("arrowtriangle.up.fill"), 11.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7CAB0;
  qword_1ECD7CAB0 = v0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  void *v5;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIPointerAccessory shape](self, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShape:", v5);

  -[UIPointerAccessory position](self, "position");
  objc_msgSend(v4, "setPosition:");
  v4[8] = -[UIPointerAccessory _isArrowAccessory](self, "_isArrowAccessory");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UIPointerAccessory *v4;
  UIPointerAccessory *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v21;

  v4 = (UIPointerAccessory *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIPointerAccessory shape](self, "shape");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerAccessory shape](v5, "shape");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if (!v8 || !v9)
        {

          goto LABEL_17;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_17;
      }
      -[UIPointerAccessory position](self, "position");
      v14 = v13;
      v16 = v15;
      -[UIPointerAccessory position](v5, "position");
      v19 = vabdd_f64(v16, v18);
      if (vabdd_f64(v14, v17) <= 2.22044605e-16 && v19 <= 2.22044605e-16)
      {
        v21 = -[UIPointerAccessory orientationMatchesAngle](self, "orientationMatchesAngle", 2.22044605e-16, v19);
        v12 = v21 ^ -[UIPointerAccessory orientationMatchesAngle](v5, "orientationMatchesAngle") ^ 1;
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:
      LOBYTE(v12) = 0;
      goto LABEL_18;
    }
    LOBYTE(v12) = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  -[UIPointerAccessory shape](self, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UIPointerAccessory position](self, "position");
  v6 = (int)v5;
  -[UIPointerAccessory position](self, "position");
  v8 = v4 ^ -[UIPointerAccessory orientationMatchesAngle](self, "orientationMatchesAngle") ^ v6 ^ (int)v7;

  return v8;
}

- (BOOL)_isArrowAccessory
{
  return self->_isArrowAccessory;
}

- (UIPointerShape)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIPointerAccessoryPosition)position
{
  double offset;
  double angle;
  UIPointerAccessoryPosition result;

  offset = self->_position.offset;
  angle = self->_position.angle;
  result.angle = angle;
  result.offset = offset;
  return result;
}

- (void)setPosition:(id)a3
{
  self->_position = ($9AE93E77EC92CA8E9C6A5D1FC64A29A7)a3;
}

- (BOOL)orientationMatchesAngle
{
  return self->_orientationMatchesAngle;
}

- (void)setOrientationMatchesAngle:(BOOL)orientationMatchesAngle
{
  self->_orientationMatchesAngle = orientationMatchesAngle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

@end

@implementation WFGradient

- (int64_t)blendMode
{
  return self->_blendMode;
}

- (BOOL)isDark
{
  double v2;

  -[WFGradient perceivedBrightness](self, "perceivedBrightness");
  return v2 < 0.6;
}

- (double)perceivedBrightness
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;

  -[WFGradient endColor](self, "endColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "red");
  v5 = v4;
  -[WFGradient startColor](self, "startColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "red");
  v8 = vabdd_f64(v5, v7) * 0.5;

  -[WFGradient endColor](self, "endColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "green");
  v11 = v10;
  -[WFGradient startColor](self, "startColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "green");
  v14 = vabdd_f64(v11, v13) * 0.5;

  -[WFGradient endColor](self, "endColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "blue");
  v17 = v16;
  -[WFGradient startColor](self, "startColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "blue");
  v20 = vabdd_f64(v17, v19) * 0.5;

  -[WFGradient endColor](self, "endColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "red");
  v23 = v8 + v22;

  -[WFGradient endColor](self, "endColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "green");
  v26 = v14 + v25;

  -[WFGradient endColor](self, "endColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "blue");
  v29 = v20 + v28;

  return v26 * 0.7152 + v23 * 0.2126 + v29 * 0.0722;
}

- (WFColor)endColor
{
  return self->_endColor;
}

- (WFColor)startColor
{
  return self->_startColor;
}

- (WFGradient)initWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFGradient *v7;

  v4 = a3;
  +[WFColor clearColor](WFColor, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFColor clearColor](WFColor, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFGradient initWithBaseColor:startColor:endColor:blendMode:](self, "initWithBaseColor:startColor:endColor:blendMode:", v4, v5, v6, 0);

  return v7;
}

- (WFColor)baseColor
{
  return self->_baseColor;
}

- (WFGradient)initWithStartColor:(id)a3 endColor:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  WFGradient *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (objc_msgSend(v8, "isEqual:", v7))
  {
    v9 = v8;
  }
  else
  {
    v20 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    v17 = 0.0;
    objc_msgSend(v8, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);
    v15 = 0.0;
    v16 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    objc_msgSend(v7, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
    +[WFColor colorWithRed:green:blue:alpha:](WFColor, "colorWithRed:green:blue:alpha:", (v20 + v16) * 0.5, (v19 + v15) * 0.5, (v18 + v14) * 0.5, (v17 + v13) * 0.5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = -[WFGradient initWithBaseColor:startColor:endColor:blendMode:](self, "initWithBaseColor:startColor:endColor:blendMode:", v10, v8, v7, 0);
  return v11;
}

- (WFGradient)initWithBaseColor:(id)a3 startColor:(id)a4 endColor:(id)a5 blendMode:(int64_t)a6
{
  return -[WFGradient initWithBaseColor:darkBaseColor:accessibilityBaseColor:darkAccessibilityBaseColor:startColor:endColor:blendMode:](self, "initWithBaseColor:darkBaseColor:accessibilityBaseColor:darkAccessibilityBaseColor:startColor:endColor:blendMode:", a3, a3, a3, a3, a4, a5, a6);
}

- (WFGradient)initWithBaseColor:(id)a3 darkBaseColor:(id)a4 accessibilityBaseColor:(id)a5 darkAccessibilityBaseColor:(id)a6 startColor:(id)a7 endColor:(id)a8 blendMode:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFGradient *v21;
  WFGradient *v22;
  WFGradient *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SEL v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  id v39;
  void *v40;
  objc_super v42;

  v15 = a3;
  v39 = a4;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v40 = v20;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = a2;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v33, self, CFSTR("WFGradient.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseColor"));

    a2 = v33;
    v20 = v40;
    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = a2;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v34, self, CFSTR("WFGradient.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("darkBaseColor"));

  a2 = v34;
  v20 = v40;
  if (v17)
  {
LABEL_4:
    if (v18)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = a2;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v35, self, CFSTR("WFGradient.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessibilityBaseColor"));

  a2 = v35;
  v20 = v40;
  if (v18)
  {
LABEL_5:
    if (v19)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = a2;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("WFGradient.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startColor"));

    a2 = v37;
    if (v40)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = a2;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v36, self, CFSTR("WFGradient.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("darkAccessibilityBaseColor"));

  a2 = v36;
  v20 = v40;
  if (!v19)
    goto LABEL_14;
LABEL_6:
  if (v20)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = a2;
  v32 = v30;
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, CFSTR("WFGradient.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endColor"));

LABEL_7:
  v42.receiver = self;
  v42.super_class = (Class)WFGradient;
  v21 = -[WFGradient init](&v42, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_baseColor, a3);
    objc_storeStrong((id *)&v22->_darkBaseColor, v39);
    objc_storeStrong((id *)&v22->_accessibilityBaseColor, a5);
    objc_storeStrong((id *)&v22->_darkAccessibilityBaseColor, a6);
    objc_storeStrong((id *)&v22->_startColor, a7);
    objc_storeStrong((id *)&v22->_endColor, a8);
    v22->_blendMode = a9;
    v23 = v22;
  }

  return v22;
}

- (CGGradient)CGGradient
{
  CGGradient *result;
  __int128 v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  result = self->_CGGradient;
  if (!result)
  {
    v5[0] = -[WFColor CGColor](self->_startColor, "CGColor");
    v5[1] = -[WFColor CGColor](self->_endColor, "CGColor");
    v4 = xmmword_1AF77F030;
    result = CGGradientCreateWithColors(0, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2), (const CGFloat *)&v4);
    self->_CGGradient = result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGGradientRelease(self->_CGGradient);
  v3.receiver = self;
  v3.super_class = (Class)WFGradient;
  -[WFGradient dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  WFGradient *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;

  v4 = (WFGradient *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFGradient baseColor](self, "baseColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGradient baseColor](v4, "baseColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        v10 = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
          goto LABEL_33;
        v13 = objc_msgSend(v7, "isEqual:", v8);

        if (!v13)
        {
          v10 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      -[WFGradient darkBaseColor](self, "darkBaseColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGradient darkBaseColor](v4, "darkBaseColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      v16 = v15;
      v11 = v16;
      if (v12 == v16)
      {

      }
      else
      {
        v10 = 0;
        v17 = v16;
        v18 = v12;
        if (!v12 || !v16)
          goto LABEL_32;
        v19 = objc_msgSend(v12, "isEqual:", v16);

        if (!v19)
        {
          v10 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      -[WFGradient startColor](self, "startColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGradient startColor](v4, "startColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;
      v22 = v21;
      v30 = v22;
      if (v18 != v22)
      {
        v10 = 0;
        if (v18)
        {
          v23 = v22;
          v24 = v18;
          if (v22)
          {
            v25 = objc_msgSend(v18, "isEqual:", v22);

            if (!v25)
            {
              v10 = 0;
LABEL_31:
              v17 = v30;
LABEL_32:

              goto LABEL_33;
            }
            goto LABEL_23;
          }
        }
        else
        {
          v23 = v22;
          v24 = 0;
        }
LABEL_30:

        goto LABEL_31;
      }

LABEL_23:
      -[WFGradient endColor](self, "endColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGradient endColor](v4, "endColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;
      v28 = v27;
      v23 = v28;
      if (v24 == v28)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (v24 && v28)
          v10 = objc_msgSend(v24, "isEqual:", v28);
      }

      goto LABEL_30;
    }
    v10 = 0;
  }
LABEL_35:

  return v10;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[10];

  v21[8] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, {\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v6);
  v21[0] = CFSTR("baseColor");
  v21[1] = CFSTR("darkBaseColor");
  v21[2] = CFSTR("accessibilityBaseColor");
  v21[3] = CFSTR("accessibilityBaseColor");
  v21[4] = CFSTR("darkAccessibilityBaseColor");
  v21[5] = CFSTR("startColor");
  v21[6] = CFSTR("endColor");
  v21[7] = CFSTR("blendMode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[WFGradient valueForKey:](self, "valueForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("\t%@: %@\n"), v13, v14, (_QWORD)v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "appendString:", CFSTR("}>"));
  return v7;
}

- (id)baseColorForDarkMode:(BOOL)a3 highContrast:(BOOL)a4
{
  void *v4;

  if (a3 && a4)
  {
    -[WFGradient darkAccessibilityBaseColor](self, "darkAccessibilityBaseColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    -[WFGradient darkBaseColor](self, "darkBaseColor", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
      -[WFGradient accessibilityBaseColor](self, "accessibilityBaseColor");
    else
      -[WFGradient baseColor](self, "baseColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (WFGradient)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WFGradient *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("darkBaseColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityBaseColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("darkAccessibilityBaseColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("blendMode"));

  v12 = -[WFGradient initWithBaseColor:darkBaseColor:accessibilityBaseColor:darkAccessibilityBaseColor:startColor:endColor:blendMode:](self, "initWithBaseColor:darkBaseColor:accessibilityBaseColor:darkAccessibilityBaseColor:startColor:endColor:blendMode:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WFGradient baseColor](self, "baseColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("baseColor"));

  -[WFGradient darkBaseColor](self, "darkBaseColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("darkBaseColor"));

  -[WFGradient accessibilityBaseColor](self, "accessibilityBaseColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("accessibilityBaseColor"));

  -[WFGradient darkAccessibilityBaseColor](self, "darkAccessibilityBaseColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("darkAccessibilityBaseColor"));

  -[WFGradient startColor](self, "startColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("startColor"));

  -[WFGradient endColor](self, "endColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("endColor"));

  objc_msgSend(v10, "encodeInteger:forKey:", -[WFGradient blendMode](self, "blendMode"), CFSTR("blendMode"));
}

- (WFColor)darkBaseColor
{
  return self->_darkBaseColor;
}

- (WFColor)accessibilityBaseColor
{
  return self->_accessibilityBaseColor;
}

- (WFColor)darkAccessibilityBaseColor
{
  return self->_darkAccessibilityBaseColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endColor, 0);
  objc_storeStrong((id *)&self->_startColor, 0);
  objc_storeStrong((id *)&self->_darkAccessibilityBaseColor, 0);
  objc_storeStrong((id *)&self->_accessibilityBaseColor, 0);
  objc_storeStrong((id *)&self->_darkBaseColor, 0);
  objc_storeStrong((id *)&self->_baseColor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

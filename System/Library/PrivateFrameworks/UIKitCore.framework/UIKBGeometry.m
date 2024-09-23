@implementation UIKBGeometry

- (void)setIsTemplate:(BOOL)a3
{
  self->m_isTemplate = a3;
}

- (void)setExplicitlySpecified:(BOOL)a3
{
  self->m_explicitlySpecified = a3;
}

- (void)setY:(id)a3
{
  self->m_y = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setX:(id)a3
{
  self->m_x = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setW:(id)a3
{
  self->m_w = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setPaddingTop:(id)a3
{
  self->m_paddingTop = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setPaddingRight:(id)a3
{
  self->m_paddingRight = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setPaddingLeft:(id)a3
{
  self->m_paddingLeft = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setPaddingBottom:(id)a3
{
  self->m_paddingBottom = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- (void)setH:(id)a3
{
  self->m_h = ($54480812DE8C7014D3D64BD9CBBA15F5)a3;
  self->m_explicitlySpecified = 1;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)w
{
  uint64_t v2;
  double amount;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v2 = *(_QWORD *)&self->m_w.unit;
  amount = self->m_w.amount;
  result.var1 = v2;
  result.var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)x
{
  uint64_t v2;
  double amount;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v2 = *(_QWORD *)&self->m_x.unit;
  amount = self->m_x.amount;
  result.var1 = v2;
  result.var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)h
{
  uint64_t v2;
  double amount;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v2 = *(_QWORD *)&self->m_h.unit;
  amount = self->m_h.amount;
  result.var1 = v2;
  result.var0 = amount;
  return result;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *m_name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  m_name = self->m_name;
  self->m_name = v4;

}

- (UIKBGeometry)init
{
  UIKBGeometry *v2;
  UIKBGeometry *v3;
  UIKBGeometry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKBGeometry;
  v2 = -[UIKBGeometry init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->m_explicitlySpecified = 0;
    v4 = v2;
  }

  return v3;
}

+ (id)geometry
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)geometryWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIKBGeometry *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(UIKBGeometry);
  -[UIKBGeometry setX:](v7, "setX:", *(_QWORD *)&x, 3);
  -[UIKBGeometry setY:](v7, "setY:", *(_QWORD *)&y, 3);
  -[UIKBGeometry setW:](v7, "setW:", *(_QWORD *)&width, 3);
  -[UIKBGeometry setH:](v7, "setH:", *(_QWORD *)&height, 3);
  return v7;
}

+ (id)geometryWithOriginValue:(id)a3 sizeValue:(id)a4
{
  uint64_t v4;
  double var0;
  uint64_t v6;
  double v7;
  UIKBGeometry *v8;

  v4 = *(_QWORD *)&a4.var1;
  var0 = a4.var0;
  v6 = *(_QWORD *)&a3.var1;
  v7 = a3.var0;
  v8 = objc_alloc_init(UIKBGeometry);
  -[UIKBGeometry setX:](v8, "setX:", *(_QWORD *)&v7, v6);
  -[UIKBGeometry setY:](v8, "setY:", *(_QWORD *)&v7, v6);
  -[UIKBGeometry setW:](v8, "setW:", *(_QWORD *)&var0, v4);
  -[UIKBGeometry setH:](v8, "setH:", *(_QWORD *)&var0, v4);
  return v8;
}

- (UIKBGeometry)initWithName:(id)a3 rect:(id *)a4 padding:(id *)a5
{
  id v9;
  UIKBGeometry *v10;
  UIKBGeometry *v11;
  UIKBGeometry *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIKBGeometry;
  v10 = -[UIKBGeometry init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->m_name, a3);
    v11->m_x = ($54480812DE8C7014D3D64BD9CBBA15F5)a4->var0[0];
    v11->m_y = ($54480812DE8C7014D3D64BD9CBBA15F5)a4->var0[1];
    v11->m_w = ($54480812DE8C7014D3D64BD9CBBA15F5)a4->var0[2];
    v11->m_h = ($54480812DE8C7014D3D64BD9CBBA15F5)a4->var0[3];
    v11->m_paddingTop = ($54480812DE8C7014D3D64BD9CBBA15F5)a5->var0[0];
    v11->m_paddingLeft = ($54480812DE8C7014D3D64BD9CBBA15F5)a5->var0[1];
    v11->m_paddingBottom = ($54480812DE8C7014D3D64BD9CBBA15F5)a5->var0[2];
    v11->m_paddingRight = ($54480812DE8C7014D3D64BD9CBBA15F5)a5->var0[3];
    v11->m_explicitlySpecified = 1;
    v12 = v11;
  }

  return v11;
}

- (id)initTemplateWithName:(id)a3 rect:(id *)a4 padding:(id *)a5
{
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v5;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v6;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v7;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 v8;
  id result;
  _OWORD v10[4];
  _OWORD v11[4];

  v5 = a4->var0[1];
  v11[0] = a4->var0[0];
  v11[1] = v5;
  v6 = a4->var0[3];
  v11[2] = a4->var0[2];
  v11[3] = v6;
  v7 = a5->var0[1];
  v10[0] = a5->var0[0];
  v10[1] = v7;
  v8 = a5->var0[3];
  v10[2] = a5->var0[2];
  v10[3] = v8;
  result = -[UIKBGeometry initWithName:rect:padding:](self, "initWithName:rect:padding:", a3, v11, v10);
  *((_BYTE *)result + 145) = 1;
  return result;
}

- (UIKBGeometry)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *m_name;
  float v7;
  double v8;
  unsigned int v9;
  float v10;
  double v11;
  unsigned int v12;
  float v13;
  double v14;
  unsigned int v15;
  float v16;
  double v17;
  unsigned int v18;
  float v19;
  double v20;
  unsigned int v21;
  float v22;
  double v23;
  unsigned int v24;
  float v25;
  double v26;
  unsigned int v27;
  float v28;
  double v29;
  unsigned int v30;
  char v31;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  m_name = self->m_name;
  self->m_name = v5;

  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("x-amount"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("x-unit"));
  self->m_x.amount = v8;
  *(_QWORD *)&self->m_x.unit = v9;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("y-amount"));
  v11 = v10;
  v12 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("y-unit"));
  self->m_y.amount = v11;
  *(_QWORD *)&self->m_y.unit = v12;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("w-amount"));
  v14 = v13;
  v15 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("w-unit"));
  self->m_w.amount = v14;
  *(_QWORD *)&self->m_w.unit = v15;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("h-amount"));
  v17 = v16;
  v18 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("h-unit"));
  self->m_h.amount = v17;
  *(_QWORD *)&self->m_h.unit = v18;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("paddingTop-amount"));
  v20 = v19;
  v21 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("paddingTop-unit"));
  self->m_paddingTop.amount = v20;
  *(_QWORD *)&self->m_paddingTop.unit = v21;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("paddingLeft-amount"));
  v23 = v22;
  v24 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("paddingLeft-unit"));
  self->m_paddingLeft.amount = v23;
  *(_QWORD *)&self->m_paddingLeft.unit = v24;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("paddingBottom-amount"));
  v26 = v25;
  v27 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("paddingBottom-unit"));
  self->m_paddingBottom.amount = v26;
  *(_QWORD *)&self->m_paddingBottom.unit = v27;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("paddingRight-amount"));
  v29 = v28;
  v30 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("paddingRight-unit"));
  self->m_paddingRight.amount = v29;
  *(_QWORD *)&self->m_paddingRight.unit = v30;
  self->m_explicitlySpecified = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("explicit"));
  v31 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTemplate"));

  self->m_isTemplate = v31;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *m_name;
  double amount;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  m_name = self->m_name;
  v13 = a3;
  objc_msgSend(v13, "encodeObject:forKey:", m_name, CFSTR("name"));
  amount = self->m_x.amount;
  *(float *)&amount = amount;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("x-amount"), amount);
  objc_msgSend(v13, "encodeInt:forKey:", self->m_x.unit, CFSTR("x-unit"));
  v6 = self->m_y.amount;
  *(float *)&v6 = v6;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("y-amount"), v6);
  objc_msgSend(v13, "encodeInt:forKey:", self->m_y.unit, CFSTR("y-unit"));
  v7 = self->m_w.amount;
  *(float *)&v7 = v7;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("w-amount"), v7);
  objc_msgSend(v13, "encodeInt:forKey:", self->m_w.unit, CFSTR("w-unit"));
  v8 = self->m_h.amount;
  *(float *)&v8 = v8;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("h-amount"), v8);
  objc_msgSend(v13, "encodeInt:forKey:", self->m_h.unit, CFSTR("h-unit"));
  v9 = self->m_paddingTop.amount;
  *(float *)&v9 = v9;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("paddingTop-amount"), v9);
  objc_msgSend(v13, "encodeInt:forKey:", self->m_paddingTop.unit, CFSTR("paddingTop-unit"));
  v10 = self->m_paddingLeft.amount;
  *(float *)&v10 = v10;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("paddingLeft-amount"), v10);
  objc_msgSend(v13, "encodeInt:forKey:", self->m_paddingLeft.unit, CFSTR("paddingLeft-unit"));
  v11 = self->m_paddingBottom.amount;
  *(float *)&v11 = v11;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("paddingBottom-amount"), v11);
  objc_msgSend(v13, "encodeInt:forKey:", self->m_paddingBottom.unit, CFSTR("paddingBottom-unit"));
  v12 = self->m_paddingRight.amount;
  *(float *)&v12 = v12;
  objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("paddingRight-amount"), v12);
  objc_msgSend(v13, "encodeInt:forKey:", self->m_paddingRight.unit, CFSTR("paddingRight-unit"));
  objc_msgSend(v13, "encodeBool:forKey:", self->m_explicitlySpecified, CFSTR("explicit"));
  objc_msgSend(v13, "encodeBool:forKey:", self->m_isTemplate, CFSTR("isTemplate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBGeometry *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = objc_alloc_init(UIKBGeometry);
  -[UIKBGeometry name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBGeometry setName:](v4, "setName:", v5);

  v6 = -[UIKBGeometry x](self, "x");
  -[UIKBGeometry setX:](v4, "setX:", v6, v7);
  v8 = -[UIKBGeometry y](self, "y");
  -[UIKBGeometry setY:](v4, "setY:", v8, v9);
  v10 = -[UIKBGeometry w](self, "w");
  -[UIKBGeometry setW:](v4, "setW:", v10, v11);
  v12 = -[UIKBGeometry h](self, "h");
  -[UIKBGeometry setH:](v4, "setH:", v12, v13);
  v14 = -[UIKBGeometry paddingTop](self, "paddingTop");
  -[UIKBGeometry setPaddingTop:](v4, "setPaddingTop:", v14, v15);
  v16 = -[UIKBGeometry paddingLeft](self, "paddingLeft");
  -[UIKBGeometry setPaddingLeft:](v4, "setPaddingLeft:", v16, v17);
  v18 = -[UIKBGeometry paddingBottom](self, "paddingBottom");
  -[UIKBGeometry setPaddingBottom:](v4, "setPaddingBottom:", v18, v19);
  v20 = -[UIKBGeometry paddingRight](self, "paddingRight");
  -[UIKBGeometry setPaddingRight:](v4, "setPaddingRight:", v20, v21);
  -[UIKBGeometry setExplicitlySpecified:](v4, "setExplicitlySpecified:", -[UIKBGeometry explicitlySpecified](self, "explicitlySpecified"));
  -[UIKBGeometry setIsTemplate:](v4, "setIsTemplate:", -[UIKBGeometry isTemplate](self, "isTemplate"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  int v15;
  int v16;
  double v17;
  int v18;
  double v19;
  int v20;
  int v21;
  double v22;
  int v23;
  double v24;
  int v25;
  _BOOL4 v26;
  double v27;
  int v28;
  int v29;
  int v30;
  _BOOL4 v32;
  double v33;
  int v34;
  int v35;
  int v36;
  double v38;
  int v39;
  int v40;
  int v41;
  double v43;
  int v44;
  int v45;
  int v46;
  _BOOL4 v48;
  _BOOL4 v49;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  id v56;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = v4;
    v5 = v4;
    v6 = -[UIKBGeometry x](self, "x");
    v55 = v7;
    v8 = objc_msgSend(v5, "x");
    v54 = v9;
    v10 = *(double *)&v6;
    v11 = *(double *)&v8;
    v12 = COERCE_DOUBLE(-[UIKBGeometry y](self, "y"));
    v53 = v13;
    v14 = COERCE_DOUBLE(objc_msgSend(v5, "y"));
    v16 = v15;
    v17 = COERCE_DOUBLE(-[UIKBGeometry w](self, "w"));
    v52 = v18;
    v19 = COERCE_DOUBLE(objc_msgSend(v5, "w"));
    v21 = v20;
    v22 = COERCE_DOUBLE(-[UIKBGeometry h](self, "h"));
    v51 = v23;
    v24 = COERCE_DOUBLE(objc_msgSend(v5, "h"));
    LOBYTE(v26) = 0;
    if (v10 == v11 && v55 == v54 && v12 == v14 && v53 == v16 && v17 == v19 && v52 == v21 && v22 == v24 && v51 == v25)
    {
      v27 = COERCE_DOUBLE(-[UIKBGeometry paddingTop](self, "paddingTop", v22));
      v29 = v28;
      v32 = v27 == COERCE_DOUBLE(objc_msgSend(v5, "paddingTop")) && v29 == v30;
      v33 = COERCE_DOUBLE(-[UIKBGeometry paddingLeft](self, "paddingLeft", v27));
      v35 = v34;
      if (v33 != COERCE_DOUBLE(objc_msgSend(v5, "paddingLeft")) || v35 != v36)
        v32 = 0;
      v38 = COERCE_DOUBLE(-[UIKBGeometry paddingBottom](self, "paddingBottom", v33));
      v40 = v39;
      if (v38 != COERCE_DOUBLE(objc_msgSend(v5, "paddingBottom")) || v40 != v41)
        v32 = 0;
      v43 = COERCE_DOUBLE(-[UIKBGeometry paddingRight](self, "paddingRight", v38));
      v45 = v44;
      v48 = v43 == COERCE_DOUBLE(objc_msgSend(v5, "paddingRight")) && v45 == v46 && v32;
      v49 = -[UIKBGeometry isTemplate](self, "isTemplate", v43);
      v26 = v48 & (v49 ^ objc_msgSend(v5, "isTemplate") ^ 1);
    }

    v4 = v56;
  }
  else
  {
    LOBYTE(v26) = 0;
  }

  return v26;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  int unit;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  int v21;
  const __CFString *v22;
  void *v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UIKBGeometry name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIKBGeometry name](self, "name");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("no name");
  }
  unit = self->m_x.unit;
  switch(unit)
  {
    case 2:
      v8 = CFSTR("%");
      break;
    case 100:
      v8 = CFSTR("*");
      break;
    case 3:
      v8 = CFSTR("pt");
      break;
    default:
      v8 = &stru_1E16EDF20;
      break;
  }
  v9 = self->m_y.unit;
  switch(v9)
  {
    case 2:
      v10 = CFSTR("%");
      break;
    case 100:
      v10 = CFSTR("*");
      break;
    case 3:
      v10 = CFSTR("pt");
      break;
    default:
      v10 = &stru_1E16EDF20;
      break;
  }
  v11 = self->m_w.unit;
  switch(v11)
  {
    case 2:
      v12 = CFSTR("%");
      break;
    case 100:
      v12 = CFSTR("*");
      break;
    case 3:
      v12 = CFSTR("pt");
      break;
    default:
      v12 = &stru_1E16EDF20;
      break;
  }
  v13 = self->m_h.unit;
  switch(v13)
  {
    case 2:
      v14 = CFSTR("%");
      break;
    case 100:
      v14 = CFSTR("*");
      break;
    case 3:
      v14 = CFSTR("pt");
      break;
    default:
      v14 = &stru_1E16EDF20;
      break;
  }
  v15 = self->m_paddingTop.unit;
  switch(v15)
  {
    case 2:
      v16 = CFSTR("%");
      break;
    case 100:
      v16 = CFSTR("*");
      break;
    case 3:
      v16 = CFSTR("pt");
      break;
    default:
      v16 = &stru_1E16EDF20;
      break;
  }
  v17 = self->m_paddingLeft.unit;
  switch(v17)
  {
    case 2:
      v18 = CFSTR("%");
      break;
    case 100:
      v18 = CFSTR("*");
      break;
    case 3:
      v18 = CFSTR("pt");
      break;
    default:
      v18 = &stru_1E16EDF20;
      break;
  }
  v19 = self->m_paddingBottom.unit;
  switch(v19)
  {
    case 2:
      v20 = CFSTR("%");
      break;
    case 100:
      v20 = CFSTR("*");
      break;
    case 3:
      v20 = CFSTR("pt");
      break;
    default:
      v20 = &stru_1E16EDF20;
      break;
  }
  v21 = self->m_paddingRight.unit;
  switch(v21)
  {
    case 2:
      v22 = CFSTR("%");
      break;
    case 100:
      v22 = CFSTR("*");
      break;
    case 3:
      v22 = CFSTR("pt");
      break;
    default:
      v22 = &stru_1E16EDF20;
      break;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %@> dims(%.2f%@, %.2f%@, %.2f%@, %.2f%@) padding(%.2f%@, %.2f%@, %.2f%@, %.2f%@)"), v4, v6, *(_QWORD *)&self->m_x.amount, v8, *(_QWORD *)&self->m_y.amount, v10, *(_QWORD *)&self->m_w.amount, v12, *(_QWORD *)&self->m_h.amount, v14, *(_QWORD *)&self->m_paddingTop.amount, v16, *(_QWORD *)&self->m_paddingLeft.amount, v18, *(_QWORD *)&self->m_paddingBottom.amount, v20,
    *(_QWORD *)&self->m_paddingRight.amount,
    v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)

  return v23;
}

- (id)shortDescription
{
  void *v2;
  double amount;
  int unit;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  double v8;
  int v9;
  const __CFString *v10;
  __CFString *v11;
  double v12;
  int v13;
  const __CFString *v14;
  __CFString *v15;
  double v16;
  int v17;
  const __CFString *v18;
  __CFString *v19;
  double v20;
  int v21;
  const __CFString *v22;
  __CFString *v23;
  double v24;
  int v25;
  const __CFString *v26;
  __CFString *v27;
  double v28;
  int v29;
  const __CFString *v30;
  __CFString *v31;
  double v32;
  int v33;
  const __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;

  v2 = (void *)MEMORY[0x1E0CB3940];
  amount = self->m_x.amount;
  unit = self->m_x.unit;
  v5 = &stru_1E16EDF20;
  if (unit == 2)
    v6 = CFSTR("%");
  else
    v6 = &stru_1E16EDF20;
  if (unit == 100)
    v7 = CFSTR("*");
  else
    v7 = (__CFString *)v6;
  v8 = self->m_y.amount;
  v9 = self->m_y.unit;
  if (v9 == 2)
    v10 = CFSTR("%");
  else
    v10 = &stru_1E16EDF20;
  if (v9 == 100)
    v11 = CFSTR("*");
  else
    v11 = (__CFString *)v10;
  v12 = self->m_w.amount;
  v13 = self->m_w.unit;
  if (v13 == 2)
    v14 = CFSTR("%");
  else
    v14 = &stru_1E16EDF20;
  if (v13 == 100)
    v15 = CFSTR("*");
  else
    v15 = (__CFString *)v14;
  v16 = self->m_h.amount;
  v17 = self->m_h.unit;
  if (v17 == 2)
    v18 = CFSTR("%");
  else
    v18 = &stru_1E16EDF20;
  if (v17 == 100)
    v19 = CFSTR("*");
  else
    v19 = (__CFString *)v18;
  v20 = self->m_paddingTop.amount;
  v21 = self->m_paddingTop.unit;
  if (v21 == 2)
    v22 = CFSTR("%");
  else
    v22 = &stru_1E16EDF20;
  if (v21 == 100)
    v23 = CFSTR("*");
  else
    v23 = (__CFString *)v22;
  v24 = self->m_paddingLeft.amount;
  v25 = self->m_paddingLeft.unit;
  if (v25 == 2)
    v26 = CFSTR("%");
  else
    v26 = &stru_1E16EDF20;
  if (v25 == 100)
    v27 = CFSTR("*");
  else
    v27 = (__CFString *)v26;
  v28 = self->m_paddingBottom.amount;
  v29 = self->m_paddingBottom.unit;
  if (v29 == 2)
    v30 = CFSTR("%");
  else
    v30 = &stru_1E16EDF20;
  if (v29 == 100)
    v31 = CFSTR("*");
  else
    v31 = (__CFString *)v30;
  v32 = self->m_paddingRight.amount;
  v33 = self->m_paddingRight.unit;
  if (v33 == 2)
    v5 = CFSTR("%");
  if (v33 == 100)
    v34 = CFSTR("*");
  else
    v34 = v5;
  v35 = v31;
  v36 = v27;
  v37 = v23;
  v38 = v19;
  v39 = v15;
  v40 = v11;
  v41 = v7;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("d(%g%@,%g%@,%g%@,%g%@) p(%g%@,%g%@,%g%@,%g%@)"), *(_QWORD *)&amount, v41, *(_QWORD *)&v8, v40, *(_QWORD *)&v12, v39, *(_QWORD *)&v16, v38, *(_QWORD *)&v20, v37, *(_QWORD *)&v24, v36, *(_QWORD *)&v28, v35, *(_QWORD *)&v32, v34);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int v15;
  unint64_t v16;
  unsigned int v17;
  unint64_t v18;
  unsigned int v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;

  -[UIKBGeometry name](self, "name");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBGeometry name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");

    v3 = 257 * v5;
  }
  v6 = 257 * (v3 + (unint64_t)(COERCE_DOUBLE(-[UIKBGeometry x](self, "x")) * 100.0));
  -[UIKBGeometry x](self, "x");
  v8 = 257 * (257 * (v6 + v7) + (unint64_t)(COERCE_DOUBLE(-[UIKBGeometry y](self, "y")) * 100.0));
  -[UIKBGeometry y](self, "y");
  v10 = 257 * (257 * (v8 + v9) + (unint64_t)(COERCE_DOUBLE(-[UIKBGeometry w](self, "w")) * 100.0));
  -[UIKBGeometry w](self, "w");
  v12 = 257 * (257 * (v10 + v11) + (unint64_t)(COERCE_DOUBLE(-[UIKBGeometry h](self, "h")) * 100.0));
  -[UIKBGeometry h](self, "h");
  v14 = 257
      * (257 * (v12 + v13) + (unint64_t)(COERCE_DOUBLE(-[UIKBGeometry paddingTop](self, "paddingTop")) * 100.0));
  -[UIKBGeometry paddingTop](self, "paddingTop");
  v16 = 257
      * (257 * (v14 + v15) + (unint64_t)(COERCE_DOUBLE(-[UIKBGeometry paddingLeft](self, "paddingLeft")) * 100.0));
  -[UIKBGeometry paddingLeft](self, "paddingLeft");
  v18 = 257
      * (257 * (v16 + v17)
       + (unint64_t)(COERCE_DOUBLE(-[UIKBGeometry paddingBottom](self, "paddingBottom")) * 100.0));
  -[UIKBGeometry paddingBottom](self, "paddingBottom");
  v20 = 257
      * (257 * (v18 + v19)
       + (unint64_t)(COERCE_DOUBLE(-[UIKBGeometry paddingRight](self, "paddingRight")) * 100.0));
  -[UIKBGeometry paddingRight](self, "paddingRight");
  v22 = 257 * (257 * (v20 + v21) + -[UIKBGeometry explicitlySpecified](self, "explicitlySpecified"));
  return v22 + -[UIKBGeometry isTemplate](self, "isTemplate");
}

+ (id)codeStringForValue:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = CFSTR("UIKBUnitAutomatic");
  v4 = CFSTR("UIKBUnitPoints");
  v5 = CFSTR("UIKBUnitNone");
  if (a3.var1 == 2)
    v5 = CFSTR("UIKBUnitPercent");
  if (a3.var1 != 3)
    v4 = v5;
  if (a3.var1 != 100)
    v3 = v4;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIKBValueMake(%g, %@)"), *(_QWORD *)&a3.var0, v3);
}

+ (void)performOperations:(id)a3 withScale:(double)a4
{
  __UIKBGeometryScale = *(_QWORD *)&a4;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  __UIKBGeometryScale = 0x3FF0000000000000;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKBGeometry frameWithContainingFrame:](self, "frameWithContainingFrame:", 0.0, 0.0, 0.0, 0.0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frameWithContainingFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double amount;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UIKBGeometry explicitlySpecified](self, "explicitlySpecified"))
  {
    amount = self->m_x.amount;
    if (self->m_x.unit == 2)
    {
      amount = x + width * (amount / 100.0);
      if (*(double *)&__UIKBGeometryScale == 1.0)
        v9 = floor(amount);
      else
        v9 = floor(amount * *(double *)&__UIKBGeometryScale) / *(double *)&__UIKBGeometryScale;
    }
    else
    {
      v9 = self->m_x.amount;
    }
    v10 = self->m_y.amount;
    if (self->m_y.unit == 2)
    {
      v13 = y + height * (v10 / 100.0);
      if (*(double *)&__UIKBGeometryScale == 1.0)
        v10 = round(v13);
      else
        v10 = round(v13 * *(double *)&__UIKBGeometryScale) / *(double *)&__UIKBGeometryScale;
    }
    v11 = self->m_w.amount;
    if (self->m_w.unit == 2)
    {
      v14 = amount - v9 + width * (v11 / 100.0);
      if (*(double *)&__UIKBGeometryScale == 1.0)
        v11 = ceil(v14);
      else
        v11 = ceil(v14 * *(double *)&__UIKBGeometryScale) / *(double *)&__UIKBGeometryScale;
    }
    v12 = self->m_h.amount;
    if (self->m_h.unit == 2)
    {
      v15 = height * (v12 / 100.0);
      if (*(double *)&__UIKBGeometryScale == 1.0)
        v12 = round(v15);
      else
        v12 = round(v15 * *(double *)&__UIKBGeometryScale) / *(double *)&__UIKBGeometryScale;
    }
    if (width > 0.0)
    {
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      if (v9 + v11 > CGRectGetMaxX(v20))
      {
        v21.origin.x = x;
        v21.origin.y = y;
        v21.size.width = width;
        v21.size.height = height;
        v11 = CGRectGetMaxX(v21) - v9;
      }
    }
  }
  else
  {
    v9 = x;
    v10 = y;
    v11 = width;
    v12 = height;
  }
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)paddedFrameWithContainingFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UIKBGeometry frameWithContainingFrame:](self, "frameWithContainingFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIKBGeometry paddedFrameWithResolvedFrame:](self, "paddedFrameWithResolvedFrame:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)paddedFrameWithResolvedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double amount;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UIKBGeometry explicitlySpecified](self, "explicitlySpecified"))
  {
    amount = self->m_paddingLeft.amount;
    if (self->m_paddingLeft.unit == 2)
      amount = width * (amount / 100.0);
    if (amount <= width)
      v9 = amount;
    else
      v9 = width;
    v10 = self->m_paddingTop.amount;
    if (self->m_paddingTop.unit == 2)
      v10 = height * (v10 / 100.0);
    if (v10 > height)
      v10 = height;
    if (self->m_paddingRight.unit == 2)
      v11 = width - v9 + width * (self->m_paddingRight.amount / -100.0);
    else
      v11 = width - v9 - self->m_paddingRight.amount;
    if (v11 >= 0.0)
      width = v11;
    else
      width = 0.0;
    if (self->m_paddingBottom.unit == 2)
      v12 = height - v10 + height * (self->m_paddingBottom.amount / -100.0);
    else
      v12 = height - v10 - self->m_paddingBottom.amount;
    y = y + v10;
    if (v12 >= 0.0)
      height = v12;
    else
      height = 0.0;
    if (self->m_y.unit == 2 || self->m_h.unit == 2)
    {
      if (*(double *)&__UIKBGeometryScale == 1.0)
      {
        v21.origin.x = 0.0;
        v21.size.width = 0.0;
        v21.origin.y = y;
        v21.size.height = height;
        v22 = CGRectIntegral(v21);
      }
      else
      {
        UIRectIntegralWithScale(0.0, y, 0.0, height, *(double *)&__UIKBGeometryScale);
      }
      y = v22.origin.y;
      height = v22.size.height;
    }
    x = x + v9;
    if (self->m_x.unit == 2 || self->m_w.unit == 2)
    {
      v13 = 0;
      v14 = 0;
      if (*(double *)&__UIKBGeometryScale == 1.0)
      {
        v15 = x;
        v16 = width;
        v23 = CGRectIntegral(*(CGRect *)(&v13 - 1));
      }
      else
      {
        v23.origin.x = UIRectIntegralWithScale(x, 0.0, width, 0.0, *(double *)&__UIKBGeometryScale);
      }
      x = v23.origin.x;
      width = v23.size.width;
    }
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)overrideGeometry:(id)a3
{
  id v4;
  UIKBGeometry *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  if (v4)
  {
    v5 = (UIKBGeometry *)-[UIKBGeometry copy](self, "copy");
    objc_msgSend(v4, "x");
    if (v6)
    {
      v7 = objc_msgSend(v4, "x");
      -[UIKBGeometry setX:](v5, "setX:", v7, v8);
    }
    objc_msgSend(v4, "y");
    if (v9)
    {
      v10 = objc_msgSend(v4, "y");
      -[UIKBGeometry setY:](v5, "setY:", v10, v11);
    }
    objc_msgSend(v4, "w");
    if (v12)
    {
      v13 = objc_msgSend(v4, "w");
      -[UIKBGeometry setW:](v5, "setW:", v13, v14);
    }
    objc_msgSend(v4, "h");
    if (v15)
    {
      v16 = objc_msgSend(v4, "h");
      -[UIKBGeometry setH:](v5, "setH:", v16, v17);
    }
    objc_msgSend(v4, "paddingTop");
    if (v18)
    {
      v19 = objc_msgSend(v4, "paddingTop");
      -[UIKBGeometry setPaddingTop:](v5, "setPaddingTop:", v19, v20);
    }
    objc_msgSend(v4, "paddingLeft");
    if (v21)
    {
      v22 = objc_msgSend(v4, "paddingLeft");
      -[UIKBGeometry setPaddingLeft:](v5, "setPaddingLeft:", v22, v23);
    }
    objc_msgSend(v4, "paddingBottom");
    if (v24)
    {
      v25 = objc_msgSend(v4, "paddingBottom");
      -[UIKBGeometry setPaddingBottom:](v5, "setPaddingBottom:", v25, v26);
    }
    objc_msgSend(v4, "paddingRight");
    if (v27)
    {
      v28 = objc_msgSend(v4, "paddingRight");
      -[UIKBGeometry setPaddingRight:](v5, "setPaddingRight:", v28, v29);
    }
  }
  else
  {
    v5 = self;
  }

  return v5;
}

- (BOOL)usesPercentages
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v11;

  -[UIKBGeometry x](self, "x");
  if (v3 == 2)
    return 1;
  -[UIKBGeometry y](self, "y");
  if (v4 == 2)
    return 1;
  -[UIKBGeometry w](self, "w");
  if (v5 == 2)
    return 1;
  -[UIKBGeometry h](self, "h");
  if (v6 == 2)
    return 1;
  -[UIKBGeometry paddingTop](self, "paddingTop");
  if (v7 == 2)
    return 1;
  -[UIKBGeometry paddingLeft](self, "paddingLeft");
  if (v8 == 2)
    return 1;
  -[UIKBGeometry paddingBottom](self, "paddingBottom");
  if (v9 == 2)
    return 1;
  -[UIKBGeometry paddingRight](self, "paddingRight");
  return v11 == 2;
}

- (BOOL)usesAutomaticMetrics
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v11;

  -[UIKBGeometry x](self, "x");
  if (v3 == 100)
    return 1;
  -[UIKBGeometry y](self, "y");
  if (v4 == 100)
    return 1;
  -[UIKBGeometry w](self, "w");
  if (v5 == 100)
    return 1;
  -[UIKBGeometry h](self, "h");
  if (v6 == 100)
    return 1;
  -[UIKBGeometry paddingTop](self, "paddingTop");
  if (v7 == 100)
    return 1;
  -[UIKBGeometry paddingLeft](self, "paddingLeft");
  if (v8 == 100)
    return 1;
  -[UIKBGeometry paddingBottom](self, "paddingBottom");
  if (v9 == 100)
    return 1;
  -[UIKBGeometry paddingRight](self, "paddingRight");
  return v11 == 100;
}

- (NSString)name
{
  return self->m_name;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)y
{
  uint64_t v2;
  double amount;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v2 = *(_QWORD *)&self->m_y.unit;
  amount = self->m_y.amount;
  result.var1 = v2;
  result.var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingTop
{
  uint64_t v2;
  double amount;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v2 = *(_QWORD *)&self->m_paddingTop.unit;
  amount = self->m_paddingTop.amount;
  result.var1 = v2;
  result.var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingLeft
{
  uint64_t v2;
  double amount;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v2 = *(_QWORD *)&self->m_paddingLeft.unit;
  amount = self->m_paddingLeft.amount;
  result.var1 = v2;
  result.var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingBottom
{
  uint64_t v2;
  double amount;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v2 = *(_QWORD *)&self->m_paddingBottom.unit;
  amount = self->m_paddingBottom.amount;
  result.var1 = v2;
  result.var0 = amount;
  return result;
}

- ($000CCD7ED2ADA2E18343834BA3C2DAF0)paddingRight
{
  uint64_t v2;
  double amount;
  $000CCD7ED2ADA2E18343834BA3C2DAF0 result;

  v2 = *(_QWORD *)&self->m_paddingRight.unit;
  amount = self->m_paddingRight.amount;
  result.var1 = v2;
  result.var0 = amount;
  return result;
}

- (BOOL)explicitlySpecified
{
  return self->m_explicitlySpecified;
}

- (BOOL)isTemplate
{
  return self->m_isTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_name, 0);
}

@end

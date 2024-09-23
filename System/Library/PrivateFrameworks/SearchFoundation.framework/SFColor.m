@implementation SFColor

- (void)setRedComponent:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_redComponent = a3;
}

- (BOOL)hasRedComponent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setGreenComponent:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_greenComponent = a3;
}

- (BOOL)hasGreenComponent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBlueComponent:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_blueComponent = a3;
}

- (BOOL)hasBlueComponent
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAlphaComponent:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_alphaComponent = a3;
}

- (BOOL)hasAlphaComponent
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setColorTintStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_colorTintStyle = a3;
}

- (BOOL)hasColorTintStyle
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (SFColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SFColor *v6;
  _SFPBColor *v7;
  SFColor *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [SFColor alloc];
  v7 = -[_SFPBColor initWithData:]([_SFPBColor alloc], "initWithData:", v5);
  v8 = -[SFColor initWithProtobuf:](v6, "initWithProtobuf:", v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBColor *v6;

  v4 = a3;
  v6 = -[_SFPBColor initWithFacade:]([_SFPBColor alloc], "initWithFacade:", self);
  -[_SFPBColor data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBColor *v2;
  void *v3;

  v2 = -[_SFPBColor initWithFacade:]([_SFPBColor alloc], "initWithFacade:", self);
  -[_SFPBColor dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBColor *v2;
  void *v3;

  v2 = -[_SFPBColor initWithFacade:]([_SFPBColor alloc], "initWithFacade:", self);
  -[_SFPBColor jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFColor redComponent](self, "redComponent");
  objc_msgSend(v4, "setRedComponent:");
  -[SFColor greenComponent](self, "greenComponent");
  objc_msgSend(v4, "setGreenComponent:");
  -[SFColor blueComponent](self, "blueComponent");
  objc_msgSend(v4, "setBlueComponent:");
  -[SFColor alphaComponent](self, "alphaComponent");
  objc_msgSend(v4, "setAlphaComponent:");
  objc_msgSend(v4, "setColorTintStyle:", -[SFColor colorTintStyle](self, "colorTintStyle"));
  -[SFColor darkModeColor](self, "darkModeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDarkModeColor:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFColor *v4;
  SFColor *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;

  v4 = (SFColor *)a3;
  if (self == v4)
  {
    v24 = 1;
  }
  else if (-[SFColor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[SFColor redComponent](self, "redComponent");
    v7 = v6;
    -[SFColor redComponent](v5, "redComponent");
    if (vabdd_f64(v7, v8) >= 2.22044605e-16)
      goto LABEL_13;
    -[SFColor greenComponent](self, "greenComponent");
    v10 = v9;
    -[SFColor greenComponent](v5, "greenComponent");
    if (vabdd_f64(v10, v11) >= 2.22044605e-16)
      goto LABEL_13;
    -[SFColor blueComponent](self, "blueComponent");
    v13 = v12;
    -[SFColor blueComponent](v5, "blueComponent");
    if (vabdd_f64(v13, v14) < 2.22044605e-16
      && (-[SFColor alphaComponent](self, "alphaComponent"),
          v16 = v15,
          -[SFColor alphaComponent](v5, "alphaComponent"),
          vabdd_f64(v16, v17) < 2.22044605e-16)
      && (v18 = -[SFColor colorTintStyle](self, "colorTintStyle"), v18 == -[SFColor colorTintStyle](v5, "colorTintStyle")))
    {
      -[SFColor darkModeColor](self, "darkModeColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFColor darkModeColor](v5, "darkModeColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 == 0) == (v20 != 0))
      {
        v24 = 0;
      }
      else
      {
        -[SFColor darkModeColor](self, "darkModeColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          -[SFColor darkModeColor](self, "darkModeColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFColor darkModeColor](v5, "darkModeColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqual:", v23);

        }
        else
        {
          v24 = 1;
        }

      }
    }
    else
    {
LABEL_13:
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  float64x2_t v6;
  float64x2_t v7;
  float64_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int8x16_t v17;
  unint64_t v18;
  long double v20;
  long double v21;
  float64x2_t __x;
  float64x2_t __xa;
  float64_t v24;
  float64x2_t v25;
  float64_t v26;
  float64x2_t v27;
  int8x16_t v28;
  float64_t v29;
  float64x2_t v30;
  int8x16_t v31;

  -[SFColor redComponent](self, "redComponent");
  v29 = v3;
  -[SFColor greenComponent](self, "greenComponent");
  v26 = v4;
  -[SFColor blueComponent](self, "blueComponent");
  v24 = v5;
  -[SFColor alphaComponent](self, "alphaComponent");
  v6.f64[0] = v29;
  v7.f64[0] = v24;
  v6.f64[1] = v26;
  v7.f64[1] = v8;
  v9 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v6), (int8x16_t)vnegq_f64(v6), (int8x16_t)v6);
  v10 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v7), (int8x16_t)vnegq_f64(v7), (int8x16_t)v7);
  v30 = vrndaq_f64(v9);
  __x = vrndaq_f64(v10);
  v25 = vsubq_f64(v10, __x);
  v27 = vsubq_f64(v9, v30);
  v20 = fmod(__x.f64[1], 1.84467441e19);
  v11.f64[0] = fmod(__x.f64[0], 1.84467441e19);
  v11.f64[1] = v20;
  __xa = v11;
  v21 = fmod(v30.f64[1], 1.84467441e19);
  v12.f64[0] = fmod(v30.f64[0], 1.84467441e19);
  v12.f64[1] = v21;
  v13 = (float64x2_t)vdupq_n_s64(0x41E3C6EF36200000uLL);
  v31 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(v12, v13)), (int64x2_t)vcvtq_n_u64_f64(v27, 0x40uLL));
  v28 = (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(__xa, v13)), (int64x2_t)vcvtq_n_u64_f64(v25, 0x40uLL));
  v14 = -[SFColor colorTintStyle](self, "colorTintStyle");
  -[SFColor darkModeColor](self, "darkModeColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  v17 = veorq_s8(v31, v28);
  v18 = *(_QWORD *)&veor_s8(*(int8x8_t *)v17.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL)) ^ v16 ^ v14;

  return v18;
}

- (double)redComponent
{
  return self->_redComponent;
}

- (double)greenComponent
{
  return self->_greenComponent;
}

- (double)blueComponent
{
  return self->_blueComponent;
}

- (double)alphaComponent
{
  return self->_alphaComponent;
}

- (int)colorTintStyle
{
  return self->_colorTintStyle;
}

- (SFColor)darkModeColor
{
  return self->_darkModeColor;
}

- (void)setDarkModeColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkModeColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeColor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFColor)initWithProtobuf:(id)a3
{
  id v4;
  SFColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SFColor *v15;
  void *v16;
  SFColor *v17;
  void *v18;
  SFCalendarColor *v19;
  uint64_t v20;
  SFColor *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SFColor *v36;
  void *v37;
  SFColor *v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SFColor;
  v5 = -[SFColor init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "redComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "redComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      -[SFColor setRedComponent:](v5, "setRedComponent:");

    }
    objc_msgSend(v4, "greenComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "greenComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      -[SFColor setGreenComponent:](v5, "setGreenComponent:");

    }
    objc_msgSend(v4, "blueComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "blueComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      -[SFColor setBlueComponent:](v5, "setBlueComponent:");

    }
    objc_msgSend(v4, "alphaComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "alphaComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");

    }
    if (objc_msgSend(v4, "colorTintStyle"))
      -[SFColor setColorTintStyle:](v5, "setColorTintStyle:", objc_msgSend(v4, "colorTintStyle"));
    objc_msgSend(v4, "darkModeColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [SFColor alloc];
      objc_msgSend(v4, "darkModeColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SFColor initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[SFColor setDarkModeColor:](v5, "setDarkModeColor:", v17);

    }
    objc_msgSend(v4, "calendarColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [SFCalendarColor alloc];
      objc_msgSend(v4, "calendarColor");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "appColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v19 = [SFAppColor alloc];
        objc_msgSend(v4, "appColor");
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "imageDerivedColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v19 = [SFImageDerivedColor alloc];
          objc_msgSend(v4, "imageDerivedColor");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "gradientColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v19 = [SFGradientColor alloc];
            objc_msgSend(v4, "gradientColor");
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v4, "weatherColor");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25)
            {
              v21 = v5;
              goto LABEL_37;
            }
            v19 = [SFWeatherColor alloc];
            objc_msgSend(v4, "weatherColor");
            v20 = objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
    v26 = (void *)v20;
    v21 = -[SFCalendarColor initWithProtobuf:](v19, "initWithProtobuf:", v20);

    objc_msgSend(v4, "redComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "redComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      -[SFColor setRedComponent:](v21, "setRedComponent:");

    }
    objc_msgSend(v4, "greenComponent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "greenComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      -[SFColor setGreenComponent:](v21, "setGreenComponent:");

    }
    objc_msgSend(v4, "blueComponent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v4, "blueComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "doubleValue");
      -[SFColor setBlueComponent:](v21, "setBlueComponent:");

    }
    objc_msgSend(v4, "alphaComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v4, "alphaComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      -[SFColor setAlphaComponent:](v21, "setAlphaComponent:");

    }
    if (objc_msgSend(v4, "colorTintStyle"))
      -[SFColor setColorTintStyle:](v21, "setColorTintStyle:", objc_msgSend(v4, "colorTintStyle"));
    objc_msgSend(v4, "darkModeColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = [SFColor alloc];
      objc_msgSend(v4, "darkModeColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[SFColor initWithProtobuf:](v36, "initWithProtobuf:", v37);
      -[SFColor setDarkModeColor:](v21, "setDarkModeColor:", v38);

    }
  }
  else
  {
    v21 = 0;
  }
LABEL_37:

  return v21;
}

@end

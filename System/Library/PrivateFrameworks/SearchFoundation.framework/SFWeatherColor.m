@implementation SFWeatherColor

- (void)setCloudCover:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cloudCover = a3;
}

- (BOOL)hasCloudCover
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCloudCoverLowAltPct:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cloudCoverLowAltPct = a3;
}

- (BOOL)hasCloudCoverLowAltPct
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCloudCoverMidAltPct:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cloudCoverMidAltPct = a3;
}

- (BOOL)hasCloudCoverMidAltPct
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCloudCoverHighAltPct:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_cloudCoverHighAltPct = a3;
}

- (BOOL)hasCloudCoverHighAltPct
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (SFWeatherColor)initWithCoder:(id)a3
{
  id v4;
  SFWeatherColor *v5;
  void *v6;
  _SFPBColor *v7;
  SFColor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[SFWeatherColor init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBColor initWithData:]([_SFPBColor alloc], "initWithData:", v6);
  v8 = -[SFColor initWithProtobuf:]([SFColor alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFColor condition](v8, "condition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWeatherColor setCondition:](v5, "setCondition:", v9);

    -[SFColor location](v8, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWeatherColor setLocation:](v5, "setLocation:", v10);

    -[SFColor date](v8, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFWeatherColor setDate:](v5, "setDate:", v11);

    -[SFColor cloudCover](v8, "cloudCover");
    -[SFWeatherColor setCloudCover:](v5, "setCloudCover:");
    -[SFColor cloudCoverLowAltPct](v8, "cloudCoverLowAltPct");
    -[SFWeatherColor setCloudCoverLowAltPct:](v5, "setCloudCoverLowAltPct:");
    -[SFColor cloudCoverMidAltPct](v8, "cloudCoverMidAltPct");
    -[SFWeatherColor setCloudCoverMidAltPct:](v5, "setCloudCoverMidAltPct:");
    -[SFColor cloudCoverHighAltPct](v8, "cloudCoverHighAltPct");
    -[SFWeatherColor setCloudCoverHighAltPct:](v5, "setCloudCoverHighAltPct:");
    -[SFColor redComponent](v8, "redComponent");
    -[SFColor setRedComponent:](v5, "setRedComponent:");
    -[SFColor greenComponent](v8, "greenComponent");
    -[SFColor setGreenComponent:](v5, "setGreenComponent:");
    -[SFColor blueComponent](v8, "blueComponent");
    -[SFColor setBlueComponent:](v5, "setBlueComponent:");
    -[SFColor alphaComponent](v8, "alphaComponent");
    -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");
    -[SFColor setColorTintStyle:](v5, "setColorTintStyle:", -[SFColor colorTintStyle](v8, "colorTintStyle"));
    -[SFColor darkModeColor](v8, "darkModeColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFColor setDarkModeColor:](v5, "setDarkModeColor:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFWeatherColor;
  -[SFColor encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBWeatherColor *v2;
  void *v3;

  v2 = -[_SFPBWeatherColor initWithFacade:]([_SFPBWeatherColor alloc], "initWithFacade:", self);
  -[_SFPBWeatherColor dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBWeatherColor *v2;
  void *v3;

  v2 = -[_SFPBWeatherColor initWithFacade:]([_SFPBWeatherColor alloc], "initWithFacade:", self);
  -[_SFPBWeatherColor jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFWeatherColor;
  v4 = -[SFColor copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFWeatherColor condition](self, "condition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCondition:", v6);

  -[SFWeatherColor location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setLocation:", v8);

  -[SFWeatherColor date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setDate:", v10);

  -[SFWeatherColor cloudCover](self, "cloudCover");
  objc_msgSend(v4, "setCloudCover:");
  -[SFWeatherColor cloudCoverLowAltPct](self, "cloudCoverLowAltPct");
  objc_msgSend(v4, "setCloudCoverLowAltPct:");
  -[SFWeatherColor cloudCoverMidAltPct](self, "cloudCoverMidAltPct");
  objc_msgSend(v4, "setCloudCoverMidAltPct:");
  -[SFWeatherColor cloudCoverHighAltPct](self, "cloudCoverHighAltPct");
  objc_msgSend(v4, "setCloudCoverHighAltPct:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFWeatherColor *v5;
  SFWeatherColor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
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
  BOOL v37;
  void *v38;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  objc_super v50;

  v5 = (SFWeatherColor *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFWeatherColor isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v50.receiver = self;
      v50.super_class = (Class)SFWeatherColor;
      if (-[SFColor isEqual:](&v50, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFWeatherColor condition](self, "condition");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFWeatherColor condition](v6, "condition");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_39:

          goto LABEL_40;
        }
        -[SFWeatherColor condition](self, "condition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFWeatherColor condition](self, "condition");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFWeatherColor condition](v6, "condition");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_37;
          }
          v49 = v10;
        }
        -[SFWeatherColor location](self, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFWeatherColor location](v6, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          v10 = v49;
          if (!v9)
            goto LABEL_38;
          goto LABEL_37;
        }
        -[SFWeatherColor location](self, "location");
        v15 = objc_claimAutoreleasedReturnValue();
        v47 = v3;
        if (v15)
        {
          v16 = (void *)v15;
          v17 = v14;
          v18 = v12;
          -[SFWeatherColor location](self, "location");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFWeatherColor location](v6, "location");
          v45 = v19;
          v48 = objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v19, "isEqual:"))
          {
            v11 = 0;
            v12 = v18;
            v14 = v17;
            v24 = (void *)v48;
LABEL_35:

LABEL_36:
            v10 = v49;
            v3 = v47;
            if (!v9)
            {
LABEL_38:

              goto LABEL_39;
            }
LABEL_37:

            goto LABEL_38;
          }
          v46 = v16;
          v12 = v18;
          v14 = v17;
        }
        else
        {
          v46 = 0;
        }
        -[SFWeatherColor date](self, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFWeatherColor date](v6, "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v20 == 0) == (v21 != 0))
        {

          v11 = 0;
          v16 = v46;
          goto LABEL_34;
        }
        v43 = v21;
        v44 = v20;
        -[SFWeatherColor date](self, "date");
        v16 = v46;
        v42 = objc_claimAutoreleasedReturnValue();
        if (!v42
          || (-[SFWeatherColor date](self, "date"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFWeatherColor date](v6, "date"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v41 = v22,
              objc_msgSend(v22, "isEqual:")))
        {
          -[SFWeatherColor cloudCover](self, "cloudCover");
          v26 = v25;
          -[SFWeatherColor cloudCover](v6, "cloudCover");
          if (vabdd_f64(v26, v27) >= 2.22044605e-16
            || (-[SFWeatherColor cloudCoverLowAltPct](self, "cloudCoverLowAltPct"),
                v29 = v28,
                -[SFWeatherColor cloudCoverLowAltPct](v6, "cloudCoverLowAltPct"),
                vabdd_f64(v29, v30) >= 2.22044605e-16)
            || (-[SFWeatherColor cloudCoverMidAltPct](self, "cloudCoverMidAltPct"),
                v32 = v31,
                -[SFWeatherColor cloudCoverMidAltPct](v6, "cloudCoverMidAltPct"),
                vabdd_f64(v32, v33) >= 2.22044605e-16))
          {
            v11 = 0;
            v37 = 0;
          }
          else
          {
            -[SFWeatherColor cloudCoverHighAltPct](self, "cloudCoverHighAltPct");
            v35 = v34;
            -[SFWeatherColor cloudCoverHighAltPct](v6, "cloudCoverHighAltPct");
            v11 = vabdd_f64(v35, v36) < 2.22044605e-16;
            v37 = v11;
          }
          v23 = (void *)v42;
          if (!v42)
          {
            v38 = v43;
            v11 = v37;
            goto LABEL_33;
          }
        }
        else
        {
          v11 = 0;
          v23 = (void *)v42;
        }

        v38 = v43;
LABEL_33:

LABEL_34:
        v24 = (void *)v48;
        if (!v16)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
    v11 = 0;
  }
LABEL_40:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  float64_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  int8x16_t v22;
  unint64_t v23;
  long double v25;
  long double v26;
  float64x2_t __x;
  float64x2_t __xa;
  float64_t v29;
  float64x2_t v30;
  float64_t v31;
  float64x2_t v32;
  float64_t v33;
  float64x2_t v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)SFWeatherColor;
  v3 = -[SFColor hash](&v35, sel_hash);
  -[SFWeatherColor condition](self, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFWeatherColor location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SFWeatherColor date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SFWeatherColor cloudCover](self, "cloudCover");
  v33 = v10;
  -[SFWeatherColor cloudCoverLowAltPct](self, "cloudCoverLowAltPct");
  v31 = v11;
  -[SFWeatherColor cloudCoverMidAltPct](self, "cloudCoverMidAltPct");
  v29 = v12;
  -[SFWeatherColor cloudCoverHighAltPct](self, "cloudCoverHighAltPct");
  v13.f64[0] = v33;
  v13.f64[1] = v31;
  v14.f64[0] = v29;
  v14.f64[1] = v15;
  v16 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v13), (int8x16_t)vnegq_f64(v13), (int8x16_t)v13);
  v17 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v14), (int8x16_t)vnegq_f64(v14), (int8x16_t)v14);
  v18 = vrndaq_f64(v16);
  v32 = vsubq_f64(v16, v18);
  v34 = v18;
  __x = vrndaq_f64(v17);
  v30 = vsubq_f64(v17, __x);
  v25 = fmod(__x.f64[1], 1.84467441e19);
  v19.f64[0] = fmod(__x.f64[0], 1.84467441e19);
  v19.f64[1] = v25;
  __xa = v19;
  v26 = fmod(v34.f64[1], 1.84467441e19);
  v20.f64[0] = fmod(v34.f64[0], 1.84467441e19);
  v20.f64[1] = v26;
  v21 = (float64x2_t)vdupq_n_s64(0x41E3C6EF36200000uLL);
  v22 = veorq_s8((int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(v20, v21)), (int64x2_t)vcvtq_n_u64_f64(v32, 0x40uLL)), (int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(__xa, v21)), (int64x2_t)vcvtq_n_u64_f64(v30, 0x40uLL)));
  v23 = *(_QWORD *)&veor_s8(*(int8x8_t *)v22.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)) ^ v9 ^ v7 ^ v5 ^ v3;

  return v23;
}

- (NSString)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)cloudCover
{
  return self->_cloudCover;
}

- (double)cloudCoverLowAltPct
{
  return self->_cloudCoverLowAltPct;
}

- (double)cloudCoverMidAltPct
{
  return self->_cloudCoverMidAltPct;
}

- (double)cloudCoverHighAltPct
{
  return self->_cloudCoverHighAltPct;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFWeatherColor)initWithProtobuf:(id)a3
{
  id v4;
  SFWeatherColor *v5;
  void *v6;
  void *v7;
  void *v8;
  SFLatLng *v9;
  void *v10;
  SFLatLng *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SFWeatherColor *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFWeatherColor;
  v5 = -[SFWeatherColor init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "condition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "condition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWeatherColor setCondition:](v5, "setCondition:", v7);

    }
    objc_msgSend(v4, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SFLatLng alloc];
      objc_msgSend(v4, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SFLatLng initWithProtobuf:](v9, "initWithProtobuf:", v10);
      -[SFWeatherColor setLocation:](v5, "setLocation:", v11);

    }
    objc_msgSend(v4, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v13, "secondsSince1970");
      objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFWeatherColor setDate:](v5, "setDate:", v15);

    }
    objc_msgSend(v4, "cloudCover");
    if (v16 != 0.0)
    {
      objc_msgSend(v4, "cloudCover");
      -[SFWeatherColor setCloudCover:](v5, "setCloudCover:");
    }
    objc_msgSend(v4, "cloudCoverLowAltPct");
    if (v17 != 0.0)
    {
      objc_msgSend(v4, "cloudCoverLowAltPct");
      -[SFWeatherColor setCloudCoverLowAltPct:](v5, "setCloudCoverLowAltPct:");
    }
    objc_msgSend(v4, "cloudCoverMidAltPct");
    if (v18 != 0.0)
    {
      objc_msgSend(v4, "cloudCoverMidAltPct");
      -[SFWeatherColor setCloudCoverMidAltPct:](v5, "setCloudCoverMidAltPct:");
    }
    objc_msgSend(v4, "cloudCoverHighAltPct");
    if (v19 != 0.0)
    {
      objc_msgSend(v4, "cloudCoverHighAltPct");
      -[SFWeatherColor setCloudCoverHighAltPct:](v5, "setCloudCoverHighAltPct:");
    }
    v20 = v5;
  }

  return v5;
}

@end

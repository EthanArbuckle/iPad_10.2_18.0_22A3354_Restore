@implementation OADPresetShadowEffect

- (OADPresetShadowEffect)init
{
  OADPresetShadowEffect *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADPresetShadowEffect;
  result = -[OADShadowEffect initWithType:](&v3, sel_initWithType_, 2);
  if (result)
    *((_DWORD *)&result->super.mAngle + 1) = 0;
  return result;
}

- (void)setPresetShadowType:(int)a3
{
  *((_DWORD *)&self->super.mAngle + 1) = a3;
}

- (int)presetShadowType
{
  return *((_DWORD *)&self->super.mAngle + 1);
}

- (unint64_t)hash
{
  uint64_t v2;
  objc_super v4;

  v2 = *((unsigned int *)&self->super.mAngle + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADPresetShadowEffect;
  return -[OADShadowEffect hash](&v4, sel_hash) ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OADPresetShadowEffect;
  if (-[OADShadowEffect isEqual:](&v7, sel_isEqual_, v4))
    v5 = *((_DWORD *)&self->super.mAngle + 1) == v4[9];
  else
    v5 = 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithShadowEffect:type:", self, 2);
  objc_msgSend(v4, "setPresetShadowType:", *((unsigned int *)&self->super.mAngle + 1));
  return v4;
}

- (id)equivalentOuterShadowEffect
{
  OADOuterShadowEffect *v3;
  OADOuterShadowEffect *v4;
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v3 = objc_alloc_init(OADOuterShadowEffect);
  v4 = v3;
  switch(*((_DWORD *)&self->super.mAngle + 1))
  {
    case 3:
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 8);
      v7 = 0.5;
      LODWORD(v9) = 1109626716;
      -[OADOuterShadowEffect setYSkew:](v4, "setYSkew:", v9);
      goto LABEL_12;
    case 4:
    case 0xC:
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 8);
      LODWORD(v5) = -1037856932;
      goto LABEL_10;
    case 7:
    case 0xF:
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 8);
      LODWORD(v6) = 1109626716;
      goto LABEL_5;
    case 8:
    case 0x10:
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 8);
      LODWORD(v6) = -1037856932;
LABEL_5:
      v7 = -0.5;
      -[OADOuterShadowEffect setXSkew:](v4, "setXSkew:", v6);
      goto LABEL_12;
    case 9:
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 1);
      v7 = 0.75;
      LODWORD(v10) = 0.75;
      -[OADOuterShadowEffect setXScale:](v4, "setXScale:", v10);
      goto LABEL_12;
    case 0xA:
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 9);
      v7 = 1.25;
      LODWORD(v11) = 1.25;
      -[OADOuterShadowEffect setXScale:](v4, "setXScale:", v11);
      goto LABEL_12;
    case 0xB:
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 8);
      LODWORD(v5) = 1109626716;
LABEL_10:
      v7 = 0.5;
      -[OADOuterShadowEffect setXSkew:](v4, "setXSkew:", v5);
      goto LABEL_12;
    case 0x13:
      v7 = 0.5;
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 8);
LABEL_12:
      *(float *)&v8 = v7;
      -[OADOuterShadowEffect setYScale:](v4, "setYScale:", v8);
      break;
    case 0x14:
      -[OADOuterShadowEffect setAlignment:](v3, "setAlignment:", 8);
      break;
    default:
      break;
  }
  -[OADShadowEffect color](self, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADShadowEffect setColor:](v4, "setColor:", v12);

  -[OADShadowEffect blurRadius](self, "blurRadius");
  -[OADShadowEffect setBlurRadius:](v4, "setBlurRadius:");
  -[OADShadowEffect distance](self, "distance");
  -[OADShadowEffect setDistance:](v4, "setDistance:");
  -[OADShadowEffect angle](self, "angle");
  -[OADShadowEffect setAngle:](v4, "setAngle:");
  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADPresetShadowEffect;
  -[OADShadowEffect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

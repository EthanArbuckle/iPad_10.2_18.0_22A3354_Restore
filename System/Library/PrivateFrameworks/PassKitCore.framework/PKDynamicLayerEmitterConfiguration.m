@implementation PKDynamicLayerEmitterConfiguration

- (PKDynamicLayerEmitterConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKDynamicLayerEmitterConfiguration *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  PKDynamicLayerEmitterConfiguration *v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;
  __CFString *v18;
  char v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  char v26;
  uint64_t v27;
  __CFString *v28;
  __CFString *v29;
  _BOOL8 v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  int v34;
  __CFString *v36;
  __CFString *v37;
  char v38;
  __CFString *v39;
  __CFString *v40;
  int v41;
  objc_super v42;

  v4 = a3;
  if (v4)
  {
    v42.receiver = self;
    v42.super_class = (Class)PKDynamicLayerEmitterConfiguration;
    v5 = -[PKDynamicLayerEmitterConfiguration init](&v42, sel_init);
    if (!v5)
    {
LABEL_35:
      self = v5;
      v10 = self;
      goto LABEL_36;
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("style"));
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == CFSTR("twinkling"))
      goto LABEL_6;
    if (!v6)
      goto LABEL_20;
    v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("twinkling"));

    if ((v8 & 1) != 0)
    {
LABEL_6:
      v9 = 0;
      goto LABEL_21;
    }
    v11 = v7;
    if (v11 == CFSTR("falling")
      || (v12 = v11,
          v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("falling")),
          v12,
          (v13 & 1) != 0))
    {
      v9 = 1;
      goto LABEL_21;
    }
    v14 = v12;
    if (v14 == CFSTR("blooming")
      || (v15 = v14,
          v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("blooming")),
          v15,
          (v16 & 1) != 0))
    {
      v9 = 2;
      goto LABEL_21;
    }
    v17 = v15;
    if (v17 == CFSTR("rising")
      || (v18 = v17,
          v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("rising")),
          v18,
          (v19 & 1) != 0))
    {
      v9 = 3;
      goto LABEL_21;
    }
    v20 = v18;
    if (v20 == CFSTR("shooting")
      || (v21 = v20,
          v22 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("shooting")),
          v21,
          v22))
    {
      v9 = 4;
    }
    else
    {
LABEL_20:
      v9 = 5;
    }
LABEL_21:

    v5->_style = v9;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("density"));
    v23 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23 == CFSTR("low") || v23 == 0)
      goto LABEL_26;
    v26 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("low"));

    if ((v26 & 1) != 0)
      goto LABEL_26;
    v36 = v24;
    if (v36 == CFSTR("medium")
      || (v37 = v36,
          v38 = -[__CFString isEqualToString:](v36, "isEqualToString:", CFSTR("medium")),
          v37,
          (v38 & 1) != 0))
    {
      v27 = 1;
    }
    else
    {
      v39 = v37;
      if (v39 != CFSTR("high"))
      {
        v40 = v39;
        v41 = -[__CFString isEqualToString:](v39, "isEqualToString:", CFSTR("high"));

        if (!v41)
        {
LABEL_26:
          v27 = 0;
          goto LABEL_27;
        }
      }
      v27 = 2;
    }
LABEL_27:

    v5->_density = v27;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("physicsEffect"));
    v28 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = 0;
    if (v28 != CFSTR("off") && v28)
    {
      v31 = -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("off"));

      v30 = 0;
      if ((v31 & 1) == 0)
      {
        v32 = v29;
        if (v32 == CFSTR("turbulence")
          || (v33 = v32,
              v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("turbulence")),
              v33,
              v34))
        {
          v30 = 1;
        }
      }
    }

    v5->_physicsEffect = v30;
    goto LABEL_35;
  }
  v10 = 0;
LABEL_36:

  return v10;
}

- (void)configureEmitterLayer:(id)a3 withImage:(CGImage *)a4
{
  id v6;
  void *v7;
  double Width;
  float v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[4];

  v45[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContents:", a4);
    -[PKDynamicLayerEmitterConfiguration _emitterBirthrate](self, "_emitterBirthrate");
    objc_msgSend(v7, "setBirthRate:");
    Width = (double)CGImageGetWidth(a4);
    -[PKDynamicLayerEmitterConfiguration _emitterScaleWithPixelSize:](self, "_emitterScaleWithPixelSize:", Width, (double)CGImageGetHeight(a4));
    objc_msgSend(v7, "setScale:", v9);
    objc_msgSend(v6, "setEmitterMode:", *MEMORY[0x1E0CD2B48]);
    objc_msgSend(v6, "setEmitterShape:", *MEMORY[0x1E0CD2B30]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    switch(self->_style)
    {
      case 0uLL:
        LODWORD(v11) = 3.0;
        objc_msgSend(v7, "setLifetime:", v11);
        LODWORD(v12) = 3.0;
        objc_msgSend(v7, "setLifetimeRange:", v12);
        v13 = PKCreateDynamicLayerOpacityBehavior(&unk_1E2C3E410);
        objc_msgSend(v10, "addObject:", v13);

        v45[0] = &unk_1E2C41860;
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "scale");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v15;
        v45[2] = &unk_1E2C41860;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = v45;
        v18 = 3;
        goto LABEL_8;
      case 1uLL:
        objc_msgSend(v7, "setParticleType:", *MEMORY[0x1E0CD2AF0]);
        LODWORD(v19) = 10.0;
        objc_msgSend(v7, "setLifetime:", v19);
        LODWORD(v20) = 2.0;
        objc_msgSend(v7, "setLifetimeRange:", v20);
        objc_msgSend(v7, "setYAcceleration:", 5.0);
        objc_msgSend(v7, "setOrientationRange:", 180.0);
        objc_msgSend(v7, "setSpin:", 4.0);
        objc_msgSend(v7, "setSpinRange:", 2.0);
        v15 = PKCreateDynamicLayerOpacityBehavior(&unk_1E2C3E428);
        objc_msgSend(v10, "addObject:", v15);
        goto LABEL_11;
      case 2uLL:
        LODWORD(v11) = 4.0;
        objc_msgSend(v7, "setLifetime:", v11);
        LODWORD(v21) = 1.0;
        objc_msgSend(v7, "setLifetimeRange:", v21);
        v22 = PKCreateDynamicLayerOpacityBehavior(&unk_1E2C3E440);
        objc_msgSend(v10, "addObject:", v22);

        v44[0] = &unk_1E2C41860;
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "scale");
        objc_msgSend(v23, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v15;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = v44;
        goto LABEL_7;
      case 3uLL:
        LODWORD(v11) = 4.0;
        objc_msgSend(v7, "setLifetime:", v11);
        LODWORD(v24) = 4.0;
        objc_msgSend(v7, "setLifetimeRange:", v24);
        objc_msgSend(v7, "setYAcceleration:", -10.0);
        v25 = PKCreateDynamicLayerOpacityBehavior(&unk_1E2C3E458);
        objc_msgSend(v10, "addObject:", v25);

        v43[0] = &unk_1E2C41860;
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "scale");
        objc_msgSend(v26, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v15;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = v43;
LABEL_7:
        v18 = 2;
LABEL_8:
        objc_msgSend(v16, "arrayWithObjects:count:", v17, v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = PKCreateDynamicLayerScaleBehavior(v27);
        objc_msgSend(v10, "addObject:", v28);
        goto LABEL_10;
      case 4uLL:
        LODWORD(v11) = 5.0;
        objc_msgSend(v7, "setLifetime:", v11);
        LODWORD(v29) = 5.0;
        objc_msgSend(v7, "setLifetimeRange:", v29);
        objc_msgSend(v7, "setEmissionRange:", 3.14159265);
        objc_msgSend(v7, "setVelocity:", 100.0);
        objc_msgSend(v7, "setSpinRange:", 4.0);
        v30 = PKCreateDynamicLayerOpacityBehavior(&unk_1E2C3E470);
        objc_msgSend(v10, "addObject:", v30);

        v31 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "scale");
        objc_msgSend(v31, "numberWithDouble:", v32 * 0.5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v15;
        v33 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "scale");
        objc_msgSend(v33, "numberWithDouble:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = PKCreateDynamicLayerScaleBehavior(v28);
        objc_msgSend(v10, "addObject:", v34);

LABEL_10:
LABEL_11:

        break;
      default:
        break;
    }
    if (self->_physicsEffect == 1)
    {
      objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AE8]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAPoint3D:", 10.0, 10.0, 10.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setValue:forKey:", v36, CFSTR("force"));

      LODWORD(v37) = 0.25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setValue:forKey:", v38, CFSTR("frequency"));

      objc_msgSend(v10, "addObject:", v35);
    }
    v41 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEmitterCells:", v39);

    v40 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v6, "setEmitterBehaviors:", v40);

  }
}

- (void)configureEmitterLayer:(id)a3 withBounds:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v9;
  unint64_t style;
  double MidX;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  style = self->_style;
  if (style - 2 < 3 || style == 0)
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v13 = v9;
    MidX = CGRectGetMidX(v14);
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    objc_msgSend(v13, "setEmitterPosition:", MidX, CGRectGetMidY(v15));
LABEL_9:
    objc_msgSend(v13, "setEmitterSize:", width, height);
    v9 = v13;
    goto LABEL_10;
  }
  if (style == 1)
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v13 = v9;
    objc_msgSend(v9, "setEmitterPosition:", CGRectGetMidX(v16), height * -0.2);
    height = height * 0.4;
    goto LABEL_9;
  }
LABEL_10:

}

- (float)_emitterBirthrate
{
  unint64_t density;
  float result;

  density = self->_density;
  result = 0.0;
  if (density <= 2)
    return flt_1904563A8[density];
  return result;
}

- (float)_emitterScaleWithPixelSize:(CGSize)a3
{
  unint64_t density;
  double v4;

  density = self->_density;
  v4 = 0.0;
  if (density <= 2)
    v4 = dbl_1904563B8[density];
  return v4 / fmax(a3.width, a3.height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDynamicLayerEmitterConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKDynamicLayerEmitterConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDynamicLayerEmitterConfiguration;
  v5 = -[PKDynamicLayerEmitterConfiguration init](&v7, sel_init);
  if (v5)
  {
    -[PKDynamicLayerEmitterConfiguration setStyle:](v5, "setStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("emitterStyle")));
    -[PKDynamicLayerEmitterConfiguration setDensity:](v5, "setDensity:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("emitterDensity")));
    -[PKDynamicLayerEmitterConfiguration setPhysicsEffect:](v5, "setPhysicsEffect:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("emitterPhysicsEffect")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t style;
  id v5;

  style = self->_style;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", style, CFSTR("emitterStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_density, CFSTR("emitterDensity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_physicsEffect, CFSTR("emitterPhysicsEffect"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKDynamicLayerEmitterConfiguration init](+[PKDynamicLayerEmitterConfiguration allocWithZone:](PKDynamicLayerEmitterConfiguration, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_style;
  *((_QWORD *)result + 3) = self->_density;
  *((_QWORD *)result + 4) = self->_physicsEffect;
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)density
{
  return self->_density;
}

- (void)setDensity:(unint64_t)a3
{
  self->_density = a3;
}

- (unint64_t)physicsEffect
{
  return self->_physicsEffect;
}

- (void)setPhysicsEffect:(unint64_t)a3
{
  self->_physicsEffect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emitterLayer, 0);
}

@end

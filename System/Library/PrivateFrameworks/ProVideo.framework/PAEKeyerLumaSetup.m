@implementation PAEKeyerLumaSetup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLumANumber:(id)a3
{
  id v5;

  v5 = a3;

  self->_lumA = (NSNumber *)a3;
}

- (void)setLumBNumber:(id)a3
{
  id v5;

  v5 = a3;

  self->_lumB = (NSNumber *)a3;
}

- (void)setLumCNumber:(id)a3
{
  id v5;

  v5 = a3;

  self->_lumC = (NSNumber *)a3;
}

- (void)setLumDNumber:(id)a3
{
  id v5;

  v5 = a3;

  self->_lumD = (NSNumber *)a3;
}

- (PAEKeyerLumaSetup)init
{
  PAEKeyerLumaSetup *v2;
  id v3;
  double v4;
  id v5;
  double v6;
  id v7;
  double v8;
  id v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PAEKeyerLumaSetup;
  v2 = -[PAEKeyerLumaSetup init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v4) = -1.0;
    v2->_lumA = (NSNumber *)objc_msgSend(v3, "initWithFloat:", v4);
    v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v6) = -0.5;
    v2->_lumB = (NSNumber *)objc_msgSend(v5, "initWithFloat:", v6);
    v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v8) = 0.5;
    v2->_lumC = (NSNumber *)objc_msgSend(v7, "initWithFloat:", v8);
    v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v10) = 1.0;
    v2->_lumD = (NSNumber *)objc_msgSend(v9, "initWithFloat:", v10);
  }
  return v2;
}

- (PAEKeyerLumaSetup)initWithCoder:(id)a3
{
  PAEKeyerLumaSetup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEKeyerLumaSetup;
  v4 = -[PAEKeyerLumaSetup init](&v6, sel_init);
  if (v4)
  {
    -[PAEKeyerLumaSetup setLumANumber:](v4, "setLumANumber:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LumA")));
    -[PAEKeyerLumaSetup setLumBNumber:](v4, "setLumBNumber:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LumB")));
    -[PAEKeyerLumaSetup setLumCNumber:](v4, "setLumCNumber:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LumC")));
    -[PAEKeyerLumaSetup setLumDNumber:](v4, "setLumDNumber:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LumD")));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerLumaSetup;
  -[PAEKeyerLumaSetup dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_lumA, CFSTR("LumA"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lumB, CFSTR("LumB"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lumC, CFSTR("LumC"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_lumD, CFSTR("LumD"));
}

- (float)lumA
{
  float result;

  -[NSNumber floatValue](self->_lumA, "floatValue");
  return result;
}

- (float)lumB
{
  float result;

  -[NSNumber floatValue](self->_lumB, "floatValue");
  return result;
}

- (float)lumC
{
  float result;

  -[NSNumber floatValue](self->_lumC, "floatValue");
  return result;
}

- (float)lumD
{
  float result;

  -[NSNumber floatValue](self->_lumD, "floatValue");
  return result;
}

- (void)setLumA:(float)a3
{
  double v5;

  *(float *)&v5 = a3;
  self->_lumA = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
}

- (void)setLumB:(float)a3
{
  double v5;

  *(float *)&v5 = a3;
  self->_lumB = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
}

- (void)setLumC:(float)a3
{
  double v5;

  *(float *)&v5 = a3;
  self->_lumC = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
}

- (void)setLumD:(float)a3
{
  double v5;

  *(float *)&v5 = a3;
  self->_lumD = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  PAEKeyerLumaSetup *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v27;
  float v28;

  v7 = objc_alloc_init(PAEKeyerLumaSetup);
  -[PAEKeyerLumaSetup lumA](self, "lumA");
  v9 = v8;
  -[PAEKeyerLumaSetup lumB](self, "lumB");
  v11 = v10;
  -[PAEKeyerLumaSetup lumC](self, "lumC");
  v27 = v12;
  -[PAEKeyerLumaSetup lumD](self, "lumD");
  v28 = v13;
  objc_msgSend(a3, "lumA");
  v15 = v14;
  objc_msgSend(a3, "lumB");
  v17 = v16;
  objc_msgSend(a3, "lumC");
  v19 = v18;
  objc_msgSend(a3, "lumD");
  v21 = v20;
  *(float *)&v22 = (float)((float)(1.0 - a4) * v9) + (float)(v15 * a4);
  -[PAEKeyerLumaSetup setLumA:](v7, "setLumA:", v22);
  *(float *)&v23 = (float)((float)(1.0 - a4) * v11) + (float)(v17 * a4);
  -[PAEKeyerLumaSetup setLumB:](v7, "setLumB:", v23);
  *(float *)&v24 = (float)((float)(1.0 - a4) * v27) + (float)(v19 * a4);
  -[PAEKeyerLumaSetup setLumC:](v7, "setLumC:", v24);
  *(float *)&v25 = (float)((float)(1.0 - a4) * v28) + (float)(v21 * a4);
  -[PAEKeyerLumaSetup setLumD:](v7, "setLumD:", v25);
  return v7;
}

- (BOOL)isEqualTo:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;

  -[PAEKeyerLumaSetup lumA](self, "lumA");
  v6 = v5;
  objc_msgSend(a3, "lumA");
  if (v6 != v7)
    return 0;
  -[PAEKeyerLumaSetup lumB](self, "lumB");
  v9 = v8;
  objc_msgSend(a3, "lumB");
  if (v9 != v10)
    return 0;
  -[PAEKeyerLumaSetup lumC](self, "lumC");
  v12 = v11;
  objc_msgSend(a3, "lumC");
  if (v12 == v13 && (-[PAEKeyerLumaSetup lumD](self, "lumD"), v15 = v14, objc_msgSend(a3, "lumD"), v15 == v16))
    return 1;
  else
    return 0;
}

@end

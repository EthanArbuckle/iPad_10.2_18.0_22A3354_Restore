@implementation PAEBadFilm

- (PAEBadFilm)initWithAPIManager:(id)a3
{
  PAEBadFilm *v4;
  PAEBadFilm *v5;
  PAEEarthquake *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAEBadFilm;
  v4 = -[PAESharedDefaultBase initWithAPIManager:](&v8, sel_initWithAPIManager_);
  v5 = v4;
  if (v4)
  {
    v4->_cachedSeed = 0;
    v4->_scratches = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 25);
    v6 = -[PAEEarthquake initWithAPIManager:]([PAEEarthquake alloc], "initWithAPIManager:", a3);
    v5->_jitterer = v6;
    if (!v6)
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_jitterer = 0;
  v3.receiver = self;
  v3.super_class = (Class)PAEBadFilm;
  -[PAESharedDefaultBase dealloc](&v3, sel_dealloc);
}

- (id)properties
{
  if (-[PAEBadFilm properties]::once != -1)
    dispatch_once(&-[PAEBadFilm properties]::once, &__block_literal_global_45);
  return (id)-[PAEBadFilm properties]::sPropertiesDict;
}

uint64_t __24__PAEBadFilm_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("MayRemapTime"), v2, CFSTR("SupportsHeliumRendering"), v3, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEBadFilm properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEBadFilm;
  -[PAESharedDefaultBase addParameters](&v11, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::Focus"), 0, 0), 1, 0, 0.0, 0.0, 600.0, 0.0, 64.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::FocusVariance"), 0, 0), 2, 0, 1.0, 0.0, 100.0, 0.0, 100.0, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::Brightness"), 0, 0), 3, 0, 1.0, 0.0, 100.0, 0.0, 5.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::BrightnessVariance"), 0, 0), 4, 0, 0.34, 0.0, 2.5, 0.0, 2.5, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::Saturation"), 0, 0), 5, 0, -50.0, -100.0, 100.0, -100.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::SaturationVariance"), 0, 0), 6, 0, 5.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    LODWORD(v6) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::Scratches"), 0, 0), 7, 1, 0, 25, 0, 0x100000019, v6);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::ScratchColor"), 0, 0), 15, 0, 1.0, 1.0, 1.0, 0.25);
    LODWORD(v7) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::Hairs"), 0, 0), 8, 1, 0, 10, 0, 0x10000000ALL, v7);
    LODWORD(v8) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::Dust"), 0, 0), 9, 4, 0, 100, 0, 0x100000064, v8);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::Jitter"), 0, 0), 10, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::JitterVariance"), 0, 0), 11, 0, 0.05, 0.0, 0.5, 0.0, 0.5, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::Grain"), 0, 0), 12, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    LODWORD(v9) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::AutoRandomFreq"), 0, 0), 13, 3, 0, 1000, 0, 0x100000064, v9);
    LODWORD(v10) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BadFilm::RandomSeed"), 0, 0), 14, 25, 2294967296, 2000000000, 0, 0x1000003E8, v10);
  }
  return v3 != 0;
}

- (void)getBrightness:(double *)a3 saturation:(double *)a4 dust:(int *)a5 scratches:(int *)a6 scratchColor:(double *)a7 hair:(int *)a8 randomSeed:(int *)a9 jitter:(double *)a10 focus:(double *)a11 grain:(double *)a12 autoRandFreq:(int *)a13 withParmsAPI:(id)a14 atTime:(id)a15
{
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;

  objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", a3, 3, a15.var1);
  objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", a4, 5, a15.var1);
  objc_msgSend(a14, "getIntValue:fromParm:atFxTime:", a5, 9, a15.var1);
  objc_msgSend(a14, "getIntValue:fromParm:atFxTime:", a6, 7, a15.var1);
  objc_msgSend(a14, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", a7, a7 + 1, a7 + 2, a7 + 3, 15, a15.var1);
  objc_msgSend(a14, "getIntValue:fromParm:atFxTime:", a8, 8, a15.var1);
  objc_msgSend(a14, "getIntValue:fromParm:atFxTime:", a9, 14, a15.var1);
  objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", a10, 10, a15.var1);
  objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", a11, 1, a15.var1);
  objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", a12, 12, a15.var1);
  v33 = 0.0;
  v34 = 0.0;
  v31 = 0.0;
  v32 = 0.0;
  objc_msgSend(a14, "getIntValue:fromParm:atFxTime:", a13, 13, a15.var1);
  if (*a13)
  {
    v30 = 0;
    objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", &v34, 2, a15.var1);
    -[PAEBadFilm autoRandomize:withVariance:andFrequency:atTime:randCount:](self, "autoRandomize:withVariance:andFrequency:atTime:randCount:", *a13, a15.var1, &v30, *a11, v34);
    *a11 = fabs(v19);
    objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", &v33, 4, a15.var1);
    -[PAEBadFilm autoRandomize:withVariance:andFrequency:atTime:randCount:](self, "autoRandomize:withVariance:andFrequency:atTime:randCount:", *a13, a15.var1, &v30, *a3, v33);
    *a3 = fabs(v20);
    objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", &v32, 6, a15.var1);
    -[PAEBadFilm autoRandomize:withVariance:andFrequency:atTime:randCount:](self, "autoRandomize:withVariance:andFrequency:atTime:randCount:", *a13, a15.var1, &v30, *a4, v32);
    *(_QWORD *)a4 = v21;
    objc_msgSend(a14, "getFloatValue:fromParm:atFxTime:", &v31, 11, a15.var1);
    -[PAEBadFilm autoRandomize:withVariance:andFrequency:atTime:randCount:](self, "autoRandomize:withVariance:andFrequency:atTime:randCount:", *a13, a15.var1, &v30, *a10, v31);
    *a10 = fabs(v22);
  }
  v23 = *a4 / 100.0 + 1.0;
  v24 = 2.0;
  if (v23 <= 2.0)
    v24 = *a4 / 100.0 + 1.0;
  v25 = v23 < 0.0;
  v26 = 0.0;
  if (!v25)
    v26 = v24;
  *a4 = v26;
}

- (double)autoRandomize:(double)a3 withVariance:(double)a4 andFrequency:(int)a5 atTime:(id)a6 randCount:(int *)a7
{
  double v11;
  double v12;
  int v13;
  int v14;
  int v15;
  int v16;
  double v17;
  _BYTE v19[8];
  _QWORD v20[384];
  int v21;

  -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a6.var1, self);
  v12 = v11 + v11;
  RandMersenne::RandMersenne((RandMersenne *)v19);
  RandMersenne::SetSeed((RandMersenne *)v19, (unint64_t)v12);
  v13 = *a7;
  if (*a7 <= 0)
  {
    v15 = v21;
  }
  else
  {
    v14 = 0;
    v15 = v21;
    do
    {
      if (v15 >= 382)
      {
        dsfmt_gen_rand_all((uint64_t)v20);
        v15 = 0;
        v13 = *a7;
      }
      v21 = ++v15;
      ++v14;
    }
    while (v14 < v13);
  }
  if (v15 >= 382)
  {
    dsfmt_gen_rand_all((uint64_t)v20);
    v15 = 0;
  }
  v16 = v15 + 1;
  v21 = v15 + 1;
  if (!(int)((*(double *)&v20[v15] + -1.0) * (double)a5))
  {
    if (v15 >= 381)
    {
      dsfmt_gen_rand_all((uint64_t)v20);
      v16 = 0;
    }
    v21 = v16 + 1;
    v17 = *(double *)&v20[v16] + -1.0 + -0.5;
    a3 = (v17 + v17) * a4 + a3;
  }
  ++*a7;
  RandMersenne::~RandMersenne((RandMersenne *)v19);
  return a3;
}

- (void)setupScratchArrayWithAutoRandomizeFrequency:(int)a3 andSeed:(int)a4 withWidth:(int)a5 andHeight:(int)a6 atTime:(id)a7
{
  double v12;
  double v13;
  double v14;
  int v15;
  uint64_t v16;
  int v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  PAEScratchVector *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  PAEScratchVector *v28;
  _BYTE v29[8];
  double v30[384];
  int v31;

  RandMersenne::RandMersenne((RandMersenne *)v29);
  if (a3)
  {
    -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a7.var1, self);
    v13 = RandMersenne::SetSeed((RandMersenne *)v29, (unint64_t)(v12 + v12) + 1);
  }
  else
  {
    v13 = RandMersenne::SetSeed((RandMersenne *)v29, a4);
  }
  -[NSMutableArray removeAllObjects](self->_scratches, "removeAllObjects", v13);
  v14 = (float)a6;
  v15 = 25;
  do
  {
    v16 = v31;
    if (v31 < 382)
    {
      v17 = ++v31;
      v18 = v30[v16];
      if ((_DWORD)v16 == 381)
      {
        dsfmt_gen_rand_all((uint64_t)v30);
        v17 = 0;
      }
    }
    else
    {
      dsfmt_gen_rand_all((uint64_t)v30);
      v17 = 1;
      v18 = v30[0];
    }
    v31 = v17 + 1;
    v19 = v30[v17];
    if (v17 < 381)
    {
      v20 = v17 + 2;
      v31 = v17 + 2;
      v21 = v30[v17 + 1];
      if (v17 == 380)
      {
        dsfmt_gen_rand_all((uint64_t)v30);
        v20 = 0;
      }
    }
    else
    {
      dsfmt_gen_rand_all((uint64_t)v30);
      v20 = 1;
      v21 = v30[0];
    }
    v31 = v20 + 1;
    v22 = v30[v20];
    v23 = [PAEScratchVector alloc];
    v24 = v18 + -1.0;
    *(float *)&v24 = v18 + -1.0;
    v25 = (v19 + -1.0) * v14 * 600.0;
    *(float *)&v25 = v25;
    v26 = v21 + -1.0;
    *(float *)&v26 = v21 + -1.0;
    v27 = (v22 + -1.0) * v14 * 600.0;
    *(float *)&v27 = v27;
    v28 = -[PAEScratchVector initWithStartLocationX:andY:andEndLocationX:andY:](v23, "initWithStartLocationX:andY:andEndLocationX:andY:", v24, v25, v26, v27);
    -[NSMutableArray addObject:](self->_scratches, "addObject:", v28);

    --v15;
  }
  while (v15);
  RandMersenne::~RandMersenne((RandMersenne *)v29);
}

- (void)createDust:(int)a3 scratches:(int)a4 scratchColor:(double *)a5 hair:(int)a6 randomSeed:(int)a7 autoRandFreq:(int)a8 buffer:(void *)a9 atTime:(id)a10 pixelTransform:(const void *)a11
{
  uint64_t v12;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v18;
  size_t v19;
  size_t v20;
  CGContextRef v21;
  CGContext *v22;
  CGColor *v23;
  double v24;
  int v25;
  int v26;
  int v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  int v39;
  double v40;
  int v41;
  uint64_t v42;
  double v43;
  int v44;
  double v45;
  float v46;
  float v47;
  int v48;
  int v49;
  unsigned int v50;
  void *v51;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  float v59;
  double v60;
  void *v61;
  float v62;
  float v63;
  int v64;
  double v65;
  int v66;
  int v67;
  int v68;
  float v69;
  int v70;
  float v71;
  float v72;
  double v73;
  double v74;
  int v75;
  int v76;
  double v77;
  float v78;
  double v79;
  float v80;
  int v81;
  int v82;
  int v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  int v88;
  double v89;
  float v90;
  double v91;
  double *v92;
  CGColor *color;
  size_t v94;
  uint64_t v95;
  int v96;
  unsigned int v97;
  double v98;
  double v99;
  double v100;
  uint64_t v102;
  uint64_t v103;
  __int128 *v104;
  __int128 v105;
  uint64_t v106;
  _BYTE v107[8];
  double v108[384];
  int v109;
  _OWORD components[2];
  uint64_t v111;
  CGRect v112;

  v12 = *(_QWORD *)&a7;
  v111 = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v18 = DeviceRGB;
    v19 = *((int *)a9 + 7) - (uint64_t)*((int *)a9 + 5);
    v20 = *((int *)a9 + 8) - (uint64_t)*((int *)a9 + 6);
    v21 = CGBitmapContextCreate(*((void **)a9 + 10), v19, v20, 8uLL, *((_QWORD *)a9 + 8), DeviceRGB, 2u);
    if (v21)
    {
      v22 = v21;
      v92 = a5;
      v96 = a4;
      memset(components, 0, sizeof(components));
      v23 = CGColorCreate(v18, (const CGFloat *)components);
      CGContextSaveGState(v22);
      CGContextSetBlendMode(v22, kCGBlendModeCopy);
      CGContextSetFillColorWithColor(v22, v23);
      v112.size.width = (double)(int)v19;
      v112.size.height = (double)(int)v20;
      v112.origin.x = 0.0;
      v112.origin.y = 0.0;
      v99 = (double)(int)v19;
      v100 = (double)(int)v20;
      CGContextFillRect(v22, v112);
      CGContextRestoreGState(v22);
      RandMersenne::RandMersenne((RandMersenne *)v107);
      color = v23;
      v97 = a8;
      v95 = v12;
      v94 = v19;
      if (a8)
      {
        -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a10.var1, self);
        RandMersenne::SetSeed((RandMersenne *)v107, (unint64_t)(v24 + v24) + 1);
        v25 = v109;
        if (v109 >= 382)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          v25 = 0;
        }
        v109 = v25 + 1;
        if (a3 >= 1 && !(int)((v108[v25] + -1.0) * (double)a8))
        {
          CGContextSetLineWidth(v22, 1.0);
          v26 = 0;
          v98 = (float)(int)v19;
          do
          {
            v27 = v109;
            if (v109 > 381)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              v27 = 0;
            }
            v28 = v27 + 1;
            v109 = v27 + 1;
            v29 = v108[v27];
            if (v27 >= 381)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              v28 = 0;
            }
            v109 = v28 + 1;
            v30 = v108[v28];
            if (v28 < 381)
            {
              v33 = v28 + 2;
              v109 = v28 + 2;
              v31 = v108[v28 + 1];
              v34 = *(double *)a11;
              if (v28 == 380)
              {
                dsfmt_gen_rand_all((uint64_t)v108);
                v33 = 0;
              }
              v32 = *(double *)a11;
            }
            else
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              v31 = v108[0];
              v32 = *(double *)a11;
              v33 = 1;
              v34 = *(double *)a11;
            }
            v109 = v33 + 1;
            v35 = v34 * (v31 + -1.0);
            v36 = (v108[v33] + -1.0) * 0.75 + 0.25;
            CGContextSetRGBStrokeColor(v22, v35, v35, v35, v32 * v36);
            v37 = (v29 + -1.0) * v98;
            v38 = (v30 + -1.0) * (float)(int)v20;
            CGContextMoveToPoint(v22, v37, v38);
            v39 = v109;
            if (v109 >= 382)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              v39 = 0;
            }
            v40 = v108[v39];
            v109 = v39 + 1;
            v41 = (int)((v40 + -1.0) * 11.0);
            if (v41 >= 1)
            {
              do
              {
                v42 = v109;
                if (v109 < 382)
                {
                  v44 = ++v109;
                  v43 = v108[v42];
                  if ((_DWORD)v42 == 381)
                  {
                    dsfmt_gen_rand_all((uint64_t)v108);
                    v44 = 0;
                  }
                }
                else
                {
                  dsfmt_gen_rand_all((uint64_t)v108);
                  LODWORD(v43) = LODWORD(v108[0]);
                  v44 = 1;
                }
                v109 = v44 + 1;
                v45 = v108[v44];
                v46 = v37 + 1.0;
                if (LODWORD(v43) >= 0xAAAAAAAA)
                  v46 = v37;
                if (LODWORD(v43) >= 0x55555555)
                  v37 = v46;
                else
                  v37 = v37 + -1.0;
                v47 = v38 + 1.0;
                if (LODWORD(v45) >= 0xAAAAAAAA)
                  v47 = v38;
                if (LODWORD(v45) >= 0x55555555)
                  v38 = v47;
                else
                  v38 = v38 + -1.0;
                CGContextAddLineToPoint(v22, v37, v38);
                --v41;
              }
              while (v41);
            }
            CGContextStrokePath(v22);
            ++v26;
          }
          while (v26 != a3);
        }
      }
      else
      {
        RandMersenne::SetSeed((RandMersenne *)v107, v12);
        v48 = v109;
        if (v109 >= 382)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          v48 = 0;
        }
        v109 = v48 + 1;
      }
      *(_QWORD *)&v105 = &self->_scratchMutex;
      PCMutex::lock(&self->_scratchMutex);
      BYTE8(v105) = 1;
      v49 = v97;
      v50 = v95;
      if (-[NSMutableArray count](self->_scratches, "count") != 25 || !v97 && self->_cachedSeed != (_DWORD)v95)
        -[PAEBadFilm setupScratchArrayWithAutoRandomizeFrequency:andSeed:withWidth:andHeight:atTime:](self, "setupScratchArrayWithAutoRandomizeFrequency:andSeed:withWidth:andHeight:atTime:", v97, v95, v94, v20, a10.var1);
      v51 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_scratches);
      PCMutex::unlock(&self->_scratchMutex);
      var1 = a10.var1;
      if (v97)
      {
        -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a10.var1, self);
        RandMersenne::SetSeed((RandMersenne *)v107, (unint64_t)(v53 + v53) + 1);
      }
      else
      {
        RandMersenne::SetSeed((RandMersenne *)v107, v95);
      }
      if (v96 >= 1)
      {
        CGContextSetRGBStrokeColor(v22, *v92, v92[1], v92[2], v92[3]);
        v54 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7DB0);
        v105 = *MEMORY[0x1E0CA2E68];
        v106 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        v104 = &v105;
        objc_msgSend(v54, "inPointFxTimeOfTimelineForEffect:", &v104);
        -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a10.var1, self);
        v56 = v55;
        -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", v104, self);
        v58 = 0;
        v59 = (float)(int)v94;
        v60 = fmod(v56 - v57, 600.0) * v100;
        do
        {
          v61 = (void *)objc_msgSend(v51, "objectAtIndex:", v58);
          v102 = 0;
          v103 = 0;
          objc_msgSend(v61, "startLocationX:andY:andEndLocationX:andY:", (char *)&v103 + 4, &v103, (char *)&v102 + 4, &v102);
          v62 = *(float *)&v103 - v60;
          v63 = *(float *)&v102 - v60;
          *(float *)&v103 = v62;
          *((float *)&v103 + 1) = *((float *)&v103 + 1) * v59;
          *(float *)&v102 = v63;
          *((float *)&v102 + 1) = *((float *)&v102 + 1) * v59;
          v64 = v109;
          if (v109 >= 382)
          {
            dsfmt_gen_rand_all((uint64_t)v108);
            v64 = 0;
          }
          v109 = v64 + 1;
          CGContextSetLineWidth(v22, v108[v64] + -1.0 + 1.0);
          CGContextMoveToPoint(v22, *((float *)&v103 + 1), *(float *)&v103);
          CGContextAddLineToPoint(v22, *((float *)&v102 + 1), *(float *)&v102);
          ++v58;
        }
        while (v96 != v58);
        CGContextStrokePath(v22);
        v50 = v95;
        var1 = a10.var1;
        v49 = v97;
      }
      if (v49)
      {
        -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", var1, self);
        RandMersenne::SetSeed((RandMersenne *)v107, (unint64_t)(v65 + v65) + 1);
      }
      else
      {
        RandMersenne::SetSeed((RandMersenne *)v107, v50);
      }
      v66 = v109;
      if (v109 < 382)
      {
        v67 = ++v109;
        if (v66 == 381)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          v67 = 0;
        }
      }
      else
      {
        dsfmt_gen_rand_all((uint64_t)v108);
        v67 = 1;
      }
      v68 = v67 + 1;
      v109 = v67 + 1;
      if (v49)
      {
        if (v67 >= 381)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          v68 = 0;
        }
        v109 = v68 + 1;
        if (a6 >= 1 && !(int)((v108[v68] + -1.0) * (double)v49))
        {
          v69 = *(double *)a11 + 0.1;
          CGContextSetRGBStrokeColor(v22, 0.2, 0.2, 0.2, v69);
          v70 = 0;
          v71 = fabs(*((double *)a11 + 5)) * 10.0;
          v72 = fabs(*(double *)a11) * 10.0;
          v73 = v72;
          v74 = v71;
          do
          {
            v75 = v109;
            if (v109 > 381)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              v75 = 0;
            }
            v76 = v75 + 1;
            v109 = v75 + 1;
            v77 = v108[v75];
            if (v75 >= 381)
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              v76 = 0;
            }
            v78 = (v77 + -1.0) * v99;
            v79 = v108[v76];
            v109 = v76 + 1;
            v80 = (v79 + -1.0) * v100;
            CGContextMoveToPoint(v22, v78, v80);
            v81 = 5;
            do
            {
              v82 = v109;
              if (v109 > 381)
              {
                dsfmt_gen_rand_all((uint64_t)v108);
                v82 = 0;
              }
              v83 = v82 + 1;
              v109 = v82 + 1;
              v84 = v108[v82];
              if (v82 >= 381)
              {
                dsfmt_gen_rand_all((uint64_t)v108);
                v83 = 0;
              }
              v78 = (v84 + -1.0 + -0.5 + v84 + -1.0 + -0.5) * v73 + v78;
              v109 = v83 + 1;
              v85 = v108[v83] + -1.0 + -0.5;
              v80 = (v85 + v85) * v74 + v80;
              v86 = v78;
              CGContextAddLineToPoint(v22, v78, v80);
              --v81;
            }
            while (v81);
            v87 = v109;
            if (v109 < 382)
            {
              v88 = ++v109;
              v89 = v108[v87];
              if ((_DWORD)v87 == 381)
              {
                dsfmt_gen_rand_all((uint64_t)v108);
                v88 = 0;
              }
            }
            else
            {
              dsfmt_gen_rand_all((uint64_t)v108);
              v88 = 1;
              v89 = v108[0];
            }
            v109 = v88 + 1;
            v90 = (v89 + -1.0 + -0.5 + v89 + -1.0 + -0.5) * v73 + v86;
            v91 = v108[v88] + -1.0 + -0.5;
            *(float *)&v91 = (v91 + v91) * v74 + v80;
            CGContextAddLineToPoint(v22, v90, *(float *)&v91);
            ++v70;
          }
          while (v70 != a6);
          CGContextStrokePath(v22);
        }
      }
      else
      {
        if (v67 >= 381)
        {
          dsfmt_gen_rand_all((uint64_t)v108);
          v68 = 0;
        }
        v109 = v68 + 1;
      }
      CGColorRelease(color);
      CGContextRelease(v22);
      RandMersenne::~RandMersenne((RandMersenne *)v107);
    }
    CGColorSpaceRelease(v18);
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HGBitmap *v26;
  double v27;
  HGBitmapLoader *v28;
  double *v29;
  int v30;
  int v31;
  double v32;
  HgcBadFilm *v33;
  uint64_t v34;
  HGaussianBlur *v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  PAEEarthquake *jitterer;
  double v47;
  double v48;
  double v49;
  double v50;
  __int128 v51;
  double v52;
  HGaussianBlur *v53;
  HGaussianBlur *v54;
  double v55;
  HGaussianBlur *v56;
  float v57;
  float v58;
  float v59;
  HGaussianBlur *v60;
  _OWORD v62[3];
  HgcBadFilm *v63;
  uint64_t v64;
  HSampleTiledNoise *v65;
  HGaussianBlur *v66;
  double v67;
  double v68;
  HGaussianBlur *v69;
  char v70[132];
  unsigned int v71;
  double v72;
  double v73;
  double v74;
  unsigned int v75;
  unsigned int v76;
  uint64_t v77;
  double v78;
  double v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  _BYTE v90[32];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v89 = 0;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  if (a4)
    objc_msgSend(a4, "imageInfo");
  v84 = 0;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  if (a3)
    objc_msgSend(a3, "imageInfo");
  v9 = v85;
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v11 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
    return 0;
  v78 = 1.0;
  v79 = 1.0;
  v77 = 0;
  v76 = 0;
  v75 = 25;
  v73 = 0.0;
  v74 = 0.0;
  v72 = 0.0;
  v71 = 0;
  -[PAEBadFilm getBrightness:saturation:dust:scratches:scratchColor:hair:randomSeed:jitter:focus:grain:autoRandFreq:withParmsAPI:atTime:](self, "getBrightness:saturation:dust:scratches:scratchColor:hair:randomSeed:jitter:focus:grain:autoRandFreq:withParmsAPI:atTime:", &v79, &v78, (char *)&v77 + 4, &v77, v90, &v76, &v75, &v74, &v73, &v72, &v71, v10, a5->var0.var1);
  v15 = objc_msgSend(a4, "imageType");
  v16 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  if (v16)
    v17 = v15 == 3;
  else
    v17 = 0;
  v14 = v17;
  if (v17)
  {
    v69 = 0;
    v18 = (int)(float)(unint64_t)v9;
    v19 = (int)(float)*((unint64_t *)&v9 + 1);
    if (v18 >= 0)
      v20 = (int)(float)(unint64_t)v9;
    else
      v20 = v18 + 1;
    v21 = v18 - (v20 >> 1);
    if (v19 >= 0)
      v22 = (int)(float)*((unint64_t *)&v9 + 1);
    else
      v22 = v19 + 1;
    v23 = HGRectMake4i(-(v20 >> 1), -(v22 >> 1), v21, v19 - (v22 >> 1));
    v25 = v24;
    v26 = (HGBitmap *)HGObject::operator new(0x80uLL);
    *(_QWORD *)&v27 = HGBitmap::HGBitmap(v26, v23, v25, 22).n128_u64[0];
    -[PAEBadFilm createDust:scratches:scratchColor:hair:randomSeed:autoRandFreq:buffer:atTime:pixelTransform:](self, "createDust:scratches:scratchColor:hair:randomSeed:autoRandFreq:buffer:atTime:pixelTransform:", HIDWORD(v77), v77, v90, v76, v75, v71, v27, v26, a5->var0.var1, v70);
    v28 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v28, v26);
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v29 = (double *)objc_msgSend((id)objc_msgSend(v12, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
    if (v72 == 0.0)
    {
      v33 = (HgcBadFilm *)HGObject::operator new(0x1A0uLL);
      *((_OWORD *)v33 + 24) = 0u;
      *((_OWORD *)v33 + 25) = 0u;
      *((_OWORD *)v33 + 22) = 0u;
      *((_OWORD *)v33 + 23) = 0u;
      *((_OWORD *)v33 + 20) = 0u;
      *((_OWORD *)v33 + 21) = 0u;
      *((_OWORD *)v33 + 18) = 0u;
      *((_OWORD *)v33 + 19) = 0u;
      *((_OWORD *)v33 + 16) = 0u;
      *((_OWORD *)v33 + 17) = 0u;
      *((_OWORD *)v33 + 14) = 0u;
      *((_OWORD *)v33 + 15) = 0u;
      *((_OWORD *)v33 + 12) = 0u;
      *((_OWORD *)v33 + 13) = 0u;
      *((_OWORD *)v33 + 10) = 0u;
      *((_OWORD *)v33 + 11) = 0u;
      *((_OWORD *)v33 + 8) = 0u;
      *((_OWORD *)v33 + 9) = 0u;
      *((_OWORD *)v33 + 6) = 0u;
      *((_OWORD *)v33 + 7) = 0u;
      *((_OWORD *)v33 + 4) = 0u;
      *((_OWORD *)v33 + 5) = 0u;
      *((_OWORD *)v33 + 2) = 0u;
      *((_OWORD *)v33 + 3) = 0u;
      *(_OWORD *)v33 = 0u;
      *((_OWORD *)v33 + 1) = 0u;
      HgcBadFilm::HgcBadFilm(v33);
      *(_QWORD *)v33 = &unk_1E64E4578;
      HGObject::Retain((uint64_t)v33);
      if (a4)
      {
        objc_msgSend(a4, "heliumRef");
        v35 = v66;
      }
      else
      {
        v35 = 0;
        v66 = 0;
      }
      (*(void (**)(HgcBadFilm *, _QWORD, HGaussianBlur *))(*(_QWORD *)v33 + 120))(v33, 0, v35);
      if (v66)
        (*(void (**)(HGaussianBlur *))(*(_QWORD *)v66 + 24))(v66);
      (*(void (**)(HgcBadFilm *, uint64_t, HGBitmapLoader *))(*(_QWORD *)v33 + 120))(v33, 1, v28);
      v41 = v79;
      (*(void (**)(HgcBadFilm *, _QWORD, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 0, v41, 0.0, 0.0, 0.0);
      v42 = v78;
      (*(void (**)(HgcBadFilm *, uint64_t, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 1, v42, 0.0, 0.0, 0.0);
      v43 = *v29;
      v44 = v29[1];
      v45 = v29[2];
      (*(void (**)(HgcBadFilm *, uint64_t, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 2, v43, v44, v45, 0.0);
      (*(void (**)(HgcBadFilm *))(*(_QWORD *)v33 + 24))(v33);
    }
    else
    {
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4, v72);
      v31 = DWORD2(v80);
      v30 = v80;
      -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a5->var0.var1, self);
      PAEGenerateNoise(v30, v31, 2, 0, 1, 0, &v65, v72, v32);
      v33 = (HgcBadFilm *)HGObject::operator new(0x1A0uLL);
      HgcBadFilmGrain::HgcBadFilmGrain(v33);
      if (v33)
        (*(void (**)(HgcBadFilm *))(*(_QWORD *)v33 + 16))(v33);
      if (a4)
      {
        objc_msgSend(a4, "heliumRef");
        v34 = v64;
      }
      else
      {
        v34 = 0;
        v64 = 0;
      }
      (*(void (**)(HgcBadFilm *, _QWORD, uint64_t))(*(_QWORD *)v33 + 120))(v33, 0, v34);
      if (v64)
        (*(void (**)(uint64_t))(*(_QWORD *)v64 + 24))(v64);
      (*(void (**)(HgcBadFilm *, uint64_t, HGBitmapLoader *))(*(_QWORD *)v33 + 120))(v33, 1, v28);
      (*(void (**)(HgcBadFilm *, uint64_t, HSampleTiledNoise *))(*(_QWORD *)v33 + 120))(v33, 2, v65);
      v36 = v79;
      (*(void (**)(HgcBadFilm *, _QWORD, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 0, v36, 0.0, 0.0, 0.0);
      v37 = v78;
      (*(void (**)(HgcBadFilm *, uint64_t, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 1, v37, 0.0, 0.0, 0.0);
      v38 = *v29;
      v39 = v29[1];
      v40 = v29[2];
      (*(void (**)(HgcBadFilm *, uint64_t, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 2, v38, v39, v40, 0.0);
      (*(void (**)(HgcBadFilm *))(*(_QWORD *)v33 + 24))(v33);
      if (v65)
        (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v65 + 24))(v65);
    }
    v69 = v33;
    (*(void (**)(HgcBadFilm *))(*(_QWORD *)v33 + 16))(v33);
    if (v74 <= 0.0)
      goto LABEL_51;
    jitterer = self->_jitterer;
    v63 = v33;
    (*(void (**)(HgcBadFilm *, double))(*(_QWORD *)v33 + 16))(v33, v74);
    v51 = *(_OWORD *)&a5->var2;
    v62[0] = *(_OWORD *)&a5->var0.var0;
    v62[1] = v51;
    v62[2] = *(_OWORD *)&a5->var4;
    if (jitterer)
    {
      v52 = v74 * 0.9 + 0.1;
      *(float *)&v47 = v52;
      LODWORD(v52) = 0;
      LODWORD(v48) = 5.0;
      LODWORD(v49) = 0;
      LODWORD(v50) = 0;
      -[PAEEarthquake quakeHeliumNodeWithInputImage:inputImage:outputImage:renderInfo:twist:horizontalShake:verticalShake:layers:centerX:centerY:randomSeed:](jitterer, "quakeHeliumNodeWithInputImage:inputImage:outputImage:renderInfo:twist:horizontalShake:verticalShake:layers:centerX:centerY:randomSeed:", &v63, a4, a3, v62, v75, v52, 0.0999999642, v47, v48, v49, v50);
      v53 = v66;
      v54 = v69;
      if (v69 == v66)
      {
        if (v66)
          (*(void (**)(void))(*(_QWORD *)v66 + 24))();
        goto LABEL_49;
      }
      if (!v69)
        goto LABEL_48;
    }
    else
    {
      v66 = 0;
      v54 = v69;
      if (!v69)
        goto LABEL_49;
    }
    (*(void (**)(HGaussianBlur *))(*(_QWORD *)v54 + 24))(v54);
    v53 = v66;
LABEL_48:
    v69 = v53;
    v66 = 0;
LABEL_49:
    if (v63)
      (*(void (**)(HgcBadFilm *))(*(_QWORD *)v63 + 24))(v63);
LABEL_51:
    v55 = v73;
    if (v73 > 0.0)
    {
      v56 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur(v56);
      v57 = v73;
      v58 = v67;
      v59 = v68;
      HGaussianBlur::init(v56, v57, v58, v59, 0, 0, 0);
      v60 = v69;
      (*(void (**)(HGaussianBlur *, _QWORD, HGaussianBlur *))(*(_QWORD *)v56 + 120))(v56, 0, v69);
      if (v60 != v56)
      {
        if (v60)
          (*(void (**)(HGaussianBlur *))(*(_QWORD *)v60 + 24))(v60);
        v69 = v56;
        (*(void (**)(HGaussianBlur *))(*(_QWORD *)v56 + 16))(v56);
      }
      (*(void (**)(HGaussianBlur *))(*(_QWORD *)v56 + 24))(v56);
    }
    objc_msgSend(a3, "setHeliumRef:", &v69, v55);
    (*(void (**)(HgcBadFilm *))(*(_QWORD *)v33 + 24))(v33);
    if (v28)
      (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v28 + 24))(v28);
    if (v26)
      (*(void (**)(HGBitmap *))(*(_QWORD *)v26 + 24))(v26);
    if (v69)
      (*(void (**)(HGaussianBlur *))(*(_QWORD *)v69 + 24))(v69);
  }
  return v14;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 0;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

- (void).cxx_destruct
{
  PCMutex::~PCMutex(&self->_scratchMutex);
}

- (id).cxx_construct
{
  PCMutex::PCMutex(&self->_scratchMutex);
  return self;
}

@end

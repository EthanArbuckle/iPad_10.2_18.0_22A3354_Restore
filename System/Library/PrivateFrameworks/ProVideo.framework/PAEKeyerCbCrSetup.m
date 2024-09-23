@implementation PAEKeyerCbCrSetup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEKeyerCbCrSetup)init
{
  PAEKeyerCbCrSetup *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  OMPie *v6;
  uint64_t v7;
  OMSpline *keyer2DSatSpline;
  OMSpline *v9;
  OMSpline *v10;
  OMSpline *v11;
  Vec2f v13;
  objc_super v14;

  self->_initialized = 1;
  v14.receiver = self;
  v14.super_class = (Class)PAEKeyerCbCrSetup;
  v2 = -[PAEKeyerCbCrSetup init](&v14, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    OMPie::OMPie((OMPie *)(v3 + 1));
    *v3 = &unk_1E64E22C0;
    v2->_keyer2DTolPie = v3;
    v4 = v3[6];
    *(_OWORD *)v4 = xmmword_1B304F230;
    *(int32x2_t *)(v4 + 16) = vdup_n_s32(0x3F34FDF4u);
    v5 = (_QWORD *)operator new();
    OMPie::OMPie((OMPie *)(v5 + 1));
    *v5 = &unk_1E64E22C0;
    v2->_keyer2DSoftPie = v5;
    OMPie::setBasedOnOffsetFromOtherPie(v6, (OMPie *)((char *)v2->_keyer2DTolPie + 8), 0.1, 1.0, (const Vec2f *)1);
    v7 = operator new();
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = 0;
    *(_WORD *)(v7 + 32) = 256;
    v2->_keyer2DSatSpline = (void *)v7;
    *(_QWORD *)(v7 + 24) = 0x4080000000000000;
    v13 = (Vec2f)3212836864;
    OMSpline::addVertexAtEnd((OMSpline *)v7, &v13);
    keyer2DSatSpline = (OMSpline *)v2->_keyer2DSatSpline;
    v13 = (Vec2f)3198744003;
    OMSpline::addVertexAtEnd(keyer2DSatSpline, &v13);
    v9 = (OMSpline *)v2->_keyer2DSatSpline;
    v13 = 0;
    OMSpline::addVertexAtEnd(v9, &v13);
    v10 = (OMSpline *)v2->_keyer2DSatSpline;
    v13 = (Vec2f)1051260355;
    OMSpline::addVertexAtEnd(v10, &v13);
    v11 = (OMSpline *)v2->_keyer2DSatSpline;
    v13 = (Vec2f)1065353216;
    OMSpline::addVertexAtEnd(v11, &v13);
  }
  return v2;
}

- (PAEKeyerCbCrSetup)initWithCoder:(id)a3
{
  PAEKeyerCbCrSetup *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  NSNumber **softPieX;
  int v12;
  int v13;
  _DWORD *v14;
  int v15;
  int v16;
  int v17;
  _DWORD *v18;
  int v19;
  uint64_t v20;
  NSMutableArray *splineVertex;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  OMSpline *keyer2DSatSpline;
  float v27;
  float v28;
  float v29;
  Vec2f v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  self->_initialized = 1;
  v36.receiver = self;
  v36.super_class = (Class)PAEKeyerCbCrSetup;
  v4 = -[PAEKeyerCbCrSetup init](&v36, sel_init);
  if (v4)
  {
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieX_CORNER_L")), 0);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieX_CORNER_M")), 1);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieX_CORNER_R")), 2);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieX_CORNER_LL")), 3);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](v4, "setTolPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieX_CORNER_RR")), 4);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieY_CORNER_L")), 0);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieY_CORNER_M")), 1);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieY_CORNER_R")), 2);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieY_CORNER_LL")), 3);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](v4, "setTolPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TolPieY_CORNER_RR")), 4);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieX_CORNER_L")), 0);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieX_CORNER_M")), 1);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieX_CORNER_R")), 2);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieX_CORNER_LL")), 3);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](v4, "setSoftPieX:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieX_CORNER_RR")), 4);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieY_CORNER_L")), 0);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieY_CORNER_M")), 1);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieY_CORNER_R")), 2);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieY_CORNER_LL")), 3);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](v4, "setSoftPieY:indice:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftPieY_CORNER_RR")), 4);
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v4->_splineVertex = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), CFSTR("SplineVertex"));
    v8 = (_QWORD *)operator new();
    OMPie::OMPie((OMPie *)(v8 + 1), 0);
    *v8 = &unk_1E64E22C0;
    v4->_keyer2DTolPie = v8;
    v9 = (_QWORD *)operator new();
    OMPie::OMPie((OMPie *)(v9 + 1), 1);
    v10 = 0;
    *v9 = &unk_1E64E22C0;
    v4->_keyer2DSoftPie = v9;
    softPieX = v4->_softPieX;
    do
    {
      -[NSNumber floatValue](softPieX[v10 - 10], "floatValue");
      v13 = v12;
      -[NSNumber floatValue](softPieX[v10 - 5], "floatValue");
      v14 = (_DWORD *)(*((_QWORD *)v4->_keyer2DTolPie + 6) + v10 * 8);
      *v14 = v13;
      v14[1] = v15;
      -[NSNumber floatValue](softPieX[v10], "floatValue");
      v17 = v16;
      -[NSNumber floatValue](softPieX[v10 + 5], "floatValue");
      v18 = (_DWORD *)(*((_QWORD *)v4->_keyer2DSoftPie + 6) + v10 * 8);
      *v18 = v17;
      v18[1] = v19;
      ++v10;
    }
    while (v10 != 5);
    v20 = operator new();
    *(_QWORD *)(v20 + 8) = 0;
    *(_QWORD *)(v20 + 16) = 0;
    *(_QWORD *)v20 = 0;
    *(_WORD *)(v20 + 32) = 256;
    v4->_keyer2DSatSpline = (void *)v20;
    *(_QWORD *)(v20 + 24) = 0x4080000000000000;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    splineVertex = v4->_splineVertex;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](splineVertex, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(splineVertex);
          v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          keyer2DSatSpline = (OMSpline *)v4->_keyer2DSatSpline;
          objc_msgSend(v25, "bx");
          v28 = v27;
          objc_msgSend(v25, "by");
          v31.var0[0] = v28;
          v31.var0[1] = v29;
          OMSpline::addVertexAtEnd(keyer2DSatSpline, &v31);
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](splineVertex, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v22);
    }
  }
  return v4;
}

- (void)dealloc
{
  void **keyer2DSatSpline;
  void *v4;
  void *keyer2DTolPie;
  void *keyer2DSoftPie;
  uint64_t v7;
  objc_super v8;

  keyer2DSatSpline = (void **)self->_keyer2DSatSpline;
  if (keyer2DSatSpline)
  {
    v4 = *keyer2DSatSpline;
    if (*keyer2DSatSpline)
    {
      keyer2DSatSpline[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1B5E29170](keyer2DSatSpline, 0x1020C407A026B33);
  }
  keyer2DTolPie = self->_keyer2DTolPie;
  if (keyer2DTolPie)
    (*(void (**)(void *, SEL))(*(_QWORD *)keyer2DTolPie + 8))(keyer2DTolPie, a2);
  keyer2DSoftPie = self->_keyer2DSoftPie;
  if (keyer2DSoftPie)
    (*(void (**)(void *, SEL))(*(_QWORD *)keyer2DSoftPie + 8))(keyer2DSoftPie, a2);
  v7 = 0x1FFFFFFFFFFFFFFBLL;
  do
  {

    ++v7;
  }
  while (v7 * 8);

  v8.receiver = self;
  v8.super_class = (Class)PAEKeyerCbCrSetup;
  -[PAEKeyerCbCrSetup dealloc](&v8, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  double v3;
  uint64_t v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  PAEKeyerOMVertex *v13;
  _DWORD *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v6 = 0;
  for (i = 0; i != 5; ++i)
  {
    LODWORD(v3) = *(_DWORD *)(*((_QWORD *)self->_keyer2DTolPie + 6) + v6);
    -[PAEKeyerCbCrSetup setTolPieX:indice:](self, "setTolPieX:indice:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3), i);
    LODWORD(v8) = *(_DWORD *)(*((_QWORD *)self->_keyer2DTolPie + 6) + v6 + 4);
    -[PAEKeyerCbCrSetup setTolPieY:indice:](self, "setTolPieY:indice:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8), i);
    LODWORD(v9) = *(_DWORD *)(*((_QWORD *)self->_keyer2DSoftPie + 6) + v6);
    -[PAEKeyerCbCrSetup setSoftPieX:indice:](self, "setSoftPieX:indice:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9), i);
    LODWORD(v10) = *(_DWORD *)(*((_QWORD *)self->_keyer2DSoftPie + 6) + v6 + 4);
    -[PAEKeyerCbCrSetup setSoftPieY:indice:](self, "setSoftPieY:indice:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), i);
    v6 += 8;
  }

  self->_splineVertex = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((int)((*((_QWORD *)self->_keyer2DSatSpline + 1) - *(_QWORD *)self->_keyer2DSatSpline) >> 5) >= 1)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = objc_alloc_init(PAEKeyerOMVertex);
      v14 = (_DWORD *)(*(_QWORD *)self->_keyer2DSatSpline + v11);
      LODWORD(v15) = *v14;
      -[PAEKeyerOMVertex setLx:](v13, "setLx:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15));
      LODWORD(v16) = v14[2];
      -[PAEKeyerOMVertex setMx:](v13, "setMx:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16));
      LODWORD(v17) = v14[4];
      -[PAEKeyerOMVertex setRx:](v13, "setRx:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17));
      LODWORD(v18) = v14[6];
      -[PAEKeyerOMVertex setBx:](v13, "setBx:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18));
      LODWORD(v19) = v14[1];
      -[PAEKeyerOMVertex setLy:](v13, "setLy:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19));
      LODWORD(v20) = v14[3];
      -[PAEKeyerOMVertex setMy:](v13, "setMy:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20));
      LODWORD(v21) = v14[5];
      -[PAEKeyerOMVertex setRy:](v13, "setRy:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21));
      LODWORD(v22) = v14[7];
      -[PAEKeyerOMVertex setBy:](v13, "setBy:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22));
      -[NSMutableArray addObject:](self->_splineVertex, "addObject:", v13);

      ++v12;
      v11 += 32;
    }
    while (v12 < (int)((*((_QWORD *)self->_keyer2DSatSpline + 1) - *(_QWORD *)self->_keyer2DSatSpline) >> 5));
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieX[0], CFSTR("TolPieX_CORNER_L"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieX[1], CFSTR("TolPieX_CORNER_M"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieX[2], CFSTR("TolPieX_CORNER_R"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieX[3], CFSTR("TolPieX_CORNER_LL"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieX[4], CFSTR("TolPieX_CORNER_RR"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieY[0], CFSTR("TolPieY_CORNER_L"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieY[1], CFSTR("TolPieY_CORNER_M"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieY[2], CFSTR("TolPieY_CORNER_R"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieY[3], CFSTR("TolPieY_CORNER_LL"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_tolPieY[4], CFSTR("TolPieY_CORNER_RR"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieX[0], CFSTR("SoftPieX_CORNER_L"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieX[1], CFSTR("SoftPieX_CORNER_M"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieX[2], CFSTR("SoftPieX_CORNER_R"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieX[3], CFSTR("SoftPieX_CORNER_LL"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieX[4], CFSTR("SoftPieX_CORNER_RR"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieY[0], CFSTR("SoftPieY_CORNER_L"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieY[1], CFSTR("SoftPieY_CORNER_M"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieY[2], CFSTR("SoftPieY_CORNER_R"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieY[3], CFSTR("SoftPieY_CORNER_LL"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_softPieY[4], CFSTR("SoftPieY_CORNER_RR"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_splineVertex, CFSTR("SplineVertex"));
}

- (void)setTolPieX:(id)a3 indice:(int)a4
{
  id v7;
  id *v8;

  v7 = a3;
  v8 = (id *)(&self->super.isa + a4);

  v8[1] = a3;
}

- (void)setSoftPieX:(id)a3 indice:(int)a4
{
  id v7;
  id *v8;

  v7 = a3;
  v8 = (id *)(&self->super.isa + a4);

  v8[11] = a3;
}

- (void)setTolPieY:(id)a3 indice:(int)a4
{
  id v7;
  id *v8;

  v7 = a3;
  v8 = (id *)(&self->super.isa + a4);

  v8[6] = a3;
}

- (void)setSoftPieY:(id)a3 indice:(int)a4
{
  id v7;
  id *v8;

  v7 = a3;
  v8 = (id *)(&self->super.isa + a4);

  v8[16] = a3;
}

- (void)getKeyer2DSatSpline
{
  return self->_keyer2DSatSpline;
}

- (void)getKeyer2DTolPie
{
  return self->_keyer2DTolPie;
}

- (void)getKeyer2DSoftPie
{
  return self->_keyer2DSoftPie;
}

- (Vec2f)polarToCartesian:(Vec2f)a3
{
  float *v3;
  float *v4;
  float *v5;
  float v6;
  __float2 v7;
  float v8;
  float v9;
  Vec2f result;

  v5 = v4;
  v6 = *v3;
  v7 = __sincosf_stret(v3[1]);
  v8 = v6 * v7.__cosval;
  v9 = v6 * v7.__sinval;
  *v5 = v6 * v7.__cosval;
  v5[1] = v6 * v7.__sinval;
  result.var0[1] = v8;
  result.var0[0] = v9;
  return result;
}

- (void)interpVec2f:(float)a3 left:(Vec2f)a4 right:(Vec2f)a5 interpolated:(Vec2f *)a6
{
  float32x2_t *v6;
  float32x2_t *v7;

  *v7 = vadd_f32((float32x2_t)*a6, vmul_n_f32(vsub_f32(*v6, (float32x2_t)*a6), a3));
}

- (void)toPolar:(const Vec2f *)a3 polar:(Vec2f *)a4
{
  a4->var0[0] = sqrtf((float)(a3->var0[0] * a3->var0[0]) + (float)(a3->var0[1] * a3->var0[1]));
  a4->var0[1] = atan2f(a3->var0[1], a3->var0[0]);
}

- (void)interpPieWithWeight:(float)a3 currentDirectionCorrection:(float)a4 nextDirectionCorrection:(float)a5 interpolatedCenter:(Vec2f)a6 currentCenter:(Vec2f)a7 currentPolar:(const Vec2f *)a8 nextCenter:(Vec2f)a9 nextPolar:(const Vec2f *)a10 interpolationType:(int)a11 interpolatedPie:(void *)a12
{
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  float v27;
  double v28;
  unsigned int v29;
  int v30;
  float v31;
  int v32;
  float v33;
  float v34;
  _DWORD *v35;
  float v36;
  float v37;
  float v38;
  float v39;
  BOOL v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  char v47;
  _DWORD *v48;
  float v49;
  double v50;
  BOOL v51;
  double v52;
  float v53;
  char v54;
  float v55[2];
  _BYTE v56[4];
  int v57;
  _DWORD v58[2];
  float v59[2];
  uint64_t v60;
  double v61;
  _DWORD v62[2];
  _DWORD v63[2];
  _DWORD v64[2];
  _DWORD v65[2];
  _QWORD v66[2];

  v14 = v13;
  v15 = v12;
  v17 = *(_QWORD *)&a11;
  v24 = 0;
  v25 = a3 <= 0.5;
  v26 = a3 > 0.5;
  if (v13 != 1)
    v26 = 0;
  v27 = a3 + a3;
  v53 = (float)(a3 + -0.5) + (float)(a3 + -0.5);
  if (v13 != 2)
    v25 = 0;
  HIDWORD(v28) = 1075388923;
  v52 = 6.28318531;
  v29 = -3;
  v54 = !v26 && !v25;
  do
  {
    if (v24 == 8)
    {
      v30 = *(_DWORD *)(v15 + 8);
      v31 = *(float *)(v15 + 12);
      if (v14 == 2)
      {
        v32 = 0;
        v33 = *(float *)(v15 + 12);
        *(float *)&v28 = v53;
        if (a3 <= 0.5)
        {
          v49 = a8->var0[1];
          v64[0] = 0;
          *(float *)&v64[1] = v49;
          if (self)
          {
            v35 = v64;
            goto LABEL_37;
          }
LABEL_48:
          v28 = 0.0;
          goto LABEL_49;
        }
      }
      else
      {
        v32 = *(_DWORD *)(v17 + 8);
        v33 = *(float *)(v17 + 12);
        if (v14 == 1)
        {
          v30 = 0;
          v31 = *(float *)(v17 + 12);
          *(float *)&v28 = v27;
          if (a3 > 0.5)
          {
            v34 = a8->var0[1];
            v65[0] = 0;
            *(float *)&v65[1] = v34;
            if (self)
            {
              v35 = v65;
LABEL_37:
              -[PAEKeyerCbCrSetup polarToCartesian:](self, "polarToCartesian:", v35, *(_QWORD *)&v52);
              v28 = *(double *)v66;
LABEL_49:
              *(double *)(*(_QWORD *)(*(_QWORD *)&a9 + 48) + 8) = v28;
              goto LABEL_50;
            }
            goto LABEL_48;
          }
        }
        else
        {
          *(float *)&v28 = a3;
        }
      }
      v50 = vabds_f32(v31, v33);
      v51 = v50 >= 3.14159265;
      if (v31 >= v33)
        v51 = v50 < 3.14159265;
      if (v51)
      {
        if (v31 < v33)
          v31 = v31 + v52;
      }
      else if (v33 < v31)
      {
        v33 = v33 + v52;
      }
      v63[0] = v32;
      *(float *)&v63[1] = v33;
      v62[0] = v30;
      *(float *)&v62[1] = v31;
      -[PAEKeyerCbCrSetup interpVec2f:left:right:interpolated:](self, "interpVec2f:left:right:interpolated:", v63, v62, v66, v28, *(_QWORD *)&v52);
      v60 = v66[0];
      if (self)
      {
        -[PAEKeyerCbCrSetup polarToCartesian:](self, "polarToCartesian:", &v60);
        v28 = v61;
        goto LABEL_49;
      }
      goto LABEL_48;
    }
    v37 = *(float *)(v15 + v24);
    v36 = *(float *)(v15 + v24 + 4);
    v39 = *(float *)(v17 + v24);
    v38 = *(float *)(v17 + v24 + 4);
    if (v14 == 1)
    {
      if (a3 <= 0.5 || v29 > 1)
        goto LABEL_24;
      v38 = *(float *)(v17 + 16 * (v24 != 24) + 4);
      v39 = 0.0;
      *(float *)&v28 = v53;
    }
    else
    {
      if (v14 != 2 || (a3 <= 0.5 ? (v41 = v29 > 1) : (v41 = 1), v41))
      {
LABEL_24:
        *(float *)&v28 = a3;
        goto LABEL_25;
      }
      v36 = *(float *)(v15 + 16 * (v24 != 24) + 4);
      v37 = 0.0;
      *(float *)&v28 = v27;
    }
LABEL_25:
    v42 = (float)(a10->var0[1] - v38) - a4;
    v43 = *(float *)a12 - v37;
    v44 = (float)(*((float *)a12 + 1) - v36) - a5;
    v59[0] = a10->var0[0] - v39;
    v59[1] = v42;
    *(float *)v58 = v43;
    *(float *)&v58[1] = v44;
    -[PAEKeyerCbCrSetup interpVec2f:left:right:interpolated:](self, "interpVec2f:left:right:interpolated:", v59, v58, v66, v28, *(_QWORD *)&v52);
    v45 = a8->var0[0];
    v46 = *(float *)v66;
    v47 = v54;
    if (v29 > 1)
      v47 = 1;
    if ((v47 & 1) != 0)
    {
      *(float *)&v28 = a8->var0[1] - *((float *)v66 + 1);
    }
    else
    {
      v61 = *(double *)(*(_QWORD *)(*(_QWORD *)&a9 + 48) + 16 * (v24 != 24));
      -[PAEKeyerCbCrSetup toPolar:polar:](self, "toPolar:polar:", &v61, v56);
      LODWORD(v28) = v57;
    }
    v55[0] = v45 - v46;
    v55[1] = *(float *)&v28;
    if (self)
    {
      -[PAEKeyerCbCrSetup polarToCartesian:](self, "polarToCartesian:", v55);
      LODWORD(v28) = LODWORD(v61);
    }
    else
    {
      v61 = 0.0;
      LODWORD(v28) = 0;
    }
    v48 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)&a9 + 48) + v24);
    *v48 = LODWORD(v28);
    v48[1] = HIDWORD(v61);
LABEL_50:
    ++v29;
    v24 += 8;
  }
  while (v24 != 40);
}

- (void)pieToPolarForPie:(void *)a3 polar:(Vec2f *)a4
{
  uint64_t i;
  _DWORD *v8;
  float v9;
  float v10;
  float v11;
  _DWORD v12[2];

  for (i = 0; i != 5; ++i)
  {
    v8 = (_DWORD *)(*((_QWORD *)a3 + 6) + i * 8);
    v12[0] = *v8;
    v12[1] = v8[1];
    -[PAEKeyerCbCrSetup toPolar:polar:](self, "toPolar:polar:", v12, &a4[i]);
  }
  v9 = a4[2].var0[1];
  if (a4->var0[1] > v9)
  {
    v10 = v9 + 6.28318531;
    a4[2].var0[1] = v10;
    v11 = a4[4].var0[1] + 6.28318531;
    a4[4].var0[1] = v11;
  }
}

- (void)pieToPolarForPie:(void *)a3 softPie:(void *)a4 tolPolar:(Vec2f *)a5 softPolar:(Vec2f *)a6
{
  -[PAEKeyerCbCrSetup pieToPolarForPie:polar:](self, "pieToPolarForPie:polar:", a3, a5);
  -[PAEKeyerCbCrSetup pieToPolarForPie:polar:](self, "pieToPolarForPie:polar:", a4, a6);
}

- (void)offsetPie:(Vec2f *)a3 offsetDegrees:(float)a4
{
  uint64_t i;

  for (i = 1; i != 11; i += 2)
    a3->var0[i] = a3->var0[i] + a4;
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  PAEKeyerCbCrSetup *v6;
  double v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  float v18;
  float v21;
  double v22;
  BOOL v23;
  int v24;
  int v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  _BYTE *keyer2DSatSpline;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  OMSpline *v36;
  double v38;
  Vec2f v39;
  float v40[2];
  _DWORD v41[2];
  uint64_t v42;
  float v43[2];
  _DWORD v44[2];
  uint64_t v45;
  float v46[2];
  _DWORD v47[2];
  uint64_t v48;
  _BYTE v49[4];
  float v50;
  float v51;
  _BYTE v52[4];
  float v53;
  float v54;
  _DWORD v55[10];
  float v56;
  float v57;
  float v58;
  float v59;
  uint64_t v60;

  v38 = *(double *)&a4;
  v60 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(PAEKeyerCbCrSetup);
  -[PAEKeyerCbCrSetup pieToPolarForPie:softPie:tolPolar:softPolar:](self, "pieToPolarForPie:softPie:tolPolar:softPolar:", self->_keyer2DTolPie, self->_keyer2DSoftPie, &v56, v52);
  -[PAEKeyerCbCrSetup pieToPolarForPie:softPie:tolPolar:softPolar:](self, "pieToPolarForPie:softPie:tolPolar:softPolar:", *((_QWORD *)a3 + 23), *((_QWORD *)a3 + 24), v55, v49);
  v8 = v58;
  v9 = v56;
  v10 = v57 + (float)((float)(v59 - v57) * 0.5);
  v12 = *(float *)&v55[4];
  v11 = *(float *)&v55[5];
  v14 = *(float *)v55;
  v13 = *(float *)&v55[1];
  *(float *)&v15 = v54;
  if (v53 < v10 && v54 < v10)
  {
    LODWORD(v7) = 1086918619;
    goto LABEL_11;
  }
  if (v53 > v10 && v54 > v10)
  {
    LODWORD(v7) = -1060565029;
LABEL_11:
    -[PAEKeyerCbCrSetup offsetPie:offsetDegrees:](self, "offsetPie:offsetDegrees:", v52, v7, v15);
  }
  v18 = v13 + (float)((float)(v11 - v13) * 0.5);
  *(float *)&v15 = v51;
  if (v50 < v18 && v51 < v18)
  {
    LODWORD(v7) = 1086918619;
    goto LABEL_22;
  }
  if (v50 > v18 && v51 > v18)
  {
    LODWORD(v7) = -1060565029;
LABEL_22:
    -[PAEKeyerCbCrSetup offsetPie:offsetDegrees:](self, "offsetPie:offsetDegrees:", v49, v7, v15);
  }
  v21 = v9 + (float)((float)(v8 - v9) * 0.5);
  v22 = vabds_f32(v18, v10);
  if (v18 >= v10)
    v23 = v22 < 3.14159265;
  else
    v23 = v22 >= 3.14159265;
  if (v23)
  {
    v24 = 0;
    if (v18 < v10)
    {
      v18 = v18 + 6.28318531;
      v25 = 1086918619;
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
    if (v10 >= v18)
    {
      v24 = 0;
    }
    else
    {
      v10 = v10 + 6.28318531;
      v24 = 1086918619;
    }
  }
  *(float *)v47 = v21;
  *(float *)&v47[1] = v10;
  v46[0] = v14 + (float)((float)(v12 - v14) * 0.5);
  v46[1] = v18;
  -[PAEKeyerCbCrSetup interpVec2f:left:right:interpolated:](self, "interpVec2f:left:right:interpolated:", v47, v46, &v48, v38);
  if (OMPie::isQuadActive((OMPie *)((char *)self->_keyer2DTolPie + 8))
    || !OMPie::isQuadActive((OMPie *)(*((_QWORD *)a3 + 23) + 8)))
  {
    if (OMPie::isQuadActive((OMPie *)(*((_QWORD *)a3 + 23) + 8)))
    {
      v28 = 0;
    }
    else if (OMPie::isQuadActive((OMPie *)((char *)self->_keyer2DTolPie + 8)))
    {
      v28 = 2;
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = 1;
  }
  v45 = v48;
  *(float *)v44 = v21;
  *(float *)&v44[1] = v10;
  v43[0] = v14 + (float)((float)(v12 - v14) * 0.5);
  v43[1] = v18;
  LODWORD(v26) = v24;
  LODWORD(v27) = v25;
  -[PAEKeyerCbCrSetup interpPieWithWeight:currentDirectionCorrection:nextDirectionCorrection:interpolatedCenter:currentCenter:currentPolar:nextCenter:nextPolar:interpolationType:interpolatedPie:](self, "interpPieWithWeight:currentDirectionCorrection:nextDirectionCorrection:interpolatedCenter:currentCenter:currentPolar:nextCenter:nextPolar:interpolationType:interpolatedPie:", &v45, v44, &v56, v43, v55, v28, v38, v26, v27, v6->_keyer2DTolPie);
  if (OMPie::isQuadActive((OMPie *)((char *)self->_keyer2DSoftPie + 8))
    || !OMPie::isQuadActive((OMPie *)(*((_QWORD *)a3 + 24) + 8)))
  {
    if (OMPie::isQuadActive((OMPie *)(*((_QWORD *)a3 + 24) + 8)))
    {
      v31 = 0;
    }
    else if (OMPie::isQuadActive((OMPie *)((char *)self->_keyer2DSoftPie + 8)))
    {
      v31 = 2;
    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    v31 = 1;
  }
  v42 = v48;
  *(float *)v41 = v21;
  *(float *)&v41[1] = v10;
  v40[0] = v14 + (float)((float)(v12 - v14) * 0.5);
  v40[1] = v18;
  LODWORD(v29) = v24;
  LODWORD(v30) = v25;
  -[PAEKeyerCbCrSetup interpPieWithWeight:currentDirectionCorrection:nextDirectionCorrection:interpolatedCenter:currentCenter:currentPolar:nextCenter:nextPolar:interpolationType:interpolatedPie:](self, "interpPieWithWeight:currentDirectionCorrection:nextDirectionCorrection:interpolatedCenter:currentCenter:currentPolar:nextCenter:nextPolar:interpolationType:interpolatedPie:", &v42, v41, v52, v40, v49, v31, v38, v29, v30, v6->_keyer2DSoftPie);
  keyer2DSatSpline = v6->_keyer2DSatSpline;
  keyer2DSatSpline[33] = 1;
  *((_DWORD *)keyer2DSatSpline + 6) = 0;
  *((_QWORD *)keyer2DSatSpline + 1) = *(_QWORD *)keyer2DSatSpline;
  v33 = *(_QWORD *)self->_keyer2DSatSpline;
  if ((int)((unint64_t)(*((_QWORD *)self->_keyer2DSatSpline + 1) - v33) >> 5) >= 1)
  {
    v34 = 0;
    v35 = 24;
    do
    {
      v36 = (OMSpline *)v6->_keyer2DSatSpline;
      v39 = (Vec2f)vadd_f32(vmul_n_f32(*(float32x2_t *)(v33 + v35), 1.0 - *(float *)&v38), vmul_n_f32(*(float32x2_t *)(**((_QWORD **)a3 + 22) + v35), *(float *)&v38));
      OMSpline::addVertexAtEnd(v36, &v39);
      ++v34;
      v33 = *(_QWORD *)self->_keyer2DSatSpline;
      v35 += 32;
    }
    while (v34 < (int)((unint64_t)(*((_QWORD *)self->_keyer2DSatSpline + 1) - v33) >> 5));
  }
  return v6;
}

- (BOOL)isEqualTo:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t *keyer2DSatSpline;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  float *v12;
  float *v13;
  _BOOL4 v14;
  BOOL v16;

  v3 = *((_QWORD *)self->_keyer2DTolPie + 6);
  v4 = *(_QWORD *)(*((_QWORD *)a3 + 23) + 48);
  for (i = 4; i != 44; i += 8)
  {
    if (*(float *)(v3 + i - 4) == *(float *)(v4 + i - 4) && *(float *)(v3 + i) == *(float *)(v4 + i))
    {
      v6 = *((_QWORD *)self->_keyer2DSoftPie + 6);
      v7 = *(_QWORD *)(*((_QWORD *)a3 + 24) + 48);
      if (*(float *)(v6 + i - 4) == *(float *)(v7 + i - 4) && *(float *)(v6 + i) == *(float *)(v7 + i))
        continue;
    }
    LOBYTE(v14) = 0;
    return v14;
  }
  keyer2DSatSpline = (uint64_t *)self->_keyer2DSatSpline;
  v9 = *keyer2DSatSpline;
  v10 = keyer2DSatSpline[1] - *keyer2DSatSpline;
  if ((int)(v10 >> 5) < 1)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    v11 = (v10 >> 5) - 1;
    v12 = (float *)(v9 + 28);
    v13 = (float *)(**((_QWORD **)a3 + 22) + 28);
    do
    {
      v14 = *v12 == *v13 && *(v12 - 1) == *(v13 - 1);
      v16 = v11-- != 0;
      if (!v14)
        break;
      v12 += 8;
      v13 += 8;
    }
    while (v16);
  }
  return v14;
}

@end

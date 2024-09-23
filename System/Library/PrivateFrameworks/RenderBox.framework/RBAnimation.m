@implementation RBAnimation

- (uint64_t)rb_animation
{
  if (a1)
    return a1 + 8;
  else
    return 0;
}

- (_DWORD)setRBAnimation:(_DWORD *)result
{
  _DWORD *v2;
  _DWORD *v3;
  int *v4;
  unsigned int v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  unsigned int v9;
  int v10;
  int v11;

  if (result)
  {
    v2 = result;
    v3 = result + 2;
    result[10] = 0;
    if (*(_QWORD *)(a2 + 24))
      v4 = *(int **)(a2 + 24);
    else
      v4 = (int *)a2;
    v5 = *(_DWORD *)(a2 + 32);
    if (result[11] < v5)
    {
      result = RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(result + 2, *(_DWORD *)(a2 + 32));
      v6 = v2[10];
    }
    else
    {
      if (!v5)
      {
        v11 = 0;
LABEL_14:
        v2[10] = v11 + v5;
        return result;
      }
      v6 = 0;
    }
    v7 = (_DWORD *)*((_QWORD *)v2 + 4);
    if (!v7)
      v7 = v3;
    v8 = &v7[v6];
    v9 = v5;
    do
    {
      v10 = *v4++;
      *v8++ = v10;
      --v9;
    }
    while (v9);
    v11 = v2[10];
    goto LABEL_14;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  _DWORD *v5;
  _DWORD *v6;
  int *p_2;
  unsigned int isa;
  unsigned int v9;
  uint64_t v10;
  _DWORD *v11;
  _DWORD *v12;
  int v13;
  int v14;

  v4 = (_DWORD *)objc_opt_new();
  v5 = v4;
  v6 = v4 + 2;
  v4[10] = 0;
  if (self->_animation.terms_and_args._p_2)
    p_2 = (int *)self->_animation.terms_and_args._p_2;
  else
    p_2 = (int *)&self->_animation;
  isa = self[1].super.isa;
  v9 = isa;
  if (v4[11] < isa)
  {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(v4 + 2, isa);
    v10 = v5[10];
  }
  else
  {
    if (!isa)
    {
      v14 = 0;
      goto LABEL_13;
    }
    v10 = 0;
  }
  v11 = (_DWORD *)*((_QWORD *)v5 + 4);
  if (!v11)
    v11 = v6;
  v12 = &v11[v10];
  do
  {
    v13 = *p_2++;
    *v12++ = v13;
    --v9;
  }
  while (v9);
  v14 = v5[10];
LABEL_13:
  v5[10] = v14 + isa;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && RB::Animation::operator==((uint64_t)&self->_animation, (uint64_t)a3 + 8);
}

- (double)activeDuration
{
  void *p_animation;

  p_animation = &self->_animation;
  if (self->_animation.terms_and_args._p_2)
    p_animation = self->_animation.terms_and_args._p_2;
  return RB::Animation::active_duration((uint64_t)p_animation, LODWORD(self[1].super.isa));
}

- (float)evaluateAtTime:(double)a3
{
  Animation *p_animation;
  void *p_2;
  double v7;
  double v8;
  TermOrArg)"_size"I"_capacity"I *v9;
  float result;
  int32x2_t v11[3];

  p_animation = &self->_animation;
  if (self->_animation.terms_and_args._p_2)
    p_2 = self->_animation.terms_and_args._p_2;
  else
    p_2 = &self->_animation;
  RB::Animation::prepare((uint64_t)p_2, LODWORD(self[1].super.isa), (uint64_t)v11);
  if (self->_animation.terms_and_args._p_2)
    v9 = self->_animation.terms_and_args._p_2;
  else
    v9 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  *(float *)&v7 = a3;
  RB::Animation::eval((uint64_t)v9, LODWORD(self[1].super.isa), v11, v7, v8);
  return result;
}

- (void)removeAll
{
  LODWORD(self[1].super.isa) = 0;
}

- (void)addPreset:(unsigned int)a3 duration:(double)a4
{
  uint64_t v4;
  char *p_animation;
  unsigned int isa;
  unsigned int v7;
  char *v8;
  float v9;
  Animation *v10;
  uint64_t v11;
  double v12;
  RBAnimation *v13;
  unsigned int v14;

  if (a3 <= 0xA)
  {
    v4 = a3;
    p_animation = (char *)&self->_animation;
    isa = self[1].super.isa;
    v7 = isa + 2;
    if (isa <= 0xFFFFFFFD && HIDWORD(self[1].super.isa) < v7)
    {
      v13 = self;
      v14 = isa + 2;
      v12 = a4;
      v10 = &self->_animation;
      v11 = a3;
      RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v7);
      p_animation = (char *)v10;
      v4 = v11;
      v7 = v14;
      self = v13;
      a4 = v12;
    }
    LODWORD(self[1].super.isa) = v7;
    if (self->_animation.terms_and_args._p_2)
      p_animation = (char *)self->_animation.terms_and_args._p_2;
    v8 = &p_animation[4 * v7];
    *((_DWORD *)v8 - 2) = -[RBAnimation addPreset:duration:]::terms[v4];
    v9 = a4;
    *((float *)v8 - 1) = v9;
  }
}

- (void)addBezierDuration:(double)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  float x;
  _BOOL4 v6;
  float v7;
  _BOOL4 v8;
  char v11;
  uint64_t v12;
  char *p_animation;
  unsigned int isa;
  unsigned int v15;
  char *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  CGFloat y;
  Animation *v22;
  float v23;
  CGFloat v24;
  double v25;
  RBAnimation *v26;
  unsigned int v27;

  x = a4.x;
  v6 = fabsf(x + -0.42) < 0.005;
  if (a4.y != 0.0)
    v6 = 0;
  v7 = a5.x;
  v8 = fabsf(v7 + -0.58) < 0.005;
  if (a5.y != 1.0)
    v8 = 0;
  if (v6 && v8)
  {
    v12 = 4;
LABEL_22:
    -[RBAnimation addPreset:duration:](self, "addPreset:duration:", v12, a3);
    return;
  }
  if (a5.x != 1.0)
    v6 = 0;
  if (v6 && a5.y == 1.0)
  {
    v12 = 2;
    goto LABEL_22;
  }
  v11 = !v8;
  if (a4.x != 0.0)
    v11 = 1;
  if ((v11 & 1) == 0 && a4.y == 0.0)
  {
    v12 = 3;
    goto LABEL_22;
  }
  p_animation = (char *)&self->_animation;
  isa = self[1].super.isa;
  v15 = isa + 6;
  if (isa <= 0xFFFFFFF9 && HIDWORD(self[1].super.isa) < v15)
  {
    v26 = self;
    v27 = isa + 6;
    v25 = a3;
    y = a5.y;
    v24 = a4.y;
    v22 = &self->_animation;
    v23 = a4.x;
    v20 = a5.x;
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v15);
    v7 = v20;
    x = v23;
    v15 = v27;
    p_animation = (char *)v22;
    self = v26;
    a4.y = v24;
    a5.y = y;
    a3 = v25;
  }
  LODWORD(self[1].super.isa) = v15;
  if (self->_animation.terms_and_args._p_2)
    p_animation = (char *)self->_animation.terms_and_args._p_2;
  v16 = &p_animation[4 * v15];
  *((_DWORD *)v16 - 6) = 8;
  v17 = a3;
  *((float *)v16 - 5) = v17;
  *((float *)v16 - 4) = x;
  v18 = a4.y;
  *((float *)v16 - 3) = v18;
  *((float *)v16 - 2) = v7;
  v19 = a5.y;
  *((float *)v16 - 1) = v19;
}

- (void)addSpringDuration:(double)a3 mass:(double)a4 stiffness:(double)a5 damping:(double)a6 initialVelocity:(double)a7
{
  int v13;
  unsigned int v14;
  Animation *p_animation;
  unsigned int isa;
  unsigned int v17;
  TermOrArg)"_size"I"_capacity"I *p_2;
  uint64_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;

  if (a7 == 0.0)
    v13 = 9;
  else
    v13 = 10;
  if (a7 == 0.0)
    v14 = 5;
  else
    v14 = 6;
  p_animation = &self->_animation;
  isa = self[1].super.isa;
  v17 = isa + v14;
  if (isa < isa + v14 && HIDWORD(self[1].super.isa) < v17)
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v17);
  LODWORD(self[1].super.isa) = v17;
  p_2 = self->_animation.terms_and_args._p_2;
  if (!p_2)
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  v19 = (uint64_t)p_2 + 4 * v17 + -4 * v14;
  *(_DWORD *)v19 = v13;
  v20 = a3;
  v21 = a4;
  *(float *)(v19 + 4) = v20;
  *(float *)(v19 + 8) = v21;
  v22 = a5;
  v23 = a6;
  *(float *)(v19 + 12) = v22;
  *(float *)(v19 + 16) = v23;
  if (a7 != 0.0)
  {
    v24 = a7;
    *(float *)(v19 + 20) = v24;
  }
}

- (void)addSampledFunctionWithDuration:(double)a3 count:(unint64_t)a4 values:(const float *)a5
{
  int v9;
  int v10;
  Animation *p_animation;
  unsigned int isa;
  uint64_t v13;
  TermOrArg)"_size"I"_capacity"I *p_2;
  uint64_t v15;
  float v16;
  unint64_t v17;
  _DWORD *v18;
  int v19;

  v9 = 2 * a4;
  v10 = 2 * a4 + 3;
  p_animation = &self->_animation;
  isa = self[1].super.isa;
  v13 = isa + v10;
  if (isa < v13 && HIDWORD(self[1].super.isa) < v13)
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v13);
  LODWORD(self[1].super.isa) = v13;
  if (self->_animation.terms_and_args._p_2)
    p_2 = self->_animation.terms_and_args._p_2;
  else
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  v15 = (uint64_t)p_2 + 4 * v13 + -4 * v10;
  *(_DWORD *)v15 = 18;
  *(_DWORD *)(v15 + 4) = a4;
  v16 = a3;
  *(float *)(v15 + 8) = v16;
  v17 = 2 * a4;
  if (2 * a4)
  {
    v18 = (_DWORD *)((char *)p_2 + 4 * v13 + -4 * (v9 + 2) + 8);
    do
    {
      v19 = *(_DWORD *)a5++;
      *v18++ = v19;
      --v17;
    }
    while (v17);
  }
}

- (void)addSpeed:(double)a3
{
  Animation *p_animation;
  unsigned int isa;
  unsigned int v7;
  TermOrArg)"_size"I"_capacity"I *p_2;
  char *v9;
  float v10;

  p_animation = &self->_animation;
  isa = self[1].super.isa;
  v7 = isa + 2;
  if (isa <= 0xFFFFFFFD && HIDWORD(self[1].super.isa) < v7)
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v7);
  LODWORD(self[1].super.isa) = v7;
  p_2 = self->_animation.terms_and_args._p_2;
  if (!p_2)
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  v9 = (char *)p_2 + 4 * v7;
  *((_DWORD *)v9 - 2) = 11;
  v10 = a3;
  *((float *)v9 - 1) = v10;
}

- (void)addDelay:(double)a3
{
  Animation *p_animation;
  unsigned int isa;
  unsigned int v7;
  TermOrArg)"_size"I"_capacity"I *p_2;
  char *v9;
  float v10;

  p_animation = &self->_animation;
  isa = self[1].super.isa;
  v7 = isa + 2;
  if (isa <= 0xFFFFFFFD && HIDWORD(self[1].super.isa) < v7)
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v7);
  LODWORD(self[1].super.isa) = v7;
  p_2 = self->_animation.terms_and_args._p_2;
  if (!p_2)
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  v9 = (char *)p_2 + 4 * v7;
  *((_DWORD *)v9 - 2) = 12;
  v10 = a3;
  *((float *)v9 - 1) = v10;
}

- (void)addRepeatCount:(double)a3 autoreverses:(BOOL)a4
{
  _BOOL4 v4;
  Animation *p_animation;
  unsigned int isa;
  unsigned int v9;
  TermOrArg)"_size"I"_capacity"I *p_2;
  char *v11;
  int v12;
  float v13;

  v4 = a4;
  p_animation = &self->_animation;
  isa = self[1].super.isa;
  v9 = isa + 2;
  if (isa <= 0xFFFFFFFD && HIDWORD(self[1].super.isa) < v9)
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v9);
  LODWORD(self[1].super.isa) = v9;
  p_2 = self->_animation.terms_and_args._p_2;
  if (!p_2)
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  v11 = (char *)p_2 + 4 * v9;
  if (v4)
    v12 = 14;
  else
    v12 = 13;
  *((_DWORD *)v11 - 2) = v12;
  v13 = a3;
  *((float *)v11 - 1) = v13;
}

- (void).cxx_destruct
{
  TermOrArg)"_size"I"_capacity"I *p_2;

  p_2 = self->_animation.terms_and_args._p_2;
  if (p_2)
    free(p_2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0x600000000;
  return self;
}

@end

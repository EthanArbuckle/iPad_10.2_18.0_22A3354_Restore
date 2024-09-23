@implementation _UIVelocityIntegrator

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (BOOL)hasVelocity
{
  __int128 v3;
  __int128 v4;

  v3 = 0u;
  v4 = 0u;
  -[_UIVelocityIntegrator _velocity3D](&v3, (uint64_t)self);
  return fabs(*(double *)&v3) >= 2.22044605e-16
      || fabs(*((double *)&v3 + 1)) >= 2.22044605e-16
      || fabs(*(double *)&v4) >= 2.22044605e-16;
}

- (void)_velocity3D
{
  float64x2_t v4;
  uint64_t v5;
  double v6;
  float64x2_t v7;
  __int128 v8;

  if (a2)
  {
    if (!*(_BYTE *)(a2 + 56))
    {
      v4 = 0uLL;
      v5 = 0;
      if (*(_QWORD *)(a2 + 48) >= 2uLL)
      {
        v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) + 8 * (*(_QWORD *)(a2 + 40) / 0x33uLL))
                       + 80 * (*(_QWORD *)(a2 + 40) % 0x33uLL));
        v7.f64[0] = CACurrentMediaTime();
        v5 = 0;
        v4 = 0uLL;
        v7.f64[0] = v7.f64[0] - v6;
        if (v7.f64[0] > 0.0)
        {
          v7.f64[0] = 1.0 / v7.f64[0];
          v4 = vmulq_n_f64(*(float64x2_t *)(a2 + 112), v7.f64[0]);
          v5 = *(_OWORD *)&vmulq_f64(v7, *(float64x2_t *)(a2 + 128));
        }
      }
      *(float64x2_t *)(a2 + 144) = v4;
      *(_QWORD *)(a2 + 160) = v5;
      *(_QWORD *)(a2 + 168) = 0;
      *(_BYTE *)(a2 + 56) = 1;
    }
    v8 = *(_OWORD *)(a2 + 160);
    *a1 = *(_OWORD *)(a2 + 144);
    a1[1] = v8;
  }
  else
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
}

- (void)addSample:(CGPoint)a3
{
  CGPoint v3[2];

  v3[0] = a3;
  v3[1] = (CGPoint)xmmword_18666F250;
  -[_UIVelocityIntegrator addSample3D:](self, "addSample3D:", v3);
}

- (void)addSample3D:(id)a3
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  deque<_UIVelocityIntegratorDataSample, std::allocator<_UIVelocityIntegratorDataSample>> *p_samples;
  unint64_t value;
  float64x2_t *v13;
  double v14;
  double v15;
  double v16;
  double minimumRequiredMovement;
  double v18;
  BOOL v19;
  double v20;
  double v22;
  float64_t v23;
  double v24;
  double *v25;
  double hysteresisTimeInterval;
  double v27;
  double resetHysteresisOnSampleThetaDiff;
  double *v30;
  double v31;
  double v32;
  void (**didResetHysteresisOnThetaDiffHandler)(void);
  double v34;
  _UIVelocityIntegratorDataSample **begin;
  unint64_t v36;
  unint64_t start;
  _UIVelocityIntegratorDataSample **v38;
  _BYTE *v39;
  double *v40;
  unint64_t v41;
  uint64_t v42;
  double *v43;
  double padding;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  unint64_t v49;
  _UIVelocityIntegratorDataSample **end;
  _UIVelocityIntegratorDataSample **v51;
  char **v52;
  char *v53;
  double *v54;
  char *v55;
  _UIVelocityIntegratorDataSample **v56;
  double *v57;
  double *v58;
  char *v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  void **v64;
  char *v65;
  char *v66;
  _UIVelocityIntegratorDataSample **v67;
  _BYTE *v68;
  char **v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  _UIVelocityIntegratorDataSample **v74;
  _BYTE *v75;
  uint64_t v76;
  _UIVelocityIntegratorDataSample *v77;
  int64_t v78;
  unint64_t v79;
  _BYTE *v80;
  unint64_t v81;
  char *v82;
  _BYTE *v83;
  double v84;
  deque<_UIVelocityIntegratorDataSample, std::allocator<_UIVelocityIntegratorDataSample>> *v85;
  _UIVelocityIntegrator *v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  double v90;
  _UIVelocityIntegratorDataSample **v91;
  _UIVelocityIntegratorDataSample **v92;
  char *v93;
  char *v94;
  _QWORD v95[6];
  __int128 v96;
  __int128 v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = *(double *)v3;
  v6 = *(double *)(v3 + 8);
  v7 = *(double *)(v3 + 16);
  v8 = *(_QWORD *)(v3 + 24);
  v9 = CACurrentMediaTime();
  if (self)
  {
    v10 = v9;
    p_samples = &self->_samples;
    value = self->_samples.__size_.__value_;
    if (value)
    {
      v13 = (float64x2_t *)((char *)self->_samples.__map_.__begin_[(self->_samples.__start_ + value - 1) / 0x33]
                          + 80 * ((self->_samples.__start_ + value - 1) % 0x33));
      v14 = v13[1].f64[0];
      v15 = v13[1].f64[1];
      v16 = v13[2].f64[0];
      minimumRequiredMovement = self->_minimumRequiredMovement;
      v18 = vabdd_f64(v15, v6);
      v19 = vabdd_f64(v14, v5) < minimumRequiredMovement && v18 < minimumRequiredMovement;
      v20 = vabdd_f64(v16, v7);
      if (v19 && v20 < minimumRequiredMovement)
      {
        v13->f64[0] = v10;
        return;
      }
      v22 = v13->f64[0];
      if (v10 - v13->f64[0] <= 0.0)
      {
        v23 = v13[2].f64[0];
        v24 = v13[4].f64[0];
        *(float64x2_t *)&self->_totalTranslation.var0.x = vsubq_f64(*(float64x2_t *)&self->_totalTranslation.var0.x, v13[3]);
        self->_totalTranslation.var0.z = self->_totalTranslation.var0.z - v24;
        self->_samples.__size_.__value_ = value - 1;
        std::deque<_UIVelocityIntegratorDataSample>::__maybe_remove_back_spare[abi:nn180100](&self->_samples.__map_.__first_);
        value = self->_samples.__size_.__value_;
        if (value)
        {
          v25 = (double *)((char *)self->_samples.__map_.__begin_[(value + self->_samples.__start_ - 1) / 0x33]
                         + 80 * ((value + self->_samples.__start_ - 1) % 0x33));
          v22 = *v25;
          v14 = v25[2];
          v15 = v25[3];
          v16 = v25[4];
        }
        else
        {
          v16 = v23;
        }
      }
    }
    else
    {
      v22 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      v16 = 0.0;
    }
    *(double *)&v95[3] = v6;
    *(double *)&v95[4] = v7;
    v95[5] = v8;
    *(double *)&v95[2] = v5;
    *(double *)v95 = v10;
    v96 = 0u;
    v97 = 0u;
    hysteresisTimeInterval = self->_hysteresisTimeInterval;
    v27 = v10 - v22;
    if (hysteresisTimeInterval != 0.0 && v27 > hysteresisTimeInterval)
    {
      -[_UIVelocityIntegrator reset](self, "reset", v27);
LABEL_25:
      std::deque<_UIVelocityIntegratorDataSample>::push_back(&self->_samples.__map_.__first_, (uint64_t)v95);
      *(_OWORD *)&self->_totalTranslation.var0.x = 0u;
      *(_OWORD *)&self->_totalTranslation.var0.z = 0u;
LABEL_26:
      self->_hasMemoizedVelocity = 0;
      return;
    }
    if (v22 == 0.0)
      goto LABEL_25;
    if (value < 2
      || (resetHysteresisOnSampleThetaDiff = self->_resetHysteresisOnSampleThetaDiff,
          resetHysteresisOnSampleThetaDiff == 0.0))
    {
LABEL_36:
      v34 = v7 - v16;
      *(double *)&v96 = v5 - v14;
      *((double *)&v96 + 1) = v6 - v15;
      v97 = *(unint64_t *)&v34;
      if (hysteresisTimeInterval == 0.0)
      {
        v42 = 0;
        v36 = self->_samples.__size_.__value_;
      }
      else
      {
        begin = self->_samples.__map_.__begin_;
        v36 = self->_samples.__size_.__value_;
        if (self->_samples.__map_.__end_ == begin
          || (start = self->_samples.__start_,
              v38 = &begin[start / 0x33],
              v39 = *v38,
              v40 = (double *)((char *)*v38 + 80 * (start % 0x33)),
              v41 = (unint64_t)begin[(start + v36) / 0x33] + 80 * ((start + v36) % 0x33),
              v40 == (double *)v41))
        {
          v42 = 0;
        }
        else
        {
          v42 = 0;
          do
          {
            if (v10 - *v40 <= hysteresisTimeInterval)
              break;
            v40 += 10;
            if ((char *)v40 - v39 == 4080)
            {
              v43 = (double *)v38[1];
              ++v38;
              v39 = v43;
              v40 = v43;
            }
            ++v42;
          }
          while (v40 != (double *)v41);
        }
      }
      padding = self->_totalTranslation.var0._padding;
      v45 = v5 - v14 + self->_totalTranslation.var0.x;
      v46 = v6 - v15 + self->_totalTranslation.var0.y;
      v47 = v34 + self->_totalTranslation.var0.z;
      if (v36 - v42 < self->_maxNumberOfSamples)
        v48 = v42;
      else
        v48 = v42 + 1;
      if (v48)
      {
        v49 = self->_samples.__start_;
        v51 = self->_samples.__map_.__begin_;
        end = self->_samples.__map_.__end_;
        v52 = (char **)&v51[v49 / 0x33];
        v53 = *v52;
        if (end == v51)
          v54 = 0;
        else
          v54 = (double *)&v53[80 * (v49 % 0x33)];
        v55 = *v52;
        v56 = &v51[v49 / 0x33];
        do
        {
          v57 = v54 + 10;
          if ((char *)(v54 + 10) - v55 == 4080)
          {
            v58 = (double *)v56[1];
            ++v56;
            v55 = (char *)v58;
            v57 = v58;
          }
          v45 = v45 - v54[6];
          v46 = v46 - v54[7];
          v47 = v47 - v54[8];
          v54 = v57;
          --v48;
        }
        while (v48);
        if (end == v51)
          v59 = 0;
        else
          v59 = &v53[80 * (v49 % 0x33)];
        if (v57 == (double *)v59)
          v60 = 0;
        else
          v60 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v57 - v55) >> 4)
              + 51 * (((char *)v56 - (char *)v52) >> 3)
              + 0x3333333333333333 * ((v59 - v53) >> 4);
        v89 = v60;
        if (end == v51)
          v61 = 0;
        else
          v61 = &v53[80 * (v49 % 0x33)];
        if (v59 == v61)
          v62 = 0;
        else
          v62 = 0xCCCCCCCCCCCCCCCDLL * ((v59 - v53) >> 4) + 0x3333333333333333 * ((v61 - v53) >> 4);
        v92 = &v51[v49 / 0x33];
        v93 = v61;
        std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample*,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample**,long,51l>::operator+=[abi:nn180100](&v92, v62);
        if (v89 >= 1)
        {
          v84 = padding;
          v85 = &self->_samples;
          v63 = v62;
          v64 = (void **)v92;
          v65 = v93;
          v86 = self;
          v87 = v63;
          if (v63 <= (v36 - v89) >> 1)
          {
            std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample*,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample**,long,51l>::operator+=[abi:nn180100](&v92, v89);
            if (v52 == (char **)v64)
            {
              std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v61, v65, v92, v93);
              p_samples = &self->_samples;
              padding = v84;
            }
            else
            {
              v70 = (char *)*v64;
              v69 = (char **)(v64 - 1);
              std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v70, v65, v92, v93);
              v71 = v93;
              v72 = v94;
              if (v69 == v52)
              {
                p_samples = &self->_samples;
                padding = v84;
              }
              else
              {
                p_samples = &self->_samples;
                padding = v84;
                do
                {
                  v73 = *v69--;
                  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v73, v73 + 4080, v71, v72);
                  v71 = v93;
                  v72 = v94;
                }
                while (v69 != v52);
              }
              std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v61, *v52 + 4080, v71, v72);
            }
            v62 = v87;
            v81 = self->_samples.__size_.__value_ - v89;
            v49 = self->_samples.__start_ + v89;
            self->_samples.__start_ = v49;
            self->_samples.__size_.__value_ = v81;
            v51 = self->_samples.__map_.__begin_;
            if (v49 >= 0x66)
            {
              do
              {
                operator delete(*v51);
                v51 = self->_samples.__map_.__begin_ + 1;
                self->_samples.__map_.__begin_ = v51;
                v49 = self->_samples.__start_ - 51;
                self->_samples.__start_ = v49;
              }
              while (v49 > 0x65);
            }
          }
          else
          {
            std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample*,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample**,long,51l>::operator+=[abi:nn180100](&v92, v89);
            v66 = v93;
            v67 = &v51[(v49 + v36) / 0x33];
            if (end == v51)
              v68 = 0;
            else
              v68 = (char *)*v67 + 80 * ((v49 + v36) % 0x33);
            if (v67 != v92)
            {
              v74 = v92 + 1;
              std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v93, (_BYTE *)*v92 + 4080, v64, v65);
              v64 = (void **)v93;
              v65 = v94;
              if (v74 != v67)
              {
                v83 = v68;
                v75 = *(_BYTE **)v93;
                v91 = &v51[(v49 + v36) / 0x33];
                do
                {
                  v76 = 0;
                  v77 = *v74;
                  for (++v64; ; ++v64)
                  {
                    v78 = 0xCCCCCCCCCCCCCCCDLL * ((v75 - v65 + 4080) >> 4);
                    if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((4080 - 80 * v76) >> 4)) >= v78)
                      v79 = v78;
                    else
                      v79 = 0xCCCCCCCCCCCCCCCDLL * ((4080 - 80 * v76) >> 4);
                    if (v79)
                      memmove(v65, (char *)v77 + 80 * v76, 80 * v79);
                    v76 += v79;
                    if (v76 == 51)
                      break;
                    v80 = *v64;
                    v75 = v80;
                    v65 = v80;
                  }
                  v65 += 80 * v79;
                  v75 = *(v64 - 1);
                  if (v75 + 4080 == v65)
                  {
                    v75 = *v64;
                    v65 = (char *)*v64;
                  }
                  else
                  {
                    --v64;
                  }
                  v67 = v91;
                  ++v74;
                }
                while (v74 != v91);
                v68 = v83;
              }
              v66 = (char *)*v67;
            }
            std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<_UIVelocityIntegratorDataSample *,std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample *,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample **,long,51l>,0>(&v92, v66, v68, v64, v65);
            p_samples = v85;
            self = v86;
            v62 = v87;
            v86->_samples.__size_.__value_ -= v89;
            padding = v84;
            while (std::deque<_UIVelocityIntegratorDataSample>::__maybe_remove_back_spare[abi:nn180100](v85))
              ;
            v51 = v86->_samples.__map_.__begin_;
            v49 = v86->_samples.__start_;
          }
        }
        if (self->_samples.__map_.__end_ == v51)
          v82 = 0;
        else
          v82 = (char *)v51[v49 / 0x33] + 80 * (v49 % 0x33);
        v92 = &v51[v49 / 0x33];
        v93 = v82;
        std::__deque_iterator<_UIVelocityIntegratorDataSample,_UIVelocityIntegratorDataSample*,_UIVelocityIntegratorDataSample&,_UIVelocityIntegratorDataSample**,long,51l>::operator+=[abi:nn180100](&v92, v62);
      }
      std::deque<_UIVelocityIntegratorDataSample>::push_back(p_samples, (uint64_t)v95);
      self->_totalTranslation.var0.x = v45;
      self->_totalTranslation.var0.y = v46;
      self->_totalTranslation.var0.z = v47;
      self->_totalTranslation.var0._padding = padding;
      goto LABEL_26;
    }
    v90 = v16;
    v30 = (double *)((char *)self->_samples.__map_.__begin_[self->_samples.__start_ / 0x33]
                   + 80 * (self->_samples.__start_ % 0x33));
    v88 = atan2(v30[3] - v15, v30[2] - v14);
    v31 = atan2(v15 - v6, v14 - v5) - v88;
    if (v31 <= 3.14159265)
    {
      if (v31 >= -3.14159265)
        goto LABEL_32;
      v32 = 6.28318531;
    }
    else
    {
      v32 = -6.28318531;
    }
    v31 = v31 + v32;
LABEL_32:
    v16 = v90;
    if (resetHysteresisOnSampleThetaDiff < fabs(v31))
    {
      didResetHysteresisOnThetaDiffHandler = (void (**)(void))self->_didResetHysteresisOnThetaDiffHandler;
      if (didResetHysteresisOnThetaDiffHandler)
        didResetHysteresisOnThetaDiffHandler[2]();
      -[_UIVelocityIntegrator reset](self, "reset");
      hysteresisTimeInterval = self->_hysteresisTimeInterval;
      v16 = v90;
    }
    goto LABEL_36;
  }
}

- (CGVector)velocity
{
  double v2;
  double v3;
  _OWORD v4[2];
  CGVector result;

  memset(v4, 0, sizeof(v4));
  -[_UIVelocityIntegrator _velocity3D](v4, (uint64_t)self);
  v3 = *((double *)v4 + 1);
  v2 = *(double *)v4;
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (void)setHysteresisTimeInterval:(double)a3
{
  self->_hysteresisTimeInterval = a3;
}

- (void)reset
{
  _UIVelocityIntegratorDataSample **begin;
  _UIVelocityIntegratorDataSample **end;
  unint64_t v5;
  _UIVelocityIntegratorDataSample **v6;
  unint64_t v7;

  begin = self->_samples.__map_.__begin_;
  end = self->_samples.__map_.__end_;
  self->_samples.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      v6 = self->_samples.__map_.__end_;
      begin = self->_samples.__map_.__begin_ + 1;
      self->_samples.__map_.__begin_ = begin;
      v5 = (char *)v6 - (char *)begin;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    v7 = 25;
    goto LABEL_7;
  }
  if (v5 >> 3 == 2)
  {
    v7 = 51;
LABEL_7:
    self->_samples.__start_ = v7;
  }
  *(_OWORD *)&self->_totalTranslation.var0.x = 0u;
  *(_OWORD *)&self->_totalTranslation.var0.z = 0u;
  self->_hasMemoizedVelocity = 0;
}

- (_UIVelocityIntegrator)init
{
  _UIVelocityIntegrator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIVelocityIntegrator;
  result = -[_UIVelocityIntegrator init](&v3, sel_init);
  if (result)
  {
    result->_minimumRequiredMovement = 5.0;
    result->_maxNumberOfSamples = 20;
  }
  return result;
}

- (float64_t)_offset3D
{
  float64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  float64x2_t *v6;
  float64x2_t *v7;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  if (a2)
  {
    v3 = a2[6];
    if (v3 >= 2)
    {
      v4 = a2[2];
      v5 = a2[5];
      v6 = (float64x2_t *)(*(_QWORD *)(v4 + 8 * (v5 / 0x33)) + 80 * (v5 % 0x33));
      v7 = (float64x2_t *)(*(_QWORD *)(v4 + 8 * ((v3 + v5 - 1) / 0x33)) + 80 * ((v3 + v5 - 1) % 0x33));
      result = v7[2].f64[0] - v6[2].f64[0];
      *(float64x2_t *)a1 = vsubq_f64(v7[1], v6[1]);
      a1[2] = result;
    }
  }
  return result;
}

- (CGVector)offset
{
  double v2;
  double v3;
  _OWORD v4[2];
  CGVector result;

  memset(v4, 0, sizeof(v4));
  -[_UIVelocityIntegrator _offset3D]((double *)v4, self);
  v3 = *((double *)v4 + 1);
  v2 = *(double *)v4;
  result.dy = v3;
  result.dx = v2;
  return result;
}

- ($1352053F64C5A5C6DA1735287371E169)velocity3D
{
  _OWORD *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  $1352053F64C5A5C6DA1735287371E169 result;

  -[_UIVelocityIntegrator _velocity3D](v2, (uint64_t)self);
  result.var0.var3 = v6;
  result.var0.var2 = v5;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- ($1352053F64C5A5C6DA1735287371E169)offset3D
{
  double *v2;
  float64_t v3;
  double v4;
  double v5;
  double v6;
  $1352053F64C5A5C6DA1735287371E169 result;

  v3 = -[_UIVelocityIntegrator _offset3D](v2, self);
  result.var0.var3 = v6;
  result.var0.var2 = v5;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (double)minimumRequiredMovement
{
  return self->_minimumRequiredMovement;
}

- (void)setMinimumRequiredMovement:(double)a3
{
  self->_minimumRequiredMovement = a3;
}

- (double)hysteresisTimeInterval
{
  return self->_hysteresisTimeInterval;
}

- (void).cxx_destruct
{
  _UIVelocityIntegratorDataSample **begin;
  _UIVelocityIntegratorDataSample **end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  _UIVelocityIntegratorDataSample **v9;
  _UIVelocityIntegratorDataSample **v10;
  _UIVelocityIntegratorDataSample **first;

  objc_storeStrong(&self->_didResetHysteresisOnThetaDiffHandler, 0);
  begin = self->_samples.__map_.__begin_;
  end = self->_samples.__map_.__end_;
  self->_samples.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_samples.__map_.__end_;
      begin = self->_samples.__map_.__begin_ + 1;
      self->_samples.__map_.__begin_ = begin;
      v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  v6 = v5 >> 3;
  if (v6 == 1)
  {
    v7 = 25;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    v7 = 51;
LABEL_7:
    self->_samples.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    v10 = self->_samples.__map_.__begin_;
    v9 = self->_samples.__map_.__end_;
    if (v9 != v10)
      self->_samples.__map_.__end_ = (_UIVelocityIntegratorDataSample **)((char *)v9
                                                                        + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_samples.__map_.__first_;
  if (first)
    operator delete(first);
}

@end
